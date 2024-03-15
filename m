Return-Path: <linux-input+bounces-2400-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E73487D4F4
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 21:24:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C86AB21BA6
	for <lists+linux-input@lfdr.de>; Fri, 15 Mar 2024 20:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8519535CC;
	Fri, 15 Mar 2024 20:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="AVdKhASv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="FG+r70xQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B654E3A28B;
	Fri, 15 Mar 2024 20:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710534232; cv=fail; b=rpHO5NPX7iGxgHHbZXB4CYPdMErJbcLl/v5b8QfmC9ZA7E4jnVIShU4MIciHqZ4uZ8H9ONSBifnRQoX5oiQkmEjPQmgPtbeIgagqlGULIScmVwvzaYR8aornvDW0mGwYXq9hCi7HRrgiuXlAyhGIXUnHs7iUUeyhZso2UkWFwRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710534232; c=relaxed/simple;
	bh=bC7H/ugLFi8rDBLbjahl8wIekSc8g+H6b+3a074KaxM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZSQwLd3qt/siTiG+hbZ+GmQ8W51mHoG/0KdtdBrcehGQceHrjvxRKJjY1PBO+WrXsuBcbsffoyYqP+KByOKRrNIQe2hl6BkMm6IwvjNW64Cb65bzgOL31AEpVTZFyCBB4xVkESseLCmhhSFtxSabf+ZCyv/xIRD+d3qWVG7bH3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=AVdKhASv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=FG+r70xQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42FECBHu029813;
	Fri, 15 Mar 2024 15:23:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=bC7H/ugLFi8rDBLbjahl8wIekSc8g+H6b+3a074Ka
	xM=; b=AVdKhASvkjt+bZUZNOh2KjNjnhc46Mk1tWhAVNBwyC7ErP3WTbaMr1+g/
	RvB4JcIkEkLoClXn7/S/ICC6hHvTewfb7EX4OLpndiRq24uQDwJe0YSgKcRZAII+
	X2B5Uihd9DlOGbyFTHVpXnvjQll8Z2qNzeZtMRh7s06riN6nJf95aEMRU7JHaihl
	xHPhGp2hQVUqxiNGDJcRpfTG7DjJYhNkrSx1taCAJHKig5neMv/u7RQLFYQMCwKn
	yBKfmyjVrk1if2Vf/PDFRRdplQ268BY1iB6QWwtHa1Tyrw9w4CUh2LtZqoyxkmib
	3nmZcISG65JYY44oRL28ny2Lrw98A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wv9xp92m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Mar 2024 15:23:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ckDjOSmLR3694JUsFuuzl+Ka/oyH2225BW8w4+lDJMqv2Ljs6aKyhutxX9MW9MK+tsQVUDa/O1jLWV9VSx+q8eoqUcASp5qt8RzX/LVrowKSEzFRIFPzFc3i0HgLwagTFi5//jNn9t/XuEwX/5oKnxdZNp9qn/Ugm/ATdvdDpWkNXLBABBwUJ22oQydjErlsnAnrTVwySNbIFx8I2T23EBz3JhA7lFMXyEuu50OBEIQkCG0iTOMB5YFKquXbkekbm+BToU5o7ja8QkkliO8MkIyMagFPFpddeLwbaM5dj7m0c5pUwG58YjrXVslzuIPvGU3OzTur+DUmuqO0UJwP/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bC7H/ugLFi8rDBLbjahl8wIekSc8g+H6b+3a074KaxM=;
 b=grn/bnC5AQqKf7m8hlD1KwFgOjUPM82E73irMUlWjlZppdVXivb2SaoYhqWLdXEvx8iznYKmjEnAQ4F6lKCjQ//JQX8O6A8py3nwFYN8gQWFymxrZ8TAOg7xyBgne/ip2NjqJV9PpmXyAWK3f866kA6oyvMhPWQ8B5PmSuSy/VkUrqCqKVQbd7CY4tOKAnJvmgbdtV4lbhTyxEvQ0mRqojND8Zwdvj1DlztV/xiX7/xof7pqVlvS2Z9cDvkbGXLf4A8+QzgfaY3+Cf8PDPDij8QzZNPPLK3O/KEWIEiYCJkfbop9zaBN0rxJys9tWxarduqACrl1qAoGPMuXFVIwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC7H/ugLFi8rDBLbjahl8wIekSc8g+H6b+3a074KaxM=;
 b=FG+r70xQFkkkGTWsdxrrUaVzoaLL8VLmIgL5kUrkYxdXbJvBMuY2rRPxEwCjBw98koXyPHv0Vc95wrAXWJHwEPCl6a7RwCyrVwywCQjTkeRMuUsNOSK/huGS8jzngGoSN6scYduBGiYOm7pZ9Guu3h4C0QfK4cPMbuMFURZthCc=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 CY5PR19MB6362.namprd19.prod.outlook.com (2603:10b6:930:22::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.22; Fri, 15 Mar 2024 20:23:33 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac%7]) with mapi id 15.20.7386.021; Fri, 15 Mar 2024
 20:23:33 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Jeff LaBundy <jeff@labundy.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Mark Brown
	<broonie@kernel.org>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>,
        "open list:INPUT (KEYBOARD,
 MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
        "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v9 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Thread-Topic: [PATCH v9 4/5] Input: cs40l50 - Add support for the CS40L50
 haptic driver
Thread-Index: AQHacadu7OGcfhS+5UCWrZrHMng4+7E3bFuAgAHdlgA=
Date: Fri, 15 Mar 2024 20:23:33 +0000
Message-ID: <54A547F9-83F2-4159-9D7D-6543CEC1EB9E@cirrus.com>
References: <20240308222421.188858-1-jogletre@opensource.cirrus.com>
 <20240308222421.188858-5-jogletre@opensource.cirrus.com>
 <ZfMdmYM5cK7GKdbG@nixie71>
In-Reply-To: <ZfMdmYM5cK7GKdbG@nixie71>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|CY5PR19MB6362:EE_
x-ms-office365-filtering-correlation-id: 67554060-7de1-4d68-359a-08dc452dc956
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cxnkmSIVYPxvsgf3PqJRZWIPGKPfqJNMMatj4kgQVP9iaNQbKTrKvP6DNnTIvssJWfFws3D3fmeB0uRMuFRvo3YZz2TInhwzuyvDehaDuC1bCbKYJv8yEh3hMcDyyOc8hxJLHR1kczIiwxk3+/JTruMRQ5LMRj0q/OTmQ2dNMHnr1NBD3INjDlH7N05KhOIPu34ARK0SOSe4q5Dgi61bS1jT1EecnB+GcCmMHUAevsMiLdOkEjBFVdUU1AYoyt6b8El08RWDyWqTNhFzACPwvqkHWTTI9+BwTzNYHQA82PYNxuogKO1rC2Llj2M4WvKHrQ7SK6jYCkYsID/KKyOjtDjFNTnbBjfq1cas+KW57VjVTSvzSjTDYyCaaxlpRhJROID1E+/yuywSSaU/ndbcmZ6I0ojBvbsPSQ7R5cfCw5eapu2SmA1ZF60GQOZodMhOvM7ShdDiKTL9EjMzIfhH4zn+p0Qit4DznoZoMg0+bsw2Hme/p3E5QU455DeFZBj8bNLt0cUp8ApF7BMfbT8np9mEMolWlz0PM8fBwhJcC62cVBrC18U5yrjQ/EUntJ3vUzHcTmCWsPUM+4zA1aaOWrmmgg6sD6jqkIBBUyYCRqUeyiiAYAK/nqDsLDBb46m3QsBB2juo5DSAq+DekBHL19c4ovL85yi6IcLYXjt5on1i6X3w1BypJIZgPtw3EwxFfFKU5kYH+L6LkZLUdHF5L8++48GG8LIHCQHGdHAYkfo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MkFrd2JMR3l3dWkvTXpPa01iby9TN2RwZUMwSWs2V1EzRFI2MVhJai80Ym5F?=
 =?utf-8?B?NlBWcnJqZzFuVkJ0QzA1cEZKRDMra3hyL09hbzdGa3VGOWIrTUQzWjJhUXdF?=
 =?utf-8?B?Nm5HNTRqZkl4Uld6eEd3OWZVRm5tdmNDdEE2NDBDOGY3MWxoTUo5TklGK2ND?=
 =?utf-8?B?L1k1UTVCenVESWpMeDhTZ0RWdHdaczI2SnNMb254QWtPT2s4OHJUUm4vUzIr?=
 =?utf-8?B?WmpESERJZmdXdUpkUGFoYmJoTFE1Tmp3RXhsd241Y01POWJkanpsNzI1bWpm?=
 =?utf-8?B?c2QwRGswaGlwMTdYK3NtMjd0clV1OHpVZU5nUmZkbmRjYm5VV1ErQ2k5czJP?=
 =?utf-8?B?SGxjUkZ3MnI1R21SenpZNWN2bUxvdHdzTi9VOVEwMThkSlNJWGNYTXpMdHRT?=
 =?utf-8?B?ZzRrV0N5bzN5d3VpbGR2bnVSNDVSY3pDWlpadVBhOFNIOEg2cFdpcWNhNVVx?=
 =?utf-8?B?R0daZFNTWlpxNGpUeWh0dlo5VWN2dSs5QjkreWNQdmR5dGJLZzJlek5nU0pV?=
 =?utf-8?B?M2VVSXZyZTFuVGVLaDVuNE5BOHI1UEE1US9HSUVMbmJVbmdUU1FDamZGSHZu?=
 =?utf-8?B?dkNwYlJCdFZlcTVVcmR3WkV4dkhoeW9Rb3RZd0lWTm92TDdNb3BwcjVxdGxN?=
 =?utf-8?B?Q3VZVzcxckVMVDBvUWgxejJTcXdabXNNVW82cU5UQTFVNGhFQlZjbU9HUVl0?=
 =?utf-8?B?Y24vdGZ2STFCSEFDVStTNnVDZ3RmcWxiOTZRdDdiZ2RRazRaNGl5eXR1aWFm?=
 =?utf-8?B?Vko2ZHh3b1M1bDFHZlFaNkRpUXJEL3BlYmJZWFl5dGRVVEJJb0RKVXVQRi95?=
 =?utf-8?B?RFJhUWdLOHpsaDQ0NEM4amZLclgwZzI2ZWhkNUZ6WE04d1YwdGdIck01RzBo?=
 =?utf-8?B?RmR0VnJkeU1hMUpPNXk0bUk4NE9XRVpaQkppYVNHVFlUQ2xMR3VKM0RMYkRn?=
 =?utf-8?B?ajE2SHJQcU1wQXc0eTZDSXlya2UwQk5xMzZhNVFhOTMyV0xSNjU3RExhNkNG?=
 =?utf-8?B?anhxQVloeEIxdi9CdEZ4V04reTBPN1RlWHIwbVg1K0FGeHBzdStSSEtVNmQx?=
 =?utf-8?B?b1FOZjlnZ1pPQWRtMGFhZHFqaE9NMDBVYlZZSExRRXFtUHF6QUlYMjJ6RDZC?=
 =?utf-8?B?Y0ZWckpHeHQzR2hSaCs3bmpXSjdKYXJmV2gxQTNhNkRubkNNdG9obGxpWXR5?=
 =?utf-8?B?VU5TcXl1ZEl1aWJPRmc0OGdTbVdqa2NFNmV6UXRjUnR2REMwQ0dZV2JGRTU0?=
 =?utf-8?B?c2FEb3Z3d0pXck16akdKSkE2VDZyM2F1aWlZeDM2ZmIrVXk1U3BKcWcvYVZH?=
 =?utf-8?B?STcrejZRTEx1SnhCdjRVZDcwQ1VhZjVPTzNQb2NyWWlSOG8xNUFncDZ6ZWs4?=
 =?utf-8?B?WlJIVHRuNlJkVkp0RDBoNHQ1cnBHK3dzSEhKTVl4Ri9TWTcwbUp0eEllSDRB?=
 =?utf-8?B?UGNKcGNXUkNzOTlYU256ZnhIaHNySVpZZW9JNHU2RmM4UXlJMWwrNlNqQ0pj?=
 =?utf-8?B?Vzg4azdLeU5rRzRjM2lScGtDOTRKcE13Nm5yOVFIQ3V6V0M5YUdFWG9KblFC?=
 =?utf-8?B?a0hRdzJFQ1lZeFJGdUZBTUVnNlhOYlVQdlNzL2x1QXVRMm1hRjNZWmROUFUw?=
 =?utf-8?B?YTRHemRaTFhBRHdjRFFkUkVOWVlRUVRzUDFMSXRYM3p4Ky9oWnBlSmlZRVJL?=
 =?utf-8?B?Z21XdWlCK0xkVkhaWmN2cEs0S1JTYVlQdjRqVFVhR3NUUno1YTMwWndoVERn?=
 =?utf-8?B?cXhFR2R2dEFUakhpL3lzNkZ0S3o2SnRjWktBZEhnVS9ab2NBci83UjJHVWFL?=
 =?utf-8?B?TUVJQ0ZzYy8wbko2ZEU2Y0tjRnU4dHlpdWF4U21teklWMVBCeEh5bFh5cEpp?=
 =?utf-8?B?bFNKYXRsVXpQKzZoQ016U2lYVWtYTU9lNXBlTlZkNHNwdjVGSWdJK0gxMHdv?=
 =?utf-8?B?RmgzaGp5UUlFWWpXL0RQZDVJMVRodmpuNUV4RGkzeUhhMldURWVacXluVXFR?=
 =?utf-8?B?bDRpMXRodGNPUzhCaWJSWThHM1AxQ1pBaEM1RXZmVU14RlpjSks5eExhR3pj?=
 =?utf-8?B?aFpIQzFRdk5vVHp3Z25vQmdSaUV5ZDRIN2xqUThQYXl3aFYyaDhCMGx3UTI4?=
 =?utf-8?B?bVBSd0l5QkNOaHo4YWUzVW1ZaVFsOGxtb0ErMGtQakFla1dqSHVCbVVVMzFX?=
 =?utf-8?B?NHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E8BB3845EDFBF4DB1787C2FE789739E@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67554060-7de1-4d68-359a-08dc452dc956
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 20:23:33.3333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TllzcwMkYBPXf8ySDUCKXPLQple4KSLL5VPXpoDw9eJglKpm4KcmzdnNE+e/dfAVJGNGWRjpzPsKwMoiI8UfFBMpGwJX27CPiMdmPXQ2u6k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR19MB6362
X-Proofpoint-ORIG-GUID: E8ubOE4jHe0ANb9gnI65w0psJo8p3cgg
X-Proofpoint-GUID: E8ubOE4jHe0ANb9gnI65w0psJo8p3cgg
X-Proofpoint-Spam-Reason: safe

SGkgSmVmZiwNCg0KPiBPbiBNYXIgMTQsIDIwMjQsIGF0IDEwOjU04oCvQU0sIEplZmYgTGFCdW5k
eSA8amVmZkBsYWJ1bmR5LmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBKYW1lcywNCj4gDQo+IE9uIEZy
aSwgTWFyIDA4LCAyMDI0IGF0IDEwOjI0OjIwUE0gKzAwMDAsIEphbWVzIE9nbGV0cmVlIHdyb3Rl
Og0KPj4gDQo+PiArc3RhdGljIHZvaWQgdmlicmFfc3RhcnRfd29ya2VyKHN0cnVjdCB3b3JrX3N0
cnVjdCAqd29yaykNCj4+ICt7DQo+PiArIHN0cnVjdCB2aWJyYV93b3JrICp3b3JrX2RhdGEgPSBj
b250YWluZXJfb2Yod29yaywgc3RydWN0IHZpYnJhX3dvcmssIHdvcmspOw0KPj4gKyBzdHJ1Y3Qg
dmlicmFfaW5mbyAqaW5mbyA9IHdvcmtfZGF0YS0+aW5mbzsNCj4+ICsgc3RydWN0IHZpYnJhX2Vm
ZmVjdCAqc3RhcnRfZWZmZWN0Ow0KPj4gKw0KPj4gKyBpZiAocG1fcnVudGltZV9yZXN1bWVfYW5k
X2dldChpbmZvLT5kZXYpIDwgMCkNCj4+ICsgZ290byBlcnJfZnJlZTsNCj4+ICsNCj4+ICsgbXV0
ZXhfbG9jaygmaW5mby0+bG9jayk7DQo+PiArDQo+PiArIHN0YXJ0X2VmZmVjdCA9IHZpYnJhX2Zp
bmRfZWZmZWN0KHdvcmtfZGF0YS0+ZWZmZWN0LT5pZCwgJmluZm8tPmVmZmVjdF9oZWFkKTsNCj4+
ICsgaWYgKHN0YXJ0X2VmZmVjdCkgew0KPj4gKyB3aGlsZSAoLS13b3JrX2RhdGEtPmNvdW50ID49
IDApIHsNCj4+ICsgaW5mby0+ZHNwLndyaXRlKGluZm8tPmRldiwgaW5mby0+cmVnbWFwLCBzdGFy
dF9lZmZlY3QtPmluZGV4KTsNCj4+ICsgdXNsZWVwX3JhbmdlKHdvcmtfZGF0YS0+ZWZmZWN0LT5y
ZXBsYXkubGVuZ3RoLA0KPj4gKyAgICAgd29ya19kYXRhLT5lZmZlY3QtPnJlcGxheS5sZW5ndGgg
KyAxMDApOw0KPj4gKyB9DQo+PiArIH0NCj4+ICsNCj4+ICsgbXV0ZXhfdW5sb2NrKCZpbmZvLT5s
b2NrKTsNCj4+ICsNCj4+ICsgaWYgKCFzdGFydF9lZmZlY3QpDQo+PiArIGRldl9lcnIoaW5mby0+
ZGV2LCAiRWZmZWN0IHRvIHBsYXkgbm90IGZvdW5kXG4iKTsNCj4+ICsNCj4+ICsgcG1fcnVudGlt
ZV9tYXJrX2xhc3RfYnVzeShpbmZvLT5kZXYpOw0KPj4gKyBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZChpbmZvLT5kZXYpOw0KPj4gK2Vycl9mcmVlOg0KPj4gKyBrZnJlZSh3b3JrX2RhdGEpOw0K
PiANCj4gVGhpcyBidXNpbmVzcyBvZiBhbGxvY2F0aW5nIG1lbW9yeSBpbiBvbmUgdGhyZWFkIGFu
ZCBmcmVlaW5nIGl0IGluIGFub3RoZXINCj4gZ290IHByZXR0eSBoYXJkIHRvIGZvbGxvdywgd2hp
Y2ggbWVhbnMgaXQgd2lsbCBiZSBoYXJkIHRvIG1haW50YWluLiBJIGtub3cNCj4gdGhlcmUgYXJl
IHNvbWUgcmVzdHJpY3Rpb25zIGFyb3VuZCB3cml0aW5nIGludG8gdGhlIEhBTE8gY29yZSwgYnV0
IEknZCBsaWtlDQo+IHRvIHNlZSBzb21ldGhpbmcgc2ltcGxlcjsgdGhlIGRhNzI4MCBkcml2ZXIg
aXMgbm93aGVyZSBuZWFyIGFzIGNvbXBsZXguDQo+IA0KPiBIb3cgbWFueSBzMTYgd29yZHMgZG8g
eW91IHJlYWxpc3RpY2FsbHkgbmVlZCBmb3IgY3VzdG9tX2RhdGE/IElzIGl0IHBvc3NpYmxlDQo+
IHRvIHNpbXBseSBpbmNsdWRlIGFuIGFycmF5IGluIHRoZSBjczQwbDUwX3ZpYnJhX2luZm8gc3Ry
dWN0LCBhbmQgYmxlYXQgaWYNCj4gdXNlciBzcGFjZSB0cmllcyB0byB1cGxvYWQgZ3JlYXRlciB0
aGFuIHRoZSBtYXhpbXVtIHNpemU/IFRoaXMgc2VlbXMgdG8gYmUNCj4gdGhlIGFwcHJvYWNoIG9m
IHRoZSBtdWNoIHNpbXBsZXIgZGE3MjgwIGRyaXZlciBhcyB3ZWxsLg0KPiANCj4gVGhpcyBhcnJh
eSB3b3VsZCBnbyBvbiB0aGUgaGVhcCBqdXN0IHRoZSBzYW1lLCBidXQgeW91IGRvIG5vdCBoYXZl
IHRvIG1hbmFnZQ0KPiBpdCBzbyBjYXJlZnVsbHkuIE9waW5pb25zIG1heSB2YXJ5LCBidXQgbWlu
ZSBpcyB0aGF0IG1lbW9yeSBhbGxvY2F0aW9uIGFuZA0KPiBmcmVlaW5nIHNob3VsZCBiZSBkb25l
IGluIHRoZSBzYW1lIHNjb3BlIHdoZXJlIHBvc3NpYmxlLg0KDQpUaGUgb3JpZ2luYWwgaXNzdWUg
d2FzIHRoYXQgdGhlIG9sZCBpbXBsZW1lbnRhdGlvbiBvZiBwbGF5YmFjayBlZmZlY3QgaGFkDQph
IHJhY2UgY29uZGl0aW9uIHdoaWNoIERtaXRyeSBwb2ludGVkIG91dC4gQ29uc2lkZXIgd2hlbiBj
czQwbDUwX3BsYXliYWNrDQppcyBjYWxsZWQ6IGl0IHBvcHVsYXRlcyBlZmZlY3QgZGF0YSAoaW5j
bHVkaW5nIHRoZSBpbmRleCwgc2F5IDEpIGFuZA0Kc2NoZWR1bGVzIGEgdHJpZ2dlciB3b3JrIHRv
IGJlIHJ1biBpbiB0aGUgZnV0dXJlLiBCZWZvcmUgdGhpcyB3b3JrIGlzDQpleGVjdXRlZCwgYSBz
ZWNvbmQgY2FsbCB0byBjczQwbDUwX3BsYXliYWNrIGlzIG1hZGUsIGFuZCBhZ2FpbiBlZmZlY3Qg
aXMNCnBvcHVsYXRlZCAoc2F5LCBpbmRleCAyKSwgYW5kIHRyaWdnZXIgd29yayBpcyBzY2hlZHVs
ZWQgYWdhaW4uIElmIGVmZmVjdA0KaXMgaW4gc2hhcmVkIGRhdGEsIHRoZW4gaXQgd2lsbCBiZSBv
dmVyd3JpdHRlbiBieSB0aGUgc2Vjb25kIGNhbGwgYW5kIGluZGV4DQoyIHdpbGwgYmUgdHJpZ2dl
cmVkIHR3aWNlLg0KDQpTbywgSSBuZWVkZWQgYSBzZXBhcmF0ZSB3b3JrIGl0ZW0gZm9yIGVhY2gg
cGxheWJhY2sgdG8gaG9sZCBpdHMgaW5kaXZpZHVhbA0KZGF0YSBzbyB0aGF0IGVmZmVjdCBjYW5u
b3QgYmUgb3ZlcndyaXR0ZW4gYnkgb3RoZXIgcGxheWJhY2sgY2FsbHMuIFRoaXMNCm1lYW50IHRo
YXQgSSBuZWVkZWQgdG8gdGFrZSB0aGUgcGxheWJhY2sgd29yayBpdGVtIGFuZCB3b3JrLXJlbGF0
ZWQgZGF0YQ0Kb3V0IG9mIHNoYXJlZCBtZW1vcnkgKGNzNDBsNTBfdmlicmFfaW5mbyksIGFuZCBj
cmVhdGUgYSBzdHJ1Y3R1cmUNCmNvbnRhaW5pbmcgYWxsIHRoZSB3b3JrIGRhdGEgdGllZCB0byB0
aGF0IHNwZWNpZmljIHF1ZXVlX3dvcmsgaW52b2NhdGlvbiwNCmFzIHdlbGwgYXMgdGhlIHdvcmtf
c3RydWN0IGl0c2VsZiBzbyB3ZSBjYW4gYWNjZXNzIHRoYXQgdW5pcXVlIHdvcmsgZGF0YQ0Kdmlh
IGNvbnRhaW5lcl9vZigpIGluIHRoZSB3b3JrZXIgZnVuY3Rpb24uDQoNCk9mIGNvdXJzZSB0byBo
YXZlIGluZGl2aWR1YXRlZCB3b3JrIGRhdGEsIHdlIG5lZWQgdG8gYWxsb2NhdGUgYW5kIHBvcHVs
YXRlDQphIG5ldyBjczQwbDUwX3dvcmsgd2l0aCBkYXRhIGluIGVhY2ggaW5wdXQgY2FsbGJhY2su
IFNvbWV0aW1lcyB0aGlzDQplbnRhaWxzIGR5bmFtaWMgYWxsb2NhdGlvbi4gV2h5PyBCZWNhdXNl
IHNvbWV0aW1lcyB3ZSBoYXZlIG5vIHdheSBvZg0Ka25vd2luZyB3aGVuIHdlIGNhbiBsZXQgZ28g
b2YgdGhlIHdvcmsgZGF0YS4gQ29udHJhc3QgdXBsb2FkIGFuZCBlcmFzZToNCnRoZXNlIGNhbGxi
YWNrcyBhcmUgbm90IGNhbGxlZCBpbiBhdG9taWMgY29udGV4dCwgc28gd2UgY2FuIHVzZSBmbHVz
aF93b3JrDQp0byBndWFyYW50ZWUgdGhlIHdvcmtlciBmdW5jdGlvbiByZXR1cm5zLCBhbmQgdGhl
cmVmb3JlIHdlIGNhbiBmcmVlIHRoZQ0Kd29yayBkYXRhIGluIHRoZSBjYWxsYmFjay4gY3M0MGw1
MF9wbGF5YmFjayBvbiB0aGUgb3RoZXIgaGFuZCBpcyBjYWxsZWQNCmluIGF0b21pYyBjb250ZXh0
LCBzbyB3ZSBjYW5ub3QgdXNlIGZsdXNoX3dvcmssIGFuZCBzbyB3ZSBoYXZlIHRvDQoiaG9sZCBv
biIgdG8gdGhlIHdvcmsgZGF0YSB1bnRpbCBzdWNoIHRpbWUga25vd24gb25seSBieSB0aGUgd29y
a2VyDQpmdW5jdGlvbiBpdHNlbGYuIEhlbmNlIHdlIG11c3QgZnJlZSBpdCB0aGVyZS4gU28gSSB0
aGluayB0aGUgY29tcGxleGl0eQ0KaGVyZSBmYWxscyBpbnRvIHRoZSBuZWNlc3NhcnkgYnVja2V0
Lg0KDQpJIGRvbid0IHRoaW5rIHRoZSBhYm92ZSBhcHBsaWVzIHRvIHRoZSBjdXN0b20gZGF0YSBt
ZW1vcnksIHNpbmNlIHRoYXQNCnBhcnRpY3VsYXIgbWVtb3J5IGlzIGZyZWVkIGluIHRoZSBzYW1l
IGZ1bmN0aW9uIGl0IGlzIGFsbG9jYXRlZCBpbi4NCkxvb2tpbmcgYXQgdGhlIHBvc3NpYmxlIHVz
ZSBjYXNlcywgdGhlIGNlaWxpbmcgb24gdGhlIHNpemUgb2YgdGhlIGRhdGENCmlzIHF1aXRlIGhp
Z2ggaWYgdGhlIGN1c3RvbWVyIHdpc2hlcyB0byB1cGxvYWQgYSBsb25nIHNlcXVlbmNlIG9mDQpl
ZmZlY3RzLiBTbyBJIHByZWZlciB0byBrZWVwIHRoYXQgYXMgaXQgY3VycmVudGx5IGlzLg0KDQpJ
dCBtaWdodCBiZSBwb3NzaWJsZSB0byB1c2UgdGhlICJpbmRpdmlkdWF0ZWQgd29yayBpdGVtIiBk
ZXNpZ24gZm9yDQpwbGF5YmFja3Mgb25seSwgYW5kIHVzZSB0aGUgb2xkICJzaGFyZWQgd29yayBp
dGVtIiBmb3IgdGhlIG90aGVyDQpjYWxsYmFja3MuIEhvd2V2ZXIsIEkgZGVjaWRlZCB0aGF0IGhh
dmluZyBvbmUgdW5pZm9ybSBpbXBsZW1lbnRhdGlvbg0Kd291bGQgYmUgYmV0dGVyIHRoYW4gbWl4
aW5nIHR3byBzY2hlbWVzLg0KDQpCZXN0LA0KSmFtZXMNCg0K

