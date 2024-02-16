Return-Path: <linux-input+bounces-1944-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F02858A42
	for <lists+linux-input@lfdr.de>; Sat, 17 Feb 2024 00:41:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE5D31C21102
	for <lists+linux-input@lfdr.de>; Fri, 16 Feb 2024 23:41:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23745133423;
	Fri, 16 Feb 2024 23:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="IICduY2Y";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kHJdrWOF"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485D014600B;
	Fri, 16 Feb 2024 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708126902; cv=fail; b=pNhiA32TiUoxXX1CPF8ywjelP3fLD90Sw5PLMqah3KmbLGjvILqpwAv3cItwqeYgGqSWa7cAlM9B7BaphZoPlMlqppKcGPlucjmcNkQAQrpJLVV9mAmURJ4bgKJXxrjHQ+iPa7kCJK2GA6h1l5HXY6pF2wkOFiN2peUn19Pt/aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708126902; c=relaxed/simple;
	bh=tLa0SLgYzEg1gjzURPgXIs5Fd1tmENTncl8qxLeYBZM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p+xIMhYyPhbOLAkRwi9Eglqw5p4dB4/Cg+Yv6J/Hgf7GqCfL+H5M2jEnoZvNhejLzfKzFgOGiRqvxFfivQG+fP7Oe6OGPNDMbT7dnffdyYYH7AuUCd09ky9UJrXXzwlR961aH809irqrKp1rsZGPKrTzcrDK7DvfxKmiBHw7LP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com; spf=pass smtp.mailfrom=cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=IICduY2Y; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kHJdrWOF; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41GNfGH0026258;
	Fri, 16 Feb 2024 17:41:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-id:content-transfer-encoding:mime-version;
	 s=PODMain02222019; bh=tLa0SLgYzEg1gjzURPgXIs5Fd1tmENTncl8qxLeYB
	ZM=; b=IICduY2Y7HeMvSA1tfnfIK7iaU8gsIkSZMLrUrqciswwKeSEirdIFe1Q7
	wZdc/AfzBV6xWrBBV3H7zakKYh7BTHwLTr1FVGDMoAKY/4i1Zxhe4tJehk7A3N6i
	SUjflXekiDqO4+M4Y2rv1WCkX7bwXazoCXUvaIPhPIn6jsdpfgV3Sg5j245swRoC
	3mrt7NrWBwtNd5HcEQTT7W125OiBUI+A4qulWOkvwsrZqmqfB0up4/8EzpiVA+k/
	mY5v2H8arcX1rrwniHTUMK2g91ypaYBMQVdo6q0Ilgdrf0QYpwvc010W9VlFLx+P
	HwQNJt5a9bBHrOc/yeKT4gp2bLIcg==
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w8sp4kfex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Feb 2024 17:41:17 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYGJ3/pxj6fdIjS7KS9/q0mSaAxzKyP3S1qyEUdLGO+Gp/1qmjQAgW0d5qiZ6hprNRIOS1B1laK6lAVG1dqeZzC4XR96TLwBkEbnDYz4sqXKdk1mnvr6tHVW1yhmdR8EJqJ3whgqhSaTRqwttLntXDo7f56YGCiDHhf5+yk1o4PYCwG4Ng2aCryIBxbxDvN3b3RHK4euEAjL3lIGiEtkQ2WG91p++jstF2N3t2CMO8vKD37Y/kdiDz/efAjmKbVqzWbjv2FFsdx+xpsKKhYxkHJ2lsw6LWlqvf2FdsKGUanYj1pZASfMxDuVuF3JarngJKsycLB7HrG8WQOHOFSBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLa0SLgYzEg1gjzURPgXIs5Fd1tmENTncl8qxLeYBZM=;
 b=IvR44pnK5EoabLKaTN7b6Jj25yIgX7+mZcxkP+LfnoBs6uZP8gLrDWCITWRdPV+Y/tpHQMJ80dO2wY+m3BnWkt6RH6lTkZnoytZ5X27gNMjoC+ZavuHbrF21/xqiYMEc9lu1dYmS6AnGAN0MrLWygcFDMZMiAJOSEvtTBLwrzT+0djomUAikzHdGKxIoSH9M2bMTNBA4CTtSp0Mafe2cSEpWAV9Y3SRHPajc0TBgxFapo8UrvTvEbb8caxHC790+bWFs30ZIvlZEW7aAA/UfZuVZr4G+wyvou9ggVcPIH/GaFJauvQWF1D8YfxWvuC9XnGc8BUiiqtky6djpS9BT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cirrus.com; dmarc=pass action=none header.from=cirrus.com;
 dkim=pass header.d=cirrus.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLa0SLgYzEg1gjzURPgXIs5Fd1tmENTncl8qxLeYBZM=;
 b=kHJdrWOFW5KUPxqv6jqNdvJdGPcrGZ5fNvk8TG1j49Sxffq4OTULbUaURNyZJP4776m1sNcb8BaO2sEgSnOtOeyUR1y+QZXHLpNedV19d/EVb0KqXbwwC0sh0rixdqz6s9bCnFzriKQUrJg8XSBX54r6iB0uTCzU0JeTd3FGSdU=
Received: from DS7PR19MB5688.namprd19.prod.outlook.com (2603:10b6:8:73::14) by
 MW4PR19MB6935.namprd19.prod.outlook.com (2603:10b6:303:220::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Fri, 16 Feb
 2024 23:41:14 +0000
Received: from DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac]) by DS7PR19MB5688.namprd19.prod.outlook.com
 ([fe80::981b:f6d7:d597:1ac%7]) with mapi id 15.20.7292.029; Fri, 16 Feb 2024
 23:41:14 +0000
From: James Ogletree <James.Ogletree@cirrus.com>
To: Mark Brown <broonie@kernel.org>
CC: James Ogletree <jogletre@opensource.cirrus.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Jeff LaBundy
	<jeff@labundy.com>,
        "open list:CIRRUS LOGIC HAPTIC DRIVERS"
	<patches@opensource.cirrus.com>,
        "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
Subject: Re: [PATCH v7 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Thread-Topic: [PATCH v7 5/5] ASoC: cs40l50: Support I2S streaming to CS40L50
Thread-Index: AQHaXdlSw8mCtZu+AEyHx3ooj23GqrEIsZsAgAT16AA=
Date: Fri, 16 Feb 2024 23:41:14 +0000
Message-ID: <FE35D860-12D3-4B60-9BBA-50A270C2235C@cirrus.com>
References: <20240212173111.771107-1-jogletre@opensource.cirrus.com>
 <20240212173111.771107-6-jogletre@opensource.cirrus.com>
 <2e22f00a-fbf4-4e6d-8aed-dc78f423c735@sirena.org.uk>
In-Reply-To: <2e22f00a-fbf4-4e6d-8aed-dc78f423c735@sirena.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR19MB5688:EE_|MW4PR19MB6935:EE_
x-ms-office365-filtering-correlation-id: f60ec61e-5cec-4d3f-8889-08dc2f48c372
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 u2h/kvHY4LL2Bm20GTECrysbd38XxYD1XQZMAf6GrRnEx5PWwUbemVKp5cnP6thK7Bxa0ms2x213brHVsO9i7NFMXt64UyYiL4dKSA2IeY5poolrJXqTNVqG4NnJBkuWz8zBdbMqHGm34pxUP/wbJZlQjhLLhkO1iwZsSkFOaFGOnoBUyQaTBcCrHv47fS8ZXjWVP6I2ZiNrYkb6Dl7GIAZQ7JVcs/wwAX1OTlmYlmJDlOpude54Z/XeLWNCBSt0C70q9P2JWGbaVP9BMal1MonCQAUULYNBRgt4+VW4O20XHkcFA703hiroiCU0r47Pfn6/GPUIegIbk3lHpc6JDxv7yg3VvcPykZCkWsac0pOGHf+mElKIC/JStlhhgGbtCn7J95ovYzYovgxdRZn7eoDBXBS0YVGTbM8H/f3zAHUsX86AH7+B0cM82inuiOtuDitTkU0WRMZzCAoA1PkoJddI/sQ2uLWoRpNgkzVy/AKpK7Zt8hhtcpeFSIGfAIiR694L1AbQOhr88ofd5xWXVBgDNuRYuQh9yvGsoFzkdOOr0WqdC0A6buH2NWXS+kNENLUiWH0d8w4rr8KhPi176j12kEw79OhqMUBA2V51kIjKs8KCayKjJXjgxjJdwrmJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR19MB5688.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66446008)(38070700009)(66476007)(26005)(2616005)(83380400001)(41300700001)(76116006)(316002)(6916009)(66946007)(8936002)(4326008)(64756008)(8676002)(66556008)(6512007)(6506007)(6486002)(36756003)(71200400001)(53546011)(54906003)(478600001)(122000001)(33656002)(86362001)(38100700002)(5660300002)(4744005)(7416002)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?S0tpNUhKZ1RnT0t5clpTOG5FV1QrQmxmcFg5Z0MyOFcvM1BBZFBJV2ZuQWpR?=
 =?utf-8?B?UlhGdDFmeTVFOTNmcmxZU3RsWGdUTTdESU8rVEFtOVFWY2xMNnR0UzlUVW0w?=
 =?utf-8?B?andkbTJYU0krTG9hM1NMUUpnQXdFS1FBY2tIUmJEODZhT1dtMnNJMVZRMWJX?=
 =?utf-8?B?bk9GcmsyYlI5RklGeVdsSHBNYnZuMkhqTU5wT3dVSkFMVFphUFFVZWh5c2NQ?=
 =?utf-8?B?aGhUeE5kcUU1NjVtU3hLd2dRSDN5V3FWRUNPcmk5aVJQME9GbkM2NUxXT1RC?=
 =?utf-8?B?MHNZOXdvcTg3VXd4eU10V2Y3b2QzdllFK1VoNlMydWI0RndwenRVTGNFYUZP?=
 =?utf-8?B?dFA4TXhQQVVJN1FHZDNQVDZhRFZhNEZHSVJVSk56SUZ3Ty9LdnJNK1FnWXVG?=
 =?utf-8?B?dDNhMENHalZ1ZStKdWkwV2ozWng4cnNLSFRKL0RiRWV1aWRwQno3MGR1eTcv?=
 =?utf-8?B?S2JHWWJTV3Y4UTlhbGw2Z0RIQzZDNERZWXNBTE5idTdJOXdnaThTVTJRZW1S?=
 =?utf-8?B?eUFpYXQ2TzJqek96aUhla1ZxQXV6K2Q4OFdMR1ZuMFQrMlNmUFoxK3hTeDZy?=
 =?utf-8?B?VTZURm1zbW9IeWNPSThBRjRwR1NjODkxWUJOK1d6bnIwYTdDdDdLMk1URk44?=
 =?utf-8?B?QXd4MnBRMWFndWhRRXVudkJ4bDRkejBRc3ZHU0NiL09kMy9PWHF4d1RUc3VB?=
 =?utf-8?B?QUtKcnZUVUJLSXJ2NTJpaXV2U1dIWFpQeGRFckphZVJXN0xqM0wzU3JqdEFG?=
 =?utf-8?B?Si9nbGFSNFNVNlJGckphSzBmb0NGem1uaGtLVWZWNm1ZenVmL3JTZmN4QXBt?=
 =?utf-8?B?WmZuSFM4VjcvSThvTlAxTkY3S25oeTNZWFVjWG1ObGc1U1ErVkJCSy9kMjA0?=
 =?utf-8?B?RzdTTy9wRHlZYlRCa3RTYkJibEpzQjM3WHdJMjJpT0pGOVc5aVc0M2puek91?=
 =?utf-8?B?QXJFdzhnMSs0TUw3K2l0bHBBblc5eG53SjQzSk5qc0hYbFBkQVhRZUlaMTMv?=
 =?utf-8?B?Z3pvY1IzNmIzbEthTHNoYWNrT1l1UmhUODlBK2UzWHBqVXVyVXFMdlBpOVYw?=
 =?utf-8?B?MmxGYkZRb1FOOTVWZnlKaytlZWtkRkV3cmlLWkt2Qnl1aG5GcjMwT3lhQzRp?=
 =?utf-8?B?K0FIRGhNMUxPc2VET3JpM2o1Z1ZSdE9Ec0I0K044UzFWMWk4WFk4QnE4NE1L?=
 =?utf-8?B?NFZpRUJlVFZOQ1lBQmFHVno2YXhrNmtSMkVMTkpDZnI4OUhTV0VBeFE1eFQy?=
 =?utf-8?B?R1JSNDliN2xJeG1haVZuWVRTYWEveXc1cE85SWNEN3dpOUNYOGZudFZNeFFK?=
 =?utf-8?B?azRacjFvWlVmSDV2MkkwbW9WdzBKay84eWgvMlY2WmpjdkhhRTVGaU5NUXBn?=
 =?utf-8?B?V1hnTUxlelJTallyN01uZE1HcVNGSmh1MFdMWFhENHoycG5zWk9XeFM5T1Bu?=
 =?utf-8?B?ZG9sa1I0MGlOMWJIMkg2bDhXQk4rcHAvR3RJVi9FdEFJT1B5MjV6QmRzUVJ2?=
 =?utf-8?B?dGhFd0YremhpNEZ2c053SUgxRUdlVTFZVUFRMnFuSDR2cExLdW9UT0JzSHBY?=
 =?utf-8?B?ZHYrU1hQNlFsSzd5Sk91c2JaOUpvNFhMNFZuMDR4KzNTNHhxeWF1cXplT2VY?=
 =?utf-8?B?a0g2WSt6V09hdXpZaFVhTjlKV1VLVk9wOWt6M2s4R1hteVlSNTZJaDAxYWlx?=
 =?utf-8?B?TWVSd0VxSURsZ3VVMzlhQVdjZGpoUkFiVHJXU3pFaWFCazBERUdtRkd3OHJm?=
 =?utf-8?B?OWgxZHhXRFZPenJEem9PT3dyajRPNjNwRVloNitpc2d4VW9DZVVTTTlFMEtP?=
 =?utf-8?B?Y2xEbGRZNnBUNXU5eWpwTzV0d0l0c2k4SE82emNyU2JNd0xNZTk3MDhVTE0v?=
 =?utf-8?B?K0J5cmZMdEpQZFdLZktmQThZcUdueUVXdXdZWTFPMmFUWjhtRDV0cHVDL0JZ?=
 =?utf-8?B?ZlZHamtIM0l0QlBpOHlkaDJyS1JSRWdIcElvcmttYmpaWjhWb3JPb25BTUNa?=
 =?utf-8?B?TmpkTEtqTlplK29lU05OcGp3YUtQcnB1RFVCUlNQUWx1dnAxa2hSRFl6TTMz?=
 =?utf-8?B?c2VVbm5DWW03b2xMYXRQZGZFNEp3dEtpY3pJaDN5N1UvN3lTcmpVdjZBYXV6?=
 =?utf-8?B?enRLSVlHcEkrQ081cDArZnpBRUc2WFpPUzAwREcyWktCeDVyNmtaNHZnM29N?=
 =?utf-8?B?WlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2C02AA4A8E0B254493F1C3C5C58F18CF@namprd19.prod.outlook.com>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f60ec61e-5cec-4d3f-8889-08dc2f48c372
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2024 23:41:14.2753
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L6dTIRfHswhpK+2pojtM+eH1pypDLZp0doI4UzEIIEGj/yT/15lhxSJ/URWFDyiWQFxAegySnPOjqsKS9bVoBNQXmAlef0gL4U2roLnUvl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR19MB6935
X-Proofpoint-ORIG-GUID: g-QUQEwx3tKpQz4jk0YcSjA_gtuM84nm
X-Proofpoint-GUID: g-QUQEwx3tKpQz4jk0YcSjA_gtuM84nm
X-Proofpoint-Spam-Reason: safe

SGkgTWFyaywNCg0KQWNrbm93bGVkZ2VkIG9uIGFueXRoaW5nIHVubWVudGlvbmVkLg0KDQo+IE9u
IEZlYiAxMywgMjAyNCwgYXQgMTo1NeKAr1BNLCBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5v
cmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCBGZWIgMTIsIDIwMjQgYXQgMDU6MzE6MTFQTSArMDAw
MCwgSmFtZXMgT2dsZXRyZWUgd3JvdGU6DQo+IA0KPj4gKyBzd2l0Y2ggKGNsa19zcmMpIHsNCj4+
ICsgY2FzZSBDUzQwTDUwX1BMTF9SRUZDTEtfQkNMSzoNCj4+ICsgcmV0ID0gY3M0MGw1MF9nZXRf
Y2xrX2NvbmZpZyhjb2RlYy0+c3lzY2xrX3JhdGUsICZjbGtfY2ZnKTsNCj4+ICsgaWYgKHJldCkN
Cj4+ICsgcmV0dXJuIHJldDsNCj4+ICsgYnJlYWs7DQo+IA0KPiBXZSBhcHBlYXIgdG8gaGF2ZSBh
IHNldF9zeXNjbGsoKSBvcGVyYXRpb24gYnV0IHRoaXMgaXMgc2F5aW5nIHRoZSBzeXNjbGsNCj4g
aXMgQkNMSz8gIFNob3VsZCB0aGUgZHJpdmVyIGJlIHVzaW5nIHRoZSBiY2xrX3JhdGlvKCkgaW50
ZXJmYWNlIHJhdGhlcg0KPiB0aGFuIHNldF9zeXNjbGsoKSwgZXNwZWNpYWxseSBnaXZlbiB0aGF0
IHRoZSBkZXZpY2Ugb25seSBhcHBlYXJzIHRvDQo+IHN1cHBvcnQgZWl0aGVyIDMyLjc2OGtIeiB3
aXRoIG5vIGF1ZGlvIG9yIDQ4a0h6IGFuZCBhIHJhdGhlciByZXN0cmljdGl2ZQ0KPiBzZXQgb2Yg
bXVsdGlwbGVzIG9mIHRoYXQgZm9yIHRoZSBjbG9jaz8NCg0KWWVzLCBJIHdpbGwgdXNlIHRoZSBz
ZXRfYmNsa19yYXRpbyBjYWxsYmFjayBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4gKyBj
YXNlIENTNDBMNTBfUExMX1JFRkNMS19NQ0xLOg0KPj4gKyBjbGtfY2ZnID0gQ1M0MEw1MF9QTExf
Q0xLX0NGR18zMjc2ODsNCj4+ICsgYnJlYWs7DQo+IA0KPiBNQ0xLIGlzIGFsd2F5cyAzMi43Njhr
SHo/DQoNCldoZW4gd2UgbGVhdmUgYXVkaW8gbW9kZSwgd2UgbmVlZCB0byBnbyBiYWNrIHRvIGEg
Y29uc3RhbnQgMzIuNzY4a0h6IGNsb2NrLg0KDQpCZXN0LA0KSmFtZXMNCg0K

