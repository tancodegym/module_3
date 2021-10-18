package model.responsitory;

import model.bean.CustomerUsing;

import java.util.List;

public interface ICustormerUsingResponsitory {
    List<CustomerUsing> findAll();

    void save(CustomerUsing customerUsing);
}
