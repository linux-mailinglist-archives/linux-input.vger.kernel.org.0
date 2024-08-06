Return-Path: <linux-input+bounces-5381-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4668B948CA5
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 12:17:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B72AB21C8F
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085C31BE24B;
	Tue,  6 Aug 2024 10:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="P1/jvZfE"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450AE15F403;
	Tue,  6 Aug 2024 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722939420; cv=fail; b=bDMXbPy5GtPe0UoSlYP6/AUk98LvdU3q5MVFf/6Nw8Ei6T1dZjGQYJij+4U7ck5gtaykAw+FqWghi4umU1u9SJdnwHl1w1BkYVoYXRoWq5iwVWkBbvyLfImo1fba6D7MSlYZF9wTybuGEySy3TsNTGnVOsam6svGNE0fpUWZOco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722939420; c=relaxed/simple;
	bh=COv0wQEEcWOOLP7GbWV3oqGdXC+YOtUU77G2ShDiSe4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AnzBqzMVGszX7aD0L97VAUOfKNQ6sV17WmKIHuoCDIp+LUrZi74+DfM7Nc06ajF9LhUtJ2W3sdV84tI4VUYkH5CDgIG/8ZVYC7OEvrOa07EZgIy+1FyeUwqSAuqN149ja3SDuIp/94tpEyBFgC7quhcwxL097e12RpN1MDqWXn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=P1/jvZfE; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47651Hji013134;
	Tue, 6 Aug 2024 06:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=COv0w
	QEEcWOOLP7GbWV3oqGdXC+YOtUU77G2ShDiSe4=; b=P1/jvZfEq0kdLZKeo52XB
	iNYCYe/xVDz78Kzq/uRLX1LVQVZaHG/C8rpKPiyA2BtSCNMmU8dKOVmBbKvG/uOm
	uvqODU1n5zJ3Npr+fLp1BSgI+um0MzJ3+N82WYPuQ5V0WnkKBNttG1QFN2VreuH4
	RoBDMsF20J6mm9fCqTKi7pu2ftNxYdLEaiRbHvviW5i7ANpT5AKhEYn/H9ZY1oTD
	0DqbNzOxdvlV8xJ3OFkxbc+wGULQRkSk3LgCJzi/VEV7hkgUdacOJCccZ9wBDGG2
	j4Ja9g/KOKzg8YpWD3RP75t3THll56BJeh7yOn4PpqCCP7SnP7lAO9BqN0QdikpU
	A==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 40sea99kf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 06:16:54 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RFX3dDPHt1jkcVEoPOm+VDm0VZQQFaK9yow5ev09d1tfGxNVcVGK/a5d9VfKFienV2q4teP3gUKnpPfYgQfsAMV0YVutelE2APNOaQumQqU2A+C7TPrazFwwm6sPpXYbeCy7p1szp0IVcGw5w96ZLB/OE1sFVsdRpbvu5g0k6Q/rpLZQ7qL6tp0B52O+G5g2I/LgdpomuD5t3qbByWSnAsEw87l8ZStOj4FzObxnDcHU5nwYs9Lc35GCZKhf2tweG5ae44LQlAVm+ACx4xKBmBL8HJpyL0BgQ3Jiiw5HFGlsEXjTbk3OB7L6Pwep3wHvU3AzYtd04g8gEocwNm031g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COv0wQEEcWOOLP7GbWV3oqGdXC+YOtUU77G2ShDiSe4=;
 b=UiwIQpkLVSItjrIjRGHB/l64fYw9STTWHxKUTrOzMjJ4EeCd+//rd+hDU13BySHcaryxS9iQBBAhcBExeWtj25+FtVXZALUuhK94b6cvH0bMtX8USd3xOU5GvsRCsqEoPCoGJDM+mVMnzvThE5mffvPUbTSfMyQhIKHLtbreMXvGsL3D5ldKsvS0Q4XZeQLvOCLT4a51cEwlxKkSyUBzINFKimWLsfVGjDz+GsHQXDucOUoTUA8FT0Gdy52EjbaXjsbYtZgSuc2P+GQoydfI4GQPaqsePMB3nN1URqnQ8rK3r98zXt6YUb5OhETDqF8GF4xzXfEzRmtTvZpvZDJUNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by BLAPR03MB5635.namprd03.prod.outlook.com (2603:10b6:208:299::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 10:16:50 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7807.025; Tue, 6 Aug 2024
 10:16:50 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        "Hennerich, Michael"
	<Michael.Hennerich@analog.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Artamonovs,
 Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>
Subject: RE: [PATCH v9 0/3] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH v9 0/3] adp5588-keys: Support for dedicated gpio
 operation
Thread-Index: AQHa592OMvCrCJMDOEeEILiPw1DTWLIZ7p2AgAAR/lA=
Date: Tue, 6 Aug 2024 10:16:50 +0000
Message-ID:
 <SJ0PR03MB6343FDF6A250691B387088A19BBF2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
 <bd4f6aca-ca3a-465e-8b46-e9c5e11ebad7@kernel.org>
In-Reply-To: <bd4f6aca-ca3a-465e-8b46-e9c5e11ebad7@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3RabVF6WkdObE1UQXROVE5rWXkweE1XVm1MVGcw?=
 =?utf-8?B?Wm1FdE5qUTBPVGRrWTJVMVpqZzFYR0Z0WlMxMFpYTjBYR1prTTJSalpURXhM?=
 =?utf-8?B?VFV6WkdNdE1URmxaaTA0TkdaaExUWTBORGszWkdObE5XWTROV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU1qZ3hNaUlnZEQwaU1UTXpOamMwTVRNd01EZzVPRGt5TWpB?=
 =?utf-8?B?eklpQm9QU0owZG1kVU5WRkZjR0Z2TTFOMVUyaERSMHN5U0VsME55OTFMMGs5?=
 =?utf-8?B?SWlCcFpEMGlJaUJpYkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNT?=
 =?utf-8?B?RlV4VWxOU1ZVWk9RMmRWUVVGRmIwTkJRVUp5TW1GeEx6WmxabUZCV2xkbFRG?=
 =?utf-8?B?WmtVRmRNZEZoc1dqUjBWakE1V1hVeFkwUkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlNFRkJRVUZFWVVGUlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUlVGQlVVRkNRVUZCUVROTWFGTm1aMEZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVbzBRVUZCUW1oQlIxRkJZVkZDWmtGSVRVRmFVVUpxUVVoVlFX?=
 =?utf-8?B?Tm5RbXhCUmpoQlkwRkNlVUZIT0VGaFowSnNRVWROUVdSQlFucEJSamhCV21k?=
 =?utf-8?B?Q2FFRkhkMEZqZDBKc1FVWTRRVnBuUW5aQlNFMUJZVkZDTUVGSGEwRmtaMEpz?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZGUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVdkQlFVRkJRVUZ1WjBGQlFVZEZRVnBCUW5CQlJqaEJZM2RD?=
 =?utf-8?B?YkVGSFRVRmtVVUo1UVVkVlFWaDNRbmRCU0VsQlluZENjVUZIVlVGWmQwSXdR?=
 =?utf-8?B?VWhOUVZoM1FqQkJSMnRCV2xGQ2VVRkVSVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlVVRkJRVUZCUVVGQlFVTkJRVUZCUVVGRFpVRkJRVUZaVVVKclFV?=
 =?utf-8?B?ZHJRVmgzUW5wQlIxVkJXWGRDTVVGSVNVRmFVVUptUVVoQlFXTm5RblpCUjI5?=
 =?utf-8?B?QldsRkNha0ZJVVVGamQwSm1RVWhSUVdGUlFteEJTRWxCVFdkQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJRVDA5?=
 =?utf-8?B?SWk4K1BDOXRaWFJoUGc9PQ==?=
x-dg-refone:
 Y3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3Qm1BR0VBYkFCekFHVUFYd0JtQUc4QWN3QnBBSFFBYVFCMkFHVUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQThBQUFBQUFBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElBQUFBPSIvPjwvbWV0YT4=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|BLAPR03MB5635:EE_
x-ms-office365-filtering-correlation-id: ab9445f0-7d8c-40a8-c680-08dcb600e2fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QUU2Ryt6TWxGbHFPdmRENUU5Z3lLMkdWMVQzem8vaGI4SFZFc2lWbE5jQ0px?=
 =?utf-8?B?ZmJtR2FFdTNmbW82ckNBT0FWK0lydmZ2eHFJb3FVY0pab1lGcXVmVDZmVmEy?=
 =?utf-8?B?WDUrOUJqY1BJZ1FjNGhyWlBvcnhaU2pVTXAwYUlHT2lYemRuaDVVa28yWVpi?=
 =?utf-8?B?eGRzWjc1UXJWRmJhYkhZVzRpdkV4RVFlRU5iamNsemdtcFRpNFJSMDVyQXJL?=
 =?utf-8?B?dkYzM1N5aE92VWFLTE44bmdHdGE1OStwVzBNa3RYaFNJUjF2VWdtRE9oNHp0?=
 =?utf-8?B?elhLUzlKUTBLWFlBd0xtTUZsdTVQdCtpNE04aWttYVFYWUpXVGZGWkczKzNE?=
 =?utf-8?B?bkJkczVXU2Z3cUV3Q2Fpbk5rb2EzV0h0Z0N6QjV1Tk5SSUh4c08zajRoblIx?=
 =?utf-8?B?ZW1xelY1TkJUR1BETGNTMXhOQ2NDamMxRUUxcnRObkxXVTByTGk0Z1NGZjBR?=
 =?utf-8?B?eW10OE4rVFlqMDlqcGt4ZVd1VlgxWHFBZW9vd2hreFdpS21iMFJWN3c1eDRV?=
 =?utf-8?B?NWl2aWR1MEdmL0lncXlEeDlvakkwM1pJUFErZWZHa01tcHRTZGs3MmFadHJz?=
 =?utf-8?B?eVEvVG1MYmJtSDMxRVl4VXkvNHIwbTlKU3VXWDg4cU1KK1A4VWFQVUNFVjVW?=
 =?utf-8?B?WG5DL3p1SllrUVNhamIxSFpHK2xGd1hVc3pwWlZMcE1NNEFrNjN5VWFZaGxN?=
 =?utf-8?B?MVorTmlYa04zbnRWOFJyYWZFcVZFUXhTRWx6ZkpMN3pURHZPLzlCTWladElL?=
 =?utf-8?B?eUxabzVaOVo3R2E5dzhWZktrMEZROE0yL0J2alpIZmlvRFhWMUUxNTVrSTRP?=
 =?utf-8?B?VWdJTU1adSt1eHo5eVBkNFVXV1JDeGs2ZEtLZno2UjBQQllnTkpIdE5ZOUFC?=
 =?utf-8?B?MW9qaUh2bnBlNWlBelMwcDF0MFVkM3dHZGpHbkdYUU5ObkZTMmhMamFMdGFy?=
 =?utf-8?B?OWYwaG5jVUh3aUtKMzV0UWFlTkhKQURlTFVRd3lpVU81aThVMzF6bmhiTGFN?=
 =?utf-8?B?blJBOGNjSmE4ajBWSmpma0dKa095b1ZicFhMd25LMEowZWd1cFlGa3ZGQVRT?=
 =?utf-8?B?UFVTNDlIYUNWdnI3QTQvVW83SEljcjdISTVSL2J2ODFnM045cFZ1SThxaXR4?=
 =?utf-8?B?Y2N4V2tkN0N3SGpob1Q3WEovaUUwN3lyRjI3aWdHb3B2ei9CVTdnb0VIeVZF?=
 =?utf-8?B?V1Y1RWxYMjBSamRXQWt2QkRlb3dDdHhZVUwxMEI0NG1xRGQ3YldjWERxeGxZ?=
 =?utf-8?B?SG1LdkVOVTl5d2lXdHNTbmE3ZkdOV2VubjJreGl1ZkZ3ZFdaMHRzNlNLbE05?=
 =?utf-8?B?cXRoZ05WNGtsdkI3Q0tYbkVxRUsvR0wvK3lUVVJ5bGViUFArT3krTlhQbEp0?=
 =?utf-8?B?dkpxdVEvUkxraWM3dEVOOW4wdEdiUHJsd1lrenpjenplellVWVJtRWQ3b3B3?=
 =?utf-8?B?TndQeCtFd1dwaURqZ2p5R3FRakFpQTM5ZGppYnQwdjFGdHVoajR6SmhXamIz?=
 =?utf-8?B?NmJCQWhuTmlLeFpaN0k3WUtIamYrTW94ZnBJNWZHU0tTcmNJVXkvaEs4cHE2?=
 =?utf-8?B?aHRMaGtJTDFFekZpZ2FRQ3V5S2hVVWFHUExGRnhEdXA2bnd6M296bmtsRDRI?=
 =?utf-8?B?emZrUGI2SWFxeEpNRjc5YWMyZVFJWkhOdWxyd0MvUVdzMjQ5KzRISncwZENE?=
 =?utf-8?B?V0ZNVkJjQU5wcnplTjJOYVdBSHE2d2p3eUoyTWowaTRwaCtsd1hVSXhGOHlu?=
 =?utf-8?B?Vms3KzVJZmhXZ2pvNFR3T1BseVhOenF0aXRYUXlRTVBOS25PSUZEVVhmc21s?=
 =?utf-8?B?eVVNRm1YMjhHMTQzSFBMVDFxN21PQ1pDZXNmVGw1UWJWUHI1QlFGSGVubjYv?=
 =?utf-8?B?UHdkTkZVNVFvb1pQYk41emhKSmFhZEtzbDhxdnRPUXpxTWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dnRzRjFwY2REclIyeDVXWjJta0p0N2ptcG9DQUxyS29KZU0xa3VlSFRuSERO?=
 =?utf-8?B?Tzhadms2c3NLT2Z0VmwzdExWbEpqMlA4eFc0NDJ3WUZ2S1lvOHExeGxZckxY?=
 =?utf-8?B?VVRTbDRGS3JrSE5yL2lBVW9Ob01WSWhYTWJZWGpBYis1YVc4RnhNcG9QcnRP?=
 =?utf-8?B?cEhLUVlUaHpQQXRVd1BFK09YcTBnUG1FZmZQeU1JakFaVmQyUWcrL0xDOWJy?=
 =?utf-8?B?OTVkblhtY3FVeWR0VW5HOWVvaGR1WG1MOXBwbDl3Mm90VFVaVU5PVHhyak1N?=
 =?utf-8?B?eCtwaHBaK0lpYW41NktMNG5iT0p6RVdmWXJHMGdrZ0dCRUYxcGdRWEdEUU05?=
 =?utf-8?B?VlFpSTNKKzZkSFo1NnEzc3FhWmkrYS8vU2Y5Z2dHR1c5ZzR3M1dwbHJCeU9L?=
 =?utf-8?B?aldpTjg5L01nQ3paMllBRnVVZTRQak92RFJvNTJXUyt5VHlkTWxwcW5zczNO?=
 =?utf-8?B?d01NRVJRMmxqUUx6U3lrb0VZQS8yek1sYlM3WUsrQzVaVVFNTHhkcUhGUE1z?=
 =?utf-8?B?d3IwTWo0eDFQWnczTkgzdnA1R2ZObzdWdjZEM3FVbFRwZDJUUHhaeDI3UHc4?=
 =?utf-8?B?RFovbG1MQ093eEZFQzlPYnAvcjBGL0lMb1MyNUhqSkk3bjNPOXRoWE9uTDd3?=
 =?utf-8?B?bXcrNU1xVEZnYWxvYml3YktXakc1SW1GM2grUjFEZ0s4eVFnalo5QTJhdmQy?=
 =?utf-8?B?blpoWWczdlN2Yzh2ckh3c1pVU2ZvWEdTc1FrL203b0lsckl5czNmb0gxaVRx?=
 =?utf-8?B?Ui9WYXpJaC9rWEdROGxTMkw4TDl5Rm45YXp1WnRWVW1ydEljZzBjb2RFcEtW?=
 =?utf-8?B?dzNyK1JXZzRFekNpeW0zdzNnOFpDdSs5Sk5NZlNXbDNTTWxvWUNjM3hoTG0x?=
 =?utf-8?B?OVFCTEg1Vzk1aDl1S1pac2xldjVHRi9nb3hJejFiYVdXODM5MXhnMXpGOFVX?=
 =?utf-8?B?Qm9USjdVZkt5dVMwNXFSbmV1VDFYQ1hvN3pCanlLYWJOZUNyand5cXA5Z3Rs?=
 =?utf-8?B?a1RpbGtQSTUzcE5VWkw3d3lMM1QvNWY4dndvZitoOWQ3ckpRd3lOM1ZYdW4y?=
 =?utf-8?B?VURnYXA0blhTNVdpNnVFZTh2QTVLMmhQRGpDa3pBZ3ZGUWlLODY1R2xYSnFw?=
 =?utf-8?B?NkFXRmlxU2k1U3FzczFocGkxOTNabUNuWnlNUXE2RXRhMEFuZlE1L1grTXlT?=
 =?utf-8?B?OEJGTW9QUUdMYzk4VHVzdDlJWkFTU0RySmgza1pObFN0V29DRnpDWFh3TlFv?=
 =?utf-8?B?bG9GT21iU0l5Wm9KNDZWK1hFRnN1WmxucVJTclZiUy85QStGZmxHbWRNNStI?=
 =?utf-8?B?SGd3U252TDJZTWllNDRYNk8rWjdrSGoza3V2MWhqVEluY3d0TDY4SFhDNkM2?=
 =?utf-8?B?NzJQL2hZNFdhbW9sUzJsZVcyZWdTb3paUzlGRFZQYjZyaWdZZWhySnA1UnRQ?=
 =?utf-8?B?K29tdWdBcGRUVy8weHBtYzBwTTMvdEtDTWZHWTBQZVBucTVXMVJZWU4ydjhQ?=
 =?utf-8?B?MlFxaEhZdG51cmhaZEEydGpaWlg3MkhOeFFUSHJRcis4bEhTZEFPbjUyL0FO?=
 =?utf-8?B?amZWdkM1eHdsblFSQXhCaU94Tmh5ajNlUHdSaVRkMDlrYm5CUzhuZDJ0VzNS?=
 =?utf-8?B?TkRnTHhkV2RvREhoM3YyNFlYSXR4YVlFREVvcGFkcUhQbHJEaU5jT0xxNzNH?=
 =?utf-8?B?U3h1N2svY3hiSHRJdDBySnlFK2dXcjA1TTdaNWdxcDNIRVBmNUFOL3ZIRDNl?=
 =?utf-8?B?Q1g1UGhpcmNoNEZsNUNNbzgxcWNyd2tGQnhkMHExL2Fwb25FbVFUV3hxWWg3?=
 =?utf-8?B?QnJ1ajR0bWErMnZkb093cjJ3SWxJQ1JoQ0pPSkRteGtOajlPbDRwR3UxZlZD?=
 =?utf-8?B?eDJ5bjFiNFlLQi9ZUmtteDVjMFhIaGI3anFtOHErVXdNZms0WDJvN3ZBNkFt?=
 =?utf-8?B?MmZYVXJGd1RpOS9IY2tVYmhRU2lmY3VIb25ha2VFQ0dlcGpzMWVyR3lMamdz?=
 =?utf-8?B?Nis2NDE4Q0NhUjlHQjV4RHJUY0tGbTlOd2N4NU5WZEhaNFlxRm1tV09SV3Nj?=
 =?utf-8?B?eGZWNGpuK3c1cG13WCtVMGlXcWVmdU44UlVRVzNOK0EzS2h6cHkzSEVHS3hy?=
 =?utf-8?Q?DOPsYEUUOTj9hrzCmS2dmuqts?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab9445f0-7d8c-40a8-c680-08dcb600e2fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 10:16:50.3555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: niW429AAQreSlqq4GXt22DeU2Hyze2Uu48/CaGf19jAHhw7nuv1xwnnUc6uYHC2C0dUiE49Gcw0WZ+5D7oKGevP4dKQXVpcwGqJVffC5Wg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5635
X-Proofpoint-GUID: -bxjlzMVzcI5Y2UOHIfJAwy1uravtlIi
X-Proofpoint-ORIG-GUID: -bxjlzMVzcI5Y2UOHIfJAwy1uravtlIi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=961 mlxscore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060071

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgNiwgMjAyNCAx
MDowMSBBTQ0KPiBUbzogQWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3YWxAYW5hbG9nLmNvbT47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IERt
aXRyeSBUb3Jva2hvdg0KPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5l
bC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTYSwNCj4gTnVubyA8
TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IEFydGFtb25vdnMsIEFydHVycw0KPiA8QXJ0dXJzLkFydGFtb25vdnNAYW5hbG9nLmNvbT47
IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWthc0BhbmFsb2cuY29tPjsg
R2Fza2VsbCwgT2xpdmVyDQo+IDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY5IDAvM10gYWRwNTU4OC1rZXlzOiBTdXBwb3J0IGZvciBkZWRpY2F0ZWQg
Z3Bpbw0KPiBvcGVyYXRpb24NCj4gDQo+IA0KPiANCj4gPiAJLSBBZGRlZCBkdC1iaW5kaW5nIGRl
cGVuZGVuY3kgZm9yIGludGVycnVwdC1jb250cm9sbGVyLiBOb3cgaWYNCj4gPiAJICBpbnRlcnJ1
cHQtY29udHJvbGxlciBpcyBzcGVjaWZpZWQsIGludGVycnVwdHMgbXVzdCBiZQ0KPiA+IAkgIHBy
b3ZpZGVkLg0KPiANCj4gU28gdGhhdCdzIHRoZSByZWFzb24gb2Ygc2tpcHBpbmcgdGFnPw0KDQpB
cG9sb2dpZXMgaWYgSSBkb27igJl0IHVuZGVyc3RhbmQgdGhpcywgYnV0IEkgaGF2ZSBwb2ludGVk
IHRvIHRoZSBsaW5rIA0KZm9yIHRoZSBwcmV2aW91cyB2ZXJzaW9uIGFzIHdlbGwgYXMgbGFiZWxs
ZWQgdGhhdCB0aGlzIGNoYW5nZSBpcyANCnVuZGVyIHY5LiBJIHVuZGVyc3RhbmQgdGhlIG9yZGVy
IGlzIHdyb25nLCBidXQgYWxsIHZlcnNpb25zIHNlZW0gdG8NCmJlIHByZXNlbnQgaW4gdGhlIGNo
YW5nZWxvZy4gQ291bGQgeW91IGd1aWRlIG1lIG9uIHdoYXQgc2hvdWxkDQp0byBiZSBhZGRlZD8N
Cg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KDQotIFV0c2F2DQoNCg==

