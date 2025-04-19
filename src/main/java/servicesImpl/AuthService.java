package servicesImpl;

import models.User;
import repositoriesImpl.UserRepositoryImpl;

public class AuthService {
    private final UserRepositoryImpl userRepo;

    public AuthService() {
        this.userRepo = new UserRepositoryImpl();
    }

    public User loginWithGoogle(String email, String googleId, String name, String avatar) throws Exception {
        User existingUser = userRepo.getUserByEmail(email);

        if (existingUser != null) {
            if (existingUser.getGoogle_id() == null || existingUser.getGoogle_id().isEmpty()) {
                throw new Exception("Email đã được sử dụng nhưng chưa liên kết với Google");
            }
            if (!existingUser.getGoogle_id().equals(googleId)) {
                throw new Exception("Google ID không khớp với tài khoản");
            }
            return existingUser; // Đăng nhập thành công
        } else {
            // Chưa có user → tạo mới
            userRepo.insertUserWithGoogle(name, email, googleId, avatar);
            return userRepo.getUserByEmailAndGoogleId(email, googleId);
        }
    }
}
