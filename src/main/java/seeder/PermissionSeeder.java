package seeder;


public class PermissionSeeder {

    // URL kết nối với cơ sở dữ liệu
    private static final String DB_URL = "jdbc:mysql://localhost:3306/your_database";
    private static final String DB_USER = "your_username";
    private static final String DB_PASSWORD = "your_password";

    public static void seedPermissions() {
        String sql = "INSERT INTO permissions (code, module, action) VALUES (?, ?, ?)";

//        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
//             PreparedStatement pstmt = conn.prepareStatement(sql)) {
//
//            // Dữ liệu seeder với format module.action
//            String[][] permissions = {
//                    {"category.view", "category", "view"},
//                    {"category.add", "category", "add"},
//                    {"category.edit", "category", "edit"},
//                    {"category.delete", "category", "delete"},
//                    {"user.view", "user", "view"},
//                    {"user.add", "user", "add"},
//                    {"user.edit", "user", "edit"},
//                    {"user.delete", "user", "delete"},
//                    {"role.view", "role", "view"},
//                    {"role.add", "role", "add"},
//                    {"role.edit", "role", "edit"},
//                    {"role.delete", "role", "delete"},
//                    {"department.view", "department", "view"},
//                    {"department.add", "department", "add"},
//                    {"department.edit", "department", "edit"},
//                    {"department.delete", "department", "delete"}
//            };
//
//            // Lặp qua dữ liệu và chèn vào bảng permissions
//            for (String[] permission : permissions) {
//                pstmt.setString(1, permission[0]);  // code (module.action)
//                pstmt.setString(2, permission[1]);  // module
//                pstmt.setString(3, permission[2]);  // action
//                pstmt.executeUpdate();
//            }
//
//            System.out.println("Permissions seeded successfully.");
//        } catch (SQLException e) {
//            e.printStackTrace();
//            System.out.println("Error seeding permissions.");
//        }
    }

    public static void main(String[] args) {
        seedPermissions();
    }
}
