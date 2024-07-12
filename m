Return-Path: <linux-input+bounces-5016-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0890793022E
	for <lists+linux-input@lfdr.de>; Sat, 13 Jul 2024 00:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E9AE1F22458
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 22:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB3561FF5;
	Fri, 12 Jul 2024 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Uh9UlnLP"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEFE1BDC3;
	Fri, 12 Jul 2024 22:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720824262; cv=fail; b=pMt3QslKdx9ynF5Mycwht7lGh0DD9CmQVeEXJrOtxfDfP//EKZB5BZVMGrt5VJJYQEuprXHBmG4dlG8A5HJP4xgMy631/fZBbh4YnJx0/b7+Oe4jYu4fhmjFAfZzR0j/K81GWQZ/oigqLNYacz4JT1H5l3e620/OzLoHPvBmehM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720824262; c=relaxed/simple;
	bh=94Q3jp5CIjN0i4xBe7GoqqedUYSgDrD9wnBe9HLhaJA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=n9ilLR2xzYCwwcI7Q+Cdjk8pFMnOscmpPM+9Fvb+mBSHnKkKIIjCPF8t2lpSyjw5NxxOf1IfN4ZwuuYpJU7eZ9slazBa6Vl9DdXgose86cvtkTNO9hY9gjqpStjsozzcqZb55hqY05BXfJeFUzvOx76qoEzhlccfCofuznqoqzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uh9UlnLP; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x9MPkP+5NgzjYN4c/mQUwdT59iXTa/hHxlxAST8PdEWJClwaSOIlc+i+ngMPgwKTpyvG1tPiU/oP70gRXu7Z91mjDbkE+aIbQTV4V2qG28uFttW1eoiAKBBlnQrFWBEt37Oq//0LxRq33aPY/vPrqvIhbNEa7Ou8zrwdU3jsA/Y8xYmUuGoMz3BbLQ+ZnlOxpGzQu6lhAk9AnFxXtYiVXS9VCC7FQuRyCn/LmTwDaEOhx5Y5Hfr/8SStkdYSBPmB8qOQ59YMsyTY9EoSulTiX1CR+JHWzHarbU7Ko5xlRr253iIpnN5qdOUKcQMOVMa8SIHkJQbpXBwd4mcck66e3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1At1qRQ966YIkNvxAD3/Z/+dP+7bqsMTYhaI6lzAXU=;
 b=rth/G6KIJQmAtDmjhnmc/d4DOqOTcorpyB4MVWlDl9TNZ1EORWk/aHMytm8RoCO+u7J9qfFtyj+M89PwfeAcQYZF3SCaB6MFgWxVJgSxtCkxtYz49Zg0MxuOk4gLVo4OzviVTisv5PnAx0p9ypHGMD87YSekXyFNFkADRsHSKiYX7xP+ApM/ez5frXiUEdKSXQ7w6ZbFWGF1AsQHFF00RJWGueuaG/4ibhJjT0Q9mnELSGby/G4pBzWCfjU2uKBRBU13beaXMO5xMA8G8sBDmN+aG1w5MFXf5JjhPmVUfDuvBBrfI3FV6P0B5OfdxCb56j9TIaSROZOQifc1J3W9PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1At1qRQ966YIkNvxAD3/Z/+dP+7bqsMTYhaI6lzAXU=;
 b=Uh9UlnLPnzGNyXyCQBUBHkElNOoQHfbZvAwDdhD3BpL6c+j5chGzM48/PVP09SqwqRqucHetXFH7ToFpijfa3MFh4yimuvRJDzBKpwauhqEYGZM/C6KPEuwzde3xXjjnZxgLFR55gM8h5Gm50+JNgrYvQmodt7AaqMwKS7UJVtg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB8460.eurprd04.prod.outlook.com (2603:10a6:102:1db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Fri, 12 Jul
 2024 22:44:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 22:44:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] input: bbnsm_pwrkey: Fix missed key press after suspend
Date: Fri, 12 Jul 2024 18:43:51 -0400
Message-Id: <20240712224352.82190-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: f68bda36-8aa3-432a-d664-08dca2c4292b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Tjs45ycOomdN7t4g2KoPUnUvvRh5hyTPCt0hs7qbH/P2sUjb01/w0RJZkhi?=
 =?us-ascii?Q?g8o22VRkRX+mZPDg9FYGkMHSSX+mRi7ThSj55wl4drRHbfGPCRpj/tTVrj2q?=
 =?us-ascii?Q?5o5YSFJnBsq2oxSCL/vcCDOwI6ytQYJIaT/U5qVjuZcyrFyWu7dajHF8BYRt?=
 =?us-ascii?Q?Pp5qfflQUfLaegOAJI7aj8FW/1n51o/RWoPrc3IINEKJz6ZX76jAbtmmFjO6?=
 =?us-ascii?Q?gDas930BM/SwcfmvONSipDy3AbsGcaeUFQ9sLVeTzpAjZCtSPXq8CNn1RrUs?=
 =?us-ascii?Q?gQfkivMfmiWLtGgN2d9D1MVasO+Acghp2yeIIq8+4eerb8ckxw3R6uCH0Jwh?=
 =?us-ascii?Q?2gBI+/HwnyGK74PWQsy9tsspOYl4kGxSPmV+JDeVGJUX6GJr2i35diH5jRZj?=
 =?us-ascii?Q?c7KdpcLrIiqPj9KbsxKoqMhAyui0lAuRWgFy7eFNtipGWx7KG4PKBnOPh2VV?=
 =?us-ascii?Q?AktSKQTvhD5MUoovJNtFBoYFxMAaxrMdcgkikcNL8ecttc27/UKT4z4Ujp6q?=
 =?us-ascii?Q?8q6vLGLyl50Nmla/MlpfbH2lbtT5xI3/GP2Dn9g8dPB+iHC7Zhk0AljvH9QJ?=
 =?us-ascii?Q?bisKguMU0Fg44BJ5gzB1u3jnuIxSB+FLtpl1KqF7dsO08GHFTQaWWwcTSc2p?=
 =?us-ascii?Q?4vVtTmRjX5Vgu+pt5r1EnvSEXptjpXE25AIIabQ6Jw4xlsmAs+c1vb19jd8i?=
 =?us-ascii?Q?i/RKBVX8E1c4uDjjlFpxJoAtQa9hHL4NCw0VEtXZeEg+BLL3WXHshLYsXP8j?=
 =?us-ascii?Q?E5uTf+GOFOYzQxQGnk4OZTQenF2S38/E4pA9x2z9zZG6vcGHdjORNKfDbP6T?=
 =?us-ascii?Q?hk90jsL56tP+rRtqe8E/MsojDxYzWapsXsIbH7TX8QiaFE739k2iGMnaeeWE?=
 =?us-ascii?Q?GFsnh9JpaWNYib2PZ+I32pRO7Ill6mhwOdBdJyTdFeduj5d2JxKMYuDY4vkO?=
 =?us-ascii?Q?XMXel5gkNe6Rext8KvDSmFHGfl9/8rBNwNFX/itIJlpS0+fGwrNM4NGJZBJA?=
 =?us-ascii?Q?jkmxAVbYfNIJNlwNmDWFlpLB7m3zPC0W3M8VxiAiRkbDIxPWHxGcaeObjUGY?=
 =?us-ascii?Q?Il09+5wz0XWeTyUVt3wSyTGlWkzD53At7LIM7tR2QSSdR1xhL/IFSyTpLEVS?=
 =?us-ascii?Q?Xi5UjWkO4aQrctFAdwkZnHqJBQ8be5Un+OZEw8+a67jya7DW/+mOq6hgDCV3?=
 =?us-ascii?Q?8sC/04v16OA1jWyZtWcyjN4BuOcWofyLHuB3dsz42rK9wstdb3he3+dHoW17?=
 =?us-ascii?Q?tb4NCMC8ZYGa9NYaDYeNU7+zudaOjDTCu0JhgulEfFpz1zEAX6r9hDX7mEMp?=
 =?us-ascii?Q?ye3tLIWgQB7El8FpOIctzMV2xS9cyODNAAD+H9hq9rJ5++5XC0BbIozJEy6P?=
 =?us-ascii?Q?GdHXsxvU+wQ8WsqVsde3eASag3bflSmprzslnOzK2N5n8jDJZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HANVajNxGDwBCVXYbSsrC2/dU25n3y7Du0Ckjc0d8yIw8wnCLcqFTdhUnNJ1?=
 =?us-ascii?Q?ytuFpjtViHFobCTRU3Tg/6HkskR5XO0NaCf5gluMY1HLS0JJBykPPU9wDSCO?=
 =?us-ascii?Q?zPdEeidDXnOvkBKSMOD2QAcidwN5YV0NZ4Sz72zGw0WV9r6MWlN6UqYhnj6W?=
 =?us-ascii?Q?EWREFYPCd9gcMR6Xh15AV+gQ8U9tT+M3nfeu1TUuVCG9ZVmVIktYEGGmZ1Fs?=
 =?us-ascii?Q?1C8PhunF0prLqxjdl7gPwQ/+MXF+QkiONJKbYsi43X7QcT5FeWKxNl5kD4M4?=
 =?us-ascii?Q?81JZaL5qG08WaAstVVUj6f388C5LU+Ydl3uURk2QXAstYuBZhk9YDfvbOb5q?=
 =?us-ascii?Q?crbAT5/FYKO3wREK6muNA4zKotUMfuJt+e71jM+Vfxv1pysQ/WEA83MWAOII?=
 =?us-ascii?Q?FBTCsUnBZGL6eeZdB6il3sGw/jNzWEiIU57/6PPstgXsY9NPeuYewKmm2DBX?=
 =?us-ascii?Q?eHiQX4TRy1q0E3Kb68oQrCIlGvMhjfbpvuaRRUfbbLD9jWCh4ht1wf0bQuFu?=
 =?us-ascii?Q?AHS+2E+k6WfFJVnYnswj6hiSS2kMr/vGKP0yiYYDYd8IIYVseHYHPrzYI0wy?=
 =?us-ascii?Q?aWMyJhG5gTKQLwsgU33JeK9POWrPdeY2ao+ti8fvJVWYGOKoW4KngNE1qyj8?=
 =?us-ascii?Q?BNV2zJ7YtMSMPn6Hum/DZ+S/+wZFKGonvg4CfiBqTlJwqo04/Ud8kSZyWCOX?=
 =?us-ascii?Q?1ljeFgXH6An0/XoXAsmKwIR2b07dfnOvi8VUuT0sgZ7o7HIRsIFgyCIk4Obb?=
 =?us-ascii?Q?D6+P6ilZRZDx9/J6tCbAQ75y/OP0e9E+vO+mz36wnH8+zJ3DTEZcHPjzK2E8?=
 =?us-ascii?Q?oO9C2EAEcS478YMT0nk9VAt58tX1G6XXxjuyfpdAoD0o10Sd8/BC6z2/xhUW?=
 =?us-ascii?Q?PCc0jxXCXM7e8Hb/9ZmAvnkqQ5ThOVBOQgms5yFNwTRpVNX4FAEmOnj+o+72?=
 =?us-ascii?Q?l5keMzroHeXtcsfSlmHZfPa5zX8FhZEV+9wkhIj9LqXzs5nPbRvKp6ZU5NQu?=
 =?us-ascii?Q?LA4smGIaDmH+ak9jKyqFaLWEcyRPeBdTFZVpg9YGAabyKpabkHFNBIM/a8l5?=
 =?us-ascii?Q?CwWdmifObpIC/nz9UxDkMgO5ir6bkheopbKbxw8pw5OyF/LIVruwgJj2+5XX?=
 =?us-ascii?Q?axVAu8c+SLvgdBbnywPvkFkQUFnZg4r7guE8YC6maVpEcjNbK3QjfXcuXCen?=
 =?us-ascii?Q?dAsd8OfHhL0yVNTQkNXr7p/Cg425fkjLdw/ppAYXhHEOMT6PeRxGY0ShRG4m?=
 =?us-ascii?Q?2iMiFoPWYH6gXmIYqrW5A1uxfK8KGHeOaUSUqj5i5daeWahehtrufFOuQQhd?=
 =?us-ascii?Q?YyMLkR2LeNRlbM8GKMfXTa1yWDR5f2+0izxvo9NohQpD5BHMnRS9/uHcYumG?=
 =?us-ascii?Q?h2Gj0Cv6xK+a4rshiBUgNZMkJyLTOFslahTrdow/tIVuUP5TzepUn70sYzhR?=
 =?us-ascii?Q?bfHf4Tr5BUPzR3Li4OrYRo9B43e2IOHf9RWZQeFGOethjiOvtMQoj4kqyhAW?=
 =?us-ascii?Q?k6ygPW/3BfxNnSHUbTL+GzPuJn/B7HEcn4uWWUNGFum0Ic/M9NB3i/xyCsRE?=
 =?us-ascii?Q?nJUhWAmLhRlebY2j9ALtjQkkAp5MRr454amLP8k+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f68bda36-8aa3-432a-d664-08dca2c4292b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 22:44:16.9181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw8fpq4ujLU6tPp5oTEV4CJEEQvocNMIzHIYPAImye/xmNBJP9QgwHaZWv+JiMe+tkTh0G3VYq+1m0aW6Zw7Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8460

From: Jacky Bai <ping.bai@nxp.com>

Report input event directly on wakeup to ensure no press event is missed
when resuming from suspend.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Jason Liu <jason.hui.liu@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 1d99206dd3a8b..9675717ecbdfe 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
 	int irq;
 	int keycode;
 	int keystate;  /* 1:pressed */
+	bool suspended;
 	struct timer_list check_timer;
 	struct input_dev *input;
 };
@@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 {
 	struct platform_device *pdev = dev_id;
 	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+	struct input_dev *input = bbnsm->input;
 	u32 event;
 
 	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
@@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 	mod_timer(&bbnsm->check_timer,
 		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 
+	/*
+	 * Directly report key event after resume to make sure key press
+	 * event is never missed.
+	 */
+	if (bbnsm->suspended) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+	}
+
 	/* clear PWR OFF */
 	regmap_write(bbnsm->regmap, BBNSM_EVENTS, BBNSM_BTN_OFF);
 
@@ -173,6 +185,29 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	bbnsm->suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused bbnsm_pwrkey_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	bbnsm->suspended = false;
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(bbnsm_pwrkey_pm_ops, bbnsm_pwrkey_suspend,
+		bbnsm_pwrkey_resume);
+
 static const struct of_device_id bbnsm_pwrkey_ids[] = {
 	{ .compatible = "nxp,imx93-bbnsm-pwrkey" },
 	{ /* sentinel */ }
@@ -182,6 +217,7 @@ MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
 static struct platform_driver bbnsm_pwrkey_driver = {
 	.driver = {
 		.name = "bbnsm_pwrkey",
+		.pm = &bbnsm_pwrkey_pm_ops,
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
-- 
2.34.1


