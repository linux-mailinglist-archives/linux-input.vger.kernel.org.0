Return-Path: <linux-input+bounces-5060-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09326933325
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 22:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34EE285E18
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 20:56:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED6E6F079;
	Tue, 16 Jul 2024 20:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="X/Wn3zDh"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3DE55893;
	Tue, 16 Jul 2024 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721163397; cv=fail; b=pYL1duEdVReksKvZbBwsL7Ruhr/iNhePo2AN/9ufogpsSLRPjbVlziWoPmCe3N6RuDfxf0ufaSoWk/svDO4tkEOygot5Xtsb45xGU1/mJvq7W2lBBTuomM/+J3xPsGd+tZozut1XFoeem9zE72vzLy3f4CVW4uFYD2XhXXPNRnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721163397; c=relaxed/simple;
	bh=kqjWbxk3HJouhZEcvIgJRJgGUMfAWdztWieC+Ygc4Cw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zy72cMVFdPhaBlCgD1hoeRQsQdHTvKIyHDp2bkjOvh4WFmRBG2NYXogqWOiC40BIDoi0HKaKEa8+eOK7vmjqetl9SaLft/mRAf9GVfkiDMCCg61U/SDUDLGV2TU3NV/7DCEKCH4k4PHbyIfGrD4Siqb/Z1601bqU/wWBN5mxzA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=X/Wn3zDh; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I94dlDUmtEoP4AwXgNMbFggEblKgQyCd0YlUfJ5wHmm3t1beQwE8earkGP7MqJWmKQYROa8vPqSlShrgbjzCu6PgNW66lrYM7gKzFWXgPHb5g66drQAT7o76HGpNFRwjz8FZfRstXnVgqiU9YOUXT1ZG/3eoVEuR2Q0+u1+8gc0Ps7AyC+pIPMZ7l8rkZDyhkzPSJVeaSW/eVamIfDtdBYxqJaY54/7gQ3Ijfau44ssFObBY9vW6f6dA2gVTbhnDzr2aXtOC98pWQoA9I0gNs/Vbo+oJ8DIoKdKf3VJuLBBPfToRMFkVsoRTlrlYm53JdwQ01L7pMVqeiu3/121f9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u06YBWKEUmICsR2R0IWtJBkOk/6VsgZ2sA4fmyAdXiI=;
 b=BtSKyBGLErT42AZtxKReU5S623D9V+Ci39MANRUuHhz06GadnHhfQZaPKpkUcvQ7dcZHc98Kmz9+ObRAuQXsz6hV/nzzTz34+4yysDkzkH4gQE0m7ePcitDYYbCDMK1EjrYqvgJ8QfGsp9x9HQTz4pnVad+dl4nMhGlQByfkq6PWujf5miK4FtUDr4bgG3mTUDw4bYegxk/7pddPBS4idX+gIMkvUbnXX2JQfSJl982TxNSq0fp6Mt9uc2FleUtF5vgRz5vS0ZCDnNFgqvjBtV2yXqD1CpdHZQjLUK2oDKNrVPpr9mE6DqrzS7aqdiDnNj9qofBJQBKeDD7goQE0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u06YBWKEUmICsR2R0IWtJBkOk/6VsgZ2sA4fmyAdXiI=;
 b=X/Wn3zDhTnE3bSUjyyovSh5ulIdl+fHLD3K+00VIjQNFr2c4zq0gQVTJmpoJegkXQV/A7mZSeD/lKjY+lvxIV3ypcin7j3uX+758r0CMf5pJ+26vEXQZmlLl44uTYbkmBxFJSyWxbQ/nOWW2zHdM2+s6FzQx54poKP2KcYmagU4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 20:56:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 20:56:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Joy Zou <joy.zou@nxp.com>,
	Robin Gong <yibin.gong@nxp.com>,
	Shawn Guo <shawn.guo@linaro.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 2/2] input: keyboard: snvs_pwrkey: Fix missed key press after suspend
Date: Tue, 16 Jul 2024 16:56:10 -0400
Message-Id: <20240716205612.1502608-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240716205612.1502608-1-Frank.Li@nxp.com>
References: <20240716205612.1502608-1-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 02932e2e-9ba9-461c-f6b4-08dca5d9c5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JqyprvBrlD1LGNeRQhEOCQDdzxx8RV97cZ0pDqq6dSXHpp8lcq1+ThmTG8P+?=
 =?us-ascii?Q?AIMOaRzy1jXLBxaTTwbwjU8QE+5OaBeRKUfmpqkO1XgHzM5x8hVLDZNCDLhr?=
 =?us-ascii?Q?NflsngugURPhqHEZSkBOmsFGlviSUowoCQiMxrlPCHdhlIbyoJKE2S7Uj0OJ?=
 =?us-ascii?Q?Wluw7n/kwH5+f/UB6jSKxnXF1IqLc/Yf0dmxNh7actGDW14vt4NEaNteH+5v?=
 =?us-ascii?Q?5ZTn1zHs58ScT401VRb+Rf1pGkjKZgnuDO4ywAWh7jolj3vUYC6CrLPntbE/?=
 =?us-ascii?Q?Fj+1zhw99hDabSnsVkTg98iZM1bn6bTUUSiJteo1AYPM9PSN3TBt3L8uuEqn?=
 =?us-ascii?Q?nNWfn8EfpDby44wBsfE59PVaLbigNyBjru9sAFU1SfRcedYhbdEUm7I58fTM?=
 =?us-ascii?Q?Ptg+w11z5aPyGaN5C24mWdItBgS/u+71EfNaS0ZqpozczTlKCICV+waU5Df4?=
 =?us-ascii?Q?W7jX2It3Ua5sSMHMn1Zr2UPzRPCJJDMZFwL0SVe84T6wu+HfYDpuuWUbs53G?=
 =?us-ascii?Q?HepzgNOPQqIIhlrie9UXGWtkKmXA4WhLAz0hkR9vPbt9OaTVTJrhdPbar0o/?=
 =?us-ascii?Q?q8cWbs5KJHIzSO2UjnTk+rE02yZoPahKHdqnzu9fXH6cDTc/8hTi71gsC2ni?=
 =?us-ascii?Q?JyPNxODptqMGJAN2fKEjZ3uNRHFU0icvQ3u5Zrd7QHlIAuWW3iWI9idOkv3+?=
 =?us-ascii?Q?6w3aLz5VVE1Xf/1Axra5qEMoFC2GG6RZjBhaOrU2Ytt5yGEH4z2TYsHvXe2x?=
 =?us-ascii?Q?BESl0LCe4Vllrz9pNKb/QW38YSz7JOWbEjD/GWQ/epqKsAls4xBTCcS4QlX+?=
 =?us-ascii?Q?TOMQrUIkq94oqlGYLQnR1kkWdhrNUkYrGcVXonmwe/Qr4hUW+TIiA0A6z8/S?=
 =?us-ascii?Q?T2STU7CPbmDxib0o714Rnud5D+2VRPTQIE/eJ++EEDsuDMhLpiJ+gPx+W6vn?=
 =?us-ascii?Q?D3gDMC4l0ZOD67TxUcaaiqeInHbWuceZ0E3LVlhVZk3H/qS24fVRPzJ8uGWH?=
 =?us-ascii?Q?M05lQHRt/JfguYg7pfRsXD27YaOR5dS/RujLRxj7Qm+TVC222goFb15k94PN?=
 =?us-ascii?Q?sxtDAbCRB6ep6tfZU2WNAoCyQjBv0pfrZLsNCukVTTHvl3nFuMHg42iNphX/?=
 =?us-ascii?Q?KFUksVDBx5l6naq83//wUUdRW59UadiYtdCFZ5t7uq45th1TxislWwtex/Aq?=
 =?us-ascii?Q?dM5uukIGJmGE1JFjnC4u5+0+Y4UpRxxphDDp62NJ51ci7GEaISxyatH1rQwa?=
 =?us-ascii?Q?bfJO/jRw4tgmOTHcBAIhyUMG8Ev0tjj6URJtC+JjeWpxvob+z2zbV/cHUREA?=
 =?us-ascii?Q?cf/EE124qgN7sD8zxGbMwTI/3NN6KO4glgmo16L/eUJAQa/jhxOwATGsKmeq?=
 =?us-ascii?Q?/hvO4F1ed9FcOnGBTs13oh0QHC9jwcezGB7DlbK+dCz9PAsJlRukjVBzwp6n?=
 =?us-ascii?Q?/j09wuqyZak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lOyaQydBI/Wa2y7NH6n6RtSRIWjJbTRCQE/eUTA/YcndTxox0SqUkHyPf8AA?=
 =?us-ascii?Q?zPhQqo/CQUu/2jopqSkw360loqA1iySJ1L2aA4+p9g7ngh5+CVCiLGq37Rk7?=
 =?us-ascii?Q?6zjeTGztt8+v47O1uJQEtJ75ypYdrxNuKlU1vxDjFUeWHvsfPY3O4AQakg5e?=
 =?us-ascii?Q?3Uz6VYVs7dFhfj2L8ULnep2Trg9gYxONpxUKp0fXc508DuR15vfy92UjE4HP?=
 =?us-ascii?Q?Zb8cTGWixlRRB97FWUbrxhP8wGh0MULp2V4XbSMHhgJK3Y/Am8FqYoRBLwC4?=
 =?us-ascii?Q?7VYMCfhySAPzL7xVao7ten4eTBNLYkHxQnxrTCkieu1zw4BSCWOfG6lGRwTu?=
 =?us-ascii?Q?IT2ijrnXO/Oz6oJeZvQjUmxx3WVpaHXjBMOK//N3rDjv4YWeVq85NG15ElxQ?=
 =?us-ascii?Q?gIOt8PqHzhkVqqfSG3TeRf8Bd1UGQ3O/kz1zHKr65qBK36II4lMem/NcPCgH?=
 =?us-ascii?Q?1vgNV05DFG+DVSNrivrv7n1uL+9w4lye6j4sW42Om8hZWgFJEjSUNGtmh+MI?=
 =?us-ascii?Q?HwQfgS3t2OZgT6II3x7LS5E+bpfBPSJ+IEMSV1qj+RQRgrpnEtOwpMYLFUnN?=
 =?us-ascii?Q?xcLE+P6MP5Vi2P3uSdocEbm94WOuyxMlT3RWFB+2mDVH3wmW0CtulCXHi6Dg?=
 =?us-ascii?Q?WvnSy7mlXcFqNFEAlceK4UI1vfEvSE95qkEx4WnJWXqllMlOsgFPUNZ1p4Dh?=
 =?us-ascii?Q?4Ih6R3p5qGRa2ZJdyqFmhQbJ4/0/MnGR5VIZ89aKFC6xG27GGiKu10D1CGPA?=
 =?us-ascii?Q?dMVr6cWkWYcZdysPw0bsNTfJohXPLsapG23zIfIFrG7bMTdghoOMmiP16/mE?=
 =?us-ascii?Q?mtK34OGVEaYaOimTg5updeVPjlctNlzO/etgVtVqa3oDwPlhnqpslSKvpvL9?=
 =?us-ascii?Q?iszlT/1A1ab4xT/q0AJBRw3USYzcQ5ZDgVGTgs+jXpSVmczLtrF8waiFplYJ?=
 =?us-ascii?Q?baMWk4CnVX5wM5cWjY8nHFuj5bR7aa+3NQ3blIlXEMr8Z6dQv75dSyY7iT2K?=
 =?us-ascii?Q?jGMbNUIVu/dW0BRSPJjjXAinkYe+UEErtMZd+tnSZLLljWuHL3c3C2Ah6Vxg?=
 =?us-ascii?Q?wXPKnz/mpS5WYOZcl9sZ8vJK8RI9XX/8cPcKJVaqv5wapcCJmY0F3iF8fAZK?=
 =?us-ascii?Q?zdHYxfWHTVjzFHbULwegethzxZi0iDvNM9CuJ5JlpXGWJUi5HImrVrmtXKz/?=
 =?us-ascii?Q?LssXcjMa6qcgT5iun7lk3eqgyPmMGZBkXswUKkHi1oi4NIWH3i7iyQAO9Xhd?=
 =?us-ascii?Q?7cYL+B63pEs2reePQzwV6iv5dnzsWoLPgM8o3s7BRoFo6RtTG8GMMtJZYJlz?=
 =?us-ascii?Q?S9ZY7FU1gUGSyuGNkiJoSI0biPGrZBWwMpPeVrqJBeHdoCow4P/dvVv0AtKH?=
 =?us-ascii?Q?vIKOX5aF/XeSTbPxTyKn7z5kA4wwIIyJ87AnE8LlVR6c5iu69MBlMr70H3Er?=
 =?us-ascii?Q?+RET/t3ZPP1FCMvvk/6H3g0J1D/YtCSoYNDsJPU5tV2fvIIzqt/J6R69yPHx?=
 =?us-ascii?Q?LK0ZxC8nZTFoaiCGoOBZ4+AM2XOgmmeKHByzR9Ilt+LSKkU0A8SgRhfdWnlO?=
 =?us-ascii?Q?G/XgaRhQLhaXDsy5oRl2ufpCh5+Vtp9tk4A3SCJ2?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02932e2e-9ba9-461c-f6b4-08dca5d9c5ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 20:56:32.8472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1dSV0QPLm7f0mJw6l2h6+8ijjTIHX7voUSbT7SWM72f9oGcDQg/FfC9K0c8QvJVfBtGql6U7bSifJW/6ZGytw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

Report input event directly on wakeup to ensure no press event is missed
when resuming from suspend.

Fixes: d3dc6e232215 ("input: keyboard: imx: add snvs power key driver")
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index b352148a0cfb2..a1c04fe8fe05c 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -37,6 +37,7 @@ struct pwrkey_drv_data {
 	int keycode;
 	int keystate;  /* 1:pressed */
 	int wakeup;
+	bool suspended;
 	struct clk *clk;
 	struct timer_list check_timer;
 	struct input_dev *input;
@@ -79,6 +80,18 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
 
 	pm_wakeup_event(input->dev.parent, 0);
 
+	/*
+	 * Directly report press event in interrupt handler after suspend
+	 * to ensure no press event miss.
+	 */
+	if (pdata->suspended) {
+		pdata->keystate = 1;
+		input_event(input, EV_KEY, pdata->keycode, 1);
+		input_sync(input);
+		/* Fire at most once per suspend/resume cycle */
+		pdata->suspended = false;
+	}
+
 	regmap_read(pdata->snvs, SNVS_LPSR_REG, &lp_status);
 	if (lp_status & SNVS_LPSR_SPO) {
 		if (pdata->minor_rev == 0) {
@@ -236,6 +249,29 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int __maybe_unused imx_snvs_pwrkey_suspend(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
+
+	pdata->suspended = true;
+
+	return 0;
+}
+
+static int __maybe_unused imx_snvs_pwrkey_resume(struct device *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct pwrkey_drv_data *pdata = platform_get_drvdata(pdev);
+
+	pdata->suspended = false;
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(imx_snvs_pwrkey_pm_ops, imx_snvs_pwrkey_suspend,
+				imx_snvs_pwrkey_resume);
+
 static const struct of_device_id imx_snvs_pwrkey_ids[] = {
 	{ .compatible = "fsl,sec-v4.0-pwrkey" },
 	{ /* sentinel */ }
@@ -245,6 +281,7 @@ MODULE_DEVICE_TABLE(of, imx_snvs_pwrkey_ids);
 static struct platform_driver imx_snvs_pwrkey_driver = {
 	.driver = {
 		.name = "snvs_pwrkey",
+		.pm = &imx_snvs_pwrkey_pm_ops,
 		.of_match_table = imx_snvs_pwrkey_ids,
 	},
 	.probe = imx_snvs_pwrkey_probe,
-- 
2.34.1


