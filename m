Return-Path: <linux-input+bounces-703-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3B80E10B
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0431F21BB4
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C27816;
	Tue, 12 Dec 2023 01:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SznqO+hk"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4142CF;
	Mon, 11 Dec 2023 17:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HKuINT0Ct3XTbLZEBxOH69/MrfD1nhPn73wILyAPA+EyaApYWdVJYooHwNa5r+QucBzkuw+XluQp4P8VZwjunG9gtYz3AatOsV4nIvMo1QukNSO3fWygRgPIKMnvKMgNEfSDqxFYZI8cF8AFGq8POHZPlFm4LTqi1WRpwq05FnEv9BT4xmjr4VTYHyzkyYpknGJggbCWRAPRTd8hXKwGwIo2CfJcC7KedCzkzhabFgE7o84MvviOHTe6omGDPUInJ56M4T7+DhHYgXDqGelhlBh5oEsIsxREd6aerzDmex/uYcgWLBRYXdxw0gz3OpH/4DF7e4xpRroIZAia6+udYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hBiXtprdvG923WopV37LJPAfV5rCzXNXPhWOSwScX4g=;
 b=Z8sv75deU3C9cGv2m5LI+qoledowimxlfjGYWz1AnOmWhzD9li8C+yoeJqxJFiqqyTMX2c9rmaQF+X0fK2mC+saxS2yjmGOMvZ5qJSuEu5sQC9qdx014ruMyBDDPHRBX/0L2X8DCITWi0NGW2pJcH8nouWgt5APdpor2b+kRkSsKDowTJQgHGK+MxGhBPb/gOKUDSzQoxzfcmxf5Ot+LM4XPOCXXTGw3OoAQ1bvTCtX7o80yzOb0IEn7rrqW52WgmTiVBSmglQw4EgIrzHTqBfNA8ttv3opc6PBKceMZ4gf93WxedibPRycrXNuFC0ql8toLUoU/bmBkDDDN9YxazQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hBiXtprdvG923WopV37LJPAfV5rCzXNXPhWOSwScX4g=;
 b=SznqO+hk81AinE7rhS9E147ul+4Stm5Cn0FYlC78QwwSBnoQ6NdAuIjy97hLEYsf9ILACV8QfZWfxtzWASEEi+6HkPrM2lNUadkTVPeBUX3XssVGmALukEpzm9eHbvAJKHQ0x4HCSFwaKmx1WXKFj1/hTD4TDHVBBeeQomjNgLU=
Received: from CY8P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:46::9) by
 DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.34; Tue, 12 Dec 2023 01:48:08 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:46:cafe::b9) by CY8P220CA0013.outlook.office365.com
 (2603:10b6:930:46::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:48:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:48:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:48:05 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 08/12] platform/x86/amd/pmf: Add support to update system state
Date: Tue, 12 Dec 2023 07:17:01 +0530
Message-ID: <20231212014705.2017474-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM6PR12MB4283:EE_
X-MS-Office365-Filtering-Correlation-Id: b3fa17f0-d310-4327-fd58-08dbfab46453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	t/zRMOon8cB3R5hKVwo5xajI4HLcONMqjGj/MQfGhtziowJTyepYJW6V6V95+lEkLiwRLG7qjJzAegszpbK8k568CB9K+lB4csg8fiblzzh7kDGzYdnt0hAdmB7PDkn+cDINScJcvsijfxjRMPghsvMi5Z9YUE/v/XkUtKoSPZ0GsntdrqDzGZ5hVfI4SH5C5fMHEKj2MXVWoxmbhPQAhIslVz2BxY7TIJnJo0awrn2hdtu3qa6PBFGx+FlN2DkWydtLfoNTcrwcNrFchDRRBK3klRz73P79xM1rab/4fj4D+i6dIqXLhWU5t8v803xZqrsN43kHpBKQv9roBX0KY1WJTxxPNCKqYH9XyhKSaejsqFaSnQDxsxnY2O48Wf3hYsEWi6YPpuzxEApnTOHiy/KeN9mnxLutPjmzUHHXkrvTuVeaTSZ1alfZ1eZcuQ6b1v8t/9TVL2ytg/oFRsLtXL5eUAhMJp3Zb9S1OPATIto277Lt2CiK1OS7bLi4tP3bUunm01uSBNpryozUCMecEcWEm824GAK67Ti8iMOasPcPbs85725cH3hf9yJloNoHTxieC9/06VpcSv3/IZjs0Hdr06A77K0OZglCcU0QphgGZFJNa2m5o3ocYQUTSrs13XKZlbdlTnWDF2an6Q4V24SharoVC7y33qEuPxfjVgeeqvNhzCtNsaTioUPBVQlGeFFs6zGRkwXxJiCSwswSGoYWN44kux7UTGLyjeJgdu2pDtyImQij4jS/QQl0kkk20pptBAgRdOJOEgiUJp9acA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(36840700001)(46966006)(40470700004)(40480700001)(40460700003)(26005)(16526019)(336012)(426003)(2616005)(1076003)(82740400003)(356005)(36756003)(86362001)(81166007)(47076005)(83380400001)(4326008)(5660300002)(15650500001)(36860700001)(7696005)(6666004)(70586007)(70206006)(110136005)(316002)(8936002)(54906003)(41300700001)(2906002)(478600001)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:48:08.5621
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3fa17f0-d310-4327-fd58-08dbfab46453
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283

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
index 37bf1c701361..50f98c398727 100644
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
index bf8cb98d41ec..8811631c7be5 100644
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


