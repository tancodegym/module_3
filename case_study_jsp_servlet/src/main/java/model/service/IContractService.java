package model.service;

import model.bean.Contract;


import java.util.List;
import java.util.Map;

public interface IContractService {
    List<Contract> findAll();
    Map<String,String> save(Contract contract);
}
