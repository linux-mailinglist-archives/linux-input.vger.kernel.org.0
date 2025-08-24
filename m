Return-Path: <linux-input+bounces-14292-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD5B33131
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 17:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBB217ADF78
	for <lists+linux-input@lfdr.de>; Sun, 24 Aug 2025 15:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD24C1F4C96;
	Sun, 24 Aug 2025 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="iunYguFr"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2129.outbound.protection.outlook.com [40.107.95.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164411FB3
	for <linux-input@vger.kernel.org>; Sun, 24 Aug 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.95.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756049208; cv=fail; b=u4e8a+aSoAcZ2vORVjg8fOaYRTSv2nC4GtMmFGac6+EIeLXBTR+K+UBvoqOt/USonDfRKhXGvOWrc5+qgMZvyOJDz7qtZHtg/StnPqcH61IpXKdXRi79Tgs9H90onwj639H1flFcnsVJOxiWh5Cm5SZuPUjZJr/CmAy1JuZSsTw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756049208; c=relaxed/simple;
	bh=LbtuuCtZN5puckuKzOIJe9zrWXcNeOEvCalK4uiTInI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q+JjlYYx61etRHNoXI4aX5g8OhelqTGPdvSpGrhDnJ01n9g/NmDRxuVZ6dudT/C7nwJbxz9dyxVf4zci0yI8pQ1/Qi8XrIlJJvf4Xw1RpFafLU7p1JoHjbGcYE6J7DnENNUvfTZZn6lFKa5hA4jz55YjAiUAh+VgZgWWhCQBN84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=iunYguFr; arc=fail smtp.client-ip=40.107.95.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f721Heaqfe/Ji0HCe3gck1lAgO4pnpfTzyfiUrlFyV4iBk+LfoLc+8t57/dTOj1eaV47kJgd8W/hy48f/TyNc36ysnWKBWYLxdU+kHBsy/5vh2Y+xiU6f+CATUsALvH48kjSdfu5+RwsbyhT12XQ7C1ZmnhCV0Y+I1eFoOEMcFyZlAoIAOsZsNPmtu1SEWk3YyHwu4KDDw4MnR38PXq3aVcG1KWixFGKEq2iaIgP0xuGa65rQ0r3mfCMd8agEdW2XfI1H6v6KNqOueOFKXKRPx/A4+xldVmR85fx0PSAuY8T3UCNoiDTV3crgjLNQqYnLVWvkIVSwOz44qVhfG1dsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OfND8R1pRPMDbQnqmfM8TOJouuKN+9BhwH1jqANFjMk=;
 b=Ok9uT5ODsaG6G2/8rOzgaKFST/clNl27Wgak/twDiGGbAEPN8r+ldZe5Zd3WJwp3k88hM21tIAE2yUhFx/XH+ikBIXN5tSmhzkf9ELOcF+coJaCgMbL/eGYyG5OrXWKhH7raTxGCg0eZkbxegkLRCHB70LiBjCfVVjuMi1EAfZr8IYiTSga/B4jrq8t0JRTHqRgvTz/GuO7S2A7F9QyO+TbJd3ZoXoLlF4cXVrt5jIxxqjO4nHF+DcJx6/yjT2mRVR+ERX1V4KqJAlV+tKsPrADC5lrrydQ52Yr84lhEc+IlEwGg4WIKaRn8Hw0CuM1EqHdMx55b/dD0sl9DOAH/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OfND8R1pRPMDbQnqmfM8TOJouuKN+9BhwH1jqANFjMk=;
 b=iunYguFrqvjOQVxyy863SY/RJlcp8PO8+N1WVe5kDOOeKucpPQIdc8BKb4bfrgoY1TOAuZ/hD4W+EG24t+jejK8XxkWot/ISkQyRIL6WeMymJaardIUngTgNDCB5zNQYKTb7iOIZ6h6iQoOE8ihmohG8NvqXPmKlEjmyNbOGojI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by MN6PR08MB10386.namprd08.prod.outlook.com (2603:10b6:208:4f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Sun, 24 Aug
 2025 15:26:45 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::e881:2e05:573:2d6c%6]) with mapi id 15.20.9052.019; Sun, 24 Aug 2025
 15:26:45 +0000
Date: Sun, 24 Aug 2025 10:26:42 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs7222 - avoid enabling unused interrupts
Message-ID: <aKsvMswOOSIaCKci@nixie71>
References: <aKJxxgEWpNaNcUaW@nixie71>
 <jqtokes6treccrh4xuawyiidydhsitpl6kbyqov2ge2vroklrn@ly7uxtl6fnbf>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jqtokes6treccrh4xuawyiidydhsitpl6kbyqov2ge2vroklrn@ly7uxtl6fnbf>
X-ClientProxiedBy: DS7PR03CA0077.namprd03.prod.outlook.com
 (2603:10b6:5:3bb::22) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|MN6PR08MB10386:EE_
X-MS-Office365-Filtering-Correlation-Id: 38a5ff8e-695f-49a7-60da-08dde322a26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XMuIN/w+oTVfs9TlfcVSW4MwhMAsYzdO33MXQCu8mdzTr0+YsBpwe7pKu/VS?=
 =?us-ascii?Q?OIBt7D1Lq6DfCbVZvuwxi1rC7FTl9VgSjrVxgHvV/0W1kJDPIafNHYb9JRY6?=
 =?us-ascii?Q?1V79NzmyCAC6uTLLgkGLAkObdIe2aqKcPOc9ooT+ur60QW5DvdS1Ycba4Wdl?=
 =?us-ascii?Q?uVakuPftRnOtN29BJ668I6Sh+YwvZJFAYDdnXNkIAyDQzYz1Q1oLxYFYkGnX?=
 =?us-ascii?Q?IQlw5Lni5MgeRNIBYFMALp6Dkl+DXdL+cvCeqWxp9mE2q3K/GNEhL1p7gMRK?=
 =?us-ascii?Q?9pSYGpeXO+8fOmsYG8epTmm/vnCmKrIg2pIjzRm1X9HsGmJ1sDuDjLM3Yu8V?=
 =?us-ascii?Q?lzWxkx7S0IHTvefQDZgeSuitVxLZ2fcL1jiaX7Fe7PzF3z7YP2P/2iLJSsFG?=
 =?us-ascii?Q?3WuT+Qkb6IBjZx04keZmrksKsKb5lG5jot3Jt1TUt4IqHPz4j5KFHKu8P0kx?=
 =?us-ascii?Q?I52Gro5wwcDRHB/4Dz/w4exhvJTCeHriDyJxndHfwp5lDgfQgwj65jQcX513?=
 =?us-ascii?Q?9JWZ4Shf9EYkhMV7PEvOMBGb/2HnLzSAB9WupNd47N1jfjlOcqORnn9nn08Q?=
 =?us-ascii?Q?e1ekXinNlY8MkWtIYkowv/2V5oW7gZda/aERUHyoJp44OQvPfsEp07WRLkN5?=
 =?us-ascii?Q?cyxUHdDFSyqh2geGbOxr9z8RF2Je2q182OGGdux/b4/9RARXnCFVsxa73M3G?=
 =?us-ascii?Q?eupwl/3aT6ycYYoJPE5n4rZNWAJm+oaTRQLxr6NBb8LFvRqlm6SSxkUSjj0t?=
 =?us-ascii?Q?s+Ckd612dhPkFlwajswT3xXCzyJkqurBBCRWojHHqTtjA+qiTyhu9MdkaduW?=
 =?us-ascii?Q?b2xS8rKjg8l12u1DcxZudTYsv/Uw5pCJuH/+DAXQlQOij7rcaK9cNEojJCTF?=
 =?us-ascii?Q?RuNOpMJD16m/NjfGVi3/2qKZDLvskb1fQKqNfZlGqjLRiG0QTBf1wSKWHZ81?=
 =?us-ascii?Q?gaLGehJGprhmV1DzpGXfs4hhfD2C+M79ynZ/YOt+6VfxfS49o0LbGO/tXmb8?=
 =?us-ascii?Q?lVc3bULTJPherdUswAniprIW4Ugc0nOUpA/OAc6B5BgpI55PLaOP5rv1MhMg?=
 =?us-ascii?Q?mKNbyAUpHpmfLB91H8opsWzP6+vMLZq9uF5Byk6Gtpg8/g7KQOJA4+qOMUnG?=
 =?us-ascii?Q?XyvDhXs4RfvCMne6S2p9DpkybxccVZVKRsbSM5ddwgIbWWj6YO7eOprBA1H+?=
 =?us-ascii?Q?NSUR0C1b8WGdQklNsiQybD+6LP78WK+sKaE7630olO4+cLWjSeTq6VGOkbu5?=
 =?us-ascii?Q?4NCmA8iamEOoRk0IzNGpcd6ezPXrLzM/TTBYNw1oD0O1t3gOdz87kijZ8ySQ?=
 =?us-ascii?Q?zDv2+KJCj7bXvjcbCzOwuOw0B5VSOen90AhBsov9QDadC9eCqq7+zMaLam9g?=
 =?us-ascii?Q?1Nayg4mE4xJcUvWoPIks68K3Sd/s0X8f8exIqeK2wBXtqvn3aQ8Eq0iKfxCS?=
 =?us-ascii?Q?5T7dssc+1hE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q5p8M5pLofLKn5GLWDEvGfp8Duf/3N0mT9rDYbHX+N/GKHQVxOZ4I4VQx0MC?=
 =?us-ascii?Q?jCVtwHif0+Cj+x68N7eQ4z9iBH/KwtNvWxPn0wotVV+q3p7rOtcbfVkcACPc?=
 =?us-ascii?Q?Jw2qSAP0vyHWTSFLCSkJSYax7qtSRe3eMNKUKxmSKY+PUhcmte11i8F0Sg3W?=
 =?us-ascii?Q?g2hji4b4ZsifxDXw3lCae5aU1sQturxkUdRQn1jcJAYfKA71YoE+9S/tohgC?=
 =?us-ascii?Q?4sKP0R8c/ylK2p5SLrN8LYXySXaNN6+IHEJ4atzSrmCP60tVJKSkAPBvGwz4?=
 =?us-ascii?Q?uwn2SI+9DZ7RFaIBT5Q3K9AMpBfIgSITLUbWW3q7yIRZCjDf635mQnok+4NZ?=
 =?us-ascii?Q?0DDmoFc4LVNrIidOc9dHunnuJwz4/d5jNSh5JY+YO+zzfRZNXbMugW4VZZE0?=
 =?us-ascii?Q?abW8mN1MIYkzIWuyZQ1DImkK6Kvea87Iy+sbO1EeqRf+dLT10+RafrySM7oX?=
 =?us-ascii?Q?0yoMj9V3Z4uKQp3cD1RjO69N9CE87CyK3QYfjyFrxCDr6kAZjOqJaMMnr9y4?=
 =?us-ascii?Q?0QRU40ZJHblZK6vHg7cNhDUeaxsoYVSuIxttqntoXRrkbxq+GXtwCRKDb5ER?=
 =?us-ascii?Q?4asf1VJaTyWPpfL/vE4s4I2L07/HARC1YTrmKy0F6qxTO3DE/TLuUxifO6D6?=
 =?us-ascii?Q?BlaRKSt2h8SPTEu7r+BGDIA8pC+JXdhi9BgxhUlUrUd36KqybPXPes8j3/fC?=
 =?us-ascii?Q?cF7fK26dt3fuymYLsPqhr77hE2O0uF3EmffGlWbEdv02x59SXeqrjDjuWqMd?=
 =?us-ascii?Q?b4az70/d9hziUaGFzxK8aqRjxxgvlQu/hGwVXYO7aY3z9kKS2Q52NbQ99P3I?=
 =?us-ascii?Q?+V31VFOblh1bEPJK4XI8ICPcHTJ+w3d2Xmzw87kW/fB0VYRdraKXHOA3QAtq?=
 =?us-ascii?Q?JdDNKNhB0ArjVTHQbKdFZuLgf/v5zNTgiv1I/P3quwxQoXIDrlSpcmCfQmDK?=
 =?us-ascii?Q?tPh6y4smHzJscmE6PfggX9aQYlm7PjmRoD7Cm3J6i/jKuebn29PkQs9SSr97?=
 =?us-ascii?Q?X8grrNLF5bTNXasF5Sch1dYdt+RptD9grflxHplaBoCP2Ld9kWznt1qbpD2j?=
 =?us-ascii?Q?/eDAQpvW55HEjHsFUjQB4IdFD55lH4VbTKuqMYT9o1gIXRYM14dlCWLyYpHC?=
 =?us-ascii?Q?RdxeRkNh42q3aJB4oJhx5ck/TkcDrg/OLZCX7nyHhpDl0Wx+23OS3C4e5aqo?=
 =?us-ascii?Q?f3cgdnC2+kVMFPgYuOgCqg/BtMsgk/uOKqkkGuDaLe/oWOU2rEf0Kd1SLh7z?=
 =?us-ascii?Q?AXxAIsW/opiLGVxCeMJ6fawi0RTRHO2bR81bLLa2I0F+SxUlE7P+kVW73NlR?=
 =?us-ascii?Q?qad8/YZ7vTHqYwJanibBx0F8BmgNHofOsL2YKPrBc4O5YqHaC8XKYwB79kxu?=
 =?us-ascii?Q?1BzOQx/OWu1NVvOVCvHOWPjIl1PGwyAw2gfDr1ilLgFHUy5k2kdM1vXEeGvf?=
 =?us-ascii?Q?m5ch3hlMG/6xNLnwfGbGDexcfs1FjRYfJrqwNL/Y0PFT3+ljdj+qjXgW7Wd+?=
 =?us-ascii?Q?SSXWighV/C5prBEJGzOez1bEiV3Kc47J9KWI8BDEYHuvKOyfdlKdBiKQyhf0?=
 =?us-ascii?Q?taijMTecId/yINKjnOG+XnnYFV3hhj1m7yRvvoJ2?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38a5ff8e-695f-49a7-60da-08dde322a26d
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2025 15:26:45.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KWHIiXqcLDGG7PuEUQtkmvvx4xRogPoG4vMRLPgUwQCZxWIrE9sO1GE3gD73/eMyd044Fnp85wsfUD7FutGJ6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR08MB10386

Hi Dmitry,

On Sun, Aug 17, 2025 at 06:00:46PM -0700, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Sun, Aug 17, 2025 at 07:20:22PM -0500, Jeff LaBundy wrote:
> > If a proximity event node is defined so as to specify the wake-up
> > properties of the touch surface, the proximity event interrupt is
> > enabled unconditionally. This may result in unwanted interrupts.
> > 
> > Solve this problem by enabling the interrupt only if the event is
> > mapped to a key or switch code.
> 
> Should I tag this for stable?

Thank you for checking; I'm sorry for the delayed response. Yes, I
think it's fine to tag this for stable.

I didn't CC stable@ originally because I saw this patch as more of
an optimization than a bug fix, but it's low risk enough that it's
fine to include in stable kernels too.

> 
> > 
> > Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> > ---
> >  drivers/input/misc/iqs7222.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/input/misc/iqs7222.c b/drivers/input/misc/iqs7222.c
> > index 80b917944b51..ea26f85b9e9e 100644
> > --- a/drivers/input/misc/iqs7222.c
> > +++ b/drivers/input/misc/iqs7222.c
> > @@ -2424,6 +2424,9 @@ static int iqs7222_parse_chan(struct iqs7222_private *iqs7222,
> >  		if (error)
> >  			return error;
> >  
> > +		if (!iqs7222->kp_type[chan_index][i])
> > +			continue;
> > +
> >  		if (!dev_desc->event_offset)
> >  			continue;
> >  
> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy

