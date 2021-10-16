package model.responsitory.implement;

import model.bean.Contract;
import model.bean.ContractDetail;
import model.responsitory.DBConnection;
import model.responsitory.IContractDetailResponsitory;
import model.responsitory.IContractResponsitory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailResponsitoryImplement implements IContractDetailResponsitory {
    private static final String SELECT_ALL_CONTRACT_DETAIL = "select * from contract_detail ";
    private static final String INSERT_NEW_CONTRACT_DETAIL = "INSERT INTO contract_detail" +
            " (contract_id, attach_service_id, quantity) VALUE (?, ?, ?) ;";

    @Override
    public List<ContractDetail> findAll() {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        List<ContractDetail> contractDetailList = new ArrayList<>();
        if (connection != null) {
            try {
                statement = connection.prepareStatement(SELECT_ALL_CONTRACT_DETAIL);
                resultSet = statement.executeQuery();
                ContractDetail contractDetail = null;
                while (resultSet.next()) {
                    int contract_detail_id = resultSet.getInt("contract_detail_id");
                    int contract_id = resultSet.getInt("contract_id");
                    int attach_service_id = resultSet.getInt("attach_service_id");
                    int quantity = resultSet.getInt("quantity");
                    ContractDetail contract1= new ContractDetail(contract_detail_id,contract_id,attach_service_id,quantity);
                    contractDetailList.add(contract1);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return contractDetailList;

    }

    @Override
    public void save(ContractDetail contract) {
        Connection connection = DBConnection.getConnection();
        PreparedStatement statement = null;

        if (connection != null) {
            try {
                statement = connection.prepareStatement(INSERT_NEW_CONTRACT_DETAIL);
              statement.setInt(1,contract.getContract_id());
              statement.setInt(2,contract.getAttach_service_id());
              statement.setInt(3,contract.getQuantity());
                statement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    statement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
    }
}
