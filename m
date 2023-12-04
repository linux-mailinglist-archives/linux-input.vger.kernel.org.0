Return-Path: <linux-input+bounces-450-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE80A80307E
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD5EAB20A33
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAED5224E7;
	Mon,  4 Dec 2023 10:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n4n1WmIT"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39DD85;
	Mon,  4 Dec 2023 02:36:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuuHjKTrxDymEj5Ey7IanIgXFhrRwUfd/MZGPriTz0FX78VJ4xejgrgRIhNSBiquZCf3706pPTkzVf+YKwZSeiq/IRLwie+qkLc9z8VofkpkBL4rx8e5bJebcTNgiL6lWYcP/h/MULLqlH6Zu3mq/Jqpgl31prVcUvFhtLQTA1juVeBioOxy2UFyv/7E2mojs+l8297VwI+PZhYF/D9OzQ/yYj0GUhZeYODN6xtl0oYPVcVNYSmOQOmBIyQIqsYxMGFcZizpH0iZPI00k7nUjp4VQrgAiEn7sRWU1bsG3vJpvkKEF1bQNkJjDtcID5GLJclzVIj212aMXWN8z2Nf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtGYI1qfTN09ObnCr0rw9gb58riwEouZNt2lY4ROi/Y=;
 b=gT51ToTpPH2kM04qxAChxUjPxVsXdtU1RTgzkADQLqWUeTRY3Mh9kM/wd9EfsIRH1yaIBIxfLaQG2eSB55iBlSwBSwKrUUslHkvapKVZUAHVUGxIMkHdxdyjJiC5L0h9mnw4gjczuD8YAsD0hKsz8wjgDq4+ztG6ZSPyLaOwpM51++//Y1aBoUOSTiauyv757AjbWoY8mhCRzQLWcsJRxQIDUsWRQVER4enyi366aVYzThqUDrMzmLfzcKJm9pHlcS2vMqoTKGdsyFAuMobWdNCZUqrobRc8hUOIAAeOvK8KklQC9gZYTNuqTZpSiPdkpByVEXmkfbNOomFxWFGGxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtGYI1qfTN09ObnCr0rw9gb58riwEouZNt2lY4ROi/Y=;
 b=n4n1WmITmSRFw3tNRcZbWyEWYfPf1dvQsmnyYT1SXyol3vaUJBwyEAwJ3s+NBuLcyzyeC6MVgqv5Zecri687akgvrHwuEQM88E/NECSlhb9fBhkb+L2PRR5CCFOFh8wtAiGS6i/L4cE8IwTOGjg+fKPelHqQ8u51YosLPE1uJp0=
Received: from MW4PR04CA0112.namprd04.prod.outlook.com (2603:10b6:303:83::27)
 by DS7PR12MB5936.namprd12.prod.outlook.com (2603:10b6:8:7f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Mon, 4 Dec 2023 10:36:47 +0000
Received: from MWH0EPF000971E2.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::49) by MW4PR04CA0112.outlook.office365.com
 (2603:10b6:303:83::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E2.mail.protection.outlook.com (10.167.243.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:47 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:37 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 11/15] platform/x86/amd/pmf: Add capability to sideload of policy binary
Date: Mon, 4 Dec 2023 15:45:44 +0530
Message-ID: <20231204101548.1458499-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E2:EE_|DS7PR12MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e6a72fe-2b03-414e-ddbd-08dbf4b4eacb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rIzLPLKl951Dm8ejx0tpzRV6fLYYjktz+TkI4sxeNSvxBCNkNLt9nGghA2rjZENyHbliXpeMOeGFMd6qBdIc83dqDT6ZhHDHt1VYEHCVce2I5A/TkVUXuO3n4ZYEdvZ29A1h/V1ciDm8mcZ3Hg8TBnmcjRnR8hST6jsZ6VjQ4I7mYzn+KnK8W0am2HhC8Xbg3GU81ulvIlI5jy1dBwzMWOJVHXD3DDnieSlaoybV1CQJe02GZICWvVRdx1Lp59PYLIB0IcfEaJFIN4MXwvp9COxKFbfK2X5DLYRGWbbD2G+tQvQSgPWWZMLjRZ+nUmzt2oE6lxPnpp7HT1JbjlbyEouL1bFBFT0mKbbVUP/KzJRIuST/U80dDA01IUDIFcj0Ec8P/UqTVxDCloNbJhlI8wRJwg/e7UjdfLxcxiLhal0OY0T2koK5+nC1hUe1KSjHRVsQwoLlHFxc2fzDm+7TyS/R6GQ38/+UKkc6hV9WmVtax+oLPfEcoHAF2ODMAJryn0J4ZayxW7IurBtlUWMdOwYSqaAxIYhSt8YW4RKPl9REJy7Y2TNwe6YT8+7Fb8BCx6DUskIJVfXXzmlA8BEO2xfWgaQXGp1KU8IEVhGescoXNGcLvxwIaqb30NVfXWBFWoszavFs3d0EDHSuh1J/5H30Lmj8tv9FaV7zy0weRuuha0Q85vUiJohLww4t0fflgqRs9vFb82FeIdnLsHpK9jhN0w5rVx2mTzHuUlG/lMn7srz1uJUcjmrSqEDthbv4Uko5ZTGSr6E1yEKCkZZAwg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(82310400011)(451199024)(186009)(36840700001)(46966006)(40470700004)(36860700001)(40480700001)(41300700001)(426003)(86362001)(2906002)(478600001)(6666004)(40460700003)(5660300002)(70206006)(83380400001)(356005)(36756003)(1076003)(8936002)(7696005)(54906003)(70586007)(16526019)(110136005)(336012)(4326008)(82740400003)(316002)(26005)(8676002)(2616005)(47076005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:47.2170
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6a72fe-2b03-414e-ddbd-08dbf4b4eacb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5936

A policy binary is OS agnostic, and the same policies are expected to work
across the OSes.  At times it becomes difficult to debug when the policies
inside the policy binaries starts to misbehave. Add a way to sideload such
policies independently to debug them via a debugfs entry.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c | 54 +++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 593930519039..8712299ad52b 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -219,6 +219,7 @@ struct amd_pmf_dev {
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
 	/* Smart PC solution builder */
+	struct dentry *esbin;
 	unsigned char *policy_buf;
 	u32 policy_sz;
 	struct tee_context *tee_ctx;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 5f10e5c6335e..f73663c629fe 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -16,9 +17,14 @@
 
 /* Policy binary actions sampling frequency (in ms) */
 static int pb_actions_ms = MSEC_PER_SEC;
+/* Sideload policy binaries to debug policy failures */
+static bool pb_side_load;
+
 #ifdef CONFIG_AMD_PMF_DEBUG
 module_param(pb_actions_ms, int, 0644);
 MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
+module_param(pb_side_load, bool, 0444);
+MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
 #endif
 
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
@@ -269,6 +275,48 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
+				   size_t length, loff_t *pos)
+{
+	struct amd_pmf_dev *dev = filp->private_data;
+	int ret;
+
+	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
+	if (length > POLICY_BUF_MAX_SZ || length == 0)
+		return -EINVAL;
+
+	dev->policy_sz = length;
+	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
+		return -EFAULT;
+
+	ret = amd_pmf_start_policy_engine(dev);
+	if (ret)
+		return -EINVAL;
+
+	return length;
+}
+
+static const struct file_operations pb_fops = {
+	.write = amd_pmf_get_pb_data,
+	.open = simple_open,
+};
+
+static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
+{
+	dev->esbin = debugfs_create_dir("pb", debugfs_root);
+	debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
+}
+
+static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
+{
+	debugfs_remove_recursive(dev->esbin);
+}
+#else
+static void amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root) {}
+static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
+#endif
+
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 {
 	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
@@ -281,6 +329,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	if (pb_side_load)
+		amd_pmf_open_pb(dev, dev->dbgfs_dir);
+
 	return amd_pmf_start_policy_engine(dev);
 }
 
@@ -382,6 +433,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	if (pb_side_load)
+		amd_pmf_remove_pb(dev);
+
 	kfree(dev->prev_data);
 	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
-- 
2.25.1


