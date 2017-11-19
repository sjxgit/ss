package cn.tms.controller;

import cn.tms.entity.Column;
import cn.tms.entity.News;
import cn.tms.entity.Privilege;
import cn.tms.entity.UserInfo;
import cn.tms.service.IColumnService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Happy on 2017-11-06.
 */
@Controller
@RequestMapping("/col")
public class ColumnController {
    //植入Service对象
    @Resource(name = "columnService")
    private IColumnService columnService;

    //跳转到栏目页面
    @RequestMapping("/showColumnPage")
    public String showColumnPage(){
        return "/page/column/columnList";
    }
    //查找所有的栏目集合
    @RequestMapping("/getAllColumns")
    @ResponseBody
    public Object getAllColumns(){
        List<Column> list = columnService.findAllColumns();
        //新的容器 保存有父子关系的栏目
        List<Column> allColumns=new ArrayList<Column>();
        //保存的是平级的栏目集合  使用内存级别的手段，构造成有关系的栏目集合

        for (Column item:list){
            Column column=item;
            String pid = column.getParentcode();
            if (pid.equals("0")){
                allColumns.add(item);
            }else{
                for (Column innerColumn:list){
                    String id = innerColumn.getSyscode();
                    if (id.equals(pid)){
                        Column parentMenu=innerColumn;
                        parentMenu.getChildren().add(column);
                        break;
                    }
                 }
            }
        }
        return allColumns;
    }

    public IColumnService getColumnService() {
        return columnService;
    }




    public void setColumnService(IColumnService columnService) {
        this.columnService = columnService;
    }
}
