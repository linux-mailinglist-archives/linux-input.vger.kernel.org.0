Return-Path: <linux-input+bounces-7790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6399B748E
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 500EB1C24950
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:30:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1EA14430E;
	Thu, 31 Oct 2024 06:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="kG27Ymze"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7B13D899;
	Thu, 31 Oct 2024 06:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356246; cv=fail; b=ZKsMHJFwGsjBv216DMnMaFlwOB+Gp22q4WL7RcG759+efcKytupkscDnOhtJyr4IYdUVFJSF2a7THGcgJUh0oVG9CKIxcXf9qVd4Fz+/VANmBm1g2f4/yMlZHIw/HFXQhDrfPAgW+gVlr2F/Qr3XPXBqRBWpTRv2PxQmy/HJK1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356246; c=relaxed/simple;
	bh=y1MYnZ8vRwLXpf1FgeyiXnH/v+nZAQNao5ioxg1AoLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fLq3zM//4YHIF4llXLhodi9cc5sO2Eqizk5iWfmgn051iiqqPl5oXIceSWqGZV79ut5+hgyoYBNNU4Mgg2re3v5KuUIAcxgL9B7Z8VdD6xEGARZm1BiAenr8dTXi+g7zh0D5Wh1JkoKtWj6cz9GJTBpvLemoQqfmxkv+/CeF35U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=kG27Ymze; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twQF5qjnymRbdtCXnjswM+AU3AL0DwBbWnlc9vk3mJfpP/06HDy41urjdTKljJl4hhEHNGTqTyeWY0OOQCjAsBTDBWHhPnwhK5ANBuHCBJz6/ZayTXcWGe7lz5jxeif5z+VOMbRBOCRTuTy6BCJC5+dCmiF+aVc55ktLvEVlgC8kg/szG2E3bUJvnBWltplBN5IxlbC7EVMxeaHUS61nXjBmC9NVXhwg9bphiMe1yDnGvNCv2bcF3KCmXO42qxGFh1jtHuuW3oV71XfH0TL6aiUL5GFytY+Swn8HwCG42iPbU+sPx3/VLazHQhD8lKAKSBvRLZPs3JOkSRnRNp3SdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYVicDZ7a8ijNc4JdHRVIRf7abz+NCb0Ez3C/vfMo3s=;
 b=XgZRBlXV2sdCohErl9p9BG0ze5ngfNy+XMbrF078a6LZvA6OZfWgP7ygG5EP/KxLqnSSjTbNPtkRkHuS3AJnq0AZA3mdwIRGOiUjMhY8ZBy9GziMQ/uk2njuIkrODqwASd5IBLX4FH4ZzWfuLvUrK36hEJ5i7iEMbqjs4LCge1pR+Y/5iuGT5kSWWyUvJoLspLTwxuAj9gUE5JJV0u78JSjFw3hOnkXa8XtssC3KmYT3Fug0RFo7RXlr+CHMr6NdVGxM1hOxsgDAIrSyv7QALIrpDiMA6JIWBQbft3qchUU84ETbbuBggpizFqtjOmif+eDDfVqquH+pcwytkf9sjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYVicDZ7a8ijNc4JdHRVIRf7abz+NCb0Ez3C/vfMo3s=;
 b=kG27YmzeFX+uT3hMg2aQJRZu0sVwMcx3jzaXCOrZP1msqF4qc3H6B2SlmzUfr67Dbh8JcRehQbZ2WXnZuKFM3S+DzbNKoC7zJyLDxZkMedMY/0qF9rri/03OBXKqN1YqqRSf00jdd2299l8oA7sbyADzXWoAlW0B5XHaE+KajXu61WuL6Fqn+Ht5Xf+2NjGu+pXdSz3wFsiY+KhQ2CV2zw7jPp12GsSX2m4LWjOvrm2DxPPMdnNp4apLzsHV3vQ6spzrNfHulBNbFmqM2RED9u1mKjuUuwJVhu289v6avHfzJRaAKZvuv3op2e3pLxEbgrRFR+jlvlP3nsLW1H43hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:30:41 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:30:41 +0000
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
Subject: [PATCH 2/6] Input: matrix_keypad - use fsleep for variable delay duration
Date: Thu, 31 Oct 2024 07:30:00 +0100
Message-Id: <20241031063004.69956-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241031063004.69956-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0125.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::22) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 84be9a38-8be3-4aa4-a6ee-08dcf9758ac0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bvyDUSqm7vc+u5wu59wdjoUoO3NG2jIifDuxuWBpNwBbCQlB8cJXgwdj7bvg?=
 =?us-ascii?Q?FfiPKv1jGqBlszs8HZ5CaDEOm7lkNk0NNKCs9usHzmCFa8xvHFSEfRBmMpAb?=
 =?us-ascii?Q?e+Z38jgwvXOVva2FHlBFGSVpuNZpLitI3a8lB0lSi1G9WfAFbjwo2vZNdsBi?=
 =?us-ascii?Q?2KhVjnT80754kv4mlrtQk48H+pNqfqC5loFmn089Mxt/KXzjT8bLVsGxIcxq?=
 =?us-ascii?Q?uUQVdmqNzCXa+WHeUTk+zE/fNv0p0+xDz9H9d+WWV6GFuxR5jw9OK6LMyB2+?=
 =?us-ascii?Q?IhigZLrLz4GZHko44izOe4qAzkQVvqscDvVIzbC6LKAEhYU6CRLELitvnRRc?=
 =?us-ascii?Q?u4iiqMmZ5FZ5cRoQ92qJyuoLfNM7iWjVUYM189V552hbrNfixFaTs3cLjVPX?=
 =?us-ascii?Q?OvaBv9yUDCvLdZiA6DaNJkLiSpRE54Mt/RjslSoU6Ud1guwngw2+4qzYB274?=
 =?us-ascii?Q?xfKQtQgInz1kNzT/zItq6th9NFxCBLnf+if9gAZ/X92M3OZqOQifcqkvEtg+?=
 =?us-ascii?Q?tKe/MQ1aFnrdJ7k7huGNLr0PMbFamAKHDSGAoy7WVXEZL/pinwNv4kibrllV?=
 =?us-ascii?Q?JS9evgZyxKWU84cnQ+OH51h/VToJ5fQhSnI3c8nC/UrPwr7fp1K+R3d12n2Y?=
 =?us-ascii?Q?mQt5C0Qhzq3R3YPGyDNwngP3wz5MbvlAHCHPBMn6ueBmjhoQLaKSSEGObqUJ?=
 =?us-ascii?Q?JI6VWXcxxQ98njAbRXd7nCuUMgMedGfwwGJ8WoP5T8Svvd0PzMNI8IYM2zj2?=
 =?us-ascii?Q?4leLnX5S/JMHYia5P7aTZNlah/4PgM5y/U8zeH0tUKa0GObxrCcJNSBKe8UF?=
 =?us-ascii?Q?dlJBT2TAv5+9AxviCf8B0d0uTwe2+yBFJ9RCK3v4FhcDbUbVGIvjn3tjnT9l?=
 =?us-ascii?Q?YOAiwvwVm6qaz11rZCunFH5iDf5pK/YjMBwA8My8kQtIFYNMiLXviPgJSa8m?=
 =?us-ascii?Q?nnyRFzo2V4TaA0BFzqmEeHhoQFAh7G0T3EBBLYUNLlPh1ts228QeLpKiAL0A?=
 =?us-ascii?Q?jlHaVn+sTqqROCt5rpV6+wBBlwU9q5m6YGdJlbvnXZWeyfPCtw8czd1ynEHk?=
 =?us-ascii?Q?HWdFR0GrV8cseZEYb199QbtkZXzJ5iVGceY0FqrESpydWiGPsEztbHzOtVhG?=
 =?us-ascii?Q?ol7ekfzZ6enfsKLdsUr2PqG2O7AeKftsvQc9qG7ZBQCzNg5cJaUVtOiqN6nt?=
 =?us-ascii?Q?hz6MlzlZU2CsUGTIi3nf8D9GbeUYlewU2EDjeJNAXq/Foj54YmzpnPMCchyb?=
 =?us-ascii?Q?TT016HmBTGnSf/5nQ15kBslpQzEUNJgVI6vZVK7wC41nPf2yVfdIlD4KVUwj?=
 =?us-ascii?Q?F8YuqaZh8192anYqvgiCAeEP2CctdkdsG99ethE2zejnqkUY//bgyuh2VVqv?=
 =?us-ascii?Q?HOm8zWAtfSMdrTbl8yNBLU1Olpz/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FwpJiapOXDMStrk8CLnPIInossNHJraRixCQGQ3M+fMoOxib2jIFb/IoS0T1?=
 =?us-ascii?Q?1CRExr1yVpOEoDX52lzr/whuYltrxM0Wbk7j/iM+Xb0nyMRW0lm5k4cSFQfq?=
 =?us-ascii?Q?mTe3BZplAWnAA6cGjFM+Kp9RQZarCfdsD+Blvl3ZjU8+H3NaXusv2v/i+axc?=
 =?us-ascii?Q?m7vBTOiX9wRCamGvp5Z+H6eK7eJX4mVZhFtX998YsH6DYmwSNEZwozjLX+fH?=
 =?us-ascii?Q?7a2xDIFRV/k+Ykh0ThgvdGMG42h5LTXh2+O9ByURtIP+nqaEfLMPc29Y/DiD?=
 =?us-ascii?Q?MWlzwySK8Kzdn9aI6Z70W+nn558ITUW3Ka4MqCfFH/CvTv4LP+d0ng6ZVtkT?=
 =?us-ascii?Q?HueRkux5F5k1Z+RrxpTKwExkjK/KcAGyZmGDy3jnInbxetqheeOrm2OIN+/q?=
 =?us-ascii?Q?l923Bq0WTR4Q6q+8WY8nH3Ng5Luft4FV1vHsINtQz/OwEVOw5vh3cx4jOYFy?=
 =?us-ascii?Q?RMnNSFPiENrZ50rV49f0GOpjkH4p7VE0KgApvK5Nw32QaO2mN8xqSKMFY9es?=
 =?us-ascii?Q?VpHhY308+2DuesIhZ0sXdWp2pxFktxPogQFuUp66xKidFX4wJJl4oflcbFOd?=
 =?us-ascii?Q?Kr6lJ52FC2mkpB02KDT6B4LbBkcv3ST6JaNumkQlLRFp1t1DXQmD/gXMlIwG?=
 =?us-ascii?Q?9ZEJak+iWBZJNCXqrtU2FldmO3HlQhr6fBBnf45Mb9dR41cW4A6WRrVQBuc7?=
 =?us-ascii?Q?absXgKtDEJZVjeq7orV7z2QWJlkHt5BRPnEa8PZq3p2W1Jy6b4/TMDCY0s03?=
 =?us-ascii?Q?HOy4xQw8B5+UYb2ayylpDYlZg+kkY3kGEAmqJIxtKVWGFeoLNzkNVB4T3kFA?=
 =?us-ascii?Q?Fpcs1i/JCx3Tmts27YPURUOXQtb35zu8F5NRXisT1Inxs+cGhJ8a9uChWXDc?=
 =?us-ascii?Q?odJvGC+lyzkOx10OQALasEUjCscA/PrrjmNDXo3a0wZcG3WSOFnf5zdcdcwB?=
 =?us-ascii?Q?ppXj1mkF9tbHOz36Dwdw0aXpwTD4ZSpFafP5f2OFaEr/z6/DnnDthAtekgt7?=
 =?us-ascii?Q?cYKyGsbTjoum2YuH5WK8zuoyezR13g8kCmWuorH1vLKzB02dHigwOFVuDobD?=
 =?us-ascii?Q?DBHQPJLkcBLI+EOrkRBsGOc0askLM96+U1iGC9g9NVqMA6q/xc8u5QWP1NS6?=
 =?us-ascii?Q?ukAoWuDmBioErwyicndWM0G5NFG2EUudPHZx2+HwMi9WICR7l7+fwVQN5LPG?=
 =?us-ascii?Q?VAC4KDm8/Bpn/fDiMme0FMBWW86ExOgUTYwDZ99iHBw/WOrraTdSq6vHq+Nq?=
 =?us-ascii?Q?nU1FN+omfx9iY6voNkxaLOizHItAXzZFujcUSiNeY+FxczpB1hN97awbSlJ7?=
 =?us-ascii?Q?YZAFdqGpR3rsrlNYKy5PuRT6eAPg7vHrjCrGZ9jxk7KHo/lvRVk+Omc6iBN5?=
 =?us-ascii?Q?I0DbrvABl2eq8BtNzohevUAd0JD9i+WJaCCYJmxPc5H1Xmcz8geu0lQ9XKP5?=
 =?us-ascii?Q?MLLyO8qgmwLafzsAYzFXx+wabiXLORClf0yGrp/mGvg18Miex/y5dOpXzaXH?=
 =?us-ascii?Q?1ccoGAqcDiom7VIxGr40Wgb5cvTj0B3tfoCl86erEDybOzaqorYq+5bvhen6?=
 =?us-ascii?Q?623BlW0z0QqgmjlJ4vZXqURtqkSjsU9JFZo2uOyC?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84be9a38-8be3-4aa4-a6ee-08dcf9758ac0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:30:41.4986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mo+8n2WPMdwimPh0ivFywD9Loqi59D5RKqCec3J9GQNBJGkl+QEgE0CxkUeMHZy6pAp/SYT1cJwGASH+3ThR2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

The delay is retrieved from a device-tree property, so the duration is
variable. fsleep guesses the best delay function based on duration.

Link: https://www.kernel.org/doc/html/latest/timers/timers-howto.html

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Manuel Traut <manuel.traut@mt.com>
Tested-by: HeDong Zhao <hedong.zhao@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index a2ec9f6..e08d7d5 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -69,7 +69,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
 	__activate_col(keypad, col, on);
 
 	if (on && keypad->col_scan_delay_us)
-		udelay(keypad->col_scan_delay_us);
+		fsleep(keypad->col_scan_delay_us);
 }
 
 static void activate_all_cols(struct matrix_keypad *keypad, bool on)
-- 
2.39.5


