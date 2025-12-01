package com.example.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final Pattern EMAIL_PATTERN =
            Pattern.compile("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");

    @Override
    public void init() {
        // create and store UserStore in ServletContext if not present
        if (getServletContext().getAttribute("userStore") == null) {
            getServletContext().setAttribute("userStore", new UserStore());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signup.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email    = req.getParameter("email");
        String password = req.getParameter("password");
        String confirm  = req.getParameter("confirm");

        String error = null;

        if (username == null || username.trim().isEmpty())
            error = "Username is required.";
        else if (email == null || email.trim().isEmpty())
            error = "Email is required.";
        else if (!EMAIL_PATTERN.matcher(email).matches())
            error = "Enter a valid email address.";
        else if (password == null || password.length() < 6)
            error = "Password must be at least 6 characters.";
        else if (!password.equals(confirm))
            error = "Password and Confirm Password do not match.";

        if (error != null) {
            req.setAttribute("error", error);
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            return;
        }

        UserStore store = (UserStore) getServletContext().getAttribute("userStore");
        User user = new User(username.trim(), email.trim().toLowerCase(), password);

        boolean added = store.addUser(user);
        if (!added) {
            req.setAttribute("error", "Email already registered. Try signing in.");
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/signup.jsp").forward(req, resp);
            return;
        }

        // success: redirect to signin page (use redirect so form resubmission doesn't happen)
        resp.sendRedirect(req.getContextPath() + "/signin");
    }
}
