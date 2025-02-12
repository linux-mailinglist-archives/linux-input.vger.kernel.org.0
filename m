Return-Path: <linux-input+bounces-9988-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08525A32319
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 11:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF65B3A9C97
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2025 10:02:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C98B1FC102;
	Wed, 12 Feb 2025 10:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="l5A1RZ//"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010011.outbound.protection.outlook.com [52.103.67.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C82D205E1B;
	Wed, 12 Feb 2025 10:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354534; cv=fail; b=EeeE3AYwadxOUYCat5clyEyDqex1BgsVulN28FD1fynwwJEZstpNLH3m+6MwbTZBWHPH91WoapFkgXtDTHXtPPGOh4rgG88yjU6/hmdimsL0nOaJMni6BtSX6OELcpWFgKG/JqthEj0QXTnpMWYa8L4A/A1myQSN2ZnI/VIloR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354534; c=relaxed/simple;
	bh=HqwQ/rPQquzdarvfs9qLkJcGq/qtWqi5DTRuO4yt0+g=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=kN6rCM2mI2iGxZyG70b1octnujLKFNBYTNNdAvdWnkDIbWq9fbmBrivr15g/kJeRzVcUKGq48rg82ZhLE7kYFPe70tUtBGfwXtfLZGqdqZUm7+sVx3hYrrJjw9AG8VSnnh8gfG75WPCby1zlK/EBTs/URk+7zx23yjvC+iCcgMw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=l5A1RZ//; arc=fail smtp.client-ip=52.103.67.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQOtwutFI/ys+Y+l1qbw4hR/RcyaP4zQ6yestwbPgQTV6sNOh7Ouio5Ly8mVFBWzGDGWSPRBThodhCjc8S3Ui0tLl3nKJMD8y44dPTVturY997RHpU2hKkqZCA/vlBNHpBP5BbVThSwmMgjqL9YjswAK8kgblkpUFXsKcmyLWDfwbiD6rpO8MZ5XJe/D26vyvVBHEOu/eNWkFSJxvg5+EMdvKNlM5bAiLygZyMHb5MIUjkbamcwT9lJTJPUA+OnkX/BdsP/IPx5sJDWjJ7lbic97A8IMjpwYeT6aqLc/qMtkT5Iwa4mLBcCNo8bQmcpZ+NrSjfH9kzP8ug/Fa/u0sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HqwQ/rPQquzdarvfs9qLkJcGq/qtWqi5DTRuO4yt0+g=;
 b=LZrM4pt82v6Ue0mivIucRUwwiOKApOSUuS7I22Jm39kFYuqPxqWrSzzyMeZOTmchRXE33bXkrCLSQtr6W6CSdjWTO2k2nrTg96k2SDmP5CDDOxnP7lYOhf4WESgvQ+MrAz2cpIbSj3ZJVbu4ZCekY1/DRXC5JgGWDi0LprGP/yKHR4ugW3/B2/rWPymFSGIoJpZfsYTgafMwE+reFcSXrIzV1XjTWRAq4QNyRQJ2mhg31DtyNXPmmLKwyeJb1A2mTJ2O6hQK8H5pfVxDF2ryb+sYA/GTyssQAQc4mPR9nMtfMSzgKjdJcdt/AqkPi+CAAS15JQUE95faCO9EIC7w8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HqwQ/rPQquzdarvfs9qLkJcGq/qtWqi5DTRuO4yt0+g=;
 b=l5A1RZ//JtSh99c+y2C4b1RezWg230f51U3DBxR9fNgTL3PgUYAMLisnyP+yUOL8HYlLFN3jKFzUniDj/w4FRWRS19uCqfZ1Ce2NTrcvkj/eGZAQaervJ5QToLjRqobyk2egv3peL0dpQ/GW2GktiaNCdm8XWwemHANWJo1ff1Ndc/EX+17rICO2amc1/riswt9l/aMjL1OB5h8btkJZg1+PQUjAqanLMak+j+JKKDiqyF5FdJutv/eHpSbJm3cxf5+nABNfBGFVt4VR/3viO0qvuoVvSApcKeKpUAzsO2NyBX9JC2+Fug87MEPNHcMXbgkl67/WNY3rHZhIiLhp9Q==
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:110::10)
 by PN2PPF10DD11BE6.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::585) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Wed, 12 Feb
 2025 10:02:01 +0000
Received: from PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde]) by PN0PR01MB9608.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::972:abe8:752:bbde%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 10:02:01 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay
	<kekrby@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH 1/2] HID: hid-appletb-kbd: simplify logic used to switch
 between media and function keys on pressing fn key
Thread-Topic: [PATCH 1/2] HID: hid-appletb-kbd: simplify logic used to switch
 between media and function keys on pressing fn key
Thread-Index: AQHbfTUoyx1vQm+EHkSaO2M+WOzzfA==
Date: Wed, 12 Feb 2025 10:02:01 +0000
Message-ID: <588AFB72-03C9-4EC6-853B-3F4C362B7AA7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0PR01MB9608:EE_|PN2PPF10DD11BE6:EE_
x-ms-office365-filtering-correlation-id: 59b6f5d8-b3fd-4a66-b06e-08dd4b4c4b77
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|15080799006|7092599003|8060799006|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?utf-8?B?eUJLbGgrejVMbHVIdDBQSzU0VEYvUVlBcnhZQjFhS3FaTTU2Zkg1REpsenVI?=
 =?utf-8?B?SmtWVTNMM0h1UHl2amJ2NHVlTm5Dd2VBVjd0QWRjbitWWkpaNXZ2Zm1oWm1y?=
 =?utf-8?B?UG0vVlE1QVVUaEgreWdITklhbzdUYnh0cUphMytnWWZPTmtEMGIvd0R1dzVh?=
 =?utf-8?B?VStXQ2RmRXlnczFVVUdLci9YUGlFd2dEd0J4LzFPUWd6OXJ3cldFUWxvZmtI?=
 =?utf-8?B?cjdVZ1ZIcUZXc00rUUtBOStNWFJlbHFyYVVNelRzdCtZRU5xT29OY0RpUUtW?=
 =?utf-8?B?bWZVT1NBd3lyUytHY0ZqS1dDSnFOWGFqOGQrTlpKRytncFc0R1Rxdk9xSXRM?=
 =?utf-8?B?MmdWZW56dG9KV2d3UE44dSs2ZE1FaHBwM3RaTGVjV1l3ZUNma2Exa0lJanFJ?=
 =?utf-8?B?eTlCdVkveU1Dc1VTMjRUTmZZUWZncTh5UHk5a3hwQWRqUEgxV3crM1BYSmQy?=
 =?utf-8?B?UGl1WXJFRFc5alJ6T0kzcUVZdGtNM1QwWkhTdndsWjV5NEdKeVFGcnAxVDdS?=
 =?utf-8?B?cnpxbWtaWTRZOVFBc2kyR2dTQ3h6S3hBSjhrRnNodkd3bERqTUt3cU9RN0dS?=
 =?utf-8?B?Y0VkalVoZEdPQzE3QlZiRGZqZjFuVitmSFA1MnFOUnloa2phQXgvS1U3WmtB?=
 =?utf-8?B?MUJXTEROOVdRZ0NIRi9JY3JDZjE3aVloVUk1Nnl2U1ZBc3lRQ1d2aFl0RkVE?=
 =?utf-8?B?bEptVkFoRFR6OW5DbXp6K0ZWUUNnbnlRYi9jSEhRV0hydFhGRk9na3FiZGNC?=
 =?utf-8?B?T05lTXZNQSsvcFpxcnBFMVRhaEtkdzdZa0tvY2ZEMWluRFFVT0NTcXp2YWJ3?=
 =?utf-8?B?cVZMUUZESUJwQ3NRaFlQNmwxbXlvdGp4QU55MzVvMyt2RDFFaENUeUE2Smpa?=
 =?utf-8?B?ZTZPcnU1Nys5T3R5Yy9TVW9pUHJIcUIvZE80SUFHcm5ycGQxNzczdmFuU1N0?=
 =?utf-8?B?VnpUelhXODNPMUlId2VOMVBUTlA4RHBrY3E0SjZyeU45eXdJdTA3aWQyZUZp?=
 =?utf-8?B?ZHZ1YmpTUldIRW5jckNtYWRqaTlaTlhHUDhIcEJFVndMY0RJWEc2dm9sazB4?=
 =?utf-8?B?ZlQ3aElLa0NMbzJvZWk2bVJDd2RaTFoxaFB1c0RSNUY1eHVtUGFFSHo4M1VP?=
 =?utf-8?B?aHV2Q3RuRzdma0dlTjB4bDZ5ZmxSbDd3Q1g1VWFTQ2k0eWtDbFc2RWV1TzA5?=
 =?utf-8?B?MlVYamozWTlaYVBxVlArUHFINmJKTVUvOHdQdVBrRmdvLzJDWDFQemp0aUR0?=
 =?utf-8?B?YnpBa3FXOVIzcVpCZlJacytSOUIyU0NxWjB1dC9jWEhmcU5GYVl6S1BMU3Vh?=
 =?utf-8?B?TXBlMWRWS0x6MFFobG5oRFVsdW5MdkYxK1dITVRtTEtYUzAzZ3BLUEZjWi9a?=
 =?utf-8?B?bWxrM1dxVGtlRzVrZGl3d0k4UC96NUQ0ZWJxUUt5U2JwODJEMnROcEhFcDJG?=
 =?utf-8?B?aVZTTnU1ZzkzL1YzRTdBV1g5ejRjdk5tMXExSmFRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dHVUMXl2bmxaQllMR09mazFtMEcvTlBwS1dGek5mQUpWVTBMREtwRnZiaDZT?=
 =?utf-8?B?N2t4VzBsVGhhTmpCODVBT0VvTk9rYXJSL3NsSDl4dEdNSS8yN21TSHlwTnQr?=
 =?utf-8?B?UFBuclo2TWEvRGZzWm8zQ3lMaDl1dXBHOFJWZ2N6Rms2ditTb2V2YlhmeWRz?=
 =?utf-8?B?ZjY5dFFUTzJGMXhZNGFIdkRpU3pCcmdXQ25ZN0FpK0ZERHhKS3A3RGR2V2J5?=
 =?utf-8?B?cHZRK01rVy9SZXZoajVWRm45WVlHbVZrdlUzMzFzamtiYVJKWExmLzlHL3l5?=
 =?utf-8?B?bFhyQ0ZNam0rM1UwYW0zYjh4R0IxRlFoRS9zWHJJQzJSWUNvckp2SGtBcVRB?=
 =?utf-8?B?VnZLQTkySUhtTm5RRUh1Y3FCclMzYmkxTFZ5emFsaHY1TlNwNEEzNDdUQ2Vq?=
 =?utf-8?B?aWZpUkRNMFFyV1R2aEFhenpSZ2NLdEdyaHQ0cHBPaDhMeVc2YzNiQmtFTU1j?=
 =?utf-8?B?bU9rclNJbG52WmZMcG9SYVd2WmdXZ0FVa0s1SXl3YlBBSkJUTU42WmRXcDJG?=
 =?utf-8?B?N1N0bngwQ2o0QUVCeXVUbDR0eHVOcTJpWXBJbytEdkQ0RjBGbnNINGJXaXdU?=
 =?utf-8?B?R1Iyd1licnlvRlpOekJXNjN3cW54bk5UMGdCbWFKQkVzWG5OSy9HVHA0bTh1?=
 =?utf-8?B?NURwNzVNTGlCT1hiSWRuRlRUUDdXdTZIVUJNWk5nMXcxbklwZ21TRnk0Z2dp?=
 =?utf-8?B?ZzUrOHVneVFsYjBocEJPL0Nyc2ZpeHgzb0F1SUZjM2wxOUZNVkQrT3NLZnd0?=
 =?utf-8?B?Um9WalVzZS9sK3lLY2w0b1pmKzkyTEZibnlFc2dsd2NseWZNdlkwMzlSR2Mx?=
 =?utf-8?B?RmczMTRWT3h5eTJwTk5NeEgyaDdCL3lPNVdXcHZYc0l1NVRVeFN2RnVIY0kw?=
 =?utf-8?B?dlU3REZKbDhiSkdPdmo1RlovelZhMXJCTE5Lcm5oRVk2MkEzRFFCK0hmSEJS?=
 =?utf-8?B?cVVsODdkMDRLVGdUdWVWRllqTytib0h1NFJIMlMvMGsrQ2cvME9RUkdpMW5X?=
 =?utf-8?B?dktmYmxyVVVIVm1BSkFOT1Z5UkhnenpKS3RiWjFXWVhBeEdJbWNjK2dKSUli?=
 =?utf-8?B?enNUUWpkNEt5OVF1N3JmaXFzbkJmbkFPVi9BeG1YZFRIaXRseGRkMENNREFq?=
 =?utf-8?B?U2ZBRjFNcHFlZnVVMUcxR282RG1tMGZqRlBLeHBpendtWjBTTEdsMzIzeVNq?=
 =?utf-8?B?TmtnQnE0RDRPdXVaMGNsVlUxQ1JuVDRVczNZdHY5Z1BHMzVrOTM3TzlZRU1J?=
 =?utf-8?B?WVM5dHRDUXRGYjNiWFB4cFBFRDJsVjZrZ1VDcDUrQk54UTdBb01ZdEJRWlh5?=
 =?utf-8?B?NEowc2t5NDFydTdBTkt0T3VNMUIvbzNGbmJaR0ZuM2FXS3VGczZ5Wk5kdHk0?=
 =?utf-8?B?ZThQRzYyWWMxR1hPMHlNTlFjRW9XVXRyK3ptRWJMaGJjaGVnUkJSeGgzWGRG?=
 =?utf-8?B?T20rZTc1dFdCY21sZVhTV0Y1TXl4bnYyL1V0ZGhzd3Iwdy9oUDFacitwcUVu?=
 =?utf-8?B?cHp1U3g3S0lYM3JlY0kxZ2VWU2NqNFNUeS9sK0xGdTNLbUVSN2VoYXZvUSs2?=
 =?utf-8?B?TDJkVThzTGlwUkhiaVpEY004S3NUUXpweUVKL3BLUkZlZ2MzeUp4WHo0cXJ0?=
 =?utf-8?B?d0pCQktyM3hnaEFrNXVrRHZhbFpoWE1RYmwzMlFwQmxCSzFjQVV2bkYzUkZJ?=
 =?utf-8?B?d2hGNWIxTnRqdGVWaHpHQjEzRm9KSmtyOHFzMW5OUDJ2M2ltdlFyYXIxaytU?=
 =?utf-8?Q?ZyluZtZctZpfJK47MSUmN3COHF5RxmmA8v2ggBY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7E5734B7F36DD044A3087F6678381EA5@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b6f5d8-b3fd-4a66-b06e-08dd4b4c4b77
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2025 10:02:01.2198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF10DD11BE6

RnJvbTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCg0KVGhpcyBjb21taXQg
c2ltcGxpZmllcyB0aGUgbG9naWMgaW4gYXBwbGV0Yl9rYmRfaW5wX2V2ZW50IHVzZWQgZm9yDQpz
d2l0Y2hpbmcgYmV0d2VlbiB0aGUgbWVkaWEgYW5kIGZ1bmN0aW9uIGtleXMgb24gcHJlc3Npbmcg
dGhlIGZuIGtleS4NCg0KV2Ugbm93IGFsc28gcHJldmVudCB0b3VjaGluZyB0aGUga2JkLT5zYXZl
ZF9tb2RlIHZhcmlhYmxlIGluIGNhc2UgdGhlIGVzYw0Ka2V5IG9ubHkgbW9kZSBpcyBjaG9zZW4u
DQoNCkEgc21hbGwgY29tbWVudCBzdHlsZSBlcnJvciBoYXMgYWxzbyBiZWVuIGZpeGVkIGFuZCBJ
IGhhdmUgYWRkZWQgbXlzZWxmIHRvDQpNT0RVTEVfQVVUSE9SLg0KDQpTaWduZWQtb2ZmLWJ5OiBB
ZGl0eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KLS0tDQogZHJpdmVycy9oaWQvaGlk
LWFwcGxldGIta2JkLmMgfCAxMyArKysrKysrLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2hp
ZC1hcHBsZXRiLWtiZC5jIGIvZHJpdmVycy9oaWQvaGlkLWFwcGxldGIta2JkLmMNCmluZGV4IDM4
ZmMwZTU4Yy4uYzI0OGNlODI1IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9oaWQvaGlkLWFwcGxldGIt
a2JkLmMNCisrKyBiL2RyaXZlcnMvaGlkL2hpZC1hcHBsZXRiLWtiZC5jDQpAQCAtMjM2LDEzICsy
MzYsMTMgQEAgc3RhdGljIHZvaWQgYXBwbGV0Yl9rYmRfaW5wX2V2ZW50KHN0cnVjdCBpbnB1dF9o
YW5kbGUgKmhhbmRsZSwgdW5zaWduZWQgaW50IHR5cGUNCiANCiAJcmVzZXRfaW5hY3Rpdml0eV90
aW1lcihrYmQpOw0KIA0KLQlpZiAodHlwZSA9PSBFVl9LRVkgJiYgY29kZSA9PSBLRVlfRk4gJiYg
YXBwbGV0Yl90Yl9mbl90b2dnbGUpIHsNCisJaWYgKHR5cGUgPT0gRVZfS0VZICYmIGNvZGUgPT0g
S0VZX0ZOICYmIGFwcGxldGJfdGJfZm5fdG9nZ2xlICYmDQorCQkoa2JkLT5jdXJyZW50X21vZGUg
PT0gQVBQTEVUQl9LQkRfTU9ERV9TUENMIHx8DQorCQkga2JkLT5jdXJyZW50X21vZGUgPT0gQVBQ
TEVUQl9LQkRfTU9ERV9GTikpIHsNCiAJCWlmICh2YWx1ZSA9PSAxKSB7DQogCQkJa2JkLT5zYXZl
ZF9tb2RlID0ga2JkLT5jdXJyZW50X21vZGU7DQotCQkJaWYgKGtiZC0+Y3VycmVudF9tb2RlID09
IEFQUExFVEJfS0JEX01PREVfU1BDTCkNCi0JCQkJYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBB
UFBMRVRCX0tCRF9NT0RFX0ZOKTsNCi0JCQllbHNlIGlmIChrYmQtPmN1cnJlbnRfbW9kZSA9PSBB
UFBMRVRCX0tCRF9NT0RFX0ZOKQ0KLQkJCQlhcHBsZXRiX2tiZF9zZXRfbW9kZShrYmQsIEFQUExF
VEJfS0JEX01PREVfU1BDTCk7DQorCQkJYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBrYmQtPmN1
cnJlbnRfbW9kZSA9PSBBUFBMRVRCX0tCRF9NT0RFX1NQQ0wNCisJCQkJCQk/IEFQUExFVEJfS0JE
X01PREVfRk4gOiBBUFBMRVRCX0tCRF9NT0RFX1NQQ0wpOw0KIAkJfSBlbHNlIGlmICh2YWx1ZSA9
PSAwKSB7DQogCQkJaWYgKGtiZC0+c2F2ZWRfbW9kZSAhPSBrYmQtPmN1cnJlbnRfbW9kZSkNCiAJ
CQkJYXBwbGV0Yl9rYmRfc2V0X21vZGUoa2JkLCBrYmQtPnNhdmVkX21vZGUpOw0KQEAgLTQ5Nywx
MCArNDk3LDExIEBAIHN0YXRpYyBzdHJ1Y3QgaGlkX2RyaXZlciBhcHBsZXRiX2tiZF9oaWRfZHJp
dmVyID0gew0KIH07DQogbW9kdWxlX2hpZF9kcml2ZXIoYXBwbGV0Yl9rYmRfaGlkX2RyaXZlcik7
DQogDQotLyogVGhlIGJhY2tsaWdodCBkcml2ZXIgc2hvdWxkIGJlIGxvYWRlZCBiZWZvcmUgdGhl
IGtleWJvYXJkIGRyaXZlciBpcyBpbml0aWFsaXNlZCovDQorLyogVGhlIGJhY2tsaWdodCBkcml2
ZXIgc2hvdWxkIGJlIGxvYWRlZCBiZWZvcmUgdGhlIGtleWJvYXJkIGRyaXZlciBpcyBpbml0aWFs
aXNlZCAqLw0KIE1PRFVMRV9TT0ZUREVQKCJwcmU6IGhpZF9hcHBsZXRiX2JsIik7DQogDQogTU9E
VUxFX0FVVEhPUigiUm9uYWxkIFRzY2hhbMOkciIpOw0KIE1PRFVMRV9BVVRIT1IoIktlcmVtIEth
cmFiYXkgPGtla3JieUBnbWFpbC5jb20+Iik7DQorTU9EVUxFX0FVVEhPUigiQWRpdHlhIEdhcmcg
PGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4iKTsNCiBNT0RVTEVfREVTQ1JJUFRJT04oIk1hY0Jvb2tQ
cm8gVG91Y2ggQmFyIEtleWJvYXJkIE1vZGUgRHJpdmVyIik7DQogTU9EVUxFX0xJQ0VOU0UoIkdQ
TCIpOw0KLS0gDQoyLjM5LjUgKEFwcGxlIEdpdC0xNTQpDQoNCg==

