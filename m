Return-Path: <linux-input+bounces-12137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 249DDAA845A
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 08:40:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F1B9179076
	for <lists+linux-input@lfdr.de>; Sun,  4 May 2025 06:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E078B450F2;
	Sun,  4 May 2025 06:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="EMR/oqTG"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010010.outbound.protection.outlook.com [52.103.68.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DE34A29
	for <linux-input@vger.kernel.org>; Sun,  4 May 2025 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746340837; cv=fail; b=kkxeMmnPr11UctejavL9byj2UgLDRFpmGHE0/I68vO0/JAHfYWb3R4UKehQbU/0BTENzGH1LwUurL89GU9BpLmWSk16dBtgfmM7DGsUZ29teLnRR6/VYE/lvQILw8FJDZoYhViKBlLriR4Z+X5ua91rdncEPzCQaPn1I3t41/lg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746340837; c=relaxed/simple;
	bh=Ncgbw0bD+G9toh8kna/6/Lm6++QjowtKaSuis4GBXN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EQHkoICY9X13nG10Y0QbucsXIJcicsKrBJmpL727bKbTHrxMmkh0GEikeGvhD98ilhZDFVs7yd4QDIrz8iTc3YI2wDT/5fLeXo33f4/35DRJJDa60JtyWH91gdoiYWj6bv8PYKdnDfNbiWbnxeZzeZlbzu0cgNJV84/MsNVEBNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=EMR/oqTG; arc=fail smtp.client-ip=52.103.68.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IVaKDxrxRty8UFq7+lxp0cFoCzyTjpZushGiGT4ou/gSlRJ+SIA533/Rz4+Ghy+sqE2S350bY4ELujpebY0IeFXcmDRyDbXpWIx1UdtdoMT7hLwD6w7NHCD9GqMer65HOEFmOq+wW/LOZuxKTwGqy/LC53WguZSbxZ93dfk3NVFBWzhUn6ItKEr3cl8pogQtMqdQskTuS1KXfkuKxQmxI6o/qStYuiu8zFdIezAIp2D9/A/QtkqWymTRh4+KlZvdkgc9NlcckdPGRSrPt8MfOf9dhtMxhWv9CYMoi52akTtTUUi10cTNb4hPMBPJqQA3kEci9x35eIBeEtfS34vWAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncgbw0bD+G9toh8kna/6/Lm6++QjowtKaSuis4GBXN8=;
 b=KiZF3LJloLQneVNJnxu+J+aWCvbLEealZSICM5hZSDvR2wYDgvBn4zgitvFdwaCLjl3cMid2mrWV3XaLrvJdmrtIBM96UqbXFtTo8O5FJMvK5KKd0tWx5QaJ+yzlWSkXJAc5pKumsaRCcNt8gpsdR1mS1KKSqEijFSVAWunt9NyI5wrvhQIOuSIBToxLM6DHIlQU8yVKr14nCr3ol1fty5bMg4A6s2F+Oop+L9WH1ibGhb1s62EiJ3G5HElUzAckHCirb1qqYFprfJ7RpxGcwtMTAAon3tFvU1IWDGn1iTmLIJ1OBwjxD07qo8ES1KOL4G7197wZ6mYv8wOodroQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncgbw0bD+G9toh8kna/6/Lm6++QjowtKaSuis4GBXN8=;
 b=EMR/oqTGQkm5Wo6nPN6wiVXJKpS3o5ngQ9154ncq6pjmoAN0RjFphP24HS5nfEGNk/TIYJEyUYbe/dyTQzshrqLw+SvxQ2CZG5DvP90nm4VyZOW6gGj+SJNjR4FUSBeVTwGMGW23lcvXp06yO117yYxrT4qQU3B5fyMe4oB2EXRahJMrCmSsSnq7Jl76WmTxzi/EG2uZ68SCITGxOnXr1rozjGnwBsCfClHoCjOMlZ2pgKuNjAzU/uje6kUXgusrwEEuyq6cpyteFtfFXpKV+7PqqKLIl5r/2ycMpe0Bg1dp03hynY+6UzW0ikVYy5rK1HkedNrQIinBj352nxjecA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5693.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:61::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Sun, 4 May
 2025 06:40:30 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8699.019; Sun, 4 May 2025
 06:40:29 +0000
From: Aditya Garg <gargaditya08@live.com>
To: chitaotao <chotaotao1qaz2wsx@gmail.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
Thread-Topic: PROBLEM: Touchpad (PNP: TOS01f6 PNP0f13) not working under PS/2,
 requires psmouse.synaptics_intertouch=1 to function via SMBus
Thread-Index: AQHbvL9tb4xu7L4AokyuYyR3MGIM7w==
Date: Sun, 4 May 2025 06:40:29 +0000
Message-ID: <5AD8B559-C74D-4CA2-8145-7CEADA09AD36@live.com>
References: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
In-Reply-To: <c596f96b-035f-44df-952d-6b4c43bd69df@gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB5693:EE_
x-ms-office365-filtering-correlation-id: a422c04f-e1e1-4ef1-7bdc-08dd8ad68fd9
x-ms-exchange-slblob-mailprops:
 qdrM8TqeFBu6m38okHpoNWln7NSyvc1V5G7KW6mn5+xNGF+Nx/7Lk5gPTnbU/ZsRpNvEKxV8cOGBHrgipGJtTteOzu2I5EdS0WtqV8cWolkHgAkNyUrzd7Xnpsl/S8UlUzn4+af4QG43BUEEWhlsECSAOu99onSUmhu55KpPbycSVDtSOhkvFxJr0QqIus/LLruEPfsvg2NEl5XqHcIL0rXr3LnrchZgXUbIcAqJyZc68KpwcpzOEb6JMihPVULSTkorch18UcXe4GzHag4mOpOM5YOqdlEznqS4Fj18IfdSBRaRcSHBIZMMF7DB/DGNB2HIk1FWReSThSVzDzWy6ApqpiVQMIOF7VlHHPyiwKiBAF0cup85JWPbscFVPN/c/MvmiGx1fOQewHulJaDMkM6Zds4qd3FwuIVr45oOSBs6Th0kH5T2jUiDfbc8bFlNyWBsw6nd38woRIGtq/QCSyx8yLzZX5vKJzko77g9P9VChZAThanUCzzaQE1HfeyAYwoakhkx7eo6OOYemY5pXUCmmwe/JWf0pkt0tCKpP83U75tPvc5tXJUkepQuXuQ8WPSin4Cxmryh/n1t+uXwMySaQlQEhlc50kGrSSum32zjxjm9THYnyQ+bD1EmfQK8RzxPdJ77H6kyisXjnWPg/oYKWpx8ewc+KMFLbnAnkDuJigPx8AsgFmkgEN/WvVZcjO/vs8lmuijZmXIos//I5vEZgqcDtvB25mwdl9hSiW98fjd68VM0QKktUT4qt+iV0CeBPUXgd2ZWfB9YaUH64deciJnZqRSM
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799006|7092599003|8060799006|8062599003|19110799003|10035399004|102099032|3412199025|440099028|34005399003;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZHoyT3U2TGdseUp2cXROV2hSZkdna2lrMWJVNG4zRWY2M0I3WjVFem4zbFNK?=
 =?utf-8?B?aDA5UUI3WFlhbFMwQnVrdzhFVzFXb1RteHB0SG9waU1TZ3JPT3ZiQWs3eUhQ?=
 =?utf-8?B?ZWlzamUvL0I1SXhIWmxKdTVJZ254cWVJdUNBc1ZxdTBXOTZSMkhPcGErVWZs?=
 =?utf-8?B?Mk9lZkNNRXpYcGs3NUl5OFJBd29mdHByNGNpRis2UFdEZnBwdERSay9qcFFG?=
 =?utf-8?B?TlgxYkhXM3Nib0M0bUJvcFdkbjZLTHVNWCsrTTZyY1N4SEU1L2lKR29VR0pP?=
 =?utf-8?B?OUh2WHlOSjRqbnZEY3RpR21zdXlSaG03bFpWcGxnR29SalRwYUx3UE1Zd2g2?=
 =?utf-8?B?c0xxd29EZVM3UUIxdmdseHpFQk5ETm03NE95SjNBVk1ERERoQXo0emV5ZVJB?=
 =?utf-8?B?STdjMVJhQmsrRUxFRXI4b2lMYWZLc2lHSWdVZlBUOTFNZ0tPdTBZU0xVSEFF?=
 =?utf-8?B?UjFScG5McWhjWm5xYUFDdEJVYVZVVzZvdFN1aGJ0QlZHQXkySEFDeE90ME9k?=
 =?utf-8?B?ejVDQit6bHVwMFp4S3BuVUh2N2xmYzN2VjZCTU5SYlBZL2JZcHZvMXdIeWFB?=
 =?utf-8?B?K1lPcUJSeFZqZ0RWSlJZTVd5cW83TFl3enFtdVNzT3FhblZXbWU0bnJyT1k1?=
 =?utf-8?B?cjBPMVdLcE4zcjEyUTFwbGJ5OUhMNDJPMHd6cStscEY5aTFpWFl4NzlqSzJv?=
 =?utf-8?B?NkRNejR2T0I0bFFQckxVMW5ORVZRZlRrajFqLzRuRUkyYTVPREd4WjQ1RUJy?=
 =?utf-8?B?byt6RE1VWDJjYUlzd01pSEl4S1FrSC83bWVVNkhGbCtQTVBKa0Iya3NuT2hx?=
 =?utf-8?B?YnpyTFRPbENMNENLN0hRbGVpTkwycGtxTE9PQmJWYlhoeVR3bWlmZjlLQVZS?=
 =?utf-8?B?VjZISUUvVmZGRTVtVWIrM0xnSFVmWXQ5SjFpcUJMTnpDaE53M2pqeHBJMk93?=
 =?utf-8?B?QTNSc3hWcFV1bDNGUVJEeGhVTU5nMEFadnpYUUJnVmZFZ3FzUHhrMkd2MFZD?=
 =?utf-8?B?SDZKS2UxWW0rakRXWmpnRFJteVBzSnlNb2dZY0hMcUJqQ25kWWtqTjJUbXZT?=
 =?utf-8?B?NEVHWmhQWkVQQk02MG9RV2NrWlBnOTEzVkUvSEVKSnFtVldrdEt0ZXNJTFdT?=
 =?utf-8?B?ZGcyMitQd0dPc3VFdzl0NnVMbFZURXNodHpVR2x4MElkbGhrK3E1bzNqU2RZ?=
 =?utf-8?B?TFozZEFYc3Z6enZ4bEJZek93eFd4eFl6T0pXMEpxclVrc2g0amY5VDJyNnIy?=
 =?utf-8?B?enVVbW1iS20rVTBpQmQvNXI5THo4aEgySlI2NlB0L2JiS3g3ZnN1VEJ6ZWJn?=
 =?utf-8?B?TnIzTmNYODBtNzRNeUtRemdQSHdNQWsvMFhyc0RnWlF6bGRBRW0zVEZob3BN?=
 =?utf-8?B?VkZHR1QvS3J2VU12R1FVUGdpeTRTRUNmMm9JLy9vUk9HQlI3WVlpeGJpeGNv?=
 =?utf-8?B?ajcwcm9JQUNGVGZQRFBLbXhON3dlNlhuaWpxM1NhanFodnRNcHlRbW1hRnM4?=
 =?utf-8?B?SjIwK1N4aXBxQysxVzU3VVdxcjVFUzhSSGZpa1hvSmlOTzd5VlNkUEs4QWhU?=
 =?utf-8?Q?tc57cWyGzDmkl+7tjWZmCgt4Gxigg7zsGl7OPMOZqsw5SU?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Q29jSmNkM2R5dXA0d0ZueGRCU0FqRENMNm5XM3JlQnB4QnFUa0ZJVlV1U2Jr?=
 =?utf-8?B?RXJ5UXBFVDI2QWlLcDJtM0RpN3RaNWFtdTZsSkFETDI1Nit2M2g3cXFJZzdm?=
 =?utf-8?B?NWx4UFZyVjNJRitNUThMNXVsM1A3b3d2Rm5qQ3NEeDBMVnlpck1tM1pMbVhE?=
 =?utf-8?B?Q1g1dXBPbU5CYnZVNlFybzVoR01pd092YzBrUkVtYU9RejRDbW42RjhMVGtQ?=
 =?utf-8?B?RXNDWVc3aVVEVVlObDd1djkzSnhpN0lqdmlRM0I5bmtZaUdoT29WZ2JRVkwr?=
 =?utf-8?B?R1VLMmhXZGhQVzUxVlk3cTR0QmloS2RxMytNTXozcWkxS09Xb2FJckw3UDQv?=
 =?utf-8?B?RlN4a3JMV3pxaFRicExzdEFIMDFuUFJZbXN1bUJ1VVVXVjIwZDRFWXE3VkxP?=
 =?utf-8?B?b0ZXM1Jqc3VDMFdESzd5b1dQNURkc21MMXg5U1ZrOU9yWVF2WXJ0RHBsWlJs?=
 =?utf-8?B?WSs2b3hSbmZ5T2VJZnZHY280dnV3QlFycUVPNm0yK09SVGpxOURDZ3ZTNkJx?=
 =?utf-8?B?SCt4Q3RRMmMwTXFtRzgrTWdwTzg2TDUvZHBIcGlQbnV3WEZSN0JBNFJDR2ti?=
 =?utf-8?B?UmczRURkeHJPNDZPWkczeEJhZVV6SVFobm5iVkhVaWltZkxsRkpFRFpGb3Fx?=
 =?utf-8?B?OWdMYjNtTW5SV21zd2t6eDVIdEYyL0tBbS8xNjNjWk1LckR6VXJBbVR2RUFN?=
 =?utf-8?B?SmpTblU2MVczeUlxYVBacGFSZkc5eWxIYTRwSTU0ckJCbVNtbUVVUXJBaEhY?=
 =?utf-8?B?VHZZNzdKejdwcnV2Q1NManVnckxkN3ExVzFlTnRNMDFrT0pWVEFVVmN5VDZv?=
 =?utf-8?B?QmVDcnlrK0xpakg2eVJOeWk1V0RwWkhBblEwTjQyWHRoNWRONHBrTVNxZVNr?=
 =?utf-8?B?K3ppRG5yV2NwOW8wWENKWUFXS2pwWVNWdVdpczJTVnFmU3ZXTllxSHZ2dkI4?=
 =?utf-8?B?K215bVZFRHdNY3c4aGZxWVpuOFFSSTJmcmF1WE5Yc01iMDN0RnhvSXROTDRG?=
 =?utf-8?B?S2lsaFlmcDF6eVYvN0VIVnZvYTBNQ0V6NzJMM3pwTXhxZ1ZtVStzS1kvTVFl?=
 =?utf-8?B?T0RaUmdwTW82R0tvNEZIVTZoUURKWlhXVlJ4VnBRdmE0TzRaNkVZcXd5dzN0?=
 =?utf-8?B?V21nTm5MQyszNi9nTDJsK2VzMFUwSjhUenF1TW9iVjlkeGYwNmI1S1QybEZD?=
 =?utf-8?B?RVY2bDdJRGd0SlhNMFhLckJEaUNDOTB4aE9hNjdiQTRFNjRBampJR3dlR0tB?=
 =?utf-8?B?NUJuQkg0VkljSnRNN09lZzcyQmJIazNVUCtYYURoa2I1Z2tQR3NScVVXYkR0?=
 =?utf-8?B?UDU3UHhxWGM3T2hqd0NtYlhUbEtxd2hYcnFQOTRKQkdYYndPUjI2MmFuSjBl?=
 =?utf-8?B?eEhpMEJsQm43M21QTEh2WWFYa1pZM0JvcllaOXBuWCtHTlRicnpZM2kxN0Rq?=
 =?utf-8?B?U21XQ0dqYlFBQ1BJS3BYMnF6SUNOdkdaaDlqMFFkd2dpcWppd0JKWVpTUXg5?=
 =?utf-8?B?dmFrSFA2MWg5VkZ3Q21xYVpjUUllUHkwdm9zWllDVU9VR2FIYUg3RWxuSEx2?=
 =?utf-8?B?ZWR0NFBVSmFpYUNRVGpuSHI0NHAwb1RZWGVmOGZaZ2loTjdjRUI0dmsyK3A4?=
 =?utf-8?B?SDZMbEYrb29lRUFDRkNod0ZhcjFJN1NXK0RjT0x5VlhpeCsrcU5qb2FudS9D?=
 =?utf-8?B?cWJPb2hjSDlTNWRYTndkanR2djAwd0d5OE5uRXJDc092NkdINmVpaU0wZEsw?=
 =?utf-8?Q?aIm+PCsgEX1Ke8P/wkLJTEtEaj1D4w9OHsEhGNt?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <961838C806CE7D4B8E4C667E16721F3F@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a422c04f-e1e1-4ef1-7bdc-08dd8ad68fd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2025 06:40:29.7400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5693

SGkNCg0KPiBPbiAyNCBNYXIgMjAyNSwgYXQgMTA6MTHigK9BTSwgY2hpdGFvdGFvIDxjaG90YW90
YW8xcWF6MndzeEBnbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gWzEuXSBPbmUgbGluZSBzdW1tYXJ5
Og0KPiANCj4gVG91Y2hwYWQgbWFsZnVuY3Rpb25zIHVuZGVyIFBTLzI7IHJlcXVpcmVzIHBzbW91
c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MSB0byBzd2l0Y2ggdG8gU01CdXMuDQo+IA0KPiBbMi5d
IEZ1bGwgZGVzY3JpcHRpb246DQo+IA0KPiBLZXJuZWwgbG9nIHdhcm5zOiAiWW91ciB0b3VjaHBh
ZCAoUE5QOiBUT1MwMWY2IFBOUDBmMTMpIHNheXMgaXQgY2FuIHN1cHBvcnQgYSBkaWZmZXJlbnQg
YnVzLiBJZiBpMmMtaGlkIGFuZCBoaWQtcm1pIGFyZSBub3QgdXNlZCwgeW91IG1pZ2h0IHdhbnQg
dG8gdHJ5IHNldHRpbmcgcHNtb3VzZS5zeW5hcHRpY3NfaW50ZXJ0b3VjaCB0byAxLi4uIi4NCj4g
S2VybmVsIGxvZyBjb250YWlucyBhIGxvdCBvZiAibG9zdCBzeW5jIGF0IGJ5dGUgeCIgYW5kICJp
c3N1aW5nIHJlY29ubmVjdCByZXF1ZXN0Ig0KPiBUb3VjaHBhZCBpcyB1bnJlc3BvbnNpdmUgYW5k
IG9ubHkgcmVjb2duaXppbmcgaW5wdXQgaW50ZXJtaXR0ZW50bHkgdW5kZXIgUFMvMi4gU2V0dGlu
ZyBwc21vdXNlLnN5bmFwdGljc19pbnRlcnRvdWNoPTEgcmVzb2x2ZXMgdGhlIGlzc3VlLg0KPiBU
b3VjaHBhZCBpcyBmcm9tIGxhcHRvcCBkeW5hYm9vayBHODMvRlIuIERtZXNnIGxvZyBhdCB0aGUg
ZW5kLg0KPiANCj4gDQo+IFszLl0gS2V5d29yZHM6DQo+IA0KPiBwc21vdXNlLCBoaWQtcm1pLCBp
MmMtaGlkLCB0b3VjaHBhZCwgU01CdXMsIHN5bmFwdGljc19pbnRlcnRvdWNoDQo+IA0KPiBbNC5d
IEtlcm5lbCB2ZXJzaW9uOg0KPiANCj4gTGludXggdmVyc2lvbiA2LjE0LjAtMDYxNDAwcmM3LWdl
bmVyaWMgKGtlcm5lbEBrYXRobGVlbikgKHg4Nl82NC1saW51eC1nbnUtZ2NjLTE0IChVYnVudHUg
MTQuMi4wLTR1YnVudHUyKSAxNC4yLjAsIEdOVSBsZCAoR05VIEJpbnV0aWxzIGZvciBVYnVudHUp
IDIuNDMuMSkgIzIwMjUwMzE3MDA0MCBTTVAgUFJFRU1QVF9EWU5BTUlDIE1vbiBNYXIgMTcgMDE6
MTE6MTMgVVRDIDIwMjUNCj4gDQo+IFs2Ll0gUmVwcm9kdWN0aW9uOg0KPiANCj4gQm9vdCB3aXRo
b3V0IHBzbW91c2Uuc3luYXB0aWNzX2ludGVydG91Y2g9MS4NCj4gT2JzZXJ2ZSB0b3VjaHBhZCBp
c3N1ZXMuDQo+IENoZWNrIGRtZXNnIGZvciB0aGUgYnVzIHdhcm5pbmcuDQo+IA0KPiBbNy5dIEVu
dmlyb25tZW50Og0KPiANCj4gWzcuMV0gU29mdHdhcmU6DQo+IA0KPiBJZiBzb21lIGZpZWxkcyBh
cmUgZW1wdHkgb3IgbG9vayB1bnVzdWFsIHlvdSBtYXkgaGF2ZSBhbiBvbGQgdmVyc2lvbi4NCj4g
Q29tcGFyZSB0byB0aGUgY3VycmVudCBtaW5pbWFsIHJlcXVpcmVtZW50cyBpbiBEb2N1bWVudGF0
aW9uL0NoYW5nZXMuDQo+IA0KPiBMaW51eCBDSEktVS1XSSA2LjE0LjAtMDYxNDAwcmM3LWdlbmVy
aWMgIzIwMjUwMzE3MDA0MCBTTVAgUFJFRU1QVF9EWU5BTUlDIE1vbiBNYXIgMTcgMDE6MTE6MTMg
VVRDIDIwMjUgeDg2XzY0IHg4Nl82NCB4ODZfNjQgR05VL0xpbnV4DQo+IA0KDQpGb3IgeW91ciBk
ZXZpY2UsIGNhbiB5b3UgcGxlYXNlIHRlc3QgdGhpcyBwYXRjaCBhbmQgc2VlIGlmIGl0IHdvcmtz
Pw0KDQotLS0tLT44LS0tLQ0KDQpGcm9tIGU3OWYyODA2YzY2NjE1MjI2YmE4ZGQ1NTIyN2I0NTYx
ODY1MzBiOGIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxDQpGcm9tOiBBZGl0eWEgR2FyZyA8Z2Fy
Z2FkaXR5YTA4QGxpdmUuY29tPg0KRGF0ZTogU3VuLCA0IE1heSAyMDI1IDExOjQ4OjU0ICswNTMw
DQpTdWJqZWN0OiBbUEFUQ0hdIFVwZGF0ZSBzeW5hcHRpY3MuYw0KDQotLS0NCiBkcml2ZXJzL2lu
cHV0L21vdXNlL3N5bmFwdGljcy5jIHwgMSArDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L21vdXNlL3N5bmFwdGljcy5jIGIvZHJp
dmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYw0KaW5kZXggMzA5YzM2MGFhYjU1OTcuLjAwOGE1
NjJhYWQ3Y2Q4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYw0K
KysrIGIvZHJpdmVycy9pbnB1dC9tb3VzZS9zeW5hcHRpY3MuYw0KQEAgLTE5NSw2ICsxOTUsNyBA
QCBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IHNtYnVzX3BucF9pZHNbXSA9IHsNCiAJIlNZTjMy
MjEiLCAvKiBIUCAxNS1heTAwMCAqLw0KIAkiU1lOMzIzZCIsIC8qIEhQIFNwZWN0cmUgWDM2MCAx
My13MDEzZHggKi8NCiAJIlNZTjMyNTciLCAvKiBIUCBFbnZ5IDEzLWFkMTA1bmcgKi8NCisJIlRP
UzAxZjYiLA0KIAlOVUxMDQogfTsNCiAjZW5kaWYNCg0KLS0tLS0tLS0tLS0tLQ0KDQpZb3UgY2Fu
IGFsc28gZG93bmxvYWQgdGhlIHBhdGNoIGZyb206IGh0dHBzOi8vZ2l0aHViLmNvbS9BZGl0eWFH
YXJnOC9saW51eC9jb21taXQvZTc5ZjI4MDZjNjY2MTUyMjZiYThkZDU1MjI3YjQ1NjE4NjUzMGI4
Yi5wYXRjaA0KDQpBbHNvLCBwbGVhc2Ugc2hhcmUgeW91ciBsYXB0b3DigJlzIG1vZGVsIChFZzog
SFAgRW52eSAxMy1hZDEwNW5nKQ0KDQpJZiB5b3Ugd2FudCB0byBiZSBjcmVkaXRlZCBmb3IgeW91
ciByZXBvcnQgd2hlbiBJIHN1Ym1pdCBhIGZpeCwgcGxlYXNlIHNoYXJlIHlvdXIgZnVsbCBsZWdh
bCBuYW1lIGFuZCBlbWFpbCBhcyB3ZWxsLg0KDQpUaGFua3MNCkFkaXR5YQ==

