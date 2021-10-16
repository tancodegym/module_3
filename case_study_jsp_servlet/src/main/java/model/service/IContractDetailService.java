package model.service;


import model.bean.ContractDetail;

import java.util.List;

public interface IContractDetailService {
    List<ContractDetail> findAll();
    void save(ContractDetail contract);
}
