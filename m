Return-Path: <linux-input+bounces-11681-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6E4A83625
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 04:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49A648A4FDB
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 02:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C2818C004;
	Thu, 10 Apr 2025 02:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="urRQsYZS"
X-Original-To: linux-input@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazolkn19011039.outbound.protection.outlook.com [52.103.66.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD33944F;
	Thu, 10 Apr 2025 02:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744250540; cv=fail; b=G22jlfPw7tsTEr3E5XM7E9361cUC5YsrUf8936Auo1COce4iHq8GG/UbRGhBVmWQpN3EuGH1MJjZV/LdlGy6fK3wgFMuBmcecwivbW+mL4iIKo23XKu4ldi6mhpVggbx170/WvJ5UFEXemQkiudeyNSi6b9hS/TksT5xSQWaP+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744250540; c=relaxed/simple;
	bh=8re4mz+9BBGCid4irdezEdaptq1i0U9xi9wyp6eyOpI=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EqZoN+jJHH5i/GnGuyhQBsAqFP2uIOuSDSFs8ZqAgoxj7rUZwYQW0s6gc1VHlMlPdsftVbEvnMY3sVXQZl8lb4Cj54grSL8dZrKwxwxdCljMgQXnspVeyvhUTtta7RKusCE3bK1Cgx1CCyXT6Ly6eIaO+eermWI9/5pnlGS52yU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=urRQsYZS; arc=fail smtp.client-ip=52.103.66.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AqDAH8wfKFAxnhC4Qu/fxNP9k9N2VPyEUtX+OZX4ypYj0V3vS2xT0ENeYp93N4kESQYef8OD971KsXgZM90Mh+rwj8XCUqRZREItl/uyyP5XX7eF5JGsx60730UJD+dBCjy2ivEi7EHs3XjjJRbmNmfGE9oAPdFdCqL5f25gIAZrMhzldrP7tQAsJVOYEsPxV5WdmlK7AcsPcmn32DOLWAO/530w69bisp7UDpL+uSUkPV5rzx9kLFlOOgks5mskgHHfC6vZJrg9QzOuj9QWJ2gTchQRJ3QxwGOCnRScNU6caUZ8XED3peYHa0BWVnIYYC/ENsUtgKTTfsu32vh6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8re4mz+9BBGCid4irdezEdaptq1i0U9xi9wyp6eyOpI=;
 b=ZghmI9Uj5vsESfM8jgmoac89IYcQveGjE0qJORYxLND7ZbjH0u8oLssVV5V6MA5WtZHQfJPCWgrOiNNPLZVKcvzqfryvjQp0jAXwwNuFVhmA2wBQqzT1pPqatcOAf2qRHuc5FdwMgcG8liV6n1oOn7zkywjI5r+ocBx81M4NFjxKJ6GuPp8TYIYiCXFtGJS9p53xV23T+eUpHwrTZKSYU1SZwpYPJsEGXSJGdDub5e4xBKnkPDCvhmeeSUEdhB+LE/6dnJ1bbiJ3IpnVHIbte6ZNgwiIfowRGCPpjnazt1P+TRs/ccSzwkI1FNdX3a634kyLgYy0Mcyz1YkKOqExuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8re4mz+9BBGCid4irdezEdaptq1i0U9xi9wyp6eyOpI=;
 b=urRQsYZST1ScoLk9H7MLN98CE4kKbQzIZstb0nxasi9tyPExM7c+Fp2zIIlPHREmWNblrZLlz667+mePR+760GfNYRQaz/mVAaOtmfTrCBlJNFq9t02QPJJt20b7Unn+klPQjgX+skMqKxIGxbVsT465JChyBgWPv+FGx0o5Pj0XzIiSixUndVyJRiu2AgOuV8IbgvLq9KlPZn0aSjyTkEoldMASx2yNFbNloaB4lkRADYMtZ1Ktili3QIb0bZTg9xQbXFVYMZz6cSoVj7ZOMo2rj57TRltk9k1ITXHv5rDzprU8Yjx1X1GYhXhS5iG/0gTLUzPYMK1KyrG+gzZTfg==
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com (2603:1096:400:156::5)
 by OS3PR01MB10058.jpnprd01.prod.outlook.com (2603:1096:604:1e7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Thu, 10 Apr
 2025 02:02:10 +0000
Received: from TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f]) by TYCPR01MB8437.jpnprd01.prod.outlook.com
 ([fe80::83e7:751f:f3af:768f%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 02:02:09 +0000
Message-ID:
 <TYCPR01MB84375C4CDCA3C55E1AB3BB2B98B72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Date: Thu, 10 Apr 2025 10:01:59 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, bagasdotme@gmail.com, aaron.ma@canonical.com,
 rdunlap@infradead.org, mpearson-lenovo@squebb.ca
References: <20250106023151.3011329-1-even.xu@intel.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------24b8Z0N6UvFwu8mxMKF8ASTC"
X-ClientProxiedBy: TYCP286CA0343.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::11) To TYCPR01MB8437.jpnprd01.prod.outlook.com
 (2603:1096:400:156::5)
X-Microsoft-Original-Message-ID:
 <ae6c6bdd-acdd-49cb-9d3c-30e15bd7619b@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8437:EE_|OS3PR01MB10058:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cd12115-ea75-40d2-3762-08dd77d3b3be
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|12121999004|5072599009|461199028|19110799003|6092099012|8060799006|15080799006|7092599003|20055399003|440099028|3412199025|26104999006|26115399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkgvTGd6eWFjV2N1NTY1ODBsanNscUpsdkZJSUxaODBCVENvbHJVV3U5UTU2?=
 =?utf-8?B?L01MUnNlUWIzbjRHbjA4bkFnL2hvU3dUNkVrT0ZQNnNhdlFTV1U4dnNRUEtP?=
 =?utf-8?B?RThOZGs0OW1KMkRZU2JJSFFJTnlKNXpVZEpGSWhjMUJKQzZWQWYxZXFLbGJJ?=
 =?utf-8?B?N1J2SW9ER013MmRWenl3TlR3V0wveFZWWE5GdjNRR0ZLUG5MWktGYTNnSmcz?=
 =?utf-8?B?T0hLQk5YZHp4UTF2ZzlGWDhiL1ZCaC9yNHJMSTNic25HdGNIaW8wRHhuQ2Zr?=
 =?utf-8?B?T3N6bE9RWUY2WnpydGV5TWRkcTJJUjhSa09sV3JoV2c1NDZSREFlL054bDI3?=
 =?utf-8?B?Sm5iL0Z3UThGOUJHRk1ONnpkellyejkrS0Vnb0pDb2JJM3duYzh4OUlCem5x?=
 =?utf-8?B?ek5xbFpTM0YyNE1DOWJWQzVkTVZTQ091UTlyeUphMHVKbkhCYUVGZk1WZDJW?=
 =?utf-8?B?OWkxdTFQenMvVHJCQ2ZmR2t5K3JFUzFtOUJCR25rMm9TcWs3SWU0S1dnMUFL?=
 =?utf-8?B?MjB0ZlFWc3dCRGF6Ujk5SDBnVFlPNVJPcEpxUHRVNHBLeHgxeTRNVWdvak5V?=
 =?utf-8?B?Q2l4WnR5R2J1WHY2WUhJaDRLbkE3QTBqbEFFUHNpelIyd3FBbm1XMmxWY3U5?=
 =?utf-8?B?SEtrUTB5b1VjTjU1STBkNExTRm5KRDlmUHVrNnR2UWZUd1JNODdtS3Y2N0I5?=
 =?utf-8?B?L1JrV1h3REZLL0ZPMFJLVmRCaXhoeWFxT0JnYXc3ZWJHL05mRml0QUFLK0xV?=
 =?utf-8?B?UXBXUW5ubXl4MW5DcCswdENQeXVOdVBrcUc0a2JaWXRXYUUrcThYR0RIMnBk?=
 =?utf-8?B?Z2szMkpEQVREMVQyN3pqZUtlZUYybE40SXlVL0xNQ21QODZPNm1BSWx2aUJF?=
 =?utf-8?B?WGhBWTJqdU5LZUhzYU1HSGhYcVo1Rmg3V3VLb2M5UTNCcGdWbzRBNzFOSjZL?=
 =?utf-8?B?Vm9qUkpDQU9QWEhrLzNJMTJYQlkwRlVjSmZoWGlIZFJoRFdBUzZQZHVMeUxY?=
 =?utf-8?B?MWtHdTBOSXR0a3pKODEvK2IyYlo3MzNIWDRGN1l0dXpUN2J2Z1hxdW52cHBL?=
 =?utf-8?B?ZGRyY1NBMk1qenhJSXhDalo0Vnp4OUdDUFB4aUFvc0huZCtJekdrMXlrUTVw?=
 =?utf-8?B?bG5Ia0lQbldaaHNwL2JIekNSczJUV0l2U2s4cWlmSnRWUWVpc3dncVNXekN6?=
 =?utf-8?B?Q0I4bDhVV0o2b3pqWWRYK091RnhBNnFLK3R1d3VuSWtpb1I2dE1zemFTRDdH?=
 =?utf-8?B?WGkvR3FUNW9id1VYZnl2U0xZaHIwUFdkdVBGWjRveUFaVENBbU5nT3lXR2U2?=
 =?utf-8?B?bmF2MVdwaStkN25JckZFYkpqcFhrU0pGN3VrcFduVE9UbVFqL1NjczJuMlhs?=
 =?utf-8?B?dTF2VFo2dm9HajFWNXNSYUxSRVNQb1VDSTRmUjZaTnpWMHpkWExldytLanYw?=
 =?utf-8?B?TW4zQzVJY2k2UElCN1FMcmhxTUdhcjhSN3FOTlhmUlozYUR0N2RpeWVaRkJy?=
 =?utf-8?B?TGo1elovc2tEV0UxVnZzS0R6REtZQTZjUUVKU3FFR3dkYy9aZHFrYlFXMlQy?=
 =?utf-8?B?cDlNRzNKTWp2VXBkaHcyNmpjWFBOWlY1ZTVDbXd3SFh0SzFtL0Fzby9EbGR0?=
 =?utf-8?B?OUpIK2dCcWwvelZiNnFsc2FFbmptaEtvMnExUFFzWVBJZEZ2ZWxSMXB6ZzA4?=
 =?utf-8?B?U0ZYY2Y3MkxCd0gwYjA2Sk1tOTA0OUlSVlp3WlRMT2twcDB5bkpQNmVXQVFR?=
 =?utf-8?Q?YSGYxjIuEggo+Qri+Ajvp5LmfjKNzVCLMt/XLix?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1phcHcrWnYycHNPakwvekxNZmJqWCtUeXB2a2xqbndvaHRibkhXNExTMTZa?=
 =?utf-8?B?c0tKSllqWXFmcFVDNWl2SW5BblpRZ1FtbndWc2F0aDNhVENQWXhHSzRuUXAx?=
 =?utf-8?B?RVFJak8rNEtnZWlOZ29lZkh4TzBNSHBJSkFXcWVmMDMzYXhaeUIxV0x6aE9J?=
 =?utf-8?B?YUl2RHpkeXgzS25mZ2paSUhGYURPL3ZtNEllbGM0NW9ySExNZ3VKYTlJYmc2?=
 =?utf-8?B?ZVAyVk9uK28xemdBSnFMVE00dklzenV3UWYwUjNyN05MUVhEcVU5by9QN3oz?=
 =?utf-8?B?aFJ1RlMzVVJMeXB4aDgrS1VKUjJHYm1kWnhLTm4yUFV0b0tFL3gxN3l4K0JG?=
 =?utf-8?B?WTBEa1NxVUZDZ1F0VWZDVHVYS0FNMmdkdURmSmZ4QTVKYUMyc2tIQ0tQditw?=
 =?utf-8?B?WUhCTnJzd0ZtVWYraC9jN1l5K0FNbmV1VUR3MnYxem9ycCsvcHZyQjFETEV2?=
 =?utf-8?B?OHoxWVQyYVAzUlpQUFgzQ2JWVytmV3kwejRPdEp1RjdSY1dqMFZjNTFJb095?=
 =?utf-8?B?dUo4RDJjVEMwS2VLSTZBclZndGJtWkdBM2ppUm9GaVNnTS9FKytVN3hRUnl4?=
 =?utf-8?B?SGxmMjYwQVlVaVY3aVFYcjhPeVN1c2hZTGFOVGVWbTVoU01UTDN2ZHMybEVX?=
 =?utf-8?B?bG5SaDFPYWVwcTl4WlVFcUlQek41WUxKbFJXQ0l5MDQ0bkVsRC9HYnVIdmlx?=
 =?utf-8?B?ekZnZFhPYjhxWWlycGVUbXRsc2UrTTdLVzVNM1REZ29PNlJDVzF0akd6TEhD?=
 =?utf-8?B?cTJiQjdTL0pqN2RGdXlOYkhzaEttL2g2NWM1WDl3SnUrN2ZsSVVaNVhwZUxO?=
 =?utf-8?B?d2ZTSW5lOEhKZmpqN0hBcWZmMVByYUQyNGlYUFd6eFZPbC9yTm9ZK0MzNjl5?=
 =?utf-8?B?UDlhZzNqSldwUFdwM1JYTEkxbXVUQ1VBSEpzSXNRSXQ0UjVPMitDR2p3Zm5P?=
 =?utf-8?B?OSsyVzc0MkRMREVyUnE5QUZtNXdzNTI3Vjl3dU1pY2dDcXY5R3RBOXFOZ1FK?=
 =?utf-8?B?cGVlL0l5UVhJTWQzWFJHRVFLL0Q3RklZL2U0a1RBTEdoTjFmRzl2eEdHbXEv?=
 =?utf-8?B?ZkExN1Vzb3VvTWRSdFI5bnF0OTR3anU4N2ZwblZ6VUpvbGdVUElIZHJhTlJ5?=
 =?utf-8?B?L29sSUNnL1dxUWlzT0ZnTGROcDhjVWRQMjRXWWRsZzdHWm9Bbm5kY0NTZi9T?=
 =?utf-8?B?TzNIdzB6WDZ1cmRZSnlMalM0WnlkZEk5cjFSWTh4NFFhbTFMbzBWeFJSWUZO?=
 =?utf-8?B?UkxJMVpOMFV0SzRpV0dwU2VDZVRIMVFYT0dEdVNQM3BFeFpoNEhCeGNhYmt3?=
 =?utf-8?B?M2k1WXFRWkI4UTVKVTNhdTlOU296akE3QnRvdm9Fc3M2VDVWUVpGNmJxTU03?=
 =?utf-8?B?Y1l4QmNuUXFhLy8zY3A1R29yWjN2RE12UG8vUW1DS0tjVHJSbkRHN2ljMEFQ?=
 =?utf-8?B?QnhqcE01K3JzMUVOYnJuQ2lzV29ER1hSbWlvVTRDOTh6bDJocHBjZDVlemJ1?=
 =?utf-8?B?Ylh3MmhGK1FDeFdMVS84a0kzMzU4dEkzekFoR08zeVRadHdxWFBOQmJid0lQ?=
 =?utf-8?B?d1J2eWttdnZnVXJYYXZyY25zNVY2TUFnNVgzMC9KTVJIdC9WQ0tNK2x2T3M3?=
 =?utf-8?Q?uY2Tdl2UMNG0RrTzd4/aU0mkqrQ9ZgIP6C3Cku24kQ28=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cd12115-ea75-40d2-3762-08dd77d3b3be
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8437.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 02:02:09.8895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10058

--------------24b8Z0N6UvFwu8mxMKF8ASTC
Content-Type: multipart/mixed; boundary="------------GEXwwmi7YKD8x0pLu79kSb0j";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Even Xu <even.xu@intel.com>, jikos@kernel.org, bentiss@kernel.org,
 corbet@lwn.net, bagasdotme@gmail.com, aaron.ma@canonical.com,
 rdunlap@infradead.org, mpearson-lenovo@squebb.ca
Cc: wiagn233@outlook.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Message-ID: <ae6c6bdd-acdd-49cb-9d3c-30e15bd7619b@outlook.com>
Subject: Re: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
References: <20250106023151.3011329-1-even.xu@intel.com>
In-Reply-To: <20250106023151.3011329-1-even.xu@intel.com>

--------------GEXwwmi7YKD8x0pLu79kSb0j
Content-Type: multipart/mixed; boundary="------------ehDkWczaxeQrZWhOnzZt0w7H"

--------------ehDkWczaxeQrZWhOnzZt0w7H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkNhbiB5b3UgYWxzbyBhZGQgcHJldmlvdXMgdmVyc2lvbiBzdXBwb3J0IGZv
ciB0aGUgVEhDIElQPyBsaW51eC1zdXJmYWNlIA0KZ3V5cyBkaWQgYSBnb29kIGpvYiwgYnV0
IHRoZXkgYXJlIG5vdCBmdWxsLXRpbWUgd29ya2luZyBvbiB0aGlzLCBhbmQgDQptYWlubGlu
aW5nIHRoZWlyIGRvd25zdHJlYW0gZHJpdmVyIHdvdWxkIHRha2UgYSBsb25nIHRpbWUuDQoN
CkJlc3QgcmVnYXJkcywNClNoZW5neXUNCg0K5ZyoIDIwMjUvMS82IDEwOjMxLCBFdmVuIFh1
IOWGmemBkzoNCj4gSW50ZWwgVG91Y2ggSG9zdCBDb250cm9sbGVyIChUSEMpIGlzIGEgbmV3
IGhpZ2ggcGVyZm9ybWFuY2UgaW5wdXQgSVANCj4gd2hpY2ggY2FuIGJlbmVmaXQgSElEIGRl
dmljZSdzIGRhdGEgdHJhbnNhY3Rpb24sIHN1Y2ggYXMgdG91Y2ggc2NyZWVuLA0KPiB0b3Vj
aCBwYWQsIHN0eWx1cy4NCj4gDQo+IFRIQyBJUCBub3cgZXZvbHVhdGVzIHRvIFY0LCBpdCBj
YW4gc3VwcG9ydCAzIGRpZmZlcmVudCBtb2RlczogSVBUUywNCj4gSElEU1BJIGFuZCBISURJ
MkMuIEhlcmUgYXJlIHVwZ3JhZGUgaGlzdG9yeToNCj4gLSBUSEMgdjEsIGZvciBUR0wvTEtG
LCBzdXBwb3J0cyBpbnRlbCBwcml2YXRlIElQVFMgKEludGVsIFByZWNpc2UgVG91Y2gNCj4g
ICAgYW5kIFN0eWx1cykgcHJvdG9jb2wgKCBJUFRTIG1vZGUpDQo+IC0gVEhDIHYyLCBmb3Ig
QURMLCBhZGRzIGluZHVzdHJpYWwgc3RhbmRhcmQgSElEIG92ZXIgU1BJIHByb3RvY29sDQo+
ICAgIHN1cHBvcnQgKEhJRFNQSSBtb2RlKQ0KPiAtIFRIQyB2MywgZm9yIE1UTCwgZW5oYW5j
ZXMgSElEIG92ZXIgU1BJIG1vZGUNCj4gLSBUSEMgdjQsIGZvciBMTkwsIGFkZHMgaW51ZHN0
cmlhbCBzdGFuZGFyZCBISUQgb3ZlciBJMkMgcHJvdG9jb2wNCj4gICAgc3VwcG9ydCAoSElE
STJDIG1vZGUpDQo+IA0KPiBMaW51eCBTdXJmYWNlIGNvbW11bml0eSAoaHR0cHM6Ly9naXRo
dWIuY29tL2xpbnV4LXN1cmZhY2UpIGFscmVhZHkNCj4gaW1wbGVtZW50ZWQgSVBUUyBtb2Rl
LiBUaGVzZSBwYXRjaCBzZXJpZXMgcHJvdmlkZXMgVEhDIEhJRFNQSSBtb2RlIGFuZA0KPiBU
SEMgSElESTJDIG1vZGUgc3VwcG9ydCBvbiBMaW51eC4NCj4gDQo+IFRoZXNlIHBhdGNoIHNl
cmllcyBpbmNsdWRlczoNCj4gMS4gRG9jdW1lbnQgZm9yIFRIQyBoYXJkd2FyZSBhbmQgc29m
dHdhcmUgaW50cm9kdWN0aW9uLg0KPiAyLiBJbnRlbCBUSEMgSGFyZHdhcmUgbGF5ZXIgZHJp
dmVyIHdoaWNoIHByb3ZpZGVzIGNvbnRyb2wgaW50ZXJmYWNlcw0KPiAgICAgZm9yIHByb3Rv
Y29sIGxheWVyLg0KPiAzLiBJbnRlbCBRdWlja1NQSSAoUikgZHJpdmVyIHdvcmtpbmcgYXMg
YSBISURTUEkgZGV2aWNlIGRyaXZlciB3aGljaA0KPiAgICAgaW1wbGVtZW50cyBISUQgb3Zl
ciBTUEkgcHJvdG9jb2wgYW5kIGZsb3cuDQo+IDQuIEludGVsIFF1aWNrSTJDIChSKSBkcml2
ZXIgd29ya2luZyBhcyBhIEhJREkyQyBkZXZpY2UgZHJpdmVyIHdoaWNoDQo+ICAgICBpbXBs
ZW1lbnRzIEhJRCBvdmVyIEkyQyBwcm90b2NvbCBhbmQgZmxvdy4NCj4gDQo+IENoYW5nZSBs
b2dzOg0KPiB2NDoNCj4gLSBNaW5vciBmaXggaW4gZG9jdW1lbnRzDQo+IC0gVHlwbyBmaXhl
cyBpbiBwYXRjaCA2ICYgcGF0Y2ggNyBjb21taXQgZGVzY3JpcHRpb25zDQo+IA0KPiB2MzoN
Cj4gLSBDaGFuZ2UgdGFibGVzIGluIGRvY3VtZW50cyBmcm9tIGxpdGVyYWwgYmxvY2sgdG8g
dGFibGUgZm9ybWF0DQo+IC0gQ2hhbmdlIHN5bWJvbCBuYW1lc3BhY2UgdG8gc3RyaW5nIGxp
dGVyYWwgYWNjb3JkaW5nIHRvIHBhdGNoOg0KPiAgICBjb21taXQgY2RkMzBlYmIxYjlmICgi
bW9kdWxlOiBDb252ZXJ0IHN5bWJvbCBuYW1lc3BhY2UgdG8gc3RyaW5nIGxpdGVyYWwiKQ0K
PiAtIFJlZmluZSBLY29uZmlnIGRlc2NyaXB0aW9uDQo+IC0gRW5oYW5jZSBRdWlja3NwaSBh
bmQgUXVpY2tpMmMgZHJpdmVyIGJ5IGNsZWFyaW5nIFRIQyBoYXJkd2FyZSBpbnRlcm5hbA0K
PiAgICBzdGF0ZSBiZWZvcmUgZG9pbmcgaW5pdGlhbGl6YXRpb24gdG8gYXZvaWQgQklPUyBp
bXBhY3RzLg0KPiAtIEEgZml4IGluIFF1aWNraTJjIGRyaXZlciB3aGVuIGRvZXMgc2V0X3Jl
cG9ydA0KPiANCj4gdjI6DQo+IC0gRml4IGRvY3VtZW50IGZvcm1hdCBpc3N1ZXMNCj4gLSBB
ZGQgVEhDIGRldmljZSBJRHMgZm9yIEludGVsIFBhbnRoZXIgTGFrZSAoUFRMKSBwbGF0Zm9y
bQ0KPiANCj4gRXZlbiBYdSAoMTMpOg0KPiAgICBISUQ6IFRIQzogQWRkIGRvY3VtZW50YXRp
b24NCj4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10aGM6IEFkZCBUSEMgRE1BIGlu
dGVyZmFjZXMNCj4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10aGM6IEFkZCBUSEMg
STJDIGNvbmZpZyBpbnRlcmZhY2VzDQo+ICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwt
cXVpY2tzcGk6IEFkZCBUSEMgUXVpY2tTUEkgZHJpdmVyIGhpZCBsYXllcg0KPiAgICBISUQ6
IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBBZGQgVEhDIFF1aWNrU1BJIEFDUEkg
aW50ZXJmYWNlcw0KPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBB
ZGQgSElEU1BJIHByb3RvY29sIGltcGxlbWVudGF0aW9uDQo+ICAgIEhJRDogaW50ZWwtdGhj
LWhpZDogaW50ZWwtcXVpY2tzcGk6IEFkZCBQTSBpbXBsZW1lbnRhdGlvbg0KPiAgICBISUQ6
IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNraTJjOiBBZGQgVEhDIFF1aWNrSTJDIGRyaXZl
ciBza2VsZXRvbg0KPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNraTJjOiBB
ZGQgVEhDIFF1aWNrSTJDIGRyaXZlciBoaWQgbGF5ZXINCj4gICAgSElEOiBpbnRlbC10aGMt
aGlkOiBpbnRlbC1xdWlja2kyYzogQWRkIFRIQyBRdWlja0kyQyBBQ1BJIGludGVyZmFjZXMN
Cj4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC1xdWlja2kyYzogQWRkIEhJREkyQyBw
cm90b2NvbCBpbXBsZW1lbnRhdGlvbg0KPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVs
LXF1aWNraTJjOiBDb21wbGV0ZSBUSEMgUXVpY2tJMkMgZHJpdmVyDQo+ICAgIEhJRDogaW50
ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tpMmM6IEFkZCBQTSBpbXBsZW1lbnRhdGlvbg0KPiAN
Cj4gWGlucGVuZyBTdW4gKDkpOg0KPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IEFkZCBiYXNp
YyBUSEMgZHJpdmVyIHNrZWxldG9uDQo+ICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwt
dGhjOiBBZGQgVEhDIHJlZ2lzdGVycyBkZWZpbml0aW9uDQo+ICAgIEhJRDogaW50ZWwtdGhj
LWhpZDogaW50ZWwtdGhjOiBBZGQgVEhDIFBJTyBvcGVyYXRpb24gQVBJcw0KPiAgICBISUQ6
IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIEFQSXMgZm9yIGludGVycnVwdA0KPiAg
ICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIFRIQyBMVFIgaW50ZXJmYWNl
cw0KPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIFRIQyBpbnRlcnJ1
cHQgaGFuZGxlcg0KPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIFRI
QyBTUEkgY29uZmlnIGludGVyZmFjZXMNCj4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRl
bC1xdWlja3NwaTogQWRkIFRIQyBRdWlja1NQSSBkcml2ZXIgc2tlbGV0b24NCj4gICAgSElE
OiBpbnRlbC10aGMtaGlkOiBpbnRlbC1xdWlja3NwaTogQ29tcGxldGUgVEhDIFF1aWNrU1BJ
IGRyaXZlcg0KPiANCj4gICBEb2N1bWVudGF0aW9uL2hpZC9pbmRleC5yc3QgICAgICAgICAg
ICAgICAgICAgfCAgICAxICsNCj4gICBEb2N1bWVudGF0aW9uL2hpZC9pbnRlbC10aGMtaGlk
LnJzdCAgICAgICAgICAgfCAgNTY4ICsrKysrKw0KPiAgIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDYgKw0KPiAgIGRyaXZlcnMvaGlkL0tj
b25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKw0KPiAgIGRyaXZlcnMv
aGlkL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDIgKw0KPiAgIGRy
aXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvS2NvbmZpZyAgICAgICAgICAgICB8ICAgNDIgKw0K
PiAgIGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvTWFrZWZpbGUgICAgICAgICAgICB8ICAg
MjIgKw0KPiAgIC4uLi9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYyAgICAgICAgICAg
ICB8ICA5NjYgKysrKysrKysrKw0KPiAgIC4uLi9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1k
ZXYuaCAgICAgICAgICAgICB8ICAxODYgKysNCj4gICAuLi4vaW50ZWwtcXVpY2tpMmMvcXVp
Y2tpMmMtaGlkLmMgICAgICAgICAgICAgfCAgMTY2ICsrDQo+ICAgLi4uL2ludGVsLXF1aWNr
aTJjL3F1aWNraTJjLWhpZC5oICAgICAgICAgICAgIHwgICAxNCArDQo+ICAgLi4uL2ludGVs
LXF1aWNraTJjL3F1aWNraTJjLXByb3RvY29sLmMgICAgICAgIHwgIDIyNCArKysNCj4gICAu
Li4vaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtcHJvdG9jb2wuaCAgICAgICAgfCAgIDIwICsN
Cj4gICAuLi4vaW50ZWwtcXVpY2tzcGkvcGNpLXF1aWNrc3BpLmMgICAgICAgICAgICAgfCAg
OTg3ICsrKysrKysrKysrDQo+ICAgLi4uL2ludGVsLXF1aWNrc3BpL3F1aWNrc3BpLWRldi5o
ICAgICAgICAgICAgIHwgIDE3MiArKw0KPiAgIC4uLi9pbnRlbC1xdWlja3NwaS9xdWlja3Nw
aS1oaWQuYyAgICAgICAgICAgICB8ICAxNjUgKysNCj4gICAuLi4vaW50ZWwtcXVpY2tzcGkv
cXVpY2tzcGktaGlkLmggICAgICAgICAgICAgfCAgIDE0ICsNCj4gICAuLi4vaW50ZWwtcXVp
Y2tzcGkvcXVpY2tzcGktcHJvdG9jb2wuYyAgICAgICAgfCAgNDE0ICsrKysrDQo+ICAgLi4u
L2ludGVsLXF1aWNrc3BpL3F1aWNrc3BpLXByb3RvY29sLmggICAgICAgIHwgICAyNSArDQo+
ICAgLi4uL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuYyAgIHwgMTU3
OCArKysrKysrKysrKysrKysrKw0KPiAgIC4uLi9pbnRlbC10aGMtaGlkL2ludGVsLXRoYy9p
bnRlbC10aGMtZGV2LmggICB8ICAxMTYgKysNCj4gICAuLi4vaW50ZWwtdGhjLWhpZC9pbnRl
bC10aGMvaW50ZWwtdGhjLWRtYS5jICAgfCAgOTY5ICsrKysrKysrKysNCj4gICAuLi4vaW50
ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRtYS5oICAgfCAgMTQ2ICsrDQo+ICAg
Li4uL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1ody5oICAgIHwgIDg4MSAr
KysrKysrKysNCj4gICBpbmNsdWRlL2xpbnV4L2hpZC1vdmVyLWkyYy5oICAgICAgICAgICAg
ICAgICAgfCAgMTE3ICsrDQo+ICAgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1zcGkuaCAgICAg
ICAgICAgICAgICAgIHwgIDE1NSArKw0KPiAgIDI2IGZpbGVzIGNoYW5nZWQsIDc5NTggaW5z
ZXJ0aW9ucygrKQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2hpZC9p
bnRlbC10aGMtaGlkLnJzdA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9p
bnRlbC10aGMtaGlkL0tjb25maWcNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9o
aWQvaW50ZWwtdGhjLWhpZC9NYWtlZmlsZQ0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3BjaS1xdWlja2kyYy5jDQo+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwt
cXVpY2tpMmMvcXVpY2tpMmMtZGV2LmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1oaWQuYw0KPiAg
IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1
aWNraTJjL3F1aWNraTJjLWhpZC5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
aGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtcHJvdG9jb2wuYw0K
PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVs
LXF1aWNraTJjL3F1aWNraTJjLXByb3RvY29sLmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
ZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9wY2ktcXVpY2tzcGku
Yw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2lu
dGVsLXF1aWNrc3BpL3F1aWNrc3BpLWRldi5oDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktaGlkLmMN
Cj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRl
bC1xdWlja3NwaS9xdWlja3NwaS1oaWQuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNrc3BpL3F1aWNrc3BpLXByb3RvY29s
LmMNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9p
bnRlbC1xdWlja3NwaS9xdWlja3NwaS1wcm90b2NvbC5oDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYu
Yw0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2lu
dGVsLXRoYy9pbnRlbC10aGMtZGV2LmgNCj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRtYS5jDQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2lu
dGVsLXRoYy1kbWEuaA0KPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRl
bC10aGMtaGlkL2ludGVsLXRoYy9pbnRlbC10aGMtaHcuaA0KPiAgIGNyZWF0ZSBtb2RlIDEw
MDY0NCBpbmNsdWRlL2xpbnV4L2hpZC1vdmVyLWkyYy5oDQo+ICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGluY2x1ZGUvbGludXgvaGlkLW92ZXItc3BpLmgNCj4gDQoNCg==
--------------ehDkWczaxeQrZWhOnzZt0w7H
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
scUnWnv8sErY943hM8MUsMQ5D0P2
=3DUrys
-----END PGP PUBLIC KEY BLOCK-----

--------------ehDkWczaxeQrZWhOnzZt0w7H--

--------------GEXwwmi7YKD8x0pLu79kSb0j--

--------------24b8Z0N6UvFwu8mxMKF8ASTC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmf3JpgFAwAAAAAACgkQX75KBAfJsRnY
Qg//cJyz4WWqHEQL/x5b7CAIWryFrg6BEXqfDzIvogeEA8/uVlDFWgFU2ATLr3oSFeiWu1zzcLey
UWrH2rxRm0bntNfBMtFbxXsNeLUxxuRhWs+5z4AblbTM9AKASd5LEayxpuwlyqJgqotKqw+/yNP8
7u1zRNF5b1bH/X5RG4NnRs/DTBjljhTqhdNlIerPQqFNhcl/B7AEDrzL//JocDSvJjQdJTRpXvDN
8N49VRCTupubNenQz7MSswWzid0Bbc3uaKZW4ytGKQEnunW4d0AKIWCJnTWm7EdOeIwURJGGkvzQ
fUZktI7/xeIJnoQYIv5JO5mEgKW5Lrxj4TmaZbENBKt8xdXi4izz1IuycSXtFgntbelVcN2K1L4C
CwhC96zGBlZN9dnEGVkcN5UyiVFnPtTXI0lEZFe5XuIHrrJkpJAMf4yVPzQyY5960FPZAnmjQZq+
algBbATgj53zcNBRjxP5noY2CYgR4FSj/58VD7smoBk39cEjBVrcqz6TGU4eNZHXqk22C7kIOmMS
uAO6R6hgLi4170cOQu9k/KVKkF6o7Ocwl6flhpWjTI4BwWZi+mGsZMPiGd/EqEqZOc/VlJNMKizL
C1BwR0ccAOa4wY1/ye4t/Zp4/uSyW/eQRnJY7n1nz5MstwD96v3j5CXWXDUEbiq3Ih0SStxlME+V
rMM=
=JPdV
-----END PGP SIGNATURE-----

--------------24b8Z0N6UvFwu8mxMKF8ASTC--

