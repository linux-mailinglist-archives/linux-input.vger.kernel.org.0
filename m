Return-Path: <linux-input+bounces-4568-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54271913711
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 02:22:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A5A72839C6
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 00:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A013310E4;
	Sun, 23 Jun 2024 00:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="FyHumKZA"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2129.outbound.protection.outlook.com [40.107.243.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47DB653;
	Sun, 23 Jun 2024 00:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719102153; cv=fail; b=uuq6t/wsfC/9ulNWrceTogn28jJ2IuZlut4t3jflGXPqKJn0ZnflO5btiLhVZfKNf6sS+6Y8lzFD2wb40B3QWTh7qkAf1fqm8OZBMg4WdV2ydCqThfvhclG5z+VJsEfLBzIvGp0bbRWys3ja6eA1QRMW3hir34tqs4qShLJzj9c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719102153; c=relaxed/simple;
	bh=8wvXWprqp37Y4pxSokCS3zy3PplxwKizqkWJtVOlXj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JnoKQaWE8YYignrcLyH5s52nIpwj8TJyMlLWWIx0M+ZP1WC699A0pesF7oiULlUDTq8ukys/B9i2XmgOwnt5VdU3hqWFqn9RG4sf2mXG/blCV1MxjLFiMiNuURARtRqyl/HV8Hg8GHUY1oWQ/JZAvkmhcB2kIhoIrxqQ33NlQYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=FyHumKZA; arc=fail smtp.client-ip=40.107.243.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPy+bOYpCRTkn72tSAUvvmjSFeGvaHfcwpsm+9CE0zrknLXDc+1s8MYI9wDvfL+iCMaBQcEhVJndPN7Es/zWfrsu494gSvSjMgTD8MASnmyOF8ZUTL4B31yoUWXtthxU6SZ8rQg0FNDq49JPexV4IQ772k7QOf+gD2xUlCxgezdFR4+eE3i0Equ5QFWi7oCTycyxOX+tnz05SHT13qgAhoggZ6nQeRZ1zBL/x9sanL18yJMhvrBjKAEfDaAOeXu7uE5ldsu405xDSHHmZ4g/vaGPYDjH2lGdbwZF58Ly1w7xoooEFKL7eHOFDiF32viIPM7LQEtcJIxuf2fB+NW84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rzHRodP/PnYfgUVbLLFnPeusLF+sNXgiHebDsSRkfQA=;
 b=XtoEDzreOY1qlx+IYHykbhsxtjd9Cq2IKL2cViSvwNBssphdfc2iGx/Oe6pwJboTJlQTuIUWAjXf9KufJf4XZM+myjTUnWKkqsTqWvWHtWshOY0pTkVqYzYCxviAfdimIYHxrnP8AMsHxt2ElSXP/yG9vJCKT+IV3cGOVirqtfOvUpiYLE4Uo5n98Y/JAIj4pC9LOAqEqrEbj8RIyrPqwRwvma2MALrqIe3MfXxpEqNNypaTxjGve5h/4Tm9jZwjl9SE9++R5Mww3Yehh+FTx1ER7u8zThBewV2PpMz1j2gVhPm7XS16QSJYPWvYQoVsSBPI97VhYBPZI8TOjEJV/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rzHRodP/PnYfgUVbLLFnPeusLF+sNXgiHebDsSRkfQA=;
 b=FyHumKZAhRvKhzg6dLSgjlqRl2QdKDqn6nODl8FMNz46osaB5rEzvfe7XDjZ3KwZpodQkx2MId0pE8+JxR/V+Ids1dDhR4//8kl/Pq5h0+IFkhQKVUnRUogKXC0PbUGlKBfPjrRjbhLPH46nt+ph2dNFrZ/816sMf9wAliEeaSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH0PR08MB6956.namprd08.prod.outlook.com (2603:10b6:610:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 00:22:29 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 00:22:29 +0000
Date: Sat, 22 Jun 2024 19:22:25 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v11 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Message-ID: <ZndqwfN4G+RkCNrn@nixie71>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-5-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620161745.2312359-5-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SA1PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::20) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH0PR08MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: ecc2411c-b3ee-4252-ddf7-08dc931a9114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qU2p0Q2o7cQmca3JlaE6vQSiABqyxCM/CpBWiTo1J3JdFug0GAJXAn8Gf5LG?=
 =?us-ascii?Q?6qsFbLK6z8/qEiw66N76Kbqubh+dpXb7CYvb1flswgkfWaMi6iKOlr6o5OBw?=
 =?us-ascii?Q?HY2VWfUF74T+Zpt4yKLEpiG+numJaJP/J3IOLQTjov5btjJXCotXPTR/+5qI?=
 =?us-ascii?Q?GtQhBIbBTEZB/sXgbZEr4unJ8QH6VT0ko+PyhZ17ZixnfB7fCvu0yhrdmSTR?=
 =?us-ascii?Q?8ufgujiXvHzpjfe++eUVjMhSnM7GNMGx7XcQJ/1PR/ehHU6MFN1JEK0tpMar?=
 =?us-ascii?Q?/Jfamo33oZkRrXUM1CFR2JBWRCkZV2fplVpshT1PfXQxJodGPkWuOu5nHIQA?=
 =?us-ascii?Q?xSsQr1AwFcWkSNCYcDxr6JdKdKtUJ2aPliwf8Bhuk8ddWhkHyQa4Ivp8LQBT?=
 =?us-ascii?Q?6raupdp9Oz7vuQB9mxl1V+7iW5AnT840pXzgUguNkYxYsRTD3cqFRnFOJbSW?=
 =?us-ascii?Q?fW8YYtiegbq/gVzmscETLVgXfzYdF76ajUj7dwv2gnNVHMffhzxqi8vZbpXm?=
 =?us-ascii?Q?UxvI08BXdFFW6VzwSCkGPB5rUB92qd/exh2EgfCZpPxOFeGHK4ZCGB1Lxvj7?=
 =?us-ascii?Q?eVzN/js+KgTcCM5mVxEzAf7dyRamqCl4m4+7RwBODZyHGmB39n75YKt11d2+?=
 =?us-ascii?Q?ad3JgaQdC/pTEFfmQ95i0RDU71cc4fxMSMuAhVmwR7f3tH1Yx7J552SvCUjb?=
 =?us-ascii?Q?tTn7wyy+euZ/PRTYdS5vFm9USZChDWvwZBHtAjyg8K3GaWouQxvj50nRwVAD?=
 =?us-ascii?Q?corOT1jPmF5vYllannaiSbmfybdDP20msYDTKsVcDKrOb+v3I3OvAgpR277+?=
 =?us-ascii?Q?lMecU/dGrSF4cz9g0ozVt1pQO3G4OwopGF98asFwkXFt8Km/uHzUTB1Mda6e?=
 =?us-ascii?Q?uvbglicT8PSGZh2sHfi/f8Q8gQ8aPNcOlzxYgJs5e7kCaUtOFgl7we6juY1e?=
 =?us-ascii?Q?ZbkoXN4vlHuF0zN9X23tEdHsojpq2rpc/CncCGcVvAvZh66EizAHQmTadmwa?=
 =?us-ascii?Q?Ctwb1IOhewtEjshI4/yA6QXhX9o1wsy9f2zYzlxvvCrN8Pkti4xkbwGppA4N?=
 =?us-ascii?Q?XHrsi2AB5nR1bzxqVS3eYqF0oyaxsedXCbTdyHzmD0bsBFrCgFdpg99elKRu?=
 =?us-ascii?Q?Gs/yRJkR1EKncPTGhxPjAjQ+kX4E90wQ/0wQnKS1ZhN8Hl3IxEngWuCkzrJb?=
 =?us-ascii?Q?61RRqgXi6117lws0RpgyZfspkn9tPYb7Ql5KsRjEFR3n4cBZmnN7mUujKJhU?=
 =?us-ascii?Q?CFmnrhiEyyvyB3Ba6vI7uF9UqcVoB3P+BzVLEtFHNVuxevAxus3+ezVs5HN2?=
 =?us-ascii?Q?LqH9ZCyo2FRn2ugw5hQy9QbT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M6YmwZ42W0CJ7K2LNy/dhwU1Lb4n9AMleWOpZ2NPRoQOpJYoqyRF+JsgJGhO?=
 =?us-ascii?Q?ORhPVLCQWjDNsc6d1CE7JSePSWo81pDXAlK4Tylu4NWQX1CjOMCE6TH/Km8m?=
 =?us-ascii?Q?IexH7K1pzDkufLincyn6z/cdpaUyo1Zfniz4QoIoXzpKuwYx4FAUuMIM9RUu?=
 =?us-ascii?Q?PKgNVFkTN+ySs2j8q63d0Ugrm1O5Ci/ldT2MHkb+fUIm1jITKb666YIoQZlq?=
 =?us-ascii?Q?ehEVIXJN/B1vu21ArC8rEVs9+3M3jfdwr3Nsm1yDgAXBHJW401GxRVEeAUex?=
 =?us-ascii?Q?VEuYKCetAw15cQbGywC5DEr19WhBfJoiyQpx1QcFijIFW/mv26/lEAO7z7iQ?=
 =?us-ascii?Q?VNiMNv/MlW1PIpGK4swKDoeBZwFPTcaIIMCkFM5eXbeSKMACNCHMNOt/Ua8w?=
 =?us-ascii?Q?PSD90al/xUKq1/YvdoWAQAA+W862C//vz2Av33N86HtmPYIxrcrM6DPTjRXj?=
 =?us-ascii?Q?/jyvsBB58qk5IVEIJEsnA3vGGoz+Mx5y2DpOrXhYH4974zr6clqtzD3c5WnF?=
 =?us-ascii?Q?C9F1fLwF5Z5zi6M0+7To3m7dwhWF0zgez/QyhEDa3VLPt/doVlK1Xlp8BsA2?=
 =?us-ascii?Q?G3dbs2JCFFY2N0p+f0kwCbVzXZIER9sfn271JItlzbfsED2ziSeL+7d8gJLs?=
 =?us-ascii?Q?uhKInBKkIRuSgHOPxS2g+zQQYKk3/GtzERbkPqs+c1gfkG6iBCoMNonovug7?=
 =?us-ascii?Q?Cel6bkTck4MI/swgOb4ujzpndwSeGrfOpCEyAxfvAsfyRa0wTYUMdSG1y8Vy?=
 =?us-ascii?Q?KTrNqzd79/W5bbo59I7S/ZN456Fk5hStSEo6rtg4YoOdqi+tnqYWP9Ng1yyM?=
 =?us-ascii?Q?BgSb9XoLK/hUG444OsMLV8Ht9VWg4iOEtjll+ZOC4G2KyylIgiKZo5qvabXx?=
 =?us-ascii?Q?uLI8dCkHOIHAkUqLyBJbbHPzqzJNvwYwex7l6gnfFL527paM0QIusKklPTXf?=
 =?us-ascii?Q?/gty4gOYgSt8HPjTOx4/yZ6f33HPD/28Pp1zJnkyhg16EYnlAuKtaJc4Zu5F?=
 =?us-ascii?Q?VvgXn/7JHLWnOj54TOQyXNzCzHGl5FK44IEUur7RbInrdnFa0qCeJEwxybGc?=
 =?us-ascii?Q?fDviejIuIjdcIKOYfVuEvgLabSxZc1dT0/fajdgjfvz77GiMAcUYs6rSbRO0?=
 =?us-ascii?Q?32ym5WT9aUi4NhdhEFWaocwMAHgzSAGtwH00gmheT1NT13ZP+YdIjrjdj4r3?=
 =?us-ascii?Q?cflJuMJ/c6FmJlOvRHXcsv+dYMi3UFY9H2ar/1vdOZgdHy5nfVhZdpfQIF/e?=
 =?us-ascii?Q?wz0Xqqw4EN1YpwUAfNwMHgTx6YrKjPVKgCl2AhvHBNkq8UbKrVaivEAtcWsl?=
 =?us-ascii?Q?PAPNayn+Eq0MDvK3hFGxJm3QUn79QCCXij06/f83nKIzF7Dqf4/1sSaSnwMZ?=
 =?us-ascii?Q?eDUqrZ2dd+1uN7bWujjYrV7EqFeorQxuOQ2xtqKCAeL5tSoGbVQezhkmITTJ?=
 =?us-ascii?Q?Rm453stwUiwYXIgxt789CkzsccRlO6jdT0O6TCR3rFoaLmJT4RTxbqcCsPqX?=
 =?us-ascii?Q?1MiQ9HYzUiC65N0Nm1BnTr0cmtR3MLgSOQO/eWFhoaTLL5nsUkixZ28aNkby?=
 =?us-ascii?Q?UHmjDlF7kE5aovt59M+UVMKNqMnoKRVH9iri1ynd?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecc2411c-b3ee-4252-ddf7-08dc931a9114
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2024 00:22:29.2894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lGKyxnsMGOgsLT0MkTQcvjT0iSvtePWRvrnQBwH/SIXO70c5Z4nkcP8AaVgBvFuCkTIp4PfVDiAYPRoRs19Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6956

Hi James,

On Thu, Jun 20, 2024 at 04:17:44PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The input driver provides the interface for control of
> haptic effects through the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Kind regards,
Jeff LaBundy


