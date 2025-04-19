package servicesImpl;

import models.Department;
import repositoriesImpl.DepartmentRepositoryImpl;
import services.IDepartmentService;

import java.sql.SQLException;
import java.util.List;

public class DepartmentServiceImpl implements IDepartmentService {

    private final DepartmentRepositoryImpl departmentRepository;

    public DepartmentServiceImpl(DepartmentRepositoryImpl departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public void update(Department department) throws SQLException {
        this.departmentRepository.update(department);
    }

    public void delete(Department department) throws SQLException {
        this.departmentRepository.delete(department);
    }

    public void add(Department department) throws SQLException {
        this.departmentRepository.add(department);
    }

    public Department getDepartmentById(int id) throws SQLException {
        return this.departmentRepository.getById(id);
    }

    public List<Department> getAllDepartment() {
        return this.departmentRepository.getAll();
    }

    public List<Department> getDepartmentByUserId(int userId) {
        return this.departmentRepository.getDepartmentsByUserId(userId);
    }
}
