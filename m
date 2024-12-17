Return-Path: <linux-input+bounces-8629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B39F4F33
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 16:19:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2581418826DD
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 15:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B8B1F7086;
	Tue, 17 Dec 2024 15:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EcaExXOp"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0D21F709A;
	Tue, 17 Dec 2024 15:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448630; cv=fail; b=GaR1yPX9/iaRJtd8mC4ZTVZZ7CL0MAR1pDQLqKAf5ZqF5gfWbPNZ1eoy47aAC51OautSIx4/XFBmImPgyw1/FEGenx9Q67l5Ob7RSs8lbXXJRQQ4a9ki0aksj4fZ9aUztJUx1xlvvKbBkXDAkAqH6brwbf25jZXtGaDJXEgHfOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448630; c=relaxed/simple;
	bh=vofImAf+DtdTfunecXKiW3RAtwxWH+LbtcqrGKaaJRs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rKZgmAJ+TH5q5FISgSVGta2i4eZUmiuWAXThnNPP6KVkpmqdpnZXW7T+qPFPQrofW0pDv80vdj7BrOK29mueucOnKlE2ZIZzS37ylAHIIaEULno9eeAyTnedvI6iZb6iS0gDBcQInLoUJpSMqYyYbmEM8tMJr9eVMrptVBaoi4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EcaExXOp; arc=fail smtp.client-ip=40.107.220.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MuLu9EXoJCrPaaHgPvHDV4WK+iHnLVLEBW1H/DHJ0LBP3HTX1Hv/SlvRV56xHHl0fFb/tTAJLd7BIUf+nwVy5wmhCqUSyHsbuBn2al3cYfoIHT4MmnFxKndIwek9eq8VMbvhaBTv5b8/wfOKAvjbo/rSqO5I+HZCBY2Z4Z/GCiXunJ1JNgLzgvC14DXx0GSWPT+ISj0TPwMG+GkZEKa77+s8HibY9txRvg2axFiJwBxqRa64K3GHKeTbYOkFEzLZHflWUq6tBDjN0Mr8iBC7WfML2nBdKqpjQejRvxpVjf4ai+4ngVlbnABDYQw90dRwzid5ZfbwZXJSsCTSgcPy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A5pI2FYy46+8kFgbOoJSXgbgN+wH1IURNFhZetL+HeA=;
 b=XdWL/9WkCRnkKZbyAVpWm1N+ONPYKyxoGq5ZQwdKJhfLN0d3OvabtWI5BBMK9fuXp5RU3puwLvpOMi+yHQWPabjqJXJanw0TKP6gr7kzl40HmpMKFCv+gQQdf0VwYwmv1fBfUZfNPCEu+zml9MC9fycNRHIcAt9tlHRaeey9nWIjnBvSP8nz0Ei+SjvnSDn0zJPqiy6sI0/vNEaCNmnYZhBe26Kq/iRcR4FQFg7rSxy0ajtHbyHh0M8UW/oyqj8kclKlOgezUnoD0DSbkZOIhXyGesDsJRlz59ifBEceuwXt7UpOhl4Y3Y1t8aIGCAaCBBuuyQRaWjCxVj5pNihBrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A5pI2FYy46+8kFgbOoJSXgbgN+wH1IURNFhZetL+HeA=;
 b=EcaExXOpsEmvNjUtsYqsA/Th9UVxzKu7yR88malO/5JZHp9xr0feWuugEnzUBSJloanAsU9TEvn6AZqVMQPTtd3VjCK+N9fOhexMuqjSNdC0QfYpg6icAtl6a13ognmvWeb6cEzzNpB9akLu8ERreBRSceQzU7jrpvhgMpZtkFA=
Received: from MW4PR04CA0356.namprd04.prod.outlook.com (2603:10b6:303:8a::31)
 by MN6PR12MB8471.namprd12.prod.outlook.com (2603:10b6:208:473::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:17:06 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:8a:cafe::75) by MW4PR04CA0356.outlook.office365.com
 (2603:10b6:303:8a::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.21 via Frontend Transport; Tue,
 17 Dec 2024 15:17:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 15:17:05 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Dec
 2024 09:17:02 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>, Patil Rajesh Reddy <patreddy@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<Shyam-sundar.S-k@amd.com>, Patil Rajesh Reddy <Patil.Reddy@amd.com>
Subject: [PATCH v2 2/2] platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver
Date: Tue, 17 Dec 2024 20:46:27 +0530
Message-ID: <20241217151627.757477-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|MN6PR12MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: de6d0bab-398d-4766-15d0-08dd1eadde1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fzSSxFfFyzSB76t5e7+cOg6Du6+Twp6IkvHTQRbNfT+MOprhNfcXXip/WuN+?=
 =?us-ascii?Q?iUbAKTLhq5M+WBGh9PDqLIBjJWV8l1Tn6Qny8Nr4pxD3ShFMwAkbzWyrdZYo?=
 =?us-ascii?Q?Fy2kcNUEWgIz5m5192AFPe20hAIV3N4gI76cI3fbknItYbZBQX1J4hjnWeu4?=
 =?us-ascii?Q?7PMIvtgtNYCJCLzmmNq11a+K0+cymJuHWFukLwWoPeSJRMAZKCI0avg5vr6a?=
 =?us-ascii?Q?4ZDfxLSQv6hgMFg/Tdh+dG0lloTWmPvhwj2HToLihmZ2HDf7kF0F8YuqUOMU?=
 =?us-ascii?Q?aW8hBl0hG4+2GzwjrWg1muCp4TUddAXyHVXqhW1s9SUUVzhyvz+/3L/wlukN?=
 =?us-ascii?Q?LAngXuFg08pQdeDU9fOe2MHlskNmTKoU4XaEpeC83l7vEe7WmITCl6w7VgPe?=
 =?us-ascii?Q?40YKlm80cSbiJvvF6BB9b7reOv3yZjZC524cXDqA3/Tkp/GeAu/VS8VHeF+8?=
 =?us-ascii?Q?THqjxKWROVoBrQlNH/avaSHR7gnHO9OZIm77QfzPz+/9jerhdZ/7fJ9/mJkR?=
 =?us-ascii?Q?W3Lm9PueBv6McuZnTCyifcBA+P4nG016KXOROQXGlDAK6C6eWsezdfqgE8AF?=
 =?us-ascii?Q?j2b8pdSSi2bUpSg1AiuTw5HFhbTEkYtAh5x9MFcrMX3vZYF/y31ItTLpGODv?=
 =?us-ascii?Q?iUAiMqWRokcc9EtGCJuRHj/B5MtEoBjBlkXT+Z73e5NoekV3Z4WINYnNDVQa?=
 =?us-ascii?Q?22/MomGnUnS2A4YQfnwDsSpQlzWJXzOGE/HYrJL7iEpL3Y6X6CTj1vm8kt/g?=
 =?us-ascii?Q?jb1zX1v1K1J1v9haZiAmm9ACuIWAszSAJcP8P75AN7ok6vFhnM51EdCb1/HA?=
 =?us-ascii?Q?MBXyUMPuoMoonnro+BSDi0l3hb7NAjX2y2caVxxZAp/74pHsSiMaz65uSK+x?=
 =?us-ascii?Q?2YgfccvPiPzTB5K3BkP8dm4tjQvh4LUStLJO7FV2o3Qpe/ER+evWQgdVmjyD?=
 =?us-ascii?Q?/+jRdiUR4f0MdV+K/9r+rradTAPq4P93b3jXcyEov7OWejzL26FKFqWlZonX?=
 =?us-ascii?Q?6NnDm0T1jOz03BHIxNr7qMYjMA+IF02AT3ymjZ27MLtDAiCfXgfIxuNxfQCq?=
 =?us-ascii?Q?Es1LJoq7yzPpCyqf391S7gWfraw4laufcJ8WPYK2HeytX92IgidEBflbu1RC?=
 =?us-ascii?Q?Ja85q2Z1Z8HJZQ6r7uLAyb4GUz+VuSslh65X3gYhECnIwVhFssvK/e+YHMEU?=
 =?us-ascii?Q?2idPLNOb0azlf1UDy+H10jALk33CnOiFE8zMgT149aS9NNCrTli1KmCDKEYE?=
 =?us-ascii?Q?CQAAuYYRoZLSwqbrNTKvYjcuak2Y/lizS5u07xc7c0SOqQlMLLRI5zH8HOYz?=
 =?us-ascii?Q?3B624pFUom3wlXlXrItofVumCVLNsaEA9MhOqFfwjslesYP2pWOpcAXO6ZAy?=
 =?us-ascii?Q?pdSZdfJmFe+hZAdnNWNX9KqKBA2kmUFLSEHTsCmfq2cq+QNErnlEraoBUgpC?=
 =?us-ascii?Q?z+Xxfyh239w2/pOpxSYfilcKZA3joWRJnPRVh+gohRd1rr51RrHIR1GVuBy3?=
 =?us-ascii?Q?hfS7cJhPpePUKwE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:17:05.9670
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de6d0bab-398d-4766-15d0-08dd1eadde1f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8471

The AMD SFH driver includes APIs to export SRA sensor data. This data is
utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
enabling the AMD PMF driver to implement the output actions specified by
the PMF TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
 drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 255c5ad2300e..492a64958fcf 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -628,6 +628,20 @@ enum apmf_preq_smartpc {
 	NOTIFY_CUSTOM_BIOS_INPUT2,
 };
 
+enum platform_type {
+	PTYPE_UNKNOWN = 0,
+	LID_CLOSE,
+	CLAMSHELL,
+	FLAT,
+	TENT,
+	STAND,
+	TABLET,
+	BOOK,
+	PRESENTATION,
+	PULL_FWD,
+	PTYPE_INVALID = 0Xf,
+};
+
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
@@ -680,7 +694,9 @@ struct ta_pmf_condition_info {
 	u32 device_state;
 	u32 socket_power;
 	u32 skin_temperature;
-	u32 rsvd3[5];
+	u32 rsvd3[2];
+	u32 platform_type;
+	u32 rsvd3_1[2];
 	u32 ambient_light;
 	u32 length;
 	u32 avg_c0residency;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 05bed8206365..f34f3130c330 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -16,6 +16,46 @@
 #include "pmf.h"
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static const char *platform_type_as_str(u16 platform_type)
+{
+	switch (platform_type) {
+	case CLAMSHELL:
+		return "CLAMSHELL";
+	case FLAT:
+		return "FLAT";
+	case TENT:
+		return "TENT";
+	case STAND:
+		return "STAND";
+	case TABLET:
+		return "TABLET";
+	case BOOK:
+		return "BOOK";
+	case PRESENTATION:
+		return "PRESENTATION";
+	case PULL_FWD:
+		return "PULL_FWD";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const char *laptop_placement_as_str(u16 device_state)
+{
+	switch (device_state) {
+	case ON_TABLE:
+		return "ON_TABLE";
+	case ON_LAP_MOTION:
+		return "ON_LAP_MOTION";
+	case IN_BAG:
+		return "IN_BAG";
+	case OUT_OF_BAG:
+		return "OUT_OF_BAG";
+	default:
+		return "UNKNOWN";
+	}
+}
+
 static const char *ta_slider_as_str(unsigned int state)
 {
 	switch (state) {
@@ -47,6 +87,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
+	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
+	dev_dbg(dev->dev, "Laptop placement: %s\n",
+		laptop_placement_as_str(in->ev_info.device_state));
 	dev_dbg(dev->dev, "Custom BIOS input1: %u\n", in->ev_info.bios_input1);
 	dev_dbg(dev->dev, "Custom BIOS input2: %u\n", in->ev_info.bios_input2);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
@@ -213,6 +256,14 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
 	} else {
 		dev_dbg(dev->dev, "HPD is not enabled/detected\n");
 	}
+
+	/* Get SRA (Secondary Accelerometer) data */
+	if (!amd_get_sfh_info(&sfh_info, MT_SRA)) {
+		in->ev_info.platform_type = sfh_info.platform_type;
+		in->ev_info.device_state = sfh_info.laptop_placement;
+	} else {
+		dev_dbg(dev->dev, "SRA is not enabled/detected\n");
+	}
 }
 
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.34.1


