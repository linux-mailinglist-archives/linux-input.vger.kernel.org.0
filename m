Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C32E3DD9FE
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235745AbhHBOFq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:05:46 -0400
Received: from mail-bn8nam12on2065.outbound.protection.outlook.com ([40.107.237.65]:26401
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236791AbhHBOEW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAxZsIUKt23B5fmCV+58uvS2urpFjkfgsKmdocFHMcasTWdvJRaTEadA4QkJeM2r1pp/288/PaXAas2nOR9dXH7SRfgrJYRjmRQsGF1Yjg5jaOfKjVacZG+/BDy8ff3Vh6Zq/XDy8Gan1Rj0pQcQMOkF9piFvSVCYAVUvdHub7P6NF3tYMI1Q/8O4aO39MJjaBDfvRdDaeSiAdUGJCFZfqLLlLBPJ3lbPVkUeTrBvU7GBKUbowXJeNizA+gGH5weUfHSXmYv2M45AC/YtCjEtuhBU4hBOI2y+vy3jJFGoEWFMCCPLoogCMtBfw76kpR5hiu3zvCi0ujDtUIOsQwprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JA8mogdrwIZjN5zSJstgspiL0JKY4aaNYl2mVJz9yE=;
 b=DkxSRmLqeMjRq3S3ASv0yBVfa/LZpBVL21kDY6oCxW3Pf0ZPAlXnh1eUYoyG5CCzg3C9cI7TYjN8Mlcio1FyFWcKpnjjZr1iu8mFLTx6ACFp2Vk86NoDZstT8DyxyuMc6XxR9GYQqVCn/4LNYb5wa1luhdtjZXOmo2DNM06AOpKwjgVh22sBP+A7Cr48WRc85W5RBdC3xrZKUqyq2SEeO8bVksIbRok90ksLiEXuT6okHen3zlB1B0xyLF0KcGeAg+N1yH4WMnKRyhoHgm8vMT3rqJkB5EXq8QJYDVjCPOo5IEsVjDS6P9PoYCEJV1eG0EGDRltWzz3hETf0Hio9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3JA8mogdrwIZjN5zSJstgspiL0JKY4aaNYl2mVJz9yE=;
 b=OR3K5v/4dv7u9lo3W5s6HCM7gXJ7MVWWsIjdCKbmXV6rdtj+RgZBzS4IR+aQV+Dk8q2cEt/EMHg9i5OzuaTOR3CXpS1vKr4pN/k48gkKQfb+Dm+05nQq4DkNH2FkeBKEsDRKJ6HwsjJRM1pIKoDisHb4AZaAuJEPYjeE5wCJX6M=
Received: from DM5PR06CA0067.namprd06.prod.outlook.com (2603:10b6:3:37::29) by
 MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 14:04:11 +0000
Received: from DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:37:cafe::a4) by DM5PR06CA0067.outlook.office365.com
 (2603:10b6:3:37::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Mon, 2 Aug 2021 14:04:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT044.mail.protection.outlook.com (10.13.173.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 14:04:10 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 2 Aug
 2021 09:04:07 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/5] amd_sfh:Add command response to check command status
Date:   Mon, 2 Aug 2021 19:33:38 +0530
Message-ID: <20210802140341.901840-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
References: <20210802140341.901840-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd8f1b0c-2d94-4462-ef27-08d955be66e8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3935C0EA18C8F9E337FF22EDE6EF9@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1468;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X9+pMJBmzRV+Hyo2bvI+SskrNvoi+x7ZAsIv3MHif91a4XYKYDo4ykFm7uq0ZpbGGO04na5PG5DYq/Z9OVItjbrYg3tbOuox5WzkrSrIvjoGOllAyHjMLdVUN6vB2x1agArjdL0d/6NIo/peb3ECekLLFM1NPwS6Jy+ZqFA6mIGHKCsg/AvwuoQhVHzBuEwTXSJqOfnbN/WHai8AHYKzv0sgwwaUZ2Cn+7UwCYxp6CQeSR432r3t9avwMnjd8VMam1CN/Erqx746C/7S11ZP+setqrP89BCosS0E9hGxBAmNm97CNet3GxGWLacHk7qdGD+uX5OPiE9+c4DjjKX1Eato+WCVXMX+nnjZwt/hmwJ+SBzmE/QvoApPfnS1NMGksuW797MevCr3jclK/KzbJ1piitdFXhIPYZg+nVBkYqoM9RJletKrhMczqyjUBfPacQnZukoBHeK8xg/lYkTCyhxbqm5Km+300WBhzET9I0mGHdhaGPRLFTIr06v4GbrTtuvcYRyyzC7+rExQ8Jo0IpMW/MdWyxLE84vURzZe8ylGlR3RM7emgQrup1PfbtwgjJ5k+n5pUqzXq68H7dhiJ9jdEu9RmARfuylNZD0DgFCta0zgHcqF663QJw6KKC9EBqnigOgS1+imPI1VScAOuuICh6GH7phzsDvutac+soiDVd69mqxYFs4iWHFVQU8eXworvi4eSRDVNiCgyWoqMJrhP8eD5DuMymgzD5n4srA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39860400002)(376002)(36840700001)(46966006)(70206006)(81166007)(6666004)(4326008)(36756003)(356005)(86362001)(82740400003)(316002)(83380400001)(82310400003)(26005)(8936002)(336012)(16526019)(186003)(8676002)(5660300002)(70586007)(478600001)(1076003)(7696005)(36860700001)(2906002)(47076005)(2616005)(110136005)(54906003)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:04:10.7325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8f1b0c-2d94-4462-ef27-08d955be66e8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT044.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sometimes sensor enable/disable may take time, without checking the
actual status bits from MP2 FW can lead the amd-sfh to misbehave.

Hence add a status check of enable/disable command
by waiting on the command response before sending the next
command to FW.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 40 ++++++++++++++++++------
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 16 ++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 18 +++++++++++
 3 files changed, 64 insertions(+), 10 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 4710b9aa24a5..b7b66a1eb971 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -123,14 +123,24 @@ static void amd_sfh_work_buffer(struct work_struct *work)
 	int i;
 
 	for (i = 0; i < cli_data->num_hid_devices; i++) {
-		report_size = get_input_report(i, cli_data->sensor_idx[i], cli_data->report_id[i],
-					       in_data);
-		hid_input_report(cli_data->hid_sensor_hubs[i], HID_INPUT_REPORT,
-				 in_data->input_report[i], report_size, 0);
+		if (cli_data->sensor_sts[i] == SENSOR_ENABLED) {
+			report_size = get_input_report
+				(i, cli_data->sensor_idx[i], cli_data->report_id[i], in_data);
+			hid_input_report(cli_data->hid_sensor_hubs[i], HID_INPUT_REPORT,
+					 in_data->input_report[i], report_size, 0);
+		}
 	}
 	schedule_delayed_work(&cli_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 }
 
+u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
+{
+	if (mp2->mp2_ops->response)
+		sensor_sts = mp2->mp2_ops->response(mp2, sid, sensor_sts);
+
+	return sensor_sts;
+}
+
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
 	struct amd_input_data *in_data = &privdata->in_data;
@@ -139,8 +149,8 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	struct device *dev;
 	u32 feature_report_size;
 	u32 input_report_size;
+	int rc, i, status;
 	u8 cl_idx;
-	int rc, i;
 
 	dev = &privdata->pdev->dev;
 
@@ -155,7 +165,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		in_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
 								  &cl_data->sensor_dma_addr[i],
 								  GFP_KERNEL);
-		cl_data->sensor_sts[i] = 0;
+		cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
 		cl_idx = cl_data->sensor_idx[i];
@@ -201,7 +211,10 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		if (rc)
 			return rc;
 		privdata->mp2_ops->start(privdata, info);
-		cl_data->sensor_sts[i] = 1;
+		status = amd_sfh_wait_for_response
+				(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
+		if (status == SENSOR_ENABLED)
+			cl_data->sensor_sts[i] = SENSOR_ENABLED;
 	}
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
@@ -224,10 +237,17 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 {
 	struct amdtp_cl_data *cl_data = privdata->cl_data;
 	struct amd_input_data *in_data = cl_data->in_data;
-	int i;
+	int i, status;
 
-	for (i = 0; i < cl_data->num_hid_devices; i++)
-		privdata->mp2_ops->stop(privdata, i);
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
+			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+			status = amd_sfh_wait_for_response
+					(privdata, cl_data->sensor_idx[i], SENSOR_DISABLED);
+			if (status != SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+		}
+	}
 
 	cancel_delayed_work_sync(&cl_data->work);
 	cancel_delayed_work_sync(&cl_data->work_buffer);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 8d68796aa905..fd2e3011086d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -13,6 +13,7 @@
 #include <linux/dmi.h>
 #include <linux/interrupt.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
@@ -31,6 +32,20 @@ static int sensor_mask_override = -1;
 module_param_named(sensor_mask, sensor_mask_override, int, 0444);
 MODULE_PARM_DESC(sensor_mask, "override the detected sensors mask");
 
+static int amd_sfh_wait_response_v2(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
+{
+	union cmd_response cmd_resp;
+
+	/* Get response with status within a max of 800 ms timeout */
+	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
+				(cmd_resp.response_v2.response == sensor_sts &&
+				cmd_resp.response_v2.status == 0 && (sid == 0xff ||
+				cmd_resp.response_v2.sensor_id == sid)), 500, 800000))
+		return cmd_resp.response_v2.response;
+
+	return SENSOR_DISABLED;
+}
+
 static void amd_start_sensor_v2(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_base cmd_base;
@@ -183,6 +198,7 @@ static const struct amd_mp2_ops amd_sfh_ops_v2 = {
 	.start = amd_start_sensor_v2,
 	.stop = amd_stop_sensor_v2,
 	.stop_all = amd_stop_all_sensor_v2,
+	.response = amd_sfh_wait_response_v2,
 };
 
 static const struct amd_mp2_ops amd_sfh_ops = {
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 2d5c57e3782d..21ef55da712a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -24,12 +24,16 @@
 #define AMD_C2P_MSG2	0x10508
 
 #define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
+#define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
 
 /* MP2 P2C Message Registers */
 #define AMD_P2C_MSG3	0x1068C /* Supported Sensors info */
 
 #define V2_STATUS	0x2
 
+#define SENSOR_ENABLED     4
+#define SENSOR_DISABLED    5
+
 #define HPD_IDX		16
 
 /* SFH Command register */
@@ -51,6 +55,19 @@ union sfh_cmd_base {
 	} cmd_v2;
 };
 
+union cmd_response {
+	u32 resp;
+	struct {
+		u32 status	: 2;
+		u32 out_in_c2p	: 1;
+		u32 rsvd1	: 1;
+		u32 response	: 4;
+		u32 sub_cmd	: 8;
+		u32 sensor_id	: 6;
+		u32 rsvd2	: 10;
+	} response_v2;
+};
+
 union sfh_cmd_param {
 	u32 ul;
 	struct {
@@ -117,5 +134,6 @@ struct amd_mp2_ops {
 	 void (*start)(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
 	 void (*stop)(struct amd_mp2_dev *privdata, u16 sensor_idx);
 	 void (*stop_all)(struct amd_mp2_dev *privdata);
+	 int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
 };
 #endif
-- 
2.25.1

