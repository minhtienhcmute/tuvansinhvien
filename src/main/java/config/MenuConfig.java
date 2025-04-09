package config;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class MenuConfig {
    public static List<MenuItem> getMenus() {
        List<MenuItem> menus = new ArrayList<>();

        menus.add(new MenuItem("iconoir-dashboard", "Dashboards", 1, "#"));

        menus.add(new MenuItem("Hệ thống & Tổ chức", Arrays.asList(
                new MenuItem("iconoir-report-columns", "Quản lý danh mục câu hỏi", 1, "/category"),
                new MenuItem("iconoir-building", "Quản lý phòng ban", 2, "/department")
        )));
        menus.add(new MenuItem("Tư vấn",
                Arrays.asList(
                        new MenuItem("iconoir-report-columns", "Quản lý danh mục câu hỏi", 1, "/question"),
                        new MenuItem("iconoir-building", "Quản lý phòng ban", 2, "/department")
                ))
        );

        menus.add(new MenuItem("Người dùng & Phân quyền", Arrays.asList(
                new MenuItem("iconoir-user", "Quản lý người dùng", 1, "/user"),
                new MenuItem("iconoir-lock", "Quản lý phân quyền", 2, "/role")
        )));

        menus.add(new MenuItem("iconoir-stats-report", "Thống kê & Báo cáo", 5, "#", List.of(
                new MenuItem(null, "Thống kê", 1, "/statics")
        )));

        menus.add(new MenuItem("iconoir-chat-lines", "Chat", 6, "/chat"));

        return menus;

    }
}
