Return-Path: <linux-input+bounces-5578-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 446EA9527C9
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:01:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A54ADB2133B
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 02:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEFD4C69;
	Thu, 15 Aug 2024 02:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dsbVVevg"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879010F1;
	Thu, 15 Aug 2024 02:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723687283; cv=fail; b=KDsReQFCNB4EjtJRzrCZQ829blXZjvtnf8iSQDMgDkTV2HWCXQ+bAv2GcHowwC2DCVIF88oM3hddIPxI3KLM5kdYGUi75tWZTRp/7TykL9IrhZ34JTvxNH/zd67JWyU+sRFPghxFJ40wF+ZgmvUy1e8BgwLz5qUHQcVyq/2k0Jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723687283; c=relaxed/simple;
	bh=eexcnpfM1wshCNkdQfRKTS4zkGdQRAOLh0xEgMP3Us4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aQhKov4M3hYZaZ+VeI/D49dLZKCrK1P8N1H0l0i/g89yvGYNs5HhCqOUFgAMfBQx6Jnu4NvqCQR3iGAQAqBDdMIgkZqzaacqJWM+G1VPldk5kmMQAXgkbAoVrM6S/NYQk+rlOTQEKNjfWlZDzmkeqTWletyR7E+02afJKQIG17k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dsbVVevg; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNeg4XiZ5wdy4NPx1Ids+O45a9Qg2WkKFhLuwVYdKy63MSlPnNTDn9GovN8e8aEVIExqeqmLNfqfa4G0olbzT13K6dwN7NoiYqMFD9CA64uUbydiOOqGamKy7ArUXw/WGgs7CBzQER9O50uqUZndnLFPPlRgXr5WqktuSZCykxC3Xb1rNWTBnY74xbf9t40ZdKBv5GDAGA8KzqWE4vty2lj2FC4ryTmzoBaw6wxLJZmfzDF5W0+BQXOgk/A72W3qk3sYDDhLSk9HDgyU5QMvJ8YLNd1FAmh9IM7vamIBdaUndROrgT7aGFmZ0vbn9jV39ipwyzYFj/dimrKCf1XwSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4bTOUokl0XfewpKSlnf9RPTu2zSVxLo7yI7J6tC37Y8=;
 b=YivYeuWVT5KDA3joHvxJeGmQT7FRvQ6jGj8NDSBiziwOaSusqxXndqaqLyVJqOnTmJqb+QFyfeEEktkGDwx/Q0mSnk74y2mr/MYaA9SiXqTCfyrIaB8UqtsnXD+u4sC5w7srIHUiw7Trv/DR+MOprtf221GvT7FkZZABFu9R4aaLli3ycWQLhEZGZA31w96r28ljjoTRM1XR+QOCAlf5jadjYg4IUCS05+vfk68Vgm1nqzH4kDRA3szS2ChB12uxY4STVN4umsnxZJ8JdEMo5j2SxLI2LcW/9caT73Jl8fzaW8PdK/Eli2d7wzGn03BkUDL5XsZhLKW7cIP402yqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4bTOUokl0XfewpKSlnf9RPTu2zSVxLo7yI7J6tC37Y8=;
 b=dsbVVevgkZ8fL9w7wp3zviiQJQaNR0hNNDqPIbIr3coknWWlbAn+Th3ezm0X6tMMQdbpzoHas+DcCjdHZtSB/oA57OFW9yR3EScKUxV2uQnbyrmqdAkEK/AnEyO+RShEyhOKQw267S8AEqzqfYnWry0WOzOuuVMlNbgXIz4m1OIqm7knz6rNzVRHq6ZaLJBbfMrpkZRIuWS22jz31BmJiQ6hJB1WMD3CzlVBEDdyHKaInNmU6JB+nIt9zv+iAjn1CqAp/GrHdkJJm/Z1EVxBY//qaVqmIFycnfMc+F3pffzXJA0CVfQ1RcfgfpLBT5Tk3oeFdXpsMO78ssbqUZKqZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB9836.eurprd04.prod.outlook.com (2603:10a6:800:1d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Thu, 15 Aug
 2024 02:01:17 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.7849.021; Thu, 15 Aug 2024
 02:01:17 +0000
Date: Wed, 14 Aug 2024 22:01:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Rob Herring <robh@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: input: touchscreen: convert ads7846.txt
 to yaml
Message-ID: <Zr1hZbAq/jrwyNQq@lizhi-Precision-Tower-5810>
References: <20240814185140.4033029-1-Frank.Li@nxp.com>
 <20240814211345.GA4028598-robh@kernel.org>
 <20240814214902.GA4101180-robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240814214902.GA4101180-robh@kernel.org>
X-ClientProxiedBy: BY3PR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:a03:254::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB9836:EE_
X-MS-Office365-Filtering-Correlation-Id: 05a1eeb6-3dad-49f3-99b9-08dcbcce2656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?p7gynZk9vHMkJUkvsLPGxJgNpwcV74FzeinJ1fSO2unESbp3gj9hkmrbdcCy?=
 =?us-ascii?Q?XblhJfLWyLKIdzkXicPfug3FU9gDUmOlP41lPotVNcQTpUlEKrd2OCyIA1WZ?=
 =?us-ascii?Q?BIS7qLZKhRyz2jDARYdMSRntsNUbziGwTMC2t05JfUJm9QmVzAozxsQOeKI2?=
 =?us-ascii?Q?abJ8aGP6tzp4nUby2N5goqVHFP95Ek7GBj61ipg1BTNzhx2mF8ew0Ip2L9TV?=
 =?us-ascii?Q?935dEBv6YoBKS48QQJuo6sL/4wy0Ua0UiAsEp7vVBJVv8sHswq3Ywd/n974M?=
 =?us-ascii?Q?0g/5QYt05gvHfPOasx+1OUl90op5CsA2bVgR6K9wf9rBgn5ZL5k/Ah4pu9VM?=
 =?us-ascii?Q?iQn69hLROorohkR4YGE9bq3KfXy8oI4H+SBbK9M75hDlDILjqtdGf2sWh/Fe?=
 =?us-ascii?Q?dQCmJV2nNpgqxwKPbfK8qG4KwcQ9s4HNZhieHZ11bWGLZt9ZJsf+ODliZwP1?=
 =?us-ascii?Q?tSfYOeZQU2j+vPFajdIH3EwjG0ifmjl0oT3RVlB5ugbGjS8VIC9EUxwg7QKZ?=
 =?us-ascii?Q?JU+tJo/N6t0XM1GW6z5q4Lp79wqfESaalb3GL6jQSE7zz/4g/m8oWXPidWRh?=
 =?us-ascii?Q?NeepcGIawv99emD83asDfykhJEe1wleffdFdwKK/4WUQHnbudzEg8wBErf7C?=
 =?us-ascii?Q?ByLGuC7zIand0e3NQ5gsVEsk+TUSAcoReeRWK72Whb4qww2Sy4AZDBgpOANi?=
 =?us-ascii?Q?QTHz2ZO6MNAE97+4YUg8L6XHkj0iR3434va26fRH+54LRtjohzMvndHmmS/f?=
 =?us-ascii?Q?aYvXhqk/pmWO3Y3gJlBXXuMlXWMNW6cqzrzUSd7kVsOgsi2axnQ6f+pi4xjw?=
 =?us-ascii?Q?oU/gHzp3Gf6x9IwkAQFoS69sQema627Okulj5+pkE4RcXqJzXgYeleP3FLL5?=
 =?us-ascii?Q?dL/Xy+McZHsCySMceeEqUXUGfU5vOIzrTAJ0y3Kha0wjKbIrLSegW3OHhwqa?=
 =?us-ascii?Q?UjIwJYoaCErh4ltBu9LDl+T4lTYr+s0bu5GgYhe/NE2CMYjU/aJgmInZ+4XH?=
 =?us-ascii?Q?FsEAfPbswoF9o88KU2iSIhMtKN7YODqfQ74yMlmJoU4aRGw5aHga7ZWTGLfk?=
 =?us-ascii?Q?r2yL9YVm5fcMcIopdYgQ5OvyZtDjKjWxNqAKySWV6/5f14uUZZXwoZu68E/8?=
 =?us-ascii?Q?Qf2jjgK7fp901eWF0dfcjiDohdkNkGsV7lnhKFEQYLRj1zcKiyz6feq7Qr3v?=
 =?us-ascii?Q?CSYVnU3y2PiRbaURBKvmRNHIEo95fAVD36hnqE6NJs4hW7/R57qIOuPkNN7m?=
 =?us-ascii?Q?l6/I9O2gTbJ9Xoisr6lv5BuV+MlVyauQqQZgMVl9TLfysYtcWGpU5iq/7578?=
 =?us-ascii?Q?7KBTMfm8Fc3rIhTntwgdfyknRKACX6ooqGjfC7RtN9OlgIVRghxHeKJ6Zkc1?=
 =?us-ascii?Q?57vSHbk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YIerOowxs1EOuZAV7n2QEiE35Ac7A28mwfZMNmCLN6mCXWwtbA/uTYruqhXG?=
 =?us-ascii?Q?26mQrVRmYCy/I5eoJ+efjeAxuK6SFdCNoOomXTPEFxQr1ZCzzsn0nNrnLt6a?=
 =?us-ascii?Q?lNl93Lq0Xdn2QFKZSrMVpylkcyHtSaMr1zbLoYoPGpWKBRo/cgA6czzz0IYu?=
 =?us-ascii?Q?QYoCu+MRWM1RU25kvIZpafL7vxYwE1UWD2gvmIBqaxcb8uKGJnXL5DX8Irbo?=
 =?us-ascii?Q?mR2B4RqH7UQDILSRh+Z9zAAbCZ35mRcSwq3RKEikANpSUGjQiPOzgFTMI/G9?=
 =?us-ascii?Q?oCBrl4CN+flvV06Vqa0Sd8V2gHkvejyhrazGFU+kcaDGsAJ7KyMVQEA+8e8z?=
 =?us-ascii?Q?z46Y1gLu55a2CfOdoExLTGc8V8OLr7Y86TurILeLd9CQEryX01uW9g95eb7F?=
 =?us-ascii?Q?5GUT+jHoFfZsfpWFrF/EvJIx08/MNBTpPJZQWYSttpiLBUTiZmLNplYNtmiL?=
 =?us-ascii?Q?ItdwoPbvVEcTRB0GK/aLP+/DNwe/7yEw4AdQRUCzA3hlSBvAqB4lqmki18TP?=
 =?us-ascii?Q?mh8oPDaVTVhntn5nzDti1HSLlX8osDGUXdNp3+DWMS/YMagJ9EoFOrgkC5Zy?=
 =?us-ascii?Q?jb3tRgkzcFFvysTLnziH5QWN7KGfHJPlycKAVc6xMo3t75zVLLUVLBWVgufG?=
 =?us-ascii?Q?InzxETUbf8wrUge/Vq0z7fhiXqjWilDFBXPzpVDFuIKrCC6bDmiOIug3eBoD?=
 =?us-ascii?Q?ZozjGdlupBg3VoeWphWBa5m6BcAsvMgv0RkMbjnr9BjNbKiIm1j+18h/5P4u?=
 =?us-ascii?Q?2zbKpty4fZKft6+peMPGBlg8w+XX2SRmGIdT4rl2MyGPO86wCtPr/zeeFJUQ?=
 =?us-ascii?Q?c5lI4ZEW20obW3rf7yu2eLLhTQACxkC7YR5c9FyDYTJxse02rswNpLBYBL6L?=
 =?us-ascii?Q?HAp9m200XzseYGrxgGzxHRrGflT40qkU/mAQBGJcA3fahSC+GoH7kfOQb/eS?=
 =?us-ascii?Q?XaLKb8irUE/y3aPLwS8xtb1kNjb/a7je5sQI+7T/iA9wz+OKGASbjt5EeWfl?=
 =?us-ascii?Q?UJy0XjIyz9IQ6lW8TvzzuPdI4xt/n4UYnm1R6BgsnpceM6rmxLsONDubdvRv?=
 =?us-ascii?Q?7lh4YsZFVO8tOFEbMAIMed5sJqtgKaeE/eqrON+gz5X3+pQDUccbb23Xx2jX?=
 =?us-ascii?Q?R1/bRG1eIMSIncexkGXZ7hDowpWIQuMSg+KoGguEHumCUc2nuTB7SH+6Klt+?=
 =?us-ascii?Q?lqfY1LgaCNgGgGxtj6dy7+pd2vrIKGSfi0+HVLL+t7pL6MJr7nLSs3uB3/4d?=
 =?us-ascii?Q?GntAFVy15zRAXalAmod/zMz4jWJ6GQaz0cF3lOA04AgdCdcv+OUwkuaXQ+Cz?=
 =?us-ascii?Q?o4tLT5RsddsXBZ0g7WU80ab780BSVrRpd/W21RfW9OEy8KYXt8EHCbpfjzAI?=
 =?us-ascii?Q?Yf//LpohP2Tew3zzG+lzaOtuzcrernzdUwcTGt3ajzKErjvpg+OJGkBFviHV?=
 =?us-ascii?Q?8ehb7gbyzsMG6pk3blNQ125RSqtsCjHWbLHsGnCAKqZA2KfvxMuNqp+Bs7jQ?=
 =?us-ascii?Q?iY80mQ3EUgu2T0N1XFNSjSkLJ+bnCdZUJxtxlaPhAf8DoE2/7dp1KweAX29S?=
 =?us-ascii?Q?V0H/uG2djDU7utnKNBg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a1eeb6-3dad-49f3-99b9-08dcbcce2656
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:01:17.7369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfRZsVQpL0gaviAnZDk3qArsbC8h1BMrZ9kD7loWPKv2uLMC0MwEt6ZPF6ygurK1Mf99SR+UkuOPqkuWcp0Lpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9836

On Wed, Aug 14, 2024 at 03:49:02PM -0600, Rob Herring wrote:
> On Wed, Aug 14, 2024 at 03:13:45PM -0600, Rob Herring wrote:
> > On Wed, Aug 14, 2024 at 02:51:35PM -0400, Frank Li wrote:
> > > Convert binding doc ads7846.txt to yaml format.
> > > Additional change:
> > > - add ref to touchscreen.yaml and spi-peripheral-props.yaml.
> > > - use common node name touchscreen.
> > >
> > > Fix below warning: arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0:
> > > 	ti,x-min: b'\x00}' is not of type 'object', 'array', 'boolean', 'null'
> > >
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > > There are warning:
> > > Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml: properties:ti,x-plate-ohms: '$ref' should not be valid under {'const': '$ref'}
> > > 	hint: Standard unit suffix properties don't need a type $ref
> > >
> > > I don't know how to fix it. ti,x-plate-ohms is 16bit, but default it is
> > > uint32
> >
> > It's going to have to be a special case in dtschema. I'll work on a fix.
>
> Should be fixed now in dtschema main branch.

Strange, dt_binding_check can pass. but

 make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y imx8mm-var-som-symphony.dtb
  UPD     include/config/kernel.release
  DTC [C] arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb
arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dtb: touchscreen@0: ti,x-plate-ohms: 180 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#

anything wrong?

Frank

>
> Rob


