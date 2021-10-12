package model.service.implement;

import model.bean.Customer;
import model.bean.Person;
import model.responsitory.ICustomerResponsitory;
import model.responsitory.implement.CustomerResponsitoryImplement;
import model.service.ICustomerService;

import java.util.List;

public class CustomerServiceImplement  implements ICustomerService {
    private ICustomerResponsitory  iCustomerResponsitory= new CustomerResponsitoryImplement();
    @Override
    public List<Customer> findAll() {
        return iCustomerResponsitory.findAll();
    }
    @Override
    public void save(Customer customer) {
        iCustomerResponsitory.save(customer);
    }
    @Override
    public Customer findById(int id) {
        return iCustomerResponsitory.findById(id);
    }
    @Override
    public void remove(int id) {
        iCustomerResponsitory.remove(id);
    }
}
