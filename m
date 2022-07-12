Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44610572262
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233368AbiGLSTm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbiGLSTc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:32 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73D9FD1389
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY9UzHUsI2BVMipL9vVJTbIcTKn70JMK9v0cQliCll2ube+XNBCgMCKJQGsUvdn7VGpyYmoNdcDLwnVDokU4760vhW0GoXxipRfSwkPbKbkMHLw7QB5yo5AtuBuBGxFTAYL1CIBhDBHN1TsCJKIoYtuqOkclot4aEgqZAYWDJseUm2P6tZAG6MmxmJlMujX2g6pfnoJZ8YXxA1sgaxtAdewbFyQu/sDcHwAsIa1Iap6tmcoyimTpyKFESe3XK4gPdIg9hgJkM7WUpC9h9mkhdwn1rrlRg91ZDoHVk6Bj1cHk1GZblrhvw+U7m0XuBN00gV1kpFQX3rJdG2VutVm9SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tye7fFHH/+vQFO6+oWMbuUK1ELPOi5Z/IcbrXunKnBw=;
 b=Fu80x12h3GVRlQEmz8c+N6BXORZK6QvOIPPjJ3zrsgSNyEO39eEy0Ns50lFyeJLDVFYYbQU8c0PAEK0kqeKU4ia2nKHryb2pxeIq9BQCc5xJ0CDp3b6Nc/wKbad7G8rdaEVrxotA1+UFijmhkxn89WPwaJMvoAj+35jV2B7nOIs2ftKSslvP+oSVfNmxSKRNHw0BkFQ6YkM138qz6pimS32DHHiIcrLI4eDxFIoyAtufREP8FAOZmuzjxu4gcu6QwpM+sR9Z0urdpM5EVLDAN8dbaaQy6o1mMdhpo7u06nQ2SPp2NBlc6GwhwhH99q5H0gYyYrUjIROMX5r4MwmMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tye7fFHH/+vQFO6+oWMbuUK1ELPOi5Z/IcbrXunKnBw=;
 b=2zwuDwvZ5VeebxvHz6VP2AvIV5AGovNEYhhX1EnDSPJrKSaQmvp6KTJTlT6DGmyoTx7i0X6gz0SaG07z/k+0YrS23cGNdG1wFJjAl7yaRse0OQ8Ss0oFc/RucLEgNIXzk5/+3HiQpqUqR1cHadeMNmpc1j2sSuf4QutCywdGgyI=
Received: from DM6PR07CA0039.namprd07.prod.outlook.com (2603:10b6:5:74::16) by
 CY4PR1201MB0229.namprd12.prod.outlook.com (2603:10b6:910:1d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Tue, 12 Jul
 2022 18:19:25 +0000
Received: from DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::64) by DM6PR07CA0039.outlook.office365.com
 (2603:10b6:5:74::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT059.mail.protection.outlook.com (10.13.172.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Tue, 12 Jul 2022 18:19:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:22 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 08/11] HID: amd_sfh: Move global functions to static
Date:   Tue, 12 Jul 2022 23:48:33 +0530
Message-ID: <20220712181836.3488343-9-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 89bc0075-166e-4d70-ee36-08da64330cef
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0229:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Aemic4TmcCLfmoTxlvMy9XxYdTJd6Uud37DWj72YZiB1K6d/9/bui83vht3NpAgAkdByuvs9KTl0qvEA1TOJRPBQRrLrm/46ScyMk4MlbOPsvlQgvrIw+ZydBP6eGTVJMQuOlPV2TPhT+Xu+lgRQYbneS8mREfsQMbreR8wz6NvgO+5D1qdt+BQWSkWeVSwkM0b7VDWNnYWeVlSEcydSZLGzcQgHpz0Bp+fNtuo3hOZZnxyrwifKbsd9oZ35N4b3RARbxyf6fodQhGtPOqICdBc17mTScFRSZHzr+QbowY0v/E2+B+fHIluZZSa6I2uW9o9VPIIce4E66VYYv2JcwA0jU6CpUbfC4mf9ttntJbBPJisJSiG/kLz6CwRP+x1FCvFgD1kPEyiMInNucMwyZ8HLvig9TXynqKOl1GAHeaaTLhT6R+NVvcl87IiGv5fHwZVwa77ymY8LGsow1ARnH42BdbAUtn8hgmejLtrKBogtKjBPq6m/2nzm8QsRJZ4SIgkT6l3xix1x1rjsZ2HDELgaM45Uq6ggcVBpxXsYLmkTlf/rg3snt6raw8gTZk7sXoYlbGcfjTo0S0xVFPdHB9ouT6/1tMCChLWHYhovonQfWjue1kj2BWYb2zAPbgGvQXVL0IntU/YBn8rgtV02d38Pkxbv43988aeJOBG460DHFci06/ga6d3BTr6RPskmrlVBGbLfpD5gzEdWSUL2PEo8gw2He2tgz5Qp7GQfK6jZgLltk+IqF+Xq0U0loMi1q1p0jTYT4uTcxz9Ex0WaRuIdmBmJEhd5oHYkifN2psRgdGcz9necIVHwmSu+yupShwD8FuJsVBzI9AdyLcTa2r+Be5jROQz13Dui5BlLos=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(39860400002)(396003)(40470700004)(36840700001)(46966006)(110136005)(70586007)(8936002)(4326008)(5660300002)(2906002)(82310400005)(36756003)(40460700003)(316002)(40480700001)(86362001)(70206006)(7696005)(81166007)(6666004)(83380400001)(478600001)(16526019)(8676002)(186003)(47076005)(336012)(41300700001)(2616005)(26005)(36860700001)(356005)(82740400003)(426003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:24.8569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bc0075-166e-4d70-ee36-08da64330cef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0229
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Move global functions declared from header files and make them as static
functions wherever applicable.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 4 ++--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 6 +++---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 7 -------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index b198b564db7d..1f59fabded85 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -129,7 +129,7 @@ static void amd_sfh_work_buffer(struct work_struct *work)
 	schedule_delayed_work(&cli_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 }
 
-u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
+static u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
 {
 	if (mp2->mp2_ops->response)
 		sensor_sts = mp2->mp2_ops->response(mp2, sid, sensor_sts);
@@ -137,7 +137,7 @@ u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
 	return sensor_sts;
 }
 
-const char *get_sensor_name(int idx)
+static const char *get_sensor_name(int idx)
 {
 	switch (idx) {
 	case accel_idx:
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 62e6757f889d..c9a9ac11f124 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -136,7 +136,7 @@ static int amd_sfh_dis_sts_v2(struct amd_mp2_dev *privdata)
 		      SENSOR_DISCOVERY_STATUS_MASK) >> SENSOR_DISCOVERY_STATUS_SHIFT;
 }
 
-void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
+static void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
 	union sfh_cmd_base cmd_base;
@@ -157,7 +157,7 @@ void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info i
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
-void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
+static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
 {
 	union sfh_cmd_base cmd_base;
 
@@ -171,7 +171,7 @@ void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
 	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
 }
 
-void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
+static void amd_stop_all_sensors(struct amd_mp2_dev *privdata)
 {
 	union sfh_cmd_base cmd_base;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 71c114acdd2b..dfb7cabd82ef 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -98,16 +98,9 @@ struct hpd_status {
 	};
 };
 
-void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
-void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx);
-void amd_stop_all_sensors(struct amd_mp2_dev *privdata);
 int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id);
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata);
 int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata);
-u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
-void amd_mp2_suspend(struct amd_mp2_dev *mp2);
-void amd_mp2_resume(struct amd_mp2_dev *mp2);
-const char *get_sensor_name(int idx);
 void amd_sfh_set_desc_ops(struct amd_mp2_ops *mp2_ops);
 
 #endif
-- 
2.25.1

