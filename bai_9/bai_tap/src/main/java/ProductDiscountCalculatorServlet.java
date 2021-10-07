import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscountCalculatorServlet",urlPatterns = "/discount")
public class ProductDiscountCalculatorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String desc=request.getParameter("description");
            String price=request.getParameter("price");
            String percent =request.getParameter("percent");
            float discount_amount;
            float discount_price;
            discount_amount= (float) (Integer.parseInt(price)*Integer.parseInt(percent)*0.01);
            discount_price=Float.parseFloat(price)-discount_amount;
            request.setAttribute("desc",desc);
            request.setAttribute("price",price);
            request.setAttribute("percent",percent);
            request.setAttribute("amount",discount_amount);
            request.setAttribute("discount_price",discount_price);
            request.getRequestDispatcher("result.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
