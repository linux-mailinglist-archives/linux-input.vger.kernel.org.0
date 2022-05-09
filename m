Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F72251FE21
	for <lists+linux-input@lfdr.de>; Mon,  9 May 2022 15:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235600AbiEINZU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 May 2022 09:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235803AbiEINZC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 May 2022 09:25:02 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A863248E1
        for <linux-input@vger.kernel.org>; Mon,  9 May 2022 06:21:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vv8f24S2/um7ky0UfYWJDWqiozXrLP5vMD2ya1PwiVqPwNMk4M2DysCHVTGb7iB2SjoHNb0F9v2MNMuk812Ba++Z5H2VlNbtL7gBrYd+yKcSIV4c5AKAEHMOGw+Avw5vEPuVMVJAKG5pDgzgmTVdvzWuXDICyWVqbJc20c/bTPXn43Socmvu2cpGyc0LWUoMwcTEC3A8Zo59Ij/+Pay63LWEX3FT2SV3J8ulXz/6QGt4mO55t6PXoNzKVGryRIlLs3VBC0kIsQK5inbu8X1hz2UP+zWC8HquMiErgHkHJDdjtnf10dE0glLgLXiLa1V+/C4yZFNYgGdh4EFuLiNaCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeIuqusMrfE7DaUDKeca9rSmdpQk1tZRhJFuE465sS4=;
 b=Cea2Bz3c9wMe57p8mt4MOpJ5Ve7x07mfrdSKVgXxssDWlgitFjU1wXYMarhHiTh14SiQlPCY/ZsoJO2EwTXxjYlpca6trd8IS8cikqslvvmyCxC/ySG+pdy0aTe8labzVONQUot+nPvxPtFWcTUIe7lOTnUEIlmeQReZAcPNiSwnAiuuUq8WPtWvgKi4R6bPas+3cFWSJ+58nYqw12HnHNwLi1/llNgZx1tYJxs1uDtsR7dtnOrdeEGHDBloiOr6LHvr3SyfElsJZngoYpWQJnxk/nNcWM/rMoQVAUDwH19dh2Wx70SbP2Vc0Zugh90xIvu4dhMvkZ6uarmUp47IwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeIuqusMrfE7DaUDKeca9rSmdpQk1tZRhJFuE465sS4=;
 b=KWy8fq2sR0yW5FnmxUQrO+hhNMMmW7zMoGO54cTlRjG7gnpLuiyVpQaDipWoC0M73eE/zj2998GP2ETSDFxj7K+X/S+5qxnicGo097aVvO/BOhIBRFdnTVxceqygdkJqxtAb/0nG/j25ve80DYWn02JYZHDBSEnL7AvQBDQtKvw=
Received: from MW4PR03CA0319.namprd03.prod.outlook.com (2603:10b6:303:dd::24)
 by DM6PR12MB4861.namprd12.prod.outlook.com (2603:10b6:5:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 13:21:04 +0000
Received: from CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dd:cafe::64) by MW4PR03CA0319.outlook.office365.com
 (2603:10b6:303:dd::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20 via Frontend
 Transport; Mon, 9 May 2022 13:21:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT022.mail.protection.outlook.com (10.13.175.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5227.15 via Frontend Transport; Mon, 9 May 2022 13:21:04 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 08:21:00 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 1/7] HID: amd_sfh: Add support for sensor discovery
Date:   Mon, 9 May 2022 18:50:20 +0530
Message-ID: <20220509132026.3204678-2-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
References: <20220509132026.3204678-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45fcd826-c709-4ca8-6a25-08da31bec4d5
X-MS-TrafficTypeDiagnostic: DM6PR12MB4861:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB48612BD196693EF40B802443E6C69@DM6PR12MB4861.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qVJ7+luownZbWvNmpPkA2qFAR5uwOIhFzHlEBI7aAGxOWGxyjIF8UbzRrQI8GYSKKSAqVyj53GaSQ0+RAK8sF/Ne2ibX9p4dREe5VQSfOrjFTQ71ZIgv3QnTutRIb7zFWpN19Dv7aX7tgD3wKz49qzhkLTFPa1ylVHSd1F0MkhByayKRZVTTDUIPQJ0S1rkKfqAHGu5vxkmsDLGcK9xpSpBK/Xn1ARYQHdktreEa0tPBrrfwP9hj6LHAdER8mkKTxrNbE04l2G6rtpF46tGGYYlY/OSTfO3X1P8LE0e0d+EWm+ndAwYVmwmRyhX08bUM4L7c18v72ga+1uGyYqey5qaWsiwR46EqbDj+p3qRQlq1ECXz6SU6OlJ+G3mRUhju+TjmRpjY2Y7hjUn9IqjeNfLot89V7jzaRJtr8qNt0a7Shkgf51GdyXi1PiUse0dKxVVdRC5ta0d4OO+mrecJypBfloRXMLt4IoILU4d/7KiVUwbr9VmksozotNc6PrH39Qt1TFzlQskrDoCMEO4EIM5N0rF0HD2/w8n0stzRl/ZvQN3jJjhvuEQKUEIUy9H0bItKPwv/h2pl7PrLmhV5ZmWfKe92bHDiB4XhG8gqVtpTLKq3x6AENNzxsceteNuGF5/EG4FPIUdgx0aOY3K65sYHwZIEM2/7CtC0Fy72rwENeX+qiP1XpYdEe8VY8gJBSOTSMK+Sfs7XYoyZafZN6A==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(36860700001)(2616005)(40460700003)(26005)(4326008)(8676002)(36756003)(82310400005)(16526019)(1076003)(47076005)(186003)(336012)(426003)(70206006)(70586007)(110136005)(316002)(54906003)(508600001)(5660300002)(86362001)(6666004)(2906002)(7696005)(8936002)(81166007)(83380400001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 13:21:04.0339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fcd826-c709-4ca8-6a25-08da31bec4d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4861
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sensor discovery status fails in case of broken sensors or
platform not supported. Hence disable driver on failure
of sensor discovery.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 11 +++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  7 +++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index c5de0ec4f9d0..444acd9e2cd6 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -227,6 +227,17 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		dev_dbg(dev, "sid 0x%x status 0x%x\n",
 			cl_data->sensor_idx[i], cl_data->sensor_sts[i]);
 	}
+	if (privdata->mp2_ops->discovery_status &&
+	    privdata->mp2_ops->discovery_status(privdata) == 0) {
+		amd_sfh_hid_client_deinit(privdata);
+		for (i = 0; i < cl_data->num_hid_devices; i++) {
+			devm_kfree(dev, cl_data->feature_report[i]);
+			devm_kfree(dev, in_data->input_report[i]);
+			devm_kfree(dev, cl_data->report_descr[i]);
+		}
+		dev_warn(dev, "Failed to discover, sensors not enabled\n");
+		return -EOPNOTSUPP;
+	}
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 6b5fd90b0bd1..e18a4efd8839 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -130,6 +130,12 @@ static int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata)
 	return 0;
 }
 
+static int amd_sfh_dis_sts_v2(struct amd_mp2_dev *privdata)
+{
+	return (readl(privdata->mmio + AMD_P2C_MSG(1)) &
+		      SENSOR_DISCOVERY_STATUS_MASK) >> SENSOR_DISCOVERY_STATUS_SHIFT;
+}
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
@@ -245,6 +251,7 @@ static const struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.response = amd_sfh_wait_response_v2,
 	.clear_intr = amd_sfh_clear_intr_v2,
 	.init_intr = amd_sfh_irq_init_v2,
+	.discovery_status = amd_sfh_dis_sts_v2,
 };
 
 static const struct amd_mp2_ops amd_sfh_ops = {
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 97b99861fae2..9aa88a91ac8d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -39,6 +39,9 @@
 
 #define AMD_SFH_IDLE_LOOP	200
 
+#define SENSOR_DISCOVERY_STATUS_MASK		GENMASK(5, 3)
+#define SENSOR_DISCOVERY_STATUS_SHIFT		3
+
 /* SFH Command register */
 union sfh_cmd_base {
 	u32 ul;
@@ -143,5 +146,6 @@ struct amd_mp2_ops {
 	 int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
 	 void (*clear_intr)(struct amd_mp2_dev *privdata);
 	 int (*init_intr)(struct amd_mp2_dev *privdata);
+	 int (*discovery_status)(struct amd_mp2_dev *privdata);
 };
 #endif
-- 
2.25.1

