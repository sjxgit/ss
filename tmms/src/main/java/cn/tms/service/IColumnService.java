package cn.tms.service;

import cn.tms.entity.Column;

import java.util.List;

/**
 * Created by Happy on 2017-11-06.
 * 栏目服务层
 */
public interface IColumnService {
    //加载所有栏目集合
    public List<Column> findAllColumns();


}
