Return-Path: <linux-input+bounces-8515-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2779EEB7D
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 16:25:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D599188B234
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C47521578E;
	Thu, 12 Dec 2024 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rItxy8XV"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE3215764;
	Thu, 12 Dec 2024 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016848; cv=fail; b=HpnR5UIweUG8IfzMRShRO8T2MVty9iK2gljJBE5s+67Rr30GvZ9TGKDAfdoreh5SpekC1FV6alZEyJfAjom8O9NkH57DZi6ggTpOHKn+2xAbOpV4sNGbwKIQw9QtTAeirhGn2r30Sw3aQoJ3dDlxSbqPQtwBBNMAJH0i+QgzvBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016848; c=relaxed/simple;
	bh=OwqTJpl3P2PwX044nH1Um16oI/ToBQbeODepvxHG4OA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qISrg7OCHnJy1H1GtHheHs5W/Njw8DJDbqqSXjNfqCPcMOjK20J5061r2DdmBRfpjH/X6FO6gOdkK0z73niBZUGjwKdDxl+CoTIQSUyfusV/gVMN5RjH/GonBzI/cIJQvufXAj4pSUlwjlS/bjFasVN1OLJsoAiMC6OqQrSCnX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rItxy8XV; arc=fail smtp.client-ip=40.107.93.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HzwwNAzajizB0dyeji88VszNY0V9jZ9Ylfz0Bax1MTaeO7yOfhyVsV1hjJeiZ6l/J+AUkRvqTZENfama+1Ug8WzQ4473leTt0AZj8wNzswHpCo+KgHZsWN+qROYn0URQjTdE1Dt8UVziwFMHN8xwFTteYLOabWvDttkwmZ1HegVdOglj9kak6Eh8Sb9+6Y4pv1lFgzpt2pt2PMAGD+HtI6BscihOsMP/t95N1dS0x2SEMWazFRU45XKQZEkXN/PCHiBvI4ZVkHHTUfgNN8Jj60Dgi8Gz5jRI8rU4aEKCxY0WzxLLrrt0XHusPU+WsZdeJ6yxLYz51MzQxAYZ6KyslA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b8Emvjp7TdtDhzvquc+JAirhJXeaXRuEdg5AW+c5250=;
 b=V0QKcoL3OKItEKL8B9rAmDLTRwmFY9DWWLJpfHbU42Z3W41PkTlDdmYzX4C7zARQ6AA519nQqkbx6P3cTi6imQY+9WHy4avgwgDCoRcbRqOGPl2jGMxHQIx9SFrxQY6a3H+hAHPSnJPktW+FdgbhXWxwov1TL4h3wI2aPH4pYlOeOtLglAT4m+hke+9ZeYwn8JmUoik++NwiYFN1Fpa8c5+cX5vgcKrDFPkMof3yJZP89DtSA40bQsYPI79xerogbAwvAJyJjUFOvQoOXLdlfWxae6Iv/uoDcmFb7hw65fqKvqSX8LvfSSNKSbQSUeP59OAndISncjtCs6QwDmjElA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b8Emvjp7TdtDhzvquc+JAirhJXeaXRuEdg5AW+c5250=;
 b=rItxy8XV/JvRmB/Gl+ZmAr0TFunIpf6CmHf6nyY8DsOA6TTtAJqOvfY1nrOBocGxAifreBO8PfautlgVs3AqwOILQbQs4h1+iHD3M4oMOqBNsNRl+nvnGxr95DcSHNys+VgqcvGVX2e7VksAYHWXyVFDe0SuxbFYWb2+Tp139f8=
Received: from SJ0PR05CA0081.namprd05.prod.outlook.com (2603:10b6:a03:332::26)
 by SA1PR12MB7176.namprd12.prod.outlook.com (2603:10b6:806:2bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Thu, 12 Dec
 2024 15:20:41 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:332:cafe::c4) by SJ0PR05CA0081.outlook.office365.com
 (2603:10b6:a03:332::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.13 via Frontend Transport; Thu,
 12 Dec 2024 15:20:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Thu, 12 Dec 2024 15:20:40 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 09:20:37 -0600
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: Hans de Goede <hdegoede@redhat.com>, <ilpo.jarvinen@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>, Patil Rajesh Reddy <patreddy@amd.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-input@vger.kernel.org>
Subject: [PATCH 1/2] HID: amd_sfh: Add support to export device operating states
Date: Thu, 12 Dec 2024 20:49:50 +0530
Message-ID: <20241212151951.1922544-2-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|SA1PR12MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f66b4a3-7f83-4a2f-0b7e-08dd1ac08a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nv87ALcegVV52L3bRe94ACa98GHnm4iIKvY7wpmmDehxLFWfmeI37m8eA6Aa?=
 =?us-ascii?Q?Dz3V2AJO/2vQm1DKQ3wNofjOkTaHevT5u15oQfmhjoZYdWB+5cn2h8PFrorg?=
 =?us-ascii?Q?3sCNpWKP8fQpGxIKIKa5HcwivAtdtho6Fvk3bG+tde6vbiTpzXWxmJtAyXC8?=
 =?us-ascii?Q?EaNabUD2hfU1CS/h57n2lWwPoNjs+ndVE0UvDwp8wEfuEtLAcA+/fXzqA9AN?=
 =?us-ascii?Q?izvEwsSk9U27naw8Hgxp5YHk6hkEUGhXyOyp1FPdtYrfXDIBz6dtQ9hXiWxv?=
 =?us-ascii?Q?WhUyZ+cdYsGHyQWsi4s/ZUpBtaJLe+GrXdd8CbwESBibnKf9ZFpgZFF3qzNw?=
 =?us-ascii?Q?8XFbNj/nb5Np5wno9dyYZJCXw9vz/Oqy5pXw87JfoxVP/Mx9GhVxlBc4NfMd?=
 =?us-ascii?Q?rKu7BP0Q96yHFurg6JXxZT+zkKA999ISyb5brHXhQpED4ymQULhQBFzb0ZmM?=
 =?us-ascii?Q?C11K2fHEi72zsZuZe1VgZy3Sm8evc8WiGy4WfyLqw2vvgafV2AczJKAGHfFO?=
 =?us-ascii?Q?B5GbOeRWY1kBvRJfgAgPn+F6vvxx6Yfes7+14h6xSUmP3Rd2xLyZfxyA0U9C?=
 =?us-ascii?Q?SwaUSnK5zrTx2YBn8DjOS+jaCqV6uJ0SD3GOm3xIwj4BVa6JGFj64An3XkLV?=
 =?us-ascii?Q?p8HOpNc81NpA4SW10tzGd/xw+Jmxxl1HOvFBgAElNo4g+S3A+3X7aQXSBYZR?=
 =?us-ascii?Q?nfPF6OJnKlO48W6noVgFrGcEeiPbgf19TQH0ooyM84qqFwAMpBQYCjo8bgOE?=
 =?us-ascii?Q?CIRp3KsbzhY3997/9xB5dPw/JAnLasskDOvwUoQZ0kT83VCUdyuVo4xNFC37?=
 =?us-ascii?Q?i6MvYdkwaNEK69E41zYP8EtCUiCmqTK90e4f+pHncLpSWrJpyiAU6cDJ7UoR?=
 =?us-ascii?Q?CAAGE+9XxU5Q8E+gA6xZV5uva44grTYG8lEWnfxTSoc16dpoZOu0IduoH89w?=
 =?us-ascii?Q?hEvyJYPcjlLsR1tJpKlx+anhEF0BJ17L6Bc5xEzKG09KAIJTcZUeZT9Gk4Hj?=
 =?us-ascii?Q?0wrD/JVLRAtVsbF7Sniz17+JJNzKge2pEzEEZ38JZT4zAnWCemXxrPu+9sFi?=
 =?us-ascii?Q?gICm+Aza5vCTydYhqZolaOeqZtjhv25hLGcg3z9qJDFWyxBNFAxqjZnw+E0L?=
 =?us-ascii?Q?564DX6gcSmGcUtAWaOA0GCjZmJ1oU0yBMvoMBwDD5YiFdn2mCq+KYqLE35Zz?=
 =?us-ascii?Q?lo9h45zaw+puZvuDkNRLu94ASYcWe24gBhI+IwNOnO8cBodVFwy4O4sdB2Pk?=
 =?us-ascii?Q?wG1SIF4w+d7FSuXL/OWXYZeyj/Z5v9zMi/4ib18fW6bssQmZWrAZQwnlSvIU?=
 =?us-ascii?Q?3hHWJhHUZ0h+6OISmk9rTIlt5QYiIYFqTxE/eq09eRBI4mEOpnWmmCmnUQIg?=
 =?us-ascii?Q?MZ6nnaHAzE1T8MCjajnAgaE/7QduYtoKApBVokWd9Go0yRADjkvOiKQQGoVN?=
 =?us-ascii?Q?mYGpWtUEc+moKS8xDia7uYzY0A1fz3sM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 15:20:40.7725
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f66b4a3-7f83-4a2f-0b7e-08dd1ac08a17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7176

From: Basavaraj Natikar <basavaraj.natikar@amd.com>

Add support to export device operating states, such as laptop placement,
platform types and propagate this data to AMD PMF driver for use in
actions.

To retrieve the device operating states data, SRA sensor support need to
be enabled in AMD SFH driver. So add support to enable the SRA sensor.

Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <basavaraj.natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  1 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 22 ++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 35 +++++++++++++++++++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    | 20 +++++++++++
 include/linux/amd-pmf-io.h                    | 15 ++++++++
 5 files changed, 93 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_common.h b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
index e5620d7db569..799b8686a88a 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_common.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_common.h
@@ -43,6 +43,7 @@ struct amd_mp2_sensor_info {
 struct sfh_dev_status {
 	bool is_hpd_present;
 	bool is_als_present;
+	bool is_sra_present;
 };
 
 struct amd_mp2_dev {
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
index db36d87d5634..03c028f1aab4 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c
@@ -30,6 +30,7 @@ static int amd_sfh_get_sensor_num(struct amd_mp2_dev *mp2, u8 *sensor_id)
 		case ACCEL_IDX:
 		case GYRO_IDX:
 		case MAG_IDX:
+		case SRA_IDX:
 		case ALS_IDX:
 		case HPD_IDX:
 			if (BIT(i) & slist->sl.sensors)
@@ -58,6 +59,8 @@ static const char *get_sensor_name(int idx)
 		return "gyroscope";
 	case MAG_IDX:
 		return "magnetometer";
+	case SRA_IDX:
+		return "SRA";
 	case ALS_IDX:
 		return "ALS";
 	case HPD_IDX:
@@ -130,6 +133,23 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->sensor_sts[i] = SENSOR_DISABLED;
+
+		if (cl_data->num_hid_devices == 1 && cl_data->sensor_idx[0] == SRA_IDX)
+			break;
+
+		if (cl_data->sensor_idx[i] == SRA_IDX) {
+			info.sensor_idx = cl_data->sensor_idx[i];
+			writel(0, privdata->mmio + amd_get_p2c_val(privdata, 0));
+			mp2_ops->start(privdata, info);
+			status = amd_sfh_wait_for_response
+				(privdata, cl_data->sensor_idx[i], ENABLE_SENSOR);
+
+			cl_data->sensor_sts[i] = (status == 0) ? SENSOR_ENABLED : SENSOR_DISABLED;
+			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
+				privdata->dev_en.is_sra_present = true;
+			continue;
+		}
+
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
 		cl_idx = cl_data->sensor_idx[i];
@@ -181,6 +201,8 @@ static int amd_sfh1_1_hid_client_init(struct amd_mp2_dev *privdata)
 	}
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
+		if (cl_data->sensor_idx[i] == SRA_IDX)
+			continue;
 		cl_data->cur_hid_dev = i;
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			cl_data->is_any_sensor_enabled = true;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 4676f060da26..b4c0d96ab152 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -87,6 +87,38 @@ void sfh_interface_init(struct amd_mp2_dev *mp2)
 	emp2 = mp2;
 }
 
+static int amd_sfh_mode_info(u32 *platform_type, u32 *laptop_placement)
+{
+	struct sfh_op_mode mode;
+
+	if (!platform_type || !laptop_placement)
+		return -EINVAL;
+
+	if (!emp2 || !emp2->dev_en.is_sra_present)
+		return -ENODEV;
+
+	mode.val = readl(emp2->mmio + amd_get_c2p_val(emp2, 3));
+
+	*platform_type = mode.op_mode.devicemode;
+
+	if (mode.op_mode.ontablestate == 1)
+		*laptop_placement = ON_TABLE;
+	else if (mode.op_mode.ontablestate == 2)
+		*laptop_placement = ON_LAP_MOTION;
+	else if (mode.op_mode.inbagstate == 1)
+		*laptop_placement = IN_BAG;
+	else if (mode.op_mode.outbagstate == 1)
+		*laptop_placement = OUT_OF_BAG;
+	else if (mode.op_mode.ontablestate == 0 || mode.op_mode.inbagstate == 0 ||
+		 mode.op_mode.outbagstate == 0)
+		*laptop_placement = LP_UNKNOWN;
+	else if (mode.op_mode.ontablestate == 3 || mode.op_mode.inbagstate == 3 ||
+		 mode.op_mode.outbagstate == 3)
+		*laptop_placement = LP_UNDEFINED;
+
+	return 0;
+}
+
 static int amd_sfh_hpd_info(u8 *user_present)
 {
 	struct hpd_status hpdstatus;
@@ -131,6 +163,9 @@ int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
 			return amd_sfh_hpd_info(&sfh_info->user_present);
 		case MT_ALS:
 			return amd_sfh_als_info(&sfh_info->ambient_light);
+		case MT_SRA:
+			return amd_sfh_mode_info(&sfh_info->platform_type,
+						 &sfh_info->laptop_placement);
 		}
 	}
 	return -EINVAL;
diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
index 2c211d28764d..f7eb2539bccc 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.h
@@ -22,6 +22,7 @@ enum sensor_index {
 	ACCEL_IDX,
 	GYRO_IDX,
 	MAG_IDX,
+	SRA_IDX,
 	ALS_IDX = 4,
 	HPD_IDX = 5,
 	MAX_IDX = 15,
@@ -164,6 +165,25 @@ struct hpd_status {
 	};
 };
 
+struct sfh_op_mode {
+	union {
+		u32 val;
+		struct {
+			u32 mode		: 3;
+			u32 lidstatus		: 1;
+			u32 angle		: 10;
+			u32 inbagstatedbg	: 2;
+			u32 ontablestate	: 2;
+			u32 inbagstate		: 2;
+			u32 outbagstate		: 2;
+			u32 inbagmlcstate	: 1;
+			u32 powerstate		: 2;
+			u32 data		: 3;
+			u32 devicemode		: 4;
+		} op_mode;
+	};
+};
+
 void sfh_interface_init(struct amd_mp2_dev *mp2);
 void sfh_deinit_emp2(void);
 void amd_sfh1_1_set_desc_ops(struct amd_mp2_ops *mp2_ops);
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index b4f818205216..01f2b12c56a6 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -18,10 +18,12 @@
  * enum sfh_message_type - Query the SFH message type
  * @MT_HPD: Message ID to know the Human presence info from MP2 FW
  * @MT_ALS: Message ID to know the Ambient light info from MP2 FW
+ * @MT_SRA: Message ID to know the SRA data from MP2 FW
  */
 enum sfh_message_type {
 	MT_HPD,
 	MT_ALS,
+	MT_SRA,
 };
 
 /**
@@ -40,10 +42,23 @@ enum sfh_hpd_info {
  * struct amd_sfh_info - get HPD sensor info from MP2 FW
  * @ambient_light: Populates the ambient light information
  * @user_present: Populates the user presence information
+ * @platform_type: Operating modes (clmashell, flat, tent, etc.)
+ * @laptop_placement: Device states (ontable, onlap, outbag)
  */
 struct amd_sfh_info {
 	u32 ambient_light;
 	u8 user_present;
+	u32 platform_type;
+	u32 laptop_placement;
+};
+
+enum laptop_placement {
+	LP_UNKNOWN = 0,
+	ON_TABLE,
+	ON_LAP_MOTION,
+	IN_BAG,
+	OUT_OF_BAG,
+	LP_UNDEFINED,
 };
 
 int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op);
-- 
2.34.1


