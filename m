Return-Path: <linux-input+bounces-704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7CDE80E10E
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 02:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9BFA1C216D1
	for <lists+linux-input@lfdr.de>; Tue, 12 Dec 2023 01:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A13BEDC;
	Tue, 12 Dec 2023 01:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="n7qPvXvz"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034A4D5;
	Mon, 11 Dec 2023 17:48:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJAhTxzP5g8Ln+ZQ0NY/QTmWb78b20dnRcpg1fRs21sY5fVRdbUwV0M1lt3zFBYENHE7agIB1ioqYHCITwV30a8YxSmdj7G09bKQDa7AchF3XaccBshn0Ji9t9uLZTIv3l69Y7I6TRP3DWhe7ncJNxqTwKGYwDJ7Z2rDZ0yNR8kK0adpEyfwM6ChcQg7PyeTtdC8yreEaBqRawWsERDTVIjtt8oVF3o/0qHSYeM/FL0wV3nrJzmdaL4kaXENlEAlXQope2ts5vzeW1F8jqE5CebZIy+PQGQZZ1aMF2W0/MAaO6r4VxPGNSJis4KmazkRHKwr+OP9RFNncgQz1Q9aYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMLmZ1vWKhrNT2cZVNlui+u5EzLTGcmY/Do3PYSA93Y=;
 b=hYg2Ac446xRGtU8L26SzWVRChYHtGm4ah7OGrEE7/1S7h5c2eV69bmtxWrG6W4mPAoTktYRj9FILO5+rftgLYETOXGoXBTOEHXNalXuKVPnAFMEd5V8GuHJw5kjOak8HnCl8tE4tW47F2o0ihOmoQie80HeTbdoZ9ayDUxGB5k11QIGegIf/2BE/QjrAWgtJX60QRCxNYWahCrz05UvfTawCkiOyVWwj/WrpGkzXUp1AAorwWxLD3+q0OWnVAVqJUasOIRl9f7VVFkeGBmm6xqGybxu+l3jIcKx+SBpLzdFC6hyGCwHHgvrVa1qJ0cJ2xT17W4Q3l97KJ4Q1z+4WxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMLmZ1vWKhrNT2cZVNlui+u5EzLTGcmY/Do3PYSA93Y=;
 b=n7qPvXvz5ZspJxNvg7OoQudBN7QT/q6/5kEHh+FqI2e7Mp72CcCZsLixrNyHguJ4z18Gz/Q6JRd1V8iz17jzN7P9DTVhqkMZWd0LJ7d7yi9JomlTY+W4XDJpgJN26LRnJynd8jWzsv5XlS6FzlzGCppmMhmap9VdzLaPRTF5SJM=
Received: from CY8PR11CA0030.namprd11.prod.outlook.com (2603:10b6:930:4a::15)
 by MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 01:48:24 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:930:4a:cafe::26) by CY8PR11CA0030.outlook.office365.com
 (2603:10b6:930:4a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 01:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 01:48:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 11 Dec
 2023 19:48:11 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>, "Shyam
 Sundar S K" <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v7 10/12] platform/x86/amd/pmf: Add facility to dump TA inputs
Date: Tue, 12 Dec 2023 07:17:03 +0530
Message-ID: <20231212014705.2017474-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|MW3PR12MB4409:EE_
X-MS-Office365-Filtering-Correlation-Id: 886407bf-beae-4137-45a7-08dbfab46d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8t7i3mbvA0xWOutUTUY82ppZWTFdwt083d6ivpP6BHgeFTWWpkcWeoZLXjIYdLYl2BeTgPWTrBMjQuLc2LTUqWWrfcTz1OO11X6mKry2WcsVMK1WLAnzOh+oL7jj6hrkBXlB1ptagXHpkGiPWJkfrxf1pngAb4FDhtjxAyNGo8YciSSWjeYEV0oWdkZqW1F3HCSkJuBdgOzAvufmfZciLlVlvSK8wdHBC3XS7JdZosJIGLOCb9BSJmazToyoJIxVEFRrNyynoe6KmEsYLquPn05UojYDqHAsFjIuIBxMuCFFL3LQ+c0Gypifg+sHS4O/bWKQ/ucYASSUGggP3Y2dEfxOdgnszJs4ff3xnSoI4B0OQD9cRC+H9RYCJ1H8EYanleZ7Pj7HbUaNEd+5b68bvYOGMJLvK6JRfF7lZtLXqwApiGiX1pxxvyy2Jfgifxm54CQU21uyLpBKLei63HzPEM13FCxtSkM6MbG3PdUJIK8VyeBBm+jU8xVqxHQjnpgwiMS0RB/cjStLX3Kb/VmnACGEkhFLPXSHZQHKszYvtUMc4J3VTm5Q8tVUIB/Hp99e7PmWHyd1+qhxcIjPU8YzXw4Abi9SpWLQ319wX0tdEF2pddJH1VmdhAkv/UZhNBzaxZF68qbR6I3fGIhDlxDftXFxrPkRDwkICRqoFObnQou89IwQ0Np5mQQ5hMtH0zwDWWd6gD+o9mJeUpIQoYPVh0sfLumr6k6EV+ZK+0s2QMlPiZIdO+qKywMtwdrTfeCsqC8dDHit77VBiDO93sOThg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(230922051799003)(451199024)(82310400011)(1800799012)(186009)(64100799003)(36840700001)(40470700004)(46966006)(41300700001)(5660300002)(2906002)(2616005)(1076003)(7696005)(36756003)(6666004)(478600001)(36860700001)(426003)(47076005)(81166007)(356005)(82740400003)(40480700001)(336012)(83380400001)(66574015)(16526019)(8936002)(26005)(4326008)(54906003)(86362001)(40460700003)(316002)(110136005)(70206006)(8676002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 01:48:23.9029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 886407bf-beae-4137-45a7-08dbfab46d6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4409

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
index 25e369477f86..55cd2b301bbb 100644
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
index 8811631c7be5..38b75198cc3f 100644
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


