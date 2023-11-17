Return-Path: <linux-input+bounces-107-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3577EED5B
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B52EB1F261CF
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14DBBFBEB;
	Fri, 17 Nov 2023 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="1LJI0Zo0"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A22A8;
	Fri, 17 Nov 2023 00:12:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEBHoRrQgFfr9PJAjZrD7XglN6HjxmSAAUGdlB6mT5PEytap391EeAVfIqQh3Q7pH90LGaplMNy4P/+vwnEouIVXgaEPcKym8cw5gsManegXmYzCtes60oy7sO8Zmdrvyt/F6Ty6UCCDfGSZSmcdYZAUZBQXhYfeJQDOrz+U5YWkA22Vk7kqiaJv1qFWaMEUJfyIA/QBRMGtCOzSUYEyOl+Ky/CziKEtgeDBd7jahlMGhPMDxuj1wnRyTHEWKgAdkWiXrx1VXoPInPzJ8gSetRMHvcmzT+I8rPM3PsnPEaiZTzDOtW5CTiVId1vKYpfqr/I5pU0XGFlbQ/mcJYoezQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFs21D8IGCCzUGPhIWcpxeQTZQcQGApSNbttpw7ZgBI=;
 b=BIYcmFV97Iv8Z34pNWlNtWxrXY8JZdKp6IRYDGh5bDFjkkckYhp+65irt5yTXZEbud421bm9FHLjF9lgPGEwOH6PDwgJryqeu8TsmjqBkfSr1Z0smP1wOUa8k1DWwb7K+rpWiQLcNdiAhvNjo7aOPJTpLtyN6fireJDQXj9O+YasYiUok3lAk+dHsH3Sthva71W05QpXrOGWh6JADGHsleBKiFzrfCnuS08u15U9emSq4nySDxQiaOKt8+mF/yHdHWRQXSlL+26XdA+qiITWsHbbZ0ScdyLc3cQj+AQ+sbcbw7LT6KrJ9WBOOkPika7VoKycrwsFWKDpcnNcY+nVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFs21D8IGCCzUGPhIWcpxeQTZQcQGApSNbttpw7ZgBI=;
 b=1LJI0Zo0WWvLmk07W8OhENGStmrzRogc/rlfmiq19ayGGsSeHcsYOETpzwftByxboqYbq86haznwHaKdevDzUb57WYbCJl97qkbIhGdbO/AkSwPApMV7FhWzS/DxzM5jrvFRuMZL4f9D0QEyHwTDE0t74HWGTV4ia29FFBcgqdE=
Received: from SA1P222CA0174.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::23)
 by IA0PR12MB8932.namprd12.prod.outlook.com (2603:10b6:208:492::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 08:11:59 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::56) by SA1P222CA0174.outlook.office365.com
 (2603:10b6:806:3c3::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:11:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:55 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 15/17] HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
Date: Fri, 17 Nov 2023 13:37:45 +0530
Message-ID: <20231117080747.3643990-16-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|IA0PR12MB8932:EE_
X-MS-Office365-Filtering-Correlation-Id: db188a2c-a166-4afc-f07d-08dbe744df04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WXZog4XAFhaO1mhPkCdZW1ubNGiJvK6zMBc8VLhE8jIXy0oH/KLx8JTqMiqEnCuUrAGj55xYkeEK0B173b775YfGEb6SC4YVJoI94QnNli5ETov3k78IlCaas5JSlq1CxatSX9CatlGIcV/MEONDIGx/X36pY+/haSOq8PCw9K+Wm1JGM3FqzzDavKfmNbWIMGspDetqRk9VMKRCdExhMbqMK88ZNR6wG1oycQKuDtROpOaoPmbfc+MmNV20cY1PuLwD8wXGVle4A7ayTybpB6SzVytGY24jv59LrSskS8/ewoTB6T4wUnLFeqbf08nzW3TJFnMb/DFxJ1XIkZxO2NdKHkUGQw9A7hJ32c9Vi2yDaqBXbexyVnoD1hhgmjBMCGao15hiPZuiiTh0JUiXxG/lduBHrHGLXPbC0o9iQV/pBEE8Av9E3uAI+qMtdIUlNXB9PWjPOan7JJqK6C057L5B+mA3wCgxlHCIKQHSqMWhu5LEE3EjtLsH/Z22Bks7WUy7ZwN3sMe+7S3F4QJhYXkkgZE6ovpSoOOQle4LGOLTn2IDNJ39sx6IBYZtAfux3GvAj7o9+RLkKsDsWYFmi9U+e2Wt4IUjp70ZbKb9zfCFR07GTXvacRaLrpbeNEEB6F6gr9z4WxRxSQv04t3wER9ssyxPMTsUO+qIwemjggpuib/oEhYiQvxIh4Cwmp/gt17jtE+Bk1xgWYCCKk0qFzK9FBIT8zCayW7/PnwX9VjCDNn7Bx+rQYCV9oGFSb5YOcy16SKepFZrn0AmnsH4Ew==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(376002)(396003)(230922051799003)(82310400011)(1800799009)(451199024)(64100799003)(186009)(46966006)(36840700001)(40470700004)(82740400003)(356005)(81166007)(5660300002)(2906002)(40480700001)(47076005)(86362001)(8676002)(4326008)(36860700001)(8936002)(41300700001)(2616005)(316002)(54906003)(40460700003)(70586007)(70206006)(110136005)(426003)(66574015)(336012)(1076003)(478600001)(16526019)(83380400001)(26005)(36756003)(7696005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:58.7867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db188a2c-a166-4afc-f07d-08dbe744df04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8932

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

Current amd_sfh driver has float_to_int() to convert units from
float to int. This is fine until this function gets called outside of
the current scope of file.

Add a prefix "amd_sfh" to float_to_int() so that function represents
the driver name. This function will be called by multiple callers in the
next patch.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 28 ++++++++++---------
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 8a037de08e92..33fbdde8aff0 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,7 +132,7 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int float_to_int(u32 flt32_val)
+int amd_sfh_float_to_int(u32 flt32_val)
 {
 	int fraction, shift, mantissa, sign, exp, zeropre;
 
@@ -201,9 +201,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&accel_data, sensoraddr, sizeof(struct sfh_accel_data));
 		get_common_inputs(&acc_input.common_property, report_id);
-		acc_input.in_accel_x_value = float_to_int(accel_data.acceldata.x) / 100;
-		acc_input.in_accel_y_value = float_to_int(accel_data.acceldata.y) / 100;
-		acc_input.in_accel_z_value = float_to_int(accel_data.acceldata.z) / 100;
+		acc_input.in_accel_x_value = amd_sfh_float_to_int(accel_data.acceldata.x) / 100;
+		acc_input.in_accel_y_value = amd_sfh_float_to_int(accel_data.acceldata.y) / 100;
+		acc_input.in_accel_z_value = amd_sfh_float_to_int(accel_data.acceldata.z) / 100;
 		memcpy(input_report, &acc_input, sizeof(acc_input));
 		report_size = sizeof(acc_input);
 		break;
@@ -212,9 +212,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&gyro_data, sensoraddr, sizeof(struct sfh_gyro_data));
 		get_common_inputs(&gyro_input.common_property, report_id);
-		gyro_input.in_angel_x_value = float_to_int(gyro_data.gyrodata.x) / 1000;
-		gyro_input.in_angel_y_value = float_to_int(gyro_data.gyrodata.y) / 1000;
-		gyro_input.in_angel_z_value = float_to_int(gyro_data.gyrodata.z) / 1000;
+		gyro_input.in_angel_x_value = amd_sfh_float_to_int(gyro_data.gyrodata.x) / 1000;
+		gyro_input.in_angel_y_value = amd_sfh_float_to_int(gyro_data.gyrodata.y) / 1000;
+		gyro_input.in_angel_z_value = amd_sfh_float_to_int(gyro_data.gyrodata.z) / 1000;
 		memcpy(input_report, &gyro_input, sizeof(gyro_input));
 		report_size = sizeof(gyro_input);
 		break;
@@ -223,9 +223,9 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&mag_data, sensoraddr, sizeof(struct sfh_mag_data));
 		get_common_inputs(&magno_input.common_property, report_id);
-		magno_input.in_magno_x = float_to_int(mag_data.magdata.x) / 100;
-		magno_input.in_magno_y = float_to_int(mag_data.magdata.y) / 100;
-		magno_input.in_magno_z = float_to_int(mag_data.magdata.z) / 100;
+		magno_input.in_magno_x = amd_sfh_float_to_int(mag_data.magdata.x) / 100;
+		magno_input.in_magno_y = amd_sfh_float_to_int(mag_data.magdata.y) / 100;
+		magno_input.in_magno_z = amd_sfh_float_to_int(mag_data.magdata.z) / 100;
 		magno_input.in_magno_accuracy = mag_data.accuracy / 100;
 		memcpy(input_report, &magno_input, sizeof(magno_input));
 		report_size = sizeof(magno_input);
@@ -235,13 +235,15 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 			     OFFSET_SENSOR_DATA_DEFAULT;
 		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
 		get_common_inputs(&als_input.common_property, report_id);
-		als_input.illuminance_value = float_to_int(als_data.lux);
+		als_input.illuminance_value = amd_sfh_float_to_int(als_data.lux);
 
 		memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
 		if (binfo.sbase.s_prop[ALS_IDX].sf.feat & 0x2) {
 			als_input.light_color_temp = als_data.light_color_temp;
-			als_input.chromaticity_x_value = float_to_int(als_data.chromaticity_x);
-			als_input.chromaticity_y_value = float_to_int(als_data.chromaticity_y);
+			als_input.chromaticity_x_value =
+				amd_sfh_float_to_int(als_data.chromaticity_x);
+			als_input.chromaticity_y_value =
+				amd_sfh_float_to_int(als_data.chromaticity_y);
 		}
 
 		report_size = sizeof(als_input);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 656c3e95ef8c..75267b0fec70 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -166,4 +166,5 @@ struct hpd_status {
 
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
+int amd_sfh_float_to_int(u32 flt32_val);
 #endif
-- 
2.25.1


