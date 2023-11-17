Return-Path: <linux-input+bounces-105-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B747EED58
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D9141C204AB
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6EACFC08;
	Fri, 17 Nov 2023 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fCZyviTS"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E45A8;
	Fri, 17 Nov 2023 00:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wd9yS28RO8lWz5qpZ7GWZLwtJzW5svKA8xzlwgj39GI+f8IIzG0SZVd0z8OzawvaBKMtrmZOb6PEkEOJlTPRteult+U9thiuHQliTXeq01ZM/q1qc9Fx0LfEjC3nd5fTNcNYyDnzvnUj3U8bFDAhW2iWSsoVDRdBUaJQinmkesMeN9opsqMR9oIDT5V/hO2+EtRrJDOB4xTa7GNbHeyO3CMJusrQwx7pTUErvTOdoLkvMukkBDT02zwNhhzBZjaTEBYb63m+ki/LWTLi9bfZokbq3Xr0TSoYXfQZ7H9C0eL1vZikMbC38emATyOq5yUiMkGbi4KsTD7R34z+wBAgZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdDurB1+KD5EIC9h0rCMoagO5zor/eCUygwNzDYuRlE=;
 b=IWbYu/XYa8AcaQax7/RWHn2cFlCL+tDcVcWhN6/ZFhtSuwVEjdAYEHmLsV/130MLWQ26YO245Nu/mi9+SJ3a6fgZl8RM/ZD78ElGDhPyncKoOa4mXVBB4LJ9OpLABE/plJlx0ogOVKRWiWPS+Z4tCcnT8ANzE0SxWjRqoSM851QyusMWlvlUsXMVOP6DpAeCwiMbrJlXXkDfov3ldltogWnH+7huFEqTLBbCtjrlBH2yIizmMozZC0d5VKSF1iVxotDANTR6pHGAGVlIDijnwzEUoDF7O8Nxq9alDWz/cm0eSVptXi/HGYvjDJ7U4jz5GxPZer90pyy8cLOHAsrd1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdDurB1+KD5EIC9h0rCMoagO5zor/eCUygwNzDYuRlE=;
 b=fCZyviTS7wXgqr4/w8xFgmpi0KGSryZ0/VO6bjdE0qXiXH+yWD7AviWUzWWPsdU1lfrmS+gE+RsEwY50UlkjR4jNrIU5gqNhchtNEkmrrYx3PjvIV6YHqbv+HwEz4QktK7b1XzOHUhdbciVjJwCGWZ1zYBmmsEriyLfUrIud9xA=
Received: from SA1PR03CA0012.namprd03.prod.outlook.com (2603:10b6:806:2d3::15)
 by DS7PR12MB5717.namprd12.prod.outlook.com (2603:10b6:8:70::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:11:52 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::6b) by SA1PR03CA0012.outlook.office365.com
 (2603:10b6:806:2d3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.25 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 08:11:52 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:48 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get interface
Date: Fri, 17 Nov 2023 13:37:43 +0530
Message-ID: <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS7PR12MB5717:EE_
X-MS-Office365-Filtering-Correlation-Id: 74380d76-9b90-4a93-9584-08dbe744db0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5JIYIuI/5HQnjDezRk9ni1hAXp9bCgO8kF4F3HGxhd2+EWdfr1+thwyUWfjFdkX1y7jmfeSQUzZubQFmUNVTn9QwOBIqeDytBRmQJK905V3tgb/UY/iqJRHahVFmprkw+auxB46HPu06gCUey83eD8kMqc443Zn573vdy9HLxEnDgHk3Nhf5UrOfGL35tFsUVp8ncAn7Pi8eJDZ+AiBy/D/yHgBvZTXOuk27hIspBuO/BweK04TnNYwdBszg49dsUeMqC2EvgklLvRRF6jTyfBoB0ORawg6Rl6TiPhFv/eM3hiCEJE+HoMFbnECAqhUq2r/C/A9e/AVqa1gVP12r7/5ic/izr23t3PRmhwSY4JP5wBt0kox3biOCgiY8cDE92/YEwDJtAJxXwXusKq5NaJMORkKP3XMfD1GpVIgSrAteSPJ7wLae1exSLXN36SIy9LY8n/QOC2OOTt5kjMYPf3ZgiUdtEn7zGo5vn1TogRGnfiSxXetDpNRvhx4UF44YGpjKb2kkw1hLzHVPBo4z1m1KVIJAniGjA2YHndVmVv/jpqPCtILL3R4gG3ehLgcknV8NMyFin+U+30NNJce7iWeiND47zn7WfgXHx3OiMcEs/hBH/1SjZbzx5/c+eG1JZUWtYmHin9KiusKb8kBhRJ+oyDjRELT3677g1UsJ+3JDdoymsp+j0jzBr9dft81vjnTioEtWS6ymKLhexklBz1tuN8KDmdptu97KmP/K3I5k4pw2tAv+7PTE4neWT2rp1/wz1PNE6HIssf6lCwZBrQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(82310400011)(36840700001)(40470700004)(46966006)(478600001)(40480700001)(83380400001)(2616005)(16526019)(7696005)(6666004)(1076003)(26005)(336012)(426003)(316002)(70206006)(70586007)(110136005)(54906003)(47076005)(8676002)(8936002)(5660300002)(2906002)(86362001)(82740400003)(36860700001)(4326008)(40460700003)(41300700001)(356005)(36756003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:52.1325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74380d76-9b90-4a93-9584-08dbe744db0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5717

In order to provide GPU inputs to TA for the Smart PC solution to work, we
need to have interface between the PMF driver and the AMDGPU driver.

Add the initial code path for get interface from AMDGPU.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c   |  3 +-
 drivers/platform/x86/amd/pmf/pmf.h    | 18 +++++++
 drivers/platform/x86/amd/pmf/spc.c    | 41 ++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c | 77 +++++++++++++++++++++++++++
 4 files changed, 138 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 4b8156033fa6..9b14a997cd48 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -411,6 +411,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	}
 
 	dev->cpu_id = rdev->device;
+	dev->root = rdev;
 
 	err = amd_smn_read(0, AMD_PMF_BASE_ADDR_LO, &val);
 	if (err) {
@@ -482,4 +483,4 @@ module_platform_driver(amd_pmf_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("AMD Platform Management Framework Driver");
-MODULE_SOFTDEP("pre: amdtee");
+MODULE_SOFTDEP("pre: amdtee amdgpu");
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 8712299ad52b..525308519fa3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -11,7 +11,11 @@
 #ifndef PMF_H
 #define PMF_H
 
+#include <acpi/video.h>
+#include <drm/drm_connector.h>
 #include <linux/acpi.h>
+#include <linux/backlight.h>
+#include <linux/pci.h>
 #include <linux/platform_profile.h>
 
 #define POLICY_BUF_MAX_SZ		0x4b000
@@ -83,6 +87,8 @@
 #define TA_OUTPUT_RESERVED_MEM				906
 #define MAX_OPERATION_PARAMS					4
 
+#define MAX_SUPPORTED_DISPLAY		4
+
 /* AMD PMF BIOS interfaces */
 struct apmf_verify_interface {
 	u16 size;
@@ -194,6 +200,15 @@ enum power_modes {
 	POWER_MODE_MAX,
 };
 
+struct amd_gpu_pmf_data {
+	struct pci_dev *gpu_dev;
+	struct backlight_device *raw_bd;
+	struct thermal_cooling_device *cooling_dev;
+	enum drm_connector_status con_status[MAX_SUPPORTED_DISPLAY];
+	int display_count;
+	int connector_type[MAX_SUPPORTED_DISPLAY];
+};
+
 struct amd_pmf_dev {
 	void __iomem *regbase;
 	void __iomem *smu_virt_addr;
@@ -228,9 +243,12 @@ struct amd_pmf_dev {
 	void *shbuf;
 	struct delayed_work pb_work;
 	struct pmf_action_table *prev_data;
+	struct amd_gpu_pmf_data gfx_data;
 	u64 policy_addr;
 	void *policy_base;
 	bool smart_pc_enabled;
+	struct pci_dev *root;
+	struct drm_device *drm_dev;
 };
 
 struct apmf_sps_prop_granular {
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 959146fd483f..47ec563088b8 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -44,6 +44,10 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
 	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
 	dev_dbg(dev->dev, "Connected Display Count: %u\n", in->ev_info.monitor_count);
+	dev_dbg(dev->dev, "Primary Display Type: %s\n",
+		drm_get_connector_type_name(in->ev_info.display_type));
+	dev_dbg(dev->dev, "Primary Display State: %s\n", in->ev_info.display_state ?
+			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
@@ -146,6 +150,41 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 	return 0;
 }
 
+static int amd_pmf_get_gfx_data(struct amd_pmf_dev *pmf)
+{
+	struct drm_connector_list_iter iter;
+	struct drm_connector *connector;
+	int i = 0;
+
+	/* Reset the count to zero */
+	pmf->gfx_data.display_count = 0;
+
+	drm_connector_list_iter_begin(pmf->drm_dev, &iter);
+	drm_for_each_connector_iter(connector, &iter) {
+		if (connector->status == connector_status_connected)
+			pmf->gfx_data.display_count++;
+		if (connector->status != pmf->gfx_data.con_status[i])
+			pmf->gfx_data.con_status[i] = connector->status;
+		if (connector->connector_type != pmf->gfx_data.connector_type[i])
+			pmf->gfx_data.connector_type[i] = connector->connector_type;
+
+		i++;
+		if (i >= MAX_SUPPORTED_DISPLAY)
+			break;
+	}
+	drm_connector_list_iter_end(&iter);
+
+	return 0;
+}
+
+static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	amd_pmf_get_gfx_data(dev);
+	in->ev_info.monitor_count = dev->gfx_data.display_count;
+	in->ev_info.display_type = dev->gfx_data.connector_type[0];
+	in->ev_info.display_state = dev->gfx_data.con_status[0];
+}
+
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	/* TA side lid open is 1 and close is 0, hence the ! here */
@@ -154,4 +193,6 @@ void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_tab
 	amd_pmf_get_smu_info(dev, in);
 	amd_pmf_get_battery_info(dev, in);
 	amd_pmf_get_slider_info(dev, in);
+	if (dev->drm_dev)
+		amd_pmf_get_gpu_info(dev, in);
 }
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 81b1bd356e83..82ee2b1c627f 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -10,6 +10,7 @@
 
 #include <linux/debugfs.h>
 #include <linux/tee_drv.h>
+#include <linux/thermal.h>
 #include <linux/uuid.h>
 #include "pmf.h"
 
@@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 	tee_client_close_context(dev->tee_ctx);
 }
 
+static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
+				     unsigned long *state)
+{
+	struct backlight_device *bd;
+
+	if (acpi_video_get_backlight_type() != acpi_backlight_native)
+		return -ENODEV;
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	*state = backlight_get_brightness(bd);
+
+	return 0;
+}
+
+static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
+				     unsigned long *state)
+{
+	struct backlight_device *bd;
+
+	if (acpi_video_get_backlight_type() != acpi_backlight_native)
+		return -ENODEV;
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	if (backlight_is_blank(bd))
+		*state = 0;
+	else
+		*state = bd->props.max_brightness;
+
+	return 0;
+}
+
+static const struct thermal_cooling_device_ops bd_cooling_ops = {
+	.get_max_state = amd_pmf_gpu_get_max_state,
+	.get_cur_state = amd_pmf_gpu_get_cur_state,
+};
+
+static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
+{
+	struct amd_pmf_dev *dev = data;
+
+	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
+		dev->gfx_data.gpu_dev = pdev;
+		return 1; /* Stop walking */
+	}
+
+	return 0; /* Continue walking */
+}
+
 int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 {
 	int ret;
@@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
 	amd_pmf_set_dram_addr(dev);
 	amd_pmf_get_bios_buffer(dev);
+
 	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data)
 		return -ENOMEM;
 
+	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
+	if (dev->gfx_data.gpu_dev) {
+		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
+		if (!dev->drm_dev)
+			return -EINVAL;
+
+		if (acpi_video_get_backlight_type() != acpi_backlight_native)
+			return -ENODEV;
+
+		dev->gfx_data.raw_bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+		if (!dev->gfx_data.raw_bd)
+			return -ENODEV;
+
+		dev->gfx_data.cooling_dev = thermal_cooling_device_register("pmf_gpu_bd",
+									    NULL, &bd_cooling_ops);
+		if (IS_ERR(dev->gfx_data.cooling_dev))
+			return -ENODEV;
+	}
+
 	return dev->smart_pc_enabled;
 }
 
@@ -448,5 +523,7 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 	kfree(dev->prev_data);
 	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
+	if (dev->gfx_data.cooling_dev)
+		thermal_cooling_device_unregister(dev->gfx_data.cooling_dev);
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.25.1


