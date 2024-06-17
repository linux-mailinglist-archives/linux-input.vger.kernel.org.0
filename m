Return-Path: <linux-input+bounces-4395-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6965C90B487
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 17:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E08F61F29BF6
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 15:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03ACF1474BD;
	Mon, 17 Jun 2024 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="G/W8Zwu3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bMvzo9ID"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938B13FD8D;
	Mon, 17 Jun 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636925; cv=fail; b=BSA6wLF0AN8kk9yT7ChfOJkPm2vtQzKcaTwxwZeqeFKvReNw6FVvQd0nEyLX/9qt8fSggRRWI7edMiILzbb3zWccRyJzFsGX/NStnoimYCfLCKzl8wji0SdVijuD1n2f8Xu98/6au/Yywm5PDgzrU6M5XQw4D3CgBnmsi2q9HQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636925; c=relaxed/simple;
	bh=zqdvLaPVxK2hkU5xH71I3Jtl96+m6maZbvB97DUDtzY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MbPntRCEt8f+BTRmp0EnzJr9T4SC4JByLf2tOlcd4NOGRPf3UZNfUI/JdoJYMzz+6+/QtCdviNT9ix+7xM53WsvQfweOeLbUeFo/nhWOF6JvWcBz6mNDceVgMBiQVqJvzYBC9IPmpjePAon0V26E7lcom80BTMB0Ll6r8IYGYeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=G/W8Zwu3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bMvzo9ID; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H5Q2pe001972;
	Mon, 17 Jun 2024 10:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=zqdvLaPVxK2hkU5xH71I3Jtl96+m6maZbvB97DUDtzY=; b=
	G/W8Zwu3x+XSEXTSH6EvsWPf2CGsz0RPzNU4DAJnM4WlAWvxOf8k1JqxZs63NaqQ
	d75xzElkEm41Jk/WJYpRXTCvh6DNsn7JmCw6SvaqvV6F+oQPjWFFw200/+KG6j0w
	BC9+YNx8rVLBs1wz4NLMB8rRlzjB6hNHGJpjtGZRWLPqZTHGHGOHxaDZXjAWy0Ug
	UUt8qtYUSYbXFBnua7NgcBUN9zbcMcfALRt/OomfIi9tOuEnMuHVChzCm1jyWb4/
	nEtq3gLQH6EWoYjmi1nJ4tlVIjFGRIKfuHZtRmJdyh8C78L4Rrk90+P4adiMdpDM
	MWNnU4tKnqONuYqEqGSDjQ==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cjsyax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 10:08:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n1xqpReMeLNAVuHpiLYFokOSmaCK0qnrFrzc7oS+nlrOPzTeJbWFaImkU3fGQSp3T80RLeRmvTLo7QEFUNqPPJX6SBV02Mln/vacFmTuNn5ojtFv6ghimpFKTzCj4HRrkO1AG8odmkeBfFrXRX0yRJocYC4b72B1j3pqCqb48eq6gPY0jCEFjRE+DGjfqsrSThPIzJdY4kNwa1cQDM0XhKnMoY5eWszt7Xt7NfrkcqkW2TwJwffCFxdmP1XNR9rTX1mUETIQ5yLQITc/At7wVw/wx9kPxbWXT8s4Q16udOEomOwE7aXSma9raENM/MI3M+37soW+A6wqYce08DYTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqdvLaPVxK2hkU5xH71I3Jtl96+m6maZbvB97DUDtzY=;
 b=kVGbe/4ax+UIv8dFdE5G7L9yME86neEV0OeEK5P2pKar6zLtRdY8pYFN8cHwKSDRFk+KoNmRq3Bb5Vazc3hfhsv8/zI58SwXOVlgDYLqX7w7vPN8LUhV36kquBCQE/X04HP6i97mqWQVEI28huJo0Br3/Q9eprpphRurZKKodGQB11oTqtJiIFimT+RhkWDPMpgryubv534969kPjBynlgw1PYJOAPvEmUYe8RB0r54PMCVZ/pFbbeRb83O1i5wwqDB7owHznBshN4WGolafo1kB2loMITCcT1tndk+PIo5h0z/MNfhVXfp/RTmkX47Ipp0NsmqBvGe6+YgUxHviig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqdvLaPVxK2hkU5xH71I3Jtl96+m6maZbvB97DUDtzY=;
 b=bMvzo9IDh3OPdVKLyzDvR4C0elMT6nKplWOA4g1F9CbtTbCXYPm8OuBRI1oUBKTl91ymYV+yBh3dF0cc9FQ2iznFlHnjvrwEuhasFP7qKBu4El6/dH8jxV22EhqtYjeDOwGeSdY6+uYn4nVBpWUvvVGQCo+S4FV0OcYbYYHfvk0=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 BL3PR19MB5321.namprd19.prod.outlook.com (2603:10b6:208:344::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Mon, 17 Jun
 2024 15:06:49 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 15:06:48 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Mark Brown
	<broonie@kernel.org>, Jeff LaBundy <jeff@labundy.com>,
        "open list:CIRRUS
 LOGIC HAPTIC DRIVERS" <patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v11 1/5] firmware: cs_dsp: Add write sequence interface
Thread-Topic: [PATCH v11 1/5] firmware: cs_dsp: Add write sequence interface
Thread-Index: AQHat0+xyvG+XgwV10OKcQbbhj90iLHBIksAgAr+9IA=
Date: Mon, 17 Jun 2024 15:06:45 +0000
Message-ID: <3D7E2D46-8BE7-4657-A44C-4EC882B8E70E@cirrus.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-2-jogletre@opensource.cirrus.com>
 <ZmcXnL3xQ0IyJ6TF@opensource.cirrus.com>
In-Reply-To: <ZmcXnL3xQ0IyJ6TF@opensource.cirrus.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|BL3PR19MB5321:EE_
x-ms-office365-filtering-correlation-id: 0e94c1a9-2e02-482b-8fc3-08dc8edf1aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|366013|7416011|376011|1800799021|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?U3FHVGwzQ0pYNWRVM0huZzhnMG51SWhzZE5lazVKSVZqa2RadVg0OWswVW5m?=
 =?utf-8?B?dU5IVFlTbDZXU0l5bXFEUzNoVXYzM2Mra1J5eUZnZ29nSkhJY0t6cDZaWWFV?=
 =?utf-8?B?LzJKdnIxTzFNcVRqR2dBVDBraUE0elliTjhzNFdGYXArTjJWMWtDdmxCNGd1?=
 =?utf-8?B?UUw1ekFiZXJWMnJwVTRvb2RrNVFCS0pYYndtTDFCS1B0aEtKVUlXV1pLdGdB?=
 =?utf-8?B?bmcvU1ZFdk1YbEljS3A3cE52VEg5QkRDcUZXNXNpY2xPcGFBYVNOU2VEZG4y?=
 =?utf-8?B?ZEhBMS9mNGZLb2NpdVpPOGdKRzc0bm1xUnZURzIyMlJsZmZkaWs1YXh1ZVFq?=
 =?utf-8?B?ZFNLZWZDLzlxblUvTjRVTjVEYThPeWp0WWtnTlVja0ovWUlYSHQ3cjdKejRK?=
 =?utf-8?B?ZzZTOUFwMVdoTlpKOHVUSVdjbUpyZGtoMXBQajFEcStBdGYyMmVFVzlKbjFj?=
 =?utf-8?B?UlJheUVlWmlmSnVLd3JscUpUYjk5Yk83eEs3OVhDT2ExV1Q4YWNPVGhOeG9p?=
 =?utf-8?B?dDhNUGVFaVpmUFc0VHV6d0kvTDBhdS9lcVlwcERDelZlcFRnVzlZZGtXUVZD?=
 =?utf-8?B?Zi9VU0EyVVFZYmFkbkFVclAybHJSSW1LUU96TmViMSs2eDB4ZVhYYWlNTVNu?=
 =?utf-8?B?alRuR1lNTXRHNGdsb1RlNWZabVhkNEJXcG9pOUgxZXN6bXUrSFd2aFlHM1FC?=
 =?utf-8?B?Z2FSQ0xhbGptZFNnc3Bja241MHM1d2g1VVVyODFEdWxGOEtlSUNPWTlXZ3Fl?=
 =?utf-8?B?cWFkOUdYSHlrMHNOQ2hlamFtRGF2bjhKaTg5UUxtd29PakZqK2xNL2dWY2pj?=
 =?utf-8?B?TEFWV0xMclhNcUdzK1k0LzFKZ1EwQjVsSFoxUW1YdFpnYnBMR2xBengxOHlZ?=
 =?utf-8?B?L1NQTFI4cncyc0pXUmVhMG5JUDVSbk1GUld1a0xzZHRLWk10cS9xMDJzMTQ5?=
 =?utf-8?B?dngxRTNMS0VURjBlbnNxTDZKU2kvNUhPZUVqNTRVejROQk42aU5QRHZUK3pV?=
 =?utf-8?B?TTM2L0tLTUhFNk9yaUtsbThEWDl6eW9rOGJoaG1LKzdXS0RMODFkaFM1QjhH?=
 =?utf-8?B?WjBTWWIxWjlETFJ1RVd6QjNPSE9yQm9KZDFXejcvcGVqVUZwQmE3NjlXSHY2?=
 =?utf-8?B?RGRobWFyeERaUS9YN0VIVlQ0TmU0STZUcnRoY203Q0JlallOSU9HdE10YnJ4?=
 =?utf-8?B?MU1ITEZ6SXhDVGJDcm1PRmFGZW93MTlaYUVNdlE1UW9HRFlsdHFXU2hIR3JF?=
 =?utf-8?B?czZLUEhuQ3paZUhNUWpyd2t0dURvS3FpcUoyZlNwRG02TVVyZkxUaDRXN1dR?=
 =?utf-8?B?N1NldU1hdlFPRnI3dXZUUHhDZDNybFl1SXF4WG1tbE9FeGQyS1g0d1c2RW5x?=
 =?utf-8?B?MTBISTdieDV2UkoyaExHbW91d3dnK3kweHVWOHhnSlFJZlZKaVdGdmdoYnla?=
 =?utf-8?B?dmxpU1J4N0FnRzZOS3MvR1BJR0puUCtXdVc3NkQ4clVWbnBDSlF2OUxkK1V6?=
 =?utf-8?B?cklhbncxUUNUNTBSU2xHT2JHenY5cnVybkRUdDFJcDJ4UzNIKzFwdlZhSnNF?=
 =?utf-8?B?Znp1RGpBSlEzdkQ4QURmMFQ1S3NFS2VwUEozMWVRLzRKK0ZnTkpsdmhod0hD?=
 =?utf-8?B?dG1oNmhmUzJjZ2k1R2ZYTWZ3TEhHSVNRWjVtWkhxUGZ0YkN4S2RoN0V1Y3hV?=
 =?utf-8?B?aStFSVphaDErYXVjcE5mUWFVT2s3dFRjQnhGV21NdURKMW4wejlYZ0dpL2I0?=
 =?utf-8?B?NnhsNEQ3dG5pQyt4ckJmY0lhNjJJUWNMdWxQYWwvUzJIVlFnR25nUWlFOWZ6?=
 =?utf-8?Q?a7ExssIsbVrkfuPgcYPR2/sm3FU4hfZAzAFSI=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(7416011)(376011)(1800799021)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VnAyVkt6SkYvbHlFbWZsUjg4dU1qSGprSEpzQ3VIN3B5Ym1QTjBoOVVpdEcx?=
 =?utf-8?B?MUcvQi9LTDdqeHBoL1NpVVczQmVxMHdXUHdIbEl0dktQK1JHVGJzZFJDdmFU?=
 =?utf-8?B?U0Q0M2g4STRvbU1Rd1hYVHIvOG1JU1dxTjR1SC81KzZlSUNvS2xkMDlLTHoy?=
 =?utf-8?B?Z0t0MlFjUStZSWM3VFlQMTB3bVNHS2tHRjFGWG5sUkZNWmRiUERPVzhhSmRm?=
 =?utf-8?B?NFIvTDh4ZjVDdm9ZazM0aFRxUTVPZWxROFg1K2hIc0hxY1JDM3kxUEJRc0tY?=
 =?utf-8?B?ME8zYTZDNmRlUWd3MmdXelBMbXNYWmZOOWZjejVxR2dhOTZRQ2lUZUd5TTNj?=
 =?utf-8?B?bElDREs0aUNtQ3BmQjU3dHRuVjdPTFRBVldLejJGSkRHUXZnY0R4Mi9MRXdO?=
 =?utf-8?B?T3QrYjRadHNYTjBDU0xhVFFjeTcyM2NaUTZFSDR6N250UWd6TzNsVjRFV2ZK?=
 =?utf-8?B?R3RGN1ZRQm1VSDFxUElQY2srVGJaT0lsUkt1ZHd4ckh1anA1WlZlRDh0b2Za?=
 =?utf-8?B?UWtxdDdPZ3hOSVVmT21oMGVKSE52QkxjakJFOExDTlNJQi9XeDZoVlhpVTNU?=
 =?utf-8?B?OW84aW9ZRGFmMzZudGFxTXA2LzQ5Z2YrMGZjYS9VdHlrbERsalpLSUpBNkxx?=
 =?utf-8?B?bzRsbVV2RTU4WHBLR3ZQZ3B6OURETEZrN2E5d1ByUHlCcGFzeEpoZmdhWnpE?=
 =?utf-8?B?NkVwcnIzRVVuVFBDVEJXNTVJbHhMd0p3U1hwQUUvNG00dnd4VlZvK3dDQ0xo?=
 =?utf-8?B?ZE50ZnkwZ2pCQ0NsQno1VDhnc1AvMXA0VlBaRDlnblp1amVpWVoyenNJWHFF?=
 =?utf-8?B?bksxczJZS2ExMmo3c0JHaktVeFJTWHFkaXRLNk1qMjh4LzZMK1BsNUJSR1hE?=
 =?utf-8?B?T1NNRnppeGRTZHQrbld3ZHhDaGFJaU9xb1NQb05uQ2dUUG4yZk54Y0pZQXpq?=
 =?utf-8?B?WUJHREN5b08wb0tScHJoOEhtdzQxa0kxMFZON2xFWlczbE8zdXlxOVZ3Umx6?=
 =?utf-8?B?d3dXWDBLOHJocGQ5b0FxOVg2VWF4WWZ5SzBIY3Y5RDBjNEFXQWJiaFpsNkxT?=
 =?utf-8?B?L3ZwcDNITnVkVW05NGQwMXlQNGVDWmpzQ09xSytUcWc2VGtjSEYyM2RzRGlv?=
 =?utf-8?B?bFA1UUZ4RjhSUlpRWk5pNXJHWkhnY3FJeXpXTXF3eFAxMk42cG9BRkhQemNi?=
 =?utf-8?B?cFNpd0RIRE5MK0xUY0d0cFFnTVN4d3F3eHNxaTkwMmlGZGVMSWRLbWFTYlVt?=
 =?utf-8?B?VFA4Yjhsam5CbnR5SlluQVgycSt0RmVFbyt5RmE3aGtCUWRpcHBJbnZpcEdR?=
 =?utf-8?B?RjYxK3VrME9vU3lqSnB4ZGtQYWgvNm1HNU0zVUEzTy82MTF1d3V4c3p2cjRz?=
 =?utf-8?B?dTA3dW9VNUpFQk9qeGZ6KzJmN1B1dGU4c2RYN3BoMU9BZDl1emN2bFJ5emt4?=
 =?utf-8?B?U3cwRWREcXh2VTJuUWpXWmV6ZSs5ZlREN1hTdHFBT3BlQ1JxcnA0V2JFSzNT?=
 =?utf-8?B?eHFkUml2Tk1PeGJMSEloUm1ZdlpGY3FENFkydXoyVXNMUVg5Q05tbUZmSlJp?=
 =?utf-8?B?ckZSaTQvM0k3eFlDNHpYTWQxalkyeCt1cHFKV3hKN2tSekpPdDFaVEFpNk5X?=
 =?utf-8?B?OWFNNTRFTTB6TXpnalNzMFV4YUZjdFVPcUhxNUdDLysrakhjRGJkWEJMMWg3?=
 =?utf-8?B?LzdJY3VmelpQcmsrRWdnYTdDcWRqbUQyNEh3S3ZUZStKOUFSNFd2ZDY5WFd2?=
 =?utf-8?B?cUdobkJaTStmTWQ0bjVNN21VT3ZCUlgzazNRTThUYWFzSTlGV3hGUWUrQTZC?=
 =?utf-8?B?M3k1WFp3MXZJME9oY2cwWlRWWDhVLzMyUFc1NHlMa0NEd3J4aS9nbXdhM3pN?=
 =?utf-8?B?aWcxQWM5NzBycS9pYXhqU2RKc0crMFVJRGdKbVZjaWpvOS9ma3F6dlR4ZUVL?=
 =?utf-8?B?ZmloendZT2xmNTRQNEdDdFdob1BhU01tM1N3ZkFFcnpQWjVtWmROODZUcCtX?=
 =?utf-8?B?dzcySmFMZk9hU2pKVHNBR2czaS9mZEhlam95VEJiY0g0SjNpejE3NHk4QUZi?=
 =?utf-8?B?WkJ5MGd4ZmVGa01OY3R2Sk1OOFhPTDlQTUl2UU5RcEJWTXF1eGNGajdaVUk5?=
 =?utf-8?B?QUVwTlBJZzFBZ3VRZ2ZJd1JtTFNXNWtyRjJISzl3YUJJQTlTL1VlVXlSZ1Fa?=
 =?utf-8?B?Y1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3F5C65FFA56B1D44887D6E59D44E7D3A@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e94c1a9-2e02-482b-8fc3-08dc8edf1aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 15:06:45.4935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1gVQffbYwJfhNmOhY7ggYhoTJpGurQeWA1612/SXd8q/9bHBX+I/JZsZORUnlG40LvsxnaInT+Y0mftMMm/O4J1O9ZBoKw+NL68rnAd4ck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR19MB5321
X-Proofpoint-GUID: d75s4w1HceSJMIWxGQrP-mysFCA-T_yX
X-Proofpoint-ORIG-GUID: d75s4w1HceSJMIWxGQrP-mysFCA-T_yX
X-Proofpoint-Spam-Reason: safe

SGkgQ2hhcmxlcywNCg0KPiBPbiBKdW4gMTAsIDIwMjQsIGF0IDEwOjEx4oCvQU0sIENoYXJsZXMg
S2VlcGF4IDxja2VlcGF4QG9wZW5zb3VyY2UuY2lycnVzLmNvbT4gd3JvdGU6DQo+IA0KPiBPbiBX
ZWQsIEp1biAwNSwgMjAyNCBhdCAwMTo1Mjo0NVBNICswMDAwLCBKYW1lcyBPZ2xldHJlZSB3cm90
ZToNCj4+IEEgd3JpdGUgc2VxdWVuY2UgaXMgYSBzZXF1ZW5jZSBvZiByZWdpc3RlciBhZGRyZXNz
ZXMNCj4+IGFuZCB2YWx1ZXMgZXhlY3V0ZWQgYnkgc29tZSBDaXJydXMgRFNQcyBmb2xsb3dpbmcN
Cj4+IGNlcnRhaW4gcG93ZXIgc3RhdGUgdHJhbnNpdGlvbnMuDQo+PiANCj4+IEFkZCBzdXBwb3J0
IGZvciBDaXJydXMgZHJpdmVycyB0byB1cGRhdGUgb3IgYWRkIHRvIGENCj4+IHdyaXRlIHNlcXVl
bmNlIHByZXNlbnQgaW4gZmlybXdhcmUuDQo+PiANCj4+IFJldmlld2VkLWJ5OiBDaGFybGVzIEtl
ZXBheCA8Y2tlZXBheEBvcGVuc291cmNlLmNpcnJ1cy5jb20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBK
YW1lcyBPZ2xldHJlZSA8am9nbGV0cmVAb3BlbnNvdXJjZS5jaXJydXMuY29tPg0KPj4gLS0tDQo+
IA0KPiBJIHdvdWxkIHN1Z2dlc3Qgd2UganVzdCBhcHBseSB0aGlzIHBhdGNoLCBpdCBpcyB1bmxp
a2VseSB0bw0KPiBjaGFuZ2UgZnJvbSByZXZpZXcgY29tbWVudHMgb24gdGhlIHJlc3Qgb2YgdGhl
IHNlcmllcyBhbmQgY291bGQNCj4gd2VsbCBiZSB1c2VmdWwgdG8gb3RoZXIgcGFydHMgaW4gdGhl
IG1lYW50aW1lLiBJdCB3b3VsZCBhbHNvDQo+IG1lYW4gbGVzcyB0cmFmZmljIGVhY2ggdGltZSB0
aGlzIHNlcmllcyBpcyBzZW50IHVwLg0KPiANCj4gVGhhbmtzLA0KPiBDaGFybGVzDQoNCkFncmVl
ZCB3aXRoIHlvdXIgcG9pbnRzLiBJIGFtIG9rYXkgd2l0aCBhcHBseWluZyB0aGlzIHNlcGFyYXRl
bHkuDQoNCkJlc3QsDQpKYW1lcw==

