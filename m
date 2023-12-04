Return-Path: <linux-input+bounces-446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B723C80306F
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A845F1C209D4
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6E4821A05;
	Mon,  4 Dec 2023 10:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tsWyUrH3"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24AB7CC;
	Mon,  4 Dec 2023 02:36:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLLNT9DcpLGFAx28p33uMNLYl+4H63qekdbkjiMsi1ucEUcgvxRoB7rojKRCRxoqDWIeXOzsFqeCWI5fTckkT7db5AIXpnPtU/BD8s7VKt2oCPdHC83GaUWhEnmsRIEMzM0z0obxWOb7bw/y4TlnyYOykwot5Gevueb/41JGRA6V44ATWu09iff5BzushEH1M6m+y0y+KSCGJssouGiRG9uJyPkG6VUvyYK9lOfaUwqfaJ6he/+PTKpIyaYVm7G3X6Spk3jjJyXJsySJVwpzxpqd9qlh6jtp4xk5pkMpSAcOv6E3oK5ptFyoDfIn8WuJn8v0+wEbi0idgyAco7Xnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q05QS+ahwjvFkwNaUNgcNSbaIHw5875enN/ozLFYSIc=;
 b=ErEqYObUqzFCOxvv3Q95H8/6K8K+0Qn/GrCrMxZWszPaX+bAG7+pxBMwrg6aSXmkTT6OfmuqQqGCT7BkHDietG4sk9vLxLMHlnpRmzmwv+0hjbZRvZcAfRGbEb8tCo4B83sZAIdBmWp8Q8+wd3FuUakDB9Z1WTkyteNsPKoznGuuoxgfC0+ziXrarxD/RiFl0fIYjSMYEsUC/pu79pX5Gjp9s9GKZ5fpvBeWDBbmDliYzoH1SNZwc487npiVq0VkhtoS36X6PCCSzsAxzs0vtYdPsfs52Y1e7YqqjIHuZ69fAE3WF9/UW2z7MbE4WHQ3/AvWpLqVw2MAIFvQzpx0lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q05QS+ahwjvFkwNaUNgcNSbaIHw5875enN/ozLFYSIc=;
 b=tsWyUrH3yw1nqBldakI2cnMZCmGf2VFJJ3Y1rGTXl9AZFgvYBd5hCAwKF82ofkvS08wI+hKMpLs3aN5VgqAmos8oU39EYC0j0M0K106xhzi8X6mLrUM3U3hNFLBAcxpcTMiuZxmDs80le6tnanHhYk0afEGvNk47VVJJZT22oVo=
Received: from MW4P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::6) by
 BL1PR12MB5143.namprd12.prod.outlook.com (2603:10b6:208:31b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 10:36:32 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::f9) by MW4P221CA0001.outlook.office365.com
 (2603:10b6:303:8b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:27 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 08/15] platform/x86/amd/pmf: Add support to update system state
Date: Mon, 4 Dec 2023 15:45:41 +0530
Message-ID: <20231204101548.1458499-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|BL1PR12MB5143:EE_
X-MS-Office365-Filtering-Correlation-Id: 87a87e95-e47d-43e9-52d5-08dbf4b4e17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NEe1Z/7wR5uEusfVfNFz5NEqUf5bMWDycX5bhGTCv2kqln6tdxJXfOD10Fvou4Xwg4DBoAAxPdKTXkJ4nZlS8O//FziXRk6BNz1Wh6Pmkdl9BfUyhppkyijjfTS4A4LEPCis6mza7E4fMh24iG1YrK2E5T+VNy//T/uV6YHfVTK1Z5IWMLNUwi/l8F9QTTOIKwCZHQmkt78HyIdGnq4v05S08yOvzz3HuB9uBLr0i2JYSo/s17vA2iTNqqw/ZXL6XjIX35Y6ZiN5YIB3ZxaYF8n/WCkJ/Kfx2t2x6PdwK3iQ3tWI8qq07WPBBnCXqtwiN50/NchEJ+DOD1r7hJJjoFuWcVlUE0wZCING0IXMNnD53LPFnKvHoYqtgVWbW4pbiWxJ9MK+AO8Ciwj8QGaZ/c0IxLugbWCr7cb6bI4IFRWDWlWGWJXuIz8TdPSn/PhSbS0CYRIwcxRJt9bGahLU2ZvL6iKyHwTeBc6x4nSd2w/kyDOuGwUrNPxkaPeA1tFIaMfb6BZHMAukzdwxfVCm49sbqqdRedYTUIP9WpqEfCWQElzBbIAssUfw85ccRoRSDF/WFmf0kDFDqwuFpPkvbiXtPDN3/jjQGbpJ92qXZN4Gw77r4ve0T8E3jof8b2bJWSdZyRd2fpO15veo03aIR2QxVVQNgwLXVmOvQeufwymoh9vldg4O9cKQHp5A6EIM4hkx32D4oKXntXHjGkcYlLGSHJyfrxbVo0rgyK+OkS5ZUz+yxnzHgNE0APRxpYQ7npmf7phFsnzMgfgo92Gq0A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(82310400011)(64100799003)(186009)(1800799012)(46966006)(40470700004)(36840700001)(1076003)(2616005)(8936002)(8676002)(4326008)(7696005)(47076005)(40480700001)(356005)(81166007)(83380400001)(36860700001)(426003)(336012)(82740400003)(16526019)(26005)(478600001)(40460700003)(6666004)(110136005)(54906003)(70206006)(70586007)(316002)(2906002)(41300700001)(36756003)(86362001)(15650500001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:31.5806
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87a87e95-e47d-43e9-52d5-08dbf4b4e17c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5143

PMF driver based on the output actions from the TA can request to update
the system states like entering s0i3, lock screen etc. by generating
an uevent. Based on the udev rules set in the userspace the event id
matching the uevent shall get updated accordingly using the systemctl.

Sample udev rules under Documentation/admin-guide/pmf.rst.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 Documentation/admin-guide/index.rst   |  1 +
 Documentation/admin-guide/pmf.rst     | 24 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h    |  9 +++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 34 +++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 Documentation/admin-guide/pmf.rst

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 43ea35613dfc..fb40a1f6f79e 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -119,6 +119,7 @@ configure specific aspects of kernel behavior to your liking.
    parport
    perf-security
    pm/index
+   pmf
    pnp
    rapidio
    ras
diff --git a/Documentation/admin-guide/pmf.rst b/Documentation/admin-guide/pmf.rst
new file mode 100644
index 000000000000..9ee729ffc19b
--- /dev/null
+++ b/Documentation/admin-guide/pmf.rst
@@ -0,0 +1,24 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Set udev rules for PMF Smart PC Builder
+---------------------------------------
+
+AMD PMF(Platform Management Framework) Smart PC Solution builder has to set the system states
+like S0i3, Screen lock, hibernate etc, based on the output actions provided by the PMF
+TA (Trusted Application).
+
+In order for this to work the PMF driver generates a uevent for userspace to react to. Below are
+sample udev rules that can facilitate this experience when a machine has PMF Smart PC solution builder
+enabled.
+
+Please add the following line(s) to
+``/etc/udev/rules.d/99-local.rules``::
+
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="0", RUN+="/usr/bin/systemctl suspend"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="1", RUN+="/usr/bin/systemctl hibernate"
+        DRIVERS=="amd-pmf", ACTION=="change", ENV{EVENT_ID}=="2", RUN+="/bin/loginctl lock-sessions"
+
+EVENT_ID values:
+0= Put the system to S0i3/S2Idle
+1= Put the system to hibernate
+2= Lock the screen
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 781989c7dddd..fb9ce2593236 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -73,6 +73,7 @@
 #define PMF_POLICY_STT_MIN					6
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
+#define PMF_POLICY_SYSTEM_STATE					9
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -445,6 +446,13 @@ enum smart_pc_status {
 };
 
 /* Smart PC - TA internals */
+enum system_state {
+	SYSTEM_STATE_S0i3,
+	SYSTEM_STATE_S4,
+	SYSTEM_STATE_SCREEN_LOCK,
+	SYSTEM_STATE_MAX,
+};
+
 enum ta_slider {
 	TA_BEST_BATTERY,
 	TA_BETTER_BATTERY,
@@ -476,6 +484,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	enum system_state system_state;
 	u32 spl;		/* in mW */
 	u32 sppt;		/* in mW */
 	u32 sppt_apuonly;	/* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 9861c2702251..4c2475a28d55 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -24,6 +24,20 @@ MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (defau
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
 						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
 
+static const char *amd_pmf_uevent_as_str(unsigned int state)
+{
+	switch (state) {
+	case SYSTEM_STATE_S0i3:
+		return "S0i3";
+	case SYSTEM_STATE_S4:
+		return "S4";
+	case SYSTEM_STATE_SCREEN_LOCK:
+		return "SCREEN_LOCK";
+	default:
+		return "Unknown Smart PC event";
+	}
+}
+
 static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 				 struct tee_ioctl_invoke_arg *arg,
 				 struct tee_param *param)
@@ -42,6 +56,20 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	param[0].u.memref.shm_offs = 0;
 }
 
+static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
+{
+	char *envp[2] = {};
+
+	envp[0] = kasprintf(GFP_KERNEL, "EVENT_ID=%d", event);
+	if (!envp[0])
+		return -EINVAL;
+
+	kobject_uevent_env(&dev->dev->kobj, KOBJ_CHANGE, envp);
+
+	kfree(envp[0]);
+	return 0;
+}
+
 static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
 	u32 val;
@@ -113,6 +141,12 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->p3t_limit = val;
 			}
 			break;
+
+		case PMF_POLICY_SYSTEM_STATE:
+			amd_pmf_update_uevents(dev, val);
+			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
+				amd_pmf_uevent_as_str(val));
+			break;
 		}
 	}
 }
-- 
2.25.1


