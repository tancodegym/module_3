package model.service;

import model.bean.AttachService;

import java.util.List;

public interface IAttachService {
    List<AttachService> getAll();

    String findById(int attach_service_id);
}
