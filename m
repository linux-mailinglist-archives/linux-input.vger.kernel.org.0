Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F957572255
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 20:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232632AbiGLSTV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 14:19:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbiGLSTS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 14:19:18 -0400
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53E3CBB7F7
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 11:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YTtlhi8X8gVfca9Z145022e9ZmXuCjvVRhezgwaoqRQ8aB+ye2PEmNztPENOiaTBMXJW6Bjg2iGOsrkL9PJoztmuDFPuflZQPYGWOL24Kbqehl11QP6t+Kj4kA1jQaEIch1XSvvbfpAWo6P+k4x/nrkVBSzKK8kwR/ZAdp30b4mqLXsEjIDHgNQmZUDgBrOAWsceWLb+RFcLWvS6ysvCNUe1yvcqglraH3C04bS94R1vEu/aB6Os1lXSxhZF3M9RvL8oMu/TfBgkzuK8232tdMPvHuFEWU7kFEWDotVwHpI1LniaEYXcY5t+TgcAnhz/Y8ou70FhSBbK24IKOj5qyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odoEKLTVIhkGa0bg3WhTeqbOJILLHOAjfNu8pWc6Ta8=;
 b=FF3DD3McLDbI/tcgZi1pYs+guDNV+yXE3tmZxqD7uobqhceWEvVcpQVlFBJPk2t89JzIUNEQPxk+iEwTVOpKWhsrdYPMM0cE5FAB0WhsvWTF5nzniQCnes3DZoL4NVPKKdz6gUydmPueCrPhz7j54lnr2LGSBu/XFD0SHzv/AUci4hQ7TteQ3Wd1wQdm9FsRy1A+UpeOxSAGzPtgPL/S5Ul8lW0MvW1pZlkzDRYHW3XFqaCB25oh4g4jQoVvS0sDv+bvo1Lv8bwcvZyxi4YoxgcEleYB4nRxopyphLUJbe7WSZvZSpxTV7SQbIKcDU7mrHuwxowhJ1tUk/T97bwOAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odoEKLTVIhkGa0bg3WhTeqbOJILLHOAjfNu8pWc6Ta8=;
 b=ajjFwBeVmO2cR0dQc65TeBD2MIEVAMcMiu34wvDuzHETD9MRcmFgYmvrwe224B1fuqwc91p9Egb8F+aYUmWlv18oqIfSovWF2HMqJoXHwRgHPxAaUuu3Soy2JcK8rvhskE5y1D4oxpv+frLROXZqyO0Z1+e7Ri2NOV834/c8gwM=
Received: from DS7PR05CA0014.namprd05.prod.outlook.com (2603:10b6:5:3b9::19)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:14d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 18:19:14 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::24) by DS7PR05CA0014.outlook.office365.com
 (2603:10b6:5:3b9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.11 via Frontend
 Transport; Tue, 12 Jul 2022 18:19:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5417.15 via Frontend Transport; Tue, 12 Jul 2022 18:19:14 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 12 Jul
 2022 13:19:12 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 02/11] HID: amd_sfh: Move common macros and structures
Date:   Tue, 12 Jul 2022 23:48:27 +0530
Message-ID: <20220712181836.3488343-3-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4009555f-abbc-45d7-cb41-08da643306be
X-MS-TrafficTypeDiagnostic: LV2PR12MB5752:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWcR1osceqGLAJG+fshcFMX+SkuiJYlKFIKeevr1KgI2r6sUBHmFuBVWNHP8JhcmrPUJUSX2oaY+j0BeQrkZEN2BjK6wFT+rtA6PqlnXrVy0NVnZ2Zerr7I2/3eRYRQlgfdpRFyoN+JGHsjKwVVIDZE2qrHei3WyN+0hzsA0mgBJ/9yGFWnlGYjUXtTMWUvkCzOtqF+KaVVMd5R4Xl6YOwraUdeh/6aHhMWp5U1y3x5xEABIa2PmWsDR2SKSnFTSkGANNKD0RABA2Xs4j6xoZlwaMQB542YQ1PKhggiDQZPguM9sokVNijfy5jgNUTfpQjcRROwpzwNSa7QYqg5opyQ7sDUqg1Lr6NaAlQZAI6gFRSDhbMZmCI+8oby8xi/foJ/G9EIZZjD84o18kqTrvpIFcUx/bE3XBWBGNEyUdHYaUOY13q6ErlFd1eYeDX5HCGDWLyzA8u3k3NSASE0TGJbGc70yKVBoxVb1kBVoDG7C4jvYmfGpj02nTBxq9YaVMQsY0r7bS7By5YyOMq/xasCSV77cXWIad2GEX22YnRizMuVv9iXxUgLcm7mDSJJPfI5BVoEG6lbPWHoTrrVccf9Xp9p1TZa51RO2Er7KUieWrIH7DlDoDDmrwmKCZLhoB9v+bbknYtYNU/1qaqGgOcvqvVLNSf9sJbWdNVwdGBi+fTMNY5cXSUPupgFlmVDmpV05m47QK5J/slIKcDrqlRacIr1YP9fHlw34LGcOEwcCwsUADtcS/SF7x+Wekfhz6wpb5u1UfAk/6pTbyFKys2BDKwrQZSNa/KBLCvSA6q7TSSE/eUnQ49xa6WMVcVhcd2UZgnv54wd93yZskZutNYYxCVUpzIEuwtHYQker0Fs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(136003)(39860400002)(46966006)(36840700001)(40470700004)(81166007)(2616005)(356005)(426003)(8676002)(36860700001)(16526019)(4326008)(82740400003)(40460700003)(83380400001)(336012)(5660300002)(70586007)(47076005)(186003)(8936002)(70206006)(82310400005)(1076003)(41300700001)(40480700001)(6666004)(110136005)(36756003)(26005)(478600001)(316002)(86362001)(2906002)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 18:19:14.4529
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4009555f-abbc-45d7-cb41-08da643306be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Introduce common macros and structures to support multiple generations
of AMD SOCs, move them to amd_sfh_common.h.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h | 59 ++++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 42 +----------------
 2 files changed, 60 insertions(+), 41 deletions(-)
 create mode 100644 drivers/hid/amd-sfh-hid/amd_sfh_common.h

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
new file mode 100644
index 000000000000..40da53d5efd0
--- /dev/null
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * AMD MP2 common macros and structures
+ *
+ * Copyright (c) 2022, Advanced Micro Devices, Inc.
+ * All Rights Reserved.
+ *
+ * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
+ */
+#ifndef AMD_SFH_COMMON_H
+#define AMD_SFH_COMMON_H
+
+#include <linux/pci.h>
+#include "amd_sfh_hid.h"
+
+#define PCI_DEVICE_ID_AMD_MP2		0x15E4
+
+#define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
+#define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
+
+#define SENSOR_ENABLED			4
+#define SENSOR_DISABLED			5
+
+#define AMD_SFH_IDLE_LOOP		200
+
+enum cmd_id {
+	NO_OP,
+	ENABLE_SENSOR,
+	DISABLE_SENSOR,
+	STOP_ALL_SENSORS = 8,
+};
+
+struct amd_mp2_sensor_info {
+	u8 sensor_idx;
+	u32 period;
+	dma_addr_t dma_address;
+};
+
+struct amd_mp2_dev {
+	struct pci_dev *pdev;
+	struct amdtp_cl_data *cl_data;
+	void __iomem *mmio;
+	const struct amd_mp2_ops *mp2_ops;
+	struct amd_input_data in_data;
+	/* mp2 active control status */
+	u32 mp2_acs;
+};
+
+struct amd_mp2_ops {
+	void (*start)(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
+	void (*stop)(struct amd_mp2_dev *privdata, u16 sensor_idx);
+	void (*stop_all)(struct amd_mp2_dev *privdata);
+	int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
+	void (*clear_intr)(struct amd_mp2_dev *privdata);
+	int (*init_intr)(struct amd_mp2_dev *privdata);
+	int (*discovery_status)(struct amd_mp2_dev *privdata);
+};
+
+#endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 8c760526132a..2feac14f5d3c 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -10,35 +10,20 @@
 #ifndef PCIE_MP2_AMD_H
 #define PCIE_MP2_AMD_H
 
-#include <linux/pci.h>
-#include "amd_sfh_hid.h"
-
-#define PCI_DEVICE_ID_AMD_MP2	0x15E4
-
-#define ENABLE_SENSOR		1
-#define DISABLE_SENSOR		2
-#define STOP_ALL_SENSORS	8
+#include "amd_sfh_common.h"
 
 /* MP2 C2P Message Registers */
 #define AMD_C2P_MSG0	0x10500
 #define AMD_C2P_MSG1	0x10504
 #define AMD_C2P_MSG2	0x10508
 
-#define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
-#define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
-
 /* MP2 P2C Message Registers */
 #define AMD_P2C_MSG3	0x1068C /* Supported Sensors info */
 
 #define V2_STATUS	0x2
 
-#define SENSOR_ENABLED     4
-#define SENSOR_DISABLED    5
-
 #define HPD_IDX		16
 
-#define AMD_SFH_IDLE_LOOP	200
-
 #define SENSOR_DISCOVERY_STATUS_MASK		GENMASK(5, 3)
 #define SENSOR_DISCOVERY_STATUS_SHIFT		3
 
@@ -96,22 +81,6 @@ enum sensor_idx {
 	als_idx = 19
 };
 
-struct amd_mp2_dev {
-	struct pci_dev *pdev;
-	struct amdtp_cl_data *cl_data;
-	void __iomem *mmio;
-	const struct amd_mp2_ops *mp2_ops;
-	struct amd_input_data in_data;
-	/* mp2 active control status */
-	u32 mp2_acs;
-};
-
-struct amd_mp2_sensor_info {
-	u8 sensor_idx;
-	u32 period;
-	dma_addr_t dma_address;
-};
-
 enum mem_use_type {
 	USE_DRAM,
 	USE_C2P_REG,
@@ -140,13 +109,4 @@ void amd_mp2_suspend(struct amd_mp2_dev *mp2);
 void amd_mp2_resume(struct amd_mp2_dev *mp2);
 const char *get_sensor_name(int idx);
 
-struct amd_mp2_ops {
-	 void (*start)(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
-	 void (*stop)(struct amd_mp2_dev *privdata, u16 sensor_idx);
-	 void (*stop_all)(struct amd_mp2_dev *privdata);
-	 int (*response)(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
-	 void (*clear_intr)(struct amd_mp2_dev *privdata);
-	 int (*init_intr)(struct amd_mp2_dev *privdata);
-	 int (*discovery_status)(struct amd_mp2_dev *privdata);
-};
 #endif
-- 
2.25.1

