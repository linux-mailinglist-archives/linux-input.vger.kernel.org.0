Return-Path: <linux-input+bounces-4861-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50299277EB
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 16:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87351281888
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 14:13:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0B31AEFF5;
	Thu,  4 Jul 2024 14:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="yi8yLRLI"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B351AED5F;
	Thu,  4 Jul 2024 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720102386; cv=fail; b=O9gjhK4YgNb4tNQ44djL2NnA3P0Xd9K5vO8G2CJq7UzJmuKbHFmJDVK0XS4U7EsoRvDKvQdzz1qs7fy7r7Jqa55FnuJnFxCbqVnwQXwwLWMMyJ2QWh9GGKjEYP0KceVeidz3YgqMke4PuapKJ7d82XmFV/RPeLMhxjR8NSvt3ME=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720102386; c=relaxed/simple;
	bh=VOvqDMMKwf71CMR571dt0xs2OTIjRlKr2QVDWZbboLs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sQ0N16AAIjUa4dclIn7lmeB8Efgz7enMoW4VYQykXxQscKasYyDEGhWUxbPBiD97B5zokfbb7K8PHx5WIQpt9AF+QuDSd+gUfDaVhXy1pEFuXym73c+IsR/9r3YtxxT4Nl531hlqTC8J0Eog2sXKTn1+xYxUAj4XM5eIhd9rpv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=yi8yLRLI; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46484Yqk026585;
	Thu, 4 Jul 2024 10:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=VOvqD
	MMKwf71CMR571dt0xs2OTIjRlKr2QVDWZbboLs=; b=yi8yLRLImDcsCrZhVDYPD
	dSs9G74vC/tWxt6pBJVBBrdBdgAY8G6uyZEp2SpfwoGpoQixx0jk52t7Lqq+tcNe
	Qmn5uFYTYo/4YAEqJ7vrDdn1TcbqNckiUr92OW7j3kfLSeqZq+lKpg2SSa7xsh6p
	swAuJSPfMdf4IIe+2hEHvm3rpFTNWmF8M3vRx/T9qm8MGommoYr7KGlG3zOAFQrF
	4OZaG4/UyCML+3/KnzIrg3nm5w76X1DkLSqKvMmI3HbrD26qrz+UISLnSOohULDA
	1Cc+c/wQUTQtTkN2B0cg9bb7xcdLG55O/KeJ/leqAHU9vMoJEFi1xN9wuzzF7ygO
	Q==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazlp17010005.outbound.protection.outlook.com [40.93.11.5])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 405a7kkaj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 10:13:00 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OpH232jqeb6SoShuxbI21+n11aEpFbAd+KxDmni2JprQn59bvh5Qz17eWXF76O0cIBgFgRaRyGqRJaLpOKJuz/QGU4hKiAN6AulTst/Wx39DxtCBq/PNK2efusHxwT2tpsfvi3DGDi6D6ZbxtwL43O9SSr2sCCSNneySwsKkihdubLL+WNcOJWo7ApTO3CQ+qwZpB3equFMYNDx98DgBKXAr6g9cFSt8RV4QuT5rkgUee1Rb/poCpH0KWrk+PHwBI679YuWU9E9c5/moVgkAuPU8cKeruDdM0tOHP7Vgng56zP5EB2Xmsuk8zZdmbNVpRyHssaax22EE2W65Hni2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOvqDMMKwf71CMR571dt0xs2OTIjRlKr2QVDWZbboLs=;
 b=MPhFbGtSpoVq1hGNJbm9kEztkVnvL1A6h1qr5XDgL0O6+WVtFBN2WQBX6mP7C+bnCEipaWN0zi1OzedxlBON3VlA7KebS/OPscovVD+ERZjOfnXvCyJIaRhJt0GNNeVlYQYwiagtXjXIVtDidt+biJRb74zyzJ9jdHxEpf0hWDbNb8YDMGD6c18o44zai4YqF1nL5enslWQJt4HdrQFoenCKQvyGPc5Hmk7E52c6YY5/8UBuhW7FPNK4MAGKoUhQZ4RilMZI52zDRwdXhoiSSYl3vpYJNufl61uzroB/aH+jejwZrEm7XRukhMtJdc+fBHGdJ5fapcegC1LEknibAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA1PR03MB7123.namprd03.prod.outlook.com (2603:10b6:806:330::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23; Thu, 4 Jul
 2024 14:12:57 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 14:12:57 +0000
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
Subject: RE: [PATCH v7 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v7 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHazhKmwCPcamEJ/06qcpdxul933rHmkiqAgAAJZmA=
Date: Thu, 4 Jul 2024 14:12:57 +0000
Message-ID: 
 <SJ0PR03MB6343DE07C7C7343A4AFD9A449BDE2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240704-adp5588_gpio_support-v7-0-e34eb7eba5ab@analog.com>
 <20240704-adp5588_gpio_support-v7-3-e34eb7eba5ab@analog.com>
 <25e29357-8976-4471-af95-08056e8652de@kernel.org>
In-Reply-To: <25e29357-8976-4471-af95-08056e8652de@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTA0TVdaak5tWXpNQzB6WVRCbUxURXhaV1l0T0RSbU15MDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjT0RGbVl6Wm1Nekl0TTJFd1ppMHhN?=
 =?utf-8?B?V1ZtTFRnMFpqTXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STRNRGM0SWlCMFBTSXhNek0yTkRVM05UazNOakUzT0RFNU9Ua2lJR2c5SW5S?=
 =?utf-8?B?bmNGZDRjVXBKWVRsemVYRjZhVVp6WlRGWlEyWTNVRVl5VVQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUkhac1JscEZTRTAzWVVGalNrMVpiM0ZoUXpGWWMz?=
 =?utf-8?B?ZHJlR2xwY0c5TVZtVjNSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA1PR03MB7123:EE_
x-ms-office365-filtering-correlation-id: 1024f1ad-0674-4947-c4da-08dc9c336786
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?VTJoZWpKbk9YR3psV3huQ3l0a3hPZTI0K0NyVlpSMVVaZjN0UFFQT2kwbmtt?=
 =?utf-8?B?djlQQzNla1RXVktyTVhqaEpKMUZwQXhoSmhUTHphb2hENGdIQnpvWnJlbGRi?=
 =?utf-8?B?MzBZN1QwZmREYkUvRkpsdElYS1JYMHZpRVh4K3ByRC9EdWRCY2E2bDZNREhO?=
 =?utf-8?B?Tm9IRzRzTGdXUDg0RzNkR1BmV0poZldOT2NGa2lWMStyQXNnQ2xRbEVUQnU2?=
 =?utf-8?B?WDBlZVRVdCtrcHFuYTlDdGZWQW1xMGxVNk1zRmdySjM4MDlRTnRZZGl4Rlcv?=
 =?utf-8?B?SVIwcUY2bGF4R0JyNDArQmh3dWVQYURVckdVeUtZUkdiRkg3ajhQdHV1d0V2?=
 =?utf-8?B?Y3oxKzVvRTVqMFpON1FPN1JvQjZpZTg1VUc1bjBIVktxb0ZWeDQxZS9BanhB?=
 =?utf-8?B?d3Y0b1Zsc0N5M0EwQldXMkdaQjc1dFluNUhPVnBBUGJpYlpNeG1FVWpSVVJS?=
 =?utf-8?B?YWd3QW1sblY5T0NlKzk5cyt4Z1FOV09HdWx1VnF4Z0RkOGtVWFBEVWNnZGNQ?=
 =?utf-8?B?R1IzUnR5SDJ6d3BIdDg2QzNYNnBOUkRBaGsrM2txUGs1a0R1WjJvUURnZm84?=
 =?utf-8?B?OUZuVC95STNPQjEzZkRmeTljalFRSTk5aHVhTEtTTUF1MlJEVHd1VVNtVTVr?=
 =?utf-8?B?SUpiaEdFV1NWUUQxNWtIZUxNYTdhdEJaM0N4ZWNWUE1TdmF3LzNrTnk2R1Bi?=
 =?utf-8?B?UTNPNmJPTFBtZ0c3U3huWjdGMVhCZHZZRThkaFFXbU5JYVhCZjM5L0FmR1Ja?=
 =?utf-8?B?QWhURjNLU3lNRE1scGtIM0NjemZqSVg3Z2xmU3Jib29MUnNBcnM1ekIra1FN?=
 =?utf-8?B?K0g2Zi9yWXRvYkQ3WU9nV2xBNXJHMXRUMU8xSStCbVNCbFd5cko2TFNTRUhB?=
 =?utf-8?B?QkN3N0owa212OWQzS21mcGhjdHhFNW51VUk2eHJNS0wrR3VuU1BMQm13bFlt?=
 =?utf-8?B?QXgvaDI1TlcrSmRmbGZuOFR1dnQ0ZzJsd1Q3eURJRWV6KzluVzNyekkrb21J?=
 =?utf-8?B?c0xQSGV2ZFl4N0M3U3hXMlI4Ni9tdG9TVHR6dVhyc1dHbGppc3VYSWxRWC9C?=
 =?utf-8?B?N1VMUTlJNzFsWVV6SjRTM2dvQWFVOVhhWXd1eXRQdjEyNGU3SjV0dnhJQUtU?=
 =?utf-8?B?SnRHK2hNS1FjSFgyajNDZExpVnAyK0FnOG9nRTgrWGVTMHNEUzhjSXhPTGlz?=
 =?utf-8?B?T2FlMjlZTVF5MmFFb2dyUWRkTnltMytsUnRXdlp3MWozTWFhVkoxNEZjMVc5?=
 =?utf-8?B?cERTTVZHWEw0WTBEaEdNSEFhT1lqeE0vakRCT29qL20wTit0cC9DbnQvMmFw?=
 =?utf-8?B?TFI2b08wVVF0ekZhV0RJdGdzVGFHTnJBWXlLL1Q0TXNOd2srOGwrZ3Q4bUZM?=
 =?utf-8?B?RjFLenZ2Tk01azdyajBwWEYvWWw4a3V0RGJZR0syWHczN0RTNTJsc1JwVGkw?=
 =?utf-8?B?WC9lZXZVZzI1WHB6VStpOFFxY3JYZFFJUGljQVQ0ZDVjUUlreUNMNVZiZFVN?=
 =?utf-8?B?ODdkM1ZjYktHTVNzWkN4c2FGV2lWTElSaTJtZFpTNDJTMmQwYTEvcG1aeG44?=
 =?utf-8?B?Z29pOTdXdjJrQXEzVExZUU84MUZURWpPeUpSS0JvcEE1ZFBxdHB6aWxqTTRk?=
 =?utf-8?B?YmN4RFV3Wi82UkpnSTRJS2pBM3RCV0NNejZnUTdxWmRMdmF2aytrS1Y1QVR3?=
 =?utf-8?B?TU9mUndiRXNrcVVpNkIzajZFRVdsSm10ZzY4RVpwMDhoTVpNOWN4NVJsbitq?=
 =?utf-8?B?bFZ5RDVBV0hlRisydng4RjBNVUFNVUJlbm9iaVdyc0VlQjNVcUM3Q0YvK1pQ?=
 =?utf-8?B?UVNoTWFoNG1VVy9XSVpjbW1aT2xpV2poYUtpYzVuQjZZWEV6NkdhNk5TdmdD?=
 =?utf-8?B?eE1lWW5zUGVmUU85NlhxdlNLT0xOSEpSd29hMG51ZEJkUUE9PQ==?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bEMyamJRQUw5L2ZVSVpWWDM5QVo2NzFjTU9ZT3pCTjI4T0Y2VFF5ZUhRWXpp?=
 =?utf-8?B?TFFaZVpHWkhxUWhQWktzUkJzYnhXTXZ4YVNWaDFncTl3N0dabUhYOVFQaDRC?=
 =?utf-8?B?N0htcEx3RU0rTkpyZnByNTl4amNqaDVvTmsrVUpmSG1MTVJ5RDdZYmU2ODUy?=
 =?utf-8?B?Wnd6WEpjOTdNWkMrR2dQdTRETVEzUjRNOWxIK0tOT3RoeStEdHNxRHU2V25o?=
 =?utf-8?B?NXlCUktrT09QS001dTVPSHZlcC80RmozejJoZStsOURjaGxvcHFLUHhicGx3?=
 =?utf-8?B?VnhHT2VuSjdEVTl2RnFiZkovTm9lZlNDMXlFeU1qSDFTbmdNbG01WjRoNitL?=
 =?utf-8?B?WWsxZnVrSEFVZHcrZ3h2V05zaG1sMnFwVDU0UjkwYSszUmVOWGNBMHNUakJS?=
 =?utf-8?B?djVxRllWa2NCRXpCdnRQOEtXL3hhQU1OOU9HY2pZVlRFSHdlV2lQTVcrZEUz?=
 =?utf-8?B?L3FoQ1Uya0xhUnFCTWp3Slk4S3NvRUVSb3ZZSE5sTS9aejBUdnlpMzRjL2Vj?=
 =?utf-8?B?SWFjTVVTdHlJb2Y2V2hDVWdOdmtUNnQ0aWQ1cllDaDBOeXRlbVJhT0liOXYr?=
 =?utf-8?B?WUNDMHJvM2VuVmVDTmlkRUNreVdLNy84elFiYnE0VlRFTFMzd1d2enE3Wjl1?=
 =?utf-8?B?VDA5eUtuZDdDVWxGcSs3YVF6ZEpoSVRXRnpQekxXY2dPQTMwMHhGQTZyNnUw?=
 =?utf-8?B?VU5xUDA1VXhzUnBhZVFsaWZiQXJ3MkdHUHpsQmRXTjBuKy9jSkU5c0xrZ1Vs?=
 =?utf-8?B?TDNGMVdqMmc0S041amUyWndlT2tyKy9VRzMrY3hSVWlTWjB5cExRV1lUTmJV?=
 =?utf-8?B?QXNHSVNBODZEVFhzc3NCems1S3g5a0dXcHpaQjR3QXpRbjFuRmtWVjdHcVlT?=
 =?utf-8?B?RUdaNkRCSWxjamhJc3d2Tjhnc2RGdUtOenhTZmduSE9CUVMyVlpCUnlmaWI1?=
 =?utf-8?B?V05DSWM4NVdRT09KWjFzTzQwSS9HRFYwQWtwcktVSFMrVWxGZ0Zvc1FycUhP?=
 =?utf-8?B?bUZLL29EajNnSnNOdmRIKzdmOE9YdjNIdVdqeVRvSGphMDNicnAyV3ovRWU3?=
 =?utf-8?B?aVZHR0haalI1YVVYcExRZ1JuWmVqQ0FlTkF6U250YUhUN0pGKzVYSm5JOURJ?=
 =?utf-8?B?Q0lveTc3VUVxMlNZQ0VUTHVjYTRpM3RRcEllT3pXMHhUUGVmdytsRVZlYnlt?=
 =?utf-8?B?ZEViRTNCY1J3QjVLbDVtc3F4Um54dHl4WnRQTjRRRHRvRzMyM3BlQjFxK1JH?=
 =?utf-8?B?dVo1c0paQVEvL1ZJRjBicmZqeTJkSmYyV3pxc2hzYWpVeUlSVjRPTTdEYUlZ?=
 =?utf-8?B?b0RncWZvRE1nRzdjVEtsYkN4TVBjd1hROG1XVHNxbDhweFN0QkJVMXJzaW1L?=
 =?utf-8?B?UWpJSklOYTIvSVYyMStUNFRhU3pLanJRZERsU01pcFBJQTBtUUc2N3dFbmov?=
 =?utf-8?B?azRLMExyaGVSbFdvYTN2Z3dWT1o3SlcxL0ZKUDdXZ2ZBUkVxajdaazM4eUE0?=
 =?utf-8?B?WmpzUnM3YjNMZXZvMmZhZlBmNXJqY3ZSUFpPMjJvZjFXVGZQUGplODNqM0M2?=
 =?utf-8?B?cEFESGlVbWdHZmQ4SVREeXhnQ3BFV3FseGhuTjc4TlF4aU5MQ2hrcFRiR1Jj?=
 =?utf-8?B?eUNwL1NxQWkxWGhPN0FFVy9BZGtYSU5SM0NBUXpheit2SUduUHdqUS93VEtH?=
 =?utf-8?B?Zi85eUVJWkNJZEtwOERkc1RUalI4a3lPTGNCeTVyaUVUUDI0YzZHZXhUS2Y3?=
 =?utf-8?B?bGY4NmhEREpOVWRJdDVDclBZVmhrSkJHd2pPUW9ENTgwckN2V0dyWm9UZkpq?=
 =?utf-8?B?Z01GVVNabmJWZkhPRXNBQnpUTmd2elZuanR5ZmtWNUtaSnJtVWlxZThLOEN3?=
 =?utf-8?B?WWxoUHNMZE1zeEN3Z0tPY2R1eUVPV1BHbDJtYTkwb1BteEpEYWozcDhuYUdX?=
 =?utf-8?B?ZjFBbVpNOFhsd0Y0eG13a1FNK1hwWWZPRmswZWdEQXBKaUErd0tNb3VncGVX?=
 =?utf-8?B?bVZzcTgvL0NUazkwMkpPTUFDWnkwb1JkRnh6UzJVUDJVN2tzM0tUeDk2T3Zi?=
 =?utf-8?B?cDFtcExpcE9xNFh5L3QzTnRkYTJiMjJGN1hFWlpKUXpTTHlLSWdtYXh6M25w?=
 =?utf-8?Q?k86RHss9mPz9/G9Uk592Xl55D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1024f1ad-0674-4947-c4da-08dc9c336786
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 14:12:57.3747
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPnHSzxGuYAwiEMi/ezWvC4zvNxFYhGp3oebkgWSqIc3J+cnLTe4pql60f6Pqm/eJ5yfPj/kOzxs3/1oNsOge61u/cMTun2Bw/0l4cqmPLA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB7123
X-Proofpoint-GUID: DBbywJLY4eOJeabmxW0APvDr3ZJBhN9a
X-Proofpoint-ORIG-GUID: DBbywJLY4eOJeabmxW0APvDr3ZJBhN9a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_10,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407040101

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSA0LCAyMDI0IDI6
MzYgUE0NCj4gVG86IEFnYXJ3YWwsIFV0c2F2IDxVdHNhdi5BZ2Fyd2FsQGFuYWxvZy5jb20+OyBI
ZW5uZXJpY2gsIE1pY2hhZWwNCj4gPE1pY2hhZWwuSGVubmVyaWNoQGFuYWxvZy5jb20+OyBEbWl0
cnkgVG9yb2tob3YNCj4gPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+OyBSb2IgSGVycmluZyA8
cm9iaEBrZXJuZWwub3JnPjsgS3J6eXN6dG9mDQo+IEtvemxvd3NraSA8a3J6aytkdEBrZXJuZWwu
b3JnPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsgU2EsDQo+IE51bm8gPE51
bm8uU2FAYW5hbG9nLmNvbT4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBBcnRhbW9ub3ZzLCBBcnR1cnMNCj4gPEFydHVycy5BcnRhbW9ub3ZzQGFuYWxvZy5jb20+OyBC
aW1waWthcywgVmFzaWxlaW9zDQo+IDxWYXNpbGVpb3MuQmltcGlrYXNAYW5hbG9nLmNvbT47IEdh
c2tlbGwsIE9saXZlcg0KPiA8T2xpdmVyLkdhc2tlbGxAYW5hbG9nLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2NyAzLzNdIGR0LWJpbmRpbmdzOiBpbnB1dDogVXBkYXRlIGR0YmluZGluZyBm
b3IgYWRwNTU4OA0KPiANCj4gW0V4dGVybmFsXQ0KPiANCj4gT24gMDQvMDcvMjAyNCAxNTowMywg
VXRzYXYgQWdhcndhbCB2aWEgQjQgUmVsYXkgd3JvdGU6DQo+ID4gRnJvbTogVXRzYXYgQWdhcndh
bCA8dXRzYXYuYWdhcndhbEBhbmFsb2cuY29tPg0KPiANCj4gU3ViamVjdDogZXZlcnl0aGluZyBp
cyBhbiB1cGRhdGUsIGJlIG1vcmUgc3BlY2lmaWMuDQo+IA0KPiA+DQo+ID4gVXBkYXRpbmcgZHQg
YmluZGluZ3MgZm9yIGFkcDU1ODguIFNpbmNlIHRoZSBkZXZpY2UgY2FuIG5vdyBmdW5jdGlvbiBp
biBhDQo+ID4gcHVyZWx5IGdwaW8gbW9kZSwgdGhlIGZvbGxvd2luZyBrZXlwYWQgc3BlY2lmaWMg
cHJvcGVydGllcyBhcmUgbm93IG1hZGUNCj4gPiBvcHRpb25hbDoNCj4gPiAJLSBpbnRlcnJ1cHRz
DQo+ID4gCS0ga2V5cGFkLG51bS1yb3dzDQo+ID4gCS0ga2V5cGFkLG51bS1jb2x1bW5zDQo+ID4g
CS0gbGludXgsa2V5bWFwDQo+ID4NCj4gPiBIb3dldmVyIHRoZSBhYm92ZSBwcm9wZXJ0aWVzIGFy
ZSByZXF1aXJlZCB0byBiZSBzcGVjaWZpZWQgd2hlbg0KPiA+IGNvbmZpZ3VyaW5nIHRoZSBkZXZp
Y2UgYXMgYSBrZXlwYWQsIGRlcGVuZGVuY2llcyBoYXZlIGJlZW4gYWRkZWQNCj4gPiBzdWNoIHRo
YXQgc3BlY2lmeWluZyBlaXRoZXIgb25lIHdvdWxkIHJlcXVpcmUgdGhlIHJlbWFpbmluZyBhcyB3
ZWxsLg0KPiA+DQo+ID4gTm90ZSB0aGF0IGludGVycnVwdHMgYXJlIG9wdGlvbmFsLCBidXQgcmVx
dWlyZWQgd2hlbiB0aGUgZGV2aWNlIGhhcyBiZWVuDQo+ID4gY29uZmlndXJlZCBpbiBrZXlwYWQg
bW9kZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFV0c2F2IEFnYXJ3YWwgPHV0c2F2LmFnYXJ3
YWxAYW5hbG9nLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaW5w
dXQvYWRpLGFkcDU1ODgueWFtbCAgICAgfCA0Ng0KPiArKysrKysrKysrKysrKysrKysrLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1
dC9hZGksYWRwNTU4OC55YW1sDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2lucHV0L2FkaSxhZHA1NTg4LnlhbWwNCj4gPiBpbmRleCAyNmVhNjY4MzRhZTIuLjQ4MWMzNzU5
NWViYiAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW5wdXQvYWRpLGFkcDU1ODgueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9pbnB1dC9hZGksYWRwNTU4OC55YW1sDQo+ID4gQEAgLTQ5LDcgKzQ5LDEwIEBA
IHByb3BlcnRpZXM6DQo+ID4gICAgaW50ZXJydXB0LWNvbnRyb2xsZXI6DQo+ID4gICAgICBkZXNj
cmlwdGlvbjoNCj4gPiAgICAgICAgVGhpcyBwcm9wZXJ0eSBhcHBsaWVzIGlmIGVpdGhlciBrZXlw
YWQsbnVtLXJvd3MgbG93ZXIgdGhhbiA4IG9yDQo+ID4gLSAgICAgIGtleXBhZCxudW0tY29sdW1u
cyBsb3dlciB0aGFuIDEwLg0KPiA+ICsgICAgICBrZXlwYWQsbnVtLWNvbHVtbnMgbG93ZXIgdGhh
biAxMC4gVGhpcyBwcm9wZXJ0eSBpcyBvcHRpb25hbCBpZg0KPiA+ICsgICAgICBrZXlwYWQsbnVt
LXJvd3Mgb3Iga2V5cGFkLG51bS1jb2x1bW5zIGFyZSBub3Qgc3BlY2lmaWVkIHNpbmNlIHRoZQ0K
PiA+ICsgICAgICBkZXZpY2UgdGhlbiBhY3RzIGFzIGdwaW8gb25seSwgZHVyaW5nIHdoaWNoIGlu
dGVycnVwdHMgbWF5IG9yIG1heQ0KPiA+ICsgICAgICBub3QgYmUgdXRpbGl6ZWQuDQo+ID4NCj4g
PiAgICAnI2ludGVycnVwdC1jZWxscyc6DQo+ID4gICAgICBjb25zdDogMg0KPiA+IEBAIC02NSwx
MyArNjgsMjggQEAgcHJvcGVydGllczoNCj4gPiAgICAgIG1pbkl0ZW1zOiAxDQo+ID4gICAgICBt
YXhJdGVtczogMg0KPiA+DQo+ID4gKw0KPiA+ICtkZXBlbmRlbmNpZXM6DQo+ID4gKyAga2V5cGFk
LG51bS1yb3dzOg0KPiA+ICsgICAgLSBsaW51eCxrZXltYXANCj4gPiArICAgIC0ga2V5cGFkLG51
bS1jb2x1bW5zDQo+ID4gKyAga2V5cGFkLG51bS1jb2x1bW5zOg0KPiA+ICsgICAgLSBsaW51eCxr
ZXltYXANCj4gPiArICAgIC0ga2V5cGFkLG51bS1yb3dzDQo+ID4gKyAgbGludXgsa2V5bWFwOg0K
PiA+ICsgICAgLSBrZXlwYWQsbnVtLXJvd3MNCj4gPiArICAgIC0ga2V5cGFkLG51bS1jb2x1bW5z
DQo+ID4gKw0KPiA+ICtpZjoNCj4gPiArICByZXF1aXJlZDoNCj4gPiArICAgIC0gbGludXgsa2V5
bWFwDQo+ID4gK3RoZW46DQo+ID4gKyAgcmVxdWlyZWQ6DQo+ID4gKyAgICAtIGludGVycnVwdHMN
Cj4gPiArDQo+ID4gIHJlcXVpcmVkOg0KPiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0gcmVn
DQo+ID4gLSAgLSBpbnRlcnJ1cHRzDQo+ID4gLSAgLSBrZXlwYWQsbnVtLXJvd3MNCj4gPiAtICAt
IGtleXBhZCxudW0tY29sdW1ucw0KPiA+IC0gIC0gbGludXgsa2V5bWFwDQo+ID4NCj4gPiAgdW5l
dmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+DQo+ID4gQEAgLTEwOCw0ICsxMjYsMjIgQEAg
ZXhhbXBsZXM6DQo+ID4gICAgICAgICAgICAgID47DQo+ID4gICAgICAgICAgfTsNCj4gPiAgICAg
IH07DQo+ID4gKw0KPiA+ICsgIC0gfA0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2lucHV0L2lucHV0Lmg+DQo+ID4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvZ3Bpby9ncGlv
Lmg+DQo+ID4gKw0KPiA+ICsgICAgaTJjIHsNCj4gPiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwxPjsNCj4gPiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICBncGlv
QDM0IHsNCj4gPiArICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFkaSxhZHA1NTg4IjsNCj4g
PiArICAgICAgICAgICAgICByZWcgPSA8MHgzND47DQo+IA0KPiBTdGlsbCBtZXNzZWQgaW5kZW50
YXRpb24uDQo+IA0KPiBEaWRuJ3QgeW91IGdldCBhbHJlYWR5IHN1Y2ggZmVlZGJhY2s/DQo+IA0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0KSSBkaWQsIEkgc29tZWhvdyBtaXNz
ZWQgdGhlIGV4dHJhIHNwYWNlcy4gTXkgYXBvbG9naWVzIGZvciB0aGF0Lg0KDQpUaGFua3MsDQpV
dHNhdg0K

