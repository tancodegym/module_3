package controller;

import model.bean.Contract;
import model.bean.Customer;
import model.service.IContractService;
import model.service.ICustomerService;
import model.service.IEmployeeService;
import model.service.IService;
import model.service.implement.ContractServiceImplement;
import model.service.implement.CustomerServiceImplement;
import model.service.implement.EmployeeServiceImplement;
import model.service.implement.ServiceImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ContractServlet" , urlPatterns = {"/contract"})
public class ContractServlet extends HttpServlet {
    IContractService iContractService = new ContractServiceImplement();
    IEmployeeService iEmployeeService = new EmployeeServiceImplement();
    ICustomerService iCustomerService = new CustomerServiceImplement();
    IService iService = new ServiceImplement();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create_contract":
                    createContract(request, response);
                    break;
                case "edit":
                    updateContract(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void updateContract(HttpServletRequest request, HttpServletResponse response) {

    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String start_date = request.getParameter("start_date");
        String end_date = request.getParameter("end_date");
        double deposit = Double.parseDouble(request.getParameter("deposit"));
        String employee_id = request.getParameter("employee_id");
        String customer_id = request.getParameter("customer_id");
        String service_id = request.getParameter("service_id");
        Contract contract = new Contract(start_date,end_date,deposit,employee_id,customer_id,service_id);
        Map<String,String> mapMessage = iContractService.save(contract);
        if (!mapMessage.isEmpty()) {
            request.setAttribute("mapMessage", mapMessage);
            request.setAttribute("start_date", start_date);
            request.setAttribute("end_date",end_date);
            request.setAttribute("deposit", deposit);
            request.setAttribute("employee_id", employee_id);
            request.setAttribute("customer_id", customer_id);
            request.setAttribute("service_id", service_id);
            addContract(request, response);
        }



        request.setAttribute("message", "New contract was created !");
        showContractList(request,response);
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
                case "contract":
                    showContractList(request, response);
                    break;
                case "create_contract":
                    addContract(request, response);
                    break;
                case "delete":
                    deleteContract(request, response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;

                default:
                    showContractList(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }



    private void deleteContract(HttpServletRequest request, HttpServletResponse response) {

    }

    private void addContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("employeeList",iEmployeeService.findAll());
        request.setAttribute("customerList",iCustomerService.findAll());
        request.setAttribute("serviceList",iService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/create_contract.jsp");
        dispatcher.forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showContractList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contract> contractList = iContractService.findAll();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }
}
