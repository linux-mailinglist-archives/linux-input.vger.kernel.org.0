Return-Path: <linux-input+bounces-14768-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C19EB59CA2
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 17:56:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883D8189C94D
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 15:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3E5E37059E;
	Tue, 16 Sep 2025 15:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GJ7fBj9k"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013012.outbound.protection.outlook.com [52.101.83.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B800371E83;
	Tue, 16 Sep 2025 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758038133; cv=fail; b=roNin7EutU8YAMbU8ChgEu/GRw0Y5dv78KO1iYERnbYyPm87CFAAIRn5o6XwsYqLEPuMVlpoIeYHXV8dQkg9j/KY1IEsT5+S8SzewqUFLwhfcFl6p7Qt0GUGf9M1YaWD03DsdGAPS4QpEJNlubKoh3eOIvKXEIymTFCIy20RntY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758038133; c=relaxed/simple;
	bh=fsG2Co9Fc6MYOc4Lt2fwnrXtNeFXqXeVE0e0nK61HSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ACHE4ZXtiKaVBJUlda2Ivcjuhb3oeZAhdZDmXe3HgMGPnG0nKthANu0Z2OHIkg3rFpwMOF5zlpI262dY41byjzYve8FwdscoCJtxZtn8LMzPS1dokT1g45S2C5CwwRTPLHQXboG1uGK4DUkNLFUdP18qBva9eeVIAZfK7l3rb1o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GJ7fBj9k; arc=fail smtp.client-ip=52.101.83.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FBC8mUeSlq9rJIkw/XAR4M2KAMYgMQBVvei6FiY9gq0KhdebFPNHYfScFlyDVi+IYAWNHbWt8yv8vY8kHWN3ks7v4PSughM9hl/sA7cWbPic5zdl7zYZCZK2AKEDe+P4l/Pl2/TOPp4Sihc5d+J8rn30wr/ntszcJcwcNdqdZPI6YsOHATxDaqh4B7VZ5ugfOsN7w1560Nuf0dRL1So3VD4c5Gj+J66s1rpmIwABq5H3zaHClYBip5C4LT0DxgDbOb90ydnJ8GY+D3/GCO96rFQA79DiiUb37GS0+/AK8vexZx3WUPseIkuUV00QbJH1k6ImbRihI+gjQ71NxjIaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mRU1uJy4YVNqas2yL5aZiCpF9as/TITcPtWXQJgC0Xo=;
 b=wKcD+qI0dP8/Nbu0aWH9gzVwSjBG2esUohik9l/jdH8wkBLWQlPGhuzywc3nRbE6L7AcooWAl0s1GcGMNJ5dPgh5LNYWAfE1Xv1SwBSn/5n75RdWHaQrS8BCyk/ly4xsqDqU2+ccciv0kythcYhUccR6rBaEiPQYzrt0BuUirtEfXHkzOoN5oOEn7gxzVzEYCP+VPMQFQ1zspuVVngG9krpuQN6Dy8fgbP8ucvfcfRx/qoJ2V7mZN8GOaFZz8WtaURxn2xgizrP9QkupJao3Aqi9lGyLb4/0pyjiTNDSKjfwFHa9UzRp/IZXxLSiSLcBn4UwAd7aqNvmBuoqvLZWbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mRU1uJy4YVNqas2yL5aZiCpF9as/TITcPtWXQJgC0Xo=;
 b=GJ7fBj9kmxFDi2ru0dOJ1c6gAj9FCo5tSD50329tG7eHIgeaQ48pdCYZDiioZ4GlH4Vocf9TVQYv7uYlQHumlhgBF4RIvw9R2zACpnNgkEcarz9CNqKASD29H9zp4vuae7bwqpVYAbJH3tDBqTgdtX43BiQcZCSNflwAFHxO6EBr35a8FI5C92Xr8wsBcQfar9gI1wXYmE0sTgcOvkfkJyIeftHNDOliK5NUqm4zJGIElIjz8Y7oeTrdlqZTkWfSPtI9vZnCvMRgY9wbKh/uCkTpL0rGMgshXdviKEriHPw4gA5NmYkHm9UR+Wkitge8NXp35AV67Yv+51/SOhpjIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by DU2PR04MB9116.eurprd04.prod.outlook.com (2603:10a6:10:2f7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Tue, 16 Sep
 2025 15:55:26 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Tue, 16 Sep 2025
 15:55:25 +0000
Date: Tue, 16 Sep 2025 11:55:17 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v3 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <aMmIZTMqr0rtiP6z@lizhi-Precision-Tower-5810>
References: <20250915195335.1710780-1-dario.binacchi@amarulasolutions.com>
 <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915195335.1710780-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: BYAPR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::41) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|DU2PR04MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: b0e4ddae-8a4d-47b0-cc37-08ddf539737b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|52116014|376014|7416014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eE9rLLpKgHHNpYhZQoAOYMpWSudn0fTExEQcKnCSNJhEd4H8pmLWu31wduWM?=
 =?us-ascii?Q?4P119ciJUhfVklctxPH3ijoiLXak9S9BXGgfp9WsHubaxuebr+TCIERuWwYr?=
 =?us-ascii?Q?fWx1i0bK9hOgSZVSwAZYH7H4RIOVMP0CQs48vkRB0FmhjEfFkM01Fr/lWqXS?=
 =?us-ascii?Q?0Ccv62BicRNZvAENiFa64bSQQbJT1W6DjLyTalH9TijsQrS/hNgB2v3Z0yHX?=
 =?us-ascii?Q?BXr1y+egrcQ5Sae61H/GHXQS5+7VKRjCy5jsKQDlErI2X+kNIBwv7VGjFXyv?=
 =?us-ascii?Q?7I12CZI3x7jlQ5sgaNDSJ0MZdwIHPZlh3UWsKEalGI6WiE0033FSeu3oepgG?=
 =?us-ascii?Q?agK0iY6m1i/nQFcMzxvBiv+5l61WgA5vyXdQKjz3MdUPGMtzxepgwI05uHUh?=
 =?us-ascii?Q?su/o1SMlOyzAG+3PcBZXC69ABuUGTERW7gVN7uZTK9RXKpI9hdK86VeA9Bt3?=
 =?us-ascii?Q?8VbAzHDgEJ0zRJcoDw7lG2VjTPvS/sqeoNiGO1o4bW+Kvzl/MV6l6CPv4tdl?=
 =?us-ascii?Q?jXX37pA9WwDczMIB8u4D1ySX+2b3mIXTvjA60ITjNG94CLnRNjmXxTrvevHC?=
 =?us-ascii?Q?hGiqNvI5fgjbCnma6fhSvuv9OzdAHiyybhXKQM02A0p7AVyp6elukKtoJPNw?=
 =?us-ascii?Q?qJskt1IfPHxT0KKd9DKgt8pXvdUqZmXBGt4fV0Asdbv+w0I/KYebt2UE9ayv?=
 =?us-ascii?Q?iGyPjw+mCYHuMet6WReLWAJLx61fbiW6Jx/9r5Cf0KcPSBYfZhlEOIjuRjnN?=
 =?us-ascii?Q?EkmEM9eppg67mru7hufMcidgk+k3CQ5nyR6MikcQ5N1WBSkHAqdXUd21kCux?=
 =?us-ascii?Q?SlSLR7NWEzpHvI63JIHcbui8ivfi4bLZ7ZE81oQ6ZsL/w8cDyY6T4CLpTI/Z?=
 =?us-ascii?Q?wLtvwtcx92b5hBtBv5L8VWwFUaD6gdx8E24hKRT7QOJvsSsbPsABkeaqHMk6?=
 =?us-ascii?Q?EU7yOevIITCN1ATWGGDF4FlXl7JITd5WkDWXONII/3zHK/LBJFlX2Nhqq2TX?=
 =?us-ascii?Q?CF/Rvgff2maP3LaUYwyS4S2a/aOmyJNdeEamJoYahSjeA3IlW4ZfGYZqNKxn?=
 =?us-ascii?Q?rexuHvcbMTytzFZd+cUkQ1pWY0ULdXzhkgrjlJRoq1/SLad+cz++rlRlJaGb?=
 =?us-ascii?Q?RoSue6gsWaKTDfZPfSWOXky1TsRMSXSxAM438vPktQHJEh8D+D8uyvvYd7bC?=
 =?us-ascii?Q?1Eq+mOZMwNck02nbt/5KTCEZ6g/TKrJa2a21SvKB2aWmtZHliYL906BVT7r2?=
 =?us-ascii?Q?i2lCkYPcF6G7d7zGdVN/CkvXEgjEjaROBAS2dnaxIjgCKmCLU/+gB/V6A7xp?=
 =?us-ascii?Q?8ZBTo8AhPE08Zy804FdAiMwVEwMznL2KUnyFKmDV+V368oVj4WbySzw1U5P1?=
 =?us-ascii?Q?J2hfmqsjENztt96WAaV6tW0YPDpxNPuwa6RTUhtiN81ybtdqfvqKT+U5do0Y?=
 =?us-ascii?Q?IPYbc4eO8ONX3l3+ypp3x9erAJbrwL8D6tp60ZjI1upIGABuQRZ4eQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9621.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(376014)(7416014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MF694b/Y30+f72PXj/rhuey970/mgSFZE6C3kiVezDiDVYJHHOUyVgLFxKxK?=
 =?us-ascii?Q?iUcUz0JAcIKqCPby5dmQ1NcgBFj3tvT+1kdpDoazUItmWfPc4vfzRPCiekbd?=
 =?us-ascii?Q?pbQb5dlvVjizj/xMcAtmizjWSWHLb+bKQ4PIPio4FFtuzGNHyPdOdo2bVPNt?=
 =?us-ascii?Q?ZyocQnRPFUynRBkIk06D0CtBE2e2VBNElkhFKHaqljX5YG2GnMsjtKy59Wwl?=
 =?us-ascii?Q?J9GhLrRcZPzXapXQrTOXaSfW/cYWmeDblmmHnDPJCWsv072QUZod3M04dqy8?=
 =?us-ascii?Q?EFVXvMJF8JJOpp6k7ceWBcJghVkDuS4tkDIQsrwEpIbuZsN0JBu2KiAHCBss?=
 =?us-ascii?Q?w/zyeq6kYXWQ6/kmSJecVURWQN5Y0idRu7yzt28GBjUTwhwqDRneGO4k7s1V?=
 =?us-ascii?Q?X+RZgEm+iv33tpgJf0NAeXgeN7rgTqs+hVWvGomV8KmGBUjtT0QSxmoaqbXt?=
 =?us-ascii?Q?NS2MWrUJ3Vp1KGqZxGV1qyJej8IsCupU3wz6oyTNdaf1H8YDQNzlpC0GmH40?=
 =?us-ascii?Q?D2gUy5T/2NQmOzCRoP1wFOZAqUBaakkUeWxXala8Y9G2qVrjaijzic7kx4LT?=
 =?us-ascii?Q?zsgR1u8e45G2Jw4F/EDefXEw8Dxc7cSnyDHkpvsECvCHMdeX9Y71PPRiFHcB?=
 =?us-ascii?Q?cQnrR+y03kndfpsBgfW0yg7h1yfVoSHyipjmPUDRKqbGT7L3VQvbddAxzaSG?=
 =?us-ascii?Q?2MU6G5aJ502suScYOqteiEVhGtogXw7vTRgf1H75enrIadHOsRnK5iSio7ft?=
 =?us-ascii?Q?AY2hQPDTET0S8ujkdNp6wosvXalWi4YMM9fJOh8xZpYZgy8wly1eyEDq3Ssv?=
 =?us-ascii?Q?ceYz4Uzl/uukHqmhWMpgtE/Rf9inLvWVjIGP0zGYfkJNlT3p9gxkYTBxAI/K?=
 =?us-ascii?Q?RzFJQlzHPUNgLHkDsiaWPOZrjwU3aBTzRFzU29knuVGZX/b5DI8bNL0yxf9k?=
 =?us-ascii?Q?auzMKJqYC8PPkrynj/ZVhjZVv3CLhkBlOIrzCP49Qi1kNc6ZWVe48CxNaxr0?=
 =?us-ascii?Q?zXPjFNnbcaA5D9jI+hKas17Gfb8FJytR6Mlv6ZXreTrQsCx4BLD20gv8pXAx?=
 =?us-ascii?Q?4iSMSR+dln6jUg476VrmMzaRbHj7y5924dHN9ui7Nz/D6Fd9Of0p+Bj7XpDG?=
 =?us-ascii?Q?uJGpT6Kb5U90NZkRNy/YhB0I2MYqAR/LsQbR05gzsf1XUynns//Apzi1kx68?=
 =?us-ascii?Q?N9IBDjXAlpp9aw4zG3LcY714Dsv2WVppXdZrgr0jxOrCNajSSnFQXQzDrQB5?=
 =?us-ascii?Q?uSnB64iXJC29aD8w11WZeXZVvXovgNGqCrg58UQDhEBJ8HaXld1NuS7mF2MI?=
 =?us-ascii?Q?r+7eugSNw0IFhYzi2aCMWN6MhvVkuivnfzNUDf2k7ZpB5lPHF2DkwwJwMb18?=
 =?us-ascii?Q?KmcZ7VHY28KI9k1PNG8Zm50U0YVtrfe0GrPFvTuc4SsdCW3H2YHYOlOHusbi?=
 =?us-ascii?Q?t9zlfcyFX3tuv4AEjzh17Y8F800k01WqVVBJZ4KsXbUT/l3ZEPVMXMvxw7cj?=
 =?us-ascii?Q?s0EiFCT9alHZhmgHAWjCCE4ZziyHMlVTg5DuxQBlqqqDPyO6lrItZRSf9PeZ?=
 =?us-ascii?Q?4tGg+WsWbSDROHybqSA7CYPA15MtVXbkAqoMmTUd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0e4ddae-8a4d-47b0-cc37-08ddf539737b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:55:25.7901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hT0MpY+n8iKmvA0fOAOr3SDxLr3Tv1a2/jQmsnLzU5oG/c27E5KmhBjh0dPJb2Fxf1sNxC5hYilHN9WqZKSCTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9116

On Mon, Sep 15, 2025 at 09:53:06PM +0200, Dario Binacchi wrote:
> Support the touchscreen-glitch-threshold-ns property. Unlike the
> generic description in touchscreen.yaml, this controller maps the
> provided value to one of four discrete thresholds internally.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---
>
> Changes in v3:
> - Remove the final part of the description that refers to
>   implementation details.
>
>  .../bindings/input/touchscreen/fsl,imx6ul-tsc.yaml   | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> index 678756ad0f92..6214d8be5a99 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
> @@ -62,6 +62,18 @@ properties:
>      description: Number of data samples which are averaged for each read.
>      enum: [ 1, 4, 8, 16, 32 ]
>
> +  touchscreen-glitch-threshold-ns:
> +    description: |
> +      Unlike the generic property defined in touchscreen.yaml, this
> +      controller does not allow arbitrary values. Internally the value is
> +      converted to IPG clock cycles and mapped to one of four discrete
> +      thresholds exposed by the TSC_DEBUG_MODE2 register:
> +
> +        0: 8191 IPG cycles
> +        1: 4095 IPG cycles
> +        2: 2047 IPG cycles
> +        3: 1023 IPG cycles
> +

You have to use ns here. You can caculate in driver to match to closed one.

Frank

>  required:
>    - compatible
>    - reg
> --
> 2.43.0
>

