Return-Path: <linux-input+bounces-3137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E258AB50C
	for <lists+linux-input@lfdr.de>; Fri, 19 Apr 2024 20:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 57385280FC3
	for <lists+linux-input@lfdr.de>; Fri, 19 Apr 2024 18:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30C5713C904;
	Fri, 19 Apr 2024 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="qvNJhiYn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="THnlPQoF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A7F13C679;
	Fri, 19 Apr 2024 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713551212; cv=fail; b=N7uAwGsVP2WWbBocc0s3Ohc5CjkxsgjRHClpblfn0m4vMUWWnpe9yURQ2rDy4w0TeWnwzzCyslflqb4pohuk2zN7CVHPaB5xNkjK13Iak0sgcuJqTuo52nedWdx/3kWqfy/Lkv0RAI0CzLxGZa1pDXoGcktDaGsUT7lu06L1kFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713551212; c=relaxed/simple;
	bh=wdT2j2D/Zq3XW9yZuMBzmgbaBJCLP25CCnY53CvSz9c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fY2W6dRCAfnipC4i7vPIRB8xg4DNZ/QUDD5kz5clof0Pqm6OUVBD+d3d9/84xYw/z+Fp9bErDukfIf9DjCXvSqRNVZiRFWTjqwVgHuUFw+W6VNHeIESdXBrTTWe0hOJ97yMaPXDgjcbW1CGgV5mlFWa6XSJprPs13O0o4sv+Zi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=qvNJhiYn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=THnlPQoF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43J8MUB3008961;
	Fri, 19 Apr 2024 13:26:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=wdT2j2D/Zq3XW9yZuMBzmgbaBJCLP25CCnY53CvSz
	9c=; b=qvNJhiYncDByl6WkF8x/avoCAuo494yrGGfgBiVGuE2o/9lKbJM3ZJrqg
	QQsl53pHjuERWIyl4GAswewbuvwqZQORTcxUslwppQkWAay8kRRaWA2fRguBhN6r
	DcmtrEltdZTNm5kUdJ+q7yVJ8ZWT8ZmQ9ktSI9JDwyREsydc0n3KurQXP9X/pzqQ
	Sz5LQyiRf6tDiJFD8Jh8N8+DHbYHCOEybvj1R7Zr33Uh5Qu1VIt/l1hPCq0+ZmQ+
	Wi1+kS8daqOjH/oOeqp5kQSKxLqYgaFJmhrQyGMUlG/IA6GeYSyR4/HQihNkukrk
	hqIN5sasg1OImkxduTMDnYXhAG9SA==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3xfpfhx3m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 13:26:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnIsNzSwe9hqIwi1BbuQSVpU1+zo7l4XK6yoH0mGdtQp0NDmwJp8h7iocMde2JjUEC63AQY2Y/MClQA8TxqUW+rDsJ5XJwqpELaPowQA46wS3pc/0SbXFCD33qvEyvh34vNTvr6ofx+zuTpO/18yDh5ZqY/QJfsihi06dseiR/657mJFIgva751xEytyWLLDShNHrDvclFoa0t/el7ylGPsFuqPvCwJgnHXjxDmmGTErQ0wDov12Q+m9IViYK3zM4pysGOvlimrfT5dSFTB7Qn7PYpTmoqsGPzjntCkhrEqLOPwJTs6lQpJ2nq3ZkP4W3Nl1uF6W28NkOYg5PMtALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdT2j2D/Zq3XW9yZuMBzmgbaBJCLP25CCnY53CvSz9c=;
 b=BKafVKBeefbQId9qy7VmX9gjc7CzI17rMcb+CZyKd9VT2fH5CZdMqy+Cn3f7rYljJYnho71HY5sS/BkS2rlqhZXZ+KCsNO9dtCb7exUaIshL8mfxzPgEW33WT7ibj2mPKfgU31iWtNNUqGgS/97QhU6n+6oSFIi0N7IzLFXCH3b3qsB6HWQ+lYgsij6dAZ729av2AOdWNCXgE1z0U4yIe9z2UQTWeRfNqZuL9Pf1G4xwkymjUD6CUz8qLgCg0besK9aww6JtqbYJpdj6PAI09hkmsbsbj0SjDye4hEMBRYLxdInt64wh5qLR5Hlleoi4kDiUmpt9yKIsZMBftedehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdT2j2D/Zq3XW9yZuMBzmgbaBJCLP25CCnY53CvSz9c=;
 b=THnlPQoFE/i1g06Rw5/O9RODvoU1fRyU5ovI9yhPb0TTqXzKq923bOlfG6OGe9ieNXGDr0TV9PYl8qWETHwSFIxRUIjoQfug7/OySEpahaubYAzx1C+CXRGLNP6j8am+glG3V8jJ0if7Qu2atGpnZUA3Qhar5kHSi7VxbgDx4SQ=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 SJ0PR19MB5397.namprd19.prod.outlook.com (2603:10b6:a03:3d0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.42; Fri, 19 Apr
 2024 18:26:33 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::8329:dcb9:4d7c:df1a%2]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 18:26:32 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>,
        Mark Brown <broonie@kernel.org>, Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>,
        "open list:INPUT (KEYBOARD,
 MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Topic: [PATCH RESEND v10 4/5] Input: cs40l50 - Add support for the
 CS40L50 haptic driver
Thread-Index: AQHaicn9EuAYDNhWQkWTae4PPhg13bFrl+gAgARirwA=
Date: Fri, 19 Apr 2024 18:26:32 +0000
Message-ID: <A0925B5F-F8D0-4270-B510-385FE4A38F84@cirrus.com>
References: <20240408153214.42368-1-jogletre@opensource.cirrus.com>
 <20240408153214.42368-5-jogletre@opensource.cirrus.com>
 <Zh8JimSH4cFZsy3o@google.com>
In-Reply-To: <Zh8JimSH4cFZsy3o@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|SJ0PR19MB5397:EE_
x-ms-office365-filtering-correlation-id: 7e2e1f0e-2348-403d-6b41-08dc609e3d2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 =?utf-8?B?K216dzluOTl0OEdtNXl3SXluZkh3MVEvZ0pUbTdSS3hyS2xwaHVhQVhnVlJX?=
 =?utf-8?B?VnhzZE9HSlIwWDZENlRaZUsrc2MrdXIzbk1FOHJTUVlCMVZuWVRaYVRySENj?=
 =?utf-8?B?SXdCOHJPVDJOM2ExMjBJVVM0emg5Mlo3cEM2dUQ0dW0zYTBDWUNvRmVHeVpq?=
 =?utf-8?B?N3h3K284UFBsVU5JaFh0M2I1L1paZnJMS2FFeXB3QlVvakJVVDRsVTNxbmhN?=
 =?utf-8?B?c2wxdFFLZWxkRnp3Njd5NTc2ZGNZUmtxMDhxb1JEaGFERWxjc0RYSS90T2Nu?=
 =?utf-8?B?aDNYN0I4QlE3cnA1YUR0L2NkZWcyWVJRYUJKTHViUUxwOER5WFlYSmtPYmdF?=
 =?utf-8?B?eW5qbkFmNHlZbFRJS2psRHNjeGpVN0Rpa214NEV6cGYzNzF5WEJmZ0hzclVt?=
 =?utf-8?B?cVZJekRldy96UVRCT0d5MXEwa2l5S2FXYXJhOXF1QkhoR1NtTjZvWkpORGdq?=
 =?utf-8?B?SzNHK2cyTTQzY0xOYVNpYk1lQkxaZm1EWFVTU3ZpMVVsZUwxM25CMnRScExP?=
 =?utf-8?B?bm5XWlpPTDVNS0x1cHR5eWtUdXg1L0c3aThla0M4aWEvV1hVa2lub2s5N3Js?=
 =?utf-8?B?THJwV2lTUkMrL0xUMkVBTXVMSFJyZ09sUkcrS0R6VWZuNWVlRnlBR09mUDhT?=
 =?utf-8?B?ZkxzZndSSkFSMlF3ZkZJM1U5SG15cjQxOXpXWmZ0NlVqSUROSTliMU1aU0R1?=
 =?utf-8?B?eW4vTzVoOTdRSmMvWkhLbmorT1pSWVJmZmhDa1Uvb1oycm5ITll3Rm5jc1hK?=
 =?utf-8?B?RitFM2U5U3IvVVI1YlJGUmVYZDBUNytyVk5GS2lpQ3dFQUg5QzIxK1pLK0dt?=
 =?utf-8?B?cTBjL1NYUUpCQjhFdkdWSmhnWjRDbTVudHBYOHdzWU9LRHpWalFTNW5RWEVa?=
 =?utf-8?B?VGlvNzFwYU8rTDAwQXcxdURvWWFLVkdmTmx4QVBaeHI0YnhqN2VlY3lLR3hs?=
 =?utf-8?B?RUxpY0Z3NHF4TC9USE41WGVjNTc1V2dMcFYyTnF6TmpEQnZyd1U1WWtDc1Ry?=
 =?utf-8?B?MzJVQ2laNHpuWXRZMDIvTHAxK1BpbDJRT2NpOWYwMXF4cVI4NnE2N2tZMlB4?=
 =?utf-8?B?Z3B1c09BMVpDOTE4QVFjSTdaZ0ZyaFNncXRVSURqRlJwYTFQekFNdzV0RmpJ?=
 =?utf-8?B?dEM4U3pLVjMzeTlheU43TnlZOVlXVXdyZXIxLzFFdStvaGdFY2xOd0RiazBW?=
 =?utf-8?B?djd0OFhiT0JqdHpuWVQvMUJDL0ZtY3V1eDVyUTg4d3JzRFpleEtLUDd6SzlY?=
 =?utf-8?B?RlRuM3EvU0FJSU1HTVpVUnNpSWo2Zy8yNGNualBBajYvNjB2VVJIb1JINWQy?=
 =?utf-8?B?bFNtQU52WjhVanlFVmUrRmRpQjFuZGRyQ3p2V1ZpRWk5aTZITEdoSFRuTDJC?=
 =?utf-8?B?RHcyQVZFeERNRkprMHAxdC9WQlZvRjVPT1RXSWExNDQwK095bDkreFMwSWQ3?=
 =?utf-8?B?c0NOK0MwektQbEZFdTJXT253bXFISVpFY09qYjhCcEQwaEE0enNzRnNZak85?=
 =?utf-8?B?aFhvN0ltWm9EQlNuSWdselBXWVM2YWFxNFRkekRqNzlUclhYSXcxQkp2MWJm?=
 =?utf-8?B?OUJYMTRnemF6YWxiNWJwd2I1ajEzbXcvRjU1T1JqSkpuVTQ1VFRHMDdTQXVQ?=
 =?utf-8?B?V1hsbmF4RTd6NGNyUXV3TGU4NG9oOElvWFZXWHZoS3poUTRGUHZwc1M3Qmhp?=
 =?utf-8?B?UjlKV3dSeXV4ZWZzWVk0dWgzd0lwcTFkajZzcFRPTGYxNHArVC94bDhBTFR3?=
 =?utf-8?B?TDVYcGk3bGdMZ1lpVHhwSERtVUtCNUdHZisrSkI1KzVJMWVOaXAvL2lCRWQr?=
 =?utf-8?B?RnhUbW1hRm9IZmJaYmRndz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?clRpZHhBdmxmSGJmbGdMM0V1RVdyck9oMW1ZVmorK0lBTjJhRmdVTE9hNU1a?=
 =?utf-8?B?NVZJOU0xMzQ0NldrbXAxSVVtWnFGRFFZd1NlZ0JsSHJDdkhhSnptK2lGNE0v?=
 =?utf-8?B?M0lsYktSKzFxRnBhQndCVnhOTkZ5ZXI5VTVaNm94Y01mZEp4VVVrejBiY2dM?=
 =?utf-8?B?QUtZZEtnV1FZUUdHVlErU3N3OGpjd3JuUG43NC9wZ1FaZm1YaldDWTJnOURp?=
 =?utf-8?B?b3BKRE5MY1QyOTYyaG5NMGJMbEdKVW5nZHZvdXBrVWJQb0JudEpLVHhqN3dU?=
 =?utf-8?B?ZU02cnFPT0VZenFWVWVjTlF3WTE3QmdPSXoxWlZsNVNSdnFEKzJQWXB3dHZa?=
 =?utf-8?B?NjFhclBpY05tQUhtYnhjQ1p3VjdVSGNsNDEvS1QreVJRS1FCQWUyQ1RzWjhI?=
 =?utf-8?B?ak9lZWdtU1F5aDdLMDdWNndFaHBocnNTYXY0K3NETmZ2ckhhTzI2eDFCWXlu?=
 =?utf-8?B?RjRDSTBtdUxFenZMUnVzS1REekE0THN5SkVLWjF4NlpGUWIxZThxb01naVRI?=
 =?utf-8?B?c0hJZkxsZHdaVHVoOC9TUnNRSlhvR2k5T2U4enZ0Q3ZnQjErdE45QUlucERl?=
 =?utf-8?B?QWxEcmJ4VFBva2c0TUNueE83azlRRkhsTGUvRmhnOTBXOG96eEIrc3M4R294?=
 =?utf-8?B?NkNtcTZJUXhxUUt0UWZvM1RiUHBpY00rVFZNYktnSW9EK2FXejYwcnpucmRI?=
 =?utf-8?B?bFVWVnFKd3FPbUFjNWJLcTRTZ0JDWlBDdnJzL002c1lGWllTcUZndnBVd2d6?=
 =?utf-8?B?VTFHRU0rS2VXays0dUxjUkg3SGk2bUsxNVpEL3N1U3dsbnlUSm4vMW5zR0FQ?=
 =?utf-8?B?STk1M2hKMUdEY3B3dUdQdW1LMGRWWEdyNFJsMGpMR3QvbWJSZ1FjV25ueW9v?=
 =?utf-8?B?SVlCOVhEb1pSZXp5Vmp2U0VmR1haMmlXOXdSVDhQbTZiUTNrR1pnZlZkV20x?=
 =?utf-8?B?aWJVZnJkOGl5aTVlTjAyYkN5YVc1Rm5IWHI0R0o2dEJZaGdJb01uNGx4VXNS?=
 =?utf-8?B?ZDJubXBaVTVYLzVUMUtob0YrbEh4V0dYMHZ4dVhpSDFIa3hwWXVRcGY4bFUy?=
 =?utf-8?B?NnhaMDAzMnV4M2ZKOHd5V0hWMU9YRVhTV3ZIUkkyeWlaOVVIeGJhcENvMWJV?=
 =?utf-8?B?Smszc3g4R2g5V2c0OEE5RFdaMC9JaThSZXc4UlkvL2MvZHRFeDYxR1NOTHov?=
 =?utf-8?B?M0lzUHlOY2V3Rlhsbmp0TzFvM0ErajJGOTFRQmpVTGFlNjdVNmhtSXp0RXpE?=
 =?utf-8?B?b0RiTXRCdS9Ca0NIbzBZSjVmM1VoRCtyYThGVWhlUmZ3Vzk5VE9ISDNkUHY4?=
 =?utf-8?B?Mzh4SXM0N0JPb2N6Q2M4Q0c5czA2YVpmUHl3U0dOT05NYmp1d1NIaXBsUGtq?=
 =?utf-8?B?OGl6d201SHFoZktzTGYxdTNDdkJvemJObm10cHAwd2FLYjU1THNhTzZjcitR?=
 =?utf-8?B?TDU5bVpNR0tuNWRlWW90QUE0OTNWSklHelAvNjZ6LzcwWVYwNzRlVkdReGF5?=
 =?utf-8?B?VzFLNzh1Y1ZmdFlpUmlvSGNXczhROUtqQ1NJVmpyN1c3S09CV1hOYk0rcGlH?=
 =?utf-8?B?angyREg2TW82Nmx0ZVNYZFJJbGZIck91NEhzYXlxRkduanlEeUNNRVgzUkpt?=
 =?utf-8?B?QVZwT0ZYVWQ3clpXSkd3K1Q0Q1Q3M3F3TGk0Rm9Dc1BsWlkrZHdDeS9YVlZk?=
 =?utf-8?B?MXFSU1F2OUhrQVhQNURDTkZJTlQ2OTh0Q0IrbXZLZzZlSkI0U29Qd1dJQVI1?=
 =?utf-8?B?L1dBZnFiWld3bjNWNDBtcFBPenpkN0pKdEVQSHVqZUJ2T0dSYktNSG5zU1NI?=
 =?utf-8?B?NG5CcVUrVm5pbXdIWnZBWVdPcUc1dEVKUEIrNkxmZkVvanhOK0lZVHNOTDFu?=
 =?utf-8?B?N0JsWlZodHRhaTV3YTlJVFhqYUdCYTlqMDI3dW1Xc3NTNVNZeDRaN1FnTmJL?=
 =?utf-8?B?S3lVckNZUFBScVIwYUNvYWMrWkZMOFVWTFE2VzY4OVhPb0pYeExDcU9ZTEVi?=
 =?utf-8?B?ZDVWa3JhTVNzWkUwankvd3FZMHl4R2VhQUFuTmdRRk9yWWhrc2pRcUNrWUZT?=
 =?utf-8?B?TFVidHpCWjJuaEgyUmFJY0N2QS9nU2xOTTkyelBqbDZwYnpOR3YyNU9Ud0wy?=
 =?utf-8?B?MDBCbEtjUnl6WFdGbHlEWHBEVndVSDRYdHlrUytyb09JWnJ3RmpUM3EyNENK?=
 =?utf-8?B?L1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2916F52EB4E594F89F3CE305414EF82@namprd19.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cirrus.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR19MB5688.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2e1f0e-2348-403d-6b41-08dc609e3d2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 18:26:32.6590
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: teU4mXp1YJOUvxhRv6Ct4/n50drKpccDKyaY8UTSOAl1nPooFdsGRq86K2bBJY1vcBbTanD3rLyMdXlPbjzr/M5v2dgHFEG5DmR86rXDyO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR19MB5397
X-Proofpoint-ORIG-GUID: UfJVh0pDAb6D9hJ97wsPWGRYaD_JSRkC
X-Proofpoint-GUID: UfJVh0pDAb6D9hJ97wsPWGRYaD_JSRkC
X-Proofpoint-Spam-Reason: safe

DQpIaSBEbWl0cnksDQoNCj4gT24gQXByIDE2LCAyMDI0LCBhdCA2OjI44oCvUE0sIERtaXRyeSBU
b3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBNb24s
IEFwciAwOCwgMjAyNCBhdCAwMzozMjoxM1BNICswMDAwLCBKYW1lcyBPZ2xldHJlZSB3cm90ZToN
Cj4+IEludHJvZHVjZSBzdXBwb3J0IGZvciBDaXJydXMgTG9naWMgRGV2aWNlIENTNDBMNTA6IGEN
Cj4+IGhhcHRpYyBkcml2ZXIgd2l0aCB3YXZlZm9ybSBtZW1vcnksIGludGVncmF0ZWQgRFNQLA0K
Pj4gYW5kIGNsb3NlZC1sb29wIGFsZ29yaXRobXMuDQo+PiANCj4+IFRoZSBpbnB1dCBkcml2ZXIg
cHJvdmlkZXMgdGhlIGludGVyZmFjZSBmb3IgY29udHJvbCBvZg0KPj4gaGFwdGljIGVmZmVjdHMg
dGhyb3VnaCB0aGUgZGV2aWNlLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBPZ2xldHJl
ZSA8am9nbGV0cmVAb3BlbnNvdXJjZS5jaXJydXMuY29tPg0KPj4gLS0tDQo+PiB2MTA6DQo+PiBN
aW5vciBjb25jZXJuIHRoYXQgcGxheWJhY2sgc3RvcCBpcyBzdGlsbCBtaXN1c2VkIHdpdGggcmVz
cGVjdCB0byBub3QNCj4+IHNwZWNpZnlpbmcgYW4gZWZmZWN0IElELiBUaGUgZGV2aWNlIGNhbiBv
bmx5IHBsYXkgb25lIGVmZmVjdCBhdCBhDQo+PiB0aW1lLCBidXQgc2V0dGluZyBtYXggZWZmZWN0
cyBmb3IgdGhlIEVWSU9DR0VGRkVDVFMgaW9jdGwgdG8gMSB3b3VsZA0KPj4gcmVzdHJpY3QgdGhl
IG51bWJlciBvZiB1cGxvYWRzIHRvIDEgYXMgd2VsbC4NCj4gDQo+IFNvcnJ5IGZvciBhIGxvbmcg
ZGVsYXkgb24gbXkgcGFydC4NCg0KTm90IHRvIHdvcnJ5IGF0IGFsbC4gSSBhbSB2ZXJ5IGdyYXRl
ZnVsIGZvciB0aGUgdGhvcm91Z2ggcmV2aWV3Lg0KDQo+IA0KPiBVbmZvcnR1bmF0ZWx5IHRoaXMg
aXMgbm90IGEgbWlub3IgY29uY2VybiwgYmVjYXVzZSBpdCBicmVha3MgdGhlIEFQSQ0KPiB0aGF0
IHdlIHNvIGZhciBiZWVuIHByZXNlbnRpbmcgdG8gdXNlcnNwYWNlLiBFVklPQ0dFRkZFQ1RTIGlv
Y3RsIHdoaWNoIHJldHVybnMNCj4gaW5wdXQtPmZmLT5tYXhfZWZmZWN0cyBpcyBkZXNjcmliZWQg
YXMgIlJlcG9ydCBudW1iZXIgb2YgZWZmZWN0cw0KPiBwbGF5YWJsZSBhdCB0aGUgc2FtZSB0aW1l
Ii4NCj4gDQo+IEkgc3VnZ2VzdCB5b3UgbGltaXQgbnVtYmVyIG9mIGVmZmVjdHMgdG8gMSBzbyB0
aGF0IHdlIGNhbiBtZXJnZSB0aGUNCj4gZHJpdmVyIHdpdGggc3VjaCBsaW1pdGF0aW9uLCBhbmQg
dGhlbiB0cnkgdG8gZmlndXJlIG91dCBob3cgdG8gZXhwYW5kDQo+IHRoZSBBUEkuIFdlIHdpbGwg
cHJvYmFibHkgaGF2ZSB0byBzcGxpdCB0aGUgbm90aW9uIG9mIG51bWJlciBvZiBwbGF5YWJsZQ0K
PiBlZmZlY3RzIHZzIG51bWJlciBvZiB1cGxvYWRhYmxlIGVmZmVjdHMsIGFuZCBvbmx5IGFjY2Vw
dCB1cGxvYWRzIG9mDQo+IGVmZmVjdHMgdGhhdCBleGNlZWQgbnVtYmVyIG9mIHBsYXlhYmxlIGVm
ZmVjdHMgaWYgdGhleSBhbGwgaGF2ZSB0aGUgc2FtZQ0KPiBvd25lciwgc28gdGhhdCBkaWZmZXJl
bnQgcHJvY2Vzc2VzIHdvdWxkIG5vdCBiZSBhYmxlIHRvIGFmZmVjdCBlYWNoDQo+IG90aGVyIGlu
IGNhc2Ugd2hlbiBudW1iZXIgb2Ygc2ltdWx0YW5lb3VzbHkgcGxheWFibGUgZWZmZWN0cyBpcyBz
bWFsbGVyLg0KDQpJIHVuZGVyc3RhbmQuIEkgd2lsbCBkbyBqdXN0IHRoYXQgZm9yIHRoaXMgc3Vi
bWlzc2lvbi4NCg0KPj4gKy8qIERlc2NyaWJlcyBhbiBhcmVhIGluIERTUCBtZW1vcnkgcG9wdWxh
dGVkIGJ5IGVmZmVjdHMgKi8NCj4+ICtzdHJ1Y3QgY3M0MGw1MF9iYW5rIHsNCj4+ICsgZW51bSBj
czQwbDUwX2JhbmtfdHlwZSB0eXBlOw0KPj4gKyB1MzIgYmFzZV9pbmRleDsNCj4+ICsgdTMyIG1h
eF9pbmRleDsNCj4gDQo+IFRoaXMgbG9va3MgbGlrZSBpdCBpcyB3cml0dGVuIHRvIHRoZSBkZXZp
Y2UsIHNvIEkgdGhpbmsgdGhpcyBuZWVkcw0KPiBwcm9wZXIgZW5kaWFubmVzcyBhbm5vdGF0aW9u
LiBJcyB0aGVyZSBhbnkgY29uY2VybiBhYm91dCBwYWRkaW5nIGJldHdlZW4NCj4gdGhlIHR5cGUg
YW5kIGJhc2VfaW5kZXg/DQoNClRoZSBzdHJ1Y3R1cmUgYXMgYSB3aG9sZSBpcyBub3Qgd3JpdHRl
biwgc28gdGhlcmUgaXMgbm8gY29uY2VybiBhYm91dCBwYWRkaW5nLg0KT25seSBiYXNlX2luZGV4
IGlzIHdyaXR0ZW4sIGFuZCB0aGUgZW5kaWFubmVzcyBjb252ZXJzaW9uIGlzIGhhbmRsZWQgYnkg
cmVnbWFwLg0K4oCcY3M0MGw1MF9vd3RfaGVhZGVy4oCdIHdvdWxkIGJlIGFuIGV4YW1wbGUgb2Yg
YSBzdHJ1Y3Qgd2hpY2ggaXMgd3JpdHRlbiwgYW5kIHRoZXJlDQpjYXJlIGlzIHRha2VuIGZvciBw
YWRkaW5nLCBhbmQgdGhlcmUgYWxzbyByZWdtYXAgaGFuZGxlcyB0aGUgZW5kaWFubmVzcw0KY29u
dmVyc2lvbi4NCg0KPj4gK3N0YXRpYyBpbnQgY3M0MGw1MF91cGxvYWRfb3d0KHN0cnVjdCBjczQw
bDUwX3dvcmsgKndvcmtfZGF0YSkNCj4+ICt7DQo+PiArIHUzMiBsZW4gPSAyICogd29ya19kYXRh
LT5jdXN0b21fbGVuLCB3dF9vZmZzZXQsIHd0X3NpemU7DQo+PiArIHN0cnVjdCBjczQwbDUwX3Zp
YnJhICp2aWJyYSA9IHdvcmtfZGF0YS0+dmlicmE7DQo+PiArIHN0cnVjdCBjczQwbDUwX293dF9o
ZWFkZXIgaGVhZGVyOw0KPj4gKyB1OCAqb3V0X2RhdGE7DQo+PiArIGludCBlcnJvcjsNCj4+ICsN
Cj4+ICsgZXJyb3IgPSByZWdtYXBfcmVhZCh2aWJyYS0+cmVnbWFwLCB2aWJyYS0+ZHNwLm93dF9z
aXplX3JlZywgJnd0X3NpemUpOw0KPj4gKyBpZiAoZXJyb3IpDQo+PiArIHJldHVybiBlcnJvcjsN
Cj4+ICsNCj4+ICsgaWYgKCh3dF9zaXplICogc2l6ZW9mKHUzMikpIDwgc2l6ZW9mKGhlYWRlcikg
KyBsZW4pIHsNCj4+ICsgZGV2X2Vycih2aWJyYS0+ZGV2LCAiTm8gc3BhY2UgaW4gT1dUIGJhbmsg
Zm9yIGVmZmVjdFxuIik7DQo+PiArIHJldHVybiAtRU5PU1BDOw0KPj4gKyB9DQo+PiArDQo+PiAr
IG91dF9kYXRhID0ga3phbGxvYyhzaXplb2YoaGVhZGVyKSArIGxlbiwgR0ZQX0tFUk5FTCk7DQo+
IA0KPiBZb3UgY2FuIG1ha2UgdGhpcyBhcw0KPiANCj4gdTggKm91dF9kYXRhIF9fZnJlZShrZnJl
ZSkgPSBremFsbG9jKC4uLik7DQo+IA0KPiBhbmQgdGhlbiB5b3UgZG8gbm90IG5lZWQgdG8gZXhw
bGljaXRseSBrZnJlZSgpIGl0Lg0KPiANCj4gQWxzbywgSSB3b25kZXIgaWYgeW91IGhhdmUgdG8g
emVybyBpdCBhbmQgY2FuJ3QgdXNlIGttYWxsb2MoKSBnaXZlbiB0aGF0DQo+IHlvdSBjb3B5IG92
ZXIgdGhlIGVudGlyZSB0aGluZy4NCg0KQWNrLiBJIHdpbGwgZGVjbGFyZSBpdCBhczoNCnU4ICpv
dXRfZGF0YSBfX2ZyZWUoa2ZyZWUpID0gTlVMTDsNCg0KQW5kIHRoZW4gaW5pdGlhbGl6ZSBpdCBp
biB0aGUgc2FtZSBwbGFjZSB3aXRoIGttYWxsb2MoKS4NClRoaXMgd2lsbCBhbGxvdyBtZSB0byBr
ZWVwIHJldmVyc2UgQ2hyaXN0bWFzIHRyZWUgc3R5bGUuDQoNCj4+ICtzdGF0aWMgaW50IGNzNDBs
NTBfYWRkKHN0cnVjdCBpbnB1dF9kZXYgKmRldiwgc3RydWN0IGZmX2VmZmVjdCAqZWZmZWN0LA0K
Pj4gKyAgICAgICAgc3RydWN0IGZmX2VmZmVjdCAqb2xkKQ0KPj4gK3sNCj4+ICsgc3RydWN0IGZm
X3BlcmlvZGljX2VmZmVjdCAqcGVyaW9kaWMgPSAmZWZmZWN0LT51LnBlcmlvZGljOw0KPj4gKyBz
dHJ1Y3QgY3M0MGw1MF92aWJyYSAqdmlicmEgPSBpbnB1dF9nZXRfZHJ2ZGF0YShkZXYpOw0KPj4g
KyB1MzIgbGVuID0gZWZmZWN0LT51LnBlcmlvZGljLmN1c3RvbV9sZW47DQo+PiArIHN0cnVjdCBj
czQwbDUwX3dvcmsgd29ya19kYXRhOw0KPj4gKw0KPj4gKyBpZiAoZWZmZWN0LT50eXBlICE9IEZG
X1BFUklPRElDIHx8IHBlcmlvZGljLT53YXZlZm9ybSAhPSBGRl9DVVNUT00pIHsNCj4+ICsgZGV2
X2Vycih2aWJyYS0+ZGV2LCAiVHlwZSAoJSNYKSBvciB3YXZlZm9ybSAoJSNYKSB1bnN1cHBvcnRl
ZFxuIiwNCj4+ICsgZWZmZWN0LT50eXBlLCBwZXJpb2RpYy0+d2F2ZWZvcm0pOw0KPj4gKyByZXR1
cm4gLUVJTlZBTDsNCj4+ICsgfQ0KPj4gKw0KPj4gKyB3b3JrX2RhdGEuY3VzdG9tX2RhdGEgPSBr
Y2FsbG9jKGxlbiwgc2l6ZW9mKHMxNiksIEdGUF9LRVJORUwpOw0KPj4gKyBpZiAoIXdvcmtfZGF0
YS5jdXN0b21fZGF0YSkNCj4+ICsgcmV0dXJuIC1FTk9NRU07DQo+PiArDQo+PiArIGlmIChjb3B5
X2Zyb21fdXNlcih3b3JrX2RhdGEuY3VzdG9tX2RhdGEsIGVmZmVjdC0+dS5wZXJpb2RpYy5jdXN0
b21fZGF0YSwNCj4+ICsgICAgc2l6ZW9mKHMxNikgKiBsZW4pKSB7DQo+PiArIHdvcmtfZGF0YS5l
cnJvciA9IC1FRkFVTFQ7DQo+PiArIGdvdG8gZXJyX2ZyZWU7DQo+PiArIH0NCj4gDQo+IHdvcmtf
ZGF0YS5jdXN0b21fZGF0YSA9IG1lbWR1cF9hcnJheV91c2VyKGVmZmVjdC0+dS5wZXJpb2RpYy5j
dXN0b21fZGF0YSwNCj4gICBsZW4sIHNpemVvZihzMTYpKTsNCj4gaWYgKElTX0VSUih3b3JrX2Rh
dGEuY3VzdG9tX2RhdGEpKQ0KPiByZXR1cm4gUFRSX0VSUih3b3JrX2RhdGEuY3VzdG9tX2RhdGEp
Ow0KDQpBY2suDQoNCj4+ICtzdGF0aWMgdm9pZCBjczQwbDUwX3N0YXJ0X3dvcmtlcihzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspDQo+PiArew0KPj4gKyBzdHJ1Y3QgY3M0MGw1MF93b3JrICp3b3Jr
X2RhdGEgPSBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGNzNDBsNTBfd29yaywgd29yayk7DQo+
PiArIHN0cnVjdCBjczQwbDUwX3ZpYnJhICp2aWJyYSA9IHdvcmtfZGF0YS0+dmlicmE7DQo+PiAr
IHN0cnVjdCBjczQwbDUwX2VmZmVjdCAqc3RhcnRfZWZmZWN0Ow0KPj4gKw0KPj4gKyBpZiAocG1f
cnVudGltZV9yZXN1bWVfYW5kX2dldCh2aWJyYS0+ZGV2KSA8IDApDQo+PiArIGdvdG8gZXJyX2Zy
ZWU7DQo+PiArDQo+PiArIG11dGV4X2xvY2soJnZpYnJhLT5sb2NrKTsNCj4+ICsNCj4+ICsgc3Rh
cnRfZWZmZWN0ID0gY3M0MGw1MF9maW5kX2VmZmVjdCh3b3JrX2RhdGEtPmVmZmVjdC0+aWQsICZ2
aWJyYS0+ZWZmZWN0X2hlYWQpOw0KPj4gKyBpZiAoc3RhcnRfZWZmZWN0KSB7DQo+PiArIHdoaWxl
ICgtLXdvcmtfZGF0YS0+Y291bnQgPj0gMCkgew0KPj4gKyB2aWJyYS0+ZHNwLndyaXRlKHZpYnJh
LT5kZXYsIHZpYnJhLT5yZWdtYXAsIHN0YXJ0X2VmZmVjdC0+aW5kZXgpOw0KPj4gKyB1c2xlZXBf
cmFuZ2Uod29ya19kYXRhLT5lZmZlY3QtPnJlcGxheS5sZW5ndGgsDQo+PiArICAgICAgd29ya19k
YXRhLT5lZmZlY3QtPnJlcGxheS5sZW5ndGggKyAxMDApOw0KPiANCj4gSWYgKEkgYW0gcmVhZGlu
ZyB0aGlzIHJpZ2h0IHlvdSBhcmUgc3Bpbm5pbmcgaGVyZSBwbGF5aW5nIHRoZSBlZmZlY3QuIEl0
DQo+IHdvdWxkIGJlIG11Y2ggYmV0dGVyIGlmIHlvdSB0cmFja2VkIG91dHN0YW5kaW5nIG51bWJl
ciBvZiByZXBsYXlzIGZvciBhbg0KPiBlZmZlY3QgYW5kIGhhZCBhIHdvcmsgcmUtc2NoZWR1bGVk
IHRoYXQgd291bGQgcGxheSBhbiBpbnN0YW5jZS4NCj4gU2ltaWxhcmx5IHRvIHdoYXQgY29kZSBp
biBmZi1tZW1sZXNzLmMgaXMgZG9pbmcuDQoNCkkgdGhpbmsgeW91IGFyZSByZWFkaW5nIGl0IHJp
Z2h0Lg0KDQpNeSBjb25jZXJuIHdpdGggdGhlIGZmLW1lbWxlc3MuYyBtZXRob2QgaXMgdGhhdCBp
dCBzZWVtcyB0byByaXNrIG91dCBvZiBvcmRlcg0KZXhlY3V0aW9ucyB3aGVuIGFkb3B0ZWQgdG8g
b3VyIGRyaXZlciwgYmVjYXVzZSBvZiB0aGUgdXNlIG9mIHRoZSB3b3JrcXVldWUuDQoNCklmIGEg
cGxheWJhY2sgaXMgaXNzdWVkIHdpdGggYSBoaWdoIGVub3VnaCByZXBlYXQgdmFsdWUsIGl0IHNl
ZW1zIHZlcnkgcGxhdXNpYmxlDQp0aGF0IGFub3RoZXIgb3BlcmF0aW9uLCBlLmcuIGVyYXNlLCBj
b3VsZCBhcnJpdmUgaW4gdGhlIG1pZGRsZSBvZiB0aGUgY2hhaW4gb2YNCnJlLXNjaGVkdWxpbmcg
YW5kIGRpc3J1cHQgdGhlIHBsYXliYWNrcyB3aGljaCBoYXZlIHlldCB0byBiZSBxdWV1ZWQuIEN1
cnJlbnRseSwNCnRoZSBkcml2ZXIgaGFuZGxlcyBhbGwgcmVwZWF0cyBpbiB0aGUgc2FtZSB3b3Jr
IGl0ZW0sIHNvIGl0IGlzIGd1YXJhbnRlZWQgdG8gcmVwZWF0DQp0aGUgZWZmZWN0IGZvciB0aGUg
c3BlY2lmaWVkIG51bWJlciBvZiB0aW1lcyB3aXRob3V0IGJlaW5nIGludGVycnVwdGVkLg0KDQpQ
bGVhc2UgbGV0IG1lIGtub3cgd2hhdCB5b3UgdGhpbmsuDQoNCg0KPj4gK3N0YXRpYyBpbnQgY3M0
MGw1MF9lcmFzZShzdHJ1Y3QgaW5wdXRfZGV2ICpkZXYsIGludCBlZmZlY3RfaWQpDQo+PiArew0K
Pj4gKyBzdHJ1Y3QgY3M0MGw1MF92aWJyYSAqdmlicmEgPSBpbnB1dF9nZXRfZHJ2ZGF0YShkZXYp
Ow0KPj4gKyBzdHJ1Y3QgY3M0MGw1MF93b3JrIHdvcmtfZGF0YTsNCj4+ICsNCj4+ICsgd29ya19k
YXRhLnZpYnJhID0gdmlicmE7DQo+PiArIHdvcmtfZGF0YS5lZmZlY3QgPSAmZGV2LT5mZi0+ZWZm
ZWN0c1tlZmZlY3RfaWRdOw0KPj4gKw0KPj4gKyBJTklUX1dPUksoJndvcmtfZGF0YS53b3JrLCBj
czQwbDUwX2VyYXNlX3dvcmtlcik7DQo+PiArDQo+PiArIC8qIFB1c2ggdG8gd29ya3F1ZXVlIHRv
IHNlcmlhbGl6ZSB3aXRoIHBsYXliYWNrcyAqLw0KPj4gKyBxdWV1ZV93b3JrKHZpYnJhLT52aWJl
X3dxLCAmd29ya19kYXRhLndvcmspOw0KPj4gKyBmbHVzaF93b3JrKCZ3b3JrX2RhdGEud29yayk7
DQo+IA0KPiBZb3UgYWxyZWFkeSB0YWtlIHRoZSBsb2NrIHdoZW4geW91IHBsYXksIHVwbG9hZCBv
ciBlcmFzZSBhbiBlZmZlY3QuIFdoeQ0KPiBkbyB3ZSBuZWVkIGFkZGl0aW9uYWwgc2luZ2xlLXRo
cmVhZCB3b3JrcXVldWUgZm9yIHRoaXM/IFdoeSBkbyB3ZSBuZWVkDQo+IGFkZGl0aW9uYWwgb3Jk
ZXJpbmcgYW5kIHN5bmNocm9uaXphdGlvbj8NCg0KSSB0aGluayB0aGVyZSBpcyB1bm5lY2Vzc2Fy
eSBzZXJpYWxpemF0aW9uIGhlcmUsIGJ1dCBJIHRoaW5rIGl0IGlzIHRoZSBtdXRleGVzDQp3aGlj
aCBhcmUgZXhjZXNzaXZlLg0KDQpXaXRob3V0IHRoZSB3b3JrcXVldWUgSSB0aGluayB0aGVyZSB3
aWxsIGJlIG91dCBvZiBvcmRlciBvcGVyYXRpb25zLiBUaGUgb25seQ0KcmVhc29uIHRoZSB3b3Jr
cXVldWUgaXMgbmVjZXNzYXJ5IGlzIGJlY2F1c2UgcGxheWJhY2sgYmxvY2tzICh2aWENCnBtX3J1
bnRpbWVfcmVzdW1lX2FuZF9nZXQpLCBhbmQgc28gcGxheWJhY2sgbXVzdCBkZWZlciB3b3JrLg0K
DQpOb3cgdXBsb2FkIGFuZCBlcmFzZSBhcmUgbm90IGNhbGxlZCBpbiBhdG9taWMgY29udGV4dC4g
QnV0IHdpdGhvdXQgcXVldWVpbmcNCnRob3NlIGV4ZWN1dGlvbnMsIHRoZXkgY291bGQgY3V0IGlu
IGZyb250IG9mIGFueSBwbGF5YmFja3Mgd2FpdGluZyBpbiB0aGUNCndvcmtxdWV1ZS4gVGhpcyBp
cyB0aGUgbWVhbmluZyBvZiB0aGUgY29tbWVudCAiUHVzaCB0byB3b3JrcXVldWUgdG8NCnNlcmlh
bGl6ZSB3aXRoIHBsYXliYWNrc+KAnS4NCg0KQnV0IGlmIHRoZXkgYXJlIGFscmVhZHkgc2VyaWFs
aXplZCBpbiB0aGlzIHdheSwgdGhlbiBJIGRvbuKAmXQgc2VlIHRoZSBuZWVkDQpmb3IgdGhlIGxv
Y2tzLiBUaGF04oCZcyBteSB0aGlua2luZywgbGV0IG1lIGtub3cgaWYgaXQgaXMgc291bmQuDQoN
Cj4+ICsgcmV0dXJuIGlucHV0X3JlZ2lzdGVyX2RldmljZSh2aWJyYS0+aW5wdXQpOw0KPiANCj4g
UGxlYXNlIG5vIHRoaXMga2luZCBvZiBzaG9ydCBoYW5kcyB3aGVuIHRoZXJlIGFyZSBtdWx0aXBs
ZSBleGlzdHMgZnJvbSBhDQo+IGZ1bmN0aW9uLg0KPiANCj4gZXJyb3IgPSBpbnB1dF9yZWdpc3Rl
cl9kZXZpY2UodmlicmEtPmlucHV0KTsNCj4gaWYgKGVycm9yKQ0KPiByZXR1cm4gZXJyb3I7DQo+
IA0KPiByZXR1cm4gMDsNCj4gDQo+IFRoaXMgd2F5IGl0IGlzIG11Y2ggZWFzaWVyIHRvIG1vdmUg
dGhlIGNvZGUgYXJvdW5kIHdoZW4gbmVlZGVkLg0KDQpBY2suDQoNCkJlc3QsDQpKYW1lcw0KDQoN
Cg==

