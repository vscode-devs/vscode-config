#include "demo.hpp"
#include <iostream>
#include <memory>
using namespace DemoNamespace;

// 静态成员初始化
int SystemManager::s_instance_count = 0;

/* 构造函数实现 */
SystemManager::SystemManager(const std::string& name)
    : m_name(name), m_config() {
    ++s_instance_count;
    std::cout << "SystemManager created: " << m_name << std::endl;
}

// 析构函数实现
SystemManager::~SystemManager() {
    --s_instance_count;
    std::cout << "SystemManager destroyed: " << m_name << std::endl;
}

int SystemManager::get_instance_count() {
    return s_instance_count;
}

void SystemManager::initialize() {
    // 数组和范围for循环
    int matrix[3][3] = {
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
    };

    // 连续赋值
    int a, b, c;
    a = b = c = 0;

    // Lambda表达式
    auto printer = [this](int value) {
        std::cout << m_name << " processing: " << value << std::endl;
    };

    std::cout << "System initialized on " << PLATFORM << " platform\n";
}

void SystemManager::process_data(const std::vector<int>& data) {
    // 带范围的for循环
    for (const auto& value : data) {
        // if-else语句
        if (value > 100) {
            std::cerr << "Value exceeds limit: " << value << std::endl;
        } else if (value < 0) {
            std::cerr << "Negative value: " << value << std::endl;
        }
    }

    // while循环
    int counter = 5;
    while (counter-- > 0) {
        std::cout << "Processing countdown: " << counter << std::endl;
    }

    // switch语句
    switch (data.size()) {
        case 0:
            std::cout << "No data to process\n";
            break;
        case 1 ... 10:
            std::cout << "Small dataset\n";
            break;
        default:
            std::cout << "Large dataset\n";
    }
}

void SystemManager::log(const std::string& message) {
    std::cout << "[SYSTEM] " << message << std::endl;
}

// 友元函数实现
void DemoNamespace::print_system_info(const SystemManager& manager) {
    std::cout << "System Name: " << manager.m_name << "\n"
              << "Max Connections: " << manager.m_config.max_connections << "\n"
              << "Timeout: " << manager.m_config.timeout << "s\n";
}

/*
 * 主函数
 */
int main() {
    // 使用命名空间
    using namespace DemoNamespace;

    // 创建对象
    SystemManager manager("MainSystem");
    manager.initialize();

    // 使用vector容器
    std::vector<int> data = {150, -5, 80, 255, 30};
    manager.process_data(data);

    // 调用友元函数
    print_system_info(manager);

    // 使用智能指针
    auto logger = std::make_unique<SystemManager>("TempLogger");
    logger->log("Test message");

    // 使用范围for循环
    for (const auto& num : data) {
        std::cout << num << " ";
    }
    std::cout << "\n";

    return 0;
}