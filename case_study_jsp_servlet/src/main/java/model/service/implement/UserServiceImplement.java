package model.service.implement;

import model.bean.User;
import model.responsitory.IUserResponsitory;
import model.responsitory.implement.UserResponsitoryImplement;
import model.service.IUserService;

import java.util.List;

public class UserServiceImplement  implements IUserService {
    IUserResponsitory iUserResponsitory = new UserResponsitoryImplement();
    @Override
    public List<User> findAll() {
        return iUserResponsitory.getAll();
    }
}
