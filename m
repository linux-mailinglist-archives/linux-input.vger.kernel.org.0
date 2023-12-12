Return-Path: <linux-input+bounces-696-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86280E0FD
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E30C42826C8
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9286DA55;
	Tue, 12 Dec 2023 01:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vXLQ44Kh"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2551DCF;
	Mon, 11 Dec 2023 17:47:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DSSuwtFALxTubVafxKr8tKrIeRuh/Pd7zM6VaVXg5IKISZadX9/Uu0DAMqkarJ5LI0dLMktVqbP2HLXbIUkdR9xgfUuONWdeogEuNbQt1hTr31pyoasXJhemFB07+0zIHtvMky4L3F4C8jK4DP3DnmsuZNWbK7nYr5hp7HLiEZbe+WM8hVUYNtrmxEmxCywhIgbGGwLttLzg7/DbGpX4ot5PVeK1f2WLPS62XUsd+kuAwctMY2fEebEHEZ38QMx4GxH4bUMsMwPcQZrhJDcvSY3sbWgIuepJZbZ+1f7u2HMJGbvRzkPRhRYbDLp0cGRj//R7sQa7r6EpeD763EPxWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94c9Q5V+XUdv8Ka4fJVccg+grc4RvDx4r/hek9LK+R8=;
 b=oY+EMVMOpLtJFcdPn6ex0j9koCZpc1h/6mY9LxHvZr4nLsnNVWPI1Pp3y5EeldGU6jwqVrOCEW6kjiFr9DY6UyUyt6EvndD2N6VGjLM54ATf0knJpyjicn3fh1BxWfy3tqcJb9g2N0eWWfMSqnnJi+QhwrDpod2qFCiFwKdtU52Do2qQwjEL8tcnMu6CqYg2ytdawVGF5WQvjYZlRIiAKMYNPY8Ul7URj4F98Cpfv8UX6EiRdtj7+rOLiYlSWjUBsjcxNmrE0zA9FoP2E/+HciJvFM8FigQcQKJ6IpeLLOgNCntlyZ4WJTf/hMArLT4Tz+32lLACHHnWQyhsN/sMCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=94c9Q5V+XUdv8Ka4fJVccg+grc4RvDx4r/hek9LK+R8=;
 b=vXLQ44Kh3b/GFWM8qzgx3uypLMMX7BzKQU5GSucnf1MEAkUwYSu7vU0uyKkw4fRp56/LHmtvvz3WSq0jqEmdpbSfznV7bPzyEvY/r1Otj+kuCFakYWlj3Pgmlos+Rq+T2K+smATG4nBiSE++62hJiF48Q2B2TJiPJdvv4DzS5V4=
Received: from CY5PR16CA0009.namprd16.prod.outlook.com (2603:10b6:930:10::22)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 01:47:45 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:930:10:cafe::3e) by CY5PR16CA0009.outlook.office365.com
 (2603:10b6:930:10::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:47:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:47:45 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:47:41 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 01/12] platform/x86/amd/pmf: Add PMF TEE interface
Date: Tue, 12 Dec 2023 07:16:54 +0530
Message-ID: <20231212014705.2017474-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: deea4f58-2fb5-4ee6-59b6-08dbfab4568a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F6I4TKLEk+pyM2i55y5KmyXDk4388a4MRyqSSQk6jLoGVgpG62y8g1Th3nWZZrXi/lSUe5HIKBD3C/I9lTeesWhfhafkvy3QJoWBFI+J9rvReqFezFt3myqei1dovieMmJWf7mtlhHQLBgvYj8xfj1Yc8SdZVTNKK4wRHGtegcNSfhUXMC3nHaZD3/iWkjS2QBIOGDHxuXAGc9BbZdgl60X6OTQ2mFKFbf1qDm9ekYrZi8EojKF5JYwWMWpktdmPXlNQX1+btmWztf9odbOO7q4sXycBSn5lT3upTRNzPIjYxs0JPkV40wkr9iTBF0kBA7OfKfUAx8Ru71g0HdxcDio4uDXZ4usATzM+eHvAh6w885Beq/HpQ8dq/U2JAAhoYpDbVv6tRA+L4ymJYOTSMtGxw6FWcAoH3Da+bfdvYgnJWQ7s30vw0IAbiiKOeJHYGLG0EkFPy6cY46vVUYVXr2sQnsABU/zVg2OftJhky1TekTt/DJHxvK+Eylrr1Y0MGGIly1QWcbkzUdGMLk/KmUOWTr1j2MitE8UKy+Ns4Aj2VH9dJ5Z6iat5XCKyCdn1EX9f/0BYjwK8y1FmxjQ4hSmDI8vOK7KA/IHy9sc8vuP4p3IsML3HCKUivAK727InhUILmEt+sS1Q1JY3sRV6hFTIOPlFR0qB/K48LwmtqforN0u8bdMK4BP90GCEPTacVjBtEJUgnrt+gQiK9/WO8gw4xfEamuV/HbCgdJjMLlFlXFOSHWThy/3leFBNECDsn00nbeLhwKCYZUofg9c3Aw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(346002)(136003)(230922051799003)(1800799012)(186009)(451199024)(82310400011)(64100799003)(36840700001)(46966006)(40470700004)(1076003)(26005)(2616005)(16526019)(336012)(6666004)(7696005)(478600001)(47076005)(36860700001)(41300700001)(83380400001)(5660300002)(54906003)(2906002)(426003)(70206006)(316002)(8676002)(8936002)(4326008)(81166007)(110136005)(70586007)(86362001)(356005)(82740400003)(36756003)(40460700003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:47:45.4928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deea4f58-2fb5-4ee6-59b6-08dbfab4568a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438

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


