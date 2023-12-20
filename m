Return-Path: <linux-input+bounces-899-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 005F08198EB
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 08:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 247F21C20BE3
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 07:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E0B1168A5;
	Wed, 20 Dec 2023 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="MaO92EFV"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A4168B2
	for <linux-input@vger.kernel.org>; Wed, 20 Dec 2023 07:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMY4EzrN6pj/88WYHDu9SiMIS7GMm4ysjvySPIsSCnlkJVd6bjQXpAhS2tsIt/UVWP0TMIWvML+NvHqPYPf9GS5AebwqP/xRvDBAeUCpfw7B85HP4uFksxgfBTrNzxzNs3r+8njhGco92wZroyAJrjQz9ffgrKsbaQkzNb4XB6N7NfTzEeWLTpl3yXPmvHVu/7zxIwKydBF3qy4wrwO53IVtiJeHr5YOjw9wH5aweTOMgNnYgIXH6qM3tRVfPcfWvl3z7fkpHrPx1pNPuN5aa1iXItiixI5qzJvRNybLU+3hrjUHFXzn6gCodnsbIKr377Em0ExPb8N+kC/uiboXbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a6ZvfwRVMBN8Ha0Th5F3YWrncskSi5ZOyP6GrQglKU=;
 b=f4k3/K5j8U5IEXi2l75FhUo/9zE7xUXSig6KqewyxAuRSfOMBXlZyj33Kafa/79LNRe1zbMaSMmTwN3F8Ev/YTI+YJkts6LnXHLAB0wCOuscSWGDqZRcS7rmciVGc1BD6QrfvZapSihuzG5BhDOEBFx3YzfK7x8ge8ROl3Ppf8Anpt5Vyg+F1U3sREbymeb/t5s/bOT8ryCCa2gqnFwtBSC6ZlJJHzjoG5JUKpDdxZqkMrpXCGZ+lMyLkYah0UCvywSXieCj8o+OfdWpLvKJqmxL5mNYFIYPCbarTtBltLmNiR5QalxPFQhGtX5NUlhL7NrhEekmeVvT3lUC2Nl2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a6ZvfwRVMBN8Ha0Th5F3YWrncskSi5ZOyP6GrQglKU=;
 b=MaO92EFVDDl1RQvxNyDLaWbGkKY+mrge45us4HFn+VPpDRRxSC2IVlXCk5oWPrqcC0G2BrMCI7RGwuzWISXtgOiGSzvFso8wBJMOc/J+66ZYoVjWnLZXXogwTMcunPhD4ZhqVwZFv1QwhFDJLumGQSmFgWgd/P1P3ymwSfJ1d8U=
Received: from DM6PR03CA0075.namprd03.prod.outlook.com (2603:10b6:5:333::8) by
 DM4PR12MB7504.namprd12.prod.outlook.com (2603:10b6:8:110::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Wed, 20 Dec 2023 07:01:29 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::5b) by DM6PR03CA0075.outlook.office365.com
 (2603:10b6:5:333::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 07:01:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 07:01:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 20 Dec
 2023 01:01:17 -0600
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	<mario.limonciello@amd.com>, <Shyam-sundar.S-k@amd.com>,
	<linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/3] HID: amd_sfh: Add a new interface for exporting ALS data
Date: Wed, 20 Dec 2023 12:30:42 +0530
Message-ID: <20231220070042.610455-4-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM4PR12MB7504:EE_
X-MS-Office365-Filtering-Correlation-Id: fcebb26e-7863-4e39-0405-08dc01297d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lk9sCzdO41YP5k9h8JbhPKb/jtHdigz3sk2C9ucJ5vjHVRmggO1giM9JzSvh2pADKDdCTv1NLl+ylCQIaEww4ubWk+I2IUMc80wuIZ9py+PfKUZnIUVzIPTWv7/yiHKplJiprwt9v01NPP2OOydqwwkSbe+FLZSjeJ1tFLYKYYbAvkpGhcUlKMVSsVdNLif+MIzqo32d0CTREWOSNSpBjYDS0dLifLJb1CnMxHAngF7tb7lXpWz6W6R3mByiCkGLUBv2ETt7kzAEX9zBtObTs0uoZggID2GDq8XtF8X52vP4ImEMOdavTOAvszWgxi/UWD8q9qKHuXE+VjLd2usLhilUX4ZA5dD47NghzFJ6MH6Z4TFAqydzZWbGt2r9dr4cd2QdkQ637O3o72p5TEbmGO3R3wfNEO8BLLDoMNPICuB1xHU5mA03kBq3k5q9CFqinpehNSspslzQmHNXd6KoBrSm5vufF9vuMWl2H7AhHLMcbucF2aeegEymSjmFcSk6SqGClMvyptW9BMjvuC982BZIgxG2L8Buoo6/BK+yh6rMKjFOWwR4WtppHrXGQCSPmZHOBn3wb912jT6bw+MFHNGesK35z9dRXim9mRs1dQXc60kmjq5FRlMgBNwpQ7PJIMfE1UxnPpeejOFKkJ/KYi2jzXj3/C4+sHvCOdX/Zidnq5KZuQuxrY8tDd42MyYt960zree2gTq9QpU/sL0H+i78MVtI5Va+kON58p/FgkLQ1/0QsKY1WP8Szly9WP4BDiD0QoYvfTD5X85vtalg5Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(396003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(82310400011)(46966006)(36840700001)(40470700004)(36756003)(47076005)(36860700001)(4326008)(8936002)(8676002)(81166007)(40480700001)(2906002)(5660300002)(1076003)(478600001)(966005)(70586007)(110136005)(2616005)(70206006)(316002)(26005)(336012)(426003)(83380400001)(16526019)(6666004)(41300700001)(40460700003)(86362001)(7696005)(356005)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 07:01:28.8872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcebb26e-7863-4e39-0405-08dc01297d74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7504

AMDSFH has information about the Ambient light via the Ambient
Light Sensor (ALS) which is part of the AMD sensor fusion hub.

Add a new interface to export this information, where other drivers like
PMF can use this information to enhance user experiences.

Link: https://lore.kernel.org/all/ad064333-48a4-4cfa-9428-69e8a7c44667@redhat.com/
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 +++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 22 +++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  4 ++++
 4 files changed, 33 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index cd57037bf217..a1950bc6e6ce 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -39,6 +39,7 @@ struct amd_mp2_sensor_info {
 
 struct sfh_dev_status {
 	bool is_hpd_present;
+	bool is_als_present;
 };
 
 struct amd_mp2_dev {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index 0351b0fd394a..9dbe6f4cb294 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -77,6 +77,9 @@ static int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 		case HPD_IDX:
 			privdata->dev_en.is_hpd_present = false;
 			break;
+		case ALS_IDX:
+			privdata->dev_en.is_als_present = false;
+			break;
 		}
 
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
@@ -188,6 +191,9 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 			case HPD_IDX:
 				privdata->dev_en.is_hpd_present = true;
 				break;
+			case ALS_IDX:
+				privdata->dev_en.is_als_present = true;
+				break;
 			}
 		}
 		dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 197b828fc6a0..ae36312bc236 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -103,12 +103,34 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	return 0;
 }
 
+static int amd_sfh_als_info(u32 *ambient_light)
+{
+	struct sfh_als_data als_data;
+	void __iomem *sensoraddr;
+
+	if (!ambient_light)
+		return -EINVAL;
+
+	if (!emp2 || !emp2->dev_en.is_als_present)
+		return -ENODEV;
+
+	sensoraddr = emp2->vsbase +
+		(ALS_IDX * SENSOR_DATA_MEM_SIZE_DEFAULT) +
+		OFFSET_SENSOR_DATA_DEFAULT;
+	memcpy_fromio(&als_data, sensoraddr, sizeof(struct sfh_als_data));
+	*ambient_light = amd_sfh_float_to_int(als_data.lux);
+
+	return 0;
+}
+
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
 {
 	if (sfh_info) {
 		switch (op) {
 		case MT_HPD:
 			return amd_sfh_hpd_info(&sfh_info->user_present);
+		case MT_ALS:
+			return amd_sfh_als_info(&sfh_info->ambient_light);
 		}
 	}
 	return -EINVAL;
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index 5b6d29d36922..b4f818205216 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -17,9 +17,11 @@
 /**
  * enum sfh_message_type - Query the SFH message type
  * @MT_HPD: Message ID to know the Human presence info from MP2 FW
+ * @MT_ALS: Message ID to know the Ambient light info from MP2 FW
  */
 enum sfh_message_type {
 	MT_HPD,
+	MT_ALS,
 };
 
 /**
@@ -36,9 +38,11 @@ enum sfh_hpd_info {
 
 /**
  * struct amd_sfh_info - get HPD sensor info from MP2 FW
+ * @ambient_light: Populates the ambient light information
  * @user_present: Populates the user presence information
  */
 struct amd_sfh_info {
+	u32 ambient_light;
 	u8 user_present;
 };
 
-- 
2.25.1


