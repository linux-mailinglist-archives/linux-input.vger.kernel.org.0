Return-Path: <linux-input+bounces-102-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D77EED51
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34608280BE6
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0348CF4EC;
	Fri, 17 Nov 2023 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="2B/mOA/h"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD8EA8;
	Fri, 17 Nov 2023 00:11:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jU2qAsdhPHcq/lM7L8/lMxyWpj9/PvnyLQzW+x0dfmT9KfZKpac+dKx/njLpoLSYQ46EeHcIhZed0YoJn0tO0oUFIMobmyz08Fa7zhdsmr0IA7KzyPXTOfMEZ0H+n2SoVBjs/qIk6+oInA9MzbVyVLD8NfBGPymV5TgUq8E7japTcWnmOjBnihTAWyKV1avpDso7GeYDkRn4WqNwSnWmVaAM7QnsdDSRLKTIiXZGQqrQm9V7zhWSOQYczdiSpxAYFfwFejcbii2u0d07YhhAB7nOm6+0H7iT51OXzqZBuaC8f+gOvQfBm4HIz6tKXxS5U7trDV0sI5AhMhUach5AeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yBS2fazzE+WqHjP6W5gPaDWxme1q6yaodpQHqYP2ZwQ=;
 b=RZHmEOIuKMGESX4n2gparIEktLxOaTJDoLlUeQ4LMbPPkUoUqgpGVgfF1a7lfCm+NS750szCHK89ksIPma7EB/7IaogGIIXZnKnOAKRyTDV53MH5Z5cLeOcL/J32rRsQRO2c+sn1dMdemawh7413C2TS12b1+ejjGa7O2AnqIBRDpcOkjy5MiTjwkmO82phbPtEyAQWvykIfCgTWRsqeNsB98PW0cGNpFHCwxX86h8Q/19USyDOW/v/T/FeNcVqN6n30KxxnDcj+OyWCegnVfRgr3UTk0v3lTMT8fOqik7FvIQTHdLGOrIxuUlCcOnMDg7VtbWzsUo3hcpYXKpUDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBS2fazzE+WqHjP6W5gPaDWxme1q6yaodpQHqYP2ZwQ=;
 b=2B/mOA/hd6+KHlFskMxPDQLWBCOF8XOdbb4kdVUH5Wg8n7U8st/JM367Tfn+l0E36yPwR6DGkMsXADJ1QP39q7FdaaCZqaihFxxtOv5/SrC7JOsBPMtKi5v2qXm0AZdPeStPuwpxgdNzRnVhqf3A8MBksbn7sWjuX7GTuEvyYb4=
Received: from SA0PR12CA0002.namprd12.prod.outlook.com (2603:10b6:806:6f::7)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 08:11:15 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:6f:cafe::3) by SA0PR12CA0002.outlook.office365.com
 (2603:10b6:806:6f::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:11:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Fri, 17 Nov 2023 08:11:15 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:11:11 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 10/17] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Fri, 17 Nov 2023 13:37:40 +0530
Message-ID: <20231117080747.3643990-11-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|MN2PR12MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aa965ba-f8f7-4a9e-50c5-08dbe744c542
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SC4NLv6wINbZCmOfO3QZ4Vo5Ltdo6q2STppQsJanJi8kpqwLAsaiSyCSf4E5p7Z9wjVSY0Gct8Qh7omrJZjCRbhneKN6qlZL3AELWQn2txCLQvEinWOEjDu5d7bcxrwiCFZ2W4CKk9F2gHRRo+3RiyoXbPy+JThkT8FFZKycgWIRAjH0hSbWmcAqkJH3UxfqGGrpZojwtdoU78A9by1pIfuXKV5j3P6HZD5XCQgovDQTRPIJzi+TlS3HEMbkSGuCClWgR2pmmHG2hnD9sB4hpbBZj7AMSNTeKERa+SDdQ8gDcIRIBVWFBvAETv3M2uDQLQDT7b45cu7oX7jfG3A71U3SUD+VdwHTHr/xOecXRwZrYNQVcq673l6wmBxDLkZ2lmDZVuQqVQ/dnTx4daQurhvuClVJ+o4hqnysZz7j5KC16L+7xDNzFRtsCn80bI7f09cr/cR8Vb+X4BUId75BUxtPKm76k8Yh4hv39E0S5Q/HlMExrpY02bDAba19+YZRaXleCXTKZc9mduy6ACXkOgskFnROQD7YUHqgm45ZVDcwL02GlDzs1QiZxBelzcQkbA5I2AzPU1UGnv23+Hk3TrJ5VPAusKLG4DwDaH4sLpLgeQn+NtBMptbKbcJfg2gWFxwuVi6XublopSPo2ANdkGTQhuXo1lejMMzoj8GHThjMUqtuQgexiI1liZer36ZLnpvk8jJJ4tojF9axpFIDhqSsxCyB6WhiweP9wBrPiXYh1wisGkIDof44DMMAURXuj+NgIh5h4HPITMaa+a4ejQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(64100799003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(40470700004)(41300700001)(356005)(82740400003)(83380400001)(478600001)(40480700001)(86362001)(2616005)(6666004)(7696005)(81166007)(1076003)(110136005)(426003)(336012)(70206006)(54906003)(70586007)(316002)(36756003)(4326008)(2906002)(36860700001)(5660300002)(8676002)(8936002)(26005)(16526019)(40460700003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:11:15.5682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa965ba-f8f7-4a9e-50c5-08dbe744c542
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566

PMF driver sends constant inputs to TA which its gets via the other
subsystems in the kernel. To debug certain TA issues knowing what inputs
being sent to TA becomes critical. Add debug facility to the driver which
can isolate Smart PC and TA related issues.

Also, make source_as_str() as non-static function as this helper is
required outside of sps.c file.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
 drivers/platform/x86/amd/pmf/spc.c    | 37 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c |  1 +
 3 files changed, 41 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 216a9f795436..593930519039 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -602,6 +602,7 @@ bool is_pprof_balanced(struct amd_pmf_dev *pmf);
 int amd_pmf_power_slider_update_event(struct amd_pmf_dev *dev);
 const char *amd_pmf_source_as_str(unsigned int state);
 
+const char *amd_pmf_source_as_str(unsigned int state);
 
 int apmf_update_fan_idx(struct amd_pmf_dev *pdev, bool manual, u32 idx);
 int amd_pmf_set_sps_power_limits(struct amd_pmf_dev *pmf);
@@ -632,4 +633,6 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev);
 
 /* Smart PC - TA interfaces */
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in);
+
 #endif /* PMF_H */
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index bd5061fdfdbe..959146fd483f 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -14,6 +14,43 @@
 #include <linux/units.h>
 #include "pmf.h"
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static const char *ta_slider_as_str(unsigned int state)
+{
+	switch (state) {
+	case TA_BEST_PERFORMANCE:
+		return "PERFORMANCE";
+	case TA_BETTER_PERFORMANCE:
+		return "BALANCED";
+	case TA_BEST_BATTERY:
+		return "POWER_SAVER";
+	default:
+		return "Unknown TA Slider State";
+	}
+}
+
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
+{
+	dev_dbg(dev->dev, "==== TA inputs START ====\n");
+	dev_dbg(dev->dev, "Slider State: %s\n", ta_slider_as_str(in->ev_info.power_slider));
+	dev_dbg(dev->dev, "Power Source: %s\n", amd_pmf_source_as_str(in->ev_info.power_source));
+	dev_dbg(dev->dev, "Battery Percentage: %u\n", in->ev_info.bat_percentage);
+	dev_dbg(dev->dev, "Designed Battery Capacity: %u\n", in->ev_info.bat_design);
+	dev_dbg(dev->dev, "Fully Charged Capacity: %u\n", in->ev_info.full_charge_capacity);
+	dev_dbg(dev->dev, "Drain Rate: %d\n", in->ev_info.drain_rate);
+	dev_dbg(dev->dev, "Socket Power: %u\n", in->ev_info.socket_power);
+	dev_dbg(dev->dev, "Skin Temperature: %u\n", in->ev_info.skin_temperature);
+	dev_dbg(dev->dev, "Avg C0 Residency: %u\n", in->ev_info.avg_c0residency);
+	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
+	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
+	dev_dbg(dev->dev, "Connected Display Count: %u\n", in->ev_info.monitor_count);
+	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
+	dev_dbg(dev->dev, "==== TA inputs END ====\n");
+}
+#else
+void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in) {}
+#endif
+
 static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	u16 max, avg = 0;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4c2475a28d55..5f10e5c6335e 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -182,6 +182,7 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 	}
 
 	if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
+		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
 		amd_pmf_apply_policies(dev, out);
-- 
2.25.1


