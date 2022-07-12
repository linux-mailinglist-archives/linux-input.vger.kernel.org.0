Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E0572263
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbiGLSTp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbiGLSTl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:41 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDBCFC3ACE
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fpcqpyvJZUo8GDQouyumQpnx7En1s3RDsVhGhKWBw3AY912U7vowAU2Ppi8Y8ppvf7t6DYKmbFnTlIciNPelbUXbJHAr+K2ZsImi7eZRyU1BHNAB1C9/8OMDqa3YiVuKA+yQl9NU6FaXwL+ixH/oqT1rMXHd++cKRkTjAxhEmRB98S6EoR3Y+MQtmxMJFKkFLUBtiHiKUG1h+/7kMgjZNSFN6EeVTaW+dHUKaMnCJuK/sUdz7b/IaAoKuy6uKvruM3hHYT8bnPEp0Xdo5UmXMjf50QmZf/h5d7g8ix3b0qIiXF3r+IZSfM7ikxMagi1vZQIe/BZnqZlnBjedrLHCsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE9xo+5kNV9B87Io+PM211r3e4yXa1rkja3nBbF99mk=;
 b=H2D4mFKCCpOq4SQXWZ2h4EdES67QPIczyzOF5FQXYZAzSK/h7kFPMLgt7st4k5XYwTdmUPCwj7g1VKIjg+KwY8kodis9kpWk3czqM0cIag+zwdv4d7tpz3O48aoG9mTx8yOTK5qOzbTghUeCYFeJBOkFmG87FPjSkTEZvEiSJMtdYi9RppfN7rt56yg3+qghnE6EtMBECcjfFtp7+JwJVDXpvy68/3qcoACTNBj+9g09Mi4dwLkXjtXncI5CfdweyAjXb1wLhZRZ5kAT6qynHp1kyhZs1laZnaF3O6Q90ojMiiuILwi0nwX7cTe0wWTM8uvN/S5VVkjQGT2+Vb7DTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE9xo+5kNV9B87Io+PM211r3e4yXa1rkja3nBbF99mk=;
 b=G4b151jegMRPC4kKyiESQnM+kgUgdQgT4crY6OUST3aKoJrLDIeorHBSWDzmdATXGS3aQ+7cvCZ6jPfPuaBrrPHmgexQPK5eUvjx1eXLfm9pvUNdiHfFhPpmc8XtA4lz6r90dQCj2iA3zedbTX3aYrE2+IgccUIKB1N7EDqHc6Y=
Received: from DM6PR03CA0045.namprd03.prod.outlook.com (2603:10b6:5:100::22)
 by MW3PR12MB4410.namprd12.prod.outlook.com (2603:10b6:303:5b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.21; Tue, 12 Jul
 2022 18:19:31 +0000
Received: from DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::7b) by DM6PR03CA0045.outlook.office365.com
 (2603:10b6:5:100::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT024.mail.protection.outlook.com (10.13.172.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5438.12 via Frontend Transport; Tue, 12 Jul 2022 18:19:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:28 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 11/11] HID: amd_sfh: Implement SFH1.1 functionality
Date:   Tue, 12 Jul 2022 23:48:36 +0530
Message-ID: <20220712181836.3488343-12-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 3d299e9e-701a-4ee0-41a0-08da6433104e
X-MS-TrafficTypeDiagnostic: MW3PR12MB4410:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C8Fsj0/NyKedOBRC5dc6m6JHt9nRqnfIVC0IAHxVq2CofLiqWdhFyx8DnB5tVCcDgIxL//bXkC+jBOg36rduBP5wTitX0KhrS231JjUkKPQLSXxDboCYo2EBd2jnfESjgi0YgXUrr0VxoAvxGQo2ZofepzPx7gbhCxK/kL1R+VC5AHkHjEnH/4LONw8Gqsh1XautEI9YsBB83rb8f8ozZgWO34LADdDpZDEtlmdxJeF4M6hE95fZe79SWSlCFxzhdvdur6wX52sfxRq2bmqC1qXHAz4cxtwUCQK66JbP6mi7yz4T6uUJ5xqQ9GVjV2NDZjl9X5X8Sm4FwFJ+OKdMxz1S4ijFngu7YIX+vZIr0cbzTO9zYeFwTA6JRp32e1sRCEKBkt4Gp6j7jOo9AICq0K3i7kOZUYESilTol3h2GusaYvFNut1Km2Yev7wCXt6GfDRBzgk9IB8ojxIDMvHy0KfyWlLebWJJczVipl0SsLfncwnueDOvJsIbdzIZ1ys+qYkXNKky0vE+lrPNOEAMatdQtrhaovuEGu+pZMXZNC8+Q7HRZS6g9n4xFhYITlZKKqrj3Ux/xjzYAWEtl+mdO0trelhywohW16r11JQu3V126aC6B8jvwtNvjg8IMHj6wiSudkAxLq0OXeZVVKmHkzQeX5HyFCqhrNpKmrSQ9z2R9pSpt/eJCcFBrBrcsWqTD5wTKPMaQ8ssm0Smge0KUHWT+xE/Yh9ugKR2d38C33zW/BnQipLTBmahJKn4W/WDNO2+4x3vVWPiZSsBdMzCjdDclr9YG6vW70oMKcV3OmYTKD6Hdrren5z5+ngIOlgeHaS8SFbI71jdUcZVKlBHtXBpSLb5Gqyy6VCmK8jykuY=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(39860400002)(396003)(376002)(46966006)(36840700001)(40470700004)(47076005)(426003)(40480700001)(81166007)(336012)(83380400001)(8676002)(16526019)(36756003)(82740400003)(4326008)(70206006)(186003)(36860700001)(70586007)(316002)(356005)(110136005)(40460700003)(6666004)(82310400005)(7696005)(86362001)(1076003)(41300700001)(2906002)(478600001)(26005)(8936002)(5660300002)(2616005)(30864003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:30.5082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d299e9e-701a-4ee0-41a0-08da6433104e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4410
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Newer AMD SOCs use SFH1.1 memory access with new PCI-id. Hence add new
sfh1_1 sub directory to implement SFH1.1 functionality by defining new
PCI id, interface functions, descriptor functions and handlers which
invokes sfh1.1.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/Makefile              |   3 +
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |   3 +
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  12 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c | 300 ++++++++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 324 ++++++++++++++++++
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h |  26 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  73 ++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 154 +++++++++
 8 files changed, 895 insertions(+)
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
 create mode 100644 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h

diff --git a/drivers/hid/amd-sfh-hid/Makefile b/drivers/hid/amd-sfh-hid/Makefile
index 35e704da5612..0222170ab7ad 100644
--- a/drivers/hid/amd-sfh-hid/Makefile
+++ b/drivers/hid/amd-sfh-hid/Makefile
@@ -9,5 +9,8 @@ amd_sfh-objs := amd_sfh_hid.o
 amd_sfh-objs += amd_sfh_client.o
 amd_sfh-objs += amd_sfh_pcie.o
 amd_sfh-objs += hid_descriptor/amd_sfh_hid_desc.o
+amd_sfh-objs += sfh1_1/amd_sfh_init.o
+amd_sfh-objs += sfh1_1/amd_sfh_interface.o
+amd_sfh-objs += sfh1_1/amd_sfh_desc.o
 
 ccflags-y += -I $(srctree)/$(src)/
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index 1efb72ec116f..2643bb14fee2 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -14,6 +14,7 @@
 #include "amd_sfh_hid.h"
 
 #define PCI_DEVICE_ID_AMD_MP2		0x15E4
+#define PCI_DEVICE_ID_AMD_MP2_1_1	0x164A
 
 #define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
 #define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
@@ -40,6 +41,8 @@ struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
 	void __iomem *mmio;
+	void __iomem *vsbase;
+	const struct amd_sfh1_1_ops *sfh1_1_ops;
 	struct amd_mp2_ops *mp2_ops;
 	struct amd_input_data in_data;
 	/* mp2 active control status */
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 1425b57f3580..c9fb844e3360 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 
 #include "amd_sfh_pcie.h"
+#include "sfh1_1/amd_sfh_init.h"
 
 #define DRIVER_NAME	"pcie_mp2_amd"
 #define DRIVER_DESC	"AMD(R) PCIe MP2 Communication Driver"
@@ -318,6 +319,14 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (!privdata->cl_data)
 		return -ENOMEM;
 
+	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
+	if (privdata->sfh1_1_ops) {
+		rc = privdata->sfh1_1_ops->init(privdata);
+		if (rc)
+			return rc;
+		goto init_done;
+	}
+
 	mp2_select_ops(privdata);
 
 	rc = amd_sfh_irq_init(privdata);
@@ -333,6 +342,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 		return rc;
 	}
 
+init_done:
 	amd_sfh_clear_intr(privdata);
 
 	return devm_add_action_or_reset(&pdev->dev, privdata->mp2_ops->remove, privdata);
@@ -361,6 +371,8 @@ static SIMPLE_DEV_PM_OPS(amd_mp2_pm_ops, amd_mp2_pci_suspend,
 
 static const struct pci_device_id amd_mp2_pci_tbl[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2_1_1),
+	  .driver_data = (kernel_ulong_t)&sfh1_1_ops },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, amd_mp2_pci_tbl);
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
new file mode 100644
index 000000000000..0609fea581c9
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -0,0 +1,300 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD MP2 1.1 descriptor interfaces
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#include <linux/hid-sensor-ids.h>
+
+#include "amd_sfh_interface.h"
+#include "../hid_descriptor/amd_sfh_hid_desc.h"
+#include "../hid_descriptor/amd_sfh_hid_report_desc.h"
+
+#define SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM			0x41
+#define SENSOR_PROP_POWER_STATE_D0_FULL_POWER_ENUM			0x51
+#define HID_DEFAULT_REPORT_INTERVAL					0x50
+#define HID_DEFAULT_MIN_VALUE						0X7F
+#define HID_DEFAULT_MAX_VALUE						0x80
+#define HID_DEFAULT_SENSITIVITY						0x7F
+#define HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_ENUM	0x01
+/* state enums */
+#define HID_USAGE_SENSOR_STATE_READY_ENUM				0x02
+#define HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM			0x05
+#define HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM			0x04
+
+static int get_report_desc(int sensor_idx, u8 *rep_desc)
+{
+	switch (sensor_idx) {
+	case ACCEL_IDX: /* accelerometer */
+		memset(rep_desc, 0, sizeof(accel3_report_descriptor));
+		memcpy(rep_desc, accel3_report_descriptor,
+		       sizeof(accel3_report_descriptor));
+		break;
+	case GYRO_IDX: /* gyroscope */
+		memset(rep_desc, 0, sizeof(gyro3_report_descriptor));
+		memcpy(rep_desc, gyro3_report_descriptor,
+		       sizeof(gyro3_report_descriptor));
+		break;
+	case MAG_IDX: /* magnetometer */
+		memset(rep_desc, 0, sizeof(comp3_report_descriptor));
+		memcpy(rep_desc, comp3_report_descriptor,
+		       sizeof(comp3_report_descriptor));
+		break;
+	case ALS_IDX: /* ambient light sensor */
+		memset(rep_desc, 0, sizeof(als_report_descriptor));
+		memcpy(rep_desc, als_report_descriptor,
+		       sizeof(als_report_descriptor));
+		break;
+	case HPD_IDX: /* HPD sensor */
+		memset(rep_desc, 0, sizeof(hpd_report_descriptor));
+		memcpy(rep_desc, hpd_report_descriptor,
+		       sizeof(hpd_report_descriptor));
+		break;
+	}
+	return 0;
+}
+
+static void get_common_features(struct common_feature_property *common, int report_id)
+{
+	common->report_id = report_id;
+	common->connection_type = HID_USAGE_SENSOR_PROPERTY_CONNECTION_TYPE_PC_INTEGRATED_ENUM;
+	common->report_state = SENSOR_PROP_REPORTING_STATE_ALL_EVENTS_ENUM;
+	common->power_state = SENSOR_PROP_POWER_STATE_D0_FULL_POWER_ENUM;
+	common->sensor_state = HID_USAGE_SENSOR_STATE_INITIALIZING_ENUM;
+	common->report_interval =  HID_DEFAULT_REPORT_INTERVAL;
+}
+
+static u8 get_feature_rep(int sensor_idx, int report_id, u8 *feature_report)
+{
+	struct magno_feature_report magno_feature;
+	struct accel3_feature_report acc_feature;
+	struct gyro_feature_report gyro_feature;
+	struct hpd_feature_report hpd_feature;
+	struct als_feature_report als_feature;
+	u8 report_size = 0;
+
+	if (!feature_report)
+		return report_size;
+
+	switch (sensor_idx) {
+	case ACCEL_IDX: /* accelerometer */
+		get_common_features(&acc_feature.common_property, report_id);
+		acc_feature.accel_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
+		acc_feature.accel_sensitivity_min = HID_DEFAULT_MIN_VALUE;
+		acc_feature.accel_sensitivity_max = HID_DEFAULT_MAX_VALUE;
+		memcpy(feature_report, &acc_feature, sizeof(acc_feature));
+		report_size = sizeof(acc_feature);
+		break;
+	case GYRO_IDX: /* gyroscope */
+		get_common_features(&gyro_feature.common_property, report_id);
+		gyro_feature.gyro_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
+		gyro_feature.gyro_sensitivity_min = HID_DEFAULT_MIN_VALUE;
+		gyro_feature.gyro_sensitivity_max = HID_DEFAULT_MAX_VALUE;
+		memcpy(feature_report, &gyro_feature, sizeof(gyro_feature));
+		report_size = sizeof(gyro_feature);
+		break;
+	case MAG_IDX: /* magnetometer */
+		get_common_features(&magno_feature.common_property, report_id);
+		magno_feature.magno_headingchange_sensitivity = HID_DEFAULT_SENSITIVITY;
+		magno_feature.heading_min = HID_DEFAULT_MIN_VALUE;
+		magno_feature.heading_max = HID_DEFAULT_MAX_VALUE;
+		magno_feature.flux_change_sensitivity = HID_DEFAULT_MIN_VALUE;
+		magno_feature.flux_min = HID_DEFAULT_MIN_VALUE;
+		magno_feature.flux_max = HID_DEFAULT_MAX_VALUE;
+		memcpy(feature_report, &magno_feature, sizeof(magno_feature));
+		report_size = sizeof(magno_feature);
+		break;
+	case ALS_IDX:  /* ambient light sensor */
+		get_common_features(&als_feature.common_property, report_id);
+		als_feature.als_change_sesnitivity = HID_DEFAULT_SENSITIVITY;
+		als_feature.als_sensitivity_min = HID_DEFAULT_MIN_VALUE;
+		als_feature.als_sensitivity_max = HID_DEFAULT_MAX_VALUE;
+		memcpy(feature_report, &als_feature, sizeof(als_feature));
+		report_size = sizeof(als_feature);
+		break;
+	case HPD_IDX:  /* human presence detection sensor */
+		get_common_features(&hpd_feature.common_property, report_id);
+		memcpy(feature_report, &hpd_feature, sizeof(hpd_feature));
+		report_size = sizeof(hpd_feature);
+		break;
+	}
+	return report_size;
+}
+
+static void get_common_inputs(struct common_input_property *common, int report_id)
+{
+	common->report_id = report_id;
+	common->sensor_state = HID_USAGE_SENSOR_STATE_READY_ENUM;
+	common->event_type = HID_USAGE_SENSOR_EVENT_DATA_UPDATED_ENUM;
+}
+
+static int float_to_int(u32 float32)
+{
+	int fraction, shift, mantissa, sign, exp, zeropre;
+
+	mantissa = float32 & GENMASK(22, 0);
+	sign = (float32 & BIT(31)) ? -1 : 1;
+	exp = (float32 & ~BIT(31)) >> 23;
+
+	if (!exp && !mantissa)
+		return 0;
+
+	exp -= 127;
+	if (exp < 0) {
+		exp = -exp;
+		zeropre = (((BIT(23) + mantissa) * 100) >> 23) >> exp;
+		return zeropre >= 50 ? sign : 0;
+	}
+
+	shift = 23 - exp;
+	float32 = BIT(exp) + (mantissa >> shift);
+	fraction = mantissa & GENMASK(shift - 1, 0);
+
+	return (((fraction * 100) >> shift) >= 50) ? sign * (float32 + 1) : sign * float32;
+}
+
+static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
+			struct amd_input_data *in_data)
+{
+	struct amd_mp2_dev *mp2 = container_of(in_data, struct amd_mp2_dev, in_data);
+	u8 *input_report = in_data->input_report[current_index];
+	struct magno_input_report magno_input;
+	struct accel3_input_report acc_input;
+	struct gyro_input_report gyro_input;
+	struct als_input_report als_input;
+	struct hpd_input_report hpd_input;
+	struct sfh_accel_data accel_data;
+	struct sfh_gyro_data gyro_data;
+	struct sfh_mag_data mag_data;
+	struct sfh_als_data als_data;
+	struct hpd_status hpdstatus;
+	void __iomem *sensoraddr;
+	u8 report_size = 0;
+
+	if (!input_report)
+		return report_size;
+
+	switch (sensor_idx) {
+	case ACCEL_IDX: /* accelerometer */
+		sensoraddr = mp2->vsbase + (ACCEL_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+			     OFFSET_SENSOR_DATA_DEFAULT;
+		memcpy_fromio(&accel_data, sensoraddr, sizeof(struct sfh_accel_data));
+		get_common_inputs(&acc_input.common_property, report_id);
+		acc_input.in_accel_x_value = float_to_int(accel_data.acceldata.x) / 100;
+		acc_input.in_accel_y_value = float_to_int(accel_data.acceldata.y) / 100;
+		acc_input.in_accel_z_value = float_to_int(accel_data.acceldata.z) / 100;
+		memcpy(input_report, &acc_input, sizeof(acc_input));
+		report_size = sizeof(acc_input);
+		break;
+	case GYRO_IDX: /* gyroscope */
+		sensoraddr = mp2->vsbase + (GYRO_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+			     OFFSET_SENSOR_DATA_DEFAULT;
+		memcpy_fromio(&gyro_data, sensoraddr, sizeof(struct sfh_gyro_data));
+		get_common_inputs(&gyro_input.common_property, report_id);
+		gyro_input.in_angel_x_value = float_to_int(gyro_data.gyrodata.x) / 1000;
+		gyro_input.in_angel_y_value = float_to_int(gyro_data.gyrodata.y) / 1000;
+		gyro_input.in_angel_z_value = float_to_int(gyro_data.gyrodata.z) / 1000;
+		memcpy(input_report, &gyro_input, sizeof(gyro_input));
+		report_size = sizeof(gyro_input);
+		break;
+	case MAG_IDX: /* magnetometer */
+		sensoraddr = mp2->vsbase + (MAG_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+			     OFFSET_SENSOR_DATA_DEFAULT;
+		memcpy_fromio(&mag_data, sensoraddr, sizeof(struct sfh_mag_data));
+		get_common_inputs(&magno_input.common_property, report_id);
+		magno_input.in_magno_x = float_to_int(mag_data.magdata.x) / 100;
+		magno_input.in_magno_y = float_to_int(mag_data.magdata.y) / 100;
+		magno_input.in_magno_z = float_to_int(mag_data.magdata.z) / 100;
+		magno_input.in_magno_accuracy = mag_data.accuracy / 100;
+		memcpy(input_report, &magno_input, sizeof(magno_input));
+		report_size = sizeof(magno_input);
+		break;
+	case ALS_IDX:
+		sensoraddr = mp2->vsbase + (ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+			     OFFSET_SENSOR_DATA_DEFAULT;
+		memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
+		get_common_inputs(&als_input.common_property, report_id);
+		als_input.illuminance_value = als_data.lux;
+		report_size = sizeof(als_input);
+		memcpy(input_report, &als_input, sizeof(als_input));
+		break;
+	case HPD_IDX:
+		get_common_inputs(&hpd_input.common_property, report_id);
+		hpdstatus.val = readl(mp2->mmio + AMD_C2P_MSG(4));
+		hpd_input.human_presence = hpdstatus.shpd.presence;
+		report_size = sizeof(hpd_input);
+		memcpy(input_report, &hpd_input, sizeof(hpd_input));
+		break;
+	}
+	return report_size;
+}
+
+static u32 get_desc_size(int sensor_idx, int descriptor_name)
+{
+	switch (sensor_idx) {
+	case ACCEL_IDX:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(accel3_report_descriptor);
+		case input_size:
+			return sizeof(struct accel3_input_report);
+		case feature_size:
+			return sizeof(struct accel3_feature_report);
+		}
+		break;
+	case GYRO_IDX:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(gyro3_report_descriptor);
+		case input_size:
+			return sizeof(struct gyro_input_report);
+		case feature_size:
+			return sizeof(struct gyro_feature_report);
+		}
+		break;
+	case MAG_IDX:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(comp3_report_descriptor);
+		case input_size:
+			return sizeof(struct magno_input_report);
+		case feature_size:
+			return sizeof(struct magno_feature_report);
+		}
+		break;
+	case ALS_IDX:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(als_report_descriptor);
+		case input_size:
+			return sizeof(struct als_input_report);
+		case feature_size:
+			return sizeof(struct als_feature_report);
+		}
+		break;
+	case HPD_IDX:
+		switch (descriptor_name) {
+		case descr_size:
+			return sizeof(hpd_report_descriptor);
+		case input_size:
+			return sizeof(struct hpd_input_report);
+		case feature_size:
+			return sizeof(struct hpd_feature_report);
+		}
+		break;
+	}
+
+	return 0;
+}
+
+void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops)
+{
+	mp2_ops->get_rep_desc = get_report_desc;
+	mp2_ops->get_feat_rep = get_feature_rep;
+	mp2_ops->get_desc_sz = get_desc_size;
+	mp2_ops->get_in_rep = get_input_rep;
+}
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
new file mode 100644
index 000000000000..70436f9fad2f
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD MP2 1.1 communication driver
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/hid.h>
+
+#include "amd_sfh_init.h"
+#include "amd_sfh_interface.h"
+#include "../hid_descriptor/amd_sfh_hid_desc.h"
+
+static int amd_sfh_get_sensor_num(struct amd_mp2_dev *mp2, u8 *sensor_id)
+{
+	struct sfh_sensor_list *slist;
+	struct sfh_base_info binfo;
+	int num_of_sensors = 0;
+	int i;
+
+	memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
+	slist = &binfo.sbase.s_list;
+
+	for (i = 0; i < MAX_IDX; i++) {
+		switch (i) {
+		case ACCEL_IDX:
+		case GYRO_IDX:
+		case MAG_IDX:
+		case ALS_IDX:
+		case HPD_IDX:
+			if (BIT(i) & slist->sl.sensors)
+				sensor_id[num_of_sensors++] = i;
+			break;
+		}
+	}
+
+	return num_of_sensors;
+}
+
+static u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
+{
+	if (mp2->mp2_ops->response)
+		return mp2->mp2_ops->response(mp2, sid, cmd_id);
+
+	return 0;
+}
+
+static const char *get_sensor_name(int idx)
+{
+	switch (idx) {
+	case ACCEL_IDX:
+		return "accelerometer";
+	case GYRO_IDX:
+		return "gyroscope";
+	case MAG_IDX:
+		return "magnetometer";
+	case ALS_IDX:
+		return "ALS";
+	case HPD_IDX:
+		return "HPD";
+	default:
+		return "unknown sensor type";
+	}
+}
+
+static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
+{
+	struct amdtp_cl_data *cl_data = privdata->cl_data;
+	int i, status;
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
+			privdata->mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+			status = amd_sfh_wait_for_response
+					(privdata, cl_data->sensor_idx[i], DISABLE_SENSOR);
+			if (status == 0)
+				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+			dev_dbg(&privdata->pdev->dev, "stopping sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+		}
+	}
+
+	cancel_delayed_work_sync(&cl_data->work);
+	cancel_delayed_work_sync(&cl_data->work_buffer);
+	amdtp_hid_remove(cl_data);
+
+	return 0;
+}
+
+static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
+{
+	struct amd_input_data *in_data = &privdata->in_data;
+	struct amdtp_cl_data *cl_data = privdata->cl_data;
+	struct amd_mp2_ops *mp2_ops = privdata->mp2_ops;
+	struct amd_mp2_sensor_info info;
+	struct request_list *req_list;
+	u32 feature_report_size;
+	u32 input_report_size;
+	struct device *dev;
+	int rc, i, status;
+	u8 cl_idx;
+
+	req_list = &cl_data->req_list;
+	dev = &privdata->pdev->dev;
+	amd_sfh1_1_set_desc_ops(mp2_ops);
+
+	cl_data->num_hid_devices = amd_sfh_get_sensor_num(privdata, &cl_data->sensor_idx[0]);
+
+	INIT_DELAYED_WORK(&cl_data->work, amd_sfh_work);
+	INIT_DELAYED_WORK(&cl_data->work_buffer, amd_sfh_work_buffer);
+	INIT_LIST_HEAD(&req_list->list);
+	cl_data->in_data = in_data;
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		cl_data->sensor_sts[i] = SENSOR_DISABLED;
+		cl_data->sensor_requested_cnt[i] = 0;
+		cl_data->cur_hid_dev = i;
+		cl_idx = cl_data->sensor_idx[i];
+
+		cl_data->report_descr_sz[i] = mp2_ops->get_desc_sz(cl_idx, descr_size);
+		if (!cl_data->report_descr_sz[i]) {
+			rc = -EINVAL;
+			goto cleanup;
+		}
+		feature_report_size = mp2_ops->get_desc_sz(cl_idx, feature_size);
+		if (!feature_report_size) {
+			rc = -EINVAL;
+			goto cleanup;
+		}
+		input_report_size =  mp2_ops->get_desc_sz(cl_idx, input_size);
+		if (!input_report_size) {
+			rc = -EINVAL;
+			goto cleanup;
+		}
+		cl_data->feature_report[i] = devm_kzalloc(dev, feature_report_size, GFP_KERNEL);
+		if (!cl_data->feature_report[i]) {
+			rc = -ENOMEM;
+			goto cleanup;
+		}
+		in_data->input_report[i] = devm_kzalloc(dev, input_report_size, GFP_KERNEL);
+		if (!in_data->input_report[i]) {
+			rc = -ENOMEM;
+			goto cleanup;
+		}
+
+		info.sensor_idx = cl_idx;
+
+		cl_data->report_descr[i] =
+			devm_kzalloc(dev, cl_data->report_descr_sz[i], GFP_KERNEL);
+		if (!cl_data->report_descr[i]) {
+			rc = -ENOMEM;
+			goto cleanup;
+		}
+		rc = mp2_ops->get_rep_desc(cl_idx, cl_data->report_descr[i]);
+		if (rc)
+			return rc;
+
+		writel(0, privdata->mmio + AMD_P2C_MSG(0));
+		mp2_ops->start(privdata, info);
+		status = amd_sfh_wait_for_response
+				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
+
+		status = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
+
+		if (status == SENSOR_ENABLED) {
+			cl_data->sensor_sts[i] = SENSOR_ENABLED;
+			rc = amdtp_hid_probe(i, cl_data);
+			if (rc) {
+				mp2_ops->stop(privdata, cl_data->sensor_idx[i]);
+				status = amd_sfh_wait_for_response
+					(privdata, cl_data->sensor_idx[i], DISABLE_SENSOR);
+				if (status == 0)
+					status = SENSOR_DISABLED;
+				if (status != SENSOR_ENABLED)
+					cl_data->sensor_sts[i] = SENSOR_DISABLED;
+				dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
+					cl_data->sensor_idx[i],
+					get_sensor_name(cl_data->sensor_idx[i]),
+					cl_data->sensor_sts[i]);
+				goto cleanup;
+			}
+		}
+		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
+			cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+			cl_data->sensor_sts[i]);
+	}
+
+	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
+	return 0;
+
+cleanup:
+	amd_sfh_hid_client_deinit(privdata);
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		devm_kfree(dev, cl_data->feature_report[i]);
+		devm_kfree(dev, in_data->input_report[i]);
+		devm_kfree(dev, cl_data->report_descr[i]);
+	}
+	return rc;
+}
+
+static void amd_sfh_resume(struct amd_mp2_dev *mp2)
+{
+	struct amdtp_cl_data *cl_data = mp2->cl_data;
+	struct amd_mp2_sensor_info info;
+	int i, status;
+
+	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_sts[i] == SENSOR_DISABLED) {
+			info.sensor_idx = cl_data->sensor_idx[i];
+			mp2->mp2_ops->start(mp2, info);
+			status = amd_sfh_wait_for_response
+					(mp2, cl_data->sensor_idx[i], ENABLE_SENSOR);
+			if (status == 0)
+				status = SENSOR_ENABLED;
+			if (status == SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_ENABLED;
+			dev_dbg(&mp2->pdev->dev, "resume sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+		}
+	}
+
+	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
+	amd_sfh_clear_intr(mp2);
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
+					(mp2, cl_data->sensor_idx[i], DISABLE_SENSOR);
+			if (status == 0)
+				status = SENSOR_DISABLED;
+			if (status != SENSOR_ENABLED)
+				cl_data->sensor_sts[i] = SENSOR_DISABLED;
+			dev_dbg(&mp2->pdev->dev, "suspend sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+		}
+	}
+
+	cancel_delayed_work_sync(&cl_data->work_buffer);
+	amd_sfh_clear_intr(mp2);
+}
+
+static void amd_mp2_pci_remove(void *privdata)
+{
+	struct amd_mp2_dev *mp2 = privdata;
+
+	amd_sfh_hid_client_deinit(privdata);
+	mp2->mp2_ops->stop_all(mp2);
+	pci_intx(mp2->pdev, false);
+	amd_sfh_clear_intr(mp2);
+}
+
+static void amd_sfh_set_ops(struct amd_mp2_dev *mp2)
+{
+	struct amd_mp2_ops *mp2_ops;
+
+	sfh_interface_init(mp2);
+	mp2_ops = mp2->mp2_ops;
+	mp2_ops->clear_intr = amd_sfh_clear_intr_v2,
+	mp2_ops->init_intr = amd_sfh_irq_init_v2,
+	mp2_ops->suspend = amd_sfh_suspend;
+	mp2_ops->resume = amd_sfh_resume;
+	mp2_ops->remove = amd_mp2_pci_remove;
+}
+
+int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
+{
+	u32 phy_base = readl(mp2->mmio + AMD_C2P_MSG(22));
+	struct device *dev = &mp2->pdev->dev;
+	struct sfh_base_info binfo;
+	int rc;
+
+	phy_base <<= 21;
+	if (!devm_request_mem_region(dev, phy_base, 128 * 1024, "amd_sfh")) {
+		dev_err(dev, "can't reserve mmio registers\n");
+		return -ENOMEM;
+	}
+
+	mp2->vsbase = devm_ioremap(dev, phy_base, 128 * 1024);
+	if (!mp2->vsbase) {
+		dev_err(dev, "failed to remap vsbase\n");
+		return -ENOMEM;
+	}
+
+	/* Before accessing give time for SFH firmware for processing configuration */
+	msleep(5000);
+
+	memcpy_fromio(&binfo, mp2->vsbase, sizeof(struct sfh_base_info));
+	if (binfo.sbase.fw_info.fw_ver == 0 || binfo.sbase.s_list.sl.sensors == 0) {
+		dev_err(dev, "failed to get sensors\n");
+		return -EOPNOTSUPP;
+	}
+	dev_dbg(dev, "firmware version 0x%x\n", binfo.sbase.fw_info.fw_ver);
+
+	amd_sfh_set_ops(mp2);
+
+	rc = amd_sfh_irq_init(mp2);
+	if (rc) {
+		dev_err(dev, "amd_sfh_irq_init failed\n");
+		return rc;
+	}
+
+	rc = amd_sfh1_1_hid_client_init(mp2);
+	if (rc) {
+		dev_err(dev, "amd_sfh1_1_hid_client_init failed\n");
+		return rc;
+	}
+
+	return rc;
+}
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
new file mode 100644
index 000000000000..21c44990bbeb
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD MP2 1.1 initialization structures
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#ifndef AMD_SFH_INIT_H
+#define AMD_SFH_INIT_H
+
+#include "../amd_sfh_common.h"
+
+struct amd_sfh1_1_ops {
+	int (*init)(struct amd_mp2_dev *mp2);
+};
+
+int amd_sfh1_1_init(struct amd_mp2_dev *mp2);
+
+static const struct amd_sfh1_1_ops __maybe_unused sfh1_1_ops = {
+	.init = amd_sfh1_1_init,
+};
+
+#endif
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
new file mode 100644
index 000000000000..14a1578055b6
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * AMD MP2 1.1 communication interfaces
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+#include <linux/iopoll.h>
+#include "amd_sfh_interface.h"
+
+static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
+{
+	struct sfh_cmd_response cmd_resp;
+
+	/* Get response with status within a max of 1600 ms timeout */
+	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
+				(cmd_resp.response.response == 0 &&
+				cmd_resp.response.cmd_id == cmd_id && (sid == 0xff ||
+				cmd_resp.response.sensor_id == sid)), 500, 1600000))
+		return cmd_resp.response.response;
+
+	return -1;
+}
+
+static void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
+{
+	struct sfh_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd.cmd_id = ENABLE_SENSOR;
+	cmd_base.cmd.intr_disable = 0;
+	cmd_base.cmd.sensor_id = info.sensor_idx;
+
+	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
+}
+
+static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
+{
+	struct sfh_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd.cmd_id = DISABLE_SENSOR;
+	cmd_base.cmd.intr_disable = 0;
+	cmd_base.cmd.sensor_id = sensor_idx;
+
+	writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
+	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
+}
+
+static void amd_stop_all_sensor(struct amd_mp2_dev *privdata)
+{
+	struct sfh_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd.cmd_id = STOP_ALL_SENSORS;
+	cmd_base.cmd.intr_disable = 0;
+
+	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
+}
+
+static struct amd_mp2_ops amd_sfh_ops = {
+	.start = amd_start_sensor,
+	.stop = amd_stop_sensor,
+	.stop_all = amd_stop_all_sensor,
+	.response = amd_sfh_wait_response,
+};
+
+void sfh_interface_init(struct amd_mp2_dev *mp2)
+{
+	mp2->mp2_ops = &amd_sfh_ops;
+}
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
new file mode 100644
index 000000000000..ae47a369dc05
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -0,0 +1,154 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD MP2 1.1 communication interfaces
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+
+#ifndef AMD_SFH_INTERFACE_H
+#define AMD_SFH_INTERFACE_H
+
+#include "../amd_sfh_common.h"
+
+#define SENSOR_DATA_MEM_SIZE_DEFAULT		256
+#define TOTAL_STATIC_MEM_DEFAULT		1024
+#define OFFSET_SFH_INFO_BASE_DEFAULT		0
+#define OFFSET_SENSOR_DATA_DEFAULT		(OFFSET_SFH_INFO_BASE_DEFAULT + \
+							TOTAL_STATIC_MEM_DEFAULT)
+enum sensor_index {
+	ACCEL_IDX,
+	GYRO_IDX,
+	MAG_IDX,
+	ALS_IDX = 4,
+	HPD_IDX = 5,
+	MAX_IDX = 15,
+};
+
+struct sfh_cmd_base {
+	union {
+		u32 ul;
+		struct {
+			u32 sensor_id		: 4;
+			u32 cmd_id		: 4;
+			u32 sub_cmd_id		: 6;
+			u32 length		: 12;
+			u32 rsvd		: 5;
+			u32 intr_disable	: 1;
+		} cmd;
+	};
+};
+
+struct sfh_cmd_response {
+	union {
+		u32 resp;
+		struct {
+			u32 response	: 8;
+			u32 sensor_id	: 4;
+			u32 cmd_id	: 4;
+			u32 sub_cmd	: 6;
+			u32 rsvd2	: 10;
+		} response;
+	};
+};
+
+struct sfh_platform_info {
+	union {
+		u32 pi;
+		struct {
+			u32 cust_id		: 16;
+			u32 plat_id		: 6;
+			u32 interface_id	: 4;
+			u32 rsvd		: 6;
+		} pinfo;
+	};
+};
+
+struct sfh_firmware_info {
+	union {
+		u32 fw_ver;
+		struct {
+			u32 minor_rev : 8;
+			u32 major_rev : 8;
+			u32 minor_ver : 8;
+			u32 major_ver : 8;
+		} fver;
+	};
+};
+
+struct sfh_sensor_list {
+	union {
+		u32 slist;
+		struct {
+			u32 sensors	: 16;
+			u32 rsvd	: 16;
+		} sl;
+	};
+};
+
+struct sfh_base_info {
+	union {
+		u32 sfh_base[24];
+		struct {
+			struct sfh_platform_info plat_info;
+			struct sfh_firmware_info  fw_info;
+			struct sfh_sensor_list s_list;
+		} sbase;
+	};
+};
+
+struct sfh_common_data {
+	u64 timestamp;
+	u32 intr_cnt;
+	u32 featvalid		: 16;
+	u32 rsvd		: 13;
+	u32 sensor_state	: 3;
+};
+
+struct sfh_float32 {
+	u32 x;
+	u32 y;
+	u32 z;
+};
+
+struct sfh_accel_data {
+	struct sfh_common_data commondata;
+	struct sfh_float32 acceldata;
+	u32 accelstatus;
+};
+
+struct sfh_gyro_data {
+	struct sfh_common_data commondata;
+	struct sfh_float32 gyrodata;
+	u32 result;
+};
+
+struct sfh_mag_data {
+	struct sfh_common_data commondata;
+	struct sfh_float32 magdata;
+	u32 accuracy;
+};
+
+struct sfh_als_data {
+	struct sfh_common_data commondata;
+	u16 lux;
+};
+
+struct hpd_status {
+	union {
+		struct {
+			u32 distance			: 16;
+			u32 probablity			: 8;
+			u32 presence			: 2;
+			u32 rsvd			: 5;
+			u32 state			: 1;
+		} shpd;
+		u32 val;
+	};
+};
+
+void sfh_interface_init(struct amd_mp2_dev *mp2);
+void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
+#endif
-- 
2.25.1

