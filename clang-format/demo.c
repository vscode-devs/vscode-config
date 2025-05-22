#include "demo.h"
#include <stdio.h>

// 全局变量声明
static int global_counter = 0;

/* 函数实现：系统初始化 */
void initialize_system(void) {
    // 连续赋值
    int a, b, c;
    a = b = c = 0;

	unsigned int aa = 0;
	Device bb = {0};
	char cc = '0';
    // 数组声明和初始化
    int numbers[5] = {1,2,3,4,5};
    int matrix[3][3] = {
        {1,2,3},
        {4,5,6},
        {7,8,9}
    };

    printf("System initialized on %s platform\n", PLATFORM);
}

Device* create_device(int id, const char* name) {
    static Device dev;
    dev.id = id;
    dev.name = (char*)name;
    dev.state = STATE_IDLE;
    return &dev;
}

/* 数据处理函数 */
void process_data(int* data, int length) {
    // for循环
    for(int i=0; i<length; i++) {
        // if语句
        if(data[i] > MAX_VALUE) {
            data[i] = MAX_VALUE;
        }
        else if(data[i] < 0) {
            data[i] = 0;
        }
    }

    // while循环
    int n = 5;
    while(n-- > 0) {
        global_counter += *data++;
    }

    // switch语句
    switch(global_counter) {
        case 0:
            printf("No data processed\n");
            break;
        case 1 ... 10:
            printf("Low data volume\n");
            break;
        default:
            printf("Data processed: %d\n", global_counter);
    }

    /* 复杂注释示例：
     * 这里演示多行注释
     * 包含多种格式化可能性 */
	 int matrix[3][3] = {
        {1,2,3},
        {4,5,6},
        {7,8,9}
    };
    do {
        // do-while循环
        matrix[0][0] ++;
    } while(matrix[0][0] < 10);
}

// 辅助函数
static void internal_helper(void) {
    // 三元运算符
    int x = (global_counter > 100) ? 100 : global_counter;
    
    // 嵌套结构
    struct {
        int y;
        struct {
            int z;
        } inner;
    } temp = {.y = 5, .inner.z = 10};

    // 复杂表达式
    x += (temp.y * temp.inner.z) / (x ? x : 1);
}

/*
 * 主函数
 */
int main(void) {
    initialize_system();

    int test_data[] = {150, -5, 80, 255, 30};
    process_data(test_data, sizeof(test_data)/sizeof(int));

    Device* dev = create_device(1, "Main Device");
    dev->state = STATE_RUNNING;

    return 0;
}