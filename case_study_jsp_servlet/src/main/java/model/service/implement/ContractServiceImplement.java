package model.service.implement;

import model.bean.Contract;
import model.responsitory.IContractResponsitory;
import model.responsitory.implement.ContractResponsitoryImplement;
import model.service.IContractService;
import model.service.common.Validate;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ContractServiceImplement implements IContractService {
    IContractResponsitory iContractResponsitory = new ContractResponsitoryImplement();
    @Override
    public List<Contract> findAll() {
        return iContractResponsitory.findAll();
    }

    @Override
    public Map<String,String> save(Contract contract) {
        Map<String, String> mapMessage = new HashMap<>();
        if(Validate.validateDate(contract.getStart_date())!=null||
                Validate.validateDate(contract.getEnd_date())!=null||
                Validate.validateDeposit(contract.getContract_deposit())!=null){
            mapMessage.put("startDate",Validate.validateDate(contract.getStart_date()));
            mapMessage.put("endDate",Validate.validateDate(contract.getEnd_date()));
            mapMessage.put("deposit",Validate.validateDeposit(contract.getContract_deposit()));

        }else{
            iContractResponsitory.save(contract);
        }
        return  mapMessage;


    }

}
