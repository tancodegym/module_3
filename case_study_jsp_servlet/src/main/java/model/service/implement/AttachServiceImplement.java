package model.service.implement;

import model.bean.AttachService;
import model.responsitory.IAttachServiceResponsitory;
import model.responsitory.implement.AttachServiceResponsitoryImplement;
import model.service.IAttachService;

import java.util.List;

public class AttachServiceImplement implements IAttachService {
    IAttachServiceResponsitory iAttachServiceResponsitory = new AttachServiceResponsitoryImplement();
    @Override
    public List<AttachService> getAll() {
        return iAttachServiceResponsitory.getAll();
    }

    @Override
    public String findById(int attach_service_id) {
        return iAttachServiceResponsitory.findById(attach_service_id);
    }
}
