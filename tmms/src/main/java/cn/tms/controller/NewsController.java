package cn.tms.controller;

import cn.tms.entity.News;
import cn.tms.service.INewsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;

import java.util.List;

/**
 * Created by Happy on 2017-11-09.
 */
@Controller
@RequestMapping("/news")
public class NewsController {
    @Resource(name = "newsService")
    private INewsService newsService;
    @RequestMapping("/findNewsByColumn")
    @ResponseBody
    /**
     * 提供一个栏目编号，获取到栏目下所有的新闻集合
     */
    public Object find(String cid){
        List<News> list = newsService.findNewsByColumn(cid);
        return list;
    }

    //2.   添加新闻
    @RequestMapping("/addNews")
    public String addNews(News news){
        int count = newsService.addNews(news);
        if (count>0){
            return "/page/column/columnList";
        }
        return "/page/column/articleForm";
    }
   /* //添加获取id
    @RequestMapping(value = "/findAddNews")
    public String addNews(News news, String columnname){
        String columtype=newsService.selectSyscodeByColumn(columnname);
        news.setColumntype(columtype);
        int count = newsService.addNews(news);

        if(count>0){
            return "/page/column/columnList";
        }
        return "/page/column/articleForm";
    }*/
    //返回修改新闻页面
    @RequestMapping("/goNewsPage")
    public String goNewsPage(String nid, Model model){
        System.out.println("AAAAAAAA"+nid);
        model.addAttribute("nid",nid);
        return "/page/column/UpdateForm";
    }

    //2.根据编号查询新闻
    @RequestMapping("/findNewsById")
    @ResponseBody
    public Object findNewsById(String nid){
        System.out.println("BBBBBBBBBBBB"+nid);
        News info = newsService.findNewsById(nid);
        return info;
    }

    //3.修改新闻
    @RequestMapping("/editNews")
    public String editNews(News news){
        int count = newsService.addNews(news);
        if (count>0){
            return "/page/column/columnList";
        }
        return "/page/column/UpadateForm";
    }















}
