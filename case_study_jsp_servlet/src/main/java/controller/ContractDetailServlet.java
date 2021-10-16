package controller;

import model.bean.AttachService;
import model.bean.Contract;
import model.bean.ContractDetail;
import model.service.IAttachService;
import model.service.IContractDetailService;
import model.service.IContractService;
import model.service.implement.AttachServiceImplement;
import model.service.implement.ContractDetailServiceImplement;
import model.service.implement.ContractServiceImplement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractDetailServlet", urlPatterns = {"/contract_detail"})
public class ContractDetailServlet extends HttpServlet {
    IContractDetailService iContractDetailService = new ContractDetailServiceImplement();
    IContractService iContractService = new ContractServiceImplement();
    IAttachService iAttachService = new AttachServiceImplement();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create_contract_detail":
                    createContractDetail(request, response);
                    break;

            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }


    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) {
        int contract_id = Integer.parseInt(request.getParameter("contract_id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int attach_service_id = Integer.parseInt(request.getParameter("attach_service_id"));
        ContractDetail contractDetail = new ContractDetail(contract_id,attach_service_id,quantity);
        iContractDetailService.save(contractDetail);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract_detail/create_contract_detail.jsp");
        request.setAttribute("message", "New contract detail was created !");
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
                case "contract":
                    showContractDetailList(request, response);
                    break;
                case "create_contract_detail":
                    addContractDetail(request, response);
                    break;

                default:
                    showContractDetailList(request, response);
                    break;
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void addContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("contractList",iContractService.findAll());
        request.setAttribute("attachServiceList",iAttachService.getAll());
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract_detail/create_contract_detail.jsp");
        dispatcher.forward(request, response);

    }

    private void showContractDetailList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Contract> contractList = iContractService.findAll();
        List<AttachService> attachServiceList = iAttachService.getAll();
        List<ContractDetail> contractDetailList = iContractDetailService.findAll();
        request.setAttribute("contractList", contractList);
        request.setAttribute("attachServiceList", attachServiceList);
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract_detail/list.jsp");
        dispatcher.forward(request, response);
    }
}
