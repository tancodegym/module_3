package model.service.implement;

import model.bean.CustomerUsing;
import model.responsitory.ICustormerUsingResponsitory;
import model.responsitory.implement.CustomerUsingResponsitoryImplement;
import model.service.ICustomerUsingService;

import java.util.List;

public class CustomerUsingServiceImplement implements ICustomerUsingService {
    ICustormerUsingResponsitory iCustormerUsingResponsitory = new CustomerUsingResponsitoryImplement();
    @Override
    public List<CustomerUsing> findAll() {
        return iCustormerUsingResponsitory.findAll();
    }

    @Override
    public void save(CustomerUsing customerUsing) {
        iCustormerUsingResponsitory.save(customerUsing);
    }
}
