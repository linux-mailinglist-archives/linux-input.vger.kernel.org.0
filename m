Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2FB57225A
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbiGLST0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbiGLSTZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:25 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1166EBDB89
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BwqppxllO3UtE3ukMLcqoFVxQcHv4IsqZ+bj+F3n/vlVU1NsdCznNbdooGen61ZNl6YJBZoGjydF5HCMYo8NjWEx8cvc88kf1OfHQNkqkuGOP0B5jz8k+ddTlAf4DAfUJbVeXvviFHlrxMOBNl8JT/RveHeQa84nmdQhmOg248NyrBK+Lx7PNZ7vZCSsje7EL1mjbwNSDoxgU6LoICK8NfruqCDiB29Iacf6UG5eIzz4BIxsqJ4dQAl+vgQa/NQEPiI68Vp+zEkqwotM87Eq437onRZgDejFU/ETJy/0NSkXMbBaWKt1kTh7QzPbPNX3Q/MGvdT9fT/opCbS0pOqSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0F8LXmleuf44u0t1eaIzBurBy/MO4WhpRP6d7s4cyo=;
 b=AukT8EtH85SyeuBZ2i0lUw/Z51Cs+QdzQWrHgCMJXxyM52rILc1h0rcvkwaukL2mRs06tOjpNt9NtXne1TMW9ZfIfb5Hyl502mQ8aiOgA8kMZdOkpniRwl+yG5ccGEHqtTdmmoDg/KVQk4o99d9OqiYDOKT81P3t1ozNo8HOI+moH4JiO+qKe+yWpDBsGybzEaBP3Ltiylj0jSKtyvSvlGyo85C9S+7gXGh7/F/8r5S53xpOGPFpgYMJG7uVAe1aySfOinbXff/n1RliGtnQkHRcGSsYfL1flfPHp2NvuzQ2ea5m0WqMgYig6nA/z4LbHQNq+TSxDqyaGN7Aje+lRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0F8LXmleuf44u0t1eaIzBurBy/MO4WhpRP6d7s4cyo=;
 b=YF+9+QjC1ozCtgdR8SGvKq8mKiSpnYsGgslMT54G6TFML9biR7cx7x5pNCywHX33jwTQZqLfXwrNIHEQ2pgAtIfRbGp8eb21EFoyOCeHZC7K/6VMgFErFkusJX5tjUl6icsMizt7Bk7WCjur3lIoHtzI5tgVrx8KCFvm0EEpRBE=
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 CH2PR12MB4890.namprd12.prod.outlook.com (2603:10b6:610:63::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Tue, 12 Jul 2022 18:19:22 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::b4) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:19 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 06/11] HID: amd_sfh: Add PM operations in amd_mp2_ops
Date:   Tue, 12 Jul 2022 23:48:31 +0530
Message-ID: <20220712181836.3488343-7-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: ef00869f-b802-4727-7283-08da64330b20
X-MS-TrafficTypeDiagnostic: CH2PR12MB4890:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h3BJJAAVMeeY7kUuH3Nsvue1oGS6NQ0688Q2++77rcN2mV+QcetN9WB3MSXXfFjnXYiO0ASM7d9bhOPEvDiVWwHXS4UsrTcRKRzJKYEVNruDsqqbOptCafzEZOz18nKcT27z9sHPzuf59pJ9gB3MdDDLSK+9KMBzWUSuqxQZ+btvEtLVF8UdgeCY5zxfQAhAibiDoelSwCZM+S0Js2eFIvRImU7HY8Synzp6i7/X4AA4HIvpWAtqylpdyVEWsMSSSac4iiNfNNM1VmZ5kVHIU6sD//1I8gjECrOMH7Xx2ACkKzZGry1OwjfutHnD4MKm1X3SmVPLj9KZjcR0Pik0A3nbmRzArRm/tidxz9M7QAmeikkHjp6/1qs0xaU2BSSI455/8VO2RQ6ImfNFxzFYM13gmx4PCeZvaM+/bCXUBENzqgKY8LA+OTx7BMi9YHHRW4V0sAiH+sZwJHhwBdg6ZBMxNiPhVQS36vj0zXPCn77nMQOgMAmT8sssOo4FDRlyva7Y+7AbG0VTbb+NPQkMKPruOS7htC0TCAajMrB09UISUcFbXcnYTrOeTkM8PHMRV4mrZsN4xVkeJT/KjTivjOzuTef2r9hSVygR6MidDDKz2x6bPDetNvrP/hJhPJw+Nv+LE35XwHNEI7ttwI5Wft6d/NDD5+cXBuNqn07c7LQrD+lxxpjQpfWr7CE2dOFlzlRHapjx4w1l2+IvaZiEYQDRrCxlndnZajxN+YJdIRl8KgTRCvhSGVaN0Gf75c3Ec9cON3mFbCIaUq0sSGKVB2EJ0aTn2E4Eg7FXmPfBLgkWXZyymPX72Fq+dzFTiy1F/aosaRMzzJNFHSj3mwTKmLtub4/1fEBqBL7SGMPyvNs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(346002)(396003)(136003)(40470700004)(46966006)(36840700001)(36756003)(40460700003)(1076003)(82740400003)(478600001)(2906002)(8936002)(6666004)(426003)(356005)(36860700001)(40480700001)(4326008)(70206006)(41300700001)(8676002)(26005)(47076005)(70586007)(316002)(83380400001)(81166007)(7696005)(110136005)(86362001)(2616005)(186003)(16526019)(5660300002)(336012)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:21.8038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef00869f-b802-4727-7283-08da64330b20
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4890
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add PM operations as part of amd_mp2_ops structure to support all
AMD SOCs and use wherever applicable.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 54 ++++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_common.h |  2 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 41 +-----------------
 3 files changed, 58 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index e9ccdad66d12..b198b564db7d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -155,6 +155,57 @@ const char *get_sensor_name(int idx)
 	}
 }
 
+static void amd_sfh_resume(struct amd_mp2_dev *mp2)
+{
+	struct amdtp_cl_data *cl_data = mp2->cl_data;
+	struct amd_mp2_sensor_info info;
+	int i, status;
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_sts[i] == SENSOR_DISABLED) {
+			info.period = AMD_SFH_IDLE_LOOP;
+			info.sensor_idx = cl_data->sensor_idx[i];
+			info.dma_address = cl_data->sensor_dma_addr[i];
+			mp2->mp2_ops->start(mp2, info);
+			status = amd_sfh_wait_for_response
+					(mp2, cl_data->sensor_idx[i], SENSOR_ENABLED);
+			if (status == SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_ENABLED;
+			dev_dbg(&mp2->pdev->dev, "resume sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+		}
+	}
+
+	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
+	if (mp2->mp2_ops->clear_intr)
+		mp2->mp2_ops->clear_intr(mp2);
+}
+
+static void amd_sfh_suspend(struct amd_mp2_dev *mp2)
+{
+	struct amdtp_cl_data *cl_data = mp2->cl_data;
+	int i, status;
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_idx[i] != HPD_IDX &&
+		    cl_data->sensor_sts[i] == SENSOR_ENABLED) {
+			mp2->mp2_ops->stop(mp2, cl_data->sensor_idx[i]);
+			status = amd_sfh_wait_for_response
+					(mp2, cl_data->sensor_idx[i], SENSOR_DISABLED);
+			if (status != SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+			dev_dbg(&mp2->pdev->dev, "suspend sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+		}
+	}
+
+	cancel_delayed_work_sync(&cl_data->work_buffer);
+	if (mp2->mp2_ops->clear_intr)
+		mp2->mp2_ops->clear_intr(mp2);
+}
+
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
 	struct amd_input_data *in_data = &privdata->in_data;
@@ -172,6 +223,9 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	dev = &privdata->pdev->dev;
 	amd_sfh_set_desc_ops(mp2_ops);
 
+	mp2_ops->suspend = amd_sfh_suspend;
+	mp2_ops->resume = amd_sfh_resume;
+
 	cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index d2a72ab64ebf..2b45d507ead7 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -54,6 +54,8 @@ struct amd_mp2_ops {
 	void (*clear_intr)(struct amd_mp2_dev *privdata);
 	int (*init_intr)(struct amd_mp2_dev *privdata);
 	int (*discovery_status)(struct amd_mp2_dev *privdata);
+	void (*suspend)(struct amd_mp2_dev *mp2);
+	void (*resume)(struct amd_mp2_dev *mp2);
 	int (*get_rep_desc)(int sensor_idx, u8 rep_desc[]);
 	u32 (*get_desc_sz)(int sensor_idx, int descriptor_name);
 	u8 (*get_feat_rep)(int sensor_idx, int report_id, u8 *feature_report);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index f169b4413abb..be9ac3778f37 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -339,28 +339,8 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 {
 	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
-	struct amdtp_cl_data *cl_data = mp2->cl_data;
-	struct amd_mp2_sensor_info info;
-	int i, status;
-
-	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (cl_data->sensor_sts[i] == SENSOR_DISABLED) {
-			info.period = AMD_SFH_IDLE_LOOP;
-			info.sensor_idx = cl_data->sensor_idx[i];
-			info.dma_address = cl_data->sensor_dma_addr[i];
-			mp2->mp2_ops->start(mp2, info);
-			status = amd_sfh_wait_for_response
-					(mp2, cl_data->sensor_idx[i], SENSOR_ENABLED);
-			if (status == SENSOR_ENABLED)
-				cl_data->sensor_sts[i] = SENSOR_ENABLED;
-			dev_dbg(dev, "suspend sid 0x%x (%s) status 0x%x\n",
-				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
-				cl_data->sensor_sts[i]);
-		}
-	}
 
-	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
-	amd_sfh_clear_intr(mp2);
+	mp2->mp2_ops->resume(mp2);
 
 	return 0;
 }
@@ -368,25 +348,8 @@ static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 {
 	struct amd_mp2_dev *mp2 = dev_get_drvdata(dev);
-	struct amdtp_cl_data *cl_data = mp2->cl_data;
-	int i, status;
-
-	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (cl_data->sensor_idx[i] != HPD_IDX &&
-		    cl_data->sensor_sts[i] == SENSOR_ENABLED) {
-			mp2->mp2_ops->stop(mp2, cl_data->sensor_idx[i]);
-			status = amd_sfh_wait_for_response
-					(mp2, cl_data->sensor_idx[i], SENSOR_DISABLED);
-			if (status != SENSOR_ENABLED)
-				cl_data->sensor_sts[i] = SENSOR_DISABLED;
-			dev_dbg(dev, "suspend sid 0x%x (%s) status 0x%x\n",
-				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
-				cl_data->sensor_sts[i]);
-		}
-	}
 
-	cancel_delayed_work_sync(&cl_data->work_buffer);
-	amd_sfh_clear_intr(mp2);
+	mp2->mp2_ops->suspend(mp2);
 
 	return 0;
 }
-- 
2.25.1

