package controller;

import model.bean.Customer;
import model.service.ICustomerService;
import model.service.implement.CustomerServiceImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FuramaManageServlet", urlPatterns = {"/customers"})
public class FuramaManageServlet extends HttpServlet {
    ICustomerService iCustomerService = new CustomerServiceImplement();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create_customer":
                    createCustomer(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
//                case "search":
////                    searchUser(request,response);
//                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int type = Integer.parseInt(request.getParameter("customer_type_id"));
        Customer customer = new Customer(id,name, birthday, gender, idCard, phone, email, address, type);
        iCustomerService.updateCustomer(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        request.setAttribute("message", "Customer was edited !");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "customer":
                    showCustomerList(request, response);
                    break;
                case "create_customer":
                    addCustomer(request, response);
                    break;
                case "delete":
                    deleteCustomer(request, response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
                case "search":
                    String a = request.getParameter("idSearch");
                    String b = request.getParameter("content_search");

                    break;
                case "show_menu_search":
                    showMenuSearch(request,response);
                    break;
                default:
                    showCustomerList(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void showMenuSearch(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        request.setAttribute("search", "show_menu");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id_edit"));
        Customer customer= iCustomerService.getCustomerById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        request.setAttribute("customer", customer);
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("idCustomer"));
        iCustomerService.remove(id);
       showCustomerList(request,response);
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create_customer.jsp");
        dispatcher.forward(request, response);

    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int type = Integer.parseInt(request.getParameter("customer_type_id"));
        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, address, type);
        iCustomerService.save(customer);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create_customer.jsp");
        request.setAttribute("message", "New customer was created !");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private void showCustomerList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = iCustomerService.findAll();
        request.setAttribute("listCustomer", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }
}

