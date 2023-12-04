Return-Path: <linux-input+bounces-448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D03480307A
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 11:37:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 561B3B20A6C
	for <lists+linux-input@lfdr.de>; Mon,  4 Dec 2023 10:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B32B322301;
	Mon,  4 Dec 2023 10:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="syMeZgry"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7645BFF;
	Mon,  4 Dec 2023 02:36:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CG7svQHF+r5mys45x+uK428IUC+J6r8ZmvTuAdcqM6c0S9pOBTrsvBEmt0Boup32naPN99TuoQ4TzDxpg0ZC+Gt96vGXdqPDHFf5m2EYBDTSrwDVcYANb+rd4+Uj9TeQOlTYTqeKeboqRx7Z3+bKtspVJQbXuTc7Ix2mtmIBsIZzRASROQ2NFwr0PFQ3XUTdW55ODd6Pl6HIJ7kBFe4vlT5HZ8g9VEx62OFqpb+tYgNc42lOm6pbc8lmx/XurZGnWYYbEUZrhQ8ACdI0N88rtgKbWMvuLdzd7zHqZ6snyhV8Nv2MqXXOI2Qav9lJbStTEgRXbUEUacQExpulpx6ieQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGW2luhP5tGPDghtd4YKVVC8KJ+hVdmun3F1h4UbivA=;
 b=lqQf7KN1z8sbHUFdU9Irqv2pYudUjv/BLpvpddvSmftl2n9OreI4iRZwLmuZxU9zHuV/9DjxZ2VyIbO5mC0NTyDzG2l5UjsrzlQ1Mr7NEptypU/737ynvyfyMqYOPEmFKhIFdaazVYUvgL7XlcipwuhbJRB1v6qoJCd42VXcUdbKqpxI6xHdlnhELN+896s4HBXJm+XCxUObSiVq3WXXbS1yaJAf33hdLDI7dJpeZfcDXW4oh8BbeQuaWOJQ3eGS8snAjlqPlmtQLnJLIb1CHKxM4dwITQAloxpqvJHwpQ4XyGpUiySb7jdSzZytVAN+lZUQYj8XEQrqsa2bmdu93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGW2luhP5tGPDghtd4YKVVC8KJ+hVdmun3F1h4UbivA=;
 b=syMeZgryN/DzzOb4kI7xO0R47l0eF5o4h9TojcFTVfT9/UwCB6+2/C06Ly4LRLGkNLwFehGwClUpvNOddBWFdFPe4YadZ6CUfGGqACzuw1iE+rwpzpBGhb5psPdh1K8F2QeULQzMJwyyhNbfDk3nD9Wsfuiwng1FL0xkxCRDkEw=
Received: from MW4P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::22)
 by CY5PR12MB6153.namprd12.prod.outlook.com (2603:10b6:930:27::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:36:38 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:303:8b:cafe::8) by MW4P221CA0017.outlook.office365.com
 (2603:10b6:303:8b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 10:36:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 10:36:37 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 04:36:34 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v6 10/15] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Mon, 4 Dec 2023 15:45:43 +0530
Message-ID: <20231204101548.1458499-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CY5PR12MB6153:EE_
X-MS-Office365-Filtering-Correlation-Id: 12e5c677-326c-4a2e-2706-08dbf4b4e53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lggSjlqBRgeekwPE/FC/4hE2xBIfjXDcj+b0T7p/V0rCj631jJo4gcZLRLYLtD0y0jxBG+oi6JKCZMtzhlHCz4TAD9GpNVqQvkQZGrjms/5AGtMEBmUSHME3cJx9lqxhXxhuXBitb8mT5Smt4d9bTszB8kPlpHo/jyW2dWj4AQJznLITMyIEhZPLXoKWqK0I9QP5PgMCjA3kwucQMwGbWXEdazlTtxH5xcD87wKa0rbxRM8eXF//4PB5InmJzKPQUnlGclDzHheMxLnrY+heJ4i5k/gKWPOQNhdiqhkuNItPv71C6iILlqpsMbTktyYpGrNAVzagAQ3Yn+N7DjA7EvaobevvjHt9kQ3wsrKg1K+lzphfamBjvGbQlE2H4AJGBFe35fW4nNWEbhtlpZKD/hbtjhqdmteqt2nH21Mjs4PxYxhxk7e0MjXoaErClBe1FJ4paUJpLz7PH6GXTLSoHJkqfo7OR0V6JCLZ9XgHH99JC+gh+IzljwEHxucBLV4Zv23N7sfj6GZNCrX+sWbrh2TwLib2bJ/d3GIHvikVsP7Xrw26zM1yZshFhvDs3Gy1K1UftZlqTQbKVzX3RdXIwfjJfksT4mA+E6yBByVKIRqcwt7b9Ztz4P80Ef2hOeUt1zgI46RN8S7eYRK54Y9m6vnoT77h9Ygb6JmeHihLGpQWYOw0clUPTQLsHJ6fqAnUJYA4H+CU4rwKOuqwK7Je5dvkZ0lpW+v0SK8SnslyOtZekq6PP4wDQ0lM4zN6bZlYmIHjjIs6e6c+L386JFBy5g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(36840700001)(46966006)(40470700004)(47076005)(81166007)(356005)(82740400003)(66574015)(426003)(40480700001)(83380400001)(26005)(336012)(16526019)(2616005)(7696005)(1076003)(36860700001)(6666004)(478600001)(40460700003)(70206006)(70586007)(54906003)(316002)(110136005)(8936002)(8676002)(4326008)(2906002)(41300700001)(36756003)(86362001)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:36:37.8775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12e5c677-326c-4a2e-2706-08dbf4b4e53d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6153

PMF driver sends constant inputs to TA which its gets via the other
subsystems in the kernel. To debug certain TA issues knowing what inputs
being sent to TA becomes critical. Add debug facility to the driver which
can isolate Smart PC and TA related issues.

Also, make source_as_str() as non-static function as this helper is
required outside of sps.c file.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  3 +++
 drivers/platform/x86/amd/pmf/spc.c    | 36 +++++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/tee-if.c |  1 +
 3 files changed, 40 insertions(+)

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
index 351efcbe83c4..a0423942f771 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -14,6 +14,42 @@
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


