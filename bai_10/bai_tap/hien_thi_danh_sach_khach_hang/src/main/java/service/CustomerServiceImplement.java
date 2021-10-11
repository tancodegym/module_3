package service;

import model.Customer;
import responsitory.CustomerResponsitoryImplement;
import responsitory.ICustomerResponsitory;

import java.util.List;

public class CustomerServiceImplement implements ICustomerService{
    private static ICustomerResponsitory customerResponsitory= new CustomerResponsitoryImplement();
    @Override
    public List<Customer> findall() {
        List<Customer> customerList = customerResponsitory.findall();
        return customerList;
    }
}
