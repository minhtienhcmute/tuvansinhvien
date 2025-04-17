package servicesImpl;

import models.Department;
import repositoriesImpl.DepartmentRepositoryImpl;
import services.IDepartmentService;

import java.util.List;

public class DepartmentServiceImpl implements IDepartmentService {

    private final DepartmentRepositoryImpl departmentRepository;

    public DepartmentServiceImpl(DepartmentRepositoryImpl departmentRepository) {
        this.departmentRepository = departmentRepository;
    }

    public List<Department> getAllDepartment() {
        return this.departmentRepository.getAll();
    }
}
