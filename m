Return-Path: <linux-input+bounces-4813-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2643925DA1
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 13:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4DCA1C227A7
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 11:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5952B187342;
	Wed,  3 Jul 2024 11:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="N4hXOeQQ"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2091.outbound.protection.outlook.com [40.92.103.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8855F45945;
	Wed,  3 Jul 2024 11:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720005710; cv=fail; b=IO/B+EWBkU8yb75d4bb2jvKfgAf+0RSVNiv2J2jmuwjHSEZQPYXBDGFMiQVxrQGUXjyTFr6ZMMy38rZJRdzjxMItNeFy4XxvPhH7ellS7Xj9dd338Xh6bqQaxqLSPD+7TJTyh6dZPLVEAga4nOHvLxd7YNKuXPCwJeig9t7Ad7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720005710; c=relaxed/simple;
	bh=uq2v1Q7GC72OhrQi3FLQuYk8xuGgmuF/nI+eE5kImF0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A00mZQthWKO8S/pNDhTQ3GiEJJu+/+/SrPn9eSdm2OQldCIjjGJttd59qnRkC8AVHiB58V4UPXTyPuRBUL62Zh3C1iIx1NkWIlqmxny8iOgBQQ/X+C3So799S3SAtiqGe/hZx4MGBk4jSBVbYWIeI22yKoVdhfcV9WYk+h2ZTOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=N4hXOeQQ; arc=fail smtp.client-ip=40.92.103.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gv+5HIqllMqDFunsnNo4up1Ah8ecp/bRU/eW3xIYbLTYyAsNXhuiURJvlXO79v8hWXZ8JnxR4cV46jMzk7/oejg9L/TFTCYVDg82Fj/jsple4I7rqiKbKX/30DvFwIEBcrF5zEZavG8/k1zJ02b+xDUymFOErlFgO4884amOfOcNCbqwZnoNi9XMWLjF5allze0nBxbVi/buX7sU11CPPFVXY04OggZK3WSJbQ6nFsSgICSA56E217yIyakmkF/QOBV08Dy7DGOSGqQ6bNYizsK1V2qvmSdHFWIpW0LPxHY2FLWomJzn93JYFzKTABA1TrS5w2D5szQWZTzhPWCAAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uq2v1Q7GC72OhrQi3FLQuYk8xuGgmuF/nI+eE5kImF0=;
 b=PiJ8gBLDpD+sDilUp8i/eu5QfBmKUsfv27EnLMRc3MIWkjDNY6ZH9eX9GJaVjcsA6sR8PDGsROAnMCap1rlmC050qAMqyrMkhtZtw3yEDsDprH1p5h7nE8XavEt+r/77D5kOucX17Xzp53PZAY/pLyjW+3t1Ic8CvSQEmxhGiKQnP1TQxLth8S6UA2RfGjUKZE/xNNfuXsdYWZYN02JwRIDCFPhH+7ibqNsmyV2uIw3GQ/FiIOGgauonISJNsye1bUA3SEVdeKdmf4gzULP18EEhY2SOrRlHC3mUrgrobk9iHH1L5RDuIfrmiBZ6h3gvlHg3u8eRaiZpiHv1R1nZWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uq2v1Q7GC72OhrQi3FLQuYk8xuGgmuF/nI+eE5kImF0=;
 b=N4hXOeQQ4utkLsLXs+VC0jMFBnTMk2on5mRBRoR4PJ1+hx3D/xRZy7LAUodAdFqCJdj7VYlWU1QhgDww5ZfDtyAwM6ViusnxoG8qFnqHA7+2dghEDR1x1nHpfZd1MtEiZi27bCaER5D4BUFew48Em9odva9mwNqWzBmPY1HkRoZMLY3PehGwQWtsecQgMLVJWDj7MNHiodCyxuuiYT1mu4O/PB7VxxXHT7F5ulRiAvd642dK7znzV4HEaE09qtqAhE6qf92lXndrAEZSKNHpQylaAFPjjapenSydbmBgqm6oAJdyrWcu1TGWfQeIE/7zQJcxud5UorxewCSLcj9HGg==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB1481.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:f6::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.25; Wed, 3 Jul 2024 11:21:42 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 11:21:42 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Pavel Machek <pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>, Jonathan
 Corbet <corbet@lwn.net>, Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>,
	Kerem Karabay <kekrby@gmail.com>, Andy Shevchenko
	<andy.shevchenko@gmail.com>, =?utf-8?B?VGhvbWFzIFdlacOfc2NodWg=?=
	<linux@weissschuh.net>
Subject: Re: [PATCH 0/2] Add driver for keyboard backlight on Magic keyboards
 found on T2 Macs
Thread-Topic: [PATCH 0/2] Add driver for keyboard backlight on Magic keyboards
 found on T2 Macs
Thread-Index: AQHay+tu1Tr1WmutCUW1PwnNBqV+h7Hk3nYA
Date: Wed, 3 Jul 2024 11:21:42 +0000
Message-ID: <04704D6B-2883-40E6-9ECA-5ECE524E7D80@live.com>
References: <3055BCC5-8F8B-4472-9E94-1319D1C6DEED@live.com>
In-Reply-To: <3055BCC5-8F8B-4472-9E94-1319D1C6DEED@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [RVnAsjiaHG+l5uLSxYpZ/kXstGORJdjjX0Ob6Hj7yZkZ6eoZAE6E7mNnC3jAwiiCgB4Z30qNE7I=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB1481:EE_
x-ms-office365-filtering-correlation-id: a2f0ad44-841f-49ef-1ff0-08dc9b525099
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|102099032|440099028|4302099013|3412199025|1602099012;
x-microsoft-antispam-message-info:
 JKa6zbA234XYmBLZ8lHsz2jPF4WD6oYM8jlHZG0/aDb6kCuxaasx3ZDm97+HyMY9Nmq0HGnJojcndfTZtrc+pVTYTF3tIEYXADlB/3QNClSdfBiJFNbUT8B/UllCPC/rqrk4O0ze4uu6tkK69PC8lWkJwYbkcjNslAuB4OlLzvrjRWf7UCdsx4EfjoBNox9rbzk1rNC6NkijkDYyQNa3nc/pMMGz6yLvkSNwPC8Tw00vx6vPLM1LPJhNeClkjqNscrq2amN7TWPAP86CO/v+YMWeuqzSwUa3a//XBQVPtJWiT645Edg8BV1y7A098qZEfC9ybqUujoHkS8Cv1Ejiz9gMT0MTPN6tKFcTT3O6/p53QGHviTdI0r0bSfnmKT44ae/TH9nUuvNN/GKGKFWzIdhga+eTpo+K0RrH6qBcYj80ave/G8blVr+CX5h847Rrt27R9uY0CEi6TfmaOH2kGtiBejlYssZ/9zachzNX2uNP8srWNEGLGvUO+tJXr5X2FE4YHWiZRqTxg/cvaQ7dOnE2H07/latBTrLqUwhmcnLzsd19LTrv5fYboJZX/XtO1MNYAvwC65phRo9nOoUhzv10zNEjAyZh3m4U5tpZ0PnLC0rM6by8g8Ejyoqd05BREwse/+CTChakpevbTcjO4b9bwFAyN5issY0LxSpjNz2giPaZKT96dqIX1IEkoPWDl7lA60Qr43GoVa9kAYrOWAx5Zk9qAjxAc6hsk6qyoRE=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGpwTkZoNm8xOUJyWjNWQzdxTFV2NTBDcDNpOTdKUk1tMWJHRHo5cW44ODJk?=
 =?utf-8?B?YWFSVzNoamhwMjVib0NCK0xLZkkvUW43ZVdYbFFmcUcxSGZtNmZxQ2prVmRY?=
 =?utf-8?B?eGppQ3NmeDJaZGVrSlR4WjdUVWhEQUJjVHJXZ1AvNkUxVnI0bmhOQVJ0dWVm?=
 =?utf-8?B?RVVMSSt0enhQU1p6enJ5L3FEWm5VMjQrQnp1aDVLRjFJWm5vMW54RXlCK0w0?=
 =?utf-8?B?VmsvbXRXMmFlcHRzTXQvUVZKRXdCaVhBM2p1NC9zditudWNIUEhsRFZ0aE1q?=
 =?utf-8?B?c0d5OWx4WURFUGxNQkdYZFBxZ2lHMkh0Y3J4TFJaamVlUlk1d3lNNnZ1WVll?=
 =?utf-8?B?WFd4MmhFWmt6V3BmTkZFOGpSWkh2N1QxRUxPYk9ZaUx6MG1TOWNDdHAvcTNo?=
 =?utf-8?B?QTgwT3JoeUh1UHdPS1cydTRNc0l3ZElqZERDdXg0SENEVXdzZEloNVJCR3Nq?=
 =?utf-8?B?UWdJS1ZpNjI5aW55djZiMk5WYVVoOGZscVN5MHgvNFZiNWlYZUFkT09YWDA1?=
 =?utf-8?B?eVR3bFowQVVuQ1cvbDJlc0RiNmlZc2ZyVmxJR2FvbUhTWkwzdHFBQUNFMlNu?=
 =?utf-8?B?bkJkWnJoWjZMZ21mZENGRFV3ZlY2ZWFTZGNKVkpVcGg5RlZETzJyWmNOd21H?=
 =?utf-8?B?SGF4NVpJeDVZU3VXMWpiWGw3SUNCK0JhYmNyYmtsZ2JYNXVlSXByTXdvbkFJ?=
 =?utf-8?B?NC8xa2dKQS9lRy9JQytwbmpTeXdwTDdVNmdtNVFDempEaGh2VGNLdy94OUJw?=
 =?utf-8?B?amtTQzVHdEtxRUVhUjlCK3BlWkV1d0NtVUwzcVdoVWZsbjQvb3N5Y04rWDRx?=
 =?utf-8?B?L0w1TWs3Y0hVM3NQeEhQOFdFTTI3eU5DL2NUd2MxQ3h2R1hEWnhqeG9XUytF?=
 =?utf-8?B?Rjl2Tk0xZGlWV29TamVkVVpwbEt0ZFRUbXRCem5yMEZZb1d0UHFiSk1sUCty?=
 =?utf-8?B?WC83MCtjNlplSm15ZzhBSlZubnNUd2M2cVdKOXF6U2NlVERTb3RGbjE1WEpa?=
 =?utf-8?B?SU1ONi9EeHdRTFJYem9rbnh5M0J4a1E3ekYwVk9GeG5zUWFKVHp4WTVHRkJm?=
 =?utf-8?B?eTBjWU5WbjVyYm5yN2RCbXZTK2tFU3JxZGM0QTI3QzMvRWlXVmRWUjN0aVJz?=
 =?utf-8?B?RUZicktUTEVSV2NLSTVMN2o3ZGhsRHhoUHVDNUJZV3FORTFEVWdjTkhJOTYy?=
 =?utf-8?B?S25ObDBoaFRkZnFhd3lEdU9CdUdyNStPVmxZODY5M09DUHR5VEYzVjlmQnZU?=
 =?utf-8?B?RFg2VDh3ejE0UERhd05UUmJBNnlFTU42cDdWNjJ6K25ZQnhmY1lTeHFhZVVt?=
 =?utf-8?B?cENheW16clR3YTEwWW9pSndWV0ZNaUc0STNrR2xvL2lYeXFncS9MUk1lbVd6?=
 =?utf-8?B?SkxZV3ZSbVg3UTR3d2hZaVozbU56dm9SNFZkV2k2bExQRmw5QlVUWVhSUFA2?=
 =?utf-8?B?ZGhpTnVQUkJTb0huazJTbHRzc0t3eU91V1VSazBQcVhIcDEycU9aTUg4VG4z?=
 =?utf-8?B?emJRTFZxMXgzb3pFemg0VFh5RndXVWNnb0xvM0QvRjdtYU02eDRYSlVvT1lq?=
 =?utf-8?B?UjRBdExNNW5rQVRZZ3BxMHVNM2RTVHdHaEdZcHhaWWgwZWZablVIM1Y3cEl1?=
 =?utf-8?B?bjJ5dldxVm9uRy9DWTREZlRvTDZJc1dlc1JSNmRLNlVTdmdlZlRXNWZxQzFt?=
 =?utf-8?B?enJBVzJuNFZWYnBYNmtzWW1LeXpKSFZGZmlsVUFpZ2dQUytnTEJVSTFyeURa?=
 =?utf-8?Q?wK513DlN0cj1sopBa2g/R48PtoepKegXrMc86V8?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ABAABB678199A741821D0A8B9E4792C3@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f0ad44-841f-49ef-1ff0-08dc9b525099
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 11:21:42.1300
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB1481

DQoNCj4gT24gMiBKdWwgMjAyNCwgYXQgMTI6NDjigK9BTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiBUaGlzIHBhdGNoc2VyaWVzIGFkZHMgc3VwcG9y
dCBmb3IgdGhlIGludGVybmFsIGtleWJvYXJkIGJhY2tsaWdodCBvZg0KPiBNYWNzIHdpdGggQXBw
bGUncyAiTWFnaWMiIGtleWJvYXJkIChNYWNCb29rUHJvMTYsKiBhbmQgTWFjQm9va0FpcjksMSks
DQo+IGFuZCBhbHNvIGRvY3VtZW50cyB3aGF0IG5hbWVzIHNob3VsZCBiZSB1c2VkIGZvciBrZXli
b2FyZCBiYWNrbGlnaHQNCj4gbGVkcyBpbiBEb2N1bWVudGF0aW9uL2xlZHMvd2VsbC1rbm93bi1s
ZWRzLnR4dC4NCj4gDQo+IEEgc2VwYXJhdGUgZHJpdmVyIGZvciB0aGUgcHVycG9zZSBvZiBiYWNr
bGlnaHQgaGFzIGJlZW4gY2hvc2VuIGJlY2F1c2U6DQo+IA0KPiAxLiBPbiB0aGUgTWFjQm9va0Fp
cjksMSB0aGVyZSBpcyBhIFVTQiBkZXZpY2UgZGVkaWNhdGVkIGp1c3QgZm9yIGtleWJvYXJkDQo+
ICBiYWNrbGlnaHQgYnkgdGhlIG5hbWUgb2YgVG91Y2hiYXIgQmFja2xpZ2h0LiBBZGRpbmcgaXRz
IHN1cHBvcnQgdG8gYW55IG90aGVyDQo+ICBoaWQtZHJpdmVyIGJyZWFrcyB0aGUgZGV2aWNlLg0K
PiANCg0KVGhhbmtzIHRvIE9ybGFuZG/igJlzIGhlbHAsIEkgbWFuYWdlZCB0byBwb3J0IHRoZSBi
YWNrbGlnaHQgY29kZSB0byBhbHJlYWR5IGV4aXN0aW5nIGhpZC1hcHBsZQ0KDQpTbywgY29uc2lk
ZXIgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8xNkMzNTYyMy03OEFFLTQ0QjktOEQ1NC1D
QTk1ODRBRUM0OUVAbGl2ZS5jb20vVC8jdSBpbnN0ZWFkIG9mIHRoaXMgcGF0Y2ggc2VyaWVzLg0K
DQo+IDIuIEl04oCZcyBub3cgcG9zc2libGUgdG8gdXNlIGRybSBvbiB0aGUgVG91Y2ggQmFyIChz
aW1pbGFyIHRvIHdoYXQgbWFjT1MgZG9lcykuDQo+ICBTbywgdGhlIFRvdWNoIEJhciBkcml2ZXJz
IGludGVuZGVkIHRvIGJlIHVwc3RyZWFtZWQgYmVmb3JlIGFyZSBubyBsb25nZXIgdXNlZC4NCj4g
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC84NjhBQTU4RC0yMzk5LTRFNEEtQTZDNi03M0Y4
OERCMTM5OTJAbGl2ZS5jb20vDQo+ICBUaGUgZHJpdmVyIHRoYXQgc3VwcG9ydHMgZHJtIGlzIHN0
aWxsIG91dCBvZiB0cmVlIGFuZCB5ZXQgdG8gYmUgc3VibWl0dGVkLg0KPiANCj4gT3JsYW5kbyBD
aGFtYmVybGFpbiAoMik6DQo+IERvY3VtZW50YXRpb246IGxlZHM6IHN0YW5kYXJkaXNlIGtleWJv
YXJkIGJhY2tsaWdodCBsZWQgbmFtZXMNCj4gSElEOiBoaWQtYXBwbGUtbWFnaWMtYmFja2xpZ2h0
OiBBZGQgZHJpdmVyIGZvciBrZXlib2FyZCBiYWNrbGlnaHQgb24NCj4gaW50ZXJuYWwgTWFnaWMg
S2V5Ym9hcmRzDQo+IA0KPiBEb2N1bWVudGF0aW9uL2xlZHMvd2VsbC1rbm93bi1sZWRzLnR4dCB8
IDggKysNCj4gTUFJTlRBSU5FUlMgfCA2ICsrDQo+IGRyaXZlcnMvaGlkL0tjb25maWcgfCAxMyAr
KysNCj4gZHJpdmVycy9oaWQvTWFrZWZpbGUgfCAxICsNCj4gZHJpdmVycy9oaWQvaGlkLWFwcGxl
LW1hZ2ljLWJhY2tsaWdodC5jIHwgMTIwICsrKysrKysrKysrKysrKysrKysrKysrKw0KPiA1IGZp
bGVzIGNoYW5nZWQsIDE0OCBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2hpZC9oaWQtYXBwbGUtbWFnaWMtYmFja2xpZ2h0LmMNCj4gDQo+IC0tIA0KPiAyLjM5LjIN
Cg0K

