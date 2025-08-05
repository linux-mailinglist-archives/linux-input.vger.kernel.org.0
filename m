Return-Path: <linux-input+bounces-13818-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6644CB1B123
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 11:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D068188CF76
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 09:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCB5F26C39E;
	Tue,  5 Aug 2025 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="EBwkD9CE"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010018.outbound.protection.outlook.com [52.101.84.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD6925A2DD;
	Tue,  5 Aug 2025 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754386424; cv=fail; b=javuaMfpNAuSD4iVlhWqwHjdJTOhxHlSBK7ltvUWfp08n5l1ygcKilOGhmkZYZGQN4/+tZVI0VB8jcV1r6FVztHGHS54IuoEb0apMMGlO3tGhakyKav0Ja9l2eEvnyIax1BBLNQrkscX9ZrFM34QqIhUUl4tI0Oj4sX5sA7kMWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754386424; c=relaxed/simple;
	bh=L03yRsMZpjuvgTbyF+buB8wpJR8kW7SmU6DKWYvPR7w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k2imsHzMfxJYW1PXKcIYLUou/7FtG1Be7t3qTGbQ+ONuvXVgxWw8JLfG6iINOLgXvIfEOdwP5E9ocsXZcT86btUq+dw3BpKApVZPPeOeVfynsDhxwOEobG3RylhKwSAEaxPVi4rXJ65YyKx9+KCs2O0sZOcR3CbKtmaRX8i17mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=EBwkD9CE; arc=fail smtp.client-ip=52.101.84.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmgfnCRJTtBxOApAA8LattMBH8U7BrPl4gLnGWGqNB8uB9GFxhP0Cb5PGvr9nUyeUtTOIXgJiNOqNQhDveIyh1Ab0gBDMuGcIDoV+Zk+xvntamEL4AmbAlM7UTyC5cx0qbbqgoJngrxW0imPSmaoQ15JhuB9yuRDPs4ySw97dhVpxFckyOrPFV+f4+leBnCTEQcme2UrRtNisRR1xBrHaxrW278DRSWejeS7Lfya73vMaeXemeK1mxbWCLHJuAbDOahkoPYqu+icHKcrk2SMCqWzdwSo3s+t9dPo1Neey5WHp0Pq/DEajWl3X3ipTghXyqODpv5v6quR9oCR39Habg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+t9wQLZBGQZW5+IM798QdAa7hlQdJj+4S/1kMfdU7Ag=;
 b=OT7LlKR7/IXIkGh/bevhCd5DhiTfvGDoV8RDRNH69mwsswc1H7XYtDiGvpLhPSnYpIdfLdYlLmG8ptQ5m7byIILO+flvIcmp+8h1IYHAwtzyspwXmnjsU7Q/4CT2OJFSxN5Krhtmx2V4juRQNJe2FCi/N8kmbiHvWw6pFFnwclCn/01F7FiI7hNhcwiADiIySN5Et9ppi7HQ7KXtBd0vEZWpC1efe46CzOjmACoOdmB+oJt/+U5u4Kx1O4jclZlWHt4y2xvZFk1s2SgeknhKqzbTw0pfBnSAlqQ4UPDAtboxReLjC5FOQnQWQ6r6ZdTNJCtf2WCT/scxpRkxmCfTew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+t9wQLZBGQZW5+IM798QdAa7hlQdJj+4S/1kMfdU7Ag=;
 b=EBwkD9CEKNoCVqDOcQKuxdHDaLfMPXMQ38gMTtf4WpCBwDcoFdMYNokn23k2OCRm5vGLtuipQBMiADm4nadGBcoK90S/IHSnW2maKZhZ8/Xxo/ufDKPo3rkRzGgSq/oDRHS95llUlcei+ZSNKIacVJNTqkhh1O+zlswM054jqik=
Received: from CWLP123CA0024.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:56::36)
 by AS8PR02MB7157.eurprd02.prod.outlook.com (2603:10a6:20b:2e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 09:33:39 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:401:56:cafe::5c) by CWLP123CA0024.outlook.office365.com
 (2603:10a6:401:56::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.21 via Frontend Transport; Tue,
 5 Aug 2025 09:33:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Tue, 5 Aug 2025 09:33:39 +0000
Received: from pc52311-2249 (10.4.0.13) by se-mail01w.axis.com (10.20.40.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 5 Aug
 2025 11:33:34 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <kernel@axis.com>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] input: zforce_ts: Remove error print for
 devm_add_action_or_reset()
User-Agent: a.out
Date: Tue, 5 Aug 2025 11:33:34 +0200
Message-ID: <pndbjoum7td.a.out@axis.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A790:EE_|AS8PR02MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 22490f3e-36cb-4ac5-a403-08ddd4032924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XUl/J+KEejwHhXJm44emnWay3HtD9k61DAgNNCaAi0JrW3Ktg9nExuogZ0N7?=
 =?us-ascii?Q?oaY7xzlGV1aMahRVtX7OMJckAFhcrY3NLjB2OsxV9IMZe6sjHww59DxwzwE+?=
 =?us-ascii?Q?JomhesG98/Eu85jz9tnz1kwPKy/RqTe6RIoqoVBJMtT4wSBGN/qFz3Gc3/AE?=
 =?us-ascii?Q?2srD79hJbiHdXjQwwvLxu/7sPVeBDZTKfIX0BNaxPxQ0LR064ev7b7sDncae?=
 =?us-ascii?Q?m2wsBv+1XFz6M8gu4R3dPLvSiOq3CjSa7KMnXIlMBMFfp7gDyRDcQiW7K70b?=
 =?us-ascii?Q?dApTkp6+34TbzxQz6kKs/2AM9Jy9jr0cBEbSrEJjexux2jhsr9XabX5RHwja?=
 =?us-ascii?Q?GW4L9qq//SOoynpZrO8F628MrUdXsvICkzyYMvAZZy3HvbOL4h66UKBf44Dw?=
 =?us-ascii?Q?mp82lAsTVvt0kyMc66Fprq0KXgDNF7PkjRS8jnTN4eVCUhDOE/YvbCwCxHJh?=
 =?us-ascii?Q?qIheIh2jfEintZeYEGCXJlt/wJ5okUZ+pMtK6ZPA2epNkwNnodPBmimzojcE?=
 =?us-ascii?Q?csiRPQJ5oPhfUAAFYAHdlbZN6B2dCD/A+pGBX9vYV+dvIrW/qWGV8UO1ChYs?=
 =?us-ascii?Q?Q+piAOMMvaqG2EzGgDUsFnh+9LEuRaia6sBvsZbGYYYlGXxSBZcbRGRu6L0O?=
 =?us-ascii?Q?awkmXDf06eIHhIhOkUA7Ttgnnfthdn0tCQWrwh+Zh4RMD5GGJKL3/cboGEYU?=
 =?us-ascii?Q?YqJyF0B0xlSw8oR1YJT1prumx8uu0MMj4Ui28VryW/qm22acmt0FFSvScRcz?=
 =?us-ascii?Q?cvSU1jcWoNPolXZWdGxU+5yZeL4iaFCS2lON7EpGT0q9FcXCwu0Rkyp6jhnR?=
 =?us-ascii?Q?8Hqlsf+hrBf6F08aECVCMFCJ4usci3d/ogw+OwKEnDd8f09dMOpljzq+3sFJ?=
 =?us-ascii?Q?brXdvfupz1+HfzPBxWLAHHBIVihnsC7YO36Szw/1SptsXZaCbbfF0cZng/EH?=
 =?us-ascii?Q?0HRmlMB5iT7BGAHU1VRUxppT+1Ew4du06pe95oYkLXTGlMCz0CzDEt2csO8X?=
 =?us-ascii?Q?OzyOBXkWiMD8p1BOtV71fwzwO9B0Tx87aXDraAzL2wrsyMeM1DNS1BINO8vR?=
 =?us-ascii?Q?AA+EWBnf/48mslHOHwhANu6j/q/zlDxrrMhjDjXMfqbQ4V7EkJSnMkMvCqLf?=
 =?us-ascii?Q?/zJVxbeKzlm0yCY+LnUmFzVcu9aV+9LCDhvCkAQNV6cLcLTuFfXP3lMaIm3y?=
 =?us-ascii?Q?DIafaTeQRr8bKIl2GYlNss469Uf6A1YErkByGGxn2BeQU9itmQtspYEFZ2QD?=
 =?us-ascii?Q?lOI/lz8w+DbjUrPMeNWKtC7asTEwBcN8ZUIz4tfcqJRC760MtQiklzmGqtHp?=
 =?us-ascii?Q?fWvIzzLRcGFaLPVg6cVigbtySxQDCPd5ceWozViL60tCRxgJY9ufREYxbVEm?=
 =?us-ascii?Q?PEOdCETVZRbZqfIrcNUhpmyHdGr3uGhDu9kWkshWF8FVeEv1nm2fLUI0QAhP?=
 =?us-ascii?Q?wxhvoQXyl4rkQ/ZQN2q04Li7ryjOdzL/WyuvtK4PGKK3A7Tgd3gr+GYvqv6m?=
 =?us-ascii?Q?7JOJGNEjoUKTYjzDHTCU+x0gm8wFS8LKjdYI?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 09:33:39.6318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22490f3e-36cb-4ac5-a403-08ddd4032924
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7157

When `devm_add_action_or_reset()` fails, it is due to a failed memory
allocation and will thus return `-ENOMEM`. `dev_err_probe()` doesn't do
anything when error is `-ENOMEM`. Therefore, remove the useless call to
`dev_err_probe()` when `devm_add_action_or_reset()` fails, and just
return the value instead.

Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
---
Changes in v2:

* Split the patch to one seperate patch for each sub-system.

Link to v1: https://lore.kernel.org/all/pnd7c0s6ji2.fsf@axis.com/

 drivers/input/touchscreen/zforce_ts.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index df42fdf36ae3..4d000b5b3ae6 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -739,8 +739,7 @@ static int zforce_probe(struct i2c_client *client)
 
 	error = devm_add_action_or_reset(&client->dev, zforce_reset, ts);
 	if (error)
-		return dev_err_probe(&client->dev, error,
-				     "failed to register reset action\n");
+		return error;
 
 	snprintf(ts->phys, sizeof(ts->phys),
 		 "%s/input0", dev_name(&client->dev));

base-commit: 260f6f4fda93c8485c8037865c941b42b9cba5d2
-- 
2.39.5


