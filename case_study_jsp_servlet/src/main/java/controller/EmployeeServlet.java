package controller;

import model.service.IDivisionService;
import model.service.IEducationService;
import model.service.IEmployeeService;
import model.service.IPositionService;
import model.service.implement.DivisionServiceImplement;
import model.service.implement.EducationServiceImplement;
import model.service.implement.EmployeeServiceImplement;
import model.service.implement.PositionServiceImplement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EmployeeServlet", urlPatterns = {"/employee"})
public class EmployeeServlet extends HttpServlet {
    IEmployeeService iEmployeeService = new EmployeeServiceImplement();
    IDivisionService iDivisionService = new DivisionServiceImplement();
    IPositionService iPositionService  = new PositionServiceImplement();
    IEducationService iEducationService = new EducationServiceImplement();
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

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
