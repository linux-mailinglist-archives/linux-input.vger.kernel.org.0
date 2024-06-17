Return-Path: <linux-input+bounces-4394-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B624C90B45E
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 17:31:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2CF21C210AE
	for <lists+linux-input@lfdr.de>; Mon, 17 Jun 2024 15:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995A013AD26;
	Mon, 17 Jun 2024 15:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dw6+QlIu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="eXifqPtM"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAA6139D1C;
	Mon, 17 Jun 2024 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718636806; cv=fail; b=nq8cEvW4xR0mUNWmK5N2zoUz+cOIVboAaO8LnroW28BeJnsbxGp3Y18r6X7u1havM7CQF2Gh7NKUGHJqWis3HO7Cy2kqpoCBgJN3zFZ8ozBz+6XPwNQraym/QtC3F4/s40PdLzifcDcwp3AIiC1PctsxpL98pmu4cajSvgJFoX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718636806; c=relaxed/simple;
	bh=cy2I5daAT5nBFrj4kradJ8OJV16X5dcoVi925FaAioc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c8Se5Yb0gfqV6fB00/N9xqMhU8bpq3gYy0ENY9tVAM2I1BZqdtbzI8OEjn8iiwV8uBLq++JHYUSUBcDCaGUUFOgg5did5mo+Ca1ahMfV0LoS5r/WM2ey4o3bqWC+j9n5E9HRFmzJN+9YzNSO5PckIM77bJojJHpCWF3lpjb+fmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dw6+QlIu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=eXifqPtM; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H4QBaD018099;
	Mon, 17 Jun 2024 10:06:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-id:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cy2I5daAT5nBFrj4kradJ8OJV16X5dcoVi925FaAioc=; b=
	dw6+QlIuPPq0f8wBUN9S+jEdu3JrR/WbouP5t/0Zj9tJcZIy74LiSf5JY2ERYRJE
	BQHdAG9oNHOKIALe+v8thBK5Yd4pQApFIv6cqpKC5v3HV+kG2QyIjZexhUNJl2zq
	1Nq2yvTKDRNfKIR+cOwRtaAefIigRggZkPVpoAxEtsV6AZY9yqjyHmbia4vZmwXJ
	m0lDYVganyWL5FRNcxbCe835d568Ci2mGFxY9Q11i1MT+QMp0ZgFycQfRa2W9WUy
	lNHKs9c2iVnhe5CznFSWjJPsLUmGa0nKkHyE5N+002XVHKM/ZKpvL8mKVxhS9nNe
	5dxAg0wWqobmsZ4b7WXyyw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ys7cjsy7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 10:06:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0TztQItel0vPf623aCz+TnmrG4Q/Nte9fRStDb1p9VWNmz4J79v6FHXG6WXvqcTVRw3ru/Po9u9+vaRU2JtZUeh0fRhgz0ybeC6U2y8uXX8F/arCHJmEhtF4ofEQRQfpIK7AZjANJOoX3sW0uo7n6xO93jm60SmeLmuepu4zjtkN9fYblKTfSQxiAAsAS1Aq5waHNahOeEsyU14nULDgNvXWGvfLujphYYuhZNtBcQtwbuXegQi6kizMZoQSGcHtBLqK2/IeOELjSRSFhRnvHCo5yQ6ekuoF6K5ebX6fsMhPClxAZnSOs2afz1lsn1P7Lh+sxQezVKvFmbPvJNJsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cy2I5daAT5nBFrj4kradJ8OJV16X5dcoVi925FaAioc=;
 b=UXDwKEQQhY6pyGMRQWypcX8iZaw1a2C4H82ZIBjiSlGPJHq0UX0G9ghL0i8yszGGoguQWTOlBpDu9jW5oEWpIPpg5HogYQJQP7Amd6jsB4q5KPxgzS4OWZngDZ2uiD8gbFLCNVBuCbPBq8HQ5Sa4px+EiQvY4cYVEWV6kLkD93mHa+csM6dZPXrHo7yxwfnwwAzKDVD6wWoxjCCKzXQDkT5nGkEcy9FO0NJeYkOmg9ucfa3B1Y9xzoGtrgMVmJ98gcseo7Bitc5ut8tNpNGNnAqA/Yj4nFQKEitPQsOkmk8sB2C/NK+GlJCUBVMLXZXbvfd0FLSPBLHOHP8inSzgJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cy2I5daAT5nBFrj4kradJ8OJV16X5dcoVi925FaAioc=;
 b=eXifqPtMOUiAE+25HQglCRtA+rrMoF8PmaAIcoySUBdu+Yjqt7ruBH5U2xFZMcYHJFGAvBcUNfnWVeJmeuh51J8MG/m9YuDjr9aFOSxyHWRL+Dv8cgLjTUFQmWtfrYgIOyF4HWkCpFqOgS0grrEjv/jn5rF42a+BB3wSgREGJ+g=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 DS7PR19MB6022.namprd19.prod.outlook.com (2603:10b6:8:81::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 15:05:25 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::52e9:bcb8:7cb5:b25e%7]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 15:05:22 +0000
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
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "open list:SOUND - SOC LAYER / DYNAMIC AUDIO
 POWER MANAGEM..." <linux-sound@vger.kernel.org>,
        "open list:INPUT (KEYBOARD,
 MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
        "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v11 3/5] mfd: cs40l50: Add support for CS40L50 core driver
Thread-Topic: [PATCH v11 3/5] mfd: cs40l50: Add support for CS40L50 core
 driver
Thread-Index: AQHat0+y8XI6+qDWmUy/j8NVPNRVkLHG9WoAgAUrbQA=
Date: Mon, 17 Jun 2024 15:05:18 +0000
Message-ID: <9C75EEB1-AD81-4B2A-AFD8-F5E507137EF8@cirrus.com>
References: <20240605135249.361082-1-jogletre@opensource.cirrus.com>
 <20240605135249.361082-4-jogletre@opensource.cirrus.com>
 <20240614080820.GC2561462@google.com>
In-Reply-To: <20240614080820.GC2561462@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|DS7PR19MB6022:EE_
x-ms-office365-filtering-correlation-id: 7798825c-4bc0-4cdd-a7ba-08dc8edee712
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|376011|7416011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?QkxhUzVmUXNHQWJYc29aaDNuQ1JWYXp0dnFFNVV0VFh1RktCNVFLZGlVdDFI?=
 =?utf-8?B?ZklTN2FNc3JQelRlZUZmc1o2SWhLaS8vRmpRQmV5aFdrUDRiU3NVUkxuR29q?=
 =?utf-8?B?NEZZR29zMFhhV2ZCNlZ2QTBQMlVvUEpTemRXdmFFSmgwekhCdlV6MVMrT0pL?=
 =?utf-8?B?STg2Z3VxL056MG5jZEtyNUdnUTZCQ2dHd2wwU0g4dUM1NWpWYjZOSWJCditZ?=
 =?utf-8?B?Ti9NZytIMDVINmtpVkNxaG1odFc2WjlRTEJvQm5ZQ1o1T2gwbE9VZGVSdVdY?=
 =?utf-8?B?OXlmUmEzQ3lMYmlhNXVzdWhXYUdmMXRjWmppMXRlUXJmazEwcnJSbkZ6cldK?=
 =?utf-8?B?ckhkbHpCYStKUUVyYmhVMHExazlHZ1paTXprQ2pqbFV1WWhEa3hRa2VJYzBL?=
 =?utf-8?B?RVFTUWh6L0g3UFBwR2o2cnJ3KzlodnliZVJxblVMQ3ZQNnExVm1qLzFyMHQw?=
 =?utf-8?B?aUFTcGVlaFVMOTRLWWVVZ1pheWZldG1vc1NMTFQrbnlQRC9RbmR1Q2dCVjBw?=
 =?utf-8?B?RFVZNDFsdFgrcWNjNCtyS003TzBSallLWXI0VFcwcS81S1FhRU9ieFpZT2g5?=
 =?utf-8?B?NDFFM3NYQzVGNk9uRlBrZzYzV0RvaENUYnVvamNTYzRMU1NkaHpONGszM0JW?=
 =?utf-8?B?dkdlSi9keUwvL3M3UXIwb25iM2FrbkI1V0VXZ2ViUGlNMGFIaEFyZzE5ZjFD?=
 =?utf-8?B?OWZnRU43TTRMR1JjOFR6Nnh2V3lWcnlpUmhoWWxNOUJLeThVNjcyRG1RTUZS?=
 =?utf-8?B?MDMwaUM0WEUrVElZVEd4eW1RR2F3Qjd5NWRodlFIK2MzZzl2bm1BcjU4c0R0?=
 =?utf-8?B?L3lFUHBIR3NQMjVtditFMThYcVN2b2xTUnJlbmdxNXhyTjFYK2lRVGVRTVMy?=
 =?utf-8?B?bU0rS3prUm5tTXhkUWdDbG5BUnpKUkZ5ZXczMFRsY1Y3UXNYTXZNeFVqOU1G?=
 =?utf-8?B?NFloY1ZLd0kwVDVuTlpkZ2Y2WWVSQi9YMjRQeGM0VUtFeHpSTlhSL0x0UGND?=
 =?utf-8?B?aWZYcVdFUks3R09hdjFtcWRreVYzNG5LcTNxL0NXM2IvaFI3TXhMZWtnZERY?=
 =?utf-8?B?Y1VhTDRzcnM1V0VncmZodm15TWZIdmVFbm8rUitHbGIvZVVvT1piUERaalhr?=
 =?utf-8?B?UGZUR29BL0x0clNReUhRTVJ4QWw0RXpWZXRYM0hZUjl0L2ZWWTdOcy9JWjk0?=
 =?utf-8?B?VUdySTRaZUtidzR4a3lidEtqS0plTnRKd3dTY1RTVTRoNXcySGtDWXdYS3R2?=
 =?utf-8?B?bGRnNjYzT2VhS2RvUWplNllueDRMZ0RsRkhSOXpPeGRTWWNrYm52NkE1bC9n?=
 =?utf-8?B?QmFVSnBTTzk5aWN2elBWcnM5ZFZKTmZMNVJVNkNtdG82VVQ4R1kyNksxZUpy?=
 =?utf-8?B?TmRhREJJVmxDaHo4SFhnSHBRRHprVzZwMU1jYW1Bc0JwdG96TkFzZHI4RjNS?=
 =?utf-8?B?TXljM1FmN0JBQzJFaHZiWkhQUFRpZnMxVmZaRzk5S1ZYNCtzNGw1c3FoeUxL?=
 =?utf-8?B?WVczMS9URU1obHBoajdub1dobVl4TFdaWjd1MTd1c05NU2V6UFdiL1ZVVmRk?=
 =?utf-8?B?d05vSnAvdkg5TVBBbm84dS9nMGFPWkM4MjV2bUNqZkpEQnpQYVBCTDNHOGNr?=
 =?utf-8?B?OEVQbG1sWE1PaERQTjhrd3Rwcjc3WlFiRzBzNk5kV1dqY2pITlFrQjlSd2VJ?=
 =?utf-8?B?QzlVbCtFM0loK1NScFhJMnRDTE5WQlFzNlJVQjBCekYrVldOM1kwbG54Y0pI?=
 =?utf-8?B?MkwxVVFjQlNMMkJRb0lnSG85NzgzVFdwOFYybjRkb3kzK0VsOUgzZ3N1QW5N?=
 =?utf-8?Q?ZYkantzIQZEYMnycKUzGFSABYG/jDAUzwcTeE=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(7416011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QmhTcmRZSHVCYzlraTdjOHJzTkp0TGVZalBoVkVFdkhHSkR5NDdVbGNoZndS?=
 =?utf-8?B?RjNPNlgzeXdXNTNFWmJ2dGEyZENHZ1VlOFBWV05rZEFrejlaYUF0TDVISFdw?=
 =?utf-8?B?RnMrWmtyUG05MDdRUGp1Ynk2Mk1KZEVpSzY3dXo2cUlrZms3bEF4WXY0TWt2?=
 =?utf-8?B?OUdJNmwvN0hPeDZVV2p3SmdLTm8vMXpkeEpYQk5kME96UERSN2d1L05HVTha?=
 =?utf-8?B?Wms4NUJHRXJodnJxa3d4MGt1MktTNjVseU80V0ZzMFZkLzBJMkhlZGhqSUti?=
 =?utf-8?B?amYvYlVsYUMyampRWkZnYWZycjh5SGpGLytJR09WV3U0MndKMUQ4Z2s4UHgv?=
 =?utf-8?B?dG4xUkRwdXBQZlVYL3VBb292aHlScVVwWUJ3YjhjUzFucDhVWTBMMFdKWVp4?=
 =?utf-8?B?enowdXB4b1dhZmpoNi9uTzEvTjNCL3QvUm1OUlYzamFhUWdGQWx3d1BRSGU1?=
 =?utf-8?B?aG9VVy9kaEJIaFo0cW9EUHYySVZ0dnhlUFVqYk9zNHJ0VFByVnpsa3JJMXRi?=
 =?utf-8?B?Z21vS1hCbE9hUVliZWNSTld2VjR6V2l0NGd5Q0UvQnNNZU13WlF3L2dtSzAr?=
 =?utf-8?B?eFJWZ1Npd25OSzhSVzFmaytMR1l0VUFhTUgzNHBGQndvaWwvczJxVGNQaXdO?=
 =?utf-8?B?NjJJRnJIZjJTU1pXajlMd2dvRnRhQ1huSktDY1lnbVlDQzF6S3kydklwNndV?=
 =?utf-8?B?OHFpZlAxT1JqSFhqeEVSTFk1MWhSME0rUW0vS1B3ZG05QzluWTk2OWNTZ3hD?=
 =?utf-8?B?OS9WSGJ0djRUbTN4bGk5N1dlN2FxNVAwWDh5Z3BuaGl4MHRlUFhZSjhjcHc4?=
 =?utf-8?B?T3pPWXNVWURuSkVoOXhiRVJFQm5ZdG9pTks1Z3NBUit2b2hZajRsaHAxdTBD?=
 =?utf-8?B?VW80WTkxdEhKc3JRQ1VyWU13QXlzVkkybjFKalMyeXp2VDVqYWszQ3B5QWRa?=
 =?utf-8?B?RUkvWDJDUXBqMU5LOWQ1TVRiaDJMV1RaWUdJSkI5VEhXOHVZVC95YjU3V2oz?=
 =?utf-8?B?YStqOXNiajZjZUllNUlwcWtVNTRFbWw1WmJXWURVSUdORTM1NUZqM2xqMWY5?=
 =?utf-8?B?QjNYY2VLUG8yS2d4VlZRakdvOWFFb2x4TlVKWWdqK09SMUpqYnBmVFZ5Q29j?=
 =?utf-8?B?Y2tvNGtxSllhRlkwZG9WM3B6L2RzWERvcTBWb0FyTUEybENQbTR5bi9HTmJw?=
 =?utf-8?B?aDM0YmNpS21teDZyQlo4L2tEdDZTV2l2R3ZtQ2YybXNIRm8xUWNCdzVuMHI2?=
 =?utf-8?B?bmlta3RScFNPWUgzKzRHM09qamc1cTZKa0Z5K3R2cHVRVEx2Umw0UlF0V3c2?=
 =?utf-8?B?V2h2c3g1WDZ0ZW9oNUhCZnNhV0xqM0pZeEQzWFptWmtqelVkK2cwQTZYYWpu?=
 =?utf-8?B?QU94VHF0VkFxd1ZMZ2pUL0hnaU1mc09PVFBldi9iaUZuMDRpbEt6THRCeUc5?=
 =?utf-8?B?TDUyanNSTmp3NlIveGVSTGd0NmkzNjRoaEpVMUMvK2xDVVBIeHJtT0p6K3Qy?=
 =?utf-8?B?MGlmZUZlM0ZOUnBpM2VJeUE4ZGVuWEREZGVUZjhaUHh3ckthMHBmSVQ2K0U3?=
 =?utf-8?B?NE81MlAzQnNsSk5BVkZqbmxtUWJBMVE2eTJubEdRYUFwR3BLU1ZTYnVYNm9z?=
 =?utf-8?B?NVVpaTQrdE93Wi82dVRVZ0xwTVNZb2ZvNnFmQUJ1YVZqeTh2Wnh5Z0lIeG5j?=
 =?utf-8?B?MW1mRC9pMCsvZjB0QUltbXZYaEFRSFhpWEZJVjIxRFFJN3ZoYzVQY08vUWVB?=
 =?utf-8?B?NDE4Rm9oR29TWDBSbEtaQmtEcXJWNU1FaURaaGxzOVBEcll1WXJ0REpzbDly?=
 =?utf-8?B?NldhYlNRT0VENHlqU0ZrMlF3STBKV05CcTJaSHd0SUpmVmo1TkxoVC9wY2NX?=
 =?utf-8?B?NDVTUnBqTmRZakt1enRLeUxrVUlSMnh2VkdGa096MEVVRDJ1aFZOV3d5WDRv?=
 =?utf-8?B?TWJ6RVg3YVZqNW1oRFd0UlgwbEp1SkIwZ08rdEZyRDQ1cmcyNTBPSU9SZVNF?=
 =?utf-8?B?MllCdmxxZ1lUd2JvVWlSWE9BbEJGS1lYMEgxUVN4ckcwWmZTZ1NxaGM0NTJp?=
 =?utf-8?B?bVJpUVhpOTg1WWtqb2V1UXdMYUJIN1V0aHBmZ0t1UHpEUnNtV0xZZ20wdlYr?=
 =?utf-8?B?ZVNVb05oK0U5K1NWZUl2dVlhbFFhOE1CaXpHZ041WU5RRDlCQzdUUHJ3YVF3?=
 =?utf-8?B?OUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFD740145346304F956B764FAFAE31F9@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7798825c-4bc0-4cdd-a7ba-08dc8edee712
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 15:05:18.9562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpS5/7jdLHSHfA8GdL4bWB6ga7btf2odHhzkXBTCEuhrnLuDmiH64re0jt1lRMOKJ6QwtKWM/xSz5T9sJa+B6J1tpac8j4HbIZc4xm9G9u8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6022
X-Proofpoint-GUID: ODpfC0st_7e0xymzbnTRUvm22HN8YYSW
X-Proofpoint-ORIG-GUID: ODpfC0st_7e0xymzbnTRUvm22HN8YYSW
X-Proofpoint-Spam-Reason: safe

DQoNCj4gT24gSnVuIDE0LCAyMDI0LCBhdCAzOjA44oCvQU0sIExlZSBKb25lcyA8bGVlQGtlcm5l
bC5vcmc+IHdyb3RlOg0KPiANCj4gT24gV2VkLCAwNSBKdW4gMjAyNCwgSmFtZXMgT2dsZXRyZWUg
d3JvdGU6DQo+IA0KPj4gSW50cm9kdWNlIHN1cHBvcnQgZm9yIENpcnJ1cyBMb2dpYyBEZXZpY2Ug
Q1M0MEw1MDogYQ0KPj4gaGFwdGljIGRyaXZlciB3aXRoIHdhdmVmb3JtIG1lbW9yeSwgaW50ZWdy
YXRlZCBEU1AsDQo+PiBhbmQgY2xvc2VkLWxvb3AgYWxnb3JpdGhtcy4NCj4+IA0KPj4gVGhlIE1G
RCBjb21wb25lbnQgcmVnaXN0ZXJzIGFuZCBpbml0aWFsaXplcyB0aGUgZGV2aWNlLg0KPj4gDQo+
PiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBPZ2xldHJlZSA8am9nbGV0cmVAb3BlbnNvdXJjZS5jaXJy
dXMuY29tPg0KPj4gLS0tDQo+PiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgfCAgIDIgKw0K
Pj4gZHJpdmVycy9tZmQvS2NvbmZpZyAgICAgICAgIHwgIDMwICsrDQo+PiBkcml2ZXJzL21mZC9N
YWtlZmlsZSAgICAgICAgfCAgIDQgKw0KPj4gZHJpdmVycy9tZmQvY3M0MGw1MC1jb3JlLmMgIHwg
NTcwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gZHJpdmVycy9tZmQv
Y3M0MGw1MC1pMmMuYyAgIHwgIDY4ICsrKysrDQo+PiBkcml2ZXJzL21mZC9jczQwbDUwLXNwaS5j
ICAgfCAgNjggKysrKysNCj4+IGluY2x1ZGUvbGludXgvbWZkL2NzNDBsNTAuaCB8IDEzNyArKysr
KysrKysNCj4+IDcgZmlsZXMgY2hhbmdlZCwgODc5IGluc2VydGlvbnMoKykNCj4+IGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21mZC9jczQwbDUwLWNvcmUuYw0KPj4gY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbWZkL2NzNDBsNTAtaTJjLmMNCj4+IGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21mZC9jczQwbDUwLXNwaS5jDQo+PiBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51
eC9tZmQvY3M0MGw1MC5oDQo+IA0KPiBUaGlzIGlzIGdvb2QgdG8gZ28gbm93Lg0KPiANCj4gUGlu
ZyBtZSBvbmNlIHlvdSBoYXZlIGFsbCB5b3VyIG90aGVyIEFja3MgYW5kIEknbGwgbWVyZ2UgdGhl
IHNldC4NCj4gDQo+IC0tIA0KPiBMZWUgSm9uZXMgW+adjueQvOaWr10NCg0KV2lsbCBkby4gVGhh
bmsgeW91Lg0KDQpCZXN0LA0KSmFtZXM=

