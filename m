Return-Path: <linux-input+bounces-10756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE6BA5F433
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 13:22:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2B8B3A8E7E
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 12:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6C0266F0B;
	Thu, 13 Mar 2025 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="p3UqI9Ol"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2052.outbound.protection.outlook.com [40.107.100.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D01F3B94;
	Thu, 13 Mar 2025 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868532; cv=fail; b=rABtH9uGnzLcmhRX/PmTIojz1OP7DEJsWmLTrDN43d4XDI279E9bQ1cE5iTnii+5LVSVtyWYB2AbTtSi0qzgVBGjx31/uuFhghNPvhamsCdP6F/fWFtTxz5CzTFec9nuz3X8J0NxcOTPuG5ojG9wbMtKJ2pG8BwoMtgeVlHx4UA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868532; c=relaxed/simple;
	bh=It9TSTvVG+jmeLqtUZnTM/zAOc7smiQsXZTXKU6KnRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YGQxtdSmdl9+56Q+zQz67n/4Xjjyavbmcpbpj2T+/6jgm5nSzoIvjBB8LrMbG+1UJqR+HpQCMwMZiT8AAbXtqXjCsua1ToOfoSdyAZ2tL8xNd87jzpWc26JzR3Ss/zG8NIkiOF6lOZ0AfsJXl0Fyri7oc6V8/dCjyIgq6YSDUt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=p3UqI9Ol; arc=fail smtp.client-ip=40.107.100.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=foelEtSqD2YZz43FdT+phWBW8caxRQXXs8wSuTeP84G3Bjav5QTk89wU5eg/vsB0H6ti+bAONU3g6Apme4MED75l1LXzT59jGumKH66tKAsi/HCjl8TjiVXMtkYs3n8nW+7IBNdyBSor0FIzexTEjPhIwAWv/Rda/pgnMfX1z7hrhgugw5Clog18DABi3FGhlz4gGhtEuSmJoujdnPhmK+zNVr8uW6JTRhWK+mAPtSOUQBLCC7yDIdWjUzbbc61uTdLaznLUe7Ttw81osP8ctYr1jmeGfkEcFmtcTDmwYFWthUBX+iqIcwXmof5ePqyS3tlgG4Zt/Z5NPzrFTaSfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2U8c4HcGbPrBMsg3vLvBJgynwmqmpK1g9HcO6wt1Ru0=;
 b=gjPDWWmzYAPs9HB7jZNDYMgi2YldlTcuBOl7LqkPvd7rjEWthM1GLODSY0eNltzqlisGL+DLA/LG8VQfQwYPSLspRX/2xrx2qFouVU2gThQLFiLjBEUIfebGkv/hOVAvFOBTfnjeGet8U4+5rbQm4WQ2me5mVeHXTKDCDwj5/MebVNGrPN4QiyWYkADevYgCDKaETwwM42TqcIwL44PKqaQ8RnDsuemh3d2cl0AVeHrDDd3S+sVaQugs44uUO3HXLBqgQDAx+n9TQ4N6pDcmcHs3nSFt8spKQxO9Fw5K+LIZIgZOgNZdLUzXyRW5grSTUMy6yZlvE/S8V32PSrGm9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2U8c4HcGbPrBMsg3vLvBJgynwmqmpK1g9HcO6wt1Ru0=;
 b=p3UqI9Olmeu1Z4UkxBVvneIT7k9dumCjfZWDR7cZKnjvEWdZtB3ryn97DZXJizWYR+t80ygbg7O2wduzuhe+mnz3S9IWyCWJ5vogsj3Avn2drgNfqxQzCDXJf+layKRLdIoeSj+OkB15gtWfByfoa40immvSVHYrh1q4S9i3BMk00ycDP/FNec6b91rWtk+IiyVG//wJl83/LBY2aOmRMLOQn5bcxi9Bk+mQ+Ok4M+JVZyDhvNOWI/ugqBaplejELg34lPlTJo6BH/BkaOvweXxgX4KyS9vajaYDgMsRyJyG9N64hgq69UxWr/NMwGyHPvAFbG5J1PTvc3U8HEsjNw==
Received: from MN2PR05CA0043.namprd05.prod.outlook.com (2603:10b6:208:236::12)
 by LV8PR22MB5570.namprd22.prod.outlook.com (2603:10b6:408:231::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Thu, 13 Mar
 2025 12:22:07 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:208:236:cafe::ed) by MN2PR05CA0043.outlook.office365.com
 (2603:10b6:208:236::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.27 via Frontend Transport; Thu,
 13 Mar 2025 12:22:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 12:22:06 +0000
Received: from 782be41d2a0d (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with SMTP id C5536AD4D0;
	Thu, 13 Mar 2025 14:22:03 +0200 (EET)
Date: Thu, 13 Mar 2025 14:22:03 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, ian.ray@gehealthcare.com
Subject: Re: [PATCH 2/2] Input: snvs_pwrkey - add configurable force shutdown
 time
Message-ID: <Z9LN63R1IhMDieP7@782be41d2a0d>
References: <20250313114453.702-1-ian.ray@gehealthcare.com>
 <20250313114453.702-3-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313114453.702-3-ian.ray@gehealthcare.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|LV8PR22MB5570:EE_
X-MS-Office365-Filtering-Correlation-Id: c982a2cf-57e0-43eb-4bdf-08dd6229ab6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r6Cw3onfqwnBo0uK2CIHmM+6GHOKX/5YP688Kx+V3ucrZX3CfXe7rZcwie9K?=
 =?us-ascii?Q?orqUMUN+eF/jvm191JBwrFyYT9SI3j2vDBCWXxjr5JvL2ZYtKANwKgdcHAJJ?=
 =?us-ascii?Q?p6sy0JEvHm8tQ/sa6oV1NnXUZB90BoPFh4c+tua7/VJuopRxnLAlzjosU7PO?=
 =?us-ascii?Q?1cdG/m9XAkjZsi7EbD528SeLl93DAujsr2LQWjZkis/pnAmVwV+hv9bvEw5A?=
 =?us-ascii?Q?pZplPQcc7WS+JuUgRjjafjVubjU02p8SsA1vRXAeLmYYe0eVcH0CDmaUoNnl?=
 =?us-ascii?Q?tP/kOVuZOqWZbRECIBG/bpGgYzKK7SRWQMtx6ENt5rxxRQKXoqJURKbunglV?=
 =?us-ascii?Q?6oRbBtC6BxxUcW1oRjUgTH6lrLHkCADdl6RztYxuZ0mjo4R86r3QV7aFDQDV?=
 =?us-ascii?Q?Uw3lVa9alO8ZquRYEeRSmiX4YRn7BrhhumnLdTQUimAjp2RUgoGQhnqebgnI?=
 =?us-ascii?Q?PSSVCBHl8SNS14BW7tOBzQu/yB6TkQGVWmIN74DMUoVHDc7M4VqzUp2qvaN1?=
 =?us-ascii?Q?CbTGYFxcjCCXcOk4nHoPMonZs0e4q9HebDRIS/TaITAO8uX5jtAI/81VmSxs?=
 =?us-ascii?Q?JXms0JOvMjQuJnksx8jB4xXHaCkcS+x3n4RtOS3wyMJeckQy/jPKHzM63mTS?=
 =?us-ascii?Q?UY6gPu3siK+0CJqCWrsq2lPVBYLZhwLuPpWiPfT+IyP6kGvoIrdAw5C0l0hb?=
 =?us-ascii?Q?S2vPSjKpyVaGUuuIqAMDxslEMnZ9jPzh9mI6sBPmYNVYr9lfN22l3QAWQ0jk?=
 =?us-ascii?Q?vKqDcXlJsv2NC4AH7EM7D5BwWvxpTPi8uGq674hZS4gcc5/RvTIvC4BwwoL7?=
 =?us-ascii?Q?8+9ylBp9XmvbaukgwqP4bPZXNqDNGzzL+jLekJoA4AA6oFe5BOJz4oudiLdQ?=
 =?us-ascii?Q?eSn6JQDS9lbgO+QP2dne1qVKgVOvfLV2wGIMbvF1YiyJtiuq/+1I5QxHEgp+?=
 =?us-ascii?Q?zlpq3vqNHzuCmTsD9GxEdIxSwCD8qHZy8yiroJERRkQQBfNLepib/fkB/CO8?=
 =?us-ascii?Q?Uq1irg3JNagtEUgGjHAWk4gXYkSi1oGwmkIKSbpHJgBS+nrp9W6ZpMm6td3O?=
 =?us-ascii?Q?eCC64uTp523+yflcWepic1021CxnAQZO2tuQcblboa3fZNypTqweJfFxJjKf?=
 =?us-ascii?Q?1my/ViBp6xCzmzadLPpiUNEcPHeYvpqZ+pPlsJZyO1sVkRBd2NKTsvQinfN7?=
 =?us-ascii?Q?fwq47DXWNVwCXvZ+aRKoTIBUqOfYQAU4+XXkU/EQhx9ZyRNkwzRg2C7tFgxQ?=
 =?us-ascii?Q?JglmmLl5+gD/stN7h5M9ZX5aA2yL0d53gYrf4Cm5xJpCVhkic5iFwuQFCB/J?=
 =?us-ascii?Q?i8K9jHjcqZUyxYXUKi9L7MnTvpZ6Q20zjqxYVTo94T2fZjiYdktFv/w6yELN?=
 =?us-ascii?Q?U0MjuBeGF4HVB8OBFjZrwTJzIZUsxMa2/gX9mhR799TW+zXE+aZSLMY0XM9K?=
 =?us-ascii?Q?WPpySxG6+2X9wf2wtcnDVHWBvFOSDjKeaZtApqwtgFWbmBz+FtJxjw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:22:06.2041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c982a2cf-57e0-43eb-4bdf-08dd6229ab6e
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR22MB5570

On Thu, Mar 13, 2025 at 01:44:53PM +0200, Ian Ray wrote:
> Support configurable shutdown period using a new, optional, device tree
> property.
> 
> The force shutdown time is configured in LPCR[17:16] BTN_PRESS_TIME:
> 
>  * b00:  5 seconds (SoC default)
>  * b01: 10 seconds
>  * b10: 15 seconds
>  * b11: PMIC is not disabled
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> ---
>  .../arm64/boot/dts/freescale/imx8mp-ppdv2.dts |  4 ++++
>  drivers/input/keyboard/snvs_pwrkey.c          | 24 +++++++++++++++++++
>  2 files changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts
> index 7cc427f23e59..921eda35154a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts
> @@ -699,6 +699,10 @@ &pinctrl_usdhc2_200mhz {
>  		<MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0x106>;
>  };
>  
> +&snvs_pwrkey {
> +	force-shutdown-time = <0>;
> +};
> +

Sorry, please disregard this hunk which was accidentally included.
(Should I send a V2?)


>  &usdhc2 {
>  	/delete-property/ cd-gpios;
>  	/delete-property/ wp-gpios;
> diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
> index f7b5f1e25c80..2ba848df061c 100644
> --- a/drivers/input/keyboard/snvs_pwrkey.c
> +++ b/drivers/input/keyboard/snvs_pwrkey.c
> @@ -27,7 +27,10 @@
>  #define SNVS_HPSR_BTN		BIT(6)
>  #define SNVS_LPSR_SPO		BIT(18)
>  #define SNVS_LPCR_DEP_EN	BIT(5)
> +#define SNVS_LPCR_BPT_SHIFT	16
> +#define SNVS_LPCR_BPT_MASK	(3 << SNVS_LPCR_BPT_SHIFT)
>  
> +#define FORCE_SHUTDOWN_TIME	5	/* LPCR 17:16 default */
>  #define DEBOUNCE_TIME		30
>  #define REPEAT_INTERVAL		60
>  
> @@ -114,6 +117,8 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	struct device_node *np;
>  	struct clk *clk;
>  	int error;
> +	int force_shutdown_time;
> +	int bpt;
>  	u32 vid;
>  
>  	/* Get SNVS register Page */
> @@ -148,11 +153,30 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
>  	if (pdata->irq < 0)
>  		return -EINVAL;
>  
> +	force_shutdown_time = FORCE_SHUTDOWN_TIME;
> +	of_property_read_u32(np, "force-shutdown-time", &force_shutdown_time);
> +	switch (force_shutdown_time) {
> +		case 0:
> +			/* Disable long-press detection. */
> +			bpt = 0x3;
> +			break;
> +		case 5:
> +		case 10:
> +		case 15:
> +			bpt = (force_shutdown_time / 5) - 1;
> +			break;
> +		default:
> +			dev_err(&pdev->dev, "Invalid force-shutdown-time %d\n", force_shutdown_time);
> +			return -EINVAL;
> +	}
> +
>  	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
>  	pdata->minor_rev = vid & 0xff;
>  
>  	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
>  
> +	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_BPT_MASK, bpt << SNVS_LPCR_BPT_SHIFT);
> +
>  	/* clear the unexpected interrupt before driver ready */
>  	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
>  
> -- 
> 2.39.5

