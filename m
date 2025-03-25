Return-Path: <linux-input+bounces-11260-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F35A708BE
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 19:05:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497C1188465C
	for <lists+linux-input@lfdr.de>; Tue, 25 Mar 2025 18:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757442641DB;
	Tue, 25 Mar 2025 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="lLULUaZE"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010008.outbound.protection.outlook.com [52.103.67.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13AB25E802;
	Tue, 25 Mar 2025 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925910; cv=fail; b=bfPhFB6tgoC4geLmItGMKVx30OaxsYhjjkMpjxzBH5+AJibQIGcz19GlrRokOloGV7WRLeC72iA87ZS4II2y5ClPKl4GvOWkVYiRRM8lyyjBL3IkAhDepwF++CkSTGhTmy4rj3rZjgNJdb5reF9LBONcCx+nqUOyAgk2sqWCdCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925910; c=relaxed/simple;
	bh=tQwCiaInCOvLAZ82PB8GouRCeT5Z23s0wwqZ818QUg8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FTt9hYQFhQj+hUEF6FhqdFa5ZF0+/wCjxpuM+FXy1Ne+zFW1U1uZiRbE0qk1ayKqE6OYvHRnSB3kIdCKdGLF3EyMgZSKI3QFADE2FaOoFkT1iN6Qthw44LrCuSGDXeeC6kLLNCszZcWJr/8+CTNclcEI0Kogk2FVkiVlimQBBaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=lLULUaZE; arc=fail smtp.client-ip=52.103.67.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOskUpSA/ob+AGVG2wKwfxG1gzk/io1Ueq+oq+YIchZEGkfUJ8wcai2ZGyY2gm/kb+nv0rPLAJeFh7O0zwRVFYYH2BuDLh3ksTijL0sEYFC7vEF+DUn9TSIk4RP2Wt942D1C8G1F9TAxrNzeJpNABMFkjXszC9WWSSlNZb8hTdF8k4n7unTeCVjg/wkSUIYm3E3nRSKN97kAxD68RvmCUeOVEdQF4ulhnENP4peF2xp9v1md0qM1y4NpPBZlZf2CbXBjMCDqAoujQfldKuaXl+VXnvk38P8axDznEuhmIK66y9lqXLBLZ95zRioMoUSpcTwNLSUDtinIY/Ft+75DyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQwCiaInCOvLAZ82PB8GouRCeT5Z23s0wwqZ818QUg8=;
 b=crdfLSjccwQhq/JhZigIAJkFebRIYoLmaTtk1QMlPAmA+mz1OUbheXL30k66UiSs/ffdjApu2kSMHgZ6E7hKQA0xqKaZ6DLhSUVOu9v2sr7mzToxbDLJeTFvOoprmtdaUlMx5t5kv1SYItN4ituWyFEmG+2OAEX5sNmFJ1+Xf52r62y1wFnRTuVxjb5nFo3uzsFSSkpF9glx2r02IIlacJcHQnvPqkmrNvHn4ywlB54gJCCb8G9Y/crdc3i57DlrT8VNYkzgRe9kUqb110R7ppRT5kgCOVr8WiLJnWKBu54inZ1iXhLbJ+jZRUAD08LcqisAuy6hT3guckveQIBhyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQwCiaInCOvLAZ82PB8GouRCeT5Z23s0wwqZ818QUg8=;
 b=lLULUaZE//S9BYikNSiV7+GpnacbHhls9THl3rV5a+xNsibZRqrvF8HDHkMjlxgyLghPglXYJci6B6rRGlZ7F95YMkTcdourwYaWxO4DcGJJifHyxwvdGVBWptcA6ze6WjrCErG9ECOMIF0EHK7v6dlWL0mubbHj9mpHMFAwGl7xpoQOWgEwQcQk4QHEJInOBwyz0Q6hqxrCL+QkKRO3WYJn3E++bOgqPG0BpV0f1YJ7SbpWtHKHFrXz6xvSTZzaB2DakAKJb2B0uP/oZePjHtctmjGAz7tmrp64evl2bBh7sx+GrcJvhUK0VXT29XAyuFj1jAZqIJUPe+jeZ0l9/w==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB8657.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:d8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 18:05:03 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 18:05:03 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Aditya Garg <adityagarg1208@gmail.com>
CC: Benjamin Tissoires <bentiss@kernel.org>, "admin@kodeit.net"
	<admin@kodeit.net>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"jkosina@suse.com" <jkosina@suse.com>, "kekrby@gmail.com" <kekrby@gmail.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"orlandoch.dev@gmail.com" <orlandoch.dev@gmail.com>
Subject: Re: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple Touch
 Bar
Thread-Topic: [PATCH RESEND 5/5] HID: multitouch: add device ID for Apple
 Touch Bar
Thread-Index: AQHbnavL5/xIJY/IwEORIKv1XmFz8LOEJYMz
Date: Tue, 25 Mar 2025 18:05:03 +0000
Message-ID:
 <PN3PR01MB95979ECF0C403CA6622E56D0B8A72@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <bzb6rk7q7rs27kbonihpfftkgueievpux7vpqjgrgsud5pf5g2@tuxymj7vk3it>
 <219B5F93-611D-48FA-A4D9-F9B71401A57D@gmail.com>
In-Reply-To: <219B5F93-611D-48FA-A4D9-F9B71401A57D@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB8657:EE_
x-ms-office365-filtering-correlation-id: 43201425-8607-4efd-2d0a-08dd6bc790fb
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799006|7092599003|461199028|6072599003|8060799006|8062599003|19110799003|102099032|440099028|3412199025|41001999003;
x-microsoft-antispam-message-info:
 =?utf-8?B?RFppT1BIbFkzaTNKVk5ETU5ldm14aVNLbkZlVWtwVDF0d0xvZHQ5VzgzcmFS?=
 =?utf-8?B?TVcxVnBreWJBWlQ1Y3pNd1FQZWJJQXNjcjkzdlRjb0luTGQ0em45L25jQldR?=
 =?utf-8?B?M29CTzJjc0JpSVQ5eXQwU1FTQnhnbTVudEJOWmVWcVlaVWhrRUs2d1hjQnVl?=
 =?utf-8?B?aGhib1lDQzVTTmxHclZFbXFOMlVKZ0hmcVNGNFMrbXBqaDBUWTZ0Y0cyNncy?=
 =?utf-8?B?R1hPb2FISDFGZ2tmY3ZjTnNYR0R6elExOEJydEErRFE5MGJucjJQTlIyOVdn?=
 =?utf-8?B?Vmg2T2U0a2ViTHY0ZGo4ZzZSajdnOEwySVpRQnBjc3Zud3RRNzk1ZVFoVld6?=
 =?utf-8?B?WDZSU1hoZWRtTFZOeWU4UndiRmRxVzZxZ0xjTjhMTnlieUdrU0VTSk9SWk0w?=
 =?utf-8?B?akNtdm5HQUhMVVAzMGVnOGZoSURybkZiYXRHeGJheDRjdjd6MjFlWjFmNGxn?=
 =?utf-8?B?TStRTmNxd2dxdnF1WFVOeW1IY01sa0tvMU8vSTN1bFFkWDV5MFdPK3BjaUhS?=
 =?utf-8?B?Y0tSUk5QNHhFbGtsdk8wVnBXTTRrMjZ6cXlLYy9LQTRrMWFEWkZobHBuUlY2?=
 =?utf-8?B?bG5nT2tEWVY4K2NaWXJYSXhSbjV5QTJVTzRhMHpKV2FVdngxeGtoblpwbEFT?=
 =?utf-8?B?Z3hNWWI0a0wrbnJMY1ZvQXZXeURHam1CY3VnbWdQQ1JCNDlnckZWNHBKRy9L?=
 =?utf-8?B?RVE3bHRKenIrSFJuZklWWFN5bitueVprR21hT0FxZXJIMjlURUo5ODY4WUNh?=
 =?utf-8?B?Rzc1cnVEOHlISmkrTFMwMHN4UFU5SEh2blFVblpteEorTVhvK1hpYnVKYWhx?=
 =?utf-8?B?TmpidnJ3cnhMN3NpaERZWlppZW5GTzF3bk1MOWVZdVZ3OTg4Mm81b2FEaHd5?=
 =?utf-8?B?SDArTzQ1Vk1hWVVWQ0I1WEJsb1VVeGdjMmtmdk5WRzRqd04yeTZ2dXpCSmxE?=
 =?utf-8?B?clNNNnY3cHJZK1Zac1pJdnFUczRCcHo5SWorQWlmd1Q4bDNPTVg3dnl0R2Jm?=
 =?utf-8?B?NkhYbURMak5OWGRDUDBuN1NaY0ZWdU83YUw0cU5KTGMzZEFaY3hjSEdQY1Ir?=
 =?utf-8?B?MHRIQjgzZnZXSDVHb3VuWisvMi8xM0tNOFhIT29iaVNXczMvLzZQS2w2Tkhj?=
 =?utf-8?B?Z0ZQOWFvU1NITzJtUCtvL0NQdmJ4TFhrM0Y3d0NuU3ZEbXdvOHdqMWhWdHBz?=
 =?utf-8?B?b0krdld1c0pJQ05kQlFzYkdIT2dhVjZPWVBneUJYb0dVcE9sZmZOcVhYR3lU?=
 =?utf-8?B?RGE4S2xtSEo0dTNsd214VEMySnRYdy9LUkRhRVEzbUpLeEJMOXhUYmFiSTdE?=
 =?utf-8?B?aW54d1J2TjlQdWQ2bk9qQkprd05wYjB5Q1BjdUJoUUdKdHY5TkszZW5VMEFq?=
 =?utf-8?B?blJKbkRxWmpoSDZXZnhaUEVzdjh0aHhsZ2FBdWRxQXFxUE96T2ZqQ2xQWFpu?=
 =?utf-8?B?UE5MZlZTN3VuWGlrMWVjSWNzdjU3V2RtY2tTU0djNWt3NVNQZG8yWUNUekwr?=
 =?utf-8?B?QnZ4dVpwWFNFQUxpYkhZQTRsKzN6a2xaNkpMbDhUOFBqYlZ6cXFJcnIrMUVR?=
 =?utf-8?Q?u4egZ/fQcmMFKrDn8ZA2uFOZU=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dUJBYmpnbFE4WTNWOTFTblhDcWtRc2VLSmVXK3g5R2NRN3p6cVFHRDV3VlBh?=
 =?utf-8?B?Q0lhUzRDZ2M0bWNtSklSa3FRR1JhdjFQV2R5S0RTbEwrMHQ5dGFIaTV2dVh5?=
 =?utf-8?B?Y254dFdJOWo0NFQ1STBlejlWNVpVR2NKeHROY0JxSkhwTXYwVzVsdlF4RHg2?=
 =?utf-8?B?WkRxUXRIOEp3R1RSZXBMVFYzVnQ0ajZ6SVJkMVdJZ0d0YVUvQXAwckl3eHdY?=
 =?utf-8?B?alBMWlVuUnduNmp4N2dONDBaSk5HNDZaekdOR0JmSEEzb2JXNTdzSTJibEFa?=
 =?utf-8?B?RjZ0cVp5RzRiOWQydEZqY1ZtdjhSSnRaSXdTcjd3S1pGUU1ra3FwckxObWNN?=
 =?utf-8?B?N2tXR0prSkZpTGhaS1FuU1VxRGpaSlFha3o4c3FpNnBxSEVWTnIvTFhvVDFl?=
 =?utf-8?B?YmVwcnV6OCtSU20wL3doWEZhZ1h4b0hvdnNNTTN0a2tUTkNlOXlCV2lqLzdH?=
 =?utf-8?B?Vmxzc2dOTmJDVloxSVA2Ym93bThmSFhDejh2QXBjVCthNG9ib0RPYUZ3RUpU?=
 =?utf-8?B?RVVwamlRMVhXT1o5NnViaG1UWmEwZ3ZGb3RFaHZ2SVR2YjdyNDBnaE5KeE1w?=
 =?utf-8?B?KzBSODlBTzMvTSt1aW8wa3ZINVUzL3ZTVk01d2N6Ti9waFh6dzFPd1RpdXBW?=
 =?utf-8?B?Vld1RU5vZVJINGtsaGVJa0UzQ1J0TE51YkU1V3J4b0ZLVk5zeUg4emlLNWJk?=
 =?utf-8?B?bHdSSDRraU1hRFNySkI4eUdqbVFiV0pxZTNXdlIzZ1ljVWJaVzJJb0ZUOElQ?=
 =?utf-8?B?dUlCRjBhQVA4S3c4L3dqenpiaGVvWWN5Sk1hWSttK3F1Vi8yUG84VDNPQWFI?=
 =?utf-8?B?OHJVbURiRUkzYktsUGEwMmlkMnpRWXRCRFRuRUhZaXM1TUZOUnY4RGcvbTA0?=
 =?utf-8?B?Q0xjZUFTbThtODFxWmsyQlUvYXZSUVN0YkNsV3puNmpydG1pTlg0emQwRmJw?=
 =?utf-8?B?NnJJSytNcmVhdlFxckRBVitGWVgwK0ZXUUw4V2tqaXY2dFNoWm14dUdOd0RZ?=
 =?utf-8?B?d2pqbkNsOU16V2hIU0JKOGR4RFV3NFpsRXluMkk5NFRyNWpmSXJIS09JUVA0?=
 =?utf-8?B?RlVtbXRtbXpJamJMdkNRaTlBVUFzYXlubUl3YzZEMkd3VmpzNDk0SFdGdE9s?=
 =?utf-8?B?N1RwblJtc3RQQ3B0TDl3TldrcnJTUXpySFJneitjbWVZZ0dsaGpTa0o4THha?=
 =?utf-8?B?VVlTNnVYYVI3a1R0T1lwZVVvSm9iN2JCdVd4c0J0dmppczhSVUFwSjZGS25i?=
 =?utf-8?B?OHhudnAzeVlFa3RYTDF5WUNwb2trTHc3S3d5ZjRySkZvN256Tng4czZtK2ZT?=
 =?utf-8?B?NkJTc1FCeitKdEsxc1h0bzVHWFN1ZXFwQ042aVlMcEVmZHdmWFZkc2lzWmNv?=
 =?utf-8?B?QjB6MnpXOUZXTjk5UWpFdjFKaTdXT3lmWVJjRUtBYy94cHBHamhkMEVndGNR?=
 =?utf-8?B?dURLdnVuSEE4TFR6WkF3S25DaWt4S0F2clBtNVVreTd3bXdrOU1mYWJzTER1?=
 =?utf-8?B?WGJkd3FPNWorcnVLNkpEWlVLeHluZm5uaEU5d0o4Z1pOUWQxdWtLVFlGTEdP?=
 =?utf-8?B?TElvcWxZc21tekFLd3NmZ3pqZ0o4Z0pRcENkRWZYaUJiSnNMWjg0S2QwSzlW?=
 =?utf-8?B?SG5ERjl5UEtXaG0xWHFXMFQ3WjU3a0IzQmlIQ2NUN3c0RHkwUVJuU21oNnhV?=
 =?utf-8?B?cjdWdmZxR2dBcUo0b2JnMHdSVVBPMzhSZzBLUU83TWNQZ2thbWQxWmFiakRr?=
 =?utf-8?Q?rjNJ45nADrAuZHV/XI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 43201425-8607-4efd-2d0a-08dd6bc790fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 18:05:03.1457
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB8657

DQoNCj4gT24gMjUgTWFyIDIwMjUsIGF0IDExOjAx4oCvUE0sIEFkaXR5YSBHYXJnIDxhZGl0eWFn
YXJnMTIwOEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4g77u/DQo+IA0KPj4+IE9uIDI1IE1hciAy
MDI1LCBhdCAxMDo1OeKAr1BNLCBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9y
Zz4gd3JvdGU6DQo+Pj4gDQo+Pj4g77u/T24gTWFyIDI1IDIwMjUsIEFkaXR5YSBHYXJnIHdyb3Rl
Og0KPj4+IFllcyBJIGNhbiBtb3ZlIGhpZF9maW5kX2ZpZWxkIHRvIHRoZSBvcmlnaW5hbCBsb2Nh
dGlvbiBhcyB3ZWxsLiBCdXQsIEkgd291bGQgbm90IHdhbnQgdG8gZGV2bV9remFsbG9jIGFzIHdl
bGwgdW5uZWNlc3NhcmlseSBpZiB0aGUgdG91Y2hiYXIgaXMgaW4gdGhlIGJhc2ljIG1vZGUgaW5z
dGVhZCBvZiBkcm0gbW9kZSB3aGljaCB3aWxsIGNhdXNlIHRoaXMgLUVOT0RFViB0byBiZSBleGVj
dXRlZCByaWdodD8NCj4+IA0KPj4gSXQgc2hvdWxkbid0IG1hdHRlci4gaGlkX2NvcmUgY2FsbHMg
ZGV2cmVzX29wZW5fZ3JvdXAoKSBiZWZvcmUgY2FsbGluZw0KPj4gLnByb2JlKCksIGFuZCBjYWxs
cyBkZXZyZXNfcmVsZWFzZV9ncm91cCgpIG9uIGZhaWx1cmUuIFNvIHllcywgd2UnbGwNCj4+IGFs
bG9jYXRlIGEgcGllY2Ugb2YgbWVtb3J5IGFuZCByZWxlYXNlIGl0IGFmdGVyLCBidXQgaXQncyBu
b3Qgc29tZXRoaW5nDQo+PiB1bmNvbW1vbi4NCj4gDQo+IEZhaXIuIEknbGwgc2VuZCBhIHYyDQoN
CkkndmUgc2VudCBhIHYyIGZyb20gbXkgZ21haWwgYWRkcmVzcy4gT3V0bG9vayBpcyBiZWluZyB0
b28gZnVzc3kgdGhlc2UgZGF5cywgc28gaG9wZWZ1bGx5IEkgZG9uJ3QgaGF2ZSB0byBzaWduIG9m
ZiB0d2ljZSB1c2luZyBnbWFpbCBhcyB3ZWxsIGFzIG91dGxvb2su

