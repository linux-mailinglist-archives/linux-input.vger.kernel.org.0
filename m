Return-Path: <linux-input+bounces-2433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F38578808A4
	for <lists+linux-input@lfdr.de>; Wed, 20 Mar 2024 01:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A98391F23E02
	for <lists+linux-input@lfdr.de>; Wed, 20 Mar 2024 00:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E161064C;
	Wed, 20 Mar 2024 00:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="nYcQgjsc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="HWbzNeEj"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1943C2C;
	Wed, 20 Mar 2024 00:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710895311; cv=fail; b=matkHehnhcJAfpR7jSeblpjifAYgD4Ezfs5gb9WaVhitjYJzo+l2xciCGX6uLgk/dVBMEnDqVT35qJZsfQVxED1aBFCQoM2LQkLlPZuBTEyEdr4Xenf4TulDFmpQYehZa2l/0/0TNBHJNghK1Vpu2zPdu126Xn4kMnix72POAqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710895311; c=relaxed/simple;
	bh=HFp08Afb2cIjh30yI7isnuOTC54vF4p0MhjCPojebMY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Hll30VA5TZr52kEYDB+0q2cV5Hex89pG43Ko9jfPfSs0o1GMAY3kDU+WnatQPuJyDMMHXqIXv7tqqAtcEU1MHGws4U2ufl3VoeFss0OKEOIQtQ1dljvw0emTTH5exWTlA8YJR5/QapcQcuIZ1oFlxD0y0Wf5l5hb1ORIcLb5p/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=nYcQgjsc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=HWbzNeEj; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42K004VY012695;
	Tue, 19 Mar 2024 19:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=HFp08Afb2cIjh30yI7isnuOTC54vF4p0MhjCPojeb
	MY=; b=nYcQgjsckjaARHni/n1goiIlHKg424RdbLGh5qre8BX8j64QX0u7dY2ok
	1ENFpJz3QgRzap1cwdls5sEq9RK/sgJkHl6K0CGdY/5WUFBJXni53gE+NyjButlr
	pMIC6MsOGBrgx/DXRSji5YCYM+wrvacs87r7773W/8pkhtQB0tfY8lI1ajeS8cSc
	dQv0ifjSQb0hgz5ZmhnwtyMbH5oVIjm1M7Nv715IfrizBOLwfdUtdfABdaELOT4r
	ohQAZUPRQJnqYdLStTB/kCW93K//dYimiPnZ5d06SsIq4rawUSjfdA7FT6ZP6uWi
	KFoqaz96f/couWIrjP2R7fzOIizlg==
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ww8txv13h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 19:41:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giNvNSZALCH7CpWbiJ0pNh9jGhzrug/31h+j6x67dKrWSqamaeUW4YozSqt1IkSj0RkR8/mpu0PFFpgnZimdfoE5kKcIQeCDKsT1PfwQneHYkwwNLBtjUpafGRktp7vMyWl23Lfu33DlYl9pbvoLpWhLWbmTFfWBcuvnhJgp67XedB3Gn2+4dXuvS67vcp+D3a1S49Cp2zaIFkOjqV2ds7XC1l0TvbaXH6uYZsOnaV8xuWFGxKJ0zzPg6JlrhZ4dRiryLa9Nu5Lf7S7UxA00ls2vxsqh0rEgDC8Bnh1ql0A4CUVvVmUeAETHaMCiIb/mnL78W9Hb9oqZZPBP5eUZ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFp08Afb2cIjh30yI7isnuOTC54vF4p0MhjCPojebMY=;
 b=K3IMWP2pg8DjVahgm4y+OBIcEqtskhsHUsEO8aLFOhcYbs1GSsttBPK1OsGjHKt9L6rmdlaODuu5tO1jol/eqk4sH0JYu7XKd/N8l7uv3F1o0E9LA8I/gpZzdnOCrwV2Xl8lcQ9XOTvPhMcfoKFrWc5NM0QKkdtSYoQDgS/p7zx+VzSFhuymVrEn1HdFEecYXjTT/xjMR/G4dwFRQNo3Jbx0hLoBTEhmIDignh50SXU9bZvbDxdr/saXGGih0DiQ16yB6sePgcspKOgIffgUX/T6JWqjZGRoZXvhxhEXXaPs4C9gULT2tUQ4I3jNQkYZp9nbciboFSHeoWE8gZ9LIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFp08Afb2cIjh30yI7isnuOTC54vF4p0MhjCPojebMY=;
 b=HWbzNeEjxfV8uLKX7pihK6We4EXfDptN4AgeeJQDYShi4hj8OBOdl4SM5i7n+yYm/bEXgLUiHbV0kWRJTiXv3HwMfVMkQLIBq2TngzRMfUvh+koI+yWLIPtvj7d7C6uOjjVKzKTN2KCMDMN35fPBbnyYmtS4QyOPr+BF0DupFKg=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 SA1PR19MB5665.namprd19.prod.outlook.com (2603:10b6:806:23a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Wed, 20 Mar
 2024 00:41:29 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac%7]) with mapi id 15.20.7386.021; Wed, 20 Mar 2024
 00:41:29 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Thread-Topic: [PATCH v9 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Thread-Index: AQHacadt22RzuMIgSkinzCv4kcdxrrE3b22AgAhr7oA=
Date: Wed, 20 Mar 2024 00:41:29 +0000
Message-ID: <DC496BEB-5D45-41C7-BF94-88B0EECD6359@cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-6-jogletre@opensource.cirrus.com>
 <ZfMgLc16lOTK62wa@nixie71>
In-Reply-To: <ZfMgLc16lOTK62wa@nixie71>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|SA1PR19MB5665:EE_
x-ms-office365-filtering-correlation-id: 774ce7c1-a28c-487a-32a7-08dc48767b60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ef8WDfDavJ3DFC+Crrz6LMwB+xICTduYXF2s/8+L8pYliY/lov9XNw0ltSwctZyYCkWzBcfu+q9GRDa59uY7zFGEnw0qEn27kE+scaG5womWyb2WCa6BwMj5LZNzG0VbZkYHqLtXQDSeKGMoxpqo64eFmeA/3jxHm6HRk6VLEy1Xa7a+rvS8ry42YwxBoL/Y62SYNeWUUN7FJahuCpgtdAPVkk6iNNcu3eLc3mW0wTV7NF0tqhzUirH7fpbVc/BZB/aiHv+O4ISAnE5B395L1bvYcEcTEv6dCfMx0SN1dR9VfTVXgNsKPOyN4bn3MSs+YBnrWtcUa356V9J5f7ZwE3GRe9R/CJ287cF47T0W6jrEfl/Jr8vUn9rHFU1poiXlXET7ONkiR6R8AncZ+GSyIOxF7/2LTBZ291hXhLdXQ3//ykBUHW5IKH1B1IobliZrPcWJfRmbQysbvsOCF7hVK5MEAjOi56CU/sW/3TVS3BGZwMzHDgpsSQELvIkPKO9VhJ3v15UiL4kKZ4A9VJ3eKGTDVALBaxTqGHotdX+9WgLK0bcqLVV4RDaX54W7WPExdqeqoBMEOROvAOxebdGf7jSUKRQ87HZxHzFVvMBKWKc/FLC/WHQ/iU2GQHxPRl1YGZTAYDudUUoOtn2cRAprEYSp7tmPJZ/nXXiogSrOmdGkndtDHo2prTa22WOZljOSv7RJuWId4sIGVEWJNH9S/Q==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkNzY1hZczFTZDNZbEtYdFM1czduZmtNbE9wZzhlSmRidXc1b0FkNHlLRkJC?=
 =?utf-8?B?ODh1WnNOazJIakRLMzh1a045VEtHcXpTZnJMb0d0a21Vd2Q3M2dKV1pQQUJO?=
 =?utf-8?B?ckNZZnR2YjU3aGZwM2xOME41eDhTZVpEc0JyWkRuNTR2SXdSOTgybTZHckd3?=
 =?utf-8?B?WkltanRqN3hTT3BPYWhKbGFOSTB1NzdtNXdyWk1SckIzTndTQUliMEowVnRP?=
 =?utf-8?B?TzYxeGg1YkhmLzRtQ0RybUYveE5OV2lzUk9vQVN3YXZLYUtxN2pyZkc3aGhN?=
 =?utf-8?B?R0d0WE5GR0hJTnVIQmNraEVlMkovWmJrWWxJaHRnbTVGTHpwWVhPZjhNZXJn?=
 =?utf-8?B?QjYxSC9YR2NYMlJKNHludFFUVE54N0xIRFNGcXdSUW5mOHJrTmZXbW9oeC9x?=
 =?utf-8?B?NWJOSFRyY1BWWkJWeitiWUU1aFVEZEhFSmE1SmUvd2JxRUV6MlcvTTFaT2Yv?=
 =?utf-8?B?UXQrZFA0ZU8rVzVGZDcwSkVLYjJZWFdxN2wzeHdNZXluWWhaZ0s3dlFGRVhP?=
 =?utf-8?B?aUtqYzlZb3JjdzlvYys3bmwyUE56NXBMdHFrbkdnWW1rWjVyeVpUZ1BWb2pW?=
 =?utf-8?B?Sm9mbzRNSk5OV2xoNzREcWdnUzN2Z3lERncxUThGR0tuME1wZHlDK21PZkZy?=
 =?utf-8?B?dlR2OStJNEw0K0YweUtWSjBwU1FqQWtiZkp5VDZEK0tMaDV6UGUxSzNnL053?=
 =?utf-8?B?UzF4VmtseE1GOFJabm96WUpkSTQ0SnRLaHBUK0prV3V2K3ZtVzcyb1JBNzl0?=
 =?utf-8?B?N3QvaVpFQkwrTlBPeUR3UlE3UzdWRVpDR0J6RktxUWpBZ0Fic29WZ2puL29J?=
 =?utf-8?B?MUI0S2ZXb1psSVJYL2NVSGpPT0pjOFp3enBCMkJaajRHRTc3clRGbXdJLzJY?=
 =?utf-8?B?T3l4SXRxSjlqeWFjbTdkbHoycmU4UHhNRy9rNC95RlU5c2U2YSttWWY5Y0JT?=
 =?utf-8?B?RnNzaG92dEZRTjM4dDVFYlVUUkVlN1p3b0x1S3ZPN0poUGx2OVBiT1hBb0Fv?=
 =?utf-8?B?K2pqOHh1UTVKN3M2bTRiTTdITlZzb292ZmxKNWtMY3VMUVZOTCs3L3NNU2N0?=
 =?utf-8?B?Y2dNbXhGMjMyRHdodGFkR0VJa2RuV1ppK1UvVnI0ZHUzS3BmZGpLWGV3RlJT?=
 =?utf-8?B?M1JGbTRwUDFobC9PYVZuSWUzSlJFOWQybmhsZS8vL2gwVDdLd3JXZ1FHT1lS?=
 =?utf-8?B?dVlTMmxMZFFITTVOYmpxa3JwL3ZySmFSSGRhcjRDbmtrY3M1RHJWODlsS0RF?=
 =?utf-8?B?ajNWODB4UTU0ZzRML0xjUGZqZGxEdVNVQW4vSFovdFljNE80SlJBaHJSV0Z1?=
 =?utf-8?B?WlQ3Rkw5Q0xlNVFwY3VZNmI0UDNLV0pUU0djRmtGU2xuZnZob1kvdW9iWkpp?=
 =?utf-8?B?bnU3Q0FXYnRvc2tQRXlGZVVLTlJwdjBHc1F4OVVmdXpWYkZpQ3A3UnptQlUy?=
 =?utf-8?B?bkVzeitlMm56RnEyVXRUVXE3b1J0dWFYV2Y0R2ZWZUZWWjdYUlFvM1ZkUmh6?=
 =?utf-8?B?eVVvajJkVkpTdnVwWVF0OUdIZGd0RkZySjY1N3pTNXhMeUl2MjcxUUdDbVRC?=
 =?utf-8?B?Z29YUzVBRTZvVTNBNWYzVGZ3NTI0bjBjbmpKb3R6bGtRa21zbTdxMDRxTWl1?=
 =?utf-8?B?bmlYRzRNQysvaUtzVlBlbTZTWTQvR1QzQ3ZyNndJZnZrWlh6ZU1HczJCNmJJ?=
 =?utf-8?B?dnJScWNVbzR2TXZTTGNkNFN4MEc0YjV3S0U0S2xHWHFZa3E2REU2NmVReTl2?=
 =?utf-8?B?U0pWVlFtU3A5WVFOeXZBUUJIMHZ0UVViNVgzMExacWkwWWZ6NmUrMUFTZW1I?=
 =?utf-8?B?bnpHaFZQaFlnMzNNeWtDNEF3QmVXSmNlU1lhM2h6Z1hUaUorNlN0NDNHSm5T?=
 =?utf-8?B?dVo5eVNweXBIM2hoTFpKazlFTllCQzRFV2tsb1UzcmNFZzI0NVFtOHlDV3h0?=
 =?utf-8?B?SHdKMGFld3lHdFluMWpNdUJIa3MyM0E0NGVCQWlGZkxLRFBWQ3ZDN21Jc0Qx?=
 =?utf-8?B?SzVHL3pUMGNGK3A1R3dTUTVnWkQ5UG5zVWxCVmxhbi9ZQUw1REwwaGJLSG9R?=
 =?utf-8?B?aGlZZW0veEpQNkhmaWtabEgvOTFHTFA2d1ZmV1k5aWx3aUFFNldmcnlTQ1gw?=
 =?utf-8?B?MTRiQnNRa0o2Vy9UdjZSRy9UTDdvbGIzNnAzTnEzRzRySlJzVVNmOGpQR0NK?=
 =?utf-8?B?NXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F117909434AE04BB06B5ED63F4F8FE1@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 774ce7c1-a28c-487a-32a7-08dc48767b60
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2024 00:41:29.2761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KT4zVQVqUFrhaXkKM4SlWJ37YtEVDb4nVmjQcs1ve5aRIM6H8Y31b6Pr2/No7u/Z6GU2deb6eiViQlffM3k1Cp2cSo0BKb5jFVcMD1uZBAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB5665
X-Proofpoint-GUID: hmC9d0Hkw_kRsD_-QugR8Kij8MvYs38s
X-Proofpoint-ORIG-GUID: hmC9d0Hkw_kRsD_-QugR8Kij8MvYs38s
X-Proofpoint-Spam-Reason: safe

DQo+IE9uIE1hciAxNCwgMjAyNCwgYXQgMTE6MDXigK9BTSwgSmVmZiBMYUJ1bmR5IDxqZWZmQGxh
YnVuZHkuY29tPiB3cm90ZToNCj4gDQo+IE9uIEZyaSwgTWFyIDA4LCAyMDI0IGF0IDEwOjI0OjIx
UE0gKzAwMDAsIEphbWVzIE9nbGV0cmVlIHdyb3RlOg0KPj4gDQo+PiArc3RhdGljIGludCBjczQw
bDUwX2Nsa19lbihzdHJ1Y3Qgc25kX3NvY19kYXBtX3dpZGdldCAqdywNCj4+ICsgIHN0cnVjdCBz
bmRfa2NvbnRyb2wgKmtjb250cm9sLA0KPj4gKyAgaW50IGV2ZW50KQ0KPj4gK3sNCj4+ICsgc3Ry
dWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wID0gc25kX3NvY19kYXBtX3RvX2NvbXBvbmVudCh3
LT5kYXBtKTsNCj4+ICsgc3RydWN0IGNzNDBsNTBfY29kZWMgKmNvZGVjID0gc25kX3NvY19jb21w
b25lbnRfZ2V0X2RydmRhdGEoY29tcCk7DQo+PiArIGludCByZXQ7DQo+PiArDQo+PiArIHN3aXRj
aCAoZXZlbnQpIHsNCj4+ICsgY2FzZSBTTkRfU09DX0RBUE1fUE9TVF9QTVU6DQo+PiArIHJldCA9
IGNzNDBsNTBfZHNwX3dyaXRlKGNvZGVjLT5kZXYsIGNvZGVjLT5yZWdtYXAsIENTNDBMNTBfU1RP
UF9QTEFZQkFDSyk7DQo+PiArIGlmIChyZXQpDQo+PiArIHJldHVybiByZXQ7DQo+PiArDQo+PiAr
IHJldCA9IGNzNDBsNTBfZHNwX3dyaXRlKGNvZGVjLT5kZXYsIGNvZGVjLT5yZWdtYXAsIENTNDBM
NTBfU1RBUlRfSTJTKTsNCj4+ICsgaWYgKHJldCkNCj4+ICsgcmV0dXJuIHJldDsNCj4+ICsNCj4+
ICsgcmV0ID0gY3M0MGw1MF9zd2FwX2V4dF9jbGsoY29kZWMsIENTNDBMNTBfUExMX1JFRkNMS19C
Q0xLKTsNCj4+ICsgaWYgKHJldCkNCj4+ICsgcmV0dXJuIHJldDsNCj4+ICsgYnJlYWs7DQo+PiAr
IGNhc2UgU05EX1NPQ19EQVBNX1BSRV9QTUQ6DQo+PiArIHJldCA9IGNzNDBsNTBfc3dhcF9leHRf
Y2xrKGNvZGVjLCBDUzQwTDUwX1BMTF9SRUZDTEtfTUNMSyk7DQo+PiArIGlmIChyZXQpDQo+PiAr
IHJldHVybiByZXQ7DQo+PiArIGJyZWFrOw0KPiANCj4gSnVzdCBmb3IgbXkgb3duIHVuZGVyc3Rh
bmRpbmcsIGRvZXMgdGhlIEhBTE8gY29yZSBuZWVkIHRvIGJlIHRvbGQgdGhhdCBJMlMNCj4gc3Ry
ZWFtaW5nIGlzIGFib3V0IHRvIHN0b3A/IE9yIGRvZXMgdGhlIEw1MCBncmFjZWZ1bGx5IHBhcmsg
dGhlIGNsYXNzIEQNCj4gb3V0cHV0cyB3aGVuIHRoZSBQTEwgc291cmNlIGlzIHN1ZGRlbmx5IHN3
aXRjaGVkPw0KDQpUaGUgb25seSB0aW1lIHdlIGVudGVyIHRoaXMgcHJlLXBvd2VyIGRvd24gREFQ
TSBldmVudCBjb2RlIHBhdGggaXMgaWYgdGhlDQpzdHJlYW0gZW5kcyBvbiBpdHMgb3duLCBvciBp
ZiBhIHN0b3AgaGFzIGFscmVhZHkgYmVlbiBzZW50IHRvIHRoZSBEU1AuIFNvIHRoZQ0KZm9ybWVy
LCBidXQgdGhlcmUgaXMgbm8gbmVlZCB0byB0ZWxsIHRoZSBEU1AgYW55dGhpbmcgaGVyZS4NCg0K
QmVzdCwNCkphbWVzDQoNCg==

