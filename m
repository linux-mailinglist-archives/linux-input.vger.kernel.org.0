Return-Path: <linux-input+bounces-442-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33936803062
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:36:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DC141F210D5
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04901219E1;
	Mon,  4 Dec 2023 10:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Sy73Vl3n"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F1CAC;
	Mon,  4 Dec 2023 02:36:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSerri4xWpm8ccsYPORKauwX9KIsZJsUey5lahg3sSGW3xscwdcG+dQIWpqxRCZEssZrFHXCLksI+n7rgOxyK+aGrnIumAxWczmVQzAOAnugZNUUxWBfpkpsDb1DYcXIWImR19dDco5S+I9H8mwVBQiNaM7K1o4pTgCJz9/mlj9buqQ18nam8e1IY44G6ejV/91ayPNR1Wuy4KBoMeNOf+CmE+4M1ALiivY27XoRQnxCVHsLhO0cX1J4fb7P+zQuYp3r1vcWaWM6wkZ3T7xPjgkDb8YC8NJ0OFrdDN8zUxFlnZn3ar91SiYR8iXtfi0aXujQoMRe+L4OwG5z2+RagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZ4sOthzyP5ip+clrIvwmJKJQIW+l9/i0ROyxR/xMyY=;
 b=WB6wt1U80h4l0iAH34sP8igJvdnWYJ64FJdbBTokIftNPiRX4NAgsEMwnfZvHvB8uKtUBywVqiZdpvoR7Yr5wkWfrK0n1ci59//rqVc9Fv1mD/rcY2X6BbHfds89YM/wKle9MYHXLjuYJKxcvTuNWCHav77wxSg7iKSK56Ge7Zv7mWKpZeqeZQfHs5Is/lE5DfcFRRgUiConz/LjHIBi54uOajW9Yh9TaknevqRn8cd77qIQ5TfZY0Tb7QpPXoI1Loo6zM5ARY/A8lzQnLdZGgnuxq/J2gA70l/kc2yaLEuvbE7ZlkC6zf4pSnoAg9O0ir717ZCaT6+CW2UOrYzY4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZ4sOthzyP5ip+clrIvwmJKJQIW+l9/i0ROyxR/xMyY=;
 b=Sy73Vl3n52ednrZJ+PYXy0DVrb2XwVd4EW/E6XFgHA8YoVRD0uSCBCHUsUoVA4PF0FACEoduZ5vcKj7G38yDOFt1MXHxf0OQNB412JaaUVBvDFxTRQe1XhEHnttB2sc2/JSC5hnqeFuGVCXRx2jt2S9zWAsuNXmurEId2QfnpOs=
Received: from SJ0PR03CA0007.namprd03.prod.outlook.com (2603:10b6:a03:33a::12)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Mon, 4 Dec
 2023 10:36:18 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::11) by SJ0PR03CA0007.outlook.office365.com
 (2603:10b6:a03:33a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:14 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 04/15] platform/x86/amd/pmf: Add support for PMF Policy Binary
Date: Mon, 4 Dec 2023 15:45:37 +0530
Message-ID: <20231204101548.1458499-5-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 09a7e57a-0f0c-4d1c-ccf1-08dbf4b4d98d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0fEnBKMU5rodOEezLCmTmq+6kfdC0oMsqr6e6nTwcft6iyKtztfiTe8+Y5XqC6MltSmmPmwu0YA+ArndqLlCRGYVdY/UwtyCV2Q4xSAbVICtWtnn6RUNQzTVO45r964GajlDkMaRwtCnb+PmJODpyNyNq4yFCaKKz9LmCajfHT2nUM/YXFggJipsImdyAT295RHiXtIvvSK2biTo9YSrbVgC/RW5fXciav/7+MjUBoTsXtWreNZCU6/l9z+2fGiOhiam6rFpZfDmwKBGp7Mw8P1eDqWDIG03s8fTyQeUXi+PHYVgbtmBW8vXFj5dZKalNNOrMx0okN3Y8vvMJ5cj7IYfOZuS+i2taymKu0cc+rj8yER7h/Tf+9xLWKOvNavjJHo0VDrNWKy0c04yhtgvYn9tIVP+gCkomSqxgWdJTaFZr3RC92u2yIfNw70wWpUOTwFDGI5dOobayp/0QibKaeNcPi2Oty4ex8nE6XW+a1ZsTmhT/RSr5WS5tJgDPer2HW47mUAeFfvxazEMRM2m9MxZSDIJy0ezkF+YUkuJrA5za88oV5IzAbzZYUNgtH06N2l2e3iD0vprNuBp+oJ6pbnwomuf1z+jqeCpcA3tFmlMgM53zVBt+4PPKWd0tzedGmUuLR8IUbISGZJojTAcJAnvZ6gFyxidAD76GzfSjHWRq+HW4etfOiDDmqHvlwTM9SOL7UTwpA3tA9YjdNmntiLEB/CxdWS6Uaw331m0GgqhYF6NIXAMNmkYE+vSy3Dhc6m8191cWveu16uNw6kTUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(64100799003)(82310400011)(1800799012)(451199024)(186009)(36840700001)(40470700004)(46966006)(26005)(40480700001)(40460700003)(356005)(7696005)(2616005)(36860700001)(82740400003)(47076005)(81166007)(30864003)(5660300002)(2906002)(336012)(16526019)(426003)(83380400001)(1076003)(6666004)(478600001)(70206006)(110136005)(316002)(70586007)(36756003)(41300700001)(4326008)(8936002)(8676002)(86362001)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:18.2890
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a7e57a-0f0c-4d1c-ccf1-08dbf4b4d98d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175

PMF Policy binary is a encrypted and signed binary that will be part
of the BIOS. PMF driver via the ACPI interface checks the existence
of Smart PC bit. If the advertised bit is found, PMF driver walks
the acpi namespace to find out the policy binary size and the address
which has to be passed to the TA during the TA init sequence.

The policy binary is comprised of inputs (or the events) and outputs
(or the actions). With the PMF ecosystem, OEMs generate the policy
binary (or could be multiple binaries) that contains a supported set
of inputs and outputs which could be specifically carved out for each
usage segment (or for each user also) that could influence the system
behavior either by enriching the user experience or/and boost/throttle
power limits.

Once the TA init command succeeds, the PMF driver sends the changing
events in the current environment to the TA for a constant sampling
frequency time (the event here could be a lid close or open) and
if the policy binary has corresponding action built within it, the
TA sends the action for it in the subsequent enact command.

If the inputs sent to the TA has no output defined in the policy
binary generated by OEMs, there will be no action to be performed
by the PMF driver.

Example policies:

1) if slider is performance ; set the SPL to 40W
Here PMF driver registers with the platform profile interface and
when the slider position is changed, PMF driver lets the TA know
about this. TA sends back an action to update the Sustained
Power Limit (SPL). PMF driver updates this limit via the PMFW mailbox.

2) if user_away ; then lock the system
Here PMF driver hooks to the AMD SFH driver to know the user presence
and send the inputs to TA and if the condition is met, the TA sends
the action of locking the system. PMF driver generates a uevent and
based on the udev rule in the userland the system gets locked with
systemctl.

The intent here is to provide the OEM's to make a policy to lock the
system when the user is away ; but the userland can make a choice to
ignore it.

and so on.

The OEMs will have an utility to create numerous such policies and
the policies shall be reviewed by AMD before signing and encrypting
them. Policies are shared between operating systems to have seemless user
experience.

Since all this action has to happen via the "amdtee" driver, currently
there is no caller for it in the kernel which can load the amdtee driver.
Without amdtee driver loading onto the system the "tee" calls shall fail
from the PMF driver. Hence an explicit MODULE_SOFTDEP has been added
to address this.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Kconfig  |   2 +-
 drivers/platform/x86/amd/pmf/acpi.c   |  37 +++++++
 drivers/platform/x86/amd/pmf/core.c   |   9 ++
 drivers/platform/x86/amd/pmf/pmf.h    | 141 ++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 147 +++++++++++++++++++++++++-
 5 files changed, 333 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/Kconfig b/drivers/platform/x86/amd/pmf/Kconfig
index 32a029e8db80..f246252bddd8 100644
--- a/drivers/platform/x86/amd/pmf/Kconfig
+++ b/drivers/platform/x86/amd/pmf/Kconfig
@@ -9,7 +9,7 @@ config AMD_PMF
 	depends on POWER_SUPPLY
 	depends on AMD_NB
 	select ACPI_PLATFORM_PROFILE
-	depends on TEE
+	depends on TEE && AMDTEE
 	help
 	  This driver provides support for the AMD Platform Management Framework.
 	  The goal is to enhance end user experience by making AMD PCs smarter,
diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
index 3fc5e4547d9f..4ec7957eb707 100644
--- a/drivers/platform/x86/amd/pmf/acpi.c
+++ b/drivers/platform/x86/amd/pmf/acpi.c
@@ -286,6 +286,43 @@ int apmf_install_handler(struct amd_pmf_dev *pmf_dev)
 	return 0;
 }
 
+static acpi_status apmf_walk_resources(struct acpi_resource *res, void *data)
+{
+	struct amd_pmf_dev *dev = data;
+
+	switch (res->type) {
+	case ACPI_RESOURCE_TYPE_ADDRESS64:
+		dev->policy_addr = res->data.address64.address.minimum;
+		dev->policy_sz = res->data.address64.address.address_length;
+		break;
+	case ACPI_RESOURCE_TYPE_FIXED_MEMORY32:
+		dev->policy_addr = res->data.fixed_memory32.address;
+		dev->policy_sz = res->data.fixed_memory32.address_length;
+		break;
+	}
+
+	if (!dev->policy_addr || dev->policy_sz > POLICY_BUF_MAX_SZ || dev->policy_sz == 0) {
+		pr_err("Incorrect Policy params, possibly a SBIOS bug\n");
+		return AE_ERROR;
+	}
+
+	return AE_OK;
+}
+
+int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
+{
+	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
+	acpi_status status;
+
+	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
+	if (ACPI_FAILURE(status)) {
+		dev_err(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
 {
 	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index f50b7ec9a625..c8f6ec4c2e2c 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -395,6 +395,14 @@ static int amd_pmf_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dev->dev = &pdev->dev;
+	err = apmf_check_smart_pc(dev);
+	if (err)
+		/*
+		 * Lets not return from here if Smart PC bit is not advertised in
+		 * the BIOS. This way, there will be some amount of power savings
+		 * to the user with static slider (if enabled).
+		 */
+		pr_err("PMF Smart PC not advertised in BIOS!:%d\n", err);
 
 	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
 	if (!rdev || !pci_match_id(pmf_pci_ids, rdev)) {
@@ -474,3 +482,4 @@ module_platform_driver(amd_pmf_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
+MODULE_SOFTDEP("pre: amdtee");
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 6a0e4c446dd3..092be501d4d3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -14,6 +14,11 @@
 #include <linux/acpi.h>
 #include <linux/platform_profile.h>
 
+#define POLICY_BUF_MAX_SZ		0x4b000
+#define POLICY_SIGN_COOKIE		0x31535024
+#define POLICY_COOKIE_OFFSET		0x10
+#define POLICY_COOKIE_LEN		0x14
+
 /* APMF Functions */
 #define APMF_FUNC_VERIFY_INTERFACE			0
 #define APMF_FUNC_GET_SYS_PARAMS			1
@@ -59,8 +64,21 @@
 #define ARG_NONE 0
 #define AVG_SAMPLE_SIZE 3
 
+/* Policy Actions */
+#define PMF_POLICY_SPL						2
+#define PMF_POLICY_SPPT						3
+#define PMF_POLICY_FPPT						4
+#define PMF_POLICY_SPPT_APU_ONLY				5
+#define PMF_POLICY_STT_MIN					6
+#define PMF_POLICY_STT_SKINTEMP_APU				7
+#define PMF_POLICY_STT_SKINTEMP_HS2				8
+
 /* TA macros */
 #define PMF_TA_IF_VERSION_MAJOR				1
+#define TA_PMF_ACTION_MAX					32
+#define TA_PMF_UNDO_MAX						8
+#define TA_OUTPUT_RESERVED_MEM				906
+#define MAX_OPERATION_PARAMS					4
 
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
@@ -183,11 +201,16 @@ struct amd_pmf_dev {
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
 	/* Smart PC solution builder */
+	unsigned char *policy_buf;
+	u32 policy_sz;
 	struct tee_context *tee_ctx;
 	struct tee_shm *fw_shm_pool;
 	u32 session_id;
 	void *shbuf;
 	struct delayed_work pb_work;
+	struct pmf_action_table *prev_data;
+	u64 policy_addr;
+	void *policy_base;
 	bool smart_pc_enabled;
 };
 
@@ -399,17 +422,134 @@ struct apmf_dyn_slider_output {
 	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
 } __packed;
 
+enum smart_pc_status {
+	PMF_SMART_PC_ENABLED,
+	PMF_SMART_PC_DISABLED,
+};
+
+/* Smart PC - TA internals */
+enum ta_slider {
+	TA_BEST_BATTERY,
+	TA_BETTER_BATTERY,
+	TA_BETTER_PERFORMANCE,
+	TA_BEST_PERFORMANCE,
+	TA_MAX,
+};
+
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
 	TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES,
 };
 
+enum ta_pmf_error_type {
+	TA_PMF_TYPE_SUCCESS,
+	TA_PMF_ERROR_TYPE_GENERIC,
+	TA_PMF_ERROR_TYPE_CRYPTO,
+	TA_PMF_ERROR_TYPE_CRYPTO_VALIDATE,
+	TA_PMF_ERROR_TYPE_CRYPTO_VERIFY_OEM,
+	TA_PMF_ERROR_TYPE_POLICY_BUILDER,
+	TA_PMF_ERROR_TYPE_PB_CONVERT,
+	TA_PMF_ERROR_TYPE_PB_SETUP,
+	TA_PMF_ERROR_TYPE_PB_ENACT,
+	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_INFO,
+	TA_PMF_ERROR_TYPE_ASD_GET_DEVICE_PCIE_INFO,
+	TA_PMF_ERROR_TYPE_SYS_DRV_FW_VALIDATION,
+	TA_PMF_ERROR_TYPE_MAX,
+};
+
+struct pmf_action_table {
+	u32 spl;		/* in mW */
+	u32 sppt;		/* in mW */
+	u32 sppt_apuonly;	/* in mW */
+	u32 fppt;		/* in mW */
+	u32 stt_minlimit;	/* in mW */
+	u32 stt_skintemp_apu;	/* in C */
+	u32 stt_skintemp_hs2;	/* in C */
+};
+
+/* Input conditions */
+struct ta_pmf_condition_info {
+	u32 power_source;
+	u32 bat_percentage;
+	u32 power_slider;
+	u32 lid_state;
+	bool user_present;
+	u32 rsvd1[2];
+	u32 monitor_count;
+	u32 rsvd2[2];
+	u32 bat_design;
+	u32 full_charge_capacity;
+	int drain_rate;
+	bool user_engaged;
+	u32 device_state;
+	u32 socket_power;
+	u32 skin_temperature;
+	u32 rsvd3[5];
+	u32 ambient_light;
+	u32 length;
+	u32 avg_c0residency;
+	u32 max_c0residency;
+	u32 s0i3_entry;
+	u32 gfx_busy;
+	u32 rsvd4[7];
+	bool camera_state;
+	u32 workload_type;
+	u32 display_type;
+	u32 display_state;
+	u32 rsvd5[150];
+};
+
+struct ta_pmf_load_policy_table {
+	u32 table_size;
+	u8 table[POLICY_BUF_MAX_SZ];
+};
+
+/* TA initialization params */
+struct ta_pmf_init_table {
+	u32 frequency; /* SMU sampling frequency */
+	bool validate;
+	bool sku_check;
+	bool metadata_macrocheck;
+	struct ta_pmf_load_policy_table policies_table;
+};
+
+/* Everything the TA needs to Enact Policies */
+struct ta_pmf_enact_table {
+	struct ta_pmf_condition_info ev_info;
+	u32 name;
+};
+
+struct ta_pmf_action {
+	u32 action_index;
+	u32 value;
+};
+
+/* Output actions from TA */
+struct ta_pmf_enact_result {
+	u32 actions_count;
+	struct ta_pmf_action actions_list[TA_PMF_ACTION_MAX];
+	u32 undo_count;
+	struct ta_pmf_action undo_list[TA_PMF_UNDO_MAX];
+};
+
+union ta_pmf_input {
+	struct ta_pmf_enact_table enact_table;
+	struct ta_pmf_init_table init_table;
+};
+
+union ta_pmf_output {
+	struct ta_pmf_enact_result policy_apply_table;
+	u32 rsvd[TA_OUTPUT_RESERVED_MEM];
+};
+
 struct ta_pmf_shared_memory {
 	int command_id;
 	int resp_id;
 	u32 pmf_result;
 	u32 if_version;
+	union ta_pmf_output pmf_output;
+	union ta_pmf_input pmf_input;
 };
 
 /* Core Layer */
@@ -460,4 +600,5 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 /* Smart PC builder Layer */
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
+int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4036f435f1e2..468f3797a848 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -42,9 +42,77 @@ static void amd_pmf_prepare_args(struct amd_pmf_dev *dev, int cmd,
 	param[0].u.memref.shm_offs = 0;
 }
 
+static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+{
+	u32 val;
+	int idx;
+
+	for (idx = 0; idx < out->actions_count; idx++) {
+		val = out->actions_list[idx].value;
+		switch (out->actions_list[idx].action_index) {
+		case PMF_POLICY_SPL:
+			if (dev->prev_data->spl != val) {
+				amd_pmf_send_cmd(dev, SET_SPL, false, val, NULL);
+				dev_dbg(dev->dev, "update SPL: %u\n", val);
+				dev->prev_data->spl = val;
+			}
+			break;
+
+		case PMF_POLICY_SPPT:
+			if (dev->prev_data->sppt != val) {
+				amd_pmf_send_cmd(dev, SET_SPPT, false, val, NULL);
+				dev_dbg(dev->dev, "update SPPT: %u\n", val);
+				dev->prev_data->sppt = val;
+			}
+			break;
+
+		case PMF_POLICY_FPPT:
+			if (dev->prev_data->fppt != val) {
+				amd_pmf_send_cmd(dev, SET_FPPT, false, val, NULL);
+				dev_dbg(dev->dev, "update FPPT: %u\n", val);
+				dev->prev_data->fppt = val;
+			}
+			break;
+
+		case PMF_POLICY_SPPT_APU_ONLY:
+			if (dev->prev_data->sppt_apuonly != val) {
+				amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, val, NULL);
+				dev_dbg(dev->dev, "update SPPT_APU_ONLY: %u\n", val);
+				dev->prev_data->sppt_apuonly = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_MIN:
+			if (dev->prev_data->stt_minlimit != val) {
+				amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, val, NULL);
+				dev_dbg(dev->dev, "update STT_MIN: %u\n", val);
+				dev->prev_data->stt_minlimit = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_SKINTEMP_APU:
+			if (dev->prev_data->stt_skintemp_apu != val) {
+				amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, val, NULL);
+				dev_dbg(dev->dev, "update STT_SKINTEMP_APU: %u\n", val);
+				dev->prev_data->stt_skintemp_apu = val;
+			}
+			break;
+
+		case PMF_POLICY_STT_SKINTEMP_HS2:
+			if (dev->prev_data->stt_skintemp_hs2 != val) {
+				amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, val, NULL);
+				dev_dbg(dev->dev, "update STT_SKINTEMP_HS2: %u\n", val);
+				dev->prev_data->stt_skintemp_hs2 = val;
+			}
+			break;
+		}
+	}
+}
+
 static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
+	struct ta_pmf_enact_result *out = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
@@ -52,7 +120,10 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	if (!dev->tee_ctx)
 		return -ENODEV;
 
+	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = dev->shbuf;
+	out = &ta_sm->pmf_output.policy_apply_table;
+
 	memset(ta_sm, 0, sizeof(*ta_sm));
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
@@ -65,6 +136,12 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 		return ret;
 	}
 
+	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
+		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
+			ta_sm->pmf_result);
+		amd_pmf_apply_policies(dev, out);
+	}
+
 	return 0;
 }
 
@@ -72,6 +149,7 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
+	struct ta_pmf_init_table *in = NULL;
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
 
@@ -80,10 +158,21 @@ static int amd_pmf_invoke_cmd_init(struct amd_pmf_dev *dev)
 		return -ENODEV;
 	}
 
+	dev_dbg(dev->dev, "Policy Binary size: %u bytes\n", dev->policy_sz);
+	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = dev->shbuf;
+	in = &ta_sm->pmf_input.init_table;
+
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
 
+	in->metadata_macrocheck = false;
+	in->sku_check = false;
+	in->validate = true;
+	in->frequency = pb_actions_ms;
+	in->policies_table.table_size = dev->policy_sz;
+
+	memcpy(in->policies_table.table, dev->policy_buf, dev->policy_sz);
 	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE, &arg, param);
 
 	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
@@ -103,6 +192,52 @@ static void amd_pmf_invoke_cmd(struct work_struct *work)
 	schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms));
 }
 
+static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
+{
+	u32 cookie, length;
+	int res;
+
+	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
+	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
+
+	if (cookie != POLICY_SIGN_COOKIE || !length)
+		return -EINVAL;
+
+	/* Update the actual length */
+	dev->policy_sz = length + 512;
+	res = amd_pmf_invoke_cmd_init(dev);
+	if (res == TA_PMF_TYPE_SUCCESS) {
+		/* Now its safe to announce that smart pc is enabled */
+		dev->smart_pc_enabled = PMF_SMART_PC_ENABLED;
+		/*
+		 * Start collecting the data from TA FW after a small delay
+		 * or else, we might end up getting stale values.
+		 */
+		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
+	} else {
+		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
+		dev->smart_pc_enabled = PMF_SMART_PC_DISABLED;
+		return res;
+	}
+
+	return 0;
+}
+
+static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
+{
+	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
+	if (!dev->policy_buf)
+		return -ENOMEM;
+
+	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
+	if (!dev->policy_base)
+		return -ENOMEM;
+
+	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
+
+	return amd_pmf_start_policy_engine(dev);
+}
+
 static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
 {
 	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
@@ -146,7 +281,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
 		goto out_ctx;
 	}
 
-	size = sizeof(struct ta_pmf_shared_memory);
+	size = sizeof(struct ta_pmf_shared_memory) + dev->policy_sz;
 	dev->fw_shm_pool = tee_shm_alloc_kernel_buf(dev->tee_ctx, size);
 	if (IS_ERR(dev->fw_shm_pool)) {
 		dev_err(dev->dev, "Failed to alloc TEE shared memory\n");
@@ -190,11 +325,19 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		return ret;
 
 	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
-	return 0;
+	amd_pmf_set_dram_addr(dev);
+	amd_pmf_get_bios_buffer(dev);
+	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
+	if (!dev->prev_data)
+		return -ENOMEM;
+
+	return dev->smart_pc_enabled;
 }
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	kfree(dev->prev_data);
+	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.25.1


