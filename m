Return-Path: <linux-input+bounces-7793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8B89B7497
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:31:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720E21F25507
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E139146D78;
	Thu, 31 Oct 2024 06:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="lvr79fEz"
X-Original-To: linux-input@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013056.outbound.protection.outlook.com [52.101.67.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1496C146D6E;
	Thu, 31 Oct 2024 06:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356273; cv=fail; b=cnHkrbaIqOqTAwRmwWvDh/Bvf7i8TAZ5rxOEVwwBu/1lQIcB/ZWgNiZdPm+uosN2576xcrWZ1hL69FbDJXsXEaPB3Qmim1LQ7kH3uLs9mPW+c2Ppt0iHi3WExLFG/cEHH0jpKMi0srvjvADrjddKlP2Y1ARNHagoAA/UOfCfbI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356273; c=relaxed/simple;
	bh=St5a4cm327l1cBWkQVf5p1hsDXxmtaWCJlFZ8JJvnXc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H36c+njyMeqkP/Aj9MGOHNdBNvQGa8WX6/Tfk5dJUHcKAPz1herfaS6zm0s8FT3mbslHwwyvgrE6NEhmVcxrPSzAZn6ODK+9IDhXDGOSYIOxigogoiMrsCDvBHFfX6VRqZHSE3iU1OSTpFZseJ5H63U/daY45Cesv54KS3cCsXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=lvr79fEz; arc=fail smtp.client-ip=52.101.67.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cam0XomqzzVAkkWvVW68/t9J9jYsvgzG4EkXJQ92HU2+gKGhSUX86UBN6hdhwQ8eV3tKQZlv690BWtmlodx5bk5PUUO4JPUup5x6WxlwqE3OVejGV7T0huYoBOizP7GLx2jIU9bTC35D57yFsbCB3hIXGAq4vyf5ae0UZ3tBhYCFGX7XcTy5181ghQeB3alGAkr7YGg2cw4JQtFp52SDtxIRRLVn3SDgjY+Ruvf/rLG5PHZ1KXNfdSwvu6cEfxvpnAlEWKhfWAoudTqePwToaQJSJii8ndMQEM5yHm3Un4yy3BTO9Q1XUCL6tL8GZUZGtEyZFw0iDR0tWTEMBnyLGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaW40cTlogoneT8tAEqcXOHyjc/wCnOytjchG3JYfM4=;
 b=pUtHdqL2y59h0NRAbHz8uaR7rh0L1R/m6XmpsL2clMX4d2NiW7rZrTb6acBPiYKbfB6eFidQOirDMVI6jbZO5t5ZFO0F3L4Sneb95H3rg1XkW3Aa0cfxs1F74uC+txFnRF2UvycAhTusjJGsGG/rXXWl/eDFjg0QWI2rC+7b8UQkU6avAQ2P6R6A3rVvpD8lGU5TY9yDhldxcWV/SSoSwmu6OJo9gCHv20/B057nEH5nWBCI5bQOS932uiWfCX2vcSjdlnJN4gcVXltcP945g+ZKIOqqZ52RUyp5YDlwXU67AxoDofTUD7QtTyYOrl99ZGDjW7+/oEqY6N0JFk4UEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaW40cTlogoneT8tAEqcXOHyjc/wCnOytjchG3JYfM4=;
 b=lvr79fEzlgaoUlR8EcCunXXS3bUxFFiWaZ7GGQGzSHrMFY3XSoCpJg5cMljHSHuGwNEcGtINdgpedFYAVCjYv05OQopx3yiyYtju91pEcJVjxPmGlFZRrIIgRsjy2cxEdNtL2SKhiN2GMKDwliFNfL1Q9tX1jSLieu8xwoNLcOSyS7hxkZm+/lYmFIVBVm3dTuvxvJkZ8Y+teEZlGDp8xdB5B4LLdSXZIvg4HOMyhRPPvVL+I/hRVDp7BaNlz57PwZ+4CQ54pWT3T1n+jVjs4YtuLyglu+cJpG2o2z9PCEmUFGWM8UmqIj5xnTvjTHsOkXjpugpUTZNAOwRH2CsmqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:31:08 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:31:08 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	HeDong Zhao <hedong.zhao@mt.com>
Subject: [PATCH 5/6] Input: matrix_keypad - add settle time after enable all columns
Date: Thu, 31 Oct 2024 07:30:03 +0100
Message-Id: <20241031063004.69956-6-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0006.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::12) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a213cdf-fbfc-4b5c-830d-08dcf9759abf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rYE/yV9vZnxAATaUnaxZ88M4c1/XQJgEYTy0hgZJKzXuuMXPT1FfGgDaHerW?=
 =?us-ascii?Q?ydW8e5NbJzQvxoQ5n+yVfhSRWVj7+ki71zGLMIQEDeDqv4vVIoJd+4mPk/Ii?=
 =?us-ascii?Q?twoYHbjCeG7wHHU2jbhCOxjmWfsddYV/cdrwkLeqYiWStWljKZNsyfdcXP3x?=
 =?us-ascii?Q?b5bsHuU1s7iO5REZRdXRZgHddNT20X5PWAwy2iouoz0z6KBDV6tmOicAnvUb?=
 =?us-ascii?Q?efaHSGWOMUNutJBUptHetMjPQ7n9wnnaLF3TJb35e2VpFF9xHGYJzHzPTZRA?=
 =?us-ascii?Q?nVO4qeVYArKHwEARcQ08uAreupwUXK1GIXZdRB/kKhfMR/rwVsXbIEXaEnLj?=
 =?us-ascii?Q?epFeLg/RUwQ0HhvoljdXPwTW9o0+Og45gcyXxWtqR7+uCbRG1V3BjpmLf1U2?=
 =?us-ascii?Q?Qe+72Iejqcqxqn4tpVgkgUNGhPCLLGCosIPcNW/zN6BKsUjtJlPxRUFbyKjd?=
 =?us-ascii?Q?ts8F8gIQ9GbydB0OaBVylbGFr0QXY+Pnjiv+IB4CZ1T2ohNnZcFDfZBPV0aK?=
 =?us-ascii?Q?IBlBIyRoTgzH2CnyBvsg+xCOx837SFZfGTKN75tE5p2L0V0pMjkgBERUgFED?=
 =?us-ascii?Q?0dAgMu9jYstuvM6bRQCCqii1wVm2eYyIzUpwaNPJpvfZrszN512yXa7VaRgJ?=
 =?us-ascii?Q?H00YhFjouByQD1Nx7bHECboNiRgBn5iGWOJ32QwoncKiaQZCUMCMbrVIjGyz?=
 =?us-ascii?Q?mIcWqEabcRq1bs3lMYEpRmsLddkMfY2CUzBZ9wIxF4PElOAtxfOATsiCs5xP?=
 =?us-ascii?Q?YGB7uILWqsnXIFvqaEAvRT+4S8Hao9TQCgTTHP8FonY6MSd0UfJ3calUtlBk?=
 =?us-ascii?Q?8iJsTNjT6cgtFrlrIx7f2BJgqkmYZwWNRoIJvdzPhEFK2XWv/9axK4XcLWWH?=
 =?us-ascii?Q?4XmSJe5qO1tHJArnYIkhduFt+odTyzBjV79C8krtSDh0TOVWiEo0pJpm7F5X?=
 =?us-ascii?Q?M50fA2UfcftKAlqD0iBQvI3cLlCgrJs5XPmGI1q6ncFrEJYfeav4ziWcP0jC?=
 =?us-ascii?Q?Yud2gMMloa7KInwLahg2h90HP+xdQXlksPIJA/SMxQIzflMOQdRAQDWrA9xs?=
 =?us-ascii?Q?YMeIXgxKqQ7nzOoFTzxab/gI4MlAh3H9KBgeloszERCjHCu3CheziNjv7adr?=
 =?us-ascii?Q?DEcY2rxOm5nN+8cKu7lVv5Fz0jtgWkEMVfjPHo+KxH+RzAyMQkv5jUwjE2Il?=
 =?us-ascii?Q?/iyy+WeDIvjyRPTbR2USgei8pyLISTs89cLM3GzDKnZnHrPEkxuZG30UrysA?=
 =?us-ascii?Q?88nPgfDM9pJUyAXx9+9f1h2/qfJM2YcxRockSursiDL9rkh8HlJ2dsO/5qNA?=
 =?us-ascii?Q?6FSGCtKBcs22MzWGfwscgG0JLxb1aNktI8jekOLeyvLnWAFWOSwv27N9jmLa?=
 =?us-ascii?Q?F+DDNkk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dcSnUtxKC5OacpPfDc3CA1Lo4lgtHZEnKvLXmX4qfquyf31caOWqtk6qW18e?=
 =?us-ascii?Q?nuDb/BJP7kEQea7AVPg66UConEsHalQeHLV4iKBHnZxZLR50krbLCHknxTOV?=
 =?us-ascii?Q?/czn0vmleSaMRug3Hj00AWIjDBNHsSctIWdweVbIJTrCahHIvML70Nkq0wFo?=
 =?us-ascii?Q?dhxNl53jacl6WdENymQ8KP80ilDiW0P7ra+5nekqw2SXNvPTbuRb4an4BSRg?=
 =?us-ascii?Q?McmWobvu0S/kwgiIcETIo22+erEkmewLWX8vktmlWKXqQCkrOfxxULKT7W4c?=
 =?us-ascii?Q?w0Gvmi4RwV5DQ1hnpOZKEO9ZJN3MHQ3VPBcYYLmFfRDIpGwRYjr1r72yN166?=
 =?us-ascii?Q?SCLU9ONUwO4lq7f7mPi/ZVmFrhSZTIde19afh3CB6qB/V0UFnM2PpZYL9qZF?=
 =?us-ascii?Q?2Afa0lnPI601OpnmaKbmUb5TnsXKEOrPKXdQBmTWYnMC21363PJD3jtoJrYk?=
 =?us-ascii?Q?xl5IwTwCOdyZ4LPofa4Wr+p49aUIUHvWN6n9WvvUpf7kKN8viyetPyge+nHg?=
 =?us-ascii?Q?FzdinUuuvQzvuT5B36lpSIqYNSt+ztWFjAeNbiWbRgBcG+317UsCmKMgyZZD?=
 =?us-ascii?Q?GWYz2orDYAG2iGSp8/GzoqShIp89jNzO0b2i/BecDgMmiRJaXadUKhCRGee6?=
 =?us-ascii?Q?uiuO8mwriD0YTQeQIN8Sm4LUj31PPQs08j3HyaRg2KLzSwH7Q8IAPf88U1m1?=
 =?us-ascii?Q?DxqsTKKw89HY7iu77r+9KoyUqzqg5TZkR31u8v8wO2YJnvG7mT2sqlqfsfou?=
 =?us-ascii?Q?Eq0DYpA1RjmNvQ+9zW5VNkFEwCwQy/s4ZW1iMQWWAAcB84657nj9rIKNELW/?=
 =?us-ascii?Q?t0WB07b5OxGMDkajyUS3QS1wJR1cLQWhRnBXUXqDUx01xdiyY9aSHnsluXcC?=
 =?us-ascii?Q?8xb2sQsbEzer6U5pj17Tuz3UKpqOvp/LI5WuGHgYAlesNT5x9iici2MScl0M?=
 =?us-ascii?Q?G7WoB0J9bo5UKUToTL+rwBqDcjYyx7yzgPBo7JBm0P7ZF0SbgUAk6hAEURII?=
 =?us-ascii?Q?HrYvBDzqw4cXuezWQuf2QvFp4XSgHjVkXhIsjU1ipFCnlfGGGsXdnpEvcV32?=
 =?us-ascii?Q?o8bsqN5iMyDKuiFbPrBrsOzmTA8kgG7gBIXzEysD0Rbk7QgCP9z4fKDUmrNH?=
 =?us-ascii?Q?TkftrpfMW+nBLqnyr9HbvXR/wP3XcbKB7AhIJWH0ruM3jJ6RZ7hO0laTysPc?=
 =?us-ascii?Q?erXoXtiVnlhxLMBo4X6lQ4rRuj2Grkeag6yA2oeTK0u82TipyB+Ofn05gek5?=
 =?us-ascii?Q?/LCQcTlptRwaawENF+kWPb+K+SOhZpCeiVx14MYja3OIipPqNB/WsBQ9cPwn?=
 =?us-ascii?Q?8mhkCr2kWn9j0oumW2DcGqripB0buqlc92Jx8vTOWFgBrC1vH05J6o+83icb?=
 =?us-ascii?Q?clTmeU+DVr6pasW5JSdTC6PPICV7QGGv/yZu74njGgW0WgCQ+QIdxchtQrHE?=
 =?us-ascii?Q?6suTdlJw9vD2tESedutPj66eSzHQa00xZJ6nYPhnyAdh4Oih4M/81Is9npUE?=
 =?us-ascii?Q?3uAsghIew/bz2KRfSiIyzM0x4/idwtw3pFI85QQMg6tB63n5E2iuV2iS2kiT?=
 =?us-ascii?Q?c32rA0SDaFMscNTRYR5uWYxrVtnMqMNRNq62hCZq?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a213cdf-fbfc-4b5c-830d-08dcf9759abf
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:31:08.3517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aklhE9Tk0sm42J+g9wIl+loFX1Ot+udDyesceSWfxQ+cj2Gf9ig6LULd5z65CjU42Ob31dXvySB4+QaVP+m6mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

Matrix_keypad with high capacity need a longer settle time after enable
all columns and re-enabling interrupts.
This to give time stable the system and not generate interrupts.

Add a new optional device-tree property to configure the time before
enabling interrupts after disable all columns.
The default is no delay.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
Tested-by: HeDong Zhao <hedong.zhao@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index c091f90..f0d3004 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -27,6 +27,7 @@ struct matrix_keypad {
 	unsigned int row_shift;
 
 	unsigned int col_scan_delay_us;
+	unsigned int all_cols_on_delay_us;
 	/* key debounce interval in milli-second */
 	unsigned int debounce_ms;
 	bool drive_inactive_cols;
@@ -78,6 +79,9 @@ static void activate_all_cols(struct matrix_keypad *keypad, bool on)
 
 	for (col = 0; col < keypad->num_col_gpios; col++)
 		__activate_col(keypad, col, on);
+
+	if (on && keypad->all_cols_on_delay_us)
+		fsleep(keypad->all_cols_on_delay_us);
 }
 
 static bool row_asserted(struct matrix_keypad *keypad, int row)
@@ -402,6 +406,8 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 				 &keypad->debounce_ms);
 	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
 				 &keypad->col_scan_delay_us);
+	device_property_read_u32(&pdev->dev, "all-cols-on-delay-us",
+				 &keypad->all_cols_on_delay_us);
 
 	err = matrix_keypad_init_gpio(pdev, keypad);
 	if (err)
-- 
2.39.5


