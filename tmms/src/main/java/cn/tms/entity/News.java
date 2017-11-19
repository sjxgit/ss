package cn.tms.entity;

import java.util.Date;

/**
 * Created by Happy on 2017-11-09.
 * 新闻实体
 */
public class News {
    private String information_code;
    private String columntype;
    private String title;
    private String titlecolor;
    private String outerlink;
    private Integer weight;
    private Date weightdate;
    private String image_url;
    private String primaryword;
    private String summary;//摘要
    private String content;
    private Date publish_time;
    private Date go_time;
    private Integer create_by;
    private Date create_date;
    private int update_by;
    private Date update_date;
    private Integer state;
    private String remark;

    //新闻所属栏目
    private Column column;
    //新闻创建者
    private UserInfo user;

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public UserInfo getUser() {
        return user;
    }

    public void setUser(UserInfo user) {
        this.user = user;
    }

    public Column getColumn() {
        return column;
    }

    public void setColumn(Column column) {
        this.column = column;
    }

    public String getInformation_code() {
        return information_code;
    }

    public void setInformation_code(String information_code) {
        this.information_code = information_code;
    }

    public String getColumntype() {
        return columntype;
    }

    public void setColumntype(String columntype) {
        this.columntype = columntype;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitlecolor() {
        return titlecolor;
    }

    public void setTitlecolor(String titlecolor) {
        this.titlecolor = titlecolor;
    }

    public String getOuterlink() {
        return outerlink;
    }

    public void setOuterlink(String outerlink) {
        this.outerlink = outerlink;
    }

    public Integer getWeight() {
        return weight;
    }

    public void setWeight(Integer weight) {
        this.weight = weight;
    }

    public Date getWeightdate() {
        return weightdate;
    }

    public void setWeightdate(Date weightdate) {
        this.weightdate = weightdate;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getPrimaryword() {
        return primaryword;
    }

    public void setPrimaryword(String primaryword) {
        this.primaryword = primaryword;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getPublish_time() {
        return publish_time;
    }

    public void setPublish_time(Date publish_time) {
        this.publish_time = publish_time;
    }

    public Date getGo_time() {
        return go_time;
    }

    public void setGo_time(Date go_time) {
        this.go_time = go_time;
    }

    public Integer getCreate_by() {
        return create_by;
    }

    public void setCreate_by(Integer create_by) {
        this.create_by = create_by;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getUpdate_by() {
        return update_by;
    }

    public void setUpdate_by(int update_by) {
        this.update_by = update_by;
    }

    public Date getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(Date update_date) {
        this.update_date = update_date;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
