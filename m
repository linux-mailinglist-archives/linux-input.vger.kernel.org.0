Return-Path: <linux-input+bounces-4567-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3E391370F
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 02:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03259B203B0
	for <lists+linux-input@lfdr.de>; Sun, 23 Jun 2024 00:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9397B801;
	Sun, 23 Jun 2024 00:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="m6tCHCU/"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2095.outbound.protection.outlook.com [40.107.93.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3838BE2;
	Sun, 23 Jun 2024 00:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719102094; cv=fail; b=Pnwm6UweLICMjnNp+xYR8+3Xhd2Z7PKWSmlAyo0ELVbSy2rn1f2W9qXk4L1ut1HNu/MkWDYLo8pvP4ujDABwDgsSibdu8NwYMw/L7FcLAfYqk+odJqygD2MKHHFmT5hc0bgQE+DG++qMcPkb1aqR8k/3yXB5F6unzNL9U15P8NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719102094; c=relaxed/simple;
	bh=jCkQEQQKl2DtUCNJAZXyallePk235s4ZXE0oVEQ1xzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nWGuX5d/uMQlQPCcno8yFAIL2QTgJLtU/c5UMYm0btgjfWHXv0KRusAYPS6ZdSO9d3z0C9bC2pqg76nkW2wv5F/h5rDU2nWnaneB/MVmfTNzQrtqK88EWYGnB+yAqK98cXaXaCZ8HE5VeI2rnuRF/6A5apYfG3Or+25GyrS5SXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=m6tCHCU/; arc=fail smtp.client-ip=40.107.93.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IV6AHrFNWN3F7hsYdAbpeZjFZygKfUKsih5T3r0pUUw5ArZAoZk4+V/e+PV5X7ujwY1bwMrnrY0VOqazv3IWIXUhr9juT1AWS5ULAf4dmPF/wSiU400bEajpVoidcTn2DqamtAsdVK4h83iC+vzs1tkrvMcz52zaK8DgaXKjMi3B2WXN7WQR+W28wnENXFy/a//UseMc3c5MtRMVpe4wJVBa0RrJIwT0LSqkOUUPhQS+U/pEHcMEklyVLX3jmUkDWNj3NfzelXFpHJ76Lk7recHWTKX4Z1GzrJt7TV1JxqJJUKtByTko5A89XXFzWzhFvNSOd7msgXLP5xN5Lw3RbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ek0LkQexSqKkOIjSwgT023wsHe4VjDOEkkKIRkhZvZA=;
 b=MIeO6S50sM+AKT8n0rlITdjNHifa/U2YeUkub7VeejMnEFNBfDU20/g2+v0usLE6kg0tnXbY1cFgy0huXX+ev3aA0PbUisPx5JfEUKAUOGp215VMtGOPkklxIE80cPXaclCKwFdu5pHGP1Ckd0PEO95K2BrpXJGhdKjKOorsIJ5ZCRDr0/Mn8Np7JY+gxN9oGIi4NWrLPyosx9HAW6BQZB32qJk/RZCDPG1O4NgDdVRkTzIvd8Qwf20pfXpJ2gMRVbDRQAHO/sNnbI4HqYrxFz6y4TZUZDo91jyfUxI1yFE8Q9/btjLf6l7aoIqcSWBlsNldigSZ5IOlC+3x1gm0EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ek0LkQexSqKkOIjSwgT023wsHe4VjDOEkkKIRkhZvZA=;
 b=m6tCHCU/ebF8eRbcPIO8SaVHBrETi2MF1GbP95H6HvCN++f5aX8m2wJ565t32pZd2HJOO+Jc8oa0O1jGM5BCOOVHjDfkP9u8zzroPL3MhySGQKIlmALRJNvKdWIPnsXjbgMYRtvGKLwV3GPYyktjsJhQj6pF8X5R5+V9wMqfa8E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH0PR08MB6956.namprd08.prod.outlook.com (2603:10b6:610:c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Sun, 23 Jun
 2024 00:21:30 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%6]) with mapi id 15.20.7698.025; Sun, 23 Jun 2024
 00:21:30 +0000
Date: Sat, 22 Jun 2024 19:21:26 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: James Ogletree <jogletre@opensource.cirrus.com>
Cc: dmitry.torokhov@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	lee@kernel.org, broonie@kernel.org, patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v11 3/5] mfd: cs40l50: Add support for CS40L50
 core driver
Message-ID: <ZndqhhA5NfM2O/WI@nixie71>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620161745.2312359-4-jogletre@opensource.cirrus.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620161745.2312359-4-jogletre@opensource.cirrus.com>
X-ClientProxiedBy: SN7PR04CA0194.namprd04.prod.outlook.com
 (2603:10b6:806:126::19) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH0PR08MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4b89fd-b341-4f7d-0039-08dc931a6e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|7416011|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0OPeZSh5MEaoyy5lLF8FseMDJUnE00xuUGnEC26RDn+ZgR8S7tQVQ38+wEDf?=
 =?us-ascii?Q?kHyNEpBb6J/6bGy9sb5/Xp3IjLrJjGyWUfUDQaj7PUBw16p2z0kypg1cnjAK?=
 =?us-ascii?Q?73X0KgFNbXw2Nx45HW6BzQ/cuAD72rk5WgasHUnum/bBATmzNzNzjqDb17KH?=
 =?us-ascii?Q?YM7m2mQtyCNjgYv6O9mtXk9hEVPQEsaI/cmWPfLx250f9OBZnQY6/GkNOvKT?=
 =?us-ascii?Q?iNYC5/QjcRsuY4Vy3oxv2OnDlGDaveFo7uGJgWXmZ5KCuEM78BH0A8jSN5QV?=
 =?us-ascii?Q?2SR51f1Jb2OmjuUz5mAiEZTL9lANQEHfYWFvgtEhn2h7dYDal3IO7v9O86NN?=
 =?us-ascii?Q?m7hV4bi6mrkrc2A+SqXPEQZgzAsrwxzkos0Cu+Mv9t7HokG5MBAzwRMcbFwC?=
 =?us-ascii?Q?bawQQVwlN33Ad6RY2CGLYeykLjAOWGdzUx2DawX+Fw5LQkx8CvLiysu6JPHv?=
 =?us-ascii?Q?wRYe2gAyNSLEaSJpzypPk8vEpG+7jLiy9aiugt3ECHv0cakN5+HLHBSzWQY6?=
 =?us-ascii?Q?WcD1OdUaZKX9QNylDQeqvTPGteJuNTLILYQhkIjAXmGkTcJ7h5z/6fP8f4xz?=
 =?us-ascii?Q?j77H9RLhE7k/dEXzY7emI41wrtIXV2/SR+ZMlxw/PZt/zcfYkegB+NiPLQQ5?=
 =?us-ascii?Q?6DmTeTmJD8TcMYdG3DOzMtPUKHks0ybV6q+9Ak15gQ92PGSHgCqqcWYDTgP4?=
 =?us-ascii?Q?1BbETuLF1EbigVzNbEK/dJd9gRPGjC9KaGkJO7mh8lmwp6Cj6rpXl/Xn4LWz?=
 =?us-ascii?Q?1zFhjjAYauOunfAwU2Ywjp/PsRxVn9YXX/Y/o3s7oBr/rqkb33yphWaD3yBK?=
 =?us-ascii?Q?1ZWaD2r2WKvVKa0V51fErU6GSAMDF1pE6RWPrMkzitUC/hd2OY4tRPIKezrZ?=
 =?us-ascii?Q?Ca5nTOE5mQKv4SSWP+qO1+Gw3T3S3zVkieKfE0kLI28kLEWk96IlRAKO0kmh?=
 =?us-ascii?Q?uyvFU51MajfXMbS6Nf+K1opm1HaSysFfi9kR1KJmA+azyr2v2mjrbZXtxHuc?=
 =?us-ascii?Q?aGOSopmt9CQshhqrYqRZReBlDzsgUSmQPWV9HvJCukgNwKnbkr+3gU276o0N?=
 =?us-ascii?Q?W7WUtHK5GRSv3GH/CuhrVJ58yF58D0bAGnw02EYHNoepJzKGmeAJafclJosa?=
 =?us-ascii?Q?QolptAxvNH14hiK1bv1+h1+5g5T4aOamkqCjTqUSVhqy8MAnObKYNeC2RguZ?=
 =?us-ascii?Q?QdzopEmGsL+wfkvP8n3qwbYX638QqIjfV/zWaj7tva0LobNhAZWC1kHrFB3E?=
 =?us-ascii?Q?xiz1/Ecju41/I3i99zCc5VT/D3om3mOjIL/tnG6R4L5KQiBZD7k70lQSkI/r?=
 =?us-ascii?Q?rXkIYQF6VT3nOHHJbQsfs7s9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(7416011)(1800799021);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kb4Jwoo+2tJwQjGBX2FtA+9vJDplYX4VaoVb2TKEbM06VWu62cFmbFG/DXmB?=
 =?us-ascii?Q?1W+7hqBU0A1QyZMfhWyWQ/plfwkxrtokyI24Wm/nFKZt7FEQDpxjJTfD8ZHD?=
 =?us-ascii?Q?siy/T3X1EbIfLEZ8QhmeTrtESsX9ry4wr3/jkLhx5/0esJCqhMgDteyLHqNx?=
 =?us-ascii?Q?A+1p3GX4ehThScZkroTpw+wls6HlkR8Wan/PalmbHnLkA3DZriqkb01ofof0?=
 =?us-ascii?Q?sfG8UriuLI29PuUz4VWpoD41RAUIZ3vqbtvJp3wFXrKwWeXJQXA8syL45naY?=
 =?us-ascii?Q?5ccWMQrTbM8S0n7mqr5UpB/oQGtNcNjM8dG2GyvRkS+yrBTYbOD+qUbg7s1H?=
 =?us-ascii?Q?TcmMpYFNnL8mziP3msgQ+q+vvgGvUg7Wep8W5thAVHOtbouJ1IN5KvsB4JZh?=
 =?us-ascii?Q?7l2Qq/bQHYMYxX4MtuENR3K6tGqTpULtGyfKyM6WrviSPhGUVf5IP4h5DIGW?=
 =?us-ascii?Q?aJD5+nR9U9GRe0HLfQTF/TE1+UkGSQlXkxcweCi7SJTols4+g0QS+ux+m4SR?=
 =?us-ascii?Q?CK5Uty87A0h3li9hJVECeIoCVhQcDKgEKpGUuyy7YTOo9htWE0ewLhWtPwY1?=
 =?us-ascii?Q?SLIxk1kCr7llRv8Y4Kr4sPZH9pbjMA0hNuWBrCtlgIEzlc35nURAuDnki224?=
 =?us-ascii?Q?iBbk0l8249SJFAW+PjC3W+UX6zpAAExOYiJvsMXgAzMEibFGsYe8QkLZ0TZK?=
 =?us-ascii?Q?W9tLzO3TB9Z3Ivj/TsjT/QnllBugPdT2H2RYFg2Zwif8gnVX3n1BRRbyimYg?=
 =?us-ascii?Q?wtNONmH2s0Lh/7PgU1khhZ5koXK7BCeFlo+BchScC4UXn9t9KQBSF0veVNwF?=
 =?us-ascii?Q?hWUjMfrrxUwsZAPB196dTDloF+yaoOTMOcNRIEdiQcS3UhvxfZuNnvShgCx0?=
 =?us-ascii?Q?Lx6DdXe2oFxSIYdEIb2P04OT5nN/KED0Q+4yPF2O5MEM0iUP2LuwzyYTW7ex?=
 =?us-ascii?Q?GjTc8Vmv5B2moBFaOkRfkbWYkgEwtBldVU4x58DCMzPU+S+NYX3H9XV4A5nl?=
 =?us-ascii?Q?xKOnegskMhDOyFODKMEIZmM/dLoDylCD6g3/geNVd3ttVnYti6xUFlFUF4Nq?=
 =?us-ascii?Q?lhGi20gBoyASuoCUqH54T+P2Cp0g+IBhALqo3NBHqiczvyhVHQpvLqw8v5NI?=
 =?us-ascii?Q?UMZKCNSZmb0VJ2sdgbcbdEaiFZBEp/GdJQtTc1VRLMlk1TcQh178jVuQqFfP?=
 =?us-ascii?Q?wpKBIX8SK99lxr0y5AMrwWMXUymDAqwsVSldcoNtFs8IpB5dn4LCRfE3xoKQ?=
 =?us-ascii?Q?W/LSZtRBhwjxUpjhih4r9KTA1Ag4FrxBCQcXLckJ4VWtOpBxuI8gLBJiJnHK?=
 =?us-ascii?Q?NDiujVocw+CwoQAz842/acHQIOTiDSJaeygrBWnsH9lRBEPTeIr37b3eKPGx?=
 =?us-ascii?Q?HhvMpTuEyIgPQs+DOZYB3lAPTjfBlVOeVdFP/SQFxcegcNk0axqpSIJAz8Ew?=
 =?us-ascii?Q?4gP9djwParUssu+ofZCAqoPW14SdCK7e8LA4ukWidvDAyT8/7+DXpXUyXKbt?=
 =?us-ascii?Q?mHuKBkwdukYK1H2HXT/Y+6beG5JKHEhlgoOKxkjkASqZO5iAuOyZXk4du1jr?=
 =?us-ascii?Q?yvoA7W+rwPBSOoW9JH1Noss/YNR9J+AZktP2hSPg?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4b89fd-b341-4f7d-0039-08dc931a6e12
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2024 00:21:30.5616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v88Y0AgCQP26T13EG9W9hQpZ1aD9aE0Z7JLy1CjGb3krPWQZy3uPhau8obGiel93AwBBZ/WFxG0bAESlXy9aHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR08MB6956

Hi James,

On Thu, Jun 20, 2024 at 04:17:43PM +0000, James Ogletree wrote:
> Introduce support for Cirrus Logic Device CS40L50: a
> haptic driver with waveform memory, integrated DSP,
> and closed-loop algorithms.
> 
> The MFD component registers and initializes the device.
> 
> Signed-off-by: James Ogletree <jogletre@opensource.cirrus.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Kind regards,
Jeff LaBundy

