package model.service.implement;

import model.bean.Customer;
import model.responsitory.ICustomerResponsitory;
import model.responsitory.implement.CustomerResponsitoryImplement;
import model.service.ICustomerService;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImplement implements ICustomerService {
    private ICustomerResponsitory iCustomerResponsitory = new CustomerResponsitoryImplement();

    @Override
    public List<Customer> findAll() {
        return iCustomerResponsitory.findAll();
    }

    @Override
    public Map<String, String> save(Customer customer) {
        Map<String, String> mapMessage = new HashMap<>();
        if(Validate.validateDateOfBirth(customer.getBirthday())!=null||
                Validate.validateName(customer.getName())!=null||
        Validate.validateEmail(customer.getEmail())!=null||
        Validate.validateIdCard(customer.getIdCard())!=null||
        Validate.validateAddress(customer.getAddress())!=null||
        Validate.validateNumberPhone(customer.getPhone())!=null){
            mapMessage.put("birthday",Validate.validateDateOfBirth(customer.getBirthday()));
            mapMessage.put("name",Validate.validateName(customer.getName()));
            mapMessage.put("email",Validate.validateEmail(customer.getEmail()));
            mapMessage.put("idCard",Validate.validateIdCard(customer.getIdCard()));
            mapMessage.put("phone",Validate.validateNumberPhone(customer.getPhone()));
            mapMessage.put("address",Validate.validateAddress(customer.getAddress()));
        }else{
            iCustomerResponsitory.save(customer);
        }
        return  mapMessage;
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
    public Map<String, String> updateCustomer(Customer customer,String customer_id) {
        Map<String, String> mapMessage = new HashMap<>();
        if(Validate.validateDateOfBirth(customer.getBirthday())!=null||
                Validate.validateName(customer.getName())!=null||
                Validate.validateEmail(customer.getEmail())!=null||
                Validate.validateIdCard(customer.getIdCard())!=null||
                Validate.validateAddress(customer.getAddress())!=null||
                Validate.validateNumberPhone(customer.getPhone())!=null){
            mapMessage.put("birthday",Validate.validateDateOfBirth(customer.getBirthday()));
            mapMessage.put("name",Validate.validateName(customer.getName()));
            mapMessage.put("email",Validate.validateEmail(customer.getEmail()));
            mapMessage.put("idCard",Validate.validateIdCard(customer.getIdCard()));
            mapMessage.put("phone",Validate.validateNumberPhone(customer.getPhone()));
            mapMessage.put("address",Validate.validateAddress(customer.getAddress()));
        }else{
            iCustomerResponsitory.updateCustomer(customer,customer_id);
        }
        return  mapMessage;

    }

    @Override
    public List<String> getPropertyList(Customer customer) {
        return iCustomerResponsitory.getPropertyList(customer);
    }

    @Override
    public List<Customer> findCustomer(int keySearch, String valueSearch) {
        return iCustomerResponsitory.findCustomer(keySearch,valueSearch);
    }

    @Override
    public void removeAll(String allIdCustomer) {
        iCustomerResponsitory.removeAll(allIdCustomer);
    }
}
