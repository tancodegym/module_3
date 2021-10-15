package model.service.implement;

import model.bean.Customer;
import model.bean.Person;
import model.responsitory.ICustomerResponsitory;
import model.responsitory.implement.CustomerResponsitoryImplement;
import model.service.ICustomerService;

import java.util.List;

public class CustomerServiceImplement implements ICustomerService {
    private ICustomerResponsitory iCustomerResponsitory = new CustomerResponsitoryImplement();

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
    public void remove(String id) {
        iCustomerResponsitory.remove(id);
    }

    @Override
    public Customer getCustomerById(String id) {
        return iCustomerResponsitory.getCustomerById(id);
    }

    @Override
    public void updateCustomer(Customer customer) {
        iCustomerResponsitory.updateCustomer(customer);
    }

    @Override
    public List<String> getPropertyList(Customer customer) {
        return iCustomerResponsitory.getPropertyList(customer);
    }

    @Override
    public List<Customer> findCustomer(int keySearch, String valueSearch) {
        return iCustomerResponsitory.findCustomer(keySearch,valueSearch);
    }
}
