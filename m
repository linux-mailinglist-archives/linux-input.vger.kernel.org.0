Return-Path: <linux-input+bounces-6399-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61153973BC3
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 17:26:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93AACB25E8C
	for <lists+linux-input@lfdr.de>; Tue, 10 Sep 2024 15:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A631A256A;
	Tue, 10 Sep 2024 15:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="MznC9CBA"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2127.outbound.protection.outlook.com [40.107.223.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072418D651;
	Tue, 10 Sep 2024 15:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981895; cv=fail; b=tT+xz/Q9/0O8r/6WmxykY1YBTsUTBo/Odkm7WQLG5n2JA1P9yttpYXEOqfein/N7VR+lvdPSb1id/rgbt7QRJCM3Y62ydqkUeFSnF9ggZJOdcMQKDfvgRWbMyq/KDDgwqfPLxteqrawzc/V+VAkYwL4vLolt/fklLNVAjSF3DSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981895; c=relaxed/simple;
	bh=CeLFtPUL4CP1J4TyvR6rxvIiYkMOlbuBVinfli60RCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SCXpAnke81t6S6MYA6j0B++iO+rWqejJLdw4kQbfo13uEKOyVp2gs+2ovaQiHkKcy/B1B/HuLlNQnt4j1TuZ1QARHRF8RuBN2ILSir+sDeZIjKqfX0+I2wVxlOVOyyCIIvdJ4rb3bTYAggdwrt63tfXyw9doh47z2y2UQB7Vczw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=MznC9CBA; arc=fail smtp.client-ip=40.107.223.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ej4FI48MGdPh0PHLy9WiZXseu8sg6lcxUOyz/KOybkFbj8A2J7zqhU6nxSBKRt8IogIOzvH884BSx0rKaveLDBohmaQOCniyDsHRKMszQovSxndpZF4TWodHYbjk6FDaPhKywvSvOD3dXyEm5KuOaEAw3uIVyR2bH0gs6z9lF2kpipURlyZ8tsGKxiLWloGNo4ekDh79Z6lucHtIgIJfkFBeIe3NYTZvuQIKsaNgKW+tiPLs9KHb2qHYJsjfuNhsSkFpknwIaM3nSeCocK3iKLUfcELAYu7NOAvummO+dvy1p+ZIsGYBapSkzprowcM7sHb7/aK+167k+JQlBPfsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN/qcyqQvOb4JjroxO+Np69kz4T7DoB+A4b9J+8DXU4=;
 b=WKdrApZAuLdDZXBnphS1jLJ62CahYKYSdHdgUlGRGHnqPQRIA+SAf9kRhopIbMKcG05vBt7YngcBER2FInT6zp5JoV0fzGMAPlbTW02y8s0RRp9DN3/XZ8m0np7CuU3YKq7rpron8Ra1MGNmcWYwtGTsnJ6iWxRoiVtJmTSx5k0KaPRWI+1OtTgLap61RLvXW+3HI9/BqI2MJOoWGZe/dSRc52Ze6q1OyhrcOdLXyyaXNFUJi2o1B1/OdORaWBX9xXDyXLPIYBWKq15c4m1pUnxMaIAofsGgA540YJkxXAIOlfYaoQ3csMAufsY7j3w/AsTjObN3haFkyceHHBJo4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN/qcyqQvOb4JjroxO+Np69kz4T7DoB+A4b9J+8DXU4=;
 b=MznC9CBATRmJenCKU9B4UYvQ+HM44c+L0swFCcmMfScrT/M17mdXLSwTdohh/5FzbGqQCFjuBWkBD+LhkEmEutkuKqAG8lsrGI5qHZLpRgUf+7b2eb/s7gT5nGCGezT8whFf0kVKMf8fpYUoRqmUT9OAyHLsqwAmCkNb7GqyX+g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN2PR08MB6333.namprd08.prod.outlook.com (2603:10b6:208:1a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 15:24:50 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:24:49 +0000
Date: Tue, 10 Sep 2024 10:24:45 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Oleh Kuzhylnyi <kuzhylol@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>, igor.opaniuk@gmail.com,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: input: touchscreen: add Hynitron
 CST816X
Message-ID: <ZuBkvc2hWcZy809Z@nixie71>
References: <20240910115158.74502-1-kuzhylol@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910115158.74502-1-kuzhylol@gmail.com>
X-ClientProxiedBy: SN7PR04CA0219.namprd04.prod.outlook.com
 (2603:10b6:806:127::14) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN2PR08MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: a20c7d0a-c714-4029-e216-08dcd1acb5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UxCsZRtzn39hm6ScF+XRPnKy/OREu1G/2MGe5eU6PESK8ZOUxy2KNB2LENAF?=
 =?us-ascii?Q?91H+k+ipDsLlSpHSfCMywOMykqR4jJpnIhkNykyMg93vxHXLqBcwxyilky8B?=
 =?us-ascii?Q?X5f2bQSSbmzezdsuDntgR7p6g1J5u8LQTrYihHDJjaes42z5lGLBuazcqAYB?=
 =?us-ascii?Q?RH+ANxD/xjmlr0/3UGjz2XyCW5zFqX+nPqu68LvMwJ55oW7Dh16mRZNlTLvt?=
 =?us-ascii?Q?1d7HL0I6neS11gRibw10f0dbCpFuheuLUVRnNMjroTUH567d3bL7zzD0GzJ1?=
 =?us-ascii?Q?W+dBVdvvL4ipR0Rrr3C8HMws5YF8E1k0A31yztL5VE8LQmszn/0b1zUKjxG6?=
 =?us-ascii?Q?PHdwotHo8Xna4PEjKBSJDgrl8Pp533QIDdEYpwNtw4HIMWE0iwnS6pKdTFAK?=
 =?us-ascii?Q?B28rJ/zuDQeLM8AXz9/T4YEUgf465nYq1auSVE7XR0CkwHqmHvCPZRtONJV7?=
 =?us-ascii?Q?2IPwgTAeexP+aaDlJzup4iUNo+v2QvIXOfnTPcjMXLQz48tXveRJ+HKGloSx?=
 =?us-ascii?Q?BBPmkGNM1EIdXqIZ9xMC8zY2dwq/rMIwmOVDF7liZZm1Lohw2xw4kEf7TEl+?=
 =?us-ascii?Q?wHe3ATROIWYb+pVCHBg32cSM5iLBhPdxAMb+Z++nn5Nu9dM/u2FmBUX+dH9c?=
 =?us-ascii?Q?vPPGWw+sbOTsytGtu3On/yAYfqqgYnp/Q4fy/ce3KsH5hK/Tn21v0rmviQMJ?=
 =?us-ascii?Q?PA/PDsUkU5arI48S79Mnp1vIE52E1+er5+bIXWzdQG2Chgzx5o+tL7UqBlMx?=
 =?us-ascii?Q?idt/Z5jhi3nQhOROA9Peml5dqtKdO37oux4QQ70zpfWC5uAnAmB3TxRWGESh?=
 =?us-ascii?Q?1lJz/fvGkPA3Evz3JVj1QApIF7umJLSB1E3sgS2OAlhCzOAvVJzomAANfH/J?=
 =?us-ascii?Q?zLropNGV/ZdoFuSqE29gmU/hmLEVhpX9E3Mx4/7IIZvbZpXy0BiiWtCx8M7u?=
 =?us-ascii?Q?RSqA7En3OWP4925XKbnItXIyiN2uFj8lAsT9ceUtNpb8Ma9F25aM+IuacewT?=
 =?us-ascii?Q?jOmDOxs78Egw5lfiFfY1wZxLAP65uvALTOr8sOo07jkuTDcTbk3Bt30JQYNX?=
 =?us-ascii?Q?gO91NZiCILnPgLVSYHxaJXIS382FAc2SzLgAkNvKADEFfAcCZlAh1K4kkrBM?=
 =?us-ascii?Q?7e7HJUWjY5o5p0rmfPrdFffyHvw5wewQBIpCA83o1304Vwh7+44sWZYr1tw8?=
 =?us-ascii?Q?ExnnncvAGueg/P6HTP5Sd20Z3NoaVvkEwJ/wXA4ioEyHEO3FywDimRmazT+V?=
 =?us-ascii?Q?LO9vW89etkkEbvIhDnC5on9hZISBU2mnrx3Jnv9QkFceTEJTHp+ahhmbCGhX?=
 =?us-ascii?Q?SaU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hh+a4bCGZfsZdo5u+6EaBSA7vrBqAWFmPHfbHKCUiStatKbpKZdUOUUsaoJK?=
 =?us-ascii?Q?XOKGLhFP9Axcj+gGAKBlaOARLeMXGhh51AD/ZniBOuX8dXbdSKJ0gXYUT/Dc?=
 =?us-ascii?Q?pvFQbKCP9n1XeAhP96NXH7C+xkb6kb4woF12a0Rc0aSjqrtrKrqADuTeKq65?=
 =?us-ascii?Q?p+tb0AU9zc3rTtF7UmsBQwO/JvVNjyL0Ya+lxNYd/ro6ja5ysvfGW1i3jB7L?=
 =?us-ascii?Q?3umbknsy4qdQeM5VAZabpW1W2rEQY8Hn9AwEBoVLH0qRYUR6Il0ygIJE/oWw?=
 =?us-ascii?Q?VcYSZW6Bem+0ru1qHng2CuPinXWKkh37DlbD1wE5CZIP/eIRf1Um7GTGbS+u?=
 =?us-ascii?Q?lMsDKlx2Eu848zuYuN1lWR15S6BSDHt8pBMW5pK2Aqmrl6E3btHsDOZ2PJf4?=
 =?us-ascii?Q?OeYXCfFamgCOJAmmUpeKSTNXhEDO77cK35vj6x/tcNdhYKZBAuVBmjyuIC6g?=
 =?us-ascii?Q?NQlRGdOu81K0pYQkyNn7/w6TRE9Z48f4f5InDX9IsihBQFPd6sH31/pApC0p?=
 =?us-ascii?Q?BE6/+h+V48lWQSPXFxEUatDT/mjgjdoV+aszc6RGJRyac2QJcH+vWsYvLWQ9?=
 =?us-ascii?Q?DeRGiGIzQWrt00fPno96cpqlWi+I9paCEW1JxgfIh3wFk+WULZ2vyCQ7Jznu?=
 =?us-ascii?Q?edsrqMhoDdoD8vXCKGE6OxQ4J8pwNPo+lxyTCy5cy1Uznvt7gZrLvu14k8Se?=
 =?us-ascii?Q?7tobnPop7geuGuFTWIISAcF2JxqIOONrjyYku4GIP0yCxhyQ8BvXoL6lyL0X?=
 =?us-ascii?Q?/FFgzm7QPU7qckLovDRG2llOOJLYBukdNDQUsKN8bVBkkxNCoCbtZvWI/1d7?=
 =?us-ascii?Q?8LYetFtwmTTkt7pxyCjtB86kJynhoOr+qChsejwH9W9TeD9nFFDj/cAHH9Q3?=
 =?us-ascii?Q?43qf36Xdc5nUJqaVLxlZRLPrHuVG7reQ6qWVpdrfTLeHlS9P2/VXtDW1n+5o?=
 =?us-ascii?Q?+Qf/wieK9THLTKjFufYjP04UVGq7AgbyKS4TcQamJ1/WBnDYYqfbsHzMnowT?=
 =?us-ascii?Q?QctAuiOkd6FLm+HGMDroeWHldU4l0WVPNzY51y+nu6u1ZrY7boGiB4KK2soJ?=
 =?us-ascii?Q?Onu0w64PsFfQVyrWaByiBCrHnzM0vhCUmaCcvpomPyrA6pyB/MqRP/KMFkb+?=
 =?us-ascii?Q?wcopyRxroj37k2+nfo/lTrzTlBF+VmaahVy3UbWxT2wqHPaGb7Vk+ofyebY3?=
 =?us-ascii?Q?1yWoOMo2xoeBFzgY/ReoILFkawQOEI48Ex3SII8ZFzX6BmiuEhG/IHzLb9qO?=
 =?us-ascii?Q?bHR03c4rpJORjkoC9TvMLYeSkbENufwr02PA1BG6lxIndy/AkuQZLEt+/rau?=
 =?us-ascii?Q?odrIV1L7Z0wt++1LHvB+bNcVFvcf1H6tY2Dv/HfS5DTy819CBIpjmtnObcbu?=
 =?us-ascii?Q?KAnB0nIvYMgvmqGv9W101fOAIDz0emJ4GPJUcILu6uHyM9RkJ35VK6hbx3Gc?=
 =?us-ascii?Q?eN7dPeK6KEWB06JybnkmTdJraP5T90AcMqX/XOOiNEKqHwaKZ1yS+13GvyNc?=
 =?us-ascii?Q?dPgxk+2zvbBKPCigxYnIlcpck6j/oMmk2uLly6rHO48AuW0ryNM3dD1g5NlM?=
 =?us-ascii?Q?9agglPsEFSCkt7TJDvSvwGhBSjVdwvTQpUWO8b8o?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a20c7d0a-c714-4029-e216-08dcd1acb5cd
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:24:49.5822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWl+ltI79uAHj5z8fQsSaCYXI6QfKzWKpf7lyEr+XC1jqssBA0vjNMpctadEwrIFNN/evsa96ylYdECreQhY2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR08MB6333

Hi Oleh,

On Tue, Sep 10, 2024 at 01:51:57PM +0200, Oleh Kuzhylnyi wrote:
> Add documentation for the Hynitron CST816X touchscreen bindings.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Oleh Kuzhylnyi <kuzhylol@gmail.com>
> ---
> 
> Changes in v6:
>  - Fix minor tweak adviced by Krzysztof:
>  - Move additionalProperties field after required
> 
> Changes in v5:
>  - No code changes
> 
> Changes in v4:
>  - Add Conor's Dooley "Reviewed-by" tag
> 
> Changes in v3:
>  - Rename filename to hynitron,cst816s.yaml
>  - Update description with display details
> 
> Changes in v2:
>  - Apply pin definitions and DT headers
>  - Use generic name for DT node
>  - Drop status field
> 
>  .../input/touchscreen/hynitron,cst816s.yaml   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> new file mode 100644
> index 000000000000..b3f4049e4b9b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cst816s.yaml
> @@ -0,0 +1,57 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cst816s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Hynitron CST816S Touchscreen controller
> +
> +description:
> +  Hynitron CST816S Touchscreen controller for 1.28-inch 240x240 Resolution
> +  Touch LCD Display Module
> +
> +maintainers:
> +  - Oleh Kuzhylnyi <kuzhylol@gmail.com>
> +
> +allOf:
> +  - $ref: touchscreen.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - hynitron,cst816s
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - reset-gpios

The reset GPIO is not required; it may simply be pulled up locally.

> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      touchscreen@15 {
> +        compatible = "hynitron,cst816s";
> +        reg = <0x15>;
> +        interrupt-parent = <&gpio0>;
> +        interrupts = <4 IRQ_TYPE_EDGE_RISING>;
> +        reset-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
> +      };
> +    };
> +
> +...
> -- 
> 2.34.1
> 

Kind regards,
Jeff LaBundy

