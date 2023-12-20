Return-Path: <linux-input+bounces-898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A46B8198E9
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 08:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D42572886FA
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 07:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2421168B2;
	Wed, 20 Dec 2023 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BH3c/CQA"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2080.outbound.protection.outlook.com [40.107.93.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F5168B3
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOA02wHacGqb8seQlaO2FyWaLUwsWZhYlE9wMM6sjv8o/ZBaA6U2b6cPPI5iN9hnFyVG5+yqIb0JECM/zLTfWxU9rGSuTmy1zmEr36ziXT5OBPfibH0jWL+RXkPAe547IIyt0WignRRGvT5opSaHYC8UV2jbnUkkJ+KEB5vO02QhbQYADeLTJ3wZdol9lECX807WtSIpYhpnVpqV2jHT2A8lG36FMFMafGqAGSUjNyzTuwKtPb3O1e5MCtvfi6QTP06YDVxl5A5rWsaTn3PAVjk7Q6d2s9/EgWC+MBM4ucY8AgXTwLKF4nL1KUvFg1wMBndlir75Q9N5dpx9t8+DbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AOm92nCn/abwH1ffv4vVntBtcOq8/tmnVp/pzRIlO80=;
 b=Sdh8Bff3Wcrf/bQj3nleudYpXXVAi3U4dof1enMs9Gy7vACFBNERmWFOE3bo1/ZRxiLjm+KNITK7wTWZXs2SFxt9DftWCpRPu5p5g8qkmd9Ijv+UKLxLCxget9eUSooYHeQDZtCKseD8VLX2OjQ4G5OUm/dAA9aXsCxqBG+F939FfU64hOY1xrF+gpILEUP1GcwZErcP5ST0YCWW0fbYkoY2UCKpXHs+MLoE7wtRkZ5gnT/EiscxQijNb2kMtfl7DOwVC/9/ns0Im0+vD53wKpl6b+JzstL8Qx6xtiHa+f/NjurlNXD41s1d41W4H4HnywiW8FIBw0xu30MNWGVqRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AOm92nCn/abwH1ffv4vVntBtcOq8/tmnVp/pzRIlO80=;
 b=BH3c/CQAGXSI6EZos+XyVr4HeOGQjQHCt/V+DvPJlFAgfKVXhk3VhWXRkxn+pqWh9ZQpFP9q4+yuI26Z2wA41P0WzQyiJxshm90f+3JaUDK+OSTwJVk93QdsTsUxvM2aI9ACueSYFIZBDVxGfzGtylFq1yye5ivZE+WlbskiVy0=
Received: from DM6PR18CA0031.namprd18.prod.outlook.com (2603:10b6:5:15b::44)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 07:01:18 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:15b:cafe::7a) by DM6PR18CA0031.outlook.office365.com
 (2603:10b6:5:15b::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Wed, 20 Dec 2023 07:01:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 07:01:18 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 01:01:14 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>, <Shyam-sundar.S-k@amd.com>,
	<linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 2/3] HID: amd_sfh: Add a new interface for exporting HPD data
Date: Wed, 20 Dec 2023 12:30:41 +0530
Message-ID: <20231220070042.610455-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
References: <20231220070042.610455-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fd1cabe-82e1-4c36-369c-08dc0129772d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i1+qTNyJ7xnfAXDdNvz1osNzkzEhUv3+IIuHUXIfDkJUK2CFc+xR32PGW3NY8KDPxKcoqUUrDqafpyhzGl1pRenoYrQX4KmEF1VIH0wHcSrTVlDoVGDtzoto+oRabH58FxXmHpN9EFimfRtdAWmkf2F8mAnIB8+OxUMfUpIoxdhBhL6itFkDZhdqqwkoXfaAjVjYxE3wTxI5f/NBxtbTeaWz7prdS0CpkAM2m/pnJeZLf6OThXu4S3MV7Ueh69Z2IgaHrgmASoUNLLmZkW4nLefeijqpNoV7vvidoUGCohgc55uDIAjlqxGsWqpHrPmJs1sLXfei797goO0VlwNeiHF7P119wZXc/ZwGavfhOGlFZuham6ttBWQTwu7UBk0M80/jPoTcz6I78/sqorqtXQsZum7Bizq6AAuMZtcZHg4XbLa37JuQvmbjEcXJTnbxHBmUVgXAoXct+1M2KgFz0d0L4JP0cwB6FwPmWfPcJ/IRef1e0c1sM08hqIQy5R5XrReh0je0nws096PfEZZSP5sTNbxwS2EYMTVc0nksxb5Uh7B2Xu5alWqq5NWegJs3uy2C5Kh0ZvYIqnDjrTW/+fP9sObBO7U4l6x8WtfGmJmY9K3BmGWlKllQmm1a9lft5lj6caRQsN0R5SxzT2diBx+leOd5KhLzQBzN86hG0UuXNbhsPIohgrN7h3ZeopzUcItDE7UD2qBA9bgfzeCho12rRJFaLKjJ2TD7X7rgVromtiCY3q1kJKY0B/pKlTDjqUSf6ZrmpyNXaY9nn6aKIg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(376002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(82310400011)(186009)(46966006)(36840700001)(40470700004)(36860700001)(2906002)(47076005)(41300700001)(86362001)(81166007)(36756003)(356005)(82740400003)(6666004)(316002)(478600001)(110136005)(7696005)(8936002)(8676002)(70586007)(70206006)(966005)(336012)(426003)(16526019)(1076003)(5660300002)(26005)(4326008)(83380400001)(2616005)(40480700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 07:01:18.3569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd1cabe-82e1-4c36-369c-08dc0129772d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663

AMDSFH has information about the User presence information via the Human
Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.

Add a new interface to export this information, where other drivers like
PMF can use this information to enhance user experiences.

Link: https://lore.kernel.org/all/ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com/
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 14 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 37 +++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
 include/linux/amd-pmf-io.h                    | 46 +++++++++++++++++++
 5 files changed, 103 insertions(+)
 create mode 100644 include/linux/amd-pmf-io.h

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 2643bb14fee2..cd57037bf217 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -37,6 +37,10 @@ struct amd_mp2_sensor_info {
 	dma_addr_t dma_address;
 };
 
+struct sfh_dev_status {
+	bool is_hpd_present;
+};
+
 struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
@@ -47,6 +51,7 @@ struct amd_mp2_dev {
 	struct amd_input_data in_data;
 	/* mp2 active control status */
 	u32 mp2_acs;
+	struct sfh_dev_status dev_en;
 };
 
 struct amd_mp2_ops {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index e9c6413af24a..0351b0fd394a 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -73,6 +73,12 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	int i, status;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		switch (cl_data->sensor_idx[i]) {
+		case HPD_IDX:
+			privdata->dev_en.is_hpd_present = false;
+			break;
+		}
+
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
 			status = amd_sfh_wait_for_response
@@ -178,6 +184,11 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
+			switch (cl_data->sensor_idx[i]) {
+			case HPD_IDX:
+				privdata->dev_en.is_hpd_present = true;
+				break;
+			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
 			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
@@ -259,6 +270,7 @@ static void amd_mp2_pci_remove(void *privdata)
 {
 	struct amd_mp2_dev *mp2 = privdata;
 
+	sfh_deinit_emp2();
 	amd_sfh_hid_client_deinit(privdata);
 	mp2->mp2_ops->stop_all(mp2);
 	pci_intx(mp2->pdev, false);
@@ -311,12 +323,14 @@ int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 
 	rc = amd_sfh_irq_init(mp2);
 	if (rc) {
+		sfh_deinit_emp2();
 		dev_err(dev, "amd_sfh_irq_init failed\n");
 		return rc;
 	}
 
 	rc = amd_sfh1_1_hid_client_init(mp2);
 	if (rc) {
+		sfh_deinit_emp2();
 		dev_err(dev, "amd_sfh1_1_hid_client_init failed\n");
 		return rc;
 	}
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4f81ef2d4f56..197b828fc6a0 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -7,11 +7,14 @@
  *
  * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
  */
+#include <linux/amd-pmf-io.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include <linux/iopoll.h>
 
 #include "amd_sfh_interface.h"
 
+static struct amd_mp2_dev *emp2;
+
 static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
 {
 	struct sfh_cmd_response cmd_resp;
@@ -73,7 +76,41 @@ static struct amd_mp2_ops amd_sfh_ops = {
 	.response = amd_sfh_wait_response,
 };
 
+void sfh_deinit_emp2(void)
+{
+	emp2 = NULL;
+}
+
 void sfh_interface_init(struct amd_mp2_dev *mp2)
 {
 	mp2->mp2_ops = &amd_sfh_ops;
+	emp2 = mp2;
+}
+
+static int amd_sfh_hpd_info(u8 *user_present)
+{
+	struct hpd_status hpdstatus;
+
+	if (!user_present)
+		return -EINVAL;
+
+	if (!emp2 || !emp2->dev_en.is_hpd_present)
+		return -ENODEV;
+
+	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
+	*user_present = hpdstatus.shpd.presence;
+
+	return 0;
+}
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
+{
+	if (sfh_info) {
+		switch (op) {
+		case MT_HPD:
+			return amd_sfh_hpd_info(&sfh_info->user_present);
+		}
+	}
+	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(amd_get_sfh_info);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 75267b0fec70..2c211d28764d 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -165,6 +165,7 @@ struct hpd_status {
 };
 
 void sfh_interface_init(struct amd_mp2_dev *mp2);
+void sfh_deinit_emp2(void);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
 int amd_sfh_float_to_int(u32 flt32_val);
 #endif
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
new file mode 100644
index 000000000000..5b6d29d36922
--- /dev/null
+++ b/include/linux/amd-pmf-io.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * AMD Platform Management Framework Interface
+ *
+ * Copyright (c) 2023, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
+ *          Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#ifndef AMD_PMF_IO_H
+#define AMD_PMF_IO_H
+
+#include <linux/types.h>
+
+/**
+ * enum sfh_message_type - Query the SFH message type
+ * @MT_HPD: Message ID to know the Human presence info from MP2 FW
+ */
+enum sfh_message_type {
+	MT_HPD,
+};
+
+/**
+ * enum sfh_hpd_info - Query the Human presence information
+ * @SFH_NOT_DETECTED: Check the HPD connection information from MP2 FW
+ * @SFH_USER_PRESENT: Check if the user is present from HPD sensor
+ * @SFH_USER_AWAY: Check if the user is away from HPD sensor
+ */
+enum sfh_hpd_info {
+	SFH_NOT_DETECTED,
+	SFH_USER_PRESENT,
+	SFH_USER_AWAY,
+};
+
+/**
+ * struct amd_sfh_info - get HPD sensor info from MP2 FW
+ * @user_present: Populates the user presence information
+ */
+struct amd_sfh_info {
+	u8 user_present;
+};
+
+int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
+#endif
-- 
2.25.1


