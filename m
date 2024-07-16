Return-Path: <linux-input+bounces-5059-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2946F933323
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 22:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC60A2857DF
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 20:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A3E55885;
	Tue, 16 Jul 2024 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VnSh4r4S"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142A8208BA;
	Tue, 16 Jul 2024 20:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721163394; cv=fail; b=a08AZE3kPADzCLo/ybB/27057w7BL3QGKCa2NC4QBce6EiyCpoT3ZS06/kobKkgNqNMEUQDvoWzQgFBeKGV15ss8nqQPBX/Py6lQ+FeFvSmRAXKP7jqCKL1mTOoo6M+UpYsn4qyaviaStKi4qbbZxSXOew5BNs437TephSNDl2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721163394; c=relaxed/simple;
	bh=9ivOHaghZuYXPCfXX6KDM57uoKVXmR0MYMGb9Y0mggM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=I/A5fNHAKDzntp8ebCymdNuB7/dglP4w9Cmk5NeMp7SK22SyO8xjDW/PjcUVvk7xbwkPMv3I0uzUAywCIpy5/F3jrSJy+3TpjB2quKVKzURLkczrQZCHfOZVHbXXxY1NI3kLu1UmvKKaJZEoRpC3mBxUbP5PHpwvziCT2kf490Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=VnSh4r4S; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XuvTKNpLgPwEiKa4uoXO/9rf28ivdtr4tlhwuFIbqS9bTfdRnDEDfSaqkQGBH6ZinQyZzqkKdg1K9gzjX2CMPeYZzD4Rm2X2syUbnRqKBMGn4sWoxkya95S56nEos1Bqnzuw92vVbjGelT/57ZhQ4HTd/NprzSyIbZdAFYZIik5KoWkOUebylaRFiJYmrcI1gp7AoBH2namqhUEhiiGVXxYVOQrfW6iJZQw/fLsv/7T7+92Uxl1rG8mzlFP1rJ1EMKiik68uBUPDBpSIV+tzXP+BYlHEu4H8Qmpumj/R9BOt05Y17y2PbnhhLyUFriQn98BnImqZmAvYnBY4yFasog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ud62kA0JhDhjofH3ZLNS3imycfAhXeERPEH4QT7cyU=;
 b=flqz1RhnQ3xgmJTKakHFvdFX3s8frcRrn86SV92p966tJf7JsPxHnjnLYt+/XHqWuOC4Xh6WCH7byTVhHHuevOgI1yBq7C94nN7yHB6hw3ZAA0jtF4/s/Xb1RKY6o9cFuG88CkU7TwjTmFzI5XRPM4mi5BmHE5TXpUPZe1G6ejOfKLtjZfxAKdRuK1uqgqYFyB0iqO0nOG4RfnuNi4EY8PhMjYkleGvvgTkzyVg+gcxb5vodu/pLLmJXewXNV1xAywiag4jI6HFMa3z8TxdlQYkSZgjm9N9azv1GPptSs+aALOA8swgcToOdm67/8jjJ0WIWtcosnYBLvrZMyCvbMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ud62kA0JhDhjofH3ZLNS3imycfAhXeERPEH4QT7cyU=;
 b=VnSh4r4SKQ3u+qwYQQmKwldM5PvBpp2qOkbNx6xzYDgYmbLyLOx3vF9QUHmUMA/7JVEmQx0Ue8rVrkVdsaudwVsCmvvON2goxm5NPTH2gkBQCp5osrGLgcAwwZnfr5wwwuweUqnqCzFD/iWdQt592wTM0Rmfp75toTKvhohXeeA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 20:56:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 20:56:29 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Joy Zou <joy.zou@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/2] input: keyboard: snvs_pwrkey: Enable clock when accessing HP* registers
Date: Tue, 16 Jul 2024 16:56:09 -0400
Message-Id: <20240716205612.1502608-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 382ff15c-4953-4f74-c301-08dca5d9c3a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MT1RavRvQqw4CUPJ7YLYi3qVTzH1ubejF+4121XxUchAWAa6emC5h58tqCp6?=
 =?us-ascii?Q?vKtS/+IHWBANdpyt6YL7JaR38x4Ogaq8oCMyeHZAlWoDjI10scucG/SRrxQP?=
 =?us-ascii?Q?6TrK1fzmDPSVYx6AJ9tK0Aqk0honuFG2tHK7dRWC1GkHdagUB5nukraoyVQ4?=
 =?us-ascii?Q?TH4KIHm0uj4vTXhc+tJHX408+SYmrHxWb8MY120+1B1B7YpENUxdrfo1gPIL?=
 =?us-ascii?Q?BsaAAk7fZ6+REFijB9bXxAEoEBROq0G19ILAVLWw7QFDx36JO99jg+GAoIV1?=
 =?us-ascii?Q?APzlNdysfjBU32oZ4x/phvO0g1BvRjpazG8bZI8d8cNYfDqppP92ifSpkj07?=
 =?us-ascii?Q?VmhrFIgZi2ex3U7iaYwoL3EgQGqHAhCZc1a9itU7Up5XuyeTWnhP0V61Lx9X?=
 =?us-ascii?Q?+u909PgNaDyjiP4y/tvFue2cV6k973LolDDMLuMwvzhF/C4WQ7/Mmto+7zvD?=
 =?us-ascii?Q?P1+AqlOZnJPtDpF5jOVQI5SwlXbHnXVPvS/T/RfGtjRW12zOUbDWWkrWxRU7?=
 =?us-ascii?Q?xVyXzJP5e1vslTSRofXWASYBAD6J3GUm+F+uSzPk9QJ/VWzRbS+kLJnOFwZm?=
 =?us-ascii?Q?g0c1TniW0psB4OpQ034aFYkSNXQZQRQG2/n8DQ/Bws3np5teXiN5zEthHaYn?=
 =?us-ascii?Q?jAz43pjDIy4fH5C4TRZVVOodKF7nnJrWE3vNKykSfOVBtxXVf4zt8w6MIXFj?=
 =?us-ascii?Q?Aa8v4C1kfnxVlf1Ye7E/zT2GOYLB+yKzPYi1Dy/UUn6999La+GSr8ZZnjJ7h?=
 =?us-ascii?Q?4OI+XsNvcbqCrJENnXv3NRm+drJRJ55wSoCb4SkMh8tiihkkJej+0EUkEnkZ?=
 =?us-ascii?Q?DQTI0ithPHutd0/f7aDsoQ5wecxLi5eR1kQg9NmylpYl7BEQTi8GgMh2CZdB?=
 =?us-ascii?Q?qJJRSzuXz8Nubox7hQwp6PLZpgauECbkLNXk+v81eRPA9CkpZsTJHfS9K0UO?=
 =?us-ascii?Q?wgaVmSr9l7mzGpS8q12PNn6A7OqeobiBsOS5EsXBHzjG9hDdHyMSG5dFl6iy?=
 =?us-ascii?Q?MYY5kuOZ+BskuLS3BZqDABHpFwO63peh9hqVINRKDeK7eRNqol9V9t7BaTk+?=
 =?us-ascii?Q?a/EPtoImWEhDioNhDRfAP3qeUvHQPKCpsnUxVuuK3XiGFt2ErR4DSuPKEKhe?=
 =?us-ascii?Q?ode3DGCl2i0Cmfy/rfVptf2/acfqJlkCv9YVDF+4amIY/PoP18rAUPLLsOrn?=
 =?us-ascii?Q?GsmfWs+r2BupecXFOZZ0UWIIwuVruClYVIi+fIjfsdlqHGT3SS2olw6Lftln?=
 =?us-ascii?Q?AYAWefqwDIdFPyQU5trpGB38ZVs8KMGM0O74SbWtcOlvW4fIa/1K3mNOZ7xf?=
 =?us-ascii?Q?H/tkq68wicsoSXOPGVZGADlJVrc1St3vQ3vMpHSc6QAsyTaCOHQIpKnF9egy?=
 =?us-ascii?Q?vmT10Z1mb0RRTf7csa9s5L2WzuSIiqpUTcQcSFxMR1VmpegeDw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W7XYpVMVEcytNrMxvFYwnYhTR68Ggo3HuS8CgnivQV1Ej5f4/cKux5kQTqR+?=
 =?us-ascii?Q?VSucFOyMoxEDb7KOwj8L7ekxdYEeyR6q8qvE9aWn6r9rB1Y8dZDGw3bheuQ+?=
 =?us-ascii?Q?twToB1wFYcsqYdRbz9pjt+L1/bfEqAKQSvByNivBqRPvvYJ2FdhBg+ZW/sCV?=
 =?us-ascii?Q?DhEw0/jTelJ7oUpGN7h9ujlwKs76EswOHqPYsITMWGAPkoUD/73UkA4yPCHe?=
 =?us-ascii?Q?pklhKQ9MVjI8nxQhqefT8o3mQgJ34x04WmIuBvf5AwDh7MknWjiqkAlXOV0u?=
 =?us-ascii?Q?QprkJ1WMw6Idnl+PUNrhBO/FzEazK6IpyWaw6M4nVABYN761K7sv2aR65TT7?=
 =?us-ascii?Q?kLk/PjlQZOCfACaVhPNyT/0X5yqzLkfb51hpz+SP2DIGI1hUjIKaa9J2WCUs?=
 =?us-ascii?Q?/6RP1guHfa1fT39iVTu4xnCWfhTxdNbPHw7MKGml5+xNUsmPAltj2GF4x13q?=
 =?us-ascii?Q?qumZhWH7M0ksZerjIVMvkMfRHZavleiDTJaq4ypuQf00YdbPBC/RZStIrd2O?=
 =?us-ascii?Q?kdI14D0TXYkpjzFaCB3lIH0h6Gj7HgTMVV/buuqGpbaAo7f7XALrh7di+0BP?=
 =?us-ascii?Q?rmQQ+k40yoENsHcPIdJSa/lcve1W2IuVIwIxdWwzIaRPOXfbUVAX94Q40f/I?=
 =?us-ascii?Q?8i/yD//sDS/qYoQgYr9Qx3F5Si6SijP8soEXwugGX3DWydjwxP/Ow5W8kj8j?=
 =?us-ascii?Q?kbt3R23m8vyqReWtTsBiOoxPvR0kgvQ+hrXGsjxkWie0uOn25iszP6lxRx99?=
 =?us-ascii?Q?UK22rBjgvC+xz66de/kMKO5hl7HJnPXC+8fdXrCHkOykE5Q/7xCikmdwGblJ?=
 =?us-ascii?Q?hWo/V1TrvSmfKgOuGHVvnSk/dgJ948wUv6T1eLaXOg61P/glKxBlfe3ODBXZ?=
 =?us-ascii?Q?nCGXjhenJI3akuBFpZRqers0s9pzadPWndtA1wmIF8PRfSyzxjEQlvZqp4fE?=
 =?us-ascii?Q?FIhg0kjv6bsrPqsQ2JYDlgN20dkDQceL4Nx1nR8iegVXrE0p5Mdp8rxn8w2g?=
 =?us-ascii?Q?eQCMeNhNX0/+GL93Vmbvo/e7R1yNm87fhNg6SeZTgjUc8BCORZUDUdxM01Q7?=
 =?us-ascii?Q?9ClqpEs4lDeKypE7fKNu3XwpDxw1Le5TnibnKUjj8J6zWWxoGavGUYMudiHB?=
 =?us-ascii?Q?N85WvwWO9fDRJBSU7KUQyioOKK3XhK9ijfq2BrJJ8ha/wwVQJiwLsQAXYH3q?=
 =?us-ascii?Q?mh0M6M3OiJJSo4YisbJkrovDqSWjs5EuG18x65M1hHd1nT1d20w8aGsjmeHD?=
 =?us-ascii?Q?KqJOsS9zyxqEWiN6qcPP7+VnqdgrqdDUpdkX1f3rRiaQ99Z1fwKrj+D2q58Y?=
 =?us-ascii?Q?spuN3JAHN1Z0e2pi5KcrBXJqrRe5VAxH5bsgCZkeabOBUimAOsLR/yETL/tT?=
 =?us-ascii?Q?PR0Pibug5z9UgPljRtpjIH0dNdp5Uf1fkPkvn9mjtCq3ijj+iTTVlv+hQdPG?=
 =?us-ascii?Q?VmZaenM6K1oHjV6zibf0vwKcW5BeOjXn9n6VlvQ2aVzXt2TVxSEzFbYRLI5w?=
 =?us-ascii?Q?JyDRZ0/INErocE910Joz0d31CBTaLXYg8SHPQRrPcKg1V/WPcfrPljriwFAh?=
 =?us-ascii?Q?K+14vZGvOn3x0W1UXNA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 382ff15c-4953-4f74-c301-08dca5d9c3a0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 20:56:28.9820
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExNVyfw57GX5zCWFi2e37pvaWvTcfbjzF39nCMpUjF9jaj+j9znQyG+PxRYoQjiOAEWeCwH2FGNxKCserSJ9Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

From: Robin Gong <yibin.gong@nxp.com>

SNVS requires two clock sources:
- LP (32k always on): All LP* registers need this clock. No management is
needed as it is always on.
- HP: All HP* registers require this clock to be enabled before accessing
these registers. Some platforms (e.g., i.MX6SX/i.MX6UL) do not have a
separate HP root clock and it is always on.

Add an optional "snvs-pwrkey" clock for the HP clock and enable it only
when accessing HP* registers.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
- clock name snvs-pwrkey already documented at
Documentation/devicetree/bindings/crypto/fsl,sec-v4.0-mon.yaml
---
 drivers/input/keyboard/snvs_pwrkey.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index ad8660be0127c..b352148a0cfb2 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -37,6 +37,7 @@ struct pwrkey_drv_data {
 	int keycode;
 	int keystate;  /* 1:pressed */
 	int wakeup;
+	struct clk *clk;
 	struct timer_list check_timer;
 	struct input_dev *input;
 	u8 minor_rev;
@@ -48,7 +49,10 @@ static void imx_imx_snvs_check_for_events(struct timer_list *t)
 	struct input_dev *input = pdata->input;
 	u32 state;
 
+	clk_prepare_enable(pdata->clk);
 	regmap_read(pdata->snvs, SNVS_HPSR_REG, &state);
+	clk_disable_unprepare(pdata->clk);
+
 	state = state & SNVS_HPSR_BTN ? 1 : 0;
 
 	/* only report new event if status changed */
@@ -169,7 +173,15 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return -EINVAL;
 
+	pdata->clk = devm_clk_get_optional(&pdev->dev, "snvs-pwrkey");
+	if (IS_ERR(pdata->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->clk),
+				     "Could not get the snvs-pwrkey clock");
+
+	clk_prepare_enable(pdata->clk);
 	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
+	clk_disable_unprepare(pdata->clk);
+
 	pdata->minor_rev = vid & 0xff;
 
 	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
-- 
2.34.1


