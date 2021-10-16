package model.service.implement;

import model.bean.Contract;
import model.responsitory.IContractResponsitory;
import model.responsitory.implement.ContractResponsitoryImplement;
import model.service.IContractService;

import java.util.List;

public class ContractServiceImplement implements IContractService {
    IContractResponsitory iContractResponsitory = new ContractResponsitoryImplement();
    @Override
    public List<Contract> findAll() {
        return iContractResponsitory.findAll();
    }

    @Override
    public void save(Contract contract) {
        iContractResponsitory.save(contract);

    }

    @Override
    public Contract findById(int id) {
        return iContractResponsitory.findById(id);
    }

    @Override
    public void remove(int id) {
        iContractResponsitory.remove(id);
    }

    @Override
    public Contract getContractById(int id) {
        return iContractResponsitory.getContractById(id);
    }

    @Override
    public void updateContract(Contract contract) {
        iContractResponsitory.updateContract(contract);
    }

    @Override
    public List<String> getPropertyList(Contract contract) {
        return null;
    }

    @Override
    public List<Contract> findContract(int keySearch, String valueSearch) {
        return iContractResponsitory.findContract(keySearch,valueSearch);
    }
}
