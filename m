Return-Path: <linux-input+bounces-14252-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE109B30CDC
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 05:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 869FB5C2F00
	for <lists+linux-input@lfdr.de>; Fri, 22 Aug 2025 03:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B5471A9F91;
	Fri, 22 Aug 2025 03:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="cWhY9xZn"
X-Original-To: linux-input@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013032.outbound.protection.outlook.com [40.107.44.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BFD126C05;
	Fri, 22 Aug 2025 03:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834492; cv=fail; b=nxGrdLJtzStqUP+Q5AigHyeQIWgH+Gi31JRZFDoBYhJ1GcIbeJfoWLfkG1eWMaKMOXLEykJHj+cVUm3c7qgtkLca1c0j0yv1SasYXeycw8uItkauxTZ24gJoIYpvm6BDqbIhcP47wrWh+Jcg0EB+a3cN7k0syV5pZspTWdw4BmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834492; c=relaxed/simple;
	bh=EiIlLRtl53RFmXBdw7tAP8ZRsqfrg/uroKL3Eb1CdIg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IxkzyEWPAQK+Q+M0QrM3LAyJB9xE0vGmM23dVhfFEMthWfH+HGDPolP8lAJinhT+MHIF32WhsjwtDehjSPVoZ9EpdDpoxziqWdy/jinjmfyKMMUh1pXHVQMu0HXX+GLjw9aDD8wz7Kf11EPGXCFtgDLaFPhNJ2/uJUtQSPykXYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=cWhY9xZn; arc=fail smtp.client-ip=40.107.44.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCBLtPFd9gHsAdB0X5Fa2Sp8eIamygsP/sstmHvRvl5qss69M0/HkgZDkkswr23rhpD3GNWoj+guSIeYbpKEBOATdxofd1f5S4wHjn70scFGB1vjb6W79YaMbsOav2eGFlriIG4/sVHI11BzM+M0NYbo9FXp22N79SG78NElS0VknM6Kl/DFWEei9fkvzPmGn91aA/gmeLfhVra/eLvhET8HkyWKb9Ynx16Ohqsky8TUAqo6mqkoeqR9B+aSA2UyjZa5Ch+24rZAa9OWG9Fhh1hvKCvQECVfnEH+aSsI9VK//ztbmCmDdA7YxmaV3fjgwX3V1GuuIyVypRjgu5n3AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2BS0oNdDHwsL2e0iUp38cz4QLXijbIa4bQUJhwD93k=;
 b=ts1hULyh1w7uUMBYYY481YJJdMjCG0cXK3G4bH+6JfE8ahayD5Qe/Rlpm6vpxXMqJHlKPB0bET3+N8NcYJnpLPGoshsM6TPRg0BjCd2n2ZxKWDdlZn06AJKrY6zT4YpwGMwjAp/TWDETHVvoFpLHEV9pfggdWExStWeHaVcTIq852ojz9gNLkTd6nTM63hg/Bkd4VB2t5Oh6qNiK3M9aNB0QXjwnBa7eAC3A2TzAxgTIy6BB5S7//ggRVvZ5Uo1/yqDwjmzx61U4ZW6MLoeUjtmzUvEXjVVCkFSPF0vYG2PPKEZBoCCoIT+OQ7/Amw6G2t9IB5Yu25RppuSotW8JvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2BS0oNdDHwsL2e0iUp38cz4QLXijbIa4bQUJhwD93k=;
 b=cWhY9xZn2WHG4G6u/8diGuXTO0R88Ywe7PfeWl2qbyD2F0WnDxcpx2A03cIZg3AGc9oMfW4ZpEL4SAi5P/LXFvqBWUUPgMEUwLZ9thxBlyOlKUoJDPRm7meoqTB/C7TQqCizk2AhVhflQa6AkdoEn2XgwS5e/qKOZd4W1P3vt0oWecK2MAvhblivL7C4ktUXtlBJBHBMDrzzHzesbdMJQIXO+IlDAkZO73gBBbMHrePVNpiN/CvZqnnTunrmLbbI3BdtWE0KiZr8OQPAkzQquUwz+1v4vmn5asIy0ZgQuP+OE3V0OzgGkKNQ5Zf3GFe+g336duFeWzHfV4PGXobkRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by TY0PR06MB5150.apcprd06.prod.outlook.com (2603:1096:400:1b1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.17; Fri, 22 Aug
 2025 03:48:05 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9052.014; Fri, 22 Aug 2025
 03:48:04 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	linux-kernel@vger.kernel.org (open list)
Cc: Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH v2 0/2] Input: Remove dev_err_probe() if error is -ENOMEM
Date: Fri, 22 Aug 2025 11:47:47 +0800
Message-Id: <20250822034751.244248-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|TY0PR06MB5150:EE_
X-MS-Office365-Filtering-Correlation-Id: 7db3b2bb-2763-4c72-02d6-08dde12eb2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nWSnENPjyix4y4nMpPfXPzQyuJOBB5M3n8wxoPTiwBpUWuoL4FJ+X+4Ao3t5?=
 =?us-ascii?Q?QwqZ3uYN5fi1H4N9lV2+HAGHDytxy/OfERomMwJCVfKlvnUl8rNkNwKL9m63?=
 =?us-ascii?Q?cKdEGuw8piOng6OOzOraHehzqhzcfFMTtXgaGPVkXPodJtLE0UJK8fVHmrM1?=
 =?us-ascii?Q?r7wsVHXh3yz8tU643YhcEwqu+pyQk6MZ4/q3zDBdwXg6OZKARTE9x78fdoBK?=
 =?us-ascii?Q?V+mKhrF/ydtRZKHxHVdTC3tYgCV62JkMq9gFwTUTa9LkqEwc8MfYPYoBK9Bv?=
 =?us-ascii?Q?OoMqn1RswHtpr2jiIb3QSv5n7I9yrqskRb8QvD2t1+wIgVwAFDYOx9a8Z2SO?=
 =?us-ascii?Q?QejFQC3hhuyjsG0xfFSCEzE9GDwUfhTsQ9HlU/Zdima5AXaXPVUQrx0BDp95?=
 =?us-ascii?Q?xEYFf83IZrMqVM2cY2oaSqLXh9qXaVUT+o+moeWeyrrXVcvxCSkQ0Mta5dIN?=
 =?us-ascii?Q?XY/sFjPwuLUqrJcgAICPf71DcXkDkEPWz7eQDQ4mVd1Fz+HV0QgAAeFBerRj?=
 =?us-ascii?Q?roTMVIuIc55znCI6Y4KAyEep3Phv1MoHgEth0MC5zU3a7aSGV1u8dXt9lJXf?=
 =?us-ascii?Q?MejoopUQ8X78+QxcJeIkz05vMZXn/BlOLB+4eSOVYWCwMo2gSKJ9ZMP1fF65?=
 =?us-ascii?Q?8vuoklQKwoHuCpurLqe9oXNx7aJJI5cKAQXQ2bGjqtXGmqyUbbbUkY5FtD4k?=
 =?us-ascii?Q?nKs3P4NFDl2K0f7nSLHodt3fbtAy8J1+RtPZWXrG2/YWZG/+LmeahUJYlScL?=
 =?us-ascii?Q?5wNH/Ve2LyCpOeMTKnbTORtXnuG2Zn/32Ffw88b7r9EjRr+rnBJo9uGZDOvg?=
 =?us-ascii?Q?+wttjGrhviLhtAHvkgVy50EZecVoI1SDubuvuhRtYIhbfGgB/SEPmzAvdOTY?=
 =?us-ascii?Q?YWPMImXKkYGz4cp7knCSqv43C6jggCL8rdtWL0dY9IOzcf/cS+J6jvx9pVTK?=
 =?us-ascii?Q?1IubM2IaUBOIWw6Jd35cUPpdnZ4Hyz+KVK914nBkeQs8rAiCaTokuBgF2thk?=
 =?us-ascii?Q?vM0wI5TzvDa6cciLVLn3Q3lXbCj+iRaxdIzQlT7H2lMC6W3fEi6kRWePIxN9?=
 =?us-ascii?Q?E7aXGAsIME7Im8GKfpTJdXUo1129LWPrALym2MGJo7wMv2mlMJixdC6Z3lq3?=
 =?us-ascii?Q?QNQYEoxYB+agE2AjWh0Cx95YHWEZ9wL9HuAQQRHxeHQ0Bxp1/pB9Y5eJ5Vu6?=
 =?us-ascii?Q?EDbpXKwwitmbz45RHthaK7X6RvpM6lyvGeeBAGYZ49lcXhICaRwvC2Cu5jXt?=
 =?us-ascii?Q?sGhijm38PoKjqh48cYhCzEhDQOo1ctPhUNJZAGwGB5k0fV8NS1KVYwq1FL8P?=
 =?us-ascii?Q?eGkKKrQ3xYcvlev2zGTKh7RiHP9P+xw+jcmmSbKSknKsMLYPR+03e22Nf4Qa?=
 =?us-ascii?Q?pj9gYfO3cAjs+FYTOMHvmexlZVCzz57IuiC2bap3/EuMSYVdoV7Q2X6Qhbnv?=
 =?us-ascii?Q?Sh8aR3uY1kq3ushXA6ahOpKbSW4wjFtU8O533aNv2+wiQkfOnqHP3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Eo4GXP4dh+0xT0vR7I2Rw1Md9iTTLtqEzty28y24x8+PgJyrY7/5OeBzthP/?=
 =?us-ascii?Q?+fGt8n+zKt5lirn3W7W3wOTx050r7+natYMmJoLOg7b2qfJhQ0DoGypprs09?=
 =?us-ascii?Q?W3nNua5tOuRJs4dpSy25cx5l2dd+KhodVfx+pLi5i+Fd9kgtSi1zeohClsq0?=
 =?us-ascii?Q?4rA2nXA/UGI4sds3j2ZS1XaNj/nI8xMcOWX9b4/A4oCc5wYk1CQ5awbG7kwC?=
 =?us-ascii?Q?0AelbuELqqtmCvDYnjmzjuFsYumATdtwdBhkfsoAi5zTGHOXZh6i60vaOkOD?=
 =?us-ascii?Q?2GTSqGEUyXq16vmdmhjyvM5VpZIrI/ErAoxBYkxxsanlozpLqBsttaoJu3VQ?=
 =?us-ascii?Q?vRGLBJRm7EnCiG770TwS0GBwh3OLrD36poDOkhsKhYgwRxZKpB5V70DvJcvo?=
 =?us-ascii?Q?/AD0T5NuHiGqBRPGqzgcciRXgrt2aU6Znv7k+wx8u6sw4/xtFOJ3lfQjgKfI?=
 =?us-ascii?Q?gQQxzTxrrmnAP+A32Fv7yLDxRLDKctmtRjOD++lJyxJvY5baneYRNlVqGoct?=
 =?us-ascii?Q?rb+Oh7nQ6g/1XuFULdfNNHDQP4VD9mRCiUNVp8e+Dd10HBam8fah/QM7jnEM?=
 =?us-ascii?Q?F0tSkVPo7sSGWB5MG+HSk/tvZPR6AdSHMxq2Du4JaY1qJJhb9hzCAWEucuZ+?=
 =?us-ascii?Q?8QAVjHlSKNDlF9K7ieHarFU5sM0zLfTWT0p2607NAOAF3UyGsg9ByjWlVFJF?=
 =?us-ascii?Q?kuKYe0yLvjclD1eMX3niHiAr3IBrEgETtmwZe1Q4YKkITkBYZKdTCBY1UD9P?=
 =?us-ascii?Q?WwVOpGtz1F2na1vAy09WJmyyBQrDb5gG6DpfklSEn7ApvFuBXbiLLgbOMHmA?=
 =?us-ascii?Q?Bp/ZMXZltD117tS8BgNPn41MlXdnR3moMUOQ70DNGXUvd3sKlkGGnRr+RbWw?=
 =?us-ascii?Q?z13gxbq0ueFTNsrvUgjIFBmrawFTIcTnT7nwS++K+85JByYcR5w74TZ4fXsf?=
 =?us-ascii?Q?mHQbw24ooIb9COdXG1Mp92Tz1NlBWp8lHpKB/0TNuc4PLl+UsXQhNvwcb/Eo?=
 =?us-ascii?Q?LMthxla1wpfArbvF3LmcPemoDAEDlKhcTWfznfhJHQ7IIrYjKQtrhsKoN2k8?=
 =?us-ascii?Q?gBNAs6p5rYixrLYzwjoopbjS3z3gBNIBEUUow4V3pVkHlLp6ix/HCNXcmrP+?=
 =?us-ascii?Q?jA/2zHLgTqBosMV0SyYtbt2PyUCP6Dnsmm5rM8KlnE79gvtFPCbB9n65eMNW?=
 =?us-ascii?Q?7qmrThfVKfGfnHESgsulz6kLPMBWTSUi0Q7dhzC7J+8InP6JOSg0hb/V2mpf?=
 =?us-ascii?Q?30zaiMeoLVlGdD/QDO7DsLE/FGhWyPuXqMLLfCvlgFNgCofvWK6F92de3pMC?=
 =?us-ascii?Q?k3/bOnehN7F//Gf99UrLRPu/t+uGctkaeo/mjfEKvqVKu4u/QAtT5YSIFMRV?=
 =?us-ascii?Q?WzNVpW2bvIi8E7eHcJsZBwyK4nKcqkVvivYuqCOdb/WXUrAoG17P0Ugev9xh?=
 =?us-ascii?Q?dH3frBgpfM9rufUV73r46wmAGlZYuoavIFwyhcBiKpwf6fWLo5KFQ67riyjt?=
 =?us-ascii?Q?9VWWu0HBM9l4NymffD0DQLrRPUIB7DHflQNy8QOpkM2Xb3Vr7zT3Ib0wvcu0?=
 =?us-ascii?Q?guNK877SPCNweAKW01RvLAohlj2vxgaDZnlzQwsa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7db3b2bb-2763-4c72-02d6-08dde12eb2e1
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 03:48:04.5262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lq4zsrWkbuauFRDjzmo4gWNnGw5qD+f/vfA3POYNGBs5BaxQ77F/ra69AuWiEBikUUcNiYjnMFk+LrDn4LIJlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5150

The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
Therefore, remove the useless call to dev_err_probe(), and just
return the value instead.
---
v2: Split each driver into a separate patch.
---
Xichao Zhao (2):
  Input: misc: Remove dev_err_probe() if error is -ENOMEM
  Input: zforce_ts - remove dev_err_probe() if error is -ENOMEM

 drivers/input/misc/qnap-mcu-input.c   | 2 +-
 drivers/input/touchscreen/zforce_ts.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.34.1


