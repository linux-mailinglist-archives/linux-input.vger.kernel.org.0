Return-Path: <linux-input+bounces-6312-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B45970A52
	for <lists+linux-input@lfdr.de>; Mon,  9 Sep 2024 00:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 056FB1F216F7
	for <lists+linux-input@lfdr.de>; Sun,  8 Sep 2024 22:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA84317624C;
	Sun,  8 Sep 2024 22:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b="Zwl2/FiG"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2118.outbound.protection.outlook.com [40.107.92.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89422139CF2;
	Sun,  8 Sep 2024 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725833146; cv=fail; b=jpHAgD8XddXsPj7hQIXwyKakga731v6gVYKR/OlgUTCYBx7xNbwz8yVd9QQ/ZuFAxQkD8tLK88M7/TvgVGj047AQm40wuPvj/oJgrhx+WcK6JChDP0xsifCYc1IGKGrsHMUvy4lFGHtlFONMLUX+4rEMARGIf7YW5QWqdHHD6qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725833146; c=relaxed/simple;
	bh=mvDwbn9ShjMporY5q/BeilfCekEPBhx7d/uU/gcvu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=E5rVxh/w7lj6nkRMBunGx5OVvHbIMXmZ0fn16/yldQrhEfpo+F8ardkTBz766kVUxSTwAzfsBk5Fjy94NJx4qo0wv9x1QBRpj/5e8MHOgwyz6h22g07FTCgBs0Uj1VzRTEtORIhUUihAoy2KRCBhtKL3nC+jBrFLqruC1UpJJxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com; spf=pass smtp.mailfrom=labundy.com; dkim=pass (1024-bit key) header.d=NETORG5796793.onmicrosoft.com header.i=@NETORG5796793.onmicrosoft.com header.b=Zwl2/FiG; arc=fail smtp.client-ip=40.107.92.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=labundy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=labundy.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We6biwXcg/FbafwEWs8loHGnr3PO/TkXXzYXiz/JIubT7Kg/guO9Pk7OC6J9tTmfuVNH7horL2k1vhuztXU3Xy0JPjw+RVoLoaz4xu/03gUldMV/9RuoCKt2zifWQPetU1rUACJ171J+NVIs/KYWH/DtIff4xM/B8KCGC+FpKnKyqIt2K6HA8y3T041mzHI2DG9HGcKV6Kp/OKzlbZLFMmgDRXCQyVSMgSaTM/WdtZJr5jxAoQfpztXGmn46VoPwq+osotwXpWvAPjKIFbyDfyrkuSwpx7Tz34sAAboEtEhifHs6Tkto+7uLCjAiCetvWwO1pcMyaZLzNe3EOR8bVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xSFPfMyBvujE3xVXG/j+5lAtSbSQk9vK/Pwkl3VkHI=;
 b=XxZe/SoZdksf/BJdbIxTVHxT09mgDS+5NHfTqfSKIujMyuB32IQ4+1k8gcJ7QvRFJEniwf7vQMk2rTHF/2oyXbsZjkdl/ZPR5J+HAPJ+rmDKndWyRDPbtTjb5roE/VGji5vz/WOq5d2brxy6CTB3upfpYXFq2/FnweAWnxJ6MqLzoFKj+vNOjTSK5mUOGaodNcxK7rXsQCfgWzgR98NG+jL/ALHAonSiabRBfUxe0EwnCy4FezNrpdZragSLTXA5caDBFxabMIv2ZjapmanKoOpwUW+TacKp8KTXqNx6sMxlt1YExDn9/ag7lBR/8CFWSS1DBfFcKIGfkVxdePOxMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4xSFPfMyBvujE3xVXG/j+5lAtSbSQk9vK/Pwkl3VkHI=;
 b=Zwl2/FiGCkMwsjOSZugAJa+0bsAFYmkwS7p6Nmnu5RmZdCz2BAZeKrV4/s7mgXYpInRKyA/7IjNR022zSyj3jRzqBIc8z83Ev3E2WmLq19yWuJV1T27bA5mLD41XkZqAlmZDsIc5K5ia+uAGL+hoFsSEsH/Ui14w1YzqiPH17Ew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from BN7PR08MB3937.namprd08.prod.outlook.com (2603:10b6:406:8f::25)
 by CH3PR08MB9493.namprd08.prod.outlook.com (2603:10b6:610:1d0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Sun, 8 Sep
 2024 22:05:40 +0000
Received: from BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d]) by BN7PR08MB3937.namprd08.prod.outlook.com
 ([fe80::b729:b21d:93b4:504d%5]) with mapi id 15.20.7918.024; Sun, 8 Sep 2024
 22:05:40 +0000
Date: Sun, 8 Sep 2024 17:05:36 -0500
From: Jeff LaBundy <jeff@labundy.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Ville Syrjala <syrjala@sci.fi>,
	Support Opensource <support.opensource@diasemi.com>,
	Eddie James <eajames@linux.ibm.com>,
	Andrey Moiseev <o2g.org.ru@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/22] Input: iqs269a - use guard notation when acquiring
 mutex
Message-ID: <Zt4fsJI4SFhBo5ZX@nixie71>
References: <20240904044244.1042174-1-dmitry.torokhov@gmail.com>
 <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904044756.1047629-1-dmitry.torokhov@gmail.com>
X-ClientProxiedBy: SN6PR08CA0023.namprd08.prod.outlook.com
 (2603:10b6:805:66::36) To BN7PR08MB3937.namprd08.prod.outlook.com
 (2603:10b6:406:8f::25)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR08MB3937:EE_|CH3PR08MB9493:EE_
X-MS-Office365-Filtering-Correlation-Id: 47072873-483b-49ba-dd92-08dcd0526085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pKDPI2JUxjnhEO8iEjBtQnLLK1MP5vKlVhUV0Wq/xlKaIhZdRwtTLqmMcE5M?=
 =?us-ascii?Q?WLZeBOERMdc0/cK5PlqYJczHUruqr5AR3boU3X/kVGneuUdyTaYbsIO83hUq?=
 =?us-ascii?Q?byLqJFZF0WqF58TJ2FxwAnh+MAQy3bCYHlGtEtZhRfBk1peQlcBVrfceIgZi?=
 =?us-ascii?Q?iTwbe9A30TtmMxodqDnXzENrbQAfDBJgoP11hYwDl+treS66c7akagsLxxxN?=
 =?us-ascii?Q?5PdKTD3T67NzOO2D8m/bCJTVPk+LMecb2bGTh9vfG+/rBlX9TH1C9FvneRXv?=
 =?us-ascii?Q?Mv6D0jiTYtPMrGwCFbhnDcbgzSBEho3W48l7/Qb6pL0uX4my5MJlmtFhBWqD?=
 =?us-ascii?Q?rh5PpGdolDEzN1cLw1OVi+R+rPJKt4dD7uP8OPiJ0GrHaVZ1hoCkLA4n6uJc?=
 =?us-ascii?Q?rhw4WXfilu/bOrZByA4YgSs2daiCz5jo1i8GqwwZNxBCMESxZ70HI2MFPB2y?=
 =?us-ascii?Q?rA5aUr/DCZMQamOOfSplkMlsN6FXRG/9iDXJnMKxvHNBijvL6A7RAoTJEM7b?=
 =?us-ascii?Q?9FeXH1KY21LP0sctXZw1PNJRANNklrnX+yVoavB/UBY/NhaajIZOsbLofMYS?=
 =?us-ascii?Q?FD5VpVw/UyHkUOLr7mcJ4zOjqIoYOjEFodsgKwoMR2gEIwYQWIhNuI6pbhxx?=
 =?us-ascii?Q?vz8Oh/Ua6TIkiNV68lv769df3lIaX1caDsL4fguPrWvq/IySL6pXrXDh3oDN?=
 =?us-ascii?Q?pJbWlQi9VR0kh0Ms7/adaMSXtXes7tOtNbTE9/Oik6Nuh0bXXeWkxM3LTcUW?=
 =?us-ascii?Q?BSzh7cD6XXntXhaEtYedXYNRXLOE3RWJZwcUUJxXrL0Bh9o5QNnqKTo+a68k?=
 =?us-ascii?Q?D7WqwEYrcI6M1A1bBRg7T1fXiXhGybhTUCCzcwGRQ1/iqFZjDM8oYE4Ftr4H?=
 =?us-ascii?Q?nkdvZlnwv91QTBvm98ViHPDZdY26VmqooOEYmQvnWWlVQhPJJRx1x9pUC50o?=
 =?us-ascii?Q?JX2lUtTOOH+yDW01q5dDZxiPuWzFa7FYNiTKgjN43RYRZTytlhCG6mi9XWgV?=
 =?us-ascii?Q?9mMInCzwjCOW3BEbdeLpHbod2Kq5k3tu8Y6BluXoz9vhT2wlF+m8qGVX6+qC?=
 =?us-ascii?Q?7JyUDS6cZsLZnt0oxTWwW4jERmgLMA8GKBi/tVZQVTE4g7Ha4bJJOBHzu7c9?=
 =?us-ascii?Q?ElWMfBvS3DvvhurybdrcZehcToP1NijH1trkA/6QUvO7t72vCvRXnkFQrK8U?=
 =?us-ascii?Q?nzLBhFO8BZV0Zz+bL6+Mp1qoO9g2dYvpdJpkPlcN1umC/qFiZuU+gY2I7vU2?=
 =?us-ascii?Q?jkAnqJz7yYeV/Cnyye3yrSSn21yS+7yfaCtSrz+Uaj9+bqQDwMAMjyzJbtIk?=
 =?us-ascii?Q?1y04X2eqItc/Vl6Km1cqDj8OXCqC9AaEQgvk01gfIbGicA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR08MB3937.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zN1ywzp00/0MPkBF9kfmOge7eVCmLozEgpwRJv8bwuLRtJ4kQlk9fO90Yy7M?=
 =?us-ascii?Q?7+/U8Lq94Z9T+7SprPcOR9SypBupUDYgf4jjSw2ttbuhE5aiSOo2h+SALVno?=
 =?us-ascii?Q?YvpcTrC5L9L2knXrYXpAcqKdgPsu/dC7Jq7hkYGfEaSsgE6Zs4beLkyeWSxT?=
 =?us-ascii?Q?wl53Jcb1jIxP0xGx5sBpm2GK+hjf6/qRU+zFNbyyBjGkG+TleOFoq7l7yVgk?=
 =?us-ascii?Q?pkLDwoYPs3QcP91Y+ksJvQYuR6pD4+dr3RfknHEB4dG6DglPYeClsJhbyeHc?=
 =?us-ascii?Q?/5vhByxLWQwbSyw2m7K6PjIFVy6ZjiWlPafJKEXEItMZ9eZr2b/cTWGchqZY?=
 =?us-ascii?Q?YOEOkOFGlj9zdP9HVa5F1gruPx0GH3hnMSFQ0jLG3Zihq/XVPkgVwUpqH+8g?=
 =?us-ascii?Q?+g898YGpkmPotAFMx5McrCDvU37+z1vOSNbsSKElfWxeeZyTuSnzwdzrYC/b?=
 =?us-ascii?Q?Rk7k/pClmU5CsuNoN3sfbxfzTmSQq3f7PPlSPM0AJ5wVvtK9ZEeME94C3Xe/?=
 =?us-ascii?Q?LHWNPA17HRS1otT/ugdH3BjWHi4kkg4Z3SDbUpwC2YEuG7fX/3eyenEPoD8n?=
 =?us-ascii?Q?dqq1shWmvuzHq8TmYVkdMScuffZLz49oXughE/KM2FzTnbmxad5MYNULj1gJ?=
 =?us-ascii?Q?DPc5GgiNl87x5UFnS5Nie/zmn2SpvueU8qqBVwFVYy+2jcQRRvAN1wlf7ldF?=
 =?us-ascii?Q?8hxdupimZkp5qs/9cxgAK8buM+eXHae8T1OuKMHueZaaKYn4mk+YzyHZVjTG?=
 =?us-ascii?Q?E6jXuL/tlqHH/32XMkB5HaLac+jb8QjD8/pmVmyfbo1D00d6qgn26Vi3xRkd?=
 =?us-ascii?Q?yeblMZ0u6oWeyUcSrIKxyt3ryDyG7ZB6X2uobck1LbRp5muDjIxRmfA4wjmL?=
 =?us-ascii?Q?h0LlL+WY+wvKzq1VdCvg5jx/7zvyUvjuLHB/ZaBUKdFp/gMkDDkOMI042wAc?=
 =?us-ascii?Q?a1RfdiYidGLymc3+4sUAJmrbnk8bo/9WdTh+LBVlSVuo2stva7iERyq6gTnq?=
 =?us-ascii?Q?++wqns0/8UmhqapcKhdEUn9gv1h6OxWlPAh4+NYxvmyCkirVOmoAkS/CCM/J?=
 =?us-ascii?Q?XsKAu2yLeChNLVhj+v91qAeH7KMkayaGfNGcOr+QI6aoXsuP9S2z0hkJyT3/?=
 =?us-ascii?Q?/vccuedc1dNCD8eSQ9ldTiqMZf5VPaM8kGNXc/JdrNVEqDxxmqgGD3QNYNBL?=
 =?us-ascii?Q?WyBARVLZkEbbDh3fFOw5Xoz224GAs4ohcYptIP49aqAmrMnTZ4gQnhOFNQLK?=
 =?us-ascii?Q?M7VkmsrR21zm4gmfc6VkvMLF4xNkdEf3DbG/FLayppA8bZ7pLljy1pgZc7j1?=
 =?us-ascii?Q?Kh/d7+V3WTEy+ryhYImn4i0nGG3CYCS6oH13jb1JPDcbdUNTN6x2MW7m0Il8?=
 =?us-ascii?Q?NmZ8QNWEA4pTek5zFBQ7/3NM6ifTFH5CjnKb1NtPg+7txV7TVkOvdU7nRQGV?=
 =?us-ascii?Q?I71RsoLQKeO5S4ESnFPGn0d+C2423gTcvNXQ74wlloj+/x+eTl6RuU9Fa+zo?=
 =?us-ascii?Q?WWJWKYb5C0fUef5rOOl4e0O/zdPdTBG5wKLRy2kQ/GZO5hPjV+h3szCr+hoQ?=
 =?us-ascii?Q?IUnDJTpPKcQIZnw2GtjdwlZ1OrrIQ4wDpxFAfPCz?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47072873-483b-49ba-dd92-08dcd0526085
X-MS-Exchange-CrossTenant-AuthSource: BN7PR08MB3937.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 22:05:40.6788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6oA273QadH8xVYpqIhKIIHrd8f/K7ivXJWxoanA0/OvZpnsx2tEwp073qFQHGKpyVLwaPWm51J6XfF6c/0XOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR08MB9493

Hi Dmitry,

On Tue, Sep 03, 2024 at 09:47:55PM -0700, Dmitry Torokhov wrote:
> Using guard notation makes the code more compact and error handling
> more robust by ensuring that mutexes are released in all code paths
> when control leaves critical section.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

> ---
>  drivers/input/misc/iqs269a.c | 46 +++++++++++++-----------------------
>  1 file changed, 16 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/input/misc/iqs269a.c b/drivers/input/misc/iqs269a.c
> index 843f8a3f3410..c34d847fa4af 100644
> --- a/drivers/input/misc/iqs269a.c
> +++ b/drivers/input/misc/iqs269a.c
> @@ -365,7 +365,7 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
>  	if (mode > IQS269_CHx_ENG_A_ATI_MODE_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
>  
> @@ -375,8 +375,6 @@ static int iqs269_ati_mode_set(struct iqs269_private *iqs269,
>  	ch_reg[ch_num].engine_a = cpu_to_be16(engine_a);
>  	iqs269->ati_current = false;
>  
> -	mutex_unlock(&iqs269->lock);
> -
>  	return 0;
>  }
>  
> @@ -389,9 +387,9 @@ static int iqs269_ati_mode_get(struct iqs269_private *iqs269,
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
> +
>  	engine_a = be16_to_cpu(ch_reg[ch_num].engine_a);
> -	mutex_unlock(&iqs269->lock);
>  
>  	engine_a &= IQS269_CHx_ENG_A_ATI_MODE_MASK;
>  	*mode = (engine_a >> IQS269_CHx_ENG_A_ATI_MODE_SHIFT);
> @@ -429,7 +427,7 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
>  		return -EINVAL;
>  	}
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  
> @@ -439,8 +437,6 @@ static int iqs269_ati_base_set(struct iqs269_private *iqs269,
>  	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
>  	iqs269->ati_current = false;
>  
> -	mutex_unlock(&iqs269->lock);
> -
>  	return 0;
>  }
>  
> @@ -453,9 +449,9 @@ static int iqs269_ati_base_get(struct iqs269_private *iqs269,
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
> +
>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> -	mutex_unlock(&iqs269->lock);
>  
>  	switch (engine_b & IQS269_CHx_ENG_B_ATI_BASE_MASK) {
>  	case IQS269_CHx_ENG_B_ATI_BASE_75:
> @@ -491,7 +487,7 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  	if (target > IQS269_CHx_ENG_B_ATI_TARGET_MAX)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  
> @@ -501,8 +497,6 @@ static int iqs269_ati_target_set(struct iqs269_private *iqs269,
>  	ch_reg[ch_num].engine_b = cpu_to_be16(engine_b);
>  	iqs269->ati_current = false;
>  
> -	mutex_unlock(&iqs269->lock);
> -
>  	return 0;
>  }
>  
> @@ -515,10 +509,9 @@ static int iqs269_ati_target_get(struct iqs269_private *iqs269,
>  	if (ch_num >= IQS269_NUM_CH)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> -	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
> -	mutex_unlock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
> +	engine_b = be16_to_cpu(ch_reg[ch_num].engine_b);
>  	*target = (engine_b & IQS269_CHx_ENG_B_ATI_TARGET_MASK) * 32;
>  
>  	return 0;
> @@ -1199,7 +1192,7 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
>  {
>  	int error;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	/*
>  	 * Early revisions of silicon require the following workaround in order
> @@ -1210,19 +1203,19 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
>  		error = regmap_multi_reg_write(iqs269->regmap, iqs269_tws_init,
>  					       ARRAY_SIZE(iqs269_tws_init));
>  		if (error)
> -			goto err_mutex;
> +			return error;
>  	}
>  
>  	error = regmap_update_bits(iqs269->regmap, IQS269_HALL_UI,
>  				   IQS269_HALL_UI_ENABLE,
>  				   iqs269->hall_enable ? ~0 : 0);
>  	if (error)
> -		goto err_mutex;
> +		return error;
>  
>  	error = regmap_raw_write(iqs269->regmap, IQS269_SYS_SETTINGS,
>  				 &iqs269->sys_reg, sizeof(iqs269->sys_reg));
>  	if (error)
> -		goto err_mutex;
> +		return error;
>  
>  	/*
>  	 * The following delay gives the device time to deassert its RDY output
> @@ -1232,10 +1225,7 @@ static int iqs269_dev_init(struct iqs269_private *iqs269)
>  
>  	iqs269->ati_current = true;
>  
> -err_mutex:
> -	mutex_unlock(&iqs269->lock);
> -
> -	return error;
> +	return 0;
>  }
>  
>  static int iqs269_input_init(struct iqs269_private *iqs269)
> @@ -1580,13 +1570,11 @@ static ssize_t hall_enable_store(struct device *dev,
>  	if (error)
>  		return error;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	iqs269->hall_enable = val;
>  	iqs269->ati_current = false;
>  
> -	mutex_unlock(&iqs269->lock);
> -
>  	return count;
>  }
>  
> @@ -1643,13 +1631,11 @@ static ssize_t rx_enable_store(struct device *dev,
>  	if (val > 0xFF)
>  		return -EINVAL;
>  
> -	mutex_lock(&iqs269->lock);
> +	guard(mutex)(&iqs269->lock);
>  
>  	ch_reg[iqs269->ch_num].rx_enable = val;
>  	iqs269->ati_current = false;
>  
> -	mutex_unlock(&iqs269->lock);
> -
>  	return count;
>  }
>  
> -- 
> 2.46.0.469.g59c65b2a67-goog
> 

Kind regards,
Jeff LaBundy

