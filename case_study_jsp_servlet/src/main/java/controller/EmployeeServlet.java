package controller;

import model.bean.Customer;
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
import java.util.Map;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {
    IEmployeeService iEmployeeService = new EmployeeServiceImplement();
    IDivisionService iDivisionService = new DivisionServiceImplement();
    IPositionService iPositionService  = new PositionServiceImplement();
    IEducationService iEducationService = new EducationServiceImplement();
    IUserService iUserService = new UserServiceImplement();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create_employee":
                    createEmployee(request, response);
                    break;
                case "edit":
                    updateEmployee(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String username= request.getParameter("username");
        double salary = Double.parseDouble(request.getParameter("salary"));
        int education = Integer.parseInt(request.getParameter("education"));
        int division = Integer.parseInt(request.getParameter("division"));
        int position = Integer.parseInt(request.getParameter("position"));

        Employee employee = new Employee(id,name,birthday,idCard,phone,email,address,salary,position,education,division,username);
        iEmployeeService.updateEmployee(employee);
        request.setAttribute("message", "Employee was edited !");
        showEmployeeList(request,response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String username= request.getParameter("username");
        double salary = Double.parseDouble(request.getParameter("salary"));
        int education_id = Integer.parseInt(request.getParameter("education"));
        int division_id = Integer.parseInt(request.getParameter("division"));
        int position_id = Integer.parseInt(request.getParameter("position"));
        Employee employee = new Employee(name,birthday,idCard,phone,email,address,salary,position_id,education_id,division_id,username);
        Map<String,String> mapMessage = iEmployeeService.save(employee);
        if (!mapMessage.isEmpty()) {
            request.setAttribute("division",iDivisionService.findAll());
            request.setAttribute("position",iPositionService.findAll());
            request.setAttribute("education",iEducationService.findAll());
            request.setAttribute("user",iUserService.findAll());
            request.setAttribute("mapMessage", mapMessage);
            request.setAttribute("name", name);
            request.setAttribute("username", username);
            request.setAttribute("birthday", birthday);
            request.setAttribute("idCard", idCard);
            request.setAttribute("phone", phone);
            request.setAttribute("email", email);
            request.setAttribute("address",address);
            request.setAttribute("salary",salary);
            request.setAttribute("education_id",education_id);
            request.setAttribute("division_id",division_id);
            request.setAttribute("position_id",position_id);
            addEmployee(request, response);
        }
        request.setAttribute("message", "New Employee was created !");
        showEmployeeList(request,response);

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
                case "deleteAll":
                    deleteAllCustomer(request,response);
                    break;
                case "employee":
                    showEmployeeList(request, response);
                    break;
                case "create_employee":
                    addEmployee(request, response);
                    break;
                case "delete":
                    deleteEmployee(request, response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
                case "search":
                    findEmployee(request,response);
                    break;
                default:
                    showEmployeeList(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void deleteAllCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String allIdCustomer=request.getParameter("allIdCustomer");
        iEmployeeService.removeAll(allIdCustomer);
        request.setAttribute("message","Delete Completed!");
        showEmployeeList(request,response);
    }

    private void findEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int keySearch = Integer.parseInt(request.getParameter("idSearch"));
        String valueSearch = request.getParameter("search");
        System.out.println(valueSearch);
        System.out.println(keySearch);
        List<Employee> employeeList = iEmployeeService.findEmployee(keySearch,valueSearch);
        request.setAttribute("listEmployee", employeeList);
        request.setAttribute("messageFind","Found "+employeeList.size()+" customer !");
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id_edit");
        Employee employee = iEmployeeService.getEmployeeById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        request.setAttribute("employee", employee);
        request.setAttribute("division",iDivisionService.findAll());
        request.setAttribute("position",iPositionService.findAll());
        request.setAttribute("education",iEducationService.findAll());
        request.setAttribute("user",iUserService.findAll());
        dispatcher.forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id =request.getParameter("idEmployee");
        iEmployeeService.remove(id);
        request.setAttribute("message","Delete Completed!");
        showEmployeeList(request,response);
    }

    private void addEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("division",iDivisionService.findAll());
        request.setAttribute("position",iPositionService.findAll());
        request.setAttribute("education",iEducationService.findAll());
        request.setAttribute("user",iUserService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create_employee.jsp");
        dispatcher.forward(request, response);
    }

    private void showEmployeeList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = iEmployeeService.findAll();
        request.setAttribute("listEmployee", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }
}
