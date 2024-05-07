Return-Path: <linux-input+bounces-3540-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7CD8BDC28
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 09:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B08701C22425
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 07:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5425813BC29;
	Tue,  7 May 2024 07:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="49d+2UWv"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39AE13BAEF
	for <linux-input@vger.kernel.org>; Tue,  7 May 2024 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715065875; cv=fail; b=tAFxXuG+FCBFPSdHw+vdJWC8IkBMthuqGZDYu9FSrYjvLdQ9tfrbLpQGIpHZAshMchx/AoI5Aax96jZJhFqVQukpEMIZ7GVCYWjiGtvGyT+Z9GieUqDjVgJgfNkagdlzWr5BRYNCVU1L0L2fgynDAOnibbLs51tSMosMTFM9eEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715065875; c=relaxed/simple;
	bh=J8DOBozeOIDla/OS6LtszzDeVziJCaGdla3JmUnGY7s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MU7JAqu3IWzLEWaQGSi3bc2d96lb4kNoE7RuqTeBDrxNv42Sg0grN2jcpAc1iF1cf0/09wZcKwu4OKUdlNEwtVX3NKK3c80C6y2DY0tXKnNTTK4MDl15HzTP8d+Ojz5yHG4Ep4FTTqjnvw6T6j+Y7ilnu5VLbmWTvEZA/+W10iE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=49d+2UWv; arc=fail smtp.client-ip=40.107.244.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eES9w0taC1egDGi7cqIT2SNmlSpUHztRhUe29rh57jb8VJOdkbIP0XFhHvBZ9q7CQz0gQhzusm9OqKf+UzLS5k/KwjHtNufrYCCHQZtHUh4BS6FEsBUqiqQzq3woPWr78tyLc9hFrBSm0u6q40N97yhR7uEY3ZVdiVSArb1SDW4fWP52svZQO3Hgk/v2P/v9G3aIK/8IJWKGl7FxPBeafABMCnOqx1HBPCt/YIaBJo6aQcJ1p50/CmwJL8dR5Xceo7q7Dw/kmUCsO77tZwsJptYdT52jRT0w5kKWNXpl/YhjTiM0UU2Y0xMIDRDdiUss5oONDiTJuffFXUT6G0cX7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH5NegXW+Vv8nW+d0ZTeHdWDXe8PGrbexfJqr9yNQv4=;
 b=VfBu5XooQE4fIN6kB5D1UxgXLSnlNep9sBQ0v6AHpcRt+kqpdobgmEWgo9H3t+4XjNF0IIow+cfyh2Xa/gAtQH/Bj/gHjQ2RRXLT0v+8IZ2I6VnRGCLzx+cT6n71Dkj4au4Nl7FAi1rXBxxGv5Y5Tt13Ng/CQyhktHYP4fz6iUdyLhvkw0rKokiTXv0ZdoxVbRd/tYPAWwljYX5MZ26w8op+LNQn8lsRSQiE7enESmLiuoiY+ousqKI0GALROVApMuMXU65C97RvD/8qDUntEHQlOS/U68JOZLydyLMoLJFMsWYEOtVwaHFltTHgos2juV1hHtt8BjHII0L87NIBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH5NegXW+Vv8nW+d0ZTeHdWDXe8PGrbexfJqr9yNQv4=;
 b=49d+2UWvBSn2zprFPC1XQ77Gg6v5q3BoDDY92BDzK+h1prHCXlGYA9lQMsB456uyxPAVGZinIMrm5/kSc0KTBGzzEPijHMowdBCOTxUrGd6UqJC9jmEQzZ0bGBmyury/CHtFB9jFp9lv5V/6zz+oU/hes9ihjv1zQjdqTomDMXo=
Received: from CH5PR03CA0011.namprd03.prod.outlook.com (2603:10b6:610:1f1::23)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Tue, 7 May
 2024 07:11:09 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:610:1f1:cafe::e5) by CH5PR03CA0011.outlook.office365.com
 (2603:10b6:610:1f1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42 via Frontend
 Transport; Tue, 7 May 2024 07:11:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 7 May 2024 07:11:08 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 7 May
 2024 02:11:06 -0500
From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To: <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
	<linux-input@vger.kernel.org>
CC: <patreddy@amd.com>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/3] HID: amd_sfh: Use amd_get_c2p_val() to read C2P register
Date: Tue, 7 May 2024 12:40:45 +0530
Message-ID: <20240507071045.295723-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
References: <20240507071045.295723-1-Basavaraj.Natikar@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f2a30b-c3b2-49d1-61c1-08dc6e64de74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?37zVwLQv8pStzGW0mao4MIesOg0Mz0pn8zVwxmusnVMlfusbGsJsoIMpBQG8?=
 =?us-ascii?Q?2jj5p2X8JcYQ5QclX5gqzm43Sw7+KCxGowO/sAeSoh8VfISJ9ZwWLJCmy5Hv?=
 =?us-ascii?Q?k78mZBrO5qLSinIXR+1R5qFFgjNBnFX/eZGdkJKrhir5NKhox7AmJhjBswbE?=
 =?us-ascii?Q?S4MDjXUpzfvBL0fVRPoZZXtd1tRXg5cDi6Zc8ZIFbvi7Ln8CbRgeaQ75gQiW?=
 =?us-ascii?Q?cyBtsrz8ZuLYox5sP2VetiG14Xc7/7/NC6uh78bGnADdtvTSXeUu9b0Q/qJQ?=
 =?us-ascii?Q?nIACdowmRyEhenW4qYYTAYw8S3xyGLfcfQ8emaHZu0Lscq+ezyxx/MwPjA3e?=
 =?us-ascii?Q?VgKAjkzU6oE9eodmvJ2SVLdBMoshPCyMxyOI0dK/nu2+LkEe2hAX4BgjUU1g?=
 =?us-ascii?Q?uiLjw5/GkMRnnMj5dQp9wU2ElDSLP5zrB5Cn5/Y6RbXYik1qpDx+iaBn4JHI?=
 =?us-ascii?Q?4EP/5PWlz7eKaMaRkfteJkOvZMGDwaRITjbYaTDE0UtmIemexxL3O2yl3T2R?=
 =?us-ascii?Q?qZgTh1/Tl28OxpzHhN3ndf/dbApWkyAJhT9Z+B30/BpQZYHRFRJXeZ/T9a0T?=
 =?us-ascii?Q?1/Dxc24o7LZn6G/OAZyW3rGFU6cwe3g+85bSXhZRcoYtmjZKnvzePWDwWSGs?=
 =?us-ascii?Q?4CPUM3aI35IT4W/UTLZjYFiNwhYk4+Ao1hE5l4yUa4oXjmizPTjtFVpqBKuX?=
 =?us-ascii?Q?oVcgkPMkqp0SL5QlsXDYJgJlrX8n7U9AM6KrJRv+PtxM60C+ah0w91RfXKFo?=
 =?us-ascii?Q?yaTjqz0oLveapccccBtiYTCvnUW6oezoVtfUx/OIYl3MFmE26g189LKGnBJK?=
 =?us-ascii?Q?SFqEKiyEga0N4y0FgsZu6MUJViTRHOSMP1tvLmaOKDBwks8CwQjezYSIQ0YU?=
 =?us-ascii?Q?AqaRVtt0j1G5BI6mgiGPunXm7CKo8G5VwKV1MhatXM8WENH3LKUi9zbLxNTO?=
 =?us-ascii?Q?hG3O8FE8QOcWPre6P0acIgI+gu8WEzn6+Lwa9c4cH2MLCEuHYXyPVxNsqFOd?=
 =?us-ascii?Q?WWcLnrFYavKjCECHki+FZFlRn4V0szPQeBaHMhtSTYi4qyr9V2Ww6jJjawyY?=
 =?us-ascii?Q?spQbXerTeSBUHalzyxJSKqHv/Ebh+TexxW113/MzHvM6hxJGJHPiwNV1m8iM?=
 =?us-ascii?Q?uIohPuY76cu1asR9LhMNzJtuDFRD+HLQewTs58JiqX1avhNq1GD16bafVEVv?=
 =?us-ascii?Q?CCmr+NXx+xVOFfRwRbu81olST/DBFAh2BEF4Nssj0TLCvvZAGO/5iOdOAM+K?=
 =?us-ascii?Q?pzC4cLUUYiMajk/V5l3ay1GYvFSXvAsQEMVAVYNmhM7X0ZH7RSHToNFTrTRa?=
 =?us-ascii?Q?sooqjGnsWw9pZ6aHPztjD0Um4G2pHvb1y2//Awzp6HtC6zY+2EfGRk8TlmrX?=
 =?us-ascii?Q?kc2Z4QY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 07:11:08.6940
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f2a30b-c3b2-49d1-61c1-08dc6e64de74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190

Newer processors support various MP2 register sets. Therefore, to ensure
compatibility and obtain C2P data, use the amd_get_c2p_val().

Co-developed-by: Patil Rajesh Reddy <patreddy@amd.com>
Signed-off-by: Patil Rajesh Reddy <patreddy@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
index 2de2668a0277..4676f060da26 100644
--- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
+++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
@@ -97,7 +97,7 @@ static int amd_sfh_hpd_info(u8 *user_present)
 	if (!emp2 || !emp2->dev_en.is_hpd_present)
 		return -ENODEV;
 
-	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
+	hpdstatus.val = readl(emp2->mmio + amd_get_c2p_val(emp2, 4));
 	*user_present = hpdstatus.shpd.presence;
 
 	return 0;
-- 
2.25.1


