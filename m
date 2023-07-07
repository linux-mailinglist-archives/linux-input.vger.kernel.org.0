Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8376674AB76
	for <lists+linux-input@lfdr.de>; Fri,  7 Jul 2023 08:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbjGGG6i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 02:58:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjGGG6i (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 02:58:38 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2046.outbound.protection.outlook.com [40.107.243.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C9921BE8
        for <linux-input@vger.kernel.org>; Thu,  6 Jul 2023 23:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yh6cgoSQtIjhff8+YN6mtRrh1GpMUO04KnyKHhffjx3upNIn0QnRHVEm+k71xpp3oNlncvyK1GlF3LcVjPREWqqdo0/g25R4XEUsN5uxCw9uJf31x7OokFlqeKEjFgjeQ7ioR4/qcx8dqackTsIcHuUnQncbHRbwfmtmRdxpsNMd+mzLsU4VzaJbRfK8IriikFy1x4wZYsCiUbZ2JxE466yElSGC7fQ3uKqS/VfRuW41i8PvPJaXiyDpu543Tuwt08T5a0+h2GLyHSAx6m4w8EnRuZK7oBafYmX8Qi+Q0MkCz7ckaolOnA0MPHMxah0UrPFdKrRILgSzUsEZ7sq3YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCHyhUgUn5fPcwyczAO/g8S/thdFROrAVePC1QzqOQo=;
 b=S7qbwHgseRC3kRs66XGNdVwpCE2RLw99rFI/4Iul61VhbqS2ljAHLod2pCS+3WcOFH0g00sxuuP/z8lJg7s9ttjcKGpxEVxugoPr/kRGr0J7Zy2Zet17RTeo9MgXy8SoPYCbVwo1loVVlP9aJxmwdyHEdIlb74Sk7xyHbxcxHv5arhZDfMRDMA3LPtScF2YeCqIGpHPI32yoP1RIuI9H0AyaNUKHlyjkeK+PxU/Ax35ekT7HQTb538pgWe7w6CWtkoQTqI2+DMbOtoniZB5PEXIbZ0wlR6GJ04NACn6EAa1D8ZW/zDnSBGbXedssDQKKDlW/+fZ6OaVK/GuIHXVMnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KCHyhUgUn5fPcwyczAO/g8S/thdFROrAVePC1QzqOQo=;
 b=e4ksGuQNX9fwTZy+YDFg6fD2xWmb/r8PAl7myUA4rv1LPeGJMX10Ns2k8StT6FGDsqJA+LlWeim+CRYRXiQLrw3aTolH9yDSdMo80opzoOHLMM24jOO8hSqLcKD2CayWSrS0Oc0g+E0FIfzmyxBAI+WMctFaQHAPk90MAOSSR6A=
Received: from DM6PR02CA0071.namprd02.prod.outlook.com (2603:10b6:5:177::48)
 by PH0PR12MB5449.namprd12.prod.outlook.com (2603:10b6:510:e7::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 06:58:35 +0000
Received: from DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::a7) by DM6PR02CA0071.outlook.office365.com
 (2603:10b6:5:177::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.18 via Frontend
 Transport; Fri, 7 Jul 2023 06:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT067.mail.protection.outlook.com (10.13.172.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.45 via Frontend Transport; Fri, 7 Jul 2023 06:58:34 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 7 Jul
 2023 01:58:32 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <akshata.mukundshetty@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/2] HID: amd_sfh: Rename the float32 variable
Date:   Fri, 7 Jul 2023 12:27:21 +0530
Message-ID: <20230707065722.9036-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
References: <20230707065722.9036-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT067:EE_|PH0PR12MB5449:EE_
X-MS-Office365-Filtering-Correlation-Id: 41684f9f-065a-42d9-c69f-08db7eb7950d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gYGm1KRqFpwNTMYr+JAmqtG7cgBbsZmdfVLoLPQspE9oPwWtM6xF4+9H0ze/TmV1aA7FG+pWnlVTVzgaFwj4/BFOORiGiJVzAbZNQqnNqPGHvf8dKmzwGIcl7ccVhmqGagp15m5fFxTcTeATy4HZzGaoZJaOkryYMYWq38dd7PZ9b18vRVScZ7iu49x+WboEz1RG1hoXpCmg/v/3Hn2zZmrijTWJB3nSv2bfImZp/HZ5L2ABFYOaKJ8btU3L8oEpMLhXF2jv7AHrTF5tqB1Ky6eBX2rgsBUoV3mK0nS6Gx0XTHZ0vjw/tfcPuT2SVtagwxMA1MVfoLBSkUcoxYXSKObRJOV4LJyEfelQJJO4tjP5EuuCge13Nb/P/AuvSPVxqjV0xnQVxMiUQEK+Oi5Z7P8BvJ1CMJ5oi6aVn4+BremKxp3rZfx9Xi5DFXRO3CvTUbUk9SbIm3eD3oPUDBXGQYokTk5UiM0tr95s/pOdoazABmLHuWPiDBgnehCvHKKZ5YIyOboe/n9Qo3hoALUdfZbhxxKydJdxnzUwvc0/MLXNCBEuUIpzRPA2W9C3otUwnz2wX2BmYiF778bi3oJwUzmxePjUdfbpRpjf+B7ux7obtGgYlULPvUZesINj0hKxVcvWfIqwMGrCF2f4PIN78qWRJKFAfEZfNp2BCAyGLJhhFjqH535FoPabhRbMGKexqRj0W98PmCRn13OtnQZzye3rzrTYhmUKqk+XPl4fjib6PGNvwfRnYIgPQMoCD5iH2ftmuy5ya82F/g+ZgAxnCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199021)(46966006)(40470700004)(36840700001)(81166007)(82740400003)(356005)(36756003)(86362001)(82310400005)(40460700003)(40480700001)(8936002)(8676002)(41300700001)(26005)(5660300002)(1076003)(186003)(2616005)(2906002)(16526019)(36860700001)(336012)(426003)(83380400001)(47076005)(316002)(70206006)(7696005)(70586007)(6666004)(478600001)(110136005)(4326008)(6636002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 06:58:34.7098
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41684f9f-065a-42d9-c69f-08db7eb7950d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5449
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As float32 is also used in other places as a data type, it is necessary
to rename the float32 variable in order to avoid confusion.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 6f0d332ccf51..c81d20cd3081 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -132,13 +132,13 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-static int float_to_int(u32 float32)
+static int float_to_int(u32 flt32_val)
 {
 	int fraction, shift, mantissa, sign, exp, zeropre;
 
-	mantissa = float32 & GENMASK(22, 0);
-	sign = (float32 & BIT(31)) ? -1 : 1;
-	exp = (float32 & ~BIT(31)) >> 23;
+	mantissa = flt32_val & GENMASK(22, 0);
+	sign = (flt32_val & BIT(31)) ? -1 : 1;
+	exp = (flt32_val & ~BIT(31)) >> 23;
 
 	if (!exp && !mantissa)
 		return 0;
@@ -151,10 +151,10 @@ static int float_to_int(u32 float32)
 	}
 
 	shift = 23 - exp;
-	float32 = BIT(exp) + (mantissa >> shift);
+	flt32_val = BIT(exp) + (mantissa >> shift);
 	fraction = mantissa & GENMASK(shift - 1, 0);
 
-	return (((fraction * 100) >> shift) >= 50) ? sign * (float32 + 1) : sign * float32;
+	return (((fraction * 100) >> shift) >= 50) ? sign * (flt32_val + 1) : sign * flt32_val;
 }
 
 static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
-- 
2.25.1

