// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xdetect_and_recognize.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDetect_and_recognize_CfgInitialize(XDetect_and_recognize *InstancePtr, XDetect_and_recognize_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDetect_and_recognize_Start(XDetect_and_recognize *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDetect_and_recognize_IsDone(XDetect_and_recognize *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDetect_and_recognize_IsIdle(XDetect_and_recognize *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDetect_and_recognize_IsReady(XDetect_and_recognize *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDetect_and_recognize_EnableAutoRestart(XDetect_and_recognize *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDetect_and_recognize_DisableAutoRestart(XDetect_and_recognize *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_AP_CTRL, 0);
}

u32 XDetect_and_recognize_Get_result(XDetect_and_recognize *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_RESULT_DATA);
    return Data;
}

u32 XDetect_and_recognize_Get_result_vld(XDetect_and_recognize *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_RESULT_CTRL);
    return Data & 0x1;
}

void XDetect_and_recognize_InterruptGlobalEnable(XDetect_and_recognize *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_GIE, 1);
}

void XDetect_and_recognize_InterruptGlobalDisable(XDetect_and_recognize *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_GIE, 0);
}

void XDetect_and_recognize_InterruptEnable(XDetect_and_recognize *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_IER);
    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_IER, Register | Mask);
}

void XDetect_and_recognize_InterruptDisable(XDetect_and_recognize *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_IER);
    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDetect_and_recognize_InterruptClear(XDetect_and_recognize *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDetect_and_recognize_WriteReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_ISR, Mask);
}

u32 XDetect_and_recognize_InterruptGetEnabled(XDetect_and_recognize *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_IER);
}

u32 XDetect_and_recognize_InterruptGetStatus(XDetect_and_recognize *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDetect_and_recognize_ReadReg(InstancePtr->Control_BaseAddress, XDETECT_AND_RECOGNIZE_CONTROL_ADDR_ISR);
}

