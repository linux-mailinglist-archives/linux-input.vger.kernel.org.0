Return-Path: <linux-input+bounces-4799-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFB4923AEE
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 11:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0FD3284957
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2024 09:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A67E158DCA;
	Tue,  2 Jul 2024 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="PMM2IG/e"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F558157465;
	Tue,  2 Jul 2024 09:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719914277; cv=fail; b=u5hEv2kXlUkvN6bJZgq1M28SY3rR7hvvJ8sCZVkThkqkWHcJcX8zGEoW9/jx9QA1RdI0yyYjBoHuLrpx8q0HbCLqPce5eTYdIQTVfEbgD/sIDXSm7Yb7g13E8FgIJmxjar1OQI8dK9nAuyKjMrOOY+gl4FBr9v9HDKZGfNcGuXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719914277; c=relaxed/simple;
	bh=d7u/xs774iCnvLDHoIQQn1Uu14T1eXJn0/v52AhNHSM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ty8eIW5mKbQS3OaXl0IRoj63n8tyasKaJPCr2off7jdFCkE6EgV+9cS/ggYRAOLDVLlibHndmtoqcbUjeTeHbXQNqx0siqI6IJXi2ybb5ED1k3EhetiTPjJKteafFNLgD89HRGzdk03Hhed0bkZ1Tdc/mU5gFct0T/MNiQvAbjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=PMM2IG/e; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4629M7e3023830;
	Tue, 2 Jul 2024 05:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=d7u/x
	s774iCnvLDHoIQQn1Uu14T1eXJn0/v52AhNHSM=; b=PMM2IG/eY6HW4lEVFjc8a
	NBT/Ii3NfZRMO1pJjDEaFYwUPtidZftEeZVK1kCFZ+BAb+WnNwdSoYhpcA2x299m
	T2s9oH5TVlxDdCVl+XKdAcWPlozDBdUfr2xjTjpp47BwGIkVivktJZjB2KHCnkIo
	VPC4mJDpUnhX0hWyjVZJGfUTbTcM6N6KwcSo5e9TBMokejnrlDk0us9HtG4vqXKz
	Ynjk9CzFFLekksUcN5ZivYngO1CToobDIHniCwDThpVeWS0ZdFgf0Uv3mlVv8aPq
	nnM+vnoAkMdb4BrTM54BnfTszeXretXqIvbAm/6lSONubp1/G3mxckLtQ4r9foj/
	w==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 402ew50n8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 05:57:44 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FC2e5jlM/xBxQksyYDhd/y5SyyuYqdsdOnJbZoDB5pc+U42ARqJnLIBhhMpvt8I+6+/1UspqHGD+1QrQGBbREmDWi3UYAVCtHF/WxRbdamJ8pSLe/UwvhJmAYmhlTIUqGtOyOdj2I1MAvGJWdDkP/5ZRlYqTIlajyVtGyEpRPqY/nqVzpJixdhKxS+2WFxKIlk9MdJvp/z2Su/Qlo426IFTF8MSIUz3PYnAoYVrqv3bFj5IGGUYm+evTE3vl7fJoasyZLpwR6Lfo4M2x4BKtO7GDogbiWCwyieAdAdNEgk9It3boasbJHWSQ/DJRz1tXs/t5HNpItydA2juqe+0NYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d7u/xs774iCnvLDHoIQQn1Uu14T1eXJn0/v52AhNHSM=;
 b=Dj2jtCDrFC47HiNqMWuzgSvrCFsimrlSrLtadctAp46XMayKcLA5K2XpFOFpcEpFbRiSCfcX1qiE3rTiNgFOxlmwmcRXL5PJ0gfkkG+hb/pY6zp+duAE9YsnkKFDCP6g06UdDLQr1FcVfTuWdz2LsAwx1fxuc00hx/+KAzzhoj7X0iTEYrhZ8Zqw1hrsSDMQeKrvPSQc8wl6XGY7goHBdcslB+6rDa7miX0iGDiExFhS2JtGs92/ktEnDu2j27ozf+LsceUfvo7keISZJY438jpcFNjO+8gtF+aEj6Bk4mEwfUV5Vn6dc9zy222yUlmSVwcEi6WKUfzPRWGWOfan6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SJ2PR03MB7498.namprd03.prod.outlook.com (2603:10b6:a03:555::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.34; Tue, 2 Jul
 2024 09:57:32 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 09:57:32 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Hennerich, Michael"
	<Michael.Hennerich@analog.com>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "Artamonovs, Arturs"
	<Arturs.Artamonovs@analog.com>,
        "Sa, Nuno" <Nuno.Sa@analog.com>,
        Dmitry
 Torokhov <dmitry.torokhov@gmail.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        Conor Dooley <conor+dt@kernel.org>,
        "Gaskell, Oliver" <Oliver.Gaskell@analog.com>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: RE: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v4 2/2] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHay8gTYwwWs3CKE0S2GySCAYj43bHiD7CAgAEkoWA=
Date: Tue, 2 Jul 2024 09:57:32 +0000
Message-ID: 
 <SJ0PR03MB63439AB6CA3ADEC8C8D87EB49BDC2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com>
 <20240701-adp5588_gpio_support-v4-2-44bba0445e90@analog.com>
 <171985127498.58137.18371204131413728327.robh@kernel.org>
In-Reply-To: <171985127498.58137.18371204131413728327.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTAzWlRkbE5tRm1PQzB6T0RVNUxURXhaV1l0T0RSbU1pMDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjTjJVM1pUWmhabUV0TXpnMU9TMHhN?=
 =?utf-8?B?V1ZtTFRnMFpqSXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?STFOREU0SWlCMFBTSXhNek0yTkRNNE56ZzFNRGMzTkRRd05UVWlJR2c5SWpK?=
 =?utf-8?B?RGNsQmpVbTVqZWpGR056TjZNSEJoUjJkbFJrUkJkRTlSUVQwaUlHbGtQU0lp?=
 =?utf-8?B?SUdKc1BTSXdJaUJpYnowaU1TSWdZMms5SW1OQlFVRkJSVkpJVlRGU1UxSlZS?=
 =?utf-8?B?azVEWjFWQlFVVnZRMEZCUVRORE9YaEJXbk42WVVGYU1qRmhUM2hXVFhWQ2NH?=
 =?utf-8?B?NWlWbTgzUmxWNU5FZHJSRUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SJ2PR03MB7498:EE_
x-ms-office365-filtering-correlation-id: d7efc32c-dd3b-403e-be1d-08dc9a7d6432
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?MDhwUTQ3ZkM0QUVHUzgxWFRjV2dTUWE4MFNDcGFLUDZQdEtmb1F5QS9STGVE?=
 =?utf-8?B?cXZIb0puM1NnVk1XLytBTy9XelZXejArZkRUUE9DUGliVlBtSWdPbU13OWNV?=
 =?utf-8?B?aCtGVDlFRE8reWo5bVJKQ2lLRkRqeURVZ3NLR0M2REZ2RFAvcVp1aWRLbGJk?=
 =?utf-8?B?RXg5RTNwWXdSUEJJSEoxaTdNU3F0dXV6L0dkc2RWRXlrR1R1cEtWWlo2V2dL?=
 =?utf-8?B?dGVjdU1RVmlYSktlWGVid0YvZkRhTlZ2LzNzNmhDWGMyV0lpczU1YWlabG9V?=
 =?utf-8?B?SnBUVHlGSVdPamcyNlZ2NnpvRVNEc0I4SDRqZ2orUktKdWZ4cStwaUJ4WDlW?=
 =?utf-8?B?RmpZSzg4bGV4ek9VL2xZN0tuYmdLSGVlMjJydEEvQUFORzY2TFlIUmtXb1ps?=
 =?utf-8?B?bzkxcDZXNzQ0U1ZhQlFGZ09lcE1wR0ZmMXI1MXJwWWhQb295aktWbW9ueGFu?=
 =?utf-8?B?QTRDMTN6M2ZiTHJjVXdYMDNHayt3TWtaZkYwcldiWXJLQmpOWTVFZkdxL0VS?=
 =?utf-8?B?S0Q1eGZ2cy84SUVsWVdsSkY0K012VGpESG5NdzFoV1VIU2Z0WHdtYmxEUXk0?=
 =?utf-8?B?Tk9mZmRvQnR5MEdxeVpTNmdzRVI1MXNGTGdtMU9IcUtwaUtoRGdrczErV3ly?=
 =?utf-8?B?eGpQVVdJRFJnYm1hREx3TFQ0TXZTbXNUbHlGcWZGY2M5d3l6SFNSemNJMS9o?=
 =?utf-8?B?eExUVTVpTG92NUFJSjE1OXI3bllaSGVyYmV0MUwvYUQycTlPZmFpK1RJNytp?=
 =?utf-8?B?SkU2ZEZqM3RhVVpJQ09oRnZEendxWkNDYmhZMm84TFlnRHVFN0NVdnJMejcr?=
 =?utf-8?B?d3FPZFRjSHlWTHp0Qk5DQUc1eUZkNlZmUUhEK1JVYXJteEltN3hQbjR6anFp?=
 =?utf-8?B?bFdRcitYbzJHMmtrK29UdU5jWlllamk1WS9LSmY0czlJTm03WDZyQlhneGpt?=
 =?utf-8?B?d3BOOEtqS1k0eU5jai82WVRxOEVkKzBvb1hCWE5aZU9BaEhPMllYSC9mOG16?=
 =?utf-8?B?ck1Fb1p6bXlSR3lSSjJ1Q2ZVbC9yU3dDQmdSdTZTQTVSQ2R6L2NRNHpHVjJh?=
 =?utf-8?B?RUNERnFKRjI4My85M2E2bi9MTk5rK3plaHNwd0hJY0VwdThyS21wMWZSRmI1?=
 =?utf-8?B?cHR3Um90RlIvNm1rOGFIVWVkRjQ3SDMxbFlUdEZrZFBTUXFpUENpZFNuK1hK?=
 =?utf-8?B?US9hMlJEQzkvUXM5NVo5VGRuZUMwUFJpN1ZYNUNNTm14MmY0UGt2OVNYdGRB?=
 =?utf-8?B?YU5HaVFZbjJaMEQ2ZW0yTlM0WFJuVUlBb1RqaVVPUytFOU5ER3FOb3NUTEJi?=
 =?utf-8?B?a1pVN3Y2TmxqYnZjb2FRM0YyVHpSdXFzS0J5dFJwL09sS1IxU1RFZGcxREV5?=
 =?utf-8?B?VmY1U05Ib0Z5NFZSeUwxQzkwZEU4MVlDUUdNMHhhNWJTZThIZjZsUGxTaEMw?=
 =?utf-8?B?MkRQS0tvVkwwM1RxN0tYalRQOFNBQTRJWGZLVUJodURXaSs4YUsvQ3lFYUJ3?=
 =?utf-8?B?U0RFdlgyNlVsUTJmTngyU1U1L3BOWE90VzJuQTFCNkV1UGdnOHZEbzNpNUho?=
 =?utf-8?B?V2pMSmtJZUtKcTZpSmtEblBtcEtyVHJoNFpyVFlkRC9rYVRUdGRXZm9ldDdQ?=
 =?utf-8?B?VEpuajNCUGtNSTZHcnh1UjRFd0FZYnVEQ0UwWng4Y3hEU0FqWm13bThBU0wv?=
 =?utf-8?B?c01Md2pFOTZTeG0yM242VEUzdThRRHhRRTh6MUI4ZTBVTWQ1Y0IwTk5NVDBl?=
 =?utf-8?B?ZU85UUMyNVdhdUVrY1phbmNJM1poRGpwcnE0YXZLYnVDRUpOd2hlNXRVa0Vp?=
 =?utf-8?Q?of+5NIp8vwIb1yNP1k76MLr+QD4Nz4ukK90Xk=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THNleVAyT3N2cDJReVZMbmVoWUhlcEt2Wi93Rmxra093aVhldWFGa3lXTk14?=
 =?utf-8?B?TlFBUk5kcmJlekJZU1ZJYVdidEFjd1ZBSHl2c0FNVDRtVlUzM0pBa3BYalZU?=
 =?utf-8?B?UkMvZnRLRFJGeTFYbFdVYkRXRWxMNDYzMmpBdTB4T1U1clhTdFlYTHEvR05H?=
 =?utf-8?B?YUNydWlXTjg2eEttb1Z6QVBaaWdsSWZ3dUtVVmZyZVJKaS9IWHhvY01WaDdq?=
 =?utf-8?B?Z1JleEx5RXZjcVZHTEJ2dHZERzEyTmFVR1QwMkRNWUtkeWRSZXU5K2s0TnRD?=
 =?utf-8?B?M3k0WWxRbUk3dSt1NkVJcEVqZFJLREpGaXhLbnh4em5MTUh6d0wvNXdMVjFY?=
 =?utf-8?B?cFRHWmN6OGxSaXY2SEI2MDNCK1gvaVRZYW03OGp4RitCbFRxSy8wQ2Ird3Bp?=
 =?utf-8?B?WTEzZzU5ckZNRGlMMWp3MTQrK0pBd01mM1FVcFhGY0dVMXhjZDlWZnNIaE5J?=
 =?utf-8?B?cWZyeDVJT0k5TExQd2p2d1c2eUpyeDBhNVdBNnlvbWZLMGVJNzZyT3k5akZu?=
 =?utf-8?B?UVM3Ri8rNFlJSDBIcXlGUVZEUDVEQ3RaM3JDRk9oWGYycmJMNkpYQUd6VVJI?=
 =?utf-8?B?N1VobTJuK0VadlRlc2hHczNUYjVCOU8yU21zUVVDQ1JDS1pqRlVjWitUdHBo?=
 =?utf-8?B?aXNwcitVYjc3a0I4L2V3QzZrTUs1SXF2Q1VkbCtOd05qVWFZUFFwWk1Gc1Uv?=
 =?utf-8?B?Z1VvdDVFOUQyczdkQkRlaW9HNkh3V2FMN1BiVjVob2FTVGZxQldhTjRuRFJC?=
 =?utf-8?B?b2NjTTgrZmtGTzdZZW1BaktYV0V0cmxxVTJhekF1WERIUWVhdGhNM2VZZG0y?=
 =?utf-8?B?QVFGbm13cnFjQUM0REltQTVSMFNkU0FNRWdhc2RYN0NtV2d0ZS91SDRwRGpU?=
 =?utf-8?B?OXFmT0RHOEcxVWZ5TUFFV0cwYmEvSXR3QktyTTkyakgzMWRVMHZlazEvYWE5?=
 =?utf-8?B?NnNiMHpraldnazlUTWwySFd5YjlhZkRNWlljTXR0L2Y1eTFEbkEvV1VYVnNl?=
 =?utf-8?B?SGNzcTMzY05NMzBSTkN2dFNBK2t0TjAydytuSDRCeXdocnA4dXJUbk4yU253?=
 =?utf-8?B?dUtVeTFjZkdIVjFuZWhXR3cyeURtTUx6dStuNlVmSmZQU0ZqZGRvTktnejlI?=
 =?utf-8?B?bURZRTRWOENKdmVPY1VudTdQOFBucE5SdExhSDNCME9nMVJ6eEJqdlhiQ21a?=
 =?utf-8?B?SmdkVWtSRVh1SXRwRnhwOXdaU0IzdWdHckpZazZFWDJwV1k5RkR4VHd1U1k5?=
 =?utf-8?B?MjhTelVMdU9FQWozbnpsemx4OFBrMU04TTNmdXRjd0RkTm1OcEpzWmpaL082?=
 =?utf-8?B?UFl1ZHdTbHd2bnAyTExHazY5dTFEOVdRbkt2NU9kbjdLRDhBRFlJN2EzTmQ2?=
 =?utf-8?B?L25nbU03TWdIT0F2UlJnQlFMY24veFlkY29mVWdwNE5tdDZtS29GZUc2aGs1?=
 =?utf-8?B?TFVRY1ZFVit3bXcrOGJPcWM4MFBHanljWGpmVU82cERLQ2RBZUlrMzdSTGNp?=
 =?utf-8?B?QUJhbGtGNGIxcUxYM0c2MDZWaUFiOXA3MUZ1MUU2UmVWN3VJak5WVTQyQ2JX?=
 =?utf-8?B?RnZBSEJ6b1R6dUlla0FBSE41NFIwSjJCeHRXN0QzcXJGeDBaWlJGMmVJQ0xu?=
 =?utf-8?B?R0ZhUk9seisxWkJVNWlvaldpWXVZUFM3VERvK0xDdi9Dd1lkdVZCUFJpd0ti?=
 =?utf-8?B?Qk5SdjJWS01scExoS0xtNy9KVG9wUE1ZaHM3dnRqZG5aNXBCbjhGSHdUSkNO?=
 =?utf-8?B?bHAxK1B0VEl5WWViYjdpaXZFeTdkUFQrdXM1bUtoU3JveGVLeFliaHVOUVNC?=
 =?utf-8?B?MDVLUHZRV01pZHJRRDlhaFI0a3QwekxhdUZYOUkwdkhWTmhpbmhJMUxaSGtr?=
 =?utf-8?B?bDh4NzhlalgrWmNkS3RaSGhURTNoSXdMb3FGek9hN2lHWEVYYWNFS3FPcE5T?=
 =?utf-8?B?WVpVUXpqVkZYU3VnUEhHSE0rV3BXOVpNR2tiU2lPbjBHUDkySWQ2bmlSa01N?=
 =?utf-8?B?NWd6T2VPZlMrbjdGVWVYKzBhRnhlWjdjMkFsOHJpSjNDYXdlN3ZCVXdWR0ZR?=
 =?utf-8?B?cGNHdlQrdW9aTFA1SE8weERMK0s5OXRKeHBqTHNSbjcyTE5pOGMrZjJTVlRE?=
 =?utf-8?Q?OPOIFJnSST3OpEXSNh2UsGOdi?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d7efc32c-dd3b-403e-be1d-08dc9a7d6432
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 09:57:32.2214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2UThZTChbDT+y2zB41wKl2sRF6VgUUUQV5gUe07qCKwfy3ktty/9AQuJDl/QtttL2AiH5HG3us3lSwhQqszJE385FBaYZQqa28Uw3XDGKEI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7498
X-Proofpoint-ORIG-GUID: KKtZEPiFMQDOZZEF3v5qgXU4YgWNzUDn
X-Proofpoint-GUID: KKtZEPiFMQDOZZEF3v5qgXU4YgWNzUDn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_06,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020074

SGkgUm9iLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFJvYiBIZXJy
aW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxLCAyMDI0
IDU6MjggUE0NCj4gVG86IEFnYXJ3YWwsIFV0c2F2IDxVdHNhdi5BZ2Fyd2FsQGFuYWxvZy5jb20+
DQo+IENjOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBIZW5uZXJpY2gsIE1pY2hhZWwgPE1pY2hhZWwuSGVu
bmVyaWNoQGFuYWxvZy5jb20+Ow0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgQXJ0YW1v
bm92cywgQXJ0dXJzDQo+IDxBcnR1cnMuQXJ0YW1vbm92c0BhbmFsb2cuY29tPjsgU2EsIE51bm8g
PE51bm8uU2FAYW5hbG9nLmNvbT47DQo+IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92
QGdtYWlsLmNvbT47IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWthc0Bh
bmFsb2cuY29tPjsgQ29ub3IgRG9vbGV5IDxjb25vcitkdEBrZXJuZWwub3JnPjsNCj4gR2Fza2Vs
bCwgT2xpdmVyIDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cuY29tPjsgbGludXgtaW5wdXRAdmdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMi8yXSBkdC1iaW5kaW5nczogaW5w
dXQ6IFVwZGF0ZSBkdGJpbmRpbmcgZm9yIGFkcDU1ODgNCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+
IA0KPiBPbiBNb24sIDAxIEp1bCAyMDI0IDE2OjA0OjUxICswMTAwLCBVdHNhdiBBZ2Fyd2FsIHdy
b3RlOg0KPiA+IFVwZGF0aW5nIGR0IGJpbmRpbmdzIGZvciBhZHA1NTg4LiBGb2xsb3dpbmcgcHJv
cGVydGllcyBhcmUgbm93IG1hZGUNCj4gPiBvcHRpb25hbDoNCj4gPiAJLSBpbnRlcnJ1cHRzDQo+
ID4gCS0ga2V5cGFkLG51bS1yb3dzDQo+ID4gCS0ga2V5cGFkLG51bS1jb2x1bW5zDQo+ID4gCS0g
bGludXgsa2V5bWFwDQo+ID4gVGhlIHByb3Bvc2VkIG5ldyBwcm9wZXJ0eSAiZ3Bpby1vbmx5IiBo
YXMgYmVlbiBhZGRlZCBhcyBhbiBvcHRpb25hbA0KPiA+IHByb3BlcnR5IHdpdGggYW4gYWRkaXRp
b25hbCBleGFtcGxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVXRzYXYgQWdhcndhbCA8dXRz
YXYuYWdhcndhbEBhbmFsb2cuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9pbnB1dC9hZGksYWRwNTU4OC55YW1sICAgICB8IDI4DQo+ICsrKysrKysrKysrKysrKysr
Ky0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+ID4NCj4gDQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5k
aW5nX2NoZWNrJyBvbiB5b3VyIHBhdGNoOg0KPiANCj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3Jz
Og0KPiANCj4gZHRzY2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gL2J1aWxkcy9yb2JoZXJy
aW5nL2R0LXJldmlldy0NCj4gY2kvbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2lucHV0L2FkaSxhZHA1NTg4LnlhbWw6IGdwaW8tDQo+IG9ubHk6IG1pc3NpbmcgdHlwZSBk
ZWZpbml0aW9uDQoNClRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLCBJIHdpbGwgZml4IHRoaXMg
YW5kIGNvbmZpcm0gd2l0aCBkdF9iaW5kaW5nX2NoZWNrIGJlZm9yZSByZXN1Ym1pdHRpbmcgdGhl
IG5leHQgdmVyc2lvbi4NCj4gDQo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNoZWNr
ZG9jcyk6DQo+IA0KPiBTZWUNCj4gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9kZXZpY2V0cg0KPiBlZS1iaW5kaW5ncy9wYXRj
aC8yMDI0MDcwMS1hZHA1NTg4X2dwaW9fc3VwcG9ydC12NC0yLQ0KPiA0NGJiYTA0NDVlOTBAYW5h
bG9nLmNvbV9fOyEhQTNOaThDUzB5MlkhNkRhUTVhM2l3M2t6eld3Q3BEejlLNVgNCj4gQUJuSUhY
TnNYTVR5YUdBYzUzWUoxZ1lCZ1N3S3lpUE1TbDYyMFhvMm9rQ0lRMVAxZnRVMHJKa0Q1JA0KPiAN
Cj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMxLiBB
IGRpZmZlcmVudCBkZXBlbmRlbmN5DQo+IHNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0Y2gu
DQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5kIGRp
ZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxpbnQn
IGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+IA0KPiBwaXAz
IGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJlLXN1
Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlDQo+IHRo
YXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBzcGVl
ZCB1cCBjaGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNldCB0
byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXINCj4gc2NoZW1hLg0KDQo=

