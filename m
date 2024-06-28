Return-Path: <linux-input+bounces-4697-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA1691BD41
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 13:18:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44994283365
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 11:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098D4155C96;
	Fri, 28 Jun 2024 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="fxLKsf9m";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RJQxHSs1"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E830155744;
	Fri, 28 Jun 2024 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719573521; cv=fail; b=Gus2nk78+39xN1fPRWbAbK8vG59mA/g4pE0yXr7LSfDU0wcFDy12HY6Ja5cwcM59LL/HOwsixQFFEd5vcWRlrTntRw4kKwaxGTyb5HxuEO3ih0r+SEmuXIr5vsCxwBRLkHT2lVAPgNHM94VbZy/G/k08U/OHWqS72ha38A1b6W8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719573521; c=relaxed/simple;
	bh=/PR28DK7+XhKD2FjaLyQrp0Ty+fJgKKs9Xldr2qTBoI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pBI9+7VeLpLULhnRniv6z9q8+u7xlEX0iZsPuMHKUo2ZupxqKmGGEs+C0ec1vLRcJBqlxFTYPkcq9iLT3JVGOYKvIn4Pc4Ds4cVFNwZ/O/MObTgwmd2eiF72iBKcwnSM+XqO+BUmQ2v1Wu66UFiNADWJ7+hw9BkIPgY/4kdjo1c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=fxLKsf9m; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RJQxHSs1; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45S81RMw017872;
	Fri, 28 Jun 2024 06:18:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/PR28DK7+XhKD2FjaLyQrp0Ty+fJgKKs9Xldr2qTBoI=; b=
	fxLKsf9mZDzRbKvuRZIsrE+2hlnUJPHCtxJqtdWjWTIr4yCYa9RlUZ4eQyroD2Zd
	DeffktoLu81ehdOqjGyuSHv48XChmfsJzDZgbeShhJZc55GEydZIDa5xEM0qmMN9
	2NCDadWIGo2kLbBNva/53NTzEOFfKMf8nT1Y/7pjSN5A6585N9XO89rTBPbAXGuJ
	ClOBaBtZkC7UmxwDTKiKzUfa/ikWURUZwmJTfYZRagoJ1yxuA1bzREqrH4CMeXuc
	me1qwPIwZMUsgUWsOcX2r1YjmDpuGbPghZwRfcHXZ76U9EEVhPSNG5zpM9L4aLq/
	At9rBomujhb7jNqN1af1cg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ywu1hxhjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 06:18:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QD6PyewDCLoIoHNtHarZKWSEKXYvvveHwbIuHs8cmwzRGHcSSAXf9b/RoWRXNzemG7/ZLAYeKMSvKRtkIEwMfJOt+OIbtIQUwAqtlwF+RKOv2g3NXOUb8eOeILqlr/kMou6Cy5Sok34IVz3OUaKDgR0RqXduDzKsnsQNnsCqE1CMGQ0dXhWQK/C5lBMo3YEEDGDJPpQOZNXc3J9o7ejaG7rRprTGdMOEEeK36AN9Mxcv6bdg+HXW8AinFg7xc1QQBAIo3KkghnQxBlWvOkaAYnjH6vBI2uA6/UXX8sd5CAyCuis+pxtGHcoCjTw1qAzszMB0kJhNn7ZosCVUCXMycQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PR28DK7+XhKD2FjaLyQrp0Ty+fJgKKs9Xldr2qTBoI=;
 b=Mebn0XPnNR2e8NmA2Pw2MJIJPYQs3KEscSO2mG5bKUVeqdzrGeVOX+MSkhNDdlys/A5KzYl2QWlgBJDJuabj5SXbwzvNod7M9GNqhc1x1HiDDikdc7UJXsqmmM6R0Qzt9jqyP9P6Wb2neH5YGRTZhVhtXkBEb89PgdRtltKP95AKHkfM5Had1Xh8TBHC4zMci7WO4OkjJ1HkvxZR+0MOh+At9YPi9Puevd/U/lgoMLDpPxmUtY5LgVT4EDC2w2hH2oxREFWVlojSGd1nYmgu/93Iq6nv0n2ZDgbRfUkt83oUymsjCJyyYIfsTsAzUSSYUzSje/7aY3ulGQRgau3lDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PR28DK7+XhKD2FjaLyQrp0Ty+fJgKKs9Xldr2qTBoI=;
 b=RJQxHSs1KQ2xYT6ZCkhn/Bz8cQCpSFiwjLwb7vcfQsVBtAbGwJmE9rSmOSqM8oJ9htr2kfqhijwG9PmHkDpq7+oic8eP0l0BGnC/KfJSprPp/dPhuJ0c5YXv4sH696cqj24pEDJCGN1T8DAzVG6FMirvV900Afe+P6UIzT/8Dhg=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 LV3PR19MB8253.namprd19.prod.outlook.com (2603:10b6:408:1a6::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.35; Fri, 28 Jun 2024 11:18:22 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 11:18:22 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Lee Jones <lee@kernel.org>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v11 0/5] Add support for CS40L50
Thread-Topic: [PATCH RESEND v11 0/5] Add support for CS40L50
Thread-Index: 
 AQHawy1sjk2JaBubyUKzdOotv82g/bHQ4BmAgAmqUoCAALIaAIAAUkeAgAFPHoCAADVzgA==
Date: Fri, 28 Jun 2024 11:18:21 +0000
Message-ID: <531E5C17-B55C-4548-97F7-B0B494AE7B16@cirrus.com>
References: <20240620161745.2312359-1-jogletre@opensource.cirrus.com>
 <20240620165935.GT3029315@google.com>
 <21975F67-D71D-4D5D-8042-8EE64E8864CA@cirrus.com>
 <20240627071258.GE2532839@google.com>
 <C8C41985-E19A-400C-9DF2-720BCDE984E1@cirrus.com>
 <20240628080653.GJ2532839@google.com>
In-Reply-To: <20240628080653.GJ2532839@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|LV3PR19MB8253:EE_
x-ms-office365-filtering-correlation-id: f1b1447e-4053-4542-cd2c-08dc9764053b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Q1lGYkk5YmlraE80dW1yKzM0N1ZMTWhwVGZSLzk5MlFZUkpNa2sxZXN6d0R4?=
 =?utf-8?B?eVRwT2FjYjBKTDFWeTZmR2NTL2g5aWY0dldncW96UXRkanJlK2pjWVpTRSt5?=
 =?utf-8?B?Nm96N0V5VHFtYVdhd1V1WnNGdGRUcjNGMVQwc0QybDFTQkZNUitZVWVzUWZI?=
 =?utf-8?B?dmFMdkdJWmREOW1Ta2ZIREdtOUQ4OVA1dHBjUEFiYkNVWHpOWmc5c3d5c0RF?=
 =?utf-8?B?anhpdnVjNWUzSW5oTVQxSGljc2dJcW9CY3BlUlVRRmZCRTBKdnE4L2RCV09E?=
 =?utf-8?B?MHV6akJjTEJKN0FSaGpFRFljeXRZRGR2dW5UcjhqMVBnZFR2aWpjOVcvRGxa?=
 =?utf-8?B?Zi9LYU1lNGdNMTIzUHNZdGFUcTZ1bVhKT0E1WTFLSkYzT0xPdmtKVFNXN0Y3?=
 =?utf-8?B?SkhZWEw0azQ5ZlBPQW1WRDZtaENaN3FCZ2psemlLeVBYazdTSVVpUEh3dnhU?=
 =?utf-8?B?eCtPQUZnWVMvWUF3eVFvRGM4NytkYnhZSlhUVkR6SVFrS01ZdytIUW8rYUJy?=
 =?utf-8?B?bWVGeUFndnBnUkxreVBpemRrcXlqYzFNQ0NUZ2lWeGpnYmRRTW9hM1RpREFt?=
 =?utf-8?B?dlM2MFhtOXVNODl6SmxYdGM2akNmellNSUNFWVpKb1cxUXJDQWtUYkRTQzhv?=
 =?utf-8?B?OU9mVnBoVWs3TlMwU2kwVnE2RkwrKzNVNDdPeEZCSlBSeTJZU2RORGg4Tmh4?=
 =?utf-8?B?d0EwRzN1Y1lTN3FVWmxXYjlXMFRWVFJncWU2Nkhhbm1ZVXpCZDhObVZIWGVC?=
 =?utf-8?B?ZlRvZ1NhUkRXVjFYRG5UZU1NTzFnVmtBNDNLNUNZVkpPaHdDYmY5ZEo2ZHZL?=
 =?utf-8?B?SStBMWdNZHhkcE1pWnJsZzgvNkEyYldyQXdtOUU1eTY1cDQ3enVGaFVoRUdT?=
 =?utf-8?B?c1lHVVUrOU4vd25OY29OM0N4MWhSZEtiZU9Ja3lmalBZZTZ0azdML1ZPeGdx?=
 =?utf-8?B?MEkwMkFyL2E3bmFxNlBoSHYyYWQvSHFRVTlmTHRHcTlpN3NkOG16Q083ZWl1?=
 =?utf-8?B?VnYwTDNVMzQ3WVhUM2hXSmJCV2hJRDdPTU1nZHQvOHVOREJreFNFOW81S3Aw?=
 =?utf-8?B?VnFxbGJ1Q3Q0c2hCak5NN0hWU29jTFN2K2xibFhpUWVvUllCcDNvRDJXSS80?=
 =?utf-8?B?bE53N0QwbFFzTXVsWkVGZ0VZRkNaWTIrME1zcktyb0NzOGpYcTMrVGdIZHQ3?=
 =?utf-8?B?ZHBnSGg1MVNRYVo3aXJKNEtyeW9pNlgzWFVyaGVKMkNVOW4rdnRLWnVURXB3?=
 =?utf-8?B?UzZEdFNhVnpocXFHbi9ZREg3ZmtaM3RYTXU2ejBxOWp0ZkNhcVlQTnY3Z21Z?=
 =?utf-8?B?TVJmNXlKQlp1WFdxT1A1UEVGK090bmxyNjh2aXhBbGgrb09ETEhkQXNKTXI2?=
 =?utf-8?B?ZC94ekJ3S3VMZ1Y0emVHcEtqOHVyWHFrYTRMbGJVUUxZT0ZjQmRkdWk3YUVi?=
 =?utf-8?B?U3BxTExXVFNvVnNreXAxTU5jUXY0TXFuY0dpTmV6Y1ZVOVZqempGVlhzRTVF?=
 =?utf-8?B?eGt4ZTl4WnpnV3dtM3BHZmZvVjJ1d3pGb01IVGJxTDVnYXduRUM4ZUlsY2lt?=
 =?utf-8?B?UThuT3VjazA3dm51N0Z3S1QweGxTdGpzNkxmYStqRWI1YkJtUC9rNnhwNG13?=
 =?utf-8?B?L2FLY0ViUmpBWXp1OENKNWxIdjEvSjZ3LzlBTUdvczVxa1EzY2VQZHhhTnlX?=
 =?utf-8?B?c0ErZXNBKytQdmlMMEJveDdQMndwbEIzVlI5aWw5RmIzYVE2VW1Mdi9wR1dC?=
 =?utf-8?B?L3BwTjhnN283UDkwamNNRlJzTjhUYnVyU2tPR1h3M1RZZzVjQ3NCa2RVZmlJ?=
 =?utf-8?Q?O/APeP3XHaKAFDeWpZ1NpJ01dJyK9/W7mr8UE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NytzU1d5bkJwYW9yNVEvUUpIRHpoaWpkRm1jNzJTR0NkaWRQc1M5ZEllZGt6?=
 =?utf-8?B?dDBCNFZVNFlIUzBtUzYvYVdLMVBuaXgxM0J0SkhZWms0RXhmdTVabFA1ZUU1?=
 =?utf-8?B?TWtKWitQSFhrK0tBaHVvRmtIbWxISVFMS3RoZzUyQUhobXQ1b05wY2Q2clZN?=
 =?utf-8?B?bWZFTWFwcnBPbjRPbU93Y0RlS01kd3F5SXBzNmZxMVZ4d25xOGxnaWJBOVo0?=
 =?utf-8?B?d2lFN1RVbFovbHA0bUY3akFUbGRoWldVem81VWZhbElpc281QzZPcVV4dUlt?=
 =?utf-8?B?U2dObzNXdkRoaXpKTkk5bHdNM0tra3kwVmM5dEJ0QkdiSm9YWGtCVGxvb1JS?=
 =?utf-8?B?MGh2YkpEQ21kUnkzeDQ4S3ZkbUZsVW9STUZkNUhmZDJ5WGFpcE9NQW8wUEZQ?=
 =?utf-8?B?M2FwZCt4bTZIaVRvL3d6ZVBuZmJ6QnlJTzJFMW80aVVFVjFxd21kYVBJOWZz?=
 =?utf-8?B?ak9oM2FXcW5EMXM3c2oveGFyUXYvQytRSVNkOStXYUpUY1JFKzl3bzI4aEFB?=
 =?utf-8?B?NzVOMzlXV0Vub21FRnJmREc4WTc1eXFNanpOSGdHYVVhcXBlQVFBL3IvL2hI?=
 =?utf-8?B?U1BxZDEySDFzK1FXSmZySWZwSXpUMktJaGdHZmxjWDNIbktxa3lFQkVhOFpj?=
 =?utf-8?B?SjlmcDR6YzB2S0ZQMU9OWFYrVkFxcWJ0NXdqaGhBM3BzSVVaTytkVGVNZXFy?=
 =?utf-8?B?dFhlVEl1V1E4WWorRlJycnQ1RnZ2dThMdnEySzBraThaTWpxL3ExVnB1V2J5?=
 =?utf-8?B?VkdBUWlYbmg2UStmR3pNYnI4T0l0aDYzcE1BRGs5aFJ0VUhXeWRFZkR4cURn?=
 =?utf-8?B?SERpV054Y0hyZGFsWENRa3R1RTUvNWpheVZEUTlxeEhqSXJGd3VwcUlaTzlh?=
 =?utf-8?B?TDNkUnlUa1VYUmlPUnJMamh3RWV5dWdyejU1bmRZRlV4TnIxaWJkSGIvZm93?=
 =?utf-8?B?TTdaYlRkTXYxaUVDbzcvUWNxUHJpK2lFNXY2U0ZoSG9yOU5oclNyRGZGN3ZJ?=
 =?utf-8?B?Zk5nd0FnWjc5d0dWcVorM2lhdEYraW12c3R2MFhMd1pSeDErVXFnK3pmbXdl?=
 =?utf-8?B?SXdheC8yWG9GY2ROTFcxcTB2N0pXd0tYbVc5SmVQVFcvTnIvSUgvOHlkVVBz?=
 =?utf-8?B?NHZMOWRmWlNQUlhmYjRpdXI5N0d6alMxZ0poL3V3NzFybkxQM0ZVWGJFSS82?=
 =?utf-8?B?ZWY5L1o3eFphbzByQmdwbG1RVnpySHZKT2xBOVo1NEZ2aWphNE51QUllRHNV?=
 =?utf-8?B?dHpVMVliMW9lZ2pNYkhuamRrU05CaFZoT050N0xzc3Rpbnh4MHVpQW1CUnVh?=
 =?utf-8?B?Mm1uR0x6QXJBalgvZ28wWERqdHFFMG5lYWhyR3pDa2pBQmxaUkdlcXpJMitk?=
 =?utf-8?B?dVphVWtjQU1idWliUVBXT1ZZaHk3MS82d0c2K3laNi9RNlBiVUY1a3NvWE55?=
 =?utf-8?B?MVp0MWtzbENDdjlTbWgwVjZBRkhpNmFWUFRmM1pLVFRKWjZ4UEhVVjFha1hW?=
 =?utf-8?B?bGFxNkI3bG5uYWJDMWx4KzA3dk1ieGRLWi9Wc1lzWWVObUlFYjlnTXZwcVo5?=
 =?utf-8?B?VVRlWWJsZnJLTTBuMUtqVlJ1cDR5UmRkTXF5Mjl2clV4Ym16WVZ2bUpBNUdQ?=
 =?utf-8?B?VFliMlpjV2VnV2hSQTFBZ2VFM1VBWS93VHZ1ZFhnUEVleXNCUTlzLzVrZm9t?=
 =?utf-8?B?cnAwcHk2U29XcG9aMTNxTDFDQ0JpK3BNbVlFL1dFcnE2ZDQwY2k1RXRnM3Qy?=
 =?utf-8?B?SUNFaGlyL3VCSHhvdnN3UGJLMklxaEhuWFJmZWhjNVRVdURZWWowMVROSFRG?=
 =?utf-8?B?WjBkNlhSU0d4L1QwYXBzcTB3SUxWamw2ZjZLUTVwS0ZhWVlXS0hDRnBaUHU3?=
 =?utf-8?B?VHNVQ2dZWkh3b01GU3VteFVZdmdpWm5qdE5xSlFLNmdLMTdQaDc1WWJxYm1F?=
 =?utf-8?B?c2lqVE4yWGxBZkN0NzVwQXU0N3pIV3UwZjl5SU9nbHhRdGhtM25vQ24zMGlY?=
 =?utf-8?B?UGF0dy9IdDkvb2EyekM4aVBrWHBzRHZNKys3SzNwZjJVdUE0Qk9SYnNRSWxr?=
 =?utf-8?B?V3JEb1lNNTgwdEZMbGovcUU2NnZ5ckxicGtjcW1abGJSeFhFLzhzUUVHWVdW?=
 =?utf-8?B?c1N4T1BGMjZOK2tGUlBuZ3BCclF0VE5udzFPM2RYZVpYMUVpaE5NVjMyaGVY?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6C5C5597D19A0748933BA36D7C8659D8@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b1447e-4053-4542-cd2c-08dc9764053b
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 11:18:21.9512
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o07BpY2OHa9B30nf5X7LJMBAFLmeDmKPT1qtWmHg9CPCIebx/sRv+ENF3PopYKQHG0QWbqfkHyEtY3bFRorYuxo0p77bxloCZuDHCMRZ2vo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8253
X-Proofpoint-ORIG-GUID: aEXCjeiG-a9wDKAOaIghcgb7H2ikY8E3
X-Proofpoint-GUID: aEXCjeiG-a9wDKAOaIghcgb7H2ikY8E3
X-Proofpoint-Spam-Reason: safe

DQo+IE9uIEp1biAyOCwgMjAyNCwgYXQgMzowNuKAr0FNLCBMZWUgSm9uZXMgPGxlZUBrZXJuZWwu
b3JnPiB3cm90ZToNCj4gDQo+IE9uIFRodSwgMjcgSnVuIDIwMjQsIEphbWVzIE9nbGV0cmVlIHdy
b3RlOg0KPiANCj4+IA0KPj4+IE9uIEp1biAyNywgMjAyNCwgYXQgMjoxMuKAr0FNLCBMZWUgSm9u
ZXMgPGxlZUBrZXJuZWwub3JnPiB3cm90ZToNCj4+PiANCj4+PiBPbiBXZWQsIDI2IEp1biAyMDI0
LCBKYW1lcyBPZ2xldHJlZSB3cm90ZToNCj4+PiANCj4+Pj4gDQo+Pj4+PiBPbiBKdW4gMjAsIDIw
MjQsIGF0IDExOjU54oCvQU0sIExlZSBKb25lcyA8bGVlQGtlcm5lbC5vcmc+IHdyb3RlOg0KPj4+
Pj4gDQo+Pj4+PiBPbiBUaHUsIDIwIEp1biAyMDI0LCBKYW1lcyBPZ2xldHJlZSB3cm90ZToNCj4+
Pj4+IA0KPj4+Pj4+IENoYW5nZXMgaW4gdjExOg0KPj4+Pj4+IC0gQ29uc3RpZmllZCBmdW5jdGlv
biBwYXJhbWV0ZXJzIGluIEFTT0MgZHJpdmVyDQo+Pj4+Pj4gLSBSZW1vdmVkIGFuIHVubmVlZGVk
ICNpbmNsdWRlDQo+Pj4+Pj4gLSBDaGFuZ2VkIG51bWJlciBvZiBtYXggRkYgZWZmZWN0cyA9IDEN
Cj4+Pj4+PiAtIE1pbm9yIHJlZmFjdG9yaW5nIGluIElucHV0IGRyaXZlcg0KPj4+Pj4+IC0gUmV3
b3JkZWQgY29tbWVudCBpbiBNRkQgZHJpdmVyDQo+Pj4+Pj4gDQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2
MTA6DQo+Pj4+Pj4gLSBNaW5vciByZWZhY3RvcmluZyBhbmQgbG9naWNhbCBpbXByb3ZlbWVudHMg
YWxsIGFyb3VuZA0KPj4+Pj4+IC0gUmVuYW1lZCBhbmQgYWRkZWQgc3VwcGxpZXMNCj4+Pj4+PiAN
Cj4+Pj4+PiBDaGFuZ2VzIGluIHY5Og0KPj4+Pj4+IC0gRml4ZWQgZW1wdHkgc3RydWN0IGJ5IHV0
aWxpemluZyBjc19kc3AncyBwb3N0X3J1biBjYWxsYmFjaw0KPj4+Pj4+IC0gU3R5bGUgZml4ZXMg
aW4gTUZEIGRyaXZlcg0KPj4+Pj4+IA0KPj4+Pj4+IENoYW5nZXMgaW4gdjg6DQo+Pj4+Pj4gLSBz
ZXRfc3lzY2xrKCkgLT4gc2V0X2JjbGtfcmF0aW8oKQ0KPj4+Pj4+IC0gQWRkZWQgSUQgdGFibGUg
dG8gY29kZWMgZHJpdmVyDQo+Pj4+Pj4gLSBTdHlsZSBpbXByb3ZlbWVudHMNCj4+Pj4+PiAtIEZp
eGVkIG9yZGVyaW5nIG9mIG5ldyB3cml0ZSBzZXF1ZW5jZSBvcGVyYXRpb25zDQo+Pj4+Pj4gDQo+
Pj4+Pj4gQ2hhbmdlcyBpbiB2NzoNCj4+Pj4+PiAtIEZpeGVkIHNwYXJzZSB3YXJuaW5nDQo+Pj4+
Pj4gLSBNb3ZlZCB3cml0ZSBzZXF1ZW5jZXMgdG8gcHJpdmF0ZSBkYXRhIHN0cnVjdHVyZQ0KPj4+
Pj4+IC0gTG9naWNhbCBhbmQgc3R5bGUgaW1wcm92ZW1lbnRzIGluIHdyaXRlIHNlcXVlbmNlIGlu
dGVyZmFjZQ0KPj4+Pj4+IA0KPj4+Pj4+IENoYW5nZXMgaW4gdjY6DQo+Pj4+Pj4gLSBVcGRhdGVk
IHdyaXRlIHNlcXVlbmNlciBpbnRlcmZhY2UgdG8gYmUgY29udHJvbC1uYW1lIGJhc2VkDQo+Pj4+
Pj4gLSBGaXhlZCBhIHJhY2UgY29uZGl0aW9uIGFuZCBub24taGFuZGxpbmcgb2YgcmVwZWF0cyBp
biBwbGF5YmFjayBjYWxsYmFjaw0KPj4+Pj4+IC0gU3R5bGlzdGljIGFuZCBsb2dpY2FsIGltcHJv
dmVtZW50cyBhbGwgYXJvdW5kDQo+Pj4+Pj4gDQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2NToNCj4+Pj4+
PiAtIEFkZGVkIGEgY29kZWMgc3ViLWRldmljZSB0byBzdXBwb3J0IEkyUyBzdHJlYW1pbmcNCj4+
Pj4+PiAtIE1vdmVkIHdyaXRlIHNlcXVlbmNlciBjb2RlIGZyb20gY2lycnVzX2hhcHRpY3MgdG8g
Y3NfZHNwDQo+Pj4+Pj4gLSBSZXZlcnRlZCBjaXJydXNfaGFwdGljcyBsaWJyYXJ5OyBmdXR1cmUg
Q2lycnVzIGlucHV0DQo+Pj4+Pj4gZHJpdmVycyB3aWxsIGV4cG9ydCBhbmQgdXRpbGl6ZSBjczQw
bDUwX3ZpYnJhIGZ1bmN0aW9ucw0KPj4+Pj4+IC0gQWRkZWQgbW9yZSBjb21tZW50cw0KPj4+Pj4+
IC0gTWFueSBzbWFsbCBzdHlsaXN0aWMgYW5kIGxvZ2ljYWwgaW1wcm92ZW1lbnRzDQo+Pj4+Pj4g
DQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2NDoNCj4+Pj4+PiAtIE1vdmVkIGZyb20gSW5wdXQgdG8gTUZE
DQo+Pj4+Pj4gLSBNb3ZlZCBjb21tb24gQ2lycnVzIGhhcHRpYyBmdW5jdGlvbnMgdG8gYSBsaWJy
YXJ5DQo+Pj4+Pj4gLSBJbmNvcnBvcmF0ZWQgcnVudGltZSBQTSBmcmFtZXdvcmsNCj4+Pj4+PiAt
IE1hbnkgc3R5bGUgaW1wcm92ZW1lbnRzDQo+Pj4+Pj4gDQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2MzoN
Cj4+Pj4+PiAtIFlBTUwgZm9ybWF0dGluZyBjb3JyZWN0aW9ucw0KPj4+Pj4+IC0gRml4ZWQgdHlw
byBpbiBNQUlOVEFJTkVSUw0KPj4+Pj4+IC0gVXNlZCBnZW5lcmljIG5vZGUgbmFtZSAiaGFwdGlj
LWRyaXZlciINCj4+Pj4+PiAtIEZpeGVkIHByb2JlIGVycm9yIGNvZGUgcGF0aHMNCj4+Pj4+PiAt
IFN3aXRjaGVkIHRvICJzaXplb2YoKikiDQo+Pj4+Pj4gLSBSZW1vdmVkIHRyZWUgcmVmZXJlbmNl
IGluIE1BSU5UQUlORVJTDQo+Pj4+Pj4gDQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+Pj4+PiAt
IEZpeGVkIGNoZWNrcGF0Y2ggd2FybmluZ3MNCj4+Pj4+PiANCj4+Pj4+PiBKYW1lcyBPZ2xldHJl
ZSAoNSk6DQo+Pj4+Pj4gZmlybXdhcmU6IGNzX2RzcDogQWRkIHdyaXRlIHNlcXVlbmNlIGludGVy
ZmFjZQ0KPj4+Pj4+IGR0LWJpbmRpbmdzOiBpbnB1dDogY2lycnVzLGNzNDBsNTA6IEFkZCBpbml0
aWFsIERUIGJpbmRpbmcNCj4+Pj4+PiBtZmQ6IGNzNDBsNTA6IEFkZCBzdXBwb3J0IGZvciBDUzQw
TDUwIGNvcmUgZHJpdmVyDQo+Pj4+Pj4gSW5wdXQ6IGNzNDBsNTAgLSBBZGQgc3VwcG9ydCBmb3Ig
dGhlIENTNDBMNTAgaGFwdGljIGRyaXZlcg0KPj4+Pj4+IEFTb0M6IGNzNDBsNTA6IFN1cHBvcnQg
STJTIHN0cmVhbWluZyB0byBDUzQwTDUwDQo+Pj4+Pj4gDQo+Pj4+Pj4gLi4uL2JpbmRpbmdzL2lu
cHV0L2NpcnJ1cyxjczQwbDUwLnlhbWwgICAgICAgIHwgIDY4ICsrKw0KPj4+Pj4+IE1BSU5UQUlO
RVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArDQo+Pj4+Pj4gZHJp
dmVycy9maXJtd2FyZS9jaXJydXMvY3NfZHNwLmMgICAgICAgICAgICAgIHwgMjc4ICsrKysrKysr
Kw0KPj4+Pj4+IGRyaXZlcnMvaW5wdXQvbWlzYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICB8
ICAxMCArDQo+Pj4+Pj4gZHJpdmVycy9pbnB1dC9taXNjL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgIHwgICAxICsNCj4+Pj4+PiBkcml2ZXJzL2lucHV0L21pc2MvY3M0MGw1MC12aWJyYS5jICAg
ICAgICAgICAgfCA1NTUgKysrKysrKysrKysrKysrKysNCj4+Pj4+PiBkcml2ZXJzL21mZC9LY29u
ZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMzAgKw0KPj4+Pj4+IGRyaXZlcnMvbWZk
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArDQo+Pj4+Pj4gZHJpdmVy
cy9tZmQvY3M0MGw1MC1jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgNTcwICsrKysrKysrKysr
KysrKysrKw0KPj4+Pj4+IGRyaXZlcnMvbWZkL2NzNDBsNTAtaTJjLmMgICAgICAgICAgICAgICAg
ICAgICB8ICA2OCArKysNCj4+Pj4+PiBkcml2ZXJzL21mZC9jczQwbDUwLXNwaS5jICAgICAgICAg
ICAgICAgICAgICAgfCAgNjggKysrDQo+Pj4+Pj4gaW5jbHVkZS9saW51eC9maXJtd2FyZS9jaXJy
dXMvY3NfZHNwLmggICAgICAgIHwgIDI3ICsNCj4+Pj4+PiBpbmNsdWRlL2xpbnV4L21mZC9jczQw
bDUwLmggICAgICAgICAgICAgICAgICAgfCAxMzcgKysrKysNCj4+Pj4+PiBzb3VuZC9zb2MvY29k
ZWNzL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgfCAgMTEgKw0KPj4+Pj4+IHNvdW5kL3Nv
Yy9jb2RlY3MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAgMiArDQo+Pj4+Pj4gc291
bmQvc29jL2NvZGVjcy9jczQwbDUwLWNvZGVjLmMgICAgICAgICAgICAgIHwgMzA3ICsrKysrKysr
KysNCj4+Pj4+PiAxNiBmaWxlcyBjaGFuZ2VkLCAyMTQ4IGluc2VydGlvbnMoKykNCj4+Pj4+PiBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0
L2NpcnJ1cyxjczQwbDUwLnlhbWwNCj4+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9p
bnB1dC9taXNjL2NzNDBsNTAtdmlicmEuYw0KPj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21mZC9jczQwbDUwLWNvcmUuYw0KPj4+Pj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21mZC9jczQwbDUwLWkyYy5jDQo+Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZk
L2NzNDBsNTAtc3BpLmMNCj4+Pj4+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9t
ZmQvY3M0MGw1MC5oDQo+Pj4+Pj4gY3JlYXRlIG1vZGUgMTAwNjQ0IHNvdW5kL3NvYy9jb2RlY3Mv
Y3M0MGw1MC1jb2RlYy5jDQo+Pj4+PiANCj4+Pj4+IFN0aWxsIG5lZWRzIEFja3MgLSBwaW5nIG1l
IHdoZW4geW91IGhhdmUgdGhlbS4NCj4+Pj4+IA0KPj4+Pj4gLS0gDQo+Pj4+PiBMZWUgSm9uZXMg
W+adjueQvOaWr10NCj4+Pj4gDQo+Pj4+IEhpIExlZSwNCj4+Pj4gDQo+Pj4+IFlvdSBjYW4gdGFr
ZSB0aGlzIHNlcmllcyBub3cuDQo+Pj4gDQo+Pj4gc291bmQvc29jPw0KPj4+IA0KPj4+IC0tIA0K
Pj4+IExlZSBKb25lcyBb5p2O55C85pavXQ0KPj4gDQo+PiBNYXJrIGhhcyBBY2tlZCB0aGUgb3Jp
Z2luYWwgdjExIHNlcmllcyBoZXJlOg0KPj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9hODVlMDlkNi1kOGViLTRjNjAtYWU4My1iNGRiZjg3
NWE5MjZAc2lyZW5hLm9yZy51ay9fXzshIURRM0tmd0khMGE0MDdpRmlLWUNzTlhKVExmNjUwNDZq
NWVCSy1taWpWZ0dNWXNYOFJnOGRDYXh0dHpRQUtCSTk3Nm1Qa19BeHVWczduMXpxcFFtcHk3byQN
Cj4gDQo+IEFoLCB5b3UganVzdCBmb3Jnb3QgdG8gYWRkIGl0IHRvIHRoZSBSRVNFTkQ/DQo+IA0K
PiBPa2F5LCBsZWF2ZSBpdCB3aXRoIG1lIHRoZW4uDQo+IA0KPiAtLSANCj4gTGVlIEpvbmVzIFvm
nY7nkLzmlq9dDQoNCkFjdHVhbGx5IGl0IHdhcyBBY2tlZCBvbiB0aGUgb3JpZ2luYWwgdjExIHNl
cmllcyBhZnRlciB0aGUgUkVTRU5EIGhhZCBiZWVuIHNlbnQNCm91dC4gSWYgeW91IGxpa2UsIEkg
Y2FuIHJlc2VuZCB3aXRoIGFsbCB0aGUgY29sbGVjdGVkIHRhZ3MuDQoNCkJlc3QsDQpKYW1lcw0K
DQoNCg==

