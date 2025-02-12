Return-Path: <linux-input+bounces-10000-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B1A32B2F
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 17:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F081B16527E
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 16:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D700B21171B;
	Wed, 12 Feb 2025 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="W4LTlJRI"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010015.outbound.protection.outlook.com [52.103.67.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48CE24E4C3;
	Wed, 12 Feb 2025 16:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739376551; cv=fail; b=JTgTjT6XZh6ad/1SoIjwFZ55hd8dVLcVOagjeXsu1AzM7A3geH3lE8xI51hirDc1KlkEhXtGyoV6QCwJdPSU+xWUwfix0XDpDSqngmAsTEi+SkAoFvaR/Pcmbdu2b8HmxYVFKfy+QbpUp1gSpX1Wx/+ahXJJzi9igc6DqfNmGjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739376551; c=relaxed/simple;
	bh=5NqynCM+zV5o4xPIkc1FXtMlUF8QkDU6+glk3Fkat1U=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gSMGfe7Y8Xk18VSNisNrvOF3xjv3Pg8BorVY0XlUNNMjQIKoLtUouqYa3rzB5l6fNbzVxvobdL4kcZ8MRiohoSDvrX8XwzLdSTMRj8Vxpsl0Ci+2jj3+9FjjheqeaKrVjbuaUE7xmc6ma1uAiWpBazCd04MXCgUAjgKmpCA0kj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=W4LTlJRI; arc=fail smtp.client-ip=52.103.67.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lOPm8qNPjj9++8YqnAP589MFOJYWSSm6Uki2hvtkEjWkZ4GTQJB/bedO6njKQEQm/zXGsCNcDQwiEL69HAo/H54ydaVXtbO66gSbCLszxoNUrJzX6UqQw5KbHlhc1dqmCyc4rAnS1LtWKzpJc03Qh9IH7RIAvpcoZO5jXXaPJbCjiFtj59E/RN3mR8OFkwtiyyRjkinc2cekSEo9hXI7PT+yVidY1E4sH68Zb4CRSrPsPxBj7S1oLHDfjW7URgk6ObEc4shZmweBl6je+rPLizSIMWEsRgGrZd42XBjaxLtN89XN1xS8kkHBTyck+Qgk/33AdzQeJvJ5dhJnyPMKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NqynCM+zV5o4xPIkc1FXtMlUF8QkDU6+glk3Fkat1U=;
 b=mIeaGFdNsB30kHdLnUlnGntNO8wvBD8XyP250YfhW12v4KOOYkd7lhZvsfrxts+jDL2EmdG90XW+b/YBUYpJMsN+08iK4g68427BNPTfhwUFDiqPdpOSG7oeIg45edkNw123GqV7Q+Tvo2288KmCKOBUOdoYWy32Xkd/MMZwBKLmGpGLp6khZ65/BNR4SgqBDUDfZncyfGfLWyYrW4fnZJt/yPSRYsRvSQpa0fl9R+pvXp4Av34BEAtBMTbQwbe/EPQ5P+hwuI5IP0VE7tNTxDoZf4IWxs09+SLzDzBpDhmPgapCLOwjdvpUN54JnzUz4gFZQsVD3xzp1XSRRYauqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NqynCM+zV5o4xPIkc1FXtMlUF8QkDU6+glk3Fkat1U=;
 b=W4LTlJRIXreYpe451Dq5QvwwHklG8P2cYNh2IgDCjuKqng4W+PauLvWSQ3O6Ubx3pNS0EFSUT0EJKTj/3eAT1hgzzpPQ2x5mUFik5alchf/Tocj+hRSVcovvUj3w2ekchTtYyHZB3uUl0p3yOQEsU/u1JMw14svZZm6FDQmYK5wE0c/Pn6v/iTZysw3aA1CX5DuV9FkM/tUFkMbRkzsnUc9aLill+udXNJk8nH/IG8Rh/2pLZ5OLz56QxoQY1DKGw2jFkt970vGl7g5txI2o5BOAYXM5JhU5byRSnOx8xr6bRd5V+qwHLJip8MqMXGjWWzSj9OC+3/rA4nrRDe+EQA==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN2PR01MB9297.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Wed, 12 Feb
 2025 16:09:04 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 16:09:04 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH v2 1/2] HID: hid-appletb-kbd: simplify logic used to switch
 between media and function keys on pressing fn key
Thread-Topic: [PATCH v2 1/2] HID: hid-appletb-kbd: simplify logic used to
 switch between media and function keys on pressing fn key
Thread-Index: AQHbfWhvfoTey4m/GEudYLyVuVR9Jg==
Date: Wed, 12 Feb 2025 16:09:04 +0000
Message-ID: <FD47E76E-F8D0-4EE4-A050-E3A569806BFA@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN2PR01MB9297:EE_
x-ms-office365-filtering-correlation-id: ff5a7097-2f44-47bb-51f5-08dd4b7f9282
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799006|8062599003|19110799003|7092599003|461199028|15080799006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTYwUVVWaXZJa21YNXBnUTBQTXRiWTN4S0dGUUpUdEpNWldIM2t6c1RnZmll?=
 =?utf-8?B?c25OMFEramdyVEwyUDUzbXE4MDUyM3FYK1p3dFFzdHJOZW40amUzaHQxTm5o?=
 =?utf-8?B?WHcremxpV3lhcG9XR3VQZFBOOHpXR0NablRXSXd6ZjRCeXl4ckRrMDRQL3Fu?=
 =?utf-8?B?NGQwWGVGUm5JUHJ1QWZRZm96aWhPK1F5VDBOb0hHZGdqaTBaVFQvYUsxMmUw?=
 =?utf-8?B?QXFOYjc2aTJZYVMvK3JBU3huSEV3Ni9DUTE1Y2VJOTlmcnNtK2dvcmhrcEM3?=
 =?utf-8?B?djNHT0VWditjQ1QzQmJ0c3lNanE1Zlhxby9IREN1bDU3US9OYWNvY3pjdkw4?=
 =?utf-8?B?UU5EY3l1WE9wS2puYlEzTjF2YmJvVFhrN2lLRlhJdzY1RC95RXIrL1JtWHFK?=
 =?utf-8?B?dDBXWmpzc2V2OGdLYW5aL2VoZWVYcmoycWFtdXVDSWlUeWdKaTFJV0lLZSsx?=
 =?utf-8?B?WjhmTGl1cDNwMGNYYXdJK1h0aW9RVXFHc01TdDNsbzB2UUUvZ29BS2ZqOXJL?=
 =?utf-8?B?TlN1Z1FDQTZWMTQwUTgzNXlGbXpDanhHUHBtYzRsYmMwcGhGZ2pnTmJxV1gw?=
 =?utf-8?B?blhEUDdCVUVDOHJZOWtGMTQwYzlGc0ZTbFNDMDlBMm1lUEZsQjlvdW9NWDdF?=
 =?utf-8?B?aFpOQXdFWFBDZXRPcko1VGM1Y3EzRVdyV0VvZnAySjVTMTY0QndkcGJKUHdP?=
 =?utf-8?B?WGR2V1lONHIzWFVsZEtJdGZ2QjNCUWJxSDVaOVYwZW92Y0RLckRWR1lVODVY?=
 =?utf-8?B?TithY1pwd3EwSnU5NGhlZGNmNnJQdUZaZnFRTmNjVVdNV3NiMmVmV0lidmxt?=
 =?utf-8?B?dTFSTDQ4UUlJVTV4NGNCaWJZRGZPc29vbjJCZ2hZZXhtZ0Q5RlRWcEpRbWVy?=
 =?utf-8?B?b2lZQWsxd3FjVWRHVjZHSWJZbHFDQ2NtbW9VOEZZeUZXQ25qc2Vkcmk1VFlD?=
 =?utf-8?B?SmozOWRnZHEvZEszc2lpRkRPUzAxWHN6WmxwZ0kyM1VwY3pMQlNJb1VobCtO?=
 =?utf-8?B?WHdEUWVFQWNLbm9aVWhpMERvcEVqSVVnRFNzU25kL2VjSkRHTm9RSUoyNmJy?=
 =?utf-8?B?Ulo3RXZYZ1NwVy9uZmc4SWhMNHY0T0Z3RlVkcDJVdXNnbUR4aDlUZVdRa01J?=
 =?utf-8?B?TkcxQUZjWElrSXNlemJ4aXROejNkSXAyUW9QeUN3Y1dpRDNvUTlIdjdNbkM4?=
 =?utf-8?B?OW9zVjd4UmFpTGZRcU5vTjNzL2x5Sk1Oc1N0T3J4MGFUdzBsaUNkY2FEUDE4?=
 =?utf-8?B?aGs3K1lkNjFwK25wcXBkKzdMWEs3NFhlQ2k4dUlwSjhHRWlFUHR0N0Z2QUk0?=
 =?utf-8?B?YVg4TTlraGNHbnc3TUx6ZlJMWmhJYUlSOHNrMy9RSVdDazQ5a1padDlSZzVZ?=
 =?utf-8?B?MU5YU1FHT2d0emN1eUJ6c3laekdnaGwrOXc4ZDZkaE9MaXJxWElCNTBDTURH?=
 =?utf-8?B?ZUNMQytvN1RQRFhhMTh6ZjdBM0NXUDB5Q0d4UDZRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OEtYWE9ycWZnM1JFWWo4am93SlVSOFViSHVaR3FEZEpnOFZVT0kreGpNYktQ?=
 =?utf-8?B?LzZ0WllrMVhKOTgxZ3BkSXdSVHd1NnpxSnNNbFpDUS9tV3ZOQURkeVJqVCta?=
 =?utf-8?B?MVBsMitmM2JQeERGblFVaTlnZUlIOXdZdHZtb1lRL1RRNVE0ZHFtODVjSXAx?=
 =?utf-8?B?ZWN2ZnhXcFV2bmlHWWY1VGk5TGp4akhjOXdRR3ZJRTFlK0E5MXVHSUNjbTdt?=
 =?utf-8?B?RTFFbGw2emRtaXE2MlliamkzZFc2UkJ5anhOVUNtd3dDRjNmUS85YVF1cFBL?=
 =?utf-8?B?K2VvMndVa0xGYUZ1S09oZjBFVmF2VUo5RkJFMXlwSFNyYXdnNW1XVWhIdUxJ?=
 =?utf-8?B?cllLNU9jenFNQlgwZWdMQ2dieEJTdkxwNythMVU5a2w4eWhGeGhMZ1I4cFp2?=
 =?utf-8?B?TFBDTGpwOXFBeGF3WnhoZm1wamhIbVFxRTJzSkFLTWU0dTcvdmxYcHZXaHUy?=
 =?utf-8?B?Nlk0K3dTMVJ2OTR4UkVsTG1LYWd4VVQwM1l2YlU2Mk9nV1ZLSzgzb3FGOE9K?=
 =?utf-8?B?Nzg5bXBPOVZ5V3BXamNZRGtyOXhWYXVIc0R1cUp0YUxoMFlJSUlBTjdKUWZ2?=
 =?utf-8?B?eFYvblpRZGJuSURqczlaVmNjL2o5aGJIczZDdmpDM2NjR2pmU2VUU1JhZXVs?=
 =?utf-8?B?Nmd2OEovQzVGRDZTUWp0akxuKzFHWG9jWDN5V2hzaTd0a2RiVDAzYkVDbWwv?=
 =?utf-8?B?alFMT1drdXJEL3RmcjV6TXZ2M000K2hzbTNXSDVsdFJWOEtjeTA2YjV0TUxY?=
 =?utf-8?B?VE9NcGF3SnM5ZFRLdThxb3VsVWZyRUwzN05Id3c0OVJnS0xsakZTcGpjblcr?=
 =?utf-8?B?SkJIT1VXZVp5K3ZJaWpBT242WmRLZlg5RzM1eHNMTU9jcnVSVFFIZkg3b1Rj?=
 =?utf-8?B?d2ltT1ErOW1WL0RlSjlFQWllMnB2cytWSG55a0pBbUhEbThReVhrODFRaXlS?=
 =?utf-8?B?c05QQzlORDBjMm4wRXEyQVBWTCtTSVVQZlhNYS9qaUJsYW9FT3pUWmdxTjJZ?=
 =?utf-8?B?eVFqV1hUc01FaGdJd3FhY2FtMFh5blhFMFJWZUNhVGttZ29mUUVmdkNKRXRR?=
 =?utf-8?B?cCtkWHZ6UjhSRjJCczliVFBUOUZ0RXUva1l5anlxaWQ0UzI2UXEvbmpjcTk1?=
 =?utf-8?B?UEZiVlFaU2VvUE9ydkxvTjB3ZGJobWVCVTFZbnJkV3BYVklKTW1rNHBleVMz?=
 =?utf-8?B?UHJyaGNLTld0YTdvRi85VGFMQ0pLNGVLNmpabGFRL2cyazAzVGM3cXo2dmdm?=
 =?utf-8?B?N2JldExzZFFwR0JkUnN6Y0YreFBRZDljdGpGbkhiT09aTVFybWtJS2czZVBZ?=
 =?utf-8?B?dFBNb1JEMDJ1TEIySGxtTjh4RnZmbmorZkg1TWQwNVdTVEx1WDZhOVlCUm9I?=
 =?utf-8?B?VEJ5VWdGTHE4cyt6VzdXdEdJdDhBZ1lsRFVrUW5kbUlGNENGZGtKekF5dmNM?=
 =?utf-8?B?TjlyWHRaeTE4MDdXU1crNUkvYWFKS1RrQzgvek5JekM0amhLUHIwSmd2bHhj?=
 =?utf-8?B?aU5SOXlZQ1Jsbjk2SXdZZmRMT3VBQmlKKzlVbVBWK1dRM3QvSW8veDRON2pu?=
 =?utf-8?B?aFFSOXYvRkZhN21md3FMVTZLQTByWWE1ais3WUlxNmJEK201M2Q1MCtMM0Nn?=
 =?utf-8?B?b012Vktud1p1MUxtbEFnNlF1SHJXK3pMYkNQUWRzRWUxM1hBTUJBczlMNWZu?=
 =?utf-8?B?NlQ2RFhpR01OeGFkYmwzZTJEclZuWnlNY2NJbjlhRUpWeWFzY2RqakpMaFhj?=
 =?utf-8?Q?2Hc+EXZhvvFotfeCr7jQXGcaABqHN7L/bmAYTj+?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B15C8C57E1370F4D9425AD11E912C3AC@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5a7097-2f44-47bb-51f5-08dd4b7f9282
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 16:09:04.6813
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9297

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhpcyBjb21taXQg
c2ltcGxpZmllcyB0aGUgbG9naWMgaW4gYXBwbGV0Yl9rYmRfaW5wX2V2ZW50IHVzZWQgZm9yDQpz
d2l0Y2hpbmcgYmV0d2VlbiB0aGUgbWVkaWEgYW5kIGZ1bmN0aW9uIGtleXMgb24gcHJlc3Npbmcg
dGhlIGZuIGtleS4NCg0KV2Ugbm93IGFsc28gcHJldmVudCB0b3VjaGluZyB0aGUga2JkLT5zYXZl
ZF9tb2RlIHZhcmlhYmxlIGluIGNhc2UgdGhlIGVzYw0Ka2V5IG9ubHkgbW9kZSBpcyBjaG9zZW4u
DQoNClRoZSBmb2xsb3dpbmcgc21hbGwgZml4ZXMgaGF2ZSBhbHNvIGJlZW4gZG9uZSBpbiB0aGlz
IHBhdGNoOg0KDQotIEEgc21hbGwgY29tbWVudCBzdHlsZSBlcnJvciBoYXMgYmVlbiBmaXhlZA0K
LSBGaXhlZCBzcGVsbGluZyBpbiBNT0RVTEVfREVTQ1JJUFRJT04NCi0gSSBoYXZlIGFkZGVkIG15
c2VsZiB0byBNT0RVTEVfQVVUSE9SDQoNClNpZ25lZC1vZmYtYnk6IEFkaXR5YSBHYXJnIDxnYXJn
YWRpdHlhMDhAbGl2ZS5jb20+DQotLS0NCiBkcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYyB8
IDE1ICsrKysrKysrLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDcg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQu
YyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQppbmRleCAzOGZjMGU1OGMuLjJjNzRh
YzJlMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQorKysgYi9k
cml2ZXJzL2hpZC9oaWQtYXBwbGV0Yi1rYmQuYw0KQEAgLTIzNiwxMyArMjM2LDEzIEBAIHN0YXRp
YyB2b2lkIGFwcGxldGJfa2JkX2lucF9ldmVudChzdHJ1Y3QgaW5wdXRfaGFuZGxlICpoYW5kbGUs
IHVuc2lnbmVkIGludCB0eXBlDQogDQogCXJlc2V0X2luYWN0aXZpdHlfdGltZXIoa2JkKTsNCiAN
Ci0JaWYgKHR5cGUgPT0gRVZfS0VZICYmIGNvZGUgPT0gS0VZX0ZOICYmIGFwcGxldGJfdGJfZm5f
dG9nZ2xlKSB7DQorCWlmICh0eXBlID09IEVWX0tFWSAmJiBjb2RlID09IEtFWV9GTiAmJiBhcHBs
ZXRiX3RiX2ZuX3RvZ2dsZSAmJg0KKwkJKGtiZC0+Y3VycmVudF9tb2RlID09IEFQUExFVEJfS0JE
X01PREVfU1BDTCB8fA0KKwkJIGtiZC0+Y3VycmVudF9tb2RlID09IEFQUExFVEJfS0JEX01PREVf
Rk4pKSB7DQogCQlpZiAodmFsdWUgPT0gMSkgew0KIAkJCWtiZC0+c2F2ZWRfbW9kZSA9IGtiZC0+
Y3VycmVudF9tb2RlOw0KLQkJCWlmIChrYmQtPmN1cnJlbnRfbW9kZSA9PSBBUFBMRVRCX0tCRF9N
T0RFX1NQQ0wpDQotCQkJCWFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwgQVBQTEVUQl9LQkRfTU9E
RV9GTik7DQotCQkJZWxzZSBpZiAoa2JkLT5jdXJyZW50X21vZGUgPT0gQVBQTEVUQl9LQkRfTU9E
RV9GTikNCi0JCQkJYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBBUFBMRVRCX0tCRF9NT0RFX1NQ
Q0wpOw0KKwkJCWFwcGxldGJfa2JkX3NldF9tb2RlKGtiZCwga2JkLT5jdXJyZW50X21vZGUgPT0g
QVBQTEVUQl9LQkRfTU9ERV9TUENMDQorCQkJCQkJPyBBUFBMRVRCX0tCRF9NT0RFX0ZOIDogQVBQ
TEVUQl9LQkRfTU9ERV9TUENMKTsNCiAJCX0gZWxzZSBpZiAodmFsdWUgPT0gMCkgew0KIAkJCWlm
IChrYmQtPnNhdmVkX21vZGUgIT0ga2JkLT5jdXJyZW50X21vZGUpDQogCQkJCWFwcGxldGJfa2Jk
X3NldF9tb2RlKGtiZCwga2JkLT5zYXZlZF9tb2RlKTsNCkBAIC00OTcsMTAgKzQ5NywxMSBAQCBz
dGF0aWMgc3RydWN0IGhpZF9kcml2ZXIgYXBwbGV0Yl9rYmRfaGlkX2RyaXZlciA9IHsNCiB9Ow0K
IG1vZHVsZV9oaWRfZHJpdmVyKGFwcGxldGJfa2JkX2hpZF9kcml2ZXIpOw0KIA0KLS8qIFRoZSBi
YWNrbGlnaHQgZHJpdmVyIHNob3VsZCBiZSBsb2FkZWQgYmVmb3JlIHRoZSBrZXlib2FyZCBkcml2
ZXIgaXMgaW5pdGlhbGlzZWQqLw0KKy8qIFRoZSBiYWNrbGlnaHQgZHJpdmVyIHNob3VsZCBiZSBs
b2FkZWQgYmVmb3JlIHRoZSBrZXlib2FyZCBkcml2ZXIgaXMgaW5pdGlhbGlzZWQgKi8NCiBNT0RV
TEVfU09GVERFUCgicHJlOiBoaWRfYXBwbGV0Yl9ibCIpOw0KIA0KIE1PRFVMRV9BVVRIT1IoIlJv
bmFsZCBUc2NoYWzDpHIiKTsNCiBNT0RVTEVfQVVUSE9SKCJLZXJlbSBLYXJhYmF5IDxrZWtyYnlA
Z21haWwuY29tPiIpOw0KLU1PRFVMRV9ERVNDUklQVElPTigiTWFjQm9va1BybyBUb3VjaCBCYXIg
S2V5Ym9hcmQgTW9kZSBEcml2ZXIiKTsNCitNT0RVTEVfQVVUSE9SKCJBZGl0eWEgR2FyZyA8Z2Fy
Z2FkaXR5YTA4QGxpdmUuY29tPiIpOw0KK01PRFVMRV9ERVNDUklQVElPTigiTWFjQm9vayBQcm8g
VG91Y2ggQmFyIEtleWJvYXJkIE1vZGUgZHJpdmVyIik7DQogTU9EVUxFX0xJQ0VOU0UoIkdQTCIp
Ow0KLS0gDQoyLjM5LjUgKEFwcGxlIEdpdC0xNTQpDQoNCg==

