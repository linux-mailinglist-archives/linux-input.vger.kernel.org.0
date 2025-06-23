Return-Path: <linux-input+bounces-12995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 503D8AE3920
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 10:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44F383A3A6D
	for <lists+linux-input@lfdr.de>; Mon, 23 Jun 2025 08:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D6191DF75A;
	Mon, 23 Jun 2025 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="371lZhq5"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2082.outbound.protection.outlook.com [40.107.102.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6405379F2
	for <linux-input@vger.kernel.org>; Mon, 23 Jun 2025 08:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668927; cv=fail; b=KlTrx4iHXJ9ds+rYnSIw9cZHuZtfzcP7Psu3yFTeFlmzVks6a4pfLoRibT3X/8xHNhFdXcNmjiSwmEEaff3ZpWj+9OPnnOCBOIoab/L4ltQnlOPI+JUL7oh9vD99V301fw0+PoFaXZG6BPbZzd6dTo0z86Mv8e0TUS/HDw+D8OE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668927; c=relaxed/simple;
	bh=SyGhHvcijcB424mhfv96r3vl3B9QO3Oz5T1fifjP+rQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mqAeH3SVdoIrXpzpTzAWESEOXFLi6CW3ku7HB8Z/xDEVXomQ/FbHfTR4FcLOQYg9+c7FDxF586sFFeHbkKr/Rcvs+MFznoxGcZtiPxa4rU0GNxxTP/I0Nk1dS1pqMuj9sE2TvgldjpVDUtWiM0M7IdDDWb55FP6Im2igqn+XWBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=371lZhq5; arc=fail smtp.client-ip=40.107.102.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/tKw7ow6riB9Z4Z89Vb1ROZmnRNHU1AUco/Bjv8u3zYePGssSYnrG18MNai/M9/GPG8WcoLnEeIoGEkB8SOZkiNkJmZXwqPV1g1pBW6SOB6NDa3qPE8sj4blJAeml5HLSA5GZ6QuLDQqWxJmhcNRjeUJkvFoguigg4XR3lRXRVuHiUoY0D54HBrbTzWdKWYR2IeDtE4UCOtF5qiVPuYZTrwBRfZfzFDfgeL7QtLy5GuaW6Xp4eCfjmH2gzYdSKZaE8ZQrXowDZR/2UT1j5fV820Z4W9BwdEVEJv7VmcPJEavy6QFMKmfsultSnKusVUF2TuiO7gzh3X4tvQLODNuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SjvvdakTUlwozCtMGPpMf0BHCWfWCcIt+H3IdEFiO+o=;
 b=Kz0hdE2CHsDHZ1qP+kOyXLMwGkYzcNHnnjXw8O9npNcANR8IigUK3UlgO1ZTG5m/9SVO8iRmIHNi4j7xj393oxLLFqoAenmYMfqtBAj6EeZ/LA5KVHSc0PqRJPjO/LL1+9/sBWhzfY/42jJSWIrTkfIIlnXDIowz1ABi26jdbeoh+NNjHrDCGhXFWB753mi2yfdruE8/M88oTofeCLDmlFVhg3qBwdHXBOV4J4nraAroNZ8kmwCjExDPqqaf8tyIZ8y5t/ZHQtSUtpAGbttZPlwMt4Piqfb5LMNud0sfaBi/B5S1EVkQc/CShS14H+J7aT0RV2VYM0SFEPoTnT4tsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SjvvdakTUlwozCtMGPpMf0BHCWfWCcIt+H3IdEFiO+o=;
 b=371lZhq53bJtp/SdE93+HiDOZwfo+NaTvdJSVfRybjVr2V01lQE1lSfUUmGec2G6xmEUeSoddo/y/rXf8UIUlWKo9SBzK3hnx33LKw85B+I/W2SFAOAsh3FIKM4qR8AEzZNl5wXtiLvz68WKcGjWZ/Sfxv9pNX0h3P/kMlYVbn8=
Received: from BN9P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::7)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Mon, 23 Jun
 2025 08:55:23 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::9e) by BN9P222CA0002.outlook.office365.com
 (2603:10b6:408:10c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 08:55:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.1 via Frontend Transport; Mon, 23 Jun 2025 08:55:22 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 03:55:20 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>
CC: <Mario.Limonciello@amd.com>, <linux-input@vger.kernel.org>, "Basavaraj
 Natikar" <Basavaraj.Natikar@amd.com>, Eric Naim <dnaim@cachyos.org>, "Akshata
 MukundShetty" <akshata.mukundshetty@amd.com>
Subject: [PATCH v2] HID: amd_sfh: Enable operating mode
Date: Mon, 23 Jun 2025 14:24:53 +0530
Message-ID: <20250623085453.2267034-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4ecc0d-2815-4819-7511-08ddb233b055
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C5uvoz0iTOXVwtEBj4bIsnAuyh7z3q+JGNHJUfuk89cQn678XoXLGD08UrVg?=
 =?us-ascii?Q?6Hyi50Zv1gzaa0viit5pNZyjl8A935VFW5J96/0MYBgbZ1Gsc2o7v3pBJslq?=
 =?us-ascii?Q?Bw7WKveDChu7DaHjlW+E47vVCAH1Q/GDO1OMHoNQaC1Je3O1sJ7jwNq2k+Ua?=
 =?us-ascii?Q?Lx3wJ38pIm3ymuALHlVipaBNECeW4V4dmi8WR22l/ubhZv757cjrMN9jsw5o?=
 =?us-ascii?Q?7gDb5Upk5DbFLtXLK+EU3mauxB0sMnKIoDfczpJ05uNzJk9/dIE1cN32PzJj?=
 =?us-ascii?Q?m/yvMcmM59NICxBe1seg1lU/Lo1dZveOXEB7wtq2ETdxRmAjnpbpwuhlAgQH?=
 =?us-ascii?Q?QN9+RGoy4RnAhl0z6Afw3xoNykAzQctZqaa/i5qDcpJM88Bjubv2/Kz7kRJA?=
 =?us-ascii?Q?5vVAi3Yfo+sr+jDNOtPINVg/7wNzBYkupVSPtRZNZQ9yuxZcTnlqu182mLlT?=
 =?us-ascii?Q?DbkSNzig/IsMEFKg0tFoEZebQs+q+hwTPqiDrcSXriIzLCuFDaZ7KQE9eVVV?=
 =?us-ascii?Q?g5CLnfgAKACYnxSwV+cUQTBFPZMz4RGp8HB2i1Z+QDx4QMZTE64ChReoGXb0?=
 =?us-ascii?Q?fCsdrE49HnKJEfbgOtXmq87SMoQV/PTsS8Bukf8r0gEfZ67Y0a5fzn1T3qZx?=
 =?us-ascii?Q?Srr6j1zt068sCMeUYF8FBhcsfEpDcyPOAG5xU4oMhX4uRzsBUDcvrTfmOMo2?=
 =?us-ascii?Q?aFqOWpQ9Jb8fi3VC5lHIi8ERNVkJz5e79H0IakeWTbRxmJ7hmkUV/rrxyzWH?=
 =?us-ascii?Q?88N7P1NsYxRG/qUD13W1BlGSCyr1zEUyPTg1VrLIdVvqxBpnQRWH7P+/W2D/?=
 =?us-ascii?Q?nDpAemcFd7ryiwkiZwieoTHq/LAKmlrYpHSMFbB2EQk2zi0HnfR9epYlzzlD?=
 =?us-ascii?Q?6mWwUOtHRq/m9pN5DEYSQefPtvAZ1rJiKH2JeZ2mrO/e+LN0nEr5ZbEuEB9W?=
 =?us-ascii?Q?lixsUl3PGG3rdAq+djBd5DhJFcHel0zdRTn3ZIi95GK53r60ZCtPKwTo3gFU?=
 =?us-ascii?Q?Z1kF7EJl2OAEv4obDgLLSYS8PBFNvWEOuR6SbFo9v3+ZU8NsSjksIhAQsq7J?=
 =?us-ascii?Q?568IRlXWgSUtWuFIwch9USVEMCOd3lxDRtaT8eQCxgd/nmai7jjmafU+vRri?=
 =?us-ascii?Q?Zyuc9wHVonGghE2GgnWSmu8H2AvYts9Wwd3Vd09FozCLdsulSELPlTbh/Mj2?=
 =?us-ascii?Q?Uoce2Ln2jAxsPby7f46kqjjhmltgHo89SsQWQo/AYliG7mWjmQwlc8gZXxKV?=
 =?us-ascii?Q?R0Hltc1LnQPFdh63wYbHOeAqmivEcMbcaxjAVBHEh1VA4d8IuodWdOEc3Nh6?=
 =?us-ascii?Q?iOpK+myW+BAoDt8prI0u+wLUXlMbQUZ4bHHA6aoONvorzT8I+c0ijUD8+G1/?=
 =?us-ascii?Q?mxNguzQQ3A5Qglwsi8wcr2+Om1mGcmD4ePOD5HVvFesKTAjJkrarDd/ADvCI?=
 =?us-ascii?Q?S5/85f7FRwUHDYu3dW2ujci79EGgjf5F3CEm8Iz+cAwNowhP2ab90WHRU7p5?=
 =?us-ascii?Q?K1Wr02cxijYNNwS+yh6JNU3tUOtQyTFipvE7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 08:55:22.7526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4ecc0d-2815-4819-7511-08ddb233b055
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510

Add changes to enable operating modes in the driver to allow the FW to
activate and retrieve data from relevant sensors. This enables the FW to
take necessary actions based on the operating modes.

Tested-by: Eric Naim <dnaim@cachyos.org>
Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
v2: 
* Increased missing device count.
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 23 +++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h    |  2 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
 4 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3438d392920f..0f2cbae39b2b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
 		return "gyroscope";
 	case mag_idx:
 		return "magnetometer";
+	case op_idx:
+		return "operating-mode";
 	case als_idx:
 	case ACS_IDX: /* ambient color sensor */
 		return "ALS";
@@ -243,6 +245,20 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = -ENOMEM;
 			goto cleanup;
 		}
+
+		if (cl_data->sensor_idx[i] == op_idx) {
+			info.period = AMD_SFH_IDLE_LOOP;
+			info.sensor_idx = cl_data->sensor_idx[i];
+			info.dma_address = cl_data->sensor_dma_addr[i];
+			mp2_ops->start(privdata, info);
+			cl_data->sensor_sts[i] = amd_sfh_wait_for_response(privdata,
+									   cl_data->sensor_idx[i],
+									   SENSOR_ENABLED);
+			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
+				cl_data->is_any_sensor_enabled = true;
+			continue;
+		}
+
 		cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
@@ -303,6 +319,13 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->cur_hid_dev = i;
+		if (cl_data->sensor_idx[i] == op_idx) {
+			dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+			continue;
+		}
+
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index 1c91be8daedd..7452b0302953 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -11,7 +11,7 @@
 #ifndef AMDSFH_HID_H
 #define AMDSFH_HID_H
 
-#define MAX_HID_DEVICES		6
+#define MAX_HID_DEVICES		7
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 1c1fd63330c9..2983af969579 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -29,6 +29,7 @@
 #define ACEL_EN		BIT(0)
 #define GYRO_EN		BIT(1)
 #define MAGNO_EN	BIT(2)
+#define OP_EN		BIT(15)
 #define HPD_EN		BIT(16)
 #define ALS_EN		BIT(19)
 #define ACS_EN		BIT(22)
@@ -232,6 +233,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (MAGNO_EN & activestatus)
 		sensor_id[num_of_sensors++] = mag_idx;
 
+	if (OP_EN & activestatus)
+		sensor_id[num_of_sensors++] = op_idx;
+
 	if (ALS_EN & activestatus)
 		sensor_id[num_of_sensors++] = als_idx;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 05e400a4a83e..2eb61f4e8434 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -79,6 +79,7 @@ enum sensor_idx {
 	accel_idx = 0,
 	gyro_idx = 1,
 	mag_idx = 2,
+	op_idx = 15,
 	als_idx = 19
 };
 
-- 
2.34.1


