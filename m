Return-Path: <linux-input+bounces-438-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30B80305A
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 445E51C20A8E
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E92E51EB43;
	Mon,  4 Dec 2023 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iORTPgUK"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEDC5DF;
	Mon,  4 Dec 2023 02:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VB4GPXC8zyhhs35OOxTmJ+4BtbmZqClUVS+SKF+RZmIbRoTqDl934yTLL/pU3M8ianLjJDifC3lfn2icgAUhfRdkiqz6Y54FbVelKKUql1VF6XhRgGr8aNpvZhfrCmt8KNDN45chsC3+W+D3bV68ia1YA+jMQdEHDyp24xcGZ1o44G4u4Dv5UHTqUZ8O807iD3CbMJ74tJvCm8LlrS8dxbPpHi0Vd0BYTRkWKUxwvMZxCcvTCtbpfiZ0sfCcjTgtBqrO/SITXKyqfpRdHsuGfn+CZ+HAlHLGPMWt78aJMe88Fyy2oU8TiQxPkKPm9lDUXErAlEzQpcCKTYEgghAfEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94c9Q5V+XUdv8Ka4fJVccg+grc4RvDx4r/hek9LK+R8=;
 b=HwWrYEADmQe81eBH0NuFJFwfWaL6eobEdjAWz+QCGIl+qhf+cD2y3qoTpQsZWgMT3MspuwXJ0ixlCMuoSVdmAhOVBi79ZXBoxvmdaEyKbB/UfhHASIkUgS9XR6tuXhzb8dIiEkUCr7W1e1AMbB2AFrAwVGyvdnCGwiACvd0kyNoxYNhvsqplEVxOyzXIV/COKdYRsZkCierxyFJwYmwy1ZpGqglbRwdQgsqCN9u+V7T7d/tPyzKCKHe903t7IrGn27Ticg9lBe4r7BTeK+b/02EWYtR/jFq5D6Q40dmwpieCuAin72VC9fpGAhB6PcKVGGAAWvThXtLr93plgLQnIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94c9Q5V+XUdv8Ka4fJVccg+grc4RvDx4r/hek9LK+R8=;
 b=iORTPgUKKc7hKRzgpzU8Zd8h+d5BkHGup4f8S97a4fY/gOOTiOZz3o78z1zMdqfTB57EJtwEEmBfpUbh+eC5cY+ivxamsMUPeo+NqL1cEf2P/xfboDrtIej1ic/mX/Yu2VDfPqtvzCfmTmWVQYf2AIrO/31Yr1mLc2QHOiTMsrs=
Received: from MW4PR03CA0338.namprd03.prod.outlook.com (2603:10b6:303:dc::13)
 by CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:35:52 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:dc:cafe::df) by MW4PR03CA0338.outlook.office365.com
 (2603:10b6:303:dc::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:35:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:35:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:35:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 01/15] platform/x86/amd/pmf: Add PMF TEE interface
Date: Mon, 4 Dec 2023 15:45:34 +0530
Message-ID: <20231204101548.1458499-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|CYYPR12MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: c0938cd4-88c6-49a4-d14d-08dbf4b4ca06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hGAz9QyMAWUafmE1PuUHdOix3xeDOrOEVrnZZtPzoxrzDtbfwAFpTGOgKMyfBe2VPsBwv7boNwT73d73d5+GDtADGeL1M292toRHydTzZqbIEw5RacBYTANfG1d91z4YhUXyPjcEGW31rsKmCKVHiZjUNkkv4TNbIkwUxEaqOSYqpOPOFeqsrDkdMg9q7kT7zKo+flTle7x1Ng2avWB6ymlJgyz1zO15qHF6H8mCEOPZc2zZlVtM2oWu2bCQCsczCVzU1Ebp2u2jmOuYFKLcHuLFo0Jh8kkUURzQ3J9g3zazpjl0YjKWJVhkFxwPIosJU0A3yyz0SsR14qL48Jx2n8aBUauUteeCldQ8Ot48oSG+E2BdX/nL8xlpDTe/2RmZ+r4WMS0nKNHO9kfMETxmamUNJ6EijUS1PXKcYW0Fc+etefFX3GbsMp+KoOOUjBygq6i+5cBsHiit/N6sZt4qAsR4i22JEkKlAY0Ze3GaDzwR/AWYs3wlGk5tJcLKB4RxgtB0AzWzMp9QZ8FNLrSdgiqIssyY/tY4V+QLVTiHmGRKk/MKpdRrSIStEm071EA3oqTwr3l+94QbK88VDEwiDt7NjBwIQyDI/EGbvFO9wAl/dlBnjwNO3d77/eIdi+BZB7lgTcR04Yf3c2XxR7SYTTPIh0aRpBMKjgsuR+2Zo2eZTaM+dKDT1BnUBZ0+G/DkNGysvhJxEIuhkqMbzP/HIlN7Qp4oH7sJQZ6VZFtpw9AwACY4cgeJ6Res794zTwNlgzeEVxiHUKUodG9LnknqTg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(39860400002)(136003)(396003)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82310400011)(46966006)(36840700001)(40470700004)(40480700001)(40460700003)(36860700001)(47076005)(81166007)(356005)(2906002)(5660300002)(82740400003)(16526019)(83380400001)(6666004)(336012)(26005)(426003)(7696005)(1076003)(2616005)(70586007)(478600001)(110136005)(70206006)(36756003)(41300700001)(54906003)(4326008)(8936002)(316002)(86362001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:35:52.2073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0938cd4-88c6-49a4-d14d-08dbf4b4ca06
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992

AMD PMF driver loads the PMF TA (Trusted Application) into the AMD
ASP's (AMD Security Processor) TEE (Trusted Execution Environment).

PMF Trusted Application is a secured firmware placed under
/lib/firmware/amdtee gets loaded only when the TEE environment is
initialized. Add the initial code path to build these pipes.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |   1 +
 drivers/platform/x86/amd/pmf/Makefile |   3 +-
 drivers/platform/x86/amd/pmf/core.c   |  10 ++-
 drivers/platform/x86/amd/pmf/pmf.h    |  16 ++++
 drivers/platform/x86/amd/pmf/tee-if.c | 105 ++++++++++++++++++++++++++
 5 files changed, 130 insertions(+), 5 deletions(-)
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 3064bc8ea167..32a029e8db80 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -9,6 +9,7 @@ config AMD_PMF
 	depends on POWER_SUPPLY
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
+	depends on TEE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index fdededf54392..d2746ee7369f 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -6,4 +6,5 @@
 
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
-		auto-mode.o cnqf.o
+		auto-mode.o cnqf.o \
+		tee-if.o
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 78ed3ee22555..ec92d1cc0dac 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -309,13 +309,13 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
 	}
 
-	/* Enable Auto Mode */
-	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+	if (!amd_pmf_init_smart_pc(dev)) {
+		dev_dbg(dev->dev, "Smart PC Solution Enabled\n");
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_init_auto_mode(dev);
 		dev_dbg(dev->dev, "Auto Mode Init done\n");
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
 			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
-		/* Enable Cool n Quiet Framework (CnQF) */
 		ret = amd_pmf_init_cnqf(dev);
 		if (ret)
 			dev_warn(dev->dev, "CnQF Init failed\n");
@@ -330,7 +330,9 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
 		amd_pmf_deinit_sps(dev);
 	}
 
-	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
+	if (!dev->smart_pc_enabled) {
+		amd_pmf_deinit_smart_pc(dev);
+	} else if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
 		amd_pmf_deinit_auto_mode(dev);
 	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
 			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index deba88e6e4c8..bd40458937ba 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -179,6 +179,12 @@ struct amd_pmf_dev {
 	bool cnqf_enabled;
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
+	/* Smart PC solution builder */
+	struct tee_context *tee_ctx;
+	struct tee_shm *fw_shm_pool;
+	u32 session_id;
+	void *shbuf;
+	bool smart_pc_enabled;
 };
 
 struct apmf_sps_prop_granular {
@@ -389,6 +395,13 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
+struct ta_pmf_shared_memory {
+	int command_id;
+	int resp_id;
+	u32 pmf_result;
+	u32 if_version;
+};
+
 /* Core Layer */
 int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
@@ -433,4 +446,7 @@ void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
 int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
 extern const struct attribute_group cnqf_feature_attribute_group;
 
+/* Smart PC builder Layer */
+int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
+void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
new file mode 100644
index 000000000000..6ec8c3726624
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver - TEE Interface
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ */
+
+#include <linux/tee_drv.h>
+#include <linux/uuid.h>
+#include "pmf.h"
+
+#define MAX_TEE_PARAM	4
+static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
+						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
+
+static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
+{
+	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
+}
+
+static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
+{
+	struct tee_ioctl_open_session_arg sess_arg = {};
+	int rc;
+
+	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
+	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
+	sess_arg.num_params = 0;
+
+	rc = tee_client_open_session(ctx, &sess_arg, NULL);
+	if (rc < 0 || sess_arg.ret != 0) {
+		pr_err("Failed to open TEE session err:%#x, rc:%d\n", sess_arg.ret, rc);
+		return rc;
+	}
+
+	*id = sess_arg.session;
+
+	return rc;
+}
+
+static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
+{
+	u32 size;
+	int ret;
+
+	dev->tee_ctx = tee_client_open_context(NULL, amd_pmf_amdtee_ta_match, NULL, NULL);
+	if (IS_ERR(dev->tee_ctx)) {
+		dev_err(dev->dev, "Failed to open TEE context\n");
+		return PTR_ERR(dev->tee_ctx);
+	}
+
+	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
+	if (ret) {
+		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
+		ret = -EINVAL;
+		goto out_ctx;
+	}
+
+	size = sizeof(struct ta_pmf_shared_memory);
+	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
+	if (IS_ERR(dev->fw_shm_pool)) {
+		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
+		ret = PTR_ERR(dev->fw_shm_pool);
+		goto out_sess;
+	}
+
+	dev->shbuf = tee_shm_get_va(dev->fw_shm_pool, 0);
+	if (IS_ERR(dev->shbuf)) {
+		dev_err(dev->dev, "Failed to get TEE virtual address\n");
+		ret = PTR_ERR(dev->shbuf);
+		goto out_shm;
+	}
+	dev_dbg(dev->dev, "TEE init done\n");
+
+	return 0;
+
+out_shm:
+	tee_shm_free(dev->fw_shm_pool);
+out_sess:
+	tee_client_close_session(dev->tee_ctx, dev->session_id);
+out_ctx:
+	tee_client_close_context(dev->tee_ctx);
+
+	return ret;
+}
+
+static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
+{
+	tee_shm_free(dev->fw_shm_pool);
+	tee_client_close_session(dev->tee_ctx, dev->session_id);
+	tee_client_close_context(dev->tee_ctx);
+}
+
+int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
+{
+	return amd_pmf_tee_init(dev);
+}
+
+void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
+{
+	amd_pmf_tee_deinit(dev);
+}
-- 
2.25.1


