Return-Path: <linux-input+bounces-13390-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9FDAFA01E
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 15:01:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 253384A8292
	for <lists+linux-input@lfdr.de>; Sat,  5 Jul 2025 13:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832E212CDBE;
	Sat,  5 Jul 2025 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Ce9KVr15"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010002.outbound.protection.outlook.com [52.103.68.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998E92EB10;
	Sat,  5 Jul 2025 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720510; cv=fail; b=Ka91E9Mtl5AzK08m/MJn44IZ1tWHCqnnf6KMPvaOw1bqA3xxg8q0AgmAWdOGt1zbiJ5sHefnK/6MVzaxI1f7+oecqFcnXBPo4VVyy7u6Y8rIF0Tb5hYK8g5utc5zgvn92qPr5flbhPKPzxua+PhVJYKazAPZ7HJrgHJQgccOCk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720510; c=relaxed/simple;
	bh=P6Tg92qmKTVr0qxAisbZehdMY4IgnAA7re7UIX4pTXk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f/m7Py0uK6h4fB+sPuPfNaU57NoB0dz2TcElamVo7gJ1uFxEb8mwBWvwjDWJf13edTYfB3MHxaMrNVRv89Yw63ENQRlHZNG6PwtG/i4RR62f6tWal6eLfOPKdWgU6gGjwTOYHhzsFTJ+MrU6Bm3ov1pHLDe/0N+a8uh+mxJ5L24=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Ce9KVr15; arc=fail smtp.client-ip=52.103.68.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSFM37/cDTLAPrHayhBwTRlyiX2j4xTnUgwnSf07x79/3tFT07EM4Il5B6scLj3m1NnNdXzFOAuqhx25Pk7R4fgGKwFPoycp7F38gHe0TghMOuT5vtqpU2Ij+tYGdyDtt+5KYG/9YwvUpz9D5pK7+yGASyMUz2rRq8cOfhvKtrBYlYrJ2PrXdvNKgAcP0q5NAN9sK8O5ZBCxfiF0ug/OHZfYoVhmPGi9Ys4peFXCulEWV9NPB9gRF7aFVqikjVcugZDekxlDDKeg7v7PbOsKTodsxuQ/ALdqpLTU3wgFtYdC5u3UrqBVDBPtqR53vwuartgzxv6l5tuP9u3eUOiqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogX5MQyrgMuPk0aL69ChFlUDEKFe2n1AIbIZqKln7jw=;
 b=s969igPQEo0chxFcfXDcBGvrvBPnNYgsy4i0d1xqYFLZk4WA9Ivbk0fgyoAiAx1/0O7cKttaq5RTKN53BP8tIAWxKuL8MReQ/a2GPi3+FGAQhApscyd9s0LKR98UCH5Iz9KmhjbIirPOy20jeubYyywZMicaN5VDbVVB00dnIog8n/VT4h7A/jm8SEdBSTsmuXb4f711tsRCaDy9tSHD4xKExFDYDQvxiaf54W+gvb9FZxVESziljULA7rFAFAPzQE7nMex/Ua0o1dsbQ3r5/WAJzmDccmx2BzvimVOoAXKIxcemjkNI6iqMGBvYT9Bl2B62QNZxjQqPZPN3xuFKIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogX5MQyrgMuPk0aL69ChFlUDEKFe2n1AIbIZqKln7jw=;
 b=Ce9KVr15Znypv+BnQk+/DXTfLV+4NPPmY2UE/+5nc9F57YgETbAW8SsZWaEIpJHFoLi7C6TMdEHXoH0RCQ2JN3x+fsX2K2AHHMwdxm/J5zZ54sYCWreHLosidQzN+eZq+gFCFCcZrwbLkVCFKlfrrEKJfzSaRkWeCKyOgS9Egz/7kLPD/O65xFFGpl+EYW9JnjjxdV2yrgS/d5Ws2GeVIBtO1FQPg5jHB/vtynRl0XWc3wgSVXHLjXwhF6J/JjAWvZ3bZVDh28hYbLLBlo8NNaOQUurae94QzO+NPxf1Ip/eG1QtpRnlGgOR3YLrD5ruFQJNzC5Z5aar/d/KIDtPQQ==
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10c::9)
 by MAYPR01MB10634.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:154::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.31; Sat, 5 Jul
 2025 13:01:41 +0000
Received: from PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa]) by PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::5b05:29d:5646:39aa%4]) with mapi id 15.20.8901.023; Sat, 5 Jul 2025
 13:01:41 +0000
Message-ID:
 <PN0PR01MB958860E66BF04498584BAEA5B84DA@PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM>
Date: Sat, 5 Jul 2025 18:31:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] Initial work for Rust abstraction for HID device
 driver development
To: Rahul Rameshbabu <sergeantsagara@protonmail.com>,
 linux-input@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: Benjamin Tissoires <bentiss@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Brooks <db48x@db48x.net>
References: <20250629045031.92358-2-sergeantsagara@protonmail.com>
Content-Language: en-US
From: Aditya Garg <gargaditya08@live.com>
In-Reply-To: <20250629045031.92358-2-sergeantsagara@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::14) To PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:10c::9)
X-Microsoft-Original-Message-ID:
 <539a769e-5cc6-4e49-bf40-2906b1f76fdc@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB9588:EE_|MAYPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 55890d81-c35b-4dee-de60-08ddbbc415cd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|7092599006|19110799006|15080799009|5072599009|6090799003|461199028|440099028|41105399003|40105399003|39105399003|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGdBU25od2l4dVlVUW1oK3JpaGo5amdLaE01QThmVzl5T1U3OVBIWklQUEND?=
 =?utf-8?B?Y2lMK3RNWjZDVU14NE5JRTJyOHovZmtzditQdXpYY0NEYXVFeWhaU0FsRnRI?=
 =?utf-8?B?dmJTbUhua1I1cHJ6dkhjODlqdlQ4Z1VmbEh2L3IzK3hpQnI3ekN4aEZhdnht?=
 =?utf-8?B?bVJBZmdiQjd2VXQzbUxTdmh2RTJ5Wk1VMjFnNmhWSUE1Ymh1eWR2SjVPS2pt?=
 =?utf-8?B?SnlBbzJhMzVDeEsyVnVwM2ZsclNyQ1NKV1o4OVpUY1p1aElYTVVhcmlLRHA1?=
 =?utf-8?B?aXFJdEhRZlgxUUlqWWJKb2RPcm5LQzl2dW4zamNOSFBVbnVHdERjYnc4ZkxE?=
 =?utf-8?B?SCs3dmdMTTA5ODcwMndtT2Z3RWhscEtWd0Frc29abWlWSGFmYzlibGcraVhC?=
 =?utf-8?B?akhNSEViZXBXZFJKRDkwT2hTd3lFMVpVN1UyRkZIMkNNeDJGSzhoalFjaWpK?=
 =?utf-8?B?VW9nRmxDWVhIeE11Y0paYUc0YWJSV2NlV2J4RlhhOTFlVWFmSCs5TjAzWkVX?=
 =?utf-8?B?TUpSUFltaUVSRndvZEhQWlJvZzdwZVhpMmV6QWY1elMrZmtsQ3FSQU9pTUE2?=
 =?utf-8?B?NXlwMjRYUjA3QTd2QmhseXNPVTJkWGFBbHNtcHd0TUhubjRjVTBpakQ5emNJ?=
 =?utf-8?B?SmR4Y0tRMTF1bG1tNlh4TDBLRFY1S0xJVUE1eDdBYlVLWlEwcy9qdG1od1FV?=
 =?utf-8?B?bmJ3QTZlWVEyYm5xdjNjQUVKM053aGpKdVNCV1V2OVE2MDNjUHhWaFhVQWx0?=
 =?utf-8?B?U3lvU1BBR2tSNEhoOGgvSHpyc25yOTd5bmhDNFZZUTN1Zk5EdlM4OFl6ZFlz?=
 =?utf-8?B?VUc4SzhCN3hKeVR4akV0clBQbndlSEEvRlhxOUhNT2FLQVBhenlaQ1JSczBu?=
 =?utf-8?B?NU16b25xOWpLVE5qWDdtbE41cWwxcnJwVG1oa01RZ3g3bXoza3NzbWlHOHpG?=
 =?utf-8?B?a25KOWRNR1R1Mjd5VWtjcFd3NzQzTFB1OVhXVkNyQ25sV2crczh2a0FoQ2ZC?=
 =?utf-8?B?Ykl5TkNiTnNIZS9CYWI5RzVhUitxRC9GVEFWb1Z1RzEvbnFKS3dvQlUzeEdK?=
 =?utf-8?B?WlVSaVRIYlVTTWJZV3dIVW9ZZVdvelNKdy9haGNFVVpsVWx0amo0NzJHOVRl?=
 =?utf-8?B?T0I3ZFFlTFhBSUNrczVZQXZvUytOZHdzWTlBZW1sbFV2NUN5bXA4WjZ2ei9y?=
 =?utf-8?B?NC81c20xVVRSc2xnZXRuVzdheTYra2ZyWGNvckZ1RHhYSnVCZisyS21ia1JY?=
 =?utf-8?B?Z2VFeGZRcTI4Z0xadFJtaWdmaWlwM0J0bEtNOXVDNmNxT3YrNjBnbTU5aFBJ?=
 =?utf-8?B?UGZiSTFacVVqdWRGbllXRjFQeVFRN1k4d2E2MUhZY1NiclZoUlQ0azl0UlNn?=
 =?utf-8?B?VG9lYlM5M3Q1WklEbmtpdWRPOXMrWlZyUkN2NFhzcVlzZnRBa1h2K1Zmc3Vw?=
 =?utf-8?B?ZWpwM3lqZzlMOFcwbTYvb1Fad3NzclIrc0U1QVVWbmQ5alRIdDBFTjlmM1Ry?=
 =?utf-8?B?MEF4V1NhZ0hwU3ZXMlg5S3pQUEhEeVBKMFVvMkhJU0J6ZnRQc0JsR1Zxbnl3?=
 =?utf-8?B?eExiU0FEdjJQblp3UW9iOFdJMnBVZG9UQ3NsYUQwS093QnQ2cVdOR3BSZ2x0?=
 =?utf-8?Q?OzCszV69Uz4BLQTUsnj3COXIg0HjgiI+dvs0UbEMcaIA=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHhJZUZZN3pvMkpPUHVNVHRhclNrMTVMdTJyNTFEcG9KeGF0UURESmZuWHda?=
 =?utf-8?B?NHcvTXJQK0FPVVZZalRzZVYzRHRwOUlOd2pjMGdXa0o0cm81NTY2MC9URXRW?=
 =?utf-8?B?MTMyNTlXQjNOeWI5U3l5U0JyMTRVdVI2RHhzdjY3MHpjQkxhckV6NW01d2ZP?=
 =?utf-8?B?TzNuNVZ5dTgvY1NmSXlzb3IyOEszQy8rd011SS90enAvZGlFQm5IWmhydWRO?=
 =?utf-8?B?RktWWU1mQmFwbXNKbTloc2RhbTJaWEthUHZxMmhXZWVMWmFBRmYwcGpUYnNt?=
 =?utf-8?B?NXdWbmtYQ2RpWTlLbFgvQ0xZem1OcjBSdUZ3Q3hncTl2L1hWV211bllDbE9J?=
 =?utf-8?B?VVc5Y2VjQ1NldXVFT09kMnBhOGR0RU41RHRXc0wrZ2RJM0h3cmlTYm5mYXNU?=
 =?utf-8?B?aGZtWUVRam9qRmxMU1ZqV3lUWmRwWWJaNTQ0VVZkcDlaZVJxeG5FSlROVGty?=
 =?utf-8?B?YWsxL1IrbThlek11VUczKzhHYVpLdXJ6dGM4Rzltem9JRUNBSllJSG54STEx?=
 =?utf-8?B?cnNUQ2VqNjY0c20yUi8wM2VvZmhHTUpKOEllS1JCOUMrMzBtRmtuRnJCdExB?=
 =?utf-8?B?bTdVUUhVeGd5MUtQS0RYRC9SU0M2UlV3VjlkOGlmbE9SUTRFNnI3YVp3SHlB?=
 =?utf-8?B?VjljYVh3ZVFjTkFiRTI1eWJIZ3krODNReGxFOUdoSWFTZFZOU29KODZ1eVpi?=
 =?utf-8?B?eXZ2MHpCWUxoOEFFUzBDVHBmZ2tCd2hycjNJVVRWUmtSZk01OGk5V0JVcktF?=
 =?utf-8?B?d2VkRWFpbDErM0pObitFZ2hub1BwZ1ByTVIwNC9vNUhKdlhqM3FlYlQ1cHVS?=
 =?utf-8?B?UVB0NHhXaHVrcHppdmlHSUhOZ09BWUhBdjllU1hUd3BkbG9CaEErZHhOOGNn?=
 =?utf-8?B?SFUxRTlTeUtyQjJ0dzdzVTVPaEhmSi9IZHppRHVBSGh2dmJwK3FTNC85SG5h?=
 =?utf-8?B?M0ppOXZDMHBad05pN3pZMGtjbEhmYzZHN2I4YWZ4NUY3aURmZ3RyQ1NsVkFz?=
 =?utf-8?B?K1ZDN0k1ZmU2dXBBQ1ZoNVlqdVIwT2E3ZVgzbTVka2NqN2dxaDRnblRmWTZl?=
 =?utf-8?B?SlAwSFZxSkh6NktNZzBNTkpTaEdMZFM1RlBvdUtGZDhldG9WdzBSVkFvTHV5?=
 =?utf-8?B?OW9tclY0R2NNZFFQL09RK1JUWTlpTXczaHpIMGZBTnVLZFpvNEp5TnVxY0pK?=
 =?utf-8?B?UnhTSForRHI5eG5BamFXWkFteFl6d3gxL2Rlei9iWDF1enQ4bzh0MDRIZG51?=
 =?utf-8?B?K3d3VjZ5U0JLZ2J3SS9KTnp2ejE4cHRNY1lRRW9vVGdObERpODNtOVhybzZ4?=
 =?utf-8?B?S2pKYmlCNXJkeVRRZXVKalA1V2FFZDhMZjFNR0ltK0ZGcXBsRVdpOWdWOXNB?=
 =?utf-8?B?NDZwbkR6dkNyVnRiMHNBeGNJWVZNWU0vZnp3S3FxTVFYeEpPdldRcURHaStm?=
 =?utf-8?B?S1RYREc1QlF6NlBXQ1dmV0VzVzUvbEk1S0J0NEJjTFdlcnZSd3N6TExqdE5C?=
 =?utf-8?B?MThXQTdIbVdVQUVuZ0h2am9DVWt0Z2IvT3l2UzJXVTdhejBNb1k0K1hBSzBH?=
 =?utf-8?B?NUxZMUZNbW9FQ3JNNjZtWEJhWGZPUmJodGhibFB5cDJZaFVDT0pDNytQZjFm?=
 =?utf-8?B?VXdRdHRiWE9OaXVsamdicThLTnRFRVVNMWh2VCtpYXFNZ0s4OUlWSUFZU05E?=
 =?utf-8?B?b0c0VDU3aStjMjhvRTZqTXVZM0N2SzhFWDRUUi9kaUlmUXRScWJNc3FQSVY1?=
 =?utf-8?Q?xOq+lKK0E4/IXLRgjJ1KAFQkBkcT3aaH7qiu5TW?=
X-OriginatorOrg: sct-15-20-8813-0-msonline-outlook-f2c18.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 55890d81-c35b-4dee-de60-08ddbbc415cd
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9588.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 13:01:41.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10634



On 29/06/25 10:21 am, Rahul Rameshbabu wrote:
> Hello again,
> 
> I have come back with a revision of my HID binding work based on feedback from
> the maintainers and the community. Going with Benjamin Tissoires's feedback, I
> have opted to implement support for a much simpler HID device as a starting
> point for this work. I have gone ahead with making a Rust reference driver for
> the Glorious PC Gaming Race Model O and O- mice. I chose these devices because
> they were easily accessible for my development work. I have gone ahead with
> naming this driver the "Glorious Rust" driver. My binding work now adopts the
> core infrastructure Danilo Krummrich has provided for the Rust for Linux
> community.
> 
> I have decided to move this series out of RFC status, since I feel the
> implemented code is in a stable state. It could be used for other drivers as-is
> with the caveat that those drivers are only performing report fixups. Hopefully,
> a HID-BPF solution can be taken for production report fixup purposes. In
> reality, I will need to bring more of the HID subsystem functionality to Rust to
> promote implementations of more complex drivers, such as the USB Monitor Control
> driver I am planning to implement (as expressed in my RFC series). I am hoping
> to do a better job of documenting my progress involving this work on my blog
> while I am working on each iteration/addition for anyone interested in following
> along outside my mailing list posts.

Interesting. Reminds me of the days trying to rewrite hid-apple in rust, but found
no rust bindings.


