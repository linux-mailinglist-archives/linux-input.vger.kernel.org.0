Return-Path: <linux-input+bounces-12809-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D9DAD5312
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 13:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9B481E02C2
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 11:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FD8E287515;
	Wed, 11 Jun 2025 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="GcfRIa7f";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="aqMLmUkx"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2EF28750B
	for <linux-input@vger.kernel.org>; Wed, 11 Jun 2025 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749639328; cv=fail; b=TUI/jmfjJ6DEeFG5+6+hdwVYpMH3YRGOUT80wX9EjpSVfo8xB7D9MPIXAbkUaScguP0djThOjWryq/jquTUMtY0UWN0MQzxHDc4NU0mXQdTI99MRqp36jjidpq94o4HDwLQ8/lLVJfAXVXRHm/llYXZXnWHfZIZn7GkQRN/RTMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749639328; c=relaxed/simple;
	bh=v8ybvpz34PGCq1UZmhcneMAIkA2ivG41do44npmLSJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQEbvj2/dQdHXF+tH44aXvt71KWKEc2IMB8VO0ANMC96+gFoZn9QjBShM4f5HTfbHGt7TSpeNrDAiPlmTRxxD1n6WukcrIM9te/+QOCEaBva2FIwdwbHN4zXsr0ImlYtOm9tI022c2JE9JjZK9LfjEdDdTvxXt3MMdee0g60lNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GcfRIa7f; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=aqMLmUkx; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B7OvAj027765;
	Wed, 11 Jun 2025 05:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=fG25ig4GJpjC5N1CGF
	dVCqrZUMvpVMjoVSe537wh1oc=; b=GcfRIa7fp2+V6JGdbX4l5XwvXX+tXSj+Xl
	M8fcrzP+yqS4QUBpOuaLVbJap/I5B+xvQRnZyzqEog25Vg1BHDpnphntHLPYkOe8
	camWcYrhiFmHtCUQlFbtcH1ZbsOktGdcFUoujvYbIQnOmqUGn/wwltQaASBLefBL
	M5qi1pQybBy1UMwzFUyMifoKSZTCgsk1DucLSeXA4fNJIBt6yZZN4d20ZL+B88HI
	u3JasHN3ao3rsl+uksHVloW0e/s31Jv8opABJk06PFosNesOc9SeeYKv4jIJPIk0
	AeJP1SZEQ3bf7PVrx0Zvy0ndYjJ7qeurtRpbgQtq36yQlF5iIa2A==
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2095.outbound.protection.outlook.com [40.107.236.95])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 476ksd9xkd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 05:55:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KeFLrlX0NZZqyA8LE7/GxAuE89bGN6yWTf2o5bLf0vvoEIbnjD1Qlq6sEHuAI/FPE6Zhgu1pePSXtjcK18Pzvunuo8GxJO3T+y1ghTCamh4yDwCwuOHVbFxzc5SjL/tiUdWZ2hNQyifNL7EpxIAr0GCxqlAFx8DgkDsCZ+1IJsy7vIWPqNiKsjDzA6/mDve0Sbr6sO5PShQArQtO+fIpTy+Sjk+FnpliJ9/lo5F8+NsPZU0nvfepuM8jxUUWYJWKnwHyjaNlkxAOC28PUbTJ5Gljym486VT/jEtgIINF8lQ4d19kOJmmT8ybOMRmh3DH++lC8y5nbpxJsVZxFp5G9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fG25ig4GJpjC5N1CGFdVCqrZUMvpVMjoVSe537wh1oc=;
 b=B7Q3KdH05Ws1oPMBq4iOwoyEszApVBVEImMEH/Id3rnPOADbTu1LAAdRd54C4uhNT9tREPqhLSCHx+aW39LqiN8TN08cfOK6iQcU6bmwf05UNH9uVHgTd+tAqcgcq8XnO/K3gABR8OHtXdrIPsT+yjxU3zoLjL6qBEW7xrLyqUL1tviZ74cnYCFPhMwRNzKHtrRt2yuGfM8OSyYlZO/t/VtrEZQHSr7Ij3OXkSKxa3r7OMblR78ncyY5Ixd1pNHK4AbqBH8pTC/AyvFgaEmeoGrCWu7bDV293oVknJyZYTh1Xd1mLUaEJNe7ljbw1JNswM/iE3HgedjeEiWTBnEmtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=intel.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fG25ig4GJpjC5N1CGFdVCqrZUMvpVMjoVSe537wh1oc=;
 b=aqMLmUkxFi/sPle/OG+L3jbiwYainNHjVqupPu7CpdGuaKZ/8UVwXVNo1yc4Hl6IWlJMoogtrMLjnBMNb47tp4IPsGzsgQypkVRpku4FCv7tKDtqAKpnE+fIffLHUKpNIWtnAwhiPI5N5wpt2DKxcuwIyn1IHATMoeLFKqV09FU=
Received: from CH5PR02CA0012.namprd02.prod.outlook.com (2603:10b6:610:1ed::11)
 by MN2PR19MB3759.namprd19.prod.outlook.com (2603:10b6:208:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.13; Wed, 11 Jun
 2025 10:55:11 +0000
Received: from CH1PEPF0000AD79.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::3e) by CH5PR02CA0012.outlook.office365.com
 (2603:10b6:610:1ed::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Wed,
 11 Jun 2025 10:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD79.mail.protection.outlook.com (10.167.244.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Wed, 11 Jun 2025 10:55:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 44E7D406540;
	Wed, 11 Jun 2025 10:55:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 291A082024A;
	Wed, 11 Jun 2025 10:55:09 +0000 (UTC)
Date: Wed, 11 Jun 2025 11:55:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: shumingf@realtek.com
Cc: jikos@kernel.org, bentiss@kernel.org, broonie@kernel.org,
        linux-input@vger.kernel.org, flove@realtek.com, oder_chiou@realtek.com,
        jack.yu@realtek.com, derek.fang@realtek.com, bard.liao@intel.com,
        pierre-louis.bossart@linux.dev
Subject: Re: [PATCH 2/3] HID: core: Add bus define for SoundWire bus
Message-ID: <aElgjKSBXw6l6hFK@opensource.cirrus.com>
References: <20250611102650.563137-1-shumingf@realtek.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611102650.563137-1-shumingf@realtek.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD79:EE_|MN2PR19MB3759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b225399-cb37-4135-b54a-08dda8d66fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|34020700016|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Wmpzxi1WJn+406GrhYcNrV0Cw0nM+oxzsQw+6+bp9Tp66AxDPLIeg+TPUy2v?=
 =?us-ascii?Q?dF46n7Ziyv4hzKHSUnGevPlJMq5cM0Sjpe0hCm94Fj4bx0luz8x/dIDvJFAW?=
 =?us-ascii?Q?vy7N4dQ8HsSkXj0cErFVptOKSEApSof+4RS8Y3lYPuvWrQKvjMEn6xOnPq0Q?=
 =?us-ascii?Q?mToCD3ZJWTMp77tx6C4yb631nGdWwwdvutaryiOFwmbRJXJqDyUdQ3M6awlF?=
 =?us-ascii?Q?qFxnxSszcbav6daY4SGrXT6ivcTdjp0vIIGiTPKtEmtLIwfhDOW/K32OIZ5w?=
 =?us-ascii?Q?0PJQQc/YvvYa5yZtbYjT/BI7Gg6M3Mir+4ibRZKyzVTWUmt6IVSo5SI/YiAz?=
 =?us-ascii?Q?8O+I7nqfQjjmQQjvoAvgyEYYvUKHh5Y6fsO5V00GvbElBoxLb5MdPps42LHM?=
 =?us-ascii?Q?Sv3FRtB9UL5bpTVz3WA1NBh0w5CRLIFt67GJGtaTQXNWKXQQ3GhvBEy71k9Y?=
 =?us-ascii?Q?J+hqZZmVEB+w86A6lFRHSnVJh4H3JLk4NLzK2i9BFxKONdwBNVvIrICPIGqG?=
 =?us-ascii?Q?3D5/bgfDb2y1lAHrq4bm7CLArL/mhjdzFmvSINr7gQiXDcLy+EKXJeVboVyL?=
 =?us-ascii?Q?DNnP4NYOaoganKLNP8GP24F2uecDtIGH/cNxB6AQ+q5l2CNLGQgMGQhwfllP?=
 =?us-ascii?Q?7OecTp3SmYD51SUrBARailsbwv/7tKmHte8pGUeI8bT9dvkT8tDJydshLkNU?=
 =?us-ascii?Q?yQXe+205Qzsk8sHemeQ44q2OhKlIvlF084uiM/vxC26fN8mApZdh8AL+Vy/x?=
 =?us-ascii?Q?ALhWuPQ4NTBrTmCJJz0NMNUn8hIK/FvDIjB5E/oIMs7l6tUeiul/0jPr/t5K?=
 =?us-ascii?Q?2jg9yKf1wAMvHhWuCdNrwjqy94ECnMvUpAuqWUpCkqX+HlWIAiEEXZdICCVJ?=
 =?us-ascii?Q?0ga/ljxbPhBlbEQKs1CxPFOPY3Qx1ny/K77aJXsEiTHsArtCJ+p8zpB45dUt?=
 =?us-ascii?Q?hqoCe332Cu3Yqsh4r9kewUu2PjGbnliYXvMz9gLIsrHdaHhHcGddLFqf5N3f?=
 =?us-ascii?Q?UDTJZ7GiGabg8Sbidhnp7sLFIbzCBNYo7yQu5maeA8kRcZYJtHJd/8ixbRAQ?=
 =?us-ascii?Q?h7K+EAtSiwSAPzxMIDryPbwlHwe8Lktzil/MITrRGEeJ80soEC6Cxx2oHxCQ?=
 =?us-ascii?Q?EDWqi1mfev+gRSJTuWkKwrEfVq2Y/ZprIrHjvtDyucqXKbUcIVZqbIBiVx9A?=
 =?us-ascii?Q?SkVd8VDo90MIvm082JScdK5tv+g3r4QxqkK4ni6SbhYJIBSZJXSazhRVjgZC?=
 =?us-ascii?Q?AEslU1yQKGA4ZHV8h0aEFHk768OvZmWMwNMHWmdQtK383o8RHmvF/OHC3gNx?=
 =?us-ascii?Q?lzF/HUb7gHW02ajXqwN0ufO/tG3beHnMaJD/m0NzzVq6krFVlazvblIwCpRc?=
 =?us-ascii?Q?USIsRcYB+utEo/JJNEtq9eJqZuesu04EHXV9dFDpSWe5zIL1irUQDm7WeMUo?=
 =?us-ascii?Q?pf8pKB8rJa4FHOgbOAlL0nTSPYRtdU4yUk3jh87DO2S9GBptHV91/r69S+iM?=
 =?us-ascii?Q?DgewC4u5iZRaELqUS8gcRlY6Ivyp5mvzO5/0?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(34020700016)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 10:55:10.6376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b225399-cb37-4135-b54a-08dda8d66fce
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD79.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3759
X-Proofpoint-GUID: rUfqn88mNtahjufvXsroE9VZNKB3Aull
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MyBTYWx0ZWRfX9u1jMMcrLstM X1mjE05qNK7bbcbyIEdXjOjZqlzq/xn2j0aMxxj74jjlWJattWZhP22o904EChEtiUpny7Fwd2J acHfWUO5UN6rTpj2K4ybubZQ+VZ9lZP4aUMEqd+R62iyl8N6KiyozssOgJnuN4KE8RHRhR62xJP
 VN85meahDP+OUV5lRAh0a/8LON8a8QsGFuf0WLuBKK0xES+ECEgPlnnxMrmQZAe5/k+hMzcm5pr tHR3GVk679AbvJsIxVYmvpC+ylvgKqEtBq8Unc6k39GFDNFfst7OR0w37VRc8+eIyXo96A+LK5v qjITPLBPwniY7rE0RQD2qxxuI6wXgHhv150rXsiyIRVIFUynYzWDsZPtp4v8/vTp93EvWPAVp12
 mHMzQu6eObAaDgHDVN5EnYapFRPyQBHYbYp5bgIPqK9SzMJMFjhtEeVUm7rdXaOLN6TpdEcF
X-Authority-Analysis: v=2.4 cv=c5OrQQ9l c=1 sm=1 tr=0 ts=68496096 cx=c_pps a=tuM2TBo6X2LIU9hvJTieQw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=n9Sqmae0AAAA:8 a=w1d2syhTAAAA:8 a=GCL3j4FLvAd8Zp6Ra28A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=CjuIK1q_8ugA:10 a=UmAUUZEt6-oIqEbegvw9:22
X-Proofpoint-ORIG-GUID: rUfqn88mNtahjufvXsroE9VZNKB3Aull
X-Proofpoint-Spam-Reason: safe

On Wed, Jun 11, 2025 at 06:26:50PM +0800, shumingf@realtek.com wrote:

Adding Pierre.

> From: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> SDCA (SoundWire Device Class for Audio) uses HID to convey
> input events from peripheral devices. Add a bus define for the
> SoundWire bus to prepare support for this.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/hid/hid-core.c     | 3 +++
>  include/uapi/linux/input.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index b348d0464314..b419e31005b8 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2294,6 +2294,9 @@ int hid_connect(struct hid_device *hdev, unsigned int connect_mask)
>  	case BUS_I2C:
>  		bus = "I2C";
>  		break;
> +	case BUS_SDW:
> +		bus = "SOUNDWIRE";
> +		break;
>  	case BUS_VIRTUAL:
>  		bus = "VIRTUAL";
>  		break;
> diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> index 2557eb7b0561..127119c287cf 100644
> --- a/include/uapi/linux/input.h
> +++ b/include/uapi/linux/input.h
> @@ -275,6 +275,7 @@ struct input_mask {
>  #define BUS_CEC			0x1E
>  #define BUS_INTEL_ISHTP		0x1F
>  #define BUS_AMD_SFH		0x20
> +#define BUS_SDW			0x21
>  
>  /*
>   * MT_TOOL types
> -- 
> 2.34.1
> 

