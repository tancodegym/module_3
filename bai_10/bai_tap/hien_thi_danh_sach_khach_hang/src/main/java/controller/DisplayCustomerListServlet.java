package controller;

import model.Customer;
import service.CustomerServiceImplement;
import service.ICustomerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller.DisplayCustomerListServlet", urlPatterns = {""})
public class DisplayCustomerListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ICustomerService iCustomerService= new CustomerServiceImplement();
        List<Customer> customerList = iCustomerService.findall();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/customer_list.jsp").forward(request, response);
    }
}
