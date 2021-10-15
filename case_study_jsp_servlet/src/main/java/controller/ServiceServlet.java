package controller;

import model.bean.Customer;
import model.bean.Service;
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

@WebServlet(name = "ServiceServlet", urlPatterns = {"/service"})
public class ServiceServlet extends HttpServlet {
    IService iService = new ServiceImplement();
    IServiceType serviceType = new ServiceTypeImplement();
    IRentTypeService rentTypeService = new RentTypeServiceImplement();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create_service":
                    createService(request, response);
                    break;
                case "edit":
                    updateService(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) {
        String service_name = request.getParameter("name");
        int service_area= Integer.parseInt(request.getParameter("area"));
        double service_cost = Double.parseDouble(request.getParameter("cost"));
        int service_people = Integer.parseInt(request.getParameter("max_people"));
        int rent_type_id  =  Integer.parseInt(request.getParameter("rent_type_id"));
        int service_type_id  =  Integer.parseInt(request.getParameter("service_type_id"));
        String standard_room = request.getParameter("standard_room");
        String description = request.getParameter("description");
        double pool_area = Double.parseDouble(request.getParameter("pool_area"));
        int number_floor = Integer.parseInt(request.getParameter("number_floor"));
        Service service = new Service(service_name,service_area,service_cost,
                service_people,rent_type_id,service_type_id,standard_room,description,pool_area,number_floor);
        iService.save(service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create_service.jsp");
        request.setAttribute("message", "New service was created !");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void updateService(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int type = Integer.parseInt(request.getParameter("customer_type_id"));
        Service service = new Service();
        iService.updateService(service);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/edit.jsp");
        request.setAttribute("message", "Service was edited !");
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
                case "service":
                    showServiceList(request, response);
                    break;
                case "create_service":
                    addService(request, response);
                    break;
                case "delete":
                    deleteService(request, response);
                    break;
                case "edit":
                    showEditForm(request,response);
                    break;
                case "search":
                    findService(request,response);
                    break;
                default:
                    showServiceList(request,response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

    }

    private void findService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int keySearch = Integer.parseInt(request.getParameter("idSearch"));
        String valueSearch = request.getParameter("search");
        System.out.println(valueSearch);
        System.out.println(keySearch);
        List<Service> services = iService.findService(keySearch,valueSearch);
        request.setAttribute("listService", services);
        request.setAttribute("messageFind","Found "+services.size()+" service !");
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id_edit");
        Service service = iService.getServiceById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/edit.jsp");
        request.setAttribute("service", service);
        dispatcher.forward(request, response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id =request.getParameter("idService");
        iService.remove(id);
        showServiceList(request,response);
    }

    private void addService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("typeService",serviceType.findAll());
        request.setAttribute("typeRent",rentTypeService.findAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create_service.jsp");
        dispatcher.forward(request, response);
    }

    private void showServiceList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Service> services = iService.findAll();
        request.setAttribute("listService", services);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }
}
