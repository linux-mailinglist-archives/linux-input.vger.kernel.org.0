Return-Path: <linux-input+bounces-7211-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28549996E96
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 16:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC051F232C1
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2024 14:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9478B19FA93;
	Wed,  9 Oct 2024 14:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Y4INZYFO"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2044.outbound.protection.outlook.com [40.107.93.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D219E966
	for <linux-input@vger.kernel.org>; Wed,  9 Oct 2024 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485306; cv=fail; b=F82Br5pYtWzveyVpKhUxDbLd9THH/pN1vvJbMZJO6Ou28XZ8Cd7HWmQaRwheoUHFSykve9s4lnf03rHXLtgbPCY+VImBn3qj/J8j9RgeksMo9jkr12COa7+kobZqswI82T7wJqicxEK0QB9fNIOVwh5aYjSra5xzRlhqujdL/+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485306; c=relaxed/simple;
	bh=vo3x0gAHiKjgwoGtSXtfl6eMWwBclJoSty2airLZTX0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xpht/U3vORBx1AhjqTz5Wju9qOGyN75olYiDENope4L7MP8WDKtCL/YAWpozutuVJ2EK2Rk8nA5DCuapeEudBY2pxV0zBJDOlJvB3RCkyhvvSoCZNl1Qxp7srMKyh7H5Id6fPa3oKPnyQrC32n6GGH6PVp3YZBdMDwUzvx8YFhU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Y4INZYFO; arc=fail smtp.client-ip=40.107.93.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDofIVg4IYt0S0ZRUlbf0AmCYmryH7NYLS/K7Ky5lakUruBxubw5AkXWqniq9iE/9yGxgu7dteP2VebsABkdCyh78OiJn84wmxGmGxPX2jYpDVr33WCA+peJqxWCdExODLORrXAna95Gs98jnNq02wz9pzcERh8i0MP7sJTUNUoGIaY51ynywS71NZYvow/ZUQFD1a/WgUde9BSUSYXDgGecFQ+G0iPlhrZG2aAzvdLNF29kFWM8Qfk/fTmm+el2Atukr7NnpnAQZiRm/IrkK+lsKMjqN1sq1fGN8/uSKNvaKKd3vcmgI8I+pjgyBo20Rd7MxNzswO4AKvP9kb4i7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EsoDDPrw1f6yZ8jO17n+PamxX7ndgG7H7N8FRrtB2Jo=;
 b=SPUkV4UhZAAeR6qpbg2S53l7YKgGhPNempZY9utAFgvU9mc9/JYawPszsHrP/+t5lIul41bDfCa8+iNXCjqrOBjwKITqYqWKkamaq01iXp/z0AXjzb5xiCvByEB+eKr+u2QH9rn/YL2w000skE+Rhvr01Akf5hGey5+uiPC2eT/Wse8Aq1Pjw8ATY2RYZh67ToOLPCtaGERJL4umKLHQfNEayslTxKKmkJTA2pvYVuT2JvuE4avJSHcWikvPNrHjLt3uM09TSCnbif1zDBwxsrPOaFyqBkJ1hproAwCZWVkyXimJKl8JaPal6QIwO2fBXJ4riXSvgogAuaERb5T3fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EsoDDPrw1f6yZ8jO17n+PamxX7ndgG7H7N8FRrtB2Jo=;
 b=Y4INZYFObgBLkEVry6dNpG/3d+ou4Z4HjJXW+pVJ7WLeZB2vBOd2u6sbmb+3faBhJe1B5pHbX4OrDDB+k4GAhFGzU5q503MdMwt8z4KgeBFF6XZH76/xp3wJuwPwAw4PwMlwmTAVp0PYFOfBCNFB497rRjyzkhM7ocwZ5kbj0n0=
Received: from BN9PR03CA0652.namprd03.prod.outlook.com (2603:10b6:408:13b::27)
 by DS0PR12MB7876.namprd12.prod.outlook.com (2603:10b6:8:148::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24; Wed, 9 Oct
 2024 14:48:17 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:408:13b:cafe::77) by BN9PR03CA0652.outlook.office365.com
 (2603:10b6:408:13b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.24 via Frontend
 Transport; Wed, 9 Oct 2024 14:48:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Wed, 9 Oct 2024 14:48:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Oct
 2024 09:48:15 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <linux-input@vger.kernel.org>
CC: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Chris Hixon
	<linux-kernel-bugs@hixontech.com>, Richard <hobbes1069@gmail.com>, Skyler
	<skpu@pm.me>
Subject: [PATCH] HID: amd_sfh: Switch to device-managed dmam_alloc_coherent()
Date: Wed, 9 Oct 2024 20:17:57 +0530
Message-ID: <20241009144757.3577625-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DS0PR12MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 91fd4516-4e34-40ee-91eb-08dce8716948
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9f00ssHlw8D2JNBoXy208e6vk6UMGTSbzAFGtc++qPE+zso3eknpqohLedEs?=
 =?us-ascii?Q?Gd0kEl31LCilkMY+VG/fSSzZtQg9j0oQxVgoJjpWX2rRX8zU1gABpmBjClMl?=
 =?us-ascii?Q?nPZ34jr7M8pKOYX2h4CipdcGcLUF8iOfqAg1+Av5DVWct05XjhNYMnR/y9oO?=
 =?us-ascii?Q?yYQH2mVrX1/13L28RC1xyNLkgwmG8UrWE/LSUDt5jLrSNUfYOjzdYN2KcR5u?=
 =?us-ascii?Q?/wpWb/W3wONpDxe62IjFFKmLi4BHQL8TrM5RbPPdozGGS8MPVMVINNYdsneq?=
 =?us-ascii?Q?XVupyu9Km7PW7Fcl/eO+QxRMK3/K0L3QPIW3kmmJQYNP9z+LIB7sFge7/HR2?=
 =?us-ascii?Q?0r3t6VBK9ymwz80k35q4kKW/rflzqs3CaP+dtagN6RqxuQYwhTWP5gYf++yh?=
 =?us-ascii?Q?BxqgduuMOCHu/5RwDicUz2Vobm0cTBuIn5Tf3mfuMViKF83trwa/a/zRHDXE?=
 =?us-ascii?Q?0qGOT3cjAK0Dwr8AvTKuaFlAnnq633pemYyEG29YHcwkf2TVujOOS1+5zfK8?=
 =?us-ascii?Q?RGxK7M/Ojv5K6/TenZ1AiZD7/IGAnCd/8Bl1IleMuW4hhqjNiGuJyTN4uajB?=
 =?us-ascii?Q?jIH9pat4wvxN+6YR0Ty4jrdNPFGe6iniGUoV7SkW20M1zuUB6CdPP9VpNIWY?=
 =?us-ascii?Q?UfY2AO0SLSDIjx00l5sVrdoWEpSGlW1u2RaphJMx6/5ykp8U6FK/7795Y0y4?=
 =?us-ascii?Q?Pd9Wk8oqqIJhjA6XS9R1RC+xg658KsFIalHtkcqCAswW9t7JaD/hsI7+mhVt?=
 =?us-ascii?Q?Ns83GqAxGBJSjOGVYmNU6L+rHXiWWFccphtPEomONXRgnWSLIhvvtyK4q+Fl?=
 =?us-ascii?Q?SEpxbj210ne3UYNaTdKNVuLVnIdLt9J9nFkcXiWQyfEyc093mXZdh+Zkqho7?=
 =?us-ascii?Q?oBopbJqpwzjb7x2FE6ENpy6Zny2HeW7CVLEIuru59LfpbIkG/VVJZ0/qYd6D?=
 =?us-ascii?Q?/KfzleDh1kqs86Z9HjbmPRZsv58qrumnD1+iFXosIHHAnKmf834+i3RvZ3V4?=
 =?us-ascii?Q?TA73MIy4gTRqyP9clqj/6DCGg9Ry5A8v8XNCze1ZmfNpGrS5ecBmiHQY8Ehc?=
 =?us-ascii?Q?T6mEb5eVkZXswx1R3JUc2y2sI10dVEHP15cQgM/8nxyhRmoOe4QlXClGdwSr?=
 =?us-ascii?Q?ha88oLj0/PoeFM1n72IpWLz4IHoGUbt+SLnYivbpLOPE+gmwvbPKUOK8Q7zJ?=
 =?us-ascii?Q?BRNZaQ4ZZTRFWQotS91D9GStLdfN8BJbKTeXsZYk8GAbQqVfDetTPxwugU3q?=
 =?us-ascii?Q?27tPphuNZosFtUbaO2sFEdoEI6L1eiYNhxGiEo9xKSdXRFg7cEqkCMUMHLqo?=
 =?us-ascii?Q?+E62sStZdv9M9f5e8KstGpT6vu1lh2sXkBkG5QBszFVFYnCbni5YDIfa3i6o?=
 =?us-ascii?Q?6VGQ0NNK6j1VrGpcrpWBaiNcSJc5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 14:48:17.4454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91fd4516-4e34-40ee-91eb-08dce8716948
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7876

Using the device-managed version allows to simplify clean-up in probe()
error path.

Additionally, this device-managed ensures proper cleanup, which helps to
resolve memory errors, page faults, btrfs going read-only, and btrfs
disk corruption.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Tested-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
Tested-by: Richard <hobbes1069@gmail.com>
Tested-by: Skyler <skpu@pm.me>
Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
Closes: https://lore.kernel.org/all/3b129b1f-8636-456a-80b4-0f6cce0eef63@hixontech.com/
Link: https://bugzilla.kernel.org/show_bug.cgi?id=219331
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index 4b59687ff5d8..3438d392920f 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -236,9 +236,9 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 	cl_data->in_data = in_data;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		in_data->sensor_virt_addr[i] = dma_alloc_coherent(dev, sizeof(int) * 8,
-								  &cl_data->sensor_dma_addr[i],
-								  GFP_KERNEL);
+		in_data->sensor_virt_addr[i] = dmam_alloc_coherent(dev, sizeof(int) * 8,
+								   &cl_data->sensor_dma_addr[i],
+								   GFP_KERNEL);
 		if (!in_data->sensor_virt_addr[i]) {
 			rc = -ENOMEM;
 			goto cleanup;
@@ -331,7 +331,6 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 {
 	struct amdtp_cl_data *cl_data = privdata->cl_data;
-	struct amd_input_data *in_data = cl_data->in_data;
 	int i, status;
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
@@ -351,12 +350,5 @@ int amd_sfh_hid_client_deinit(struct amd_mp2_dev *privdata)
 	cancel_delayed_work_sync(&cl_data->work_buffer);
 	amdtp_hid_remove(cl_data);
 
-	for (i = 0; i < cl_data->num_hid_devices; i++) {
-		if (in_data->sensor_virt_addr[i]) {
-			dma_free_coherent(&privdata->pdev->dev, 8 * sizeof(int),
-					  in_data->sensor_virt_addr[i],
-					  cl_data->sensor_dma_addr[i]);
-		}
-	}
 	return 0;
 }
-- 
2.25.1


