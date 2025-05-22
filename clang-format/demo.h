#ifndef DEMO_H
#define DEMO_H

// 平台判断宏（带注释的宏定义）
#if defined(_WIN32)
    #define PLATFORM "Windows"  // Windows平台
#elif defined(__linux__)
    #define PLATFORM "Linux"    // Linux平台
#else
    #define PLATFORM "Unknown"
#endif

/* 最大数值宏 */
#define MAX_VALUE 100

// 枚举类型定义
typedef enum {
    STATE_IDLE,     // 空闲状态
    STATE_RUNNING,  // 运行状态
    STATE_ERROR     // 错误状态
} SystemState;

// 结构体定义
typedef struct {
    int id;
    char* name;
    SystemState state;
} Device;

// 函数声明
void initialize_system(void);
Device* create_device(int id, const char* name);
void process_data(int* data, int length);

#endif // DEMO_H
