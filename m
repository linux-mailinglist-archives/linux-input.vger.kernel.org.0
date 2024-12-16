Return-Path: <linux-input+bounces-8612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C439F386F
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 19:10:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEFC816DE83
	for <lists+linux-input@lfdr.de>; Mon, 16 Dec 2024 18:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D60C820A5F1;
	Mon, 16 Dec 2024 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rVgeRxnG"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B120A5F3;
	Mon, 16 Dec 2024 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734372077; cv=fail; b=qo5u79k3IFo6+Z6jnOT4WRnk0OsUZ52ZCUWL15Iro4VwA3UbbVASf0ThM/2SY7PbtkjoaFlSzcVWU0MoLakdJIfPLRi15WrdH5xEl5IYHjff/9X1mzewNuNGE3U4L5u+j4WMf/No0WWWoPT6nO3WAiu3wlKzIrgg3+a73fNb6pU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734372077; c=relaxed/simple;
	bh=XAXoNN9vtZGtuVBycGJAunqr7qZWZpnyfuZZJKke+X8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=i/DgV8AMdH1SkYLdG34PD5oVRoRRyDWccf7QRUqI0HJrypae9sbbw5B6sDL29QzwFQofC2IR5shzCZRJRHVPd7Unx85S10eaYH57vrInV6a4v5W2TKAJ3/ugNj/QiBPqlpCUZ9jT4dyvEzU32btPtxbSRDJQRjZcdhfzGwgbYCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rVgeRxnG; arc=fail smtp.client-ip=40.107.220.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPo6NB6kZc2NQz2ZNGhUs4TMBsNFyPOdAZ6fFaU1/5IQBZIk1vXqeR4t2yI8FTvXzHiLPowV7edLf84wIYOsz4qtvk9Pj27W3RI8sJ7mQpoJzMJuvzQNiG4T47v2q/yfyBFNcmpjxA88UJUbr4fVv0DdyQ1J6hCpep9UeRQR4WEpvZe66u5eZHMewWLM4tWCLc5TKN2dJbGL4bPVTjRL457+YL0phd7yNSThVRVJS11A94aN/nZob9Wx1IVXbNA0NOWhYyvi2LVutrMNkv1XtwNHEYPsG2iPzEXAgiKXviDFizQtfsH8YJUGwSRFJb5nDCy46aRg5dbKzITHKDLZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9JUIIv83iGL6ZME6tX2rpCgINOhc2P7H1MyxC0ERVw=;
 b=ZhruIHekA74ClP05iMY+0Kq3mcUViWMD0K0CjDsq0DjxIypRvHv6N4fQavIIdfVpIyrJHdr0UWvrF8h7J2xD9N2A2GMypAAE4TE+L+pdTo/DwJnG8cew4MlcraSGy0MCta6yxYAyCQcLhtvs+svCNzo7FSsEL0cDruCzVvQTo9HirvhbATg602hYhkjIIdSci3KqOwkzu64Rrtpef6ONMTT9/QyjYXvCCLGt/GjqErIYr/gD5aQh80A1zCYHToYOwFQujdUyJvzUYvFZampZKyMagg83tHGa6dxFjmB9MphXxe+MKebKL39lSmxET0MOXjr9AnZtAeOXWzYsgLIcuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9JUIIv83iGL6ZME6tX2rpCgINOhc2P7H1MyxC0ERVw=;
 b=rVgeRxnGvJUANl5V/F0xoyAlCqthT98SOJnxRij7ayjS7n8yTV5CcZEhF2Uk81cPNKZdurGB1N/XWhA9Wf3rp5CfO89FaToxxueFL35r9Ep7HN2OfKzIW7dZkac1Zy07L19vpE2NMM6+0Nl5yBRQ5WD5DPejzmvpPeVbrL9oegA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Mon, 16 Dec
 2024 18:01:13 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 18:01:13 +0000
Message-ID: <d290717a-646f-4fde-ac7a-59b53e49eaeb@amd.com>
Date: Mon, 16 Dec 2024 12:01:10 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Get SRA sensor data from AMD
 SFH driver
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
 Basavaraj Natikar <basavaraj.natikar@amd.com>, Jiri Kosina
 <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Akshata MukundShetty <akshata.mukundshetty@amd.com>,
 Patil Rajesh Reddy <patreddy@amd.com>
Cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
 Patil Rajesh Reddy <Patil.Reddy@amd.com>
References: <20241212151951.1922544-1-Shyam-sundar.S-k@amd.com>
 <20241212151951.1922544-3-Shyam-sundar.S-k@amd.com>
 <ac9983d4-432b-4ad6-bd6c-f5f72aeb2493@amd.com>
 <5e06d015-cc3c-48b0-a9f7-1f8955ba33ef@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5e06d015-cc3c-48b0-a9f7-1f8955ba33ef@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d66ca2c-3ed3-4515-a3ba-08dd1dfba0e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YXIyUkZQc1VaTGNTbkRNbFBMRUk3SlVZNHBkVkRaWjZrYVR2d0phS3drUGR1?=
 =?utf-8?B?OFFTNHRNdXYxa2tka0F3SWRnU0YrR1Fwd0tCcmxJaXB6ek5OTFNYUlNXczB5?=
 =?utf-8?B?aDIvNFhzL1RnSWFzZTM3N21WNWJjK3l6ZFl5MzF6Sisya3VYY2xwb204L2hw?=
 =?utf-8?B?aHJqR3VyekltY3NiMVlGTUtMS3BoT3M0NzdhU0tZNFdURGMwNEhKTXRDM0ZV?=
 =?utf-8?B?KzlLenU0MkZuTFdiSVZYRmJQMjArZVkvMWpIWWx5WkZhLzRsT0wveURMWW5o?=
 =?utf-8?B?ZSt2c0JHdFRhdzNaN0J0UktGVHpWRjUyQkd1R2hXSXZ3NHNGUWdNdTZIb1BB?=
 =?utf-8?B?TEU1SUU3SlJWbGN2eXcxQU9SVW5YRStPUFFteGxlamtJcjl1alNJOTdGZUxY?=
 =?utf-8?B?TUQ3Uk5oL2t3OFdNYTQrVTE5dnhVaVBLWW14M2F2cnJCdlUrNXRzbWxjQ0hp?=
 =?utf-8?B?ZlA2elFMeHlWRm53eTZpai9vTnExVXprWVF1T3hvQkdZYld4ak9mT1RYSTFx?=
 =?utf-8?B?a1g1bURVeE00UTcvR0NyRDF2bUhDdFJja25Zd1pBTVQ1VVBzODhJWGY1cTZh?=
 =?utf-8?B?clArZ0NOY3Y2MjROZXRkVjhMMWFIek1oaHFNYmxCYllTazd1N2ZPcXpvWGl5?=
 =?utf-8?B?aVIxS29hWk96NjF3clQ4SHBRNEovdmI5VzBoRlQ2MmJoUko1YmV2Sms4cDNo?=
 =?utf-8?B?dmdUREJBbVBndXg3WEhkV3hubjZaWmNrNUoxbjQ1VUhsYmZBRVVzSnpBRjNR?=
 =?utf-8?B?Yjd3czVyUXNrYTYramF4RFNSMkxUWnFhTXVWWTBMSUxJUGYrS3RTU0xjZmRS?=
 =?utf-8?B?QzlNbDlUVzlnNEtqY3RWMThjSXNudzJsYmQ2MXRDS1VEZlZzdzhYUldPK0pm?=
 =?utf-8?B?MGpnQzNjMkdFaW5YQ1hGVUNmTnlYREhKdUMyM1EycHA4UVFHWFdWUTFlQjlJ?=
 =?utf-8?B?NG1aanF2dXdMcVQxa1NqQnZEdTY4YjJZQklENVJ5dG9YWUl6QURWcW5CZlln?=
 =?utf-8?B?bmVMbUprM1FDand5cXd3aFlsbTJoM3NTang0REFFWEdzQVlGams2WUxZRHEy?=
 =?utf-8?B?a095Z2ZrdWtROXhuSHc0emc5S3NOb2Z5MVpOcTZhOTR5eitJSEJqVlkzWnd5?=
 =?utf-8?B?QnNnWW5aRHFwMlRVcEp5ZktpWVZhbEZrWUxsK3VSdFlZYy96WU51YVI1a29s?=
 =?utf-8?B?d25FTUNnOEVDWHlsbzBxdFBVTmE5RGVjejFJZWErR2ZTSVZpcWt1cllEVWlq?=
 =?utf-8?B?NGw3SUk5VnlNRmtoZW5GMGhvcjNqaWhGczd6dS82aDJIaGxUNGJhMVZjQmxy?=
 =?utf-8?B?U3V6VlFka2NuZEN6TmY3bjIzTkhZQ2NndGlnWDJZZXlyMlN1aFhnV3RNOGN6?=
 =?utf-8?B?dElNaGFqUnpCd21ZMnJzSGl1Y2IvMitaRi9FVmRDLy9TeHdPaWozWGM5OTVH?=
 =?utf-8?B?MndwV3NoMzhkS2d6bytBa2xqOUdha0hHSVhpeEF2alFERzJtNnl3aGRNdVFD?=
 =?utf-8?B?SHNXRlFVdFdMak5BSzJUK3NtTSsvVkl0bEhFY0Y2RVpCa0laR1czckJqMFZ6?=
 =?utf-8?B?a21EWUFsRkNHSVZvaVU0V1pJcUhzZTJxRDV2dFZwT056OHhuOE9KOFMwdXVl?=
 =?utf-8?B?UUNyVXBaK3dzdjZQaFBxMzN6aWo5b04vd0dXcFlNWnhDSUZDWkxJMkp3R2xy?=
 =?utf-8?B?Vm02dnp6OTcyMzQ2Z2huU3R2R2xwUXdaVG1sU0JUbDU4ZXAxdnI2aHVJVVR1?=
 =?utf-8?B?NGVOZXdxMWFzWVlvaDhFRUF5ZlpaQVowMDFMUkhoREloVGxpUW5MaGtrSE1M?=
 =?utf-8?B?NkovTkh2K3M3THlUa1FEV3V6eDc5UDJ6SXRRWXVEYWIzV2ZyY2JqRzBIdjVX?=
 =?utf-8?Q?gPNB59Ff+Po5c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB6101.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MWFxQXNhWmxLSDdRRzZTVDJrWEhOZUs5RjV1TllhL3BRWld5K2Rpb0JBK3dE?=
 =?utf-8?B?T1VYN3oxNm9EZFEzRGFHRVh4SXNYQnVjODNTZ2xHODFQT3JLTVZuQUlrSng0?=
 =?utf-8?B?ck9UODAxNHlIbEhVdlNzK0lkd1BUeGNHTzRDL1lXT0ZscXdMNFdLbElGcVNE?=
 =?utf-8?B?NzVYcnZPTUFVWEpRcmZ3ZUI2SVZSeSs3Wm10cVhNVTE5NUNXbjlCdEdXd2k0?=
 =?utf-8?B?OWNyZUFTZ1VmNjByeW9TMHNOaktGWTl5aE1wL0tZdXI2c0l4LzkyVU9waEJx?=
 =?utf-8?B?T2FpSjBOMklLZnRUS0VUZjI5S1hKRDJZelorYjRaR2x2UXBSTWh2SmFjTmdO?=
 =?utf-8?B?T1o3ejh0WXJiYnFnUTFRMFhpcEtNN2xmUU5NNDhZMU9KUzRPZStDK3V0UUVL?=
 =?utf-8?B?VElqSUhXZ0I3WFBkeUNPeGV4cWpqYXkxbWhlRXlZYjNjRTZPTE1KUUFzZ2hi?=
 =?utf-8?B?R2dsOStNWVVWS1BZM2w5cUl5T0pQS3VhbVRuenZIM2NhMThlQmgvOWh0ODFI?=
 =?utf-8?B?WnowYjV3Qm9pVS91TVY2UmJHbHo0ZE9CNjljMXVHc2NZemdQUUpMSFFaeWNP?=
 =?utf-8?B?NVIvTkMzSVIxSi9IbnpxVXNLdkMrRGltd1kwTnZEbEdEdXBJaEFRY3JnSk0y?=
 =?utf-8?B?MFBvSi9qU3h4MmVXM2cvbEZvRUN4SWlId0RvT052SjR3RmgvejZwQ29iOU4v?=
 =?utf-8?B?R3kvbW1RUUVFTVg4cFBpY1FwNGdzUlhDS1VEUzREVG1ING4xWlRRY0loOVpD?=
 =?utf-8?B?SklobnhkYmNVY1c3ZWlKVGtVMlgxVWVoQ2duWVAwaW9oM2habVR6UFdoM2FV?=
 =?utf-8?B?TnNxekl5UVRGR2JwTzQzMWFJUjREYWlpZ2wxL0dFeUhLSFM3TXFmdWxLSDBD?=
 =?utf-8?B?cUNhNDdiZFVFRVh1bVppaGNzWFhBdE56a1g1N0ZNdWloTExkTVhYSTgwVXBr?=
 =?utf-8?B?M21MUC9BY2RBZzAwZk9SRkM4ZkovSGlSdFJIV3FKSGgxTWw0V2NLT0xhODky?=
 =?utf-8?B?blAwNHZyOUx5MFB2aW1taDdxeWJkTEloOG1JY2ZYN0llYUt1dWxNSkIwcnp3?=
 =?utf-8?B?Wmdhc29zUlMvMk5UOWx5L2NwQXB4NVk4cG4rK1hqVkkrSU81aDBxVXdFZFQx?=
 =?utf-8?B?MEpGODZ6aGZGUDVWeE0vY1BkbklpSjgwb2tEeDd1bTdpaytuc3pXR3R4eGJY?=
 =?utf-8?B?ZHgzMkswbzNsRVpiTDNNU1o3emFBQVdVcmp1RXJOMjd3ZCtib2JGeWdFRzB5?=
 =?utf-8?B?M2VyaDZmZXZUOXhqSVhZNyttSzUyZDBJL0FDbUduaWlDa0h4SXdxMHBSOUx3?=
 =?utf-8?B?S0hrZnNwNmY4WnpDZjF5N0N1YTFLL0twZDVsRmVMZ3BRenVGVTQzR2pPVkpM?=
 =?utf-8?B?bTFRQ3RjOFZWS0FGMzFnak9DT2xhQnFQWStIdjNJdmlmWFYyTGRNRndKbFlm?=
 =?utf-8?B?OUM4VFBlcGFzVGt5WC9rYnNCOFNUajgyK0JCRTZxZlVzcEdLem44YWtkcEo3?=
 =?utf-8?B?WjNrOWhhc1haN1A2NVY4ekc4NjVvdXV3cXhzd21vQlBycVNWU25pKzFjdnFS?=
 =?utf-8?B?d0wyY3ZlV3BMa05CN1o3dXZaVEhyQ0FlSUpSVERDRmxpa0ZhRlF0ZzdiM0NW?=
 =?utf-8?B?bWN6cFdGbUFLSThmWmdQT0lVaGYwK2k4V3B3T3JRRUxFVXp5U3FuNkoybjlZ?=
 =?utf-8?B?RC9DeEVtRUZETUMxV2M4MUJUdURRbnZMa0hNM053REt6QlhSUUh6amVWVlRR?=
 =?utf-8?B?UGdKMW9Ic2hXcFhLdGdiYW1QcUFxR25KVjFqSk1kRmtVV0NDbmtZQ05EbmQ5?=
 =?utf-8?B?NW4ySmU0cm0zWjlqcjdkNlFXLytUUzFzV3BJcGpCejN4aXp6ZFFvQ2IvL2Zu?=
 =?utf-8?B?NXhNRU9TY2haSzUrOXg0N1lIcFlrc3NnZjhjbzNHanNsbkRCanpUOC8zWmNK?=
 =?utf-8?B?RDJMZHlQeklUenA2WjZKS2h2UlZNR0ZCdVBkQmtHQ3ducWFUQk42T3BmeFF1?=
 =?utf-8?B?d3RsbVlVOXRRWm1XV2Izand4YWpTTk1rUHJ2UXloSWZ5QSs0bjYzVFNoaHNt?=
 =?utf-8?B?MVlaVGxkRlhHNTh6dnFBY3dEYnVTaGNrT3lLVXhLV0pzK09uQmdzeDUwbDAr?=
 =?utf-8?Q?AD7G0HwgWE26+Ll3DTX8LXzhO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d66ca2c-3ed3-4515-a3ba-08dd1dfba0e7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 18:01:13.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6xYgm/Jj6NZEWBP4vN7jTk+rKXDD3UcxFTmv/BjnTmpHqN+MUOs3ZJaAzc9yCN+8H3AEujgz9NB4eMLGMXe2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234

On 12/16/2024 11:57, Shyam Sundar S K wrote:
> 
> 
> On 12/12/2024 21:56, Mario Limonciello wrote:
>> On 12/12/2024 09:19, Shyam Sundar S K wrote:
>>> The AMD SFH driver includes APIs to export SRA sensor data. This
>>> data is
>>> utilized by the AMD PMF driver to transmit SRA data to the PMF TA,
>>> enabling the AMD PMF driver to implement the output actions
>>> specified by
>>> the PMF TA.
>>>
>>> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>    drivers/platform/x86/amd/pmf/pmf.h | 18 ++++++++++-
>>>    drivers/platform/x86/amd/pmf/spc.c | 51 ++++++++++++++++++++++++++
>>> ++++
>>>    2 files changed, 68 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/
>>> x86/amd/pmf/pmf.h
>>> index a79808fda1d8..c343eaa84755 100644
>>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>>> @@ -616,6 +616,20 @@ enum ta_slider {
>>>        TA_MAX,
>>>    };
>>>    +enum platform_type {
>>> +    PTYPE_UNKNOWN = 0,
>>> +    LID_CLOSE,
>>> +    CLAMSHELL,
>>> +    FLAT,
>>> +    TENT,
>>> +    STAND,
>>> +    TABLET,
>>> +    BOOK,
>>> +    PRESENTATION,
>>> +    PULL_FWD,
>>> +    PTYPE_INVALID = 0Xf,
>>> +};
>>> +
>>>    /* Command ids for TA communication */
>>>    enum ta_pmf_command {
>>>        TA_PMF_COMMAND_POLICY_BUILDER_INITIALIZE,
>>> @@ -667,7 +681,9 @@ struct ta_pmf_condition_info {
>>>        u32 device_state;
>>>        u32 socket_power;
>>>        u32 skin_temperature;
>>> -    u32 rsvd3[5];
>>> +    u32 rsvd3[2];
>>> +    u32 platform_type;
>>> +    u32 rsvd3_1[2];
>>>        u32 ambient_light;
>>>        u32 length;
>>>        u32 avg_c0residency;
>>> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/
>>> x86/amd/pmf/spc.c
>>> index 06226eb0eab3..d5f764e624b4 100644
>>> --- a/drivers/platform/x86/amd/pmf/spc.c
>>> +++ b/drivers/platform/x86/amd/pmf/spc.c
>>> @@ -16,6 +16,46 @@
>>>    #include "pmf.h"
>>>      #ifdef CONFIG_AMD_PMF_DEBUG
>>> +static const char *platform_type_as_str(u16 platform_type)
>>> +{
>>> +    switch (platform_type) {
>>
>> I notice you're missing "LID_CLOSE" case here.
> 
> This was actually intentional. There is already one such print present
> in amd_pmf_dump_ta_inputs() which gets populated via the
> acpi_lid_open() call
> 
> dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" :
> "open");
> 
> So thought to exclude it here. Makes sense?

Oh I see.

OK, that's fine and makes more sense.

> 
> Thanks,
> Shyam
> 
> 
>>
>>> +    case CLAMSHELL:
>>> +        return "CLAMSHELL";
>>> +    case FLAT:
>>> +        return "FLAT";
>>> +    case TENT:
>>> +        return "TENT";
>>> +    case STAND:
>>> +        return "STAND";
>>> +    case TABLET:
>>> +        return "TABLET";
>>> +    case BOOK:
>>> +        return "BOOK";
>>> +    case PRESENTATION:
>>> +        return "PRESENTATION";
>>> +    case PULL_FWD:
>>> +        return "PULL_FWD";
>>> +    default:
>>> +        return "UNKNOWN";
>>> +    }
>>> +}
>>> +
>>> +static const char *laptop_placement_as_str(u16 device_state)
>>> +{
>>> +    switch (device_state) {
>>> +    case ON_TABLE:
>>> +        return "ON_TABLE";
>>> +    case ON_LAP_MOTION:
>>> +        return "ON_LAP_MOTION";
>>> +    case IN_BAG:
>>> +        return "IN_BAG";
>>> +    case OUT_OF_BAG:
>>> +        return "OUT_OF_BAG";
>>> +    default:
>>> +        return "UNKNOWN";
>>> +    }
>>> +}
>>> +
>>>    static const char *ta_slider_as_str(unsigned int state)
>>>    {
>>>        switch (state) {
>>> @@ -47,6 +87,9 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev
>>> *dev, struct ta_pmf_enact_table *
>>>        dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ?
>>> "close" : "open");
>>>        dev_dbg(dev->dev, "User Presence: %s\n", in-
>>>> ev_info.user_present ? "Present" : "Away");
>>>        dev_dbg(dev->dev, "Ambient Light: %d\n", in-
>>>> ev_info.ambient_light);
>>> +    dev_dbg(dev->dev, "Platform type: %s\n",
>>> platform_type_as_str(in->ev_info.platform_type));
>>> +    dev_dbg(dev->dev, "Laptop placement: %s\n",
>>> +        laptop_placement_as_str(in->ev_info.device_state));
>>>        dev_dbg(dev->dev, "==== TA inputs END ====\n");
>>>    }
>>>    #else
>>> @@ -190,6 +233,14 @@ static void amd_pmf_get_sensor_info(struct
>>> amd_pmf_dev *dev, struct ta_pmf_enact
>>>        } else {
>>>            dev_dbg(dev->dev, "HPD is not enabled/detected\n");
>>>        }
>>> +
>>> +    /* Get SRA (Secondary Accelerometer) data */
>>> +    if (!amd_get_sfh_info(&sfh_info, MT_SRA)) {
>>> +        in->ev_info.platform_type = sfh_info.platform_type;
>>> +        in->ev_info.device_state = sfh_info.laptop_placement;
>>> +    } else {
>>> +        dev_dbg(dev->dev, "SRA is not enabled/detected\n");
>>> +    }
>>>    }
>>>      void amd_pmf_populate_ta_inputs(struct amd_pmf_dev *dev, struct
>>> ta_pmf_enact_table *in)
>>
> 


