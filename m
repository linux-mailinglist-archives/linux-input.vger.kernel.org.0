Return-Path: <linux-input+bounces-93-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C040D7EED35
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:10:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06EA11C20836
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316D6FC0B;
	Fri, 17 Nov 2023 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="LWRFjSOb"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 393A4D6C;
	Fri, 17 Nov 2023 00:10:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MzQvrFtsHRZxn18lputLxgaKMvjgs9e4qrQnXwBtvZcyYiG5WEyVQ2CCwrguE1HOClyCc+nOUFtbrxmc86KzWhWhNOEcqw837M9uOgEHWAw/Ww8Df8jPIGR3/RWq/0ViXUT+nmCLn5k+ElS50i9aNoIaQE55UDsIPjTKyGzK+Mxg42YIOPtOdFX6sgf4XtqPEtyKy1tFScbcrIDE7kp4CpJmkKY1j82KPXmwscqkbp0Oe6OcNKJYI1f/LvELJdWoiDFMf50rSlJ80LL0rb3kLvzHSA23OPLAzjSZY8VxHC1ZEXhYD8gM/X6zNjNhXkEzCPvB5M5fODkcTpn9ml7lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmU7y06Itd7QfranZqr9or5/oCfwvJzwuG0mWOSWRpI=;
 b=EK7iDvQPwahD3rxc/5p1Sk0qba+oEiA2IY6DRdH4swaXlniK1r9xVOvVxeGux903GBoGavbMSg2EF8j/Tc+aWlmqP2vgAG3WYbUzjDa9VykVnZf1bW3EJS4xTcSJx2xDqP68Au3JPEt3mX8WTFm5VxoaMUdzMMa+SPOaxe+SoeOIwgg4ozrqgyjPjEfB7wXs0nu7mNFpdJgCj3mU7RA70Cr802DQfSltdRXd8jV5su+BYPqMnw+kQzzf+lNitLbjYtQZAFuSpNz8rXvN02xOxWm9jCQt5BB06s6eFK+KAyOuq6lxUgs21Bd4tORQb3i4Psgy5Jwa6DyydLEL+9CwQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmU7y06Itd7QfranZqr9or5/oCfwvJzwuG0mWOSWRpI=;
 b=LWRFjSObx1BZ4KjEku7wUGYoaC2Ez9wtO6dAHjPO8SyzheWUOzBht+Xtkcc4vym04iWpN2Dt4SWFAqx+EMOCPpii7/cUg5TGW1CQM8nQaGads26b8+mRL0MdHYrk9ykkHXJ2/gqh9ws9/15UHrblT04Pl2E0Nq86ipPCdoAtcjk=
Received: from SA1P222CA0178.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::26)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 08:10:13 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::ce) by SA1P222CA0178.outlook.office365.com
 (2603:10b6:806:3c4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:10:13 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:10:10 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 02/17] platform/x86/amd/pmf: Add support for PMF-TA interaction
Date: Fri, 17 Nov 2023 13:37:32 +0530
Message-ID: <20231117080747.3643990-3-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc3463d-11b6-47b5-c63a-08dbe744a02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UgsniA46CHv0VGb4aIeSAZGTT2AtCusYAionjR8+6vwGSNqJclyZsuehspF4BS3ji1BUxKu/7A26O5UzoSmOUhOwPw0AJEOAJxoBWm/PlNZfR2UC282N7U8wvvc4U4WqMxgSo6fnxN5DcGT32sq6mut+whzHy6cveRE7+q35RLFe3lx/esaVxvR8uiT+3CzoJ36DP8jpxd6MAFfb7ATdsAG6+/0mzeZyXuS7Ax52Cu1DHf5bR6rA0VEahpHgy1obiFQQ2/Y6ju3FacwyQnYmeCvnkTr0d675ls63EpTtQj6hLi3ZfhK9C9rIhwl956cZfkeQfV7Bo2azqq+27/kVKu1G1VScrZCLbwl3lrbBECDr23XhT/pf1hOqC+sO1YvtTo95ooMWY1voBBZiShOt9zuEm/G+KFFv93gFipud2+9eAUleSkqW8cemK1uL57hM7K9Z7Eaz+Ukbmg+CrQ5ZwhFnkGlbkVl90EM9e30DBmw0QzOOdqhxexJ5YW3D2vLvVP+PKwKoTLTbrYzWl6OqYuaSFbz+vFmT0p5zye7jTjSeg0YObO3cE6VzEqQ9WCvo/5132LIRnpc3ABwVQpiI2FaI6QZH8mNy9ZpvwfOGugUG/GzDjcHCZoS+mFK6DN1Ys7EYBhaDsnqk/brzfU1iKuGJmuFAjzO7XK6igj5gOFzA42RHacm06xn7cU1S4FB3clg1JHVBGINRHwD0sSsQ6/BKcnAcPr3nCXQcbhHZht78KlCkFA39FyzaQ0kzr5w+WSBX6t9JXPBi048nPtmBag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(82310400011)(64100799003)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(86362001)(40460700003)(36860700001)(81166007)(7696005)(356005)(6666004)(47076005)(41300700001)(8936002)(4326008)(1076003)(8676002)(426003)(336012)(70586007)(316002)(54906003)(2616005)(70206006)(82740400003)(110136005)(83380400001)(16526019)(478600001)(26005)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:10:13.3538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc3463d-11b6-47b5-c63a-08dbe744a02a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693

PMF TA (Trusted Application) loads via the TEE environment into the
AMD ASP.

PMF-TA supports two commands:
1) Init: Initialize the TA with the PMF Smart PC policy binary and
start the policy engine. A policy is a combination of inputs and
outputs, where;
 - the inputs are the changing dynamics of the system like the user
   behaviour, system heuristics etc.
 - the outputs, which are the actions to be set on the system which
   lead to better power management and enhanced user experience.

PMF driver acts as a central manager in this case to supply the
inputs required to the TA (either by getting the information from
the other kernel subsystems or from userland)

2) Enact: Enact the output actions from the TA. The action could be
applying a new thermal limit to boost/throttle the power limits or
change system behavior.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    | 10 +++
 drivers/platform/x86/amd/pmf/tee-if.c | 97 ++++++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index bd40458937ba..a24e34e42032 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -59,6 +59,9 @@
 #define ARG_NONE 0
 #define AVG_SAMPLE_SIZE 3
 
+/* TA macros */
+#define PMF_TA_IF_VERSION_MAJOR				1
+
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
 	u16 size;
@@ -184,6 +187,7 @@ struct amd_pmf_dev {
 	struct tee_shm *fw_shm_pool;
 	u32 session_id;
 	void *shbuf;
+	struct delayed_work pb_work;
 	bool smart_pc_enabled;
 };
 
@@ -395,6 +399,12 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
+/* Command ids for TA communication */
+enum ta_pmf_command {
+	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
+	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
+};
+
 struct ta_pmf_shared_memory {
 	int command_id;
 	int resp_id;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 6ec8c3726624..4036f435f1e2 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -13,9 +13,96 @@
 #include "pmf.h"
 
 #define MAX_TEE_PARAM	4
+
+/* Policy binary actions sampling frequency (in ms) */
+static int pb_actions_ms = MSEC_PER_SEC;
+#ifdef CONFIG_AMD_PMF_DEBUG
+module_param(pb_actions_ms, int, 0644);
+MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
+#endif
+
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
 						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
 
+static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
+				 struct tee_ioctl_invoke_arg *arg,
+				 struct tee_param *param)
+{
+	memset(arg, 0, sizeof(*arg));
+	memset(param, 0, MAX_TEE_PARAM * sizeof(*param));
+
+	arg->func = cmd;
+	arg->session = dev->session_id;
+	arg->num_params = MAX_TEE_PARAM;
+
+	/* Fill invoke cmd params */
+	param[0].u.memref.size = sizeof(struct ta_pmf_shared_memory);
+	param[0].attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT;
+	param[0].u.memref.shm = dev->fw_shm_pool;
+	param[0].u.memref.shm_offs = 0;
+}
+
+static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct tee_param param[MAX_TEE_PARAM];
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!dev->tee_ctx)
+		return -ENODEV;
+
+	ta_sm = dev->shbuf;
+	memset(ta_sm, 0, sizeof(*ta_sm));
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%d\n", arg.ret, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
+{
+	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct tee_param param[MAX_TEE_PARAM];
+	struct tee_ioctl_invoke_arg arg;
+	int ret = 0;
+
+	if (!dev->tee_ctx) {
+		dev_err(dev->dev, "Failed to get TEE context\n");
+		return -ENODEV;
+	}
+
+	ta_sm = dev->shbuf;
+	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
+	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
+
+	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
+
+	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
+	if (ret < 0 || arg.ret != 0) {
+		dev_err(dev->dev, "Failed to invoke TEE init cmd. err: %x, ret:%d\n", arg.ret, ret);
+		return ret;
+	}
+
+	return ta_sm->pmf_result;
+}
+
+static void amd_pmf_invoke_cmd(struct work_struct *work)
+{
+	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, pb_work.work);
+
+	amd_pmf_invoke_cmd_enact(dev);
+	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
+}
+
 static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
@@ -96,10 +183,18 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 {
-	return amd_pmf_tee_init(dev);
+	int ret;
+
+	ret = amd_pmf_tee_init(dev);
+	if (ret)
+		return ret;
+
+	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
+	return 0;
 }
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	cancel_delayed_work_sync(&dev->pb_work);
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.25.1


