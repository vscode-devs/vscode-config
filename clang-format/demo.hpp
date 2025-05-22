#ifndef DEMO_CPP_H
#define DEMO_CPP_H

#include <string>
#include <vector>

// 平台判断宏（带注释的宏定义）
#if defined(_WIN32)
    #define PLATFORM "Windows"  // Windows平台
#elif defined(__linux__)
    #define PLATFORM "Linux"    // Linux平台
#else
    #define PLATFORM "Unknown"
#endif

namespace DemoNamespace {

/* 枚举类型定义 */
enum class LogLevel {
    DEBUG,      // 调试信息
    INFO,       // 普通信息
    WARNING,    // 警告信息
    ERROR       // 错误信息
};

// 前置声明
class SystemManager;

/* 接口类 */
class ILogger {
public:
    virtual ~ILogger() = default;
    virtual void log(const std::string& message) = 0;
};

/* 系统管理类 */
class SystemManager final : public ILogger {
public:
    // 构造函数（带初始化列表）
    explicit SystemManager(const std::string& name);
    
    // 析构函数
    ~SystemManager() override;
    
    // 静态方法
    static int get_instance_count();
    
    // 成员方法
    void initialize();
    void process_data(const std::vector<int>& data);
    void log(const std::string& message) override;

    // 嵌套类
    class Configuration {
    public:
        int max_connections = 100;
        double timeout = 5.0;
    };

private:
    std::string m_name;
    Configuration m_config;
    static int s_instance_count;
    
    // 友元函数
    friend void print_system_info(const SystemManager& manager);
};

// 工具函数声明
void print_system_info(const SystemManager& manager);

} // namespace DemoNamespace

#endif // DEMO_CPP_H
