Return-Path: <linux-input+bounces-11964-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF2DA9A910
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 11:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D027E164CEA
	for <lists+linux-input@lfdr.de>; Thu, 24 Apr 2025 09:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9486E2206A4;
	Thu, 24 Apr 2025 09:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NLsEqIly"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FC11FC0F3;
	Thu, 24 Apr 2025 09:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745488301; cv=fail; b=kQRrkRuDJ/nSJwsASHuifj/AKkGI1U/iN+jIpeiFpP/lO1ujsBp+UpeYMj1xvRs75DsSXXtEmUmqUs+hX6BvWKsxKN9SwQRiIFau2hkwGCkWOjRwB0Wbi04jHZ/Bjxwne8KMZK5AgQE+ebpyyqPOpj8CIF/+OyvGY2N1GYKdzME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745488301; c=relaxed/simple;
	bh=mVwOIFIJ8rW8zpcfQ2N1xyPXnRzZOa/YWfkoQtvAXTw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tQwtbhK2ExoOmjkhDFAaKRlzXBmPmA7pH9jXlF0VYfAQp2e95Dz8B0/B7XvslqGwtMEpOrzcb4np4IHq6p0A7sGzgGPRQXF75dHrzetajBxoCF1/f9hP6EuW1YZc1ecUkm9D3dQf8D5erEF9ACp5vcOZ7T8qc9PA0r39C//7Cdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NLsEqIly; arc=fail smtp.client-ip=40.107.243.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f5hqW2FlpEzW5Xu73P0Drqf6Va3APXtdsU0bBNsKFXJbihO5XejR5RszQ/+HcAnTS+zt39nTcrE1lmWmSCX+dPGV4x3mtO47eE7GdFIByuUIfv9Bx4wsXy15aQPSjZv9a+6sIJMNcBfPoGpojE54NVTLMRGAmtVdsbg+uLh527EAyKu8FQKIogbRUnalkKarDxPXvwrCRd/aUGKx3UxRSVxtT0hCx3a568QoZ4fr6XqLcOCdeN7ih24NrupbcTyu+L+KN8iL2IlcrkGfgA0+AJlS0eBDn/LCraiSt6HNpPlkzmQaFZtyRcEUZ2APxK+D9o6mo/3p0EWuhOTU6WAAcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnT+Fjtz2O1P84JBxWoMmma7K+gxw0/IfuvCjN4oT2Q=;
 b=bxZxhJ9IO3bHSyDJBPV+ZC4pYyOsfG5tDox/NbB+Od3RqX+Vcund6aRc5kjihYmKG4LzXVo7ZQIg1Cy0ifUiTHSa2pjBdSik8wPT3hVE0kGXn2we2fuc7PJgXbWGBpaihVePEEEjNrCeCODHCTAc01oqI129lgRuhaLZfFv4nZfOpPPmzh+Qn3bzFLWtjcRnl0Z2Pi+XX3bFv93/9akQ/UuPU3UrbSZrjQAja16KzDaXzPkgUawNi1f1X0A/uhIlqroHdYC5hWdorxTdT+csxuywLfZM215We2N/KLUOE1CYgFFQbtzTOFv84Ndt7xgWAPjUGnZvaFkZJxPoK7aiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xnT+Fjtz2O1P84JBxWoMmma7K+gxw0/IfuvCjN4oT2Q=;
 b=NLsEqIlyG0Rw3Fkbi3sVXZKqoeWisunGThjnhpYaPb96pPJsb0443aD8inUZGh9PwaRJZVASCcBwXOaRWx0nqzmio62nROou7dMVq2ZpJ5hs5pFV/GRnnsXdQA0Xx0Z8v60BLshr5fmYT/erfJYyyWZsCgTd1yBcv2o72YTaouk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5040.namprd12.prod.outlook.com (2603:10b6:5:38b::19)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 09:51:37 +0000
Received: from DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f]) by DM4PR12MB5040.namprd12.prod.outlook.com
 ([fe80::a3dc:7ea1:9cc7:ce0f%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 09:51:37 +0000
Message-ID: <db1d95be-e92a-4328-b43e-8214a0b520be@amd.com>
Date: Thu, 24 Apr 2025 15:21:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] HID: amd_sfh: Add support for tablet mode
To: Jiri Kosina <jikos@kernel.org>, Denis Benato <benato.denis96@gmail.com>,
 Basavaraj Natikar <basavaraj.natikar@amd.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, "Luke D. Jones"
 <luke@ljones.dev>, Ivan Dovgal <iv.dovg@gmail.com>,
 Adrian Freund <adrian@freund.io>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250309194934.1759953-1-benato.denis96@gmail.com>
 <19norq05-rp74-9qrr-382r-40q9r59p1pnn@xreary.bet>
Content-Language: en-US
From: Basavaraj Natikar <bnatikar@amd.com>
In-Reply-To: <19norq05-rp74-9qrr-382r-40q9r59p1pnn@xreary.bet>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::17) To DM4PR12MB5040.namprd12.prod.outlook.com
 (2603:10b6:5:38b::19)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5040:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c90ba54-7639-44f1-c4ee-08dd83159a73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NThxNmp6SzlHdGVCT0xkUm5oMjNEY0VNNDQ5eGpIbXhnTkQrSGhMQmoxNC9v?=
 =?utf-8?B?Z0FaaVJzeDY1cnpmY2NZSmtCZUtTN1I0NXJyaSszMFFuSldWaTJIOG5JN21L?=
 =?utf-8?B?dEdLM2lSM1ZlVUFmMi9EV2taWHRkTzVaM2FXRCszQ28ybjFNT3VmWWZBSVQ2?=
 =?utf-8?B?cXFzWk5ycS9rb3VpaTRlYkhIVWowWXBQQTlhMkwzNlRnaTRKMm1KTXBQaXRC?=
 =?utf-8?B?TFhWQlRWd0szK0hTbG8wQzY4SWVnNTJHU1ZLaGZwYXlibG5qNkVtbXhPVTBM?=
 =?utf-8?B?L2s5cGhWbkRkOWxNbUVMVldGdU9YNmlYWlgyeExQMXdoWTM5T0FMdTJlZDVT?=
 =?utf-8?B?MEp0QlRndnlwUXBZUFR6ak5UalVaUGd0SkJCNnFVdEtUdkUyVWdnM3NiVmkx?=
 =?utf-8?B?ZnBubUJaMDFyV0Jnak5KL2tlSTRsV2ZZeFJ5YS9qZkY0Yk5VZGlBNVY4R21V?=
 =?utf-8?B?TUZYa2h1Rm9iazNrZ0JJVzBDKzJocm9halBJSWZ5S3VBWkZ3WVY1bk1hTVFR?=
 =?utf-8?B?d09EcUtqSDVUZzFQWWZhbXdIZnppZHRZSzhPeW1RbjZRQkEvbnRlSHdndGZE?=
 =?utf-8?B?K2FGamtNVFNYTDRsS1QzMzRDUlFLajFTNUVLTEE0ZXhJMmp1cFE3RWpDaDNK?=
 =?utf-8?B?WnZ0cktNMmF2aW11NTBjOFBNWGwzbXJHaHk0NGZrM05Uc0pJWnBTUkl0a2w5?=
 =?utf-8?B?Z0FtQWJTMnlHVExKd3hNWTRPMzl0Ri9CcGhkYXRHd2IvM3BUZGdyTisyR241?=
 =?utf-8?B?a2gzZ2ExOEdZRzFhRTZzcXl1NDJDK0pmeFZidGtIcDZpOUIrcFNQUHFNT2hk?=
 =?utf-8?B?N2xiSERXVzNsZGxEcEUrQjZXVlduMm5CZHI1VEdyTkFCU3VWTzJCRkxoN3k0?=
 =?utf-8?B?ak1OOGE3RnBQa1ZDQlZQdFlDVmJOcjNhRWIyZjFhRkYzVUxhQldocWViUDF5?=
 =?utf-8?B?Wk1yYXk5UHJXZE5SWFJBM2VOZDdzZFhRMUx2bUtmbjIxdDVNZER4eDQyYVBk?=
 =?utf-8?B?YzZjQXRacUhNU0pNY2l0aVlHcXpBYWFQYk1DR25TaVR1WjlBdWNrNjl1QVhw?=
 =?utf-8?B?MmtEbHoyNm9RN25GTDVPZkdIcXBUQzl1M3J5UGxmaHNoUHFTL3hhQjVUcFFI?=
 =?utf-8?B?VzdVSTdVNm5tSXZrYXZZK3MvMllPc3dCaHdzTDIvaGZjdWptTFhPQjh3Y2Qw?=
 =?utf-8?B?bU5qTVl3LzVOell2amovQ00zOHdqakhVWFZLeVA1RU1Lb0NSNTNIQ05DZGd6?=
 =?utf-8?B?c3hNNVJlMElKeVNwbDN0QnZxMmFHVWp5bHFiV282MnlaK1B1KzJtdFZnbGNY?=
 =?utf-8?B?ZDNsL0xzQ0t5T1crcW1pZ0xDdGt6ZUlBb2x3UzFMRjZSSGs3N2o0OStOcjk4?=
 =?utf-8?B?UEJWVzR1N01MWmdZUGZxaUJCZTZYS0k2bUdPWDJ6bmg3WlJ3RGthTHZQL0xw?=
 =?utf-8?B?SWpadWRraEd4NFdZdmRDSS90cnpRUVVwem5nWXRMcmZvU3c5aFpFSURoR3du?=
 =?utf-8?B?RWFPY2pTU3BZRUkrMHFmbjBRZEc0ZnprM3lWVCtYQm84MVRYL2pTbHYyd0Fv?=
 =?utf-8?B?ZFpFMklYWkxrR2NXaDIybXRwdUtIbTFydGczWVVvR3hGMXhZVk1mbnRMbUV0?=
 =?utf-8?B?alJXZW9FeFRhK3F5REtGRmtDd081dXllVzVPd0tXL2NIWThaM2tNVE1ienF0?=
 =?utf-8?B?RzF5ODZwOEJETDBjYlBCZDg1cUtvQmFQSkJuV1NoSWZYR2F5QUJVQmpMSWUv?=
 =?utf-8?B?aFdWWUl4ZGVieXZNem51QzNuRHFYdnFUR1VXMUZxQUd5V2tUenE3VTk2QVd2?=
 =?utf-8?B?QnpBQk5OcVdFeTJZMVR1aFlId3RoQkRDS1I3dE01OWVRbnVEWmEvcy8wTGVy?=
 =?utf-8?B?Q2lzazM3NHcySVVrV0RCcmNlaVFDWm1iWTRzZFdMTEsrVXpBYW00Wmdtb1VR?=
 =?utf-8?Q?BWZLqa3fKw8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5040.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alN5MlJvRldVYnZrSFBXdjFiMEdmLzVOYjFvYmFrVzY3YSs0R1d4bklKUmRx?=
 =?utf-8?B?azFXc0MvV1dlZi9pSis3cm5zeWhBNC9obStxK2wyOGtmeGpmdE9ZRDVacEhR?=
 =?utf-8?B?QnhEdURXbkErZ2s2ZWw1bkdsOFJEWDZ1VGpHS0ZTdnJFVkRaTXVGZnJVWjhY?=
 =?utf-8?B?ZHlwUHlZcU1rVFQvZG8zanB6V0tqSUhtdEZCNmRXYXFrYS9lK0puck9yeHh5?=
 =?utf-8?B?bkYranVSN3h5UkR1Nk1QaE5LN0Fkc3BvVnpjNVlwbnBCV0dJY01RSUgzMTh1?=
 =?utf-8?B?SmNFTnlWMjF2WktTNWdzUEFwRGNHUjMwUmpTcnI3ZG16eEtWblpBQmR1SkdU?=
 =?utf-8?B?dzBRVG1CWXRFUnhqaGxMNm1pc1A5WjNmaXlsaFQwM3dydDc1ZUdZRUtvdHdJ?=
 =?utf-8?B?d2hyZG5rKzZESDFXNXpNTDlXbThVQ1dYUkhJYUFZaDRlcXhxUGdvaVFYaU9T?=
 =?utf-8?B?RHR6RktzMGQ2bjV6N2cwSGl1TDRWZytmQzlIQmxDb056UlNTS3N0SDQ5ajV3?=
 =?utf-8?B?eWgzWWFtQlFINDd1U1JZaEdGNUFJd21QSU1rN2lnTW1MWFdMUVZPa2E0YzBj?=
 =?utf-8?B?NHVUMFVSWWlXR3VBZzY0ZUswWXFHSXkvb3p0ZHB3UjZTaDFodGdTQ1p0Z3Z2?=
 =?utf-8?B?bVJMT2ZzeHlwL0J2bjdITzREZ0JoUVJ1dS9nRE1iaUtZSGlZV2o2clJ0QXRF?=
 =?utf-8?B?TllWMzVub0xBRHVTdHo1NXhHNWl5a1NxR2NnaWZVQmVDc2taVk5FNXN2MEls?=
 =?utf-8?B?N2xDTkowbGZuakdxbzdVTzQ4Q1JsSzFCbHRGSDVsU0hXK3dJMVgzejk4RHY2?=
 =?utf-8?B?YmN0YWFOTWZnTjJpbmdzZm9weUUzTXc1NFNzWXFCd1JlVUliQTE5QXppUDJx?=
 =?utf-8?B?MnNFc1hkOEZmblpTSy83emlHSkp4WHJxUS9OY3lSclJvSDhpaFh2OWg3bklX?=
 =?utf-8?B?bE1BS01EVE1pbWZUbDdPWk54QkJhbFFUK2xUdjRtbGhUanNnVXBCOEJ1OExm?=
 =?utf-8?B?REFvWmh2SnFQYkptQVhUei9FdEQwYWZzSTd6ZWU2RWJaRVdEcGFGZi9tWWtq?=
 =?utf-8?B?U2pMM1RwMVN1MXZESkxqR1VCU3BJMUE5SEhsMy9SQ3FSbjk4S05mTksyTnZv?=
 =?utf-8?B?ZExJTHpvUlRhTXp3OS80bFJhY3BUVVVHUDFQS0l3bUFYTDhLYk8zQ2dLVTd2?=
 =?utf-8?B?QmVibW54clh6UVpZaGYra3dqN1lJb0tjYlUzV1ZDaXgySjM2NjlDZU04cG55?=
 =?utf-8?B?NE5MdWNyK2plU1FnUlFORWZMMDluYVFxNnN5Wk5pTW5QY3ZTU3lYclpxS3pn?=
 =?utf-8?B?VUQ2STJOVjJLNG1oeXpKQUhSZlFTeW1LUGhWUVVhVExWdzZIYThEanpzUWFY?=
 =?utf-8?B?cDBSRERjaEk3R0VINFB3RjJQQTdCZEtNMlZVNXFjTjZIRy9md2JxVnkwUVVt?=
 =?utf-8?B?SDBCMnIwWTNYTyt5UzIvY0NGQy8yc0xER3k5QWpZL251eVNLc2graC9zai9w?=
 =?utf-8?B?T1phZjJMMjhscXVIMDZwMTRZclpVazdxaFZTOTVySkh2SnVDc0ZnUE95Q2M3?=
 =?utf-8?B?ODlPcGJZNVpZbDBlQUJOZVhXMWR5dVdtMzRYUjdxMWZWQ1NTaE9vR1ZGbUxh?=
 =?utf-8?B?MW9xTHBIdmVZYUxpUGZxZmYvOVUvWjlsMGVJb29xWHgxeDVwUzBmblpmZXdW?=
 =?utf-8?B?eWt3Q2RsS1BFL3dvRjVyNTZvQnE0QXR3S0daUVJKRzRyMmhFd3ppNnhxTkVH?=
 =?utf-8?B?cGZXbWRTeElDVE9JcUlOVTFCbXM2b2xLdmRPNHF6anc2MXFBMFFKZm8xU1ZI?=
 =?utf-8?B?bEdEcGFJeVhJSTBVSXltN3lzdENNSzN0S2tXck1kNFZjY2NvQkRkeWpHa0Nv?=
 =?utf-8?B?QnFpYUxhWGNtckNVekErRHhndVBmQ2JnTWMwWjFjc1VudEN3SjY0dTBjeURI?=
 =?utf-8?B?VzFIUnN4L0V0RWtJaVE1S09uajBBeERMblNCRG5lbEZ1bTVockY3U3F5S3F6?=
 =?utf-8?B?MFVmQmt4WmE4aFc4YVBWVFB4ZHlTMklrWXhTRUx6M0NISUhIVGJSZ0VuTzlT?=
 =?utf-8?B?R2lOelhGcE1yN1ZBOE5zQXEyVkZveWlyRTdhQ0lJVDVsRUpRbjNzbWdqSEFa?=
 =?utf-8?Q?cGYlg83sxkA+d1d3MGZWrjfXT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c90ba54-7639-44f1-c4ee-08dd83159a73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5040.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 09:51:37.0680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmauYUM7RLChJZrk0biAcKLD2oHOHgwjmzNcwh48UWbzuyvZy5gS/DEpd4NDGRWF4EtxDHwOem2TDfkqDcQzqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585


On 4/24/2025 2:57 PM, Jiri Kosina wrote:
> On Sun, 9 Mar 2025, Denis Benato wrote:
>
>> Recently there has been a renewed interest in this patch: ASUS has launched a new z13 model
>> and many more users requested tablet mode support for previous models.
>>
>> I have made required adjustments to apply cleanly on top of linux-next:
>> nothing substantial, a macro has been changed from 5 to 6 upstream as
>> the previous patch also did and a few line changed their position.
>>
>> Given there were no functional changes at all I took
>> the liberty to retain previous tags.
>>
>> Denis Benato (1):
>>    HID: amd_sfh: Add support for tablet mode switch sensors
>>
>>   drivers/hid/amd-sfh-hid/amd_sfh_client.c      |  2 ++
>>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.c        |  4 +++
>>   drivers/hid/amd-sfh-hid/amd_sfh_pcie.h        |  1 +
>>   .../hid_descriptor/amd_sfh_hid_desc.c         | 27 +++++++++++++++++++
>>   .../hid_descriptor/amd_sfh_hid_desc.h         |  8 ++++++
>>   .../hid_descriptor/amd_sfh_hid_report_desc.h  | 20 ++++++++++++++
>>   6 files changed, 62 insertions(+)
> Basavaraj, could you please provide your Acked-by/Reviewed-by: for this
> (or any other sort of feedback)?

Sure, Jiri, I will get back to this patch soon.

We are reviewing similar features and related issues,
and we may need some more time to investigate them internally.

Therefore, I would like to hold off on this patch for a little longer
before providing feedback.

Thanks,
--
Basavaraj

>
> Thanks,
>


