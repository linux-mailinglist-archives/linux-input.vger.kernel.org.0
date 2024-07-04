Return-Path: <linux-input+bounces-4855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B7292767D
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 14:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17A381C21BC8
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD8AA1AE0A5;
	Thu,  4 Jul 2024 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="WZWVwVbO"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4606C26289;
	Thu,  4 Jul 2024 12:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720097727; cv=fail; b=srY7hxuH3RwCElwusp6PLUKjP9nW49NIAeGuNtCywne0/0gSxGQNqTNdqqJ8oHdYEs3xOuU9/e/ItIptVpYhEyBvrH/PPAr+uhRuem0yXczpyekFmOhegQusPW3V5D5wfhBII8Jc9bL5Usn00AYQgBttcJv9Y7caSG4d7eyDKho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720097727; c=relaxed/simple;
	bh=fPto+nrOZoW51uCH1hapUb+kZzPw1u136hNEQLiFdOU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ke4KRb2AUyUAisuHy/Ri0lGa9vnTa9Aa77Mo8ZrDPcTh13VvbDsLvlf16fKuuMxttKLEetzAKRL9NF1UxEusqV7j7QF74gOBjMy6DZZ8NhkTcwwy0PLh24bbaSs0n4FOVRQA6xszuWSj2cpSiwrCB8IUtC5TuX5ef6Zj+PPRo+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=WZWVwVbO; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4646ilEQ003902;
	Thu, 4 Jul 2024 08:55:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=fPto+
	nrOZoW51uCH1hapUb+kZzPw1u136hNEQLiFdOU=; b=WZWVwVbO8o1uimGIcoUZA
	b7iBUt9b/eRDWTRzcQsZWS+cvxqlI2r+rlRQUYKQEIGo5OLAoto/N8kwEYDnDhQO
	NfO0lUH3ln/GtbxKCMzRiJFZ+ROSkfWhD3Ucm1W4D3rWQWth5BDTKPzgukz4+wUT
	QcO10XXxkCPNhm7ddqQngoWDXO/8iTkWkBiHKSCuN66fXDJ9EcpiNuMY7+GH8dHo
	okHZdCAck9UVtDTd/dKK8gC9p2teKGPqSpjbCtYNpSc5Arg624AqTfm7/vkiwEqR
	5XVut8S96+7IWJ9BEcIQiavcCazCdXikfAXiSLzFybY3xCcd0zDzfs+4KCI3nIUj
	A==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 405a7nbe50-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 08:55:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JD6VVP7mkCQzM1wFvkjnjuqhxB39+3pW+R3igwheD6ycIlo1/9ym3zA1D0w40l4I7JMQmkFVMJ6QokCIOdVBrq5U7SgUovBuaU+/TBSq/NGT9lCEmqs7ZtbswMPaYEoOIkd+oQCw6Y5K0EJBH+BiYdUavZqgoE/qgYyxP7R4dKR1huYzBPXatahkN3L5Vj00qvywzpxUHWqxrSEH9WIgiyVNe9JRB+2w+yyGswP49jwaOSrm6tmIYWr1RPhSktUv1hGCNdZ0KYc46i0vEbVZDupjd7GnyC7Hiku4W2UKKGC7To1nCequzlHv0b6rcgiFOhq+Tpi7UNiE8ljNdsb4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPto+nrOZoW51uCH1hapUb+kZzPw1u136hNEQLiFdOU=;
 b=lW24UFaUX46aKXNFTggle1l7AMr1IU+OLTSk5orQ92k7v9XfPxyI6IgzwefUNMAwi/Ua8a/L3B2XMaPJ/GreoWvujJwI2/OlXPX9T5UtjyL1l74Bhpbs9BZvGJuAcbAwWMhJCr7SAgG8dHZQ1aS3GJoyNItzyxl5tNxOQeI9+zqI3p9xLrqzHIqwBdMAr1kdRwk1O0wtQSUvr5H6TQ+qHrvxrpe5xHzsnM9BxkIBKpSLuyZW9pBujy388DGo2JqfvJkhi+SlycHUJIyhefQP7LNZuTAeGowzDxBnhgKzhTh+63rD7ETDe8OQNpN1EL8FfcWDTLJxgy9qlv18U/+TMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by MW4PR03MB6556.namprd03.prod.outlook.com (2603:10b6:303:127::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 12:55:20 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 12:55:20 +0000
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
Subject: RE: [PATCH v6 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v6 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHazf9b0FD2h6fHokSvsoYqmkzuurHmZjYAgAAfudA=
Date: Thu, 4 Jul 2024 12:55:20 +0000
Message-ID: 
 <SJ0PR03MB6343FEECD95E18404A7886209BDE2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240704-adp5588_gpio_support-v6-0-cb65514d714b@analog.com>
 <20240704-adp5588_gpio_support-v6-3-cb65514d714b@analog.com>
 <857b9398-a19b-4f6d-8a73-647f6aa8eeb3@kernel.org>
In-Reply-To: <857b9398-a19b-4f6d-8a73-647f6aa8eeb3@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTFoWVRNMk56TTVNUzB6WVRBMExURXhaV1l0T0RSbU15MDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjWVdFek5qY3pPVE10TTJFd05DMHhN?=
 =?utf-8?B?V1ZtTFRnMFpqTXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXpNVEl5SWlCMFBTSXhNek0yTkRVM01UTXhPVEl3TlRJek5URWlJR2c5SWtO?=
 =?utf-8?B?eFNVUkllbGR0Y0hvNWFrZGFLMWw1YVZsTlNFRkVXSGREWnowaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUWk4MWNFSnpSV00zWVVGVFdVNHpOWHBEVG1sd1Vr?=
 =?utf-8?B?cG5NMlp1VFVreVMyeEZSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRklRVUZCUVVSaFFWRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGRlFVRlJRVUpCUVVGQk0weG9VMlpuUVVGQlFVRkJRVUZCUVVGQlFVRkJT?=
 =?utf-8?B?alJCUVVGQ2FFRkhVVUZoVVVKbVFVaE5RVnBSUW1wQlNGVkJZMmRDYkVGR09F?=
 =?utf-8?B?RmpRVUo1UVVjNFFXRm5RbXhCUjAxQlpFRkNla0ZHT0VGYVowSm9RVWQzUVdO?=
 =?utf-8?B?M1FteEJSamhCV21kQ2RrRklUVUZoVVVJd1FVZHJRV1JuUW14QlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVWQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlowRkJRVUZCUVc1blFVRkJSMFZCV2tGQ2NFRkdPRUZqZDBKc1FVZE5RV1JS?=
 =?utf-8?B?UW5sQlIxVkJXSGRDZDBGSVNVRmlkMEp4UVVkVlFWbDNRakJCU0UxQldIZENN?=
 =?utf-8?B?RUZIYTBGYVVVSjVRVVJGUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRlJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRMEZCUVVGQlFVTmxRVUZCUVZsUlFtdEJSMnRCV0hkQ2Vr?=
 =?utf-8?B?RkhWVUZaZDBJeFFVaEpRVnBSUW1aQlNFRkJZMmRDZGtGSGIwRmFVVUpxUVVo?=
 =?utf-8?B?UlFXTjNRbVpCU0ZGQllWRkNiRUZJU1VGTlowRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZDUVVGQlFVRkJRVUZCUVVsQlFVRkJRVUZCUFQwaUx6NDhMMjFs?=
 =?utf-8?Q?dGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|MW4PR03MB6556:EE_
x-ms-office365-filtering-correlation-id: bd504806-1ad3-4631-5818-08dc9c288fd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QzF5bFZlTHpDYmdoV04xaWVpUCtTSTJ2b0FNTVB6blJRdlQ5eVZTVHBjU081?=
 =?utf-8?B?UWlqbXVxV2VHbFZQZ2FBeUI4TDdLTWduQlZMWUtoSk1mWis4bG1ZOGdZTVND?=
 =?utf-8?B?d1R6amNsNVBHdE0wQUpRSEFoV280dXdWaG84QmYzUTJ4UEtQZW9pZ2lEUGtj?=
 =?utf-8?B?WklybVpQNnVqbVJtbEM5ZTR6S1VEZUx2aDlMS3orWEJhYXY1aGp4MVVsejZH?=
 =?utf-8?B?a0ZrRy9ycU0xNHFUMGNXOURSRnJSSGlGU2lZVnZUNTgzWTUvbW5DTWNnYVo3?=
 =?utf-8?B?OEhqM0dRUVlJb08wWTJ2bWpUaVk2S1cxTmlLTmVJYTdieEVkMlF0OEFqNHd0?=
 =?utf-8?B?b09kc2VCUmZWZlFWQ290ZmpaM3RSdzIzVm1xbkZ2Z2lTdU1HTXJBeUhTMENN?=
 =?utf-8?B?ZDFxWWVmMm1xay82N1dDU3psVkQrVHlVVUhid0pCcXBKNmpqU2ZRRXdPNiti?=
 =?utf-8?B?V1JpYmlURXEyejdFbUF2QnhjS2pQWitiVWpQSCt3SHlvY25ZNlFZcW0zeDlC?=
 =?utf-8?B?OVU5bWhqd2RRZlZnNGtabjhqVDNQcHpVT0dGZmRjTFlUeXlUakxzdHlxK096?=
 =?utf-8?B?d2w4UmFVOFR3TnBqdkVHSFpOSE9SUVVHWFB6MjJ5OFdtTlhNOEJKVUljKzJV?=
 =?utf-8?B?cDFHRS9WYlJJdUFaUERZbjArMCtBaWNvRmxsUllQamlVNWFUaVVFcVFwQVhJ?=
 =?utf-8?B?c1c0NXY1c0ZpcW56c0owSk1tK0x1dVJ4S3lVejVSUmNrZldLaS9QNHhIbXB4?=
 =?utf-8?B?dnBmZEZuWkdXbCs1dU9hdDlpenVJTnJNeC9nclRDdVVPdzN2eDYzcWFTTGl2?=
 =?utf-8?B?a0JTMGxBWTBCSUpqMTVESTFnbFFkL2ROZ0tsVkhlVWtRWit6QStnYklvRUs1?=
 =?utf-8?B?ZEo0TC9Yc05PUW55NmtCalZHQU9KM2YyRFM2SEhScDhKOURrZWFyaEsxbng5?=
 =?utf-8?B?WWZHMVJtNkRlMmhRQ2hPWEUyaS9NMEg4QkhMUHVqd0k1SmhqQW8xNmNWU3Uw?=
 =?utf-8?B?MzFNendjVGJmdDJTYnY1MjhRbEpqRjM3SXk4ZENOVlI3cS9JMmNDRGVxTjF2?=
 =?utf-8?B?dzB2R2pBY2IxRTlvY3REM3loMUZ0cnBLY1BqZlVLeFRlSGxRTXJXRmNZeUJ6?=
 =?utf-8?B?ZDl3cmIyMm41NURlVlRDbHB1bkxUWVhBY0hsSWF5eVA4M09aUHE3TFZyU0hO?=
 =?utf-8?B?bDZwTnM1Qk1Uc1pmd1dYT00zdk83S1F1cU1wUi9UbkYrZzRvQmozb2NVRjJy?=
 =?utf-8?B?alVsaWt0MXBZYXpaVkpDbjlxNGtEcURzY3k2REdWVi93VytKMkFWcnQ3c2Nz?=
 =?utf-8?B?THd6clRTdThDekZqYjY3cGx0K1FXai9uelZYNk0yOVVBamgyNDhMdlY4dkQ3?=
 =?utf-8?B?ZkZoMFdOZ0VVRjA4RXFpRkNRc1d1WWhlOEF6WUNCVTdreXBWN3FvdmVsdXdx?=
 =?utf-8?B?NXpVdnFGWjE0WFE0SEFwOG1qVFV2NUZqeGdwcDNTYXl4T3hNMnAwMUJwQU9r?=
 =?utf-8?B?dk5zTXpuellKbUF3RHhlZzlwMVJFZHhJbzFtV0ZkcUwvTlVudERQeUdOdUZv?=
 =?utf-8?B?bWVRV0FaWTVIdXM2WUlPKzlwTU9HTSs2MUZTKzA2U2xSSVBkaURCQzNFMFB1?=
 =?utf-8?B?MjlVUnVKNFZMUEFLUi84M2ZhQ20vcUc5MGZZczNoTWxrQTJrWVdjOGlHb3lU?=
 =?utf-8?B?bG52ZFpWN1NDWUk5UHlxMDV6a2VYNWs1ZjlKcEEyOUJvNFZWN1pGakM2SGJ6?=
 =?utf-8?B?SndOUmVNQSsvbWVwb0F5UGYzT3lDVDBNWmhSVlBNa1NIbzFXaFg0UExveVVw?=
 =?utf-8?B?aFVESWdmajlZVUNBcFZqZnk5cjNuYUU2SmMwRWJXak9vOWtRMHQ4ZUgxSlBl?=
 =?utf-8?B?bTFYZS93THRrQk94Z1N0STdzWDhsWFdaaUlsZEl0ODYwRWc9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L041NjlXY0RQc0pEZnMxSmIvTXJWRWlFV2NSNDFwUHltd0htVzdFVS9ndHV5?=
 =?utf-8?B?NEttR2U5WTNpVThIaUFYeWEyMEZwYkVyT0hoMFAvTm1pZ1RBcFdNeG5tYlZk?=
 =?utf-8?B?WmozTG9xT1NzNlMxY1l5S0RmOTVERWo2bnBWS1FjWFZQUTRLcTFKV1dLYnl0?=
 =?utf-8?B?RFBBWUVjODJuUGl1RFJoWEdld2RJaUtmZi8zbG83c3lxYmpyTHVMTXJhSGdn?=
 =?utf-8?B?eVBUQmMwOTNrbEVBTVJRSWp2N0hZMk8ydmNJVndXekNzSkR2aGdLWGZQbjZC?=
 =?utf-8?B?MjREYTc1VlFtMW16OTV6a3hhRUVhMGpEREdpb0JZaHI3WFlTMUN0OXpjRUFU?=
 =?utf-8?B?Z2t1c3BScVM1amZXdjVQUnFVY2ZaNVhvNStuMUVVd2IxMVltOEc2QTZWVXZu?=
 =?utf-8?B?UkVRRzVyM0hQeUxET3g1WXgyQUprb21nTSsyRDRVTjNtNWtRRmlkblJwSGdZ?=
 =?utf-8?B?TVpZZFJsS1NKSlUzZC95NXU1L2trR3dzUzlKdEx3dDBrbUNZUEdEZzAwckg1?=
 =?utf-8?B?ZEgxTlJDL0Q1b09CdFYzNkFNVGU3T2I1RnNPQ1NobnhyOURiL1Z6RjFWZjZ0?=
 =?utf-8?B?TGFWQm45WDJTQ21kd0QrOHRmelNGbWViVGhYeUFLVGRtbEtTYjk1OGRDcS9C?=
 =?utf-8?B?K25wRjV6cmU0NjVvMXdaWXNNWk9iRmdxNndHOWs4WURSdFlRdzVWMjBZVmda?=
 =?utf-8?B?dlJ5VTVBanBuU0ZoU3NnTTEyckJkWnFDVllSMmI5czFGOXZmcEdhU0E1eDlB?=
 =?utf-8?B?dnVFUXRUK1NQeGp3NVNPd0pGc2JYR3FpK09JSHVvUEN4SWlUaFR2bmNoNldp?=
 =?utf-8?B?YTl3THhOYlpKSGxzVEdHNzBGalN4YzZUMEd5NDQzQ1pjRHZRazRYZHVnL3NS?=
 =?utf-8?B?Yi9wM3BRbzdveW8ySjNJcDRUM0RXSDJvK0M3UGdscEdhZUZEdXdoT0ovRHV4?=
 =?utf-8?B?MkROYUMrU2RpcWNETEVhNXRTZTR2WXhTamZzWE93OG82dEtDc0l6ZUJqeW9F?=
 =?utf-8?B?dTFvd3VyL2pCYW5tSXFBcHk0dldJV0k2Tm9WRGdHUkEzUWl3bzlYcG4yelNS?=
 =?utf-8?B?NzlJWW5TNXM2Tm4yVnFrenNhT2tIcmdINkFHV1I0UTJHR1NUckduaWNVbnlG?=
 =?utf-8?B?UklnVzllQ0U4aHJkRnhrVnMxMllsOUcxeUwzczlFSEplWUNKTVhEb0l6ZDBH?=
 =?utf-8?B?c0R6blV6NDVkdCtGR0dFWDArVWhwR3ZpTnBmWWRyM2pxUWppYWpud253UU5i?=
 =?utf-8?B?WDlyVnVYUXJVb0gwY3JKVWM3QWwvbTJ4eVp6N1FybUFkampLbkdwYlBlRlMz?=
 =?utf-8?B?VzFxWWY5NmYxalNZaVJhTFJSUjB2Q3Nxb1dIY1RyNDNPc1JVbnQ1d3VTR1gr?=
 =?utf-8?B?aGxncVllOWJFRnAreUFtVmNwWm9VS212dU5BdXF6Yzh6eGJVOWpMYzBoQzVK?=
 =?utf-8?B?bVlwbVB4Zk4wNGtWSTBKZW5ORXlJQVFWUFB1VDU1b1FxTFRVemcwTVNJd1E2?=
 =?utf-8?B?a2ltNkNNczNJTVhGaDNTMjZHN1RGeUtGU01maUtzMEpiL1RnZnMwQ3pGVjNS?=
 =?utf-8?B?a1RGVEtxbktYY0ZMZEVEZklrM3FBTG5uV0JkMzRvNXFHZXFudDYzYU8xZGZk?=
 =?utf-8?B?cnRjanJQblNvaGJCd1Z1aWVyVktSSWp1RlZFRHpVV2RvK21ra3lUN1lJLyto?=
 =?utf-8?B?ckJZNURCUjJkbEY4S3RuZ0tPekFmMWJRTU5rdEhHY05rOVg1M0JvYUMwUktS?=
 =?utf-8?B?L2drTGFZWm94WWNuMDhpQU1Ba3UrK3FWaEd1WHR0TDdUYk9ySmZ0alV1NTJO?=
 =?utf-8?B?VitnY2FFRmh5dlBEeXcxRnovNXBNekhKYXU2akZCM1JacXVWM3lkZnZvWkZ2?=
 =?utf-8?B?cmtQaG54ZzVQUmVqaWdvRTdDaEFCMGtndlkzdlRCMlVOb0h6a2dxUXVzd2N5?=
 =?utf-8?B?N3VCNmJ3QkkrOFJJVTE5cE9Sd09XZTZFSmt6SDkyRWh4dG4vOGN1YTBCY3hl?=
 =?utf-8?B?Rklsb2hwamZNSWZyUWJqZU1sYUs2bGRTRFBRVEdrOWZWZVVDREFodG82cjVH?=
 =?utf-8?B?T244ckFldXQwU0NVTXpTSlFpUFhZeXBZTkJ2RGFYMDROLzJhakl6MENsbUMx?=
 =?utf-8?Q?3LFQfBXoVYA+RxD9m6C5VXV0o?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd504806-1ad3-4631-5818-08dc9c288fd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 12:55:20.5336
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gldPKhX1iQTlyLrRL1U/FSsMOEPCLEdrNsdIFaBJf3TlNWW37NgMMOYN8X4UsUXtnRXc2SStsVCRusySJjbDl9n5ZSOad+lm/wzV5i7kCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6556
X-Proofpoint-ORIG-GUID: D1pRDEtYnFgSpYiwe1IuYkgDmhjWDBp1
X-Proofpoint-GUID: D1pRDEtYnFgSpYiwe1IuYkgDmhjWDBp1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_09,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=979 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407040092

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1
bHkgNCwgMjAyNCAxMTo1OSBBTQ0KPiBUbzogQWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3YWxA
YW5hbG9nLmNvbT47IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5h
bG9nLmNvbT47IERtaXRyeSBUb3Jva2hvdg0KPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47
IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxr
cnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBT
YSwNCj4gTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogbGludXgtaW5wdXRAdmdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc7IEFydGFtb25vdnMsIEFydHVycw0KPiA8QXJ0dXJzLkFydGFtb25vdnNA
YW5hbG9nLmNvbT47IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWthc0Bh
bmFsb2cuY29tPjsgR2Fza2VsbCwgT2xpdmVyDQo+IDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDMvM10gZHQtYmluZGluZ3M6IGlucHV0OiBVcGRh
dGUgZHRiaW5kaW5nIGZvciBhZHA1NTg4DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAwNC8w
Ny8yMDI0IDEyOjQ1LCBVdHNhdiBBZ2Fyd2FsIHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPiArDQo+
ID4gKyAgLSB8DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvaXJxLmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQu
aD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9ncGlvL2dwaW8uaD4NCj4gPiArDQo+
ID4gKyAgICBpMmMgew0KPiA+ICsgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4gPiArICAg
ICAgI3NpemUtY2VsbHMgPSA8MD47DQo+ID4gKyAgICAgICAgZ3Bpb0AzNCB7DQo+ID4gKyAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiYWRpLGFkcDU1ODgiOw0KPiA+ICsgICAgICAgICAgICByZWcg
PSA8MHgzND47DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAjZ3Bpby1jZWxscyA9IDwyPjsNCj4g
PiArICAgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOw0KPiA+ICsgICAgICAgICAgICB9Ow0KPiAN
Cj4gRml4IHlvdXIgaW5kZW50YXRpb24uIEl0J3MgdG90YWwgbWVzcyBhYm92ZS4NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCkFwb2xvZ2llcyBmb3IgdGhlIHNhbWUsIEkgd2ls
bCBiZSBmaXhpbmcgaXQuDQoNClRoYW5rcywNClV0c2F2IA0K

