Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327074AD8DA
	for <lists+linux-input@lfdr.de>; Tue,  8 Feb 2022 14:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243057AbiBHNQD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Feb 2022 08:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355703AbiBHMVy (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Feb 2022 07:21:54 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B2AC03FECA
        for <linux-input@vger.kernel.org>; Tue,  8 Feb 2022 04:21:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N01kt4ScD0Fua9HxFHBYjlc8GZeTnxE1/8JVvvq2glNHebTPa/HY5miA0mV7n7PydTfOa7KNDAk7iAA4tnMpfPYukfw3Y1ARkM8Z7Iytq3VcDoA8cVKMNlw0padJsUudG1LcM2L4f6tXYCWnedqAwlmUqaH2MJyESgiYmDQ8Ev8FMOQ2nVsheQm1gk8wUeHaI6bxvFInyU0+OkbSro84Tt2c+axO0qr/4rRGi2sdsSh6wUyXtkVY1tch5LJoGUyPFBmSwqjk5ZK5yGayI/Cixt5YMx2UHCa/Px0RiyPovf4d79oqus+OSdmdAF1BIkI7Ca98VdRbfHf0hzp4cViYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e9GP3wa/BO3DMAA2lMoClvvg0oCUDBnFECoqBoZMSmM=;
 b=n6PoDmzruCvem2PJgosmQd2yaJOM/Qj85EBe93ibFwPqpnydli9PKWqlcTrD3+mMGTPfau4HF0F5ilo835w8MqepuIp3g8Lh/pLgnerjE658hEvI3hxzHWRn0svHVF+mrNJiSUpSUvx3coczSt2OPzbcEjcrXwEVcZCAVQLaa+29hLUPKP35dY7feqSbVMbu8mMCVyPknNTW9cVjraKDG+zpIKyH9RDcwH3b/E/S5TEYRGL4mXVNioU2QQi+0NiK8x0rbN4zebmyb/zF0HT3XhadP+hgH+ar3KC+xrYh1tJ2+e6RfkUlAY2mPIGbBFHc8rZ3J6Fv/eR1aLqgsfBpKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9GP3wa/BO3DMAA2lMoClvvg0oCUDBnFECoqBoZMSmM=;
 b=wKqIqxMfRB32l695dqRLNXMr7mhrUQ27Ddkz03JXfraDPMQuMnEVv2Sted1mZIRvQRH6Lmhk2vqTiOmsNGGKPBdoAGsDwgTIWYFOQ+9gCc0KVcwzzWkByZ4v/qNbWICBpgwA6wDB4Ja192cWtpwWJgWZHVaITyp2u/i3u4MLfJY=
Received: from MWHPR14CA0022.namprd14.prod.outlook.com (2603:10b6:300:ae::32)
 by DM5PR12MB1515.namprd12.prod.outlook.com (2603:10b6:4:6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11; Tue, 8 Feb 2022 12:21:51 +0000
Received: from CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ae:cafe::3f) by MWHPR14CA0022.outlook.office365.com
 (2603:10b6:300:ae::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Tue, 8 Feb 2022 12:21:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT036.mail.protection.outlook.com (10.13.174.124) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Tue, 8 Feb 2022 12:21:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 8 Feb
 2022 06:21:48 -0600
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>, <Nehal-Bakulchandra.shah@amd.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 4/5] HID: amd_sfh: Add functionality to clear interrupts
Date:   Tue, 8 Feb 2022 17:51:11 +0530
Message-ID: <20220208122112.942471-5-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: fe7ebf5a-f4d7-413e-d24c-08d9eafd95e0
X-MS-TrafficTypeDiagnostic: DM5PR12MB1515:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1515D8F85D12D29453715568E62D9@DM5PR12MB1515.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JXSpxPTnli9yYk5Sif4kTvWntb1XKBh2/UaBls1RauZq2Uee7gjjy0ljDi6+4Ii6Zc7IHQ4A3MeakaTcnWpwDmfA2XrSSWPlp2Obk8DkMAFaYdyr1K2Nx1LiMbQb1cI+o7NqZtpqfwA0PbHJVFD3HcdWGyWfSn70WE8AqzA36GA1Vx4kLbTM4JUDG857qSAQO0N/qU0Oi2Q17kZb+RgGMGdVWHqhdeE/HAtqlf+8Pub9PHMsXfxRuz6n9EMJMJ5YkAP8/mtn7EWgZICoefUU2KgeLvXAeg5QX+ZEb1857S/OB7KJd36uoUYKrlzNMe5CnILrjx0y3XofjZdqX6wuczBl3Tqg39wAkFLkwXDVceppjFDos/yTKeXPTg4Lmq+6beHKFDeDEFDSmfyxbtGnyYL5sYv7CO6KLn5bDf1YFdiYVcygwfw35fZWaUbg5ICSfexYi+Oas6Dd67uGV64ks8SlJ2qPGJ9w3GNFBMrRsDSu1jNGkTpZ+p16dm67iDCwp/70J07PESthMMjOVTlY0li08FexwSx2yMghSkdKivbc6SQ5qOu4n5daiwoZN0EBRjqb4YgObaIRlDIYrejfKrccuQ8seN+8PA3dkTgzPH/J2Cz3BKBEwY1SrzWEYx0uEF1IJycC6JWpyrc+fiWaVM9iPAmJ10RKCkUIzC7Ap1wEw015DbA3isCTyimSjYUiuGKBLm+U/gsdLB/mq3jpBQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70586007)(36756003)(6666004)(8676002)(5660300002)(4326008)(70206006)(8936002)(508600001)(316002)(40460700003)(2906002)(83380400001)(426003)(356005)(1076003)(110136005)(16526019)(6636002)(26005)(81166007)(86362001)(2616005)(7696005)(336012)(47076005)(36860700001)(82310400004)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 12:21:50.9925
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7ebf5a-f4d7-413e-d24c-08d9eafd95e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1515
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Newer AMD platforms with SFH may generate interrupts on some events
which are unwarranted. Until this is cleared the actual MP2 data
processing maybe stalled in some cases.

Add a mechanism to clear the pending interrupts (if any) during the
driver initialization and sensor command operations.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 25 ++++++++++++++++++++++++-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h |  1 +
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 16670e910014..7236b223fb68 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -92,6 +92,20 @@ static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
+static void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
+{
+	if (readl(privdata->mmio + AMD_P2C_MSG(4))) {
+		writel(0, privdata->mmio + AMD_P2C_MSG(4));
+		writel(0xf, privdata->mmio + AMD_P2C_MSG(5));
+	}
+}
+
+static void amd_sfh_clear_intr(struct amd_mp2_dev *privdata)
+{
+	if (privdata->mp2_ops->clear_intr)
+		privdata->mp2_ops->clear_intr(privdata);
+}
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
@@ -196,6 +210,7 @@ static void amd_mp2_pci_remove(void *privdata)
 	struct amd_mp2_dev *mp2 = privdata;
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
+	amd_sfh_clear_intr(mp2);
 }
 
 static const struct amd_mp2_ops amd_sfh_ops_v2 = {
@@ -203,6 +218,7 @@ static const struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.stop = amd_stop_sensor_v2,
 	.stop_all = amd_stop_all_sensor_v2,
 	.response = amd_sfh_wait_response_v2,
+	.clear_intr = amd_sfh_clear_intr_v2,
 };
 
 static const struct amd_mp2_ops amd_sfh_ops = {
@@ -265,8 +281,13 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	mp2_select_ops(privdata);
 
 	rc = amd_sfh_hid_client_init(privdata);
-	if (rc)
+	if (rc) {
+		amd_sfh_clear_intr(privdata);
+		dev_err(&pdev->dev, "amd_sfh_hid_client_init failed\n");
 		return rc;
+	}
+
+	amd_sfh_clear_intr(privdata);
 
 	return devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
 }
@@ -294,6 +315,7 @@ static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
 	}
 
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
+	amd_sfh_clear_intr(mp2);
 
 	return 0;
 }
@@ -318,6 +340,7 @@ static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
 	}
 
 	cancel_delayed_work_sync(&cl_data->work_buffer);
+	amd_sfh_clear_intr(mp2);
 
 	return 0;
 }
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 8a9c544c27ae..61de09ba5124 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -141,5 +141,6 @@ struct amd_mp2_ops {
 	 void (*stop)(struct amd_mp2_dev *privdata, u16 sensor_idx);
 	 void (*stop_all)(struct amd_mp2_dev *privdata);
 	 int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
+	 void (*clear_intr)(struct amd_mp2_dev *privdata);
 };
 #endif
-- 
2.25.1

