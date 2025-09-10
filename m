Return-Path: <linux-input+bounces-14593-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5568BB51C0E
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 17:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 254C14854E1
	for <lists+linux-input@lfdr.de>; Wed, 10 Sep 2025 15:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4C2327A18;
	Wed, 10 Sep 2025 15:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="byjgWwmq"
X-Original-To: linux-input@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D78327A13;
	Wed, 10 Sep 2025 15:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757518846; cv=fail; b=UkIrGiaZqNqtpEfr7kEZJ6BByBX+jdzBkzWrwnqUEJkY6cbuZs7rd6ughmpjqUq7V9ks7sKzxyP7w0J6lwKy89avJBiXCcpLHtxMctbJI44Ke3cJP6Cnax2w2RPK8J/WEPP8I4UO2ADSqPQA3ORzg77C+hG+kmYNIT/hsoTBOmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757518846; c=relaxed/simple;
	bh=zoBf4bB0K5Sd1ZF+HtO4F8/+N85Q6qKT+ZNPgXwSSpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T6V5kBEd/SeizYLX0rBnYRHqqUqGm/JHYDehIGUitG+TpZ9qMntajJhENMtahayr6mkEwyRwn0NrLgH92YI/tEGLQjXmP0e3jLP/bkPlpwdfwSqYuw310FA4aNGkcWPJrEcRplfYaKhCNRDCelfcC78AQfv3GHP/MdAdFabPmjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=byjgWwmq; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyCjYcKoapicP8vDy9FZ5VU6+BfzmC/WQII0CW4hcAz+nStAe3wtR4UoLIMobg2g5GUQ5gvjzraDj98di18hKGKggW8xNm2eQ1vWwg/bfTpm/lFVnKZGobG70QycDk2z63K0Wz0pgxy9iddbyIMabuuRuFn267UoJMYBlVBUq9O8ha+1AOvzN1hdKZRfxLEg40gDC5u8ZRhr2t8836WE3K7Di9+iV9cBYNRM7fhlHGDnfZOHOGImgTqN3ZzG4/nWmquoXqEoIR5wQW680XOCGZqL8CUzqgpU8J9x3boMlxySDv0hY07AsZsSlFOx8PM6tAVGMYPwZNSTlC+bOnzsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K3zGRiD72zK0SuVCP+OsgF6wdtOQz7CD5ov3r498fPs=;
 b=FvPmA3l5MX2xTw+RfvnfEzqmy1YsossIMMi7V8sGNqjUDtLb5oXMDHusiWCcxpas7Zfn/8LbGUn/UPWp188onzrkER2GnJzG8UffwFrzplh8VYeecASsN0KVupqgx4L3MFp7BqrQ+xdXRd9yPa2lEHROs5S9vEQjof6Lz8BCTKShKR9J+EfEARku02tdTeO8HFVGsBJcIIF4qh4bLRI7E974SmCPKA6B5WFsifoGzpDl637I9Rc1bZ8S7RlekAqNdJ48I180Oj3yzgdsVBRJZC0x6n7QnrT3Zw5VwTg3tp3VU5BH5KCLp667SQz5Ml24g8pdmAz/BH3HyfEDeUzTCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K3zGRiD72zK0SuVCP+OsgF6wdtOQz7CD5ov3r498fPs=;
 b=byjgWwmqEeUuCk2jDMNHRO4p+zfoNdI0QMZJDOSbDXmX42lZomKwCBeJit7sWs40RxKXDTCX7bIOVZlQ0h0ySZczJ/G6XOOibZMK2UuYoJXFNQyc2k/6WFo+cZdBbFjnEU6XuapshbN1Uu2xvU479nEpy11gygNhHj6D+s6Q1hWQnYvmHxHjc5FSgsCvUdm8LkmNSP0TXUJikRrmPQr5lAlQkT2GDYdqMzafPIcC0V34fVBy5pVW3typMXmTyLxwdRb9HiyBv4CKCzC3sxpWBdMdg56XmdHFrSd5LbW4HUgzQ5R1XdzHwI6FQNpZPOn7NU+cchgZJKNQzpTSdPVuyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AS8PR04MB8135.eurprd04.prod.outlook.com (2603:10a6:20b:3b0::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Wed, 10 Sep
 2025 15:40:40 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%5]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 15:40:40 +0000
Date: Wed, 10 Sep 2025 11:40:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Subject: Re: [RESEND PATCH 4/4] Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP}
 and GENMASK macros
Message-ID: <aMGb8RzMGMKf/0hH@lizhi-Precision-Tower-5810>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
 <20250910135916.3939502-5-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250910135916.3939502-5-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: PH8P221CA0065.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AS8PR04MB8135:EE_
X-MS-Office365-Filtering-Correlation-Id: 251580d5-0a59-49e1-8f2b-08ddf080655c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|19092799006|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A/PsdvXYCiCuaEuA1Aota3aETmZfn9IVuoYkwFzViamoZIEmS44ysxXJtvCy?=
 =?us-ascii?Q?ewRRgQ60CH8ufJ/48mArGZjpL3nc6cfsJmsFB/9GVS8yqFUtGxTVlTuXf+pm?=
 =?us-ascii?Q?3bJWmDdvn1nLK1rzxz0nLGH+8RTsoSx23FGC41y0ICC9ipGGdBHdWIl1/6WE?=
 =?us-ascii?Q?S17JhROp725c0+Nr+OARFknu3o+2NjsgumZwYkg4pU6Eop4fHIThJPNO347v?=
 =?us-ascii?Q?PCXTDOYkfHSXyk1p3/LRqyxBSKHHoc1eJc3wJrIGScl/2Yg/NFbOrw7KjpqQ?=
 =?us-ascii?Q?DDl0mgDpE5LGM9aUBEt24NJXTZFZDR2QM681c4HIwbZIaRSlpbhdppqJz5m7?=
 =?us-ascii?Q?/QHymjUoO6lUKskOyhN4087wsS8ItlzVo1jnHH3EkKukvv1SKqyK/ADMxsIY?=
 =?us-ascii?Q?FIPI5UdI+p4uRrBSVQgOqsjnMc8+znZ/oMItA0CamI38BquRXpCxOJUs9tev?=
 =?us-ascii?Q?l+SgOBg4M4PUSMm/pWAuUGyvY35OTEyr4a91S3FZBIMT2r6hdnqZVQ2r+FBA?=
 =?us-ascii?Q?JYSFd4SMjlLWbtnxC6Ycix/BIn+eHgGfifCSQVeW9gKfHfn3CxN4saOVcWEq?=
 =?us-ascii?Q?ePnAe9P9BKONe2OxDp8663y6abZi5ZuiSwZOv56j4YCbEq7/sTLphUp0eQwu?=
 =?us-ascii?Q?UsSmWY32UoYRS+2xmz/AF40LlBLuDJPGGiKsXA+Mjv7kUqa4rw/IwDwbsfe1?=
 =?us-ascii?Q?ovn4g2ETXgKeH61YwlPMpvKU3vi5OBZ5xMKfwmiRlFgcIM5CuOhPwtkFXs6u?=
 =?us-ascii?Q?eKaftip4IZ4lb5K+rYXBzxtOMwYw5bzCoKXjM3qi/Y2Yi+QQyw+1wjc9yCQS?=
 =?us-ascii?Q?0O2r07SXnAw6JqZP7+czw0f5+ydmbAzHzGvoWC/oRS3H1N7dSKbeDnp8uFzy?=
 =?us-ascii?Q?QwKIvDFCvGDL6cbh7WB7SgFN9gFMB66za9AbTbTPipftUZt/e1VuQ/ti/iPa?=
 =?us-ascii?Q?0JW7X7Lnj5kaFxGUEBue1z8HAWI80xThHsQKuZP8R1oREn/o8hRAVMV6xuMj?=
 =?us-ascii?Q?Z2lhqQSxSZsSlpdjDJcOGC5Ok28DgxCTFfRIpy9iSKlEv31/mAx0ojqIhFqj?=
 =?us-ascii?Q?oWuEewb9b/6rsc+74lqTS46F+BTeocGzo31qPJXLIoDR+dWsrF0TpZq+lMKP?=
 =?us-ascii?Q?S5wnGmTen0yrtltgrSy8I2rOTRlf8eAaCx3u0ByJL2JVCF0tpq9l1jwRU79i?=
 =?us-ascii?Q?9+3OcpRIJ0tHrqchYT+p5+y5ULYcltFHN/IUZJdGStCQKy/EgHFMJvoC4L2t?=
 =?us-ascii?Q?sGHV0U4zQX2q0BfLDCp+TRhNSCryJsmMI3rzklcdpLlOh+akoj2P9w6eDv/i?=
 =?us-ascii?Q?TmfkFg/yOzgg1irY6zhClo6V1alSoYBWsefsa6CGKa13qoPeSIJFkE5mzR36?=
 =?us-ascii?Q?rrNNOXa14c4Ad5aEVOYiEkEFmk+i0Wi4afsJqocsNebRq2yQzOCWB1KMCPWQ?=
 =?us-ascii?Q?g5XmdtJYrf+mCn0pSVWLHBY7XqJTwkL8an4F0dckAlK9pfjKg8g78KSWPTpl?=
 =?us-ascii?Q?KL59CG47hSzOeWI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(19092799006)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qF9M3Cfw4SCIHU5NIcJemrMTMFA74Qp2LKm6UCAKNFCW59KBQGh1P5j5+UNL?=
 =?us-ascii?Q?Ch/cTIiC6VENL8fW/SAuDu/C/cFYRxy3xjhylpwBUmEjJgmWBOg/lp5cGDLl?=
 =?us-ascii?Q?uYvJcqbh62A+XD71ck2OdQAwYFoSOfpZKVRaXq0U+JzVl81tz3CBurcOliyI?=
 =?us-ascii?Q?+3YiPGc7/iNyT3bCWqaw+ah1LBpu5B4/eBloMzgsOS3t7/nq1nHej62QtcXp?=
 =?us-ascii?Q?/yniaoImHhkqFYouyoXayfxN0tqkWNbCxP+N/cFi7zvN0yC4svwgnxKDttsQ?=
 =?us-ascii?Q?UkclSHQjz7ERtaqQXbhQx8socn6PIopFQQa39pA0diOJX8TyLzO0OgPW2bUW?=
 =?us-ascii?Q?/wXx0OpnM8mCh0fdW7sKr/xEt2lCNcTauINiOo1aHVnBXEwX2y3wLlXNYjfJ?=
 =?us-ascii?Q?ZAGqXwYIdud+/QXZgP037CTxuEgjbSdTVO75uSABNdIv1uRZauSPoDqAztzu?=
 =?us-ascii?Q?l2zbp5K8JJzZZ+RwxKk0EZ0XQ+uGTuMNaC9w/AYWbgiaf4Wh1SgR5FiCp8XO?=
 =?us-ascii?Q?YHnhoQ/HTreYh9dHuzYLJOdwD0axHRyMzv67cLp7U8UpzxhtjAmJH5HZkD0F?=
 =?us-ascii?Q?vk1oRn7ZOb+slkSd6uV8uq+eSv4mf7C8DIVz2IfWQS7rMfTy1W/3ydtLID5w?=
 =?us-ascii?Q?8WngwH9FL3XSPygjixt51aNwinqH37VtW4HxA15DNTxxUtaz+2YYJ7qlupCw?=
 =?us-ascii?Q?ASGX/adLVrREGdX7OkCKj9AT9ODJyIz84dljll6mtD9cySP17JIosV67xMTB?=
 =?us-ascii?Q?tGif2nJRy0tWzmBX2qtiz+7FXwXicOnt2ExcHF///eqtxqWpEts1zDaNtTcg?=
 =?us-ascii?Q?5aq6YLPtv7IXh0HGG/4+8kZ4KCZVZTzPbOA02rbErf/rmMWYygyEPQpCW4AJ?=
 =?us-ascii?Q?E3xUzbaEngfZ0unQMMua0PzFIoJiE5vQJ3VXmS2WrvZvQRpvJdvv+30Zl43g?=
 =?us-ascii?Q?9C/YRPQxNTeQUeQKob7JzCcMR/ck3fvJJkNeepZ8saV1aMrMBTO1/yLfrs3Z?=
 =?us-ascii?Q?Z0wqiU0aJExr44ZM2t2y4MVvxHP8scWJ47nSTYSXCg1aJCorlf6sE/VKZ3eb?=
 =?us-ascii?Q?LKqZU3iBT3OS363TqN9wDwHCX0EwKaTIX8xeC5Ua5HHASGkjCKMXcOmYu4l0?=
 =?us-ascii?Q?hydfHDVnb7koK/h4d6daZTDVea0kXVlBsAbUmluqCMaW5mGwK0GQOcP7L39q?=
 =?us-ascii?Q?InKFF6Z33BdqFmnh3f8isfmUSMi7BOt7wE9Cb1Jj0pPFqmtas4xAZruS8CT+?=
 =?us-ascii?Q?Sn+NaIyzqeWd3gS6dnmlncEhJ1VjYn/xRx1ruGr2lwF2qkCTDOUGiCc8xTHG?=
 =?us-ascii?Q?lhOG/t898PITECBmEQILUlYbn7kBwdm2BrQF1Md8ffk1pngCutTrpp5j7Fek?=
 =?us-ascii?Q?E7q3+K5tJmGEKy6koFZ1DGB2yCiSa88FLORZULfNzkqTTD5g3BiARPZfPHRQ?=
 =?us-ascii?Q?0dE8JVpzLr2ZhyA8Ss4qwwXFHcd/uYvoO8Y45EEc4XIqTlsClp+g4p7LEsBN?=
 =?us-ascii?Q?WIzDzgyuu9o65xz6oBRhUVwNlNgVqv54zcyYsbTzuvlUXOvqIpPebFgQqtxk?=
 =?us-ascii?Q?UCSIbQl7M2SR2bxwVfI9sC19PCgiIwhUU9EEnbo8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251580d5-0a59-49e1-8f2b-08ddf080655c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:40:40.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+Kw+ffkQk7LzRq1NAaVvSyrBgwhJ+GFRq/wKMizxQZQXPnl8JM5oADDwswR98DQSkrJzooVQ7YMOrnr6q+2Lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8135

On Wed, Sep 10, 2025 at 03:58:38PM +0200, Dario Binacchi wrote:
> Replace opencoded masking and shifting, with BIT(), GENMASK(),
> FIELD_GET() and FIELD_PREP() macros.

Add "No functional change." to help filter out if need bisect.

>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>
> ---

This cleanup patch should follow patch1, which is typo fix.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
>  drivers/input/touchscreen/imx6ul_tsc.c | 88 ++++++++++++++------------
>  1 file changed, 48 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
> index a6066643bd48..e74999c5e22f 100644
> --- a/drivers/input/touchscreen/imx6ul_tsc.c
> +++ b/drivers/input/touchscreen/imx6ul_tsc.c
> @@ -21,25 +21,23 @@
>  #include <linux/log2.h>
>
>  /* ADC configuration registers field define */
> -#define ADC_AIEN		(0x1 << 7)
> +#define ADC_AIEN		BIT(7)
> +#define ADC_ADCH_MASK		GENMASK(4, 0)
>  #define ADC_CONV_DISABLE	0x1F
> -#define ADC_AVGE		(0x1 << 5)
> -#define ADC_CAL			(0x1 << 7)
> -#define ADC_CALF		0x2
> -#define ADC_12BIT_MODE		(0x2 << 2)
> -#define ADC_CONV_MODE_MASK	(0x3 << 2)
> +#define ADC_AVGE		BIT(5)
> +#define ADC_CAL			BIT(7)
> +#define ADC_CALF		BIT(1)
> +#define ADC_CONV_MODE_MASK	GENMASK(3, 2)
> +#define ADC_12BIT_MODE		0x2
>  #define ADC_IPG_CLK		0x00
> -#define ADC_INPUT_CLK_MASK	0x3
> -#define ADC_CLK_DIV_8		(0x03 << 5)
> -#define ADC_CLK_DIV_MASK	(0x3 << 5)
> -#define ADC_SHORT_SAMPLE_MODE	(0x0 << 4)
> -#define ADC_SAMPLE_MODE_MASK	(0x1 << 4)
> -#define ADC_HARDWARE_TRIGGER	(0x1 << 13)
> -#define ADC_AVGS_SHIFT		14
> -#define ADC_AVGS_MASK		(0x3 << 14)
> +#define ADC_INPUT_CLK_MASK	GENMASK(1, 0)
> +#define ADC_CLK_DIV_8		0x03
> +#define ADC_CLK_DIV_MASK	GENMASK(6, 5)
> +#define ADC_SAMPLE_MODE		BIT(4)
> +#define ADC_HARDWARE_TRIGGER	BIT(13)
> +#define ADC_AVGS_MASK		GENMASK(15, 14)
>  #define SELECT_CHANNEL_4	0x04
>  #define SELECT_CHANNEL_1	0x01
> -#define DISABLE_CONVERSION_INT	(0x0 << 7)
>
>  /* ADC registers */
>  #define REG_ADC_HC0		0x00
> @@ -66,20 +64,26 @@
>  #define REG_TSC_DEBUG_MODE	0x70
>  #define REG_TSC_DEBUG_MODE2	0x80
>
> +/* TSC_MEASURE_VALUE register field define */
> +#define X_VALUE_MASK		GENMASK(27, 16)
> +#define Y_VALUE_MASK		GENMASK(11, 0)
> +
>  /* TSC configuration registers field define */
> -#define DETECT_4_WIRE_MODE	(0x0 << 4)
> -#define AUTO_MEASURE		0x1
> -#define MEASURE_SIGNAL		0x1
> -#define DETECT_SIGNAL		(0x1 << 4)
> -#define VALID_SIGNAL		(0x1 << 8)
> -#define MEASURE_INT_EN		0x1
> -#define MEASURE_SIG_EN		0x1
> -#define VALID_SIG_EN		(0x1 << 8)
> +#define MEASURE_DELAY_TIME_MASK	GENMASK(31, 8)
> +#define DETECT_5_WIRE_MODE	BIT(4)
> +#define AUTO_MEASURE		BIT(0)
> +#define MEASURE_SIGNAL		BIT(0)
> +#define DETECT_SIGNAL		BIT(4)
> +#define VALID_SIGNAL		BIT(8)
> +#define MEASURE_INT_EN		BIT(0)
> +#define MEASURE_SIG_EN		BIT(0)
> +#define VALID_SIG_EN		BIT(8)
>  #define DE_GLITCH_MASK		GENMASK(30, 29)
>  #define DE_GLITCH_DEF		0x02
> -#define START_SENSE		(0x1 << 12)
> -#define TSC_DISABLE		(0x1 << 16)
> +#define START_SENSE		BIT(12)
> +#define TSC_DISABLE		BIT(16)
>  #define DETECT_MODE		0x2
> +#define STATE_MACHINE_MASK	GENMASK(22, 20)
>
>  struct imx6ul_tsc {
>  	struct device *dev;
> @@ -115,19 +119,20 @@ static int imx6ul_adc_init(struct imx6ul_tsc *tsc)
>
>  	adc_cfg = readl(tsc->adc_regs + REG_ADC_CFG);
>  	adc_cfg &= ~(ADC_CONV_MODE_MASK | ADC_INPUT_CLK_MASK);
> -	adc_cfg |= ADC_12BIT_MODE | ADC_IPG_CLK;
> -	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE_MASK);
> -	adc_cfg |= ADC_CLK_DIV_8 | ADC_SHORT_SAMPLE_MODE;
> +	adc_cfg |= FIELD_PREP(ADC_CONV_MODE_MASK, ADC_12BIT_MODE) |
> +		FIELD_PREP(ADC_INPUT_CLK_MASK, ADC_IPG_CLK);
> +	adc_cfg &= ~(ADC_CLK_DIV_MASK | ADC_SAMPLE_MODE);
> +	adc_cfg |= FIELD_PREP(ADC_CLK_DIV_MASK, ADC_CLK_DIV_8);
>  	if (tsc->average_enable) {
>  		adc_cfg &= ~ADC_AVGS_MASK;
> -		adc_cfg |= (tsc->average_select) << ADC_AVGS_SHIFT;
> +		adc_cfg |= FIELD_PREP(ADC_AVGS_MASK, tsc->average_select);
>  	}
>  	adc_cfg &= ~ADC_HARDWARE_TRIGGER;
>  	writel(adc_cfg, tsc->adc_regs + REG_ADC_CFG);
>
>  	/* enable calibration interrupt */
>  	adc_hc |= ADC_AIEN;
> -	adc_hc |= ADC_CONV_DISABLE;
> +	adc_hc |= FIELD_PREP(ADC_ADCH_MASK, ADC_CONV_DISABLE);
>  	writel(adc_hc, tsc->adc_regs + REG_ADC_HC0);
>
>  	/* start ADC calibration */
> @@ -167,19 +172,21 @@ static void imx6ul_tsc_channel_config(struct imx6ul_tsc *tsc)
>  {
>  	u32 adc_hc0, adc_hc1, adc_hc2, adc_hc3, adc_hc4;
>
> -	adc_hc0 = DISABLE_CONVERSION_INT;
> +	adc_hc0 = FIELD_PREP(ADC_AIEN, 0);
>  	writel(adc_hc0, tsc->adc_regs + REG_ADC_HC0);
>
> -	adc_hc1 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_4;
> +	adc_hc1 = FIELD_PREP(ADC_AIEN, 0) |
> +		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_4);
>  	writel(adc_hc1, tsc->adc_regs + REG_ADC_HC1);
>
> -	adc_hc2 = DISABLE_CONVERSION_INT;
> +	adc_hc2 = FIELD_PREP(ADC_AIEN, 0);
>  	writel(adc_hc2, tsc->adc_regs + REG_ADC_HC2);
>
> -	adc_hc3 = DISABLE_CONVERSION_INT | SELECT_CHANNEL_1;
> +	adc_hc3 = FIELD_PREP(ADC_AIEN, 0) |
> +		FIELD_PREP(ADC_ADCH_MASK, SELECT_CHANNEL_1);
>  	writel(adc_hc3, tsc->adc_regs + REG_ADC_HC3);
>
> -	adc_hc4 = DISABLE_CONVERSION_INT;
> +	adc_hc4 = FIELD_PREP(ADC_AIEN, 0);
>  	writel(adc_hc4, tsc->adc_regs + REG_ADC_HC4);
>  }
>
> @@ -194,8 +201,9 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
>  	u32 debug_mode2;
>  	u32 start;
>
> -	basic_setting |= tsc->measure_delay_time << 8;
> -	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
> +	basic_setting |= FIELD_PREP(MEASURE_DELAY_TIME_MASK,
> +				    tsc->measure_delay_time);
> +	basic_setting |= AUTO_MEASURE;
>  	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
>
>  	debug_mode2 = FIELD_PREP(DE_GLITCH_MASK, tsc->de_glitch);
> @@ -255,7 +263,7 @@ static bool tsc_wait_detect_mode(struct imx6ul_tsc *tsc)
>
>  		usleep_range(200, 400);
>  		debug_mode2 = readl(tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
> -		state_machine = (debug_mode2 >> 20) & 0x7;
> +		state_machine = FIELD_GET(STATE_MACHINE_MASK, debug_mode2);
>  	} while (state_machine != DETECT_MODE);
>
>  	usleep_range(200, 400);
> @@ -283,8 +291,8 @@ static irqreturn_t tsc_irq_fn(int irq, void *dev_id)
>
>  	if (status & MEASURE_SIGNAL) {
>  		value = readl(tsc->tsc_regs + REG_TSC_MEASURE_VALUE);
> -		x = (value >> 16) & 0x0fff;
> -		y = value & 0x0fff;
> +		x = FIELD_GET(X_VALUE_MASK, value);
> +		y = FIELD_GET(Y_VALUE_MASK, value);
>
>  		/*
>  		 * In detect mode, we can get the xnur gpio value,
> --
> 2.43.0
>

