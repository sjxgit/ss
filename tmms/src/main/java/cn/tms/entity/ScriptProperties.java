package cn.tms.entity;
/**
 * Created by 123 on 2017/09/06.
 */
public class ScriptProperties {
    private String url;
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "ScriptProperties{" +
                "url='" + url + '\'' +
                '}';
    }
}
