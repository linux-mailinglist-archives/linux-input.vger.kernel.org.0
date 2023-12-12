Return-Path: <linux-input+bounces-705-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 886FC80E111
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4B22B21716
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063781367;
	Tue, 12 Dec 2023 01:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h/gX2CzL"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF915D0;
	Mon, 11 Dec 2023 17:48:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsn0HuiDvZ2r6MlAY1XU4txQHPgM3RO780x9nt8NMiOTni3RS2EB4ClmFhG6n3VcFbIRHGFXPava8aho3TqBu1vUQGukqlBWFtt56oiUnCWT89xko/a0CAzQ7pQHMlpHpBZ41kh9g2/52btOQbhV3Nc4355qg3g43Aw0Bgv/mY4n5dy35DJs045jeShg338GmxLXbEbkp1w+o0r0HHRb0NTWxIcqztGOWI7L/wII8V66KC8zhUSt9l/TA9M4QJaVTi2F1/YgZwIyA0K2BbixBBwFbPZpOtgHIGS7Ooymyn1FxHe0BlOU+SRoHR5DeDtHxAZksx32ASiFYjQfvIte0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ElN1/yLg3i9/CPrO0EUCAdomfr71IOcXnKFt1UD8xUc=;
 b=gvuTzj7VYBDNywYmRTYBkj82NiAnEwNbF+Hu4pdwEiOpG0/z0bNCcq2CvX8d2RCJe6iMs8seg/dBmhbGn6LMUNLigvgs/MaJum6HdmCeoSu8fNX1HTkZZ53TA92/oVeoQstQfO2DvCa9QDQVGPetNnkJXuzJmbAxpjjluMPz6kQ5g+qDnbMKoUAWt2LviBOVdYT2Ql9HKM//jHVMQfS4OEUhSNJD0ZVo8a8CudxUyC6GEIdruDVLTa0hDhdo3iUPQA6TZdsMDmKrJeTvl6F1Cr1MwGbxpagqgE4q/Q+n1XGa0KYGX9OyQRiVRQJ4svisL41GrFMgM5kIwdoR2JsqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ElN1/yLg3i9/CPrO0EUCAdomfr71IOcXnKFt1UD8xUc=;
 b=h/gX2CzLo+sLbZY9jQVJgBJ4GxtbqEpo1Jdt5a8bhWLdx1I+LEYRqhrwCTGkVRSX5V87/vbVt/C+FSJwtHAklP+2o1ivD1+EREe2BNyOaAWKlIZX/2nEKeDEg2quwXfHCGJ82W6NVTRu/xPtS3h8aCfr9lhpWvL3H83JHfpbdxE=
Received: from CY8PR11CA0042.namprd11.prod.outlook.com (2603:10b6:930:4a::16)
 by DM8PR12MB5431.namprd12.prod.outlook.com (2603:10b6:8:34::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Tue, 12 Dec 2023 01:48:27 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:4a:cafe::dc) by CY8PR11CA0042.outlook.office365.com
 (2603:10b6:930:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:48:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:48:27 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:48:14 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 11/12] platform/x86/amd/pmf: Add capability to sideload of policy binary
Date: Tue, 12 Dec 2023 07:17:04 +0530
Message-ID: <20231212014705.2017474-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|DM8PR12MB5431:EE_
X-MS-Office365-Filtering-Correlation-Id: e0885564-e61f-4262-3f1e-08dbfab46f91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	b2unZJOkTQoQFavvvbJ29f41OLtD/R19Lim//6dMSqqogk2lHrU3IUI/1o5os6BVXsYwS6xRxBI2/4BdWDR0bnsvOjQTPzdhykilJkQ+GOy/NpkzJ4vqFnNJDLOKLldX6r1bsxUQ8A37seI68vMxyFVLveg7so+dLKENBTg7Xdi4G1wvCtEq7HI54uBk02XSrBnelCxMe5xhsvDTOpB7SMHlrPxT/igWCOJwivQnXqNEZZz2EVijPGsWgZRQiCtPlNJ2CNpI1DiL8++P2iTtUa5PoZMWseGlNzGfMexXCQ5nt5i93ZpirVIu1wmZ3GiS6t4vaHRPokw0mq2rDtlwvTLilgIuddpVD+u3R29P76MWljl8v9XH852VML/VT8i0EVI05YeSYRKW0SSZk7dDD6zVaSqqmLWWS/VVv2aHYfJPR2PKLhSznh9Y1s2s8iwrNE6XQpUEObLdtOzxGRj/rU5zC3DZVuRYCTIIBbrJXWuZxDQH6PxAkkfAo9Iqk33d+5x3H6sGFqs5//83tg2VHg2z2mS5IO1skNKZlwNyAw9/4BscXxXxYVdko2si7dCTABMeJIpsZjhhvlejeBM9j3uRwPCi/xm7aqX2O8M6mDVuKZQ8I5GukG/RbpvvoE0b2PLgGNZ2YBCvswQRMtofboI0gapE6yQ1N+tEdM0t2rNZVfNdNzPYpKNA1g3wxrkGTlpyWsTxUIVjd0L/nsef+1FKQ+VHO2He/tWsFazC9QYd/DvQErCSytkg1CvX4MBVSXNK+BW/kMxcm8n5lu34Og==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(39860400002)(396003)(136003)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(82310400011)(46966006)(36840700001)(40470700004)(40460700003)(2906002)(41300700001)(36860700001)(83380400001)(110136005)(36756003)(86362001)(356005)(82740400003)(81166007)(2616005)(6666004)(1076003)(336012)(478600001)(426003)(26005)(16526019)(7696005)(47076005)(4326008)(5660300002)(316002)(70586007)(70206006)(54906003)(8936002)(8676002)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:48:27.4966
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0885564-e61f-4262-3f1e-08dbfab46f91
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5431

A policy binary is OS agnostic, and the same policies are expected to work
across the OSes.  At times it becomes difficult to debug when the policies
inside the policy binaries starts to misbehave. Add a way to sideload such
policies independently to debug them via a debugfs entry.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c | 60 +++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 55cd2b301bbb..16999c5b334f 100644
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
index 38b75198cc3f..cf95251741c7 100644
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
@@ -269,6 +275,54 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
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
+
+	/* re-alloc to the new buffer length of the policy binary */
+	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
+	if (!dev->policy_buf)
+		return -ENOMEM;
+
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
@@ -281,6 +335,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	if (pb_side_load)
+		amd_pmf_open_pb(dev, dev->dbgfs_dir);
+
 	return amd_pmf_start_policy_engine(dev);
 }
 
@@ -393,6 +450,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
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


