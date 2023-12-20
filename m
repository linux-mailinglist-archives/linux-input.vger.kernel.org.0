Return-Path: <linux-input+bounces-897-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 279438198EA
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 08:01:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B2AB21E3F
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 07:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32605168A9;
	Wed, 20 Dec 2023 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="XAt0ALyz"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DEA168C6
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 07:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z7qjaF61umv3HBOP0fnRzfiRPdoTj+il+DkwkblMd7vseKRQcngNTaxCg3P/Hv4VpgTySoah0G9HXi+kPdweM8+CwzFDTLwJBegwzJb8WtSxkNrQ9ge2LpQqrU0dIb/yHzjfBbEt6i78seH79HdXpSkAyz2MM5uigXzbLeb4DJ9mpN8JCljj5ta95YlcRt9SgpXLggN6KokGqIlkemAtpIxDTYQD3kIBZ9zrkwmkqC6PEplBxQaCV/N0QY8OGeZzyUcq9QM400ggwz77yvnzMat0iUW5MAoeF2Lv7D/Za6rBmf6EgEB+zgMedJuZQocaFORK3T4pTU+vAjrXIfi41w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJqAHrkb3JXMmEz1ipqt5ZDFStxT42M3d0SUfwiHCkY=;
 b=jMAvIUjzZWu3cNWjG+uaBeNrMdGO36Pekutdy++6gA3pQ2pCNAukEO7CS+s+plJY6epun5bBYS52AlV6rQ4DsR5Lz2CzWUzF4Cnpf0xcnUlHs1Vp7Ql5ATc5CjZjQfETqHuOOsvy3btjZ6+vxuN0HJ/Azck7TbZpcN8giM4Db4X+4rZn/m+YeNXYrUhzOkHBEpv232eLrpOfl7htQ+F6BwC5UrK4OfuxOKl5GNitiHhIGeYlfOGvAh71YKi/mKHew+FgmmQy+GKDX6w/NI0R8JYnOSW+oo0qtPsLjt9QWA7aq6mLpB10gfMPwYQwNANd4D9jJuiLOPcVM0dUX3cIgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJqAHrkb3JXMmEz1ipqt5ZDFStxT42M3d0SUfwiHCkY=;
 b=XAt0ALyzYcH4eaEF84dFRJAaAQPtYc9KVhmtfohy3tEEduBbvNFcgIbeRIqPiguEr7TTfVnFhCwmYRsNxDXUslY2xH1lf5efcd7j3w4FD1kTETH89pBiYMGzmnORYA59F+mekx1CdrQuEmzHzapdX5wjsz3Y3RjUBZZJiGMLomE=
Received: from DM6PR18CA0010.namprd18.prod.outlook.com (2603:10b6:5:15b::23)
 by BN9PR12MB5225.namprd12.prod.outlook.com (2603:10b6:408:11e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 07:01:14 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::d9) by DM6PR18CA0010.outlook.office365.com
 (2603:10b6:5:15b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 07:01:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 07:01:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 01:01:11 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>, <Shyam-sundar.S-k@amd.com>,
	<linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/3] HID: amd_sfh: rename float_to_int() to amd_sfh_float_to_int()
Date: Wed, 20 Dec 2023 12:30:40 +0530
Message-ID: <20231220070042.610455-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
References: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|BN9PR12MB5225:EE_
X-MS-Office365-Filtering-Correlation-Id: 13307a9f-abc0-4321-b4a7-08dc012974e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	alvkfurs87TFo6ceaXdAYG5caXxCy/e/dKQ8uqQlfO+6pOAvb2f53l2PXKy+yC030KaQ3/Tji9QaCZJzZhnXilnQMs480tGhK3teP7Gx20po8UdQcb9voBpGJedCV4JW1uaeJQojsgvnDRqccaXcpI6INQ3Me1/9yvWsiz66hz3kT2XY14K6Iyb4PgvsQOxRt2aIPDeK1C6LAtMr7giut4FeBflR4nqguwhRFkbgSik0DFk/s2bjZzl+WaGdab0vaA7Cl7IyX8FqmdLVVhRtx91c1/2KDFAgLkllMDAGrM+ibshheh/GToep+3/FVt4ADWzQz1GTBbp5ic7MQAIt7+0kHJYheUBNid/d638peIu/iuSJC12YrAAt536HHjPwj5egbOPWElPki8zRtBO0bG9Gu6P+d5uw2z7C/0VzUBdy3tVz4zg5bi0iWH4awuuU0lpE2UvECHCS31xFlDA0kBiJ+d4sARgIi7mFzJZEPQYfdd6M08RLiE+lkOPQVk0lCbzQ9PO402Olgaa4SFCyu0q4iNPc7hwdO2eqKdLkXrwxGUwFPLu4F6ZdOf4i5OIxCjIkTxOsx1MGBZAG1nty9iHVnGZWB7ZIxArMMBb5iC92yh5bB8f8jmMgKC8fh6zXQNlxpV7MRexvSSNKIiLZlT+z6i2BU7rWhaDPB+pVupe1KHbwpuJPIm9xZmgkxZLeViXUYc806av1/P6zmTMaJIkbG4Vw6uAOJ6ymo1xXbRZLN0fASwO5ihEo5rDHR+OZNWH4HywQxTu4P+BzjOGt1Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(396003)(136003)(376002)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(5660300002)(2906002)(40460700003)(41300700001)(81166007)(356005)(36756003)(110136005)(86362001)(82740400003)(966005)(26005)(426003)(66574015)(1076003)(2616005)(16526019)(478600001)(6666004)(336012)(47076005)(7696005)(36860700001)(83380400001)(8936002)(4326008)(8676002)(70206006)(70586007)(316002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 07:01:14.5287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13307a9f-abc0-4321-b4a7-08dc012974e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5225

Current amd_sfh driver has float_to_int() to convert units from
float to int. This is fine until this function gets called outside of
the current scope of file.

Add a prefix "amd_sfh" to float_to_int() so that function represents
the driver name. This function will be called by multiple callers in the
next patch.

Link: https://lore.kernel.org/all/ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com/
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


