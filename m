Return-Path: <linux-input+bounces-5087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1A934C48
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 13:16:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3680C2820EC
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 11:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB61137757;
	Thu, 18 Jul 2024 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NnWQzVF9"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A312F375
	for <linux-input@vger.kernel.org>; Thu, 18 Jul 2024 11:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721301402; cv=fail; b=WmZkVdI2mxLvReAFJlNCfj32UCaLNbplqqsfgZadbJUO6/LMJbrNQIPBerA460twCavReqKDjKzfYyLy5HqmavhKLeNXKBPg2jMykVfVVqaCuHY95CbvwCA8FNDVWcatYwriTsE/pS6PC7ETavvhPyl5DkqzbprpiKhrT+1zeww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721301402; c=relaxed/simple;
	bh=ZNmDNup5+uT1e265cQbmvhkxz3l671m7nPxp8Di4xWc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G59aqfTVcIekuvYBvmeknr+ZR+6E569usihzDrVz1Idq2hNR9+ApRhxBYZW6/WTustQ8wHr+jKom2flFi42lduFOncVB1228rBrbEXa4ZXgznA/oMj3dJtg4MouxajGCzT1vPycUjcnhpeDiv59hAPilFICupyERF8eewwqDS4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NnWQzVF9; arc=fail smtp.client-ip=40.107.94.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9Y+Cyh7Di/fHSyqc4KY9hnZ8F+HftROOcst+qSokbj5pY55EKxsUdMaR7J0oa/6WcgxTPcxDHZiZVv3YO+knEgk81MJK9axCV9JbkE+zd9S+7EL4KE0BjpEHTRqc7beADs2t8XrgLrbwJwdDt0Jk1ljuCJYOg6K0ntrbt2C4TZ98MIJ2ZVMCDsJdB05b8DSPmCnA7EcQKHhGaqMBtsYBOGVz9AehNjoZmB+roLkcvZ7koj/AKEJsMcJJLKNFTZTasmTZxhyooCC4fQ9/Ol6bxwxj9JjdRJoPOw1+kMHHbKc+AC0qhM8Lm7Z95Uu95hZuOZWmuTWaPJBNZmZCGFdBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQhz/MUUPwg19NCxRY6PKjvM6JoOeuh7lqnaCDPX2rQ=;
 b=GRHDFtlCM47On2ZSOdgBuoGx/Rv6IuKrRaVsnizz2xTeEz21qOcK7zJHiGjN4RqUf5wZNDtS0F2xTxFD0SKBEW6nYTM/Z9bjaOwlgDPgH7YKxjdVGbMkG5oPvfdBu3iqYh1fdJV74xuukCVI8dUkltuBhzZ7RZtZ9OY6pFf3bnRR/8Wbfs8zNDORZuoGLf/ekviNQJ+T0T1q0PEV2zrVZd3ylMVKmqvmM3WDXHDe9RBxt6kvTC0ZXotgKj1C8ogwtZjPkIyiMWvRTGhUG2l7Dolt2p4crrtUZM6sS8aYX9LjmJDxV+xxYU4HeEDvFPFYypwR6s5d+jlNl+UqpkIDAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQhz/MUUPwg19NCxRY6PKjvM6JoOeuh7lqnaCDPX2rQ=;
 b=NnWQzVF95uMNpIUTx0DSnXjRk+6FnENK+6Fktg1U6KO5eJnH2eNcgAWxea30D9qH4IC5n/Ib1x3k5i7IVBETqW38Za4+fPfbqTO1/7jKhlPi8//C1Y3/YuXuGDKhMxNQKU76rHw4ZjuEkVIsk9l8jGg4kHQyeWBpH2hE5XDmIHw=
Received: from MW4PR03CA0243.namprd03.prod.outlook.com (2603:10b6:303:b4::8)
 by SN7PR12MB6909.namprd12.prod.outlook.com (2603:10b6:806:263::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Thu, 18 Jul
 2024 11:16:37 +0000
Received: from SJ1PEPF00002318.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::b5) by MW4PR03CA0243.outlook.office365.com
 (2603:10b6:303:b4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18 via Frontend
 Transport; Thu, 18 Jul 2024 11:16:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002318.mail.protection.outlook.com (10.167.242.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 18 Jul 2024 11:16:36 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 18 Jul
 2024 06:16:33 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <bentiss@kernel.org>, <linux-input@vger.kernel.org>
CC: <petrvelicka@tuta.io>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH] HID: amd_sfh: Move sensor discovery before HID device initialization
Date: Thu, 18 Jul 2024 16:46:16 +0530
Message-ID: <20240718111616.3012155-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002318:EE_|SN7PR12MB6909:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d4e7ee-7a38-4e93-b8dc-08dca71b16a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A5/DZVXrJ7bFdXlP8wflHOo9yc275alThUA29K44LSYTrK1lEC8/AJO8SQ0y?=
 =?us-ascii?Q?Qd+UsdVZUYhgv/jENU44a86b90P73X7pxvi0I0j1NyWsX4Y6dLm0030U0Er1?=
 =?us-ascii?Q?YaQWrmz+x0+4WL2uwbt/o3WHVBA+d4TxxxL7j8b57Rcj8pJRSnXEakkJXJoZ?=
 =?us-ascii?Q?S1mSmorsCrjxt0I7Uq81oRSqSkDFhauPrnpIrPK7nqTRkhUDgm1+iZzzJ8X8?=
 =?us-ascii?Q?BPr1I0fzVofRhARvn4N4B9TImt8092+NW3ihmlFuB6Rt2XrOu7D5dRuNUVMV?=
 =?us-ascii?Q?4/CFVSLQQyzQdfDv3BJw4jXInSzLuDDtxbkFeNiBHfvkcNkruO4S/qEaQ0Yb?=
 =?us-ascii?Q?c+/b3xHaISW58p/QSer8HhJtcPOQCBd0Hl7gZFN+qttXhKAgXQRJcfx+BRWl?=
 =?us-ascii?Q?bNyXQ0PA+3GEhotb3i/R9hREbJIE12LAFzz2yHMGWvNHveVK77tbKp0CRvXx?=
 =?us-ascii?Q?fGrcmX9C8/Wr3Vqzr1X/5XL41k+8PECtZH5eTB9DdRs0lIcMxhb1PyhCMu+J?=
 =?us-ascii?Q?lmeiOZboCgKsjBxrOodriERedtEmAhzqqe64YS11NYuxoTY+knwZ4aIr/Fjm?=
 =?us-ascii?Q?XQVo4N2myBcD7rM2XFYsRyD2tCnYhcwT/zq7uvYxpfc44eIZ4vr0jZWN7iZj?=
 =?us-ascii?Q?NHByUcV9Iz9LOKRuhol4wA7fMR9KqJZiDPcDh9PLlaQeNvHnvZReQLrRovHE?=
 =?us-ascii?Q?P0VaHSWwC5C+RajKbMjgouYH1471u74IpktgS9nEW3wYfhBTwAO/R7hMAVan?=
 =?us-ascii?Q?rScgsDBkKSlymuw3cgMr9ZsqqKFjDl4N25LIlpdxGvi0XQ5fXRfTpRkJbLW/?=
 =?us-ascii?Q?fCYWGP3fymSsOtgFWRbJMUsn6HO7M8VRIWUQeGdSPrPSzZ3Tv+vRMZj9FbJ4?=
 =?us-ascii?Q?OA10hpq9WmLc3xhfKjZtLYpQ/lHoilqZypFs+OcHhcBs8rcMjTokplZe1k7d?=
 =?us-ascii?Q?xe8sgGJCt2/iqZUqeLGovuDVzVY6u15uXHBLZ65no/gpkcGVGigdRVvwumlC?=
 =?us-ascii?Q?d7ZydxKtPclTfmB0ChIJ1PoyFPwP1Q3ZuVyvMiBUVjlvalQ0VXF3uDxRbqa/?=
 =?us-ascii?Q?PCVbZ+TuxVK5WTuyr4o1GlKqOvXkL1Ee2aF2Y07R/IwyLAaRzcAc9eGYvkZg?=
 =?us-ascii?Q?Gk/NDJMzibu17Be/sqyHQR9mJJZAZYu0lYV44vDgcaveyiov7CGAkr3pxwH/?=
 =?us-ascii?Q?uRTPWFbga78QWxacCEacNcMJlZIixd4uwBne2yVZDOdgYJ+Ip/rDzADxjtW8?=
 =?us-ascii?Q?ny0+IPEtT4injCXYzA51U/m744QpKaXXbdlXNVSSwt/PElHTgndVCJ38jMF0?=
 =?us-ascii?Q?9KGyoxO8HBXwE5Utn4pXYnclh3fi9LT22ql+JCO9veV173enHPzMXauxZ8Ni?=
 =?us-ascii?Q?H133M5Zzg0rvT7c+aK4MRrehbABGCkO3msqBKj75OJgshU+0aszmvYtawxqp?=
 =?us-ascii?Q?r6k1sl19zbWNM3I65j24xiUYQD8TcyqB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 11:16:36.4070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d4e7ee-7a38-4e93-b8dc-08dca71b16a9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002318.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6909

Sensors discovery is independent of HID device initialization. If sensor
discovery fails after HID initialization, then the HID device needs to be
deinitialized. Therefore, sensors discovery should be moved before HID
device initialization.

Fixes: 7bcfdab3f0c6 ("HID: amd_sfh: if no sensors are enabled, clean up")
Tested-by: Aurinko <petrvelicka@tuta.io>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index bdb578e0899f..4b59687ff5d8 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -288,12 +288,22 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 		mp2_ops->start(privdata, info);
 		cl_data->sensor_sts[i] = amd_sfh_wait_for_response
 						(privdata, cl_data->sensor_idx[i], SENSOR_ENABLED);
+
+		if (cl_data->sensor_sts[i] == SENSOR_ENABLED)
+			cl_data->is_any_sensor_enabled = true;
+	}
+
+	if (!cl_data->is_any_sensor_enabled ||
+	    (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
+		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n",
+			 cl_data->is_any_sensor_enabled);
+		rc = -EOPNOTSUPP;
+		goto cleanup;
 	}
 
 	for (i = 0; i < cl_data->num_hid_devices; i++) {
 		cl_data->cur_hid_dev = i;
 		if (cl_data->sensor_sts[i] == SENSOR_ENABLED) {
-			cl_data->is_any_sensor_enabled = true;
 			rc = amdtp_hid_probe(i, cl_data);
 			if (rc)
 				goto cleanup;
@@ -305,12 +315,6 @@ int amd_sfh_hid_client_init(struct amd_mp2_dev *privdata)
 			cl_data->sensor_sts[i]);
 	}
 
-	if (!cl_data->is_any_sensor_enabled ||
-	   (mp2_ops->discovery_status && mp2_ops->discovery_status(privdata) == 0)) {
-		dev_warn(dev, "Failed to discover, sensors not enabled is %d\n", cl_data->is_any_sensor_enabled);
-		rc = -EOPNOTSUPP;
-		goto cleanup;
-	}
 	schedule_delayed_work(&cl_data->work_buffer, msecs_to_jiffies(AMD_SFH_IDLE_LOOP));
 	return 0;
 
-- 
2.25.1


