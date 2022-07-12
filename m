Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E6C572265
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbiGLSTf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbiGLST2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:28 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EEFCC1FD0
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VNyu3ZhRacv2FbU+Ln470IDPuIwyo9DvmgUVkrcqKI5nXH7xCykhKB1xTLeLh5+vBS4lEJTIMoiXTOQSj3pIdRysdWmITSMceLsuCywm48oF2o41cNDb5c5yITRwue6IAs7AOoGdkqV8KppoUUXFiqQQip51Prw63iPnSH9iLC5iWQUGNQOnnHAGiePBeLeHkg7W/gdfRP7OBQXof/oCrYtzQEuBNZA8A8f9uRW9BxoHQsbUOHa7Dt6J9ucqnlTs2x33aouq3H0We6KE2qcGXStr52avBJSdajwvkLbFPfBbY0LbYW7+oYJPWvy5TvXaw7XBBG2t735w78Oqxa6/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c1BKsqPXgH7EUslIdOD5uoM9con7G28rkj25TINMDgU=;
 b=nV4OneF3vGrMrNkEZTTeNM3u7sjCYPxdlhF3O7YWzAgylJyGUp0zyIwDRSX+nDSC34mqOv37Y5QakkV08Qb9s1R0Zy4Uaexkc9z4RCUzS9sxrgmuG0GSXgF3OH6LJzldAx8p9Ku2BBXpYw/KnHPq2LVHOIB8R+i8nKt3p1rDw551mGcFp8SZTaHbBx7R/6epGcPbSw5FLUIOqmNRAfDSlfyDri8D2GkP9h3y8manNYJh1JsQ9ECrCXbnL2XElmKLeqqzwG9ncgyvU2OyzgzHkxenG9kHdqRvbEHViTw2ayXeB24jx3wYhE6t54fcMY8JokdYBxFuhvd8EOcdED2QcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c1BKsqPXgH7EUslIdOD5uoM9con7G28rkj25TINMDgU=;
 b=5Lp5OuuUD3W66114OB1CCh3KbGJP6+P2QuMgGpLYbZxcVhY4nBXvyjsb1Fp2TwFNfTkJbbA8VGl2ThCklD2JURCBn9cneon+91I6vQgZK0t5KvfG1cyT0tddHMWJmAZ+AakAN6f5FXJmP6eB3xYkRbUzXkW6FhjKXb0lVwo08o4=
Received: from DM5PR08CA0060.namprd08.prod.outlook.com (2603:10b6:4:60::49) by
 DM6PR12MB4355.namprd12.prod.outlook.com (2603:10b6:5:2a3::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Tue, 12 Jul 2022 18:19:23 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::cb) by DM5PR08CA0060.outlook.office365.com
 (2603:10b6:4:60::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:21 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 07/11] HID: amd_sfh: Add remove operation in amd_mp2_ops
Date:   Tue, 12 Jul 2022 23:48:32 +0530
Message-ID: <20220712181836.3488343-8-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 72cbd521-0b77-4a59-790a-08da64330bed
X-MS-TrafficTypeDiagnostic: DM6PR12MB4355:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVBCoyAV5LW7ZYSmeaP5cxPnVyCCw92oPv0avA57vjMUBkMbthAKlHfucEaaPjK7sj992+Q1pVMFJsj4u1gh1BUcmYj4BACtMQgeJqFv+XqSLiHYI/6NN+bgSs1Bq6rmpzJxY2515IVoVkvzEUgBCqRCrOUR672dW0+R/MQBzkVKiHUzn8gVw59vKTDtuEFDF+LKnJYiustVuu+ybbaGAeSkY0hm4kqj2WgLH/jC5WjREUbQNG6elbSKUXCFRfQt7WMFnVdqMuVyWrRMC47b+X25uU+pllx29lna6zJ557DbKcE9cVRnXDmkbwReAIOiDLmvKGSefAlBmIlXclRChs9/GKSDnU2lduQlYLgfEK4mXKqImbtMEE+iCgHRqo2fiNhri/OjBVFPOnpUky2k+IQwZj4UrhheF96cJVvT/hYWk6UtHsmqisE6VAvMtqOPHwFSITc+M3beauLnFPMP6tdUPDOaMD8xR0FwX8Vvx7+q44PIFPxKr7v43HWyuW1b3U4Eq3MOE48C103wQUPEsXSlvWR9C4j2MA1nWn9dSSd5ocBkJiVefmbLdbNHSamAQJtix7wvHWK8W31sFcTokkLLYf3Pa1cMzpRZQ6SMu52L34Db3gkOSmf8WTwYzb7fn/l64jeIwiWLPRx8P/R5fAdccT+6Z5v+7cgmuzwOFt/4Vbdve8jbgbnPQoDDRtwtXbTKH1a7IztTgPtj7VeNFI3swzIPUV8NWGbXs8zjTq9DDTdvh9vEqBy9FR+Il/9oLxCE64UoywXrouxbX2mFaO2eQNUZcza1dJki9bPBkLNYt1G3RxALNYYHvRRpM2xsB2hs3+MlJQ017BiiD4+cc/eu3uOYXXfr8ujFKGqPULw=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(36840700001)(46966006)(40470700004)(36860700001)(82310400005)(86362001)(40460700003)(2906002)(8936002)(82740400003)(356005)(478600001)(316002)(81166007)(41300700001)(5660300002)(70206006)(70586007)(110136005)(26005)(4326008)(426003)(8676002)(336012)(186003)(16526019)(47076005)(40480700001)(1076003)(83380400001)(7696005)(6666004)(36756003)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:23.1474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72cbd521-0b77-4a59-790a-08da64330bed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4355
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add remove operation as part of amd_mp2_ops structure to support all
AMD SOCs and use wherever applicable.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h | 1 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 2b45d507ead7..afecf7d2bebe 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -56,6 +56,7 @@ struct amd_mp2_ops {
 	int (*discovery_status)(struct amd_mp2_dev *privdata);
 	void (*suspend)(struct amd_mp2_dev *mp2);
 	void (*resume)(struct amd_mp2_dev *mp2);
+	void (*remove)(void *privdata);
 	int (*get_rep_desc)(int sensor_idx, u8 rep_desc[]);
 	u32 (*get_desc_sz)(int sensor_idx, int descriptor_name);
 	u8 (*get_feat_rep)(int sensor_idx, int report_id, u8 *feature_report);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index be9ac3778f37..62e6757f889d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -252,12 +252,14 @@ static struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.clear_intr = amd_sfh_clear_intr_v2,
 	.init_intr = amd_sfh_irq_init_v2,
 	.discovery_status = amd_sfh_dis_sts_v2,
+	.remove = amd_mp2_pci_remove,
 };
 
 static struct amd_mp2_ops amd_sfh_ops = {
 	.start = amd_start_sensor,
 	.stop = amd_stop_sensor,
 	.stop_all = amd_stop_all_sensors,
+	.remove = amd_mp2_pci_remove,
 };
 
 static void mp2_select_ops(struct amd_mp2_dev *privdata)
@@ -333,7 +335,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	amd_sfh_clear_intr(privdata);
 
-	return devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
+	return devm_add_action_or_reset(&pdev->dev, privdata->mp2_ops->remove, privdata);
 }
 
 static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
-- 
2.25.1

