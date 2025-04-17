package utils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BreadcrumbUtils {
    public static List<Map<String, String>> createBreadcrumb(String[][] items) {
        List<Map<String, String>> breadcrumbs = new ArrayList<>();

        for (int i = 0; i < items.length; i++) {
            Map<String, String> item = new HashMap<>();
            item.put("label", items[i][0]);
            if (i != items.length - 1 && items[i][1] != null) {
                item.put("url", items[i][1]);
            }
            breadcrumbs.add(item);
        }

        return breadcrumbs;
    }
}
