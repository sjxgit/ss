package cn.tms.dao;

import cn.tms.entity.Column;

import java.util.List;


/**
 * Created by
 */
public interface IColumnDAO {
    //加载所有栏目集合
    public List<Column> findAllColumns();


}
