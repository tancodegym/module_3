package responsitory;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerResponsitoryImplement implements ICustomerResponsitory {

    static List<Customer> customerList = new ArrayList<>();
    static{
        Customer duaHau = new Customer("Dưa Hấu", "01-01-1930", "Ai Cập",
                "https://i.imgur.com/vaema5D.jpg");
        Customer thanhLong = new Customer("Thanh Long", "02-02-1950",
                "Mexico", "https://i.imgur.com/slbf5iR.jpg");
        Customer sauRieng = new Customer("Sầu Riêng", "30-12-2000",
                "South Earth Asia", "https://i.imgur.com/QxvQeoP.jpg");
        customerList.add(duaHau);
        customerList.add(thanhLong);
        customerList.add(sauRieng);
    }


    @Override
    public List<Customer> findall() {
        return customerList;
    }
}
