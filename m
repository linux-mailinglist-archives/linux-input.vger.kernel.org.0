Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECC573AC5D9
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 10:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbhFRIVZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 04:21:25 -0400
Received: from mail-bn8nam12on2074.outbound.protection.outlook.com ([40.107.237.74]:8534
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232120AbhFRIVZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 04:21:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmiBS/hTIAJzvpHPWeVYGg9gd+pAe+Q66JcT6LuHeP93j84mc2DIUYSrQa/8tfUjfjgEaLufhH390axgPLZp6bN1X9rClt+x2bcpEgeMgQ0DfAT11on9R4gDIacGcgNhMEVzDEumtvRZtrYS6eWPta+R2eSrNGJSQryd6tFOJ9C5IqRo+qgy7/eZ3r/tlQ29fl03oIOnLlLluUq+aSPiOQWP5vFAqNfQdPbHG8m3NTIbyNyOhAmEH2ktfxxn1jlxt99xIcpPU15K+7993x0aGkkUuT4X37c14pGIOom/lmdrpzP2AVAKwxXyAuxG+mywZz1au+nSOOKKQWzzRx8Cyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5AS6yzxokhK7UJOGfT9pMXzwgfAr9N0ZOfQbK/C4OY=;
 b=EKxwY2LKsyCwPKoXLcIh6VMRPaFf6uvZVRrdaSJ9+1BP4q2hkxSlIMuPpVOqoRSysM0KnlKwYkShYptv1BoAem/BeWY12NFB9GRCS5QE8+y4X61FZ+MY27CfEx7IVPOZ5YeVTdgwgPGax8qg/6QrPJgBNgTN2yrIJmdQ/BTbBkSrX34T9B0i0V9EY/QLwfyC8M6+twQ24vI2vibzOyrMJwxa2G31s1KaBZArfkpMxuX4mrAqSne4EiRWb7VFY9YEgC0/Jhh1GkCoITEaeMeFppGeeCicZ1Hb/bwHXEBxsNAoCfY99yMjQBWcjV1iXziZhaQA2W9ebLjc+hit0UY9SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I5AS6yzxokhK7UJOGfT9pMXzwgfAr9N0ZOfQbK/C4OY=;
 b=EDSB4KBzclqSHlZxZLBDlTGyCyBpQ5HLiW6oWLiSyNZ+5By+9z8EYl4E+BV5kqC/4rbExXIjUqkV8d1cKd9AQWDh4eBqZ0acMMTlMMnRxNHzlTUABZZKdCSKd+23y8LDK/gefroWvfnhDjNBz6tGmVYuQ3MTJkj9ibVnGHOei3Q=
Received: from MW4PR04CA0314.namprd04.prod.outlook.com (2603:10b6:303:82::19)
 by BY5PR12MB3843.namprd12.prod.outlook.com (2603:10b6:a03:1a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Fri, 18 Jun
 2021 08:19:13 +0000
Received: from CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::18) by MW4PR04CA0314.outlook.office365.com
 (2603:10b6:303:82::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Fri, 18 Jun 2021 08:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT061.mail.protection.outlook.com (10.13.175.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 08:19:13 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 03:19:09 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/3] amd_sfh: Extend ALS support for newer AMD platform
Date:   Fri, 18 Jun 2021 13:48:37 +0530
Message-ID: <20210618081838.4156571-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
References: <20210618081838.4156571-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed4e7b70-71d8-4fb4-2af9-08d93231c1bb
X-MS-TrafficTypeDiagnostic: BY5PR12MB3843:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3843294AF6EE8C1772CBC587E60D9@BY5PR12MB3843.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:179;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5nl3pLivnyzw/W4SaPiZ5LNj7ihIYjo8XmWU0tbR/EtJdgUgwheA9RMxAx19nnBRGv6tn48MorbT7WZ7OadI3W6n7SiunuUk9Rr7M1t95/VGgTqso4MpGS5xwZpXEnET2qIwPF4fKX62S0dBYP26z5v/EIwCIoHJ7vRzH0FqAuihJP9lV6cf5erDfqo2gP2Lo0KQ1Le1FWglrLMgLt75+7ltP8jUOX4qShK3Bbf13qWev7W5ZhuIDp0EHrF7XLGEOP0vJH66XnCa2pucB42IJwaclke26d//MiLssgUQLRnFgR5h4VI08NRLy7Md8zXpoRkIlhWsQgRBbezvLitOkX5pJ6E2ARhDWaorAwMPEHhs/je2in1oYLOsiGcbfn1/n/z9pV28pZ65z54Bbs4akBdffA0kSDDOpJ6gDEFxC12NiKEIexLavuS3pLkdGgtPugYq0M+vUNyAW7m/buGV+t13UwOlKeKsKsdGRXNi3Dc96SdedPKoVBnc2Y1cTzV9YZzsMwEtmrN7k+ldP1lDlce1S9ZCWG6CuqSFgfDtrIvnN0lT8UTivzmtDj7r991EGpW1dr9fpoXuRxIPX8JSd5SebSxGSJUAw0l+fG71hY4iD7wAVKcbnjbx2lujEMPaeLItJENcb4CCX2F5wgfwBXc6HdRDjz30u5ePJN9Ibn6s2BMjf4zT1Fh4kRbNo49C
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(46966006)(36840700001)(70586007)(47076005)(5660300002)(36756003)(110136005)(82740400003)(356005)(70206006)(2616005)(86362001)(478600001)(81166007)(54906003)(426003)(316002)(1076003)(2906002)(7696005)(30864003)(36860700001)(16526019)(186003)(26005)(4326008)(82310400003)(336012)(8936002)(6666004)(8676002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:19:13.3012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed4e7b70-71d8-4fb4-2af9-08d93231c1bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3843
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Extend ALS support for AMD next generation SoC's like Renoir, Cezanne.
AMD next generation platforms use C2P message register to read ALS
sensor data instead of DRAM address.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Nehal Shah <nehal-bakulchandra.shah@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c      | 39 +++++++++----------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.h         | 10 ++++-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  5 +++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  2 +
 .../hid_descriptor/amd_sfh_hid_desc.c         | 14 ++++++-
 .../hid_descriptor/amd_sfh_hid_desc.h         |  1 -
 6 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index d3d5dcec7cf1..efb849411d25 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -77,6 +77,7 @@ int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type)
 static void amd_sfh_work(struct work_struct *work)
 {
 	struct amdtp_cl_data *cli_data = container_of(work, struct amdtp_cl_data, work.work);
+	struct amd_input_data *in_data = cli_data->in_data;
 	struct request_list *req_node;
 	u8 current_index, sensor_index;
 	u8 report_id, node_type;
@@ -101,13 +102,11 @@ static void amd_sfh_work(struct work_struct *work)
 			pr_err("AMDSFH: Invalid report size\n");
 
 	} else if (node_type == HID_INPUT_REPORT) {
-		report_size = get_input_report(sensor_index, report_id,
-					       cli_data->input_report[current_index],
-					       cli_data->sensor_virt_addr[current_index]);
+		report_size = get_input_report(current_index, sensor_index, report_id, in_data);
 		if (report_size)
 			hid_input_report(cli_data->hid_sensor_hubs[current_index],
 					 cli_data->report_type[current_index],
-					 cli_data->input_report[current_index], report_size, 0);
+					 in_data->input_report[current_index], report_size, 0);
 		else
 			pr_err("AMDSFH: Invalid report size\n");
 	}
@@ -119,21 +118,22 @@ static void amd_sfh_work(struct work_struct *work)
 static void amd_sfh_work_buffer(struct work_struct *work)
 {
 	struct amdtp_cl_data *cli_data = container_of(work, struct amdtp_cl_data, work_buffer.work);
+	struct amd_input_data *in_data = cli_data->in_data;
 	u8 report_size;
 	int i;
 
 	for (i = 0; i < cli_data->num_hid_devices; i++) {
-		report_size = get_input_report(cli_data->sensor_idx[i], cli_data->report_id[i],
-					       cli_data->input_report[i],
-					       cli_data->sensor_virt_addr[i]);
+		report_size = get_input_report(i, cli_data->sensor_idx[i], cli_data->report_id[i],
+					       in_data);
 		hid_input_report(cli_data->hid_sensor_hubs[i], HID_INPUT_REPORT,
-				 cli_data->input_report[i], report_size, 0);
+				 in_data->input_report[i], report_size, 0);
 	}
 	schedule_delayed_work(&cli_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 }
 
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 {
+	struct amd_input_data *in_data = &privdata->in_data;
 	struct amdtp_cl_data *cl_data = privdata->cl_data;
 	struct amd_mp2_sensor_info info;
 	struct device *dev;
@@ -143,18 +143,16 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	int rc, i;
 
 	dev = &privdata->pdev->dev;
-	cl_data = devm_kzalloc(dev, sizeof(*cl_data), GFP_KERNEL);
-	if (!cl_data)
-		return -ENOMEM;
 
 	cl_data->num_hid_devices = amd_mp2_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
 
 	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
 	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
 	INIT_LIST_HEAD(&req_list.list);
+	cl_data->in_data = in_data;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		cl_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
+		in_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
 								  &cl_data->sensor_dma_addr[i],
 								  GFP_KERNEL);
 		cl_data->sensor_sts[i] = 0;
@@ -181,8 +179,8 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = -ENOMEM;
 			goto cleanup;
 		}
-		cl_data->input_report[i] = devm_kzalloc(dev, input_report_size, GFP_KERNEL);
-		if (!cl_data->input_report[i]) {
+		in_data->input_report[i] = devm_kzalloc(dev, input_report_size, GFP_KERNEL);
+		if (!in_data->input_report[i]) {
 			rc = -ENOMEM;
 			goto cleanup;
 		}
@@ -205,28 +203,27 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		privdata->mp2_ops->start(privdata, info);
 		cl_data->sensor_sts[i] = 1;
 	}
-	privdata->cl_data = cl_data;
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
 
 cleanup:
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (cl_data->sensor_virt_addr[i]) {
+		if (in_data->sensor_virt_addr[i]) {
 			dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
-					  cl_data->sensor_virt_addr[i],
+					  in_data->sensor_virt_addr[i],
 					  cl_data->sensor_dma_addr[i]);
 		}
 		devm_kfree(dev, cl_data->feature_report[i]);
-		devm_kfree(dev, cl_data->input_report[i]);
+		devm_kfree(dev, in_data->input_report[i]);
 		devm_kfree(dev, cl_data->report_descr[i]);
 	}
-	devm_kfree(dev, cl_data);
 	return rc;
 }
 
 int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 {
 	struct amdtp_cl_data *cl_data = privdata->cl_data;
+	struct amd_input_data *in_data = cl_data->in_data;
 	int i;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++)
@@ -237,9 +234,9 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	amdtp_hid_remove(cl_data);
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (cl_data->sensor_virt_addr[i]) {
+		if (in_data->sensor_virt_addr[i]) {
 			dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
-					  cl_data->sensor_virt_addr[i],
+					  in_data->sensor_virt_addr[i],
 					  cl_data->sensor_dma_addr[i]);
 		}
 	}
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
index d7eac1728e31..359c5de96af8 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_hid.h
@@ -14,6 +14,11 @@
 #define AMD_SFH_HID_VENDOR	0x1022
 #define AMD_SFH_HID_PRODUCT	0x0001
 
+struct amd_input_data {
+	u32 *sensor_virt_addr[MAX_HID_DEVICES];
+	u8 *input_report[MAX_HID_DEVICES];
+};
+
 struct amdtp_cl_data {
 	u8 init_done;
 	u32 cur_hid_dev;
@@ -26,7 +31,6 @@ struct amdtp_cl_data {
 	u8 *hid_descr[MAX_HID_DEVICES];
 	int hid_descr_size[MAX_HID_DEVICES];
 	phys_addr_t phys_addr_base;
-	u32 *sensor_virt_addr[MAX_HID_DEVICES];
 	dma_addr_t sensor_dma_addr[MAX_HID_DEVICES];
 	u32 sensor_sts[MAX_HID_DEVICES];
 	u32 sensor_requested_cnt[MAX_HID_DEVICES];
@@ -34,8 +38,8 @@ struct amdtp_cl_data {
 	u8 report_id[MAX_HID_DEVICES];
 	u8 sensor_idx[MAX_HID_DEVICES];
 	u8 *feature_report[MAX_HID_DEVICES];
-	u8 *input_report[MAX_HID_DEVICES];
 	u8 request_done[MAX_HID_DEVICES];
+	struct amd_input_data *in_data;
 	struct delayed_work work;
 	struct delayed_work work_buffer;
 };
@@ -64,4 +68,6 @@ void amdtp_hid_remove(struct amdtp_cl_data *cli_data);
 int amd_sfh_get_report(struct hid_device *hid, int report_id, int report_type);
 void amd_sfh_set_report(struct hid_device *hid, int report_id, int report_type);
 void amdtp_hid_wakeup(struct hid_device *hid);
+u8 get_input_report(u8 current_index, int sensor_idx, int report_id,
+		    struct amd_input_data *in_data);
 #endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 48ff54dc5d70..ff131f450bdc 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -230,6 +230,11 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		rc = pci_set_dma_mask(pdev, DMA_BIT_MASK(32));
 		return rc;
 	}
+
+	privdata->cl_data = devm_kzalloc(&pdev->dev, sizeof(struct amdtp_cl_data), GFP_KERNEL);
+	if (!privdata->cl_data)
+		return -ENOMEM;
+
 	rc = devm_add_action_or_reset(&pdev->dev, amd_mp2_pci_remove, privdata);
 	if (rc)
 		return rc;
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 6297d78c7aef..0886b2ad033e 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -10,6 +10,7 @@
 #define PCIE_MP2_AMD_H
 
 #include <linux/pci.h>
+#include "amd_sfh_hid.h"
 
 #define PCI_DEVICE_ID_AMD_MP2	0x15E4
 
@@ -75,6 +76,7 @@ struct amd_mp2_dev {
 	struct amdtp_cl_data *cl_data;
 	void __iomem *mmio;
 	const struct amd_mp2_ops *mp2_ops;
+	struct amd_input_data in_data;
 	/* mp2 active control status */
 	u32 mp2_acs;
 };
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
index 6e3ad66e57a4..cdc0a8d32249 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.c
@@ -12,6 +12,7 @@
 #include "amd_sfh_pcie.h"
 #include "amd_sfh_hid_desc.h"
 #include "amd_sfh_hid_report_desc.h"
+#include "amd_sfh_hid.h"
 
 #define	AMD_SFH_FW_MULTIPLIER (1000)
 #define HID_USAGE_SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM	0x41
@@ -174,8 +175,12 @@ static void get_common_inputs(struct common_input_property *common, int report_i
 	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
 }
 
-u8 get_input_report(int sensor_idx, int report_id, u8 *input_report, u32 *sensor_virt_addr)
+u8 get_input_report(u8 current_index, int sensor_idx, int report_id, struct amd_input_data *in_data)
 {
+	struct amd_mp2_dev *privdata = container_of(in_data, struct amd_mp2_dev, in_data);
+	u32 *sensor_virt_addr = in_data->sensor_virt_addr[current_index];
+	u8 *input_report = in_data->input_report[current_index];
+	u8 supported_input = privdata->mp2_acs & GENMASK(3, 0);
 	struct accel3_input_report acc_input;
 	struct gyro_input_report gyro_input;
 	struct magno_input_report magno_input;
@@ -213,7 +218,12 @@ u8 get_input_report(int sensor_idx, int report_id, u8 *input_report, u32 *sensor
 		break;
 	case als_idx: /* Als */
 		get_common_inputs(&als_input.common_property, report_id);
-		als_input.illuminance_value =  (int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
+		/* For ALS ,V2 Platforms uses C2P_MSG5 register instead of DRAM access method */
+		if (supported_input == V2_STATUS)
+			als_input.illuminance_value = (int)readl(privdata->mmio + AMD_C2P_MSG(5));
+		else
+			als_input.illuminance_value =
+				(int)sensor_virt_addr[0] / AMD_SFH_FW_MULTIPLIER;
 		report_size = sizeof(als_input);
 		memcpy(input_report, &als_input, sizeof(als_input));
 		break;
diff --git a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
index 095c471d8fd6..a23c1046627f 100644
--- a/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
+++ b/drivers/hid/amd-sfh-hid/hid_descriptor/amd_sfh_hid_desc.h
@@ -103,5 +103,4 @@ struct als_input_report {
 int get_report_descriptor(int sensor_idx, u8 rep_desc[]);
 u32 get_descr_sz(int sensor_idx, int descriptor_name);
 u8 get_feature_report(int sensor_idx, int report_id, u8 *feature_report);
-u8 get_input_report(int sensor_idx, int report_id, u8 *input_report, u32 *sensor_virt_addr);
 #endif
-- 
2.25.1

