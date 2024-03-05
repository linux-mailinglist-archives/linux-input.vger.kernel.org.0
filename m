Return-Path: <linux-input+bounces-2253-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCFB8728F7
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 21:56:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC5D28C5D9
	for <lists+linux-input@lfdr.de>; Tue,  5 Mar 2024 20:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB22C12A16C;
	Tue,  5 Mar 2024 20:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="QIFyqpAn";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QMZY70/u"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8D5C5FD;
	Tue,  5 Mar 2024 20:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709672177; cv=fail; b=fnbqsJUQiZPwYJ33x1t1DA2EYQLYfmIakoUbPZwDHgMy1ESf+A7qH9Ridn/PNy8btuU9vcmbMZV6SVJumgqNhiGUFBqe6t5K4AGmZxeV6FqYYYsuXvy71PA4s8O2DcxASelWj+5J11lsZ58FTU/zy2b4YUIulh3RAnaC8Zr9y/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709672177; c=relaxed/simple;
	bh=jbNIoUi3h8lkEG2a9KtYQzDW5tq+dnS4D5TosPhUU8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sXF1yaJzs3vg3/0/NUb6IOlT2+gRkqO727oL3Qap7PWyhQqLm8V45O7t12qPIESjIFMxDnK41skwUPiLb0DhuY03mLn4baODsYR4eJajO+CSjEQNaJXuV+V5gfNXt9mDA1Af2ek89KTpRxFVY2mVKecqCC4qxm95b+vqfP9PrjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=QIFyqpAn; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QMZY70/u; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4254wwfO010131;
	Tue, 5 Mar 2024 14:55:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=jbNIoUi3h8lkEG2a9KtYQzDW5tq+dnS4D5TosPhUU
	8o=; b=QIFyqpAnYXyPNHtOVyyoGhe/BG2zOg0czNx0NOUzlPiBlx/Q48rZSu+CL
	2XyIi7qlZU/jm56MVY4X4XZTrBI3SjHi9hRsNWYMKP9jtEYdJ3tgCtzoEvQ+n7x7
	XF5+BCWHYxvod+IpB7dh3NZgwzga9g0HPTwPEq/H7uBBdptv+uIKDgKNDhuMeZJN
	XWcj+IZXmw76x+Cc5LaFHYtCJxePreMTVN9yaSzHV5eMx7StkZlO4vHEcu7BVbQh
	qxOAZrhI5J1ZQIp2R5kI9yx+6suDSV+P6a0dcoX93GhW3/5M+o2G95JdjCG20NX7
	fHatxUmVsi7FcqhU3Z7ovhQbPhQCg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3wm1dpbtjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Mar 2024 14:55:55 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gms+LfjM5quTfqzvQPxryLqMloGfyOVwsOPBklzvrpUN64ZDPY/RYyBXjjbPB4MnAXCxLicQ0Wv0yc5yBEWP1b8VcoTpCwBj5sQ6tX9KqnSN2rcJ7UdHuIEtIczv20H1twwX987m3RFck+swVytpMWfIrxI3q5hEg46SrHC4ePOa6lk5qMXkxFWSCYTeQzcszqVCy9rRBAMBUrOBNTwmP3HUUjLl4xpDzl3Rl5r/Km2rfg1taJ8w+14hRO2S5c3P/AwivtwFEWQ+e2wZowUZWz3lDfcBoSCoqJdvM94RMBtCYaoToSkVMHRlW3BD93a2ZROEWkwTXsatT1+IkxSX9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jbNIoUi3h8lkEG2a9KtYQzDW5tq+dnS4D5TosPhUU8o=;
 b=ACn8gEgp4o6dRY0LTr7FTFnRKF1QyZyvcwW7551xkY/BDXqhfLuceVsKAi0GqMYXJ81Mo7mekEs7RTFXQoIIBMDMHKfqjKMhkSpKQ1DmaUnMWlJmM26rv+KluaZhmlN/BhXo6APWyfudajyCUJ4JsvJYNllLFqR0/G8cvH8382qOyo50Esh9XNyDIuKcQPD1Riv5l64xGoU7VoxIl+NXAiFXOaFWiQCVEib5+FMsx9a9eHdR4DR6QALR3mAqNDBhsybt+jtwC3/pCMxmpJWxyPnmnVlBiEd5GhlrzXjxyMymj0XofHDHO/GgIWjV3fETjIXnBLyG8SvoKmggOP9uZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jbNIoUi3h8lkEG2a9KtYQzDW5tq+dnS4D5TosPhUU8o=;
 b=QMZY70/u8wHH1PoCptie1YrLgpLJYfj7Nh2F8uZihBdgpzmWjycTLwxZ6oG98bMoaf/JvZaeD4StIupavFlvrgOiBZoQ0hrDZAV1oNCSMrn3PXPRAuDSz+17kiBbth9daJREopkoWSY/pp0LBKm7Ao3bq220pWR5h3HW5uWXCjs=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DS0PR19MB7960.namprd19.prod.outlook.com (2603:10b6:8:165::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.39; Tue, 5 Mar 2024 20:55:45 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac%7]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 20:55:45 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Lee Jones <lee@kernel.org>,
        James Ogletree
	<jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Topic: [PATCH v8 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Index: AQHaZF4UgIr28UNwtkWTd9HzyMQhiLEiqcUAgAB6wYCABdoJAIAABlKAgACxUQA=
Date: Tue, 5 Mar 2024 20:55:45 +0000
Message-ID: <BB8C1685-644F-4B0A-8F2D-BABAA4B42127@cirrus.com>
References: <20240221003630.2535938-1-jogletre@opensource.cirrus.com>
 <20240221003630.2535938-4-jogletre@opensource.cirrus.com>
 <20240301091716.GA1688857@google.com>
 <6DD14CBC-FAE2-4768-AD77-347229FE9AC7@cirrus.com>
 <20240305095818.GF5206@google.com>
 <ZebyByQnYkaRiudv@ediswmail9.ad.cirrus.com>
In-Reply-To: <ZebyByQnYkaRiudv@ediswmail9.ad.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DS0PR19MB7960:EE_
x-ms-office365-filtering-correlation-id: 1b043120-a7b0-4821-4b40-08dc3d56a0c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 c2wy3eQZ6DWlK6YgnhsCfSzwiOEKyUqZZqn+7M3Pb3Y9d2mOUcoE0M6iRn56NEKssR2DJ7j3P0oukToyPsKXmn2s/9Zw+VTgF4OhD+vfrWbltEUwt9r/CzgSkFWwCrUjWVja8wWzxWJcoXs2xs22PapZdgsp3St/YHq9NcMtjl5hsdcEHI5EHZbUDfvbqx5EKI1UmhxDaazHrW2UlRWEEWMq8Ys8eJLVu6hawz2BW45uDzuF6muTWgT6xfxn1UsFM8oefL105fDgudq5QqI0thAmL3S8j3QIaBR5dk9F61t2eWQF70FFFLzar8kfaYWUZ7z7JCGxIAzth/i6jXs2CY0BxZey5mfUGqJTjOC0vICCZgPTrIh0YDHEbWih2xPPRT001ECun9Rc6yMtDidfUw+4hEymyNNSQyWsBgJaQ7jcIu0Q4t/T7a2BdML2wqGZ+xOwhFT2IAK2tT5bvT0LLwC8WGGsOtRz39AstS0Ar40wJGu48JzlMqO+I9DJoKBJ8m4p2qTKTId3GP9SoEEqpJ0CRD6s1pi3sdb3z0JMmOAz1x+iyq2VyJvxkX6Yv+CJP1p4EL2KwxfXPnDrxWEqaU43jHAdkh0Co981+eIwMXI/Lok60w8F50C0NwKfVzUCbL6GLKbkZxI/nWXhrV90HlZSXfju0DguohYp+5WZYMWvo8DLuOuDSwoHZmdAgqcArI3UqJSGVIAL8TcfILO1fztRP1elyh5DNwFueySjrXM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SjdkZDBQOThKYWg0aTVrWHBsTkZwTjRZUGJMS0lseWtGR1hFYmM2Qyt1WFBZ?=
 =?utf-8?B?bDVnN1A3VHVsTEtiV2t1TVc3a3BLZGZFUkNYUmJFdTAvT3QwNHZzUFY4UjY2?=
 =?utf-8?B?WUd5MzlSN3ZpL091dExkM2tFOGxodXpyeDM4UENzTEEzOC9WQkZ1WHpXY2p1?=
 =?utf-8?B?ZkRscEt1QzdWZG9Dc3UzeDA2WjJlRHN0cHh0c0d6QXhuNjFvajdrR0RTaVpR?=
 =?utf-8?B?Z1hSdjN4ajRWd24vcGJpczNtcFhyeDdQSTliRlhMZnQ4c0ppbUZSREtXRjRL?=
 =?utf-8?B?SE9Gb3NWeC8ycm0vMWNoWXg2eXIrSEgzSHNZWTJPNTJNUmdYVE5veVhhUFJI?=
 =?utf-8?B?VWp0R1lnOGVPbkJQcEgvTi9pdFY3NGs4VnZsZE9MZ0VXb3pWeVh5U0NSdUhn?=
 =?utf-8?B?d24yQ0R5MkRHTHBrN0tuOHAzM1BIdTYzVDFvTEk0OHl5V3ZubVpCWDRjUklH?=
 =?utf-8?B?cWxwVVpmZzVMN0VZTmQ0UlJQU3NIVkNGTGpCOHNvUzFISDZtMHB2Y0NSdkl5?=
 =?utf-8?B?cm1BcFdSejd0aWE3ZzFYeWYzUklRUzc2M3R1Mk03cUVadlVLMEF1R3FJMXNh?=
 =?utf-8?B?RjdjNkFlcFUvSVBCcWJBNjR5bHZpZ1hUSWlBNzdiYmNPZDluMkhYNGdNR3Za?=
 =?utf-8?B?V1JkZ3BHMmRKVVhxZC9UN1kvYWlTOW1uKzVwQXZLSnhjTWxpQW9sR1VkekxN?=
 =?utf-8?B?d3VmS1ZWckVTNXIxek9CVFdTTTVGUHdyZzZuUVJkc3kzUDJ4R1JJRFhsUmtY?=
 =?utf-8?B?OThjRmdjRWVJaGtBUW5qZXgyN283ZlljYjh3YzdCc0NOMUcwMGp0SjFBc0lO?=
 =?utf-8?B?OTZjc2xhcHJDZmswTVRQbENtWG8vNTRqdGhicEtDQVFXcEpuVlZPRkpZV1Ba?=
 =?utf-8?B?UHhyY3R0L0dTYjlQRXVSUFUyWEFzWXhzY3EyVWNIR3Rhb1pGV09IYXN4d2d4?=
 =?utf-8?B?bnhWSCtGN2UxYVQyQlFlMkMrNURXaFZYQ0lFMHAxa21udkNDeG5MQyt5UFRE?=
 =?utf-8?B?aXRKK3VJTTFzcEgvQTkrdldESUlEcThjZlBleXpqcko4cFRsVkV0cVBOV3dT?=
 =?utf-8?B?eEFCTlJtUCtDMjlEM29DaFBPTlRCVm1qem5yYkt4TThHSG1HOHYrL0Z0RWJT?=
 =?utf-8?B?WlJ0M2lLZkEzTGdxN2ZGYmQ4aGR0Rk9QeURNci8zclZhQjJ5WUFpWFY2WjJa?=
 =?utf-8?B?YW10U0JSZWY5Sjh1UkNGZWNkWERsZjh2NXBReENTWVZjaDV5amxTWWg5Vy9B?=
 =?utf-8?B?THpsUm5IZ0VqdXlvM0ZLVVFSU2RkRlFteWlObGMzL01oNWk0RitiWk5sdWZY?=
 =?utf-8?B?V1YxUm5ZNkd2QXFzU0ZQRHRyUnluNnRUL3JLMVQ1WWtCcTUzTFh4N0FhTlNH?=
 =?utf-8?B?SU1HTG1KOFpodmMzZWRZdXJjMmNJZXNKSGpsM0ViUTdncGtUVDRGSjloYzFU?=
 =?utf-8?B?VHcvUndvd1VEWW5zL1dTVTdYU3RENnJXdlhYL2F0ZCtFRVlQY2NkaVR3VTA4?=
 =?utf-8?B?TndOZDJTSUl6L29qNnFoUGtLazBZNWxtVGk1MXdtSXh1dEZyZll5b3hvdVZi?=
 =?utf-8?B?K0VTS3FsYU5jSFpuVlJtUVVVdFpSQWpxbjB2Q2tFdmFrRS9pR01adEJ3MWM2?=
 =?utf-8?B?R2tBanMrcVhPdWJJbUhOamt5VWpoeGlNbitIL1VLbXhKZ1IvU3dIVHVma2h0?=
 =?utf-8?B?aDd1ZzFEVnZiRnQyRGNIaWRxZW54Y2FtV1pJRlhxTUdaQS85YXQxR1VsTWVR?=
 =?utf-8?B?NlZsblVWaTBlaWUremdLREc1TTJnbkluQmR5YWVjL3d2Y2dSY2hOQllhQklL?=
 =?utf-8?B?TkJHV1JvZkdIa1F0NXhScWJDMUtUSjUrcWFFa2RYc0ZQcEVlODRyRjlXM0xQ?=
 =?utf-8?B?MEhlN3d2T2tucm1EK1Q5WGV2UVhCbHk2ODBxR3oxcXlOaElhNTNOYzRwVjJx?=
 =?utf-8?B?T3JNTDBHc2FlZUVpa0ZVNGhSeDczLzVOSTVCcUdNREdrV2tkdWVxS2hxc0t0?=
 =?utf-8?B?aGozNEZqUzhoMFlDVXkyQzZ2R3JRbE4wei9LNGlWZ284c3YzRlYyZlF0WXY1?=
 =?utf-8?B?U2NZOVAyL2NubkJiTTRDTm1SS0dTY0d1REhmVGdremNQMTl4UDhCRXJXZG0w?=
 =?utf-8?B?RWlhY0d2V3ZPNzV5VWJmeTFzTnBEUk9sSG1FNXFTR3JydXljeExpL0lRcjZO?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8546EE2D8E5B794292CD94AD65E27EC9@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b043120-a7b0-4821-4b40-08dc3d56a0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 20:55:45.3036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EptEciK6DYb47IefQlgBgpCInPztu2KIB23lyaeSkdn2vippa3mDjpFSb2+H9i4GbIq1iGCwbcL8bgNgQdQ4GBwMnEu0j1ChMXsRbySmDq0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB7960
X-Proofpoint-ORIG-GUID: qQcO2vIKiWPZ2s6HMOGfPwomc2GuNyPh
X-Proofpoint-GUID: qQcO2vIKiWPZ2s6HMOGfPwomc2GuNyPh
X-Proofpoint-Spam-Reason: safe

DQoNCj4gT24gTWFyIDUsIDIwMjQsIGF0IDQ6MjDigK9BTSwgQ2hhcmxlcyBLZWVwYXggPGNrZWVw
YXhAb3BlbnNvdXJjZS5jaXJydXMuY29tPiB3cm90ZToNCj4gDQo+IE9uIFR1ZSwgTWFyIDA1LCAy
MDI0IGF0IDA5OjU4OjE4QU0gKzAwMDAsIExlZSBKb25lcyB3cm90ZToNCj4+IE9uIEZyaSwgMDEg
TWFyIDIwMjQsIEphbWVzIE9nbGV0cmVlIHdyb3RlOg0KPj4+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1
Y3QgY3NfZHNwX2NsaWVudF9vcHMgY3M0MGw1MF9jbGllbnRfb3BzOw0KPj4+PiANCj4+Pj4gV2hh
dCdzIHRoaXMgZm9yPyAgV2hlcmUgaXMgaXQgdXNlZD8NCj4+Pj4gDQo+Pj4+IEluIGdlbmVyYWws
IEknbSBub3QgYSBmYW4gb2YgZW1wdHkgc3RydWN0IGRlZmluaXRpb25zIGxpa2UgdGhpcy4NCj4+
PiANCj4+PiBGcm9tIHRoZSBzYW1lIGNzX2RzcCBtb2R1bGUgYXMgbWVudGlvbmVkIGFib3ZlLCBp
dCBpcyBhIHN0cnVjdHVyZSBjb250YWluaW5nDQo+Pj4gY2FsbGJhY2tzIHRoYXQgZ2l2ZXMgdGhl
IGNsaWVudCBkcml2ZXIgYW4gb3Bwb3J0dW5pdHkgdG8gcmVzcG9uZCB0byBjZXJ0YWluIGV2ZW50
cw0KPj4+IGR1cmluZyB0aGUgRFNQJ3MgbGlmZWN5Y2xlLiBJdCBqdXN0IHNvIGhhcHBlbnMgdGhh
dCB0aGlzIGRyaXZlciBkb2VzIG5vdCBuZWVkIHRvIGRvDQo+Pj4gYW55dGhpbmcuIEhvd2V2ZXIs
IG5vIHN0cnVjdCBkZWZpbml0aW9uIHdpbGwgcmVzdWx0IGluIGEgbnVsbCBwb2ludGVyIGRlcmVm
ZXJlbmNlIGJ5DQo+Pj4gY3NfZHNwIHdoZW4gaXQgY2hlY2tzIGZvciB0aGUgY2FsbGJhY2tzLg0K
Pj4gDQo+PiBUaGVuIGNoZWNrIGZvciBOVUxMIGJlZm9yZSBkZXJlZmVyZW5jaW5nIGl0Pw0KPiAN
Cj4gSXQgd291bGQgcHJvYmFibHkgbWFrZSBzZW5zZSB0byBtb3ZlIHRoZSBjczQwbDUwX3N0b3Bf
Y29yZSB3cml0ZXMNCj4gaW50byB0aGUgcHJlX3J1biBjYWxsYmFjaywgYW5kIHRoZSBDTE9DS19F
TkFCTEUgLw0KPiBjczQwbDUwX2NvbmZpZ3VyZV9kc3Agc3R1ZmYgaW50byB0aGUgcG9zdF9ydW4g
Y2FsbGJhY2suIFdoaWNoIGlzDQo+IHByb2JhYmx5IGEgc2xpZ2h0bHkgbW9yZSBpZGlvbWF0aWMg
d2F5IHRvIHVzZSB0aGUgQVBJIG9mIGNzX2RzcA0KPiBhbmQgd291bGQgbWVhbiBzb21lIG9mIHRo
ZSBjYWxsYmFja3MgYXJlIGluaXRpYWxpc2VkLCB0aHVzDQo+IGRvZGdpbmcgdGhpcyBwcm9ibGVt
Lg0KPiANCj4gV2UgY291bGQgY2hlY2sgZm9yIHRoZXJlIGJlaW5nIG5vIGNsaWVudF9vcHMgaW4g
dGhlIGNzX2RzcCBjb3JlLA0KPiBidXQgaXQgZmVlbHMga2luZGEgcmVkdW5kYW50IHNpbmNlIHRo
ZXJlIHJlYWxseSBzaG91bGQgZ2VuZXJhbGx5DQo+IGJlIGNsaWVudCBvcHMuDQoNCkkgd2lsbCBh
ZG9wdCB0aGUgZmlyc3Qgc29sdXRpb24gaGVyZSBmcm9tIENoYXJsZXMgZm9yIHY5Lg0KDQpCZXN0
LA0KSmFtZXMNCg0KDQo=

