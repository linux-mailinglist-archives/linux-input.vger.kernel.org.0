Return-Path: <linux-input+bounces-10195-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B314A3C51F
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 17:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 419E13A985A
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 16:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1051FCCFD;
	Wed, 19 Feb 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="wnYEqBr0"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170251991A9;
	Wed, 19 Feb 2025 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982903; cv=fail; b=qNrObSadCwJWfFtbrKO9/6wQ//tQj6lZT4kFHZlhYJx2p2sc7cV3eITX7fGh5dceGixm67gx2YHo1rYQKC8f0nwkdjNclOv8cibIyXYHwDubD6zQP+DzA9xGbKQAcNB4uDfRWVdn1l7A8S85+SfGhxYgN42PiNS0kDkW5y8O4c4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982903; c=relaxed/simple;
	bh=0Pt8o0ujHCH/ME59+dTRl1/g+Yth2F+FygWBqCx7EHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=t+z/4KY3kuOahpWAiJqeF7GqVSMdbNyH/Tv34SLW0zA5XsWP8b4Zt21JbfswsuzxpMPxt54yl2CwgktTCd4He4uI6X+cfTFoAsQ42LzNzfpjq1lNawJYJhLql0aNtuQfT3/FAHGP1We+UiUNz3G/bYJm8hduVjQW4Ddq+R0oToM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=wnYEqBr0; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzbu4++wCyg/3ltFJNeAe9p+jFdlA22zZg1NuE3WLPkugjdMUd0f5tC+PVlYsKZODkN5B+RK07UEy1mN4geVBqy2fsrnKjUXYfMhxFVCWUjBwWBE2dVV9Da39cXM95276ITINY7WPhJOVfUpbR3Z/jOk2t54Bc2rOkNi2wX87H/p/tRfd61/Ll2R0Z0uhcGcLsa9cw9QaGQi+kNoAQlmMDUddrUEFZcoXoJ8Qd0uhg4hmuwd4iHKzMzyEi1avf3ARkSqbixPI5LqVDDmXuNEpP6QVcuCx8roSygNfXZqYBiHjXnCGFeJn1FmcFruGwUC4SCvuQ/MeeeP3reC5kbElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f1yIRe3HCjhgdT0xXdNQ/38ADeBnlfrHjc851ReLVUM=;
 b=V4oRhrpT7xRBvLCushAKOSfOZHSP7ElxYpilcLoFla6d8J/4WR7ALcYE1t0MR0K45dFZyLjxNb0fJ67ea34oriw/TTNC73NMSC/ldA+mwjmWfcp3zq2r1SmPly020fF9D8UWU+ueGsUAbOfXzzmF7E4PSQNvpamNIMWCSNURVE+F7q5wC3d0n6YyvVkeomZ6wLCMBrfkM8iZ3q9XF555QLiFPixLeFsvWUPvS69JzKApOmLGhyHS0MRjb69g+5OgmJHwnk0djRYaKkFQWIr3DVcg3GjySb5//R8dwZJrUpU/3BfeUH5RuyPA7h2CcFwOla1tMA0+0FzPtiENdpASSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f1yIRe3HCjhgdT0xXdNQ/38ADeBnlfrHjc851ReLVUM=;
 b=wnYEqBr0gHf+jefLafzhMephU9m9SJ0qhHgguPTYnuKog0h5tqvvSrdPZYoQjMZUIRJT7gpeRGlqsGvdjS+/1rlAscCRHYQHoQJwZX/Yi/MtqhwXh2/LTNgREhE79JBO03mHB6gd2l50LvnW+XGSeiUfdcFcxgyNh+N+qlmWbl9nYF8vKpkSOOubPCuEb/Sw0gkzGewrTpvINQmT+Nev+HO/kwKn2HFn2QgAMPuFE9KOKdpOCbyGYLNMyd0skOIP+3LyUUeZHg+LD8Th/vntSDBdMEeqxB9oApcCFBFlPkFZHv9f9M4iL0W62y4+ekO4TyWIqiJEVhBBCUpMb85O/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com (2603:10a6:20b:29d::16)
 by VI1PR03MB9986.eurprd03.prod.outlook.com (2603:10a6:800:1c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 16:34:56 +0000
Received: from AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8]) by AS8PR03MB6775.eurprd03.prod.outlook.com
 ([fe80::8a03:2bdb:89c5:32e8%4]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 16:34:55 +0000
Date: Wed, 19 Feb 2025 17:34:49 +0100
From: Manuel Traut <manuel.traut@mt.com>
To: Markus Burri <markus.burri@mt.com>
Cc: linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/7] Input: matrix_keypad - use fsleep for variable
 delay duration
Message-ID: <Z7YIKaG0jBHV2FSE@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
 <20250110054906.354296-2-markus.burri@mt.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110054906.354296-2-markus.burri@mt.com>
X-ClientProxiedBy: ZR2P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::15) To AS8PR03MB6775.eurprd03.prod.outlook.com
 (2603:10a6:20b:29d::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB6775:EE_|VI1PR03MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: 146d0ed9-585a-4e5a-6bdb-08dd510357de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W7pSLiA2MLg4Xu8mUaZrEjyn+4e79YVRHzAqifakhsnL1orLk4EXf1fdeAek?=
 =?us-ascii?Q?P+7ik9NSBOyyzSMAdTDB6nwZ6bnLq/miPb5QiBTL/Os0lEbkvQA/vPiOxiVE?=
 =?us-ascii?Q?t+CZ5k/Y+OZrR4qLsBUaqZeUyKczKOW6Yr5lW5qG5aLdQZH2jAvw/jknK1Gi?=
 =?us-ascii?Q?zYRa5NZv6OLYaO4zvQMLBEhKjJxapwUtjpCBWsH7HXcn58mKrFh1j3OLWfkJ?=
 =?us-ascii?Q?QRLBoOx2wVgrEU6iON3KXWleWarQm91Kg1RlbcnZLlLqvi9CracdPYY1Gf3U?=
 =?us-ascii?Q?17/4bliyucAv7hnWKfx1tC2My7XDYbQ7NsPBBpts9Wt7ohmhrjx2CWj3qOze?=
 =?us-ascii?Q?LnjBmiKH3Xx4y8SMlQ4tUvxThwJTfVKuhMn9t0VzJJMpsv+4eAKMsdwmYfMg?=
 =?us-ascii?Q?/o5cBvqqSRpbfWXRS9ohfoVpj4eJHsDhsGDOR/N6DBrJMJyk8xAQeoNFQoSc?=
 =?us-ascii?Q?Qos1ZeM2pqpgm4rhrulKFba1pegGyGgxEu5M8P8rU+T1GNbes/DCbl8Zi25q?=
 =?us-ascii?Q?pPEfpzQPHFQRBv8Bfi3BD/adTOOk8W8Odzj8fAlnFWlZpL+0No6/v9WYXTxC?=
 =?us-ascii?Q?mPt+2l4E9JS3w48LyLtDxMf5bfNuJ04ZhCEHGBZiRt4m6unQqEpOHNJV9cPy?=
 =?us-ascii?Q?zBFd8GhmeeJqWosWMB6No4IiDkYJt/i0lP2XuH3o+i9C4K1F2L36m2JvvcUP?=
 =?us-ascii?Q?Sp+K67ik4SpfFNUwiDl5aVz0DFNpVL+k2ELmFFrZpXdx/Yb4BWeBKx3eSEzr?=
 =?us-ascii?Q?TTGvC8M5KSbO+I+LAlzqmjglGU8yC6en74LJKAqAECDjiqtiBmuYZxH/9giW?=
 =?us-ascii?Q?RKwXsr+9yWSBnuYyImsdm7orApD6pMP/6eFh5C/+/BmocIsCz7eokStL1Pi8?=
 =?us-ascii?Q?S2k/JmcxAP6isFoWWrrpb20MLdGaaefNELKvRXYcz4iBMfz7PQGeIfb2ZEyp?=
 =?us-ascii?Q?rJpzEwdxe5WtS0xh8rbYwMEW95qhjw0gaTCTRZNpZvx47Ron3dixuT7ltHOf?=
 =?us-ascii?Q?LDPavY/oy+f9wF7VXJRxUGYYv+vNJX95/+05W8eHe6qICoNbmpnZ7/hF0WRc?=
 =?us-ascii?Q?EPrOxkxhrR3yPObBBaTQnKQmJ5Vl43J1JjBrXXnOMEWXFCvh/VVcx0W5Lpcv?=
 =?us-ascii?Q?deaG0OBvEP4naXzH7SaegTdh/lOEP2yZquZfzDU/ELEh8yvKhkG4AWdWG8Kq?=
 =?us-ascii?Q?iRTtb0AbQIvhq/T7Ph2P0gx9wBF/fxFnwN7rlFjh7WpdpgK06WMu2xvxnWzz?=
 =?us-ascii?Q?qkoSj1+BljD4KZeIdhUchYnQD+qMAbkXsyvAEQripreXlJvytDz3UsaQ+XPg?=
 =?us-ascii?Q?iuWVLOOJO+ua0DJ0+nzOvQCLxS/XjdVKlGm+L1ra2gbYay6GBas0YBRwgRB5?=
 =?us-ascii?Q?JnW8YuX+HUnAspvWEZjIOn7a2Ft5MjXQ+PhzIRlEsb/sVKDnhgajGsH0JAbI?=
 =?us-ascii?Q?Hu4MMxxoMGjhR2mrO20MgFrTB7OpD9Uw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB6775.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IkQdK10iVaKIXiHZRTHZrvGSDR7DXp3FuaReIqzPLY6OYVMbIunpCIzhI21a?=
 =?us-ascii?Q?b3t91VQUtm9PWWttO2EhAlFJAtG+R701BP5uL0iEuwxX1XWB7U9ImDNNpY22?=
 =?us-ascii?Q?3Z8mQ8fffiajTP+H4OvaqdbmRFoNd/UE3vCz+zB6jai/SWZGHO05wffLqnki?=
 =?us-ascii?Q?37hCGoeFmvtfWxzm6fCYfvYZ2m7Ux5Th85Lhieqw5qgdkza++9uNiU4IR8+R?=
 =?us-ascii?Q?PcJP0P/cErWf1jNAqrfh/jp3Er8wnslUpMYZ0yNDCGO6EOW2/sukOyge4woB?=
 =?us-ascii?Q?jqglN7zWfxug7uP35XD/hWvyMyPkwtVN0/BpzwAG84A463FuoABLEVG6iBlw?=
 =?us-ascii?Q?5YxvdlSRz5SRmypZvMoRvB3Gw3k+F3wyRNc7K0Fiz07xvIc1sEHxaAH2z2V5?=
 =?us-ascii?Q?vigXwtE8YGG3fHnnvyh3W6qkpkr+QKy/9pwU5odilVE5tiqkHaicrbyk70wo?=
 =?us-ascii?Q?Z0xatVwgav+KznO5dq/Y8aRxBsFEVK3t3f/dERdFPjYpp/XwBV5JYnoZ/qbq?=
 =?us-ascii?Q?oiM8Y8bBrWgNrehdQc0UMy2HtUt3FQ3iOXZPtIYyoOKgVVanwXNP2W/a06my?=
 =?us-ascii?Q?XJwjzjFLYYv1wz7X/MiTD/FZnSnsMX48Fr7/iUcwCLlKYFiGTehbqK0BoNwm?=
 =?us-ascii?Q?zHDzK1jr84JakpA1DgzTxvMILeJ3lEaxpDRLvJvaKRixlTV80BncVsGnes+M?=
 =?us-ascii?Q?k6HRKQ1obH6a7RvEJVWi5HhLR/ap/ksk88O7ONiD/O0/u/NFIVa4NTVhfVLn?=
 =?us-ascii?Q?y6D79LX1gCmyjspznbYSa2gRhO+jaSfwfPsoshhxRH+wM0fU2aYLM3ZA2Ylb?=
 =?us-ascii?Q?66jV06mxxQxNPfmPbkQrV56LFyzuMWppF8YjE3eBXBoORizEQ2wfc/xRjzdu?=
 =?us-ascii?Q?FbNxqyRYV1kaoyyDb2bX2ClRuilygl32ciaDrr+N1uud0Ufc2eSo+aYIaxy+?=
 =?us-ascii?Q?ZNPW3BjMZDC2e//roPLtHrpdqnzVctRF5/tj2NQV+0y3GrFfpARSeX9GFtn+?=
 =?us-ascii?Q?EkW/jriC8+Uee7zSLh509j5FZhnDYdOsYt04bQ/aYp05wtLcISZ+l58ckZhl?=
 =?us-ascii?Q?dwJ+Xhf9dsf5iMmW9zL1wvbeJG5ASr+Ttq4qpHPuR8ioyf/sodbiU1nMqaku?=
 =?us-ascii?Q?x5PW0l6L9qk20AbxceAl5dasmiQ8DpvHO/uXYxkxTC0kfFxHUuKVY58epBoU?=
 =?us-ascii?Q?qiFiVzsmKleAdQfzLmE0rFWrO8yBmbJ0HCQK7P1UyzqVVemkVQggE4wOyG4N?=
 =?us-ascii?Q?qdp0OuRroNQO/Va5tA4UgRY0fbO6Du/h5hoSwOjusbYwwR8jX3ZaRj2iotjw?=
 =?us-ascii?Q?quhte/ywNtanBg8ZDil0SojkBFu+wOhqhoXzFNTltjshiLRAFS366cP4fAsC?=
 =?us-ascii?Q?jJhxuLF63uxDVWsmBOZcW5RfDouS3SeGsK98uQNA0fz4hUM8KlrS4v+PMho/?=
 =?us-ascii?Q?wZM2n6+Jcjq3oF7rsehVNhgFGLv/yDnZ8rFFJUfk+sNi7zwfUAbIChvWrP/U?=
 =?us-ascii?Q?Dwv8/Wslf0QuTDppZ8uHMWvcU7noW9xN1v6l/jjjaEhIrEmILXM3MNX6JNoS?=
 =?us-ascii?Q?61L52+JHKdgPvoVUi2fIdIOHo7kYXhrmK7Kcw8b6?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 146d0ed9-585a-4e5a-6bdb-08dd510357de
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB6775.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 16:34:55.8806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DQdZrwd9BgE4z9itQiRUFcFctaRfYAN2v48ip4Q+gSmOQ6fUuFOyuzTTQheYqMJn+HEDxIYRm4/nnUWooZDkBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9986

On Fri, Jan 10, 2025 at 06:49:00AM +0100, Markus Burri wrote:
> The delay is retrieved from a device-tree property, so the duration is
> variable. fsleep guesses the best delay function based on duration.
> 
> see Documentation/timers/delay_sleep_functions.rst
> 
> Signed-off-by: Markus Burri <markus.burri@mt.com>

Reviewed-by: Manuel Traut <manuel.traut@mt.com> 

> ---
>  drivers/input/keyboard/matrix_keypad.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
> index 2a3b3bf..5571d2e 100644
> --- a/drivers/input/keyboard/matrix_keypad.c
> +++ b/drivers/input/keyboard/matrix_keypad.c
> @@ -68,7 +68,7 @@ static void activate_col(struct matrix_keypad *keypad, int col, bool on)
>  	__activate_col(keypad, col, on);
>  
>  	if (on && keypad->col_scan_delay_us)
> -		udelay(keypad->col_scan_delay_us);
> +		fsleep(keypad->col_scan_delay_us);
>  }
>  
>  static void activate_all_cols(struct matrix_keypad *keypad, bool on)
> -- 
> 2.39.5
> 

