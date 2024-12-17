Return-Path: <linux-input+bounces-8649-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F38A99F5978
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 23:22:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B31D91884207
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 22:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314451F867A;
	Tue, 17 Dec 2024 22:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hbrTB9la"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7681DDC3C;
	Tue, 17 Dec 2024 22:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734474083; cv=fail; b=LV28a+tBuUHrG/U7RQHfzka6MBhK/9zwdMObKwP4qOyLgOVx4N1ZJUFyxPcba0OL6sz7FupIQGHCzZ7iQgMn+yTIos7tbjYPZ2YbpdambA9xNFOAQAxidWoKYS+R8TuAVRnKWZssdOW+jScpmiUw2azbk1YznO0R4zSm5GNCxqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734474083; c=relaxed/simple;
	bh=WOD76uDKbX3pR/Z4oDNNunwXxefa/pDUAZ2y3pohpNE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=t6TDKr7EvN/op5EhGp4FH5KRZtlGzFgUCJlry1552MBHxPA2g6BCd3k3du+mxqzXVPJuSORp+nIpQrYFPL9KH8YqP5iA9j8hJmGa58R1SlCjZb3In9nfUoZBwnSXjXmQcfEdbQT1f6HLUiFo7WRhmPwf1F/MteIj+5d5l6KwEbg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hbrTB9la; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yLictlqJnXWx4GlxgEU04LhQSFUNrrpe9LC+pykhLN2EoIgnVu6CTWix/PG8XaykDkS6gDdjd4xVYLySfbf40nLAS8MfrfG7XlLLREbZK9XUEm0uIxWHI1OoCbTnGQiBG+AXoH3sFx4gZtO5XZOHSgKhOP+s5WW5STNw3Y2cOI8QNnecEh2TMOmsnfY1B61TObZmkGIiobXja1OiTypJnHLhtixG5jvifvIFv5SZhHMvS9+Qpf3r03HrTjLpjbdXXF5xZoZrjBAt0iQCNLFhVGh4dtmBUK/Z39475qWGqdUTzx++jLCL0QWNVmtON96C/MedbTQYLQPkXSt6QzDAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VqpHgnE19bxYPOlAEs0+K5FPDqvEB3JHtpaUxbKMZaE=;
 b=ppzlQ7o6xIHq9BuClS3sbjkEu7Irvah+mktaQy8Ts6+9MI8d7I9o8ILe9tqFAmQYQRflgbl82+ovURTVjhPHr1IsXRxcZ9zfUKpLXk4sVsouIZ4i8urqr2+ielbHrkTwiO3ynRf+oYJOkfuiRRINAdSsIzA3yG07BEF0VZuMbAnl91j/9BMjFyobYEFIF1eJN8BinIPMYFGiukEkyM15hahUU3y0j1/w6jATn1JsT8141+bxEhTZQpoJpP2rZzp5EUMm5LRKE0i9/64FV6mximLvnalKazBNkTl64UUtcls78wuIzTgoVPSEd4EOKLcK3/wn3uk2MNfO8lI2D1+glA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VqpHgnE19bxYPOlAEs0+K5FPDqvEB3JHtpaUxbKMZaE=;
 b=hbrTB9lafHuR//bMMFa/xKuGBnES5XBdshdKhEH0A2AtCoWo1YWX15zjoaVU4fgMo/as17LoeKwHWgVFZpKTNSYz2URaYenSYGZMrw8/t+3MQ3StwvkNOlZLS46KNe0zO2OijcBK7AHUjPNryYod9bFTEEoyP2WhkvyDaNllLEqU+d8qKtW6QecABIshXKSlXvXvRPXXejEIXbKw+EuhtLtXlJxpKy3aWZxSLzab+xABQ/twpLrUGO6idkafd3JXY9rA4ypLOVDa6vLL1mkAAxwBJI4GrrWUylPqSr6UnXzFPEubNRPtTcY0XcM32dGgiKUnFEmOAscjIulA59G/WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 22:21:16 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::50c6:148a:7fad:8e87]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::50c6:148a:7fad:8e87%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 22:21:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fugang Duan <B38611@freescale.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Vipul Kumar <vipul_kumar@mentor.com>,
	Luwei Zhou <b45643@freescale.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] input: mma8450: Add chip ID check in probe
Date: Tue, 17 Dec 2024 17:20:59 -0500
Message-Id: <20241217222100.376752-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 93461070-4d13-4a5f-5e5a-08dd1ee91fd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5xGBeGjD/9iPTknDu6hGjCng+tGK+/WUtOskxFxk8mOiUWAG6cgJDWdSJ1bi?=
 =?us-ascii?Q?ehXKpMvdHWqAou+ASke/kGUZK3D4BkzZDZrrIuMQ8U22e8zDU2wTxoQLXXvh?=
 =?us-ascii?Q?kqK48Jgc1lxxioLsD5alpiy6R+7xczZviptkXrAl2lIp5EdySiHp1zywJ9bB?=
 =?us-ascii?Q?HQOsnelvnREj/w+eRx6ZBkgM74yam9aGJuH7Io6SOlZdPjdbj3otoJ5GxCId?=
 =?us-ascii?Q?P7P12TYXmaELs6oS7xYEDMiG1NSdlIbZBns101zKDEE5YEpJ7VOr6KhWrVTx?=
 =?us-ascii?Q?POpUBsenJjBAFOiz0mHzGldNBH0n4gaQfhWOKwUvvCiG290Es7ydvCj/fN3/?=
 =?us-ascii?Q?ojNW7qmzKQtuXZo7Z+tHRNm2cULjYwnxQ3uSatkm5weGNIGRv3JyIyYgn/op?=
 =?us-ascii?Q?bOJXaHEN0rh572PFA1w8Q1LOXHilCh/W98eTUxJDjX4VRwj9mm1VZwyClmqH?=
 =?us-ascii?Q?d7A+Ty3TVpVdpv4x2gfaLQiJ0Hf8BzoQF5JxaFqaYnfrJhJcK1MPEckG0LGR?=
 =?us-ascii?Q?IDv7fC2HkdesOvO6XLHscWKsPyAqhATLaVBItXyuvEOPr3iyk2FtYfgnWo1K?=
 =?us-ascii?Q?xbiZS4Vmr37nwRJ3m1xUl1eKmi//f2GjTIR09wuEkDy3xowgG1Q4QFDxlLj9?=
 =?us-ascii?Q?RovRfEnm+BekDbOZO2163sM37QNC50i8FUswWFijTnxztGumnpM1fquIWHKl?=
 =?us-ascii?Q?9MAlgAGZR/XNz7985SZiLUsoyZXidEtVUcNGIUIl3a9XjA88dfJOi9Ito/Ew?=
 =?us-ascii?Q?gm5fUjMYd4AJhYqHng5z/eBuICn6X71yGYCFC+PePovJAiRIAAVRcoFiZYek?=
 =?us-ascii?Q?KgINtSSx6PgB8u5m19+Ezq+rzaRG+DfJpqRiLMFcHNtCo1qb0k0YrxxK/h6L?=
 =?us-ascii?Q?FSv9ku5xW4pZMpBK2wNZK1Jyq1NWv0d9RjbUvHEyQJLLlz1WDzq+c7Rqftbx?=
 =?us-ascii?Q?0jL1IqATzQPHYcGR+eXTF+jRyvKOrslVU2R8KEr0Qy1xLWkK1DQaoxB4iE5t?=
 =?us-ascii?Q?ro5+Mdk7M3+kuiscjLq4GrQTUGoQivyj7/fPsRns7kS9FSOFzlsVxlV+VAb1?=
 =?us-ascii?Q?t1dJQ8Ltw6UH3M+9XlJYUpOWSYF7bimZkjDp/7EB8Vp4LFMhiGdsvnjsLbUW?=
 =?us-ascii?Q?FX+pnqtptow/t6ngeaVMzdp+b83fToJPOd13F1DCszvtWnu1Pe11ZYTeFeIB?=
 =?us-ascii?Q?XkhmMqOB/Mdp0StCzyoFcltHF11mzXl3UqVRv8sfje/IM9wMusL2bxbgIhly?=
 =?us-ascii?Q?cT1rsvtp5QsiAtCoCNv1SrAWe0XUQNv2BbPWN6Csm443HAiWhBxu6OVaXzkZ?=
 =?us-ascii?Q?5pHKCec0SAyFv78yuP5i9g/gLKYXVFwjrweSUDiEjFvv4l+e3k5sZs0AJnmE?=
 =?us-ascii?Q?3tQQnvXYNjLIN3wiAmqjxdxZ86X1R/706ggftfC4jXKGPr4ldxobZ8hmCm78?=
 =?us-ascii?Q?hhs+PkZAxRPW1AT2OChA6hEeWqnyvJm5FBMy45xlpAQDeYXGRl7hrg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WcTw+T17gIcmTX4YZYDsJeG9Usa5yXrBRBBThq4rqhFvheLwjPUUK9RIfRk8?=
 =?us-ascii?Q?pIInto0yi3cpm9RoUOJsliGd0oRqji0RZxUoClVTjbOEkS9D3EaNGscE/CEv?=
 =?us-ascii?Q?xuFxGAN0eHOssnhgAv4rhxt2n1h7VHGO7+aMTxHsvgpBBMW1glISCMxonakA?=
 =?us-ascii?Q?epm4hyaf9CAp5vl8HS1mbhrpaz+jmrHu9sr415oDMJZHLsFVFJLSpvUhEYLR?=
 =?us-ascii?Q?K5mLAnI4Vi0Ps6SopLjFZ6xcP1gzNSJ2GM14u603aA2mr6qo/+sICzTBVKaS?=
 =?us-ascii?Q?DkhPgGp3T3BQJjbhPdzmitLRIQ2IMm/2qOUXZbg5jf0bi9Pz7Kyb4lTY43xu?=
 =?us-ascii?Q?tAACOSzlIgVhSaRWZLx/aFM4qvZD7F4jKw3Rv4tYKvS3a8otG99jmNQdFZnz?=
 =?us-ascii?Q?FHuJSpK4kQwxMKbwS0UHyFYkAfRThXkBtZJWUlWL7v/Fl0iDKrGWX1IJNRRA?=
 =?us-ascii?Q?ApRZPqnfKmrYs89faOjgrB5j3IPNOEnWhLB9jwUB6oCFGiS8kCqu+h2BCIgu?=
 =?us-ascii?Q?NhtiZGhIa6l3Pbk50d+B8YvwjpQNyQYgdojhbyjbiH4N0CI4hx2EYlqG0Roz?=
 =?us-ascii?Q?WKqjlra0trpc3JTZgjocMxGlZ3rtQedqbsOx5tfeW9Wa8CF9+taeCg/CIMpZ?=
 =?us-ascii?Q?/pJe27sEg2gFtC6LO5fISBbJWDb03qMyGGDr+AhjH6S9YMlnD5k0hTlVW/2t?=
 =?us-ascii?Q?QlTJRN2c3M03BgMB1vJmgdnBeY2PE2ngkyf4heOpc7E+W0MyP6d5siOtB5Af?=
 =?us-ascii?Q?+FWKpFwImLQISF1ZcOHo50uB4vv6qroZMi6bTmht0bdXAPFUtbn9mrMoxpn0?=
 =?us-ascii?Q?zqIqbOyzrflinVvNYla/7le3rtkP1o270nUUtkD73Hcn+Q9Mykx3/wIREuoU?=
 =?us-ascii?Q?PlOaVosuLBmwv+BqulOAk2jju+iZWj8OtSWCxcobpS6t5LGMG1CXuk2QWqtp?=
 =?us-ascii?Q?dgTDO+4g+HDHyrn8OKgq2I9qCRn9djEwSCUMqotFP8WFEFikMqk15t62CAcW?=
 =?us-ascii?Q?MCVrT70VUGlB5le/eyEriFrcH3mN4lwzQwy4IGWThnj/aEcTdgDvDNs0Jy6A?=
 =?us-ascii?Q?fdnqPo8wHzCpOY6B6jmeBXztyAcUfaa0isqJdOuBb1ttt44J7ZNcXM30cowi?=
 =?us-ascii?Q?V7rOk1C+sS/sPGBbyHlV4+qNHESdbNC77jOI/i8E++beb/KGZJl8eZXy23wk?=
 =?us-ascii?Q?ehRR12OK+pYBj5X/wA4t9uGzMWWTUcMrr3lmu8u3SbsoDnZ7eznu9RdX8XLB?=
 =?us-ascii?Q?toAhQr/6qxROcjSYGXSLzL1/z6ou9G0Ek3foeBDuRp2Ut4psfYglQHNSzle7?=
 =?us-ascii?Q?ygCRLvYY6dksXxRyqACUiBdGHCkTsQpWH7efLxycDT+JzS9rvdDdVOFGxXxy?=
 =?us-ascii?Q?5/MWYMQikLULM8dmy7PAhcxobScKyFmiHqiUS1nGCkN6NOxsazSEQcTmH8Ay?=
 =?us-ascii?Q?EtWBcccv+7owVG+WVl7rioMjzSgk8yHRv0yD0Ida6BV6/Ybh17dvZS07QTts?=
 =?us-ascii?Q?LSJP3uRp5sY2ojnm9P4QhFBKDWo/u0iIJbDd5VriruZtLKqDRs0ilZJDrY6F?=
 =?us-ascii?Q?zSysynZrB5akFZMclAw=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93461070-4d13-4a5f-5e5a-08dd1ee91fd5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 22:21:16.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEHu58Xx+C3yG514Wp72eK55E20rhvMwpRXDMj80GTFLSTCPgPgG1ZFBQ2NSZiDXaXPSJkTFOQfHY60iz6kIPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820

From: Luwei Zhou <b45643@freescale.com>

Prevent continuous polling error logs by adding a chip ID check in the
probe  function. This ensures the driver only proceeds when the mma8450 is
present, avoiding issues in scenarios like missing add-on cards.

Signed-off-by: Luwei Zhou <b45643@freescale.com>
Signed-off-by: Fugang Duan <B38611@freescale.com>
Signed-off-by: Vipul Kumar <vipul_kumar@mentor.com>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v2 to v3
- add if (client_id < 0)
		return dev_err_probe(&c->dev, client_id, "Failed to read chip ID\n");

change from v1 to v2
- Use  *adapter = c->adapter
- Use if (!i2c_check_functionality())
---
 drivers/input/misc/mma8450.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index 08412239b8e69..5d1455bffbb05 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -38,6 +38,8 @@
 
 #define MMA8450_CTRL_REG1	0x38
 #define MMA8450_CTRL_REG2	0x39
+#define MMA8450_ID		0xc6
+#define MMA8450_WHO_AM_I	0x0f
 
 static int mma8450_read(struct i2c_client *c, unsigned int off)
 {
@@ -148,8 +150,19 @@ static void mma8450_close(struct input_dev *input)
  */
 static int mma8450_probe(struct i2c_client *c)
 {
+	struct i2c_adapter *adapter = c->adapter;
 	struct input_dev *input;
-	int err;
+	int err, client_id;
+
+	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(&c->dev, -EINVAL, "I2C adapter can't support SMBUS BYTE");
+
+	client_id = i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
+	if (client_id < 0)
+		return dev_err_probe(&c->dev, client_id, "Failed to read chip ID\n");
+	if (client_id != MMA8450_ID)
+		return dev_err_probe(&c->dev, -EINVAL, "Read chip ID 0x%x is not equal to 0x%x!\n",
+				     client_id, MMA8450_ID);
 
 	input = devm_input_allocate_device(&c->dev);
 	if (!input)
-- 
2.34.1


