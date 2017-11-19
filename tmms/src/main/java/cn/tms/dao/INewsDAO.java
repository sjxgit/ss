package cn.tms.dao;

import cn.tms.entity.News;

import java.util.List;

/**
 * Created by Happy on 2017-11-09.
 */
public interface INewsDAO {
    //01.查询指定栏目下的所有新闻
    public List<News> findNewsByColumn(String cid);
    //02.添加新闻
    public int addNews(News news);
    //03.根据新闻编号查找信息
    public News findNewsById(String nid);




    //添加获取下拉框值
    public String  selectSyscodeByColumn(String columnname);
}
