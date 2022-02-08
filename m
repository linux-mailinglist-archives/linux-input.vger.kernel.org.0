Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9274AD8D5
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 14:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347205AbiBHNP7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 08:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356057AbiBHMV4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 07:21:56 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2079.outbound.protection.outlook.com [40.107.220.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D494C03FEC0
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 04:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wh96nR5nsmlZf/V9xtMfS3xDuN47KT11GxSuAmH1FA395bavMy7KGuCrWedVi3Agf2GJZ4FTYz1ljZre5Guu0y72hIuq+sUBsLt6AbDjN2nfQopPCCaqTDAE7DtRdioqcAAXjoN8TOE6Wm2Iji0Rzp6oQLHN0hQKWahcLPoIHnDZnDNu571olIy+sLo3nOtiYaDsvxtlm8qrWj1W0j0F/FXr2mvFQN3o+fTT75FePp/sRK5TZ8SujrQjrutbbtSIAvhMH5mEAusjW0zA4v/bHLi1Gx0TLelcszMt/hFLh0yjO+5b48quGG7gfI5Jf9aToEQeDVg9NMhYU1qNztvkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRArr+WmYcgUvnQ2G9JrB7/0BsFvS2ZpdEHbC41T9iE=;
 b=d+aPYP1YM5NEGrf90sfm6J3MDKAHZh4PI5u3oMTncS2AOg//sUiN75cyVO9aFn2myKaFupcHWCTLYPIBRPWiHpmMc/CREkQBBJEpsoPj0i0zsMPGC7l/EAplayisdULOR1Hglps379J48q5Owz1Tn6+Ark0eTb6/LgFMQkWHRnoCCStxhfxvSJTlhOCJ+sqx8VDt0ef8qPTDna/wlB83ORjjr5bhE9B97DX+OPGnmRkS2ZkfU590rzqDWoMeCs1eoEWGgN6Zy6sOjswr+MesZ0d9Tipapc5LV5eOhNQHVTAsQ0ZiNlihhqjM13I776aSDmGVx2lbuNIn0eFwQ8PEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cRArr+WmYcgUvnQ2G9JrB7/0BsFvS2ZpdEHbC41T9iE=;
 b=FczYVUxUqc3+VCxr82sve1T2b/oFzRQNWnPgBxrcovZoKMgWdsZnRAcHjw70Y0q1dkJ+0XmNFsRc3BXDo9OCX7Qs7119YT/iJoJjDVRIVj7LPpAHrF92xl9LjZmSjyq36mEF2tHSGx2yXO2P3AdGsmkswiFmv0s+j8I1EHBDmXY=
Received: from MWHPR20CA0034.namprd20.prod.outlook.com (2603:10b6:300:ed::20)
 by CH2PR12MB3894.namprd12.prod.outlook.com (2603:10b6:610:2b::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Tue, 8 Feb
 2022 12:21:53 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ed:cafe::23) by MWHPR20CA0034.outlook.office365.com
 (2603:10b6:300:ed::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Tue, 8 Feb 2022 12:21:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 12:21:53 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 06:21:50 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 5/5] HID: amd_sfh: Add interrupt handler to process interrupts
Date:   Tue, 8 Feb 2022 17:51:12 +0530
Message-ID: <20220208122112.942471-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
References: <20220208122112.942471-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23f25c91-246b-4357-f4c3-08d9eafd9731
X-MS-TrafficTypeDiagnostic: CH2PR12MB3894:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB3894EE57FC80CBA54133D08FE62D9@CH2PR12MB3894.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y7s4b9r0RNhytstVV2vtur1r3IX4oymB6Yig+Jt+vknVliLjRm6ODh8QFjfzuBs8NxJv2y2Hyz+L4QkUQlX49Dx2d7HjNMyLP9mceO8egePODgsi56KzzX/i4damZ1IkAvrNgaC9DINUv5lsSuPcdae6InJO07/j6jfDcU8Q/grahE4VJFqK3krHSHTKwi0Fb4E2Rtc/IOrlqgj3RwJPiLc4NXR/rOKtfCu64z45rHjVV+ojkkp6+i+3D/5tfd/zb4ADqDLOGpB4KQVLCKQh8nJsCJ9+LgxyaKA3nHcGY2gq8SuMB39Xg3AScMAca4fyxIMD7XI748jglko8Y2aY/B2yYZXCqSpXN87aGhl61+WMB+uBGSOBOH/6pracy7MlZwu34OSK4wNvYHCGo4+VBhEoUBfZ2U5kNVi0uwT419VMwaJ+f1xNUV3VscUiUK9TmIAm7lIxDicPYcg9k1SPohbLz80xYtgXpTnp5H9+kOhc3afJxd52chF5YuNciJg45End7434q6nvIakUqjurAx6wTr6E68pSisDdbmaO0Chz9kFMq4rWoY9A357b8uqSKn/8BHEspLJgfGuTUTsOgU/kwmEthFCjkh4NQkKhUab9OPulij2S/vDW/doBOl2ELZClvWq/Gydsfg3B9+VZdU24QJPHhG8jxnwHapodwsMzM6zWEBh2cyX3vw1PBK1fnoJiok+pAXzTmYN0xJTkgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(83380400001)(47076005)(82310400004)(86362001)(186003)(336012)(426003)(40460700003)(356005)(70586007)(81166007)(70206006)(16526019)(1076003)(2616005)(8936002)(26005)(110136005)(36756003)(316002)(6636002)(8676002)(5660300002)(2906002)(4326008)(36860700001)(6666004)(7696005)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:21:53.2019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f25c91-246b-4357-f4c3-08d9eafd9731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3894
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On newer AMD platforms with SFH, it is observed that random interrupts
get generated on the SFH hardware and until this is cleared the firmware
sensor processing is stalled, resulting in no data been received to
driver side.

Add routines to handle these interrupts, so that firmware operations are
not stalled.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 40 ++++++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  1 +
 2 files changed, 41 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 7236b223fb68..19fa734a9a79 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -106,6 +106,30 @@ static void amd_sfh_clear_intr(struct amd_mp2_dev *privdata)
 		privdata->mp2_ops->clear_intr(privdata);
 }
 
+static irqreturn_t amd_sfh_irq_handler(int irq, void *data)
+{
+	amd_sfh_clear_intr(data);
+
+	return IRQ_HANDLED;
+}
+
+static int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
+{
+	int rc;
+
+	pci_intx(privdata->pdev, true);
+
+	rc = devm_request_irq(&privdata->pdev->dev, privdata->pdev->irq,
+			      amd_sfh_irq_handler, 0, DRIVER_NAME, privdata);
+	if (rc) {
+		dev_err(&privdata->pdev->dev, "failed to request irq %d err=%d\n",
+			privdata->pdev->irq, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
@@ -210,6 +234,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	struct amd_mp2_dev *mp2 = privdata;
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
+	pci_intx(mp2->pdev, false);
 	amd_sfh_clear_intr(mp2);
 }
 
@@ -219,6 +244,7 @@ static const struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.stop_all = amd_stop_all_sensor_v2,
 	.response = amd_sfh_wait_response_v2,
 	.clear_intr = amd_sfh_clear_intr_v2,
+	.init_intr = amd_sfh_irq_init_v2,
 };
 
 static const struct amd_mp2_ops amd_sfh_ops = {
@@ -244,6 +270,14 @@ static void mp2_select_ops(struct amd_mp2_dev *privdata)
 	}
 }
 
+static int amd_sfh_irq_init(struct amd_mp2_dev *privdata)
+{
+	if (privdata->mp2_ops->init_intr)
+		return privdata->mp2_ops->init_intr(privdata);
+
+	return 0;
+}
+
 static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct amd_mp2_dev *privdata;
@@ -280,6 +314,12 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	mp2_select_ops(privdata);
 
+	rc = amd_sfh_irq_init(privdata);
+	if (rc) {
+		dev_err(&pdev->dev, "amd_sfh_irq_init failed\n");
+		return rc;
+	}
+
 	rc = amd_sfh_hid_client_init(privdata);
 	if (rc) {
 		amd_sfh_clear_intr(privdata);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 61de09ba5124..97b99861fae2 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -142,5 +142,6 @@ struct amd_mp2_ops {
 	 void (*stop_all)(struct amd_mp2_dev *privdata);
 	 int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
 	 void (*clear_intr)(struct amd_mp2_dev *privdata);
+	 int (*init_intr)(struct amd_mp2_dev *privdata);
 };
 #endif
-- 
2.25.1

