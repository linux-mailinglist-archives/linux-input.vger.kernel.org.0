Return-Path: <linux-input+bounces-7052-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1AFB98F384
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 18:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C492D1C20BB3
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2024 16:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2B11A7046;
	Thu,  3 Oct 2024 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MXKoKCjd"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698101A7044
	for <linux-input@vger.kernel.org>; Thu,  3 Oct 2024 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971526; cv=fail; b=mTZHSMma62AaumWu7exGi6VGgGpM8i5fmgFkOl9e46dUmQsbxi1hGvTM2O8v3bscdX5057YTt63fy2M/V96q7VP9MBLTIFv0OtONtx2sACc1wjSG3OImissdbPfYl53YrO6HkSNnOARfGFI8kfbCBsYz3ClBkF2UCzwW+O6tGT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971526; c=relaxed/simple;
	bh=ODQ8CrqjcHeMLUKZDc8owP6lXDxywGf7c/sZY3pE+Mw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YSRXgHYQkw+hOIZyPGK6IPduNfR7FIYJIZDyEYlKr0YHGkpGvkGXKnluepDRyAKawYpBelOu6VUY6D0dTacUYp0aaSwtVirSYn3HHsiQKlTxZqaD1PKv/kxzJzJ7RG28TCgCFpT0OmMfyf48o+YC58LHos4CsJi/Q8nSsX3E9Jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=MXKoKCjd; arc=fail smtp.client-ip=40.107.244.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JBhNg8JpMcrRgbgc530uxNJvXoiCh9MoCeXirbgQLu6DjzppEW66mIgPBSltgpsOn4g8CeJr/QxeR2i/C98C2pERyLljZgvDYJ6m+bVHAzGbsTAxqpwQbfcsJZ7Kqy5o2V+YaAm176KJeQ+aCb2zj+bKirAyH5/cNQXTESxga59W8uhGfr38QEKhOxLzlJYaZq4SZCUwdooXUnzAsiHsDu/v8GL7eTxdpQYanCfWjUR44yDfSOUjjfaxW4uIw6/E2Cq8aZU6odHpa1Aif7dRC8upiGlYb2XUFxT2AHUqyryUDXPMy63mKkBVd42Nw6mBJi1YuS7GhGM2g0vtLlbX0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qMh1LBrqG7vWBu+srk6v5seOalcof9nqXNlvFo+Keas=;
 b=q7mJ9EH1GlYAmYxzMlHNCjIe5HLVDEa/4f1a0CjMA0bESpIruFrMFkOcQP30BWusSJx9PvFtF+3DUoM7DVkqdr9MJJv0OI66pC6BPCEo8bW0mzfLNH2Of3tFmuLa/Gha0nNfO5rKjzQ/VZTi8OXTN/cHSTDp+83faq2yNvgK35lLDd8HFhoTNZxUsWPmFYsN+5ow92icN7zn+y/kHdVJot1RjbfRcvEJyUIQIuo/BT8a1HZE1Tqbrwxg9gtzZH6BqDRdXWXwWDPgwQsf4bW0/rdeM013Eeh5u9fbr+EZi+wvEUUURbq/Xk3fbiDL/Sbspzjg4+6MgJ8yR4Oucvu+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMh1LBrqG7vWBu+srk6v5seOalcof9nqXNlvFo+Keas=;
 b=MXKoKCjd2tbr1OB0AFE/80HkrKilwhKZ4ARiF32tXTGigAZ7ni9JdcdK38JN6l28SqrZXb4KorEXPJByGzQK+B3S+Ke0yVYIvaH7rZmhqHaBlE7ztdhtDaRjs7xrRsSllqZD+aysXGtZMdSGaNPgQBkyeNqPbc8cLjodNNzHL4o=
Received: from DM6PR17CA0014.namprd17.prod.outlook.com (2603:10b6:5:1b3::27)
 by PH7PR12MB6659.namprd12.prod.outlook.com (2603:10b6:510:210::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.28; Thu, 3 Oct
 2024 16:05:20 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:5:1b3:cafe::24) by DM6PR17CA0014.outlook.office365.com
 (2603:10b6:5:1b3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18 via Frontend
 Transport; Thu, 3 Oct 2024 16:05:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Thu, 3 Oct 2024 16:05:19 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Oct
 2024 11:05:17 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH] HID: amd_sfh: Return immediately if no sensor is found
Date: Thu, 3 Oct 2024 21:34:54 +0530
Message-ID: <20241003160454.3017229-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|PH7PR12MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fdb6d29-11a1-43d0-461a-08dce3c52df9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cK/vyxcqHO7RoJzTsSu1tYFSIErwkZ4x5Tw4v+k0YHn9Bql6dgABt/WO1Zdw?=
 =?us-ascii?Q?1Z+jqF1C6piBbZEzHNYfo+4eBzFFdonLFX0UEJLl9HGt8Xa4eSqGnB+Tp1h7?=
 =?us-ascii?Q?oabkkrQ6lY/1Kot9538058v8r79j3LyEB8Igu6iHMlJ/KbXg+V1fH+v1GbQv?=
 =?us-ascii?Q?Q3mO8wfapuzPSywh2f9NmkD33LvwHAl4+yGJ4Z3K6pwD6BFJvGzuaj8AOMW5?=
 =?us-ascii?Q?n+dJVa8Y0YFbMSP/RTydo37hoJH4VilyEGJn63ySfzqE8HJ+W4BXKQGATfIR?=
 =?us-ascii?Q?7DuwTI7cAibFhyCW5oxe2hZHpu1Wobr1kKWywNS1jRFGiSuy3wuCAWkxEMYv?=
 =?us-ascii?Q?peQUaFxNHckG+6c4PknZWrlC4eE/37ypfyfQP8hJu6mwjQfzuOo1TH+EcP6l?=
 =?us-ascii?Q?5VbQCY0Q4mdwAkNsoFV4z42ewXfgT2n3j8yrgHUblq9+GlNfUYHDRugBUgmo?=
 =?us-ascii?Q?jgJuAa96taPYskru9EY37kwMXS5E34NQfSduP66eSgvqoF/EVRW5W0MZTtKU?=
 =?us-ascii?Q?ISFymY9BvZlJZV6K56wK2hsR5/yFJQNvCk92pt7DLdJ+SywnB3JCdisgO70t?=
 =?us-ascii?Q?bpotSugFEZ1hkf6y0iUCQWhNdIQyOmmkYCVu0g28qOMY47fp9u3meXmh0JF/?=
 =?us-ascii?Q?1614p7Z2+t1O2Cv5jxU1kDTUVgB3dPS9jsHEDAX1QAlCU0wG5X7a/JrACWdE?=
 =?us-ascii?Q?u2q5bdMqdWDzhrpLCdhqxIvmodYIWybrJFLPQEsv9fA0Pm8AFpfebSNyAUxc?=
 =?us-ascii?Q?Bb9ZbEv415aEGw8VlZKIEGxjOH/2ytWvpDswrlZnBXzOPxg2lPze1e6uGwrV?=
 =?us-ascii?Q?yumCzPjKYpIAw/9PvDA1KjgovB/s+Qrh6T+toXbxDtJHawGb9NUb4oJyno/r?=
 =?us-ascii?Q?RguEsZtGb3V+XQs1ihHgYSmDe7xBYza89/PT9tS8zzlGMCIKG+6OqrX8IETC?=
 =?us-ascii?Q?Q3C7YM9Eg0nTny3EkUz/SLBiWoC6gBdM5ndKPQ2ozGMJ2lwyRbawHC3+nDny?=
 =?us-ascii?Q?s66xRASd9XLtLs0UDzltwPWmOfYiC12oDEPL00ExHn/4nAeer4I3qwVJ1Q1k?=
 =?us-ascii?Q?Uiu8n5YnmrxNEnG1UQFWIXgzuLiH89WDdMBn/4WFHnPRyzgot8SuST2aW6Wx?=
 =?us-ascii?Q?kDNdgqG4YO49a0MPBp/8tWv2pgJcDJsA7XEe45tT4RRBQfB/M4o/NDFbhJ4s?=
 =?us-ascii?Q?xtZFbZj1S5m2ek4FbXuvnN1h54i+H14E2CDKoeO7HDAHh1JY8h22U1Q3L0nv?=
 =?us-ascii?Q?LgCnfw4lq7+GvHSJjEQ6dZigP08I2SG6gPRANsHp9fxHwbnVJmoX7jIFQqXN?=
 =?us-ascii?Q?85tKep+r9WlqCbTRiRcWJBaOa/0Y6dgGcrGY1Q/2l5MLQAzz5xMhwXFJksrt?=
 =?us-ascii?Q?KTEGEQR3qXAesmx4XjBc5YQXP+vx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 16:05:19.7891
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fdb6d29-11a1-43d0-461a-08dce3c52df9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6659

There is no need for additional cleanup, as all resources are managed.
Additionally, if no sensor is found, there will be no initialization of
HID devices. Therefore, return immediately if no sensor is detected.

Fixes: 8031b001da70 ("HID: amd_sfh: Move sensor discovery before HID device initialization")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219331
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 3 +--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 4 +++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 4b59687ff5d8..3fcb971d5fda 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -297,8 +297,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	    (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
 		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
 			 cl_data->is_any_sensor_enabled);
-		rc = -EOPNOTSUPP;
-		goto cleanup;
+		return -EOPNOTSUPP;
 	}
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 0c28ca349bcd..1300f122b524 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -351,7 +351,9 @@ static void sfh_init_work(struct work_struct *work)
 
 	rc = amd_sfh_hid_client_init(mp2);
 	if (rc) {
-		amd_sfh_clear_intr(mp2);
+		if (rc != -EOPNOTSUPP)
+			amd_sfh_clear_intr(mp2);
+
 		dev_err(&pdev->dev, "amd_sfh_hid_client_init failed err %d\n", rc);
 		return;
 	}
-- 
2.25.1


