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
}
