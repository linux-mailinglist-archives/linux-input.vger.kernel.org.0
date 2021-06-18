Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB6AA3AC5D7
	for <lists+linux-input@lfdr.de>; Fri, 18 Jun 2021 10:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhFRIVW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Jun 2021 04:21:22 -0400
Received: from mail-bn8nam12on2073.outbound.protection.outlook.com ([40.107.237.73]:57825
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232345AbhFRIVU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Jun 2021 04:21:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg+J8j6bugMcT8eRkjib84m+OAB7XrO/QE4lz73TR6RAA7xCapjYT1t1j19sXILcLZy7gUizNAUB0Prlh2I1jY9muT2DouhtOZAw1nuFkFcl5Nexs22PBV2pr2Ow999Aal96/POr0Bq5qw8zPRpRQddMLlMkqCBzpJ1S/IABLZUNFX+2h81tnH66noygmP4m5CpvQ/YRjxGtFikdLe7apC2QRsdJ7sYEvjDEHgQ0mbsK68/hIjpK0l8+lqWUfOYxq/cXTezRLREZUmKVHITGeqHN8vJDCg/ILVlE67oeZBt4vU1MDLDL1Zswrj0jpauo3TfdpbW7fnDkFu4vsnXHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytYX+BcwpwSLv1tOjxpQnmhngLyxv1Tlke6l0h2vqPg=;
 b=AdyshIZBjV49d2nDUfwso3eSzoOjZspcLRY8xuyTs1jh6hAwV9BBTonOK0bgVWg5yycCnAMzXXurcxpDO+aahyoVqFiSxdHqu+bxVDklAEM8DWfRYxH5XTw4uAHHuTRIZviBKMkTdQlSscqFEp9h40Ml8PhIsO2IlenRGbhPMj6nNgpXeKMh7wZeCO7zH3dgroED6g/yf8WK/M6i7lP5w9NKcrpck39z0XNCm5Nf9PZxO3HZ9Wdh6eYVo5ijZ0A7e2U63+byWQ8VRpdB6yC2+AmLjBkbh8fe0F76yxe/AvxsfB928/uzldD+kQygXT34BmIFQIEHMiXQ8tZEAgVPnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytYX+BcwpwSLv1tOjxpQnmhngLyxv1Tlke6l0h2vqPg=;
 b=dwcD42vioGgLKq55C2dIDJZCP1z2jYjBAe5PuEzJJz1Bya9YFRtXdycy1GK7s9QvbE9CSQmHaQrskqAN2g19ojWZBitnYlWXdih8LoMOrWWQ37lFGQigjvClZnrwI8/Pd4RL77U7RjwOjUKWZQbSklxWEuqWxj0Uea4BEtjFd5k=
Received: from MWHPR11CA0025.namprd11.prod.outlook.com (2603:10b6:300:115::11)
 by DM5PR12MB1818.namprd12.prod.outlook.com (2603:10b6:3:114::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 18 Jun
 2021 08:19:08 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:115:cafe::e2) by MWHPR11CA0025.outlook.office365.com
 (2603:10b6:300:115::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21 via Frontend
 Transport; Fri, 18 Jun 2021 08:19:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4242.16 via Frontend Transport; Fri, 18 Jun 2021 08:19:08 +0000
Received: from amd-DAYTONA-X.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 18 Jun
 2021 03:19:04 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
        <linux-input@vger.kernel.org>
CC:     <Nehal-Bakulchandra.shah@amd.com>, <shyam-sundar.s-k@amd.com>,
        "Basavaraj Natikar" <Basavaraj.Natikar@amd.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 1/3] amd_sfh: Extend driver capabilities for multi-generation support
Date:   Fri, 18 Jun 2021 13:48:36 +0530
Message-ID: <20210618081838.4156571-2-Basavaraj.Natikar@amd.com>
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
X-MS-Office365-Filtering-Correlation-Id: c7dd5cf8-b3e5-460e-e8c9-08d93231beaa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1818:
X-Microsoft-Antispam-PRVS: <DM5PR12MB18188C2F440B78F22027C501E60D9@DM5PR12MB1818.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U5HewFzaWepU//DMSOzP0+L3OptHxcaK0NCGxvgXqJcmr6fMbe8AHOOUbYeZoY6TikiMs6PCZ3I5/FpQTKZdsRuqJ0he6/F4pfohP3O2SEU27Lg1nIcVSzgQXN02IKnnnOBQNNEKfiSbP9QB3Lxsbpx5kPQsU3NcowrGAHzBFFQRONt6BgzDmsAqrN5oZPIQenK2/cq4idBbFLePXuaYi+s5yj4S3jk2My6c1NwbBhenxNnPmdea9oC8wTUEDvj7RotnC+77JskP3yLZo0vMOjJqpWki6Bqd9oCFrdYr436mYalHzT2yu3voL86cGLpyN5Uad9xVtmyB6dYJ3fP+f28utAgnABdPA60XbX124UCRLxdCmpfkaOkOoQCkV77O5TQZ6d44HnKpE3Hznzk5m3SPTnCAUagyP8zWRL6L4V4wwiqWbXWIJXq2CdL8ZS6pjdePklXEeeVT+GscNNSCKThEpbLQFvC/XGmbNDdn8mwWXtfXaXWleeIjzR4zH3DQzntFVaiT5Q4win0AtXDosbZSsy2hc1TrbarvIGP19oR+7X4iqaOoqSHGHlHyVuVpPDcQ5CVSB8DRmKulk+qC3BMogqwP9zZIxJYqRU2AId8trxOTusyoBWcL1d9iOMHNnspkyg5n/0sgASfHAL9qy0zUOYznexlLMiNjC9M4JZkJ+MzcFDOjgXg2FDwShvhY
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(46966006)(36840700001)(110136005)(26005)(316002)(6666004)(426003)(2616005)(86362001)(54906003)(82310400003)(70586007)(70206006)(7696005)(336012)(186003)(16526019)(2906002)(356005)(8676002)(8936002)(4326008)(47076005)(36756003)(82740400003)(81166007)(5660300002)(83380400001)(36860700001)(478600001)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 08:19:08.1684
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dd5cf8-b3e5-460e-e8c9-08d93231beaa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1818
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Initial driver support only covered the first generation of SFH
platforms. In order to support the future generations introduce
ops selection to distinguish the different platforms.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Reviewed-by: Nehal Shah <nehal-bakulchandra.shah@amd.com>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c |  4 +-
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   | 80 ++++++++++++++++++++++--
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   | 27 ++++++++
 3 files changed, 105 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3589d9945da1..d3d5dcec7cf1 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -202,7 +202,7 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		rc = amdtp_hid_probe(cl_data->cur_hid_dev, cl_data);
 		if (rc)
 			return rc;
-		amd_start_sensor(privdata, info);
+		privdata->mp2_ops->start(privdata, info);
 		cl_data->sensor_sts[i] = 1;
 	}
 	privdata->cl_data = cl_data;
@@ -230,7 +230,7 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	int i;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++)
-		amd_stop_sensor(privdata, i);
+		privdata->mp2_ops->stop(privdata, i);
 
 	cancel_delayed_work_sync(&cl_data->work);
 	cancel_delayed_work_sync(&cl_data->work_buffer);
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index ddecc84fd6f0..48ff54dc5d70 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -30,6 +30,48 @@ static int sensor_mask_override = -1;
 module_param_named(sensor_mask, sensor_mask_override, int, 0444);
 MODULE_PARM_DESC(sensor_mask, "override the detected sensors mask");
 
+static void amd_start_sensor_v2(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
+{
+	union sfh_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd_v2.cmd_id = ENABLE_SENSOR;
+	cmd_base.cmd_v2.period = info.period;
+	cmd_base.cmd_v2.sensor_id = info.sensor_idx;
+	cmd_base.cmd_v2.length = 16;
+
+	if (info.sensor_idx == als_idx)
+		cmd_base.cmd_v2.mem_type = USE_C2P_REG;
+
+	writeq(info.dma_address, privdata->mmio + AMD_C2P_MSG1);
+	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
+}
+
+static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
+{
+	union sfh_cmd_base cmd_base;
+
+	cmd_base.ul = 0;
+	cmd_base.cmd_v2.cmd_id = DISABLE_SENSOR;
+	cmd_base.cmd_v2.period = 0;
+	cmd_base.cmd_v2.sensor_id = sensor_idx;
+	cmd_base.cmd_v2.length  = 16;
+
+	writeq(0x0, privdata->mmio + AMD_C2P_MSG2);
+	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
+}
+
+static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
+{
+	union sfh_cmd_base cmd_base;
+
+	cmd_base.cmd_v2.cmd_id = STOP_ALL_SENSORS;
+	cmd_base.cmd_v2.period = 0;
+	cmd_base.cmd_v2.sensor_id = 0;
+
+	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG0);
+}
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info)
 {
 	union sfh_cmd_param cmd_param;
@@ -98,7 +140,6 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 {
 	int activestatus, num_of_sensors = 0;
 	const struct dmi_system_id *dmi_id;
-	u32 activecontrolstatus;
 
 	if (sensor_mask_override == -1) {
 		dmi_id = dmi_first_match(dmi_sensor_mask_overrides);
@@ -109,8 +150,7 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (sensor_mask_override >= 0) {
 		activestatus = sensor_mask_override;
 	} else {
-		activecontrolstatus = readl(privdata->mmio + AMD_P2C_MSG3);
-		activestatus = activecontrolstatus >> 4;
+		activestatus = privdata->mp2_acs >> 4;
 	}
 
 	if (ACEL_EN  & activestatus)
@@ -130,8 +170,38 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 
 static void amd_mp2_pci_remove(void *privdata)
 {
+	struct amd_mp2_dev *mp2 = privdata;
 	amd_sfh_hid_client_deinit(privdata);
-	amd_stop_all_sensors(privdata);
+	mp2->mp2_ops->stop_all(mp2);
+}
+
+static const struct amd_mp2_ops amd_sfh_ops_v2 = {
+	.start = amd_start_sensor_v2,
+	.stop = amd_stop_sensor_v2,
+	.stop_all = amd_stop_all_sensor_v2,
+};
+
+static const struct amd_mp2_ops amd_sfh_ops = {
+	.start = amd_start_sensor,
+	.stop = amd_stop_sensor,
+	.stop_all = amd_stop_all_sensors,
+};
+
+static void mp2_select_ops(struct amd_mp2_dev *privdata)
+{
+	u8 acs;
+
+	privdata->mp2_acs = readl(privdata->mmio + AMD_P2C_MSG3);
+	acs = privdata->mp2_acs & GENMASK(3, 0);
+
+	switch (acs) {
+	case V2_STATUS:
+		privdata->mp2_ops = &amd_sfh_ops_v2;
+		break;
+	default:
+		privdata->mp2_ops = &amd_sfh_ops;
+		break;
+	}
 }
 
 static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
@@ -164,6 +234,8 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (rc)
 		return rc;
 
+	mp2_select_ops(privdata);
+
 	return amd_sfh_hid_client_init(privdata);
 }
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 489415f7c22c..6297d78c7aef 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -22,9 +22,13 @@
 #define AMD_C2P_MSG1	0x10504
 #define AMD_C2P_MSG2	0x10508
 
+#define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
+
 /* MP2 P2C Message Registers */
 #define AMD_P2C_MSG3	0x1068C /* Supported Sensors info */
 
+#define V2_STATUS	0x2
+
 /* SFH Command register */
 union sfh_cmd_base {
 	u32 ul;
@@ -33,6 +37,15 @@ union sfh_cmd_base {
 		u32 sensor_id : 8;
 		u32 period : 16;
 	} s;
+	struct {
+		u32 cmd_id : 4;
+		u32 intr_enable : 1;
+		u32 rsvd1 : 3;
+		u32 length : 7;
+		u32 mem_type : 1;
+		u32 sensor_id : 8;
+		u32 period : 8;
+	} cmd_v2;
 };
 
 union sfh_cmd_param {
@@ -61,6 +74,9 @@ struct amd_mp2_dev {
 	struct pci_dev *pdev;
 	struct amdtp_cl_data *cl_data;
 	void __iomem *mmio;
+	const struct amd_mp2_ops *mp2_ops;
+	/* mp2 active control status */
+	u32 mp2_acs;
 };
 
 struct amd_mp2_sensor_info {
@@ -69,10 +85,21 @@ struct amd_mp2_sensor_info {
 	dma_addr_t dma_address;
 };
 
+enum mem_use_type {
+	USE_DRAM,
+	USE_C2P_REG,
+};
+
 void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
 void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx);
 void amd_stop_all_sensors(struct amd_mp2_dev *privdata);
 int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id);
 int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata);
 int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata);
+
+struct amd_mp2_ops {
+	 void (*start)(struct amd_mp2_dev *privdata, struct amd_mp2_sensor_info info);
+	 void (*stop)(struct amd_mp2_dev *privdata, u16 sensor_idx);
+	 void (*stop_all)(struct amd_mp2_dev *privdata);
+};
 #endif
-- 
2.25.1

