package model.responsitory;

import model.bean.AttachService;

import java.util.List;

public interface IAttachServiceResponsitory {
    List<AttachService> getAll();

    String findById(int attach_service_id);
}
