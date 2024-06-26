Return-Path: <linux-input+bounces-4652-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6368E918E60
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 20:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8E491F27690
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2024 18:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B156B190497;
	Wed, 26 Jun 2024 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bW6h0R4c";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="UPSyqmaJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9D56E613;
	Wed, 26 Jun 2024 18:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719426330; cv=fail; b=u0ZcJ0xNY6gmRmOETlsU9xj9LE83uGHX+BjXuzySwT365gVXMuz+Bit6VCVZGP7Dddms+jh2DRXxIgPH4+UxjsWCTnM9K5UXcWxPdVuX+UI+D++BIPYDMQqE0S+3OwowKoQne55ossS9kN18OyipYbl+Fl3FF3Ds4Lou/WkBELk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719426330; c=relaxed/simple;
	bh=avOgcqNdJtVmB1KUWYa5RFwxKJNvP+4DXSyWzFDctoA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=quzrEMjcRMhVNwRuqcdmg5W8gU6UBN9bJdHXcPEaUi3PGpPDmUm6XDla0CZAZNHytGEozZwDGz7Ccs19dYPu/yyakOKsrkyANwY1ymF8Dhuv+YMrWuzxP3e/RDVyiKl3T/hzpnwwTRnXZKH9Z9Bm20U/pW5bxa6j7B1/b4AKRBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bW6h0R4c; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=UPSyqmaJ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QIDFT2003904;
	Wed, 26 Jun 2024 13:25:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=avOgcqNdJtVmB1KUWYa5RFwxKJNvP+4DXSyWzFDctoA=; b=
	bW6h0R4cFueH+CR8MZZ6vWe/31KW4noGoXD4jNAEWTM+NlNvrX86SgpRcxDSMnWg
	CF32YWChnfVhYAqWYFg4ZUIt4tztu5AWIVsu5s2wHw33M0WKLjS4rHKb/bbGayGo
	N/AY1Q5NYsYMGIe8t+z2qAzzvIHsOcGIoYLUauNlzbh3AqLauGV4AvZgY/rEOYPU
	kElE8+ZXZwEWulgn38iq86eARGO/Rhl7lSAjrSi0nnsNvfVgV2mRISWEqZZN6D+E
	9ayxiP0hZHD7pFWedsWOCQPqYjjHzrAPJYOlBxq4yUb0Gh+Ka5I5J6BGc46kB1ge
	lquHDQg5V2H3LrM7nrQYDg==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 400nbdr7rx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 13:25:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC5gwnE4nV7zXml37tt2mGzEb6+IsgdnhO3PCORF4dZT/9cYc8Mlg8a1sz72ejhP1fQOR9a4CmnPzT5IfOqzCrMTtaT/YAKwg1Nc3B8rO3Z9C0jIb5zhFc1/gda/OUohT40BkPEthXzLXG1WQWNJ/8oAo4fcKnC4FM862zmU8SAG6J0jrUCpqa794ywPZIIcG6qi7He2Is4xmLiZofdOwdKOp3bu5uqLc0U48uZHS4RPCsGAMID4RWCkrcMCReuxdpljjF7+GvOT+ENVyEfFIX2Ek3F6t4kmFw2q+VzMGBuH4HuboZdRJYlWnakvpToMrEMmCKkusmflbEXCI4egqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avOgcqNdJtVmB1KUWYa5RFwxKJNvP+4DXSyWzFDctoA=;
 b=HZA7mr+r8JOqHNVXBMSss2VQsVx95o5+tUFKjBbBupw8xYBmBpoVvg2GCaJgVMwTV5V4q2eUjZPyPxTBvf9HKFfvRAgR/gysbGkEN5ecKQKx1n6O4iolr6YsP+GQsjjgIVGJoUUrWAHZ2ppjxZFQC9vxmvBkKyIweeLfLXYoYXN/EWayBgWHJTnVSj8cgxWhKbZG712yoGud8jzbihfF7zSFCE0t/7kT3yw/JMtOQTa57vMgpFigaZoVHl06JX0eoZW4ys09lgZ6aTYd4L+SmCZtYxfYGPoaYT7dD7eNC1HYMKoMpOQ2Rzg0CE3T0cZ+Xae0RMLpRAzFC7ahRzl22A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avOgcqNdJtVmB1KUWYa5RFwxKJNvP+4DXSyWzFDctoA=;
 b=UPSyqmaJCfZSQ7y1VEz7MkAFNQVvNNJZUBdQvW8t0BpjrA4ra6JWTe420ALM/9ioi8AWDU21XiFbHkgpMkswMFXNgOZZ3yOUkz3kjnpMWpdWMRFCkioXGrv+a6i0o9j5SKlrYD1mMPZFBTyF05zaftLWmQhUqa430gilLzp/cwM=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 IA1PR19MB6499.namprd19.prod.outlook.com (2603:10b6:208:3ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 18:25:12 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7677.036; Wed, 26 Jun 2024
 18:25:12 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v11 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Thread-Topic: [PATCH v11 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Thread-Index: AQHat0+3Myao0Uzu/EqmK3h4neNEqLHaeTqAgAAEdoA=
Date: Wed, 26 Jun 2024 18:25:12 +0000
Message-ID: <D3F6F68D-5921-49A3-AFC3-E280597E7DE3@cirrus.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-6-jogletre@opensource.cirrus.com>
 <a85e09d6-d8eb-4c60-ae83-b4dbf875a926@sirena.org.uk>
In-Reply-To: <a85e09d6-d8eb-4c60-ae83-b4dbf875a926@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|IA1PR19MB6499:EE_
x-ms-office365-filtering-correlation-id: 20b072f9-e053-4557-43db-08dc960d5167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230038|1800799022|366014|7416012|376012|38070700016;
x-microsoft-antispam-message-info: 
 =?utf-8?B?dklaVGJmZDMxVWFMaW9MOUE4c0tvaFRoQkJTWHNWQjlzSjhERHhZbWJpazBO?=
 =?utf-8?B?MHVXaU8zTEo4a2NtdzgrMVVMQkNCdXNDVXRmbGNBU2VqTEVyT1RFcmZxenJr?=
 =?utf-8?B?eW5lNm5wZVh0K2lkbUdLMTg4SXBVMzJjWFkwYWF0SmszYmRIbldRSm1MTCtS?=
 =?utf-8?B?WUVoM2pWdTc1NWNPcFB6VDJ6Q21NQ3JFTXUzWC9iZU8yOVN2aWFWNkpDbFpn?=
 =?utf-8?B?aFlleGtOMU9lTTVzSHhyWE9FNUVxbU8ySTdkblFPN09rWnVTK05BU2dvY1RU?=
 =?utf-8?B?ekJyV1B1TjBkWURCQ1V3aFZjbmE1SXU5Vi9obFl5YWw2ODU3WERQUE1Yenh6?=
 =?utf-8?B?SjRSYlNqN2VJSHJmRFd5c3BJQ1BYYmsveG5tdi83Q2JqQnZIcXRIMktkYmF1?=
 =?utf-8?B?NHhHTFFuZ2hBdG9jRU90dG9YU3ZCbmxCTFNqK1BhZlRzQkZLSGZjbE1GUHEv?=
 =?utf-8?B?bXBiYmVMYmxpVE5SNTVwaUxITGorbVlNVktJY29GdjlqaVNKRWdreHFqT2l0?=
 =?utf-8?B?SS94Q1JPeDZjOENKSkNZckxQZTFRVzd2UHgyUnJJU1htVlNGcHk5ek1aZlB0?=
 =?utf-8?B?STFPTWVGcG00SXBzVEIrY2ptNWVlcUN6UE1PNVI5L0pScXlGMExmQWdTa2tv?=
 =?utf-8?B?cGVzaHdCeTdpZ2hSenhHbkpoUW93WnBqSDQraGViR0pGc21nQ0szR3BGc0oz?=
 =?utf-8?B?MW5RRnN3RFpEcC90RlFMYzFZam8zZzVIYzZ1SEt0OXRUYUFUT21sNFkzVlZP?=
 =?utf-8?B?ZWhVMVllRDRia0k3OGIzeElRWEZaaW1QQ01hUWg3YytzUWxrUm8zMkRhTmdn?=
 =?utf-8?B?dGtxNXN3b0lENnU4SlJQZ3VETEZmbG5EeGpINlhLL29HU3FCKzR4UWlTaG9I?=
 =?utf-8?B?emRQTFdqUXhSbEZyb1BvQVFmc2tGOUpNS21uRDZjRXR4YUxIdTRQTEw1WkJm?=
 =?utf-8?B?ZEhOSyt6N0NPbE9kNzdtWU5acGFENjQ2NEE1MnNhdFR2b1RyQlFwTlV1ekwz?=
 =?utf-8?B?SDE4WHprbHZiejRWVmhBcFMvTUJQb3NpNDFsTDJ2RklFZlZwSHJRblRRdkMy?=
 =?utf-8?B?a0QyUmpxK0RNdHRnTHA0dzJnQ0NYU2ZlS1ZKb3FqeTFVS3c5SkVhc21pZXpz?=
 =?utf-8?B?V2doUlBNaHJYUHBid3hiaFJ0cGRTSVlSTVZ6aFN4YXVkeGY5NmIrYS9CcVQz?=
 =?utf-8?B?bEZSNmN6MW82UXNDVHA2QktHM1dMSkJhUTRlSEhNNlYxaXl4aVhBS2RiTWNl?=
 =?utf-8?B?akdhN1gwWldBbithTXBHUENsenVuM0lCTXRZRSsvVm80QW5OR01jMXNpaVhR?=
 =?utf-8?B?RVM2bzlXRXNSYytMT3JhbWtFdENtbU8vV1M5VC9aTkhEOHlLZks2dWFUTW0y?=
 =?utf-8?B?SmlLV25KTEE3cGxocjltUWttcnF0NElVa3MvVGtrVnY0eDllMXp2ZEhWM05O?=
 =?utf-8?B?MEl0TUkremhmQTZ2TkNhYlVRekErTkNNTjZYRmtuMVlPYU9jNTEwQTRVUUZB?=
 =?utf-8?B?N1AwSW05RG9pVW04ZjY2R21OeDBYYTRiSUs3eGZvcXpyLzJ1ekVZNktpNG1x?=
 =?utf-8?B?TWpxMXdaejZUQTNhNDZGbGlFTGZ2dFNIeEpLbTBjY3RrVThZUDFhK2hBSy9u?=
 =?utf-8?B?Q0lLcWVxMGg3UEFQaVFtREVSZ2Y4cmExako0UXhpYlhvajNHSXc2cEMybG9x?=
 =?utf-8?B?VFlqNEFhdU9zaXhoeU5mUWZLUGJEQWZxemV5NXZuK2JCRVBRa3VBVTkvenpQ?=
 =?utf-8?Q?ekJ7x6tMOWzdU8sz3cdZEdvP8JlsahEBVbrJxrp?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(366014)(7416012)(376012)(38070700016);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aFdPN1ZvMS9jcU1wWkEvUSt0NExTeUsxakpwTXk4eE9qY2oxblFpbVR2VUpv?=
 =?utf-8?B?M3FRV2FrQkp6d3EwbDRNcGdtTmJHVVlsR29TUERpbmNXaGJrTXFjVGYyVEdl?=
 =?utf-8?B?anV4OElLeDhPQ1F6YjJqMEF0eDgxeUJ3eWU2QitBTjBZT2xVMkh1S2NuaU1o?=
 =?utf-8?B?YWRGeW1lZERwSU1IaFRiYi9NRDNsK2ZQUUlQdTdTbnRGMlhyaCtSeVZucFRY?=
 =?utf-8?B?VkZqV0Z1dzI1UnBhOWJIZE1jSFhJT0NsQTdhUFduS24rUWNOUDhhdVR3NGw0?=
 =?utf-8?B?emxUM0cvb0ZyL0p3RnN2MnJTWGtxZnlVTHJheTQxYTg1OEFQMTBlWit0MHJ3?=
 =?utf-8?B?MStmM0hhSHVpMFp3ckMxazMzUFhHazdHVGVaUkxYSXM0b3lZbG9MT0pQK0li?=
 =?utf-8?B?YlM0ZkEySjU4YnRtYXF4UU56QkNnYXQ3eWNGZTBHb1ZzYVJvU0djWFRFbnFC?=
 =?utf-8?B?OW9BREF5Mm1CNzhrYXhYb0Fra2NNejBVZ2xFK1pVSlV0SnNQVVlPWWVJcW9B?=
 =?utf-8?B?RElqQ3EybnB3WGhMTkQ3VDlzZWt3SURaVkRNLzJHWmhxQ3lGd3EyZTBpajVR?=
 =?utf-8?B?S1NJZjNhdWljdWJMTDYyZzRJZ0lyb1BkdWFjWnc5S3lzLzVnbXdyY3owd0dH?=
 =?utf-8?B?QzkwcUNrVGkzeS92aFNNaVhKR1hKODhubkltQ1A1dTVUMkd3N3dFRnhKWDRZ?=
 =?utf-8?B?cHBGUkJvaHVkYk44OS84M1ZQVllsS3ZuZTVCYTl2elpyL0l2THZZdGVLeEFB?=
 =?utf-8?B?YXZ3WU5qNlJJNCsrTHdHcWdla2ZsdUlGMUs5MjVIQ0RSdTFHcUk2QkhwUFNq?=
 =?utf-8?B?SVZQaDVwT0trYU5VOG45TEpuODJUSi9EY25WeVlHTjZzRnI3OGlTU1NOTnRW?=
 =?utf-8?B?REFDc2U2bndZZVcyNUlacW5XMlk3dDlQVkJUUGwyaVVmL1hNcDdaeW1PRkl5?=
 =?utf-8?B?RythbCtZaHlCSWpLc3NydTB6dXd1cmtKc0hMZUFVQVFEZ1ltN3diU01lVE9t?=
 =?utf-8?B?VVg4T3NjcldGMjFSZlpUQkNYa3NzZ252MnVHUzdPSUZPckthSE92WW1Xbnl1?=
 =?utf-8?B?Y1RFQ3lJK3NiblpjczhWYjFBQklNTGhUeWRLTWJsU2pxV3VYQkhmbkJ5d1hF?=
 =?utf-8?B?cmZoM2pvVUxydEJRbGlzTW9MRlZIL3BhS2pHVUhHejArVHBwYkE3WXlDNjhD?=
 =?utf-8?B?b0tqVTRJWmRqTzIxbVJIVnI1WnhTdHY0dVk1Ym1jK1AvT2dEaE1CNGNsUnVl?=
 =?utf-8?B?MzVjSTRVL2Q2dFJLWUtHeHczQVFwTGlPM3FHYmZPSEdKTzRvVlZWaHBSZTVa?=
 =?utf-8?B?QVhYblAyNFpZSW5jUjcwQXVCRjFXT2wrdU1IeUpQYURjeDAyN091VldDSzhO?=
 =?utf-8?B?ZkxrUE1qVjdKSlp6YzJ0cjVJSUxvOVFWQzJ1cEZ5bHpTb05renJBenYzMFR5?=
 =?utf-8?B?c3NKcEljOHRFSGl5dVh5OFo5SS9ESkhEMWNPQ2NTL1VRdlNQQXYrOWx2VzFR?=
 =?utf-8?B?Wm9iK3I5Vmk5cHFpeDZacys0RVZqTmJ3Sms2U29yRXN6TWV5Q0F0QWFqUitB?=
 =?utf-8?B?d2RwRTZObk92bXFMMGdtTEZmTkZWMnQrWWdxSmsyOGpPMm5ZcHgvRHRJUElB?=
 =?utf-8?B?QUxIOFp0NHZuWG44Nmh2YUNyVDZZL1NyZkZ5WlBPTkdydi9ocEZIK2ppdS9Z?=
 =?utf-8?B?UWQ0dWNwd1VCeUpaZCtQSzZHeUVGZDE0K1M2SCtqTyttY2ZPaHNualpTYlk1?=
 =?utf-8?B?VGVydGhveGNHazJmVFc4Q0ZnWGE0SDVmM25CMnRIcUxWSVJFTTdHN3Ztd3Nl?=
 =?utf-8?B?TXUyVUlMSTVhS0lsQzh5LzVxb0lnWVRkUHJQeFNRKzVHL2o0T0EvaVdFaG13?=
 =?utf-8?B?Q2YvL3U3cmRNNmZ4aW9MSmx5UVBxQTR6NVZVWjVtb0t2dmltaUo3clRCWW9F?=
 =?utf-8?B?NXJydXN2TFhYWkh6U2ZJMytDQlJRRVBYWlFFTlgxeXR3WlVLZWlSYzJjR0VE?=
 =?utf-8?B?NWhFWHdTRXpOSTVWTkNicTFHYURCdXNTNno2YmRNMG1pZmp6RWYzUmcvZkNj?=
 =?utf-8?B?UEZubXBDSDZaRGlIa25Sc1RKd3lVRG5VZGdYejFLQkl3ZGx5bUpaNmpzN1FP?=
 =?utf-8?B?dElNampXeEZXdVFwNXBkbTM5eVBJSnFYZFZOUWFWakdiMHN6QjlvTitzNWhE?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD8E5D579FC0FF4796792FF86D7606C9@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b072f9-e053-4557-43db-08dc960d5167
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2024 18:25:12.4049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L5rBvhoA8r5a8quhtJmoRInHf4mKWJT4uJNnmlrB/p5FoeDy7k40dJm9G2GZcKCKFyFhwErslHFNQshRcq7B0hEQZuRWUYpXeJbBg+5Cy/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB6499
X-Proofpoint-ORIG-GUID: _kdLy6sXQiokY0NGjcoXx70a1HartZnA
X-Proofpoint-GUID: _kdLy6sXQiokY0NGjcoXx70a1HartZnA
X-Proofpoint-Spam-Reason: safe

DQo+IE9uIEp1biAyNiwgMjAyNCwgYXQgMTowOeKAr1BNLCBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBKdW4gMDUsIDIwMjQgYXQgMDE6NTI6NDlQ
TSArMDAwMCwgSmFtZXMgT2dsZXRyZWUgd3JvdGU6DQo+PiBJbnRyb2R1Y2Ugc3VwcG9ydCBmb3Ig
Q2lycnVzIExvZ2ljIERldmljZSBDUzQwTDUwOiBhDQo+PiBoYXB0aWMgZHJpdmVyIHdpdGggd2F2
ZWZvcm0gbWVtb3J5LCBpbnRlZ3JhdGVkIERTUCwNCj4+IGFuZCBjbG9zZWQtbG9vcCBhbGdvcml0
aG1zLg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4N
Cg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3IgdGhlIHJldmlldy4NCg0KSSBiZWxpZXZlIEkgbmVl
ZCB5b3VyIEFjayBvbiBwYXRjaCAxLzUgb2YgdGhpcyBzZXJpZXMgYXMgd2VsbDoNCg0KaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW5wdXQvMjAyNDA2MjAxNjE3NDUuMjMxMjM1OS0yLWpv
Z2xldHJlQG9wZW5zb3VyY2UuY2lycnVzLmNvbS8NCg0KQmVzdCwNCkphbWVz

