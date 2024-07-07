Return-Path: <linux-input+bounces-4882-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4492D92997F
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 21:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1ECCB20B3E
	for <lists+linux-input@lfdr.de>; Sun,  7 Jul 2024 19:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F9C5C8FC;
	Sun,  7 Jul 2024 19:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="smI7Bg45"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2109.outbound.protection.outlook.com [40.107.237.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D24437C;
	Sun,  7 Jul 2024 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720380074; cv=fail; b=n+kOQp+ykkd5xvMdGf31/kVN9BMtmez9TIpkcElcwzGLCUxL1pSbrCTNy2dgft80fpYQ7AMkn5YsE9Yc5nLzAzumqUzPZipbLMmgpG4cYaBLMtjp+P/at6Gyf0gyQ7+KMe+UoSH4AaxPIK4TVD8ISDF32rZ/nuHyMDCOOLLG/KE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720380074; c=relaxed/simple;
	bh=W3QTguEHzXvY1r4GnNG79Xrmtk2pZktQeCEaIb0bQsk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sRjrvSAZODSrmYx2NjZyk3R2jyHShspIPXt/QYyC1tS8o7aUX7QGwLcksee6AfF4T1haWVQ+RNsxBOVCoVVO67Fw5cSBGwnhjfCxZ0hSqnEULj02eY2itGrkoWCPBM3dJNdSgQ/w5aIMrjGsVHbuNecTrLmGTMtLEU0ImLH3PHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=smI7Bg45; arc=fail smtp.client-ip=40.107.237.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYlNcHIfxbwolxjPb1mkm6jgXXz/ZgrN+uJXyrJM6dAF8QjWdWykC9OeJzOrkyp/Bb6+krPghgZQzaAz1BA9ngnBAwpLin9ACeG1bqP/Do4d3+IqmxwkqBTFlNt0ZP1hPfTpWuuzuCT22M8pd2AWHXSDoYvO4laob3IjhmCHpg/6I0xRkSRxu3semobMc37Ge6U/9hEsYrr6BDiT5CnOck+kij7uGJWH8LarvhEpuTph03BoacopmxsBBgEFbIvUc2/DfNKHgJDDLU1iPZbuunSeBan1F4XipcRdcX1D/qs/tOzXrt9KTaEH7uAaWVHFCIZQDj82g4Y0YoQBokNjkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uQHbZViTQmU8aWe/dRtC7/c9suaqVSMvJO53TcrcGWM=;
 b=CG4PDF2vYzaRgiMMSxQ1mUb1q1dsERA6JPfuKNobTABYC3M7PcEjn5fHMIuFinFArbgcXx4+9sGa6b9tddNxzUrCXUL28+2r7ICaTeEe7Qaw7+MVGUlkCYexRqPQNypj/F0GpeaBqcm36qQkqOcJz+D60yTJUuwDU9IW7v5nuj12ASrL2oDThHdvYWzFGVyumpk9Xcydcwy9vmHGufKEeB7A2Uw+e5tQNIlcwCWng5aCXrDcq1e1LmOwDfRjQtoroUOR2UZiAobnXTpV8SmbiyG1pxQBoezNR2udhCAEMCfafNvvQ67nRHkuUHEsmQM+NHp0v41PgnYTcydha1kyqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uQHbZViTQmU8aWe/dRtC7/c9suaqVSMvJO53TcrcGWM=;
 b=smI7Bg45g8KzPFYHTuVEAFekBTvmVFtF9q3PlPtLp7r0oenbcAsyfagsYofx6Weehwibotaotj0U/BlC/UxhZsrhRIaXB0oRXksK3J9mG6dj8zHxp8NvZjFung4EZvmKF0a4sbob1nS3wq19b2RU+OI+l2NsRR7xW7REgJFJuCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by DS0PR08MB9109.namprd08.prod.outlook.com (2603:10b6:8:1a8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Sun, 7 Jul
 2024 19:21:07 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7741.033; Sun, 7 Jul 2024
 19:21:07 +0000
Date: Sun, 7 Jul 2024 14:20:57 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>,
	catalin.popescu@leica-geosystems.com,
	mark.satterthwaite@touchnetix.com,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v16 3/3] Input: Add TouchNetix axiom i2c touchscreen
 driver
Message-ID: <ZorqmaYfsGFd4HN0@nixie71>
References: <20240703142520.207066-1-kamel.bouhara@bootlin.com>
 <20240703142520.207066-4-kamel.bouhara@bootlin.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703142520.207066-4-kamel.bouhara@bootlin.com>
X-ClientProxiedBy: SA9PR13CA0179.namprd13.prod.outlook.com
 (2603:10b6:806:28::34) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|DS0PR08MB9109:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8f105d-fadd-4ba0-be9f-08dc9eb9f37a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?94z2OfkYSuO4pYWW6PdyV1FeFQTO+O1uqFB16jtoJmiFmzWEkurCz/lIH5m0?=
 =?us-ascii?Q?CHjHefto98ceKqEBCrqWplDm0bgZsx5EpmCFEQsLjIza3NaE9nKjTCwZSBmR?=
 =?us-ascii?Q?NxyiAqfywYnuZHMQzoWrHl+vk25lyiues0/VKf89vOGH9VdjNgtYB2WtDkKM?=
 =?us-ascii?Q?9wL4VTP2B9qi4xS/wm6g0xr1G02mLYXQcN4kC96UcCvVJgcgOPxPuFdFYyj1?=
 =?us-ascii?Q?ETYsga7iIQ9u8mayYmU5+cVAU1aHWFmVSw56H/yn9ensi03oC63E78EoYVNn?=
 =?us-ascii?Q?8DiT3KYRhSaCWZ6/kZawXjG6UNnyRWFee08uZPz7MmUsCGg8Nd7KDJOmfJW3?=
 =?us-ascii?Q?tXpqYSVyGVfDkV6iSMJp/HNs1Jy8ixllOG2Yux3/ikY1a34YXXBfTuC5p0/8?=
 =?us-ascii?Q?t6St69YQGaW8rAw5R0mxiPA8aM3q38Nkj6g7tAbrAh7etIv3buf788NltPzI?=
 =?us-ascii?Q?9aatWOq4G3TQ1xJuuv6axccBuUaovt+fHbnt52vNBUHPC6ldhg69BYQ5Dik+?=
 =?us-ascii?Q?CO2IRaEskXNxRMgPj2JoWNbTS+KPvJOWU9u+LN/6fMagAK89qSNaPN9su49k?=
 =?us-ascii?Q?2NenIvpoUb/tHQGx0TnrjyRVHRi2SBaIPi5FSN303Tc6xHvwuWz7f25QZU/u?=
 =?us-ascii?Q?oB0m5qu8FU8NX+TJRsBvpkRdLs5xoZV1jl36D0STGDDn5kWmg1C4yOXCxp6d?=
 =?us-ascii?Q?DjWjrL+cBH01YbHeYc/3ioDSsXphnrEQe4PAOIkgUxQrM69Bc6UwU62C3OWu?=
 =?us-ascii?Q?xrZFg8DuUWmf+/0oXAUC5CmNnwsQfmTUMGX8Y7TJ00g91Dh+Q9oCnHC7qPz+?=
 =?us-ascii?Q?HbNowavpEMl9dQAAhsGMa5thxuI+i+5jaIzK/Stkh9HDLL6A/FlAWm3g3IHQ?=
 =?us-ascii?Q?4F3P6f7L1RHpolGZs3+1InFfS5Rw1/WKE8/eAXsNLFbCBwteqywjGwpNXgus?=
 =?us-ascii?Q?X/RhjtHhKH2MT1IGKHyU0+IijB9hsofntPCTak9SsQt2Dun7bm6+JPsoedRW?=
 =?us-ascii?Q?vbX2APigXY9BYKSMIh+2GaI3uuQRGoW/ce4Xh8V6PevDDf9cFjxVZS2y+lAK?=
 =?us-ascii?Q?fJkstTN6FU8IQE+buxEQaLdQrKbbTJ3xaBElF/d6XmjFeLes/RH0xKirfbiq?=
 =?us-ascii?Q?/bPiXBpkJwPXR8TmrJHTNyEA9qQ+YHKzqQbqt7dtWjzc/WdpFfgOyO/HHP14?=
 =?us-ascii?Q?cxBGukc8d2j6ZdXpiulBRGuV6iYpScfmluhhhsaQgfQIhYm0u+hjEd11LI2k?=
 =?us-ascii?Q?AQYtobcTOFsiBZklNBcZqbEBuszf6gKroprZZozsWj1/YoLcNC8kFtYcwRMC?=
 =?us-ascii?Q?ug9qeD4lp/vM4hLiyNSI+0Xwa7w9LCzjvlSKluwuqmymrg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?djj6FmoaTzI0T22roxfxJTEGd71od1IW6XAC3aiLfs/ejV3At3THw58iJm0t?=
 =?us-ascii?Q?roK+wvK2M//1P0FV0rAEIT1O1uPH3k0angJRmuwy+xH9fKNDBp/LpKQWfzt3?=
 =?us-ascii?Q?oCxLROjeeLFtq3zqCIHq98vRYRSCEKYpejkXJ6Va6U2XLwTN/aT92mvgsUnU?=
 =?us-ascii?Q?X9/ggxuLjefUa8OXUTbjzHRapNYeku/CSw7HAcIRcvPv6ffUsQt/ZOMPt14h?=
 =?us-ascii?Q?V3Xjv0IJFh/TUXgdMAeqaV5YaWGbpxpVOYQ0HUDdPTTss+l1Z3FASjSZJrLw?=
 =?us-ascii?Q?CNlt7EZYUvX/UQ/UJq4rpvW/pe74cDWjJfnKrjKxmb6psUEeViPTFAJMpugB?=
 =?us-ascii?Q?GIvTmVULB+ymRKU9XbNY/NzM21crIz9iejK3aGkallis+nXIr1dMvzMeGvy9?=
 =?us-ascii?Q?oLUQeZC5BWnbQ+QojeiiGeqFT878dnmfHZAb+W3lJ6blH57BqhT/2TG3upUT?=
 =?us-ascii?Q?QhDnBjZlR2bkTrR5NB3jziVOhniG6hhYpdV95A0c4TFAlsF1ith5cbEh3mzq?=
 =?us-ascii?Q?QxlO4ps2Jwy+rmBv59OYzr54+8UlfP6FtMsYoiOvyI6f8aHhs7FrSwYZy8uc?=
 =?us-ascii?Q?iM2musTCUd5zJIcFXe8BdIccACgc/Rp8ts8Yy7tSfgd5/0CjWKFDjcTO1zLs?=
 =?us-ascii?Q?1TI4UTtgBSyQN4/OaV7E8HhsGxFK4+TapnRgwaOaVco2NVeZZV+HZmuauB33?=
 =?us-ascii?Q?Mo4GPcLZJq8denG87Ogn/OO/eOVhcAZqaWBc1hdtPcwBoyH5Cg0GL06c+MBD?=
 =?us-ascii?Q?cnWrrfZ60MWMS7vIPB/IDTPuMNptoIgad09A9YggbrlEitPUWsQesoj+3HSK?=
 =?us-ascii?Q?uemqvZvUfcB4fvgleZRbc1DYsPcwh2Hn+hEWToH4reSyARk14BUM7QWaG+6S?=
 =?us-ascii?Q?S3liGM69zrwQhFd+EtaXKkmEbkKAfBBK7eHMRIsmVWASwH3JYtXkJFSp9W+j?=
 =?us-ascii?Q?KbnJwgQJPwrkQE+jonq7V/verwCBT9Hs5IAY3w7j/vhlMhfvEP+8vNHsMHKM?=
 =?us-ascii?Q?ZiqOdA21FleZ6EoOZ4F7xLvhC2+O+mpp2/fKhtw3gCF10ZVOIdfPGeUne32v?=
 =?us-ascii?Q?iViHpHkBCfXYY1/N4JitqvfWOTxwB2LvXrHeWbOTztUFChJY/9SP7yaZXeFY?=
 =?us-ascii?Q?97BVQb9MIBbOaYYLw788PNcMpcxzVDKCnO9+yY5Ej/hMOMmS8/8aReUZUpDs?=
 =?us-ascii?Q?OGyUfS3hiMutSCd8avs6j2sJurh+wOPmmoT75ieMyolWxw1xAR/BijU1u4PZ?=
 =?us-ascii?Q?IbcjF9eCrJrktMRYt0kEtPY+pMdrDK1w8bMTWJn1x/9ndJbA+MC+BVmYGV51?=
 =?us-ascii?Q?jVuPLPZBOr42cHQbmnS1Ca8bxA5IIRJt+TMxjZg+EPfO0+9qDR40z+zOJdIw?=
 =?us-ascii?Q?0q376IqqeFqDqtZBXfgdeOdzRcusKBmuaYwJdNz4BXBP9x3QL2ohrhtVaBhm?=
 =?us-ascii?Q?48DuWdlilYOpHY7jvYjz0PVbsmNJXrKdovH6NtwgKjlg3Bn5WXbMtGeZgWZo?=
 =?us-ascii?Q?Y89FKUKSuAQ5S79WgxWrsX/rfZ3nyPNPv00EjDQo0/3uSZvFDmOqV6IdU6Kq?=
 =?us-ascii?Q?VthAyK30X9noh7cBDKfnKBTRcRazuUKuQDlKVj7U?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8f105d-fadd-4ba0-be9f-08dc9eb9f37a
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2024 19:21:07.3511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QkZeHYJrrOfzmo1XbuOUylMQcQ4J2yEeTnXbxfYJwt7O43awv9Zv/Tou/jvCaLVdib+1UoFLOzzuDuiATE1/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR08MB9109

Hi Kamel,

On Wed, Jul 03, 2024 at 04:25:18PM +0200, Kamel Bouhara wrote:
> Add a new driver for the TouchNetix's axiom family of
> touchscreen controllers. This driver only supports i2c
> and can be later adapted for SPI and USB support.
> 
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
> ---

This is coming together nicely; just a few trailing comments on
top of Marco's feedback.

>  MAINTAINERS                                  |   1 +
>  drivers/input/touchscreen/Kconfig            |  14 +
>  drivers/input/touchscreen/Makefile           |   1 +
>  drivers/input/touchscreen/touchnetix_axiom.c | 616 +++++++++++++++++++
>  4 files changed, 632 insertions(+)
>  create mode 100644 drivers/input/touchscreen/touchnetix_axiom.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2041384d3866..ac6b612bfbba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22745,6 +22745,7 @@ M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
>  L:	linux-input@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/input/touchscreen/touchnetix,ax54a.yaml
> +F:	drivers/input/touchscreen/touchnetix_axiom.c
>  
>  TPM DEVICE DRIVER
>  M:	Peter Huewe <peterhuewe@gmx.de>
> diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
> index c821fe3ee794..1ce8f1c25625 100644
> --- a/drivers/input/touchscreen/Kconfig
> +++ b/drivers/input/touchscreen/Kconfig
> @@ -834,6 +834,20 @@ config TOUCHSCREEN_MIGOR
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called migor_ts.
>  
> +config TOUCHSCREEN_TOUCHNETIX_AXIOM
> +	tristate "TouchNetix AXIOM based touchscreen controllers"
> +	depends on I2C
> +	select CRC16
> +	select REGMAP_I2C
> +	help
> +	  Say Y here if you have a axiom touchscreen connected to
> +	  your system.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called axiom.
> +
>  config TOUCHSCREEN_TOUCHRIGHT
>  	tristate "Touchright serial touchscreen"
>  	select SERIO
> diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
> index a81cb5aa21a5..6ce7b804adc7 100644
> --- a/drivers/input/touchscreen/Makefile
> +++ b/drivers/input/touchscreen/Makefile
> @@ -91,6 +91,7 @@ obj-$(CONFIG_TOUCHSCREEN_SUR40)		+= sur40.o
>  obj-$(CONFIG_TOUCHSCREEN_SURFACE3_SPI)	+= surface3_spi.o
>  obj-$(CONFIG_TOUCHSCREEN_TI_AM335X_TSC)	+= ti_am335x_tsc.o
>  obj-$(CONFIG_TOUCHSCREEN_TOUCHIT213)	+= touchit213.o
> +obj-$(CONFIG_TOUCHSCREEN_TOUCHNETIX_AXIOM)	+= touchnetix_axiom.o
>  obj-$(CONFIG_TOUCHSCREEN_TOUCHRIGHT)	+= touchright.o
>  obj-$(CONFIG_TOUCHSCREEN_TOUCHWIN)	+= touchwin.o
>  obj-$(CONFIG_TOUCHSCREEN_TS4800)	+= ts4800-ts.o
> diff --git a/drivers/input/touchscreen/touchnetix_axiom.c b/drivers/input/touchscreen/touchnetix_axiom.c
> new file mode 100644
> index 000000000000..cea52dafc913
> --- /dev/null
> +++ b/drivers/input/touchscreen/touchnetix_axiom.c
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * TouchNetix axiom Touchscreen Driver
> + *
> + * Copyright (C) 2020-2023 TouchNetix Ltd.
> + *
> + * Author(s): Bart Prescott <bartp@baasheep.co.uk>
> + *            Pedro Torruella <pedro.torruella@touchnetix.com>
> + *            Mark Satterthwaite <mark.satterthwaite@touchnetix.com>
> + *            Hannah Rossiter <hannah.rossiter@touchnetix.com>
> + *            Kamel Bouhara <kamel.bouhara@bootlin.com>
> + *
> + */

Please include bits.h as well.

> +#include <linux/bitfield.h>
> +#include <linux/crc16.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/mt.h>
> +#include <linux/input/touchscreen.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/regmap.h>
> +
> +#include <asm/unaligned.h>
> +#define AXIOM_PROX_LEVEL		-128
> +#define AXIOM_STARTUP_TIME_MS		110
> +/*
> + * Register group u31 has 2 pages for usage table entries.
> + */
> +#define AXIOM_U31_MAX_USAGES		0xff
> +#define AXIOM_U31_BYTES_PER_USAGE	6
> +#define AXIOM_U31_PAGE0_LENGTH		0x0C
> +#define AXIOM_U31_BOOTMODE_MASK		BIT(7)
> +#define AXIOM_U31_DEVID_MASK		GENMASK(14, 0)
> +
> +#define AXIOM_MAX_REPORT_LEN		0x7f
> +
> +#define AXIOM_CMD_HEADER_READ_MASK	BIT(15)
> +#define AXIOM_U41_MAX_TARGETS		10
> +
> +#define AXIOM_U46_AUX_CHANNELS		4
> +#define AXIOM_U46_AUX_MASK		GENMASK(11, 0)
> +
> +#define AXIOM_COMMS_MAX_USAGE_PAGES	3
> +#define AXIOM_COMMS_PAGE_SIZE		256
> +#define AXIOM_COMMS_REPORT_LEN_MASK	GENMASK(6, 0)
> +
> +#define AXIOM_REPORT_USAGE_ID		0x34
> +#define AXIOM_DEVINFO_USAGE_ID		0x31
> +#define AXIOM_USAGE_2HB_REPORT_ID	0x01
> +#define AXIOM_USAGE_2AUX_REPORT_ID	0x46
> +#define AXIOM_USAGE_2DCTS_REPORT_ID	0x41
> +
> +#define AXIOM_PAGE_OFFSET_MASK		GENMASK(6, 0)
> +
> +struct axiom_devinfo {
> +	__le16 device_id;
> +	u8 fw_minor;
> +	u8 fw_major;
> +	u8 fw_info_extra;
> +	u8 tcp_revision;
> +	u8 bootloader_fw_minor;
> +	u8 bootloader_fw_major;
> +	__le16 jedec_id;
> +	u8 num_usages;
> +} __packed;
> +
> +/*
> + * Describes parameters of a specific usage, essentially a single element of
> + * the "Usage Table"
> + */
> +struct axiom_usage_entry {
> +	u8 id;
> +	bool is_report;
> +	u8 start_page;
> +	u8 num_pages;
> +};
> +
> +/*
> + * Represents state of a touch or target when detected prior to a touch (eg.
> + * hover or proximity events).
> + */
> +enum axiom_target_state {
> +	AXIOM_TARGET_STATE_NOT_PRESENT = 0,
> +	AXIOM_TARGET_STATE_PROX = 1,
> +	AXIOM_TARGET_STATE_HOVER = 2,
> +	AXIOM_TARGET_STATE_TOUCHING = 3,
> +};
> +
> +struct axiom_u41_target {
> +	enum axiom_target_state state;
> +	u16 x;
> +	u16 y;
> +	s8 z;
> +	/* force target report processing */
> +	bool insert;
> +	bool touch;
> +};
> +
> +struct axiom_target_report {
> +	u8 index;
> +	bool present;
> +	u16 x;
> +	u16 y;
> +	s8 z;
> +};
> +
> +union axiom_cmd_header {
> +	__le32 preamble;
> +	struct {
> +		__le16 target_address;
> +		__le16 length;
> +	} head;
> +};
> +
> +struct axiom_data {
> +	struct axiom_devinfo devinfo;
> +	struct device *dev;
> +	struct gpio_desc *reset_gpio;
> +	struct i2c_client *client;
> +	struct input_dev *input_dev;
> +	u32 max_report_len;
> +	u8 rx_buf[AXIOM_COMMS_MAX_USAGE_PAGES * AXIOM_COMMS_PAGE_SIZE];
> +	struct axiom_u41_target targets[AXIOM_U41_MAX_TARGETS];
> +	struct axiom_usage_entry usage_table[AXIOM_U31_MAX_USAGES];
> +	bool usage_table_populated;
> +	struct regmap *regmap;
> +	struct touchscreen_properties	prop;

It looks like a tab snuck in here.

> +};
> +
> +static const struct regmap_config axiom_i2c_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_format_endian = REGMAP_ENDIAN_LITTLE,
> +	.val_bits = 8,
> +	.val_format_endian = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +/*
> + * axiom devices are typically configured to report touches at a rate
> + * of 100Hz (10ms) for systems that require polling for reports.
> + * When reports are polled, it will be expected to occasionally
> + * observe the overflow bit being set in the reports.
> + * This indicates that reports are not being read fast enough.

This comment is strange; if reports are not read quickly enough at
the default rate, why not set the default rate at the slowest for
which the overflow bit is not set?

> + */
> +#define POLL_INTERVAL_DEFAULT_MS 10
> +
> +/* Translate usage/page/offset triplet into physical address. */
> +static u16 axiom_usage_to_target_address(struct axiom_data *ts, u8 usage, u8 page,
> +					 char offset)
> +{
> +	/* At the moment the convention is that u31 is always at physical address 0x0 */
> +	if (!ts->usage_table_populated) {
> +		if (usage == AXIOM_DEVINFO_USAGE_ID)
> +			return ((page << 8) + offset);
> +		else
> +			return 0xffff;

Checkpatch normally gripes if an else follows a return; did that not
happen here? You should simplify it either way:

        if (...) {
                if (...)
                        return ...;

                return U16_MAX;
        }

> +	}
> +
> +	if (page >= ts->usage_table[usage].num_pages) {
> +		dev_err(ts->dev, "Invalid usage table! usage: u%02x, page: %02x, offset: %02x\n",
> +			usage, page, offset);
> +		return 0xffff;
> +	}
> +
> +	return ((ts->usage_table[usage].start_page + page) << 8) + offset;
> +}
> +
> +static int axiom_read(struct axiom_data *ts, u8 usage, u8 page, void *buf, u16 len)
> +{
> +	union axiom_cmd_header cmd_header;
> +	int ret;

For consistency, please use 'error' as is done throughout.

> +
> +	cmd_header.head.target_address =
> +		cpu_to_le16(axiom_usage_to_target_address(ts, usage, page, 0));
> +	cmd_header.head.length = cpu_to_le16(len | AXIOM_CMD_HEADER_READ_MASK);
> +
> +	ret = regmap_write(ts->regmap, le32_to_cpu(cmd_header.preamble), 0);
> +	if (ret) {
> +		dev_err(ts->dev, "failed to write preamble, error %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regmap_raw_read(ts->regmap, 0, buf, len);
> +	if (ret) {
> +		dev_err(ts->dev, "failed to read target address %04x, error %d\n",
> +			cmd_header.head.target_address, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * One of the main purposes for reading the usage table is to identify
> + * which usages reside at which target address.
> + * When performing subsequent reads or writes to AXIOM, the target address
> + * is used to specify which usage is being accessed.
> + * Consider the following discovery code which will build up the usage table.
> + */
> +static u32 axiom_populate_usage_table(struct axiom_data *ts)
> +{
> +	struct axiom_usage_entry *usage_table;
> +	u8 *rx_data = ts->rx_buf;
> +	u32 max_report_len = 0;
> +	u32 usage_id;
> +	int error;
> +
> +	usage_table = ts->usage_table;
> +
> +	/* Read the second page of usage u31 to get the usage table */
> +	error = axiom_read(ts, AXIOM_DEVINFO_USAGE_ID, 1, rx_data,
> +			   (AXIOM_U31_BYTES_PER_USAGE * ts->devinfo.num_usages));
> +
> +	if (error)
> +		return error;
> +
> +	for (usage_id = 0; usage_id < ts->devinfo.num_usages; usage_id++) {
> +		u16 offset = (usage_id * AXIOM_U31_BYTES_PER_USAGE);
> +		u8 id = rx_data[offset + 0];
> +		u8 start_page = rx_data[offset + 1];
> +		u8 num_pages = rx_data[offset + 2];
> +		u32 max_offset = ((rx_data[offset + 3] & AXIOM_PAGE_OFFSET_MASK) + 1) * 2;
> +
> +		usage_table[id].is_report = !num_pages;
> +
> +		/* Store the entry into the usage table */
> +		usage_table[id].id = id;
> +		usage_table[id].start_page = start_page;
> +		usage_table[id].num_pages = num_pages;
> +
> +		dev_dbg(ts->dev, "Usage u%02x Info: %*ph\n", id, AXIOM_U31_BYTES_PER_USAGE,
> +			&rx_data[offset]);
> +
> +		/* Identify the max report length the module will receive */
> +		if (usage_table[id].is_report && max_offset > max_report_len)
> +			max_report_len = max_offset;
> +	}
> +
> +	ts->usage_table_populated = true;
> +
> +	return max_report_len;
> +}
> +
> +static int axiom_discover(struct axiom_data *ts)
> +{
> +	int error;
> +
> +	/*
> +	 * Fetch the first page of usage u31 to get the
> +	 * device information and the number of usages
> +	 */
> +	error = axiom_read(ts, AXIOM_DEVINFO_USAGE_ID, 0, &ts->devinfo, AXIOM_U31_PAGE0_LENGTH);

It seems a little safer, and more intuitive, to pass sizeof(ts->devinfo) instead
of AXIOM_U31_PAGE0_LENGTH. To that end, devinfo is only 11 bytes in size, but
you're reading 12 bytes. I'm guessing the compiler is padding axiom_data which is
the only reason the existing implementation seems to work.

> +	if (error)
> +		return error;
> +
> +	dev_dbg(ts->dev, "  Boot Mode      : %s\n",
> +		FIELD_GET(AXIOM_U31_BOOTMODE_MASK,
> +			  le16_to_cpu(ts->devinfo.device_id)) ? "BLP" : "TCP");
> +	dev_dbg(ts->dev, "  Device ID      : %04lx\n",
> +		FIELD_GET(AXIOM_U31_DEVID_MASK, le16_to_cpu(ts->devinfo.device_id)));
> +	dev_dbg(ts->dev, "  Firmware Rev   : %02x.%02x\n", ts->devinfo.fw_major,
> +		ts->devinfo.fw_minor);
> +	dev_dbg(ts->dev, "  Bootloader Rev : %02x.%02x\n", ts->devinfo.bootloader_fw_major,
> +		ts->devinfo.bootloader_fw_minor);
> +	dev_dbg(ts->dev, "  FW Extra Info  : %04x\n", ts->devinfo.fw_info_extra);
> +	dev_dbg(ts->dev, "  Silicon        : %04x\n", le16_to_cpu(ts->devinfo.jedec_id));
> +	dev_dbg(ts->dev, "  Number usages        : %04x\n", ts->devinfo.num_usages);
> +
> +	ts->max_report_len = axiom_populate_usage_table(ts);
> +	if (!ts->max_report_len || !ts->devinfo.num_usages ||
> +	    ts->max_report_len > AXIOM_MAX_REPORT_LEN) {
> +		dev_err(ts->dev, "Invalid report length or usages number");
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(ts->dev, "Max Report Length: %u\n", ts->max_report_len);
> +
> +	return 0;
> +}
> +
> +/*
> + * Support function to axiom_process_u41_report.
> + * Generates input-subsystem events for every target.
> + * After calling this function the caller shall issue
> + * a Sync to the input sub-system.
> + */
> +static bool axiom_process_u41_report_target(struct axiom_data *ts,
> +					    struct axiom_target_report *target)
> +{
> +	struct input_dev *input_dev = ts->input_dev;
> +	struct axiom_u41_target *target_prev_state;
> +	enum axiom_target_state current_state;
> +	int id;
> +
> +	/* Verify the target index */
> +	if (target->index >= AXIOM_U41_MAX_TARGETS) {
> +		dev_err(ts->dev, "Invalid target index! %u\n", target->index);
> +		return false;
> +	}
> +
> +	target_prev_state = &ts->targets[target->index];
> +
> +	current_state = AXIOM_TARGET_STATE_NOT_PRESENT;
> +
> +	if (target->present) {
> +		if (target->z >= 0)
> +			current_state = AXIOM_TARGET_STATE_TOUCHING;
> +		else if (target->z > AXIOM_PROX_LEVEL && target->z < 0)
> +			current_state = AXIOM_TARGET_STATE_HOVER;
> +		else if (target->z == AXIOM_PROX_LEVEL)
> +			current_state = AXIOM_TARGET_STATE_PROX;
> +	}
> +
> +	id = target->index;
> +
> +	dev_dbg(ts->dev, "U41 Target T%u, present:%u, x:%u, y:%u, z:%d\n",
> +		target->index, target->present,
> +		target->x, target->y, target->z);
> +
> +	switch (current_state) {
> +	case AXIOM_TARGET_STATE_NOT_PRESENT:
> +	case AXIOM_TARGET_STATE_PROX:
> +		if (!target_prev_state->insert)
> +			break;
> +		target_prev_state->insert = false;
> +
> +		input_mt_report_slot_inactive(input_dev);
> +		/*
> +		 * make sure the previous coordinates are
> +		 * all off screen when the finger comes back
> +		 */
> +		target->x = 65535;
> +		target->y = 65535;
> +		target->z = AXIOM_PROX_LEVEL;
> +		break;
> +	case AXIOM_TARGET_STATE_HOVER:
> +	case AXIOM_TARGET_STATE_TOUCHING:
> +		target_prev_state->insert = true;
> +		input_mt_slot(ts->input_dev, id);
> +		input_mt_report_slot_state(ts->input_dev, MT_TOOL_FINGER, true);
> +		input_report_abs(input_dev, ABS_MT_TRACKING_ID, id);
> +		input_report_abs(input_dev, ABS_MT_POSITION_X, target->x);
> +		input_report_abs(input_dev, ABS_MT_POSITION_Y, target->y);
> +
> +		if (current_state == AXIOM_TARGET_STATE_TOUCHING) {
> +			input_report_abs(input_dev, ABS_MT_DISTANCE, 0);
> +			input_report_abs(input_dev, ABS_MT_PRESSURE, target->z);
> +		} else {
> +			input_report_abs(input_dev, ABS_MT_DISTANCE, -target->z);
> +			input_report_abs(input_dev, ABS_MT_PRESSURE, 0);
> +		}
> +
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	target_prev_state->state = current_state;
> +	target_prev_state->x = target->x;
> +	target_prev_state->y = target->y;
> +	target_prev_state->z = target->z;
> +
> +	return true;
> +}
> +
> +/*
> + * U41 is the output report of the 2D CTS and contains the status of targets
> + * (including contacts and pre-contacts) along with their X,Y,Z values.
> + * When a target has been removed (no longer detected),
> + * the corresponding X,Y,Z values will be zeroed.
> + */
> +static bool axiom_process_u41_report(struct axiom_data *ts, u8 *rx_buf)
> +{
> +	struct axiom_target_report target;
> +	bool update_done = false;
> +	u16 target_status;
> +	int i;
> +
> +	target_status = get_unaligned_le16(rx_buf + 1);
> +
> +	for (i = 0; i < AXIOM_U41_MAX_TARGETS; i++) {
> +		u8 *target_step = &rx_buf[i * 4];
> +
> +		target.index = i;
> +		target.present = ((target_status & (1 << i)) != 0) ? true : false;
> +		target.x = get_unaligned_le16(target_step + 3);
> +		target.y = get_unaligned_le16(target_step + 5);
> +		target.z = (s8)(rx_buf[i + 43]);
> +		update_done |= axiom_process_u41_report_target(ts, &target);
> +	}
> +
> +	return update_done;
> +}
> +
> +/*
> + * Validates the crc and demultiplexes the axiom reports to the appropriate
> + * report handler
> + */
> +static int axiom_handle_events(struct axiom_data *ts)
> +{
> +	struct input_dev *input_dev = ts->input_dev;
> +	u8 *report_data = ts->rx_buf;
> +	struct device *dev = ts->dev;
> +	u16 crc_report;
> +	u8 *crc_bytes;
> +	u16 crc_calc;
> +	int error;
> +	u8 len;
> +
> +	error = axiom_read(ts, AXIOM_REPORT_USAGE_ID, 0, report_data, ts->max_report_len);
> +	if (error)
> +		return error;
> +
> +	len = (report_data[0] & AXIOM_COMMS_REPORT_LEN_MASK) << 1;
> +	if (len <= 2) {
> +		dev_err(dev, "Zero length report discarded.\n");
> +		return -ENODATA;
> +	}
> +
> +	/* Validate the report CRC */
> +	crc_bytes = &report_data[len];
> +
> +	crc_report = get_unaligned_le16(crc_bytes - 2);
> +	/* Length is in 16 bit words and remove the size of the CRC16 itself */
> +	crc_calc = crc16(0, report_data, (len - 2));
> +
> +	if (crc_calc != crc_report) {
> +		dev_err(dev,
> +			"CRC mismatch! Expected: %#x, Calculated CRC: %#x.\n",
> +			crc_report, crc_calc);
> +		return -EINVAL;
> +	}
> +
> +	switch (report_data[1]) {
> +	case AXIOM_USAGE_2DCTS_REPORT_ID:
> +		if (axiom_process_u41_report(ts, &report_data[1])) {
> +			input_mt_sync_frame(input_dev);
> +			input_sync(input_dev);
> +		}
> +		break;
> +
> +	case AXIOM_USAGE_2AUX_REPORT_ID:
> +		/* This is an aux report (force), not used currently */
> +		break;
> +
> +	case AXIOM_USAGE_2HB_REPORT_ID:
> +		/* This is a heartbeat report */
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void axiom_i2c_poll(struct input_dev *input_dev)
> +{
> +	struct axiom_data *ts = input_get_drvdata(input_dev);
> +
> +	axiom_handle_events(ts);
> +}
> +
> +static irqreturn_t axiom_irq(int irq, void *dev_id)
> +{
> +	struct axiom_data *ts = dev_id;
> +
> +	axiom_handle_events(ts);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void axiom_reset(struct gpio_desc *reset_gpio)
> +{
> +	gpiod_set_value_cansleep(reset_gpio, 1);
> +	usleep_range(1000, 2000);
> +	gpiod_set_value_cansleep(reset_gpio, 0);
> +	msleep(AXIOM_STARTUP_TIME_MS);
> +}
> +
> +static int axiom_i2c_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct input_dev *input_dev;
> +	struct axiom_data *ts;
> +	u32 poll_interval;
> +	int target;
> +	int error;
> +
> +	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
> +	if (!ts)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, ts);
> +	ts->client = client;
> +	ts->dev = dev;
> +
> +	ts->regmap = devm_regmap_init_i2c(client, &axiom_i2c_regmap_config);
> +	error = PTR_ERR_OR_ZERO(ts->regmap);
> +	if (error) {
> +		dev_err(dev, "Failed to initialize regmap: %d\n", error);
> +		return error;
> +	}
> +
> +	error = devm_regulator_get_enable(dev, "vddi");
> +	if (error)
> +		return dev_err_probe(&client->dev, error,
> +				     "Failed to enable VDDI regulator\n");
> +
> +	error = devm_regulator_get_enable(dev, "vdda");
> +	if (error)
> +		return dev_err_probe(&client->dev, error,
> +				     "Failed to enable VDDA regulator\n");
> +
> +	ts->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(ts->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(ts->reset_gpio), "failed to get reset GPIO\n");
> +
> +	/* Make sure the time after a power ON sequence is meet */
> +	if (ts->reset_gpio)
> +		axiom_reset(ts->reset_gpio);
> +	else
> +		msleep(AXIOM_STARTUP_TIME_MS);
> +
> +	error = axiom_discover(ts);
> +	if (error)
> +		return dev_err_probe(dev, error, "Failed touchscreen discover\n");
> +
> +	input_dev = devm_input_allocate_device(ts->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name = "TouchNetix axiom Touchscreen";
> +	input_dev->phys = "input/axiom_ts";
> +
> +	input_set_abs_params(input_dev, ABS_MT_POSITION_X, 0, 65535, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_POSITION_Y, 0, 65535, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_TOOL_TYPE, 0, MT_TOOL_FINGER, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_DISTANCE, 0, 127, 0, 0);
> +	input_set_abs_params(input_dev, ABS_MT_PRESSURE, 0, 127, 0, 0);
> +
> +	touchscreen_parse_properties(input_dev, true, &ts->prop);
> +
> +	/* Registers the axiom device as a touchscreen instead of a mouse pointer */
> +	error = input_mt_init_slots(input_dev, AXIOM_U41_MAX_TARGETS, INPUT_MT_DIRECT);
> +	if (error)
> +		return error;
> +
> +	/* Enables the raw data for up to 4 force channels to be sent to the input subsystem */
> +	set_bit(EV_MSC, input_dev->evbit);
> +	/* Declare that we support "RAW" Miscellaneous events */
> +	set_bit(MSC_RAW, input_dev->mscbit);

Neither of these event types are reported; please drop them.

> +
> +	ts->input_dev = input_dev;
> +	input_set_drvdata(ts->input_dev, ts);
> +
> +	/* Ensure that all reports are initialised to not be present. */
> +	for (target = 0; target < AXIOM_U41_MAX_TARGETS; target++)
> +		ts->targets[target].state = AXIOM_TARGET_STATE_NOT_PRESENT;
> +
> +	if (client->irq) {
> +		error = devm_request_threaded_irq(dev, client->irq, NULL,
> +						  axiom_irq, IRQF_ONESHOT, dev_name(dev), ts);
> +		if (error)
> +			dev_err_probe(dev, error, "failed to request irq");
> +	} else {
> +		error = input_setup_polling(input_dev, axiom_i2c_poll);
> +		if (error)
> +			return dev_err_probe(ts->dev, error, "Unable to set up polling mode\n");
> +
> +		if (!device_property_read_u32(ts->dev, "poll-interval", &poll_interval))
> +			input_set_poll_interval(input_dev, poll_interval);
> +		else
> +			input_set_poll_interval(input_dev, POLL_INTERVAL_DEFAULT_MS);
> +	}
> +
> +	error = input_register_device(input_dev);
> +	if (error)
> +		return dev_err_probe(ts->dev, error, "failed to register input device\n");
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id axiom_i2c_id_table[] = {
> +	{ "ax54a" },
> +	{ },

Please drop the comma after the sentinel as was done below.

> +};
> +MODULE_DEVICE_TABLE(i2c, axiom_i2c_id_table);
> +
> +static const struct of_device_id axiom_i2c_of_match[] = {
> +	{ .compatible = "touchnetix,ax54a", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, axiom_i2c_of_match);
> +
> +static struct i2c_driver axiom_i2c_driver = {
> +	.driver = {
> +		   .name = "axiom",
> +		   .of_match_table = axiom_i2c_of_match,
> +	},
> +	.id_table = axiom_i2c_id_table,
> +	.probe = axiom_i2c_probe,
> +};
> +module_i2c_driver(axiom_i2c_driver);
> +
> +MODULE_AUTHOR("Bart Prescott <bartp@baasheep.co.uk>");
> +MODULE_AUTHOR("Pedro Torruella <pedro.torruella@touchnetix.com>");
> +MODULE_AUTHOR("Mark Satterthwaite <mark.satterthwaite@touchnetix.com>");
> +MODULE_AUTHOR("Hannah Rossiter <hannah.rossiter@touchnetix.com>");
> +MODULE_AUTHOR("Kamel Bouhara <kamel.bouhara@bootlin.com>");
> +MODULE_DESCRIPTION("TouchNetix axiom touchscreen I2C bus driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

Kind regards,
Jeff LaBundy

