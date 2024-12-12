Return-Path: <linux-input+bounces-8507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB5A9EDDD4
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 04:05:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B609B1886082
	for <lists+linux-input@lfdr.de>; Thu, 12 Dec 2024 03:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1EF13FD72;
	Thu, 12 Dec 2024 03:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pXGZDPeC"
X-Original-To: linux-input@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1871713D52B;
	Thu, 12 Dec 2024 03:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733972747; cv=fail; b=r6X+yD4d1gWkkTNzqjIHaxuMfdif/0tM4t6qXFIXJ9l8GLdOZcSHdYR7n3vI7ArgU5ithyApZvVOUILazzxcPW2HVAcRbyXlFwT5+pP1FCRGYpgO3pBRZ3o8ERhaisAp6qAFf2z9rve5ngd80eLIaNkFMnWQHRSob4N8GKHgP5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733972747; c=relaxed/simple;
	bh=8u3amN0MM+DdSEEYHTC14h236MXGXLlNy0Je0mMuEco=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pB9XV4befYVQkurQW1hYeWy6fsmj/ioEbkptoWKoSHzQpbQ5xXMRUcSOOT+B5xqfM5TI3p2khuY0BNFXWPQ6IRG17njdMWMlQ4h+/Paj7ARuIWhMnaEhLJnM0FqBWA7mltCRqCg8fMN1wuu+DltMxLY50/CQuRshg3Hyhb9+//E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pXGZDPeC; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Th+CkashefQ71HVTUeIGe0AYIJPAsvKyYL6z62oepVdLulTjFb22SEL833DyyfvxP/dmMk+tHTH8eWmw+1Pb7C+htD8aQUwm+6s873qBgBlzWuBtXhBDKgAGJYw2voqwZjE+kEFnvA78byrva/rZr5Uvdgku4Ucul0/Tryczwki9c+BNc7e8n87cCFmIjbJKNXKqRiW8uAUzC+m3pnewVjZbp1kkJqscppu4FDZ5j1MCBYMJMkrCu4zoHisEFwnZj3DfxtFJA3mMRVpz9Nw7llFTIsUgJl0wgGQZgw58bFp9EOCgT/WpI07ElEPa50sQIT7FdSaXvSAKzowoSulPeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWJVnF+mICxdNIvkZzcAfd2YWD2jvh2dhwS5lx5047g=;
 b=Mn6w5qcSsSYdCy2rjwyStVreGrjqPOcPrHQmS05m2iibV9RrX57LIPOi4Ad+QfPhm6vsG71iMQmg5214SllZ3CB1+jggLIzeINPNuBU9J2YryqDKbUCQSW7ZDaPvYzKdBy2ukQEkMqUe7wuOXPxCBXv2J/ZuEutsh++EZrYhCbiGmWnhEiSAq4Ov0VfyoDbXHjSAt6m9QksuqVM2oC3Euj6jlRin4M4N0/Q4r9/hWosASHGIJkWNv6W3CV8abIzwbX9JP5sTT74nebvEDEDcVCSAW0yfXxXwxfku/wfOzsdPUKAFLqVZCXJ9QTa8gw6JOHuhW91S8I9nkT7FvgRRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWJVnF+mICxdNIvkZzcAfd2YWD2jvh2dhwS5lx5047g=;
 b=pXGZDPeCt7IZrzQCGZ4pbJftjcMjMRRAuCxN4+gZOwI7luI6J7DHa2xwHDWVb94ZsQ7g6g90M2DTx73Moz9i+OIvJoobXubphwllesHmc8yYrjIfrz5MlTwjLgpOm7Ietej4iPG/WmOzbujnxBqQkYEz90QnL8nxFdKSC8WxAXkaYldq+DSsbZE1+gvN5JFFjCJEON1C0kpeYTbRnSwjHXdKPX3NJTgHEaG2SnBFOhoqUYpwxPLbhlkQ6ZpgjbOAEcm7x/edfOV6CTA5uk+BQRAsC+IDW9jVSnZWDYMu7FLhWky/CN6hDdEr+ztg7blcdn+y9HFpmLmsZ/aMH0ABhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 03:05:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 03:05:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: dmitry.torokhov@gmail.com
Cc: Frank.Li@nxp.com,
	ping.bai@nxp.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH V4] Input: bbnsm_pwrkey - add remove hook
Date: Thu, 12 Dec 2024 11:03:22 +0800
Message-Id: <20241212030322.3110017-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: ae828f14-f35e-43e0-e3b1-08dd1a59db22
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rV9Cj/muhnv8dY/AGgQdqOHEX6FQwC7+iommcpbcYp6Bi2tbFm+6OSw7bzN9?=
 =?us-ascii?Q?iQ1Q7WHyfCMA71luBcDZ9040KlxS5Y9KOGKZdJSsJTd/WAuCwbYX5KGijdf+?=
 =?us-ascii?Q?VEPxq+tcRY5jnnqk+mnxifm3Oz1pAoEFtkDeqAt/eab0TQInTPw3JvYOmB4k?=
 =?us-ascii?Q?Wkjo2KoryowrFGWCMFu+JvuC3g/XHgqt6BAGg6G63S45H+IDCksoWDSDVW0E?=
 =?us-ascii?Q?1JFmN7/kmrFl8U5TMpTVEUXqbevcKzu48SaPzWVl8f8qUE+jzN1gYeshd3RQ?=
 =?us-ascii?Q?CUsIJs5wXzfRO9ApayuDxDdp6Lcpw0zR/ywd+Q1tE/NTYfN9z856UvuuiyJQ?=
 =?us-ascii?Q?t3ywd4J5ok9bWeMwsumgUICQQz2HGNhthhp22WbTJtY8ZcKQokZHVARzkv4P?=
 =?us-ascii?Q?FA+VGUm105t5oDzuXDCIcg/6Dss/uhfwppntJISs59sWW0cfYz0SE7sPmHNz?=
 =?us-ascii?Q?E8Zeo9GLOsFeybJtSQ6MKosoV3s7yUzBf7znt6C9PybL1nuuEvxbRDacILuf?=
 =?us-ascii?Q?8eCs9tJBkzP20wHSkY3evK9JfxTk3ebO95iUYM3SGF745T58BeV4YM5OH4Gm?=
 =?us-ascii?Q?Is3TGxbfCtgB7Xo8ve98Znwo3pCosIJSfEwWzO0s94xlTgHZcypkfMqOwZol?=
 =?us-ascii?Q?pRC13cRycLoeDxr14XR0LIIzgdg8dYA+jw2BuZmFZb7Il2gnvSRKqsU59i/7?=
 =?us-ascii?Q?HyWZNzKqDEfpxuzqX75oVu8oYKcmGUfcvLatkHWOo0GbetSzN1Vyufni2Aa8?=
 =?us-ascii?Q?N/f7Ej6Q0LTKQlZ/oKsH0GJ4cQuNCpiBunQMHAAOtAnAF0udwCjWygbVNAVH?=
 =?us-ascii?Q?bGyx2LG9syWFw0IHSmcqhi0k1sUnIoBnTHygpXkNJcTw2nGTTn4bvqVk/+0O?=
 =?us-ascii?Q?+8cWXTk36JOk76UxLVLDGotkuFpQqlVL41ivBKP70y5/ZIenkNqfiJq9c/qd?=
 =?us-ascii?Q?rMGdULl6mqFuUKDqmfG/glSpR8cL4TKXDc6UkiZynxsea89e5NpX7LF42rTi?=
 =?us-ascii?Q?6WnmuRNA8vtNEHPc86WPFl6oeWqQ0U8awo9Cd1ubVoWtQhb7ApI419D2ts9R?=
 =?us-ascii?Q?OmlnF5+2Gd00EKqfG6uxJeY8zq8WVBHlxERW9ejM0hZlFr+7rB6ddzlzl5Av?=
 =?us-ascii?Q?JL/jLq8CGopwYqWH+QE6TeW9DiCcvTDLRsLfqMc1/s+muUJu7e0Jv/45ek5q?=
 =?us-ascii?Q?cNfI95pUM/BbEkySrBs0wWlqkeLl3uMbAbRL6e0ZLGaERiQHzRiPkSDPmwia?=
 =?us-ascii?Q?9qvU6c4aBm2MA7Qz8FapCNOympjKfQTvnn8LHjeRXEWIusr5Cs9UDWfjn9NN?=
 =?us-ascii?Q?qHAwA7TzoALlOW/m1+pDwbzPlHxFe+2/wIK6sIQapG8/ViLRdqo6jQV9XgjO?=
 =?us-ascii?Q?isrKSXT9IMFqcbgvmqwK0ZdabggLUNbTOFrWFz66eNphI3rQBw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oypow2Er7v8P0+9uIDix1brLgDeX6UUf0x5HYW0Yt0WTAhbWjSNn7E0oaARt?=
 =?us-ascii?Q?aiAAhaF18bjNKag5e5VNbu1Mq89WIPLNrmpIR0EuG4nxe7zxrksebt3Zwwpr?=
 =?us-ascii?Q?007Fel8gb9/6CsY4UXvoTgysKbWNMnFUG9IkcFDA7YsPGSGd3OtJk6Ja9/3c?=
 =?us-ascii?Q?bjuRLaNGxoZIBxhKrDM9Z5YWNckdBaXoj8kLo77Al4CcZkC3GRgXAW/FvBbq?=
 =?us-ascii?Q?uUU4Vl7sy+hAOrv/YIIfedYNW+DPH9/ER64fvNK1nhOOOO0DG9JDPGavMh30?=
 =?us-ascii?Q?iI5rlgEFYLD5AFnGtSf0aBN9A/pz282LU8HqXbDzP/hstbYiEe3lFiPt59Yo?=
 =?us-ascii?Q?tMknAuMhdx3bJ9cf55fKCkSSmBDgTAahS+qUdXRtIfLfKBGpu/0x+3QNNJKt?=
 =?us-ascii?Q?CN4DpiXDWwMGJSppTt/rGlA+J7d7kxiEHSh/ZUQ9rhjnuxql+h3uNbtoLyMi?=
 =?us-ascii?Q?uv6j1M4Hp5rwlajtRxT+/y97zRb6SQCfuN3+qtYSAXKSmhKZ8oaA7HWzWERd?=
 =?us-ascii?Q?svhe/3yTSfD0p/1qrTyFa0n0uWJZ9o5q+eWxfpXNiHWSASQgCqXIszJfcvef?=
 =?us-ascii?Q?rdZp0XzZhy9WCixag3XOXHRMFRWeeZES4uDmmWkNtEzVH6wfk9m4jNiqLVkH?=
 =?us-ascii?Q?hKK3WSB8UUoW+R8FuDKKJkD2VjiOZBbs9T/fgTNfezWxl3MQd50KlVfAZv+8?=
 =?us-ascii?Q?eYn8a5Z4GdSyZL7XKAENYOZ1buN3Z38mbjxos7i7Bbjj7VbNtJSYL6+N2xqV?=
 =?us-ascii?Q?G7kuSGg/w9MuWd2rBEnXJ6s2jMisoOjd8sLxVJMMeK+M3L4lzZwhR7dZgtFQ?=
 =?us-ascii?Q?oiZticSh+edoA42JHrbqCshSxtvdsK08fZ92awNqv7VdDNyvEOwD+Z+aTMGC?=
 =?us-ascii?Q?YZiJCFPivt1WuZDvVp8ZgxV/gYqKRl8hb4xGshsvMSCzaPCOzu8i7nDt2gCn?=
 =?us-ascii?Q?ojufqHxD+YUeJ98NbVQGoaxDOapG+f19l7whYV5KsgBv71jHITfspnLhIXay?=
 =?us-ascii?Q?CXKlNqXcp9uv6QZmG9xPVFMBcXiiuFwX3lzjfb15IfTzAKhfxSDoutYs/ztp?=
 =?us-ascii?Q?BVLoT8GuJVh7wavM808FklN0fNtaT5CAekMkidIZ5Qq+7KrgMf2uJ4ofKXzG?=
 =?us-ascii?Q?mIKATMPKQaElAP4WL5UTZeEL5JvrqipEV4w1x8nj0VF5NHDRr6rI5aM8Vqjh?=
 =?us-ascii?Q?ALSk6osOPo/cw8XUvhJPmzNlkVbnFs1TqVCwryDbixKlLkvRxFhKI2SU+UJL?=
 =?us-ascii?Q?trgpoEh8tIijrvxt3+QZ8qns1wXI4Ra4g0X1XcC7ahj737LD/EfpUztVX4+2?=
 =?us-ascii?Q?LR2qVA3vg+Ait31InU+Dx76b6eA94k+b6W11AbvVm3YFjyo5O60RY5RLodOH?=
 =?us-ascii?Q?Q8yY/PVtsqVWwOWgj/tPnecDj6TbCK4DjO/efb39hVqsk72/rAzzV0S/K8iG?=
 =?us-ascii?Q?lIK5THLXiS+C4W4+nHptuGXrR64eHtpfW/d+1Ekcl1J0zKZI1KCukwFZVPmg?=
 =?us-ascii?Q?yE1pc3v01vTuRsWLKfKyGLnyN6AG4JINRwajTonPvIttYXrRq/HC6UdNcaxD?=
 =?us-ascii?Q?cmApYZpfG8SCQPZhtf/SqM1t7f6uTB6FB3gQj+WJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae828f14-f35e-43e0-e3b1-08dd1a59db22
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 03:05:39.2002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1hxcpLxeR97IbYULLoVfvx6BV1d4U2gMcbSpCf+oGbcni2XJ+208onG8Cpyhv/jXZd30df25n0Iyqhs21ehLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572

From: Peng Fan <peng.fan@nxp.com>

Without remove hook to clear wake irq, there will be kernel dump when
doing module test.
"bbnsm_pwrkey 44440000.bbnsm:pwrkey: wake irq already initialized"

Add remove hook to clear wake irq and set wakeup to false.

Fixes: 40e40fdfec3f ("Input: bbnsm_pwrkey - add bbnsm power key support")
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V4:
 Fix build warning

V3:
 I tried to dev_pm_clear_wake_irq in common code, but Greg rejected:
 https://lore.kernel.org/all/2024111213-eradicate-puma-3592@gregkh/
 So post v3 with input_unregister_device dropped

V2:
Per Christophe JAILLET
 Use remove, not remove_new
 Drop checking bbnsm pointer in remove

 drivers/input/misc/nxp-bbnsm-pwrkey.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
index eb4173f9c820..7ba8d166d68c 100644
--- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
+++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
@@ -187,6 +187,12 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static void bbnsm_pwrkey_remove(struct platform_device *pdev)
+{
+	dev_pm_clear_wake_irq(&pdev->dev);
+	device_init_wakeup(&pdev->dev, false);
+}
+
 static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -223,6 +229,8 @@ static struct platform_driver bbnsm_pwrkey_driver = {
 		.of_match_table = bbnsm_pwrkey_ids,
 	},
 	.probe = bbnsm_pwrkey_probe,
+	.remove = bbnsm_pwrkey_remove,
+
 };
 module_platform_driver(bbnsm_pwrkey_driver);
 
-- 
2.37.1


