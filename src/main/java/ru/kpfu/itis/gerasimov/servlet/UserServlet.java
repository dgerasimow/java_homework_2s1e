package ru.kpfu.itis.gerasimov.servlet;

import ru.kpfu.itis.gerasimov.dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "usersServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    public static final List<UserDTO> USERS = Arrays.asList(
            new UserDTO("Ivan", "Ivanov"),
            new UserDTO("Nikita", "Nikitin"),
            new UserDTO("Boris", "Borisov"));


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("users", USERS);
        req.getRequestDispatcher("Users.ftl").forward(req,resp);
    }
}
