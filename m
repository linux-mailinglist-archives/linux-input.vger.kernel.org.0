Return-Path: <linux-input+bounces-1903-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62832854BB7
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 15:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8F1C1F21F97
	for <lists+linux-input@lfdr.de>; Wed, 14 Feb 2024 14:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBE415914A;
	Wed, 14 Feb 2024 14:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="EKmR+j79"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536E5A7A4
	for <linux-input@vger.kernel.org>; Wed, 14 Feb 2024 14:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921734; cv=fail; b=Fvk+ypMXpb7vfB+IClCx2Ki6o+HDQYsHpX5NGnWtvBX+0ZCkPqxTLhVpLv8UEbK6KC9b9jsscOJttRu5QJ9Qvp63smykQCWJFlt571130yJXvZDUtKVa6YMreFobNYg56sOeaoGqNUf3mFFnfLmhibgduJ4IBII/mgufvyO+WUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921734; c=relaxed/simple;
	bh=f4B+bXrugDw2VTIVZMVwX44LerdMGEEeN95Ypm2PU+c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oZWhzO/WQU1UHzH5h1WGKiZTAEO/4ztw/OfjTySq4JYOz7OBuS1pTKK5xfcU6GCsg2wncSwhAnlZXdhwMeVzLpyW3t4WrHeIzwIbVjCgOrzh2TezLeGYJmP0AqbpJq7BVLHUyN5SkcMevX/cLPPy+MB41tz3CRm3K8rafkJxVCk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=EKmR+j79; arc=fail smtp.client-ip=40.107.92.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7KaZIXVYsNROKjCCJXwviy0LH88cdwr/UjhckReYaR8wSu8APBy3yPnngXXVkzfbm9dZfjVmYyzC6uxtNl2LRrPBJsQrIOJdlF+C8vDuORwaVITorjr5u+RBgbE8P4wCezWXwtcWAJANiofTXa3PPS92DDTpSiRdOpJKeL+kqBYs9Qzb+VUc6n28NikYuYt4y+jo8845wdpZMasKITAOLn+pv6thc7Or47O/RupXz9G1fBddVWK6ZvNgULsKhvakPpV2cPzQBhe1hyfKrI0lOZ/a7PyCZ9S2bblTZYJ9JFVfQK/u7yFOYHkRr14zRHktWOvyFOfQ/yS5nElyQK2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B+WWEZeXs2VRX4kO1Hs6mogajeuW9tQ++a4Q5XogNuU=;
 b=CyO4QjGFBRoL7wt1vkqr08w0F/AWXdc8ySr3Q6yeegviAHmhgAijjjAopql7lLb2Dbx6EfdFtri74eEpx+P3ljy/y2mpkupVca9aW9BOb1pUvpPLtF3Lo4rLjV8l7QbNWwCPZa2VKF1zaqcwnYoMWeG87mtYYuK5KL7lvUEAoC4GzDjWTu0cjsxFn7yzKFkuZ/NNR6D9ZSsn3t0nWm5531WdE1vFbEe4V7m0mwiLmTDqlu8czQC/Im/2EkAk4z0IP9T7BYGPvbMy6Dguvj4C/2xw00msYdx1JOCPV3xPFERP74nakyVCrathDpqQ7PsDaUON6DnWf5W/LQ+zBA6U6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B+WWEZeXs2VRX4kO1Hs6mogajeuW9tQ++a4Q5XogNuU=;
 b=EKmR+j79pKny6d6+yOXkkXu02q6iaywmRWzd8Wcc/VzNRmFYR9yRroIww5Ew1AphSp0xF2pW2lIUCrMPRsSHXMP2qqCwAb6kKTT8ulB6KS9z6ykR2ALFTXQsFtnzv6scMPKoNGC9GP+QZrlCltPXLn0ddGnIQvWmTxrkoymsezY=
Received: from MW4PR03CA0178.namprd03.prod.outlook.com (2603:10b6:303:8d::33)
 by BL1PR12MB5287.namprd12.prod.outlook.com (2603:10b6:208:317::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 14:42:10 +0000
Received: from MWH0EPF000989E6.namprd02.prod.outlook.com
 (2603:10b6:303:8d:cafe::ee) by MW4PR03CA0178.outlook.office365.com
 (2603:10b6:303:8d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Wed, 14 Feb 2024 14:42:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989E6.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 14:42:09 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 08:42:03 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <akshata.mukundshetty@amd.com>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/5] HID: amd_sfh: Avoid disabling the interrupt
Date: Wed, 14 Feb 2024 20:11:42 +0530
Message-ID: <20240214144144.682750-4-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E6:EE_|BL1PR12MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b604c3-4a9c-4abb-2a98-08dc2d6b2000
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/eufgdJc+NDUftea06K9U/KZ4X7bFoONJLM2RuJrjyxU6RmaKaY7uLAMmBcTjlJS6HoPCH5kXc1I8u6K1vQUcHohhzUQsu7XzkisM4WkENLZJjKIb0g/vLCa/v0wMAiqXq9VaiQ789nmrRTRVGukk+hkyRwEJfDSBmO9+ftbEVSM3ukNM10aIj8aweehq7Jb5COa1wFyKqhz39eV/yELFWjeWWGDAYE4esX56SuqE3fZemBCJk4QFxgV/Mb9eR3wbjeTLNF1vc0aIu0pBNT09XS0Z8zs/HeOoXJ+EEc1opbmY28EKHvhFNB5gGAn/o1wrOMbS/Re+dZUjqXFOFNoce6vweHqUJQgKHLLcRi1i57rB4JjjQO9vC7BzUoBNowWmEAlWmYIobU0ZaophcaB8SLtnCAorZU2u5AfQY7FWqhvb6dBs6g4SnwB6+2lVXfwUjT/BJNWTzSrfRLsp0o6LDDa+YxV6w0T7pWEgcIFj1vMLxYbtokKbxNB2QiZQk93mVh24IQRvmbbV6yzYNxbhrzsqcPcQcrl0K0hobtAGLl1kG3RF24+j8LhuSBVa/GxTd8p6DSBpztKrpkmyiis/g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(82310400011)(1800799012)(186009)(451199024)(46966006)(36840700001)(40470700004)(2906002)(8676002)(8936002)(4326008)(5660300002)(336012)(426003)(83380400001)(2616005)(1076003)(16526019)(26005)(82740400003)(36756003)(86362001)(81166007)(356005)(316002)(110136005)(70586007)(70206006)(7696005)(54906003)(966005)(478600001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 14:42:09.9837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b604c3-4a9c-4abb-2a98-08dc2d6b2000
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5287

HP ProBook x360 435 G7 using older version of firmware which doesn't
support disabling the interrupt for all commands. Hence avoid disabling
the interrupt for that particular model.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=218104
Fixes: b300667b33b2 ("HID: amd_sfh: Disable the interrupt for all command")
Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c | 30 +++++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 8a4cd793d021..8c1809c7d1f7 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -35,6 +35,8 @@ static int sensor_mask_override = -1;
 module_param_named(sensor_mask, sensor_mask_override, int, 0444);
 MODULE_PARM_DESC(sensor_mask, "override the detected sensors mask");
 
+static bool intr_disable = true;
+
 static int amd_sfh_wait_response_v2(struct amd_mp2_dev *mp2, u8 sid, u32 sensor_sts)
 {
 	union cmd_response cmd_resp;
@@ -55,7 +57,7 @@ static void amd_start_sensor_v2(struct amd_mp2_dev *privdata, struct amd_mp2_sen
 
 	cmd_base.ul = 0;
 	cmd_base.cmd_v2.cmd_id = ENABLE_SENSOR;
-	cmd_base.cmd_v2.intr_disable = 1;
+	cmd_base.cmd_v2.intr_disable = intr_disable;
 	cmd_base.cmd_v2.period = info.period;
 	cmd_base.cmd_v2.sensor_id = info.sensor_idx;
 	cmd_base.cmd_v2.length = 16;
@@ -73,7 +75,7 @@ static void amd_stop_sensor_v2(struct amd_mp2_dev *privdata, u16 sensor_idx)
 
 	cmd_base.ul = 0;
 	cmd_base.cmd_v2.cmd_id = DISABLE_SENSOR;
-	cmd_base.cmd_v2.intr_disable = 1;
+	cmd_base.cmd_v2.intr_disable = intr_disable;
 	cmd_base.cmd_v2.period = 0;
 	cmd_base.cmd_v2.sensor_id = sensor_idx;
 	cmd_base.cmd_v2.length  = 16;
@@ -87,7 +89,7 @@ static void amd_stop_all_sensor_v2(struct amd_mp2_dev *privdata)
 	union sfh_cmd_base cmd_base;
 
 	cmd_base.cmd_v2.cmd_id = STOP_ALL_SENSORS;
-	cmd_base.cmd_v2.intr_disable = 1;
+	cmd_base.cmd_v2.intr_disable = intr_disable;
 	cmd_base.cmd_v2.period = 0;
 	cmd_base.cmd_v2.sensor_id = 0;
 
@@ -292,6 +294,26 @@ int amd_sfh_irq_init(struct amd_mp2_dev *privdata)
 	return 0;
 }
 
+static int mp2_disable_intr(const struct dmi_system_id *id)
+{
+	intr_disable = false;
+	return 0;
+}
+
+static const struct dmi_system_id dmi_sfh_table[] = {
+	{
+		/*
+		 * https://bugzilla.kernel.org/show_bug.cgi?id=218104
+		 */
+		.callback = mp2_disable_intr,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP ProBook x360 435 G7"),
+		},
+	},
+	{}
+};
+
 static const struct dmi_system_id dmi_nodevs[] = {
 	{
 		/*
@@ -315,6 +337,8 @@ static int amd_mp2_pci_probe(struct pci_dev *pdev, const struct pci_device_id *i
 	if (dmi_first_match(dmi_nodevs))
 		return -ENODEV;
 
+	dmi_check_system(dmi_sfh_table);
+
 	privdata = devm_kzalloc(&pdev->dev, sizeof(*privdata), GFP_KERNEL);
 	if (!privdata)
 		return -ENOMEM;
-- 
2.25.1


