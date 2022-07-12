Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852FC572260
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiGLSTo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233263AbiGLSTk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:40 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6024D13AC
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAYdeteetMZFC1ko49VGScC5io/Up8c8xDeB4nV7hWHtPeQ+F/7MXjxoOt0VN5Uu2vG+RMVeRSR0IW3iCwl43gdjRBVoIAESfWestiICxC/GmxIKQ7BjIMvPl92GE2mKuI0htIAdqCd8fxAfr8owcfVQVCn/ol1mQOEYHma8Z6SSdSD9nzy2Z4uLhhzlAOKMZA6KMLoMBXvE5inNY4wl0Uu/T8mVBP9BX1yAkmkHK2SXeJkJY6UfFLrdHRStEzIJ0CL8gZsiQLnJAfrXJrTbGGWNMrMW70nE/3UOQrTv+Oj86Cpt8AXAy8+f9U0R/kokElW+agQ5/PMxPu1sbK9jZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT4kFTHCsuYhmbYyh0OQqbpKIfHuvERv73xtnr1oKtc=;
 b=JEuAdK/wjQFhas/ka5EDcePiFh3qKx5fqLnSPYevsQfb/7yg468WUK3RzxuQYyTiEa0RbULClkQND4VClFLoGR0+Kr9PkkNLQQ4Or7go9poXckkH3mxuN7qUuhk1ErGqlFBTbNF7b5fyDebUUNqpKtJeroEJ247ifIrqKKWyE/pydfTFB9xeaE9XmBklmG+frZXXnmHk8mVUDMh7JQXZjUBhKKRRiEZGumLCTyHibNXCgMeZ4Uljv0n4G07EYyKRVhGlTfqLuXJMy7L9UExhGKaig8CGcm+znnM3/7Nt0cXRb6Igo/KA7WNVCOFpEldp5N+f4sN7G1XZQS2WcuKYFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lT4kFTHCsuYhmbYyh0OQqbpKIfHuvERv73xtnr1oKtc=;
 b=oVETonN/i9fXcGK4MH+FBufe5mkJvLLnsUcmpGzSSwqDCnmDOse8S/wlR9HfqVI9BETuD2eCxeRYgryl/cx8Qt/V43hII4Jk45c0IrfM1zi4uGQU89d2gq6APfp4gZYl5l+XD3U5wv8HwD/AUmGypXW6v13thXUgwiqDyySV3aY=
Received: from DS7PR03CA0220.namprd03.prod.outlook.com (2603:10b6:5:3ba::15)
 by MN0PR12MB5835.namprd12.prod.outlook.com (2603:10b6:208:37a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 18:19:28 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ba:cafe::25) by DS7PR03CA0220.outlook.office365.com
 (2603:10b6:5:3ba::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:26 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 10/11] HID: amd_sfh: Move interrupt handling to common interface
Date:   Tue, 12 Jul 2022 23:48:35 +0530
Message-ID: <20220712181836.3488343-11-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
References: <20220712181836.3488343-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f7e9804-9d4c-4f18-db9b-08da64330f01
X-MS-TrafficTypeDiagnostic: MN0PR12MB5835:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPe/Bg2LavDdZkl34HzzRb6E17vLLIGbTiKBWdXpjiFi6klE+xQZb/n+KfJaoxoB8yOAOihRy6aWhiyFFKvFbkNviLvkkGD3EN9tAM2Ic2eMg38eGpay/28lfROOmyl5kORYg4NDgWqnkUQr/W3DdzWs4ILO5XJcy9WVzPtfZvu7ZV0b8F0UUpvVc+IYuz5Rri+wPvjidxBo9RqnH7aIYynSgb4EGIjt8CUOUL0yp26wSiAaxTd7SyM+0syuvRj263lu0BviPTiq6N+OfVIUjNvj+M8ZPSj3MILhws1nmdlO0ko5tu+V157CxDSuEFNz4I0cma0uIMjmI+pW3enl7bd8Lq38jT+Kbmyq9N8K8pX9oHIWaU4cbQOgbnxZOVqS8QmJ5K63tPL3EFiyWiRyEeQHhyB6ViHo0vbmn+FS9E8zOi0p8XeksIcZxMzICVs5s+aP3TBwRoeApHj2nk5ImqOQutVvgpgnyKu0jztzO+jhkffqEML1PsJr7lpen5GczICQtc0o6W2+TKy8E7y7zpcmQ3tKGkQMno3PGwXFH2XwB6V8wZQt1n/Cc8sxx1YeF/AP9BvQkJteNM8ZHwziz39wltSogyj6cyFP3LtaNf/Ltvyl+hgytiRmubrSdoXACS8kxUEmcWDv2KRMT6ugGqVMbZJXCmzVYNeb2UMc+zfmQGz8RqlufW3wY90Nc68JDNpBT3SNjlXNrs/rJDUyhnFEJ/8YCTNCeaiNmbnpBjNH7SfKssSTAzfBGoA4PfkzJkul8Td/g1vQP+Y+TLFMj1voplszr1OeZ73q/4sv2NTGhwHnGrpIN4zlLFjzCpTR/IwO+DlbsAW79Ko/s8o+s5dLO+NMnmZdQGgkpiirk2I=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(376002)(136003)(40470700004)(46966006)(36840700001)(2906002)(478600001)(40460700003)(8936002)(41300700001)(26005)(2616005)(7696005)(86362001)(1076003)(6666004)(82740400003)(186003)(81166007)(82310400005)(36756003)(316002)(5660300002)(16526019)(47076005)(40480700001)(36860700001)(4326008)(336012)(356005)(83380400001)(8676002)(110136005)(70586007)(70206006)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:28.3298
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7e9804-9d4c-4f18-db9b-08da64330f01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5835
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Interrupt handling can be used in multiple files to support all
AMD SOCs. Hence move interrupt handling to common interface.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 6 ++----
 drivers/hid/amd-sfh-hid/amd_sfh_common.h | 4 ++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 8 ++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 8e686081c8fc..f95e623040f3 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -178,8 +178,7 @@ static void amd_sfh_resume(struct amd_mp2_dev *mp2)
 	}
 
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
-	if (mp2->mp2_ops->clear_intr)
-		mp2->mp2_ops->clear_intr(mp2);
+	amd_sfh_clear_intr(mp2);
 }
 
 static void amd_sfh_suspend(struct amd_mp2_dev *mp2)
@@ -202,8 +201,7 @@ static void amd_sfh_suspend(struct amd_mp2_dev *mp2)
 	}
 
 	cancel_delayed_work_sync(&cl_data->work_buffer);
-	if (mp2->mp2_ops->clear_intr)
-		mp2->mp2_ops->clear_intr(mp2);
+	amd_sfh_clear_intr(mp2);
 }
 
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index b3dd758ecca4..1efb72ec116f 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -66,4 +66,8 @@ struct amd_mp2_ops {
 
 void amd_sfh_work(struct work_struct *work);
 void amd_sfh_work_buffer(struct work_struct *work);
+void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata);
+int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata);
+void amd_sfh_clear_intr(struct amd_mp2_dev *privdata);
+int amd_sfh_irq_init(struct amd_mp2_dev *privdata);
 #endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index c9a9ac11f124..1425b57f3580 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -92,7 +92,7 @@ static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
-static void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
+void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
 {
 	if (readl(privdata->mmio + AMD_P2C_MSG(4))) {
 		writel(0, privdata->mmio + AMD_P2C_MSG(4));
@@ -100,7 +100,7 @@ static void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
 	}
 }
 
-static void amd_sfh_clear_intr(struct amd_mp2_dev *privdata)
+void amd_sfh_clear_intr(struct amd_mp2_dev *privdata)
 {
 	if (privdata->mp2_ops->clear_intr)
 		privdata->mp2_ops->clear_intr(privdata);
@@ -113,7 +113,7 @@ static irqreturn_t amd_sfh_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
+int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
 {
 	int rc;
 
@@ -279,7 +279,7 @@ static void mp2_select_ops(struct amd_mp2_dev *privdata)
 	}
 }
 
-static int amd_sfh_irq_init(struct amd_mp2_dev *privdata)
+int amd_sfh_irq_init(struct amd_mp2_dev *privdata)
 {
 	if (privdata->mp2_ops->init_intr)
 		return privdata->mp2_ops->init_intr(privdata);
-- 
2.25.1

