Return-Path: <linux-input+bounces-3538-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A208BDC26
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 09:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556A41F23C4F
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 07:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1070913C3CB;
	Tue,  7 May 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GwF2WSHB"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2084.outbound.protection.outlook.com [40.107.100.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F0B13BC0E
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 07:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065870; cv=fail; b=BrNem83Qul9/6s4Iv0BoXnrWLj24qxhdoFx0HWbp0COCm6m05atTqRPuBWoE+OdkLrVZBJ9C153TMARBksKydvaZRbbRRvvZuWbDUGhviHVXLfABolf2EFiRTy8/51em8NxEOBkgrKh0QchJG5R4eOkhHXqrSNFQPi3V7+3Emiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065870; c=relaxed/simple;
	bh=SUc8kSkXbf6ayBWq+iow635kJ+Blnf8zl/HUgpB7Lmw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Etx6FPdz2rB8gxlonRh+PVnR/2HyPp5vKQVbImTFeCDSUCAuP1bguk4OxQ8EU2WqxTMU9Bjx19IqXs2zUiZSpBXyGlM5XjB8lJBPFtsYogloHArqOA4nVBMA4ZZyuX9PPESAcW9bHzKNEfhxi6QMDA5U9dNuOMTZ22nvCUVwHZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GwF2WSHB; arc=fail smtp.client-ip=40.107.100.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkAPcctTTeIM6vHr1H1lF/Yj2PjjDPue/TIyLpAjh2hUifa4ySxgAZIR59A3nt58Ht3T2XjtL/BgA8FV0k9S1O1SEDhG2XhSoOic0RrXA91H1aDizsgmyfWoUK1akjkmciUpZSbVtVOkuRn6f20awgkTs/qLovDLtH6h/SO5GRgMZWZdScHSPnSWHhKkNF0+UiFMzplJtFLUWn3Px5nGaxSuT+ifga97Jg9Ood90OEZRj4JbsTs0+DRDg9Lwvzm5ZjDeqtI8e5nTn1Cvi3PbHpc3+4QUHCsT51yafLuMhgibR58la9XC9hOdRdSy1Tb+vW/PUJCraClE5VV1TGC41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUlKYkqJXgCUH8QnXxAUo2yG9sx/IG2+XfOCJdgYERc=;
 b=VhRJEbAc60TWri4HQJLu6CHlPftVw8ekbKUMXzRx2PAj3+IRkXXkzgrAUXG1TxlD5B/ki9FUjD8LK0WHx++VuzzW7Hs9ouQXVIlEoMp8qabKESYeX6bTzouh1XmrceBiJ6NahIp3UeZcZcPw15JjfkATaiVj7+UkpzR8dZ5/KxDud/+ngmqc41aoORRKufn19ay47AICfcJzH9fdmITespnb4hXD1TRnipSeZ1IAiGjjukvUgs4xcfJb/SQsg6cK8gVsLlE7GbZODCixg+z7QRGFUDkEJtV4XWgh37xzuEFjSPnuQ3XDac/avcgwmL4VTH6fqhZCjzeRRpo3ZuA4oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JUlKYkqJXgCUH8QnXxAUo2yG9sx/IG2+XfOCJdgYERc=;
 b=GwF2WSHBhtgYf108SHLai7k+fy7Aiklk3zqo4n1CwyJceOgR/YGORYjr+k6IvaMv9YhMIGZa63kb9jP9JdTTCJDxT0xoE6Zw4xb6AmRueGwg5LA42M2zHYDBbyjnDYmvJpVGQEHhEZ34Y4Z4hk8hYfKNOwRTlRXPyD7S0+E90Dw=
Received: from DS7PR07CA0003.namprd07.prod.outlook.com (2603:10b6:5:3af::11)
 by MW4PR12MB5626.namprd12.prod.outlook.com (2603:10b6:303:169::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 07:11:04 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:5:3af:cafe::43) by DS7PR07CA0003.outlook.office365.com
 (2603:10b6:5:3af::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43 via Frontend
 Transport; Tue, 7 May 2024 07:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 07:11:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 02:11:02 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <patreddy@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/3] HID: amd_sfh: Modify and log error only if case of functionality failures
Date: Tue, 7 May 2024 12:40:43 +0530
Message-ID: <20240507071045.295723-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
References: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|MW4PR12MB5626:EE_
X-MS-Office365-Filtering-Correlation-Id: 48ff3062-314d-4053-3a10-08dc6e64dbcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?y9hHmn9Intqa61PiXRD74XPzHADExix7Qzy2cGUWY7xTixSXHqIRxHJLJMyJ?=
 =?us-ascii?Q?+MoG8+KYgILiB15q2598nLggq3u2A8LX+qJVObdmtNQYBULFo1wG6+Rxr5xL?=
 =?us-ascii?Q?JdmVKsAax4pKsboVFBhWOreC9YKAY+A2m1aA5rZkweLw3UFOoDSsN73F5uVN?=
 =?us-ascii?Q?6tM8se86bWCS78IiMPgK04BvCOfuZ95QDWdU5VXpLyaJs4iEAf4aY7q/e7wM?=
 =?us-ascii?Q?m6WYjO46anML1wwYYQ+4nzTbU+ER+dufZUgfJUFpQbnQ2TrVSYybTl3208Q6?=
 =?us-ascii?Q?B7VyX03tOpH85krlpm7FgBML7xR6fr/UWDzslx2Gj58oLcZKldlhBCIaMszM?=
 =?us-ascii?Q?U+L2mGsxx/I8E6e1qVCGTdGJdD/IpqHX/KdBnZ2AO5iMWe30SRPfT77lAevL?=
 =?us-ascii?Q?+8ZxBVdYrXAEE5jqn13yIms4XMS0SbPG4aFPYo+bdLCbcER+vDPW6Pk4bXcV?=
 =?us-ascii?Q?WBcRPTR8N+XiORBjkKz4LjQQX2i/7g1NajsUKyoiTNfP5OVKGY76eeQTih3e?=
 =?us-ascii?Q?PK44INcrAIRe1tpJiuHfoUOJEyGq9KlwXErLItHusslMEsyZ6CpD/3GU99fy?=
 =?us-ascii?Q?M2j3h475YeVdPewl1bgLNkKUM5sQDR0JyejhXpV4dsBEhp9N8wnfKTcB5Y4s?=
 =?us-ascii?Q?ILeHdx3P+qqokoY1ibS/NnwCezcSNdUbOnbWuvofPOs8LSLW5VhLH7Y8IqHo?=
 =?us-ascii?Q?/tpcZ1LJ2A38Hpw/IUUw+6+cMWCIMpSc0m20dHNfyECIYL7nBgIlx6GRZ46l?=
 =?us-ascii?Q?K+QfpUiseBnZ5ESgkUixrDFBUNBtCtv4yaWiPa9EK0B5gCxiiBXbnfmBa+/Z?=
 =?us-ascii?Q?M9yxBJTjIzZLy0Ts7p1hFHpi3zcKrJuPbqjgEKdVgIgCdqRrU6N8BuETOkZr?=
 =?us-ascii?Q?pkE+5DN9zS9JJYj9AoONu2RvS1tD9u7mXegsxWgP2tZkNPU4bTKTDSqrtEh4?=
 =?us-ascii?Q?1kMRYXlk28NXPdhEAalh14QmUOfGQyfOQCmgS8xgWeMkbhlrq3fc0R/YotZ+?=
 =?us-ascii?Q?L+LuzOdXeXKF1c5V1j4/Z21aTg4mS2aX/MCW6eTA1y3+QzDXZ/ptnyDAIoDv?=
 =?us-ascii?Q?wcmyzQuFBWqmTR5umNAATLbQoIwqGt37YJb6H7N5aBcCmX1JnFRSBZxgUfxZ?=
 =?us-ascii?Q?mTxXMX0ApPNOGg+6p0SBk14dVoencCRmmGUxzZgts4dqgSx/Orbhqcdq32DC?=
 =?us-ascii?Q?eiDnIfjY4s9PenAU3k0h4HrdfLdD5i3eb/QLvhT9+Tok0aeEw2M51OyYjlNR?=
 =?us-ascii?Q?pAzV/9C5ZouMZdUauMSA6WQS5QHEHL9h1JW4Q0dk4BGY1KUwrO7HjviNzGr3?=
 =?us-ascii?Q?dwwsZ3TiqhPNO1Lq5Ri2UebmKmJyYvdZvZkVuMW54owqEfpzvsjrnLgR5mDt?=
 =?us-ascii?Q?Cog6dOU2pIAAp7d5NZwPnD2CKL7V?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 07:11:04.2562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ff3062-314d-4053-3a10-08dc6e64dbcf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5626

Modify log messages, but only log errors when sensors are missing or a
true failure occurs to avoid misleading "failed" messages.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        | 5 +----
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 7 ++++---
 2 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 9e97c26c4482..0c28ca349bcd 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -333,14 +333,11 @@ static const struct dmi_system_id dmi_nodevs[] = {
 static void sfh1_1_init_work(struct work_struct *work)
 {
 	struct amd_mp2_dev *mp2 = container_of(work, struct amd_mp2_dev, work);
-	struct pci_dev *pdev = mp2->pdev;
 	int rc;
 
 	rc = mp2->sfh1_1_ops->init(mp2);
-	if (rc) {
-		dev_err(&pdev->dev, "sfh1_1_init failed err %d\n", rc);
+	if (rc)
 		return;
-	}
 
 	amd_sfh_clear_intr(mp2);
 	mp2->init_done = 1;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 5b24d5f63701..f46f9c670c6b 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -202,7 +202,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	}
 
 	if (!cl_data->is_any_sensor_enabled) {
-		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
+		dev_warn(dev, "No sensor registered, sensors not enabled is %d\n",
 			 cl_data->is_any_sensor_enabled);
 		rc = -EOPNOTSUPP;
 		goto cleanup;
@@ -320,7 +320,7 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
 	if (binfo.sbase.fw_info.fw_ver == 0 || binfo.sbase.s_list.sl.sensors == 0) {
-		dev_dbg(dev, "failed to get sensors\n");
+		dev_dbg(dev, "No sensor registered\n");
 		return -EOPNOTSUPP;
 	}
 	dev_dbg(dev, "firmware version 0x%x\n", binfo.sbase.fw_info.fw_ver);
@@ -337,7 +337,8 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 	rc = amd_sfh1_1_hid_client_init(mp2);
 	if (rc) {
 		sfh_deinit_emp2();
-		dev_err(dev, "amd_sfh1_1_hid_client_init failed\n");
+		if ((rc != -ENODEV) && (rc != -EOPNOTSUPP))
+			dev_err(dev, "amd_sfh1_1_hid_client_init failed\n");
 		return rc;
 	}
 
-- 
2.25.1


