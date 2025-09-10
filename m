Return-Path: <linux-input+bounces-14592-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242AEB51BA7
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 17:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A2427B197D
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 15:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1D1262FD3;
	Wed, 10 Sep 2025 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m5Mqmmv9"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013011.outbound.protection.outlook.com [52.101.72.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E068425A659;
	Wed, 10 Sep 2025 15:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518214; cv=fail; b=ZxfU2scEOCty7nffueTwFyFm+zcr92v4l/ywcL2r3efNGRQJhj6l+DyULHGwJrhJUXYS68Bv0mFYhkNf1EnykXX0S8WEjxsHnCZer0rjkMih41EHexvITRjMT1OCQqU4Rq3FEp9+5H5yzUxPGpYZ3ginjbMDjtvgR/1BMdqMtCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518214; c=relaxed/simple;
	bh=iDYOZqUp9eZ7KK3nukGp+EVpVSmqyx/Ph4ZDyjAtbr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ek5tgouLhsj9eUMJ5iFnOXJ5/fl085oo8u1Znp0zwB0oQLnpYqSrprHd32YgImux5/8V5HVIh0YEqUKOKPco2H83hBk9K6ma8nt+a3ARiviCsBRegrm89nkqurlCohiFMYD2d0xpMKXB0xgBcENaFqN5MUeEdX3cQpOGRjZVWOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m5Mqmmv9; arc=fail smtp.client-ip=52.101.72.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MASQDFCEsIUmQSxONtXEy+e6V2IR5q3MN8hEIl1Cx0hWj5i+g6uoX/RCQsJDlWP18s2Cs72LdGJh7+tjNu/jeSbeP7CO7BzzANjlAOUzDaIh/oVLeQTkvYN6AdH3jPdbk3r2kq4wglMDJuTTmfOPtQqUHJoB6p3UvSHCYZmqprg5iiNdrhl2k1N45cYV7KzGkvBItMQYqAUrVgnW/4ed3hLA0AD25/+x2PpD0dvz9xBJukxmLK0/IV+L7jejUwbBWJV4iLdWvisoAl3GcVB9ZbG3KMIK3WN/85DNtwjUWTrpl63/Y3ka1/WHsifKkgfSYhK1o7E7tUAyHs6ow+Ji/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bHd5te8hn38TFE+K70Pzp8fD9SCRudtYXGa/LGYohzA=;
 b=TatS4kCLvma4xHNRY5m0nOJdJyrfr0Y7XSwEcwCqW3w9vUpqjJ12rx7IpxW/W2YUQ9sewzPQ+z/FJANPY4xXp54huC7KrovuwDT+WVqWTCO9ljOpB27IKJgwprDSK+aalNFoTLEmUOx2BZD1lDEhF/oNZkC4aCJGfwmCM19507XvVDUQTFNWhn5/iL4FkYfHKRjAURVUB2YhPijB2ytEOiWrZNSl7nw42IHpXd3KQ4SWb9gx7s7/wpMmsaoPJX4axz+vRehO6nSYZpTr9YEHox1x4y+xfOA/oynzP3UBy/+S0FIkUh0ltiUaLmpYPr1zUQzITTqTkWbTa9jnroiHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHd5te8hn38TFE+K70Pzp8fD9SCRudtYXGa/LGYohzA=;
 b=m5Mqmmv9LdRok5gnOpgl8OvKEhmsu2s+sYZJh+vGwMVyH3dcf5b7gymMBXpTPJhiMPNTepDA3rgLnSnGHcGjwYgxI8ywhs9dibW9E83B7nv26VJ+2V3B0EC5LHxRyhknAQY2p3yboy12jh7Te4+EUIuZIiDCU21au0sdPc/gFCOYzbraz2LozDwxArSelWefdFAzl3HF3ncUlAegzIeGb8JjNLtb8GpHvDPgrkV2/zkWZqfDHXtgXTr62qpTeANAdXkORo1tDlRiu/Zgj27Ffs/hr1MV8I0vxlYn4vn4gQ6M5NSaUr+VbknHssUj4KWPdfm4LZnFn2NHBWVrhGlOrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 15:30:09 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 15:30:08 +0000
Date: Wed, 10 Sep 2025 11:30:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [RESEND PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Message-ID: <aMGZeD3Z2CSMgjoO@lizhi-Precision-Tower-5810>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
 <20250910135916.3939502-2-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910135916.3939502-2-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BY3PR05CA0020.namprd05.prod.outlook.com
 (2603:10b6:a03:254::25) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 35faa917-2778-4474-1aea-08ddf07eecd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|19092799006|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3pfS8QWKS97V/bjtcIb+hn7zYSwDS4vbArsHZNJRQGIzH3xyABVspJEslALC?=
 =?us-ascii?Q?+hz0ArWQpxf4PHXpC8k0KoIw4AA/sSFOE8EJ8oXUFqkPiU5uwVF0V0NtCAdo?=
 =?us-ascii?Q?sguwCPdD4ywALI/Ngj9aQKgLla1+mPPMwngIsVGlD2d8uuf9C/+QrX3WilwO?=
 =?us-ascii?Q?iBC8KsIeMM2hQghGGL3Y/6Ae+W/fhCkrMsdZ5j8c4s3wrLJenJUcsvf6rS/C?=
 =?us-ascii?Q?hxl+2dz0JbTjbXQybqUZgFLwsQk6TX+haLz299t8bA7RtmzufAxVOJ5pAL0g?=
 =?us-ascii?Q?s/6P6tdB9FB/R5nPakKsQImHAjtulnk/3sFbqH6G+rQWValqLCR5ouwMpxsr?=
 =?us-ascii?Q?1NVKy+WKbjSPeQRVqoZaYgS1CUBlF9EmIjn+kwFYFJN8K4E2z3P5UXzfH6FX?=
 =?us-ascii?Q?vr3aeavt6k/NGSuGfcxI/D6t0QQ+kvFu0UVCQvpyZmzVQ3JaLd0/BiGcwrq4?=
 =?us-ascii?Q?smlAJ+U/60sLvpaZ2COQOaRsZP3ZVzXha5rTPN0FsKJCvJFL7Nsu4EcgGrcH?=
 =?us-ascii?Q?qYvjlHgaNUjKRCPF3K9r2N0Lfcgyw9qdrUbqUE8t3zAst1da417ossLjssHY?=
 =?us-ascii?Q?ZMF3/ZbrxMKZJmjuHfNCbzeudIUB+QrsBEj6Urqr8M6VHMpzJEddDOrk5xtX?=
 =?us-ascii?Q?OJ3P062tamFCyd9vWVi2QgGvEOtjPIWwtHsQbm0OVHvBSqZAZxHSxfHj5Bk/?=
 =?us-ascii?Q?31R0ibhIoCnpeuuah8WCR9sXf2WImXzsF3E6xAIQ2uSe7HJjL3YwPwxH8VNC?=
 =?us-ascii?Q?lZSJu0r/DeO9bRDmj1t1e12stIavVrbLKkgtxWZCX65gKCrNnHW18LY6MbeG?=
 =?us-ascii?Q?876q6f/X+ab7gceCu2laHCIVkb3URna1rc0dRWr88UjH9zdo3awXpnZ5yY6P?=
 =?us-ascii?Q?3Jh6jRz4wz2EGlLKkKOZx5iUn0KwDIZRgPupPLZOgwEuqEVGqcethe9B2FJy?=
 =?us-ascii?Q?doD2R1T6ZcM92qDdFopiyVuyaI+w2m7apFaKpj8pk8rRIyiOe71SAiRG/Z/U?=
 =?us-ascii?Q?pdUMziRU0IeONPjiNR6XYqIwFVeuZ1BPqrr2sR86debsVvVUQbKPsatl3IbJ?=
 =?us-ascii?Q?ozN8fROk41Msa4d6qD2dsUMVkls4DUHEuRlWWxqVRggh4ARU0POPN9tYfrLe?=
 =?us-ascii?Q?IMHlA+JDqZhsd/HqsaTojAYQADAL0L66xkHoSlpnDZMIDfRLyYHRhQw5uE7D?=
 =?us-ascii?Q?I8fqzKbuF9V0E13Ivf3CNDHNfS7gUfCTc0njDMMUJpGILG1kHCbPqDXj1Uto?=
 =?us-ascii?Q?CtOI6TxdOzNXL6Qr1RElmG4IvVSmd2wxn+oYfrYe74UVsAorCySZuSX1T2bz?=
 =?us-ascii?Q?chHl9NUMTR0A9Wm0+5gnwoNhKf/GI19LE+yntUfJZmSeS2FLSGNCUF3KKgck?=
 =?us-ascii?Q?/UQNRZWKVPNpiwtch/nTlUztmnJYtd+fJg16hDKunZWhxXuJ19NOvAb5RiEO?=
 =?us-ascii?Q?aSVF7hJt2TwuoiJe9ltJZ3F32zVVAJxrHDDnVit/q8l1Dxcw7FJjWzFSi9QQ?=
 =?us-ascii?Q?RpVbJ5cir4G87O4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2gGvgT8KThxSLMuNfFyaH+sTuL7Zi86j3k2G0WNJnE1fgnA+1/EgdQEZYkcw?=
 =?us-ascii?Q?Dq3rwpIyElijCTt9UgLoQH1MXKM9jSCgZuPZfDoGeVd+Ub1rC4j/K6inBwDv?=
 =?us-ascii?Q?sqz5axS5Y6emMAvZiUo85Am4dT+MsUObn3LxJgNWBWf9foqnioccRJKGOv8D?=
 =?us-ascii?Q?wraRcEdJTJyqVvVWw0hym6IcBBYYG+6Qgg0gTgMe1kSsR0yXrCBbvVnhn4PF?=
 =?us-ascii?Q?Fjp57Fn6arKOGn8MIbeRlVFvylgIpMs5l/9BuzpwU9BJWWGWODzKOtV8gS8l?=
 =?us-ascii?Q?zhpYzRHOzE8Ixq9+4hgYBS/CaPQqiq5iYOSGScfNbZUSuHiDLKyMkq+4FmNB?=
 =?us-ascii?Q?zEnS/vqsCVKq05v3D2+ZRJPX2Led7oyu+MVr/aDzaFTnkpXwmPnHhVeqYeK1?=
 =?us-ascii?Q?oXCHOxi/6tKOcIdSY4WiQPsEBrB7t3xCwLEubpIpV3oPxf+IZ5V007tg9j9t?=
 =?us-ascii?Q?4xBPsVXP7zQQ1ThZoMy+tv/7Rk9cVhO4EHlfTuPqtAQelb6r1pPQqTDdKsEp?=
 =?us-ascii?Q?RoQlPM67PM6Gh67aHZUVQebQH9urBPZ2oLrlx7tytLX1eUCPbzd5x3EocuLW?=
 =?us-ascii?Q?liP4vAS25Fg6R8Dxo3U0tVCzHylgefjG8JboZjLU71IP4scr+hYMFsDs/5yg?=
 =?us-ascii?Q?bmykDmHgBRN+sOHJI+N1qPFqLBlMC7OMlmGRtpCWto7/+8NWer1I/bAyNZlH?=
 =?us-ascii?Q?0zcxR0VoudhuNE6Z7rEkntwYBodXK8FKYZg73yU/pPQz+xcDiRhq3HHSfM3K?=
 =?us-ascii?Q?lizD7pMNjUgCRr5MwY4R7tPoAx/CN/TSHtfyibM4ppjnsLQPb+Rmv2iEQCwL?=
 =?us-ascii?Q?dKEbnqIRYfRjQ4A6KyHKYPVBikVUBuJaF7DuVfZjZbrOEYQTR0yOwrZaAR9D?=
 =?us-ascii?Q?i3vceRfeT23nvqUwG4NO4z42eAgN6iyD6H4V0Tp3EHzNh7a6xbcphPSYUB+q?=
 =?us-ascii?Q?5oRxvy1P89y5qNKWvIWFd5H0sMEP5lQNJWkrIJGe83v/V8TB/jXgO9l9KGRo?=
 =?us-ascii?Q?FSBb8o/AbLYjxus/qb94bHzP9m/lL9R2INhVEOLfXcIcbcbwOgy1vSvNFKiS?=
 =?us-ascii?Q?DS4YFDFa9lxE4toapORq/LaKb2zwpEZXwetgqRFHsk/RwO/vqc3I29El0pQS?=
 =?us-ascii?Q?KY0JYtkDdo9ixI+5jhJQZ/evzmCRC0HLbYT55c0XgJZMcH4phwFsYH/SR2Lc?=
 =?us-ascii?Q?B25XugqGJp7sNI6e+BDc+0Jgb52G8gShzOumD04ZfuyPPULlhRmTC7jI77R0?=
 =?us-ascii?Q?cnxpHGqOIsv2Dih2dSUPcswwAXvSY9h7Gzhyv4QWpkGGnf1si1MiQ1nWMgJF?=
 =?us-ascii?Q?wFpAMHbY8FwhHLc1eCCXYOpc5Yv8BBqZ49O8Q7i8XOjLdNa6X8KX7RKgAdWk?=
 =?us-ascii?Q?em3RjKlIUrKdk1c6CmBiX6jo+bRrONxa9BNp2++7rnP9833fLdYVyIHe4KkN?=
 =?us-ascii?Q?eZC/+8RnQZw3uXMRt6nyIkCGo+4JNwG+FT7+FiNCq1fYqU0692DiyuNQinnB?=
 =?us-ascii?Q?dtCwNPWgyFiyesrmx9fOx3ccL9IAMtxPZ1ZXDTdd+AI/9WNdabIm4Edfm6JS?=
 =?us-ascii?Q?xbQTQnDjyyCXwEvn2us7ZMvxOh0kPUVqxWfALxwD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35faa917-2778-4474-1aea-08ddf07eecd4
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:30:08.8368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EgN6KvjcO9Lxq0vf0Pr409zZ0u+vcPqlRSivVSbnt0OKlDFCr6TY+gzz/4VSJDwbf+U4WnqTzYYzo8ZT0u4t+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

On Wed, Sep 10, 2025 at 03:58:35PM +0200, Dario Binacchi wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
>
> Replace 'SETING' with 'SETTING'.
>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>
>  drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
> index 6ac8fa84ed9f..c2c6e50efc54 100644
> --- a/drivers/input/touchscreen/imx6ul_tsc.c
> +++ b/drivers/input/touchscreen/imx6ul_tsc.c
> @@ -55,7 +55,7 @@
>  #define ADC_TIMEOUT		msecs_to_jiffies(100)
>
>  /* TSC registers */
> -#define REG_TSC_BASIC_SETING	0x00
> +#define REG_TSC_BASIC_SETTING	0x00
>  #define REG_TSC_PRE_CHARGE_TIME	0x10
>  #define REG_TSC_FLOW_CONTROL	0x20
>  #define REG_TSC_MEASURE_VALUE	0x30
> @@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
>
>  	basic_setting |= tsc->measure_delay_time << 8;
>  	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
> -	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
> +	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
>
>  	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
>
> --
> 2.43.0
>

