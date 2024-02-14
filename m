Return-Path: <linux-input+bounces-1904-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE7E854BB8
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 15:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB09B1C21275
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 14:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1CA5A108;
	Wed, 14 Feb 2024 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="jWVjquZd"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF215644D
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921737; cv=fail; b=DJyM7YqChXX//A0BKEPbRek0af4/ykTRnOYT7FjkpCa+++hV6xDWJvE/YC1tLTLhZgTKypLWn3ljdQ7Wa8UURJtsuBbxfienPUzCyoXX1P6PfRdT6mJ8q6NWk1d7jPs0j7tAIRH1l1lBt8e1J3wrz75ehM5wRMsoZoMW8gAAHWQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921737; c=relaxed/simple;
	bh=/l9HDU71yyvoRMR44ZcjaAPrpMpTp4o7sfq8hktogRk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8NLfWL3rGBng1zAzu60qsGrezVfS45bJpuZ8/9QgxH+CoVxBqvEIq/HLu9ZRUsQrMFT9gL/jjtmICirhwn8xwvwb+TT5GHpwUDNrm/3M0dlkf5KpEKX6W7dpW9PcaohBf5tMfYNtABYlvbZ38+yEDBrII4nKua3ZnGWMqf8BJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=jWVjquZd; arc=fail smtp.client-ip=40.107.93.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjRZhcXvEQsEOLzBJ1xPH3eMMH/HwXNK6Izz5yPSgPuXx/88hbly3MGNQmlD+6cCKSsG0Wx4PcaiH5sUBxn5pImU6vNZyMaELiuI5w7leJBRFRGULL0//mWahkoSz+JJz5pJ3sfsK2LU+r2GdWQPm8+fOXslmyKaRBX8bzhiiz4N//nwH4uinaKKoCXbG/SDJnna0rihBAS4RlwHm/3YEunHjHlZDAsuhwGK7TSsgx3jhZ6qkug4AyOcbDSgWR9NrNS1S1LK/i9p9SWR8YXZ+kDMrQ75+y4YhpOMkPLkblDIiKQ6kZFl1oEymhXhIQEv05PKs7/3jjdSqy/KmZP4Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/D1yGll91PHKRiVdLEqPAi1Uk6i8vEycLIr9d17gP4U=;
 b=ASJ80lwisDP0+uFRyUuPC216Q05rWoO+5fPeQS4ol73XblnG98LnhEMW+KVrL1kEEGdQZLmV4diHZC23qeM7/dNDvQuIrEBxcwdkcdJys84UmTF41pqsdqeQAN5UpG1AdtIerHwqiFuEnDOE8nwIdaS1lE0DG/Od6xXigMvd3puflmI6p9pCCqxIZidSABXotrPDZwGy5xh3TM4UAac2C5/JDBUIeERV61mFgwMFvEqYvXOXCtMjIDfcV872ud03eODdQohPV/oLnFxLbo734sX7ZlMq+CTHKwiZYejzfDeJml6OtlaYmHiBCW2yKDoKiV7V4ZGNnhbAXrgfvMHBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/D1yGll91PHKRiVdLEqPAi1Uk6i8vEycLIr9d17gP4U=;
 b=jWVjquZd2dZKl7oMbOH1Sqt7WjT85B1Vgn+qPKnZUELZABNHsCb4KEYHiqpO9cOp8i2/PuZ8AnTbFfvzZmn/+pJP/xh0Lfx4LYQjRr2Ho8Okln7vRyLK6CbyeELJU5BpkChkS78FGgn+yH6CBEk4ib4UdQmIVUZs4615/h9o2Yg=
Received: from MW4PR03CA0165.namprd03.prod.outlook.com (2603:10b6:303:8d::20)
 by CY8PR12MB7122.namprd12.prod.outlook.com (2603:10b6:930:61::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.23; Wed, 14 Feb
 2024 14:42:12 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::ed) by MW4PR03CA0165.outlook.office365.com
 (2603:10b6:303:8d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Wed, 14 Feb 2024 14:42:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 14:42:12 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 08:42:07 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <akshata.mukundshetty@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH 5/5] HID: amd_sfh: Extend MP2 register access to SFH
Date: Wed, 14 Feb 2024 20:11:44 +0530
Message-ID: <20240214144144.682750-6-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
References: <20240214144144.682750-1-Basavaraj.Natikar@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|CY8PR12MB7122:EE_
X-MS-Office365-Filtering-Correlation-Id: 33204825-7f5e-4b8c-2f7c-08dc2d6b2149
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bz+ufrjiBMCs64+ZQpcDT+hDqvD3RFWFldMN5EMg9/N8vjrrd7MmUf19p0W8uA7MRY/Y0E7/0a2389fszsHzObNqRBElovMXS2rSa3ACpxEkERCIgjA8AE9v6DLSa90yGJeMRqJFIPYHWctBr2DhUkLbz/Qo1kP1z1AM93R/OPnpMQwzf+GH/oEQKU+ZB4Ue1WY6s70fu72Ain/aH432t+Fx9vrwJ+PUzs0IeNb+semHZp2mjEZMuenRPV5RY3BquNmJuq5rFbDtXT/Eg8UvAhYx+2I0SZcLjEou8StBUis/rAj3iPGsz9fwlClzMdZa83rYwjSyTYdIFA2hw6K6O5W6VEUbpkEBKq7+VYOQj8+yp4RezoJbZfrD/rBFgdbN2Ao1oRdtOSBT7E/dVLn7rMxC+Lks3VMv9Z9W9+HDBtNqIHBu61keRG5SCvdKqMa7zJmHCQOWTnc3oljKqtW6EmIb1cHMIJxW8PrHr0IFUYWcVIwL7UItUVf/o4uTG7d44BRy3AToyI7zTr9dTZtWR44O7a1eMQQEQqxlWIa+7Zn+pldJnkA4V7o/TT206dRa4M24oYxAVQSWzKZokCT4drgkI2rmd3zKOn/oHH4ieto=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(136003)(39860400002)(396003)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(2906002)(41300700001)(6666004)(36756003)(7696005)(2616005)(26005)(1076003)(478600001)(81166007)(16526019)(82740400003)(86362001)(8676002)(83380400001)(356005)(426003)(8936002)(336012)(5660300002)(4326008)(110136005)(54906003)(70586007)(316002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 14:42:12.1400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33204825-7f5e-4b8c-2f7c-08dc2d6b2149
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7122

Various MP2 register sets are supported by newer processors. Therefore,
extend MP2 register access to SFH.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h           | 14 ++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c             |  9 ++++++---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c      |  2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c      |  4 ++--
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 10 +++++-----
 5 files changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index ef5551c1eec5..e5620d7db569 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -19,6 +19,9 @@
 #define AMD_C2P_MSG(regno) (0x10500 + ((regno) * 4))
 #define AMD_P2C_MSG(regno) (0x10680 + ((regno) * 4))
 
+#define AMD_C2P_MSG_V1(regno) (0x10900 + ((regno) * 4))
+#define AMD_P2C_MSG_V1(regno) (0x10500 + ((regno) * 4))
+
 #define SENSOR_ENABLED			4
 #define SENSOR_DISABLED			5
 
@@ -55,6 +58,7 @@ struct amd_mp2_dev {
 	struct sfh_dev_status dev_en;
 	struct work_struct work;
 	u8 init_done;
+	u8 rver;
 };
 
 struct amd_mp2_ops {
@@ -81,4 +85,14 @@ void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata);
 int amd_sfh_irq_init_v2(struct amd_mp2_dev *privdata);
 void amd_sfh_clear_intr(struct amd_mp2_dev *privdata);
 int amd_sfh_irq_init(struct amd_mp2_dev *privdata);
+
+static inline u64 amd_get_c2p_val(struct amd_mp2_dev *mp2, u32 idx)
+{
+	return mp2->rver == 1 ? AMD_C2P_MSG_V1(idx) :  AMD_C2P_MSG(idx);
+}
+
+static inline u64 amd_get_p2c_val(struct amd_mp2_dev *mp2, u32 idx)
+{
+	return mp2->rver == 1 ? AMD_P2C_MSG_V1(idx) :  AMD_P2C_MSG(idx);
+}
 #endif
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 495ec1179ee5..9e97c26c4482 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -99,9 +99,9 @@ static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
 
 void amd_sfh_clear_intr_v2(struct amd_mp2_dev *privdata)
 {
-	if (readl(privdata->mmio + AMD_P2C_MSG(4))) {
-		writel(0, privdata->mmio + AMD_P2C_MSG(4));
-		writel(0xf, privdata->mmio + AMD_P2C_MSG(5));
+	if (readl(privdata->mmio + amd_get_p2c_val(privdata, 4))) {
+		writel(0, privdata->mmio + amd_get_p2c_val(privdata, 4));
+		writel(0xf, privdata->mmio + amd_get_p2c_val(privdata, 5));
 	}
 }
 
@@ -410,6 +410,9 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 
 	privdata->sfh1_1_ops = (const struct amd_sfh1_1_ops *)id->driver_data;
 	if (privdata->sfh1_1_ops) {
+		if (boot_cpu_data.x86 >= 0x1A)
+			privdata->rver = 1;
+
 		rc = devm_work_autocancel(&pdev->dev, &privdata->work, sfh1_1_init_work);
 		if (rc)
 			return rc;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
index 33fbdde8aff0..c8916afefa62 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c
@@ -251,7 +251,7 @@ static u8 get_input_rep(u8 current_index, int sensor_idx, int report_id,
 		break;
 	case HPD_IDX:
 		get_common_inputs(&hpd_input.common_property, report_id);
-		hpdstatus.val = readl(mp2->mmio + AMD_C2P_MSG(4));
+		hpdstatus.val = readl(mp2->mmio + amd_get_c2p_val(mp2, 4));
 		hpd_input.human_presence = hpdstatus.shpd.presence;
 		report_size = sizeof(hpd_input);
 		memcpy(input_report, &hpd_input, sizeof(hpd_input));
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 9dbe6f4cb294..5b24d5f63701 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -172,7 +172,7 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 		if (rc)
 			goto cleanup;
 
-		writel(0, privdata->mmio + AMD_P2C_MSG(0));
+		writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
 		mp2_ops->start(privdata, info);
 		status = amd_sfh_wait_for_response
 				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
@@ -298,7 +298,7 @@ static void amd_sfh_set_ops(struct amd_mp2_dev *mp2)
 
 int amd_sfh1_1_init(struct amd_mp2_dev *mp2)
 {
-	u32 phy_base = readl(mp2->mmio + AMD_C2P_MSG(22));
+	u32 phy_base = readl(mp2->mmio + amd_get_c2p_val(mp2, 22));
 	struct device *dev = &mp2->pdev->dev;
 	struct sfh_base_info binfo;
 	int rc;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index ae36312bc236..2de2668a0277 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -20,7 +20,7 @@ static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
 	struct sfh_cmd_response cmd_resp;
 
 	/* Get response with status within a max of 10000 ms timeout */
-	if (!readl_poll_timeout(mp2->mmio + AMD_P2C_MSG(0), cmd_resp.resp,
+	if (!readl_poll_timeout(mp2->mmio + amd_get_p2c_val(mp2, 0), cmd_resp.resp,
 				(cmd_resp.response.response == 0 &&
 				cmd_resp.response.cmd_id == cmd_id && (sid == 0xff ||
 				cmd_resp.response.sensor_id == sid)), 500, 10000000))
@@ -39,7 +39,7 @@ static void amd_start_sensor(struct amd_mp2_dev *privdata, struct amd_mp2_sensor
 	cmd_base.cmd.sub_cmd_value = 1;
 	cmd_base.cmd.sensor_id = info.sensor_idx;
 
-	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
+	writel(cmd_base.ul, privdata->mmio + amd_get_c2p_val(privdata, 0));
 }
 
 static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
@@ -52,8 +52,8 @@ static void amd_stop_sensor(struct amd_mp2_dev *privdata, u16 sensor_idx)
 	cmd_base.cmd.sub_cmd_value = 1;
 	cmd_base.cmd.sensor_id = sensor_idx;
 
-	writeq(0x0, privdata->mmio + AMD_C2P_MSG(1));
-	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
+	writeq(0x0, privdata->mmio + amd_get_c2p_val(privdata, 1));
+	writel(cmd_base.ul, privdata->mmio + amd_get_c2p_val(privdata, 0));
 }
 
 static void amd_stop_all_sensor(struct amd_mp2_dev *privdata)
@@ -66,7 +66,7 @@ static void amd_stop_all_sensor(struct amd_mp2_dev *privdata)
 	/* 0xf indicates all sensors */
 	cmd_base.cmd.sensor_id = 0xf;
 
-	writel(cmd_base.ul, privdata->mmio + AMD_C2P_MSG(0));
+	writel(cmd_base.ul, privdata->mmio + amd_get_c2p_val(privdata, 0));
 }
 
 static struct amd_mp2_ops amd_sfh_ops = {
-- 
2.25.1


