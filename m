Return-Path: <linux-input+bounces-5384-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B6948D0F
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 12:46:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 07711B25FA5
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 10:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB521BE852;
	Tue,  6 Aug 2024 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="iNiX4yV/"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AA1BBBF5;
	Tue,  6 Aug 2024 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941188; cv=fail; b=VJf/ZbXLh8qMs7bYgWh63prtZT5cqXhssOyZS6XwLlP85Q/Ib3ZTgB3jaGqpUIDSb+RxkDOtqV70CHZQn+3/xvorRMm9Bf/5msiw20lXwngxvcM06uvioLg7dBbCSjaxZ01SF+tCBcQTz3iDxV7aXUt3DtnY4BSO35JTFHk9uqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941188; c=relaxed/simple;
	bh=stvz+DjYHr2neEu/GiYqN1X7GMs/OjcyOAJOoaVL8V0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V/uW92JDzThVPMHxlOS9bnIEx/3wemvYwem/jN+hKNA0eghNSvHVHiVkLHp6QRo+UbfRGvxrvpgeA7J0znVVZuV9jEYS1EqhO6nLYoH8pW2B9tyyvOUUV+EVg7AjHKMxlPq5yNvcoESQtxY6Faajv/E9tNVYt2/YO+1x4i9YEOE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=iNiX4yV/; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375854.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4769DgMb027167;
	Tue, 6 Aug 2024 06:05:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=stvz+
	DjYHr2neEu/GiYqN1X7GMs/OjcyOAJOoaVL8V0=; b=iNiX4yV/NCrvXiImGGZKX
	IaPdX3tJoj19y1tk+Nw9VeJfUXzn/6hNbTKSG7J7wLhvBkvgr+ZhmW5/VYKmOmdm
	KgtHM7+r3ox53nabuDzDL5lKV9Cg6M0TR75Y0rPMDZjNy3E3zaBmgQ0T5g/+ttNP
	Pzxoi1nj8+HwyccY9geGJkmN/Adni7k17ZrHfApBh3j72SaX3wIrxBCO3r7EPD3D
	nfiB3OfcoqKPhs4AcLwUTH1VkmnwAtEjhIAbbht/kR3x1u4NMB6ciL01tze6/Sth
	5305QCJu4Oy5nM2ilRPCwX8Wrkr2i2/RxiltuuBTX+xU5KOXPINPFM8ZhSt5Vl+j
	w==
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2043.outbound.protection.outlook.com [104.47.74.43])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 40uh1084fa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 06:05:09 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeDZ4fLfrEHd1vlE6CtWoZ4lJE/Wo1hMfC6XCWMie3tfnR9rEdsahiPKY6/LZ+APoVvAP2+/SjMXjCHioCStHFuUKCXGWHoHIRTgn3ESVssVMjfYMAkvwClXyQ9/HgvPvSTHuaO+OTtye0jHFflVgPRGGRXaM4kN4SCRA50zR26HsWMIBX/9UfDS8xmSDq/BVN7ae7jW/Apc/480NCiLkPZOKosklFHorRU0IYiYRNSgQ7H7TF6rshuvJ+SiEw9gV+Fz0RzIbFujX1aXjxMjFNyz6QGwYnlxEtRL+kuDa8wX1Dz/+nj0GbnQ+jGSJQBMmdyp/RkwW9QLQuI2Hz4DLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=stvz+DjYHr2neEu/GiYqN1X7GMs/OjcyOAJOoaVL8V0=;
 b=mj8lB9eeGwVbWoOd4MyId5nMUUBsh+2+xrXf5VZf1NVOQlMzmDLEuejZ+4hYBiG+48TeQGh8IKpPwFVovTG8cxcjAD1c7QaTXnbbB0w4CrmbIk2f5NWiomoG4nY19doah8Zr5Un8+KbLVeBGDLjjrPWE5UzzK7uX4RxGokfAHI5loCq4R1vHJ2VnQB2IYeGQw8PuIFre42zXULKeHN4O7kLXBZZUJvTSLxaNqF9cCq+YByMGlutaqP9Zzt4kv6blxcyOM8w6dgLQwGKNYPy86j/zEjw+K1dOldxXbMV0cQW7d5ta2ZWHwpwlezcgxst6sTGOXLfnlR7We2suW9AYjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by PH8PR03MB7199.namprd03.prod.outlook.com (2603:10b6:510:25f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 6 Aug
 2024 10:05:04 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7807.025; Tue, 6 Aug 2024
 10:05:04 +0000
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
Subject: RE: [PATCH v9 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v9 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHa592QBCbhNj0ADkGOcuobi0iFlrIZ72sAgAAEJgA=
Date: Tue, 6 Aug 2024 10:05:04 +0000
Message-ID:
 <SJ0PR03MB6343E06A1009171EB4E9AD9F9BBF2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
 <20240806-adp5588_gpio_support-v9-3-4d6118b6d653@analog.com>
 <c230faec-d359-461e-a717-6708d2710e42@kernel.org>
In-Reply-To: <c230faec-d359-461e-a717-6708d2710e42@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3ROVGd4WXpnMFlUVXROVE5rWWkweE1XVm1MVGcw?=
 =?utf-8?B?Wm1FdE5qUTBPVGRrWTJVMVpqZzFYR0Z0WlMxMFpYTjBYRFU0TVdNNE5HRTJM?=
 =?utf-8?B?VFV6WkdJdE1URmxaaTA0TkdaaExUWTBORGszWkdObE5XWTROV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU1URXpNVEFpSUhROUlqRXpNelkzTkRFeU16QXlORFEyT1RR?=
 =?utf-8?B?NU9DSWdhRDBpUzBWQk1GVndlR2RyS3l0c2MzSjNRM0ZtUmtaUEwyZzVUWFZa?=
 =?utf-8?B?UFNJZ2FXUTlJaUlnWW13OUlqQWlJR0p2UFNJeElpQmphVDBpWTBGQlFVRkZV?=
 =?utf-8?B?a2hWTVZKVFVsVkdUa05uVlVGQlJHZEVRVUZFTmtSWmEyRTJUMlpoUVdKT05G?=
 =?utf-8?B?WjFLMFJZYkhkSWN6Tm9WemMwVG1WWVFXTkVRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVaEJRVUZCUkdGQlVVRkJVMmRKUVVGUE5FRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVWQlFWRkJRa0ZCUVVFelRHaFRabWRCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRktORUZCUVVKb1FVZFJRV0ZSUW1aQlNFMUJXbEZDYWtGSVZV?=
 =?utf-8?B?RmpaMEpzUVVZNFFXTkJRbmxCUnpoQllXZENiRUZIVFVGa1FVSjZRVVk0UVZw?=
 =?utf-8?B?blFtaEJSM2RCWTNkQ2JFRkdPRUZhWjBKMlFVaE5RV0ZSUWpCQlIydEJaR2RD?=
 =?utf-8?B?YkVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUlVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGblFVRkJRVUZCYm1kQlFVRkhSVUZhUVVKd1FVWTRRV04z?=
 =?utf-8?B?UW14QlIwMUJaRkZDZVVGSFZVRllkMEozUVVoSlFXSjNRbkZCUjFWQldYZENN?=
 =?utf-8?B?RUZJVFVGWWQwSXdRVWRyUVZwUlFubEJSRVZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFWRkJRVUZCUVVGQlFVRkRRVUZCUVVGQlEyVkJRVUZCV1ZGQ2Ew?=
 =?utf-8?B?RkhhMEZZZDBKNlFVZFZRVmwzUWpGQlNFbEJXbEZDWmtGSVFVRmpaMEoyUVVk?=
 =?utf-8?B?dlFWcFJRbXBCU0ZGQlkzZENaa0ZJVVVGaFVVSnNRVWhKUVUxblFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUpCUVVGQlFVRkJRVUZCU1VGQlFVRkJRVTgw?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUTBGQlFVRkJRVUZCUVVGSlFVRkJRVUZCUVVGQlFXZEJR?=
 =?utf-8?B?VUZCUVVGQlFVRjZaMEZCUVVGTlFVRkJRazlCUVVGQlFVRkJRVUZIUlVGYVFV?=
 =?utf-8?Q?JwQUY4?=
x-dg-refone:
 QWN3QmxBR01BZFFCeUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0JtQUdFQWJBQnpBR1VBWHdCbUFHOEFjd0JwQUhRQWFRQjJBR1VBQUFBOEFBQUFBQUFBQUdFQVpBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFERUFBQUE4QUFBQUFBQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURJQUFBQT0iLz48L21ldGE+
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|PH8PR03MB7199:EE_
x-ms-office365-filtering-correlation-id: dabb1578-f5a3-4271-837d-08dcb5ff3e32
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?NytKUWxqWHFrZ3VQcTh4SytHRThITGNYVUliVHc3dEQ1N2lwNCtrOWZPVE05?=
 =?utf-8?B?Vkh5a1lpejUwMzRRbGhQclJmNXIraEtwVnpKY2d4M05DU0VscG5mTG1lYkls?=
 =?utf-8?B?Nk12eVJ2aHRyd3pKc042Ymp3M1E4cmkyY3hKVW50Y0pPcXdyQ1RxTnZ2QnVK?=
 =?utf-8?B?a29JMTZEK3lNenlKOWhiVXRVWE9MU2NoOUs1Z3hmTG1ZMS8xaEJDK2piMFc3?=
 =?utf-8?B?TjFuVUdlN1lEeDZ2UnNUV3I3TmVFTEUyVlBucEMrWVl3akh1Qi9kNU1TRlV5?=
 =?utf-8?B?OGxpczc1bFcxSzM2TnphejdYeEw2a3MvSDNMYTZhUWpzcEI3ekVXa2hlYWRk?=
 =?utf-8?B?bm1QQmlqZkNtMDdpNTNWaVhRcWlYSlltK3pOZjh3djVpTmd6UVBydlcraWYz?=
 =?utf-8?B?R25LVFBHRG9IdWlnUjBrZ1dCcGtSUkhuQmF4enE1YXJZRC9qYmhXcE45RElQ?=
 =?utf-8?B?c05ubTgvL2RRMnNWQVhQZmo4eE1aZ0w0RyszRCtQQUdtWmlxbm5LOUFUOVpx?=
 =?utf-8?B?RjZpdURCbG11UDhVZHlibE55ZzBGOHUxWW5hZGpub01vbUZlY1RjWXcwT1Zr?=
 =?utf-8?B?dThsY0VIM1FqYjZ2M0hKZWdlakZwcDAxdEtqWjA3SVp1alg4cEhmaWJVam9t?=
 =?utf-8?B?NnAzeUowNXVPa3FjOHQwczl2ZWxhdzV1NTBMSUQwUFRrQVM3aWo3MXlUYnVX?=
 =?utf-8?B?YSs5OUtucHlKNnZZS2RsQ3ZJZ2xxakFqdHdxVXQxcW83dTFLbTQzVzdUYlIy?=
 =?utf-8?B?dEloK1F0aHM0NzRHR28rNTRkUDE0cCtmVU9DZS9wMXo5eFJvWVZHYjE4Vml3?=
 =?utf-8?B?dmZJSmFIRXFzWmFOOGtMUHBVajVpS3JBeExHeGNGdXRVa2RGZFhUQnBIVFZl?=
 =?utf-8?B?RmcwWnNSSHI3bmlJUVgwZ2FRWGN5WFpqdXpWMWNlMnFQNDh4M3VJQWNjb3BM?=
 =?utf-8?B?cjdYSFJqSkJJY2FQeVpxQUdEVzV0VERUempDaFdsaUo0YmRtZkRJTzNzcldM?=
 =?utf-8?B?TjZjVXZXSWhsTjJnVkp1K2lNRzNDZ1MwWjJEVERXR3FRUDlqMHFjTVVocS9S?=
 =?utf-8?B?Q21BcUlMRTl1VnZXVWZVbFpYY3ZhajlNdi9HUUJ4cDNDQUgxcmVoWFFiZ1lF?=
 =?utf-8?B?Q2kvaElMbnJnOFlHMGRuRWRKRHFUdHlWWjR0V3Z3K3ROMk0wY1R5MFVST1RC?=
 =?utf-8?B?RktXdVVpcGtpNm1QVmpxM1hJcDUrQWR0b3RJVkFOcFFTWHV3clgrTkFKb2N0?=
 =?utf-8?B?UmtxMVh2RDNiUVBTc3hENnBJMVhCWlpSTDNVQmkrcDBBNFNrZmgyUVJwRDI2?=
 =?utf-8?B?SEFmbVFVcHNhSVpDY0VTVkhKbmZHS3lQenRKUS9MbG03aDZ2OEtxeDlxeTVv?=
 =?utf-8?B?Umt0NnEyQUxUUUdxdU5yemx1dzRkNGM5ZkJJVS9RUm5DZ1lTR09RMEMzT1ZY?=
 =?utf-8?B?WFllSHFZQVBId1FPMTlXaWl1WXMvdlM1K2F0WjFEYk40UWxFcjRhdnppdXg0?=
 =?utf-8?B?Q0tZdXBsTTBFZWttbEJveTBlRlNkOW1qTWhPeFlOcFBDODJnS3JWM0hTNC9W?=
 =?utf-8?B?M1U2WmdueXA3eVFabXRxVGo2SGllOENOMVlzczNIWFl4dkpQUy9KWDJSd0VL?=
 =?utf-8?B?RDNmUlUyTFoxbytCNEt5bGhEREx6c3BaYXBpSUJneG53UWpLWVNEZkYzWjcv?=
 =?utf-8?B?cTVqVkRObWtPc09UelBKTEpmZ3NhQUZGaHJ4Wmp4YTdhanpHM3dpaUR2TitB?=
 =?utf-8?B?TVlhazN4UElkdzVTZzdGTEZFaHNSbjhBeVJvb3pGVjllZmFnK0hZWEZPc2FW?=
 =?utf-8?B?V0RuUEhWUXpiaEJISlErUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RS9EejJzRldCYWxzeUVrd2JlS2N1b0xjNVdoaTAwM0hrQS9uVHJaQ3pyenlN?=
 =?utf-8?B?ZTVyeC9aMHBuUDJiM2d0b1FubTFNTEJKM2Z1dk03M1BzWDQrVjUzbERrV0ZE?=
 =?utf-8?B?Rms5MFhzUjU4TlpzSW9aTlVoa3gwNGtqNUorMGxoTUlRMFZFUzZBMmpvN3pQ?=
 =?utf-8?B?clFnV1hsZFRsUnlDc3dPaHZ0aU1XbHpaS2ZtSXdMSmlERS9ZN21oaUZDSktN?=
 =?utf-8?B?OVZJZ0I4SVhXa21IUGMyMzBFV1M4eWF4ZEFhODhieEw0UlY0bW9NZGUxYVhR?=
 =?utf-8?B?bFVQUzA0WE8rbEhJUndVVWpSZ3BuVkEyZ1VGejcxOU82WExHM0pyeERCOVBm?=
 =?utf-8?B?aWM3S25XZ3JzSnhwY0k3TzJRWDUzS3FWbm5tQ3VzcFlsWnZJWWxCWmo0NGtL?=
 =?utf-8?B?VzhVUUNmaGtGSmp1VHJUNjExMUsxKzN4RmdKTUU4RTV1MXpobm1kWEs3QWY3?=
 =?utf-8?B?OUxWRkFZR1FIWjRHR0lRaXdvR2d5dlNxRGlkYWxxTjVXdFIweW9TelMza0lS?=
 =?utf-8?B?alVsaDhWN29LVlo5TFJkTWdjS3o4MldleW1EVWF2UkxwbG5EaWQ5dGVvc1Nh?=
 =?utf-8?B?N1hxTE03c2I0Z1d3ZFZxd3dMd3pXMExyQlIxZFdhOXFSUEpQcytMc1dzalg3?=
 =?utf-8?B?S0JiOVBNM1dNaTdUS0ZYZExMSys1RklJM2ZIQTJiWHhPRFQ0c25teTRrcUIr?=
 =?utf-8?B?SlNMMmYza2Jwem13NEE2UkEyVW9QdkFDMHhIbFNOc0xCZ2hLaytTRitxeG9D?=
 =?utf-8?B?RytCMDNwQVl6NWJ2UkVLNU5mcURKb1NpUmUxYVFGTUt5ZjBWYjBCWTZrcStS?=
 =?utf-8?B?S2loU1NBdWtTNkxERS9BOU5RUlJZclVRYWtrci96Ym8xZUxQVDBrM1htUDdX?=
 =?utf-8?B?T2xSRExxQVd2S3RtZFdXZ0Z3bGVER2JwSWVwZmxkbWF2cythSXo5ZGZXWGdW?=
 =?utf-8?B?Z2NMSThhQnFlN3hKNk84Q1lLeEdBZTBXWUFCK2d2UkNTb3d6WWdMSWFxOGFn?=
 =?utf-8?B?TmpYb1F6WlFvaFVFQkVGQmtDQ1JJM2JYa2tsR0R6MmhTOC9FQlhHcjVqRU5V?=
 =?utf-8?B?VGRJYmRXRG0xUGxmUy9VZ1N2cTZMK2tXRXdrT1JIZnNzd1M3NGZidk0yL0pK?=
 =?utf-8?B?bHJyUXArM1VydVpSa2JKZDdwREFBYjNvSUVmZHZteFU1MHdDUnZER20xN3RX?=
 =?utf-8?B?cU9hNnliek42U2tqTnVxRnYwUktEVndua0V2bFdhNnBaL3gzTS9naWlJLzVL?=
 =?utf-8?B?TXBQSndoNFZlN1FWaCtsNXNzV2NtSll2d2ROczBCRFVvTnBCY21BZEUyZWhq?=
 =?utf-8?B?V25wTENRd3ZUSFBnbEp6UHNXTzlHR0xrUzVoWkVaaGFic1ZnS1NNWVFLZ0tX?=
 =?utf-8?B?eFZ1MUp5SmRKOFJWSVp5YUNGZUdLM3dPUG1sSjZkZEdOT2hrdTA1cDNCN2VF?=
 =?utf-8?B?aFF6QTh5K2RiYlg2T2luYnRVSUFNcWZUYlZielh2VHV2blkvMWxiQ1hxTWRP?=
 =?utf-8?B?TEJiOFlqT05vMjdkUEdGRnVnMEZxL051VnVXVzUwWGdiaGZNODZoNUt1dldv?=
 =?utf-8?B?SjRialVrRkx3Q3dCdWdRVytQcUpNQThFYjBWK0VaSHV1Y1pLS3FhOWp2Y0RD?=
 =?utf-8?B?aTREZ2pFRVAwQVFicml5djAzajE2cFZvNHhmeEpoelZNK00yMWw2RHJwc24v?=
 =?utf-8?B?N3RPZS9HNnk4NWZBMmJUbmtYWitqS285Y3BIL2dYS3JWN2J1V3p0ZVlPQkF5?=
 =?utf-8?B?VUpOUXFVQ3FmTzhVenNLd0xBdEQwU2N6VWNqMDJUYUpsTWVZQ3ZtMW8zbUY2?=
 =?utf-8?B?aXdNUE50NDhPdGJGSkJwMDNZR25WMXhxcWEzMytsbHpveUVTQVlaWlB6Ym1x?=
 =?utf-8?B?T0dqc3ZwdENKdC9kNkhpcVFvZnMxbVRFMGxuS3cvR3k0ZkNCOGROWlQzckNz?=
 =?utf-8?B?a1V5R2ZDdklYL0xyZFREbVZUNCtDQ2pRK1Q3dW9oRXhFcVRrNHRUR0luekhJ?=
 =?utf-8?B?Mjg3YlY5RTJHbmNWM0tpODFhTStydTFVTmd2RS9uVnBETU8rRTJDVGh5TTZx?=
 =?utf-8?B?YmNScWxjTmJYYXkzUC9vYXd3SXNVZ0MzUjdWYk40Z1ZqSlZtOTg4aG5FcnM2?=
 =?utf-8?Q?a1LVWMYqmqnN4ZIBb0aK5zD2b?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dabb1578-f5a3-4271-837d-08dcb5ff3e32
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 10:05:04.3930
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bgMovlzD6tZhMCIvb1BvNTfc4kfAlLr7CRaUxL6VjD/dlH80SPj8oSTKJVpUhhJXI99AxPE8HaMMhammLnVhQzBkl94IgM4zrvLMaiaPmCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR03MB7199
X-Proofpoint-GUID: 2hD032CgSz4lGTrsGbk5dDXj52WyuROh
X-Proofpoint-ORIG-GUID: 2hD032CgSz4lGTrsGbk5dDXj52WyuROh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060070

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgNiwgMjAyNCAx
MDowNCBBTQ0KPiBUbzogQWdhcndhbCwgVXRzYXYgPFV0c2F2LkFnYXJ3YWxAYW5hbG9nLmNvbT47
IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IERt
aXRyeSBUb3Jva2hvdg0KPiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT47IFJvYiBIZXJyaW5n
IDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YNCj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5l
bC5vcmc+OyBDb25vciBEb29sZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTYSwNCj4gTnVubyA8
TnVuby5TYUBhbmFsb2cuY29tPg0KPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBk
ZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IEFydGFtb25vdnMsIEFydHVycw0KPiA8QXJ0dXJzLkFydGFtb25vdnNAYW5hbG9nLmNvbT47
IEJpbXBpa2FzLCBWYXNpbGVpb3MNCj4gPFZhc2lsZWlvcy5CaW1waWthc0BhbmFsb2cuY29tPjsg
R2Fza2VsbCwgT2xpdmVyDQo+IDxPbGl2ZXIuR2Fza2VsbEBhbmFsb2cuY29tPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY5IDMvM10gZHQtYmluZGluZ3M6IGlucHV0OiBVcGRhdGUgZHRiaW5kaW5n
IGZvciBhZHA1NTg4DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBPbiAwNi8wOC8yMDI0IDEwOjQ4
LCBVdHNhdiBBZ2Fyd2FsIHZpYSBCNCBSZWxheSB3cm90ZToNCj4gPiBGcm9tOiBVdHNhdiBBZ2Fy
d2FsIDx1dHNhdi5hZ2Fyd2FsQGFuYWxvZy5jb20+DQo+ID4NCj4gDQo+IEEgbml0LCBzdWJqZWN0
OiBkcm9wIHNlY29uZC9sYXN0LCByZWR1bmRhbnQgImR0YmluZGluZyIuIFRoZQ0KPiAiZHQtYmlu
ZGluZ3MiIHByZWZpeCBpcyBhbHJlYWR5IHN0YXRpbmcgdGhhdCB0aGVzZSBhcmUgYmluZGluZ3Mu
DQo+IFNlZSBhbHNvOg0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNy0NCj4gcmM4L3NvdXJjZS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc3VibWl0dGluZy0NCj4gcGF0Y2hlcy5yc3QqTDE4X187SXchIUEz
Tmk4Q1MweTJZIV9weC0NCj4gU2tDYUFPZXpDYV9zMGVpUDVCVGxpTG12eUExMTBkNE1YYWhmOG1I
a0FYcjB2SnRwTTBFWHU3RXNvRzJqV2cNCj4gNXFXOUZnYVlmMmdDWmYkDQo+IA0KPiBTdWJqZWN0
OiBldmVyeXRoaW5nIGlzIGFuIHVwZGF0ZS4gQmUgZGVzY3JpcHRpdmUgYW5kIHNwZWNpZmljLg0K
PiANCj4gPiBVcGRhdGluZyBkdCBiaW5kaW5ncyBmb3IgYWRwNTU4OC4gU2luY2UgdGhlIGRldmlj
ZSBjYW4gbm93IGZ1bmN0aW9uIGluIGENCj4gPiBwdXJlbHkgZ3BpbyBtb2RlLCB0aGUgZm9sbG93
aW5nIGtleXBhZCBzcGVjaWZpYyBwcm9wZXJ0aWVzIGFyZSBub3cgbWFkZQ0KPiANCj4gSGFyZHdh
cmUgY2hhbmdlZD8gSG93Pw0KDQpUaGUgaGFyZHdhcmUgd2FzIG5vdCBjaGFuZ2VkLCByYXRoZXIg
c3VwcG9ydCB3YXMgYWRkZWQgZm9yIGFuIGFscmVhZHkNCnByZXNlbnQgZnVuY3Rpb25hbGl0eSBp
biByZWdhcmQgdG8gYSBuZXcgdXNlIGNhc2Ugd2hlcmUgdGhlIGNoaXAgd2FzIGJlaW5nIA0KdXNl
ZCBwdXJlbHkgZm9yIGdwaW8uIEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1pdCBkZXNjcmlwdGlvbiB0
byBiZSBtb3JlIGVsYWJvcmF0ZS4NCg0KPiA+IG9wdGlvbmFsOg0KPiA+IAktIGludGVycnVwdHMN
Cj4gPiAJLSBrZXlwYWQsbnVtLXJvd3MNCj4gPiAJLSBrZXlwYWQsbnVtLWNvbHVtbnMNCj4gPiAJ
LSBsaW51eCxrZXltYXANCj4gPg0KPiA+IEhvd2V2ZXIgdGhlIGFib3ZlIHByb3BlcnRpZXMgYXJl
IHJlcXVpcmVkIHRvIGJlIHNwZWNpZmllZCB3aGVuDQo+ID4gY29uZmlndXJpbmcgdGhlIGRldmlj
ZSBhcyBhIGtleXBhZCwgZGVwZW5kZW5jaWVzIGhhdmUgYmVlbiBhZGRlZA0KPiA+IHN1Y2ggdGhh
dCBzcGVjaWZ5aW5nIGVpdGhlciBvbmUgd291bGQgcmVxdWlyZSB0aGUgcmVtYWluaW5nIGFzIHdl
bGwuDQo+ID4NCj4gPiBOb3RlIHRoYXQgaW50ZXJydXB0cyBhcmUgb3B0aW9uYWwsIGJ1dCByZXF1
aXJlZCB3aGVuIHRoZSBkZXZpY2UgaGFzDQo+ID4gZWl0aGVyIGJlZW4gY29uZmlndXJlZCBpbiBr
ZXlwYWQgbW9kZSBvciBhcyBhbiBpbnRlcnJ1cHQgY29udHJvbGxlci4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFV0c2F2IEFnYXJ3YWwgPHV0c2F2LmFnYXJ3YWxAYW5hbG9nLmNvbT4NCj4gPiAt
LS0NCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvYWRpLGFkcDU1ODgueWFtbCAg
ICAgfCA1MQ0KPiArKysrKysrKysrKysrKysrKysrLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9hZGksYWRwNTU4OC55YW1sDQo+
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2FkaSxhZHA1NTg4Lnlh
bWwNCj4gPiBpbmRleCAyNmVhNjY4MzRhZTIuLjgyN2Q3MmVjZTU0YiAxMDA2NDQNCj4gPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvYWRpLGFkcDU1ODgueWFt
bA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9hZGks
YWRwNTU4OC55YW1sDQo+ID4gQEAgLTQ5LDcgKzQ5LDEyIEBAIHByb3BlcnRpZXM6DQo+ID4gICAg
aW50ZXJydXB0LWNvbnRyb2xsZXI6DQo+ID4gICAgICBkZXNjcmlwdGlvbjoNCj4gPiAgICAgICAg
VGhpcyBwcm9wZXJ0eSBhcHBsaWVzIGlmIGVpdGhlciBrZXlwYWQsbnVtLXJvd3MgbG93ZXIgdGhh
biA4IG9yDQo+ID4gLSAgICAgIGtleXBhZCxudW0tY29sdW1ucyBsb3dlciB0aGFuIDEwLg0KPiA+
ICsgICAgICBrZXlwYWQsbnVtLWNvbHVtbnMgbG93ZXIgdGhhbiAxMC4gVGhpcyBwcm9wZXJ0eSBp
cyBvcHRpb25hbCBpZg0KPiA+ICsgICAgICBrZXlwYWQsbnVtLXJvd3Mgb3Iga2V5cGFkLG51bS1j
b2x1bW5zIGFyZSBub3Qgc3BlY2lmaWVkIHNpbmNlIHRoZQ0KPiA+ICsgICAgICBkZXZpY2UgdGhl
biBhY3RzIGFzIGdwaW8gb25seSwgZHVyaW5nIHdoaWNoIGludGVycnVwdHMgbWF5IG9yIG1heQ0K
PiA+ICsgICAgICBub3QgYmUgdXRpbGl6ZWQuIElmIHNwZWNpZmllZCBob3dldmVyLCBpbnRlcnJ1
cHRzIG11c3QgYmUgYWxzbyBiZQ0KPiA+ICsgICAgICBwcm92aWRlZCBhcyBhbGwgaW50ZXJydXB0
IGNvbW11bmljYXRpb24gaXMgaA0KPiANCj4gRG9uJ3QgcmVwZWF0IGNvbnN0cmFpbnRzIGluIGZy
ZWUgZm9ybSB0ZXh0Lg0KPiANClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhlIHNhbWUgb3V0LCBJ
IHdpbGwgcmVtb3ZlIGl0Lg0KPiANCj4gYW5kbGVkIHZpYSBhIHNpbmdsZQ0KPiA+ICsgICAgICBp
bnRlcnJ1cHQgbGluZS4NCj4gPg0KPiA+ICAgICcjaW50ZXJydXB0LWNlbGxzJzoNCj4gPiAgICAg
IGNvbnN0OiAyDQo+ID4gQEAgLTY1LDEzICs3MCwzMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAg
bWluSXRlbXM6IDENCj4gPiAgICAgIG1heEl0ZW1zOiAyDQo+ID4NCj4gPiArDQo+ID4gK2RlcGVu
ZGVuY2llczoNCj4gPiArICBrZXlwYWQsbnVtLXJvd3M6DQo+ID4gKyAgICAtIGxpbnV4LGtleW1h
cA0KPiA+ICsgICAgLSBrZXlwYWQsbnVtLWNvbHVtbnMNCj4gPiArICBrZXlwYWQsbnVtLWNvbHVt
bnM6DQo+ID4gKyAgICAtIGxpbnV4LGtleW1hcA0KPiA+ICsgICAgLSBrZXlwYWQsbnVtLXJvd3MN
Cj4gPiArICBsaW51eCxrZXltYXA6DQo+ID4gKyAgICAtIGtleXBhZCxudW0tcm93cw0KPiA+ICsg
ICAgLSBrZXlwYWQsbnVtLWNvbHVtbnMNCj4gPiArICBpbnRlcnJ1cHQtY29udHJvbGxlcjoNCj4g
PiArICAgIC0gaW50ZXJydXB0cw0KPiANCj4gSG93IGlzIHRoaXMgcmVsYXRlZCB0byB0aGlzIHBh
dGNoc2V0PyBXaHk/IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IGFyZQ0KPiB5b3UgdHJ5aW5nIHRv
IGFjaGlldmUgaGVyZS4gSGFyZHdhcmUgY2hhbmdlZD8gQXJlIHlvdSBmaXhpbmcgc29tZXRoaW5n
Pw0KPiBIb3cgbWFueSBpc3N1ZXMgYXJlIHlvdSBmaXhpbmcgaW4gb25lICghISEpIGNvbW1pdD8N
Cg0KQXBvbG9naWVzIGZvciB0aGUgY29uZnVzaW9uLCBidXQgdGhlIGlzc3VlIEknbSB3YW50aW5n
IHRvIGFkZHJlc3MgaXMgdGhlIGxhY2sgb2YNCnN1cHBvcnQgZm9yIGEgcHVyZSBncGlvIG1vZGUu
IFNpbmNlIGluIHRoaXMgY2FzZSwgaW50ZXJydXB0cyBhcmUgbm90IHVzZWQsIHRoZXkNCmFyZSBt
YWRlIG9wdGlvbmFsLCBidXQgaW4gZG9pbmcgc28sIEkgYWxzbyBuZWVkIHRvIGJlIGNhcmVmdWwg
b2YgaXRzIHJlcXVpcmVtZW50cw0KYXMgYSBrZXlwYWQsIHdoaWNoIGl0IHdhcyBvcmlnaW5hbGx5
IHN0cnVjdHVyZWQgYXMuIEFzIGEgcmVzdWx0LCB0aGVyZSBpcyBhbg0KaW50ZXJkZXBlbmRlbmN5
IHRoYXQgd2FzIGVzdGFibGlzaGVkIGJldHdlZW4gdGhlIGtleXBhZCBwcm9wZXJ0aWVzDQoocHJp
b3IgdG8gdGhpcyBhcyB5b3UgY2FuIHNlZSwgdGhleSB3ZXJlIGFsbCByZXF1aXJlZCkuIFRoaXMg
d2FzIGZvbGxvd2VkIA0KYnkgYSByZXF1aXJlbWVudCB0byBtYWtlIHRoZSBpbnRlcnJ1cHRzIHJl
cXVpcmVkIGlmIHRoZSBkZXZpY2UgDQp3YXMgaW50ZW5kZWQgdG8gYmUgYW4gaW50ZXJydXB0IGNv
bnRyb2xsZXIgaW4gdGhlIGxhc3QgcmV2aWV3DQooaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxs
L1pxMTd1QUJIZE5FTm53VnFAZ29vZ2xlLmNvbS8pDQoNCj4gDQo+ID4gKw0KPiA+ICtpZjoNCj4g
PiArICByZXF1aXJlZDoNCj4gPiArICAgIC0gbGludXgsa2V5bWFwDQo+ID4gK3RoZW46DQo+ID4g
KyAgcmVxdWlyZWQ6DQo+ID4gKyAgICAtIGludGVycnVwdHMNCj4gPiArDQo+ID4gIHJlcXVpcmVk
Og0KPiA+ICAgIC0gY29tcGF0aWJsZQ0KPiA+ICAgIC0gcmVnDQo+ID4gLSAgLSBpbnRlcnJ1cHRz
DQo+ID4gLSAgLSBrZXlwYWQsbnVtLXJvd3MNCj4gPiAtICAtIGtleXBhZCxudW0tY29sdW1ucw0K
PiA+IC0gIC0gbGludXgsa2V5bWFwDQo+ID4NCj4gPiAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQ0KPiA+DQo+ID4gQEAgLTEwOCw0ICsxMzAsMjEgQEAgZXhhbXBsZXM6DQo+ID4gICAgICAg
ICAgICAgID47DQo+ID4gICAgICAgICAgfTsNCj4gPiAgICAgIH07DQo+ID4gLS4uLg0KPiA+ICsN
Cj4gPiArICAtIHwNCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29u
dHJvbGxlci9pcnEuaD4NCj4gPiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnB1dC9pbnB1
dC5oPg0KPiA+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oPg0KPiANCj4g
V2hlcmUgZG8geW91IHVzZSB0aGVzZSBoZWFkZXJzPw0KDQpJIHdpbGwgcmVtb3ZlIHRoZSBleHRy
YSBoZWFkZXJzDQo+IA0KDQpVdHNhdg0KDQo=

