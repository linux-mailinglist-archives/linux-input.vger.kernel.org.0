Return-Path: <linux-input+bounces-8628-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB89F4F32
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 16:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05D5618824EA
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 15:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F681F7566;
	Tue, 17 Dec 2024 15:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FFi8yAp8"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F281F7086;
	Tue, 17 Dec 2024 15:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448629; cv=fail; b=oyz3fRryYDx+2Kyz2oZit18HSMpiASq4lEbUFP8ZW6vHb9RKI96fcMk704VPeeMEaezUcEfqq35YtaM/v2TWioz3g3TBpg+ZFNyQEGbc7rQvBjUaKn4cPsfL9H1mKVlhRSkjuHbWo2bn+NBiujfAA6bJL6xI8K/hE2Yo2m46FP8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448629; c=relaxed/simple;
	bh=xPQQRauXJ+OUMUt4XlY8sMsQQbF7JDx2sIM8JsZhB28=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kHCM770OOwJDTY159k4pmQiCVH2Py7h3io0s+np3vtUSywros86ZXRDxdMu0U8kCvDBUmTBv5UJMXGQ8bZyMQWXT67ugnq86bowvvu3IGgXm1xXvF2Rs4MZpvGyfdAmVYJ0NkieI3fYH1269kFsI5RNM8AW+3/KxGK7p+y/ZkxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FFi8yAp8; arc=fail smtp.client-ip=40.107.243.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ayAf8O98cgnkWRO+2ylolMMNCsPsxuHzfVSifdM1B123dc8VgOYsxVl45j50DiBTHkjWDbKQr94iBDE/H4l6KHfb69oTwTKOElNGZ2aJOEP2Cgi0whKZmfjCb6Pl+Z7eegpxtS3gT3d/zQwJhqDpktSCeaunNOiTuSyRUfL9kNaFC1PbADEubfyaZV1jfu9XC10RoJ0SW3TVAzQuT7MIHl1m2RwKrcUeN51ZgiWAAVVybXmwjvHu7hLl629dEBPF1fXQV84EbFWpnanRekrnbGhirDX2JgElcMf52fkNmrYxAUKvEz8OEcihwWJzw8X1Yq/aVaxBwpyR7ig98k4Mjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fed0ZNVC0K7E9V3PlXtqUsro1XQm/h9zmwr7m4uxb6g=;
 b=cqZqvvF06JHE5UftiOXUnjB61sYY+KVnnMRFxIRgbarvzCbMeRhabWz5hilAYWBlmugW4G2SRlG0YyN5H3Klm228Q/SNosg+seESKQjFvl4ogy95XyWOSu4zZIV3YJmcYo4M3UP6oEQBmYx7L+PZ3j6nqZlKKe3Iz9A1z8WVJuEu6u0iUg+QVuN31xeUpcBAflMazWuvyZeR+lmABLhBXl4+EfEz48nB8E6lL8pWEO3iRQxM4ZiLRPJynl118b2qRG/fG2DsdNhx9Cr+We5voynPm8HdMOwjJLBkAf3dCbc4TRNkkCWkggluTWC1IhQzP/HWaC0mIcn+1D89MGRqQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fed0ZNVC0K7E9V3PlXtqUsro1XQm/h9zmwr7m4uxb6g=;
 b=FFi8yAp8JSB45NhfRygDfxVmgtsasODDBhy8AVMLdCdFki63m5FMS7/iOgUCxLnWVdo+B68cmX9Qw8t4PYgYqGDpbRWQEaJi/44ZKqboKmAs5EjH5DMAad50fGIEXenFAQsK4QyxthdPBbO4MgByijOq5SdVRhWAMEgpYD0zV/U=
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by MN2PR12MB4174.namprd12.prod.outlook.com (2603:10b6:208:15f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 15:17:02 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::75) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Tue,
 17 Dec 2024 15:17:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 15:17:02 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Dec
 2024 09:16:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>, Patil Rajesh Reddy <patreddy@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2 1/2] HID: amd_sfh: Add support to export device operating states
Date: Tue, 17 Dec 2024 20:46:26 +0530
Message-ID: <20241217151627.757477-2-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
References: <20241217151627.757477-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|MN2PR12MB4174:EE_
X-MS-Office365-Filtering-Correlation-Id: 46b1792a-3145-4672-3faa-08dd1eaddc23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kS9TWWs8UzuJ/nCAIPURIH+itZ9ds02iLKI6eLTRy3zobTKab5BpCEFBcba7?=
 =?us-ascii?Q?ZNvl/XjsvKliBQjRnuS/Tu3RrcGFHFoh/NfHz581eUqkqI4etLgdLfJLFtQx?=
 =?us-ascii?Q?kP054BK5zAVwXZVmQFbh9BSUZVM/VBHt9n/4SYl/50SSAVLGNCrKXQh3rSgc?=
 =?us-ascii?Q?diA7fTFylEUrg/Fu6PoeRjw8uP1hJW0zXQk24Hm/vlfZ06riCAGTEMKRav+f?=
 =?us-ascii?Q?a8xhFYPNXb+vS6zV5AkK8Li3zsHszgsvycouMx9rAtcgHky6wU11+ILtH1ib?=
 =?us-ascii?Q?wh34gl9cliN5lirnT2x22Icy7XVh9+ZWLNBmFGLN1IdZfNhWLZL+uA4//4NG?=
 =?us-ascii?Q?sybYH9t/7uxLLMX84VQmk1QLm8VYSB+Vex5bAnXFkF+ec5kuOKbKVwZpSnX8?=
 =?us-ascii?Q?mZFFZdeD2mairhifvUhq1l5GI7Yvw7UQZrXEJkzkPZA4Dv9CHaKqIX3nE6+E?=
 =?us-ascii?Q?dry9ixdcT5M5apZImu6+i91FLeNc5KAT/v71KsnAiLCBx7xC6n2RhdQZRoXV?=
 =?us-ascii?Q?uGnGu3LH9Cm31/pBA+KQBTBFvcspr75hyG5RQq3SbthMeniDY8J3H36C6ban?=
 =?us-ascii?Q?wG2FFE0cITqWKt+HsH4LOlGFXptVcAHcm3vpeK72IX/UqJFsY1iekQELI5KM?=
 =?us-ascii?Q?Yfv2gwfT/UXYCycDTioDnLtYjDM7a1wPQplT+z9UoH3MZIjzeXa1HVg9k70A?=
 =?us-ascii?Q?OcS5PK/+Ms6RP+jUmPtz42+QVE74aNW0v3QElRJErFmNCLvFYjdi4LHEBaTA?=
 =?us-ascii?Q?RsXtN2m+TjXrL+ZNtTGOy/oPKbg6lKGhmaHxTacDwxWJlCzZZX/0Z+2Cj6rY?=
 =?us-ascii?Q?QOQExM0ZeTaCz7yyFkexwvTr/29I93C2QrDYN8ByDTr5+R0ZZroFm81gsqzn?=
 =?us-ascii?Q?x4wNjYn6OwkeEN4mF9FYH3XkiDEYUBDBe1R/dX5t0zNqEGCDohf9uGw4NMp8?=
 =?us-ascii?Q?EIaYL/FG5eAgLoniSmThGDyeUzAFtvUdfWe+DJSj/rA+latatspTFMgWZqwI?=
 =?us-ascii?Q?20x+4pVaC35vjqOGyJAzKepHDPgE2kBBzZAThNJEe93Fm/j+eMAD/mSt9l1C?=
 =?us-ascii?Q?uEKnsPd41rbyse39DabXn5SEos0N7QpQUpU5gvqL5WHdpmEtCVCdDfwzJ66G?=
 =?us-ascii?Q?CK1Rpd/Ggh/2ywj3NN6oiyVT1K85KU5KRAdu8rZhaOjfA4UngzQOeJpbEkN8?=
 =?us-ascii?Q?jTBMMhqyo1pt6MBccC1oYCj+VuYL4hlo+G0ZTz57kUju+K4CLx8bTiA7TVdc?=
 =?us-ascii?Q?/qSf115eHTu4ILkkixWqkvebWzotDlRmvrtQZqu8SQpG16gkbgCveVkYrzUh?=
 =?us-ascii?Q?BE4NZrq0C7EP5POMIJiqlvfwl4012vzL/XfkpRfa5BHcXloVU9567MeUI3av?=
 =?us-ascii?Q?3Ey18F2bmOnJFLu7Mgjaq3lHrP9+Wf9CL9hkKmaVoOy6TV3Px0oK1QFHa+/V?=
 =?us-ascii?Q?3r6Kji68F2OdQFKN3dYJk+hWXFZATR6/5mhrGXFZD2ueW3nTrp4eERleVhXo?=
 =?us-ascii?Q?7UvIBCqO3eTc4Ik=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:17:02.6388
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b1792a-3145-4672-3faa-08dd1eaddc23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4174

From: Basavaraj Natikar <basavaraj.natikar@amd.com>

Add support to export device operating states, such as laptop placement,
platform types and propagate this data to AMD PMF driver for use in
actions.

To retrieve the device operating states data, SRA sensor support need to
be enabled in AMD SFH driver. So add support to enable the SRA sensor.

Also, remove explicit assignments to sensor_index enum.

Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 +++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 38 +++++++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 24 +++++++++++-
 include/linux/amd-pmf-io.h                    | 15 ++++++++
 5 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index e5620d7db569..799b8686a88a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -43,6 +43,7 @@ struct amd_mp2_sensor_info {
 struct sfh_dev_status {
 	bool is_hpd_present;
 	bool is_als_present;
+	bool is_sra_present;
 };
 
 struct amd_mp2_dev {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index db36d87d5634..03c028f1aab4 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -30,6 +30,7 @@ static int amd_sfh_get_sensor_num(struct amd_mp2_dev *mp2, u8 *sensor_id)
 		case ACCEL_IDX:
 		case GYRO_IDX:
 		case MAG_IDX:
+		case SRA_IDX:
 		case ALS_IDX:
 		case HPD_IDX:
 			if (BIT(i) & slist->sl.sensors)
@@ -58,6 +59,8 @@ static const char *get_sensor_name(int idx)
 		return "gyroscope";
 	case MAG_IDX:
 		return "magnetometer";
+	case SRA_IDX:
+		return "SRA";
 	case ALS_IDX:
 		return "ALS";
 	case HPD_IDX:
@@ -130,6 +133,23 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->sensor_sts[i] = SENSOR_DISABLED;
+
+		if (cl_data->num_hid_devices == 1 && cl_data->sensor_idx[0] == SRA_IDX)
+			break;
+
+		if (cl_data->sensor_idx[i] == SRA_IDX) {
+			info.sensor_idx = cl_data->sensor_idx[i];
+			writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
+			mp2_ops->start(privdata, info);
+			status = amd_sfh_wait_for_response
+				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
+
+			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
+			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
+				privdata->dev_en.is_sra_present = true;
+			continue;
+		}
+
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
 		cl_idx = cl_data->sensor_idx[i];
@@ -181,6 +201,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	}
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_idx[i] == SRA_IDX)
+			continue;
 		cl_data->cur_hid_dev = i;
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			cl_data->is_any_sensor_enabled = true;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4676f060da26..ffb98b4c36cb 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -87,6 +87,41 @@ void sfh_interface_init(struct amd_mp2_dev *mp2)
 	emp2 = mp2;
 }
 
+static int amd_sfh_mode_info(u32 *platform_type, u32 *laptop_placement)
+{
+	struct sfh_op_mode mode;
+
+	if (!platform_type || !laptop_placement)
+		return -EINVAL;
+
+	if (!emp2 || !emp2->dev_en.is_sra_present)
+		return -ENODEV;
+
+	mode.val = readl(emp2->mmio + amd_get_c2p_val(emp2, 3));
+
+	*platform_type = mode.op_mode.devicemode;
+
+	if (mode.op_mode.ontablestate == 1) {
+		*laptop_placement = ON_TABLE;
+	} else if (mode.op_mode.ontablestate == 2) {
+		*laptop_placement = ON_LAP_MOTION;
+	} else if (mode.op_mode.inbagstate == 1) {
+		*laptop_placement = IN_BAG;
+	} else if (mode.op_mode.outbagstate == 1) {
+		*laptop_placement = OUT_OF_BAG;
+	} else if (mode.op_mode.ontablestate == 0 || mode.op_mode.inbagstate == 0 ||
+		 mode.op_mode.outbagstate == 0) {
+		*laptop_placement = LP_UNKNOWN;
+		pr_warn_once("Unknown laptop placement\n");
+	} else if (mode.op_mode.ontablestate == 3 || mode.op_mode.inbagstate == 3 ||
+		 mode.op_mode.outbagstate == 3) {
+		*laptop_placement = LP_UNDEFINED;
+		pr_warn_once("Undefined laptop placement\n");
+	}
+
+	return 0;
+}
+
 static int amd_sfh_hpd_info(u8 *user_present)
 {
 	struct hpd_status hpdstatus;
@@ -131,6 +166,9 @@ int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
 			return amd_sfh_hpd_info(&sfh_info->user_present);
 		case MT_ALS:
 			return amd_sfh_als_info(&sfh_info->ambient_light);
+		case MT_SRA:
+			return amd_sfh_mode_info(&sfh_info->platform_type,
+						 &sfh_info->laptop_placement);
 		}
 	}
 	return -EINVAL;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 2c211d28764d..665c99ad779f 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -22,8 +22,9 @@ enum sensor_index {
 	ACCEL_IDX,
 	GYRO_IDX,
 	MAG_IDX,
-	ALS_IDX = 4,
-	HPD_IDX = 5,
+	SRA_IDX,
+	ALS_IDX,
+	HPD_IDX,
 	MAX_IDX = 15,
 };
 
@@ -164,6 +165,25 @@ struct hpd_status {
 	};
 };
 
+struct sfh_op_mode {
+	union {
+		u32 val;
+		struct {
+			u32 mode		: 3;
+			u32 lidstatus		: 1;
+			u32 angle		: 10;
+			u32 inbagstatedbg	: 2;
+			u32 ontablestate	: 2;
+			u32 inbagstate		: 2;
+			u32 outbagstate		: 2;
+			u32 inbagmlcstate	: 1;
+			u32 powerstate		: 2;
+			u32 data		: 3;
+			u32 devicemode		: 4;
+		} op_mode;
+	};
+};
+
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void sfh_deinit_emp2(void);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index b4f818205216..6fa510f419c0 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -18,10 +18,12 @@
  * enum sfh_message_type - Query the SFH message type
  * @MT_HPD: Message ID to know the Human presence info from MP2 FW
  * @MT_ALS: Message ID to know the Ambient light info from MP2 FW
+ * @MT_SRA: Message ID to know the SRA data from MP2 FW
  */
 enum sfh_message_type {
 	MT_HPD,
 	MT_ALS,
+	MT_SRA,
 };
 
 /**
@@ -40,10 +42,23 @@ enum sfh_hpd_info {
  * struct amd_sfh_info - get HPD sensor info from MP2 FW
  * @ambient_light: Populates the ambient light information
  * @user_present: Populates the user presence information
+ * @platform_type: Operating modes (clamshell, flat, tent, etc.)
+ * @laptop_placement: Device states (ontable, onlap, outbag)
  */
 struct amd_sfh_info {
 	u32 ambient_light;
 	u8 user_present;
+	u32 platform_type;
+	u32 laptop_placement;
+};
+
+enum laptop_placement {
+	LP_UNKNOWN = 0,
+	ON_TABLE,
+	ON_LAP_MOTION,
+	IN_BAG,
+	OUT_OF_BAG,
+	LP_UNDEFINED,
 };
 
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
-- 
2.34.1


