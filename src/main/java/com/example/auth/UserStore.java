package com.example.auth;

import java.util.concurrent.ConcurrentHashMap;
import java.util.Map;

public class UserStore {
    // email -> User
    private final Map<String, User> users = new ConcurrentHashMap<>();

    // singleton-ish; we'll store an instance in ServletContext
    public boolean addUser(User user) {
        // avoid duplicate email
        if (users.putIfAbsent(user.getEmail().toLowerCase(), user) == null) {
            return true;
        }
        return false;
    }

    public User getUserByEmail(String email) {
        if (email == null) return null;
        return users.get(email.toLowerCase());
    }

    public boolean validateCredentials(String email, String password) {
        User u = getUserByEmail(email);
        return u != null && u.getPassword().equals(password);
    }
}
