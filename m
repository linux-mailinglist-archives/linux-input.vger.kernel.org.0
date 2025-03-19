Return-Path: <linux-input+bounces-10976-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AD0A69424
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 16:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CA963BDE10
	for <lists+linux-input@lfdr.de>; Wed, 19 Mar 2025 15:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2102B14D70E;
	Wed, 19 Mar 2025 15:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Yf7TAo9k"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazolkn19012063.outbound.protection.outlook.com [52.103.33.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F939195811
	for <linux-input@vger.kernel.org>; Wed, 19 Mar 2025 15:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.33.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399369; cv=fail; b=iMtHRU3u/6GBt/mKy4gQna+Oex5Q2yR4hdBC5cyGDfAE+uSUr64lZl6fWFbwPPdxxugbXY1HWTBj3GpnvPDm/XRyemMM0kFaMGdB/blbf9Oaa0iH0ABqpBlSgoG038Dzotp2gmb4WHMN3mmf6AmL4CQvmzLGV2jnldMOE0Yv1bM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399369; c=relaxed/simple;
	bh=TkiTcEwAVRnUQhJVz0Y7t5OZdESvZSyvcd+2fnoJOss=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=N9HnGnrKQB9uMzfHRvfyqvWQ90AR/7DE+KxhASp7/CT9EeOGyzFhgir2Ap3WsGOjfJIlf3txs7k9kbpaFJOflESAhzTTDbm7yGZZz2z+4m9stvpXPANil1DptpbqzPYimdhOuVKsVUnVwUnJEhMlixGCNfpmpnFU7qEa+24GQ5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Yf7TAo9k; arc=fail smtp.client-ip=52.103.33.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qi0vCoXlDvO/YUDLdukT6NAKwveqtVvq4pfpsAnurci3lEg+j2nfG431+NcJ0U3n/6sMZKluBHlyRNKu4MP6Pvv38IqL7x8B3RONmU4sD+u2NcAkCJsYF7lXi/Xjq7qffnhUioDtcb9cINHkV6ZKY+M66XW++btbLyQB6mOlXzELIWWnZff0dMVS9+zfEEtp8CbjLxk0Yvso57i5nbl4UCpheoOcGaGC5QXLQWYxkxmMKmGp332/Ry0OKmNC+iUqDLkUMLgAKzgF92U11n89cqzxwEXjSXEu0Sm2CGMHxcb4QwrUjpcj0bWmWUEGvbpBaTUXtVJUrywJQOeSQ3ItoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeKMM2/n8yIPAyfBSp9DAgX5u99PrmTog/sZPy0acyk=;
 b=yBEgpu0i/zXsxOJSAKem6dFaqme+h9f0CSYw+7Ijyj2dze6T+zVpiacLV8scdYFq708RY49WgHFooW7ApdnVKDZJMEHQgmcD/Bhr9XgJKbOHA7Y37jqZU3XJfTJnqgERekaYTr1oTsRJRacIUVDMB9tKp3aW1CHJFLZt1/TB/mpcSb9MucyPIFwv7Ogte44CrR/aTs3FvtTRt2UJAPdJDOeTSM1DEHzioI/d42qnbrBBNK+I4g+8uCxyHBXJ6sDImbWiA2JlPeh/6h8R5VwXBPOBBiYY5AhIVklMnRC7KONRll2ptUzPtYSxI6TpgbPgyy0eUgUHiy2ysfJIG/x4Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeKMM2/n8yIPAyfBSp9DAgX5u99PrmTog/sZPy0acyk=;
 b=Yf7TAo9kH1fq8os+YN4eHvOFJCM8MmJ0yHYnMGYL75OAhFo12FySluOYzlz69ATP9ZEIRRzokfoqryE9fN5rrAVBqwrBHsROBtCHKR1fOP1ozM9DMbwJVFA+sK+el8XXjY1fKZIDms1WOeIWCDYwo/BEXiWlqHj+OexgUJynrOxKrQS/Fj/NtBOaqqWrkeHD0/FG3a3qp7A+up6ZMTK/kBRetjc0PTkru6bm57O+RYnJKodPiQiXygBzIDQFPWbdgXDU5oV4windK5DniaKskqQa7tgzsaKm1xmD9WuWrq0YPb71tBObbSRMpY3ZmeV/P1eAeKCkDWuabmz3Foeetg==
Received: from AM9PR03MB7712.eurprd03.prod.outlook.com (2603:10a6:20b:3dd::22)
 by PAVPR03MB9408.eurprd03.prod.outlook.com (2603:10a6:102:307::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 15:49:24 +0000
Received: from AM9PR03MB7712.eurprd03.prod.outlook.com
 ([fe80::6d9e:5b89:dc2d:f84e]) by AM9PR03MB7712.eurprd03.prod.outlook.com
 ([fe80::6d9e:5b89:dc2d:f84e%5]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 15:49:23 +0000
Content-Type: multipart/mixed; boundary="------------RmX121KJcWXcqzil0E3foKFm"
Message-ID:
 <AM9PR03MB7712EBF7F099701871650F54EDD92@AM9PR03MB7712.eurprd03.prod.outlook.com>
Date: Wed, 19 Mar 2025 15:49:22 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: Goodix Drive issue
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input <linux-input@vger.kernel.org>
References: <AM9PR03MB7712D6F6F359E3147B35B415EDDF2@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <a458616b-3f3d-4f1d-9339-3ebdab6a2fdc@redhat.com>
 <AM9PR03MB7712B2C65E49480D9205B40EEDDE2@AM9PR03MB7712.eurprd03.prod.outlook.com>
 <59f9c9cc-f839-40ae-8853-67dd00571c85@redhat.com>
Content-Language: en-US
From: Henry Isaac <henry_isaac@live.com>
In-Reply-To: <59f9c9cc-f839-40ae-8853-67dd00571c85@redhat.com>
X-ClientProxiedBy: LO4P123CA0378.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::23) To AM9PR03MB7712.eurprd03.prod.outlook.com
 (2603:10a6:20b:3dd::22)
X-Microsoft-Original-Message-ID:
 <b95aea60-2a34-4cf1-9be3-cb0fa2b686c2@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR03MB7712:EE_|PAVPR03MB9408:EE_
X-MS-Office365-Filtering-Correlation-Id: c45aea18-3cbf-474f-6f0e-08dd66fd9eca
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|6092099012|461199028|15080799006|8060799006|7092599003|12121999004|19110799003|5072599009|3412199025|440099028|13095399003|30101999003|41001999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?M2lBU3B6aytXUWVxOXJaelF5TkR5akNSaWE0QTZlYjU5Z1VtS0NzaWU0TUw3?=
 =?utf-8?B?OXE2cHNqdkg1S0E3SW5xOFlYa0xUek5kRkt5bUI0b2hsVVhFbHZ6Rlh3WGpG?=
 =?utf-8?B?Ky8xOEw4dzRIRkhKMmIzcFFmcE9aK3RUTXVPelE5cGdXa1c1Zm5MR09EY2w5?=
 =?utf-8?B?VFR0Rk5neVlqcFRiVlJyWmJxOE1qVS9HdTBSajhtaEtKN045SjZSRDhoZXpB?=
 =?utf-8?B?SmxtOWZDN1RySXdUVEkwTlorTHdJUHBOd2lucmN4cmE1TzUzMWtCMW9PZ1p3?=
 =?utf-8?B?ZjZFMUJGL0pCbkdzOG51NDB0allmQUUweHZMNUk3TWtCaFBXS0o3VndQUjhx?=
 =?utf-8?B?VkxqZlhvZmZla2h4bFZOQVk0c043UW5oczlJQzNuNC9DeTJaeFY4c1RMWWtY?=
 =?utf-8?B?cVQ4dkN6WGlSZDRqaVdQSytqY05lKzgvdWN2b3lwc2o5ZktRVjNQVFFTM1cw?=
 =?utf-8?B?ODJxZEJmc2JCR1QrUzdmVTE2TDZvN0JyVDhGaERPQlJkenY2QnpaWWl1WmZM?=
 =?utf-8?B?RHVSQWRlbE1RcmlOVVNqZTkzb1dZUkcwdnZiMVdKZUdjUmg2QlFDRTB5VnRF?=
 =?utf-8?B?bGxMS1FZbk01VllkY3FHTjJmWmNTWjRiUkJzV3BqVkZBSkwvRXJqQ3cybGpa?=
 =?utf-8?B?dituUHRXZnFCeGhGNjFsVU1aOVY3d2RuOW9YR2htaG0rV0JLeEErTjgwWmly?=
 =?utf-8?B?MWRicG9jZEJaaDZESng1dGhyN3grVjJyTGliM010RTBjSWZwOERqTiszV281?=
 =?utf-8?B?M3FNK2k0aWJLTTJ3SHFpRUFodnhVN0h4dFdmM013YSt4UEF0TExJNVRKTUdp?=
 =?utf-8?B?d05UN0MwU0l6Z2FFRVJ5T1VWL3FSdHdiZUxOT1E0a0NmYzFBb3NaMngzTFFi?=
 =?utf-8?B?QmIwSkQxQzNMcEtSRUxkaG1LK2E4REpzYXZiaUNicituaCtmMHNKaUwvMk4x?=
 =?utf-8?B?VitKbHpTMENzeXU3VjR4a3NMenlVMjRTeVZyTHdiMDZHbnZ6d0hTdEl0NXhB?=
 =?utf-8?B?dndCQkJlL2t1eURiK2ZWb29rM0JjbXo2WWtQbmdQQkNYSHlrVFlvUkF0NDNZ?=
 =?utf-8?B?NmdEZU5XRzlwOHZPTWdac2NNZjlXUktHeERsRGF5bis4TGNudk1yczBKcVJE?=
 =?utf-8?B?WEpTRkxqUVdPSVVmNkIzZTVkS1M3STg3aHBBbWpiNDlhTDBZdzFWWVZHM0JX?=
 =?utf-8?B?UW9ib0diN1ZROUxRUHhWSlU5WXVYZ2dZZ1VYWGJIc1ptZ2p2L0hMRUZwbFAx?=
 =?utf-8?B?MEQ3dEFwb1FiTEZ3UDdrRTU0eXNUdUtJenZTQWh4d0k3dkJkREVyVTA5TmNN?=
 =?utf-8?B?L0djS3pGMkF2Vml2cGFzL0NreGdFbEZ0TGUzYkFPWnF4MlVLTEdWL2VFbDhW?=
 =?utf-8?B?cG0yaTVFeUF1ZlRETWoxTjVDNjNnY1gxSEh0U0V4UHdabW9SWExjNTVCMDhv?=
 =?utf-8?B?U1FJbVZ0STJDb3FkWEovRjFvUFJzYzZhNHlic2RWRC9WTHh2V0RtQ3pWZEJV?=
 =?utf-8?B?M0lkam1aek5rRW1QNEtsSVEzSGNjbytYbjd3dUVhckxvUUFXRkZuLzk4N1F1?=
 =?utf-8?B?K3dZVHVyeVJwK3NLcUc5LzZIQjlUQ0dBdXhUMlEzbGZlZXNVdEU2dlVSOE1k?=
 =?utf-8?B?bmlyd1UvYUtQZmZvLzB5NGdpVW1ZMUNtYmM4QVgwT2FkU1ZPc1gvRUNIZ204?=
 =?utf-8?B?TitaYzNWTGtrcm5pSjFVWmhMWFJyb0gvZGlQSXhGcTFCUEJMR2M1cjlnPT0=?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ek9rSDNYa3gwM29QL1drVi95RHpqKzdSWG9kVFliYkZFMjNkdXpLaDIwc1c0?=
 =?utf-8?B?bk9Ta1hwMjdNWE5yOHdpWlVEcUw5eVJ5OTZRVkN2S2RtVXBGUnJLYUs1V1pD?=
 =?utf-8?B?VDh6bjJpYWpOR0daYXEzdnRBVUE4d0dCRkRmRlpoTHVKNzlqU2xZbXp2eHlN?=
 =?utf-8?B?VUx0Y1hVRlN2SFQvQzA1Qlc1N1RFQ3dIN0FlOEVCNklJcTVvWUlsU1Y0ZTJ4?=
 =?utf-8?B?ZkRSRjFmQ3NXOXY1dzQwYXNBYUMyZnc5aHF5Q0UrbldsdE5TRDVtdCt1Z1RP?=
 =?utf-8?B?TS9uSUdCZFF3cmN4YWR3eWsrN0J3cXBzRUxQTnVvOEtaTVB4M3Qvdy9KZGt3?=
 =?utf-8?B?THdCSWFvSHQ0TExGTk8rYUJ6ckNOTjRDOEY1R1lXMGFTVk93Mm1EVHlPSEZV?=
 =?utf-8?B?ZHJLdWQ1Q1UwbFRQeWdRay80NHdpT3hCVUQ0RFN2TzhoZ3hScUF1ZzMzVDVi?=
 =?utf-8?B?bUtZUTlPTjRTaXRzVnBKSVJoQ1o5azV0VS90bVZtYTB2Sm5pOTFqKzE3RFdR?=
 =?utf-8?B?WU0yMlBSeEF6L0tWRWFKcWE4dlRTQmpEMlE2cjdXcVVTdkZJbk1DQXNJWlU1?=
 =?utf-8?B?UThWa2RlU2t3VlNQdUE0dlMrVDhmejdBaS94ZnFTdGlnUGl6c3crU2JUVmdC?=
 =?utf-8?B?ZCs2Qk42N1R6U0xEUDlBdGg3Ti9mbitQb3NDSjFRbWlOV2NsZmJVN0dOalJJ?=
 =?utf-8?B?cDlKbGM0bEJaOFozenV1eVJsS041S3FYckZEV3Vma0JTVUE3eHNwbVJjMk5s?=
 =?utf-8?B?Rjl2U2NPb3VqTEcyZHh1a1B5c2Ivci9lOEEyOEZWaXhYdjdrUEMrQ01SYmZn?=
 =?utf-8?B?aUpKY2h1TlFuclRuWEN1SHZ5RCtUQlIrTFJEanpPMHFqMTZUSzZPUFJSY2pU?=
 =?utf-8?B?enh6cFNFV3VqS3dhbjFLNngwdEFDV3lsSFdEODNycHZ4L2JqV0xkS2RDd25i?=
 =?utf-8?B?T0p2WkxkQ3B3MHpoMWgxUTF5RTdXbmtWMFFhdEtyeUJwcFhRRGNwbzRqUTVl?=
 =?utf-8?B?ZlYzZFl6Tk1CTTRRM1h0RElkd3VHRGQ4ZXNNSUF6YWh0aUhWd3BSRTF3bldk?=
 =?utf-8?B?Z1BZMHh4M2hnd3Q5dmpnRTZBZ0Nka2pvaU5QSEJIVTFvczBZTndGZ25CNkNy?=
 =?utf-8?B?NU4zbGhScEFzOFJtejArZkwwNzhxdk9wMkd4eVVpcTBiR3NsK1NkM0JTclAx?=
 =?utf-8?B?MWxsK0lhVlRzbTllN055VGJEZmNHalcwMVNVUVRSYzBmUUxLcGd0aU9PWDAz?=
 =?utf-8?B?TndzWlptbGI2MVRjamVyOEc4WXhrUjJIRzlvYlJ6eldYNHJORjRRR01aVjQr?=
 =?utf-8?B?ZU1YKzNTK3NHVmRxQVVkZDB5ZjVsd1kwWFBGb2lFQkJVblZUS2piREg2WE01?=
 =?utf-8?B?UkhRVmFxTXArSmRYRVRqYmhXZ0ZiRXZnUUZ1M1d1VDNwVnArVGFkcjBRd1hx?=
 =?utf-8?B?NDdubU9NandFNFdtb2FoelBrVXI2OVpkUiszSlhjalpCQ2luTHBHZmV0cWxQ?=
 =?utf-8?B?eFAyd2U0Q3A1bExmTW5LVFB3SnExWkdzSEhSTzJ2LzB6U2VydEFQMVNLN0tx?=
 =?utf-8?B?SVBvYVU5UkllWmFkcEhGL3FWY3B4Zm1kamJtTnc4OUFvdm5KSjIxVUJXTTJZ?=
 =?utf-8?Q?1ax8UdKoJwfmznA3Q8RscyBwpaSFFgQKZ2jiDUo/ddU8=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-76d7b.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c45aea18-3cbf-474f-6f0e-08dd66fd9eca
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB7712.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 15:49:23.7130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9408

--------------RmX121KJcWXcqzil0E3foKFm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Sorry about that, I'll be sure to select reply all next time.

For some reason I am still getting nothing on the sudo i2cdetect unless 
I am doing something wrong, I have attached the command line results as 
a .txt

I will add, I am unsure if this makes a difference but the touchscreen 
supports, and the tablet comes with a battery powered stylus, I am 
unsure if this feature of the touchscreen could cause any issues?

Thanks,

Henry

On 19/03/2025 13:25, Hans de Goede wrote:
> Hi Henry,
>
> Note I've added linux-input@vger.kernel.org back to the Cc,
> please use reply-to-all to keep it in the Cc.
>
> On 18-Mar-25 11:26 PM, Henry Isaac wrote:
>> Hello Hans
>>
>> Sorry for the delay, had an issue with Endevour so I reinstalled but this time just used the normal Arch ISO (Sorry if his complicates things) I followed all the steps again and the new ones to be safe.
>>
>> At the i2c_hid part of the file it just says address unavailable, I hope this helps!
> Since the new dmesg was not send to the list, here are the 2 relevant
> new messages after enabling i2c_hid.dyndbg:
>
> [    5.553115] drivers/hid/i2c-hid/i2c-hid-core.c: HID probe called for i2c 0x5d
> [    5.553819] i2c_hid_acpi i2c-GXTP7386:00: nothing at this address: -121
>
> Henry, this means that either the touchscreen is not at that address,
> or it is but it is not powered on.
>
> The ACPI tables describe 5 possible touchscreens, there is
> a possibility that somehow the wrong one is selected by the BIOS.
>
> First lets try to see if there is a touchscreen at a different
> i2c-address.
>
> All ACPI touchscreen descriptions use the same i2c controller,
> so first of all lets find out which i2c-bus Linux has assigned
> to that controller, please run:
>
> ls -l /sys/bus/i2c/devices/i2c-GXTP7386:00
>
> Here is the output of that run on the touchscreen of a laptop:
>
> lrwxrwxrwx. 1 root root 0 Mar 19 11:24 /sys/bus/i2c/devices/i2c-ELAN901C:00 -> ../../../devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-1/i2c-ELAN901C:00
>
> notice the "/i2c-1/" in the output, this indicates that the touchscreen
> on that laptop is on bus 1. Now install i2c-tools (not sure what
> the Arch pkg name is) and run e.g.:
>
> sudo modprobe i2c_dev
> sudo i2cdetect -y -r 1
>
> replacing "1" with the bus-number you found.
>
> Here is example output from the same laptop:
>
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00:                         -- -- -- -- -- -- -- --
> 10: 10 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- --
>
> This shows a single device on this bus at address 0x10.
>
> Maybe you will see a device here at address 0x10, 0x14,
> 0x38, 0x40 or 0x5d .
>
> If you see a device at one of these addresses please
> copy and paste the output in your next email and
> then we will see from there.
>
> OTOH if you don't see a device at any of these addresses
> lets try to see if we can power the touchscreen up by setting
> its GPIO. According to the ACPI info GPIO-controller
> GPO0 pin 0x3a (pin 58) is used for the touchscreen enable.
>
> First lets make sure that gpiochip0 matches GPO0,
> install libgpiod-utils (Fedora pkg name) and run:
>
> sudo gpiodetect
>
> On your geminilake tablet I expect that to output
> something like this:
>
> gpiochip0 [INT3453:00] (80 lines)
> gpiochip1 [INT3453:01] (80 lines)
> gpiochip2 [INT3453:02] (20 lines)
> gpiochip3 [INT3453:03] (35 lines)
>
> The important thing here is that gpiochip0 is INT3453:00,
> that may be different if there is some other GPIO chip
> which got registered earlier.
>
> Assuming that gpiochip0 is INT3453:00 lets try to turn
> the touchpad on:
>
> sudo gpioset -c gpiochip0 58=1
>
> (and then press Ctrl+C because gpioset keeps running
> to hold ownership over the GPIO)
>
> and then re-run the i2cdetect:
>
> sudo i2cdetect -y -r 1
>
> again replacing "1" with the bus-number you found.
>
> Hopefully a device will show up now, if it does
> please copy and paste the output in your next email.
>
> If there still is no device, then maybe the enable signal
> is inverted, try running:
>
> sudo gpioset -c gpiochip0 58=0
> (and then press Ctrl+C again)
>
> and re-run the i2cdetect:
>
> sudo i2cdetect -y -r 1
>
> Note if you do get a device found after running gpioset,
> please also let me know if you got the device to show
> up with 58=1 or with 58=0
>
> Regards,
>
> Hans
>
>
--------------RmX121KJcWXcqzil0E3foKFm
Content-Type: text/plain; charset=UTF-8; name="cmd i2c.txt"
Content-Disposition: attachment; filename="cmd i2c.txt"
Content-Transfer-Encoding: base64

W2hlbnJ5QGFyY2hsaW51eCB+XSQgbHMgLWwgL3N5cy9idXMvaTJjL2RldmljZXMvaTJjLUdYVFA3
Mzg2OjAwCmxyd3hyd3hyd3ggMSByb290IHJvb3QgMCBNYXIgMTkgMTU6MjYgL3N5cy9idXMvaTJj
L2RldmljZXMvaTJjLUdYVFA3Mzg2OjAwIC0+IC4uLy4uLy4uL2RldmljZXMvcGNpMDAwMDowMC8w
MDAwOjAwOjE3LjAvaTJjX2Rlc2lnbndhcmUuNC9pMmMtOS9pMmMtR1hUUDczODY6MDAKW2hlbnJ5
QGFyY2hsaW51eCB+XSQgc3VkbyBtb2Rwcm9iZSBpMmNfZGV2CltoZW5yeUBhcmNobGludXggfl0k
IHN1ZG8gaTJjZGV0ZWN0IC15IC1yIDkKICAgICAwICAxICAyICAzICA0ICA1ICA2ICA3ICA4ICA5
ICBhICBiICBjICBkICBlICBmCjAwOiAgICAgICAgICAgICAgICAgICAgICAgICAtLSAtLSAtLSAt
LSAtLSAtLSAtLSAtLSAKMTA6IC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0t
IC0tIC0tIC0tIAoyMDogLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0g
LS0gLS0gCjMwOiAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAt
LSAKNDA6IC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIAo1
MDogLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gCjYwOiAt
LSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAKNzA6IC0tIC0t
IC0tIC0tIC0tIC0tIC0tIC0tICAgICAgICAgICAgICAgICAgICAgICAgIApbaGVucnlAYXJjaGxp
bnV4IH5dJCB5YXkgLVMgbGliZ3Bpb2QtdXRpbHMKIC0+IE5vIEFVUiBwYWNrYWdlIGZvdW5kIGZv
ciBsaWJncGlvZC11dGlscwogdGhlcmUgaXMgbm90aGluZyB0byBkbwpbaGVucnlAYXJjaGxpbnV4
IH5dJCB5YXkgLVMgbGliZ3Bpb2QtdXRpbHMKIC0+IE5vIEFVUiBwYWNrYWdlIGZvdW5kIGZvciBs
aWJncGlvZC11dGlscwogdGhlcmUgaXMgbm90aGluZyB0byBkbwpbaGVucnlAYXJjaGxpbnV4IH5d
JCB5YXkgLVMgbGliZ3Bpb2QKU3luYyBFeHBsaWNpdCAoMSk6IGxpYmdwaW9kLTIuMS4yLTIKcmVz
b2x2aW5nIGRlcGVuZGVuY2llcy4uLgpsb29raW5nIGZvciBjb25mbGljdGluZyBwYWNrYWdlcy4u
LgoKUGFja2FnZXMgKDEpIGxpYmdwaW9kLTIuMS4yLTIKClRvdGFsIERvd25sb2FkIFNpemU6ICAg
MC4xMyBNaUIKVG90YWwgSW5zdGFsbGVkIFNpemU6ICAwLjU1IE1pQgoKOjogUHJvY2VlZCB3aXRo
IGluc3RhbGxhdGlvbj8gW1kvbl0geQo6OiBSZXRyaWV2aW5nIHBhY2thZ2VzLi4uCiBsaWJncGlv
ZC0yLjEuMi0yLXg4Nl82NCAgICAgICAgICAgICAgIDEzNy4wIEtpQiAgIDkyNiBLaUIvcyAwMDow
MCBbIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAxMDAlCigxLzEpIGNoZWNr
aW5nIGtleXMgaW4ga2V5cmluZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBb
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAxMDAlCigxLzEpIGNoZWNraW5n
IHBhY2thZ2UgaW50ZWdyaXR5ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAxMDAlCigxLzEpIGxvYWRpbmcgcGFj
a2FnZSBmaWxlcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAxMDAlCigxLzEpIGNoZWNraW5nIGZvciBm
aWxlIGNvbmZsaWN0cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAxMDAlCigxLzEpIGNoZWNraW5nIGF2YWlsYWJs
ZSBkaXNrIHNwYWNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBbIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAxMDAlCjo6IFByb2Nlc3NpbmcgcGFja2FnZSBjaGFu
Z2VzLi4uCigxLzEpIGluc3RhbGxpbmcgbGliZ3Bpb2QgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBbIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjXSAx
MDAlCjo6IFJ1bm5pbmcgcG9zdC10cmFuc2FjdGlvbiBob29rcy4uLgooMS8xKSBBcm1pbmcgQ29u
ZGl0aW9uTmVlZHNVcGRhdGUuLi4KW2hlbnJ5QGFyY2hsaW51eCB+XSQgc3VkbyBncGlvZGV0ZWN0
CmdwaW9jaGlwMCBbSU5UMzQ1MzowMF0gKDgwIGxpbmVzKQpncGlvY2hpcDEgW0lOVDM0NTM6MDFd
ICg4MCBsaW5lcykKZ3Bpb2NoaXAyIFtJTlQzNDUzOjAyXSAoMjAgbGluZXMpCmdwaW9jaGlwMyBb
SU5UMzQ1MzowM10gKDM1IGxpbmVzKQpbaGVucnlAYXJjaGxpbnV4IH5dJCBzdWRvIGdwaW9zZXQg
LWMgZ3Bpb2NoaXAwIDU4PTEKXkMKW2hlbnJ5QGFyY2hsaW51eCB+XSQgc3VkbyBpMmNkZXRlY3Qg
LXkgLXIgOQogICAgIDAgIDEgIDIgIDMgIDQgIDUgIDYgIDcgIDggIDkgIGEgIGIgIGMgIGQgIGUg
IGYKMDA6ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIAox
MDogLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gCjIwOiAt
LSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAKMzA6IC0tIC0t
IC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIAo0MDogLS0gLS0gLS0g
LS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gCjUwOiAtLSAtLSAtLSAtLSAt
LSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAKNjA6IC0tIC0tIC0tIC0tIC0tIC0t
IC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIAo3MDogLS0gLS0gLS0gLS0gLS0gLS0gLS0g
LS0gICAgICAgICAgICAgICAgICAgICAgICAgCltoZW5yeUBhcmNobGludXggfl0kIHN1ZG8gZ3Bp
b3NldCAtYyBncGlvY2hpcDAgNTg9MApeQwpbaGVucnlAYXJjaGxpbnV4IH5dJCBzdWRvIGkyY2Rl
dGVjdCAteSAtciA5CiAgICAgMCAgMSAgMiAgMyAgNCAgNSAgNiAgNyAgOCAgOSAgYSAgYiAgYyAg
ZCAgZSAgZgowMDogICAgICAgICAgICAgICAgICAgICAgICAgLS0gLS0gLS0gLS0gLS0gLS0gLS0g
LS0gCjEwOiAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAK
MjA6IC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIAozMDog
LS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gCjQwOiAtLSAt
LSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAtLSAKNTA6IC0tIC0tIC0t
IC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIC0tIAo2MDogLS0gLS0gLS0gLS0g
LS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gLS0gCjcwOiAtLSAtLSAtLSAtLSAtLSAt
LSAtLSAtLSAgICAgICAgICAgICAgICAgICAgICAgICAKW2hlbnJ5QGFyY2hsaW51eCB+XSQgCg==

--------------RmX121KJcWXcqzil0E3foKFm--

