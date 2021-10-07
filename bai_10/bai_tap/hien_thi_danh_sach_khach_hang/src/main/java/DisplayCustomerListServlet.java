import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DisplayCustomerListServlet", urlPatterns = {""})
public class DisplayCustomerListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();

        Customer duaHau = new Customer("Dưa Hấu", "01-01-1930", "Ai Cập",
                "https://i.imgur.com/vaema5D.jpg");
        Customer thanhLong = new Customer("Thanh Long", "02-02-1950",
                "Mexico", "https://i.imgur.com/slbf5iR.jpg");
        Customer sauRieng = new Customer("Sầu Riêng", "30-12-2000",
                "South Earth Asia", "https://i.imgur.com/QxvQeoP.jpg");
        customerList.add(duaHau);
        customerList.add(thanhLong);
        customerList.add(sauRieng);
        request.setAttribute("customerList", customerList);

        request.getRequestDispatcher("customer_list.jsp").forward(request, response);
    }
}
