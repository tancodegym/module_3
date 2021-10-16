package model.service.implement;

import model.bean.ContractDetail;
import model.responsitory.IContractDetailResponsitory;
import model.responsitory.implement.ContractDetailResponsitoryImplement;
import model.service.IContractDetailService;

import java.util.List;

public class ContractDetailServiceImplement  implements IContractDetailService {
    IContractDetailResponsitory iContractDetailResponsitory = new ContractDetailResponsitoryImplement();
    @Override
    public List<ContractDetail> findAll() {
        return iContractDetailResponsitory.findAll();
    }

    @Override
    public void save(ContractDetail contract) {
        iContractDetailResponsitory.save(contract);
    }
}
