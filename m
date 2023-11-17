Return-Path: <linux-input+bounces-99-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D36887EED4C
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8524A280E2E
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE858F4E2;
	Fri, 17 Nov 2023 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oKMrVHeO"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2086.outbound.protection.outlook.com [40.107.96.86])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FCD3D5D;
	Fri, 17 Nov 2023 00:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evE+luL141uAqcGaChgob0vrvZx2oTDBlIVzMYoFgqkTN9Rt4fJk3kiSoTfMSxANAAn+4v8FgrWR3+Q/QdIa6miOp5rd7yzzl9ino+BbsoZhobSNvlxa5GpYTK3RGr52L6V7kVoQycci7wZoGlVG+vlvVwDIlUXCT2qPS2amjxotQuULlHvKLQ+IdJfZQ8/UmxOMHdKNXVjFdqT7uPXVRQgPd3o3inPbgM2qAsFeWLaJaKJQ8U1CaeJ6okCnFy3QDJi+WJldNYwbswCa4/mbixnELiYOlQ7Gs3i+JVPmm/Y8EN3pLMgJMd5dhBcbdp9Sf64Tby43fVxPjcdSMYT8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z0/qWQI0YRsy9khkZw/DF5OUgu9ZeT5FAOPpIVMXuWQ=;
 b=OlShqgaBCs0g6lRiJSlUaRkYwb3JBvJUq22MTsQM4QtVQBluHga8ERNA5qeUvRmevqg+uW05W9eNAxQePsm6VHCYQkFPaAfMEaCnpYme/wvxd2lf88bpZsPxhU/fyBOsI4SmX9GAxCuxHhxcG4Uuury59NAPZmuJztmYUqLIydJsZjBxra2YpYzV0CSlwBfI6MaQ1YeCwjVq68yzvbLIqoU/MqqnizPRj9nK55msU/q/+jWmj1UJf1oJNpK1h0dMyZ89HqbrDgBMKbS77DuNd/8bIV5i6lVP7aMORFR6hn4KW+4bOCD3+1nkfcYlqwCz1O5BIIpjKjFtMufGQYYDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z0/qWQI0YRsy9khkZw/DF5OUgu9ZeT5FAOPpIVMXuWQ=;
 b=oKMrVHeOyud7rynp99q1FuUkGRO15/U79lEsNKykoRP5YMF0+m/9HzpC94Jwc2mM7KSqtBAF5fqNt/ptMZxmTm+Q8JtpGORBpi/LsaeUHOvRQk+onx3UPNP/jtQ/K27UYDwNORkhROxBrkkT2fqDkO5nuYIfbMJcko692JzGw9g=
Received: from BN0PR04CA0164.namprd04.prod.outlook.com (2603:10b6:408:eb::19)
 by DM4PR12MB6326.namprd12.prod.outlook.com (2603:10b6:8:a3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21; Fri, 17 Nov
 2023 08:11:04 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::fb) by BN0PR04CA0164.outlook.office365.com
 (2603:10b6:408:eb::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 08:11:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:10:58 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 06/17] platform/x86/amd/pmf: Add support to get inputs from other subsystems
Date: Fri, 17 Nov 2023 13:37:36 +0530
Message-ID: <20231117080747.3643990-7-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DM4PR12MB6326:EE_
X-MS-Office365-Filtering-Correlation-Id: 27f980cf-4666-44b1-f03a-08dbe744be5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/fy4DlU3MbKls6eqi+wf9nScoZZvLCejvck3DrnEVeHXy3SpIZwVjfNc338oVcMImiiWoSBEx8mG4nA6DJrul/NyHNVkvjJ0rKli3BhHvRY/A3J+hLY4xaXZOPAn3IekaL+Wqr+3Un5yqFVmPWNEA4Cjq6g9GZM5kVZkWDZHiM0KXyrqyQgA1vPL6gfg9ZyA5dF2Zw4cJgIx3fOaPZcfRWYLMBcrdXVfzyi4jNxIkz2nrqCdrb15AiR6Xe4OOLDZ+TEsWpkDkDvnsi0AF7cdQB9e6EOXi/q1VPVHHbcykkp+k8erkDJh+GHUqNPqal/KxgpFvrmX2NXT1OJwn5IgmQfpA3fwDf/ExHgOlz3bDdJRFh4C2douEwRzk5neu/NgVviS3oDEMCjmoe05RPlMHfXmK0oZvXalK48ridqSmIpmn3koVDRdM2n80+8CbiE8ha1zzHnAAGDWAJx0Rzk/F0gdOWAYXSl1NP9DESFcfqkiy04KUxhlUD+kpr1B/vJ28fNe/y+XQfgCQVRxvQdoa1MJCz7h/1kJJopusCASiP69wVvLY8+2BEEa3pTeK3id92cKvsFg6Y4vr6SCC6TC7Fw/VhKVBsbCfN1zOow1ba4yb6bX/Ffddp9RArAOpqPvJlT+H+VPCikqYUJ+Bz1aTCLmzwv4Gy0WcvtOqqwfNkhcvgk6Wx89mOjg2lILE/XF1KPkNM5ixjxlUgHjy9jNsENKBWFy3VZO/NKkR6FDfOQQxz/wy9uBdkfZppIEdv6fSAluYNi11seQV6YtJntRg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(82310400011)(186009)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(36860700001)(40460700003)(16526019)(1076003)(36756003)(336012)(426003)(26005)(6666004)(2616005)(83380400001)(5660300002)(8936002)(47076005)(8676002)(41300700001)(478600001)(4326008)(2906002)(7696005)(316002)(110136005)(54906003)(70586007)(70206006)(81166007)(82740400003)(86362001)(356005)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:04.0077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27f980cf-4666-44b1-f03a-08dbe744be5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6326

PMF driver sends changing inputs from each subystem to TA for evaluating
the conditions in the policy binary.

Add initial support of plumbing in the PMF driver for Smart PC to get
information from other subsystems in the kernel.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/Makefile |   2 +-
 drivers/platform/x86/amd/pmf/pmf.h    |  18 ++++
 drivers/platform/x86/amd/pmf/spc.c    | 120 ++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c |   3 +
 4 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c

diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
index d2746ee7369f..6b26e48ce8ad 100644
--- a/drivers/platform/x86/amd/pmf/Makefile
+++ b/drivers/platform/x86/amd/pmf/Makefile
@@ -7,4 +7,4 @@
 obj-$(CONFIG_AMD_PMF) += amd-pmf.o
 amd-pmf-objs := core.o acpi.o sps.o \
 		auto-mode.o cnqf.o \
-		tee-if.o
+		tee-if.o spc.o
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 092be501d4d3..a4a73b845c09 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -150,6 +150,21 @@ struct smu_pmf_metrics {
 	u16 infra_gfx_maxfreq; /* in MHz */
 	u16 skin_temp; /* in centi-Celsius */
 	u16 device_state;
+	u16 curtemp; /* in centi-Celsius */
+	u16 filter_alpha_value;
+	u16 avg_gfx_clkfrequency;
+	u16 avg_fclk_frequency;
+	u16 avg_gfx_activity;
+	u16 avg_socclk_frequency;
+	u16 avg_vclk_frequency;
+	u16 avg_vcn_activity;
+	u16 avg_dram_reads;
+	u16 avg_dram_writes;
+	u16 avg_socket_power;
+	u16 avg_core_power[2];
+	u16 avg_core_c0residency[16];
+	u16 spare1;
+	u32 metrics_counter;
 } __packed;
 
 enum amd_stt_skin_temp {
@@ -601,4 +616,7 @@ extern const struct attribute_group cnqf_feature_attribute_group;
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev);
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev);
 int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
+
+/* Smart PC - TA interfaces */
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
new file mode 100644
index 000000000000..bd5061fdfdbe
--- /dev/null
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Management Framework Driver - Smart PC Capabilities
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
+ */
+
+#include <acpi/button.h>
+#include <linux/power_supply.h>
+#include <linux/units.h>
+#include "pmf.h"
+
+static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	u16 max, avg = 0;
+	int i;
+
+	memset(dev->buf, 0, sizeof(dev->m_table));
+	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
+	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
+
+	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
+	in->ev_info.skin_temperature = dev->m_table.skin_temp;
+
+	/* Get the avg and max C0 residency of all the cores */
+	max = dev->m_table.avg_core_c0residency[0];
+	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
+		avg += dev->m_table.avg_core_c0residency[i];
+		if (dev->m_table.avg_core_c0residency[i] > max)
+			max = dev->m_table.avg_core_c0residency[i];
+	}
+
+	avg = DIV_ROUND_CLOSEST(avg, ARRAY_SIZE(dev->m_table.avg_core_c0residency));
+	in->ev_info.avg_c0residency = avg;
+	in->ev_info.max_c0residency = max;
+	in->ev_info.gfx_busy = dev->m_table.avg_gfx_activity;
+}
+
+static const char * const pmf_battery_supply_name[] = {
+	"BATT",
+	"BAT0",
+};
+
+static int amd_pmf_get_battery_prop(enum power_supply_property prop)
+{
+	union power_supply_propval value;
+	struct power_supply *psy;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(pmf_battery_supply_name); i++) {
+		psy = power_supply_get_by_name(pmf_battery_supply_name[i]);
+		if (!psy)
+			continue;
+
+		ret = power_supply_get_property(psy, prop, &value);
+		if (ret) {
+			power_supply_put(psy);
+			return ret;
+		}
+	}
+
+	return value.intval;
+}
+
+static int amd_pmf_get_battery_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	int val;
+
+	val = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_PRESENT);
+	if (val >= 0 && val != 1)
+		return -ENODEV;
+
+	in->ev_info.bat_percentage = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_CAPACITY);
+	/* all values in mWh metrics */
+	in->ev_info.bat_design = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL_DESIGN) /
+		MILLIWATT_PER_WATT;
+	in->ev_info.full_charge_capacity = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_ENERGY_FULL) /
+		MILLIWATT_PER_WATT;
+	in->ev_info.drain_rate = amd_pmf_get_battery_prop(POWER_SUPPLY_PROP_POWER_NOW) /
+		MILLIWATT_PER_WATT;
+
+	return 0;
+}
+
+static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	int val;
+
+	switch (dev->current_profile) {
+	case PLATFORM_PROFILE_PERFORMANCE:
+		val = TA_BEST_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_BALANCED:
+		val = TA_BETTER_PERFORMANCE;
+		break;
+	case PLATFORM_PROFILE_LOW_POWER:
+		val = TA_BEST_BATTERY;
+		break;
+	default:
+		dev_err(dev->dev, "Unknown Platform Profile.\n");
+		return -EOPNOTSUPP;
+	}
+	in->ev_info.power_slider = val;
+
+	return 0;
+}
+
+void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	/* TA side lid open is 1 and close is 0, hence the ! here */
+	in->ev_info.lid_state = !acpi_lid_open();
+	in->ev_info.power_source = amd_pmf_get_power_source();
+	amd_pmf_get_smu_info(dev, in);
+	amd_pmf_get_battery_info(dev, in);
+	amd_pmf_get_slider_info(dev, in);
+}
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 468f3797a848..e3f17852d532 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -113,6 +113,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 {
 	struct ta_pmf_shared_memory *ta_sm = NULL;
 	struct ta_pmf_enact_result *out = NULL;
+	struct ta_pmf_enact_table *in = NULL;
 	struct tee_param param[MAX_TEE_PARAM];
 	struct tee_ioctl_invoke_arg arg;
 	int ret = 0;
@@ -123,11 +124,13 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	memset(dev->shbuf, 0, dev->policy_sz);
 	ta_sm = dev->shbuf;
 	out = &ta_sm->pmf_output.policy_apply_table;
+	in = &ta_sm->pmf_input.enact_table;
 
 	memset(ta_sm, 0, sizeof(*ta_sm));
 	ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
 	ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
 
+	amd_pmf_populate_ta_inputs(dev, in);
 	amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
 
 	ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
-- 
2.25.1


