Return-Path: <linux-input+bounces-4842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B79271FD
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 10:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F4512852EF
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 08:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C00C41A3BDB;
	Thu,  4 Jul 2024 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="N8mvbZi+"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE81B1370;
	Thu,  4 Jul 2024 08:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720082858; cv=fail; b=gNz/igOhhIo4DOAByOclJVZHP6QTcTtsRdPOSDKJowU8sfgWAX42ecVvwUy2oI+iGTiBwxUmlARaL1xkmXLfhHiR+tStr4QEqzrKPcLRA3UOCEmwy2uSVHhgTszr0Deior9Lr6Uw0RPKMbB9tzpXyhEfbT5PbyfPnLcWTL7CV6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720082858; c=relaxed/simple;
	bh=EVnuDSkIs154NqsplQH6ZxWIB/Tdrl/LtxSqrcwHZhI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S7k4O3W2Bvi0Q8nECjjmh13+YUIvbMKE6BTiBlpcrfN4dZ5emZ7BNPCbJMy29FCLTdKc23MfqzAbJxiIfbAHpdptUOelEfZqIDFVOwXxPEU9fI1nxJww5jPak/3l0qgc062L+lFlall8t/Vjb5WmEm32Ia47XG05chQYogNFQBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=N8mvbZi+; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46482ibQ026555;
	Thu, 4 Jul 2024 04:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=EVnuD
	SkIs154NqsplQH6ZxWIB/Tdrl/LtxSqrcwHZhI=; b=N8mvbZi+XvqQUAWrAN68Z
	QN/ZnbwVLMTRtVN3p5aXkL4zbtBzK8VY5aIzzJ451tc5FZwjX/mtG97BpnLhPt3D
	XRs2UHVQn8pjqhZbxr2daB37jZhShRmfzp5qU7a8h6iJssmbZYnqRcOH9wR1LjaX
	UulNOq3upwV0rnE9iceiijt9qo1/TYz21nm+OIFTbJ35IisTwPv7mjg7K8kx3zSw
	+NxIfPhe8iB8/OAgw/7cOEVyYm8knQjidV5CjuyDutIpcl2l9KaeMlfHvLfAneP1
	ugNDfOyCgiSsnRJbM1TRp6cWplLt3g8Gu2o+cMM9icjoEOEkD9Bi2FqeN81xo+Yb
	w==
Received: from bl0pr05cu006.outbound.protection.outlook.com (mail-eastusazlp17011006.outbound.protection.outlook.com [40.93.4.6])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 405a7kjffv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Jul 2024 04:47:20 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GofzpWBgmXWB2c+bqzssyHUi4n9jP8TnszOr2qzcbOWbA3qM6gTYnoVz6XCeHMhjebE2YWsiNzw3U9ZBX62rVMaBg0euW8QAKr3+bcBTeDk6boGJUTft81hX9EXwKNrk8NIdulQx9riOA638bThXpl70X8IKe1UXhc52ub80ACUm15mt7LJLPXGRb1aLd2C9g4cYh5pCHOxZisx1bh7vl01OuYekhMl9F4JKBAssHIc6CVCvt/zTBxpw7WU5IcYAdi8uyUqGSM2m/2tfJdp6sJCdN+Wls64zTllXUwhCk4ik/eo+Arv/+nfKDTsfoiqxjJt+yIPDEeMw5ALxcVm+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EVnuDSkIs154NqsplQH6ZxWIB/Tdrl/LtxSqrcwHZhI=;
 b=WUkXuwBTjE9IsMh5+y1wSBagPuLjoFkRQlBHCCLD22BeQScfEymbGszXuTpc9Jz+3uAyOzsxJ6TxlIK3ZMClyo0qWjbIhGAHufNYeUouCKcRwEv0HE+xxMBKC5EJbn5GJeO69bYCklX6I8c7lS+P48dFr9KAYpjYu4XCMUAEtz5FhSZKRchKpN3BQTzCY+ZNXOzo4do9tqkEQ82GwtBSbcmICY3Ty8aRkinvdKp110nrb5oA5a29u/g94y1vZ9D5zpC9K007G3mhKs8QRLr5sAoLjhk8hRuNqwdhinE8M0h5hVoxMRgs7aYulxO/df6yKupF5RYpsPQGHCTuTRQhpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by CH2PR03MB5206.namprd03.prod.outlook.com (2603:10b6:610:a3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.29; Thu, 4 Jul
 2024 08:47:17 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 08:47:16 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: =?utf-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
        Conor Dooley
	<conor@kernel.org>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Sa,
 Nuno" <Nuno.Sa@analog.com>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Artamonovs, Arturs"
	<Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>
Subject: RE: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHazTfw/2hsta4X2kmND8+3BCbBtLHlHpmAgAABKpCAAAlYgIABAXAAgAAXpFA=
Date: Thu, 4 Jul 2024 08:47:16 +0000
Message-ID: 
 <SJ0PR03MB6343BC07CD7C73DB64097C8A9BDE2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
	 <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>
	 <20240703-safehouse-flame-0b751b853623@spud>
	 <SJ0PR03MB63432316EE8382033A4396369BDD2@SJ0PR03MB6343.namprd03.prod.outlook.com>
	 <20240703-mandate-hardy-281ddd048b40@spud>
 <b9a57a014cab9ff7d9578f52bc7faef1dbea6ff6.camel@gmail.com>
In-Reply-To: <b9a57a014cab9ff7d9578f52bc7faef1dbea6ff6.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTB3TWpNNU1ESmhPQzB6T1dVeUxURXhaV1l0T0RSbU15MDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjTURJek9UQXlZV0V0TXpsbE1pMHhN?=
 =?utf-8?B?V1ZtTFRnMFpqTXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhNak13TUNJZ2REMGlNVE16TmpRMU5UWTBNelEwT0RnMk5UY3hJaUJvUFNK?=
 =?utf-8?B?b1VXNWhURGQzWVhWb2FUQkJhSGsxVkZWQ2FWa3ZaVVpXU21jOUlpQnBaRDBp?=
 =?utf-8?B?SWlCaWJEMGlNQ0lnWW04OUlqRWlJR05wUFNKalFVRkJRVVZTU0ZVeFVsTlNW?=
 =?utf-8?B?VVpPUTJkVlFVRkZiME5CUVVGeVdscFlSVGR6TTJGQlpXc3ZObUpXZGxVcmFq?=
 =?utf-8?B?UTJWQzl3ZEZjNVZEWlFaMFJCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJTRUZCUVVGRVlVRlJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJVVUZDUVVGQlFUTk1hRk5tWjBGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VW8wUVVGQlFtaEJSMUZCWVZGQ1prRklUVUZhVVVKcVFVaFZRV05uUW14QlJq?=
 =?utf-8?B?aEJZMEZDZVVGSE9FRmhaMEpzUVVkTlFXUkJRbnBCUmpoQldtZENhRUZIZDBG?=
 =?utf-8?B?amQwSnNRVVk0UVZwblFuWkJTRTFCWVZGQ01FRkhhMEZrWjBKc1FVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGRlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFXZEJRVUZCUVVGdVowRkJRVWRGUVZwQlFuQkJSamhCWTNkQ2JFRkhUVUZr?=
 =?utf-8?B?VVVKNVFVZFZRVmgzUW5kQlNFbEJZbmRDY1VGSFZVRlpkMEl3UVVoTlFWaDNR?=
 =?utf-8?B?akJCUjJ0QldsRkNlVUZFUlVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJV?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVGWlVVSnJRVWRyUVZoM1Fu?=
 =?utf-8?B?cEJSMVZCV1hkQ01VRklTVUZhVVVKbVFVaEJRV05uUW5aQlIyOUJXbEZDYWtG?=
 =?utf-8?B?SVVVRmpkMEptUVVoUlFXRlJRbXhCU0VsQlRXZEJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJRVUZCUVQwOUlpOCtQQzl0?=
 =?utf-8?B?WlhSaFBnPT0=?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|CH2PR03MB5206:EE_
x-ms-office365-filtering-correlation-id: 85753006-8283-4cfd-9949-08dc9c05e83f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TTVMNVBIcGZqcEVGa0JnVFFjRjROMWw3S25NdkFDb2NQRTVCZG50QnRzVmo1?=
 =?utf-8?B?ZEpPaXJJaWN4LzBtM0pHM0ZYaExYUG5ZMnB3eEdOY0UvSHBIU1NabWZ2dENY?=
 =?utf-8?B?QVA5UlZCOUsxeTJYU0hiN0pRVWRRSURsVlpPa1VLaVN2NHN2ODl2c0swV3h2?=
 =?utf-8?B?VVg0cUx5NUxkRzBNR3RyYVRlV3UyenREeXp2cmpmUG1Pb0YyVWROUmdpOUx4?=
 =?utf-8?B?akZ6NGNubmd1MVNIK2xrUmp3b0lHRFVuYXc4TmVZNUNjYjZkcDVqdEM1TWdm?=
 =?utf-8?B?M256RExWM2hDSVZ0eXVUZlZDTHVJbFhPZ1k0Nm9zaFRSWWprTlZTcjdiKzdu?=
 =?utf-8?B?dWc0bndzc3o2a3daZnUxN2RKK0VqdUVtOUV2b0lrUy84ZzhxVVR2MmZvcEVj?=
 =?utf-8?B?aWdiTmhkaUZ4SlNjMXRJRmRjT2VhdklReVNmL0tZRXZ1S3hxd2RMSVJrVnYr?=
 =?utf-8?B?VG5TNXR1bVhjOTFUNlNUSEovYWVaTEtiRXBsWithdFJtajQrMWUyak1YRzE4?=
 =?utf-8?B?Sm5ZcFZxMEV3eGllYkY1NFQzY25PSmhOZUE2dEZWS09ZdXU0a3UzWHZuQWVt?=
 =?utf-8?B?K21Xa0dzdS9kNEtTcmEyYWxJL29LMk1PN1lMbG00WDUrM0lXUGVka2lFck13?=
 =?utf-8?B?QzhLR3ZkTDkzUzI2SlViNE9tOHRMZ0RIZTFJaVB0am4vQ0tkTE1QdjlTL3l1?=
 =?utf-8?B?WlM2M2UrVDdnOFVtZHRxY1c5SW5DdUFkbWk2UkZQYWZLK3cwUnhlNWpUTy9M?=
 =?utf-8?B?dkQwalBWeU5SdWxHai9jTkEwU0VydlJVWTdwSzluWFlBQXpweDJhSFYxOHBv?=
 =?utf-8?B?ZUVBODJ5RjdVWjBXUW85bmU3NTdzYVZnaG53Z2Y4RG9vcHIvU1JWaEkyYmZH?=
 =?utf-8?B?TWxNcE5LZ3dJQjVidGhnZlg0WWN3cklCQWY2N1BtcjdEd3dab3lDOEpSMkts?=
 =?utf-8?B?eEFueFQwSDBlTDluLzA3R2EwS1VaeVc0RHBwYnllMzd2QVg4bC9UenpxTmRr?=
 =?utf-8?B?SEhQQTNKVEpTcDNHdjVtWng0bTM0WUt3MFl4dzdSVnN0Rjlxd1JFZkJ3blFh?=
 =?utf-8?B?YTBjTHJCdm1QRXVPMmoyak53N05zMkVqVjJ6L1BZbk5PcVJYZG85T0pvdytL?=
 =?utf-8?B?R2p0akxvNlpydzlCeFExVk8rZkpUaXpwV1hIUGJRVnJ6a0doT3BMc0g3RHN5?=
 =?utf-8?B?aHBZSWhCTkticUVFNHE5b0tTRmExbVQrWDhtdGlDRVZMTTgvQ3FCdXlyTFdC?=
 =?utf-8?B?cHNSMVI0U1JlSFZNejZwSzI4aEhEOXpndmRPdDR6UmRXb0swMGJHZmFqK1Fi?=
 =?utf-8?B?aG9yaW1KSUlTTXFQY3JSU0FEMWYxNFZ5MmthWkFtTStRZ1BGa0NDSjNDcUd2?=
 =?utf-8?B?ZkpPYSt4MGpMcVZTeEYyKzBmNWpvY3QyYmdZZGRPeVVxdy9qQm1neVJkTFVt?=
 =?utf-8?B?aVBOMVMxc1RpOWNTZ0xxdWpJOVJ3YWM1dWwybVNRZW12Qk5SMjA3Tm5JWWwx?=
 =?utf-8?B?ZmNuOWppWUJ4SFJYemg5Nm9vYnRNQUdreWZYOU90MEp6NjRENyt0UE9ETUh0?=
 =?utf-8?B?ZmZLQVdmalJYQU9kVDFiVjdsZ0tEbWVDaUVrQzJYZnBYM0g5RVFER3pFNkZD?=
 =?utf-8?B?aE1TS0c1SnZULzlkUTJHY3RmSk5OZDV4YituSFFSUFBmNnJEdk9pVExQczcy?=
 =?utf-8?B?NVU0a2U3YzQwbnYrcTN3ejRVQXE1N3d1UXVBdWFiT2NWKzNIZWxiZm1qRFQw?=
 =?utf-8?B?T2NMaHg3UC9vazV3QW1RZEFTVlBsRnhPQnN4WmFPYnFQYzdEY3dJM0dESGM1?=
 =?utf-8?B?SXBOMzZyRENWclhMTEkwQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ekEvZnpsaXgrM3BybUhyc3dQS2ZpZXBvYzFXdVZ5MFo2TDl1bUF0bjA0eFhi?=
 =?utf-8?B?T0Y0a0V2MElFbCtNVnVFZmUrRzJsZXhtNGV5dGE1cDNuRkJMWFl5QS9EQzho?=
 =?utf-8?B?TUNRcjRmTGltenFVY0tvQWRySkp4cXg5QXVTbE9tWTBzak5qZldlcEtwemVH?=
 =?utf-8?B?Qnh0VmpUb2xWTjI3cG1sZ09Gc3ZRNERWZmNPQzEyUzhoSkZnT2pTSkJKZzFl?=
 =?utf-8?B?NDZFRTJYRkJMcERGcXByRUMrdkRJcHVXWGYrNTlxQlR0dUlRQWpSWEVZU3NV?=
 =?utf-8?B?bGtUTWtGckQ4UFl2N2t5Q09YcFc3VUQvMFh2Q3ZIaEJFQXQ0Q0xhaVFCZEhm?=
 =?utf-8?B?VFBoWnU5UXAxK0dNY29EZ25xS1lwNjJvVWsrRUdGVWhRVERlb0t6R1prNVRy?=
 =?utf-8?B?bVhZTzF4KzhuU0t2Ullzc1dTZ1B4d3BSV1ExRGVSNkFmejhIMjYxeTB0Yllq?=
 =?utf-8?B?NW8rT1VIY3duVTViQ3lEUm96MHhWQTloaEdDMCtmeStCYVBZOEE5cGUveW5W?=
 =?utf-8?B?Q1BLckd4enNlV0tQQ0I2M0V6UXVLblVzKy92NlVJOW1BM1dVWFJlUW8zc01Z?=
 =?utf-8?B?Z0JhaC9jSEluLzRhaE41dlpYTG5yWDhFRFhuaU4xOVNIeGx3TTArejBNTTNr?=
 =?utf-8?B?dG82WjVtQlBUNlViTzVmSHFPa2M0Q3AvUlRqYnNFVVJuK2hMdEx2TU1pSFo2?=
 =?utf-8?B?V0s4TzBWSlhpTlpvV2ljODVyM0RTM3lGajk2WnA2VHc5aGRDZEFqejhIWjB3?=
 =?utf-8?B?SVpLUkp3R1BzS0JmOXFDK3ZoUjlvSjFwSWcyaU9JRXVMMWFLTjdibkxIY2c4?=
 =?utf-8?B?eCtJYm85OUUzem43TFhlVElvcGpxWk5yd1pkdndBb285cVZwYmJrM01JMHVL?=
 =?utf-8?B?bTlHenM5U3RJZk4wUFQ3UGd1NHJCeU1US0djdFh2TlJPdXpvY3c1SkNaa3hU?=
 =?utf-8?B?aGpCYWFWdW1pUFJseUJaK040QnlPYzVyYytYZkJjTlk2L01POFZ2M3RxYzVD?=
 =?utf-8?B?WlZXbTc2YWR4QTA5aDQxb0s2Zi9rTnB5SFNyWVdCMU1MMmdBVmZ6a0JOZHJ1?=
 =?utf-8?B?UlpILytyeGhoSWhjNERCdHlrQVljdzVsdEpmUkJCRmlQQUV4MlpTZ0pXZVVB?=
 =?utf-8?B?UHBCeUVxWStYUllJQWJhbkpMaldSUEdkOWQrdVNMZWx3WG93QzJEaDNsMlc3?=
 =?utf-8?B?K2RMNm0xdllnVnNtVVU5YlNWNzJuSGpZUUFubVZGMGV2akdFSWh1U2tuaHl1?=
 =?utf-8?B?VndENkpFa0NKT1VEeWJEUmZxMVdoVWR2UjZyc0JBOUc2UmZscmswdXJqWDBB?=
 =?utf-8?B?NlZoWDJ0K2psc0R4MXVTcjk5TW84aDJFN25TOW9wMVdnNW1GbDVCSlNQbytY?=
 =?utf-8?B?K09MeUFYUTVOc29LaTYxTzl2UUJpK3VBbjhXTWJNZlNVekZkT2MwellzbWM2?=
 =?utf-8?B?emtNYUZ5RVBqMXlCa2VrMG9Gd2lsdDRXMXZuVVdVamZTU3cwRUdmZGJQSmRW?=
 =?utf-8?B?VlNGdWN0V1hydllycWtvWHhLak5xYTNvVTFQNHlaNFZhYXdLSCtaUXkwL0wy?=
 =?utf-8?B?dlVUM1ZCQkxaVk9QSjNGeVZ3MS9ycjdRRnhBUlhYTnhuc0RJTTFUOFVGNjkx?=
 =?utf-8?B?U3BLRk4wNTRRNlZUNUR1dnJoSXRSdnJCcHVMRXNBS0FYdWRHVGpXVEd3SVkr?=
 =?utf-8?B?bDNtN3NHb1YwamxFN0dNQWNPelNtVFplUmRBajRQaW9KQUY0ck9scmFPZXhR?=
 =?utf-8?B?ZVpTbmlscEZ3Z3hWUHZiSTJEZG81SjE1UW55VUJCdFJFeTVVM29WcHhkcHJX?=
 =?utf-8?B?QUJqeVd5NW5tZWk3dXhYWmZnb3BJK3Y1SUk0R1lBdE94ZFBVdGdrUEpBeUZY?=
 =?utf-8?B?cTNyZjV6bXNScTFBdVhGWkQrMHJYSEpCcGhSK3ZoY3BzRXY1TXk4YVRITDcv?=
 =?utf-8?B?RGlJODFZYzZJQTNDdXo0TlVrZnV6U29PQVhuTnRBenJPUEpwT0YyZ3Jsd1Zh?=
 =?utf-8?B?aXlTbGNFTTF6QUFCbENlVEx5NCt0UVQwS1dNNk16bklnVlNiamtIVGwwNWMv?=
 =?utf-8?B?dlFVTEZ2ZHNjL3VjWko2aGZ1azFJUWh0aU5Hem5OS0NBcUdJK2pjaDJlTGd3?=
 =?utf-8?Q?Vvk6YAro2CeagAixxYSKSHK+r?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 85753006-8283-4cfd-9949-08dc9c05e83f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2024 08:47:16.5002
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 92HwfmWEiVQ8U36hxfF/+uwP4WYeBgxc6Y6H876G/c6JGWepSh1rXNR3GJLX3/DulLO8XoU0eKY7STTTMyBkCD2vHArBMuAx2UKpBnZVbV4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5206
X-Proofpoint-GUID: T1xqVLXPAE4yp3kosX-7ZFERQCFP39QQ
X-Proofpoint-ORIG-GUID: T1xqVLXPAE4yp3kosX-7ZFERQCFP39QQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-04_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2407040060

SGkgQ29ub3IsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTnVubyBT
w6EgPG5vbmFtZS5udW5vQGdtYWlsLmNvbT4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgNCwgMjAy
NCA4OjE5IEFNDQo+IFRvOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+OyBBZ2Fyd2Fs
LCBVdHNhdg0KPiA8VXRzYXYuQWdhcndhbEBhbmFsb2cuY29tPg0KPiBDYzogSGVubmVyaWNoLCBN
aWNoYWVsIDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsgRG1pdHJ5IFRvcm9raG92DQo+
IDxkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tPjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz47IEtyenlzenRvZg0KPiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERv
b2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNhLA0KPiBOdW5vIDxOdW5vLlNhQGFuYWxvZy5j
b20+OyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBBcnRhbW9ub3ZzLA0KPiBBcnR1
cnMgPEFydHVycy5BcnRhbW9ub3ZzQGFuYWxvZy5jb20+OyBCaW1waWthcywgVmFzaWxlaW9zDQo+
IDxWYXNpbGVpb3MuQmltcGlrYXNAYW5hbG9nLmNvbT47IEdhc2tlbGwsIE9saXZlcg0KPiA8T2xp
dmVyLkdhc2tlbGxAYW5hbG9nLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAzLzNdIGR0
LWJpbmRpbmdzOiBpbnB1dDogVXBkYXRlIGR0YmluZGluZyBmb3IgYWRwNTU4OA0KPiANCj4gW0V4
dGVybmFsXQ0KPiANCj4gT24gV2VkLCAyMDI0LTA3LTAzIGF0IDE2OjU3ICswMTAwLCBDb25vciBE
b29sZXkgd3JvdGU6DQo+ID4gT24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMDM6NTU6MTFQTSArMDAw
MCwgQWdhcndhbCwgVXRzYXYgd3JvdGU6DQo+ID4gPiBIaSBDb25vciwNCj4gPiA+DQo+ID4gPiBU
aGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2suDQo+ID4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiA+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4g
PiA+ID4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDMsIDIwMjQgNDoyMCBQTQ0KPiA+ID4gPiBUbzog
QWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3YWxAYW5hbG9nLmNvbT4NCj4gPiA+ID4gQ2M6IEhl
bm5lcmljaCwgTWljaGFlbCA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IERtaXRyeQ0K
PiBUb3Jva2hvdg0KPiA+ID4gPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YNCj4gPiA+ID4gS296bG93c2tpIDxr
cnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+
OyBTYSwNCj4gPiA+ID4gTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPjsgbGludXgtaW5wdXRAdmdl
ci5rZXJuZWwub3JnOw0KPiA+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gQXJ0YW1vbm92cywNCj4gPiA+ID4gQXJ0dXJzIDxB
cnR1cnMuQXJ0YW1vbm92c0BhbmFsb2cuY29tPjsgQmltcGlrYXMsIFZhc2lsZWlvcw0KPiA+ID4g
PiA8VmFzaWxlaW9zLkJpbXBpa2FzQGFuYWxvZy5jb20+OyBHYXNrZWxsLCBPbGl2ZXINCj4gPiA+
ID4gPE9saXZlci5HYXNrZWxsQGFuYWxvZy5jb20+DQo+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggdjUgMy8zXSBkdC1iaW5kaW5nczogaW5wdXQ6IFVwZGF0ZSBkdGJpbmRpbmcgZm9yDQo+ID4g
PiA+IGFkcDU1ODgNCj4gPiA+ID4NCj4gPiA+ID4gT24gV2VkLCBKdWwgMDMsIDIwMjQgYXQgMTE6
NTg6MTZBTSArMDEwMCwgVXRzYXYgQWdhcndhbCB2aWEgQjQgUmVsYXkNCj4gPiA+ID4gd3JvdGU6
DQo+ID4gPiA+ID4gRnJvbTogVXRzYXYgQWdhcndhbCA8dXRzYXYuYWdhcndhbEBhbmFsb2cuY29t
Pg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gVXBkYXRpbmcgZHQgYmluZGluZ3MgZm9yIGFkcDU1ODgu
IFNpbmNlIHRoZSBkZXZpY2UgY2FuIG5vdyBmdW5jdGlvbg0KPiBpbiBhDQo+ID4gPiA+ID4gcHVy
ZWx5IGdwaW8gbW9kZSwgdGhlIGZvbGxvd2luZyBrZXlwYWQgc3BlY2lmaWMgcHJvcGVydGllcyBh
cmUgbm93DQo+IG1hZGUNCj4gPiA+ID4gPiBvcHRpb25hbDoNCj4gPiA+ID4gPiAJLSBpbnRlcnJ1
cHRzDQo+ID4gPiA+ID4gCS0ga2V5cGFkLG51bS1yb3dzDQo+ID4gPiA+ID4gCS0ga2V5cGFkLG51
bS1jb2x1bW5zDQo+ID4gPiA+ID4gCS0gbGludXgsa2V5bWFwDQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBIb3dldmVyIHNpbmNlIHRoZSBhYm92ZSBwcm9wZXJ0aWVzIGFyZSByZXF1aXJlZCB0byBiZSBz
cGVjaWZpZWQNCj4gd2hlbg0KPiA+ID4gPiA+IGNvbmZpZ3VyaW5nIHRoZSBkZXZpY2UgYXMgYSBr
ZXlwYWQsIGRlcGVuZGVuY2llcyBoYXZlIGJlZW4gYWRkZWQNCj4gPiA+ID4gPiBzdWNoIHRoYXQg
c3BlY2lmeWluZyBlaXRoZXIgb25lIHdvdWxkIHJlcXVpcmUgdGhlIHJlbWFpbmluZyBhcyB3ZWxs
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogVXRzYXYgQWdhcndhbCA8dXRz
YXYuYWdhcndhbEBhbmFsb2cuY29tPg0KPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+IMKgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaW5wdXQvYWRpLGFkcDU1ODgueWFtbMKgwqDCoMKgIHwgMzMNCj4g
PiA+ID4gKysrKysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBk
aWZmIC0tZ2l0DQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2Fk
aSxhZHA1NTg4LnlhbWwNCj4gPiA+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaW5wdXQvYWRpLGFkcDU1ODgueWFtbA0KPiA+ID4gPiA+IGluZGV4IDI2ZWE2NjgzNGFlMi4u
NmMwNjQ2NGY4MjJiIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnB1dC9hZGksYWRwNTU4OC55YW1sDQo+ID4gPiA+ID4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2FkaSxhZHA1NTg4LnlhbWwNCj4g
PiA+ID4gPiBAQCAtNDksNyArNDksMTAgQEAgcHJvcGVydGllczoNCj4gPiA+ID4gPiDCoMKgIGlu
dGVycnVwdC1jb250cm9sbGVyOg0KPiA+ID4gPiA+IMKgwqDCoMKgIGRlc2NyaXB0aW9uOg0KPiA+
ID4gPiA+IMKgwqDCoMKgwqDCoCBUaGlzIHByb3BlcnR5IGFwcGxpZXMgaWYgZWl0aGVyIGtleXBh
ZCxudW0tcm93cyBsb3dlciB0aGFuIDggb3INCj4gPiA+ID4gPiAtwqDCoMKgwqDCoCBrZXlwYWQs
bnVtLWNvbHVtbnMgbG93ZXIgdGhhbiAxMC4NCj4gPiA+ID4gPiArwqDCoMKgwqDCoCBrZXlwYWQs
bnVtLWNvbHVtbnMgbG93ZXIgdGhhbiAxMC4gVGhpcyBwcm9wZXJ0eSBkb2VzIG5vdA0KPiBhcHBs
eSBpZg0KPiA+ID4gPiA+ICvCoMKgwqDCoMKgIGtleXBhZCxudW0tcm93cyBvciBrZXlwYWQsbnVt
LWNvbHVtbnMgYXJlIG5vdCBzcGVjaWZpZWQNCj4gc2luY2UgdGhlDQo+ID4gPiA+ID4gK8KgwqDC
oMKgwqAgZGV2aWNlIHRoZW4gYWN0cyBhcyBncGlvIG9ubHksIGR1cmluZyB3aGljaCBpbnRlcnJ1
cHRzIGFyZSBub3QNCj4gPiA+ID4gPiArwqDCoMKgwqDCoCB1dGlsaXplZC4NCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IMKgwqAgJyNpbnRlcnJ1cHQtY2VsbHMnOg0KPiA+ID4gPiA+IMKgwqDCoMKgIGNv
bnN0OiAyDQo+ID4gPiA+ID4gQEAgLTY1LDEzICs2OCwxNSBAQCBwcm9wZXJ0aWVzOg0KPiA+ID4g
PiA+IMKgwqDCoMKgIG1pbkl0ZW1zOiAxDQo+ID4gPiA+ID4gwqDCoMKgwqAgbWF4SXRlbXM6IDIN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+ICtkZXBlbmRlbmNpZXM6DQo+ID4gPiA+ID4gK8KgIGtleXBh
ZCxudW0tcm93czogWyJrZXlwYWQsbnVtLWNvbHVtbnMiXQ0KPiA+ID4gPiA+ICvCoCBrZXlwYWQs
bnVtLWNvbHM6IFsia2V5cGFkLG51bS1yb3dzIl0NCj4gPiA+ID4gPiArwqAgbGludXgsa2V5bWFw
OiBbImtleXBhZCxudW0tcm93cyJdDQo+ID4gPiA+DQo+ID4gPiA+IElzIHdoYXQgeW91J3ZlIGdv
dCBoZXJlIHN1ZmZpY2llbnQ/IEFkZGluZyAia2V5cGFkLG51bS1yb3dzIiB3b24ndA0KPiA+ID4g
PiBtYW5kYXRlICJsaW51eCxrZXltYXAiIHdoaWNoIEkgdGhpbmsgaXMgd3JvbmcuIEkgdGhpbmsg
YWxsIDMgZW50cmllcw0KPiA+ID4gPiBoZXJlIG5lZWQgdG8gY29udGFpbiBib3RoIG9mIHRoZSBv
dGhlciB0d28uDQo+ID4gPiA+DQo+ID4gPg0KPiA+ID4gQWgsIEkgY2FuIHNlZSB0aGUgaXNzdWUs
IHRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgaXQgb3V0IC0gSSB3aWxsIGJlDQo+ID4gPiBjb3JyZWN0
aW5nIHRoYXQuDQo+ID4gPg0KPiA+ID4gPiA+ICvCoCBpbnRlcnJ1cHRzOiBbImxpbnV4LGtleW1h
cCJdDQo+ID4gPiA+DQo+ID4gPiA+IEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgaW50ZXJy
dXB0cyBhcmUgb25seSBhbGxvd2VkIHdoZW4gdGhlDQo+IGtleW1hcA0KPiA+ID4gPiBpcyBwcmVz
ZW50LiBJJ2QgY292ZXIgdGhlIGludGVycnVwdHMgd2l0aCBzb21ldGhpbmcgbGlrZQ0KPiA+ID4g
Pg0KPiA+ID4gPiBpZjoNCj4gPiA+ID4gwqAgcmVxdWlyZWQ6DQo+ID4gPiA+IMKgwqDCoCAtIGxp
bnV4LGtleW1hcA0KPiA+ID4gPiDCoCB0aGVuOg0KPiA+ID4gPiDCoMKgwqAgcmVxdWlyZWQ6DQo+
ID4gPiA+IMKgwqDCoMKgwqAgLSBpbnRlcnJ1cHRzDQo+ID4gPiA+DQo+ID4gPiA+IHNvIHRoYXQg
aW50ZXJydXB0cyBjYW4gYmUgdXNlZCB3aGlsZSBub3QgaW4ga2V5cGFkIG1vZGUuIFVubGVzcyBv
Zg0KPiA+ID4gPiBjb3Vyc2UgdGhlcmUncyBzb21ldGhpbmcgKHVubWVudGlvbmVkIGluIHRoaXMg
cGF0Y2gpIHRoYXQgcHJldmVudHMNCj4gdGhhdC4NCj4gPiA+DQo+ID4gPiBJbiBjYXNlIHdoZW4g
dGhlIGRldmljZSBpcyBub3QgaW4ga2V5cGFkIG1vZGUsIGkuZSwgaXMgcHVyZWx5IHVzaW5nIGdw
aW8gLQ0KPiA+ID4gaXQgZG9lc24ndCB0cmlnZ2VyIHRoZSBpbnRlcnJ1cHQuDQo+ID4gPiBEdWUg
dG8gdGhpcywgSSBoYWQgcmVzdHJpY3RlZCB0aGUgc2FtZSB0byBrZXlwYWQgbW9kZSBvbmx5KGFz
IGENCj4gPiA+IHJlcXVpcmVtZW50KS4gVGhpcyB3YXMgbWVudGlvbmVkDQo+ID4gPiBoZXJlOg0K
PiA+ID4NCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC9kNDY2MWRkYzFkMjUzNjc4Zg0KPiBkNjJiZTRjN2UxOWViMGNmZjQxNzRmNi5jYW1l
bEBnbWFpbC5jb20vX187ISFBM05pOENTMHkyWSE4TVYwUFB1ejENCj4gWEt6YU51cy1OdEFTM29Y
dHJjZ2FVV0hpNHNmN3pzUEZTNXpIX05VYU56LXFCcVVYUEJUYlRFMDl3UlRWYS0NCj4gellMYVNk
VHRlOHltblB5UkIkDQo+ID4NCj4gPiBUaGlzIHNheXMgIm5vdCByZXF1aXJlZCIsIG5vdCAibm90
IGZ1bmN0aW9uYWwiLiBIb3cgY29tZSBnZW5lcmF0aW5nDQo+ID4gaW50ZXJydXB0cyBiZWNvbWVz
IGltcG9zc2libGUgd2hlbiBub3QgaW4ga2V5cGFkIG1vZGU/IFRoYXQncyB3aGF0DQo+IG5lZWRz
DQo+ID4gdG8gYmUgZXhwbGFpbmVkLg0KPiA+DQo+IA0KPiBJIHNob3VsZCBoYXZlIHJlYWQgdGhl
IHBhdGNoIGJlZm9yZSByZXBseWluZyBpbiB2NC4gWWVzLCBJIGFncmVlIHdpdGggQ29ub3INCj4g
dGhhdA0KPiB3aGF0IHdlIG5lZWQgaXMgdG8gbWFrZSB0aGUgaW50ZXJydXB0IF9fcmVxdWlyZWRf
XyB3aGVuIHVzaW5nIHRoZSBrZXlwYWQuDQo+IEluIHRoZQ0KPiBjYXNlIHdlIGhhdmUgZ3Bpb3Ms
IGl0J3Mgb3B0aW9uYWwgYnV0IGl0IGRvZXMgbm90IG1lYW4gd2Ugc2hvdWxkIHJlbW92ZSBpdC4N
Cj4gT25lDQo+IHVzZWNhc2Ugd291bGQgYmUgdG8gdXNlIGdwaW9zIHN0aWxsIGFzIGlucHV0cyB0
aHJvdWdoIGdwaW8ta2V5cy4NCj4gDQo+IC0gTnVubyBTw6ENCg0KSSBzZWUgdGhlIGlzc3VlLCB0
aGFuayB5b3UgZm9yIGhpZ2hsaWdodGluZyB0aGUgc2FtZS4gSSB3aWxsIG1ha2UgdGhlIGNoYW5n
ZXMgbm93Lg0KDQpUaGFua3MsDQpVdHNhdg0K

