Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C31903DDA13
	for <lists+linux-input@lfdr.de>; Mon,  2 Aug 2021 16:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbhHBOGH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Aug 2021 10:06:07 -0400
Received: from mail-co1nam11on2066.outbound.protection.outlook.com ([40.107.220.66]:63905
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237021AbhHBOE2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Aug 2021 10:04:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMZ4t7CLOyM2l4mnpvK/J+hiHQVE7ljciLfHsRoCX9+5KxSn0Pz5aKcSOHi3BBi32XQbCbyieNnN8BEUIAP+Ro77J7va/lkfCzgPh8oyakTyU+F7gL0GeQTVURyVFPHZW1j4zz5A2dcOccIRtsWK8q884H3cI3PDPzSDpzwhYNBOomSwGJqz5rabiBss8FzCI3EtkHlmCMCaoY1Cqp4uFEkvjGmYEyVq8yu7BLdx1zVNdCQho6kEPLObf17PfG9BlVjmXC5DnJ3jFBt3INHPAojOC4r3PwGx+YB1WRTArWDUk06xQu7aGOblPXonzN3t+AqRgT4wFFe4uyOIF0TmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgQzmEcqhf7R/AeOoA09HIYAgr6FFRfXA6adhtumJMA=;
 b=ctgd2eqHtzroi0uX31UBFbTkFKW0pcVBw8UHHVdE4oS+tlU7iar06mpPb2hII98fNdm6ox4opjMyHb21O+ycaFuqRFPnSdF0HSZYrB6WUtAVset3KX2q4ZUtbeUsyYMwlb/OPFLUx5bCIfnemm5plESDcyyoNrr+J12E3NCmTBxzuEeAdwIhsph8TJXbO/jb/JjqBWD8ZxpNvy7lS6Zdk/OGV4bOUcb4k1+k/gUvy3hEBcaghEphYkd1Plp+73LCRPJhzmJUSHiSkE36v09MxIldeJUla6hASuLJRWBaeg90FVBNWDMWHG3H4O0Rt0WfJwWNWQcFPD2BxHr9Xp+z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgQzmEcqhf7R/AeOoA09HIYAgr6FFRfXA6adhtumJMA=;
 b=0sFeTK5ycdaY/vhzvP3eeINIfSTgE82EDfbqurOMY4hVTVZbLCUXlKd5r6jVgBp5cpdSDqQm5VGfeWO3ZJV2G41Bx6Nf6bDRfvbkRetdJWRtkKMC9fO73VltIV4TunP2SW29lt60j9xg+bUSu7yszWRNjdAaQybCpHl/qiZWxP4=
Received: from DM5PR1401CA0020.namprd14.prod.outlook.com (2603:10b6:4:4a::30)
 by BL0PR12MB2371.namprd12.prod.outlook.com (2603:10b6:207:3e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Mon, 2 Aug
 2021 14:04:17 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:4a:cafe::de) by DM5PR1401CA0020.outlook.office365.com
 (2603:10b6:4:4a::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Mon, 2 Aug 2021 14:04:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4373.18 via Frontend Transport; Mon, 2 Aug 2021 14:04:16 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Mon, 2 Aug
 2021 09:04:14 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 4/5] amd_sfh:Add support for PM suspend and resume
Date:   Mon, 2 Aug 2021 19:33:40 +0530
Message-ID: <20210802140341.901840-5-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9d6208d4-ec8a-4703-160a-08d955be6a9c
X-MS-TrafficTypeDiagnostic: BL0PR12MB2371:
X-Microsoft-Antispam-PRVS: <BL0PR12MB237113A717A01CEAB5B4709BE6EF9@BL0PR12MB2371.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:972;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cyXmY9CTK6pCPgwJU/DcIkxwLhRiEH3xO/wx2E42q6Dv8WOe/pyyAWfD20/xruwhXRvPGijwtNmorlVbPrUZcsth1Yzte2QjHp2tdmmE8LX0dzv+CUcY+uzy6whrXiIHkbMpVIQYltRaGkRcdPMp/A7ye1VMF1N9CBtsuD5EOqDhd2IWHmb5L7ckTxblVOs6tjPNgBx2pJKls9/EK/my2d1MR/XY1NhjzMqxxt9FGcLoO3gf//LNHtJw2ikzWI3y5QJWCvJDf1sr3qgSxu83+9auoIYs3jq3whV/6i5Qk6saSCBAyh3tsQWnRyfCryr9VTtiKAFk4h48lzybxoQ3UHkZfYBfTJIeGhdr/LCLPoVseVOcNu1evS6U/7UpWwuXtYBBg5KqlTv3FyI24Qqyt35Fc+uiifpb2WvTnHbRBZQOmF9kKKpTVbRNY8yrFYj3cqpAfFaZCXt5BwVs02uN/hKDk0bSVVjYRDOB5unbutlbeDJIaLGRKBOCjQKhq7YUR7I82UcsJLecnLCvOfBxGFejDlAmRTczRfbXsz1h0tCKndUQrr7Wf/WU4xqaIjp29zS8H7K0whP7ZT8Ai69HQzVoLR00HF9QtPCqL0oGVlZ6ev3MTPa6INiSSk7XWXJdBSdHXQF0d/ZJ8ajmPancTNIpBP0DYPoIa6WPUqWefVjFFpr8XLjmtO8SPWw6lWw4YBVf5fz6Me6I/M1kzYe0+tjYs0mKT6rfypxTvfdrP8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(346002)(136003)(46966006)(36840700001)(2616005)(54906003)(82310400003)(7696005)(26005)(110136005)(81166007)(82740400003)(5660300002)(36860700001)(4326008)(70586007)(8936002)(8676002)(83380400001)(316002)(70206006)(86362001)(336012)(1076003)(16526019)(426003)(47076005)(356005)(2906002)(36756003)(478600001)(6666004)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2021 14:04:16.9377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6208d4-ec8a-4703-160a-08d955be6a9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2371
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for power management routines.

Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c |  1 -
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 49 ++++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  5 +++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 4982ccf9dc25..050df796aa2e 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -17,7 +17,6 @@
 #include "amd_sfh_pcie.h"
 #include "amd_sfh_hid.h"
 
-#define AMD_SFH_IDLE_LOOP	200
 
 struct request_list {
 	struct hid_device *hid;
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index fd2e3011086d..bdef47118c3d 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -264,6 +264,54 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	return amd_sfh_hid_client_init(privdata);
 }
 
+static int __maybe_unused amd_mp2_pci_resume(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
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
+		}
+	}
+
+	return 0;
+}
+
+static int __maybe_unused amd_mp2_pci_suspend(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct amd_mp2_dev *mp2 = pci_get_drvdata(pdev);
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
+		}
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(amd_mp2_pm_ops, amd_mp2_pci_suspend,
+		amd_mp2_pci_resume);
+
 static const struct pci_device_id amd_mp2_pci_tbl[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_MP2) },
 	{ }
@@ -274,6 +322,7 @@ static struct pci_driver amd_mp2_pci_driver = {
 	.name		= DRIVER_NAME,
 	.id_table	= amd_mp2_pci_tbl,
 	.probe		= amd_mp2_pci_probe,
+	.driver.pm	= &amd_mp2_pm_ops,
 };
 module_pci_driver(amd_mp2_pci_driver);
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 21ef55da712a..1ff6f83cb6fd 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -36,6 +36,8 @@
 
 #define HPD_IDX		16
 
+#define AMD_SFH_IDLE_LOOP	200
+
 /* SFH Command register */
 union sfh_cmd_base {
 	u32 ul;
@@ -129,6 +131,9 @@ void amd_stop_all_sensors(struct amd_mp2_dev *privdata);
 int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id);
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata);
 int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata);
+u32 amd_sfh_wait_for_response(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts);
+void amd_mp2_suspend(struct amd_mp2_dev *mp2);
+void amd_mp2_resume(struct amd_mp2_dev *mp2);
 
 struct amd_mp2_ops {
 	 void (*start)(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
-- 
2.25.1

