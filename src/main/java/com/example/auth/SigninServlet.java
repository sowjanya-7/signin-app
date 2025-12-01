package com.example.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.regex.Pattern;


@WebServlet("/signin")
public class SigninServlet extends HttpServlet {
    @Override
    public void init() {
        if (getServletContext().getAttribute("userStore") == null) {
            getServletContext().setAttribute("userStore", new UserStore());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/signin.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        String error = null;
        if (email == null || email.trim().isEmpty())
            error = "Email is required.";
        else if (password == null || password.trim().isEmpty())
            error = "Password is required.";

        if (error != null) {
            req.setAttribute("error", error);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/signin.jsp").forward(req, resp);
            return;
        }

        UserStore store = (UserStore) getServletContext().getAttribute("userStore");
        if (store.validateCredentials(email, password)) {
            User u = store.getUserByEmail(email);
            HttpSession session = req.getSession(true);
            session.setAttribute("user", u);
            // redirect to welcome
            resp.sendRedirect(req.getContextPath() + "/welcome.jsp");
        } else {
            req.setAttribute("error", "Invalid email or password.");
            req.setAttribute("email", email);
            req.getRequestDispatcher("/signin.jsp").forward(req, resp);
        }
    }
}
