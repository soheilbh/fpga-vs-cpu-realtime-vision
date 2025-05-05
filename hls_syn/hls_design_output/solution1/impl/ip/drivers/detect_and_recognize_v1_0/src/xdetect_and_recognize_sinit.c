// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.2 (64-bit)
// Tool Version Limit: 2024.11
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xdetect_and_recognize.h"

extern XDetect_and_recognize_Config XDetect_and_recognize_ConfigTable[];

#ifdef SDT
XDetect_and_recognize_Config *XDetect_and_recognize_LookupConfig(UINTPTR BaseAddress) {
	XDetect_and_recognize_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XDetect_and_recognize_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XDetect_and_recognize_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XDetect_and_recognize_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDetect_and_recognize_Initialize(XDetect_and_recognize *InstancePtr, UINTPTR BaseAddress) {
	XDetect_and_recognize_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDetect_and_recognize_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDetect_and_recognize_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XDetect_and_recognize_Config *XDetect_and_recognize_LookupConfig(u16 DeviceId) {
	XDetect_and_recognize_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDETECT_AND_RECOGNIZE_NUM_INSTANCES; Index++) {
		if (XDetect_and_recognize_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDetect_and_recognize_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDetect_and_recognize_Initialize(XDetect_and_recognize *InstancePtr, u16 DeviceId) {
	XDetect_and_recognize_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDetect_and_recognize_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDetect_and_recognize_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

