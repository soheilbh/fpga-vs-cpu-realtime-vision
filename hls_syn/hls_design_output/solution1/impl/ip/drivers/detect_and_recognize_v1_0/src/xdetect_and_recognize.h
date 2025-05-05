// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XDETECT_AND_RECOGNIZE_H
#define XDETECT_AND_RECOGNIZE_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdetect_and_recognize_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XDetect_and_recognize_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDetect_and_recognize;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDetect_and_recognize_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDetect_and_recognize_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDetect_and_recognize_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDetect_and_recognize_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XDetect_and_recognize_Initialize(XDetect_and_recognize *InstancePtr, UINTPTR BaseAddress);
XDetect_and_recognize_Config* XDetect_and_recognize_LookupConfig(UINTPTR BaseAddress);
#else
int XDetect_and_recognize_Initialize(XDetect_and_recognize *InstancePtr, u16 DeviceId);
XDetect_and_recognize_Config* XDetect_and_recognize_LookupConfig(u16 DeviceId);
#endif
int XDetect_and_recognize_CfgInitialize(XDetect_and_recognize *InstancePtr, XDetect_and_recognize_Config *ConfigPtr);
#else
int XDetect_and_recognize_Initialize(XDetect_and_recognize *InstancePtr, const char* InstanceName);
int XDetect_and_recognize_Release(XDetect_and_recognize *InstancePtr);
#endif

void XDetect_and_recognize_Start(XDetect_and_recognize *InstancePtr);
u32 XDetect_and_recognize_IsDone(XDetect_and_recognize *InstancePtr);
u32 XDetect_and_recognize_IsIdle(XDetect_and_recognize *InstancePtr);
u32 XDetect_and_recognize_IsReady(XDetect_and_recognize *InstancePtr);
void XDetect_and_recognize_EnableAutoRestart(XDetect_and_recognize *InstancePtr);
void XDetect_and_recognize_DisableAutoRestart(XDetect_and_recognize *InstancePtr);

u32 XDetect_and_recognize_Get_result(XDetect_and_recognize *InstancePtr);
u32 XDetect_and_recognize_Get_result_vld(XDetect_and_recognize *InstancePtr);

void XDetect_and_recognize_InterruptGlobalEnable(XDetect_and_recognize *InstancePtr);
void XDetect_and_recognize_InterruptGlobalDisable(XDetect_and_recognize *InstancePtr);
void XDetect_and_recognize_InterruptEnable(XDetect_and_recognize *InstancePtr, u32 Mask);
void XDetect_and_recognize_InterruptDisable(XDetect_and_recognize *InstancePtr, u32 Mask);
void XDetect_and_recognize_InterruptClear(XDetect_and_recognize *InstancePtr, u32 Mask);
u32 XDetect_and_recognize_InterruptGetEnabled(XDetect_and_recognize *InstancePtr);
u32 XDetect_and_recognize_InterruptGetStatus(XDetect_and_recognize *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
