Return-Path: <linux-input+bounces-15861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BDCE8C28431
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 18:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918503B86A7
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 17:45:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4338239E91;
	Sat,  1 Nov 2025 17:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="dfaK2Y1Z"
X-Original-To: linux-input@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010021.outbound.protection.outlook.com [52.103.43.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F6253B66
	for <linux-input@vger.kernel.org>; Sat,  1 Nov 2025 17:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762019125; cv=fail; b=Sf2ccdNzJljpVvi0jljEGLL6NRmV4wj4GQjHHAAb9MW2NyB6VtGW+ED1cIs34T52FrddgMsI7oRgcmWOOMww+XnLu3t+0rPveuvYPMp66Ri63Zv/TvddMYF9phR+GIa+CcQ+1rj+fvEmfIctAXK8VtEPgDSOLUxQgstmFU04MgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762019125; c=relaxed/simple;
	bh=WcyT+m0CTcIO/+xxMt6HGn9Udk4sFM4cUPci7K0KYWQ=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TYzTuuMQRw+kWmxTGiqjqxNVKbp861Hh6w0es3bUl7U3t7KnqOvvHVwcO9fWPmsp+LXe5HOT9cJaLUUUqo4ijUvxnDqM4cTT/1Wovrxw+lsk9xFAy249DqCww0WKK73ZJ1WukBpgz5DNXcSTy9ZpzNK2hjSQxdRU4oRXWDcG6aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=dfaK2Y1Z; arc=fail smtp.client-ip=52.103.43.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEF4VCSTXrGozS/iOSEXAM5dvfcIO1HCIl9iejEuMtEvWOZsRtrHfwPidPmFanlXr9hhB/846ONiYcWSSeBRwpAT5+5eYLh7lQhxvDQkmMDyFWbOHpsjwsiKpIfSXRMSG5zcJrC4Mqp8WOMivuLMmQxkC/5042nZzil3Bac+02rAXmj6/twqOx9EFgO1AyrhmkK2fE1pZDJx7TFyGLWhVocA4/CDENaO9K6Gtv5Ml/vcITVKek3mLAjGCn4aiEtvBuNvoh+jytHw59lP08Uj5eICutEZEBnNpquj2xtxMhiFTwLQbebRh8CvU0yWpgxE8fn8xkcj6gvz4oh3aLd6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcyT+m0CTcIO/+xxMt6HGn9Udk4sFM4cUPci7K0KYWQ=;
 b=imfnKxvh90qphTOaaDeapxyXcL3Xocme8NSXRYQBUW7PtGuExyvAjKrfJwTeJykOlS3qKsVlPvebOlElWinCnWP0bDjV9cKhlwCxpr2Aze2qBf3qT4Iw28pF3S4S5HGIBJK09Ar2pPUi/gvaIDpRNHvEWWfxjX0dPAq7BRZyJcvLwSdTuWZaQz7W/1k6k7ImQpkMtkGZxST5p7zSnJ0PWKJY9gMuddoHOTIUidHse2z5AkSK04tvktI9WFOLb0N3i3BSyKAgJ2g9pbwezBjEUnTLM2B2M2xHJWu2bSmOjPIlp1/MN2BQjMMkq4SCxCLsBSSXAJCksKEhfJ+t7boSHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcyT+m0CTcIO/+xxMt6HGn9Udk4sFM4cUPci7K0KYWQ=;
 b=dfaK2Y1Z92ZdxvVGd8sxSrMvvWnTtGTvY5v4vjx0bS8boRnO/7vVwrp9Py2lNhJfHtBoiVx7gZnIeZDBT9hkqPceM95soHaxRE0tlhy3s3t5xn2p4teYmnNBqiN+5MAkkiyOeKBHPykKsBFlmoJn9Fh0M1xvhq6aSupilK3n/BL6DG122MaHXgaqCWrH4Y6Aw6rzqBkj0dAMYTSaz9Hx+F8pyJdBvoUaKug9Q0Qe7V5NMEAlIpBEz8qTVFZcVhHxM/l5ZCKzyNq/j8DISoMYb96mZgPZ5pMgO4Gt2MYVyGmTIoI/nBxRlmdEtI/4RSQCnJ596NY/LM2ijnkmtrrAWw==
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10) by TYRPR01MB15138.jpnprd01.prod.outlook.com
 (2603:1096:405:227::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.6; Sat, 1 Nov
 2025 17:45:21 +0000
Received: from TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f]) by TY4PR01MB14432.jpnprd01.prod.outlook.com
 ([fe80::7679:e9eb:aeb2:f12f%5]) with mapi id 15.20.9298.006; Sat, 1 Nov 2025
 17:45:20 +0000
Message-ID:
 <TY4PR01MB14432DFA6B9FD1F70115B2D5C98F9A@TY4PR01MB14432.jpnprd01.prod.outlook.com>
Date: Sun, 2 Nov 2025 01:45:13 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com
Subject: Re: [PATCH v2 0/5] Input: xbox_gip - Add new driver for Xbox GIP
To: Vicki Pfau <vi@endrift.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org
References: <20250917011937.1649481-1-vi@endrift.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20250917011937.1649481-1-vi@endrift.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bjOlQbW8fL6Xajvs7KEscRSH"
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To TY4PR01MB14432.jpnprd01.prod.outlook.com
 (2603:1096:405:235::10)
X-Microsoft-Original-Message-ID:
 <6e67cc08-b1ea-4760-8bff-611cd0836d7e@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY4PR01MB14432:EE_|TYRPR01MB15138:EE_
X-MS-Office365-Filtering-Correlation-Id: 853418f5-8d3f-474a-e7da-08de196e6d47
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|15080799012|6092099016|23021999003|12121999013|19110799012|5072599009|461199028|40105399003|52005399003|3412199025|440099028|26104999006|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SlBpL0hkWEY1YU91SFhOVlU5c1FtR1h3bERmQnpwSXc4ajNzcnJVN0lwRHZQ?=
 =?utf-8?B?UnF5U25JL0F3NU5seng4SnlSTEZPNGoyM09SLzEzcE0rYW9vaDJjV1dCRGdt?=
 =?utf-8?B?dldvWEc4RGJwYXZsc3FSQkFCbzZoZHM3VGRzMkZpdzNLTWwrM2t4aDNJTnNW?=
 =?utf-8?B?cE1pVFhSVFJPZmlXZTFPblZ5eUEweitIZDVkNVhINHZMcUozOW52RlhNZHVk?=
 =?utf-8?B?YlJDNVFLMjUrSGprTGRuVHE5eS9LM0JHeXp3MWxIUG1kUERNWk1LRXJkeFZD?=
 =?utf-8?B?NGlORVFMN3UxeXNEcXNINVNIR0RTbjUvMmxOLzVUSHROdFNLWkFEbjJuWTll?=
 =?utf-8?B?ZGtydVp3aXZkdFV0eStUOVlGdW1iVEt5ZldmWWFxeEJhWmgwVmNQb2tJYytR?=
 =?utf-8?B?VG1TR29JVlZ4NXhvWStHcVphRXJLV2ErdWRrWXREWGhNUG1NTW54a3ladWhO?=
 =?utf-8?B?cDlzL29icWc5TEpkMnZBWE9SaXpIQ04zK1BJWm5rMVZpT1BCWUFXU3FZdXIv?=
 =?utf-8?B?WkxFWk1XbTNZaDBnWXJJdCtlckRJRUNIZ3JQeHpGcU5hRmNaaGNQNlNrRDRx?=
 =?utf-8?B?Q0dURkhuczhiRC9rYlNHRlNNOHlkSnUrRDRWM1MyT0I1Rk4rWnBXdU0rZ0tW?=
 =?utf-8?B?Z2FBZmJNY0dnNTRIdGExRUdobzlmT0pRbHFmN3ptZHN0L1p0MGlzbmdsNFBE?=
 =?utf-8?B?d0tJTGhCYmw5ZWpMTndvRjNJN0tObmpnZHRjeWx2ZUplZHVWMkQydkxNTFF1?=
 =?utf-8?B?TTFsWW42b3E4REhTU1huTHgwaTR1SVBIY2ZLc2N5V0t5UjgzdCtXTElMcXRP?=
 =?utf-8?B?Z2lKbjdmQk9GTkdsWTFKVmFkeVBGRXB3dUJtbTVxaDlCc2xaR2p1WDlaN05C?=
 =?utf-8?B?QnR4NzQwRExTTzdVaytCRVVkakl5eEwwY1NYc2FtVG1WY2srR3RhWk9YWUFh?=
 =?utf-8?B?ZkZ3RVdNM1hwS2Z4NW9CbVJhY0VqZUpRdDcxaFhuTTk0OGZ4L2dqL2pRdzhP?=
 =?utf-8?B?bUczS1pSYnBOQmdyd0pJVWlEZ1NLVWM5aHNpaXo1R1ZYN2wzaU53R0ZoNUtT?=
 =?utf-8?B?YTF0Z1ZmMlFiUkEvdVljZHFPSFh6WjhmVGlKMlFaNE1xVzlOZ1FiTmJPdzJk?=
 =?utf-8?B?RkR3ZlZIZTdoSWhiQXpjdkN1WmkvUVdseTRHZmV3dnBOQjF2SDNtZzdvN05W?=
 =?utf-8?B?RGlhV20wR1A1a3dCNERGaHhva0hCcjlXUHkrckxoWXI1OSttOVFHaTBsZFdW?=
 =?utf-8?B?VndoZDlEU1V4dm5EcWhtZVpadkpuVU55K1FaNVNJV0Uza3hCSmQzVWttNDVP?=
 =?utf-8?B?QXNrNnllL3hUNWdRSzJuMmlqQVhrdGNmRmpQK0ZuTjEwZzB2S09DVU44cmVt?=
 =?utf-8?B?Tk0rOStNOGRtTm5JMWYxNm5tRlJCYjBsdnV1RERraDM2MzRRZXdaRzVWZlBh?=
 =?utf-8?B?Q2NmQlE5QWgydzBibG1vMnpzZUlSU3pWUm9LcXI1bktTL3cyc2UrZ1Axc3BB?=
 =?utf-8?B?VTNxem5DWFg1UWUrUGUxRFlzT3RyVGJ4dEhjYUFVVFc5eFRjdHgzTldBQysz?=
 =?utf-8?B?OGdHRGRsVndqUWlvNUpia3hTQm5KVTNXcm44bE9uM2kwWWVYUDVaQitkekhp?=
 =?utf-8?B?V2I4S0ZaeFpSd1hWcEZIMzE1a0ZqT28wdWVCTVFkOHl4ZjdzdEtiWXNXajJq?=
 =?utf-8?B?blVzaEptcjBGUWFoa0lNdksvN1piZU1BWWNaY3l4elhWcGYvZFYvb29vUXdt?=
 =?utf-8?B?UkxENHNydHZDYXMyVTJ5TDdWaHl1eUNUd2IwMjB5U0swcVcrS3E3UWNhUmJB?=
 =?utf-8?B?U2hMZ0Z6RUJLOW5vRlNwUT09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHFWeE5FcVh2eXIreFF2STc5cTVielpDY0UreG9uMHJUYkVwZzRmTW93dGRP?=
 =?utf-8?B?dG1iOVIrb0o3ZkdHS1hlZC9MdjlHWHoycXc1akdacldJb3ZmM3Q0OE5ibnZR?=
 =?utf-8?B?ZUFyWWNmanN5dTBRbk53NGQxS2pwWVErU21rOUkzSnF1bEJKQmVQL0NxUzdM?=
 =?utf-8?B?dE1QQjVLZWo5WC90bGx2NzdnMm0xWitjNk5wc1B1cklpLzFiMkdZSlBIUnJj?=
 =?utf-8?B?d3RrUEM4VmZoY2JHUURUbnBpZEEydGVhTmVEbWxsUXRRMzB4NVk0WDdyUEpN?=
 =?utf-8?B?YVArUmFscjlhRG1MNVJGeldjR0IrZnRJZDF5ZGNjQjJ2VVIxenk1Unc4Ky95?=
 =?utf-8?B?eVlyMXNwTVhGZndQRkJnbVBteENiT3dQMDFPSVNNZlZvcFBhc1N2a0hzdC93?=
 =?utf-8?B?N3phaWVLMUhGMnpuMlBsTjlPRGpHVTdzUDRHMGR1cWZGVFJ4ZjByL0Uycm5w?=
 =?utf-8?B?TVBwcEVJbS9vUzdJNFA2RHlxZUdvOW9ONFEySVBnViswc1RLbGNITXY4ekFh?=
 =?utf-8?B?UzRpSnpPaVlUVGZiaXFCdFI1bkk2NGhEZEhoTlJrKys4Z2IvZXFXM2RQOVc2?=
 =?utf-8?B?NFJwbXR1TDhUUm5KVUFWRHk5ZjJGcUlDZlhsV0FJbHVmOThEWUdHemxld2Nw?=
 =?utf-8?B?dUdSWWNFQklYMWIzTmJ4RHREeTJaNHhXTXEyU3h3bnpzeURUYVEybytjK081?=
 =?utf-8?B?VnNXUVdLMWNDckx6L2dFbm9KV3R0NUdpdTY1ZkpJV29sKzdWMmEvUHpPNGQ0?=
 =?utf-8?B?cUg0UEliTi9EZVVoYXloS3IxNjNTWmhzK3kzalVNMVNyTEQ5eWxSMDZwQ1ND?=
 =?utf-8?B?MlZ3Vm9PUjBHZnNGd0x4aU5UNUNUR2dCeC9tZ1hiOTJMdWRmUFY5VmJtTDY1?=
 =?utf-8?B?bm9jemlaMW0wUWlmY0w0SEp3MUtQOWZzdUFxazYrNlpidGNDTHJjcS9WTEdI?=
 =?utf-8?B?TG5rUkswYkJjUWFscDBkcjNaeHBmbGpxK2orc2JDc3AxZjA5L0dqTkk2T1FF?=
 =?utf-8?B?Tm5laFc0YUwxd2ZLQmRLWi94dGJveDZsS2NBT3V1TU5aZnhZQjJ4R3RmRkZV?=
 =?utf-8?B?cTFjVzZiWElOMzJSMVBvbTlBQXQzaGIxMzRqcGo1SmxLbzB2RTBYRDZsYmFU?=
 =?utf-8?B?ZExLZWluSDVXOElVcnFGdkluS2VMMEJsTWd1eGtndnI0UkkxY0ZEUEhVYUp3?=
 =?utf-8?B?MTFnTUtyQlZEaFNwYjB3WVVpa3plV3ZOcHlxTHk4UnRjcmVGV29CK3hDOFJR?=
 =?utf-8?B?Q2hUQXhsV3kzb0FlVUN6UDZyWVRXVXRQeEZHMVU5V0FlWHZBYmQ0aEp0MDZD?=
 =?utf-8?B?dDFDTkNsSlBidlNXNk4rR1VBemxVS2QrYXo5Vm9uRkk0YllWMVMvcWhUYjZK?=
 =?utf-8?B?RUUvalk2MnplT1B3bC9peFRXTDhpbmFvL3VaUUxnL3pQVktVN1hGWTI1eFpL?=
 =?utf-8?B?VER1Y3VUeWRxcG1hdHl2R2l0QVAxTVRDemM5ZWc3bVpvd05QdmlyeUQ4K2sz?=
 =?utf-8?B?Um5DN2x3S0ZQL1RJNlFFaWk3MmVGY0NjN0xZMDZOYUNCUlpxblQ5ZFNZdTlB?=
 =?utf-8?B?RE1ITURUN0VkZ21VVEpzeDJlbXhVV1M5M2UyM2dqU3oxVDcyK3JOWm5RVjVR?=
 =?utf-8?B?aDkwaXRtb2swL3loZXZXbnJwdjNyWTNJcjY5ZmlCb0FBN0tBVnRnZjIwZ3hE?=
 =?utf-8?B?MVZwZVlvS1hZaG9Xc0xCWXdZYzJjRGtuZW00bWhSMXdUZmFlbnFxdDJuNHkr?=
 =?utf-8?Q?h6gmNhnYP9LUwJIIDw=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 853418f5-8d3f-474a-e7da-08de196e6d47
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14432.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2025 17:45:20.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15138

--------------bjOlQbW8fL6Xajvs7KEscRSH
Content-Type: multipart/mixed; boundary="------------uvvoq8mhuPGl9CoaN4wa075E";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Vicki Pfau <vi@endrift.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-input@vger.kernel.org
Cc: wiagn233@outlook.com
Message-ID: <6e67cc08-b1ea-4760-8bff-611cd0836d7e@outlook.com>
Subject: Re: [PATCH v2 0/5] Input: xbox_gip - Add new driver for Xbox GIP
References: <20250917011937.1649481-1-vi@endrift.com>
In-Reply-To: <20250917011937.1649481-1-vi@endrift.com>

--------------uvvoq8mhuPGl9CoaN4wa075E
Content-Type: multipart/mixed; boundary="------------Ce2gLDbhA5PtB2wa3r6iXSdw"

--------------Ce2gLDbhA5PtB2wa3r6iXSdw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

UGluZy4gQ291bGQgYW55b25lIGdpdmUgdGhpcyBzZXJpZXMgYSByZXZpZXc/DQoNCuWcqCAy
MDI1LzkvMTcgOToxOSwgVmlja2kgUGZhdSDlhpnpgZM6DQo+IFRoaXMgaW50cm9kdWNlcyBh
IG5ldyBkcml2ZXIgZm9yIHRoZSBYYm94IE9uZS9TZXJpZXMgY29udHJvbGxlciBwcm90b2Nv
bCwNCj4gb2ZmaWNpYWxseSBrbm93biBhcyB0aGUgR2FtaW5nIElucHV0IFByb3RvY29sLCBv
ciBHSVAgZm9yIHNob3J0Lg0KPiANCj4gTWljcm9zb2Z0IHJlbGVhc2VkIGRvY3VtZW50YXRp
b24gb24gKHNvbWUgb2YpIEdJUCBpbiBsYXRlIDIwMjQsIHVwb24gd2hpY2gNCj4gdGhpcyBk
cml2ZXIgaXMgYmFzZWQuIFRob3VnaCB0aGUgZG9jdW1lbnRhdGlvbiB3YXMgaW5jb21wbGV0
ZSwgaXQgc3RpbGwNCj4gcHJvdmlkZWQgZW5vdWdoIGluZm9ybWF0aW9uIHRvIHdhcnJhbnQg
YSBjbGVhbiBzdGFydCBvdmVyIHRoZSBwcmV2aW91cywNCj4gaW5jb21wbGV0ZSBpbXBsZW1l
bnRhdGlvbi4NCj4gDQo+IFRoaXMgZHJpdmVyIGlzIGFscmVhZHkgYXQgZmVhdHVyZSBwYXJp
dHkgd2l0aCB0aGUgR0lQIHN1cHBvcnQgaW4geHBhZCwNCj4gYWxvbmcgd2l0aCBzZXZlcmFs
IG1vcmUgZW5oYW5jZW1lbnRzOg0KPiANCj4gLSBQcm9wZXIgc3VwcG9ydCBmb3IgcGFyc2lu
ZyBtZXNzYWdlIGxlbmd0aCBhbmQgZnJhZ21lbnRlZCBtZXNzYWdlcw0KPiAtIE1ldGFkYXRh
IHBhcnNpbmcsIGFsbG93aW5nIGZvciBhdXRvLWRldGVjdGlvbiBvbiB2YXJpb3VzIHBhcmFt
ZXRlcnMsDQo+ICAgIGluY2x1ZGluZyB0aGUgcHJlc2VuY2UgYW5kIGxvY2F0aW9uIGluIHRo
ZSBtZXNzYWdlIG9mIHRoZSBzaGFyZSBidXR0b24sDQo+ICAgIGFzIHdlbGwgYXMgZGV0ZWN0
aW9uIG9mIHNwZWNpZmljIGRldmljZSB0eXBlcw0KPiAtIENvbnRyb2xsYWJsZSBMRUQgc3Vw
cG9ydA0KPiAtIEhJRCBwYXNzdGhyb3VnaCBmb3IgdGhlIENoYXRwYWQNCj4gLSBQcmVsaW1p
bmFyeSBzdXBwb3J0IGZvciByYWNpbmcgd2hlZWxzDQo+IA0KPiBUaGUgZnJhbWV3b3JrIHNl
dCBvdXQgaW4gdGhpcyBkcml2ZXIgYWxzbyBhbGxvd3MgZnV0dXJlIGV4cGFuc2lvbiBmb3IN
Cj4gc3BlY2lhbGl6ZWQgZGV2aWNlIHR5cGVzIGFuZCBhZGRpdGlvbmFsIGZlYXR1cmVzIG1v
cmUgY2xlYW5seSB0aGFuIHhwYWQuDQo+IA0KPiBGdXR1cmUgcGxhbnMgaW5jbHVkZToNCj4g
DQo+IC0gRmxpZ2h0IHN0aWNrIHN1cHBvcnQNCj4gLSBJbXByb3ZlZCBzdXBwb3J0IGZvciBy
YWNpbmcgd2hlZWxzLCBpbmNsdWRpbmcgZm9yY2UgZmVlZGJhY2sgc3VwcG9ydA0KPiAtIFN1
cHBvcnQgZm9yIHRoZSBzZWN1cml0eSBoYW5kc2hha2UsIHdoaWNoIGlzIHJlcXVpcmVkIGZv
ciBkZXZpY2VzIHRoYXQgdXNlDQo+ICAgIHdpcmVsZXNzIGRvbmdsZXMNCj4gLSBFeHBvc2lu
ZyBhIHJhdyBjaGFyYWN0ZXIgZGV2aWNlIHRvIGVuYWJsZSBzZW5kaW5nIHZlbmRvci1zcGVj
aWZpYyBjb21tYW5kcw0KPiAgICBmcm9tIHVzZXJzcGFjZQ0KPiAtIEV2ZW50IGxvZ2dpbmcg
dG8gZWl0aGVyIHN5c2ZzIG9yIGRtZXNnDQo+IC0gU3VwcG9ydCBmb3IgdGhlIGhlYWRwaG9u
ZSBqYWNrDQo+IC0gU3BsaXR0aW5nIHRoZSBkcml2ZXIgaW50byBzZXBhcmF0ZSBkcml2ZXJz
IHRyZWF0aW5nIGdpcCBhcyBhIGJ1cyB3aXRoIGVhY2gNCj4gICAgYXR0YWNobWVudCBiZWlu
ZyBhYmxlIHRvIGhhdmUgaXRzIG93biBnaXBfZHJpdmVyIGRlZmluZWQgYnkgYSBwcmVmZXJy
ZWQgdHlwZQ0KPiAgICBhbmQvb3IgR1VJRA0KPiANCj4gQWxzbyBpbmNsdWRlZCBpbiB0aGlz
IHNlcmllcyBpcyB0aGUgYWRkaXRpb24gb2YgdGhyZWUgbmV3IEFCUyBpbnB1dCB0eXBlcywg
d2l0aA0KPiB0aGUgdHdvIHJlbGV2YW50IG9uZXMgdG8gSElEIGFkZGVkIHRvIHRoZSBtYXBw
aW5ncw0KPiANCj4gdjIgb2YgdGhpcyBzZXJpZXMgaXMgbW9zdGx5IHRoZSBzYW1lIGFzIHYx
IHJlYmFzZWQgb250byBkdG9yL21hc3RlciBzbyBpdA0KPiBhY3R1YWxseSBhcHBsaWVzIGNs
ZWFubHksIHdpdGggb25lIG1ham9yIGRpZmZlcmVuY2U6IGZsaWdodCBzdGljayBzdXBwb3J0
IGhhcw0KPiBiZWVuIG9taXR0ZWQsIGFzIEkgd2FzIHVuaGFwcHkgd2l0aCBob3cgbWFwcGlu
ZyB3b3JrZWQgYW5kIHdhbnQgdG8gZGlzY3VzcyBpdA0KPiBmdXJ0aGVyIGJlZm9yZSBoYXZp
bmcgYSBwYXRjaCByZWFkaWVkLg0KPiANCj4gVmlja2kgUGZhdSAoNSk6DQo+ICAgIElucHV0
OiB4Ym94X2dpcCAtIEFkZCBuZXcgZHJpdmVyIGZvciBYYm94IEdJUA0KPiAgICBJbnB1dDog
eHBhZCAtIFJlbW92ZSBYYm94IE9uZSBzdXBwb3J0DQo+ICAgIElucHV0OiBBZGQgQUJTX0NM
VVRDSCwgSEFOREJSQUtFLCBhbmQgU0hJRlRFUg0KPiAgICBISUQ6IE1hcCBtb3JlIGF1dG9t
b2JpbGUgc2ltdWxhdGlvbiBpbnB1dHMNCj4gICAgSW5wdXQ6IHhib3hfZ2lwIC0gQWRkIHdo
ZWVsIHN1cHBvcnQNCj4gDQo+ICAgRG9jdW1lbnRhdGlvbi9pbnB1dC9kZXZpY2VzL3hwYWQu
cnN0ICAgfCAgIDE3ICstDQo+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgICA2ICsNCj4gICBkcml2ZXJzL2hpZC9oaWQtZGVidWcuYyAgICAgICAgICAg
ICAgICB8ICAgMTYgKy0NCj4gICBkcml2ZXJzL2hpZC9oaWQtaW5wdXQuYyAgICAgICAgICAg
ICAgICB8ICAgIDIgKw0KPiAgIGRyaXZlcnMvaW5wdXQvam95c3RpY2svS2NvbmZpZyAgICAg
ICAgIHwgICAyNiArDQo+ICAgZHJpdmVycy9pbnB1dC9qb3lzdGljay9NYWtlZmlsZSAgICAg
ICAgfCAgICAxICsNCj4gICBkcml2ZXJzL2lucHV0L2pveXN0aWNrL3hib3hfZ2lwLmMgICAg
ICB8IDMzMTQgKysrKysrKysrKysrKysrKysrKysrKysrDQo+ICAgZHJpdmVycy9pbnB1dC9q
b3lzdGljay94cGFkLmMgICAgICAgICAgfCAgNjM0ICstLS0tDQo+ICAgaW5jbHVkZS91YXBp
L2xpbnV4L2lucHV0LWV2ZW50LWNvZGVzLmggfCAgICAzICsNCj4gICA5IGZpbGVzIGNoYW5n
ZWQsIDMzNzIgaW5zZXJ0aW9ucygrKSwgNjQ3IGRlbGV0aW9ucygtKQ0KPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2lucHV0L2pveXN0aWNrL3hib3hfZ2lwLmMNCj4gDQoNCg==

--------------Ce2gLDbhA5PtB2wa3r6iXSdw
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFaz
LV3FGBjT+9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q
4Ww/W87mQ12nMCvYLKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx
0HJ92zTBMzMtYsL7k+8ENOF3Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/
SJv0w2YmqZDIAvDXxK2v22hzJqXaljmOBF5fz070O6eoTMhIAJy9ByBipiu3tWLX
Vtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1el5WW/qxqrKCSrFzVdtAc7y6Q
tykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdromSrsD0gEmGcUjV7
xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB+X85sxcr
4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0x
i/KZIRpSlIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQAB
zSFTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
AQIXgAAKCRDjUgzJGSnI57GwD/9O6kei9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ
8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSiOnyyHrg8StmGLksQE9awuTnl
nQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHaJwFi1KATSI1AhsF3
CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9voraKhx+0Ds
ZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISF
gvZoGYdB9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaa
LZH/jzQf7FpIGGhDYnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2
yVu3w4tIchRT3wekMh2c3A3ZDeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yA
j6Ey0YrIUbW9NOhIVCGkP4GyJg756SGzyPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AE
H2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4TrXUR0ScTy1wTKV1Hn+w3VAv
6QKtFM7BTQRitDnpARAAsPFINiaOAxfatzRTme/1cG+kpSqY9znQYxkz8EWY1eAO
Qs2xKl65JUyhTRPQkW8cqDVzdVF16wW+1RyoMrtK5xj6jm9K7VAAc/sDL2LkoSjj
3FpoOp/RMfVBiLGATCdNSEDFPO6nGVJn8aOXmH54sgZzhgfqW1X9Y4ToWViF5VXZ
sWGzHPsXoVvlRyPfAYi9eL11hZqQVhXPOQTuAG4ow8z7ZGYT7wfZo9oXvs/11DQ/
pxt7aO8QGCNCsWnMOecPBy9+Tbr/huxLVFl+boaTv3QwdATHFtObOi+q3m6RAADB
VQSiACVCsqb02HADfhO8n0AM75fJjbXFTLBR06+eME0h0dF8d9hu9gHe3ZHqsvB4
X5E9UP+Vf8c1M9aoJrULVoAOo50gmCEhjlzI5xYczBtw1bhOXCP0Wj5cmx3wbKq7
UKMXjDKF9ag907d078BaIzhMOChN6s9c03KM6ix0nLpBGzYZXC0VL+yqKkiHJzee
mBJ4YzLvf8rCGxbg8kKPQ2ongQVpcE4rr6uS/kCoB7BpVSaHraAHA6IwpGccOlU+
0v9rBghE1QzIlhkzcxwzxlb7rTZsedxSPQLVdPaRG9rkz3Qw3mWYYs2w7dJahgIm
p1z/v9qdTWYdHzKRyafluFlz0PoUcVuGz6PwFzDxGV5Gqqg6zHLEx68KxKwoyecA
EQEAAcLDrAQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDnpAhsCAkAJ
EONSDMkZKcjnwXQgBBkBCgAdFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmK0OekA
CgkQX75KBAfJsRlTUBAAjQoMom0dfgWNNIXpvQgiGRh6slnyZ/QH4j2CGNTgfNC1
CV4SVC7U/A3lFDoDGbcsISb7uKyLnjrn1c3rguT9JXzuIbQZotgE0LvG09odGMXD
S92CmBaKnvhYlSO0cUdRtgvnw3nMgl1Kz7a8vvjYl3S1XhXQ8bpgrh2Sn36oqhaS
//Mgy52qHN2lRz09lr9Ig1NSXkjguSyj1hTc5wOWV+rsX4is0nOBNaov76/tbcF6
sIsHyHPSGzZ4jefZs318ineuBnrtVE9sH9XWc1QHLF1gzOKKwssddXlYe2Sj5plX
vZqcHHYfrOLe+v1gxW21HumUosTsCDUVJ9egr1DQcaQiiOUV5qQi4/GfqFAacken
NbHcNLpOxaOE3IwbL0F7aZHsKsl18suDXAqb3ljyAm4fEZr2ceEnE7n1x9BZizJL
YbkYB/k6gxxxbyjcoR6F1niEE+6Hs9vKGNmvNQikPpv05IDXgOr6pgWWCdZCiup3
N72xS3OCZNkkVQjaSL6/hN/IcR8+Xtp+nbYH4Agm9hBAPN045l/P9nVmSQOJ3TC+
wGgo8N16qzW061YD/faB/g/u7RcSfi5SwISIyrNXnyhBZTrFx+0KsjtdwVGJXYRS
/tio6zRaBl/bO3+e8SGqsHU3f6JH+HgTWJINfj3I/wDIBAL0XGoDAE8tqQBpsTBd
mA//WestyKDwfpZEqz9wBNX4QUS/zh+1GiweKcgqXhi4RuV/MXTPXcET1/pGnX5S
h9hdBj6lIseTtbSVDBHQm/1qUPYFAG+grdWZ7YrPIXfKTUCBlE/pKcJ6Yi1RIW3o
OQ1+OfYaPDfqOnq2Ed+HFM+KNFhWtU1TRUBikU1n88lMcRlFHFtkAuZgsDwj2b+v
c71uXNA3YkcFHGBhq7rJQu3B1l2zvM0P0ds0HAo58iJ4qqMkA07EJStaATOokDAC
4Xo+n7DHu81pQPP9BTY9u1G+m4mlpivWqIVk5Gbb+2w9yCmkEWqv5QYPtjpgxq0h
zURLeU+BDvOUKjCS5480NvxWwOthPqYls0WgoSVVMtDpeklSRxmrHJ6k+H1gV9Ja
WcfQO/l0IQrQm1+xE8xz87oHl18gIVbpXmlfss6EnPfmhdst/FqxXM0sxV+QD3oF
mf/CcRG4SSqjsKkpQviDMG5TwN52mWwoirk2MYlNGLNwknWXhRb0l7r4SyZNfOWp
0EI0EvO+CfKZL03drnmMaeOoXXtKwmWgCpYTa6dxtTTVKbeUKYy2p+jYZqUONl3y
CwuL9UIOwE+LxhtED4ZjIWxoD5/uOBGLofP/eNZpMmmC9H18rupdh6ChGYi3q6/L
6oHNPDbwJUFv9UJys+MwOV1Lzq8ULCxRfYntnhug1iZHYdTOwU0EYrQ6CAEQALWU
YW4bgH3p7jUtpD8rUoaHTJ+G3z9ZUjYvz+r0llcpurPm0DyG7kWHzbzGTCkdYTxf
dxEaUggMfWxLC7Vyd8PadoBTlJJ++7MP9eL9IzyaJEG034N3TtDym/v/PataFbjs
hi4YF1tT/2RnSK3neeotr7FX8+zZrz5EgE69Wz06HGIKanRn9fhUKfKQzetGl0NE
Se62aTkxsf+Qb4Hq2i1wm6ct4m2iRfdhw1OUDNQHgbOy6V8mxXPg2fsJLVC3inpg
BdhA5xWrkAnxouujB1xs9g4Mu+5WnUqc/jr6S0zKbm81Xohl8JDbGvxbOpb9fmq2
NnVLR4771NJC3/2qzU/pjgjA/HNmjmqYFEIToTNlNjsEYGydcujlSsjdFDe+pA6S
kqUrEHpaVf031JOCzEzgfqyH3gMBtDXyrGAs8Vdnb1/ROMIALqbK8nh2IYnRblME
J3D6nJDlYMVwsDgOhhrTFREBUdLJ7lZ+LpS4ACctKyV22Eo/L2nOFeu1+pdgivMb
4L2VIJtgvzKFfV3I6MUMzSDMkhQzQZjPq7Uzlu0cZ9ZpSO7HuUzigJZ6vnE7iwLv
i/yyjUUqHnSmLFFE4xxpnsMlDZXBxx0HIzEt48M2dmvfmD+SqSiQrE/3qgWaIjwC
+lfYggYjPtNgSntkfOsCvDqnob8b0dpqRcFT5Px/ABEBAAHCwXYEGAEKACAWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ6CAIbIAAKCRDjUgzJGSnI5/3nEACdQ2vO
zmUJ2LoFq7z0Dn7HVfUX8slzja7LBl3vCw/2Oq5s2VbvgZuPRfUxdEMXPlTqyab/
VVbHzqhSYtMMpDsMhEnVZ4DawFvWVs3yL5BA0qU5Wsb82zRGO6Qab29cRaEjK6Lt
a6N9vfVyn7ZQNvUWB4sB9RyAtSTyQVrEuLZWoWfQLRqOaecFaBCsTeg/0q4ywnBY
kCZR9ciEnLGVRZt6oE7qNoNLsyTNKNWNge0/Jiv67Jt4VByZWwqz5f65GBAJYUlC
qWsCoZXUYTnqlFAnI533ZhYEx/x7UzCJREAPgpP0/DOfmaf54QqTwsdKU7g3VE0a
N7Vhy/ja4sCvgLmTUftKXr7k2Dsg+gldB54P95VPOot4DdehlcTVkI1HUNabPSJ2
kIS8bIHr0JrIMzqqOhlIh0CHcbwLXBu6V7+x0YcbGQPuvIfJYsYjHhNVt9Dx9Z8Z
+YDfxJJXY3ORfcQbtf700l/XRs3q9c2WRZ+CfJWw+kfpHjmq6BfEPUtXGJ0G4d7w
ErIZszYIviEpi7UdWuM48WNgJSjb/o5HaSLY6LeXXsMVXlOceYtbF1idw7eMTchU
rNj2bNSLj0qJZstNIVWXRYhpq/ELjJjqOmGoEnVb668sPNdpObwLJA+QDAvRBq7t
WPHvRXXbC5TEqFVd89bPHQNQyvecpEnSBbVWU87BTQRitDmyARAA0QGaP4NYsHik
M9yct02Z/LTMS23Fj4LK2mKTBoEwtC2qH3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKq
XYq+bE1Kf1+U8IxnG8mqUgI8aiQQUKyZdG0wQqT1w14aawu7Wr4ZlLsudNRcMnUl
mf0r5DucIvVi7z9sC2izaf/aLJrMotIpHz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQ
jq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM/pM4L0tPVCa2KnLQf5Q19eZ3JLMprIbq
KLpkh2z0VhDU/jNheC5CbOQuOuwAlYwhagPSYDV3cVAa4Ltw1MkTxVtyyanAxi+z
a6yKSKTSGGzdCCxiPsvR9if8a7tKhVykk4q2DDi0dSC6luYDXD2+hIofYGk6jvTL
qVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjnzuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ
7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQzRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ3
4AZIfFoDIbtRm3xt2tFrl1TxsqkDbACEWeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhN
uHybIS/8tJzdP3CizcOmgc61pDi/B6O2IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8
VcI4wdCkN/Od8ZMJOZ2Ff+DBbUslCmkAEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1Jo
ZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJEONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH
7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3PPt4wkQkdbF+c7V4uXToN4a17bxGdUnA9
qljxt8l3aEqd4jBqLn2OJriu21FSnrZOpxb1EwWwvnVUwrLxCuV0CFQJdBlYp2ds
64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsNVeqrWU0mDAOgvqB86JFduq+GmvbJwmh3
dA8GnI2xquWaHIdkk06T55xjfFdabwEyuRmtKtqxTP/u6BzowkV2A/GLxWf1inH5
M81QgGRI2sao6To7sUt45FS+y2zhwh62excOcSxcYqKzs/OiYEJjWMv9vYRwaqJG
EVhbfGFOjeBOYr+ZCCeARh+z4ilo1C2wupQT8VPsFiY9DRYgkAPKlbn9OqJvoD7V
hvyelJagSNuRayrrmnEaZMsoRdS22fneCVWM0xlGSgPCVD0n9+6unTnVbmF/BZsE
g5QufQKqlFSomu1i23lRDPK/1aPc2IoxcQPh2fomy8spA5ROzOjLpgqL8ksEtQ75
cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+
lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/aLzG+FguuGNZCPpu5dVQH44AXoFjoi9YV
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------Ce2gLDbhA5PtB2wa3r6iXSdw--

--------------uvvoq8mhuPGl9CoaN4wa075E--

--------------bjOlQbW8fL6Xajvs7KEscRSH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmkGRyoFAwAAAAAACgkQX75KBAfJsRki
9w//fl5ZF28eOtnrA4OiWZhfqtQ4kzoCF6lPMTdAdjyhEkpHmBUvvtSPSQ1bhh6JR3Umuf/utsUl
jtbDXaW9Y+5li/gAJ4mHN++OUKcgEkuh0mzxL8CpVTzoSjByX1/MZOWiqNEdCi6IkUCNSTA3YFNt
z0T52jJcz1qRgsG3qiypAa52RvSVApn5nUzqn+CXWN9smVPAlOeFtgAA8pdIt6lu/PYP1GLyibOm
BfYmbgs5RSVBDJdQ0hDQQPqmvXRYrRaWfWMIxJHSlmeZU8pq4HURYFHzpfBST3aGuF5P5CONWrPF
y4JC5V6TlyPSiDRLDB0krAf05fHKN4XmH6oTAXxScdqN6gzsTk0zlncYYxvfu5/PuXpGkIPxR1n/
gud0t1wlSD3Bq3brsYtyhmy63DK7A/Jqle1CLendWpsyCj/uWSmQirLdUNAd8rPgmIUp0YhFlLoP
gqo9b7Rh88Dz99vECt26JpD+TC6okoJ9Z20k4quO+ppjGUsFnE5GWnnai8/autlZCB3P4rhGK9YD
E+uBykxgQd/lEkZMxbfbkkeEhKTi8f4K69reKW6QdzN+e4VUBH/nHP4Z5aqEnI/HgpI4x41CVzPT
QPLDRY5snlZzsUCESLaE29SNjQNXHFW3jfL4z8tF9SuS+Wsyi13o6+a3+uJaxSqGFtsOoBCdnR3e
NKk=
=rB9X
-----END PGP SIGNATURE-----

--------------bjOlQbW8fL6Xajvs7KEscRSH--

