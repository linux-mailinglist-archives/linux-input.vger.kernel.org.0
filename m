Return-Path: <linux-input+bounces-3716-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132628C69AA
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 17:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6609DB21ABE
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2024 15:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 689EE155A3C;
	Wed, 15 May 2024 15:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rh3QMaMn"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2046.outbound.protection.outlook.com [40.107.96.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE8B156236;
	Wed, 15 May 2024 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715786889; cv=fail; b=cvJBfwgBQ6qbemKuuSZnp8ZQOc46o5WpBvhKdr3OiA0dEj11PS7K+SQEUKWV7jU5eXa/q1pNMnhF3C+79xIqQkxaJjiFN9f/DINQ3SOniRXQXYBJ/uFW0j3cIbIE6ZtJcIixrks9VfZ8tQVWg9u0oCgzyMRg3wjKlne7sxK//W4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715786889; c=relaxed/simple;
	bh=qA69KZBtUD4wCcyxuZ7W+7w0zxlJ94RnEy8zmjm3tz8=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 Content-Type:MIME-Version; b=eA5eau8pd6rVfQP8/sPCMuDlOcOSvFv3XzSQVqsqF7C0lcxWEu+Q2lOYmuafvSg0h7/wN+DrLqZacJ6J/m0OFz+yvVkvv3YLMl74qt1UsyqUcrxPc4J7vlXJoKRSbcqGbpjwvXIBkpHBP7+7rVRm7QH8JW4RKGkvl42bqPCyfJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rh3QMaMn; arc=fail smtp.client-ip=40.107.96.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZaZXZow+Xj48r3+ch8PjFVQYufqrpBvxSkTwk3T21FIaULl3WAtHf+cGXEyP1XwRJ2q3tY/cx6hMGlcXC5mpJJhJjDCRme9bH+1V4ozlof80TNg6hpN5wKrtL66ZJrdFAPQIcXepNp6EjV9WfOtg5RN18YGSrc09+xKuhoYnU4d/qREhWTK3Q1tPglkyC/zImLy/bhtrVvDrLfYchxDhJ5WaLRvTIPkjhqwSduEcp97MZvf5RIJnZpWAizU5qIRyInU3ywTPHoMmRwkp6eDszm/tqmHcOpRU4d9e20NE3Ndi67wuJpi0DUD4hhItn/bPCpWclMBGYqGuV5nmVZRh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lc5u32G0aCI5UOXiTUZYapPD/Xu3jL1+pgFTDazWA9w=;
 b=JRyKnT96kQTq0iBqjw3ZWnfzeI/Rm3BMerF79V6Ai1ksVmSrcP4HILzPLHPaJqSPgWxG89xJdHnmpLMKbC7mkrfs2IwUrAZIQQ25ZhW0n2XUYqXoBUvRGBKXthjsvYI31pr0JLkziz+kkCWXYGLwcQWVgS8TuJ8zcv8Zd5xeWlVL762A1x5lQoj1jqyKy5F2dRjkKKA5rgUojCPvN1ipQ6+ugTLGpT4mefY8RD7wG9Ar4eZ3ZKPlxj7LIQkvP7Sec480exijhfrDrnMWIsZWPd5adxD7nrzMCAWGhv9ENcqO9d7IQ+Ut5aPmjylb7TsD9Jju3aBiFMQI+V6pBrjBcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lc5u32G0aCI5UOXiTUZYapPD/Xu3jL1+pgFTDazWA9w=;
 b=rh3QMaMnhagDpqU3TzApplO1Q3cCYbZxR5CNE3FnGISRUovfFZH7gRvt8RjSvzdhgue4wV+Hk9nY6Fp3voAKwlalfsiXKt/9g3jbP4GGxdwl0wLOFXG0m/fDCvMuCdc4RPonHBKNCZV0aCKkc8+fP2CHN4QxjvFFZZwJxc+Z20ATSHzVUK8ZHPCNxWO357ckKnPwqgU/x6bg8P1VMj9cD9eCYdrwRFySw1QMkl5Zzpe4DrSaga6IIuxVd9vxtn6DXacXFE+qLDNENLlBLFKt3icxLhlX6aFfFoh15vKXGYbCcpdkMOBMEaoEPLr8oOoH1IaVRwbXjjZ3uQphd98syQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8775.namprd12.prod.outlook.com (2603:10b6:510:28e::19)
 by SJ2PR12MB7992.namprd12.prod.outlook.com (2603:10b6:a03:4c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25; Wed, 15 May
 2024 15:28:04 +0000
Received: from PH0PR12MB8775.namprd12.prod.outlook.com
 ([fe80::bce1:cfa8:f5cc:dcfe]) by PH0PR12MB8775.namprd12.prod.outlook.com
 ([fe80::bce1:cfa8:f5cc:dcfe%7]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 15:28:03 +0000
References: <20240515033051.2693390-1-nichen@iscas.ac.cn>
User-agent: mu4e 1.10.8; emacs 28.2
From: Rahul Rameshbabu <rrameshbabu@nvidia.com>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: jikos@kernel.org, bentiss@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: nvidia-shield: Add missing check for
 input_ff_create_memless
Date: Wed, 15 May 2024 07:59:33 -0700
In-reply-to: <20240515033051.2693390-1-nichen@iscas.ac.cn>
Message-ID: <87jzjvgkn1.fsf@nvidia.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PH0PR12MB8775.namprd12.prod.outlook.com
 (2603:10b6:510:28e::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8775:EE_|SJ2PR12MB7992:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a405587-e770-41f7-8605-08dc74f39cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XCkdha3x6FYZUZP1YzZqAk+XXX7/VcqoewAZMdVn3qChOyMfYiKgnybSWwCx?=
 =?us-ascii?Q?B2zUe5UzXlZdxcBZz9yQmK/NaQK7MdgRuopicgWpQttA4V+zZHgEtiljhBvh?=
 =?us-ascii?Q?4Rz8oqMy1UsDHaA6I1zA257GADRnu/1TLoxxkQJnxSu2lnePXYyYZbK9cAq0?=
 =?us-ascii?Q?UeEgtr7xpbrT3MI9h+mfvbzjbTy4AUrpRbvJY3Nbp5Wg8WDfSLEztPR6g4o4?=
 =?us-ascii?Q?fKVbuOIsmaiiU5h7KhLb7wBig2n9AiiyNpVZo53C17uPd/DaV+yE8rLfl0Gk?=
 =?us-ascii?Q?4+V71TpReoEU9Bdp8IozeEXher5y5DOWyvRgOZBKId45xSokTz2/yrUTW+iE?=
 =?us-ascii?Q?2dmUzACkPgHz26cxPexienRH55/T7uOIWobrUKtLlGn3/FO80L1Lv2Tzd03A?=
 =?us-ascii?Q?wQ2ltdC3NSxXoiUV/4Gspy8tBQ35SZYtW7Li+WaCE0htvsFghuls0dncXuDn?=
 =?us-ascii?Q?Dmd7Qt+YAqvuNSk4845MFhKKG5wZcA1v3/hg+HoixIu1Fk0Mq+sO3HXfg+hm?=
 =?us-ascii?Q?0m9fDxON2otgdkVwba6//nmeOUslY4p2SDW78wwr6F4zxhSMQmCqgTqjrs42?=
 =?us-ascii?Q?Ij84SnEUsw94SibNNs3wl6wljfgrvkWJrsmodRrd3XgH2p+dM2Czy1VBYn1b?=
 =?us-ascii?Q?T5lWEYWFDc2BEK43J8lxP5RmJCCguot2Hcg1Haigb8mJqqvBS3YEChPzH24R?=
 =?us-ascii?Q?6R31vgi5xZEc2vLMFttI9Mzhz8IqfRcAVB4hgmnPIlkEFPGvlZEGKtKNjNl5?=
 =?us-ascii?Q?pZaENZ8H9kZgUZYsrDt8p/62jFYu+B5vbaRcnHqky1wbbBDatoK/uLo2oo/o?=
 =?us-ascii?Q?yI8ND/4QreyOZMqMuffM8TLG1JWxB9nX9TnYPbyXcIN59M+IQXuABaAma3+1?=
 =?us-ascii?Q?tWUszdM08DOOzyfAOqFywB7p6pyAAbf4ngrpS89GjNb4WmHqifahlqoaosmV?=
 =?us-ascii?Q?2vFO/KtLCl7DQyM7nvZ07IWcahHBQ1pgSNQza8THbDv4WC5WI8FbRCev8Zcz?=
 =?us-ascii?Q?BZdAxAcWk9q9YwZ4bAwGabpSHpXnXgJrnzmatpT63m1Ku+PNRXSbZInutJiQ?=
 =?us-ascii?Q?KAUOIr2I5iiv1p/qdAjqIquR6gDJCwDIJ7EEJWfMtDGuhIf5kVgHUz5YpBXo?=
 =?us-ascii?Q?Oi0W7vjcWeO2ERsXK6IYT2oQHWcyKzNQgLuh/nEN841PrqByzpXmGXscvhkt?=
 =?us-ascii?Q?t0oUBKZGt/cerSJ/n7fPW06EMvzJueejt2gVhYV23DjfNgoc3Pne2jRsGOHP?=
 =?us-ascii?Q?IULFvuZuF0vuTPirV9ljKlXPqMrDv9jvChWzQKxSfw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB8775.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mauHoofitJLDcQyH6eE7xxBdbsRwHpToQOCS5AeesNRKjOnYalX3GK3XEmhd?=
 =?us-ascii?Q?Ey6WGDf9ojVovwdE/gR7KmsjXyEZr540bkDGFEK1JDeo5vNnoMIE/esPMfyA?=
 =?us-ascii?Q?AT3FNF+yMy8xjuKSdpHE0Z50ZZj1PCjhm6C5qEFuwXXFebDpJ8ysTVJ0MG4C?=
 =?us-ascii?Q?RaN73ZPw45FGzKSc3sWagPGlUzZilx9WY7VxBaMQo1YAcOyUjPF0TlQ/XAuW?=
 =?us-ascii?Q?qjfB7W9eVNCaKfv6jAsZV82Cgu6Jw9wwpILA4Dclb+SN4dOmZq7pJ9FAeB2X?=
 =?us-ascii?Q?b+2T4wt/bckHmrc8TR8ufRVXpWaFl32BigeIdEEdQw7J/ZsbueakgoGUfgRG?=
 =?us-ascii?Q?b+LxJDZSNZuRc2ag9NWWZXNVhgjjpw65IQJdfVHa5xR4BinDvV1RSrWTpWma?=
 =?us-ascii?Q?wuc7vZzjdorIVb6Snkgvof0+W7Cm2agnqJHyxvDlqtPcxeh4wgE4hqOr65PD?=
 =?us-ascii?Q?OeHoPfrdTGXp6/tVAGI3dHhiWboRLDidNdsGHYB/GJ5m0FDa301yz87uFc73?=
 =?us-ascii?Q?6tJtgjIr7k0fQesiyENN9W29Ba3l1gp9uo4yKQ3ySQK7wHkQFFAAtMdNerhJ?=
 =?us-ascii?Q?bKjAQzLBHKixCF5WuoB97c4MiC0phwS/aUmlntp8pg0KdvDQD4fUOd4hoUAj?=
 =?us-ascii?Q?1U6X1e+UcXfPY4Rf4acwqVkszB/HPecMPWaHlE6Ztz//LcAYpk7dbpuYyGhJ?=
 =?us-ascii?Q?3MqaJLnldjvyxCUQIEuFyeIENASUxWGXuTX71vpS/JwbI24+cF2HPR0SE+Lw?=
 =?us-ascii?Q?8K9EkwNw0CO5srYlvDgFWqn4AdLTww0z92pJ+UR49akCqqamgnrN0Kqd/9EH?=
 =?us-ascii?Q?kGyr38HkAzxbsKExMIdH+zw2jPsAbkdCb6NZtQtEdZa7lcm0DczDboiKVe7i?=
 =?us-ascii?Q?WbLIcGcoQ9ZM9OBsTRvhbJDDZw+YT+b8HbWbMEzdrIpK1pD2MwuEKt9Oa836?=
 =?us-ascii?Q?2IALFu0mi+InOjTb9ZzQ3OVzBxc1mnoH7Uy3Qvhdm3fX5YMY6DZEkUtb7IRF?=
 =?us-ascii?Q?SYsrQr1SE028ktaKl3GtYrxyrMscSanzO7LDAlGt19gHsdMtZcTTqGyvtC6Y?=
 =?us-ascii?Q?lV3gMEUb4PGT0szRd30JkcPcVWI5B49spl0NKzX38+8j9O3mlKXF0RHXO047?=
 =?us-ascii?Q?EdMSTycml/4jXlQerUPSz67Eg7RMuFGm1sgyRAbkeHiM2Z/SOOwZUsX8A+Pb?=
 =?us-ascii?Q?jOTKIx2ZxcvMOYIYQU+70DDSm58i1lCbXXKV9bfp2oxf3tjPG1crfQatzY8v?=
 =?us-ascii?Q?sSZ45WahMut1fFZt0nYt7VuxK8ZO+TzxvQLRLRQBg2cV8gHSdEBl4lmlF1Gu?=
 =?us-ascii?Q?au1cF1dXpYLkzHxQXXgkvSyWcdQrt8Iep2chqROULP9Xl4VXacB/vJf7nWYj?=
 =?us-ascii?Q?36v8A58jJDYjQ1+AfgZ8xIrMKa4eakna9s+yJP3RXRVsT1WUI0zfcC0E+4IB?=
 =?us-ascii?Q?w6YUUzda/kIq/4PRkHJJhR7Fw+8Hp13q/TC+372pvjRYf0VZ7K71yQr3bXlU?=
 =?us-ascii?Q?JzVWZeN8b1ZYJDGY5EMHo5L+4JbkCgNFNuHfxaVHujxxMoNSM06K00HUlp2X?=
 =?us-ascii?Q?NJXr4vQDZMcwjftHOQoZsVFxMj6d/TOV8YMMZbqw5XbmveksH5opcrB6qmai?=
 =?us-ascii?Q?t4/ZoMUL71DdkvsFu5HqjC3EzJ/lUeg6IZyCG0onPF23DbTkwpgHn8k9J3Ei?=
 =?us-ascii?Q?+sT9ww=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a405587-e770-41f7-8605-08dc74f39cca
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 15:28:03.7560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mK4uNbGsiC9mmHnuXSV0nFWx6X50rnjr+kGPeRmtvo35yWZoXy7JZ6HO+tW7L7ajYfHnHamFqyFtkoQbHh/dvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7992


On Wed, 15 May, 2024 11:30:51 +0800 Chen Ni <nichen@iscas.ac.cn> wrote:
> Add check for the return value of input_ff_create_memless() and return
> the error if it fails in order to catch the error.
>

You will need a Fixes: tag here.

Fixes: 09308562d4af ("HID: nvidia-shield: Initial driver implementation with Thunderstrike support")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> ---
>  drivers/hid/hid-nvidia-shield.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-nvidia-shield.c b/drivers/hid/hid-nvidia-shield.c
> index 58b15750dbb0..ff9078ad1961 100644
> --- a/drivers/hid/hid-nvidia-shield.c
> +++ b/drivers/hid/hid-nvidia-shield.c
> @@ -283,7 +283,9 @@ static struct input_dev *shield_haptics_create(
>  		return haptics;
>  
>  	input_set_capability(haptics, EV_FF, FF_RUMBLE);
> -	input_ff_create_memless(haptics, NULL, play_effect);
> +	ret = input_ff_create_memless(haptics, NULL, play_effect);
> +	if (ret)
> +		goto err;
>  
>  	ret = input_register_device(haptics);
>  	if (ret)

I applied and tested the patch locally, and it looked good. If Jiri or
Benjamin can apply the patch with the updated trailer, then you can add
my Reviewed-by: trailer.

Reviewed-by: Rahul Rameshbabu <rrameshbabu@nvidia.com>

