Return-Path: <linux-input+bounces-10510-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360EA4D062
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 01:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF637174D90
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 00:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2662E634;
	Tue,  4 Mar 2025 00:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sZ+CrPwn"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2075.outbound.protection.outlook.com [40.107.22.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533862AF00;
	Tue,  4 Mar 2025 00:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741049126; cv=fail; b=caS+r7dJWfXHgpp6naGeAf5Cv0450wzdYvK5YmaIrmqbZD6g6qdC5siF2GoKfLGV7QW0h9Xe+k5JLw2uHowodqRF4PgnySIn7PRnFKMeeWDVWDEOs5XW2p5gROveM/7GzOBsoSTGUXUfg75YNvkI5ukBsTYi/hNTXlRQrH6MzPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741049126; c=relaxed/simple;
	bh=fORFCeb67eswpvoGertra0R61eIBmHNVfMNmfPTCy7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hl/neunhgmNCVAP8K/pCDrCpoakNgKITfFBUxiXoUgG+Uc2nIyZTgngtNhB5fqnVvHAppvCVysrdeRs88j2t0MtAy6GoQrW7sr/XNoErcPyUBZLqqkmXiOcP0bRGibRPh880P8hdJ6gTJUof8dF6Zh48bGccpzT7Kr0A/Temkz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sZ+CrPwn; arc=fail smtp.client-ip=40.107.22.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vjjx+zzLglZxcyu2kZitpQf7UbA9xGQRDWEt2DhYRtwFAKFYzV8znxSpriI4T9MDt2d2SmxNkVdFNaS8+a0Pv/lYiAmD+9+peTO/dVlGN9lgjIKJf7oGHLQEXz7lvuFjX8cB14otQZVNSLABxC5XQnYScJ9ED1v3UOBxqV4zYJ9dmhj67/GWZuZ4k8WOc7nnlkhL5e/qN9AGNGYZgo41bjJsnbr9NRSZ98IH7EgyA+2AYxx83TwjnZzkuwixPGx62wWn4hnFyq8qGydJ9y9h9V12lbKKN8yLZCVGnpJHK8nf5xpHiU8sHw5TvRIoW1TP5lu59Jkb2iBtzM6r7AbJhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DbAf8a59g1mC1aOiz9V7uAUztw2vQfPHPqRXnNgnczw=;
 b=hubB++0aMMZQhRsOBViYyiVRLk37pfSS0KlZNQvsq1KPAbdJk9MCtpGWsZvUJn2Y7SmzwZb47BxExkDp2MQWASS0Hv4Qgt3JY338ujJhDUMa6RtKip16hvjM3ed8AV8q+Thb+BDILb9+F6iUiz8QbAr5S3bqgv3j4QMJZXCfwSL7vfVpx5X+KfBaDhYCiOIPHTH/SfVO8O8WrXW3FGlxmdqd+dh3Dfp0iFP0EKco6+Dw/EpuZDDjfzPwMSsCR4wyNBuMMaUfzFvgrzVf9Jhm3KiHxEvgAlXPwVEV+oyIvesFI2BKxmDKL2vqi2jRjZlq5+l4vWn043ECfOfnPeEdyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DbAf8a59g1mC1aOiz9V7uAUztw2vQfPHPqRXnNgnczw=;
 b=sZ+CrPwnMhNhC2s8y2L54OvT2GZEi2Zdjh66sxRK1VycxHIJrAuCRBfPY/918UEwecXF5ZgC8EXsxPMicR5wpBBAzVwUqmJF5gsIHQwuffjOtIIS7Cy33LWuHbgnD05Kdqh0AYDRYv22jRJ5oamENBhbdKW95wHjOV0QqXzMAXIcKtP6bHTSykgP2L6AlOQzm+ZsSi1eQAoNpkoNsyKXudIw0o1uUD26KX2JEWUbB1ZWmu0B+aWt0DRhkcS4SwxULaDwqkqvEvNGtfwzXXfTOKfrq8n+9064VNGFcPt277YyLgsZyS9DQEoScfDhqIDk0G7jf7cuSRHxdk9H6EywPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DBBPR04MB7804.eurprd04.prod.outlook.com (2603:10a6:10:1e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Tue, 4 Mar
 2025 00:45:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 00:45:21 +0000
Date: Tue, 4 Mar 2025 09:51:40 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] input: use devm_pm_set_wake_irq
Message-ID: <20250304015140.GA24694@nxa18884-linux>
References: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-input-cleanup-v1-0-9758898ff8cb@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2PR06CA0013.apcprd06.prod.outlook.com
 (2603:1096:4:186::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DBBPR04MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 9babd9ba-ceae-497e-c728-08dd5ab5d781
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?juV2X7HCWIpfGrFeTsnzUj4jQEmZc5phchBmCde/QFHdVUN84UIcUGhea0PB?=
 =?us-ascii?Q?9XEwCfU6xssRIKEM8n0JmbPtzoSGpxiXekVocDXTKmCptYzFtokaU34Tslpg?=
 =?us-ascii?Q?eqK0qs9TRW9f8rxZS03J38rNHBKONxglDuUfqwIywFGyXzGGQWbKtgj7J/NF?=
 =?us-ascii?Q?ud2cFgl7g8WwNl413gQbEpj6xBch8evUYoXkW0RKHRPLn2xcDPuB8/JF+z8F?=
 =?us-ascii?Q?1qipZf/5kH5bQeboZSsvdpt/At8r/YqtaM/+3V6fkO3wDS1GKSbiq+UODKzf?=
 =?us-ascii?Q?JZnoG++EKJMDEsIQW+rC+5OE3kR/acHJURqO4kIxAOLuolXpdufEAMOVRWO2?=
 =?us-ascii?Q?cCMOgRw546Zc13GbWkr43XvNN6Bv1BBOUKw0GCl30cevL/XZ58RYRlz4LmgO?=
 =?us-ascii?Q?akwkYWRUQ9fKl7Xa+YeMAZNfWwNhkuueK0gSFnKxaOvxfKgM5ird32t5SSD9?=
 =?us-ascii?Q?avIkKbxucJ936wblioHIuQ/touueNCk4kbVmdhkee76xnqlKsgW5eewsv3wD?=
 =?us-ascii?Q?uzBHr/4+JuPm5m43vfD7Cw84oaASv0vjU5JZRuF+76jwJVPH2uI5JOnAMF+s?=
 =?us-ascii?Q?QSfiYK3/RMJalu99uqo6qeeBOS13g3GXJwRO8v136Ofo+HfDtiMUbYj2IDr7?=
 =?us-ascii?Q?EUYnbq5H3Nha3vrzyG/J4MC12riUHEzR4IPgPkhSFJqWu2lB4SsPafFOVtCb?=
 =?us-ascii?Q?fpiNChmgdUROUGitGaDY+aPfmjAXO3r2E8Y/OhFI55fc+mfJH4s4bL5IL+TP?=
 =?us-ascii?Q?UT3eMrFVUT//FrAo+oZhu+woePZ9cFnslRbMC1ufFSC5AMVCKb6vVnundiKG?=
 =?us-ascii?Q?UBCNEtEfCJn1hES3U4yqYpiJDYhs3IvBbw1VpeMSRxHZiLaUXyqabnsuDdrl?=
 =?us-ascii?Q?p7bT4vC1CDbbGA4G2Hp3Z9w4hJLF5stJwl45BaYV/oA3Ko1hc3bzeF6gvnVz?=
 =?us-ascii?Q?nACLbQ+3gvreKtciTYFW7AEBWzeSGFA7dca0trZvgj5VSW6W/MZqLfwbH0q2?=
 =?us-ascii?Q?C0L19/bicOzBeaDjAGxjzhifqjcC4FPuVytlqUEBeHJeqkEBwIhzAjtl7qk7?=
 =?us-ascii?Q?o5o199e9rszd8cK94LkRHNApw1mRQ1HsDokOzn4KX7uxL17lw99QgDuLkCtb?=
 =?us-ascii?Q?MReicH8RL+GwnmtRG6V2ccIks8+yCtIE+xte+VQqcu4rUpRq81UvVt10NX44?=
 =?us-ascii?Q?cUMqTKply0+52CQ4+Dvg4kehlzOfY3BLZRV3hfRYVNeM4i795sV0qZAecpJO?=
 =?us-ascii?Q?F8gKm5lMKApHBsH9Q+Dk757PFH1IHwYishdweatj1fJll3lVMB/HhZXyDa9A?=
 =?us-ascii?Q?1MQ2arNyqDCBlbT7T6ovSzKcol8dzO1FpZMUt5GsJLTbhdBDqEBhve9Dvv8t?=
 =?us-ascii?Q?LkIRrUUl6rfb6V0ShQeq3BkBdwM9E4m6uS/8v+h5KsCEck5VEw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YhBX6fS0/DyOlujZUTumvEw58Uds/OLUBA1T8IOxeBvRtkGAxR2no7AndEh2?=
 =?us-ascii?Q?miDc0j3U1ZM5h5A7ajOKEWLhgKWXVJ9Eekh+B0qQerH1fQnhWUkqRZL+cDYv?=
 =?us-ascii?Q?fh9yTR2Abmq7BejLvSuePXDsWDKmSQvBkGdPFE0xpaWwOukq9Ss4mpeT/TJD?=
 =?us-ascii?Q?HLsDFSQu9610CxyYT8iYsQPUsyU1Ca9/tiC6+p1P1FIxllJzh4AWiG2D2y9H?=
 =?us-ascii?Q?JsOa/+Z8I/Aijg9reeYc4zuwXfKgr+eLWrXVhH8+FJlflYp/244g2J+lAJCh?=
 =?us-ascii?Q?2Bm61i1MUv0qqO3x5PVORbOFc82Dd69ByOtBvCn11nIiSX5wLzR5bvVPTW81?=
 =?us-ascii?Q?PhpY/7COG7K6APtIccn5VPw/NdQnWRnSr+1/z7MO90s2cZS1/jgmoH/xih4F?=
 =?us-ascii?Q?tHeNVKJ8zQ8pX42JmH6qWWSLv80wrTL/DztRioTEh68OJ9L70Va0TCYzLaNp?=
 =?us-ascii?Q?FEaBWHv/KzINDFqQGyTqp/Kr8/r/gZ9UcKHJ6Oke8X0nnpqW/TwsXNX+cXcX?=
 =?us-ascii?Q?vXu76OOlaB7RqMWDYLfbSAHW0r8s2r8vkeehOxyIi4QKg9FOVZ+k9Ay+6rYQ?=
 =?us-ascii?Q?LLYM22Ai+aoPYyoMUoSSdRWVs0SYdl8UIaRebLztiysH3kfBGiwcYimN3lzc?=
 =?us-ascii?Q?x9G15V72v6ms230lgUY3/QBif2r2b6Mh0ty43PWYq5sjEZhB2NpxoDSZ7YxS?=
 =?us-ascii?Q?UKB4rnKquVQ2h7jJr9TuhPyarFc2Gsnj7mdEFYnsp9A0WO9YL7Z/Pb2iADVE?=
 =?us-ascii?Q?JyarExzyOhCTYKwuBSnGCtwJP8v+5fstQnPVSWPdTMhtrHvIs6Kx+GQLazRt?=
 =?us-ascii?Q?4Y22bNnXIy/x9xLQwo7rni7PdZXKhTve213cGjNu3E7+zFOoFnnyNSrsadBx?=
 =?us-ascii?Q?MSfiJTtxHIZLgugCR9D3n0qr9l1ix/4lH9CJF0JEsTJq6qRpcRc8xdQQpVvY?=
 =?us-ascii?Q?IY338OyAaFt2ogqiCFVtKJ6lon6CR2kAroakKyfofeFUI+6e7JCZkWv02x0X?=
 =?us-ascii?Q?uQ5JaZSZSHl3v3oLtvI0AaddSo6U0kyHv7n3kZiLA77eDE01w546yTPWDY4w?=
 =?us-ascii?Q?f7YcTisJB4pD/vCzFl8XS8Y6GpmqrAlBHtJmUFccXW7LEoJ5WGxpQucCf9D1?=
 =?us-ascii?Q?YX3E4sb4EWsvFcRP5ASjf2JvWcwF7z0hMLecsXJPYxkRnmJkk7Sab8kof/qz?=
 =?us-ascii?Q?D9jkoUnU9H4KKR4l7GIjV+PsHDSRm6ADEkwHon/iPO7DVxtBJ9JwOyaO+Z39?=
 =?us-ascii?Q?FJoG+FbQBBpJsp1ywOBQ6gIbZHRjnHxam0q4+IyzWWl3ZveriwTpQ3xZHcqN?=
 =?us-ascii?Q?Yuj+Mm9+EhuTkBscwJ7xwgSmyiMhjgGn/YuvC+DhwRG4dm+yR6VgayyoXmHi?=
 =?us-ascii?Q?uVK5PsDxWKh0pgnSplP+fC0KT5E50PnIsq3rglpR+4s7PPCgWvPN4eZWrZGL?=
 =?us-ascii?Q?tETWUIrhuw8uBh67aRd8DRbyAyRiCOzGzI6geTHJvnu8vRDkQ0Tt71chUngn?=
 =?us-ascii?Q?w0iAduI7dlSWqWG7t0DvdytpCfacMR2Y6rwBE/4gxIB2Vd4iYN/Dzr5puSGD?=
 =?us-ascii?Q?Ikcs4WoRKTYOCkHABvBpxp/ePu2MDX7mihU/ENgg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9babd9ba-ceae-497e-c728-08dd5ab5d781
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 00:45:20.9634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ypP/qxJIROoDHV8sY6MACYfWFRDtrncm/XXsJUwJp9R0OTmsJvvgaL33e2amCRBSxpH/8Y42NA5EoyKpCuVHZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7804

Hi Dmitry,

On Wed, Feb 05, 2025 at 08:45:13AM +0800, Peng Fan (OSS) wrote:
>This is a pick-up of patch 2-5 from patchset [1]
>
>Since devm_pm_set_wake_irq is in 6.14, so resend the input parts.

Do you have time to give a look on this patchset?

Thanks,
Peng

>
>[1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Peng Fan (4):
>      input: keyboard: ep93xx_keypad: Use devm_pm_set_wake_irq
>      input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
>      input: misc: nxp-bbnsm-pwrkey: Use resource managed API to simplify code
>      input: touchscreen: ti_am335x_tsc: Use resource managed API to simplify code
>
> drivers/input/keyboard/ep93xx_keypad.c    |  8 +-----
> drivers/input/keyboard/omap4-keypad.c     |  8 +-----
> drivers/input/misc/nxp-bbnsm-pwrkey.c     | 15 ++++-------
> drivers/input/touchscreen/ti_am335x_tsc.c | 43 ++++++++++---------------------
> 4 files changed, 21 insertions(+), 53 deletions(-)
>---
>base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
>change-id: 20250205-input-cleanup-219afcebf38a
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
>

