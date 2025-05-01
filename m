Return-Path: <linux-input+bounces-12096-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B1AAA5C6D
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 11:00:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EA224C2DA5
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 09:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A058288DA;
	Thu,  1 May 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="GqOB8lNX"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011039.outbound.protection.outlook.com [52.103.68.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FE9839F4
	for <linux-input@vger.kernel.org>; Thu,  1 May 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090044; cv=fail; b=t8/gxNS57NZMChgFZ/WhKyw7jKlbBkJy5GtocdN86TWaZbPecUUF8PBfrQlCqHR202tAu3u02B7GDREcTHsOS4OHEtvwVTde1L3KUxs19rT8Oop60TX8ssX/GZwU0QpIq5vNw2SuXhhCLEoNWw3FWJlvg6FDICzK0jspErxz0IM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090044; c=relaxed/simple;
	bh=VsTcvlns591JWoKk5yPACZoakonSwJb05cIGRdCfSms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sAv3yFJOrrHmwAsgiwKNpT+3N9+PIQHccZHcUOJXJveTGDD6C5X2Z4hj46PDzJneWqy3Ns1V2jaBr2Hz1cUXKcUfjZ9xHZdZTwP7qoRsHzuEp070PF8c4nJl4+jAFnCF4B/nHzNpX9bRP+LyVc+KlEY6UQbcEh/EJGRp8Suqooo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=GqOB8lNX; arc=fail smtp.client-ip=52.103.68.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V7FmDt90nN92vUr9K0sJYEZADvgujwybyMJUEw9AStIfztR/XkHdivuZogg9aA0m1BdpQ/KCCLLeuBjE25FTWI6PB9Y0KZTvuxjyi8z1KwJn1dQv6M2+2oO68a32y8eCir/ycov50/n++Mg+3vTfks+RNZEmlFxN0N4f4AsMTUIw8DJqref1BAKIWYBZ4DSTPGNLfGix/GRBLNBmt6uqVJMiEZqCJ7uaQFaaOH9rPPLEgqtBlUOLe5S83nji90I59lv0zlSCWy4Gnq46Y78hJX0b6G+bVGkw+cdZJBKXhURz36r1N0igeOIgf/URJqMKqIZvW0qs9X9K7UEeOQDEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VsTcvlns591JWoKk5yPACZoakonSwJb05cIGRdCfSms=;
 b=LrGVcSiYdkAKPbCFupj+A8vnFrhNFla+qVgcU/4biH8lGP5ZT4GkaK6sCfTpqz6vCl+k51ukrSs63ibGolVgEQtzZ971heJsAgZI5FrXFy2F+XbmKv6UCs6B64n8QF5GdlN4yRS1CkxKxDITRr5YVRfoS6J47muaRdmaq/3UNWj1hi3U6xH5d6getP4fw6H3UGMTfRe6Wu7lgcj9JX65tAxYSeiWsIGy9lrsJY9bdJNxohFzY+h9wm/bMe92Vbtxiv5L34A4NQ2NT5uPo3gq4gv3+H6DFSChZ07Ch920XNOtueVaCzwz+i0JTcn2KLFL+DLgfuYdjg9ftMZff+MJMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VsTcvlns591JWoKk5yPACZoakonSwJb05cIGRdCfSms=;
 b=GqOB8lNXs/C5NjetRnicY+km2VE6IDZ0I9293pA2VhSh/mGnyHip1jrAUBoSCA6CPB2hevyQoMGuM/xzrLdzQjzebWGu17wyl4ksok3ijAJCFodlJEHoFdU4DpiQIKD9TVW5P9KvOmlJUQH10YMaJ9MR3KRDAs/y76aV0q9u4EVsJJ5NtLNV2cO9/I0hKd5KKlcPwh02MyNXJk/U9lhlchqW5wpczsJk8gMREnxPdgtgRBUwhufASFcettLHJFpjeKg+fg5Ob1JJ3ZMLE5Of9cOM3wMTV5duRnA+7DWjus0dewkPObVojMBuTdjoIUOBHM3J7ghqbOcbRQzJumwcTA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB4285.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 09:00:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 09:00:39 +0000
From: Aditya Garg <gargaditya08@live.com>
To: jt <enopatch@gmail.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Thread-Topic: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Thread-Index:
 AQHbqHpzOJeDTeKkQUaV4c8kBWYfh7ObahkAgABvMACAABqHAIAAqa8AgAC0l4CAFfgkAIAGrjiAgAOjcICAAAIswA==
Date: Thu, 1 May 2025 09:00:39 +0000
Message-ID:
 <PN3PR01MB95978E9FFAF83A03A8C8FCB4B8822@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References:
 <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
 <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
 <CAAbCkm+0PwSB+1OFQ1fOZQf=eMbrefxgtjzfpcS0hq0_HveZBw@mail.gmail.com>
In-Reply-To:
 <CAAbCkm+0PwSB+1OFQ1fOZQf=eMbrefxgtjzfpcS0hq0_HveZBw@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNZPR01MB4285:EE_
x-ms-office365-filtering-correlation-id: 025fe2f9-6f11-4c34-09be-08dd888ea4fb
x-ms-exchange-slblob-mailprops:
 gMiuAN0LASI7fc4EPd4bfKCsouzBTQ7X6muotbhPeWZ7lVaiXC9jSPXwwsRGN5i1mVAbTbGUFV44uO1zYSYS1ua7OUem1HXhDLbcf6beqxwPycK+CwU0fAjT+Dc6nwK0WLMXBnTWlz//6wbCFj/sDFdj+7s6r77Y2FFH3Z/JFlTW6KNEZFYfkO6z+18tNuNT2Wem9K4qw5b7X7gceTNxL7EWHumJw/4KwxLnhvUp64VocEbQae/kyU5/qzgTQkaLbzIYW5KAHroqQqYYF6n6NTFIqMnS/uUr4xSQ/koeB7Q6QVGHQLwwT6hU9OZeEsFZ7P0cM1iDEbw3BSoD0TDrm4WYJbiOR0rQij6VCmcktYmsu3bdX8k0d030PjuCNtUaGy/Sh8UtB1FCySNcO5j/yX87CEr3ubxKli8jZqL0nR1u9Kqi2IoFriyMTSrTsPgNUsXpF5C05zmZAxSu5Wf577MClSXlhWEo5Xskx3qUkyDHySVH8jy/CqhUgu/VhAbi88DUhme+hHUWVYO9BBpZauS3Dm4uJDnpS6RCJx9ZJlW4AtB4lcxd6Zxuh8BaytaTHsjkrYnjOYp8SEZlCW68jl028Rc4t+haY1bLA+gZJTsHk/oUv/K0ecneXMib7Vqr8YUzGH/uLoTw3Xc/yP0v9AoUiAnoSR7dGUlnuTg12ydBa8+mFqxoqXAy4wCr600ffwOTKfhc4UYyIKRH7sasZQ==
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|8060799006|461199028|15080799006|7092599003|6072599003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?TXN2dG5URyt2ODB1RmtWaXdWN1lQelhxRFJhTzNsVmZpalg0VFk1bmZuSGhy?=
 =?utf-8?B?VDFSOFdKU3I3K3AxZjBzRkhOZmxQSmk1bU93bCtyY3F6ZVJDVUp0ZmFmQkdX?=
 =?utf-8?B?dmUvQ0tPUU5KR2ZXVGg5SVJqbHhiUEZPZGxFc29UdDM2VlN6dTRYZjF6a3dU?=
 =?utf-8?B?UjNpcjBHWWJxekMzVTdPalc0RXoyVndqUWRWck14QjIreVpGdFp4T2FCU1NE?=
 =?utf-8?B?RVU5ZjBELzNzQmpENlNlV2ttTWFoYzVLdkZrTklkNVpMRC9JU3Y1L1FjTmpn?=
 =?utf-8?B?dHhnSEhmQmpLWGI4dEIxS1FHYVBHQWNlajBxZU5IeWFkQzI3VHZEVHQyblNL?=
 =?utf-8?B?dGYzaVZxU01zWllONG0zTTYvL3JSanNJZmxJUkcrL3dHUWVLSGRMKzczY3FL?=
 =?utf-8?B?VWwvaTNTVXFRSHIzekxsdEl2Zm5lbTBjQ0xjTStoZzFSRlg2aVJkMU5aeU95?=
 =?utf-8?B?YTdYZ05sMzRtYmJjMlVHbk9ubVU2Q1k2Mmg5c1hMMGNKTDdYTTMwOGZZVjVK?=
 =?utf-8?B?a1psYzVsaUxlaVpJVGNRemxzaGhCWjJhU1p1ZG54bzh0Uk8ranZFTERkUmFw?=
 =?utf-8?B?L01LYkwzdFJ6TU1CNnpnNUxHS3V6c3FJNDhBZ3g0amxMN2phVGc0b1JndVhL?=
 =?utf-8?B?bUJSemhSeVdIR1FudldRUEVJWHRmT2d4RldQMUpiakpqZFNTaEE4c0YrSmJq?=
 =?utf-8?B?S3dzS3JqSUlRY055RmcyTm5Nb3I5ZGViSFdHWEVmdDdJVXBsTDBSUlBQK0pl?=
 =?utf-8?B?YytKT090L0VLUFBmQllCeHNVU2FtWVBkZjRBUEpqeFZHN1o2Q2ZXc3I1NTR3?=
 =?utf-8?B?RExyb2JMWEtLcnZweFhZTzJ3WUg3NFVyRTFUSFF4N28vbVN1aytNL1BiSVds?=
 =?utf-8?B?bi9WNXZYZU13ekZ1eUNrVTRudkprQW91eFE3UHh4SVpIRXZzRTY2MEZ2YmlN?=
 =?utf-8?B?bCtjM0FWZ2dVYlIweEdYSHdsSW5DK1VQT0VNRTZIUnBSdWZFYXNZNUUvWnM0?=
 =?utf-8?B?WWZkSzRPNzZIMHYwaGtqdlZOYWcvSy9YeE96TUJWZ0hFeE1WQkFuZHptaFZs?=
 =?utf-8?B?eTNGbzM2Q1ljOTAvSUpPNVFhNi9tVlYvY2dLVUhadEJoWGdGeVdWVTYxeEdZ?=
 =?utf-8?B?Z040RHV2emU0TkIwT3hHV21MSFQzQlBka3RERmFidEVVd0tGekJKYU13RXZk?=
 =?utf-8?B?cjlNdlVsVWw0RVgrVDJHUFJ4bVUrY2NUNnkvVDVtRjJ1VjlPNm0rZEFYUmtL?=
 =?utf-8?B?STd1aVVoZTJkKzFFMmlTUVVBMG02MWxueW5pdGRyenpYUzRYd0VvdlFmeERQ?=
 =?utf-8?B?Q0pZWEpvUHpLQW1CTlpuMFlhME5nMWF2emhsV0grN3piNGxGWG9kYlQ3amRr?=
 =?utf-8?B?SnBJT0dSbldGa01FcUcvKzVoMmx6OVZlVHI3SFpJNE1hSXptbGo1YlVQYklx?=
 =?utf-8?B?YWJFRnYwRGVrY3dvcDZXYXJyc2s0WEFscDAzMFVaRHpLdkl6THU0MWhCMUxG?=
 =?utf-8?B?eDdCdDBKMUJCKzhuUjFuUTQvellrMUM3ci80RWVVR0I5a0lVamVwSkE4YndO?=
 =?utf-8?B?TFpPZz09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0ZoRk9lTDduZVY3UCtvWks0VDY4VHdBNWlnZjlNTDRLdzMzb0N6UmIzMndT?=
 =?utf-8?B?V01LR2gvMFQ1STg5dWVwUWV4ZnZZS2JOa0V3T25NblFXdmJITHIwMC9NWDc1?=
 =?utf-8?B?dzMzMEk1MWhtQWV1S1VoWkNkbWpIK3FlZHY0OWJBdEczY2tRN2NiNkpMWjRn?=
 =?utf-8?B?UGJVYitieTQ3bk9teFJ5Mnp6QTVQS1RjTytlYVNKYUp2UDh1WTB0T3gzRTN4?=
 =?utf-8?B?VVNQK3YzTi82bFpDdldGWnFWblgyLzNDcnZ0VjJwVWNvYmp1UXNTZmFtZVNk?=
 =?utf-8?B?TkUxRmFsTHVGbDlCT1dHM2NiZjJWejEwSFdRRGc2N0JOTlZPQUM0RU9qQ29P?=
 =?utf-8?B?N2VXMTFXYzEvNisySVp3akdOUWFzczZsdnljcHV1bmpKUXZtTVVSYnpDekF2?=
 =?utf-8?B?Q042Zi96T3Evd2FFeVdvMnptaEF2L242elNXaDlNSjdZaXptUmRNMHFOVSti?=
 =?utf-8?B?MUVYWm0vWUVtUkNxTG10UTRoNGpnMG9IQkE2dXh0TUxRajRodEFzNFhLblJi?=
 =?utf-8?B?Rk9vOFFYTXhxWUZUK2wyUEo0YndQSVRNbkJGNnliRDBpdW5pRlFzYURQUW8r?=
 =?utf-8?B?NzdHWWU0V3ZiUW40NXFKR2lxa2ovUVh6ZThoanFqWk9lY2RyM09lV0lOb2FJ?=
 =?utf-8?B?Sk8wME9rUW5URmplcTBZWktGcUNOTkFweFAydDU0VlNaWHM3Mk9lMmtNWVVU?=
 =?utf-8?B?RFh0QzlhMHQwRWNaR25FNFJjQ3BqdkhnZU4wcjdncytoSFhUd0xHdm81bitQ?=
 =?utf-8?B?OWgvc1UxSzl6dmVVVnI3UXZzcmt2QngwNHZKcnpFNmtkUmdqOE9OQjIvaGZ6?=
 =?utf-8?B?TDlIcHBKajQvWHFaUXZMQ2dsVUlIWlh5b05aUEpoWW5La0tTekhqdTRLR282?=
 =?utf-8?B?NmtGK29qRVoyM042MnNDQW0zNFVXVGx6MlZDUlZ1L1dnOHBybW1TaFhIK21W?=
 =?utf-8?B?YytwRmp5VDIvaXRnL25aalF1bWQ2SW9mVEE2OWVqL2swNzI4dExSaTl0UEdL?=
 =?utf-8?B?UVJibmFqOVJmek82OHhKaFBZUnpnS2JLU0NybHl5eDRSMThNbGtCYTlwRTNE?=
 =?utf-8?B?a05Bcm1uZitiN3BIMkhqLy9HdFNEVXNVd0pXRnA1WE9DMDMzb1MzdTdKbTFq?=
 =?utf-8?B?S1IyajZVUkVrMzJQZG0rZHo4cEZ6TWhtTjNZNzA2ZVFqcS9hTjJ6L2o4R0ZD?=
 =?utf-8?B?Q0tkSGg1SmRNMWxQV2pHbW01SVNiRGdEZDNlUG9USDd1QnZRUW4yQzR5UGJa?=
 =?utf-8?B?RHVWa2ZnSU5sK3hMKyt5WlNkazNPZ3NDTEszVnJRb3Rwc2xrVkUvWXdpOElu?=
 =?utf-8?B?Q3lRT1BycXQvOHMxNi9kM2x0YkFvMG83YW5OSFQ5QmRGZFZwYW9LMFhxTkYw?=
 =?utf-8?B?azF1NWU1UUEvRDFRbEhicVZ2Mm1qNjdVNVV0MEFKTmRWUXJXYTEzOHhoaEFk?=
 =?utf-8?B?RkRITFRHTjZTNjF3a3drMHZ2eE52QnEzak5CWVA4aEJDaC9QcEgwVkE0VCtO?=
 =?utf-8?B?aEw5cTh5Z3UzRFZWNkhRZ2VQSjdUbklMTU1EdHh5V3pZV1F5WlpGeU9vSWZY?=
 =?utf-8?B?S1gwS2gxVXQxWlJCdDNXb1RadW5yOVEyK1BxcFRuZ1l5SHhDamcreThLSVN4?=
 =?utf-8?B?T0NmaWkrY1EzTUtPdnVQUDZjcDhPSk5hMUJ0TDZnRXpjNjJuS2RtcXNqTklX?=
 =?utf-8?B?SmhSckd5Kzc2MEthbG9oS01YN2FqWi9VN3hwUDdSQ0xaWHBxYmtZdDNkSnI4?=
 =?utf-8?Q?W9rwG1U2vAI5gWTGmM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 025fe2f9-6f11-4c34-09be-08dd888ea4fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2025 09:00:39.0930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4285

DQoNCj4gT24gMSBNYXkgMjAyNSwgYXQgMjoyM+KAr1BNLCBqdCA8ZW5vcGF0Y2hAZ21haWwuY29t
PiB3cm90ZToNCj4gDQo+IO+7v09uIFR1ZSwgMjkgQXByIDIwMjUgYXQgMDI6MTksIERtaXRyeSBU
b3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4gd3JvdGU6DQo+PiBXb3VsZCB5b3Ug
bGlrZSB0byBiZQ0KPj4gY3JlZGl0ZWQgYXMgInJlcG9ydGVkIGJ5Ij8gSWYgc28gd2hhdCBzaG91
bGQgSSB1c2UgYXMgbmFtZS9lbWFpbD8NCj4gDQo+IElmIEkgaGF2ZSBub3QgYWxyZWFkeSBtaXNz
ZWQgdGhpcyBvcHBvcnR1bml0eSwgdGhlbiB5ZXMgcGxlYXNlLiBBcyBwZXINCj4gdGhpcyBlbWFp
bCwgImp0IiBhbmQgImVub3BhdGNoQGdtYWlsLmNvbSIuIFRoYW5rIHlvdSBmb3Iga2luZGx5DQo+
IGNvbnNpZGVyaW5nIG1lLg0KDQpJcyBqdCB5b3VyIGxlZ2FsIG5hbWU/IEFGQUlLLCBhbm9ueW1v
dXMgY29udHJpYnV0aW9ucyBhcmUgbm90IGFsbG93ZWQNCmluIHRoZSBrZXJuZWwgZm9yIGxlZ2Fs
IHJlYXNvbnMuIE5vdCBzdXJlIGlmIHJlcG9ydGVkIGJ5IGlzIGluY2x1ZGVkLg==

