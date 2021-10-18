package model.responsitory;

import model.bean.Customer;
import model.bean.Person;

import java.util.List;

public interface ICustomerResponsitory {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void remove(String id);

    Customer getCustomerById(String id);

    void updateCustomer(Customer customer,String customer_id);

    List<String> getPropertyList(Customer customer);

    List<Customer> findCustomer(int keySearch, String valueSearch);

    void removeAll(String allIdCustomer);
}
