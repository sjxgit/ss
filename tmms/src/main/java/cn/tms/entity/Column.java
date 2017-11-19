package cn.tms.entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 王 on 2017/11/6.
 */
public class Column {
    private String syscode;
    private int columncode;
    private String columnname;
    private int sort;
    private  String parentcode;
    private int status;
    private String remark;
    private String url;
    private ScriptProperties attributes=new ScriptProperties();
    @Override
    public String toString() {
        return "content{" +
                "syscode='" + syscode + '\'' +
                ", columncode=" + columncode +
                ", columnname='" + columnname + '\'' +
                ", sort=" + sort +
                ", parentcode='" + parentcode + '\'' +
                ", status=" + status +
                ", url='" + url + '\'' +
                ", attributes=" + attributes +
                ", remark='" + remark + '\'' +
                ", children=" + children +
                '}';
    }
    public ScriptProperties getAttributes() {
        return attributes;
    }

    public void setAttributes(ScriptProperties attributes) {
        this.attributes = attributes;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    private List<Column> children=new ArrayList<Column>();

    public String getSyscode() {
        return syscode;
    }

    public void setSyscode(String syscode) {
        this.syscode = syscode;
    }

    public int getColumncode() {
        return columncode;
    }

    public void setColumncode(int columncode) {
        this.columncode = columncode;
    }

    public String getColumnname() {
        return columnname;
    }

    public void setColumnname(String columnname) {
        this.columnname = columnname;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public String getParentcode() {
        return parentcode;
    }

    public void setParentcode(String parentcode) {
        this.parentcode = parentcode;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public List<Column> getChildren() {
        return children;
    }

    public void setChildren(List<Column> children) {
        this.children = children;
    }
}
