Return-Path: <linux-input+bounces-109-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916B7EED5F
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 09:12:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E4AA1F26221
	for <lists+linux-input@lfdr.de>; Fri, 17 Nov 2023 08:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFC6FBFF;
	Fri, 17 Nov 2023 08:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UV8cPbkd"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB4CA8;
	Fri, 17 Nov 2023 00:12:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kJZZNlhjdy9pe0/qBhIY2aez5KOnAjefK7aGrxh8k04ESLoRiUH7Su27Z6Otx9FsL9Yke/QRNHx1tfyMFw4FaCkVxl7kNMxD/dV7HVnY6Ro9hzvYRO9OdH7g8NxUiQ9BmCO4stKfGavfs4DcgfJUy20mdooqhsT0fLN327XWT4Bojtzymk4b0HX2aYemXNs2SjbqOtu3Y8fJK/bfIYgJIP+4RO6eP7JlWJtNAr13Zfc+S9z3NTnXKA1K9ZABvFGOJFcuozETV3xSPLeqeEHF1x1pSpwdHGFnf6TOeVQCee5Y+y0JLdR0Ip4CeqCZ4sRRi2kQQht2yikXq0NwaZZGeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/gNBF+Jvc2ufk4jTE6/azAWDm7AC6HfTrrGr/sHIxw=;
 b=Da/gPhh1tv3t/NEN5arLpdaxV2Pm+aFVWkPpwSWtnniihIpOTxcjofxp43JWVxBcs9HiEIcSRUKCpM8tFH0TPd9oQF7l6oW+8xZUpIYGHtQ16TOw48CZsdBcDxbeZSj5Sn2SCdg81eyVkhC9fhN2kekYbdHG3QvbASSiAmo0BLcASjFFRrYR6V+AP/J4+NUu6uoTcVQNs+N5inWN+0gbt+UGxDD6TdryQYdxVQY7sdqKsWZ/FrSjpMpL9HAfQWHSgxl+J26AuKe1uFiGG+xY+TkDV7f2P6w+6BzL3NGsWf/sYz9ux0LDjNTxTOq2o8m4UJ0qRDcPgoO5D3BY5B0GTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/gNBF+Jvc2ufk4jTE6/azAWDm7AC6HfTrrGr/sHIxw=;
 b=UV8cPbkdeviRl1BbjQ9+S6u3E8my7V66ZeCG+sBqOXAH3cR6XarCwQk3CR7gUPY1cz9IRSCVzUPLS6hM7altO7N5e13kVhUSweObQGdU/0G1UOZlN3XQneevoGhJBZ0JMF4WatiDsdT716pmFBESecFMFSkBEd6/f1Amm+l1060=
Received: from SA1PR03CA0009.namprd03.prod.outlook.com (2603:10b6:806:2d3::20)
 by LV2PR12MB5941.namprd12.prod.outlook.com (2603:10b6:408:172::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Fri, 17 Nov
 2023 08:12:47 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:2d3:cafe::5f) by SA1PR03CA0009.outlook.office365.com
 (2603:10b6:806:2d3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23 via Frontend
 Transport; Fri, 17 Nov 2023 08:12:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 17 Nov 2023 08:12:46 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 17 Nov
 2023 02:12:35 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
	<ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
	<jikos@kernel.org>, <benjamin.tissoires@redhat.com>
CC: <Patil.Reddy@amd.com>, <mario.limonciello@amd.com>,
	<platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K
	<Shyam-sundar.S-k@amd.com>
Subject: [PATCH v5 17/17] platform/x86/amd/pmf: Add PMF-AMDSFH interface for ALS
Date: Fri, 17 Nov 2023 13:37:47 +0530
Message-ID: <20231117080747.3643990-18-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|LV2PR12MB5941:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b7e894-6d2b-4f44-a855-08dbe744fbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/rPeHLiZjNe3fdmsiyTfBVn8PiPlHpYDSc+40VluUgXFFtfRgmhAsjr8DLONPs6xBCShuc9/midBh+/vpCnorL7pEEsJwnelQ2TH0zreqb5j1h6yPIPcmweSFZ7muxCtny2wjOvRbdCrspXN+fNFjFXgYToLiNfZ4T/kIfdK/1quMk+T9M3hxwBPZuk9GTJesh6eQiXN+7LI3W/+C7bGqvQ98OliLreGRoY+CXKj1D/M3Sl0IiJXBqQ6ERWS2OkYjUDU0Z+74wGkY/HfQsgVzGOyV547TFeavm1HPop7xTT6sPuCQf1LkC+e3L/uIcoV5ZE+EmMCPKJpSUhlqcvo/Ts0jxHUEfSgVcgJlTocKqQg2N3AITjV6WWhqJkIAQWO2FWWs8ckmsfS6I4SRKTQsiUIxjt0LP+A0Pd891iWaRyLipNxha860X6+DadQE6FHzqP/S8U1KlH8CqtXxxObPo6Ga/VqhGeOpuzAzD5baNKcLCZ943kRrU5RX/N3zWq+cucsyBF1Sc4hzhuh0shLL4OASAlUFRXqp5W+befl4m0EqP3Afuxfw7IKjpN1IjDYRaIHhChLXm/gS/93O0NH5hS1/oiU/jjunL2ZIs8ZQTBhIQ2cVwKS9VjjPEXAFytktl/umYzElqtYYoGS4w3cTV1Bfkqa6NdUyS8i8xGVwEoBncCMFcWb2R4p78GmO5kD4mnkR6IqQhls4JooiUrLd7SDcV9LPvJ8M0wAy0qZs450EJ6IAHfVrXa2L9Kk/pxeiWVGCHDUsLVkfenRjCgtw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(46966006)(36840700001)(40470700004)(6666004)(16526019)(40480700001)(7696005)(1076003)(8676002)(8936002)(86362001)(4326008)(26005)(478600001)(2906002)(82740400003)(54906003)(70586007)(70206006)(316002)(2616005)(5660300002)(110136005)(41300700001)(36860700001)(336012)(83380400001)(356005)(81166007)(36756003)(426003)(47076005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2023 08:12:46.9604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b7e894-6d2b-4f44-a855-08dbe744fbbb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5941

From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>

AMDSFH has information about the Ambient light via the Ambient
Light Sensor (ALS) which is part of the AMD sensor fusion hub.
Add PMF and AMDSFH interface to get this information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  6 ++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 19 +++++++++++++++++++
 drivers/platform/x86/amd/pmf/spc.c            |  9 ++++++++-
 include/linux/amd-pmf-io.h                    |  4 ++++
 5 files changed, 38 insertions(+), 1 deletion(-)

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
index 3dc652d41d7d..f2890d329459 100644
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
index c0f31efe4927..0ae087d5bc44 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -94,12 +94,31 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	return 0;
 }
 
+static int amd_sfh_als_info(u32 *ambient_light)
+{
+	struct sfh_als_data als_data;
+	void __iomem *sensoraddr;
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
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 7f63973ab40e..07f6bd238aa2 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -51,6 +51,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 			"Connected" : "disconnected/unknown");
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
+	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -190,8 +191,14 @@ static void amd_pmf_get_gpu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_ta
 static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
 {
 	struct amd_sfh_info sfh_info;
+	int ret;
 
-	/* get HPD data */
+	/* Get ALS data */
+	ret = amd_get_sfh_info(&sfh_info, MT_ALS);
+	if (!ret)
+		in->ev_info.ambient_light = sfh_info.ambient_light;
+
+	/* Get HPD data */
 	amd_get_sfh_info(&sfh_info, MT_HPD);
 	switch (sfh_info.user_present) {
 	case SFH_NOT_DETECTED:
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


