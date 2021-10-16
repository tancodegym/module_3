package model.responsitory;


import model.bean.ContractDetail;

import java.util.List;

public interface IContractDetailResponsitory {
    List<ContractDetail> findAll();
    void save(ContractDetail contract);
}
