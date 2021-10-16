package model.service;

import model.bean.Contract;
import model.bean.Customer;

import java.util.List;

public interface IContractService {
    List<Contract> findAll();
    void save(Contract contract);
    Contract findById(int id);
    void remove(int  id);
    Contract getContractById(int id);
    void updateContract(Contract contract);
    List<String> getPropertyList(Contract contract);
    List<Contract> findContract(int keySearch, String valueSearch);
}
