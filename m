Return-Path: <linux-input+bounces-5358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B71719481C8
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 20:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 16947B2310A
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 18:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80B515FA9E;
	Mon,  5 Aug 2024 18:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Bxs1RvVh"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54A415AD96;
	Mon,  5 Aug 2024 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722882998; cv=fail; b=j4rWfOXrLjWGvSOVQGvPKumdSy/1dLiyCzYkk5ogUhphi7HKMJbcwpTc/Zf2bQNYLuGc1HSft8XoAoqRHKqghmRhZ1rSSNnNEL5rUc7koTgUSpCotvjroExAA8W161JmNi6rHQW4gHZS4J5gNpgczaSZQWnFIg/TnSBkD8/qXmU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722882998; c=relaxed/simple;
	bh=hlNSv+36/baVYLur1HgVbsz244ire8UOA7mhcTpmD5c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aSehRhA2ZZwYNyySv34r1481jj4FleMIhBMzxxExB5MRwKaRuvn41ut32hGEmJhlFo3iAsUk6vMiWhDQYjrwp19nme7xxnc2NkyNOyejVi1IIJI0MwOlPlmI4h8SW+blmj6DO8nFZu+jw2tqcOvzznLBHzolKau9dEQ4bZeh/wM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Bxs1RvVh; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475E6ZKu030848;
	Mon, 5 Aug 2024 14:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=hlNSv
	+36/baVYLur1HgVbsz244ire8UOA7mhcTpmD5c=; b=Bxs1RvVh2GZXsrXqYrJrj
	p4Ojz/VNtDLC35Xi4RehoC4Sjctd6i3de0r3NcjQhFgcNgtOHIpU6PeoOrEnaDN/
	qA0OUAtLzArRv/5+iFcL3kHhbsLi3jicM11efIEcMvsXBDjPuGfb0Yc+qWfPjMZE
	a1QSYsiHhW/3Q2S/n6CqojM0h9fcYinP3wyOWCIZD5CpY51C+2tL4aKzbwNymjfm
	gqvi5ZTWXtR3WAhq01vAVEHovYjSJ6ES3tGMFcxiFmed3SXhwH1nrSL43G68XgsS
	XtiJrG6+G9wGSCrSa7dOXxp/N7wr6/IXhbck+qV4NE85l8VtxdxsXOGKCvjla/Qq
	w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011025.outbound.protection.outlook.com [40.93.12.25])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 40t20dna4t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 14:36:22 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg+6zkDpSPb7YsEGlYBsDt+Smes2YjI7eeFFVrw6i0DU91q1pZwONlIJUHGhXn/CrNZlufQXypCTxJpKMD25Necxgzdexv9vUgr0jmm1a1aLj3wpkTgrM297XW2zLBd6pcbfTe41tpaHfNKgvcyTVd+MedHHyTz3zUKfjTDgCsvtf6MrcL55OjFKK8g8ubcXyzRVev0Uk2juu054FiDlIKeDioSIdlxaHrawvyc2pYstjag9e8w4VPVDLzTpLRVgA2MxBhoJa1kbLsTxq8cZJjLmtO73+ZAv+YthXA5UZCfLUUVl/b+kZfHaR42RtJUa4phkLGaOM5UpEEdF64MHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlNSv+36/baVYLur1HgVbsz244ire8UOA7mhcTpmD5c=;
 b=Jc0kEzjnB/MFYfBoVuzK9WxBKKcWan7LPmF5Z8TZ7Inn3JhrP7mr6XKRx/rcMgK0/dBHON2wJqPxIKBGvsyuwnhIXKpbGh4iRDJLZTfUV9vDJJ1MQbWT6Yw7M8DfFGvy1yo1K+3YGeINK2gvlzccoLWk9u3hcuak1sTjKxKiJDPJIUW9MBD0ZEpe3Ps8bvZWNOFHk8Ee/D9Sw4k891+xKLREXLOw1c+/BIfHGxEILv7IHYgg7sO3RweCovvIu6RXq0LtJ2XRRJvhtVN0GV1fo6EHOlFK/uOP2j1CBQN96QgSiaQfuUsOg62LCoh9gcoQVkIsutAkIFFDnaLtGoQ6Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA0PR03MB7544.namprd03.prod.outlook.com (2603:10b6:806:b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 18:36:19 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7807.025; Mon, 5 Aug 2024
 18:36:19 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: =?utf-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, "Sa, Nuno" <Nuno.Sa@analog.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
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
Thread-Index: AQHazh4y7HYAekDrHUW2x4fL7XXaPLIU3lMAgAOLEYCAAKdt0A==
Date: Mon, 5 Aug 2024 18:36:19 +0000
Message-ID:
 <SJ0PR03MB634381773A53DEB88D20B6319BBE2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
	 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
	 <Zq17uABHdNENnwVq@google.com>
 <f2b0593ffb1c9cb07114483f8f49428211eb5117.camel@gmail.com>
In-Reply-To: <f2b0593ffb1c9cb07114483f8f49428211eb5117.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3RPVGsxTmpNNVptSXROVE0xT1MweE1XVm1MVGcw?=
 =?utf-8?B?Wm1FdE5qUTBPVGRrWTJVMVpqZzFYR0Z0WlMxMFpYTjBYRGs1TlRZek9XWmpM?=
 =?utf-8?B?VFV6TlRrdE1URmxaaTA0TkdaaExUWTBORGszWkdObE5XWTROV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU9UQTBOQ0lnZEQwaU1UTXpOamN6TlRZMU56Y3pORE01TXpZ?=
 =?utf-8?B?eElpQm9QU0p5V1ZoeVlYWTRaM0pKYTFGaFYyZDVlVWxyUzNrdlRESTVhV005?=
 =?utf-8?B?SWlCcFpEMGlJaUJpYkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNT?=
 =?utf-8?B?RlV4VWxOU1ZVWk9RMmRWUVVGRmIwTkJRVU5DU1dOc1lscDFabUZCWlVWQ1Nr?=
 =?utf-8?B?RkRibWRUYW00MFVVVnJRVXRsUWt0UFkwUkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlNFRkJRVUZFWVVGUlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
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
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRa0ZCUVVGQlFVRkJRVUZKUVVGQlFVRkJRVDA5?=
 =?utf-8?B?SWk4K1BDOXRaWFJoUGc9PQ==?=
x-dg-refone:
 Y3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3Qm1BR0VBYkFCekFHVUFYd0JtQUc4QWN3QnBBSFFBYVFCMkFHVUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQThBQUFBQUFBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElBQUFBPSIvPjwvbWV0YT4=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA0PR03MB7544:EE_
x-ms-office365-filtering-correlation-id: eae4145c-79a3-4bef-d807-08dcb57d7f92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?V3ZXb2pJZm9CSkNMN01Cbmg0OXFpNDlSMFN1ekJqdWd2dlQvanltY1hXQTBn?=
 =?utf-8?B?TGo5Q0Y0Qy9ERjB0WVRwVWlKOW9hSmNPelViVkl4K3hweEZlNkVSNXVmWGJG?=
 =?utf-8?B?Q2lXcXVMTjcraTdtSEkwWVU3WjhScll4bS9zS1ZmQS9aK081TjNKdHc2VWcz?=
 =?utf-8?B?VnEzUUNzRmtuVkZ6bGg0RFpHMWFlcU40cFhKZGNHT0pUZGM5aEZqM1hrV25Q?=
 =?utf-8?B?NWpEZW9wQXdSOEw1Z2xZSDExYkE1ZkNZNkdwYmNPRWVlakNjMURSTWlKdHBu?=
 =?utf-8?B?ajRyVjJhdzNhdG9PTnpDamh1OFNJR3RLVXR3U1ppbVV3ejd5TE5hMEtJVHpq?=
 =?utf-8?B?dU4vVEpja2tpaXR4NzVGWGNWcEVZRFdhK1YvaE9DeDVraGVPaTdnNXVjTE9l?=
 =?utf-8?B?T3JlRUNOZERrSkFIY2NPVGpxZ2xmUVdCSTIxRGl4WW9vdTNoM2ZzZlU3UlFP?=
 =?utf-8?B?R3ViMk50bmw3bld2UHNoaSsrUDFySDJLMEJUR1BJYStLTFVrdEg0akVwaVRk?=
 =?utf-8?B?Q0tFbmw2bzRPRXZqa0lFUEdhbTI2VDVlNFd3ZmswRmN3SHZmV25rNEFnRGhR?=
 =?utf-8?B?ajZ6YkdDMWwxVWErcjJFVnRtbzhBay9TaUtsRGFjNk5sbmlxTTZDREZmZ2ll?=
 =?utf-8?B?Tk5nRHVVM25nUkxmd1R4K3ZJdWZjdCt6LzJ1ZDlreEp4cFcrR3lCbnlJeUxl?=
 =?utf-8?B?bU9vNzcrS1puRHovK3RpYlJHdDJJbVE0aG53STgxcHBHaCsrNjRRRVlaeXdS?=
 =?utf-8?B?L1NQVjZ3b1RFWWNhSDNwM2FPMHF3RU5VOGM3MUFneXlxN1FuOFJ6ZlBTVFJk?=
 =?utf-8?B?N1ZkbTFwaDV2M1ZkUHJmci9kSFZtNWdiMG9ncVJ2YlpUL3YxcmhiNUxKWXI2?=
 =?utf-8?B?MHNpdElCai95ZkdJbFpyYkN0TytyQ29EbnRNU2dsbXNQVHgxeHJSWW5jYmM1?=
 =?utf-8?B?YStSNDhHREtqUGhmK1hjZG9vejVWa0tMZmNLcjNrQ3hGditadUVNTnV2bnJO?=
 =?utf-8?B?WUtEK0YvVUZ1bFNjTWJralFiNnk0SUl1bnhrVks1c3V4N0lwcGFhc3lVQThv?=
 =?utf-8?B?K2FiYWhmaVV4U0dKZHFXSjFCa3JWandOTjk0TnM3ejM1by9reXQ0N0tPcVRk?=
 =?utf-8?B?UkZOdXN3NzlRd1BDcmlWYXJxOUlRZHNoeE5IZmpvalBTUUo5b1ZmK0szYndZ?=
 =?utf-8?B?bEVoa3VGVklDdVZhdVFGUjRBWTFJcXBpUXJFY1NhZ3lLR1pWdFBLVjAvU2Vt?=
 =?utf-8?B?dmxTSUN1VnhaSWJNMFlaVUdEZXBsQlBqVldwc2c2TlBuTG13TS8vNS9JMldJ?=
 =?utf-8?B?ZDVKdEE1NlNSUitQUitsU3NWSlIzUmV6T0ZzejlRcDVFc0FXZzlrVXhRUDhL?=
 =?utf-8?B?UjZUbVF1R094QUlwVG5OeHYzVlBpRFJPTlNXREVlV1pITjk0enMxQ2pUWld2?=
 =?utf-8?B?M2ExSGkwTVhvL1NJVEdVNWVINnZWUmlHT3JkcFAyd0d1eXdlUERKZkJyTEtw?=
 =?utf-8?B?VzZWeXVvVDhnNmQwb3NNY09VS0xGbHFLNVljR0IxNGpTMGRseWpKTURGalRG?=
 =?utf-8?B?ZEhSdFlRS2M5MTJhMlBDNkExVWFpUk8zdHlkY0l3U2ljZFF3WVc1czlTYno1?=
 =?utf-8?B?anFKekJlWDFIS1pyYk9oZ1Y5RmlJSjRnak5kVVhzUmZPWmlBUEVvTUU4T2hz?=
 =?utf-8?B?ckx1dHR0MldRNUc1cG9kQitXYzdZOElzQUpUbm9XREJ2bkFacytld0ZiZ052?=
 =?utf-8?B?TUxaUUJEM0FtZjhJK1grMXZXWFZQRnJHU0J3NUNUSFFEMy9WdlFMdXJuWUp1?=
 =?utf-8?B?cy9Yekp0NTlSMkVXSFd1cXhxZUNmZFdrakpKY0JacmQvN0FWOVVJd3hRRzZx?=
 =?utf-8?B?dmp3dGFzQW1ETFdmSlk5ODhXanBTV0QzVHlpMjFxWmpBSWc9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?czZQZ21WcXd2em5ZRGtqcTI3RkVObHRaWnl1ZGsxbVV2RXJHblZtakR2d2c4?=
 =?utf-8?B?YXdWZWgxL2tBNXY5TmRjS2hMalpKcG9aYnROSnR2SDB6NHU0b1gvRjlxUlhN?=
 =?utf-8?B?by8zNEhMaDFyVitHbE40SjF3UUJST0IyakF4dG0yR3F1VEw2QTlyRmdQMHZp?=
 =?utf-8?B?eTZvc3YxMGplSHdDUFNsVkxsdHZ3RWFSaHNQTCtUV3Q2bExmNGNYR0NZZTNJ?=
 =?utf-8?B?QTRKNjl1WTA2VU5RY2tNcEYvUk9JT3FLbEVPYWx0MU52bTFGNFpHbE80Rklq?=
 =?utf-8?B?MTN0SjFLVW56Tm9XRndpdXMzUjJ5Q29sV0ZxSUZkVEdBdU1NMDUrcFMrZHFU?=
 =?utf-8?B?dFNzZ0Nlb2V2QVhiblRiWDNiTklyYTBWNXNQanhGcVpwUitxcDBoSzk3MUh4?=
 =?utf-8?B?azJCRk9TTUsvZElvdmZodUE0MGpYMUd4L2JudkE0ZldOUFI5Z0dEUHFuK1dv?=
 =?utf-8?B?NGpUcU8vQWl1bnFKaTUyWW5OdWRjblZMM1hoOWVGbmxQdmxCdGlKcTBXSi9u?=
 =?utf-8?B?VEhmU3dYTVlJbjRRK2hsR2ZlT0NlbUc0cU9xbHozRHJ1aEdDcGxrSEZYWU9Z?=
 =?utf-8?B?anBTSUd6VFpNT0dUc1N3OERxSTJSaHo0MlFXbmg1SEU0OG5JNXRsSnV1cEhW?=
 =?utf-8?B?c3FBU1l0S291eXJEbzh1SXFVaWJPWktZSlBMTGJPeWR5UGtXdjQxcVVoSHpu?=
 =?utf-8?B?TUxodzVlZlFTc1NHUEZjOEhDYnZNYVFDd3BBN2dvUHE4NzNVV1d4NUVrNUNv?=
 =?utf-8?B?cGhwU3QxYjZJUHBVcHRRSUM0a3hKb0pUS2hMa210SUVRaWhRYkxvOXYrT0kw?=
 =?utf-8?B?ZmcvTUtqc1pBZlMvODc2cTg4dVdIWVBlQ1Zhd0dDVk5rN1FaTndVaE5HM2Rx?=
 =?utf-8?B?NlB1V0xoN3NaTnk1dTA5T1p3bW9nN1VQY25ZOXRrcG9JM3N6Mk9CMFppYmdt?=
 =?utf-8?B?NFZyZ0FrUHFwcno4Vzc4VDZJZ0NEYVJVZThZcmRPMTVmeXZBYmNPUFhRdXov?=
 =?utf-8?B?TjVDQVhTSHREQ2xGaUJRc21ZUlU4SENzbE94MUlhUUdEMHVORE9MMU9IZDNG?=
 =?utf-8?B?OW9hZjdGd0NXZmFxZ2RrQ0l2N3lwR0M4Z2Q5Mk9Cb0REdHlrOGJubWRxRjBv?=
 =?utf-8?B?U2F5WmdYci9Nb1BiNkpmRU9xMm5kVis4RlRVamtBVE9kOTF0KzhFOUozMnVO?=
 =?utf-8?B?N2wwSU1sWlcxZG1BNGx1VmRuWnAxVFZKOTB1djZsM2sxR1RBUDlWbnFiejBJ?=
 =?utf-8?B?ODFseU5MMHF0cDN2OUs3RnBDMGprU0lNd3dNRzd3eFVnWjVPdkhIalo1OTlI?=
 =?utf-8?B?RlpvWmtOVG5paDJLdFVpODFHRnhDNWVmbitmdHlFci84Z2dVVFZseWg0VkYr?=
 =?utf-8?B?M24xYmtHT0RTbUhSV1g5VFkvYWRlQVVEQVJmV0ZJcm9uVm9YV1cvazAxMkdX?=
 =?utf-8?B?K1VRSU5WT1NqcXg3RWU3UE5mR2RWU1p4enVRY3JUNHliZlRuQllxTThZM3Rn?=
 =?utf-8?B?cDM4eTVGSnNoeFRkaU15OG1UdkRUbS90WHlML3c1Y2FWc1U0Mk53QjdISnFr?=
 =?utf-8?B?aHlkTUM5UzFXV2p1VURXaGhjMzNuTHhqQjRma002SXp0MXlOSkRQNlk2aEVl?=
 =?utf-8?B?MGFYVmJ2Uk5JRy8zaEF5RHUrMkJYNU9UZlhYdEhYWkY0S0MzNS9PSm9wZmJU?=
 =?utf-8?B?allhYmJIQ2pWK0Z2QXNQY2Y5QnlMS21EM1lXMi9TWjQ1OTdWWVhiQ2M5L1dN?=
 =?utf-8?B?SlpGNG0xTzF2MzViMlNRQ2V0YndJZStKU21LM09pMlhoaHd2UWtjOVlJUFRn?=
 =?utf-8?B?QnhadEV2VWVBQUQzejR5L0loWlRBMGU5RW1pc1Jtb2V1K1hoczdGekZZWmJS?=
 =?utf-8?B?bXgzdms5bzAyc1dmQTRia283TjA4N1plTHMyR0s1QjdKSzVrNWdiQVZoakNR?=
 =?utf-8?B?cmZza21pWkh4TXlicEFrQkVWWlFhQlNhK1ZLZVhTRHgwMXJlRWtCbDV3TGxh?=
 =?utf-8?B?dHFleURRanc1aXZkRGQ5Y0hzaXk4eWYxekxmWWY3c0JxSXd4dWZuTTVZMlg5?=
 =?utf-8?B?S0RSclAxRHMzWmRmZThHQVFaN1djK25LOWowZS9UZmFBTmZiVzZXOGxMeHZL?=
 =?utf-8?Q?/y5EMcI1SDPTMPlTO5R7CL5ye?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: eae4145c-79a3-4bef-d807-08dcb57d7f92
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 18:36:19.5406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7326tFyRjA/w0nC7hbukYZeshVFv6clbkIE8EJdywMEQXbG+HeNwk3DuYuZlQoWs0grnlJT74xuVXJ9zjnefJmK9ZUOlpbeZcmEesU2eGeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB7544
X-Proofpoint-GUID: OGsRF5e1rxJFmTDGEcMX3nVeaBDzZrVU
X-Proofpoint-ORIG-GUID: OGsRF5e1rxJFmTDGEcMX3nVeaBDzZrVU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_07,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050133

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTnVubyBTw6EgPG5vbmFt
ZS5udW5vQGdtYWlsLmNvbT4NCj4gU2VudDogTW9uZGF5LCBBdWd1c3QgNSwgMjAyNCA3OjQ0IEFN
DQo+IFRvOiBEbWl0cnkgVG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+OyBBZ2Fy
d2FsLCBVdHNhdg0KPiA8VXRzYXYuQWdhcndhbEBhbmFsb2cuY29tPg0KPiBDYzogSGVubmVyaWNo
LCBNaWNoYWVsIDxNaWNoYWVsLkhlbm5lcmljaEBhbmFsb2cuY29tPjsgUm9iIEhlcnJpbmcNCj4g
PHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kgPGtyemsrZHRAa2VybmVsLm9y
Zz47IENvbm9yIERvb2xleQ0KPiA8Y29ub3IrZHRAa2VybmVsLm9yZz47IFNhLCBOdW5vIDxOdW5v
LlNhQGFuYWxvZy5jb20+OyBsaW51eC0NCj4gaW5wdXRAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEFy
dGFtb25vdnMsIEFydHVycw0KPiA8QXJ0dXJzLkFydGFtb25vdnNAYW5hbG9nLmNvbT47IEJpbXBp
a2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWthc0BhbmFsb2cuY29tPjsgR2Fza2Vs
bCwgT2xpdmVyDQo+IDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIHY4IDIvM10gSW5wdXQ6IGFkcDU1ODgta2V5cyAtIGFkZCBzdXBwb3J0IGZvciBwdXJl
IGdwaW8NCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIEZyaSwgMjAyNC0wOC0wMiBhdCAxNzoz
NyAtMDcwMCwgRG1pdHJ5IFRvcm9raG92IHdyb3RlOg0KPiA+IEhpIFV0c2F2LA0KPiA+DQo+ID4g
T24gVGh1LCBKdWwgMDQsIDIwMjQgYXQgMDM6MjY6MzFQTSArMDEwMCwgVXRzYXYgQWdhcndhbCB2
aWEgQjQgUmVsYXkgd3JvdGU6DQo+ID4gPiBGcm9tOiBVdHNhdiBBZ2Fyd2FsIDx1dHNhdi5hZ2Fy
d2FsQGFuYWxvZy5jb20+DQo+ID4gPg0KPiA+ID4gS2V5cGFkIHNwZWNpZmljIHNldHVwIGlzIHJl
bGF4ZWQgaWYgbm8ga2V5cGFkIHJvd3MvY29sdW1ucyBhcmUgc3BlY2lmaWVkLA0KPiA+ID4gZW5h
YmxpbmcgYSBwdXJlbHkgZ3BpbyBvcGVyYXRpb24uDQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1i
eTogVXRzYXYgQWdhcndhbCA8dXRzYXYuYWdhcndhbEBhbmFsb2cuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiDCoGRyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMgfCAzNw0KPiArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+ID4gLS0tDQo+ID4gPiDCoDEgZmlsZSBj
aGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2lucHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+ID4gPiBi
L2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMNCj4gPiA+IGluZGV4IDA5YmNm
YzZiOTQwOC4uN2MzMmY4YjY5YTNlIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC9r
ZXlib2FyZC9hZHA1NTg4LWtleXMuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9pbnB1dC9rZXlib2Fy
ZC9hZHA1NTg4LWtleXMuYw0KPiA+ID4gQEAgLTE4OCw2ICsxODgsNyBAQCBzdHJ1Y3QgYWRwNTU4
OF9rcGFkIHsNCj4gPiA+IMKgCXUzMiBjb2xzOw0KPiA+ID4gwqAJdTMyIHVubG9ja19rZXlzWzJd
Ow0KPiA+ID4gwqAJaW50IG5rZXlzX3VubG9jazsNCj4gPiA+ICsJYm9vbCBncGlvX29ubHk7DQo+
ID4gPiDCoAl1bnNpZ25lZCBzaG9ydCBrZXljb2RlW0FEUDU1ODhfS0VZTUFQU0laRV07DQo+ID4g
PiDCoAl1bnNpZ25lZCBjaGFyIGdwaW9tYXBbQURQNTU4OF9NQVhHUElPXTsNCj4gPiA+IMKgCXN0
cnVjdCBncGlvX2NoaXAgZ2M7DQo+ID4gPiBAQCAtNDMxLDEwICs0MzIsMTIgQEAgc3RhdGljIGlu
dCBhZHA1NTg4X2dwaW9fYWRkKHN0cnVjdCBhZHA1NTg4X2twYWQNCj4gKmtwYWQpDQo+ID4gPiDC
oAlrcGFkLT5nYy5sYWJlbCA9IGtwYWQtPmNsaWVudC0+bmFtZTsNCj4gPiA+IMKgCWtwYWQtPmdj
Lm93bmVyID0gVEhJU19NT0RVTEU7DQo+ID4gPg0KPiA+ID4gLQlnaXJxID0gJmtwYWQtPmdjLmly
cTsNCj4gPiA+IC0JZ3Bpb19pcnFfY2hpcF9zZXRfY2hpcChnaXJxLCAmYWRwNTU4OF9pcnFfY2hp
cCk7DQo+ID4gPiAtCWdpcnEtPmhhbmRsZXIgPSBoYW5kbGVfYmFkX2lycTsNCj4gPiA+IC0JZ2ly
cS0+dGhyZWFkZWQgPSB0cnVlOw0KPiA+ID4gKwlpZiAoa3BhZC0+Y2xpZW50LT5pcnEpIHsNCj4g
PiA+ICsJCWdpcnEgPSAma3BhZC0+Z2MuaXJxOw0KPiA+ID4gKwkJZ3Bpb19pcnFfY2hpcF9zZXRf
Y2hpcChnaXJxLCAmYWRwNTU4OF9pcnFfY2hpcCk7DQo+ID4gPiArCQlnaXJxLT5oYW5kbGVyID0g
aGFuZGxlX2JhZF9pcnE7DQo+ID4gPiArCQlnaXJxLT50aHJlYWRlZCA9IHRydWU7DQo+ID4gPiAr
CX0NCj4gPiA+DQo+ID4gPiDCoAltdXRleF9pbml0KCZrcGFkLT5ncGlvX2xvY2spOw0KPiA+ID4N
Cj4gPiA+IEBAIC02MzIsNiArNjM1LDIxIEBAIHN0YXRpYyBpbnQgYWRwNTU4OF9md19wYXJzZShz
dHJ1Y3QgYWRwNTU4OF9rcGFkDQo+ICprcGFkKQ0KPiA+ID4gwqAJc3RydWN0IGkyY19jbGllbnQg
KmNsaWVudCA9IGtwYWQtPmNsaWVudDsNCj4gPiA+IMKgCWludCByZXQsIGk7DQo+ID4gPg0KPiA+
ID4gKwkvKg0KPiA+ID4gKwkgKiBDaGVjayBpZiB0aGUgZGV2aWNlIGlzIHRvIGJlIG9wZXJhdGVk
IHB1cmVseSBpbiBHUElPIG1vZGUuIFRvIGRvDQo+ID4gPiArCSAqIHNvLCBjaGVjayB0aGF0IG5v
IGtleXBhZCByb3dzIG9yIGNvbHVtbnMgaGF2ZSBiZWVuIHNwZWNpZmllZCwNCj4gPiA+ICsJICog
c2luY2UgYWxsIEdQSU5TIHNob3VsZCBiZSBjb25maWd1cmVkIGFzIEdQSU8uDQo+ID4gPiArCSAq
Lw0KPiA+ID4gKwlyZXQgPSBkZXZpY2VfcHJvcGVydHlfcHJlc2VudCgmY2xpZW50LT5kZXYsDQo+
ID4gPiArCQkJImtleXBhZCxudW0tcm93cyIpOw0KPiA+ID4gKwlyZXQgfD0gZGV2aWNlX3Byb3Bl
cnR5X3ByZXNlbnQoJmNsaWVudC0+ZGV2LA0KPiA+ID4gKwkJCSJrZXlwYWQsbnVtLWNvbHVtbnMi
KTsNCj4gPiA+ICsJLyogSWYgcHVyZWx5IEdQSU8sIHNraXAga2V5cGFkIHNldHVwICovDQo+ID4g
PiArCWlmICghcmV0KSB7DQo+ID4gPiArCQlrcGFkLT5ncGlvX29ubHkgPSB0cnVlOw0KPiA+ID4g
KwkJcmV0dXJuIDA7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+IMKgCXJldCA9IG1hdHJpeF9r
ZXlwYWRfcGFyc2VfcHJvcGVydGllcygmY2xpZW50LT5kZXYsICZrcGFkLT5yb3dzLA0KPiA+ID4g
wqAJCQkJCcKgwqDCoMKgICZrcGFkLT5jb2xzKTsNCj4gPiA+IMKgCWlmIChyZXQpDQo+ID4gPiBA
QCAtNzc1LDYgKzc5MywxMSBAQCBzdGF0aWMgaW50IGFkcDU1ODhfcHJvYmUoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCkNCj4gPiA+IMKgCWlmIChlcnJvcikNCj4gPiA+IMKgCQlyZXR1cm4gZXJy
b3I7DQo+ID4gPg0KPiA+ID4gKwlpZiAoa3BhZC0+Z3Bpb19vbmx5ICYmICFjbGllbnQtPmlycSkg
ew0KPiA+ID4gKwkJZGV2X2luZm8oJmNsaWVudC0+ZGV2LCAiUmV2LiVkLCBzdGFydGVkIGFzIEdQ
SU8gb25seVxuIiwNCj4gPiA+IHJldmlkKTsNCj4gPiA+ICsJCXJldHVybiAwOw0KPiA+DQo+ID4g
SSB0aGluayB3ZSBuZWVkIG1vcmUgZWxhYm9yYXRlIGhhbmRsaW5nIGhlcmUgKGFuZCBwcm9iYWJs
eSBtb3JlDQo+ID4gZWxhYm9yYXRlIGJpbmRpbmcgeWFtbCBmaWxlKTogbm93IHRoYXQgeW91IGFy
ZSBtYWtpbmcgaW50ZXJydXB0IG9wdGlvbmFsDQo+ID4geW91IHNob3VsZCBjaGVjayBpZiBpbnRl
cnJ1cHQtY29udHJvbGxlciBmdW5jdGlvbmFsaXR5IG9mIHRoZSBHUElPDQo+ID4gYmxvY2svZ3Bp
b2NoaXAgaXMgcmVxdWVzdGVkLiBJZiBpdCB3YXMsIHRoZW4gd2Ugc2hvdWxkIG5vdCBhbGxvdyBt
aXNzaW5nDQo+ID4gaW50ZXJydXB0LiBJZiBvbmx5IEdQSU8gY29udHJvbGxlciBpcyBuZWVkZWQs
IHdpdGhvdXQgaW50ZXJydXB0DQo+ID4gY2FwYWJpbGl0aWVzLCB0bmVuIHJ1bm5pbmcgd2l0aG91
dCBpbnRlcnJ1cHQgaXMgZmluZS4NCj4gPg0KPiBIaSBEbWl0cnksDQo+IA0KPiBJIG5lZWQgdG8g
ZG91YmxlIGNoZWNrIGJ1dCBJIGRvbid0IHRoaW5rIHdlIGNhbiBhY3QgYXMgYW4gaW50ZXJydXB0
LWNvbnRyb2xsZXINCj4gd2l0aG91dCB0aGUgaW50ZXJydXB0IGxpbmUgY29ubmVjdGVkLiBTbywg
SSB0aGluayB0aGUgb25seSB0aGluZyB3ZSBjb3VsZCBsaWtlbHkNCj4gYWRkL2ltcHJvdmUgaXMg
dG8gZXhwcmVzcyB0aGF0IGRlcGVuZGVuY3kgaW4gdGhlIGJpbmRpbmdzLg0KPiANCj4gLSBOdW5v
IFPDoQ0KDQpIaSBEbWl0cnksDQoNClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRoZSBkZXBl
bmRlbmN5LCBJIHdpbGwgYWRkIHRoZSBzYW1lIGluIHRoZSBiaW5kaW5ncy4NCg0KVXRzYXYNCiAN
Cg==

