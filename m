Return-Path: <linux-input+bounces-5114-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C99391BF
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 17:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8E501C215AE
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2024 15:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C4A716CD07;
	Mon, 22 Jul 2024 15:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="FwIHvY6W"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D6816DEDB;
	Mon, 22 Jul 2024 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721662031; cv=fail; b=LDTFKd2lcDhWooZsLiFpKMw11y9nJhzQ5/wJt7BvZaCtxasZ14Q4phlsVkV6OK8iXhPubiEepbKTzzfgqB+nnxyUDQSyAHhlAi6tr/m2DmPvothwFB3S7/PAh4kNbOAvfgye0zRUBmJDeEfF9raUL/aFl44Pn7We4pTn0XQrogk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721662031; c=relaxed/simple;
	bh=Dje1DC93BANqGvk2pYu3zOQ9yUuwZBSbjp2aCjdldTI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hlyikV1A894AKDwyRTn25rSVN2KuaI7k6goSkXKtBR86VeYoj/G/kaO2N8G6KzO1uRF4NPk0lTOv5i6ACuGT/EdK3td5x023T/uHSxtUjYQVW5Kbo78obfj8LHGh0BPuA9qOhDKcj5ftMRnvTa5/CcTsaoaMbx3Tw5l6pOaE3ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=FwIHvY6W; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MCpZJv021048;
	Mon, 22 Jul 2024 11:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Dje1D
	C93BANqGvk2pYu3zOQ9yUuwZBSbjp2aCjdldTI=; b=FwIHvY6WVQ0yVvSONFx8V
	onNd+DQ5AvO8TR0hDmypIOsuuH5yeonMO2Lw+yc8V6lh1/ikOCqAdEnxpUHblKPG
	w7Eor/LigtnmAWrAgvgw4yAYzd1FRhIpLt51p0UP0qCChk/XQq/zaM9jjTce5a7v
	RWNKhOD5TzEu6zgvthltR37HTdbqizZz2fFW/KmrUiaKbNWJrgTjaV2RoFEHO2Ck
	0m2NqOlnRTmNOSn6iK93bpIz5DxdCcS2zJ8YEFIpYbHG1IxXT2EcoSc7mq3FzCcd
	euZYefDHVT2DGKm9LXKqJu0UMFMtRmOp3k65zWergfn8UCo73CnCr6YcVaRzdkhU
	w==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 40ga52du8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 11:27:05 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVzMha9XAqrJIxD5HDIiTFRSxheRWSoaBrESdmay1mlpO4ZWtvz6FEKLgCnNyyCTj/ZuDodorWjUPcOL7+g6Edi1xEilnqo2pLB8TW/ibSV0pHFugsnLF0OkrofW4OpTH7ODweZBfZmA7A4BxolFwvUnqleBrSq36nm1ziaHp+S8aCQGpAeC/RAbD8uVi9hZU3HRHBVCb6G1iFFhOB3m18e1nKo0TeZZ/wWooqyD7bGGGCuGqfC+PYWPbUVZ3YzKoSZtTYDWE4g0XrDpVIisMdFOM3Hew0wfYUJmKcorPYPY0h7I6Yw0VmO8jDSKYlNu6mEY+uEOCRHfWberv5+j4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dje1DC93BANqGvk2pYu3zOQ9yUuwZBSbjp2aCjdldTI=;
 b=SmWd1X7VY837lskY+Qzrq8xqEKrJJntV5Lajwn9McbG+kIgYiMsKDhVREOpjRWoOfq+Bi2yptaEDIvyUU8igXyJKK3ReKaoZBzezv0N3fpr7D0GROoxWuuQtco4HGwRpUKDFJ7mVTfzUCFO1Yeo0CijrDv3Mn0jT4axwI4TyHpvADBFSTpVHEHV1/rzsYCkLCI6msKhN+uj4P/TpEdZqSE6wDokknj9Qj7PZgwnvrAlV2C3Pkxbv14Px4s6rvg1rlvqf+NLYMZf/dZcvNypRPWNPk0/NbDBa443znBOragsiTU1rtg0yerKFAmwRuEW1+g3ypRWjtvvyZNE/D76BQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA2PR03MB5900.namprd03.prod.outlook.com (2603:10b6:806:11a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Mon, 22 Jul
 2024 15:27:03 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7784.016; Mon, 22 Jul 2024
 15:27:03 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: =?utf-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
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
Subject: RE: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
Thread-Topic: [PATCH v8 2/3] Input: adp5588-keys - add support for pure gpio
Thread-Index: AQHazh4y7HYAekDrHUW2x4fL7XXaPLHt+HOAgBUBK6A=
Date: Mon, 22 Jul 2024 15:27:03 +0000
Message-ID:
 <SJ0PR03MB6343870FAE4E1054009C698B9BA82@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240704-adp5588_gpio_support-v8-0-208cf5d4c2d6@analog.com>
	 <20240704-adp5588_gpio_support-v8-2-208cf5d4c2d6@analog.com>
 <9c64adf6a686b2845c15b368592115f3f9ab39e4.camel@gmail.com>
In-Reply-To: <9c64adf6a686b2845c15b368592115f3f9ab39e4.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3RaRFptTkdZeE0yVXRORGd6WlMweE1XVm1MVGcw?=
 =?utf-8?B?WmpVdE5qUTBPVGRrWTJVMVpqZ3hYR0Z0WlMxMFpYTjBYR1EyWmpSbU1UUXdM?=
 =?utf-8?B?VFE0TTJVdE1URmxaaTA0TkdZMUxUWTBORGszWkdObE5XWTRNV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU1qYzNPQ0lnZEQwaU1UTXpOall4TXpVMk1qRXpORGcyTmpj?=
 =?utf-8?B?NElpQm9QU0l6VW1KUE4wTkxXVTVDVDB0V1NqZElTWGhRTUdReloyUkVTbk05?=
 =?utf-8?B?SWlCcFpEMGlJaUJpYkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNT?=
 =?utf-8?B?RlV4VWxOU1ZVWk9RMmRWUVVGRVowUkJRVUpYVWtVeVdsTTVlbUZCVm5rd1dF?=
 =?utf-8?B?ZG1aMmxYWjJOWVRGSmpXaXREU21GQ2QwUkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA2PR03MB5900:EE_
x-ms-office365-filtering-correlation-id: b6d8e829-1750-4c13-1a20-08dcaa62bcd8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?SWxuVitxZWFHanYvUGtMTTI3TG9aWnFuZkU5b053bnJ5YnUyanZ3QjVGQjI0?=
 =?utf-8?B?U2hyMGdlendTelJicm5IREMxY3loQ3pzdFIwa1VWclU0cnpobzVvYUxTRXJT?=
 =?utf-8?B?c0lEVStLWWRZTW5GcnNSbzMyRzMxb2xhWnlPenFTaGZwSmhwazE4VWZpbFFE?=
 =?utf-8?B?TFRlT0RQUGxsMHcxeWgyZXowL2dmdy83eTN1RlZGdzR4KzErQTNuRDlndGl1?=
 =?utf-8?B?RHlsUW90djZKV20xckk0MytpNk45WGVvNmg2elRUYmZHeUl0dkRwVWtqVHVG?=
 =?utf-8?B?a29oamV1ald4dWNVWi9LdnhucmRtc0V4QXhhNTVHRUloZzFLblUvQS81WEZz?=
 =?utf-8?B?SDhrcDNmVE9Ic1pZVWJYMUo3cXV1Qy9IMCtWYTNvaEZ1b2kvQndlVUhuK29X?=
 =?utf-8?B?UDN3QUtsYndabXpkSTNlc3VnSTZldHdsRjFwa0tpNHNwQUZGTkYwR1BKYWZE?=
 =?utf-8?B?NnpTYkRFMzBuaDljZUdNaXRxVjRhZy9lOEFQNWdVTW1KQmZFU0hPNlBxMWF0?=
 =?utf-8?B?Tk9iT1d3T0dORnk4RXZ4bm1aWkpvWDFNVDJmdjd3TllsbDl3bVZ4NlVwTGVL?=
 =?utf-8?B?SzlyZ0U0djhCUkFjd3N0eFNuWmZWMmMxMjlSUlJvcWNxaWk2c3ZUdW9BSWtC?=
 =?utf-8?B?TkloQS9wVmNiVWtuVVlseU9xZGcrczRjaE9qWlJ5WlZqVEg5SEFPQ2dLcGl2?=
 =?utf-8?B?TjFVTTlBdHlPdCt3RGRIQjFiR1g4MHhOcGpvd2tIUDNhWUw0MStVYzR6bGI5?=
 =?utf-8?B?R2ttcTg3U3J4UHhxRktwejFDYkFKOENzYjZ0S2YxWlR2eEdNWC9IYmZiMTJy?=
 =?utf-8?B?d0phUEt1aW1ORVppMlNxOSttc25GaWF1WDhJRWJJaGovd1gwNUJOMXBJZWhK?=
 =?utf-8?B?SkRZb1prMStlSmt3RGdDMkcxZ1VXK2xqUVdkQW8vZ2wzYUZrQzVDTmZYQVBp?=
 =?utf-8?B?Q0xDRjVnQ1VlZ3pTc25hQnNZSnJmSzVjcVJScWRTazA2a2tCWG90L3ZhcjJ1?=
 =?utf-8?B?Y0dPZVErM0VUWDRQTUFQRlFRVi9FWG9wYlF6U1JxaUJPVWhNdVh4Q3ZsRUNX?=
 =?utf-8?B?andkU2FwY3E3RUU3YzRuSjZHbldMVlFMRjJJMEdHUlgweVZlMkRJK0lYa04w?=
 =?utf-8?B?Q1lnRnl0S0ZTUndMekVFaVc4TGVTcU54R3pDenRZcnpEeDdER010UDJ3clhu?=
 =?utf-8?B?ODhwTWZyZU1LSGRUaDlOSmMzN1JESTYrZytucDgwRkZZVWlLL3hRNStQb1Z4?=
 =?utf-8?B?YkFTWHVlYXJZN2xpajgxRUg0ZXR5M3N3cFltT013Z05FUGFqSGVWOWhTSlFG?=
 =?utf-8?B?M2RkQko5QUtqZmtraUZqZjc5K3dlUjJiYzBGeEdGVVhEdCtLTGNsZ2ZFc0JW?=
 =?utf-8?B?T2k5ODFZMXNtYXdWWXhyTXpqc2RBWEpnczlTazhkam5ZSjRTV043M2xGZVFS?=
 =?utf-8?B?TVBSYnlOUzdiZVl6TnZmTlNhTlpCUHRwb3dCNGxQRVVLRUltcmRBZURkN3hG?=
 =?utf-8?B?NFQ2SjBNNmlscllnRVNoRml0K1pQTUdqckxJaVJSMkMzQVRjT2htM3Y4UzBl?=
 =?utf-8?B?UHR2OHB5MEY5K25nN0J1Y2twZUJzcHpES3F1cjZQZ0xzOHlhcVRnYTN6L2hB?=
 =?utf-8?B?eHFlYnMyZ1ZoNFF1UnZ2QStBeVFvRlNqMjFxSlR2UFdsVEg1bUhzdmhVeENp?=
 =?utf-8?B?dVFqcFZvRHZPU3FhU0dyRXd4aC9KTHJqdzV6b0lTeUFGbWFUK0Rob3k5a0g4?=
 =?utf-8?B?U2hPU0crYTFKYnRlb3ZkUmlpaStmQ3NySE9CUGlnc2hCdEx5cnVkaXZXK2Vm?=
 =?utf-8?B?cWs4elFRZzhzdW9aL0l2SlRVejFXbmo2eEJCUjRKd3hPUDMzQlRJNTZOZlJn?=
 =?utf-8?B?bk4zOHR5VnN0Sk1keEtmN3ExOCtlWGZIN2lyczRORlk2ZVE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?anpWQjJvZnVwOTIzb3NOazd5UFBEZHJ2WVBuYmpEYk5pN1hRd0NjSERQa0dn?=
 =?utf-8?B?MHpwRjlHVThNdlRtbTRyZG42VDN3cDlYUmQ4SmxSSmdXcFpUbkdERVpvQjhn?=
 =?utf-8?B?MitDWDYxWFl0Y2VPUlRVbloxQlhvbW9XSXNuaFNPeExONHlVSmMxTTgydlBH?=
 =?utf-8?B?S0VMQlZCU0I0b0RMdERENFpZTTNRcFkrZG1ERnB3Tzg4eTFHSkZyUm1BNCtv?=
 =?utf-8?B?Q0s2VVNlQUVKa1BNYkpNNWhzUTdNQXVnMGE4TC9lUnF0SncrSjgwelo3aEhN?=
 =?utf-8?B?M21yNmZLTDF0cVVvZU1qcWNJVE1aM1FOUGFyTnJGWmFSKzUrMzdYZk81eWFs?=
 =?utf-8?B?M1piYWNHYWE0S0tnMXFnTWFMaWthQ014MjZtV3pJWnpmVm5SOW80Wk52RkRo?=
 =?utf-8?B?VUNOUWx5NGE4Z0JFMzROdmhIUkdkYU5Zc1dIZytid1BqTHZDNnZOT2RPT21T?=
 =?utf-8?B?bXgyUnByN1VaM29TVm15UG1ORmRGWUdZN0pjazB0VHlDUXlrK2FwNndNdE9M?=
 =?utf-8?B?RXNBa0ROS04xZGxUQ1hNQ0J3SFE4UENyaEs5WVFnR3M4a2VrNCt2WWtWY2xD?=
 =?utf-8?B?NzBucHdvelNBL1BlMzJBOHRUWlVLL2lIOWJSMi9hb2RRV1lZakRmb3hmMk1q?=
 =?utf-8?B?VGYxZmlBTFF1dC8vRVVqdXJpSjNXTmIxUmNYZzg3Y1pUWXVtWU9LVkJyb3ds?=
 =?utf-8?B?bFRrbTljSjFIakZ2ZXlnVGZ0SVFrTndGY1ljRWdDei9KbEVXWmFMcG9hYVBW?=
 =?utf-8?B?ZDI4QVVSNWd4cm5WV1dka1hTa0VLS0phUjIzbE4xT0hOVWlERERaTkJBNzlP?=
 =?utf-8?B?SXovMnFvWXdORzJ3ai9rTGFteUZGWnZsTi9JQzkwZEZOSnpaYUJ2bVA1emFx?=
 =?utf-8?B?d1hhR2xZYUhkd0tSL2wrZGtZZGpUQ2E5Uk9WN3U3MnIvM1Rjb0dRUUNmU2xT?=
 =?utf-8?B?cXUrS0xHNE9iL1poZVlNaTlPWUVuc1lCK0kwby9peUsvcUtFS2NyVmxPQjIr?=
 =?utf-8?B?WWV5Qzk2MENWQ1RHQUZvOWlUVFovM25VSHZSVkU4UFdsOTBsWmhVQ1JtdVdl?=
 =?utf-8?B?Ymw4VmdsdjZBUld4bDN5U0Y3NWl1ZWJyZDFlRS9FV28vNVM0TU5FVm45bnJY?=
 =?utf-8?B?djhmWGkrdm5xV1RPR09sZmpQMXNBRDl4NjNKbnhkeUx6WkRqZE5WS09PYUVZ?=
 =?utf-8?B?Ym5xY1ZIclhGQitnSVMwbE9OOFNqTXo4b1RYdFBIeFNSSGo1dUJXUHViTGFl?=
 =?utf-8?B?Q21kSDB3cVhVZDIyNEd1L0xBcHBhUDc0d2pVYklMMHF1MC9yRStSY2RKd2Zi?=
 =?utf-8?B?Snc1VDE1VDR2dkhsWDgxZjYrZnJHMy9OWWI0QmhVTWZXT1JyWER6TTdzYTBK?=
 =?utf-8?B?RHkzTHdjWnVZU3QzTmU4cTJUQ0Jncjk4T3NZcW9DM1dMY3FRNmZ0d2JnSkVw?=
 =?utf-8?B?QWN6ek54SUhidFd1REdQbEZ5QVlYV1EyYXEwckd1empsY2dJRjNiS1k4R1F2?=
 =?utf-8?B?Ync2Y2JEYXJLT2FjNmFLV0dPakFkQ2tFTTJIRDZMSHNqNTdjTGZLTmMrbFpO?=
 =?utf-8?B?STEwMGlSZDlEMkpkT0djbEtLYWFJZUFxb2pUSUdyak1Pc1JxUDlXSTBaaEtv?=
 =?utf-8?B?N2Y5T05qeVlkVmx6YjZNUGtVdUc2MjA0eFFkVUd4QVdEQWpISmxEU1ZtTkRQ?=
 =?utf-8?B?QUxGWlQrdWFRWXBLc0R2ZVRvWTVMbG1nd2RUNG1lQmtvOE56S1RnZDl2WkQx?=
 =?utf-8?B?ZERQR2ExQ1pFdGltS20wR1RiUlRYK2J0aXM2NG84NHp5OGZiVm5LVmNFbW5O?=
 =?utf-8?B?Tm12elU0d2lNOTFyeUZTQVFyUDE0YUpYc1pkWk9PWWdFN2ZpZWVvOXNFcFNC?=
 =?utf-8?B?MmpKcWMxQnBvYnJoemVoNDYvZkNkekN1eXViTWozRHdnOUkwbFRKTks2K1VU?=
 =?utf-8?B?ZEZWT2JsTmFIMTFsSkRocHFuZ2dTWUtYWFJpK1V0Y0xOdXkzSGkzL0ZldDJi?=
 =?utf-8?B?RkllTXlaRmpYK1JoaDZXbXBlYWRYcEhWZHVZY1gzcnRwNHdmNHJhalZaZzJ4?=
 =?utf-8?B?VVpSTTJKYk55MnpXbzl1SlI5RURCeDNjbFZwVHZvNG5UeENPNGJjblNqR3lU?=
 =?utf-8?Q?8hWlyo/PjZK18Y4umcvrJnTfX?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b6d8e829-1750-4c13-1a20-08dcaa62bcd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2024 15:27:03.1298
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zxMD95+NYzAtzQR5rbAsDMkcFW0Z2LK8k7fswtrvn3+Tyeh++cN/JYIfG2G601M00hbjxlTcp6pxIf5A2ybCuiXvhSxVGUKqVtFW91u/HNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5900
X-Proofpoint-ORIG-GUID: Qc8KqnO1rPNzxDL_8-JfQOx1wKnMXx59
X-Proofpoint-GUID: Qc8KqnO1rPNzxDL_8-JfQOx1wKnMXx59
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_10,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 phishscore=0 malwarescore=0 clxscore=1011 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220116

PiBGcm9tOiBOdW5vIFPDoSA8bm9uYW1lLm51bm9AZ21haWwuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBKdWx5IDksIDIwMjQgNzozNyBBTQ0KPiBUbzogQWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3
YWxAYW5hbG9nLmNvbT47IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hA
YW5hbG9nLmNvbT47IERtaXRyeSBUb3Jva2hvdg0KPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNv
bT47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tp
IDxrcnprK2R0QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+
OyBTYSwNCj4gTnVubyA8TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogbGludXgtaW5wdXRAdmdl
ci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IEFydGFtb25vdnMsIEFydHVycw0KPiA8QXJ0dXJzLkFydGFtb25v
dnNAYW5hbG9nLmNvbT47IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWth
c0BhbmFsb2cuY29tPjsgR2Fza2VsbCwgT2xpdmVyDQo+IDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY4IDIvM10gSW5wdXQ6IGFkcDU1ODgta2V5cyAt
IGFkZCBzdXBwb3J0IGZvciBwdXJlIGdwaW8NCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIFRo
dSwgMjAyNC0wNy0wNCBhdCAxNToyNiArMDEwMCwgVXRzYXYgQWdhcndhbCB2aWEgQjQgUmVsYXkg
d3JvdGU6DQo+ID4gRnJvbTogVXRzYXYgQWdhcndhbCA8dXRzYXYuYWdhcndhbEBhbmFsb2cuY29t
Pg0KPiA+DQo+ID4gS2V5cGFkIHNwZWNpZmljIHNldHVwIGlzIHJlbGF4ZWQgaWYgbm8ga2V5cGFk
IHJvd3MvY29sdW1ucyBhcmUgc3BlY2lmaWVkLA0KPiA+IGVuYWJsaW5nIGEgcHVyZWx5IGdwaW8g
b3BlcmF0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVXRzYXYgQWdhcndhbCA8dXRzYXYu
YWdhcndhbEBhbmFsb2cuY29tPg0KPiA+IC0tLQ0KPiANCj4gUmV2aWV3ZWQtYnk6IE51bm8gU2Eg
PG51bm8uc2FAYW5hbG9nLmNvbT4NCj4gDQpIaSwNCg0KU2luY2UgdGhlcmUgaGF2ZSBub3QgYmVl
biBmZWVkYmFjayBjb21tZW50cyBvbiB0aGUgc2FtZSBmb3Igc29tZSB0aW1lLCBJIHdhbnRlZCB0
byBjaGVjayBpZiBhbnkgZnVydGhlciBjaGFuZ2VzL2FjdGlvbnMgYXJlIHJlcXVpcmVkIGZvciBp
dCB0byBiZSBhY2NlcHRlZC4NCg0KVGhhbmtzLA0KVXRzYXYNCg==

