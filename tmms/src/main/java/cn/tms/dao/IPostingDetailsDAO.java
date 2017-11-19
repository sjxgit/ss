package cn.tms.dao;

import cn.tms.entity.PostingDetails;

import java.util.List;
import java.util.Map;

/**
 * Created by 123 on 2017/11/07.
 */
public interface IPostingDetailsDAO {
    /**
     *根据栏目id拿到所有的发布列表
     * @param map   id     row  page
     * @return
     */
    public List<PostingDetails> getDetailsListById(Map<String, Object> map);

    /**
     * 用来获取当前栏目下的总条数和条件下
     * @param map
     * @return
     */
    public int getCountByCondition(Map<String, Object> map);
    //添加
    public int addnei(Map<String, Object> map);

}
