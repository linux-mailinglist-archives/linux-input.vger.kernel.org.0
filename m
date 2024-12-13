Return-Path: <linux-input+bounces-8539-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E27569F1914
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 23:28:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 026F11615FE
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2024 22:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E871F12E8;
	Fri, 13 Dec 2024 22:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="btS4p3ti"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2065.outbound.protection.outlook.com [40.107.20.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203141DE89C;
	Fri, 13 Dec 2024 22:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734128613; cv=fail; b=Nx0QS4xXk0qI0X73mSOSrvZN7WC1baN7405FMYK1LmNGEsRikWHfbRlippZmWjIHpbRAgRykg/DVDzgGD7k8WmkRN/6rjmH0k2BlBRhf/Pb8PkXfm1Ex+uiWhCMe8ZZNKrZm9r+pkSEuT6Hd6wroX8o3OVcZA+c0pRqGOnLprY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734128613; c=relaxed/simple;
	bh=cOT7xf/RkLx9Nsv2I9mWRJmJKXTjn7v9+2NnLONMGKA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jccErH1gM+phwsYlcVPEZb5MvgaN/dgCqkIJb4bIZpeVI8eFqX8PvvrJkK0zDVeuFLk3OExwE1Ef8rLc9TQ9KgIOZXjN1fsMadU85YfyOCytAG6g+O11bRjNtnssN1n4VrmPlrgKtzacxXmPr8M4Gf48UB5kgFp/3aI6DmeixgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=btS4p3ti; arc=fail smtp.client-ip=40.107.20.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhBF9rTLceS94LQBigvKOAZRxeG86feVIy4GbravXJcLB7GHunTPTW4kriW0GjL5yZcFN7gnoW6UeOF6WhxhFA8y2C7SOOqb6TdbwC5xT1tc+fsBIU73WeMlmkFoKksGXfNnVCsw1UxITkztsbVvhapoN+H92tLSZntCaXPRwXRx88EtIlvytitTe5F3YSciTU5KoEOi8EatAY+WTrZAB6tUa9DMpELy1xF1aifSto0ItGoZImS9z3W+Ty9jqIbBF/M8c0OTj/A1s1hVQp0G+BjalOf8YVnek2y8zFoL8knGjGi3U02AATo43YY68UQZYZoQxGp75rDzxp4Snhm54w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LH4oi+ZePpm6ZDGS61ibs9OJ7zE6PY8ZChOG7YDNal8=;
 b=fkPjVzUa1unCaROBPV6IVYevGPu9dhTGX2pzf2YreqyR5FJfe044j/NTZftFwmQfpuziEnEUgxavlsl/TNoPgPGxq2AayB6o2jIw4pBJFVq1U2ms2Apnb4euQXuzn5Qg2VTTWXTRBEuKbbOms8Bdajh0ZbcVMfG6eRSnR86wYBxS/UarKMcNjqYfu2wCrQb4nvlL0NBMhIpaTRgv9Z2XnwavU++CvsjwwGnmcjIms4690PMDrI2pkEy14s2eu4HVNEerUbW6K7f4YKyjDC8vMLt4CvlMHk5WvoTkgOVZpek1wG6cGo4BjOVV/OTDEelrFqtjiw/NnRvrE38uaGd2Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LH4oi+ZePpm6ZDGS61ibs9OJ7zE6PY8ZChOG7YDNal8=;
 b=btS4p3tiga5RPwyeYnj7C5ylEM8W/M59Rp/m2yw3TjxZFe/bbxOWI4lF5dVoBnvJz77ax3No39m9/hRBmCTrbBPh0Z8Un1kGirIuSFEGU6JoEMv9koapA+uWrag3aEfTSwqX5DHXkJoRLjj40IoRsFHV+G5c+qVoDFw+Ak9hOjUphE0RbIlIHvziBoVM5au/1QXfvusmLqtwtJfya9x/e025l4pmUVy1ZSZn3Had6toIsXFnSoPsPsN6jiB182RK9zMX/bYSgo6l3sUAQeuiDhYBKR/HBZgr0FYUIOKCVlAImIafQjDEc8Ea02xA8CdyW9rgV9mbKFRCQjt66+CRSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8810.eurprd04.prod.outlook.com (2603:10a6:20b:409::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Fri, 13 Dec
 2024 22:23:28 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 22:23:28 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Luwei Zhou <b45643@freescale.com>,
	Vipul Kumar <vipul_kumar@mentor.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] input: mma8450: Add chip ID check in probe
Date: Fri, 13 Dec 2024 17:23:09 -0500
Message-Id: <20241213222310.189443-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0176.namprd05.prod.outlook.com
 (2603:10b6:a03:339::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe7ed30-9a43-4d07-0b3e-08dd1bc4c4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|10070799003|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1DNbQ46F/MTXyACq1HHTHL41n4C/h7a32F5AbpZR3+/2cE2mGur1NF3m8VGe?=
 =?us-ascii?Q?f5gXpO+VInKY5iuQgMxVZjhKCeC85+qmyi8W8dbfthaZcunZH8iKSBCmVQgJ?=
 =?us-ascii?Q?HMetmNmmPHoMSg/IldOD4wBF141aDLqLQh127J+2qzGrA/BuWX3XLVnbvm+k?=
 =?us-ascii?Q?+exVi1a9RJ8jX1Bp0h1G7SXqKuRCrRHJSjYd6bRw9p3GTAg2MgVJWGPpxgd1?=
 =?us-ascii?Q?OG7UrTGb9kdHqE9wK98+/Keo39u06IvKhfq9UNH5laqOnm4DTKQ0pSqevP3i?=
 =?us-ascii?Q?nwctUi8zLpr3WtQPvsqxVG/FhtaqEL+FmdZCWhNwKcYXaflTz5hZJpQIpXkO?=
 =?us-ascii?Q?Frjn8tfM80b66zxJAabOfn3AxjgmneCe+VWa97WZN/mie/PSPHdIrxqpBJ/h?=
 =?us-ascii?Q?P7AR4eUu8+iZ7ujjeT8DcoiOt3VBHlsEqPtQVsnn1DYRKpB1yaHnzD7va176?=
 =?us-ascii?Q?7hUWp0ylv4R5lXpM7KVGxWqlDSxnZAipdKqsBh4SbSxNbaYgrM+kcc5R37bs?=
 =?us-ascii?Q?cL/8c146sCdov4r3U8AuQ9cBUr1d4+wYkEuetJDNiPDfvIe8odTPXiu2juSI?=
 =?us-ascii?Q?aNFJTawpO5CAhGw86e2NaZrDJ7jyZXQAp/SlSMnO+xw+x8bftyj35XQcI1wI?=
 =?us-ascii?Q?exQpvDOuOeBsxqtLMFUokOMVMC4LCBVFLUEo6WIrH5k694k1aFPontPvAC7u?=
 =?us-ascii?Q?vJ/7t9TXQYjLGugtjj8bMrk3Lf+Hy5eYB6/nXmhiQM9vm0G3Aocmeg0QVemK?=
 =?us-ascii?Q?MOL24+a2qbErxMAACL0d/JXF1Fh6giILJL8oU7YBYn4TshLeplXK7RE9U2F+?=
 =?us-ascii?Q?o/G7eTDMK3DgPDqMefR2sxJeegncKX2CODUFhz1lSNZiVqO/4QdWGPyqHOzi?=
 =?us-ascii?Q?+u8Mm4lzwPpwHN6jUxNBFlq0KNR6I9N6CqKEUxIDKkryaadoenT+I0USPaf7?=
 =?us-ascii?Q?2BSQ5aNOfI1V3roxAF2dMl9mh6+HKBVIb4VzY+nuVmcuBkiBUR7R5IuDSrHq?=
 =?us-ascii?Q?Xv8DrGamDbtxzJ0Ii9FW3EOUQdh2tw5lDIEzXt7ImmFrMAScs6WlyPTSN/4v?=
 =?us-ascii?Q?qhjjni03lZ/sji0gbLS4Ih0SvpvIfDBd1eCUN10uyNPvcUKwfkonXBsDLYua?=
 =?us-ascii?Q?Z+KDQQrLLfcd1N8gEIWe5ggX4yG11ja9gLx1AsNlrQbhQstqDckW2dS4OeyL?=
 =?us-ascii?Q?tjHa0L3g4Glf6ZfsBZFZjaMYLM2ORpCciXnl+Avr7grmAld4KvlgsFxem8P4?=
 =?us-ascii?Q?uexXFQ9xIKCdTLtUa+bkW9HXmWOXpOZuNp8VgcGmKMMiPmOMXG4UVAWaAOhi?=
 =?us-ascii?Q?wEAComEcFI/ZBVOhh8/9RtRnR/GOCjOpwx3MXCUrazxJo075uai6tCYUzscv?=
 =?us-ascii?Q?TA+sT5iwXdaSEc+qXfw9TElnnkSkrQFwlu4jl7a3eNr5CpIILA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(10070799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?X/jQ1KkvcVzngr8sIbPHxzfKV1fhAprGZZmZrrE5x4uqsk7Q63E4Y28Xa6zR?=
 =?us-ascii?Q?Hkez/PP/pBqkHB4nSmhd0wr4BD0jMSFjOTPQjrlzOM9/aqTTKwwfAMcq6VuJ?=
 =?us-ascii?Q?DckrxE0plF0xK6FkDCplHNRyzwj5mgyJGxDmJmQpiYT3hwj4xW+FPKBisFUY?=
 =?us-ascii?Q?m/dwtFZxG+JBY0n14ZkK7w/uingIbMj5bVvW84LbB+Zh5+Ku/V9LG5WmkAKO?=
 =?us-ascii?Q?zREn/agAuRAEjOGlRkp52JhRR/Yb5KAeUWG8H0d1qT/DC99zr5u7qCVwfJP8?=
 =?us-ascii?Q?8ZpWIVbYLWCtGe4rcylNHz3zKUnvhirCXviWFUpuVuI0WJFC0Tb/6vPQasDS?=
 =?us-ascii?Q?GY0DXsDUu3BGRyYGnfn4B9u5wNnOWOnyqoPUP95wAwTTRcC+VmuovmY4go15?=
 =?us-ascii?Q?SvZ7awalaLGybPzRrxYBy/yEW+h9gpe/8tcsLX/elM835Uf5WiW7/jTNaX56?=
 =?us-ascii?Q?27cBiTiEv8ygsJjSUKdNDtwUBHQ4ht00b4xuODGAsRmN6emPyMq5SE54uglo?=
 =?us-ascii?Q?AFTRej9mWdcvs3psNCqLzMLST5AOwUKags3paAO4hC5l5W9n65dRig2is/3U?=
 =?us-ascii?Q?O1aSumTMyxiIFhMwPazIgVDwnIOmWZWhCdB8UVUD+BO05V7DY3+F9daMBVkM?=
 =?us-ascii?Q?rVrUw2WldMPZIt80Jxak4jALxPLVpBM8voRuG+14U6lLn90kSA8Zo7VGHAEd?=
 =?us-ascii?Q?wfl0wcy6TjM31JOMEbBBkOQ/WDqNFhX28fI/XhLLercx2+3QsGJTVixGHKm2?=
 =?us-ascii?Q?dCUqBUX3yZPhFSby90cyzqnF2G1Fw+g6ciNutEfPq2qCWXZzNEWH8/BERU4a?=
 =?us-ascii?Q?OuBcQA2FdGgpolB860BIt8CFEzIOxIalh4+M/eTm3uMVf9QCk7t3aNE9XPsE?=
 =?us-ascii?Q?WSLNn/WgxLvs4Aj1VVNxwb8GKwH8IGlK/rocvxai4JlbzUGwPgfeyU1yuW4Z?=
 =?us-ascii?Q?Ojxp1Z13jw1YPlh1Doy7gBkFRAzmkZGUmjaDz/ncfSIYl3sfUb2hYvo9DvOA?=
 =?us-ascii?Q?P5wu6hBXtaZkNnwM5MpL1cVSPqNTBwBYviMepiYaWpTNFWP1TpcETC9tZzXe?=
 =?us-ascii?Q?KKL8GBbRGhawMOVL9aaJK1YHziCUp1WwcYUuML2bgGhowSukdquvlUz+L+lU?=
 =?us-ascii?Q?SErc/o9VPz6bQ7R9a//KGHkGMH8qARbmag9MdOOPs4GHw971/r6ZPUUy8VdY?=
 =?us-ascii?Q?I1pelt5dHfRAerZc6px0g4XFLEsZkb97TatnCA9Fw5CNJLaP83jVKvcT5E88?=
 =?us-ascii?Q?IybFZWhezvDZdNb2l59HdK/T3gMRlD7hM5TdRI55u8TXvny7a6UWVPtaihlB?=
 =?us-ascii?Q?kGwoLIpwvRht2t6oaxgCrQyiS+QNAIAo9Kgg1AN1+P68Vr9QbMJeohXAsbSF?=
 =?us-ascii?Q?fIo2Hf2TO1WbJvv1Wm+czXUtkeTt4Jen92RkYrGU5dabayEpxD/POBSn0T4c?=
 =?us-ascii?Q?SwgjB1qt8tKbupzA5FjodBZ5lQ/oNpqhzes5Nk6v6Mo4vN0RYzmWM0iFtB/k?=
 =?us-ascii?Q?Z7CyFLIxJ1Z5mqFqJtVxoJdeYoAVDsAD1h9tkLiczBOFzK2+GBIO3NIqED1I?=
 =?us-ascii?Q?wsyvZ6QCCNntLP7Zrp96+KSyA6ZgWUb1HHazkg5DIEWKlm6CPdZgsqUaYpXD?=
 =?us-ascii?Q?tTHL8pmU+/Oq0hpAzm3+33DePwrjlfp8jXV5M8wQAm9k?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe7ed30-9a43-4d07-0b3e-08dd1bc4c4a8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 22:23:28.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MHWWfU+BYktRDfJGn5Sr+aDvdR3zwEfq3k1rI2JqHxWFtKEIJ68fWrqV/jV8fAfdKGd72KQ94YUWpmPw26pR4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8810

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
 drivers/input/misc/mma8450.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/mma8450.c b/drivers/input/misc/mma8450.c
index 08412239b8e69..da941748ed29b 100644
--- a/drivers/input/misc/mma8450.c
+++ b/drivers/input/misc/mma8450.c
@@ -38,6 +38,8 @@
 
 #define MMA8450_CTRL_REG1	0x38
 #define MMA8450_CTRL_REG2	0x39
+#define MMA8450_ID		0xc6
+#define MMA8450_WHO_AM_I	0x0f
 
 static int mma8450_read(struct i2c_client *c, unsigned int off)
 {
@@ -148,8 +150,20 @@ static void mma8450_close(struct input_dev *input)
  */
 static int mma8450_probe(struct i2c_client *c)
 {
+	struct i2c_adapter *adapter = to_i2c_adapter(c->dev.parent);
 	struct input_dev *input;
-	int err;
+	int err, client_id;
+
+	err = i2c_check_functionality(adapter,
+				      I2C_FUNC_SMBUS_BYTE | I2C_FUNC_SMBUS_BYTE_DATA);
+	if (!err)
+		return err;
+
+	client_id = i2c_smbus_read_byte_data(c, MMA8450_WHO_AM_I);
+	if (client_id != MMA8450_ID)
+		return dev_err_probe(&c->dev, -EINVAL,
+				     "read chip ID 0x%x is not equal to 0x%x!\n",
+				     client_id, MMA8450_ID);
 
 	input = devm_input_allocate_device(&c->dev);
 	if (!input)
-- 
2.34.1


