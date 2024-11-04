Return-Path: <linux-input+bounces-7846-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69B9BAB17
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 04:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30EB51F21568
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2024 03:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 787D015C139;
	Mon,  4 Nov 2024 03:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F7EH0wrr"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4149B33EA;
	Mon,  4 Nov 2024 03:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730689558; cv=fail; b=BfWw+pVuTK4chU/Q+OrpKSDeY9pBVzs828KE7COo69vH2ATax9gNq78/Eq3s9o4+8Jl13b7lCAi7mMkcEPgzkJE7SgwTyDuwGf930gfr2VPxmDW4hIojqQlaVoFHFeZD7ZBp9269ipWCJ4fhAuVuC4qxjr4646DZwNswYO604ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730689558; c=relaxed/simple;
	bh=Dw+YxO5nQG4msMa3yx2gXTlMvlxns2eY0lBo5TDRxOE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=u/OSvhhXnmKXAzX/KB4/6jxAuaX8jU/Ifh8pRzokm1EHXoeWlxZAVt3lh21HvluLiYGH7LMBYhN/LR7J7SdWw5+el0jvb3iVo7g5pTvg+T5HVwtyUzZcMuV1nJcwTIblFxjjsI9cyqR0SMnncLEjxt/bJMLv+nL4b9If4hkhKwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=F7EH0wrr; arc=fail smtp.client-ip=40.107.105.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7zls9cLAVgxwXJ6yLHVzP6Oa82arp+koCG8x7jQjHmEISVdauU4Q0//gLFFtl5lYcFV34HBjCrAZ6BxORniBdVZ1fkDdTKbigNGLjDMck+nmNhkmjEt8+RuoexG4kSes769s5jfA+R0aVsVdBOLQn6x9Nzwk0w+tFfdQqiyuR/iAWD4E9zTNZYXWBehokWcAodseoUgPTtsEgUYHxCAkmKLpzO+ruzp5CTqeI3EnEGovRoFtiIIIJggIIEKipPZY61jGIN6Y6J4uOWbeCIIRjAiTdhyAeKZquxOVR7/7qeXYC/DjMUvv24/RJX+OUpD+xlt+lJvDFJfOa+QgfWQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RLGvVDmUAvqEZTCqpdz3gJIk/NfLHojta5ED8jn4tA=;
 b=aL3mRwg8TntJw++O3HfWF8vuCzf73LMtCgTPM6hhqs1RUoJOLfh2AHe+vKJNW+xEKBJQSeJctOyx8nel17NhVgAub++/NbhlNI96CyDae7gBfaIDBZzBNvbuO9EGwVgcboI4PAq5aAPJSHNfde2UXdQi0dlZf1UJNEeb0QZCHLmUQjmGwzMaFG2FHZ7NCjAF1lKeCXmZYrJljAcKiWLbJM0reZnpBB6seOPQN+yCY1luDj/qYy09lOXBuzy2XxvfILf6UmqIwVpv2Kh3FmQFCk2YRhLug2sME+rAe6x+rfmZj+r0NgsKFYXjAyZsYetJdIbCRvlCPtONjZhAtErOng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RLGvVDmUAvqEZTCqpdz3gJIk/NfLHojta5ED8jn4tA=;
 b=F7EH0wrrLpZK8Exj+xmm7hVFVFSpZs1/ovHQNtyKXj9i7Pj2MPp8FVXikWw3IY929VffG48CkDSNoPUEnkDh7IjJmYSeA/41IP3JaWMTvsqSlk5XjVD6/obi/ma/vUjgB7GgbR6UWGHnwgqA9R+dBsfyocdQcvlmrX+5cfph6p0kxeZUsgB9dqMmTuRyvHkUtk6fKrPHm+QQfjg0p1om2btSTxOV2r07j/S9lvgz4NcryLdtrugw+RXyOsX2ozG7Tu2C4vxt6Vch4ocHcFz0C12zgyKiek4xviJKZWNnf/munUxEt/arcRT0OKbdPJmUM6+x5u+OyWWNmJO2AzGNTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU0PR04MB9276.eurprd04.prod.outlook.com (2603:10a6:10:357::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.29; Mon, 4 Nov
 2024 03:05:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 03:05:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Jason Liu <jason.hui.liu@nxp.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH V2] Input: bbnsm_pwrkey - add remove hook
Date: Mon,  4 Nov 2024 11:15:51 +0800
Message-Id: <20241104031552.3475108-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::29)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU0PR04MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 929bb93d-85f5-4550-ac81-08dcfc7d97db
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6VQWYCijqNOyrcqYxPgyQblkg2v3pYbffkIkCn3u8gZc34uAgh9iwvR39XIB?=
 =?us-ascii?Q?AgITqa0Kc5UBCiDKLvbY0ThDb/0vD1tIcLMyhtXvZ3B4UVDy3gy0W58rl8Jt?=
 =?us-ascii?Q?EijbAu6bAk19bei///kkZ4PX4Eha8ltNX7bXyxklR9AqD2I2/ENXttx/Lwar?=
 =?us-ascii?Q?Q2Lkazl15H8b7pr1Bp+uW2QozMWoYbml1SAyJYfhczIJa2w+VlS+59HUUGph?=
 =?us-ascii?Q?FmzIiYuQWSkA20QvGNYTKVsbpiHebjkV+cexbZs2d+EdCPO0uIx09KID1wQg?=
 =?us-ascii?Q?rmtTCBzEvgTBt8PmvYrpk9n5bbsiGzjvpK5CrbyFaPDEYq1ih5Sxl8HS3wIS?=
 =?us-ascii?Q?mg7ySYfdSLRnftG2Bs8LShORfdcfFOK4U1//fA9odsyNdjKHKqQdemRQGXBC?=
 =?us-ascii?Q?nLeJDdBomQAQspUCMzCF0Rc/g4LWboZSPToSIr/pI1l6UIVTxvRpBbfpCQX4?=
 =?us-ascii?Q?rDGHQWU5wshQ7ejh8zh0unlu6EpWe4LcN5yUF3I9Lhw75rJSoqPNnb7Qohpp?=
 =?us-ascii?Q?KU8AmPFVvLrOXKlqA3n36wg0OEJMaH2RPmCLqmwhESo977CO5f4IEWS537AC?=
 =?us-ascii?Q?1h3+D3d0DaVVeytqTXgV5BDUmyGJrPppG9poMswUPpYZgDhxpzALuNBeMQ10?=
 =?us-ascii?Q?k+KsSRF6BjWEYunnNz7XWrc4bq21/RianTEY+TK8e/iv5v3jCrMjYJ52urx1?=
 =?us-ascii?Q?71GC529iQ9eUUAInDa4O2WuewpB/ulYRX+rANSUB33Ta1oZJMGvm6Lq3n+6n?=
 =?us-ascii?Q?Oryqa3obEunoqjD/qZx3JndD/yi4W2eQAafbn8B1ZAdis+QyNJZp/671KdCg?=
 =?us-ascii?Q?MSjRa7nTpGoRBB0CnVfzwXjVGFNWpIbVzkX9TapOYRHpaHtW+aOz4cBoep5H?=
 =?us-ascii?Q?VBYJD7S2aHRpFjV/x0k0W7BQrVCJb83PLAu38OOf6L+U7C/LuY6p9NzoVfTk?=
 =?us-ascii?Q?3vyYSyll56v/di9TBbMpAZ655h3gm7ycGPBYnQf3X9R0GX/HDFnkGg5Ce6cd?=
 =?us-ascii?Q?p2ObjutRUvUg21GjtIxIlIfUMcI+/rkylogeYSXRY6JhXKRXAbBmg1/ba1Tx?=
 =?us-ascii?Q?osPFa9CRqxGEM7hqnozFnJn5gTjEOLVSWfNn46EvqVsmqWk9WFbPWYqre0sQ?=
 =?us-ascii?Q?XDM6Err7XEHBJIo8NxeIZ/VmOu0OfZfDBZ/CIxwx7cimFiB1FBpSGJXd38wE?=
 =?us-ascii?Q?n+lZzyvm4ofYFhIzUyLLPKP7XxPH6b2fzc38vf/sQgCTv3h3s4sk0+kRryYW?=
 =?us-ascii?Q?GH810NXdRKbOfEvSYOXPN+Meq532H8twDmaOH1sNtXPwseygB6t/5z+4QJNb?=
 =?us-ascii?Q?gg+uCZLW0xPCr+URlPT3ZCyNuN0IDaoHNyHpiDbWr37dMJxT3HbnGYRa6OUw?=
 =?us-ascii?Q?2qzS1rkRx2ntkBKYZl+PaDvUeXtz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nxHo+tyFiBEyupprbgr732LETXmoYYepeLiyQZbFvcbnELL46UPAUZG+qz+V?=
 =?us-ascii?Q?b8c88a2aFVDuMTjUB9VyJFrAmoK8B6NdRVw2kG6JjgSkpWPFZSdsJeztvv8C?=
 =?us-ascii?Q?tzoKHGOjMTJTEkQ6FyllNY68Ob5NmEHUGRxa+dOGcvZ/gWpGFYqfuv4aYqab?=
 =?us-ascii?Q?w+lVbPuYgV4ovDSVsMRRayxD5ITLP0gVDs3hcOZy3lcvjWkO0CpFcbIklN3x?=
 =?us-ascii?Q?3+iDmSBngPadF9roNBtoZ8J8qehJFIZ/qKS3yAdAtTYXW6/4U99IBrwBa+iV?=
 =?us-ascii?Q?aM4/vM+oDsIjUkmyiBLfL+RVOx/Ie9lhkDkGvkdD/PXRxutY9QgczsCUnQXG?=
 =?us-ascii?Q?+sfD2CKs/8DNC30iPZT0ffpy7rrFoZMPewUkNuBgOekAqOPOHap+JDy2aI/f?=
 =?us-ascii?Q?9mjTZTQlOOS01Gy3EbchiqMZYB+u/BS44EODELmLRgkuSJJZNR727yyUa9cL?=
 =?us-ascii?Q?NTm5s8G116z3vBpGlc780aLT+NPgMT2esqzjOyxOLSr4v4Tl/JMhBYiXXNUQ?=
 =?us-ascii?Q?Wi6Q5GfS0XnW2/rLGrE/XSO3jYQiFaIkr/0OIBzZh9gPSEUr/KpV1Tu2dVcJ?=
 =?us-ascii?Q?+PuibnWr/7sKz9e4kmVuxXbmD68MoiVjPmsyZfmpj/VSqg/uAlrxTUzvPUO5?=
 =?us-ascii?Q?JOi7v7OGPz+bDjHB9qPiUL0fth5U3hs/paKGMeO93JympToQYvYQqJsLAtAX?=
 =?us-ascii?Q?KQ0d2pYdrb3b9BldiwklpoX5e+UkYV8F7508JRZWpPsT/TzqKKSAY+z4b6Zs?=
 =?us-ascii?Q?cOijq7qlWhI3MZRa9XIOXK5hlsjcafPWpw7R9BbyfNppQKDaeE9qxZATocDb?=
 =?us-ascii?Q?VrVr6l94yVCq0vT0WrkFp23kRNZInU6h4Cf/l6T2J3KxiGXpUNN2ilz5iZMz?=
 =?us-ascii?Q?lUwTCVpT81bIwIuWjnLPzB5JZsQs1Hu375qG5aK6g+tKHdJP3/AKY8Npem1I?=
 =?us-ascii?Q?2PqF1j6Gze7e00cJrbGSD8IM2WCgiLdaoZMYJzMTpZHd5Yxd1/xb6OwFDidB?=
 =?us-ascii?Q?SrPTqBeSRw13YtTJWbuGFwFWQ+Beyw6SM0HNn0OYm5TRvYt0csgs3zNIVGtX?=
 =?us-ascii?Q?8oppldPNiZnko+Jgi81BDD0RZ6Lnfnf1ou3XRsKu77tq2auQ806mVdIVwx3G?=
 =?us-ascii?Q?MtWyYPMIXJtj3quh01a962ZVcvCK0xJw7nIna5zwi85kVWzIwlZLXuDGvO1x?=
 =?us-ascii?Q?Ov1NYrX96+CI/uWusFI9xzxq36VcamHkFJXVJXh8suuVt5ee8+fu6rMmofpA?=
 =?us-ascii?Q?aVfeZov6ZFnlHfAd+aU4NvSMsjmXU/XSyp0Jf5tJcCTrF61R7UXC6im2Q0Dc?=
 =?us-ascii?Q?2VTLVRR1rZAsBFWm1VgTe1iEH8qL8Ybaaka03HSxUPcB6P6qAS5KNmqFMV8s?=
 =?us-ascii?Q?0eDjPk7mu949uRi9tgsJGvd5vSjgls5lYFZrGfu+9eHvint6P7IeADw3XzjN?=
 =?us-ascii?Q?7PUj6/hbMrW7SFtgPf2rsTAC/rb5CK5V4/RhsPFa2ad8j86uCOsNA3+gvLV1?=
 =?us-ascii?Q?Y197jrh/qckCQxENbu3btbd16WcUbQPeNLHphViKllsismNmhgMITxKxZZsR?=
 =?us-ascii?Q?BBCUBzAiqXy2MAhao2yc4jiJh44A+l8X/ubQyZeD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 929bb93d-85f5-4550-ac81-08dcfc7d97db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 03:05:53.0458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uClqnzlNRpGWFrTg1DxGgmTyOnRSaQL8ccpBRySD2sdb9QJnaeT4won/wif/qNRtiQSvTYpQoKNZG1S48SnkpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9276

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V2:
 Per Christophe JAILLET
  Use remove, not remove_new
  Drop checking bbnsm pointer in remove

 drivers/input/misc/nxp-bbnsm-pwrkey.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index eb4173f9c820..f0bf119309dd 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -187,6 +187,16 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void bbnsm_pwrkey_remove(struct platform_device *pdev)
+{
+	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
+
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+
+	input_unregister_device(bbnsm->input);
+}
+
 static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -223,6 +233,8 @@ static struct platform_driver bbnsm_pwrkey_driver = {
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
+	.remove = bbnsm_pwrkey_remove,
+
 };
 module_platform_driver(bbnsm_pwrkey_driver);
 
-- 
2.37.1


