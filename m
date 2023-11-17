Return-Path: <linux-input+bounces-100-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 879237EED4E
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32BE31F2617C
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA73FBEE;
	Fri, 17 Nov 2023 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zdgikIZP"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C79A4A8;
	Fri, 17 Nov 2023 00:11:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0YXysHJBEs/K69SFOCYjZE/LijPYR/0SP2hQ4WNZRhWm88/YyJ3oCnprlnOrI3cxN8KHq3LeabBGqBfGdgPAs1GLc3+SGApkLTqUCW4Ogu0baFyGxBMAmSMFMCm2S2TpRDg4uQkpWiyFTzCHeQrdYMDEhUfec8XlkbPIFOZbvqz9FULuKU/bnfOad0Ppebz026n8tTiegpnp7ZalIPDIPJ/yfsUjNrYls3xoRMom8zP2Y6fn3Y/zfosilHYdktlZoM8eQlDLbwCu5Hz+jtWNvJz5G+M5Eo5PCfj0PZVp9tCzLR0z01CLTs8IT87hEpBPESzkZ12iw/HP3dPhXeOFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q05QS+ahwjvFkwNaUNgcNSbaIHw5875enN/ozLFYSIc=;
 b=Ere8+IFuhMznMzUzXCYAkjhDpLEX7f+ORxkhY9HnfKoRCzCM6lbeVhIhJg7a48dra3whZWpcBgURRctpQ2IDldMYheDX6RnHq/Jea6K6epzAD2dQXoFQFAeC+rfhynh1LxjyTwgSa/IkMSF6sQ4KAL4cMpUluR/GhbRcJ3M22eukjTH/oH96qxdxFBhtQHjSmPwS6eP+TXDfIFUJ+7IFWRkJ50tH2OmMr5SS9+27BqO+gdoOho7h2VW3UPyvai/2FgqEdKZurM2/HNicIKlHMPQgP/q7mH5rCzxaXMYy010cUgVh8Gg4/zd2hiOt9Bcbe6CM65cHOZjawg0X3CXsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q05QS+ahwjvFkwNaUNgcNSbaIHw5875enN/ozLFYSIc=;
 b=zdgikIZPccHTk6Odr7DF/i/8d15Ec5fzYaBJa2fmWKwg9eNJ2hbxpxN9thOWU8uIbQjYMyMlDLxdqUoPRqj1h7AXxcsNXYD82PtteWaCqTl7R8Ep0TIRxWeVRRqqboE34i9tBdarLdLGHFxOwA407VjRdRgR3ywXUoR82Z4KrQk=
Received: from BN0PR04CA0175.namprd04.prod.outlook.com (2603:10b6:408:eb::30)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:11:08 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::19) by BN0PR04CA0175.outlook.office365.com
 (2603:10b6:408:eb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 08:11:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:05 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 08/17] platform/x86/amd/pmf: Add support to update system state
Date: Fri, 17 Nov 2023 13:37:38 +0530
Message-ID: <20231117080747.3643990-9-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e70766-29c2-42a3-6de6-08dbe744c103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	glA4pQ0kNnke4iJ+8znwrNlvlCLNa4i7NQd4dLTwkN7k0YqTxARfE7qNTsNb0I4h/Ps9D8PTCtRm5uJuUz3E5jww1Ob4tG1MSrTszigSSe4P9J0WksXKa+5mzcTGhOqijwjsDbDYV83bIBTNOzdvjG3YpMkVOdzlpBOkwrvk3TGD1JSnIxerVb3o6F72nLeBnZrICUe2Nvf5crLTJgh1+77hd+GatD+PTwxikQcVsBx5lyrY4QgB1hyM/tUDn9zVVb6yWN8E/AZ7wS0KSC1djW2+A9ic1Ih7w6pyIapTDwimnSKjvplKFn6D0seoN2g54QMVZe4lYyTRuwDz5uRT38XF2m3qDpiRfWabIiueNzgCPn7OelX/GTloMX/EURJbApkUdtdqHwD0w6vNk4GX+fcGEpqsYqiuvdoLxJ5idpVPZjJrb2h+i0TITg/RBKbIs1JO7HNu/dZjP//DFY29OlN1CB+3GnwPjmrLIIGIeVYSK2W2WPsL7H29QhwLLuX7IViH5gA4siswzwtIha99R+O0cKxb77U/wo5utFp/b59jmzOsjQRxESvWPqsEIX/bQEiWSKXt3n5zkJn/O3EgM91J4anIzuG2Uz8CXoPxy0BxO3my4bKTDSLn10ycdxMscIENIf+1M6284HmBuXr+PAtAE4+aDdd4ngwplTgPlEunHjK3PBdDYwfGEWrbjuNuD27/H63WxXqDbQNJCdflJ5p/3jv2xadLABpc4B6GSVFLGeqRJ9QnzCkuCzLMFvYPiXx6MVln2foYk7fOXg304g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(478600001)(40480700001)(83380400001)(2616005)(16526019)(7696005)(6666004)(1076003)(26005)(336012)(426003)(316002)(70206006)(70586007)(110136005)(54906003)(47076005)(8676002)(8936002)(5660300002)(2906002)(86362001)(82740400003)(36860700001)(4326008)(15650500001)(40460700003)(41300700001)(356005)(36756003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:08.4451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e70766-29c2-42a3-6de6-08dbe744c103
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503

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


