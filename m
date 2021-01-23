Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E19B4301589
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 14:53:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbhAWNub (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 08:50:31 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:43613 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbhAWNuQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 08:50:16 -0500
Received: from envy.fritz.box ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N7Qgn-1m4SvL1QAn-017ilX; Sat, 23 Jan 2021 14:47:26 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 5/8] Refactored HID descriptor and report generators.
Date:   Sat, 23 Jan 2021 14:47:13 +0100
Message-Id: <20210123134716.13414-6-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210123134716.13414-1-mail@richard-neumann.de>
References: <20210123134716.13414-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pL1pBGdZNG6AFYl/nxlFn5UKhGlTPsDEpzI8kQNCqa/ZZinugnD
 Q+DygmFYSiF0GYVLDIS4LWFPDeGN8L/WNlbIkqquhT9pR5HvrpxJ0nn8cHgICT8URd6fvKK
 McI/Os2QSvDFKqEsGDUXRjKyfTxPYg/DeH9CRfOxmcWE3Pyl/QkV+B17qzRXIFwfDwguTHh
 l2Hao4+SzSlRBPFFSFtgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:L/+7H7TMdOs=:PRKfSTIojclbH5hdh44cxj
 EREulQL2E5qd2au3lL/+wfbWb6psVGImrMUYyOx6h+wzpi/5nyjTIJljsphRVnQhyixcq4orn
 KF6ComThdSEd7mnVuZXuO89ADxP3V40wrcRGs0M5G2iBvemUhB796SbgIgZakUp9YjJ+ZSQnk
 rsa7Zs6SiUqs/hET0XFmCcrr1JfOWXikd4BiK6cAS6nhFtM7K1nYaBAAW6WcsK0ysmHHSYrAq
 5rJzjvurpHHCp4AjgmoHg3Ij1Oa4Lf8loq5u7SjKSjLOvq+nknY+pbG9fQFDJ++zss21jZMPw
 diaefEa8Y0p8Uoy/ESTykKt625VlxR2QY1v0/Y5AzphICGVR/JDwXxQ/J5yVlT1gx9v6AxhSI
 4rV28wgXA17/z77cxZMxj1YqdujoHr63NWKXAt9FmI0+npdfuFpvl3CrTgnaJpa11dFHz6VwH
 lwHyUDdekA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

* amd-sfh-hid-descriptors.h contains the report descriptors.
* amd-sfh-hid-reports.{c,h} contains the interface to the report generation functions.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 ...eport_desc.h => amd-sfh-hid-descriptors.h} |  51 ++-
 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c | 354 ++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h | 102 +++++
 .../hid_descriptor/amd_sfh_hid_desc.c         | 224 -----------
 .../hid_descriptor/amd_sfh_hid_desc.h         | 107 ------
 5 files changed, 481 insertions(+), 357 deletions(-)
 rename drivers/hid/amd-sfh-hid/{hid_descriptor/amd_sfh_hid_report_desc.h => amd-sfh-hid-descriptors.h} (95%)
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c
 create mode 100644 drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h
 delete mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
 delete mode 100644 drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h

diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h b/drivers/hid/amd-sfh-hid/amd-sfh-hid-descriptors.h
similarity index 95%
rename from drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
rename to drivers/hid/amd-sfh-hid/amd-sfh-hid-descriptors.h
index 44271d39b322..d99eae76415d 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_report_desc.h
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-hid-descriptors.h
@@ -1,25 +1,24 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
 /*
- * HID  descriptor stuructures
- * Copyright 2020 Advanced Micro Devices, Inc.
- * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
- *	    Sandeep Singh <Sandeep.singh@amd.com>
+ * AMD Sensor Fusion Hub HID descriptor definitions
+ *
+ * Author:	Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
  */
 
-#ifndef AMD_SFH_HID_REPORT_DESCRIPTOR_H
-#define AMD_SFH_HID_REPORT_DESCRIPTOR_H
+#ifndef AMD_SFH_HID_DESCRIPTORS_H
+#define AMD_SFH_HID_DESCRIPTORS_H
 
 // Accelerometer 3D Sensor
 static const u8 accel3_report_descriptor[] = {
-0x05, 0x20,          /* Usage page */
-0x09, 0x73,          /* Motion type Accel 3D */
-0xA1, 0x00,          /* HID Collection (Physical) */
+0x05, 0x20,		  /* Usage page */
+0x09, 0x73,		  /* Motion type Accel 3D */
+0xA1, 0x00,		  /* HID Collection (Physical) */
 
 //feature reports(xmit/receive)
-0x85, 1,           /* HID  Report ID */
+0x85, 1,		   /* HID  Report ID */
 0x05, 0x20,	   /* HID usage page sensor */
 0x0A, 0x09, 0x03,  /* Sensor property and sensor connection type */
-0x15, 0,           /* HID logical MIN_8(0) */
+0x15, 0,		   /* HID logical MIN_8(0) */
 0x25, 2,	   /* HID logical MAX_8(2) */
 0x75, 8,	   /* HID report size(8) */
 0x95, 1,	   /* HID report count(1) */
@@ -27,13 +26,13 @@ static const u8 accel3_report_descriptor[] = {
 0x0A, 0x30, 0x08, /* Sensor property connection type intergated sel*/
 0x0A, 0x31, 0x08, /* Sensor property connection type attached sel */
 0x0A, 0x32, 0x08, /* Sensor property connection type external sel */
-0xB1, 0x00,       /* HID feature (Data_Arr_Abs) */
+0xB1, 0x00,	   /* HID feature (Data_Arr_Abs) */
 0xC0,		  /* HID end collection */
 0x0A, 0x16, 0x03, /* HID usage sensor property reporting state */
-0x15, 0,          /* HID logical Min_8(0) */
+0x15, 0,		  /* HID logical Min_8(0) */
 0x25, 5,	  /* HID logical Max_8(5) */
 0x75, 8,	  /* HID report size(8) */
-0x95, 1,          /* HID report count(1) */
+0x95, 1,		  /* HID report count(1) */
 0xA1, 0x02,	  /* HID collection(logical) */
 0x0A, 0x40, 0x08, /* Sensor property report state no events sel */
 0x0A, 0x41, 0x08, /* Sensor property report state all events sel */
@@ -55,7 +54,7 @@ static const u8 accel3_report_descriptor[] = {
 0x0A, 0x53, 0x08, /* Sensor property power state D2 standby with wake sel */
 0x0A, 0x54, 0x08, /* Sensor property power state D3 sleep with wake  sel */
 0x0A, 0x55, 0x08, /* Sensor property power state D4 power off sel */
-0xB1, 0x00,       /* HID feature (Data_Arr_Abs) */
+0xB1, 0x00,	   /* HID feature (Data_Arr_Abs) */
 0xC0,		  /* HID end collection */
 0x0A, 0x01, 0x02, /* HID usage sensor state */
 0x15, 0,	  /* HID logical Min_8(0) */
@@ -339,7 +338,7 @@ const u8 gyro3_report_descriptor[] = {
 0xC0,			/* HID end collection */
 };
 
-const u8 comp3_report_descriptor[] = {
+const u8 magno_report_descriptor[] = {
 0x05, 0x20,		/* Usage page */
 0x09, 0x83,		/* Motion type Orientation compass 3D */
 0xA1, 0x00,		/* HID Collection (Physical) */
@@ -371,7 +370,7 @@ const u8 comp3_report_descriptor[] = {
 0x0A, 0x45, 0x08,	/* Sensor reporting state threshold events wake sel */
 0xB1, 0x00,		/* HID feature (Data_Arr_Abs) */
 0xC0,			/* HID end collection */
-0x0A, 0x19, 0x03,       /* HID usage sensor property power state */
+0x0A, 0x19, 0x03,	   /* HID usage sensor property power state */
 0x15, 0,		/* HID logical Min_8(0) */
 0x25, 5,		/* HID logical Max_8(5) */
 0x75, 8,		/* HID report size(8) */
@@ -391,13 +390,13 @@ const u8 comp3_report_descriptor[] = {
 0x75, 8,		/* HID report size(8) */
 0x95, 1,		/* HID report count(1) */
 0xA1, 0x02,		/* HID collection(logical) */
-0x0A, 0x00, 0x08,       /* HID usage sensor state unknown sel */
-0x0A, 0x01, 0x08,       /* HID usage sensor state ready sel */
-0x0A, 0x02, 0x08,       /* HID usage sensor state not available sel */
-0x0A, 0x03, 0x08,       /* HID usage sensor state no data sel */
-0x0A, 0x04, 0x08,       /* HID usage sensor state initializing sel */
-0x0A, 0x05, 0x08,       /* HID usage sensor state access denied sel */
-0x0A, 0x06, 0x08,       /* HID usage sensor state error sel */
+0x0A, 0x00, 0x08,	   /* HID usage sensor state unknown sel */
+0x0A, 0x01, 0x08,	   /* HID usage sensor state ready sel */
+0x0A, 0x02, 0x08,	   /* HID usage sensor state not available sel */
+0x0A, 0x03, 0x08,	   /* HID usage sensor state no data sel */
+0x0A, 0x04, 0x08,	   /* HID usage sensor state initializing sel */
+0x0A, 0x05, 0x08,	   /* HID usage sensor state access denied sel */
+0x0A, 0x06, 0x08,	   /* HID usage sensor state error sel */
 0xB1, 0x00,		/* HID feature (Data_Arr_Abs) */
 0xC0,			/* HID end collection */
 0x0A, 0x0E, 0x03,	/* HID usage sensor property report interval */
@@ -516,7 +515,7 @@ const u8 als_report_descriptor[] = {
 0x09, 0x41,	/* HID usage sensor type Ambientlight  */
 0xA1, 0x00,	/* HID Collection (Physical) */
 
-//feature reports(xmit/receive)//
+//feature reports(xmit/receive)
 0x85, 4,		/* HID  Report ID */
 0x05, 0x20,		/* HID usage page sensor */
 0x0A, 0x09, 0x03,	/* Sensor property and sensor connection type */
diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c b/drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c
new file mode 100644
index 000000000000..b8cb89b79fc2
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.c
@@ -0,0 +1,354 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ *  AMD SFH HID report and descriptor generation
+ *
+ *  Author: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
+ *          Richard Neumann <mail@richard-neumann.de>
+ */
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+
+#include "amd-sfh-hid-descriptors.h"
+#include "amd-sfh-hid-reports.h"
+#include "amd-sfh-pci.h"
+
+#define FIRMWARE_MULTIPLIER						1000
+#define HID_USAGE_SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM		0x41
+#define HID_USAGE_SENSOR_PROP_POWER_STATE_D0_FULL_POWER_ENUM		0x51
+#define HID_DEFAULT_REPORT_INTERVAL					0x50
+#define HID_DEFAULT_MIN_VALUE						0X7F
+#define HID_DEFAULT_MAX_VALUE						0x80
+#define HID_DEFAULT_SENSITIVITY						0x7F
+#define HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_ENUM	0x01
+/* state enums */
+#define HID_USAGE_SENSOR_STATE_READY_ENUM				0x02
+#define HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM			0x05
+#define HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM			0x04
+
+/**
+ * get_report_descriptor - Writes a report descriptor.
+ * @sensor_idx:		The sensor index
+ * @buf:		The report descriptor buffer
+ *
+ * Returns zero on success or nonzero on errors.
+ */
+int get_report_descriptor(enum sensor_idx sensor_idx, u8 *buf)
+{
+	size_t size;
+
+	if (!buf)
+		return -ENOBUFS;
+
+	switch (sensor_idx) {
+	case ACCEL_IDX:
+		size = sizeof(accel3_report_descriptor);
+		memcpy(buf, accel3_report_descriptor, size);
+		break;
+	case GYRO_IDX:
+		size = sizeof(gyro3_report_descriptor);
+		memcpy(buf, gyro3_report_descriptor, size);
+		break;
+	case MAG_IDX:
+		size = sizeof(magno_report_descriptor);
+		memcpy(buf, magno_report_descriptor, size);
+		break;
+	case ALS_IDX:
+		size = sizeof(als_report_descriptor);
+		memcpy(buf, als_report_descriptor, size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(get_report_descriptor);
+
+/**
+ * get_descriptor_size - Returns the requested descriptor size.
+ * @sensor_idx:		The sensor index
+ * @descriptor_name:	The requested descriptor
+ *
+ * Returns the respective descriptor's size or <0 on errors.
+ */
+int get_descriptor_size(enum sensor_idx sensor_idx, enum desc_type desc_type)
+{
+	switch (sensor_idx) {
+	case ACCEL_IDX:
+		switch (desc_type) {
+		case AMD_SFH_DESCRIPTOR:
+			return sizeof(accel3_report_descriptor);
+		case AMD_SFH_INPUT_REPORT:
+			return sizeof(struct accel3_input_report);
+		case AMD_SFH_FEATURE_REPORT:
+			return sizeof(struct accel3_feature_report);
+		}
+		break;
+	case GYRO_IDX:
+		switch (desc_type) {
+		case AMD_SFH_DESCRIPTOR:
+			return sizeof(gyro3_report_descriptor);
+		case AMD_SFH_INPUT_REPORT:
+			return sizeof(struct gyro_input_report);
+		case AMD_SFH_FEATURE_REPORT:
+			return sizeof(struct gyro_feature_report);
+		}
+		break;
+	case MAG_IDX:
+		switch (desc_type) {
+		case AMD_SFH_DESCRIPTOR:
+			return sizeof(magno_report_descriptor);
+		case AMD_SFH_INPUT_REPORT:
+			return sizeof(struct magno_input_report);
+		case AMD_SFH_FEATURE_REPORT:
+			return sizeof(struct magno_feature_report);
+		}
+		break;
+	case ALS_IDX:
+		switch (desc_type) {
+		case AMD_SFH_DESCRIPTOR:
+			return sizeof(als_report_descriptor);
+		case AMD_SFH_INPUT_REPORT:
+			return sizeof(struct als_input_report);
+		case AMD_SFH_FEATURE_REPORT:
+			return sizeof(struct als_feature_report);
+		}
+		break;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(get_descriptor_size);
+
+static void get_common_features(struct common_features *common, int report_id)
+{
+	common->report_id = report_id;
+	common->connection_type =
+		HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_ENUM;
+	common->report_state =
+		HID_USAGE_SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM;
+	common->power_state =
+		HID_USAGE_SENSOR_PROP_POWER_STATE_D0_FULL_POWER_ENUM;
+	common->sensor_state = HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM;
+	common->report_interval =  HID_DEFAULT_REPORT_INTERVAL;
+}
+
+static int get_accel_feature_report(int report_id, u8 *buf, size_t len)
+{
+	size_t size;
+	struct accel3_feature_report accel_features;
+
+	get_common_features(&accel_features.common, report_id);
+	accel_features.change_sesnitivity = HID_DEFAULT_SENSITIVITY;
+	accel_features.sensitivity_min = HID_DEFAULT_MIN_VALUE;
+	accel_features.sensitivity_max = HID_DEFAULT_MAX_VALUE;
+	size = sizeof(accel_features);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &accel_features, size);
+	return size;
+}
+
+static int get_gyro_feature_report(int report_id, u8 *buf, size_t len)
+{
+	size_t size;
+	struct gyro_feature_report gyro_features;
+
+	get_common_features(&gyro_features.common, report_id);
+	gyro_features.change_sesnitivity = HID_DEFAULT_SENSITIVITY;
+	gyro_features.sensitivity_min = HID_DEFAULT_MIN_VALUE;
+	gyro_features.sensitivity_max = HID_DEFAULT_MAX_VALUE;
+	size = sizeof(gyro_features);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &gyro_features, size);
+	return size;
+}
+
+static int get_mag_feature_report(int report_id, u8 *buf, size_t len)
+{
+	size_t size;
+	struct magno_feature_report magno_features;
+
+	get_common_features(&magno_features.common, report_id);
+	magno_features.heading_min = HID_DEFAULT_MIN_VALUE;
+	magno_features.heading_max = HID_DEFAULT_MAX_VALUE;
+	magno_features.flux_change_sensitivity = HID_DEFAULT_MIN_VALUE;
+	magno_features.flux_min = HID_DEFAULT_MIN_VALUE;
+	magno_features.flux_max = HID_DEFAULT_MAX_VALUE;
+	size = sizeof(magno_features);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &magno_features, size);
+	return size;
+}
+
+static int get_als_feature_report(int report_id, u8 *buf, size_t len)
+{
+	size_t size;
+	struct als_feature_report als_features;
+
+	get_common_features(&als_features.common, report_id);
+	als_features.change_sesnitivity = HID_DEFAULT_SENSITIVITY;
+	als_features.sensitivity_min = HID_DEFAULT_MIN_VALUE;
+	als_features.sensitivity_max = HID_DEFAULT_MAX_VALUE;
+	size = sizeof(als_features);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &als_features, size);
+	return size;
+}
+
+/**
+ * get_feature_report - Writes a feature report and returns its size.
+ * @sensor_idx:		The sensor index
+ * @report_id:		The report id
+ * @buf:		The feature report buffer
+ *
+ * Returns the size on success or < 0 on errors.
+ */
+int get_feature_report(enum sensor_idx sensor_idx, int report_id, u8 *buf,
+		       size_t len)
+{
+	if (!buf)
+		return -ENOBUFS;
+
+	switch (sensor_idx) {
+	case ACCEL_IDX:
+		return get_accel_feature_report(report_id, buf, len);
+	case GYRO_IDX:
+		return get_gyro_feature_report(report_id, buf, len);
+	case MAG_IDX:
+		return get_mag_feature_report(report_id, buf, len);
+	case ALS_IDX:
+		return get_als_feature_report(report_id, buf, len);
+	default:
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(get_feature_report);
+
+static void get_common_inputs(struct common_inputs *common, int report_id)
+{
+	common->report_id = report_id;
+	common->sensor_state = HID_USAGE_SENSOR_STATE_READY_ENUM;
+	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
+}
+
+static int get_accel_input_report(int report_id, u8 *buf, size_t len,
+				  u32 *cpu_addr)
+{
+	size_t size;
+	struct accel3_input_report acc_input;
+
+	get_common_inputs(&acc_input.common, report_id);
+	acc_input.accel_x = (int)cpu_addr[0] / FIRMWARE_MULTIPLIER;
+	acc_input.accel_y = (int)cpu_addr[1] / FIRMWARE_MULTIPLIER;
+	acc_input.accel_z = (int)cpu_addr[2] / FIRMWARE_MULTIPLIER;
+	acc_input.shake_detection = (int)cpu_addr[3] / FIRMWARE_MULTIPLIER;
+	size = sizeof(acc_input);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &acc_input, size);
+	return size;
+}
+
+static int get_gyro_input_report(int report_id, u8 *buf, size_t len,
+				 u32 *cpu_addr)
+{
+	size_t size;
+	struct gyro_input_report gyro_input;
+
+	get_common_inputs(&gyro_input.common, report_id);
+	gyro_input.angle_x = (int)cpu_addr[0] / FIRMWARE_MULTIPLIER;
+	gyro_input.angle_y = (int)cpu_addr[1] / FIRMWARE_MULTIPLIER;
+	gyro_input.angle_z = (int)cpu_addr[2] / FIRMWARE_MULTIPLIER;
+	size = sizeof(gyro_input);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &gyro_input, size);
+	return size;
+}
+
+static int get_mag_input_report(int report_id, u8 *buf, size_t len,
+				u32 *cpu_addr)
+{
+	size_t size;
+	struct magno_input_report magno_input;
+
+	get_common_inputs(&magno_input.common, report_id);
+	magno_input.flux_x = (int)cpu_addr[0] / FIRMWARE_MULTIPLIER;
+	magno_input.flux_y = (int)cpu_addr[1] / FIRMWARE_MULTIPLIER;
+	magno_input.flux_z = (int)cpu_addr[2] / FIRMWARE_MULTIPLIER;
+	magno_input.accuracy = (u16)cpu_addr[3] / FIRMWARE_MULTIPLIER;
+	size = sizeof(magno_input);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &magno_input, size);
+	return size;
+}
+
+static int get_als_input_report(int report_id, u8 *buf, size_t len,
+				u32 *cpu_addr)
+{
+	size_t size;
+	struct als_input_report als_input;
+
+	get_common_inputs(&als_input.common, report_id);
+	als_input.illuminance = (int)cpu_addr[0] / FIRMWARE_MULTIPLIER;
+	size = sizeof(als_input);
+
+	if (size > len)
+		return -ENOMEM;
+
+	memcpy(buf, &als_input, size);
+	return size;
+}
+
+/**
+ * get_feature_report - Writes an input report and returns its size.
+ * @sensor_idx:		The sensor index
+ * @report_id:		The report id
+ * @buf:		The feature report buffer
+ * @cpu_addr:		The DMA mapped CPU address
+ *
+ * Returns the size on success or < 0 on errors.
+ */
+int get_input_report(enum sensor_idx sensor_idx, int report_id, u8 *buf,
+		     size_t len, u32 *cpu_addr)
+{
+	if (!buf)
+		return -ENOBUFS;
+
+	if (!cpu_addr)
+		return -EIO;
+
+	switch (sensor_idx) {
+	case ACCEL_IDX:
+		return get_accel_input_report(report_id, buf, len, cpu_addr);
+	case GYRO_IDX:
+		return get_gyro_input_report(report_id, buf, len, cpu_addr);
+	case MAG_IDX:
+		return get_mag_input_report(report_id, buf, len, cpu_addr);
+	case ALS_IDX:
+		return get_als_input_report(report_id, buf, len, cpu_addr);
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h b/drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h
new file mode 100644
index 000000000000..1cb16d9bd143
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd-sfh-hid-reports.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * HID report and report stuructures and routines
+ *
+ * Author: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
+ */
+
+#ifndef AMD_SFH_HID_REPORTS_H
+#define AMD_SFH_HID_REPORTS_H
+
+#include "amd-sfh-pci.h"
+
+/**
+ * desc_type - Report descriptor types.
+ */
+enum desc_type {
+	AMD_SFH_DESCRIPTOR,
+	AMD_SFH_INPUT_REPORT,
+	AMD_SFH_FEATURE_REPORT,
+};
+
+struct common_features {
+	u8 report_id;
+	u8 connection_type;
+	u8 report_state;
+	u8 power_state;
+	u8 sensor_state;
+	u32 report_interval;
+} __packed;
+
+struct common_inputs {
+	u8 report_id;
+	u8 sensor_state;
+	u8 event_type;
+} __packed;
+
+struct accel3_feature_report {
+	struct common_features common;
+	u16 change_sesnitivity;
+	s16 sensitivity_max;
+	s16 sensitivity_min;
+} __packed;
+
+struct accel3_input_report {
+	struct common_inputs common;
+	int accel_x;
+	int accel_y;
+	int accel_z;
+	u8 shake_detection;
+} __packed;
+
+struct gyro_feature_report {
+	struct common_features common;
+	u16 change_sesnitivity;
+	s16 sensitivity_max;
+	s16 sensitivity_min;
+} __packed;
+
+struct gyro_input_report {
+	struct common_inputs common;
+	int angle_x;
+	int angle_y;
+	int angle_z;
+} __packed;
+
+struct magno_feature_report {
+	struct common_features common;
+	u16 headingchange_sensitivity;
+	s16 heading_min;
+	s16 heading_max;
+	u16 flux_change_sensitivity;
+	s16 flux_min;
+	s16 flux_max;
+} __packed;
+
+struct magno_input_report {
+	struct common_inputs common;
+	int flux_x;
+	int flux_y;
+	int flux_z;
+	int accuracy;
+} __packed;
+
+struct als_feature_report {
+	struct common_features common;
+	u16 change_sesnitivity;
+	s16 sensitivity_max;
+	s16 sensitivity_min;
+} __packed;
+
+struct als_input_report {
+	struct common_inputs common;
+	int illuminance;
+} __packed;
+
+int get_report_descriptor(enum sensor_idx sensor_idx, u8 *buf);
+int get_descriptor_size(enum sensor_idx sensor_idx, enum desc_type desc_type);
+int get_feature_report(enum sensor_idx sensor_idx, int report_id, u8 *buf,
+		       size_t len);
+int get_input_report(enum sensor_idx sensor_idx, int report_id, u8 *buf,
+		     size_t len, u32 *sensor_virt_addr);
+#endif
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
deleted file mode 100644
index 6e3ad66e57a4..000000000000
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ /dev/null
@@ -1,224 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  AMD SFH Report Descriptor generator
- *  Copyright 2020 Advanced Micro Devices, Inc.
- *  Authors: Nehal Bakulchandra Shah <Nehal-Bakulchandra.Shah@amd.com>
- *	     Sandeep Singh <sandeep.singh@amd.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/string.h>
-#include <linux/slab.h>
-#include "amd_sfh_pcie.h"
-#include "amd_sfh_hid_desc.h"
-#include "amd_sfh_hid_report_desc.h"
-
-#define	AMD_SFH_FW_MULTIPLIER (1000)
-#define HID_USAGE_SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM	0x41
-#define HID_USAGE_SENSOR_PROP_POWER_STATE_D0_FULL_POWER_ENUM	0x51
-#define HID_DEFAULT_REPORT_INTERVAL				0x50
-#define HID_DEFAULT_MIN_VALUE					0X7F
-#define HID_DEFAULT_MAX_VALUE					0x80
-#define HID_DEFAULT_SENSITIVITY					0x7F
-#define HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_ENUM  0x01
-/* state enums */
-#define HID_USAGE_SENSOR_STATE_READY_ENUM                             0x02
-#define HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM                      0x05
-#define HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM                      0x04
-
-int get_report_descriptor(int sensor_idx, u8 *rep_desc)
-{
-	switch (sensor_idx) {
-	case accel_idx: /* accel */
-		memset(rep_desc, 0, sizeof(accel3_report_descriptor));
-		memcpy(rep_desc, accel3_report_descriptor,
-		       sizeof(accel3_report_descriptor));
-		break;
-	case gyro_idx: /* gyro */
-		memset(rep_desc, 0, sizeof(gyro3_report_descriptor));
-		memcpy(rep_desc, gyro3_report_descriptor,
-		       sizeof(gyro3_report_descriptor));
-		break;
-	case mag_idx: /* Magnetometer */
-		memset(rep_desc, 0, sizeof(comp3_report_descriptor));
-		memcpy(rep_desc, comp3_report_descriptor,
-		       sizeof(comp3_report_descriptor));
-		break;
-	case als_idx: /* ambient light sensor */
-		memset(rep_desc, 0, sizeof(als_report_descriptor));
-		memcpy(rep_desc, als_report_descriptor,
-		       sizeof(als_report_descriptor));
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
-u32 get_descr_sz(int sensor_idx, int descriptor_name)
-{
-	switch (sensor_idx) {
-	case accel_idx:
-		switch (descriptor_name) {
-		case descr_size:
-			return sizeof(accel3_report_descriptor);
-		case input_size:
-			return sizeof(struct accel3_input_report);
-		case feature_size:
-			return sizeof(struct accel3_feature_report);
-		}
-		break;
-	case gyro_idx:
-		switch (descriptor_name) {
-		case descr_size:
-			return sizeof(gyro3_report_descriptor);
-		case input_size:
-			return sizeof(struct gyro_input_report);
-		case feature_size:
-			return sizeof(struct gyro_feature_report);
-		}
-		break;
-	case mag_idx:
-		switch (descriptor_name) {
-		case descr_size:
-			return sizeof(comp3_report_descriptor);
-		case input_size:
-			return sizeof(struct magno_input_report);
-		case feature_size:
-			return sizeof(struct magno_feature_report);
-		}
-		break;
-	case als_idx:
-		switch (descriptor_name) {
-		case descr_size:
-			return sizeof(als_report_descriptor);
-		case input_size:
-			return sizeof(struct als_input_report);
-		case feature_size:
-			return sizeof(struct als_feature_report);
-		}
-		break;
-	default:
-		break;
-	}
-	return 0;
-}
-
-static void get_common_features(struct common_feature_property *common, int report_id)
-{
-	common->report_id = report_id;
-	common->connection_type = HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_ENUM;
-	common->report_state = HID_USAGE_SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM;
-	common->power_state = HID_USAGE_SENSOR_PROP_POWER_STATE_D0_FULL_POWER_ENUM;
-	common->sensor_state = HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM;
-	common->report_interval =  HID_DEFAULT_REPORT_INTERVAL;
-}
-
-u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report)
-{
-	struct accel3_feature_report acc_feature;
-	struct gyro_feature_report gyro_feature;
-	struct magno_feature_report magno_feature;
-	struct als_feature_report als_feature;
-	u8 report_size = 0;
-
-	if (!feature_report)
-		return report_size;
-
-	switch (sensor_idx) {
-	case accel_idx: /* accel */
-		get_common_features(&acc_feature.common_property, report_id);
-		acc_feature.accel_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
-		acc_feature.accel_sensitivity_min = HID_DEFAULT_MIN_VALUE;
-		acc_feature.accel_sensitivity_max = HID_DEFAULT_MAX_VALUE;
-		memcpy(feature_report, &acc_feature, sizeof(acc_feature));
-		report_size = sizeof(acc_feature);
-		break;
-	case gyro_idx: /* gyro */
-		get_common_features(&gyro_feature.common_property, report_id);
-		gyro_feature.gyro_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
-		gyro_feature.gyro_sensitivity_min = HID_DEFAULT_MIN_VALUE;
-		gyro_feature.gyro_sensitivity_max = HID_DEFAULT_MAX_VALUE;
-		memcpy(feature_report, &gyro_feature, sizeof(gyro_feature));
-		report_size = sizeof(gyro_feature);
-		break;
-	case mag_idx: /* Magnetometer */
-		get_common_features(&magno_feature.common_property, report_id);
-		magno_feature.magno_headingchange_sensitivity = HID_DEFAULT_SENSITIVITY;
-		magno_feature.heading_min = HID_DEFAULT_MIN_VALUE;
-		magno_feature.heading_max = HID_DEFAULT_MAX_VALUE;
-		magno_feature.flux_change_sensitivity = HID_DEFAULT_MIN_VALUE;
-		magno_feature.flux_min = HID_DEFAULT_MIN_VALUE;
-		magno_feature.flux_max = HID_DEFAULT_MAX_VALUE;
-		memcpy(feature_report, &magno_feature, sizeof(magno_feature));
-		report_size = sizeof(magno_feature);
-		break;
-	case als_idx:  /* ambient light sensor */
-		get_common_features(&als_feature.common_property, report_id);
-		als_feature.als_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
-		als_feature.als_sensitivity_min = HID_DEFAULT_MIN_VALUE;
-		als_feature.als_sensitivity_max = HID_DEFAULT_MAX_VALUE;
-		memcpy(feature_report, &als_feature, sizeof(als_feature));
-		report_size = sizeof(als_feature);
-		break;
-	default:
-		break;
-	}
-	return report_size;
-}
-
-static void get_common_inputs(struct common_input_property *common, int report_id)
-{
-	common->report_id = report_id;
-	common->sensor_state = HID_USAGE_SENSOR_STATE_READY_ENUM;
-	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
-}
-
-u8 get_input_report(int sensor_idx, int report_id, u8 *input_report, u32 *sensor_virt_addr)
-{
-	struct accel3_input_report acc_input;
-	struct gyro_input_report gyro_input;
-	struct magno_input_report magno_input;
-	struct als_input_report als_input;
-	u8 report_size = 0;
-
-	if (!sensor_virt_addr || !input_report)
-		return report_size;
-
-	switch (sensor_idx) {
-	case accel_idx: /* accel */
-		get_common_inputs(&acc_input.common_property, report_id);
-		acc_input.in_accel_x_value = (int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
-		acc_input.in_accel_y_value = (int)sensor_virt_addr[1] / AMD_SFH_FW_MULTIPLIER;
-		acc_input.in_accel_z_value =  (int)sensor_virt_addr[2] / AMD_SFH_FW_MULTIPLIER;
-		memcpy(input_report, &acc_input, sizeof(acc_input));
-		report_size = sizeof(acc_input);
-		break;
-	case gyro_idx: /* gyro */
-		get_common_inputs(&gyro_input.common_property, report_id);
-		gyro_input.in_angel_x_value = (int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
-		gyro_input.in_angel_y_value = (int)sensor_virt_addr[1] / AMD_SFH_FW_MULTIPLIER;
-		gyro_input.in_angel_z_value =  (int)sensor_virt_addr[2] / AMD_SFH_FW_MULTIPLIER;
-		memcpy(input_report, &gyro_input, sizeof(gyro_input));
-		report_size = sizeof(gyro_input);
-		break;
-	case mag_idx: /* Magnetometer */
-		get_common_inputs(&magno_input.common_property, report_id);
-		magno_input.in_magno_x = (int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
-		magno_input.in_magno_y = (int)sensor_virt_addr[1] / AMD_SFH_FW_MULTIPLIER;
-		magno_input.in_magno_z = (int)sensor_virt_addr[2] / AMD_SFH_FW_MULTIPLIER;
-		magno_input.in_magno_accuracy = (u16)sensor_virt_addr[3] / AMD_SFH_FW_MULTIPLIER;
-		memcpy(input_report, &magno_input, sizeof(magno_input));
-		report_size = sizeof(magno_input);
-		break;
-	case als_idx: /* Als */
-		get_common_inputs(&als_input.common_property, report_id);
-		als_input.illuminance_value =  (int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
-		report_size = sizeof(als_input);
-		memcpy(input_report, &als_input, sizeof(als_input));
-		break;
-	default:
-		break;
-	}
-	return report_size;
-}
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
deleted file mode 100644
index 095c471d8fd6..000000000000
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ /dev/null
@@ -1,107 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * HID report descriptors, structures and routines
- * Copyright 2020 Advanced Micro Devices, Inc.
- * Authors: Nehal Bakulchandra Shah <Nehal-bakulchandra.shah@amd.com>
- *	    Sandeep Singh <Sandeep.singh@amd.com>
- */
-
-#ifndef AMD_SFH_HID_DESCRIPTOR_H
-#define AMD_SFH_HID_DESCRIPTOR_H
-
-enum desc_type {
-	/* Report descriptor name */
-	descr_size = 1,
-	input_size,
-	feature_size,
-};
-
-struct common_feature_property {
-	/* common properties */
-	u8 report_id;
-	u8 connection_type;
-	u8 report_state;
-	u8 power_state;
-	u8 sensor_state;
-	u32 report_interval;
-} __packed;
-
-struct common_input_property {
-	/* common properties */
-	u8 report_id;
-	u8 sensor_state;
-	u8 event_type;
-} __packed;
-
-struct accel3_feature_report {
-	struct common_feature_property common_property;
-	/* properties specific to this sensor */
-	u16 accel_change_sesnitivity;
-	s16 accel_sensitivity_max;
-	s16 accel_sensitivity_min;
-} __packed;
-
-struct accel3_input_report {
-	struct	common_input_property common_property;
-	/* values specific to this sensor */
-	int in_accel_x_value;
-	int in_accel_y_value;
-	int in_accel_z_value;
-	/* include if required to support the "shake" event */
-	u8 in_accel_shake_detection;
-} __packed;
-
-struct gyro_feature_report {
-	struct common_feature_property common_property;
-	/* properties specific to this sensor */
-	u16 gyro_change_sesnitivity;
-	s16 gyro_sensitivity_max;
-	s16 gyro_sensitivity_min;
-} __packed;
-
-struct gyro_input_report {
-	struct	common_input_property common_property;
-	/* values specific to this sensor */
-	int in_angel_x_value;
-	int in_angel_y_value;
-	int in_angel_z_value;
-} __packed;
-
-struct magno_feature_report {
-	struct common_feature_property common_property;
-	/*properties specific to this sensor */
-	u16 magno_headingchange_sensitivity;
-	s16 heading_min;
-	s16 heading_max;
-	u16 flux_change_sensitivity;
-	s16 flux_min;
-	s16 flux_max;
-} __packed;
-
-struct magno_input_report {
-	struct	common_input_property common_property;
-	int in_magno_x;
-	int in_magno_y;
-	int in_magno_z;
-	int in_magno_accuracy;
-} __packed;
-
-struct als_feature_report {
-	struct common_feature_property common_property;
-	/* properties specific to this sensor */
-	u16 als_change_sesnitivity;
-	s16 als_sensitivity_max;
-	s16 als_sensitivity_min;
-} __packed;
-
-struct als_input_report {
-	struct common_input_property common_property;
-	/* values specific to this sensor */
-	int illuminance_value;
-} __packed;
-
-int get_report_descriptor(int sensor_idx, u8 rep_desc[]);
-u32 get_descr_sz(int sensor_idx, int descriptor_name);
-u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report);
-u8 get_input_report(int sensor_idx, int report_id, u8 *input_report, u32 *sensor_virt_addr);
-#endif
-- 
2.30.0

