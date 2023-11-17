Return-Path: <linux-input+bounces-108-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D53447EED5E
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 349F4B209FE
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6890BF9FD;
	Fri, 17 Nov 2023 08:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f61fCATl"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF67CA5;
	Fri, 17 Nov 2023 00:12:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mX8VNqTE84Uqim27pBjSMDcieykuK1bFx+KsCM28vrM5leAJTbGE8s3W1OFk4+UlpG6sV3/TUS+Ksf/jW0munkYlGnMQHnKW355qittKvcU90rcLjQJXeRkQNFAYJ4s7YrLtOftbJPrFH4Boiig9hDMz6e4mMCNsUtI3BTCcJkLI+rizc7EEJznmmvvD2ajPA/7JTrKCjaM/AUUkeoYlieYd9M/1fKl86MRbiI9apnKGArvOVypS/o2nPb65G6YCrcf1jJSEYJk4wdDskNb4c18QB3fZsj6K/7t197n2VQwx/Ihrc95UXWcjcupymYwZLrwHNwbAlroNxLNVD4GdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPLnjwyiySdA6RJDt/6zEyJEuEUeuUg0CfSID6sSCqk=;
 b=mJAXxKID7TLaBTNsLipZLterrUSEdjY6LW57GFiKjhRwrVpeJchX0eMZiAoamJfGXyyWyRmzFVKPRLYFOJmt9Gwzud+xzoUZBXXOWTy0kBo+gvvkNPiM4D6od0Pue0OIw5fdbGyNI05WJqQ5xpTqAZqNEbdWB/vFmRukHSKDXpLeB1cI75wz8D30nmgnbFadaqhnEzFco/IfFQY3oyjyP8VprstiAfkn/RcfnN7VmTTF+BpUAACpLFElV6f0teibWDjpFP5nAZdF5RFNwdFLooDIoGddrtBUgmlTW1OZSFvmgcoDZ1WWLZGgo0f3WOTGfvOg0ZSOVgL6Zc8PkPDSEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPLnjwyiySdA6RJDt/6zEyJEuEUeuUg0CfSID6sSCqk=;
 b=f61fCATlG5q/T0aG5njKyXZu1FkoSh6CUBK5uRd2V5kxxjmnUsf197jONVp7FiQhuwGZoSbNYJV+Oc69Ks1dxiV7ru/1ECsLeDMTDTwbmFrQvJCsVEu5WOVIT429QlqF57prUMj3l8eVI5StV1t92Amm1Pera54l4AJx+XT0hSg=
Received: from SA1P222CA0152.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::20)
 by DS0PR12MB7702.namprd12.prod.outlook.com (2603:10b6:8:130::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:12:40 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:3c3:cafe::20) by SA1P222CA0152.outlook.office365.com
 (2603:10b6:806:3c3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:12:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:12:40 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 16/17] platform/x86/amd/pmf: Add PMF-AMDSFH interface for HPD
Date: Fri, 17 Nov 2023 13:37:46 +0530
Message-ID: <20231117080747.3643990-17-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DS0PR12MB7702:EE_
X-MS-Office365-Filtering-Correlation-Id: dd999bda-eb37-4368-8526-08dbe744f7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FxlvU0R1/Qz7afOgYwfODOnj88qwPvJDyCo72IW3biplWXtTYzEqvXlmNXoGjSOx76i/FH+4uH+ZmBi6OXrlCs2JXUZskadDLAUdhTgLB7FWDZpdBwV1mtT7LsfGNBSuQGwpIN5YjokKj6WiMqnIzDftjVmPC+61qQlSvu1SMBzhJtZptOvU+6TXlln0aiMsqwoWF1M9VpnVbIheTbwPrc9/4cLCaICwkAYMPLeQCibpJ8cbz5TmKW4Q14jTxOnEFC2DFtKpVvvJZpr/Nb10ivmCVFAXtJvU7dazCIQxMzAHPa8ExuPffJOr0GJ/l8nXOVNddwZmLxN+RVETwc/SRSMCp9nxHG+TgnJvbKkApm79aOtpmIh7Afl57ep1AAj9yHyGFK4Z8lyKDRbHnEJYb2MUxPWjCXgB1akgVmB/bYm5TeSr+vWXp3I2kqyca905csu9/UDeshtDci6ISQLBO/k21CtpBPDR3CPh/4UbhkKMz/o3z4Q/2rgdQFguLgVZs7dsQ/cUp4SmKek+g5aQWNNLAdp4sFXe4ext6QaTcORajP+5CEsx9TuGtzVLBUPrb/jltIv1d7e0hKswYpXW0QcJ9OisKaCPRgZMs/eimrqxAqPKpAO8KeMDRXeSsaGT2jHLlku5M50h4lqIRaXot0mHHbN+P66s1zwI/wM24p6K3tPGX6yw8OR9HD7Mi3UFaKgATOtpDic95/+NuRz0ZNwP4UbAW5ZrNPZPcJ2BKg86DADU+EaNl/UkAJer3JxnZhSnDA97pFJcDyUsT0Cx1w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(26005)(16526019)(2906002)(6666004)(336012)(426003)(82740400003)(47076005)(70586007)(70206006)(83380400001)(478600001)(41300700001)(40480700001)(54906003)(316002)(2616005)(5660300002)(86362001)(8676002)(8936002)(1076003)(4326008)(110136005)(36756003)(40460700003)(356005)(7696005)(36860700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:12:40.1936
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd999bda-eb37-4368-8526-08dbe744f7b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7702

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

AMDSFH has information about the User presence information via the Human
Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
Add PMF and AMDSFH interface to get this information.

Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 11 +++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 28 +++++++++++
 drivers/platform/x86/amd/pmf/Kconfig          |  1 +
 drivers/platform/x86/amd/pmf/spc.c            | 22 +++++++++
 include/linux/amd-pmf-io.h                    | 46 +++++++++++++++++++
 6 files changed, 113 insertions(+)
 create mode 100644 include/linux/amd-pmf-io.h

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 2643bb14fee2..cd57037bf217 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
 	dma_addr_t dma_address;
 };
 
+struct sfh_dev_status {
+	bool is_hpd_present;
+};
+
 struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
@@ -47,6 +51,7 @@ struct amd_mp2_dev {
 	struct amd_input_data in_data;
 	/* mp2 active control status */
 	u32 mp2_acs;
+	struct sfh_dev_status dev_en;
 };
 
 struct amd_mp2_ops {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9c6413af24a..3dc652d41d7d 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	int i, status;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		switch (cl_data->sensor_idx[i]) {
+		case HPD_IDX:
+			privdata->dev_en.is_hpd_present = false;
+			break;
+		}
+
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
 			status = amd_sfh_wait_for_response
@@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
+			switch (cl_data->sensor_idx[i]) {
+			case HPD_IDX:
+				privdata->dev_en.is_hpd_present = true;
+				break;
+			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4f81ef2d4f56..c0f31efe4927 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -7,11 +7,14 @@
  *
  * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
+#include <linux/amd-pmf-io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 
 #include "amd_sfh_interface.h"
 
+static struct amd_mp2_dev *emp2;
+
 static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
 {
 	struct sfh_cmd_response cmd_resp;
@@ -76,4 +79,29 @@ static struct amd_mp2_ops amd_sfh_ops = {
 void sfh_interface_init(struct amd_mp2_dev *mp2)
 {
 	mp2->mp2_ops = &amd_sfh_ops;
+	emp2 = mp2;
+}
+
+static int amd_sfh_hpd_info(u8 *user_present)
+{
+	struct hpd_status hpdstatus;
+
+	if (!emp2 || !emp2->dev_en.is_hpd_present)
+		return -ENODEV;
+
+	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
+	*user_present = hpdstatus.shpd.presence;
+	return 0;
+}
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
+{
+	if (sfh_info) {
+		switch (op) {
+		case MT_HPD:
+			return amd_sfh_hpd_info(&sfh_info->user_present);
+		}
+	}
+	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(amd_get_sfh_info);
diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index f246252bddd8..f4fa8bd8bda8 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -10,6 +10,7 @@ config AMD_PMF
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
 	depends on TEE && AMDTEE
+	depends on AMD_SFH_HID
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 47ec563088b8..7f63973ab40e 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -10,6 +10,7 @@
  */
 
 #include <acpi/button.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/power_supply.h>
 #include <linux/units.h>
 #include "pmf.h"
@@ -49,6 +50,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Primary Display State: %s\n", in->ev_info.display_state ?
 			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
+	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -185,6 +187,25 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 	in->ev_info.display_state = dev->gfx_data.con_status[0];
 }
 
+static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	struct amd_sfh_info sfh_info;
+
+	/* get HPD data */
+	amd_get_sfh_info(&sfh_info, MT_HPD);
+	switch (sfh_info.user_present) {
+	case SFH_NOT_DETECTED:
+		in->ev_info.user_present = 0xff; /* assume no sensors connected */
+		break;
+	case SFH_USER_PRESENT:
+		in->ev_info.user_present = 1;
+		break;
+	case SFH_USER_AWAY:
+		in->ev_info.user_present = 0;
+		break;
+	}
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
@@ -195,4 +216,5 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_slider_info(dev, in);
 	if (dev->drm_dev)
 		amd_pmf_get_gpu_info(dev, in);
+	amd_pmf_get_sensor_info(dev, in);
 }
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
new file mode 100644
index 000000000000..5b6d29d36922
--- /dev/null
+++ b/include/linux/amd-pmf-io.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Platform Management Framework Interface
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#ifndef AMD_PMF_IO_H
+#define AMD_PMF_IO_H
+
+#include <linux/types.h>
+
+/**
+ * enum sfh_message_type - Query the SFH message type
+ * @MT_HPD: Message ID to know the Human presence info from MP2 FW
+ */
+enum sfh_message_type {
+	MT_HPD,
+};
+
+/**
+ * enum sfh_hpd_info - Query the Human presence information
+ * @SFH_NOT_DETECTED: Check the HPD connection information from MP2 FW
+ * @SFH_USER_PRESENT: Check if the user is present from HPD sensor
+ * @SFH_USER_AWAY: Check if the user is away from HPD sensor
+ */
+enum sfh_hpd_info {
+	SFH_NOT_DETECTED,
+	SFH_USER_PRESENT,
+	SFH_USER_AWAY,
+};
+
+/**
+ * struct amd_sfh_info - get HPD sensor info from MP2 FW
+ * @user_present: Populates the user presence information
+ */
+struct amd_sfh_info {
+	u8 user_present;
+};
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+#endif
-- 
2.25.1


