package model.responsitory;

import model.bean.CustomerType;
import model.bean.ServiceType;

import java.util.List;

public interface IServiceTypeResponsitory {
    List<ServiceType> getAll();
}
