Return-Path: <linux-input+bounces-5061-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF15933327
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 22:56:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A4671C2291B
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 20:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389AD762E0;
	Tue, 16 Jul 2024 20:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zq57KNQ5"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011041.outbound.protection.outlook.com [52.101.65.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400A6F2F8;
	Tue, 16 Jul 2024 20:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721163400; cv=fail; b=ASnzPixMyoKZG3yrkQC+jfnXF+HrTT11ynqMGf0ZP7IVw8MYtRNsogOEs/QwAbhdMT2C1teSmybeyH5W0sM6tJRPlqErUHcWvmvBZ7eyLgJ1JQfxDl8v7gFosWYi+Pe6GItfmmV/pxzZZCvCo8wqWh9EB/DJAf1SNoit8uNufuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721163400; c=relaxed/simple;
	bh=ov4trNR7VXvrjCFS0kYJBivo2i/RdhsAa4eeqDGlD84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rjPMSstLRyLsYwzbR7fxc/Pa+IIq9iN36f/pqdXDaISbeGdHreTWpMz3bTM3gi2V+uoj43yHFmTdAI/GrulcUlncRRpWW0j11aQyhXBMhaIZMve3u9gqpRfpG0FVEybfSEFeta827m2/sop96CHGUIIfHP8iMe5a89bYsU+H2JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zq57KNQ5; arc=fail smtp.client-ip=52.101.65.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTdvZsyu11Iw6XjyloV3sjzJ853l9PonbboO4h4g9ORnLHOZo27+T3Nc0PdwCcioChu+1aCoj4QtyTovI0OjUJ97m2/WJPihQlYYFWAIGD5rBxp8TqcEJt2Amz/0+Scry4qShpfQb/01sF74SdNpy1tHJfijRpshTJOszG++OGjIYErkHBs6fhE+FXlH77xbgPoQ5AP0J7+trSN/Ugxsi7VtBj/g1MG3j18g4dnSs3sdSN354yVJW1XgrQ4A4aOq+Cu+x3VUib31X1ZqvPXb/9K3fESsEgN4yJ48TCgR6vl5SRRYdeDJaBBAe7wC7gxhv7SisYNB8KenatiIGDdb+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjoSvhD6AqsnyHc38w0x01CZHPmVleRrB7rzLrkpw8M=;
 b=CS3HiuPfhaI90367zfBPKiaGLoXcQU8nVlNyiWDn4IO9sLapmRArsFYBCAXJaFnTqX2YaSrIhEYVHUah6APknDluZsrcqWvPd0er2fkOo4f4gJ8FW/OwXF0H3YXhwT9IUqBKN40aEkEjrbwc/pbZoQX+DPTI3xBGWORhUoN97QDAmOr8VQzmFG7QGQv/29XZi7HZqhFBAAMIdqajAy4x1AA8cr1sYF+Mc4pXTkWZIRr3GcQ5e5DS96kyKhtVqCSBCYzDhukLWpu8YAFBcqGtfBtAI/3bk3XoEhkQc2ggh9iw+HuDjSt07I0OZeitJWuPOFDd+GzOknTKn4uA48JL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WjoSvhD6AqsnyHc38w0x01CZHPmVleRrB7rzLrkpw8M=;
 b=Zq57KNQ59sBZvrHfOswuzkWbvtUpfY5gIGppOS0blf44iUK+cIr2t7uSh4CMXp1JmjfH5fuhns1lEQr5mw/VzkK7EQzOwb+Sl2G1IiAjUg7e3sgryYZUWUseh5ANQkUd7LTAdtmEt0z4x2I/KpqelN/NL0b3/5CPE3FJ50chnUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 20:56:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 20:56:36 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jason Liu <jason.hui.liu@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] input: bbnsm_pwrkey: Fix missed key press after suspend
Date: Tue, 16 Jul 2024 16:56:11 -0400
Message-Id: <20240716205612.1502608-3-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c08fb610-03ce-45ba-ed86-08dca5d9c7fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UT6QqFT1+mhyyhakzZUNrBt6w/Vz5N4KwNn4uIQ9m0YcOt/1sRFqJH9SIx/X?=
 =?us-ascii?Q?Mi3eCsnk1x8JF4y4bDu3aYvxtIyDoNG5Wf5lL+Z6hefrF7flcLyKqDCj5bXP?=
 =?us-ascii?Q?8OkdcKNJ89Ss4R6hE+h5mvbIi9n6bYkTGIUvOpFSUi6iIMyipybtWcaw162K?=
 =?us-ascii?Q?3TxgQJ+MvT4XEctQhO0Z0LE9VMIbzcbh2nDkXyVZ/ORH2pPFYWqzOZqYZFWf?=
 =?us-ascii?Q?IC902DwYDsQF/TBNGthJAgaB8yqv68jEpWg2q01sh+AaXMgZEx3fBoW9VDRz?=
 =?us-ascii?Q?Q6xCKwvbXX75G4MuZZ8VIRm7Qlt9UM3b6Y+1wA7dULLuAvybvGo+gjXJKJ8l?=
 =?us-ascii?Q?RhmN0yR+Vvlxm52ciDUbA5rCMlh5f0+3FR/WufgEKEhmAibi2m/6HvmTWsYH?=
 =?us-ascii?Q?OrVj+yF+6+A/ZlzreBuPHjtooA2z8DagTiIB2QacDEg1Q2oFIVsGTDZI/XkS?=
 =?us-ascii?Q?srqgi5IaEhHTGoFiyGEMlOIRM94bByXo00muGRIwECdqLoKEpoUoIFM8yuPi?=
 =?us-ascii?Q?fV8I0hpxjx70v4hriqpSrXO7dAHfIkxKrlWYQ7DRGPtL01LNH9BsyXnl7Piu?=
 =?us-ascii?Q?Ih7Mkvo1CyFzTqzINFlAmXoYXUYDYcBdDjEL/w42QN8K6GLikj57jBxma5Wa?=
 =?us-ascii?Q?KZjvm2tomIjZnGOyAgf36j2DhvNJ49KXLOectKdgQjOgCt6vxqmGGOTxi9fL?=
 =?us-ascii?Q?pLcxS2OQvOcyxngtP2JkhU4NeytR4B9XgKAgWsUlCsf+R3+WtRol/B0C8q9M?=
 =?us-ascii?Q?n+IIA/VMIDdHw8X6IsP/0Thg5eIoe5syh7d7oYep05Vx7nzkWJbqN/yDfW4z?=
 =?us-ascii?Q?GNUBTNTw7NbOFX15bDHk6cGu8CTJRYg/7x3lihg7mqImZaqC8CZqbDZTWyUC?=
 =?us-ascii?Q?XFXN8pZRs5DHtx64XxIUkKl2qI/MGukMhH66cEqweiJzosteA7yR3kMTNkze?=
 =?us-ascii?Q?ddO1kxyldxXLofCDcCrn62dRWjaeGh50FoPbu7QVBhIRCsbv+6gJ96TeeJfR?=
 =?us-ascii?Q?izu0Q97IIMhIUb9lQ16peJ/Ov0aH3MEfdIuz5FKAuWEIL8PbzVP808n3OClQ?=
 =?us-ascii?Q?G81oQwvYP0D0RE1Rkelhn0LYpbq3mGRW/SH5p7MeGfhJ1g1f/EeFw7/LmeKt?=
 =?us-ascii?Q?XMjQNKr+O5lwtvGPeRrQo5KjAohrL4Lk8rj8xfdZwAQ2oy8TthVlYnxivaZU?=
 =?us-ascii?Q?GtfS6akwcy50pfOn4d1DiXGHfiilIZ36vIAUCttEe2mVD4XRdQhxvIU8iTpJ?=
 =?us-ascii?Q?4yjs/zfWIIiiHHa2F98Y+qqDLDsNVKr+ksZlIkhaBoDaUasxOnm2plZ+RQJ0?=
 =?us-ascii?Q?yLjsMq/q6HCSbYOyR6qcyXj6URJh15923NTcVhtgvVE+S50Ja/BPoza06Vpv?=
 =?us-ascii?Q?Yt7M601TmvDI8UJQfhRGxa3ezME8kEV9GRqh1F9/n5ThEbUyxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yFRVelnKuIHVEzrsirNQ5Wk0uY0+LeNM0+Z44NOlwr182LmR5s/kwsyfBerx?=
 =?us-ascii?Q?3uSI0j+dxGI228VdCxkvg5Sc6ZjmMknfO8PZ0UE7q+hSXjFNX1MmvmO7iTUW?=
 =?us-ascii?Q?qb/NS8skb0KcCYiSc8rGGTzpebE9rbLgK3M6EgDAn0P2urM6rn9vGEVTRQZg?=
 =?us-ascii?Q?oiRpABJ43t4o47rsDJYbSxnP4j83YhmpBPJN0smNRSng7wQALToCWia6LERN?=
 =?us-ascii?Q?kGF9jtvvEo9gJipLP0otsy6tYRD7CuH1UQyq0WYYPtfdC5pkb9olnQxlf6OO?=
 =?us-ascii?Q?gVjRs8jGzwPfK8zzH0iBSrws4Cw4VIXebC0RXY/Styiovnrz6Ff9RZywxIDL?=
 =?us-ascii?Q?hq0bsDjIIBb2v1NaD88dBrkDDqSL3akobVVuduIBRpu2f16IQBOEPsWxlKOk?=
 =?us-ascii?Q?eHgT/CKH0uvcE/ieYOJIlU6NRYvJCkphnuoocRwGAkshIT8bl9c7d1J2a1UH?=
 =?us-ascii?Q?w8lABiPy6Mn9DdJzGUpF0cDUS2SuxsWlAD1+17cnWyYUktrffSbL0ams5HQ2?=
 =?us-ascii?Q?Gk2g7Gv+I+8qT+s9iXB1Wzl1b+TD9qavisnekF+guil9nHLkStfQIcW/rgQE?=
 =?us-ascii?Q?eG+7hf+OHOiq0/9yPmkMAa+JsjnuFlqKMrdlNwLxvZLOqf13Rc8fJu0ixbRo?=
 =?us-ascii?Q?SZ59n5KagAeEknUm0NrVjLmeNnYTflRv1ZSMp1yjeveI3xhvYxSYA5zDoq0l?=
 =?us-ascii?Q?TsATJmwlw5EFOqxzD8Iyw86rMp6h5B5YzGKjeIod3vXlVsqrZu1TdGJF8Coc?=
 =?us-ascii?Q?hRp2kBocyDsPUetbxK6aElOubO9OeKg0I0RQP5jp4i2qrwL926o7uW519dkk?=
 =?us-ascii?Q?JTGcy1WCBecXjHv1hbe2jAGk+MqtVjCcdX3x9H2WM7a+H/P/3pIfY1/2azJ1?=
 =?us-ascii?Q?/b8nc0TFDKWrGHsPWHqTtTh7xnHlQUC/dffxRAVM1Nj/zd8ylmobfFuiQU6j?=
 =?us-ascii?Q?KsSh2uWtpHL2tiTfDIGbBTF5H9JuOzFb9THPJBkjlaOgAJ95gVSXSwYQaJzO?=
 =?us-ascii?Q?YvvbXBFymhj3C9GqMWrPUpQkgLN8ysIF6deRHLVeJn7orkIEcquspww6XGzx?=
 =?us-ascii?Q?D/zxmRktLZodG9nEw4Z0kywYUF0dXoQfQ0cF8IEd/O/u/MFMnfHwBbh517cy?=
 =?us-ascii?Q?aGwCN2s3B2A7f3MVjXOBYFaq5OUGptYYeSPZfMyZlY/USz7tku7bAxP4kCLS?=
 =?us-ascii?Q?rbDqo6Tk968OYDVNYAuNxiqmxQigF8wraOowidflcwtPL73stvJppag3vxoP?=
 =?us-ascii?Q?QH5h9fIpa8u1nv9Ye9nSD3hLQrLi6ZkxZWDFIKwPm1mXbDDotfbIvhgmI6MT?=
 =?us-ascii?Q?a1R2qqWOPrCPfoGsy1FbK17LxYRvbdaDQ+s8RGjwEtjKyn438To1um7NRpP8?=
 =?us-ascii?Q?LjMYk8b8DZTu62DFZcNTrwYP0MuOLL+YRcixeCfUED56iXdzjmcRkL/hvzjO?=
 =?us-ascii?Q?mi+9nhfYLgHVdXCaKA1NF0S5YRT86KwWs4Gn1NOjDranP82MuUjy1Y9OxWmn?=
 =?us-ascii?Q?SaevWp/WzxSu0L0nUdycTc5Xf9N3ypMt6z++X9053BeZxrBf3IMGnwKeER2b?=
 =?us-ascii?Q?k1Tgn50MVKvXlezRWmO4YhynRu5asPCfi5UxOS2b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08fb610-03ce-45ba-ed86-08dca5d9c7fd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 20:56:36.3075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFVVFqwq3kSOrB9rVmTFO8EpWyhZewR/enzTaDKrVCDesrurxcdbFFRZhliw03lLvnK/Yl1H8Q/UFrdwUME3qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

From: Jacky Bai <ping.bai@nxp.com>

Report input event directly on wakeup to ensure no press event is missed
when resuming from suspend.

Signed-off-by: Jacky Bai <ping.bai@nxp.com>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Acked-by: Jason Liu <jason.hui.liu@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v1 to v2
- move before mod_time
- clean suspend flag to make sure only fire once
---
 drivers/input/misc/nxp-bbnsm-pwrkey.c | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index 1d99206dd3a8b..eb4173f9c8204 100644
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
@@ -78,6 +80,18 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
 
 	pm_wakeup_event(bbnsm->input->dev.parent, 0);
 
+	/*
+	 * Directly report key event after resume to make sure key press
+	 * event is never missed.
+	 */
+	if (bbnsm->suspended) {
+		bbnsm->keystate = 1;
+		input_event(input, EV_KEY, bbnsm->keycode, 1);
+		input_sync(input);
+		/* Fire at most once per suspend/resume cycle */
+		bbnsm->suspended = false;
+	}
+
 	mod_timer(&bbnsm->check_timer,
 		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
 
@@ -173,6 +187,29 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
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
@@ -182,6 +219,7 @@ MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
 static struct platform_driver bbnsm_pwrkey_driver = {
 	.driver = {
 		.name = "bbnsm_pwrkey",
+		.pm = &bbnsm_pwrkey_pm_ops,
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
-- 
2.34.1


