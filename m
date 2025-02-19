Return-Path: <linux-input+bounces-10199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97262A3C557
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:44:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AF9D3AEA82
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4879D1FECB1;
	Wed, 19 Feb 2025 16:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="jrd3lqtA"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2087.outbound.protection.outlook.com [40.107.105.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928A91FECB8;
	Wed, 19 Feb 2025 16:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983361; cv=fail; b=LCSwNpmghreQ5/Ka/xXXsokxWwzRQLDiG4W6aWGFabIpQED0N1DFacSLQ5xdR0b0lEvk5p1lP1DMlFTN4+GJA5rx8r5OyxHsDajVwigYAjDuiarsyy5K43jTwEyluUU7MlHUkr0rFT12SxYsSIWl+a7ivzcFj/Q3rTVTkSp/y8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983361; c=relaxed/simple;
	bh=5mDpAin945sL7WmzZ//FBpnaD96dvRN7YfhCU+foBUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=g7JVNpXK86phEwOkiXullcVBds+xG1/Zc09ej5Nsqgce9ZeZvq4OMkhqguJXhWHag8KsTKYYe1hfa5cOiyv6nElNqYIv6MilYvmtdg4lMhjmfHhce13zNhIgKvIq0jtLkbGtNrgLEwg49oGl8E2UNWgzqELGczRANaVlt/ZTVUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=jrd3lqtA; arc=fail smtp.client-ip=40.107.105.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtRtaR4YaJnYFJVtGJh5KeEIiXT11pWoukzFA47NdouzokQrkr/AvoBsgul4xT9Sgr81u4nrXgoV93LNTuF8YcxyL0UNLMJemVsOUTEvgWIDTAi4NyggizK5bdSyEOfsC7doTOja1G23GsRaSO2om/4s9kuaA/c9i5L9ZWy+sLIpTIvJ9Lbjm30tvyOmb0uwe6lWPKisfiS1dK8qWB9duCl3/axE4X4FEz4Jn8Y6gVvd6jUGRhPPd5XAJWtnmpxmD6ITah/LqK7AEcy5wDj9Z1alwt2K2hFGynscTXCicN3bAhu76mWLfzJAN6SeRtw/Q1QxGk6D8niFuctkteiQLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQrv+kkv3aiLyglFkuTAaR95OZGJgHQOkHaQ36jchKE=;
 b=kHZXJiVJjGmUwb+9MUY4HPhWNfRZH/9fgpXW5sODPfPuQ0nrRShqLh7oqDegmD/LlfBZMlDzurWz/v9aYOB13O4e7ia3TyyucVbDmYIK7aDLERO9u0m/XyKRZQPVzgjFu2qZO/WFOtiJ8exSurJcQS8INggfxnFgz3KbFQ8+w6m9Cry0wBHtvjabdnNXthUois2fT7F6q0VCRdTiav1TVkh5UlQd6TMdO+/Gd36M6l3k/AT6cLHl/ptrdrRpUBgZhUfxDfwbT6RUX1mPwG9OJyTaRC3hZwWQiJd75xZE87de0g2twmZSxnVrk1i9XDZRUbmN0d7QCrFm0eavKQ52PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQrv+kkv3aiLyglFkuTAaR95OZGJgHQOkHaQ36jchKE=;
 b=jrd3lqtA5X+rzlB5OQ6VPiMhJ13Qbuth3A01sbQ3cAjglUijHnP+OtRn3RAr4eyi+T68ijKPBTfHbrkv4311oIKXtfHTRBtrC+Bc6wg0ppPg4XIONqG/7SQB5BYJMPvIhpoZbFwip6FSd8EbANXp5r2RIu1L1NYO2cXN2g1fgnMnE5WOKcH8aAJc1K+AnKFwF/AyhiKaM1lL1JQnDQ8eC3Wzb16jQBw0PEy+JqOECqIOTNa3erecx3HRIJscxI39UQidPTcJ4uicbyzqsrp2BN5T47JdGCV60eMMoL6YMeT8zkc79GjeaU0bY1SxTjcN+4TYJ/apSBWFNuFgNzWVBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by DB9PR03MB7385.eurprd03.prod.outlook.com (2603:10a6:10:222::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Wed, 19 Feb
 2025 16:42:36 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:42:36 +0000
Date: Wed, 19 Feb 2025 17:42:34 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/7] dt-bindings: input: matrix_keypad - add settle
 time after enable all columns
Message-ID: <Z7YJ-uYT-Ffb67bM@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-6-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-6-markus.burri@mt.com>
X-ClientProxiedBy: MI1P293CA0002.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::9)
 To AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|DB9PR03MB7385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d22ef71-6c8f-4eac-b7aa-08dd51046a7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MIUKlsAQrP39CIkrDZUqV4jnaB5kWDNFSjGrQlnQbgD3IpzhlS7fcOfBlTUD?=
 =?us-ascii?Q?Wy2gqz/X0JPrZKTbTHP4DUSQwzzOBZcWZFXDrTqPeeo8Sfakl/bZlhwR9qgY?=
 =?us-ascii?Q?39nvgSdQAKwy334NPDY9mo+ToN1LQzYHExU+yvkHIk707P8WhHxy0MZHuN/C?=
 =?us-ascii?Q?OeMk68oPQaplys+lYwgjaecAir1fPOV8NkZfwR4QxgAN58EL6G0WGU76Ikcg?=
 =?us-ascii?Q?XGr6lBMFh2TuPx2o9WsW0J5Ugqf/8U7mVsFUZ7IfsgFuRQJd1lz+yOz5qOrC?=
 =?us-ascii?Q?YeZZkjNXSeXYjpyqoD1/eo7RWHxpW2DTKanXA/hHjJ4IprM1FwIZPbdgdRh5?=
 =?us-ascii?Q?uBJSnV9Qs8Ihe45yHWVSypyKcsA3F1g+Ef2mQlkt8oOsddW1/TTLaCRkEu4C?=
 =?us-ascii?Q?nUb0OWZ/y3aNnnUMEhafcywd1a7aujCBwE1uLC9s5GuXIOJURB7hqOBKAv5r?=
 =?us-ascii?Q?atcBufocy6EfcXr/nO/rClDqbLELRofpO7GB47myen2oN42pF6uFrIq8a67g?=
 =?us-ascii?Q?7epFuM5KWbBbVBZn/H3KdLbNojDeqgI1CF8dw0dfrlANenas059i/IF+66ox?=
 =?us-ascii?Q?QJD26yUnjaDxM31XU6r1XgJ+U5PohrRsYgpY4mQH4EZPIcsf4yt37PPdf9Ae?=
 =?us-ascii?Q?b/DCIyzJ5upXaCI1np0K+ZNomGKt14wlJTBsbE6k64pE2+Yg2DzIse4p1BzB?=
 =?us-ascii?Q?pyTpJs8GA8zjyg8tNI5UVNbqMpy1sph3/GDwYf7aeoQjdzMqSVqmkicAtG0w?=
 =?us-ascii?Q?8bUbe24xkGRhVGHz5Uujj+fUpSGEvS7Smn+2E2BFwxErcr9ZSBEKHy07IwZK?=
 =?us-ascii?Q?U510PBEtylvkA36JQWlcGOXzDiXtcx1JJdiyr8pdYGOmH7jzWUy9RsiccEyV?=
 =?us-ascii?Q?rzjY9X5+1cWp1oCBqcQryLbACEx9FAI5t5ZhXgZE/oUt6RUlYq33k/PnuAVj?=
 =?us-ascii?Q?rbv0L2A/AEOmo+94slAJigth7EPLo8/qPBWwNTJwNCM16roEgY7leL4ArH9D?=
 =?us-ascii?Q?i2riR7kPmX1gY1VpvkvfwnFaCcQwrRseXNVYS7lNMlT4y/UnkZmmunU3/47j?=
 =?us-ascii?Q?GCxoz5tnkbTXmgMXsUtgHhr0eiG9c3ZdH8p+MUjsnkp+4vrW4TWfNeddtfuA?=
 =?us-ascii?Q?afTHeWkPJJ9B0mKIoa5ZR3y4boQ80ohtI84RE31JRhfNje+TzcEQDgl9FxYz?=
 =?us-ascii?Q?k8yUt6qtaPW90E6YX2f2ClkX0GlxUeVSQXLtHp2EljOylr5irfYhCxXMMbb9?=
 =?us-ascii?Q?GX5KpCwcLMRknmewY+h23ldNmKL6WPHd3pnLs7UaxKVXT0wPvYz6vZWEPsRv?=
 =?us-ascii?Q?pTyxOz8aNNN2KdAMPGDyHgbelvh7wrsUPinq/FW5CnChSctkt4Br6/qZTwyg?=
 =?us-ascii?Q?/F/vcv3+VgNpxa0GkDaZh+qcfBNXG4g3hX8jPXsGwsTM9ar4osa3zx5nVR89?=
 =?us-ascii?Q?hxS+H7vTy3yQMo9oRX+4wf1Lqf5ynYj+?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LAVsmkOSVwBXm++Fei64grZ8bw23OAGVQXuRTIl7IduVvqGTZ2ljuEC1ss5P?=
 =?us-ascii?Q?SpAX2Ubx7CxEMxlUgwZafsMiNwFhw20vuLWqLHDQg+HyVpPbGoNy2H15D7w0?=
 =?us-ascii?Q?5MWEOGXuCZ5fK9qMbHEWoqyLSZRy/416RHRqKLfOG1vNUbxvo0azKFyAZiOZ?=
 =?us-ascii?Q?UiEkTfxiOat8O251xpu/NgjS7uQbAwBr07MmDY0axVNw/yxyZmC/wU2I36fc?=
 =?us-ascii?Q?ovoge1r74q7I3buZcfh00rcXfYB7UNJKHfy2RSXYMug52u0wZmYhGj0TUP4Z?=
 =?us-ascii?Q?TsgMglR6VeFhbha3DU/TflUXRamRzqcuBaUXfmjyVg/7PfJxKY1NlLZHF1XB?=
 =?us-ascii?Q?zGtibcwegspJgsVXf6YYXYcv6PLGkgUUbGB2kbCG7W2gKew90NPqCGaFUFt2?=
 =?us-ascii?Q?IJT9aovA6YfO8KDMnadIsk9rIVGU64l52+kvZMb02G7RkRIcXrdRz81zAWb2?=
 =?us-ascii?Q?cc2kCu0pAzN2mJby+77ikvPeiA/989yBz1s/ADwKuP384nEsgvuGXhpbcuQk?=
 =?us-ascii?Q?XgD3M9Ko+j/dRZxBXlPkvXiqOWIbOowQrX5SJsN7D5sLle1pB6BGXj4gbPOr?=
 =?us-ascii?Q?1gwcW5j8RsIPGieLNGuivIf5CLPqIsmIKF795SWHBvA0C2zBKlT4A55Q0xXy?=
 =?us-ascii?Q?IsGsOSdL5cbh1ZKMjlxkQFZURpdDKvqLWiF3Op7bFOkTAYzPcfWD0bEpQeFQ?=
 =?us-ascii?Q?Wef/IRc2Pru+Pn8/FwqtZTGrrFUmd5qIHrJD1fwODVE4RM0Z44cRFWOBrs7F?=
 =?us-ascii?Q?yeF8yyHtZbJLMdekTPDfN85Z4Et36HGeXs6BpBDCKZ/QvQqMOqBfMUEAyRum?=
 =?us-ascii?Q?3fibdjmard02+HvEv576KyC2kCsRgIxy3haL4ZAkpwrfs0VLaj6saR3AK9ti?=
 =?us-ascii?Q?UwALY/xAm49UBiujo0SavvYEc56LpNbrKV0H8pXXrHNuoF6vXbDCkxrFEDmf?=
 =?us-ascii?Q?1rdRGq8IveOoqtWV5oiVjS2nLysRRkQ93V1Y5SDIyksvRhD7mo4CUY/Ym9hQ?=
 =?us-ascii?Q?2x+G3++Prn7RgACFEHdF8esHpmw3BJXjNPXa5POg/NhsOeBFUJnsJASjp8uo?=
 =?us-ascii?Q?LCsgp27VlooHBvn7FquQV8gIjyQTMp3pVZCjuPnTTX7xpQuSuRq0xThnY0s6?=
 =?us-ascii?Q?Jdp3XAF08w1F0RwnWS1h6Y4RSYG/15G9Sspvi/9LLlHKV/tfE1vS0QKpfakG?=
 =?us-ascii?Q?RN1sL/dhi5H5cwYWk81oEbgd5/ykP/Iu/CdsE8X9GpFS5DGciKBxBt06tbZL?=
 =?us-ascii?Q?DmzIXpsaBapTOEIUdHqSwvUCo+2TzMKDbIBgHc3MgmiAW6ggMrO3XvW48tP/?=
 =?us-ascii?Q?0u5gODcJOwiaTNP/06kBRcjkJFCbnhSnyXEdfOLmQn8gr46UBqm5yRP1DW+V?=
 =?us-ascii?Q?h0R6pAOxgfgLtkv/qW8nS4PJ6Fnx9/e1hKrVtl9qXAYnIi9HqPNd3ZgqpI8Q?=
 =?us-ascii?Q?DYrL26hWcvkTOjB47w7Ogh2zmSa1cvEH9RnI/cTd/jeAkP+f+3TYpfQj9PAr?=
 =?us-ascii?Q?C4JbYL00+S+lSycP6NoSGmpGdWTJKhfLpg6UnC1EAPlpGYXHv0E88T/PcqoC?=
 =?us-ascii?Q?MS46OhRhdICnXnoLdvOu7cXXFLzmLiM3/Wn2+wO3?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d22ef71-6c8f-4eac-b7aa-08dd51046a7f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:42:36.6026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/T7JKdXBM6LCcSZmJk0hBdQD4W0mTDid/ZUcrw2SwDXhrsIuTFHlnCouZyld3ptap/yvidFxZn1bNhgeKjhyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7385

On Fri, Jan 10, 2025 at 06:49:04AM +0100, Markus Burri wrote:
> Matrix_keypad with high capacity need a longer settle time after enable
> all columns.
> Add optional property to specify the settle time
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Manuel Traut <manuel.traut@mt.com>

> ---
>  .../devicetree/bindings/input/gpio-matrix-keypad.yaml       | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> index 9c91224..dc08d39 100644
> --- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> +++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
> @@ -57,6 +57,12 @@ properties:
>        before we can scan keypad after activating column gpio.
>      default: 0
>  
> +  all-cols-on-delay-us:
> +    description:
> +      Delay, measured in microseconds, that is needed
> +      after activating all column gpios.
> +    default: 0
> +
>    drive-inactive-cols:
>      type: boolean
>      description:
> -- 
> 2.39.5
> 

