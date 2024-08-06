Return-Path: <linux-input+bounces-5385-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F47948DAF
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 13:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A60031F23D3A
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411CE1C3789;
	Tue,  6 Aug 2024 11:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NmS5m+6s"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CB41C233C;
	Tue,  6 Aug 2024 11:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943764; cv=fail; b=U4VP8r+FwKdqB6xXhUbD8qZIAl5EBC801+VKCZbBDzNX2IoMAoaTJiK0IcdgxRIyKwDqshtSQwFx/K0hNM4SZ997YQMTlAk7/0wZf0Mx8L7kKhK/nLcDfaauL/+B368dD/MmtF/AS6oWuWopzm1FCL6uvUhkvoXnlOV76wVBvuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943764; c=relaxed/simple;
	bh=Dy7HZlpC0gqRk5wDD9azhVH0ypEFcQPeQO/XAgTp+LI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VxsMyeYul4K9muGU8FOqI/uD62YRTq5TOmMVlEQ4I2wlOqNWVx6xuErRQYn/rdAF68v/IjuHauISyAQvGBm5MeR6S8N3tv4qRyztPfiN1aptmbc0stWs25t/6bcBCaxZjBLKhDmRsGvw1dSV8jBeDav+NDJO0jKh1lp5upnIok4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NmS5m+6s; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4768uOtf030750;
	Tue, 6 Aug 2024 07:29:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Dy7HZ
	lpC0gqRk5wDD9azhVH0ypEFcQPeQO/XAgTp+LI=; b=NmS5m+6sTEYKzwNXP4GaY
	ebvZhzug1XgrfowLbXWWTHPQ9D0PVLARjw8McMraBjiKanPlyK+osivSmqdE2RTi
	6k0qMZ0j+RlI9g25rExPpZoG8RWxc+K5cXTqHrVonNawp7Zf9fAmrS0mfLI3/1+D
	MVsM4jMQDZDEAz/2qCH6omcZqI3yS+RPQn9TREMEfKJnecH4/Pg2Kkp251VbQBHk
	mvRzh1Cukb8qGv6myccOnlClsqSGGZlPdQPg6xBp4ifZPOEk2KlnvfAPhU+lpoBh
	T3eu3SymJyvgNUtC9YgWze4LLScGfgLV66ckU5Z9XLxN4IZXO5t+v8NIPoDhdug4
	Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010004.outbound.protection.outlook.com [40.93.20.4])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 40uc2xhj48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 07:29:17 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9u9K1DOjkqAujLmK85P4uTTk/hGMj53YOIuZpCmpLfw4SJhryhz7um7qqj9iIG44Gz6PYO3nxR/XzwKfye9Sy6pabqWBtHyA+R8ZeCiQloYF3NTF8+CTAtrqpm8kBo0oRkAk2lYT/8aRM4fRwTTujTMJQKicFo+qYMzevF91P7j4LswOoF4O1lJyeahBMew4uzRlYrbAgmHvj4B13Ml11E+t80+A84Am+wFjq8vU1nXOtrVH7BwIm3CKiJJQvdIMWHvdEw/n5+r8Qj36SGow5dB8+lVFwnHxy6nMl2c2NsFg+Zoz/Dq0rljJ99mo487ytxiNV0ft0sSzi8zTaqx5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dy7HZlpC0gqRk5wDD9azhVH0ypEFcQPeQO/XAgTp+LI=;
 b=K9xf72SUrVFJgP5wOiCQeGXo/ZpvIrUd5X3vh9PLuP73LGLc6s4A4dM+SdFoTxBsN56bdl2yTD/HHAMQvOb2O4UzxO71SP5mMvl9lGTCQ9m+D/9hvU/1e8cdYNYYGJ6Y2EeapSAK2zcjg33q7V9kAvMQIwT7SGdxkMFu/Hnb9LoK1+D03Zo/yJvuFVCoLO43NRklohch9qFlxje/3NhD8JxpBmhHBMnZrelGkGnzbwg9CKpc2rAkrpnZrNhmYOz6rp5El9Bm03KOTaRvvUxxVTP73XgjBHUHfb/wPvX/hQ2QtWDa/P+ySNwdHAIQm8qCbUd1YQrqwz8pjFrmrpBagw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by PH7PR03MB7463.namprd03.prod.outlook.com (2603:10b6:510:2e6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Tue, 6 Aug
 2024 11:29:15 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7807.025; Tue, 6 Aug 2024
 11:29:15 +0000
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
Thread-Index: AQHa592OMvCrCJMDOEeEILiPw1DTWLIZ7p2AgAAR/lCAAAoZgIAADQqg
Date: Tue, 6 Aug 2024 11:29:15 +0000
Message-ID:
 <SJ0PR03MB63437EFA57B2A135335983529BBF2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
 <bd4f6aca-ca3a-465e-8b46-e9c5e11ebad7@kernel.org>
 <SJ0PR03MB6343FDF6A250691B387088A19BBF2@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <25163642-8f36-4bb1-8bf4-a3e34b283795@kernel.org>
In-Reply-To: <25163642-8f36-4bb1-8bf4-a3e34b283795@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3RNV0ZtTXpnd05XVXROVE5sTnkweE1XVm1MVGcw?=
 =?utf-8?B?Wm1FdE5qUTBPVGRrWTJVMVpqZzFYR0Z0WlMxMFpYTjBYREZoWmpNNE1EWXdM?=
 =?utf-8?B?VFV6WlRjdE1URmxaaTA0TkdaaExUWTBORGszWkdObE5XWTROV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU16STBOQ0lnZEQwaU1UTXpOamMwTVRjek5UTTJOamMxTWpZ?=
 =?utf-8?B?eklpQm9QU0pDVDFsb1ZsZE9VR2RxVWxjNVNHaFJRM0ZzTlc5NWFuUTNWV3M5?=
 =?utf-8?B?SWlCcFpEMGlJaUJpYkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNT?=
 =?utf-8?B?RlV4VWxOU1ZVWk9RMmRWUVVGRVowUkJRVU12U2xWNlpEZ3JabUZCWlhsbk1X?=
 =?utf-8?B?NDBabFpVTWpJM1MwUlhabWc1VmxCaVdVUkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|PH7PR03MB7463:EE_
x-ms-office365-filtering-correlation-id: 3b2f5b07-9e26-41c9-bef4-08dcb60b00b4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R1ZmOXR6amRKMW1wMkNCOTJlMVMyUnJLaTY5MG5DTlVIbll3TmZ0U0pxM0FO?=
 =?utf-8?B?TjRyZ0pLVFhMQVJHYzREbVRDamtwYzFSTzNlb3FxL2dmeklIdXMwY24zOEN2?=
 =?utf-8?B?WHVjWjVXaXA5MzJZZEdRcXdEenhmM0t2THA1VVdkWEdsTG02WnpkTzMrWmln?=
 =?utf-8?B?ZWpRT0hPSUlNUHg2UE50MUMrYTdSeWNMd1BiUDIwRXl4TjNLdjY0OFJ1dXVG?=
 =?utf-8?B?c0RBQjVBdzBqd1pLYWVET3dLNkpoVTkzZGF0bk1BVmZmWEU1SVNGWm9jbFVz?=
 =?utf-8?B?SXRsV25SWk1OWjlZUUhmang1bHZlUWR3V0RETWM2c21LYWdHN01uQUhoNmtZ?=
 =?utf-8?B?SkpBSHgwSWZwTC9uNzIrSEtrdE44dk5VKzB2bGxLa0E2NHY4MUF4VnJXMkFq?=
 =?utf-8?B?L0J3MGNFalVhSFpHQmJrYXlad3IweUozOXZPdm5YWkRRMHU5NTRZWE5nRzVU?=
 =?utf-8?B?U09sWFB4UEhub24wRHlYam5GSkdkUWE3V0ZBVy9yM0xVbjdvZUdmeDZuUnhB?=
 =?utf-8?B?dTkyVElQaVlldlZGMnJhelJMbUZGa1FsbWN4dG9vNFBvM2Ywd05hMFlsbVN5?=
 =?utf-8?B?OUxUenpJUi9RTTd5elhqZ3o1UGJQSjlyNE1uZGRJMmt1UnhQSVE0d1loUThu?=
 =?utf-8?B?Zi84UVlLeUJneEgzZExDNVBsaHVZMUtkYkhJTzNsQ3VGYXZWeWg4RThEZDdn?=
 =?utf-8?B?VEUwSWNrL1c3OXBUR2lQTXJFODJZbE9oUVNFOEc4SHowTEpXeHBSd3o5aEFC?=
 =?utf-8?B?bEZmclRKa3ZRN1pGZjVqVWtlb05SUXROTldDUzhqbElEUUd0SjNtdkVVNnBy?=
 =?utf-8?B?a290S2pEMGt5MUhXVmhucHlULzFNMVI4Q2tjZnV1UXRTa1o5U1V4emRNcjgv?=
 =?utf-8?B?N0FYb1pDZzMxQjBKYWU4YUd4THM2QmloRDBRdXJkTE5WUFZXdDNQZTVPY3Uz?=
 =?utf-8?B?Zk1rQnc1cWorOHY1bHN5NTlKazd2YkIwNTZOVzF4SW5QNjA5TlVsWmtzRGlG?=
 =?utf-8?B?UEFlN0ltMUtKalZBMENidFI0cXZCZnRpWEsrWndna3dhTExlNHVaSzNmYzZ3?=
 =?utf-8?B?SS81eFBrMVE5OHBzdHBFN3JYWWYza3ppMjVzNjgzVkEzMXBJNFpIa1pheWUw?=
 =?utf-8?B?TEg0SDVOZjJHb0VsNHFPekFtbmdZN1dYb0hSYVM2cjZ3VVIwSERPTmdKQi9R?=
 =?utf-8?B?bXFtUFA3anhQSTJyZmpvNlRnSm9WMDRzV1Zzem1pMVViSjk1VGRrYnhsdzd3?=
 =?utf-8?B?QXhjSUVmeDQvdWUrS3hFVW1Nbys0Q2F0bFpOUlNua3RpRDlqUGt6T3ArYk85?=
 =?utf-8?B?SGIvQjM4UHdCSVN3QUlVQWhmTkk5ZzFhVGdjK2lZL3JyWkkwaVNsdXp0bk9J?=
 =?utf-8?B?OUZDNUVSRWdaTVJTbVRrcmdDZjdRd1JmWTJlRkpnV3hUSURMTWxPME9PWkd0?=
 =?utf-8?B?MjRCV0YwSTh6S1FyTTBBQ3FjTk9hNzY5c3FISndGdmhjL1AzN1RXbDQzSVdD?=
 =?utf-8?B?ZDlpbk8zS1paTjd2V1BKRCtETjBTa2d3L21qNE44NmtKUXJpL3JkcGM3Ykhz?=
 =?utf-8?B?ZUowMDlOVktDUmVGMGl6Szlvb09rWE5BWFlxNnFXRzRZY2xIem9ZSlhMT3M5?=
 =?utf-8?B?RlREeHkxdjlvNjI5MWNLSmVMSlRUdUdLb0ZVdzJvYmI4dUFEVHBsL2VGcEV5?=
 =?utf-8?B?UHRYUVJKdUd6UzhabjJzYzVKNUlnaWU3TmpIbmhpcnJvejA4aDcraUFCd1d2?=
 =?utf-8?B?NktiZ3QwbE5RL0dNZzY1NWh3N3FPS0NmUVh5eWs1R0xUQ21tb0YyL2RQdUpG?=
 =?utf-8?B?RzBUZDhyYnArbi9xM3BTNFhtNEVwMjFZUjRuYnJheUdhOU9pY0s5ZXRQY2tk?=
 =?utf-8?B?dzZNZEJmeDVWMHYrYkpza2luNVlDSUcyODlYY214cEwvVFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TE1hejZCc2EwcjdSY2VNM3VNcUdKYXJCMVR4dFNBUkl1UlFNS1lTUlZEUUdw?=
 =?utf-8?B?eTZYSUkwcm10d2ZrZFluU3huZTQwUEpqT3RmVGZkcE1HRm41Q0lvTGZRUklx?=
 =?utf-8?B?UlQ4dDA0WFIxVkdVc0dHS0JubzYyb3B5dWI0RjV1ZVZtYWNpOGZaR21SQlBh?=
 =?utf-8?B?M3ZPL1R3T3dCdlVwcWw2VlRXdkRObTBKbFFON2N3TUZyWkhteXFRdXZpL0NR?=
 =?utf-8?B?bC9yb2lsVXdBUEZPZ1dLaHFuYUVpV0hDTnNxV2dpK1FncjV5VHc4YVo0cVJx?=
 =?utf-8?B?L2swZnVhUkxJeEIzS3QvYUYyYUZjMEcxRmNTelZCQ29LejZ5NVZFNWVnR3ZO?=
 =?utf-8?B?NlkwYnFHZDdVSmFmQkpDaWVKVGJndXNWbW5jTS91cDNLTE9zdTNlV1FtVWFy?=
 =?utf-8?B?QjczTUtYWGVuSndDTGw1c29LSmpEWFd6RHB2YmVubzBJNzhUSXNaRlhlanRm?=
 =?utf-8?B?Y093TzRHeDN0WENHOWl1eHc1VTUzYUVaNFM4RDA1SFAyZjFhVXJPbnF5RGRr?=
 =?utf-8?B?NEQxbnI4TVZWRnVsQldOY0dxSU5zQWExRXdJN1ZDK3RCN2pCcSt1Z1pHcUxK?=
 =?utf-8?B?VEZnOXMxSDZ5czRIUVFObE96Q1U5a2gyS3hoMURJajA1QVAwQTkzbjdtTm1K?=
 =?utf-8?B?R1c2R0FYUk1SeUNJYk1xYndJN2xXTUg3MDVOZW16bFltamFsbWJZL2Z4WkNV?=
 =?utf-8?B?cGlqd0lDY1BQN2IyejM3Tm1VbWd1b01TR29jMlJxK05qZGlvK1RnQzVhODJU?=
 =?utf-8?B?SS9OVy85SUVhSjA1c3RJSWx2UTFBY3JYRW1wQWhnaXZrUHoxN1ljb1NURnRv?=
 =?utf-8?B?cklHV2xyTXZMWlQxWkV6aGJicjJiZjk3aWhwTDBsdGVJRnZDMWdJSmZjZ2JQ?=
 =?utf-8?B?ZWJLZXdSZVZLZ1M2VlBiOHNDWExqd084MmVQM0JlL0gzS0pTanhrcUpWeFpD?=
 =?utf-8?B?dGFnd0lFT09qSStKT3NLTS9yN3RKVjRzS2c1YWpaQ0JDQThPZkJZNjIwbUEv?=
 =?utf-8?B?M041RzN2cUhNcUtneCt1ekVEYjdiTXA2alBrMk1weGNITmJOSU5nNnhPY3RL?=
 =?utf-8?B?VXMrVTBGVXJOWkdPSnZQbGJkTHFXZE1CbncwTFJBWTk5R3dWQUduenZHZ2ZP?=
 =?utf-8?B?RUt6TCtmejJCRi9aQ0ZXTTFneDhYQUoraXFrbGtLekRoOUY3TUJ5QkhPU3VY?=
 =?utf-8?B?L1NYWWxEM2NCc0t4Q2d5cFFSNEE5MTZtOTg1MmlNSTJwUWJMQjNhVzhMaFRY?=
 =?utf-8?B?U3BXMElnY2tnR3dpMFZlMlJlYVNYZ2RHOGFFUW5RcDFhTldMaklydXBsNVZv?=
 =?utf-8?B?UllCV1EzMnk3Q2dkZVZodVg0SjRkL0IrMmpQcmtWd0ZVaGFxOEhNMW1IZGMv?=
 =?utf-8?B?eVdvb01rTU52dmVQaU80UzNQZGd4R1N3b1hJbEE3MmszYm9IRXhpb29xWkxV?=
 =?utf-8?B?MitvM2FWZGI0VU4zTTVoQmdpR1Z2dDZsS1dVS29wTzFaUTBscGk1aERmbmV2?=
 =?utf-8?B?RWtGbEhKSFNVc2tZaUo2cHliRnpIUklMYWxJc3RHV0c2a2pyZXc4MEt4UTJQ?=
 =?utf-8?B?UUEvVDJBdTg2dXZidG10ZEhLRU5wU2ZuMldXR2RwaU04TUlZV3J6aWkybkxa?=
 =?utf-8?B?eTE0Z3ZOSm9iYWdUc3E1ek9tS0ViLzhKbHBkQmQrSldwMHYzcUpZcVRhcXpO?=
 =?utf-8?B?SnhaQXh1WFNuUTBJbDRzenZad1NYaHJQTmV6NFlOZER6VTY3MktxSi9nUDBZ?=
 =?utf-8?B?UUpLbGNxYlA3ZEh5akdqNnY4YjFSOHFjSW1kb1lZVHUza3BSZGJuT1BJM1ps?=
 =?utf-8?B?bWFnY3JnaGRNRkUwRlVlbGhRTmN0QnV4RGs0ODErUXVEbklOTjhWTTBYMm5Y?=
 =?utf-8?B?VXdTb1FIcXVTNGFYYnR6Sm85bzRTbjVZaEFjVXVrZWtuaGdZdFJsT0t0dEx3?=
 =?utf-8?B?NEFOZVQ3SGdOc0VlR1lpQVErWHc5a1JPTDhWcHYySzdUbWxIZDIrNGlCcHpi?=
 =?utf-8?B?bU5kSkVEMWxOQ0M5VXFwaTNZVVJvUXViMEhQZVliVktwK0FNcFF5SlgwL1Ja?=
 =?utf-8?B?MHlPMFY3SlE0aVNVRDQrQmY2YktNeEdOMDhmd3NUeDB4S204WStxOG5ueDUx?=
 =?utf-8?Q?0GrqONZbwf2KK2aB79bz12aHp?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2f5b07-9e26-41c9-bef4-08dcb60b00b4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 11:29:15.2252
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N5q2JxolXlTw8THHeWlzCwrBhtLEQel3CYjtU3wngehF74plg60HwXMZd5a70Kcp+1A+hX8FFzpmQhKMbVvi1dVfmff1RN9kAVIznFZpFUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7463
X-Proofpoint-ORIG-GUID: RcaFatMeB8Y_eGFXp-mQwaZEgJFSUGpQ
X-Proofpoint-GUID: RcaFatMeB8Y_eGFXp-mQwaZEgJFSUGpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_08,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=953 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060080

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgNiwgMjAyNCAx
MTo0MiBBTQ0KPiBUbzogQWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3YWxAYW5hbG9nLmNvbT47
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
Z3Bpbw0KPiBvcGVyYXRpb24NCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIDA2LzA4LzIwMjQg
MTI6MTYsIEFnYXJ3YWwsIFV0c2F2IHdyb3RlOg0KPiA+Pg0KPiA+Pg0KPiA+Pj4gCS0gQWRkZWQg
ZHQtYmluZGluZyBkZXBlbmRlbmN5IGZvciBpbnRlcnJ1cHQtY29udHJvbGxlci4gTm93IGlmDQo+
ID4+PiAJICBpbnRlcnJ1cHQtY29udHJvbGxlciBpcyBzcGVjaWZpZWQsIGludGVycnVwdHMgbXVz
dCBiZQ0KPiA+Pj4gCSAgcHJvdmlkZWQuDQo+ID4+DQo+ID4+IFNvIHRoYXQncyB0aGUgcmVhc29u
IG9mIHNraXBwaW5nIHRhZz8NCj4gPg0KPiA+IEFwb2xvZ2llcyBpZiBJIGRvbuKAmXQgdW5kZXJz
dGFuZCB0aGlzLCBidXQgSSBoYXZlIHBvaW50ZWQgdG8gdGhlIGxpbmsNCj4gPiBmb3IgdGhlIHBy
ZXZpb3VzIHZlcnNpb24gYXMgd2VsbCBhcyBsYWJlbGxlZCB0aGF0IHRoaXMgY2hhbmdlIGlzDQo+
ID4gdW5kZXIgdjkuIEkgdW5kZXJzdGFuZCB0aGUgb3JkZXIgaXMgd3JvbmcsIGJ1dCBhbGwgdmVy
c2lvbnMgc2VlbSB0bw0KPiA+IGJlIHByZXNlbnQgaW4gdGhlIGNoYW5nZWxvZy4gQ291bGQgeW91
IGd1aWRlIG1lIG9uIHdoYXQgc2hvdWxkDQo+ID4gdG8gYmUgYWRkZWQ/DQo+IA0KPiBZb3UgcmVj
ZWl2ZWQgYSB0YWcgKG9yIGV2ZW4gdGFncykuIFdoZXJlIGlzIGl0Pw0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCg0KQWggSSBzZWUuIFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhh
dCB0byBtZS4gSSB3aWxsIGFkZCB0aGVtLg0KDQotIFV0c2F2DQoNCg==

