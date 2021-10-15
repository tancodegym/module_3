package model.responsitory;

import model.bean.User;

import java.util.List;

public interface IUserRoleResponsitory {
    List<User> findAll();
}
