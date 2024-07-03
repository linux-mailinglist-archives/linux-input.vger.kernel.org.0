Return-Path: <linux-input+bounces-4820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBD0926553
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 17:55:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7396D1C20D4C
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 15:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA747180A94;
	Wed,  3 Jul 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="npRVhRa6"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E036B17995;
	Wed,  3 Jul 2024 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720022131; cv=fail; b=eZr183U9TjdltJ4jzg9gHoLH7byOLA+ikJEck+330llYZlagmFUG839fjKaBr9T4FC1hh1jVChj5lHrEZNeL+10pn8BFr4JWad614fiRhQhV4R3rfpq0K5pFHPWMsvPeLqJ9QMc0dOO6M6fPwmMflCqye6Iw52UFUSf+1IEJ2OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720022131; c=relaxed/simple;
	bh=wckoCuRu7rpBow5korBKu0FV2utNCW3Z20PSFcbwW+c=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b2IDo1s7L8IYEqpTBvqlzxQRZhNaEOFHhsL74AVAzPzONCu/JhLlF1Xy3uTF1ObDdv2rncUA0zIS1ihdPGdt2BtpzOESuCosTrwPCZwfOYkx6At9tPuGr19806V4QJyYTOGUZ1PMAhEzon+sRFcKMvdAjGyQVUtJS8ZJyLHGzUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=npRVhRa6; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 463CbAEw021953;
	Wed, 3 Jul 2024 11:55:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Bp4LG
	5hUXNhVm7jPsq7N7ipbBksyA8BUVGqJqMQ37Ys=; b=npRVhRa6NlKsc5hoS2To7
	LApD6l5EWeuIlpBOsQfGXh6s4McuW4NpWqUmVetadxU4MsBvZ5C2sf1MrJCeDh8c
	KCj/icZk7nIhJQjzVSaeusWy9Oehf0I10xLREPQxH/xax+YdXl1/cLgItyepAUWI
	C3JvQvchAOoQrKCSw1017dxPCpJU9Usb44VTHIV6cGssx9idLc8D12b112bwDtsw
	BOGH66e2mFi6L+AjRKcq/1wXcCbSkfpzCy+rQhDpO2Mk4SIJVPyFecBhFTj4Cb8J
	FfIlkBG3tWj0yrlRhnGeBJ8lmoluZqCatZ9sZZMqgpLSTcGovoxbiFm8TC+eGzO1
	w==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azlp17011026.outbound.protection.outlook.com [40.93.12.26])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 402f63hb55-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 11:55:14 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ddx0oM/KpOobELjCS9yXkV+ynYsE255qZZDFVnLMTD78hjGXi95AIkNDTvaKT0QVldkrcSvgSUCmjsduttjskHpcEsBbKW5cjBsExEm8aaxDPGB0AsNlvLIAUmdOt6zMPCBkkIaMCCYfPjKvUmkweRc1bMVCdXbg1ucKZXCn5n5CUxNARaUFYb9onjfS+A5qLBYfahoIi9RkzE7mRUwwtf4/rR18f7pOJo2R6myjQmxb/0UvkPZurwG/IXhA/aiSxQioGdz7A2SbtVeFZ+kAv7kvK+bARKpvFAPup9F5UmhjXsAgm30KclehFgf7/B1komW7e9IR7ZAEcsX9Krp6UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bp4LG5hUXNhVm7jPsq7N7ipbBksyA8BUVGqJqMQ37Ys=;
 b=S/gpBQbYkqNxu4scfZO8PbTV85qs9z3/qG8m6yVPwm1CZKVVkHJaJiS41H4Nnubw99z22Wjv9c1lkgqNniR6h15FuEXpIkhqhF2yCiVbVIO0qrW+byPNmzuP9yUtFM+kGA8e7C2KyEhOPs7lmaCi0YxnkCinMJUSoP0E51CCk8KRPyq/p3J3ii9OVXirXXkeeKIkbzX0yymA+blWJnxWoPQpvbkw9eefC20t7AaNfVsjBM1PxhVOzcSjeNnldF0cmr3APG6aRrFgoUfyoH7NYeb6CAFTkdglaYgpUMXCI39G3Fu09dunW0lfXdNIWP6tnUVO4jPHfQo3/BbjPrhY0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by DM6PR03MB5129.namprd03.prod.outlook.com (2603:10b6:5:1eb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 15:55:12 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 15:55:11 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: Conor Dooley <conor@kernel.org>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        Dmitry Torokhov
	<dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, "Sa,
 Nuno" <Nuno.Sa@analog.com>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Artamonovs, Arturs"
	<Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>
Subject: RE: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Topic: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5588
Thread-Index: AQHazTfw/2hsta4X2kmND8+3BCbBtLHlHpmAgAABKpA=
Date: Wed, 3 Jul 2024 15:55:11 +0000
Message-ID: 
 <SJ0PR03MB63432316EE8382033A4396369BDD2@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240703-adp5588_gpio_support-v5-0-49fcead0d390@analog.com>
 <20240703-adp5588_gpio_support-v5-3-49fcead0d390@analog.com>
 <20240703-safehouse-flame-0b751b853623@spud>
In-Reply-To: <20240703-safehouse-flame-0b751b853623@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YTJc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy05Zjg4Y2FhMS0zOTU0LTExZWYtODRmMy02NDQ5?=
 =?us-ascii?Q?N2RjZTVmODVcYW1lLXRlc3RcOWY4OGNhYTMtMzk1NC0xMWVmLTg0ZjMtNjQ0?=
 =?us-ascii?Q?OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSI4MDU0IiB0PSIxMzM2NDQ5NTcwOTg2?=
 =?us-ascii?Q?ODkwNjkiIGg9Im9DR0ZFY09mSTgzbHlIY3Buc0puTmhNOFY5Yz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QXR3dU5oWWMzYUFYNENYSXBDMTZJNGZnSmNpa0xYb2pnREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBM0xoU2ZnQUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|DM6PR03MB5129:EE_
x-ms-office365-filtering-correlation-id: 9146437b-b683-463b-cb73-08dc9b788583
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?XslWyUkANtnroPMHsIbkUxsou7GshmNDnFcX8+iRZ1bYJIoQiIxDUZ/UBnF4?=
 =?us-ascii?Q?BAmmoPvvgOGgQGEf2ToDww+Mkik9SC/qZoVY0pykBOQMqz/cw5c7IZYqtRaz?=
 =?us-ascii?Q?zUlX3ZjfX1bP9CRzNK5TQqtLcWjXx90Ndr0QV1c98S1gGzRFQOmkgMii8o6V?=
 =?us-ascii?Q?imNDX9F8VHeAN148GLItkcbrjr8GxPOdlafSBQGQUsrXtW1pRfIreVD64Sp5?=
 =?us-ascii?Q?GPA7Q6r/KpUtr3lc9vBlppYXGPS2s4j78usUe6FG7ZdBd164YepsxAKfuBpp?=
 =?us-ascii?Q?UrOt1ndqlBQSFKdAKmME4wIIKUeHTQBVBerlBBt99j6b9/qpXIVDZCSxg8vU?=
 =?us-ascii?Q?TfyeWhmgXRj+sgQPC1nYg5XHTruCvm/Oijb2jAPpX/r3U1LO1d1zaAMMv/W7?=
 =?us-ascii?Q?0Y31B/o1csF+lDbhA2PnxzWEsUPr5aVKzU01lhSx6Xb/2O48ItYPaTjB9aU4?=
 =?us-ascii?Q?YSYVEbrMTritEUZ4vnMmt471qNzJRLvig5GXPIh371oSuCg3bM5RNBudztH1?=
 =?us-ascii?Q?AlMeA7pPP932vYWhy5lCZHKaltgVhmCrUqhbscTTVjjm5LvWWTM+WzNipV1C?=
 =?us-ascii?Q?rYUp02EC6TmRAhbrrRRKAF3FxDdVTQMrYvuLLoT7UezqqRwQT7wh/9uMWF67?=
 =?us-ascii?Q?vciZ9FMTe+vL8M5pJPkOlFGv5h3XHZX85enQph7Ty4Vum7YvkR0WYqnwr3hZ?=
 =?us-ascii?Q?RndgqidqQAbvTsOGOtBWUCdDs+FYAGApDQhvfdtu4R5YqRDaU6WROewQUCAI?=
 =?us-ascii?Q?ZCcXMpf4YdSxtCtVr24DV6mhJ0oT4L7QL8xW8HHWWpeCeQeEBOcZ4y47IvC5?=
 =?us-ascii?Q?8LXTANEd1cJ+BSPAC8i4V7y4z2P9WbWmfnAQgda3OAOMrdEKq+Q7PGhpEGfA?=
 =?us-ascii?Q?Et8AYGPdfezx50rFPujYiHZPOvl0b2uvk6CR11mFRDKpUbGLEAY2BTKwK8uI?=
 =?us-ascii?Q?cm6R3U0CkciD9WRMl3S2H89pSaDyg+q9Ys8IpOiYEyTz3uBLLcf/el8B2uo1?=
 =?us-ascii?Q?bqQSKoD7mmEc6uZtB/XImFCiP/0wiiPGjkx0f89I4YHkmhW5DrLVJLu3bO5w?=
 =?us-ascii?Q?AJvRFKMKTGQRNWAABkubaiqgndnr771aQGeqYflWFmpYfGDSpzSCEorpADPV?=
 =?us-ascii?Q?bcOFLyKpgv/WXUbHKSoNPcCFjFSPbgk2ntghxmt0DOIFaSzlypoeglp8fxu2?=
 =?us-ascii?Q?fkX2lZv+F5ssQIjtAFl7lqIS2IGB7ENgr0DcA6gGC0kg9cRK8FLCrjAx9TQP?=
 =?us-ascii?Q?E2w8kN+TQwzw0d0rl99Gs8c1FLECjqy6tJtU2u2+iM+CTn8cuOwr/4iN3Cfn?=
 =?us-ascii?Q?sCmRSoeG/C/2N4lg5OncoeaHWTpMr5ulnl5bJYatKVsi4AdGTzaGLLfnFVhr?=
 =?us-ascii?Q?lkofc5s=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?he7qw2e/qBKSOXA7jUnHqculkHHDD0F3Io+vP+XHYwhKVgklXl+ip5Fl6T0b?=
 =?us-ascii?Q?8J948IhxpYk2tz3tcHq0mqogZQDbt5gGFL7i+laVQEwm2PDPXnTzoYYHeFed?=
 =?us-ascii?Q?69B8kydBtbiwA6N7loTPK3mB2CjrBX8VvocOpPUCO1zrjZ5MkWtTkwaPYo27?=
 =?us-ascii?Q?pU3mwdO1RN0wTJX+m4FhkKL/r44Gbh1Mbf6wcO2yfN75uFBwBuFrMPbeUzRU?=
 =?us-ascii?Q?FyWsTSCsnkkTX4nNPxC6ZntfkZeiyYkkgeJba9xj8xw1aJnXteGO/M+jDwW0?=
 =?us-ascii?Q?jb1ga2zd0dSqE2VUTthigsT0vRKuQ+kUcFQmn5SccSZGmre0YH7Z58qGvd7t?=
 =?us-ascii?Q?T3gB08kgI1QtFxmyOxkS8ukXQW+MIFMS6MiuMQSTqLYNkmmOYhg5UXQIdwet?=
 =?us-ascii?Q?nNEfe0zMHkfsvIGGRtc7K9upoaV9dXBBwkYlpMqDzwEBS6JQBMpNgMc1VW6m?=
 =?us-ascii?Q?um4K/eGsbDKH14ZpNWyD9RnVcw1HtKyVeDfaZrnOZf94WsAJEp/26Z79Ge5M?=
 =?us-ascii?Q?YVscKK3hJbmqLuh4aXPe+zMnFRRKDyif9ONE+vG7iwGVYiOL+jz2Rjegq/gp?=
 =?us-ascii?Q?3D/CY2CeQgd/QnE2/vytEf3oo2/6eFrSu91DNLA/+V9a0kFPgYaQanFwSxMf?=
 =?us-ascii?Q?ZWiYP1M0sSyRXc0hDf2zA9B4yctbaSQBUWjcUjyksoDu2lekGBYGziCqSeEN?=
 =?us-ascii?Q?v4z9l3OCGgk4wjsOeTF4s6nd7/0V1VlPweeBbiph3ow9PuxTXIvAY7gIQuJu?=
 =?us-ascii?Q?DnM6mqipp/FrTfCi3LCe1qjJaFinG3x2Lv5+rt9RscTn9I+IWV2N0QZ5nMvO?=
 =?us-ascii?Q?qCBaFAEwYEsRxLONVQY+hW/dGTL5GBqFeIhLH34Z/7FNHj/aIUTQBtXy3rWX?=
 =?us-ascii?Q?vD7Flbc2A3UeiN7EbgZG+U76SgD1iQlKAdXByuwN3EmjzF8mxh7BZRyF3JQA?=
 =?us-ascii?Q?QfhpCsuk6Sn0+PsV9iHxhDJ7RSYblpDGDH+eBAzEQ/ZBLeMDoRliRU9WGzL3?=
 =?us-ascii?Q?mIb6Q8wrVx7wUEXt3/RzIhWY2KLlTLtJXGjEE6eSq4b3e7sFDhvzCi794wTe?=
 =?us-ascii?Q?434+gREPUBVVc8j2yF+nsGzj3vHfBdAzdyrbZR6Hq6uSBskCh/Z3KH4L9bps?=
 =?us-ascii?Q?KFLqjuPXBLqGLQuOfHni1xlYZUIErfTW7g4PwMNkwaWd+b4ytr0R6CCxnQK2?=
 =?us-ascii?Q?ujYTKxKE9gglB0tfpMeWByS8H5CjFZzGjmsIWdFYmPoSx0KnsabAioZP1hD2?=
 =?us-ascii?Q?HRosWGZlZX/87N+MmFBBTwE6Pi7zW7J/qj36lPhZpQP3M3gESqs8XaJaBId7?=
 =?us-ascii?Q?sELikUCcZDAjZpPjBaO6dqZ3UEUhpkxTF4H30M/aNBgD8ogjbLioqUL02/75?=
 =?us-ascii?Q?fp52Nqdpoxm2fbgbsd51Vw2DulHIx0TmPPtgvDLjJog7QrxH1IQO3NsV4eTB?=
 =?us-ascii?Q?V6gy66ZFgyX2h6hVTq/4/IfPUz5B99hE3xUSFUkatrVNpHcSAe/mWIMl40Ee?=
 =?us-ascii?Q?V2xkCyn5iddQ9hvQ2o/VYcXU/Pt0zlOQlqXsFiPqUIOcxt4/0oU/XAJzcoiB?=
 =?us-ascii?Q?dklL9Drj62p+6bW9dkoWaMYBb/ka6d57waKfCIlo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9146437b-b683-463b-cb73-08dc9b788583
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 15:55:11.7928
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60ZO+FOcipmBEs1ks1FGzD5WEdaLUtwcOYnQODKTu1U8kWd7PQIVGJk1VAtpodGW1vTj1WENQv766mdkKUbutPx+cAWRGeEjM7zdQv7XXzs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5129
X-Proofpoint-GUID: -t7sAStoIyTc9GXK0QSgeuyYv-D3rpms
X-Proofpoint-ORIG-GUID: -t7sAStoIyTc9GXK0QSgeuyYv-D3rpms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_11,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 adultscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407030118

Hi Conor,

Thank you for your feedback.
> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, July 3, 2024 4:20 PM
> To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; Dmitry Torokhov
> <dmitry.torokhov@gmail.com>; Rob Herring <robh@kernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Sa,
> Nuno <Nuno.Sa@analog.com>; linux-input@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Artamonovs,
> Arturs <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> <Oliver.Gaskell@analog.com>
> Subject: Re: [PATCH v5 3/3] dt-bindings: input: Update dtbinding for adp5=
588
>=20
> On Wed, Jul 03, 2024 at 11:58:16AM +0100, Utsav Agarwal via B4 Relay
> wrote:
> > From: Utsav Agarwal <utsav.agarwal@analog.com>
> >
> > Updating dt bindings for adp5588. Since the device can now function in =
a
> > purely gpio mode, the following keypad specific properties are now made
> > optional:
> > 	- interrupts
> > 	- keypad,num-rows
> > 	- keypad,num-columns
> > 	- linux,keymap
> >
> > However since the above properties are required to be specified when
> > configuring the device as a keypad, dependencies have been added
> > such that specifying either one would require the remaining as well.
> >
> > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > ---
> >  .../devicetree/bindings/input/adi,adp5588.yaml     | 33
> ++++++++++++++++++----
> >  1 file changed, 28 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > index 26ea66834ae2..6c06464f822b 100644
> > --- a/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > +++ b/Documentation/devicetree/bindings/input/adi,adp5588.yaml
> > @@ -49,7 +49,10 @@ properties:
> >    interrupt-controller:
> >      description:
> >        This property applies if either keypad,num-rows lower than 8 or
> > -      keypad,num-columns lower than 10.
> > +      keypad,num-columns lower than 10. This property does not apply i=
f
> > +      keypad,num-rows or keypad,num-columns are not specified since th=
e
> > +      device then acts as gpio only, during which interrupts are not
> > +      utilized.
> >
> >    '#interrupt-cells':
> >      const: 2
> > @@ -65,13 +68,15 @@ properties:
> >      minItems: 1
> >      maxItems: 2
> >
> > +dependencies:
> > +  keypad,num-rows: ["keypad,num-columns"]
> > +  keypad,num-cols: ["keypad,num-rows"]
> > +  linux,keymap: ["keypad,num-rows"]
>=20
> Is what you've got here sufficient? Adding "keypad,num-rows" won't
> mandate "linux,keymap" which I think is wrong. I think all 3 entries
> here need to contain both of the other two.
>=20

Ah, I can see the issue, thank you for pointing it out - I will be correcti=
ng that.

> > +  interrupts: ["linux,keymap"]
>=20
> I still don't understand why interrupts are only allowed when the keymap
> is present. I'd cover the interrupts with something like
>=20
> if:
>   required:
>     - linux,keymap
>   then:
>     required:
>       - interrupts
>=20
> so that interrupts can be used while not in keypad mode. Unless of
> course there's something (unmentioned in this patch) that prevents that.

In case when the device is not in keypad mode, i.e, is purely using gpio - =
it doesn't trigger the interrupt.
Due to this, I had restricted the same to keypad mode only(as a requirement=
). This was mentioned=20
here:
https://lore.kernel.org/all/d4661ddc1d253678fd62be4c7e19eb0cff4174f6.camel@=
gmail.com/

Moreover, this was also included in one of the earlier feedback comments th=
at I had received:
https://lore.kernel.org/all/1fc545709ad2aee0b70a8d1c561516d94cb6fb1e.camel@=
gmail.com/

Thanks,
Utsav=20

