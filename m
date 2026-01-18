Return-Path: <linux-input+bounces-17185-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0874AD3985F
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 18:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A0333008D7A
	for <lists+linux-input@lfdr.de>; Sun, 18 Jan 2026 17:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF3423F417;
	Sun, 18 Jan 2026 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CW7GuYAH"
X-Original-To: linux-input@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013043.outbound.protection.outlook.com [52.101.83.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E37222590;
	Sun, 18 Jan 2026 17:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768756761; cv=fail; b=eYOKpberm7nxl1Q+a7PlHCn3bXnQhSEygJkl1yCxVO8IHu8D4MDsSunYTRc0adANrbmkG3IYSUtwzshF2BA5Jg5dx0zlc3167ttImvgH7BXH7rykQ5kHEh4t0dJCR+KaEidgdKIh2XqHcqHpjcjGWlupfQVQnvaYC4o3fJnkvRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768756761; c=relaxed/simple;
	bh=AMuj9nnZn6empO06nnKGumJwDZV+nINZ+YSuZ/iSMLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JNVXDZzlfWrfvNMVJiZorg9vuQU3WgmUPFAWtM/V3IggmQK8a2DfgmQS5ZC5gnMezxPZoB5LyojyuJAyQ17rp2/bJ5ErSHStHVCsmrNfZ0Pcv/lO1+IeotiFx25UAH6lKiJxpzmAfRa3bApYzEqyEDaGAskDpuavNDVLGMp1Ggo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CW7GuYAH; arc=fail smtp.client-ip=52.101.83.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlylaQaz6Rh68oj0VAjUSmlt8yAh7+P7O5HOJ9xf9yzmNI3jHDSDo+p+QVWU6Fl1LunlpaGIgv21eiojbY9ni13zXC6OcXTrQvbT1IQfIka/6xt8ldZ1RK/++lbPX2FQsKNQ7ICoBDIy8CsSuabjQAv13nzfESNSqSmQjUSQORhSPs56Up9aSFVvD6lC4dhdzlDbyG+cYf0jaJ2ul6FaNItwy1qrWn0fYugeVcTZO4gbNSSe2f4oOsZf+FT16l9z4d51Ggbz1Umip3HWg4EGuiZnamjIHElwkzNXGbMz/Br4ogwjC8mDbKf8NjllTzPm0TSfDFOhBdLvOoiokxSR0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Up3G3COTaALHjc3CeXuH2qmhOXeCf5ciagn9zYv/2u8=;
 b=bNgeLxJCtjgWuNoGOqPsioSve0g3n7wY4TBx8Pi906kbslAosI5Tm+x3hIJAK8rjQYa5fr1W+w5C3b3DQ3cOxJBaHIG1PwJVy5JuXeUes6+otSoe89IVBWzZg2/FD9ePY2Ioo/IQ9Ln/vj/N81YsMGaqLdKXaqq54vL/CgALGlsQurVa7Nq6oMPeraFFKoOleu23UZkpy4h7T7Py04xkAagIz7aBCAqFQ162RD+7vba4Wm6wTPeZ6Jw5adgqDcYy/MyWC+ugeCRFWI90x8lMFfuCx9brpQ/VFVTI+ZeIC/daQuCu1lJINacGa3rxasQ1lWvn5YIu2gjbtMHm8wSn4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Up3G3COTaALHjc3CeXuH2qmhOXeCf5ciagn9zYv/2u8=;
 b=CW7GuYAH8ACZ5QmjM3dUjnvl0BzQlT+lGMQ8wXZNCquNmeaZnyyPOka+txpkrTX0CseH5O+1E656Y+r7db9Sl8Q9LCSX3D3ndtwTOgmuY8X6PJg+CsG/FMXbmLhedzhomB6sV6KJHIvTEYPm5WlYGVflpayBRQfeTBjQWvvxM4YlavZ/oa8lMm1EFMJ4hFKnUXNPCSKdkQXLvQWiX9cii0g+L0efXnq1xoPS1BY0RJvDs6ebcKs+U7lbzZxnvpozAtTEdXQ0lP8GT3W/b/u3Flo5Sc92b33uzqBSBDKTEQpTYTHTFKZwQAe/KtfX2EfjKPqGgRYFrzIT8JjtLiv6DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI0PR04MB11644.eurprd04.prod.outlook.com (2603:10a6:800:302::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sun, 18 Jan
 2026 17:19:16 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.006; Sun, 18 Jan 2026
 17:19:16 +0000
Date: Sun, 18 Jan 2026 12:19:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Job Noorman <job@noorman.info>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] Input: ili210x - add support for polling mode
Message-ID: <aW0WDhDRSh34TzW6@lizhi-Precision-Tower-5810>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117001215.59272-3-marek.vasut+renesas@mailbox.org>
X-ClientProxiedBy: SN7PR04CA0051.namprd04.prod.outlook.com
 (2603:10b6:806:120::26) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI0PR04MB11644:EE_
X-MS-Office365-Filtering-Correlation-Id: 5919bc83-4112-493d-7309-08de56b5b539
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|19092799006|38350700014|18082099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l+GAqqkxaomgvI9aeeb9krKDXBIb2LMIiEA//tOhF8AxIARS+hpio1xNbVEK?=
 =?us-ascii?Q?X95WAZz8EAPYVPKotwChBYeThsT+UJim8e/BMbh/vsM6mjolXCchatiiInkw?=
 =?us-ascii?Q?YHtYYLabGmBNKSfI+eC2w4KSo4uumRYIJleT9W89Uu1klUYdjuNRUx/nK6jo?=
 =?us-ascii?Q?WWzJl0aeQTKaThsyZsNBbmtJWszvTRFi8FmMidUKNKrzD1zDp7EKTXUGZf79?=
 =?us-ascii?Q?9BOZbFc6+8++ywTclU/PsEhAX+ZGsQtmWZc7fHCM8L+SOxXs4QAm/A+IaVGC?=
 =?us-ascii?Q?roNGTOuoPZgjnx5I0KIiQY+4l5S3mdKJz+NJwengymnTFMJ0tfo/0NEM/WF2?=
 =?us-ascii?Q?fjg9tHVojlYqhAJcci3ltI3Tr0dtNAJNa+Ft7aW9FFMPh+w7pFzRJctz36iy?=
 =?us-ascii?Q?q3XCDbyEOJBQolFgXwGxe61C2S8J7svhbMNRsrCOT6RWlhfF82kMXyNTHPXm?=
 =?us-ascii?Q?KwzEn+Qc4EsUXvN0UrkHBh48NHXb79LyyiE6i3qRBBwOmO9Xk3mU4/eUUOU3?=
 =?us-ascii?Q?9uCDTKFHq0MwT1R/ab9wEjklnGZz7jejrQYTpLbQbMCTEQ2C82UxYDL1zsIr?=
 =?us-ascii?Q?UTQASE/s1U+mEoaGhdueQKpL3erkbz15Vn+L3wTT+Nj4kz1PHq8X1o/OOhgp?=
 =?us-ascii?Q?UQNiRgvt7ju84cBCN+e6xm85IXjhyGUJWma4bHFoUt+CyxwnsO6v7HMNEWb8?=
 =?us-ascii?Q?KTo3O9XcRXpoEp2uZ1hN4rJFGmpPNwF5R4SCpeWTiFsM+kN+V5wmISpgv2nQ?=
 =?us-ascii?Q?OrUlyKCfFxQ9lKccxW6nQ5kivSoHcEicRgEQ5ELzSc/+bJk9Z8/Ti20ZCAyD?=
 =?us-ascii?Q?EfC2eCvGHwyj7dekX/6SWxLPIJzh8ZZYlRlkp/r26s/aDUhaoezcMs/gzzsL?=
 =?us-ascii?Q?24VCAPr6S2tmOKdYJAjFXUMUq3EdipVwazbyeGpl9AvglK/UOmoGSxJ30SlG?=
 =?us-ascii?Q?TZbld9glfcxCvkdaMpdhImdEWjO2oxs4idWHURFohp8yDsVlErGo2bp6JKex?=
 =?us-ascii?Q?e91n1h/4Nr4cYBkgy9UgtxAwCvGA8WSK/T1K0beH3oLYfNtYBvWM5GQa3/gd?=
 =?us-ascii?Q?JPzO/HzCH8G/8ZnwtvRRJM6+gd+fG9t03JRsMAm4kmYGZzRw3tx+C27pLdvB?=
 =?us-ascii?Q?Kpb34v9o1cZic+ZVdUM5M2eNdXpsfYuo5nie73aYQIdUKluALaf1Xra/u8Y8?=
 =?us-ascii?Q?6RpAUxVYBxvB/iXvvxWLNfUip1pFfsB0GZy3Vl7BRQtDqXNH4OWZmBHJL/ZS?=
 =?us-ascii?Q?Gq8U+9+OyTygLDyZM6Gn1xM3W0YH9E91u79px1oaV7w0+D7CSFbGnaVzxjqt?=
 =?us-ascii?Q?HNSnbhF7d8I+oXQHvfP0ZsAThlTSg4d6C2lB0eU2QsaTsr/Uq8XFa4oDsgXb?=
 =?us-ascii?Q?hTVBMI4/A6+IxDmq8jRoYaEKT9zqmXW/nP5PBm4tooNKhvGTeolOVyja5nm5?=
 =?us-ascii?Q?7PzWzuc2mnihmI5CQsz1+9gcBw08K386VmuN55Tzn+Qj/xsLwKjF0uHfIe2F?=
 =?us-ascii?Q?Hp9wvHnKPhAgH35AtVyB8rzsWrHIcXIdWFMfd7/aZoY9BChqI5xZTr1egYTB?=
 =?us-ascii?Q?jxMFfPsytWP9637eyZY8ovhqKfufBLjryjoaR1EckvwoaF+wIGL+gD0wRczG?=
 =?us-ascii?Q?gUDGIi9y7pVN8BlOCxj1GUs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(19092799006)(38350700014)(18082099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?igVBLpz9mT90ebfGMm7MITseY9fzQhHJgncmycRoBgIZyBpiWg8W+45hfa0f?=
 =?us-ascii?Q?ppKHMEXkw37iheI/JrfcjWAZfdZzJbHxAutJK83yMjR3WXctMXGoDtNaImIC?=
 =?us-ascii?Q?kXF7Sm36U1Nd9fUahTci/Wk9VSFRG2AjTCvcSE98/LaIhL66tnLlIIH3BN7N?=
 =?us-ascii?Q?typWLn9/uMGtFLzh5+zkRv39tjEsHsQkenCIDsj34mCE4+KW+6op97InvZ/0?=
 =?us-ascii?Q?6hG3pFBWpSg++0wSSMGZsmB0bt7iPlZVm7+cj5QW9xjW9hQTkZSgC1x+ioro?=
 =?us-ascii?Q?ixjjQm2/6hIUrubtT0Ch/hcBCtaexB84inkA0seiLmsdw7OiKD1gUCTDao+S?=
 =?us-ascii?Q?0aHFm4aiPVhhfzgLCkST75EsHJQQ0Ctt9bReAyIWO+B1MGDi8F9hhZwRsxKt?=
 =?us-ascii?Q?nUhu6kAPLDkikAKmc9SlQ8ccpMVMiS7S9sBpbA/m+638nZHCRquZpaOyKBzX?=
 =?us-ascii?Q?aFx96JLn984ezRz9/NpXC83Am/c0KYJCIP1fBr/hdKY0R7xChLqakxjgjq1u?=
 =?us-ascii?Q?LCSbzhcDvEyk252hUM4hae/j2czEueXi+2p1utDVLlQDQrrMHzUaJmyPexYF?=
 =?us-ascii?Q?cWNZ2LK+LvvUcYyki7nfJmb0dwWgcDzknVNi0PFX1T+KdP6PoNJshauwVZQf?=
 =?us-ascii?Q?8Iyve43/MYKk+QkdCi2rk1jvGrvMW+uSr/0sK2UXFCL0PO2wVumJKdLuerbA?=
 =?us-ascii?Q?/5gNC87dNVCxQDDeDzlX/7qzil//sUkn2y/5WEAEXSH7LNla1OMZlXEKqokQ?=
 =?us-ascii?Q?SIBNYPcZfILvA23Kw+X8hjlvpNPmIG1EooeIAc/5ZtNxqiOzoqrcb258DBUr?=
 =?us-ascii?Q?ni/1dedJ7JkZipmc3tTesYdRKA90uEwm6rvnOx5F91dI3AjQSbshswnKe6wk?=
 =?us-ascii?Q?xRzKwl4sRcRykSt64XoOfCVyrfHLxWY/SDwMcD3oH72+i8uIzFzAs5TRAFGG?=
 =?us-ascii?Q?e2S50GB8Z/DuYKwmAz/IMbkojEeWPoBEpQj0GhWg8QJ6SJKlnCMKwlA+rzqC?=
 =?us-ascii?Q?Aks/sE98YdZsyS14kjq2g4wKsT/K/oWgvIcVZmR/qGsjCD6mnA+F8jRR1DZu?=
 =?us-ascii?Q?KwlPrNCR86rSSHtJQ8xoWsikINZbatK0yVN9wF2sqS8EqdfwTqi4pFCIvri8?=
 =?us-ascii?Q?6gXa698I0F/36DL3z/umBfmrtBF3AMMbKBglb/GBTH/JXzeMnz1E6cc+NaRx?=
 =?us-ascii?Q?x3QFammX4b2K0dasM2CtJbR9HzvpNALYr37msj83DhV1vL9L+0bIiOD87Mfr?=
 =?us-ascii?Q?Xhae9V0Pt3Ydv6PBx8gjGRYWms0S4DHx4kVRjyMgE4svG6bn4R3D6e36hJlB?=
 =?us-ascii?Q?h9ALuQx4io+c36baZv2COZJaYNQB17GvnGHvvrS7C8E9DtQ53PZ73Lv5nbD2?=
 =?us-ascii?Q?7K2qJLs7blQwyR2EduXTVXoFcbKYreo332q3xqrseFV2pMdkurK936PTBScp?=
 =?us-ascii?Q?lN36a5AbngLyptOcxq+THKJJX+rAscVS8CLpNIUVE7AQxSVMoHOCAaSBp2TB?=
 =?us-ascii?Q?WAD+px0t3l8pb/m2jgTQH+yDQ3WGzxtcF0cGM6HuG6aauu0ZdB6k2uQteBEK?=
 =?us-ascii?Q?oOpoxD9DszVHqBDjtbYqwPaRuNADT3wzvbGpgUiVXTBliceqmSSZcJdpxrPb?=
 =?us-ascii?Q?/Ma1ItwWjBMRL/WXfncHgmEF448YbNnmxf9HuvTnWt+Mm6PXsuFJ8J+Q8XCK?=
 =?us-ascii?Q?c9hCRNygHrh+GvPJgjj/E7X1mPszhkzy81HCLuXCX+Xk37Hv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5919bc83-4112-493d-7309-08de56b5b539
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 17:19:16.3994
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S71jxcg/gl4AAIrfkYXMwspHi9Zm4oWXIF1HvfgPW0ZBzWJlQINQjupJbVqYupicN9pYRKPce2SoANLsOUdd5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11644

On Sat, Jan 17, 2026 at 01:12:04AM +0100, Marek Vasut wrote:
> There are designs incorporating Ilitek ILI2xxx touch controller that
> do not connect interrupt pin, for example Waveshare 13.3" DSI display.
> To support such systems use polling mode for the input device when I2C
> client does not have interrupt assigned to it.
>
> Factor out ili210x_firmware_update_noirq() to allow conditional scoped
> guard around this code. The scoped guard has to be applied only in case
> the IRQ line is connected, and not applied otherwise.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Job Noorman <job@noorman.info>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Test client->irq > 0 for IRQ presence
> V3: - Rebase on dev_err_probe() conversion
>     - Fix if (client->irq > 0) in ili210x_firmware_update_store()
> V4: No change
> ---
>  drivers/input/touchscreen/ili210x.c | 76 +++++++++++++++++++++--------
>  1 file changed, 56 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/input/touchscreen/ili210x.c b/drivers/input/touchscreen/ili210x.c
> index 264eee3e61d0a..22917a5825778 100644
> --- a/drivers/input/touchscreen/ili210x.c
> +++ b/drivers/input/touchscreen/ili210x.c
> @@ -327,9 +327,8 @@ static bool ili210x_report_events(struct ili210x *priv, u8 *touchdata)
>  	return contact;
>  }
>
> -static irqreturn_t ili210x_irq(int irq, void *irq_data)
> +static void ili210x_process_events(struct ili210x *priv)
>  {
> -	struct ili210x *priv = irq_data;
>  	struct i2c_client *client = priv->client;
>  	const struct ili2xxx_chip *chip = priv->chip;
>  	u8 touchdata[ILI210X_DATA_SIZE] = { 0 };
> @@ -356,8 +355,22 @@ static irqreturn_t ili210x_irq(int irq, void *irq_data)
>  				usleep_range(time_delta, time_delta + 1000);
>  		}
>  	} while (!priv->stop && keep_polling);
> +}
> +
> +static irqreturn_t ili210x_irq(int irq, void *irq_data)
> +{
> +	struct ili210x *priv = irq_data;
> +
> +	ili210x_process_events(priv);
>
>  	return IRQ_HANDLED;
> +};
> +
> +static void ili210x_work_i2c_poll(struct input_dev *input)
> +{
> +	struct ili210x *priv = input_get_drvdata(input);
> +
> +	ili210x_process_events(priv);
>  }
>
>  static int ili251x_firmware_update_resolution(struct device *dev)
> @@ -829,12 +842,32 @@ static int ili210x_do_firmware_update(struct ili210x *priv,
>  	return 0;
>  }
>
> +static ssize_t ili210x_firmware_update_noirq(struct device *dev,
> +					     const u8 *fwbuf, u16 ac_end, u16 df_end)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ili210x *priv = i2c_get_clientdata(client);
> +	const char *fwname = ILI251X_FW_FILENAME;
> +	int error;
> +
> +	dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> +
> +	ili210x_hardware_reset(priv->reset_gpio);
> +
> +	error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> +
> +	ili210x_hardware_reset(priv->reset_gpio);
> +
> +	dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> +
> +	return error;
> +}
> +
>  static ssize_t ili210x_firmware_update_store(struct device *dev,
>  					     struct device_attribute *attr,
>  					     const char *buf, size_t count)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
> -	struct ili210x *priv = i2c_get_clientdata(client);
>  	const char *fwname = ILI251X_FW_FILENAME;
>  	u16 ac_end, df_end;
>  	int error;
> @@ -860,16 +893,12 @@ static ssize_t ili210x_firmware_update_store(struct device *dev,
>  	 * the touch controller to disable the IRQs during update, so we have
>  	 * to do it this way here.
>  	 */
> -	scoped_guard(disable_irq, &client->irq) {
> -		dev_dbg(dev, "Firmware update started, firmware=%s\n", fwname);
> -
> -		ili210x_hardware_reset(priv->reset_gpio);
> -
> -		error = ili210x_do_firmware_update(priv, fwbuf, ac_end, df_end);
> -
> -		ili210x_hardware_reset(priv->reset_gpio);
> -
> -		dev_dbg(dev, "Firmware update ended, error=%i\n", error);
> +	if (client->irq > 0) {
> +		scoped_guard(disable_irq, &client->irq) {
> +			error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
> +		}
> +	} else {
> +		error = ili210x_firmware_update_noirq(dev, fwbuf, ac_end, df_end);
>  	}
>
>  	return error ?: count;
> @@ -945,9 +974,6 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>  	if (!chip)
>  		return dev_err_probe(&client->dev, -ENODEV, "unknown device model\n");
>
> -	if (client->irq <= 0)
> -		return dev_err_probe(dev, -EINVAL, "No IRQ!\n");
> -
>  	reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>  	if (IS_ERR(reset_gpio))
>  		return PTR_ERR(reset_gpio);
> @@ -997,10 +1023,20 @@ static int ili210x_i2c_probe(struct i2c_client *client)
>  	if (error)
>  		return dev_err_probe(dev, error, "Unable to set up slots\n");
>
> -	error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> -					  IRQF_ONESHOT, client->name, priv);
> -	if (error)
> -		return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
> +	input_set_drvdata(input, priv);
> +
> +	if (client->irq > 0) {
> +		error = devm_request_threaded_irq(dev, client->irq, NULL, ili210x_irq,
> +						  IRQF_ONESHOT, client->name, priv);
> +		if (error)
> +			return dev_err_probe(dev, error, "Unable to request touchscreen IRQ\n");
> +	} else {
> +		error = input_setup_polling(input, ili210x_work_i2c_poll);
> +		if (error)
> +			return dev_err_probe(dev, error, "Could not set up polling mode\n");
> +
> +		input_set_poll_interval(input, ILI2XXX_POLL_PERIOD);
> +	}
>
>  	error = devm_add_action_or_reset(dev, ili210x_stop, priv);
>  	if (error)
> --
> 2.51.0
>

