package model.responsitory;

import model.bean.Customer;
import model.bean.Person;

import java.util.List;

public interface ICustomerResponsitory {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void remove(int id);

    Customer getCustomerById(int id);

    void updateCustomer(Customer customer);
}
