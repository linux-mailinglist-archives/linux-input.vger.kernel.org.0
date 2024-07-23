Return-Path: <linux-input+bounces-5123-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DA1939C96
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 10:26:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D837281EA6
	for <lists+linux-input@lfdr.de>; Tue, 23 Jul 2024 08:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83F2D14B96F;
	Tue, 23 Jul 2024 08:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JEpyhqrZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5628814;
	Tue, 23 Jul 2024 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721723208; cv=fail; b=Xq9xFCjxNZwIYo3YbT9Ky9qN9OIneemxugZew5qOvqVq8Rz55ZF8rdJ+vm9xqwOBUvE1ZSbzTEILBHt5f4J6bAd6wUtqsLHLT3uPvvVRrD39BYiJcjI8Kcfm/4rmOxLoayU4stARpXdpcwlJHwo13831wrZaP2NTN9ChOSzP9ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721723208; c=relaxed/simple;
	bh=arKvT+NUxyeZFelNc6a76iYu3q4gnAe3tdOCzqwBv8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZi2Glfa51jg7ttdSiQpi3vI9V98x8EDxO74u/nh6gVOg/7qGRYe2cPZwb5fxUup2/Iv3DQmt/tTr5BGbzVvoRZya5IOFHdxXhPI+aYfz56YhjewJrR4AaYbc6il/8myP1oLuCQnEJ/zoQB3NCNMQpXpkHoTDxrkoatZDdEMhys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JEpyhqrZ; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46N3BbJh020535;
	Tue, 23 Jul 2024 04:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=arKvT
	+NUxyeZFelNc6a76iYu3q4gnAe3tdOCzqwBv8M=; b=JEpyhqrZdtrQhiHSk0ohk
	JRNOrnLC2m1f3uDjYRKdBfZZAxKVl1TOm7lN4hIfoikDDn1pYlDuuZKX7rG+4Z85
	/Ntr9Hn3scMpaoet7hob+raLlD6WERrpqPuPbzmX4MA9Bbe33IJjr4eZ2YLzNtcj
	P/XjnedYZE0I0Gd4ek0+0o+VtLsJYl1bSaPqq6araAvprMNHNnb+Ptzyg+u93ICO
	8Gy7AgGCBH+GLDTh8ewUHnoCCJ+wLT8LkQPsbNVQ2ya1lAg05V445Rnl57fMxQBi
	XCMguxmHpJj509bW89bdRoAfgtyyanRRE7B36T3gCUVCx6KYkdbFUjQk4hlBy/pB
	w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012038.outbound.protection.outlook.com [40.93.1.38])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 40ga52gm40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 04:26:42 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isvRb44nd5B5DzHEm6UPYTyaMU9+q2K3PXufJbcZDgiaYlPOy4OLMiHiCwTZ3d6MtJbMfdtiN1HbdJZeHHVMtkpVrsHrBRa/qZN/Pm4YkkaQcaKxuZVwQlKFV1fK4vgpuguxHgy6/xTvfyg8brw1YT22N4LgNkGWKEaR7BpkZ0rrtekMW2p+Ws4vJxsJ3Z4fh2WgWAzq9r/Kxbm4yTvzasJdaW6VIC2TSTg506dDvxFo5mt1ZjKJOYOt6qCBLN/q3/i+++ORVlql1GThbBjn/uUYRP1mYNQzbJ/bTFM8fSCWXGbgdTR8Mev+x6+GGg8O9sUsIJNHsXrFjqPu97NnSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=arKvT+NUxyeZFelNc6a76iYu3q4gnAe3tdOCzqwBv8M=;
 b=V/LHJVakjqqLLsKltmGgohoGS0F9OkUnvmPrHXO8h4VJoCJgoJjRhL1J/XoqbvB7L1YWNKYrPALbV3waAu4mO5Y0U1bFHSikIJ3sWXfi7H/QSh4cro++9h5FLEV67nVoj5XTPHop7pyNrEgC0xCqRjRVzmI/cfACHBps5M0pc+CqBkANyKOnzEPvvEuoJf4ZTbmGN6TeMDAP5zBAYYep0Gq/QwpWckRg7Rs4qtOH1KDKoP4vrOPI2buLu77d+222JWXh9m9p5ee4I9SPnZpQ7MjDCYT2g0Ma1X4TAIf7R2jUhwCCeKEZA8WQ5PDyzvsKhQLrGskeJ08/KVr8dXwJ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA2PR03MB5692.namprd03.prod.outlook.com (2603:10b6:806:11f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Tue, 23 Jul
 2024 08:26:40 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7784.016; Tue, 23 Jul 2024
 08:26:40 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
        =?utf-8?B?TnVubyBTw6E=?=
	<noname.nuno@gmail.com>,
        "Hennerich, Michael" <Michael.Hennerich@analog.com>,
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
Subject: RE: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
Thread-Topic: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
Thread-Index: AQHazh4y7HYAekDrHUW2x4fL7XXaPLHt+HOAgBUBK6CAAAbXAIABFx5w
Date: Tue, 23 Jul 2024 08:26:40 +0000
Message-ID:
 <SJ0PR03MB634313AD2F914FC1509E32569BA92@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
 <9c64adf6a686b2845c15b368592115f3f9ab39e4.camel@gmail.com>
 <SJ0PR03MB6343870FAE4E1054009C698B9BA82@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <03b977e1-a6af-4232-aff5-48bc6e14ef90@kernel.org>
In-Reply-To: <03b977e1-a6af-4232-aff5-48bc6e14ef90@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3RORGMzTmpReU56SXRORGhqWkMweE1XVm1MVGcw?=
 =?utf-8?B?WmpVdE5qUTBPVGRrWTJVMVpqZ3hYR0Z0WlMxMFpYTjBYRFEzTnpZME1qYzBM?=
 =?utf-8?B?VFE0WTJRdE1URmxaaTA0TkdZMUxUWTBORGszWkdObE5XWTRNV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU5EZzRNaUlnZEQwaU1UTXpOall4T1RZM09UZzJOVEF5TnpF?=
 =?utf-8?B?d0lpQm9QU0pzV2psaVQxQlFVMjVrTkRnMWFVTkpURkV4TUZwVE5YSndNVlU5?=
 =?utf-8?B?SWlCcFpEMGlJaUJpYkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNT?=
 =?utf-8?B?RlV4VWxOU1ZVWk9RMmRWUVVGRVowUkJRVUV5Y2s1QlNqSjBlbUZCVjBsR1Uy?=
 =?utf-8?B?MW9ibTk2TUZwWloxWkxZVWRsYWxCU2EwUkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlNFRkJRVUZFWVVGUlFVRlRaMGxCUVU4MFFVRkJRVUZC?=
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
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJUelJC?=
 =?utf-8?B?UVVGQlFVRkJRVUZEUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUVVGQlowRkJR?=
 =?utf-8?B?VUZCUVVGQlFYcG5RVUZCUVUxQlFVRkNUMEZCUVVGQlFVRkJRVWRGUVZwQlFu?=
 =?utf-8?Q?BBRjhB?=
x-dg-refone:
 Y3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3Qm1BR0VBYkFCekFHVUFYd0JtQUc4QWN3QnBBSFFBYVFCMkFHVUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQThBQUFBQUFBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElBQUFBPSIvPjwvbWV0YT4=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA2PR03MB5692:EE_
x-ms-office365-filtering-correlation-id: f69e2ef6-9723-4fc0-d854-08dcaaf12d6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cTExckZEbG9MOUdzbzdMaUljNFpyYVgzbTJwTHV5ZUVha2M2OU92RWFGYlNl?=
 =?utf-8?B?MmFUT0dWRE1iK1N2TkYyWkVwNFNUWjRJQS9zbWhYQWpEc1FjaWNEaGp0aEhi?=
 =?utf-8?B?NzhLYjFlcXFQc0xGWlVKWERqOTZjU284Qjl5V1N2ejFKUDRHQ3pVeEE0RDd6?=
 =?utf-8?B?ZllBRGpVSW9JK0Y2RDRCWHB3cGIrR0F3eHFDL25XNGV3ZC9jVUNLdGdmR0k4?=
 =?utf-8?B?WDFTYjQ5VC9DSWh3UytKbE42MDdsRjNvTXpaQ0RGUldlb3BmYkN0R3paMDJ0?=
 =?utf-8?B?bXY4MUpVVk1lalZxRStIc2hDWWp5cUJFVTl2QzMzOWRjWjRIVDFlVVZBMDhB?=
 =?utf-8?B?dHlQTGt5N1NUamM1SmdsUUNxNHNCZ0FPNmtOVk82WG9nRnFKdVRFVUpGeEc5?=
 =?utf-8?B?aTJTMnR2SUVQTFY2Q1FhS2hWS0dvYWVpdndFSUM3Nzh3STZLVUpXMTd0Wm5y?=
 =?utf-8?B?TWV4WnVXNTJKZW5kVHlMRWtZbk1kZ2dCdjEvalBoa3hDV0RjeGl5bjVDMlR5?=
 =?utf-8?B?SWxRTlF5dlNRVm45eDdHQXU1NUdxZHllQTF2aHVOeGt1YXlhR1JEb1BUc1VP?=
 =?utf-8?B?NVl4bGpWYTB2amg3K1VnbDgrSUFjZlBNd1JhL2Y3bmJTMERNQjhIVjJlRXNq?=
 =?utf-8?B?QS9jTVVkbENEbVltMlZPVlZhS3MzVGlCMGVYSlJaQ1lLMnBxcEZZWkNQRFBr?=
 =?utf-8?B?eVk2T1g1N25HTm5Jd3FHa08zQXNPK1dUdXdSYkpQdEZ2eU5GbktXM1h3czV3?=
 =?utf-8?B?RVNkZ044SE9oQTg4OERyWnFHU3krYUtqWlYwUm00UWRzZGl4ZmNmYjRhdThD?=
 =?utf-8?B?MnBXYnRRb0pnVEpRc2g4WGx1MG5qWVJ6Q0tML1E1MitKWXlDcERrSjJ2YWFt?=
 =?utf-8?B?bXB6Mkp5cU1idVpld2l4clN3cXhxUEVKUTdDeDBrM2tKdmwvVU05dlFTMlQ0?=
 =?utf-8?B?bVlxRDRiTWMzQzNoKytNRlMyZXdlUUN3Q2ZJY1p4UEIrd09zd1RKNVNsVCtn?=
 =?utf-8?B?WDkyV09BM2d3Tmtkam9NaXY1S3EvSy92ZUZReDd6RzZ1dUo0Rmw2M0RJWGZx?=
 =?utf-8?B?b1pCLzVuT3ZkenZwVEd6UVp6NUlUR0ZYa3pqZUZsQ1VWRXRmc3k1Slo2c0Nk?=
 =?utf-8?B?ZXJHWmQxeTR3U1JmQUZoT2dYQjdzbm9jcW5SVmowOXVvNkR1K0p4TkY5aG5E?=
 =?utf-8?B?dS95TFZuUFRWT1cwWUN3NDFieXdNS05DQTN6VkM4YlpGZ3NRRERVYVB6aWJ1?=
 =?utf-8?B?cEh2UUlFYTBsRHVxdnVreDBXeEhyRW1NcVVCb0w2dnNLa29yZ1ZrSVcrN00v?=
 =?utf-8?B?Y3YwaVF5eGE3SUYxbTRSakUrZzBaYUFGV2tER2IyckMxdkRYbGVRbSsvbklC?=
 =?utf-8?B?R3FsS2ZkSldYNHhTNTVBb250aVNELzVVQ1pRTC9NNis2MXJqdUU5MkVBYm96?=
 =?utf-8?B?REJBenpUdUFIVHJGZlBpRmN2VjJmU0dkTnY0R1VxRExnVnBqdWpGc3VuWk9L?=
 =?utf-8?B?U0RwSmtkcCtXVEw5Z0RRZkJmNTNDVHhYWFNBOEc5clhIL2pJUXdldnB5czc0?=
 =?utf-8?B?bXh3TlkvMjdjR1ZwR2diOU9jTGJWeWw0WGlEdUF0TmxQMXA4M2ViV1N3b1Ex?=
 =?utf-8?B?MnVxaUxIWDNqLzI1RDVzRzNPU0ZKMC92aEYyRkhhL2g2S05BQjdGS3JadGlX?=
 =?utf-8?B?TERJWHRpbVY3c1ltUGY4cnNWTkVLc0EwU2JkdkdyU29xVjgzNGhnNGduTUkv?=
 =?utf-8?B?dXZEdHJ4Z0J5YitRcldwa2c3UjFrQ0hQeFU2QWdCd0xjQkNsY3BVd0h1aUNp?=
 =?utf-8?B?USs1SUQ0RDR5dmx3T2FPTmVodi9nbTI3Q0pkcTRWNWRmYjdMc0doRGJKREdO?=
 =?utf-8?B?ZHBZaHdxa2FZSlMwTGFGNTdVcU1ucVJhdUI1MDVJZklwOEFEZDc2bGtnYUdw?=
 =?utf-8?Q?HiJON0Iz6KI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OHNpVy82ak5WUSt4MldRaFViT2VLOGRPc2tramg1c1cxcm0rbHJRRWpBTHVS?=
 =?utf-8?B?eUJQMDZpRWRmWmprMUVwbHQ5N0pVcjdacmlNa1pxWWVCdGZSQ2hCR3h5R21U?=
 =?utf-8?B?eGxmS3Z1bDRSdU1zK2FuM3Yra2h2Y20rQzNUdXFKdjA4eWw4Skx6S3k0UGNj?=
 =?utf-8?B?YzFmcDVCblo5ZVZYZ0N0V081QnJWSi9ON0xhZnlPa21rZHQ3TXFabTFpRWRP?=
 =?utf-8?B?SG5COW1taXlUcGppd3dlQzVQZjBSTTZrS0QxVlZ0d21pZFVVRWhUU1lNM3lk?=
 =?utf-8?B?RVdlYWgxWEx5NVc2RjM1NEZ3SEhjeTFYTTduaUhxRkVVUjVjdGZ5dTJZdXpR?=
 =?utf-8?B?Q1JTVTN3VXRZY0t6dzJKMFVCVE1LR25qLzJvV2JCdmVvVmJwUm9CNzB2K2lI?=
 =?utf-8?B?b3hRVXVEVy9mejhyVFJLUCt5RFREdDFYWHlKUFN0VUhiOG1aZTZkdnVTUHRx?=
 =?utf-8?B?cjIzM0IwblptYXJ0YytpR0M3aGVzdlVTcXBSSlVpeitFWklBbHVEamZaNE52?=
 =?utf-8?B?Wk9BZnRqRUR5SzlCdDArTFZLMmwwbW5vWDcvUE5KVUI0YTh2VUhJdzRLU3Vk?=
 =?utf-8?B?Y3RVWjFEU1FRU1lHa2lrdGEwWlhRZ3JMdTZLeXcyZ0ZCekFkQUZkK0o4cUla?=
 =?utf-8?B?UllPVlAwQ2dBMnFBdDVpYndVdnVvRHBhZnVmZnR4S29TdVdKT3FWaW40Y2hX?=
 =?utf-8?B?SFdRcHNVd1Y0K3ZLcW0xV1RPM0xwR0crRjdGbG9aelYyejBzN0o4eEJ5dDF2?=
 =?utf-8?B?S1prbXltTitUTXMrQkg3YVpjSzlsTU9icmlIVHNmaEZ2OHFOWEhVaC9aZVQ1?=
 =?utf-8?B?NFZzNUhKMTRnbUx3VFNJZmJrQlUxVStaamJ2TEJWemtTdC85WWpNU3VESGYw?=
 =?utf-8?B?ZkdjckRsbDVkczBvQmNsdkY2ZVk5YVBMT3p5VEFuL1dJeFhLOC9XOC9kZnNl?=
 =?utf-8?B?YUNDSExvMXV0S2JzUlhQVUJSRldvdFJaQ0xIS05oMzZPN0NhcHpNR255QzZt?=
 =?utf-8?B?RnNWTjhwY01YZy9kN3dWR2pXQUhSQ2xqYjRzY2hNOUFBMk41cmdjVXpmWHVF?=
 =?utf-8?B?S3BaRGkxY29uMGZYekdUb0RzVXJmZzZLR0hiV3ZUc0E2MmxOa2tUMStIR2lH?=
 =?utf-8?B?NXZld1ltSWJkN3cvUkFhY0VidGx4VDNCcTNRTFdGQithQnJZVVpWQlRyTFp2?=
 =?utf-8?B?Lys4TXhnYXB1Z09EbEhvbGVMUll2cG1tT2hvcHZVSzlENkdmKytYQ0lmVzZ3?=
 =?utf-8?B?VVhIbHB3MFlNeHZwWEVsOHAwZG1Sd2l3KzBrWjJBM2VpaC9hWkFocUdTZlM4?=
 =?utf-8?B?Z2d5VG12b1o2dXNaSFhvelJyajhiZDVoajdnL1N1SW03cmFnNEF3Q3pZeWlK?=
 =?utf-8?B?MEFDd0p4K3RKdEI0RldLQW4xNzViay9TRFV3dEE2dnlsa0FsMER6S2IxYW5E?=
 =?utf-8?B?YlNDTGw2Z01SZmZqckNpV2NpNXB6eXJwNU1YTmc1bGx1UU9VTk1UMTBmUTdV?=
 =?utf-8?B?QXhSejBXc00rQ05iakFDRnRhK0JMNkZzVXZoREZSRWhtbUNkVmE3emVCNUg0?=
 =?utf-8?B?TDJqVHRhaFVoRkpjSjJIcWh3U09nZlVxRG9wOEwwV0U3eXVmem1LVnFOUytM?=
 =?utf-8?B?QmRNM1ZTTmpNd25qTmxNTmczcVBpUHdPK3NjT3BPblM5R0ZMNnQvZVhraFNE?=
 =?utf-8?B?Z3pkdTkzTWdFN1NvWDFFVEppSUV2bXhORG1qUkFwemFma1VzdWZxeGJkSjJ0?=
 =?utf-8?B?dEx5SUpzZEhtOWp3dHcrQ2hHWmNackRyUEZCSlBvU3d2cGtPTTZWYmJ1TXBm?=
 =?utf-8?B?UGlOZWZROGxNYjBXR3ArSExYUDRMZmE2bFBVcUJUMy9aSEhFTWRaTEpkaExB?=
 =?utf-8?B?SXR4NWprYjZ3NGIvZ1lYYklJL2UrODZrVE0yTm1lbkZuejNiS283TGFwd21k?=
 =?utf-8?B?K3l6YTVicTVtUVhHYVp4RS8wNDlmRjgrMXh4cUNCM1V3d0c3YVZEbmpkdm1Z?=
 =?utf-8?B?bFkrMDl3WEhkNUYrRUZETWk0ZlVVQzJOY2o1dFpBdU9YS2hLNHNPdVFTbVdu?=
 =?utf-8?B?NE9CMWw0cFBqLytDMUs4WjJCQ3ZubkQ5ZW5HNVpDSHFtZUNKOXRTYTc3RVZ4?=
 =?utf-8?Q?xEWfnWNp1yPlI3NKWy7/Gf+gH?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f69e2ef6-9723-4fc0-d854-08dcaaf12d6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2024 08:26:40.5480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HhIGtwfb6hyHBTaI2ip0GG3tWSVIQpHHfGWCWnIJHztTE/Jv48KI+LKCmKdfgeSwgurlW+DKjeTdKCxat3kPC+nORylinsHQT5OdCIJxapU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5692
X-Proofpoint-ORIG-GUID: P8AEgEaytG8Kij09I5ZJ45OIdsCES_a8
X-Proofpoint-GUID: P8AEgEaytG8Kij09I5ZJ45OIdsCES_a8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230060

PiBGcm9tOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1v
bmRheSwgSnVseSAyMiwgMjAyNCA0OjQ3IFBNDQo+IFRvOiBBZ2Fyd2FsLCBVdHNhdiA8VXRzYXYu
QWdhcndhbEBhbmFsb2cuY29tPjsgTnVubyBTw6ENCj4gPG5vbmFtZS5udW5vQGdtYWlsLmNvbT47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IERt
aXRyeSBUb3Jva2hvdg0KPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5l
bC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTYSwNCj4gTnVubyA8
TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IEFydGFtb25vdnMsIEFydHVycw0KPiA8QXJ0dXJzLkFydGFtb25vdnNAYW5hbG9nLmNvbT47
IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWthc0BhbmFsb2cuY29tPjsg
R2Fza2VsbCwgT2xpdmVyDQo+IDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY4IDIvM10gSW5wdXQ6IGFkcDU1ODgta2V5cyAtIGFkZCBzdXBwb3J0IGZv
ciBwdXJlIGdwaW8NCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDIyLzA3LzIwMjQgMTc6Mjcs
IEFnYXJ3YWwsIFV0c2F2IHdyb3RlOg0KPiA+PiBGcm9tOiBOdW5vIFPDoSA8bm9uYW1lLm51bm9A
Z21haWwuY29tPg0KPiA+PiBTZW50OiBUdWVzZGF5LCBKdWx5IDksIDIwMjQgNzozNyBBTQ0KPiA+
PiBUbzogQWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3YWxAYW5hbG9nLmNvbT47IEhlbm5lcmlj
aCwgTWljaGFlbA0KPiA+PiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IERtaXRyeSBU
b3Jva2hvdg0KPiA+PiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YNCj4gPj4gS296bG93c2tpIDxrcnprK2R0QGtl
cm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBTYSwNCj4g
Pj4gTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiA+PiBDYzogbGludXgtaW5wdXRAdmdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+ID4+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IEFydGFtb25vdnMsIEFydHVycw0KPiA+PiA8QXJ0dXJzLkFydGFt
b25vdnNAYW5hbG9nLmNvbT47IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPj4gPFZhc2lsZWlvcy5C
aW1waWthc0BhbmFsb2cuY29tPjsgR2Fza2VsbCwgT2xpdmVyDQo+ID4+IDxPbGl2ZXIuR2Fza2Vs
bEBhbmFsb2cuY29tPg0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIvM10gSW5wdXQ6IGFk
cDU1ODgta2V5cyAtIGFkZCBzdXBwb3J0IGZvciBwdXJlDQo+IGdwaW8NCj4gPj4NCj4gPj4gW0V4
dGVybmFsXQ0KPiA+Pg0KPiA+PiBPbiBUaHUsIDIwMjQtMDctMDQgYXQgMTU6MjYgKzAxMDAsIFV0
c2F2IEFnYXJ3YWwgdmlhIEI0IFJlbGF5IHdyb3RlOg0KPiA+Pj4gRnJvbTogVXRzYXYgQWdhcndh
bCA8dXRzYXYuYWdhcndhbEBhbmFsb2cuY29tPg0KPiA+Pj4NCj4gPj4+IEtleXBhZCBzcGVjaWZp
YyBzZXR1cCBpcyByZWxheGVkIGlmIG5vIGtleXBhZCByb3dzL2NvbHVtbnMgYXJlIHNwZWNpZmll
ZCwNCj4gPj4+IGVuYWJsaW5nIGEgcHVyZWx5IGdwaW8gb3BlcmF0aW9uLg0KPiA+Pj4NCj4gPj4+
IFNpZ25lZC1vZmYtYnk6IFV0c2F2IEFnYXJ3YWwgPHV0c2F2LmFnYXJ3YWxAYW5hbG9nLmNvbT4N
Cj4gPj4+IC0tLQ0KPiA+Pg0KPiA+PiBSZXZpZXdlZC1ieTogTnVubyBTYSA8bnVuby5zYUBhbmFs
b2cuY29tPg0KPiA+Pg0KPiA+IEhpLA0KPiA+DQo+ID4gU2luY2UgdGhlcmUgaGF2ZSBub3QgYmVl
biBmZWVkYmFjayBjb21tZW50cyBvbiB0aGUgc2FtZSBmb3Igc29tZSB0aW1lLA0KPiBJIHdhbnRl
ZCB0byBjaGVjayBpZiBhbnkgZnVydGhlciBjaGFuZ2VzL2FjdGlvbnMgYXJlIHJlcXVpcmVkIGZv
ciBpdCB0byBiZQ0KPiBhY2NlcHRlZC4NCj4gDQo+IFBsZWFzZSBvYnNlcnZlIG1lcmdlIHdpbmRv
dyB0aW1lbGluZS4NCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkkgdW5kZXJz
dGFuZCwgdGhhbmsgeW91IGZvciBwb2ludGluZyBtZSB0byB0aGUgc2FtZS4NCg0KVGhhbmtzLA0K
VXRzYXYNCg==

