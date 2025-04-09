package config;

import java.util.ArrayList;
import java.util.List;

public class MenuItem {
    private final String icon;
    private final String groupTitle;
    private final String title;
    private final int order;
    private final String url;
    private final List<MenuItem> children;

    public MenuItem(String icon, String groupTitle, String title, int order, String url, List<MenuItem> children) {
        this.icon = icon;
        this.groupTitle = groupTitle;
        this.title = title;
        this.order = order;
        this.url = url;
        this.children = children;
    }

    public MenuItem(String groupTitle, List<MenuItem> children) {
        this.icon = null;
        this.title = null;
        this.url = null;
        this.order = 0;
        this.groupTitle = groupTitle;
        this.children = children;
    }

    public MenuItem(String icon, String title, int order, String url) {
        this.icon = icon;
        this.title = title;
        this.groupTitle = null;
        this.order = order;
        this.children = new ArrayList<>();
        this.url = url;
    }

    public MenuItem(String icon, String title, int order, String url, List<MenuItem> children) {
        this.icon = icon;
        this.title = title;
        this.groupTitle = null;
        this.order = order;
        this.url = url;
        this.children = children;
    }

    public MenuItem(String icon, String groupTitle, String title, int order, String url) {
        this.icon = icon;
        this.groupTitle = groupTitle;
        this.title = title;
        this.order = order;
        this.url = url;
        this.children = new ArrayList<>();

    }

    public List<MenuItem> getChildren() {
        return children;
    }

    public String getGroupTitle() {
        return groupTitle;
    }

    // Getters
    public String getIcon() {
        return icon;
    }

    public String getTitle() {
        return title;
    }

    public int getOrder() {
        return order;
    }

    public String getUrl() {
        return url;
    }
}
