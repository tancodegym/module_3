package model.service;

import model.bean.Customer;
import model.bean.CustomerType;

import java.util.List;

public interface ICustomerTypeService {
    List<CustomerType> findAll();
}
