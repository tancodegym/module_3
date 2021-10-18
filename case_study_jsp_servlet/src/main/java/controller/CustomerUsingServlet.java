package controller;

import model.bean.Customer;
import model.bean.CustomerUsing;
import model.bean.Employee;
import model.service.*;
import model.service.implement.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerUsingServlet" , urlPatterns = {"/customer_using"})
public class CustomerUsingServlet extends HttpServlet {
    ICustomerUsingService iCustomerUsingService = new CustomerUsingServiceImplement();
    ICustomerService iCustomerService = new CustomerServiceImplement();
    IContractDetailService iContractDetailService = new ContractDetailServiceImplement();
    IContractService iContractService = new ContractServiceImplement();
    IAttachService iAttachService  = new AttachServiceImplement();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    addToList(request, response);
                    break;
//                case "edit":
//                    updateEmployee(request, response);
//                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void addToList(HttpServletRequest request, HttpServletResponse response) {
        String customer_id = request.getParameter("customer_id");
        String customer_name = request.getParameter("customer_name");
        int contract_id = Integer.parseInt(request.getParameter("contract_id"));
       String start_date = request.getParameter("start_date");
        int contract_detail_id = Integer.parseInt(request.getParameter("contract_detail_id"));
        int attach_service_id = Integer.parseInt(request.getParameter("attach_service_id"));
        String attach_service_name = iAttachService.findById(attach_service_id);
        CustomerUsing customerUsing = new CustomerUsing(customer_id,customer_name,contract_id,start_date,contract_detail_id,attach_service_id,attach_service_name);
        iCustomerUsingService.save(customerUsing);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer_using/create.jsp");
        request.setAttribute("message", "Create Completed !");
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
                case "list":
                    showCustomerUsingList(request, response);
                    break;
                case "create":
                    showCreatePage(request, response);
                    break;
//                case "delete":
//                    deleteEmployee(request, response);
//                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
//                case "search":
//                    findEmployee(request,response);
//                    break;
                default:
                    showCustomerUsingList(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void showCreatePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",iCustomerService.findAll());
        request.setAttribute("contractList",iContractService.findAll());
        request.setAttribute("contractDetailLíst",iContractDetailService.findAll());
        request.setAttribute("attachServiceList",iAttachService.getAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer_using/create.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id_edit");
        Customer customer= iCustomerService.getCustomerById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer_using/edit.jsp");
        request.setAttribute("customer", customer);
        dispatcher.forward(request, response);
    }

    private void showCustomerUsingList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CustomerUsing> customerUsingList = iCustomerUsingService.findAll();
        request.setAttribute("listCustomerUsing", customerUsingList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer_using/list.jsp");
        dispatcher.forward(request, response);
    }
}
