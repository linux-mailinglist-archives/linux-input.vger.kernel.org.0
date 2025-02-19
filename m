Return-Path: <linux-input+bounces-10198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B28EA3C563
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4585219C05FC
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15284209F3F;
	Wed, 19 Feb 2025 16:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="XYh/VsjC"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2080.outbound.protection.outlook.com [40.107.103.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593371FF1DE;
	Wed, 19 Feb 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983327; cv=fail; b=WD+NIAFPPIwjC06zsbOHhqf0KWuyr7OKQ9S7JjFbjeQ3lB/o3NGfsiUwoRo4++kRR0A5lix9FvYevuQhe9bw2Vyx/yZmmF35GdBJHuQakKRj4N/Ax5UwqC3FJdDb5WvVW9rwa+M11L+ZUI1ttpUsE1ViUjIS/qrVJHOdRX6jBsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983327; c=relaxed/simple;
	bh=1yvkT8HjENIetB/rw3UBhKC8VGvGCykTxqmz+6l/C7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Hd3QXeVy9ZidnzSSWYbeYR6L67vA0xr/YmXqUeHFjBGfAR97+5QdG70V3KfsDsDRYB6xpX4g7FSIVf8Pqf1/tgNyorSjBwseXSmotEwSWrmnVit+7txVnXo0TS5DoNcPYcIMPdYTXc0yZG6DQ538ePv+7anbREWiMBMnJForw3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=XYh/VsjC; arc=fail smtp.client-ip=40.107.103.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LBMEJ+YxqCvyuoqxD2vTBe59XI5UeOG6FHKRtD9RNri06SnH9Q90ZDqxDhysE3rBpnqm/iUla+cNz1R8e0XnwuBupV8/n/pt04ifCkwExrdtgNsk9V2UyWdJJx4Ltkam0mJYQUSAWaZCwFhQnrB5A4lpi7wVqdkMHUoOVyula+8mZvdeDnJ7OBtbL+aUw2feEMVI1tXKX5Jn0mDusHtNmgoUh+PMMiJ/cyU3xVmDo7eVxzhViwjWRArSwc0zbaMAtO3pmn5rk3gczBjfMtipAE7PPnLCuM0OCHDjoqzc4p6z6nOgjJEQoOEaV8qZr2XD/Erz7XIlb/rHvo3XkXoGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ONb0TyHRHBZIP8AqklbOZSfQASkdIRav7y/hq/1nck=;
 b=ma7r/6HurREmJu0OTewX+ypL0UOrV3fKv4e5Pd78lKvAnOL+iV5CmZZ4hwMKD/7CuWH4IZPRpKbrwfEIhk/vBAL81N8GMdWQw8Fd2PDet9MC/QuR+Mt4YnGQKCeNjj7iNPYLU9KD10NcU5AxssTqhh/c46DPpdfGx3KNbLmYn66pmtbDcuPvPp671EpnNXKZDyhAGJ8tNgk3UfZpP9iETwLiCzUYrYRoS90YIZCNOxUo3GGaa4MH47Dz2JCblyTdkgaEd6FtAQtcb/rW/wuHzhcscE7mWnr2bRDzDF1NWbzJWVQ1DT/vbA1HCs5I/c+2EznGsR+GtldCq3hgmovEcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ONb0TyHRHBZIP8AqklbOZSfQASkdIRav7y/hq/1nck=;
 b=XYh/VsjCrcMWVW2iA/5XOPE77yh/+Ei72iAEvx5b4iPjVYJ9Y43/gMLEdCzHlnzmmq+aYmIZZuAluT7HvjyFpxcSoxL54Tt3KKklMek0RP9qf3m/h5mwJbsp+/T3iUqnX6k7+uEeLg0TGUOsVimhNWLyc3WUyJyJknDE+/JXV1ngGR0/bABLJCYp1aXhUGQDu+3z+TCFHITuXXg2u1JZZGODYSbRhkLV5sITVcf0vf2Oadh5yDX2GkKrvnkjdbhcFrsdc8S7nAbHMS4TrFGgttoyJwgXlBmV0/rJpyjxH4IiLBOZybbK6gXIHhEsnJdp4N2xIVu/6UmgItbK3FgnpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by DB9PR03MB7385.eurprd03.prod.outlook.com (2603:10a6:10:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 16:42:02 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:42:02 +0000
Date: Wed, 19 Feb 2025 17:42:00 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/7] dt-bindings: input: matrix_keypad - add missing
 property
Message-ID: <Z7YJ2ENZ04Nktnwf@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-5-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-5-markus.burri@mt.com>
X-ClientProxiedBy: MI1P293CA0019.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::16) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|DB9PR03MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 031c3836-c399-4249-2b54-08dd5104560c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4qrpfcNYbiVkF0gjRUcgxu6S72ieb2VFmDzv0sX9h7KTLCnyh3vJ0ySJv+Kv?=
 =?us-ascii?Q?L83RT2pP8stUKpidGvHm3fA5TlZNVjz4JksSTuzzNpRervyz+wn67ITVlieB?=
 =?us-ascii?Q?t6Jc1QdHBny2B/E9/jGvyhR33uY5+/rdGIXHBiWi6iEdQLaWxolTItCLSTUj?=
 =?us-ascii?Q?zU0Qlt/wfz87FjJuUiytP7z4HjmHyEfPIXUVH4oVolz1/hh/axTynG0QuR74?=
 =?us-ascii?Q?RkQSO9IBB8jn222cjbG43rAkvT89rbg6EnRK+Ls3Gqd7bHdRoNRacDecn95U?=
 =?us-ascii?Q?8Py+A/GOtZHlWzGFDDnmodpp9HTstHZNpZcfWUmeDbwj6PjCfWZqVxSt8wHA?=
 =?us-ascii?Q?LBqkpEKFBDEQ/7dtHT/vP++ynC5MOg1YVQhGEbTmwxoFi0+FUxl+tiNorAPD?=
 =?us-ascii?Q?ZYg2Cv4qpR0z20eHY0jl0i7rXzy+MxedskFBNsER2eGrI6QQ24rL7TcSvg3C?=
 =?us-ascii?Q?431dkqt48MSdjX1jJEnY78s48T4GK2yAuS7LQq9ReEikZJSum2yY32GC2RzG?=
 =?us-ascii?Q?Svs9udm1Zmuoy4Dszmr0SS+e/hvpSyXsbABNuQ4+YbZIJILKr1KOwvpgSQic?=
 =?us-ascii?Q?yMkeVMDTkSpT3vE5HGG1Nun87wbl6MiVD2g7dmzZbO3nLEzEWNVRUh4YW8r2?=
 =?us-ascii?Q?WBj948DcKaM0Fj5esxjx0XYm8IhvQI/n3z61ahvVU7g47CPqJXLcCd6FDwYx?=
 =?us-ascii?Q?tcA6WANkvF2gn3witirmOLSmncdK4lLf8jdiFZ8DZL5bKipjuyxSZQMYjv37?=
 =?us-ascii?Q?NrF8QlRl5WJ/ZBBXlTQhfz9ymo0u+9HvF3eU08dgniTOi1WhQaF4N/6oYyYK?=
 =?us-ascii?Q?47Yfi9ztobCA/XL5TQP3kCnT93QgsLnZQZO+T5L+K4XYMSpjxacN3N0C/iPf?=
 =?us-ascii?Q?K8ic6nLSN5Dd+1wrxEvM8+R1MkIIudB6joPV7CuQhmpB1GW+agj2bl/DzB2L?=
 =?us-ascii?Q?o8SLmRXmd5sSXJb77SRsby83yWqy+opCN1kH6GPg25uXBiLIr05RHmN/S3a0?=
 =?us-ascii?Q?uvyir2ugxBshRFYvq/5cmt1BptVsTwsJGFco4Y6Yq6Lpi4r5gpkMVsdh+fsF?=
 =?us-ascii?Q?ldPW5Cm+iK4iLwsoy3qhSIYPCE3NQ+eMwEGovLKknSVJ6H4vZyiiZcfFrUGV?=
 =?us-ascii?Q?2Cc8xgj6HU0zHEkqfILQPAz5xNBWi3uQbwFdLkYhiSHvh5dYCm58NoNUgQGY?=
 =?us-ascii?Q?N0YQN+S2aOg2cS8rxelqD4fgNCs+uFPhHv8ZHN6PRvzRCzaWHzmFnN+Z4iRI?=
 =?us-ascii?Q?jzdvawbsIgb/tao3noxJzxiqEFE4HeY4k76RWUX5D7ONA31asbdF9cIKVpxI?=
 =?us-ascii?Q?JzUw2a4bPnj0XgmFNJs0GEmXPiGixUwwz6jti4l/ecAg8Dw3fnFTgcHOxUUm?=
 =?us-ascii?Q?VXWtErn3wjvLBbPUmtZWU7AjWVL2RimB6tcV/8iUjd1N62J0pe8Jjs1ddzED?=
 =?us-ascii?Q?T0q3NJyLPwFhpFJtQGFqri2b6FYZzBrC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g5lBJBGNUOQquxQF+l3r1XT0saXJdrd2jcluCy2/Otm47xmwhBa/N1g29Mx/?=
 =?us-ascii?Q?AAsFEXLbp68p4WiNDd1qZ8V4YVeSGn+drth+hGrh0xsO0vDNtsWEGJx8Vc/S?=
 =?us-ascii?Q?RbRl3b0hJNR5/10QagxQK+rx7AJds876cHPsjTu0MHq4kZ0qm15XlAzEAXnI?=
 =?us-ascii?Q?jyBO0UXAcWlJCT0uGe+Jq3i69kJu2U/CF/UcAJPZpvcH/fldKRm8qW8GMrbO?=
 =?us-ascii?Q?l0N+o4Hx2P53qUoy82IlgpMczwOV0rETPELP4AuXsXmhYt5LVqJtFC5QDrry?=
 =?us-ascii?Q?Jwxwev83dxxRbaUssWlo887dO91VzXb66n5ntbnQsc3l0u/NDd3FqehwFrUD?=
 =?us-ascii?Q?VXtyCkjmdztwBe90JjF1B6rdDBy0uVnrISQm5u1DNPFUN0fCcOd4lFZcvnoH?=
 =?us-ascii?Q?svqU1eMnpz//tSBmRjeiH0l2RZ4K60WAyD/yZlSQPfirYKqaCQOsjo6zXh2O?=
 =?us-ascii?Q?4tEEsK1N477N/wFsd9r+u9ZOS5dJNBaqMW0+R9IothD91Ln2Jfxxaev2Nvb1?=
 =?us-ascii?Q?jVWlUS6XOZnAlv7aN/L2LKbGLTYMpZnfSaaNhG0j20D1Lj76HmwklY4xQQvG?=
 =?us-ascii?Q?1i1jdXTK2XKjJ/yng/GXYrxjjjPLmAwlIWwSdsUZePxDy9Qi8BN8fVfOUzre?=
 =?us-ascii?Q?0PSu2AsmIkvc4tOmklY2utHQYLDb1n9JwZdPQzylNm5gQjz9jGbiEa142bR4?=
 =?us-ascii?Q?2QXwtnYX1XuzS0cs7kr8voTT2HLt+XqXF83KY0ql/lmHfjA/sAwKdvPx97bY?=
 =?us-ascii?Q?9F8Hge4JqTFaldX/xFZLT+zbrRFpMdQMRBLvhP9yrdIHboUXprMDonH+tbcu?=
 =?us-ascii?Q?oFt7LsKDNjsaNCsieYfuZjplDZxUm7ymOm4+kD5vGALT4cghtoY0vD8ahRgV?=
 =?us-ascii?Q?TeOyMwcTpEuwIQdIuPhXfvgkgUWNV/8EwPUoYHKiA1188kWI9nFt6khtQg8I?=
 =?us-ascii?Q?DN7pPSm96ONwmBB1okqq9/LIA3NnJmwkC4xmSU337czouv1ExZaw5ps/uYMt?=
 =?us-ascii?Q?85m239cHCI0OcR2d8JZP6WAXvXXacOr5uv0207Y9Ec40s5t17gP0cxWx+OC0?=
 =?us-ascii?Q?w3XHj733ystCjmjTupOAcDgSeqGzpZLAVd/dmrC000qkCJHxUfYJXpqhMQkf?=
 =?us-ascii?Q?XJ9m1zQ1WcyjbiUuy/chwvPnl09q1jFoEiNLBSRTXJCu6ItDksQMvHGQ6V4d?=
 =?us-ascii?Q?t3IZt7R7kvQMZ9r2S59P/Dmmx70XnDTH1wTsVgFKOMNgQJ052K+1QCss4Jyg?=
 =?us-ascii?Q?eeVPM5pmVxoBO0FU0972Q7q2HYtSFtM2wDsu1gnQij5hY2NcrZOtYV4kaXGl?=
 =?us-ascii?Q?o6zy9lLXJtKTuXtWlvcZZXL/9CcmhCpvgR6dA/JJNS34f9SOgQeW2N/Foqn5?=
 =?us-ascii?Q?Ds05a2iNgGc4aTTNoMBlgTIW8EKZlpZOWPYKtGDHIZ433PptFAOpUwPhgYey?=
 =?us-ascii?Q?Lepjbwp4y2kR4jNFXk20lWY0Xhwxc3qJ4Oy26oqoTzM2QRaoD5mlcDDateHt?=
 =?us-ascii?Q?Ym0ps6maYMdCqngXiYjrucDUH+9x3fYtU0ft/20WVnMRFDSKtPE+ErCXHprv?=
 =?us-ascii?Q?EErj6lb2cdJc+6vtFukq2uSehUrtKvqX2Hhougmo?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031c3836-c399-4249-2b54-08dd5104560c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:42:02.2756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AK0tAu34kFQUYg2V+BQBpM8UysdupQCRGb0AOdCSCOesCDALGiCLSjyHzqeIJlP1Us7OPON3LIX0MiFWzMmZKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7385

On Fri, Jan 10, 2025 at 06:49:03AM +0100, Markus Burri wrote:
> The property is implemented in the driver but not described in dt-bindings.
> Add missing property 'gpio-activelow' to DT schema.
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 0f348b9..9c91224 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -40,6 +40,12 @@ properties:
>      type: boolean
>      description: Do not enable autorepeat feature.
>  
> +  gpio-activelow:
> +    type: boolean
> +    deprecated: true
> +    description:
> +      The GPIOs are low active (deprecated).
> +      Use the GPIO-flags in gpio controller instead of this property.
>  
>    debounce-delay-ms:
>      description: Debounce interval in milliseconds.
> -- 
> 2.39.5
> 

