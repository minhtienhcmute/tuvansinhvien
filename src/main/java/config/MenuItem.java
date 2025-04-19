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
    private String permission;

    public String getPermission() {
        return permission;
    }

    public MenuItem(String icon, String title, int order, String url, String permission) {
        this.icon = icon;
        this.title = title;
        this.groupTitle = null;
        this.order = order;
        this.url = url;
        this.permission = permission;
        this.children = new ArrayList<>();
    }

    public MenuItem(String icon, String title, int order, String url, String permission, List<MenuItem> children) {
        this.icon = icon;
        this.title = title;
        this.groupTitle = null;
        this.order = order;
        this.url = url;
        this.permission = permission;
        this.children = children;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public MenuItem(String groupTitle, String title, int order, String url, String icon, String permission, List<MenuItem> children) {
        this.groupTitle = groupTitle;
        this.title = title;
        this.order = order;
        this.url = url;
        this.icon = icon;
        this.permission = permission;
        this.children = children;
    }

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
        this.permission = null;
    }

    public MenuItem(String icon, String title, int order, String url) {
        this.icon = icon;
        this.title = title;
        this.groupTitle = null;
        this.order = order;
        this.children = new ArrayList<>();
        this.url = url;
        this.permission = null;
    }


    public MenuItem(String icon, String title, int order, String url, List<MenuItem> children) {
        this.icon = icon;
        this.title = title;
        this.groupTitle = null;
        this.order = order;
        this.url = url;
        this.children = children;
        this.permission = null;
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
