Return-Path: <linux-input+bounces-103-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D287EED53
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63AB2280E63
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF1D4F9FD;
	Fri, 17 Nov 2023 08:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="nN6wPWE8"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0F5A8;
	Fri, 17 Nov 2023 00:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvo+e+aiI/+QYwEM5pYuQQQWbedhkScydqtFIQyzt1Zt+fzhePg/WAIwUytHczlNvegpPMM42TDiFeB3P0iAAT2EpwC15pDsxEyhr4SqfolK1lvITOtWaP9lcQrWzhBciAG+LNLkTCDhnvM7RM7P3MbNK2CMakkE8QPYTVytCUbfVHnUzqtWnOxUU8bfVjlA6xLx4jkTBxloxL0ZVE7icNTyWCfFvIgNuC4vrvVpVVGgpEoFcmAmJzDRXuqyfTqnKVy40kc53HLl4v59D/FQUH+0juc9vomkEQdWK+jVr51t4NIvXVl+JcrgucNiiqI3aUaqF/QHNpQoXEK/Iw0CCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NtGYI1qfTN09ObnCr0rw9gb58riwEouZNt2lY4ROi/Y=;
 b=kyJ++wMC062O0MH+E2rUq7IPJlAk7MIZrXVPuRZymJr7X45+WW3w2ccTUaWtDhHrJ1Wc28DVOYn5JUu7evaznCdshzlooCg6dCQ14aI7Fr0K/JsdcbB+jcujkO1Augj3ptLqV1A+l/376KGncJVQqND2dY8zQFYPYVNxgT/ha/OE4cBUEUo17ti8nMGisF3ws4Tbsm1n7/U9vvZhMCiY0uv4o5bOk2TDe4Yd+6OObfChTOnx1TwKwd9KhzEA4CCX5EwVxqGh/O9xwx8vnW4YneHHBCaYbDhnPahLFP5ptWgPTbngmKY6Ilt3sKaaABf8OZ814QdyKYg25vLrZbE+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NtGYI1qfTN09ObnCr0rw9gb58riwEouZNt2lY4ROi/Y=;
 b=nN6wPWE8sC6g6RorR+D+IUIo/hsZB7h/UJHWG+VhPMK4oe/YjeRISk0qbJQMh9DdC7j/0YE2qS4nNcuR6jje97pnli9VzHeSagqY2OsNCEOIu2pCFCJ/nzERRRZpqVEw41qDD19+Ju85cvPaKhh2qcnK6nfzTptbX7oljEgxX8o=
Received: from PH7PR13CA0013.namprd13.prod.outlook.com (2603:10b6:510:174::11)
 by SJ2PR12MB7821.namprd12.prod.outlook.com (2603:10b6:a03:4d2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Fri, 17 Nov
 2023 08:11:19 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::47) by PH7PR13CA0013.outlook.office365.com
 (2603:10b6:510:174::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.9 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:11:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:14 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 11/17] platform/x86/amd/pmf: Add capability to sideload of policy binary
Date: Fri, 17 Nov 2023 13:37:41 +0530
Message-ID: <20231117080747.3643990-12-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|SJ2PR12MB7821:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b2ac0fc-aae8-4c96-97e4-08dbe744c72e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Dgo1/0cIz0P3F4+Ph3uHAGWXHWEwD98D5qMBf5/CamPTKTIqZg+p7ksX/mNga9iXe3eiKSTQSyqdQS4ZTk0gp0J04Op9fLTWvl22KnzftTWG0h89YJ41d5vZkitCXQBNe681Zr+kqwsE5etRF6olwWE6sz7BO58CTxlEgOY6sICzgCuODqE1kFhp0twZ8hTqGC6jWJkpFlcEoI1eeG0CZUGvJdpJQRavDg9FueVdL+6VKqPMnmKPVabryp41bsrMqZAvIYJPV3V1EgDOepcI8ShDk18cv3aghFYzToARSWGdz2moxjeK+/r5GvRq7XNzAvzZ8MyHUUK4ocPvz0r7PC4r7UouSUUW8RGIRab0Lpk+G2CppwfldKtJK/dSx0uNZVwN8rl6IbUBuTZuGVAYLZWBkklqjvnOGYGPQi9kU2iV8Pez7/PBCN/g1H0SFOiczg9qm3lid3jtOIkCyAfmGB/xvSdvm5kizh+7987EC2Go3zebyTFv1oPyoY6umd3exhM3mf7bHFwOVkRXPVVBsZBn/aSOmZyuzQXsQi3g2BGOEUaQhUPKyk+KI9O/YcNrASU/+5Hvda8Gb8EMVVJApnUunqGJM7nY3nEZYDeNnTY6gps6T3XtlZfTy+WJeoPgkO28emupAmT0lUWvKjZlhkDR9ngoG5RI24mR3TiDdWh/hqfHqgQuZCfc2O2XyT5P6a4Ie10U2p3LW/s/o4nGlknkuFcpZ0JFSJJwVWmI11y39EXOLJf87MHWO0J81VKEz3u8p7MnPON2mV1tcaX5FQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(136003)(346002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(36756003)(5660300002)(86362001)(47076005)(36860700001)(81166007)(316002)(70206006)(70586007)(8676002)(8936002)(356005)(54906003)(4326008)(40480700001)(41300700001)(2906002)(336012)(110136005)(426003)(40460700003)(83380400001)(16526019)(26005)(1076003)(2616005)(82740400003)(6666004)(478600001)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:18.8100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2ac0fc-aae8-4c96-97e4-08dbe744c72e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7821

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


