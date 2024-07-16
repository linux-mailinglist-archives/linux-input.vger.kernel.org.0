Return-Path: <linux-input+bounces-5062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B59933331
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 23:00:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B78271C2208D
	for <lists+linux-input@lfdr.de>; Tue, 16 Jul 2024 21:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568475381A;
	Tue, 16 Jul 2024 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Aupqk2Tl"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433E31DA4D;
	Tue, 16 Jul 2024 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721163640; cv=fail; b=V14CY0xh2K4Na5TaIsv1EgqiQKjNAd6FgqbGXBoQiKleuD6RzKXWqlkXB50bAafHhxP7G92TLxNNDl1oc6uNmHeg4uVyKPAzsL8UDPWIapLJkU1XtlvdLEGs3E7p2o2Rzxr6xWqtZFMDarX/cA2aXPhFszgDkSEY+F21/XsD/14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721163640; c=relaxed/simple;
	bh=S0diCktvVorgB8AQelw3ILPPu0rCUMHfVd3fqDjI8FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ndB+oe05pJvXSAZFTQPqSGFr7d0UWkT57pOkeAeHydgw4J5Z56GLZzJUv48cFFdW46jMpAev8hJaEf0G/BhBupVFfarvXRX67kexzgTWPbQHwCdOapIJqRWso/TIOh5W15ZX1+ijySHOmDkygPIdVjD52ral6kdSUIlbCNJRHYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Aupqk2Tl; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F40NpGxT9omPqSc2DAimj85A0QNqeqq3b5nobHsRzQ7hfndRsv0Y2UbwhM55CPlltFncQjsZtx+Ou25oCvANvSqO50MTIxl5wcLtLXMyi26JjRlgXmlOPzCyHBvKYzO2T0IBWYCe5HFhYOXifyzoW7mnJaDOppFODxBR1JOpuqE5e4ay82b3IXx+gEmz37rS3MuXtXQmisx9msCLXr0CLBqiMOJWNmOPqGzZRYNE7RIZaLEpFqqBoDvxe7nJQdaTV4v9b3x0QhSZONBEOoWn52lxLna1hmR/pogq5s9SoxPxN286ri3FbuAuKE9H6UaeroesJSJmnbWBjE3LFPgjWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OP9ZKz0lUPFk8ciAndZVqHUgBMHVl/GRh5o2sR2X9T4=;
 b=rLqFHtCDFH/y//TwkmMJ61AiftLInXIHfqMw/vQol2+lormBVLYpes580/yJY6iEUcZ4lGXlP5eoyAQIPJOvYHm8cAa0NWdEXo+N9YkCyrjL21VIujnxzZpMbC1rFM2yQxREb1F8eM1T1SBxWdi5eCbiTTkmJgFqjv5maK088LNRVjEULtEzMC3EAD3qsT9wWsLrVRVYQI9fPRml5xvtQLZIK/e2bdlb+Jcx6mKHON8ewRjuHIhlhrV4M/aOOJF05bjm9lSddnztTkkLUq+C6DuE/xqNABouybAMN5sqjj+MyFWQcRqGzZYlFqhPF4d5qBgIiVZcsuAZ48m20RcaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OP9ZKz0lUPFk8ciAndZVqHUgBMHVl/GRh5o2sR2X9T4=;
 b=Aupqk2TlqESmNW4okosgEW6PNFDLokHRoXekTDpDSloqtk9dLa6tTGFP4pGolbJ0mBJi25kbxKLKYQB1BtkLq5OREIo1xUd1TroKXmSq1MlTDxOx/Cm4akYX0/HMERHysE7J3uitp5k+fDnUAAGSHYd6C7PLAUBq7kKDRREjSCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8321.eurprd04.prod.outlook.com (2603:10a6:20b:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 21:00:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 21:00:35 +0000
Date: Tue, 16 Jul 2024 17:00:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jason Liu <jason.hui.liu@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpbfbJOiuuRyFrGT@lizhi-Precision-Tower-5810>
References: <20240716205612.1502608-1-Frank.Li@nxp.com>
 <20240716205612.1502608-3-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716205612.1502608-3-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0118.namprd03.prod.outlook.com
 (2603:10b6:a03:333::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 6415634a-e24a-4506-5a02-08dca5da5675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fjh6L5Pw25/YVVxf2SSaQX+RYdaAAolSGUOXJQ5Hao1F8dxTSjUmaLvJNUdH?=
 =?us-ascii?Q?5VL5VLFT7ixeZVE+GDKFDVSlUtLszg6XLODbOV2ETKNWW2qO5j3SGyKn81SA?=
 =?us-ascii?Q?KxSbjFgUcZqlJulPz8pHdJC28eiBbehWuX5imly5m0y4R4VvYrmNyYMab8IQ?=
 =?us-ascii?Q?WkDGTnyLtrJATgirIzqET0/NLlCowbpG1Wi8vl+5t1CG++N8IhvLFvpQrlM/?=
 =?us-ascii?Q?TCEGIod/0PyaCmU7Oz5OezX7Lx7j4kLI9SXRHIrOtJL3f2qAyr1tTWVePxB+?=
 =?us-ascii?Q?4NZqfywIg9edqlDqt0o+v3q6U1QYcxLao79tx2YzpE2x9kQLXAMSqy+zpodj?=
 =?us-ascii?Q?FcOxsGxG7xy91fjPs0/eKhjklLewrbkwUVs8WR/Uo1AJHowcMoqDnHnVcIj3?=
 =?us-ascii?Q?rHU/8flhkP3o0KONVPLqDEVj6zQN+eZor9j+0KYraWCX7J8At20VrY2FrcQ6?=
 =?us-ascii?Q?Xw+0A6Bvpe5lCLii9YMxL4oGphyD+sq4tKuXWJ2AI8Li8Feo28+ehaf8oBn9?=
 =?us-ascii?Q?To2ASgxmxsu2QiZ7+BeK9I+Za88oHv1/LxSrS1iLvJwG/9sYu6xCgoTq/y7b?=
 =?us-ascii?Q?gLgehty9LcUHI95xe+yCglEm4HdTEDAPs0vJ6jLuc55y4wh7U+Kffnqn8Ctm?=
 =?us-ascii?Q?OOvfGKcWxKJ7sJf44heWWJOJJ34M4CdRq1MQcs1I3VpTkeifGQ7YEtSOJniG?=
 =?us-ascii?Q?E2lxTqTsbd1gi+rRIV3H5Jd08/EDpw1zOFpWXhOePWboFUEGlyALrj8z2qCq?=
 =?us-ascii?Q?SgZD5wlACQlDMxL+4inIrd6A0sMa1hHiIV4H8kYPMG1j6Z79uiDvn9PRIML2?=
 =?us-ascii?Q?UvLdVd/oszP3E9yWqjRqJMxhMkvO8XWuIDFaIa+E5M4IgmyCAQbgjrJV5bfS?=
 =?us-ascii?Q?a5KI8oco2T773osbLji9SfYVP4bI9+505xFfBs2gw50W+ND8hxKNuzXMM5mm?=
 =?us-ascii?Q?UF4ZJIiIfHJ8RVrSWjZmR4GrnqtC+GMzzGTzyeeerD7qUFBlh2gnMWp0H54T?=
 =?us-ascii?Q?tvIBuQ/Kgv1p2ZD8M+SaU9ryj7ZsXkW0CEE0REGeQy7P6jo25v4XqNQ6J2i8?=
 =?us-ascii?Q?1w8a1q7XHDob5slohZVBj5PZeLXGH7BCzzB+N19pHckFL8BZQ7QplMZ1nqcu?=
 =?us-ascii?Q?OFzGCgUdnbPSSfNsUiM1mTXlkpfXnw3ejIl9CovGomwdfexPQjiwfLW/f0zS?=
 =?us-ascii?Q?mueqF6UEqdyyBmA8x6rneXq6Cwu98R/MNwM+JMI/VNkMCaBlGVb/DRregj+1?=
 =?us-ascii?Q?4El7utoTr+SJT1Q95WbUJ7oUmtlWPQjdOmHWUNnAIJBO6A2flpKts5uaGGyz?=
 =?us-ascii?Q?XRQnph//rTM7ahHoadLi+Py608LDhzQtnLhpGk0ulPbVn3p2vm1lQgdk6JzK?=
 =?us-ascii?Q?GN7yv9+xnSHlHyZbDyvx/aMmBEREMMV/JlMx13dGCiXtAzg2Xw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrNuV1ET9CMKqXWDsJENdSPuS8/7Zbn8M3KILD0Tm0pkqLATQ9ryVQswvIoJ?=
 =?us-ascii?Q?zQfHGhSlCvYZNgmnx/bhwnNPwH7+mSxHQ8dcCWxTfOGuvAcGqTh909KlBhLH?=
 =?us-ascii?Q?soEIHzYMgDvYGVZfxKsWZ+q6URrLzvRd7wB4f0PZ2UB/95/6uKLHrv1g9xjC?=
 =?us-ascii?Q?4aJAxY5f4VttDF3TGf/6d0IswT6W5GEt9QYF9EW0VUx5X9KvjKRbhUFEVXqi?=
 =?us-ascii?Q?Q8giwzQxoswhwH20PZ5xq8/wB/ZlXAlTBqfun3hJ4CimPdR7wIcBKG2JTAie?=
 =?us-ascii?Q?yqu4CmEb0OaV9ExdJRNdE4gWZWuuqkN8sFq7YBtaMBreuDymC8CQf4mfFEGJ?=
 =?us-ascii?Q?wC9x9HwRojD3qv6aRkaU1Ntx2I5FSlSRccYy1dXwxNewGPjnI+WJ6OKsY4OM?=
 =?us-ascii?Q?74r5DqvJvkKUW2ICvG7scP1V4LYliCkRifwON+n/ewBxGW0JQ7Zdpz4/UyoE?=
 =?us-ascii?Q?KQ4SYO2563wlLg1+n2vN3MaVIwlsZuTO0rXTZUBZqFdK4mdDmdsmL0M+c7F3?=
 =?us-ascii?Q?4kwUqKu537xpLWxK9j9mee86xCZvmbAPvT5pKPScuSWkxNHHUrOqPN/5hPsO?=
 =?us-ascii?Q?Gb6bGfNTYPyoblrk3QllcbwYZabqSFs7zLdfrkM3YYE7FX6f/yfAiPqgrwCN?=
 =?us-ascii?Q?AHmbV6eRsG3DKqBKbgLk5RCYRTo4ueVDx6OmOcb21zLcKJozqcTT8SBOItS+?=
 =?us-ascii?Q?0hI8ZWJedUAsheeYmwlFe0uwJqwtgt5Mm40r5WpjmTXt/EIn0Zd+t6DixV7Z?=
 =?us-ascii?Q?zznKdNuAqa7OeM4nQtU4U0olAiqQP4aMla9vtV/zW1DhfXXpmoq/N6t7ZHOR?=
 =?us-ascii?Q?osHbm3EqpQYenCnftYy943J0inr0HD8hA4yx/pihxJz6AqKEyXnTigMu63hW?=
 =?us-ascii?Q?1M/Z0ERO4k5AOxPoVEEsYKvYNr2ZM8wMZXFGF5Rk3jbGheZ/kqyUGwy/DN5P?=
 =?us-ascii?Q?d3Xnxb0bLdNqdbwUTaX0hG9yd+QsbrNTg0veTyb/Y94cFT2C50ymYpHhk5d9?=
 =?us-ascii?Q?bNt+UytOioHnAqw8A1QXuyu3tihqh7hlm6C+yPIneqwfpDscUOmCDaSvP1l4?=
 =?us-ascii?Q?omRuc1WmOcxPnBlWpRq/CI+ekwU65dKFzPcoy6T3/2hmmjV5Sv3sv8y5SSMu?=
 =?us-ascii?Q?LNYh7MB8dTq90CtjdRKbSb/BRUr/o/xC5241p/0lr4cWUFOaqBNsaYA/4v1r?=
 =?us-ascii?Q?PLt85JbYeZRyNzniNJME8q16zTXanMK5HwQzp2TProj0CFnPHa3bI3blTB80?=
 =?us-ascii?Q?nD+jVXyNLe7qbvLlfRdxtBug5eF4AyFTk19JmJTVNdGFHohv9lIJ8f0FlX/4?=
 =?us-ascii?Q?n1ZYULsugr3y0CFNZchKat6TYwpPMWoAycDwCu8dxwdL6i4BqaIHrY8aJg9y?=
 =?us-ascii?Q?jJMZcKqdN2vDTzAOc1ilpeYnmerRL8S5BRQLhnhykuWvDv46p1XU4RzQ6QgG?=
 =?us-ascii?Q?dyYP3Bg/aVVxg3j6+9xYPB40d64sghoovw/kM5pEwI5IChxVr7pxMWyDtPtX?=
 =?us-ascii?Q?w5rS4dO6WUbbhjWqj1sVCNDSRshj9cI5sO+SUnOnR3M1GcfoUY5RNdFRwi2s?=
 =?us-ascii?Q?1u7HirC58lAKJOgDgYAxmkxbAVEVJ0WwRA+pLsX6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6415634a-e24a-4506-5a02-08dca5da5675
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 21:00:35.4788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xyv+OPzzg0K3i4w+GJRZnymQ/nA6hmmo8vxjtY3z1RjumydRgHY9Q115oQWY8pZyJq+UmpHn7DGDQsgpfvwyjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8321

On Tue, Jul 16, 2024 at 04:56:11PM -0400, Frank Li wrote:
> From: Jacky Bai <ping.bai@nxp.com>

Sorry, Please forget this patch, this one accidently sent out with other
2 patches. And this one already applied.

Frank

> 
> Report input event directly on wakeup to ensure no press event is missed
> when resuming from suspend.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - move before mod_time
> - clean suspend flag to make sure only fire once
> ---
>  drivers/input/misc/nxp-bbnsm-pwrkey.c | 38 +++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> index 1d99206dd3a8b..eb4173f9c8204 100644
> --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> @@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
>  	int irq;
>  	int keycode;
>  	int keystate;  /* 1:pressed */
> +	bool suspended;
>  	struct timer_list check_timer;
>  	struct input_dev *input;
>  };
> @@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
>  {
>  	struct platform_device *pdev = dev_id;
>  	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +	struct input_dev *input = bbnsm->input;
>  	u32 event;
>  
>  	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> @@ -78,6 +80,18 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
>  
>  	pm_wakeup_event(bbnsm->input->dev.parent, 0);
>  
> +	/*
> +	 * Directly report key event after resume to make sure key press
> +	 * event is never missed.
> +	 */
> +	if (bbnsm->suspended) {
> +		bbnsm->keystate = 1;
> +		input_event(input, EV_KEY, bbnsm->keycode, 1);
> +		input_sync(input);
> +		/* Fire at most once per suspend/resume cycle */
> +		bbnsm->suspended = false;
> +	}
> +
>  	mod_timer(&bbnsm->check_timer,
>  		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
>  
> @@ -173,6 +187,29 @@ static int bbnsm_pwrkey_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static int __maybe_unused bbnsm_pwrkey_suspend(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +
> +	bbnsm->suspended = true;
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused bbnsm_pwrkey_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> +
> +	bbnsm->suspended = false;
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(bbnsm_pwrkey_pm_ops, bbnsm_pwrkey_suspend,
> +		bbnsm_pwrkey_resume);
> +
>  static const struct of_device_id bbnsm_pwrkey_ids[] = {
>  	{ .compatible = "nxp,imx93-bbnsm-pwrkey" },
>  	{ /* sentinel */ }
> @@ -182,6 +219,7 @@ MODULE_DEVICE_TABLE(of, bbnsm_pwrkey_ids);
>  static struct platform_driver bbnsm_pwrkey_driver = {
>  	.driver = {
>  		.name = "bbnsm_pwrkey",
> +		.pm = &bbnsm_pwrkey_pm_ops,
>  		.of_match_table = bbnsm_pwrkey_ids,
>  	},
>  	.probe = bbnsm_pwrkey_probe,
> -- 
> 2.34.1
> 

