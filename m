Return-Path: <linux-input+bounces-106-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5C7EED59
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:12:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1047E1F2618A
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8CE9FBEB;
	Fri, 17 Nov 2023 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="h+3Ws8U/"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2041.outbound.protection.outlook.com [40.107.102.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDB7B3;
	Fri, 17 Nov 2023 00:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KhCOgtS3gP10mTbdZ5YS8eyA1V/w/zPWBuYg+Fvl0agEG1lSFAU8CygmZGou735Y2j1kB1x5oHpYfL/PUi18g9RHIZkiLO0HUq72Cze+l0YbJ84vchIEMH7AgJvScif+FSFWHk3BASjzFfzhxja8Q8YPXQK6WPdtIpGaJmtzf+5jyrVdtoec1usfDR83ZSBvqIX+DXx+NTq4Zg/c0uKZPuJqn5HQnTKihxG19hnehQ1uGR4eR8UaxFwD0jHMXUw1BTethPH/Jt+8KKrhsdNb9zQ/uy8TnPuS3NEBB6YJEkW6DNIhQw5RezCLxlhkVCewratV8rxYpOP4mG0BG/fFIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxIaCd3yCVmFgp2ODjMOnFCfh/HK+CWeaBvYn6Z+920=;
 b=IqQawdhUj8cTLJvZN++VLHn5YByXGoK9LE5nmrlzxplEfgEo0KDjMaqfzG0B446lv9xqGR/v40rukf6iF73SW0H9s08K+1MjMm9YApQsK5gYLsFPaGoU6zYzMtuc097kPjYOmhWStkIAiNdquOaX5BHwZQrzI0PjnFx1yOw8KlFU2COeqsEs1jxoMV4Kr5yespM4QGEi04w1GByqnjWQyqgYsDdGJlyBeMlmUWaDx30nYPdKUDIQcWVTexyK0eswNSba2F7oOZKR6C1x1pYlPGP4hsFrQmv1f2MO+IIQRW92hq8AJNGqR7B5UEsijzxNYfqxp7tF9HJTdqLx6qmIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxIaCd3yCVmFgp2ODjMOnFCfh/HK+CWeaBvYn6Z+920=;
 b=h+3Ws8U/OKCxgOdqDYMBti8/duHnVWIFun3EhPsrkLbB0ILKZUc6M9qvMMDxyTKDimxCMf/gFOXG5m6wqX1BdaCuWBvjExfKvaGBbzyIyeDcKf8TXTDMcQy2IaaK1oEcKVWBRPTmtn/x9CytK6CfziNY5FxdE93w8IHFS32wEkU=
Received: from PH7PR13CA0020.namprd13.prod.outlook.com (2603:10b6:510:174::27)
 by DM4PR12MB5793.namprd12.prod.outlook.com (2603:10b6:8:60::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:11:55 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::cd) by PH7PR13CA0020.outlook.office365.com
 (2603:10b6:510:174::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.11 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:11:55 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:51 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 14/17] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Date: Fri, 17 Nov 2023 13:37:44 +0530
Message-ID: <20231117080747.3643990-15-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|DM4PR12MB5793:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9479aa-0ce9-4380-d0e3-08dbe744dcf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Lr5zsfmTpcT0A6/W5x+umVz8pCrpGlP9o5x8aqKOidwvOnPoA+3G6adBfPkROrSDkb5VuHEAUba2mFtjzRuSdo4MMRMYy4WmTeteczqzwYJ0NPI5ApC7EZVEKQF8XYL8om2TquoPTjv+q8tFs/f5aNkcQ/uk6gJWWTIc3WhiBeGLkLta/AZTDZq12BwbNws5/Xblw/h4yV/qyQZVSVBoY2AVU+l+5qys/3PwU9qcqY3lwL88MNfyuzOueKO2+lxkkM0CHspQhwze2Z6J5yAYBQGmPPE3HNAbY1zKU3TZoVEamCX2GhYYZhcLMlgFn+ceuIfu3Gxb5xb7JvxKCnYou2hVGu5GAbw8Fsld/nwawP6BwBuh4rvdJ1wKt2PSI5iclvM1fFnhImoVDs21n7kYW8qFmTEOCLXj4JZIyYs926+bw4uMFPrEImTeeB5QLK5I6l+PWH6SbNbMWLiXrSBf63aCtTSC+kEeQc8LF6N15+Fwa7k8J6itIVTUQ8TQdMMNssIhFgPC2AnikJMARzGRREcG65JIdsug4L/hfpWDNl8vHj+pjWYKjAALu/cVkyZ2jn5T7nWM+5fdwMeatZzAEelyUySl2jvbeWaMkYqckvB3sSg6yuhD4iaQccXoVqBRbAq71o/0YR5ymUUSHAkX4frfKUiy2jHnx+CyjRe442dp0q9cGngaq8h11Y9hI9mwxLdEFeX8rLTLmDjNXmDiF3RM5L2snPr9cDpDcyHSNjAYFtawo3TD9Ra7lq7Vvv0HAY4wfvidCM0bnZ9imCoVJw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(46966006)(40470700004)(36840700001)(2616005)(41300700001)(356005)(81166007)(6666004)(86362001)(36860700001)(478600001)(82740400003)(110136005)(36756003)(40480700001)(1076003)(7696005)(26005)(16526019)(2906002)(54906003)(70586007)(70206006)(316002)(426003)(40460700003)(83380400001)(47076005)(5660300002)(4326008)(8676002)(8936002)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:55.3256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9479aa-0ce9-4380-d0e3-08dbe744dcf4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5793

For the Smart PC Solution to fully work, it has to enact to the actions
coming from TA. Add the initial code path for set interface to AMDGPU.

Change amd_pmf_apply_policies() return type, so that it can return
errors when the call to retrieve information from amdgpu fails.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c | 39 +++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 525308519fa3..6e680637a631 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -78,6 +78,7 @@
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
 #define PMF_POLICY_SYSTEM_STATE					9
+#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -503,6 +504,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	unsigned long display_brightness;
 	enum system_state system_state;
 	u32 spl;		/* in mW */
 	u32 sppt;		/* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 82ee2b1c627f..94a2afd84b56 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -77,8 +77,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 	return 0;
 }
 
-static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
+	struct thermal_cooling_device *cdev = dev->gfx_data.cooling_dev;
+	unsigned long state;
 	u32 val;
 	int idx;
 
@@ -154,8 +156,21 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			dev_dbg(dev->dev, "update SYSTEM_STATE: %s\n",
 				amd_pmf_uevent_as_str(val));
 			break;
+
+		case PMF_POLICY_DISPLAY_BRIGHTNESS:
+			if (!dev->drm_dev)
+				return -ENODEV;
+
+			cdev->ops->get_cur_state(cdev, &state);
+			if (state != val) {
+				cdev->ops->set_cur_state(cdev, val);
+				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS: %u\n", val);
+			}
+			break;
 		}
 	}
+
+	return 0;
 }
 
 static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
@@ -192,7 +207,9 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
-		amd_pmf_apply_policies(dev, out);
+		ret = amd_pmf_apply_policies(dev, out);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
@@ -423,6 +440,23 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
 	tee_client_close_context(dev->tee_ctx);
 }
 
+static int amd_pmf_gpu_set_cur_state(struct thermal_cooling_device *cooling_dev,
+				     unsigned long state)
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
+	backlight_device_set_brightness(bd, state);
+
+	return 0;
+}
+
 static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
 				     unsigned long *state)
 {
@@ -463,6 +497,7 @@ static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
 static const struct thermal_cooling_device_ops bd_cooling_ops = {
 	.get_max_state = amd_pmf_gpu_get_max_state,
 	.get_cur_state = amd_pmf_gpu_get_cur_state,
+	.set_cur_state = amd_pmf_gpu_set_cur_state,
 };
 
 static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
-- 
2.25.1


