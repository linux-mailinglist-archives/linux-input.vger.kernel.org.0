Return-Path: <linux-input+bounces-12594-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12BAC4CC5
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 13:11:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DD213BF22E
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 11:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BD4254AF3;
	Tue, 27 May 2025 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JrWPQu++"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F23216D9C2
	for <linux-input@vger.kernel.org>; Tue, 27 May 2025 11:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748344278; cv=fail; b=j84o3Mokh5hugTIVJLdd+j+LM5xvOkpKBCXiKOC9RKLWlOxSlodza2F8P17L3wVh/dflGmJyzFGK82maqniUg45d606eEAPnlmKgOxadjraD0BAt8I6YHLXsf3Acci04gUrrH7+v1f4vqhN4+7uCFOAOV+T0I/I4AOfWRVTSKK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748344278; c=relaxed/simple;
	bh=O5Cva5XDBg3B3mjm8RJtUjR8IfaIZP87YWtkOtzUZns=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VC9WBScZEFGHRol5murTgG3oX89DGUE4SHUbwnzOydLjijVCbFnGU5paW8QUYy4IRtiShZKQN9XJn5jii+1Nj/FgtnaG1+JRta1RWjr54wpRPhyrj2Xtz+PCVgLluXgNwO37UTZPZe5aIvOaabxlSqxHE0OzXARTtNrpPIDW0dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JrWPQu++; arc=fail smtp.client-ip=40.107.101.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FD8CmEd+EslY1T/jZE1O7RroKdydhsKjrsRfPMI+M3bsbSYd0CfLG8eCjmJB6uZyJk4j1KDddkGZpiorydz4wwS1IPFrYZIzWuw+w3aBGsXepEHLYH6omFcVvDJ1ESud/kUNzNsXt4Ktxfn5fZrx12gJKb5Biw3Tky4X6FmMDVCNeG/GTLi5FmTRAD9tzgJFTTseR0kRBjSepLIQ/6T3zYQE1dYi9bhHfL35lc/azhIBrttKUNXwrxP6IYLFg8Y456eWwwE2maQlrNm9MyOobAYFbUp3u5X+rVADkXgcrCO/IqoJ3JOCJnErW0OHtBQYa4LVt9niUc8QQLWqTLg1iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ae4x1qPyH7wWjEwDvfnDN9Ky1SXKrTU+VcEtrM0tfH8=;
 b=WyrFr3T9X3A7k+0bO1T1y39iG0RqPz/sE65oOmA2ZM9EFsKh4n5D2SiS8ZKLF/0XkPbTbJOTiwyJxcljMpJHwRunU8guRjgmJ6b1hb4L5tVEU4eyUR0pnPGAi0eeW0329F5HleBKUuGe1IqfvPxL4edTZ2BxRB0JuaN4Uo4kvSR23dVvUx2WdR5UaCt06KZYLkS3/7LmjMW6dckf6+miSVCfssAPJHmzEVVHkHYtBs3EcMtyMNsjp4EYy4nh2A+8SYu1FiRO9hc60LF4J5cR/UTr2nXv9JYRq04gNbHGVUU8fWVKbjzw1FHoMfJiv/7PpyYp3XOu8eO1wCKzvH2GFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ae4x1qPyH7wWjEwDvfnDN9Ky1SXKrTU+VcEtrM0tfH8=;
 b=JrWPQu++Gz7+Srkbx3AZGODUY2vdXdil/yWpDN7+05HXwom/MLcxP/gW37G3U/ZU+DAXb34TBXDbMHwyDhtg6K4j+QAgPOOi3mRUtVosepxpQK7B9td46PsAKWruM8tVuN9/TV7/lmyWtW1dsdbSIYd96W8FLorBQ62hQ3CZh3U=
Received: from BYAPR21CA0015.namprd21.prod.outlook.com (2603:10b6:a03:114::25)
 by DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 27 May
 2025 11:11:12 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:a03:114:cafe::de) by BYAPR21CA0015.outlook.office365.com
 (2603:10b6:a03:114::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.12 via Frontend Transport; Tue,
 27 May 2025 11:11:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 11:11:11 +0000
Received: from airavat.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 06:11:09 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>
CC: <linux-input@vger.kernel.org>, Basavaraj Natikar
	<Basavaraj.Natikar@amd.com>, Akshata MukundShetty
	<akshata.mukundshetty@amd.com>
Subject: [PATCH] HID: amd_sfh: Enable operating mode
Date: Tue, 27 May 2025 16:40:47 +0530
Message-ID: <20250527111047.920622-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f1f11c3-ca78-4314-8ebb-08dd9d0f3080
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OumgVv6vIcsN5u2RvuC4LceLuzUVFRigfAM2xrMN0ZchYpnQfsKf3b9UKWgV?=
 =?us-ascii?Q?DWWcujx8ruF3SCeUOcxbF6aVUGop6vEEG/SeWk7bmGMdt6/YN2YKZWPLasxm?=
 =?us-ascii?Q?ZmDvxvfMV4DNNqWt6uutIxlqHLyJIObIMIIGxj9nD46pvJfdzcLwFeeB3JEF?=
 =?us-ascii?Q?aDPIVyKYRhBynRG7AkV8AZ5CCzj9PDzCFj4YcYc/+1GvZWABj5M1yEG9A1vk?=
 =?us-ascii?Q?/5Wzz10HcQmTgXP6mQuJAAAZewAgbc2qd5/qM+kxuNFnFsx5C1mouRgLLqQh?=
 =?us-ascii?Q?Ub8cpobI4g2K3w0TaTDm/V1oBTjA3TB56NsH1LJwzD1r+e4xIzZKVFc8vyJq?=
 =?us-ascii?Q?kIl5IVu3WlULXqbSlXRI+9Bqax5bNVgt03HE1Vm0ep+zDg1uWntrGc91tmsv?=
 =?us-ascii?Q?+zQVGZl0bCc+AUhrituLIfudUvi2N+UfrbVjGgx+kPzNVzu+Ko5CovUkMsLk?=
 =?us-ascii?Q?zEK6e1uo9MQZZEim6Q2r75MeAuanPkgxQ3MAMGaGutYT7rDK0CqaBLhVz1Wz?=
 =?us-ascii?Q?ceCxHR4lbzrTXWm2I4s36yOtXJpCCKu/q+dEgYl4pxilEHdIk2lnts3COGhv?=
 =?us-ascii?Q?zxB67w2nP42Dz+P7Brw7Pjmbxnt4GH0fruSCxzns3RPAG9mVJFKnUAwIm8Ql?=
 =?us-ascii?Q?9wAwI2F+6dgbAl+XMZJ+vkv+1lAx8LcpHmny+aNQ1utlMtSQZBLjCmrEtej7?=
 =?us-ascii?Q?3K8Yz5baUZPGaQnDsgvMzrQl0OFalTeBzFjcoZQCKI6/q5StrCAQPaI8Rg4G?=
 =?us-ascii?Q?rw4ZkhC4JTcR+psOuhvZeycBYRYw7ppKctS6Wy4OG1Csn9APO9HIMWBO5mvT?=
 =?us-ascii?Q?QQvEFWnZe7UQBCvNNBvckgOdG9YjDeThiwwmHgRSPLzb7DUCsgzSZsqxYZf+?=
 =?us-ascii?Q?gkr8A5B/9GeVZk7tWRCb0Eaw/BT2JuPq/a1BYrDl4n1D58HAhbshJldUBZUu?=
 =?us-ascii?Q?+BAolOoOWqqvyFDBt+9nagkPk8tm5S0Lf0stAnXIHYPHL0K1xq0CyBskmXav?=
 =?us-ascii?Q?mk3Ykyg2zNK3SpRA+yJQMcseXtwvepOYQmTW3k/rr6HXOKT0qHkVxMyqgA1G?=
 =?us-ascii?Q?hhhacTORU03vB1AlFwm2/T+DjpUJKUggHi19wLPq5/62WrSvhgRJxzU22CkZ?=
 =?us-ascii?Q?GhZi2C6F3Q4SDv7ANzpp5e7K5Lw3hvBn8fqzE5m14aVN5y0q0t56YK44I8TV?=
 =?us-ascii?Q?vEyLF/KQWTnDBHwuzkOE/ob//i0vHanXgMO/V9Au3DJaC6oTBo3eT2LOaSov?=
 =?us-ascii?Q?qRbhraTQZDD+AMFirLGV0ckmMEg/duC6JPOp2sqmzPc9YeTXzBxrRsH9G20D?=
 =?us-ascii?Q?2cuvKd4bdB35oRAbWz2guLU1GwhjAESLLdo0hx4k/n8En8qEocZn9muDVa27?=
 =?us-ascii?Q?GiLwdgWkH8q6mheli2tDhWxoQqIdR05DymfTY0zZAsRgysJF7YTsrOssHM7N?=
 =?us-ascii?Q?FuLtfnBZnjQAp5nHOtw/cwCGwnQTn3w4y3UkQZDHnzlKUUK8cr9HOukWuTO6?=
 =?us-ascii?Q?jB9zVmN7Kg6R9/k2m3kB7AwA/l/ykSbUqMhd?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 11:11:11.9288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f1f11c3-ca78-4314-8ebb-08dd9d0f3080
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582

Add changes to enable operating modes in the driver to allow the FW to
activate and retrieve data from relevant sensors. This enables the FW to
take necessary actions based on the operating modes.

Co-developed-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Akshata MukundShetty <akshata.mukundshetty@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 23 +++++++++++++++++++++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.c   |  4 ++++
 drivers/hid/amd-sfh-hid/amd_sfh_pcie.h   |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 3438d392920f..0f2cbae39b2b 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -146,6 +146,8 @@ static const char *get_sensor_name(int idx)
 		return "gyroscope";
 	case mag_idx:
 		return "magnetometer";
+	case op_idx:
+		return "operating-mode";
 	case als_idx:
 	case ACS_IDX: /* ambient color sensor */
 		return "ALS";
@@ -243,6 +245,20 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			rc = -ENOMEM;
 			goto cleanup;
 		}
+
+		if (cl_data->sensor_idx[i] == op_idx) {
+			info.period = AMD_SFH_IDLE_LOOP;
+			info.sensor_idx = cl_data->sensor_idx[i];
+			info.dma_address = cl_data->sensor_dma_addr[i];
+			mp2_ops->start(privdata, info);
+			cl_data->sensor_sts[i] = amd_sfh_wait_for_response(privdata,
+									   cl_data->sensor_idx[i],
+									   SENSOR_ENABLED);
+			if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
+				cl_data->is_any_sensor_enabled = true;
+			continue;
+		}
+
 		cl_data->sensor_sts[i] = SENSOR_DISABLED;
 		cl_data->sensor_requested_cnt[i] = 0;
 		cl_data->cur_hid_dev = i;
@@ -303,6 +319,13 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->cur_hid_dev = i;
+		if (cl_data->sensor_idx[i] == op_idx) {
+			dev_dbg(dev, "sid 0x%x (%s) status 0x%x\n",
+				cl_data->sensor_idx[i], get_sensor_name(cl_data->sensor_idx[i]),
+				cl_data->sensor_sts[i]);
+			continue;
+		}
+
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
index 1c1fd63330c9..2983af969579 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.c
@@ -29,6 +29,7 @@
 #define ACEL_EN		BIT(0)
 #define GYRO_EN		BIT(1)
 #define MAGNO_EN	BIT(2)
+#define OP_EN		BIT(15)
 #define HPD_EN		BIT(16)
 #define ALS_EN		BIT(19)
 #define ACS_EN		BIT(22)
@@ -232,6 +233,9 @@ int amd_mp2_get_sensor_num(struct amd_mp2_dev *privdata, u8 *sensor_id)
 	if (MAGNO_EN & activestatus)
 		sensor_id[num_of_sensors++] = mag_idx;
 
+	if (OP_EN & activestatus)
+		sensor_id[num_of_sensors++] = op_idx;
+
 	if (ALS_EN & activestatus)
 		sensor_id[num_of_sensors++] = als_idx;
 
diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
index 05e400a4a83e..2eb61f4e8434 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_pcie.h
@@ -79,6 +79,7 @@ enum sensor_idx {
 	accel_idx = 0,
 	gyro_idx = 1,
 	mag_idx = 2,
+	op_idx = 15,
 	als_idx = 19
 };
 
-- 
2.34.1


