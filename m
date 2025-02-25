Return-Path: <linux-input+bounces-10338-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C3AA43818
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 09:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CA477AAE50
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 08:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0263D25D55E;
	Tue, 25 Feb 2025 08:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="BqQtv2Rb"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D31D25D537;
	Tue, 25 Feb 2025 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740473489; cv=fail; b=er+wPtWJdaLNbD4lscyT88+yVZOCqMryY+KRWy6ixowPbYI3rixdIMRlyzulFwl3kdp1rmgfMfNKl5jyVC8mIxUajGZ08cBsx3YV+Hvs0VBpIib9UVPJbtdIMZN1p3vAEGQ8LrGONQnRji4QcZq9AzPM4m8/iZy5uQQtISUf9Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740473489; c=relaxed/simple;
	bh=X+1tH36OFpKEDPWJUNC/9KpHb60cX3TlheuZMVaXp6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=vBJkNEaNFMGBepBuxWppvVLl49djQmx3YoyqzOuQcA5l0im1t3+Xr0FzbGPaSjoynY+U9dMkw9gzLrGNM6X7PGhePkYOpm4a+4TvdzfWBcdej4AHrvgpvxv8eZLOt0ahWpYhtSWsjske8xxnj9neg65q+UKvX4epaE/bitQ1Kyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=BqQtv2Rb; arc=fail smtp.client-ip=52.101.65.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOcsavZZtXpUrqd1nTuCJD+HILwi+rr1MYuKS80PulRCA/P+U11ptobXK98DKXcXqPgVbe974XnSH9f7+u9zM7w5n3BlKZJpiZvKi5mS1WPS2/nqVaWYzOhHlHRdbA/lrLcG1bu/WTQ+wiL/lnyjZk4gxcdUgoEFiFheGMHxJpIUYaUxGZHX593g/7erYvmYp96IIkZMjyP2kamtP999pWfvkJeEr1SActbY9PDfxn5k1UQoZZJZ5DWo1zSt2QAXJO9H+DaRRY6moYEFElSxfQ9mGnt8gYnnH2nCB13mAyQAovlnpoM6FtgeRIv5kBMIpVbKjOwov0mivNZW9wzTmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qgtvHO28pwDsU6P9dFTIR9B2xml0q8Ale9UfOPUPlTQ=;
 b=fP3z9T5O9+er/WRPBi15zeK7EK2Qq8i/RE9zwoxylT8zE0KulgWQUiT9FxuDH5DSDLXiwGyJx4P8kUhWsz4uwU8EODByoYdJ+ECjFmuFkBy28y7FVK1LTU4OIsyaBFkLA8ou2FyrLIKIZ4ZA2At2v7xDzRm9dc5nyFDN/A7TkHQi0RPfscH121gidmisJKqPCY/dmWbraNGUB9mcGkvvE7CCfcPMet3xzF3U/i4LO1ib32CUYgLVBLvpY06+tb/FE6DGptZ20fgPpVAxSKnCabgzFZi2D+3PHEMlEhthMIWPHh7DoOBTAYmIm646YcaXaBUGBsnv0N1pzJNQScwWbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qgtvHO28pwDsU6P9dFTIR9B2xml0q8Ale9UfOPUPlTQ=;
 b=BqQtv2RbhKwdBp6ZbC9KSmm8Sw6ArUqKxw35UD45x97DIWYqV1FwdRImoCjSiF47Sxxwukl1HN85nCC6zRURUXcUBf9xpB+3xAG3Pj4LcHh/OLOsMYCPaJCnON9AUWy87L6rNlITnH3eCaOdt7E7IWBtm5briwAZ/gzXCsfAqjkm+6+gwzvuOvz1cu8rrtYNZ4jcg+8OtJEZRQ99PPpNrLX4hKJzNKhpnkvou570+Ze5r8povb+XvrVWINR/qsetVYFaennP8SSuAT3HTdxyvSr4pvuetG189gf78csylC4lXX0DxGuQmq4m8FXMvGk3XuKBqUt7kLXKw8bmLwQ/mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6261.eurprd03.prod.outlook.com (2603:10a6:20b:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 08:51:25 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Tue, 25 Feb 2025
 08:51:25 +0000
Date: Tue, 25 Feb 2025 09:51:22 +0100
From: Markus Burri <markus.burri@mt.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Manuel Traut <manuel.traut@mt.com>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 7/7] Input: matrix_keypad - detect change during scan
Message-ID: <Z72EiqCv_pUZDRdV@Debian-VM-Markus.debian>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-8-markus.burri@mt.com>
 <Z7YNKl4ljWFQEa-u@mt.com>
 <Z71qEyDVz22j_CvL@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z71qEyDVz22j_CvL@google.com>
X-ClientProxiedBy: ZR0P278CA0075.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::8) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6261:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fa89751-3830-43fd-432c-08dd557995cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hzKQLPu1t++yJ8MByK4X+rVYbg9kbhfzCWH5KGR39xUos/Kt29sqYKZw7Ngk?=
 =?us-ascii?Q?3J9PxD9TEUf87I/VADgsV/XSANt0QUtVI4pYro1EaUvIHec4bOFxo6vnTn4e?=
 =?us-ascii?Q?x6/DwvebgUZG2VLXZpC9l7kPZPqtZElury1kVHFK5tXw7imK4A1Ym42WowIW?=
 =?us-ascii?Q?OpCDo56PmAd6H9YwONkw9IFkPDi3spLJfc3ygRTVKz3Ieh9R5sz3Hhez6gc2?=
 =?us-ascii?Q?VJxJ+F/26C5jy66QdNAxe0y7bdUNmfDPQgDV9wiGDugmZBRCcOdX/cPQg4q8?=
 =?us-ascii?Q?snfLj4PCNBP/ftl6nFeLerBPIyrpKb+jzwpZt4nr8qEbcIk00ZJOCVSTFuNe?=
 =?us-ascii?Q?i05SLHbDyPFA1D2s/VLhGWj+YOrfeb58wkAnVIS+eUbOfdzsoPtLyBsIrQ6M?=
 =?us-ascii?Q?jniRbydRuD8vsoKVfQH4Leyt2ENT3yWT+RCr16o4W6G81DrGdXJ9tPR6No+p?=
 =?us-ascii?Q?xUXH/VBW/EZmItGmU7QIGiFLGCX+RCENM02H6Vairae5jkpNylUNcQ3EczwL?=
 =?us-ascii?Q?f1kqTnKtLfV1GYoSX5VP1LYyViCiAHd7Xon/3twuDWFhHEUwT0z9sktVPO9h?=
 =?us-ascii?Q?rhjVmhqqH4xKcCFPlYuqXP4A35omohS97g0ZFaz9JL76EqQjb9ECLeruL7Iu?=
 =?us-ascii?Q?80nZByXR+vANqk5cy9Sb4uUHirPOniQw/6tpWrgKN2urZW9kLN35F5wxlKkc?=
 =?us-ascii?Q?U426O6XZNPUSaj9rYwPLTiTbTluaSWWiNLTBX1Pjg6QTzHDo9bWeO9ykoNhU?=
 =?us-ascii?Q?dZubFUibYCwZzaSRjPWytuu6MaMfgNl7cDYnQkIg4sDtsuFIIsMeOvs4X2Q3?=
 =?us-ascii?Q?HgwJmOG3X6X+KkO80+wEwcYC6SRHyTuGi8oS7eL6ZoTTLJvIjTtj5HCG8ZXu?=
 =?us-ascii?Q?cQXDfHL18OMcyp6rA7uRxGhEJF5nt1r5sykHTeX1VmUyuUbtyPiLKaEtiYqE?=
 =?us-ascii?Q?e+BHY0H/EbqhY6oHlSzZ0vmVqsKhZuIy0ifk6CWVkO2kfaooDfBfUAGeR7F/?=
 =?us-ascii?Q?+JHCxr7gXWjBth0PQiNS/5wXvl3Nzr270T952QuA85/BAfivjqWsmW0kaR3U?=
 =?us-ascii?Q?4v7i+mOESaNgzQdFopvmHcLNtcjzNREHEp9SJp3vITIMETUVOixzkPHcLfLf?=
 =?us-ascii?Q?13wn7b6Sip8e1uKGY6LrAisU8p+Fe1bvEwcvIEj1nV4N6QovkyYcOyDWfcdR?=
 =?us-ascii?Q?HH87baCd4DZLOqYp7JzAoZ9TQNHNm1Mn35XHQHBIM8zWN5X4Gw/fo51jVHyK?=
 =?us-ascii?Q?dx9uugAMBOGJtQGhrZ7q2w+vuntI0ZggbQ+mvcA6Z2cox+0s1rkKxNUIKj9n?=
 =?us-ascii?Q?ouDu92TvJbho4wlFu/5wzIntXQpXtiHV2ZrGWNArOiHPxdS1f0MRJTD0v4S/?=
 =?us-ascii?Q?nFs6tyrTRH8oo8ngIeM0EKSpkWEmP1JtXAZa3jVMWhQkDkltxuqxfllX2YXc?=
 =?us-ascii?Q?W3MLpLWIacIKF1967/GlyHFNZYiwK9JF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OgWH6lrrf4jmTZu8y7skjGF/BlgwVvcI1Oyh/wMVzWn98e2qWqSqt7eFg3IV?=
 =?us-ascii?Q?KgdVk9FYtDkB5jFN6kkQaeYSDDC3CJQNJ2y1+7vBGm+NM08gmj5ZEtMexYcv?=
 =?us-ascii?Q?xI4duhBUw5mWRqnZaoFjxvUdZ+WTk7JOtFVIb89oG7kvcR0RlOIHurqAWD8g?=
 =?us-ascii?Q?7gBNZI3eVI+yz1a8JlCMuXFVpL8hatnaEE4y3eKP8Cf1QOZl7t4DzcOZUwrv?=
 =?us-ascii?Q?hmBAFqSzfPiGIxJlpAzu/W/EFiJOYXTRwwh0Lajkf2RivoE4GOYAKaAZGnpc?=
 =?us-ascii?Q?a4Ir0AyVxBDKzda3007UC01NuFUrwgjAGJDgxWdC2+gRDRC5gaVVTgM1a4h3?=
 =?us-ascii?Q?j7ifFE0KXo1Ixwat2T5Z77GN23KzFW7LH7r1nzz1kQWduie5CMXvG8qcvp/v?=
 =?us-ascii?Q?5ML0nOXo7netH4IX9JfRJcR4IqyQ/jcoBss5yRs9bPFIn/5k9NGDnuFrbg+/?=
 =?us-ascii?Q?Ss4OzFoVJXgWxyFkxINTI2yR5HQBVoOAn3Y6vzjNbeRTd6xwwSXRYseH1JTM?=
 =?us-ascii?Q?lhZDLOMyuGjUXOehpUbZVAsMHbLegr5FaKiLqSqvIwAAxDEDS5Dyrht0qmI+?=
 =?us-ascii?Q?5aGElh3PCwPwNoW6/agemoR8dURB/HEqZ7n6iQ73IMXzPXqrXOwCWvH2tD3e?=
 =?us-ascii?Q?heKTX/dTYyXihACS5BjAG1M8f7jWVw/t/v7Fqk/lRDZr+RCcGGkAy2R6GfuH?=
 =?us-ascii?Q?SYzE0RmusTmB96LGbcc+B+MUka+B/q3YjUMIM+3D/N5vM3xSye0aYvkAcKDp?=
 =?us-ascii?Q?OOe5OSx2q5ONZ/H7eXwMuIMF4Eo5nKKLdT7WK2UZS7+rp7gsQ07sKTWqHvql?=
 =?us-ascii?Q?7Pbm91cvOgGBkiWjjj627fqbdz8Y7sh3bnxOATtAr0fK0YEWsP6Bpz8Hf4kw?=
 =?us-ascii?Q?1CBst+sl2Vcg9woQT0SISDrYUGd392gWQwFFWUNm9rXUnTtwDA3DOC8ittcq?=
 =?us-ascii?Q?pg02QcX26YXtslCWxdv3tGDS46MZcZa59bFftroKn2S7Z7VWCLyro7nLH9Nb?=
 =?us-ascii?Q?DsL4EEVnFFMWEVk9pg+jzhyFXva2u4zpFnm9VcZz04xtrv1hK0a5YoS5z83U?=
 =?us-ascii?Q?J6lrwaYrTjqjX+ininmOxAVUYa/fokIOLJQprrCFyfmyw2hxmyI/59yTdcA5?=
 =?us-ascii?Q?Bh3kmD6PsVsyRp9FBvJRc4unRi6SolTXstHRDTzrEWFkF/V5dXzS1MQDpF8B?=
 =?us-ascii?Q?4xvKfIzF8Ni0ZrhcmYGOWVcwb9dmhRuLR17i6VU/1r4cAEub54UbneCvfONe?=
 =?us-ascii?Q?TYL1iUzuNZNdT4hJxSuiono1ry2YwCDc3avnRLugNsPYp1FwaOaKxctWxVga?=
 =?us-ascii?Q?uk1dRp8zF/LFYBA8geSQFFNKkRbwwCYZYZ0k6uBckI8vj40k8zwxeNk2A4Fq?=
 =?us-ascii?Q?6IQhsN8i2hHB22K36ouX8DMYwId5J3F2nOo4JBdfq+sBOH0A7O1kw6r8zoPT?=
 =?us-ascii?Q?VhTJ5cr7NwKZFn//HJvwepMQIZrVwGwBPfgzR7/NpbpTOjEEGHGikXKWlcvI?=
 =?us-ascii?Q?BYd7ZIbypYX/iSb9mcImZUWAAP8JVWOeqCL16k7281BeEI1a+Z/gKkuLutgp?=
 =?us-ascii?Q?sDlwmnJqwWcgQukklTPV7ceS47YVXiLPLhTJALpI?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fa89751-3830-43fd-432c-08dd557995cf
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 08:51:25.1276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KY1WYC5FMhHEMlM59rBuqpvrXLkdWOlEVsKgCs7cqKno+0Sofn54IeDWvuIFWr5qTiVHE6ZsUVuMSOmvAEkk2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6261

On Mon, Feb 24, 2025 at 10:58:27PM -0800, Dmitry Torokhov wrote:
> On Wed, Feb 19, 2025 at 05:56:10PM +0100, Manuel Traut wrote:
> > On Fri, Jan 10, 2025 at 06:49:06AM +0100, Markus Burri wrote:
> > > For a setup where the matrix keypad is connected over a slow interface
> > > (e.g. a gpio-expansion over i2c), the scan can take a longer time to read.
> > > 
> > > Interrupts need to be disabled during scan. And therefore changes in this
> > > period are not detected.
> > > To improve this situation, scan the matrix again if the row state changed
> > > during interrupts disabled.
> > > The rescan is repeated until no change is detected anymore.
> > 
> > This is a quirk for a bad hardware design. For 'good' hardware it adds
> > an additional read_row_state for no need. For even slower connected
> > GPIOs this will also not help much. However it is obvious that it will
> > be an improvement for some designs. 
> > 
> > Dmitry, would it make sense to make this configurable?
> 
> What if we do not disable interrupts after the first one, but record
> the last interrupt time and rescan if it arrived after work handler
> started executing?
> 
> Thanks.

I was also thinking about that.
If we do not disable interrupts we will get a lot of interrupts during scan.
The scanning process itself generate interrupts because of selecting the columns
and read row state. Therefore after scan we will not know if the interrupts are
caused by scanning or a change.
  
> 
> -- 
> Dmitry

