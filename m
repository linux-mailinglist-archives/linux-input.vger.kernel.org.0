Return-Path: <linux-input+bounces-5994-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4131B96525A
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 23:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F4EAB22578
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2024 21:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF83118A933;
	Thu, 29 Aug 2024 21:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iAANN7Tb"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2071.outbound.protection.outlook.com [40.107.104.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E9F1B3F0A;
	Thu, 29 Aug 2024 21:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724968370; cv=fail; b=qq5yOiJPkX1WeL6TbMaBI2MKtmAqM/X6tc5MUzfUcitFcfh9F3r3YV+dNG2PNQ1g9M3D7PSTLkGt6cIXGBlphSYNWbxqOTosfsc/hQG7AczKYurc4NWd6JINgUhwqVrI2W3YQs2Ih39wxJENgtEqWNP1v5uzh/a+zkroceixd/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724968370; c=relaxed/simple;
	bh=oEX5DDCNIVL4HOus70dVqQ2Rr/qAgBNstiFSFW0UfdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=taPMKU0kDvu0xQDtqabgyygDA2NTNcOUYygFiMCp1gZZJKtqu4W4HhVWaShu+6Bkug+4Oo3PGdzeTHX0gy/xyQHwE7acYLJyP1ZRhLlR4A3fQc1/1LtfhRyY++eeqNeZYT5OmqE7yhZ20OR0krYp61En4e3UbkTS45Rvl1l0Z5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iAANN7Tb; arc=fail smtp.client-ip=40.107.104.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYfoILCK+3XTXjYSWUmdk24hGF1w+llMLCmPV7V8RCA1yJeU+Yg/xH+jtAMWTJN1x33bdIuVLCzI2bcIEJ3Dt6PqiETuq9fPtYtma14had7MhGDFjjH3JIMc5sIsKVPNnD+Kp/xfGvQW1vNa+VY2uJsGVs9O4NpRHVvY4X16ymQe5/KINFzx/S6H/Jr3S7l9Q+Z8bnef0SsXHj3TQXE3p0vTTC4jbKr3sx0HL4nEk5hR/W9tXVHVODckkqpUtmKBfJQArMig3Ssv1fkKxoUsgrbljz00EWawJbNN35GBmzNH4A+C11WSp9NSDIyGyZAZthVJBA9bVe9o/F50TFbIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0guAulJjqBgpHqmvWDNYmduydg0ErAUpqQUCsPn3ho=;
 b=ZVzgiD7fXwhtCKMbFbOhnjRuj4/mEudd1nbDfaJW+m/yoWdu91poYZpwH679pYQ6Dl5JuhcE4HtPwyafUlMqkhnUw3yQTtc/+uF6QLqACd9Pmb5X/+eXwbOKhO9D3ngs30QMHlIaZNWuWVpy7V0l180JvJTQnSD5pjCKOLspPIL0zLydx77pXLmOESZoRVLDAGfOJF+9YRJNZUPADIJxL/ZWyEHZrSvBYi0Ph/uCfp7owBU6Y28c5MOSPFx751BkA141pP4C+wfa2upBnFYZWgDf8PLvCO4KsmW9u3SbDsMJISWHGbXtLbdC/PtR1SrSs+Jqzmy46tq6QxV29NwT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0guAulJjqBgpHqmvWDNYmduydg0ErAUpqQUCsPn3ho=;
 b=iAANN7TbDFx9wOUfKp//Lo/ivgRnl34LIEBaerpl+f9r6NeLPj7/NoaoSnC0yLzu2fxyMdhJJnUDyenND2XuHCTqJJ9nDlJxFrcF0USJTNM02JPIr0yAVug4s67/UA5iMnIXLscKEuX8Ozc61cEigGeBNj9tStmiTGMyAYwqzrLokEfrL8g/oa1LmnOY21cF4RYtUMayXOUXVxbIiAF1KNglg9KL1Tj8HpoKtFUJy1eDdcK1yK+TIf3vm34K9CC4TvLhM3nkt127aNqPjgHVv2WZy95TLiRU6mfEezZr71LSAXNr58qjNqyWuolDuFs/KXSrhtFh4WswZsQTBBSFgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10362.eurprd04.prod.outlook.com (2603:10a6:10:563::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 21:52:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 21:52:45 +0000
Date: Thu, 29 Aug 2024 17:52:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Robin Gong <yibin.gong@nxp.com>
Subject: Re: [PATCH] Input: snvs_pwrkey - use devm_clk_get_optional_enabled()
Message-ID: <ZtDtp5WPPJiTB0Yu@lizhi-Precision-Tower-5810>
References: <ZtDDGMaOFlMYjOrt@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZtDDGMaOFlMYjOrt@google.com>
X-ClientProxiedBy: BYAPR06CA0005.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10362:EE_
X-MS-Office365-Filtering-Correlation-Id: aa87ff31-9c55-4f33-a62a-08dcc874ea74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b8+BHiYWMvsdD6usfVrKm8j3hf+3ubT1Qfjy47L5J/kS8Dq/cqvIXzEDcTjl?=
 =?us-ascii?Q?hcYgYIISHkIU4Exf1HzKeFvmF5MDLG5H6t5OlovMTsfYN7EYyPbaMgAgO/Q2?=
 =?us-ascii?Q?fzWHUKAc6bmN+YEFXDWTetawNWFyAvu3oFPUaYiHLaSJXmz9mnKlneoRVXcK?=
 =?us-ascii?Q?/RCJRXNG5rCS2AdzwO75PhRFIY3e3zu2wXhTE2xcnz76GBch4cO5HzSOW9wL?=
 =?us-ascii?Q?nrsReT0UeKHeDXag+Yo6uo0Q9eghx6gkxfcLkMbrEOzsfOSQIbzhNneUMbv7?=
 =?us-ascii?Q?1c51TrIa8v9uzUI6zzLnJOx4jhLEWOwu5reOge2orYg+h3Q46gePWATQz5mJ?=
 =?us-ascii?Q?m8LOIXwksRKnaZoOlqcII6o7WlvShUHcvwGqS99Ku+QRxVJBqmlnhf1BHWQY?=
 =?us-ascii?Q?Vn3LUMKtjMzCUnzT2pLwAs1ngx1Aq/HIs1dYz4qeBsIi51AjDUJahjh/LreN?=
 =?us-ascii?Q?Uc9y8QW/UpAVX1s5BcgwUKJWovOzkEqCgwwSaDvS6n0f5yGUNJk2Mmn8T52z?=
 =?us-ascii?Q?eel6mpby/tgMn3FF6SiGbx9hS7E8TvKzqCbWcsB0XIEOkbu+nfcTDm70MInk?=
 =?us-ascii?Q?bRZr/qaNZWGbX/pkHjcfpgFZEqb1+ORTZKGSyf82xMLAa4VBYX6fWjZa9Qkd?=
 =?us-ascii?Q?JjiUo9mAgyDV16CN9IinO/MiZBJovdAgbAZ5OBY5wbN0H94n0XnAsTdZN6Dx?=
 =?us-ascii?Q?VOoEcY84FJVSl1FFEFcoc9YQlY8IZgDLuGb4GkaGhnKyaR1QwtKrJEjN5RCn?=
 =?us-ascii?Q?xR54TIAallA/N8Us8Vi9IS8m1Vv53ltV5wTrMBRGxCXHZlwkQTU43/MXoOCn?=
 =?us-ascii?Q?wxdIPOCuvMS/XEwN0uFdM+ygr4IctxpFG5Qq4oMoZuL2ApgL1Z7yuSLj4jRp?=
 =?us-ascii?Q?KbUWHkQQ6LSJ2HjbkhvHF33H6EYxKWZckxGHOw9asfITKqrdqG4KNxEWnnkg?=
 =?us-ascii?Q?O1jcSTo+cZHRaXWsEgtBvBNvwXOHz6xZh8qQf4vln4pXOu5WwUmNL473STig?=
 =?us-ascii?Q?cL4uDS8uXobcbZEzXX2oJxSSdvVkSIbPAjC5otpKp3IU2j1w+u/XZBO4wliv?=
 =?us-ascii?Q?5Zae8qokzZ9ekeoXtnxsW2FbUP8lBkorzaNMO0i5F+fMrFLcOi9wPzZOM0Bq?=
 =?us-ascii?Q?rKUiBC/WimSjYiOwF+4b2qrbeD9j52lPvVXLEB9xNRJsjOpSAabDSEIHbzXv?=
 =?us-ascii?Q?q0Mbwogs/r3CuN0udjU/gjto/qv6NrGjr7GXHRpOdskHR4MFCQF8Pk1qJjnY?=
 =?us-ascii?Q?spqBnhEBwf7G8tmRiF8kjsMHeyl/QwoWzxKou7V5QJQ4TgIeO89CTlZb/22e?=
 =?us-ascii?Q?RmNvGq/0DlBrvyF5G8xHn8WuU2GNKHrBIuevvuIovBbDr4+k4YBfqMLJQyEU?=
 =?us-ascii?Q?pDuc4GeYE8eecbfuAFlZRMqmSdqOLGX7/8bRLk02xx2DWjA21Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UjwJ60xX+P6nF3PMFc0T8D7o7BML+Sr9/9sSbZ24nUg1bsLzEFg/Q/PNNHb8?=
 =?us-ascii?Q?Im5KuhpGho05TnDtVGb/RshfMZmAb6Vfict21jxfD9NaFXusbZe7rFccmPP7?=
 =?us-ascii?Q?JP/QELy/mczRglx3exr6w95kXgLi3pqARR41U3muPXFgZivKX7jOmBGKNXap?=
 =?us-ascii?Q?z7hetySorRXKO68gXsBMZGaUdUWMO9gv7bXHs8z2P3N72WIjid94piRmJCQP?=
 =?us-ascii?Q?QO8nMydAbUB1PH58H9ZhKFk5zLeKgvJTCwadfOm7Dq5HbjY5lYUu09p82eBy?=
 =?us-ascii?Q?uAhBup4WXsjntByRrpIIbVU/j/KrG9KFyjnjnafvp8XGwGtKQ0o5zTrDfyL7?=
 =?us-ascii?Q?bSOol7z6svzd7eUMUkKRQM3io/050L+4gyYPHzL0ID+GT55X7xoJX6k7X6IG?=
 =?us-ascii?Q?dpGrfFUP32OpxgCGKT3Hb+mXwuJxp/fsVXnQaFStoOFOsDY178DmFGsXwlc/?=
 =?us-ascii?Q?DWBU4jrrORLOw9biGaVWFh+WEnbnz6OuGHSLG3MA4kEiWCEa180if8FAPOnW?=
 =?us-ascii?Q?H0jSEUMi+0v5vHtmhyXR7xpiWMtxCusElwxo0htKlbbkr0ICImLXh1caWh/l?=
 =?us-ascii?Q?lpR/xccKvrG6eVvAicryJy7xwprrrEx0GQn4+X2A1wWOZngiwKzoA47Ch2U5?=
 =?us-ascii?Q?83zYb7NpriyXbg1IY2D5vJYsiPAOtPLrvTVhu/4gh7gGPai+KWetEV4efSgs?=
 =?us-ascii?Q?0mGn60vBoh4VNFktJG+rn0f4Xn5VdpftJxa95fBZfhLHEDksOAmHPGUPIXNA?=
 =?us-ascii?Q?kttVvF4ct6OF8ogbXe94Avjadeafr9Jx3ScanbD6bU2uZfh59/n1jj+KlWxB?=
 =?us-ascii?Q?ZqGYXxeawyyIFC/O6Xjb16Z7HbKRswiq83/7Gpv/Ei3N8MSLDNBCAIkPG5it?=
 =?us-ascii?Q?gGdHqwZK4GazgR3+mfRKm6kVwRfOyXFS9DKx9HvFlRg2fpR2SyNsGFiUZBZi?=
 =?us-ascii?Q?02qddtbCH9/6cydU/DaOi7p22/PR5g9988HZLEDQoZtTe60/SvfiXgdqmC01?=
 =?us-ascii?Q?hIpB466lA6aVcRKj/a2rrCTyoGLRWntQcuJBiUYvB23lVTIpbmxvmxg/pY8C?=
 =?us-ascii?Q?R/XCV9DLRtHsiGipy6qax4nq8ntn3Cx2OzW383wLEmfYksJkr+Gyble3uwhe?=
 =?us-ascii?Q?YDR1NKv4O5Qy8PcBN+7lnoGW/FIX9iC6ntBGYkJzh7uEBUQyk16sHFCZF2F+?=
 =?us-ascii?Q?T0M5pNnu3iw2XSz1WtcakkxZVn7TOdHPS3Kw8FDYoPSBa4m2/r+TZcNGmoVr?=
 =?us-ascii?Q?JHtZ2GD99sxwYuEO0GKpk+bXqll6K2jlhb71BYZQLuwxIBB3focWXF/FW7BN?=
 =?us-ascii?Q?KFZlRqnPV6mK1fxknSfjFXFaer0j8sq6svgQQLXN/AQLY96Ukga4w6bPIG+R?=
 =?us-ascii?Q?m0JWMzm8nPgQei4xDOPSwdCQ5yV4w2LKQ8hkp1nAhlVBlCXJt3JzoMwE4T3F?=
 =?us-ascii?Q?DLJQIp4zDCBEEWaFEq0Unr96tVlu9N/XteSUptaRk6FCNyr7F6Sc8Gvwq1bs?=
 =?us-ascii?Q?npB+5fSRI3DwCk0EzNmUvoGfoI81rDAiqE0s4JyIcGpWl/nB38IRo4qg4NXn?=
 =?us-ascii?Q?gPo0c9aBBLti+OrRgbc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa87ff31-9c55-4f33-a62a-08dcc874ea74
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 21:52:45.5847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kKjTosemqM+SerEGD2mHzXDvjSSsgep4gMhcoUuLc+r39iaz0bmJXkefJj4WPjQMC9Bf/wn2nla1UI9PDrDY/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10362

On Thu, Aug 29, 2024 at 11:51:04AM -0700, Dmitry Torokhov wrote:
> Switch to using devm_clk_get_optional_enabled() helper instead of
> acquiring the clock with devm_clk_get_optional(), enabling it, and
> defining and installing a custom devm action to call clk_disable().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/input/keyboard/snvs_pwrkey.c | 24 +-----------------------
>  1 file changed, 1 insertion(+), 23 deletions(-)
>
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> index ad8660be0127..f7b5f1e25c80 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -100,11 +100,6 @@ static irqreturn_t imx_snvs_pwrkey_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>
> -static void imx_snvs_pwrkey_disable_clk(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
>  static void imx_snvs_pwrkey_act(void *pdata)
>  {
>  	struct pwrkey_drv_data *pd = pdata;
> @@ -141,28 +136,12 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  		dev_warn(&pdev->dev, "KEY_POWER without setting in dts\n");
>  	}
>
> -	clk = devm_clk_get_optional(&pdev->dev, NULL);
> +	clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
>  	if (IS_ERR(clk)) {
>  		dev_err(&pdev->dev, "Failed to get snvs clock (%pe)\n", clk);
>  		return PTR_ERR(clk);
>  	}
>
> -	error = clk_prepare_enable(clk);
> -	if (error) {
> -		dev_err(&pdev->dev, "Failed to enable snvs clock (%pe)\n",
> -			ERR_PTR(error));
> -		return error;
> -	}
> -
> -	error = devm_add_action_or_reset(&pdev->dev,
> -					 imx_snvs_pwrkey_disable_clk, clk);
> -	if (error) {
> -		dev_err(&pdev->dev,
> -			"Failed to register clock cleanup handler (%pe)\n",
> -			ERR_PTR(error));
> -		return error;
> -	}
> -
>  	pdata->wakeup = of_property_read_bool(np, "wakeup-source");
>
>  	pdata->irq = platform_get_irq(pdev, 0);
> @@ -204,7 +183,6 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	error = devm_request_irq(&pdev->dev, pdata->irq,
>  			       imx_snvs_pwrkey_interrupt,
>  			       0, pdev->name, pdev);
> -
>  	if (error) {
>  		dev_err(&pdev->dev, "interrupt not available.\n");
>  		return error;
> --
> 2.46.0.469.g59c65b2a67-goog
>
>
> --
> Dmitry

