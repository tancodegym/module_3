package model.service;

import model.bean.User;
import model.responsitory.IUserResponsitory;
import model.responsitory.UserResponsitoryImplement;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImplement implements IUserService {
    private static IUserResponsitory  iUserResponsitory = new UserResponsitoryImplement();
    @Override
    public void insertUser(User user) throws SQLException {
        iUserResponsitory.insertUser(user);

    }

    @Override
    public User selectUser(int id) {
        return iUserResponsitory.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return iUserResponsitory.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        return iUserResponsitory.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        return iUserResponsitory.updateUser(user);
    }

    @Override
    public User getUserById(int id) {
        return  iUserResponsitory.getUserById(id);

    }

    @Override
    public void insertUserStore(User user) throws SQLException {
        iUserResponsitory.insertUserStore(user);
    }


}
