Return-Path: <linux-input+bounces-8516-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3059EEB0B
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8509B282F83
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB40212B0F;
	Thu, 12 Dec 2024 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mpLdkQEB"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2080.outbound.protection.outlook.com [40.107.100.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835062153F4;
	Thu, 12 Dec 2024 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016850; cv=fail; b=K/RztCKl1sqtOwCAH0+dQkctq/5/6yYoSf232nLBZIoatNPScieaQZRsNfIc1sx5Zz90FLgsWz0LQmtkiQ9t8iPtUjdxzCtXmgQgzA5gSn9rWmgKhMIw0Y/EWRGNEdvT80Sm4D8PB3fjNXq/dT+o0tZnaA2vhyYB8JKYZ5eubw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016850; c=relaxed/simple;
	bh=bmX15nHPHF/ZTDkcV4V1I9Sbm4GLU5gq2joursWBwmY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dSwfjExp+ywRWunJJfdL99afO+14x1MSSlvDcfoIHNB3kntGMh8H32TEFGtbp2NSLn67I3Oy8Bv/JaoRnZ3ZTnQKkgooo/78qWiRSXQ58sIbhi6J01cKfaHwR7WvkGAL/dq8lyLfyoqmgvovMt1aQQJYPHfl5i+OIdNKRbbDf/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mpLdkQEB; arc=fail smtp.client-ip=40.107.100.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gpkkuqcAempLvzsbn1ucQgs10Uv7wkRX63GgnkQjygiHcA6HhPBKsQKQmxPLIRc1Q75FLi87otf8T6s31xzsygnMDIbF8OwSmxiU3SbbqLV4/BjYYrMSkinHWNUUntnw6x6Z6EwC5T132r4M4hOVc9JbVMXMtPQyuWe/QiVtcrSHOHPD2qwotTO4wqGVWV6Vfqx93lHDV4jYF7bfHP6oXqbASSoLbFxzVr7ZKz9V4163Xm9s6hMm/GkjJqV8aTjYTWYQ0yGpiWipzxVQb0wAsXBUnNve4VTzSt3EPMG404+ozx9mc1jB1Cq7LL75tRISU18QHO/YRMReDdRq0WU0jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlLegNb950AoLQfG9LuDP1NE1O01fxFIiCpLKmqK6J4=;
 b=Ml9+xzGMf+Ay6uSF3tnSwjQln2Ok4RSwCC/9PhDJv4CwCNH3My500R53l6y2HxKK2GWr7zKjIOSx69qNcx+iJewO15Xapeuqec17jGe7pToNo8ZRXtQ8kVL57xgHyiM6I2inuS9czHMAMewTjjuTUayqZ9xx0V0NfzL75omd5UQsJGuADAe8JGSOlOzfAUlQyjrOdEmwnTTL/obdAqqcPrh47ufw/FIld4Tgt5qkDYBeC9/VZox9uKhmbYtJLuSiNJ41mL4gA+A5IU8aoxrRXI5Nxy9Cy9Ie3tc6ki/8ata3J90regvWNqKkLo3J0dM0uSzXolN8DXhChyXw30dsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlLegNb950AoLQfG9LuDP1NE1O01fxFIiCpLKmqK6J4=;
 b=mpLdkQEBKTm1sS2XaMM/ZjcS4bX/fRxNwupbhN9mNYEvA7Jof3UroERJ5Z3c0Hm4eTlDv/gq6jFjiDIjH9R0u8ffLgd8uXyxdlQqhWjkgob9vYzqU4kGp5R1ejPcOrsRPrZSCERCj400Gmbtxznuf2TDVfbJ6hi7taqdQMhA7Nk=
Received: from SJ0PR05CA0082.namprd05.prod.outlook.com (2603:10b6:a03:332::27)
 by PH7PR12MB5688.namprd12.prod.outlook.com (2603:10b6:510:130::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 15:20:44 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:332:cafe::1) by SJ0PR05CA0082.outlook.office365.com
 (2603:10b6:a03:332::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15 via Frontend Transport; Thu,
 12 Dec 2024 15:20:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 15:20:44 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 09:20:40 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>, Patil Rajesh Reddy <patreddy@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, Patil Rajesh Reddy
	<Patil.Reddy@amd.com>
Subject: [PATCH 2/2] platform/x86/amd/pmf: Get SRA sensor data from AMD SFH driver
Date: Thu, 12 Dec 2024 20:49:51 +0530
Message-ID: <20241212151951.1922544-3-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|PH7PR12MB5688:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ce9b25-aa38-41b2-de4e-08dd1ac08c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jpqlcIP1KZWn49X/cpQL1yhz+T1loyVY8XUT6BljFVOuJ9riqxk0APi57pMz?=
 =?us-ascii?Q?ovJNlcmomaI5HZQRWOcySV6MqiDuEvO5kkICUlOsUUrPeBs2VJ7YASXVRi8R?=
 =?us-ascii?Q?p/DyF4qABhXHUg0kw8IEe0D0MC6ERggywzcI/ich7t+smSxVaVHe1+G8XXd5?=
 =?us-ascii?Q?ix8IuLuCHQjML+ZVywlLBpVZTlfXXTsBHeVmsKOqrd51NPgwyjrgbcD4pVz3?=
 =?us-ascii?Q?05Ba2sLSOKd5t+JGKy2MYZI7Km+F3w7tQb9LaFX4i0G5k9ikW1fTjUFrqADN?=
 =?us-ascii?Q?cvnO7xHy0TykD9B1IqRtraBeOqpnRCDrgur31L/lmVPSFb+ZmmqO+R/TCm3u?=
 =?us-ascii?Q?4a8hY/tKERnC92CC2PMZ7ZopkAP5nu97J4s9CEM5vyNaEm6qerP30IqadI6E?=
 =?us-ascii?Q?P4Z9UQZIYoyrZIxS8OG+rqKGx5YlwFejh5q2MrlMiYcwGd4TxC8zKxIjShxD?=
 =?us-ascii?Q?xm9eJMauZ44kTnIiJoxvPuYk1mDQVY3JqIa/NoVU+G5xbJaE/NevNEdv6G5Q?=
 =?us-ascii?Q?Ee7oVvyhSMrU17d+LBOwfF9jfmkZrJjbg33UNSg6tlQgfNuxRWR0cY/nmeuX?=
 =?us-ascii?Q?g9cHEYt9CSuMGd4Duu1HHMzh7Ku4fNr6CdljYpdogHBbg/j9aUVVt/keJyD3?=
 =?us-ascii?Q?nh6eAKF7oQljjAflxppk38RlQhvVOzzyhI3b6Q7VENrc8BzW0xvC5xhLPsOs?=
 =?us-ascii?Q?ZVo14QVem1aIrbLmhxhqkf9eqZFK79/geGSagrckLQvctRrziLc/0pz8AGI2?=
 =?us-ascii?Q?V70PQaeGs13416dy+e9OE7DdUBbTnY+2qtE4zcACwqugDFKaIUk6kbHV7qy9?=
 =?us-ascii?Q?yqEGjn5N/DsDp6PKk7/JSPF2No97tmd63nM3rPxIDe7w/eJbRIEUt0gtTSZH?=
 =?us-ascii?Q?/CKYbW8lf8Ad4dHKLmgOHXkwCnkphHIGglLgEtFrAfBKSpAUmdFZnBgWNcM1?=
 =?us-ascii?Q?OmCjDnLcq1Sx+x1OXFtYyLBp30MMFRw7PYHmEON8MZLs6oMH82bgQsD8Islk?=
 =?us-ascii?Q?CRxLH/26sH/DUBLKPtPOyCmJMcfNb1pSlcZQCcpMFDY+vySdpVf712cIVc7B?=
 =?us-ascii?Q?sT2IJHGi5uml2fixhvPdnsQ0Pzj7JJ/U1wGUIcZQzOjNqg+q4L7JVOYprPYz?=
 =?us-ascii?Q?i9sJ/eXKV7k/Gi+f+gfuPmFIHgrOa+7Hpwj8d6Pe93PzYsGw0WbQmpfk55WU?=
 =?us-ascii?Q?unEYJCnuqBEZNyZ463A+arfCoa0UD0TrzN9/yQxKKJl+BdvQ9Z/fXHWl+4RB?=
 =?us-ascii?Q?rwaSbSLVCT0A3HaBeQuiEeJaKi3yDTSF5HAAN5xOhGy6HN7RIxkL2owIQZPq?=
 =?us-ascii?Q?SWbpWmgMTKTLuqeF1yZFTbeg1XCm7da3QdILeOewUJgRq2eLwxDXSUFdfUSF?=
 =?us-ascii?Q?TAgNvXHTvcVvEeAXAvVoTOkii0itog77TSk+xqbA4wUTdt3zE3ahZQFcNoy+?=
 =?us-ascii?Q?VW+owTwNQoyuF7yaX2NDRUuMgQiRcZG7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:20:44.2256
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ce9b25-aa38-41b2-de4e-08dd1ac08c31
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5688

The AMD SFH driver includes APIs to export SRA sensor data. This data is
utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
enabling the AMD PMF driver to implement the output actions specified by
the PMF TA.

Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
 drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index a79808fda1d8..c343eaa84755 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -616,6 +616,20 @@ enum ta_slider {
 	TA_MAX,
 };
 
+enum platform_type {
+	PTYPE_UNKNOWN = 0,
+	LID_CLOSE,
+	CLAMSHELL,
+	FLAT,
+	TENT,
+	STAND,
+	TABLET,
+	BOOK,
+	PRESENTATION,
+	PULL_FWD,
+	PTYPE_INVALID = 0Xf,
+};
+
 /* Command ids for TA communication */
 enum ta_pmf_command {
 	TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
@@ -667,7 +681,9 @@ struct ta_pmf_condition_info {
 	u32 device_state;
 	u32 socket_power;
 	u32 skin_temperature;
-	u32 rsvd3[5];
+	u32 rsvd3[2];
+	u32 platform_type;
+	u32 rsvd3_1[2];
 	u32 ambient_light;
 	u32 length;
 	u32 avg_c0residency;
diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
index 06226eb0eab3..d5f764e624b4 100644
--- a/drivers/platform/x86/amd/pmf/spc.c
+++ b/drivers/platform/x86/amd/pmf/spc.c
@@ -16,6 +16,46 @@
 #include "pmf.h"
 
 #ifdef CONFIG_AMD_PMF_DEBUG
+static const char *platform_type_as_str(u16 platform_type)
+{
+	switch (platform_type) {
+	case CLAMSHELL:
+		return "CLAMSHELL";
+	case FLAT:
+		return "FLAT";
+	case TENT:
+		return "TENT";
+	case STAND:
+		return "STAND";
+	case TABLET:
+		return "TABLET";
+	case BOOK:
+		return "BOOK";
+	case PRESENTATION:
+		return "PRESENTATION";
+	case PULL_FWD:
+		return "PULL_FWD";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static const char *laptop_placement_as_str(u16 device_state)
+{
+	switch (device_state) {
+	case ON_TABLE:
+		return "ON_TABLE";
+	case ON_LAP_MOTION:
+		return "ON_LAP_MOTION";
+	case IN_BAG:
+		return "IN_BAG";
+	case OUT_OF_BAG:
+		return "OUT_OF_BAG";
+	default:
+		return "UNKNOWN";
+	}
+}
+
 static const char *ta_slider_as_str(unsigned int state)
 {
 	switch (state) {
@@ -47,6 +87,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
 	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
 	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
 	dev_dbg(dev->dev, "Ambient Light: %d\n", in->ev_info.ambient_light);
+	dev_dbg(dev->dev, "Platform type: %s\n", platform_type_as_str(in->ev_info.platform_type));
+	dev_dbg(dev->dev, "Laptop placement: %s\n",
+		laptop_placement_as_str(in->ev_info.device_state));
 	dev_dbg(dev->dev, "==== TA inputs END ====\n");
 }
 #else
@@ -190,6 +233,14 @@ static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact
 	} else {
 		dev_dbg(dev->dev, "HPD is not enabled/detected\n");
 	}
+
+	/* Get SRA (Secondary Accelerometer) data */
+	if (!amd_get_sfh_info(&sfh_info, MT_SRA)) {
+		in->ev_info.platform_type = sfh_info.platform_type;
+		in->ev_info.device_state = sfh_info.laptop_placement;
+	} else {
+		dev_dbg(dev->dev, "SRA is not enabled/detected\n");
+	}
 }
 
 void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
-- 
2.34.1


