Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E56A55EBFB8
	for <lists+linux-input@lfdr.de>; Tue, 27 Sep 2022 12:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbiI0K2A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 27 Sep 2022 06:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiI0K1y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 27 Sep 2022 06:27:54 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A052FE66F
        for <linux-input@vger.kernel.org>; Tue, 27 Sep 2022 03:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmWwq69/Bmw+3ONXHLQw/qbDZGvoTm9afI3U9dV0/I+qLW+FfERbhGMqiG4L11DAxMnq4PofjeqVaFvDX2i6VF8SGJrPKKpvfgjfOAqgIgM5npcQr4qUnULgETrUgL48n03pXz5u5EXXlWl+toMAUVUzbUlTPoUW4cFCUb03PVbbvQ7pPkM2wku1baoAf2YKxqMTeMqkdxykil2aHJ6+zwWsiY+S9ttvhCMEmgwyySMVefr3RkZLjO+OGNMrCItcePuv2rA3+l2EL2OlDWAhP8zXU6/j6fIJnV3jTwHSXlgBsWr0nAG5ml3SCcJu93p2DDpfCYd780Q5RZoaKjX7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l6+V4CJA8ppmTKM/jK7ggKMTx0eKz5vNteWRxpuVUc=;
 b=PvFrsr5Ldgjk50kLgDog4ew0HF706HZcGKS5H3lPTc4LiKA/JjJ0qeUfcgJtC0VmvwGbbSRcqyUBjrDy3bUZIGisrGleGS1o8EOarAdXQ5p+MY0GhtKDlhVwL54KoCMCzyCQlmHa9E+FULmEc0q94qVQ9ZeWo6rr4O5ycqHYns+Ujv+duhQICWNqaFhES1sGRL5mQPqPuF97QuqNY3ugaInJCdkT8Rgpl1LA3jaYPMuA0rHbutN0EqW9kfzbMytdQNVSxMr7D1EYpz2zuk50VVVUChvU/KHAX7TX5f4wDfmoMdJA9XSUkmvqRI/UfxhrRM5N/M6HgzXM5D6tI7QnAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l6+V4CJA8ppmTKM/jK7ggKMTx0eKz5vNteWRxpuVUc=;
 b=tywGOpEU/BYk0thlLabXdMwCvgktXHvdk+447zvucR8JCcy/rsaN+cABtWJW50BGdQkyH3kru7dtixXRQQBr7yqZ649AKyNr5Njri8HITXoNLTQQZW/hAyyOMo3iFjEMOBJzSyy18YNQGNRc3xpSMYI9Ae9qtjDVo5hw6wKbnSw=
Received: from DM5PR07CA0102.namprd07.prod.outlook.com (2603:10b6:4:ae::31) by
 MN2PR12MB4568.namprd12.prod.outlook.com (2603:10b6:208:260::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Tue, 27 Sep
 2022 10:27:44 +0000
Received: from DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::63) by DM5PR07CA0102.outlook.office365.com
 (2603:10b6:4:ae::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26 via Frontend
 Transport; Tue, 27 Sep 2022 10:27:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT063.mail.protection.outlook.com (10.13.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 10:27:44 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 05:27:42 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v2 1/2] HID: amd_sfh: Change dev_err to dev_dbg for additional debug info
Date:   Tue, 27 Sep 2022 15:57:25 +0530
Message-ID: <20220927102726.1599178-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
References: <20220927102726.1599178-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT063:EE_|MN2PR12MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: 201aff4b-584e-4c85-4754-08daa072ea85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eRC8zd5gCZEzMlCjraz6wCIkLRmwi84zlRH4UNXjZaQhB7hQfrYmz4eL5eoaLWvfT8i90OFCsWBVBuUVISQZ6sCLnQwSyeVccyydCYz8vWbQCqWQVyuMKjQVuwh32JsWRgF1TRcfi3sfgkXf7ykjHpcUn0kNL71AeiHd7XnfxaacJD2tUjN72n8R7WIrG7uuuKeTJEJmhzYJjwlVhdFIZgVkqub+LzOFG9DAmmQ8+IgiwufsvMc75k35q9S5FOHSmn8Z3+4Tpf830LhTnt6o5k2TqgHvZ+mZSfH09Pt9Qdem4E0JKk2QeCm8hfp8mFWPOdO1N1etQGz0VBEx3UdvPYpcDulogbT4UQ+Vs2TGyHme5v6XbYoLUX2A0NKTG0O+3wASZFov6X/5KvpLEPSJqkBSx76bwo7V6ZD9tuW8UDWV68qCDcDng3LjBRfpv+rZ9NLoTYTo54zbUpsFiL0s6y3lNVKXWryHpugcq9RIiRnkyj76teCVMfy0NjGrjvEYg/6T0Jgbdqusa7tgDlQ+tGP8RZRmwWTCkDpKwOM6iDf1rtphSZXX1waIPx6JULknEuVdulO5XlOzf+7Bw1eZ9purb7Ih2OdZVQqZXLKlsnDMBP/b2/RJuLB6DkTx9PloFNx9V6LeEJl5fEX4XsONiDpaF3oBoScmDAH3EYaErA9WoDJtlikWG70Hs8e0TGBwmP8IP/P3B8ZS94FHrwH07GjaplZIiMDOy/jcy2VO+CbaFw1PYmqDui5bDmPuTC09QxYdRu4TGZ/H8W93EKL74ZBUeBjmx/PcPyU7N0OejhpwU6R9ebAEGe7JzfG3KuT8
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(346002)(136003)(451199015)(36840700001)(40470700004)(46966006)(70206006)(7696005)(81166007)(8676002)(41300700001)(336012)(186003)(1076003)(356005)(2616005)(36756003)(2906002)(16526019)(70586007)(83380400001)(426003)(82310400005)(40460700003)(8936002)(5660300002)(47076005)(82740400003)(26005)(36860700001)(40480700001)(6666004)(4326008)(478600001)(86362001)(110136005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 10:27:44.6728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 201aff4b-584e-4c85-4754-08daa072ea85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4568
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Users should only be notified at most one time on systems doesn't have
any sensors connected or non-supported systems.

Check the return code and don't display error messages in those
conditions.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 70436f9fad2f..d840efb4a2e2 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -286,13 +286,13 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	phy_base <<= 21;
 	if (!devm_request_mem_region(dev, phy_base, 128 * 1024, "amd_sfh")) {
-		dev_err(dev, "can't reserve mmio registers\n");
+		dev_dbg(dev, "can't reserve mmio registers\n");
 		return -ENOMEM;
 	}
 
 	mp2->vsbase = devm_ioremap(dev, phy_base, 128 * 1024);
 	if (!mp2->vsbase) {
-		dev_err(dev, "failed to remap vsbase\n");
+		dev_dbg(dev, "failed to remap vsbase\n");
 		return -ENOMEM;
 	}
 
@@ -301,7 +301,7 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
 	if (binfo.sbase.fw_info.fw_ver == 0 || binfo.sbase.s_list.sl.sensors == 0) {
-		dev_err(dev, "failed to get sensors\n");
+		dev_dbg(dev, "failed to get sensors\n");
 		return -EOPNOTSUPP;
 	}
 	dev_dbg(dev, "firmware version 0x%x\n", binfo.sbase.fw_info.fw_ver);
-- 
2.25.1

