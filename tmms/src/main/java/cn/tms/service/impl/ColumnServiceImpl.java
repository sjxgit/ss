package cn.tms.service.impl;

import cn.tms.dao.IColumnDAO;
import cn.tms.entity.Column;
import cn.tms.service.IColumnService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Happy on 2017-11-06.
 */
@Service("columnService")
public class ColumnServiceImpl implements IColumnService{
    @Resource(name = "IColumnDAO")
    private IColumnDAO columnDAO;
    public List<Column> findAllColumns() {
        return columnDAO.findAllColumns();
    }

}
