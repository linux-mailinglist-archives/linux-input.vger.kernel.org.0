Return-Path: <linux-input+bounces-4595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617879147C3
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 12:43:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BA96B241E4
	for <lists+linux-input@lfdr.de>; Mon, 24 Jun 2024 10:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4974137750;
	Mon, 24 Jun 2024 10:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="rsLEgIq0"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C649F136E2A;
	Mon, 24 Jun 2024 10:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719225800; cv=fail; b=TAoUuHc+b0O9zWccc+I2fiI3LpF+0aahnJ21yFnxRlc0vnvbqTuIPVkdQDtCDvSSKHnFMbYj0+7Z8J2awIgDvyCFm0qVg0gYIrrJsOSyBsgOcbRtUf799bYyPOplm3uP0jjYQY721wb8rwGMZB4DvfBz4Vy1/5BqkUYv2mQLezE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719225800; c=relaxed/simple;
	bh=hl9IrWk4hjNmqTNBJKjMyJItGjwTf0fY0D0LRWDUJQs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TAoBznALW7m6IVlL7XK6Zxmahh7OgVUfl0tX7xbjq2lOQ6n0nbL8Fo2gLCrtWew/QlLM4MA94zpzbV2ZqxkjpjXWLowG4eOIkNyq+YF+UOK2s6qP69VHLunO5WSGBh+JFMdFljHfL4N2yJ2CjXyDwxs6wfr7BxFuqLqO1axf4+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=rsLEgIq0; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45O7pfpo007934;
	Mon, 24 Jun 2024 06:43:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=4hi1g
	srkrniilaHI3SR5oKub+D13dXW/qQBVY/zvMsQ=; b=rsLEgIq0HxRonos0Pw1yD
	/aMffA44WMPkoC2qwbI1t5Ct4pDnRwo7942rvG1jupxuCFgOc15jbWLmFFtYGewN
	BQccHLRmay6Z9sHtGrulVy4ypDzVz6qZydm2HRx76WS8UCSffNi09SSIOyiQxuBv
	XLGowjS1Qj//kCp+U//QvXh0uZDB0Rq9T0fz714OUp0zPewtNkXbRWZ+A96ndndS
	8ZfWuPlRTLnDpHRs4EsKR2m29nKtcCcGka31NGuMls1Bk8+/jbx4u/T57jCBbsom
	aRT1ISeFqHYUpmlzOf4koTmxElVTXmV0bUqGooPX68LbPgX2/sos3Pw1+J5xwbHL
	Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3ywrc8nf77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 06:43:16 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SPb80S0MJd8D6gZt9ghj6iK+RNFFbPmHD+2os/ThAu+yetqh6zbDTUsCkK6r+SBLOkS3j/7MXyCw12ZF95M626xCJs2mVXTsnfdcuGe7QdK8Gd/tmQQfOcS2iv4nu6id9UOQOVSEA6oFUmfCyyUqSAWRmUaa6g3VxcY3VUm8LKYi6LFu6scgynTVOUDAUHZiH2sWc7MObhRnH3IUKtQL+2miB4CDs6lMnoTF8ir3Prbbj2hjwgHwzSi/v3PIBRs5mqSQ3RMw2XgEoBDqLVxGjyHdpL3dnjNcVNZd3oe8o89gDkB98kJXUu86ijHAyEEFVkImwnVEq/DKjTLc7Me2mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4hi1gsrkrniilaHI3SR5oKub+D13dXW/qQBVY/zvMsQ=;
 b=IozpXYJscsq3zjUSnC/C7sJaS0etUZDc0VDfX64KAAYb6n+he/tsmF2Oifit/taKmwjr6ETwn/avPumn/kOal7npnLTye2ZNqaKf03e1u+jT7/UGAq+eW9SDEHp19d6jpwqnqcpUY2aqM9NRObb05SH+dLLpnDefIV4ADKKcbGZ1ivwbcd7/akMwe9VRmEYWjP7sgSOTtvKaeZMOMZdDHZwKVYJjGBZ3jqEBXIVZtE5PdSZbr6sBJcmP+T6PtpEcI44TQXDqVxQvgGFv+N+Ec20u4xf8EQEka7eJra9aO/eohAupGOpNcbAPn1z2EDJshDTLBVhuzc70Q4B0uMntjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA1PR03MB6580.namprd03.prod.outlook.com (2603:10b6:806:1cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 10:43:14 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7698.025; Mon, 24 Jun 2024
 10:43:14 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>
CC: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Artamonovs,
 Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>
Subject: RE: [PATCH] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AdrDxwnnhsqWA3twQEu3gpPx2Qa+mAAthRwAAGXa1pA=
Date: Mon, 24 Jun 2024 10:43:14 +0000
Message-ID: 
 <SJ0PR03MB63430F59E256C45E0C658F509BD42@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
 <SJ0PR03MB6343CB033C1005A36B102BF89BC92@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <ZnaJbqXcABKGIj83@google.com>
In-Reply-To: <ZnaJbqXcABKGIj83@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YTJc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy04Y2RiYzI2OC0zMjE2LTExZWYtODRlZi02NDQ5?=
 =?us-ascii?Q?N2RjZTVmODVcYW1lLXRlc3RcOGNkYmMyNmEtMzIxNi0xMWVmLTg0ZWYtNjQ0?=
 =?us-ascii?Q?OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSIxMDkyNCIgdD0iMTMzNjM2OTkzOTE1?=
 =?us-ascii?Q?OTcxMDUwIiBoPSJ4TE95cFJwdXBaQm00Y1FVUjZ2MXhrM0tvcm89IiBpZD0i?=
 =?us-ascii?Q?IiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFFb0NB?=
 =?us-ascii?Q?QURxWlRaUEk4YmFBV1dqdGZSWnJLc2ZaYU8xOUZtc3F4OERBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBSEFBQUFEYUFRQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBUUFCQUFBQTNMaFNmZ0FBQUFBQUFBQUFBQUFBQUo0QUFBQmhBR1FB?=
 =?us-ascii?Q?YVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0JsQUdNQWRBQnpB?=
 =?us-ascii?Q?RjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFHa0FkZ0JsQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQVpBQnBBRjhBY3dCbEFHTUFk?=
 =?us-ascii?Q?UUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0IwQUhNQVh3QjBBR2tBWlFCeUFE?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFZUUJrQUdrQVh3QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNn?=
 =?us-ascii?Q?QnZBR29BWlFCakFIUUFjd0JmQUhRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBQT09Ii8+PC9t?=
 =?us-ascii?Q?ZXRhPg=3D=3D?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA1PR03MB6580:EE_
x-ms-office365-filtering-correlation-id: fb9f84c0-876b-418c-eee1-08dc943a738c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230037|1800799021|366013|376011|38070700015;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?S14XBCfF6MbAK6ZVy9wJ7BPK6GB4NDJG8ZfYgK+QZjYWUk95h0X+lm6YuG3C?=
 =?us-ascii?Q?byOpS43BVrUW7DrvCeQjrDKrfYU4H9ZDagUgQk0zie+ZX9pTq08Oz/w+6WmF?=
 =?us-ascii?Q?KcloZ81ATjwvPanzPwluXgry09Ygf3UJO69cn4d3meIzuSW1uQApbTOF3ACX?=
 =?us-ascii?Q?G6wYGUKP2chtIN62VVAVUZRJPOoKHjYxGJ8fN4Mtqo+48RheyaJHmnppl0NE?=
 =?us-ascii?Q?SM7sqa9SWH3eAtvz+tw8eMKUge6v/N46i9wLuQuiRzEQ/shtSURxJhLU4Udd?=
 =?us-ascii?Q?Tkde+bRr811tGoBfH6NhVBhMQyuASaqsGAdSmFyGcrIz0kShsTDqk9rYVVLR?=
 =?us-ascii?Q?xh4oHAv3I0aoyR7wwh8QcUCsnfCSqgZCT0Mk4JF08yCuG+0qg+bITSiRMvEz?=
 =?us-ascii?Q?O74NV1N/18MTy9WNcSMYOWR7BSRiPYyTZ0MqcX+XVYLuympp/5VqfgQXYoH0?=
 =?us-ascii?Q?hea4yTm0XQIMWiSxqunja4m/xZPD5kTDWlhDZZakFpmgE1Lc1vFp8Z7n1bOH?=
 =?us-ascii?Q?T0rsAPdV73JizpPvbkQovXWfKL0AseLYTvQxJ9WXwtgkCbaVA+5Ws57JXhSO?=
 =?us-ascii?Q?fdV8KyJ+GRCQgnfchXbBgVgLFcx9GguC0uce1v6zwmHgbarElkdBJEa9r/yv?=
 =?us-ascii?Q?7sfLUGzMKuAts5jhK8k1gg7dbHosyZYa+1Tw1e2wu+TKryUJ8a/qz9SCKaKf?=
 =?us-ascii?Q?lX3qOf0KzEJMgea8FnmMEXEGCIWyvBwiOlfXcasHBnDhTy/TJVP5L+EdkUky?=
 =?us-ascii?Q?9nmmGS3kwY990XoeCDI66ro59ZwnTKxx+tasgydEkG6f13iWLwz2LgZIrNkk?=
 =?us-ascii?Q?/Eo51MgsEtATAvDHFH9XOUUA/kUawTLLbxp5zi1/QHyrmpzQu+bj/QLAvFL1?=
 =?us-ascii?Q?WI4CN92tO/lzBMLnt06m8jt06ZcCpBea+OMBkhtyomwvoWEOBfWaEW+/raEf?=
 =?us-ascii?Q?grZG9HHpEfLhfX1VMV/QIJ8XW+z7Z7M6kxyOcdLTOZCIYW1dE806mv1ysmqf?=
 =?us-ascii?Q?uWkSk/I/4qAJqNVxM0lxUfJ6FF/EJJ2l2lB4bbv6xl8O+wu8nKWn55JJ0AEq?=
 =?us-ascii?Q?nB6T71UA6uOroIsLwYNujLUWZMwhqWt56QKlXQ9DusTJ2niTt3ZVI77G6A4i?=
 =?us-ascii?Q?SNVQoQ+FN+vDmVuHhniMKZobRquM4Rs1qoosjAphpB/IrWpM7VtZKAy0dTh5?=
 =?us-ascii?Q?rmIRtlSqd27NHIf2xELzanHh9FnRM3S5nZlpkS2d9VZIllGrbvZ2qCRzSFUm?=
 =?us-ascii?Q?cOG/ejMH7H83FH8pMqRgkk9FgZ/k8B25xGGQRya8tGbICyQCDVcPtXXfp48E?=
 =?us-ascii?Q?zAfqu8R9ZGM/S63mx+A7NLmgWh4ea7yDFndcjKrmFtlR9XtNwjRKg4c7/ekv?=
 =?us-ascii?Q?Fcuf49A=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(376011)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?iOq9qL7bkkkO24y8jdL4sqaNGesxJLELl6dMA/ThOibzXRznjM9QjNC+wwZr?=
 =?us-ascii?Q?7lf1fZNar8rI7MEje78sJuCyeEXF2axSpRzcXkq/Mppp/RPJkeF9E3Jiv8KD?=
 =?us-ascii?Q?P7hHYcA0wzMFnROSsXqjnxnWqgScp9+lHhzSh6RTV/CcOjchL5uXvITppplK?=
 =?us-ascii?Q?p21y8g/2OGiJWGYiSQ2Ap7qTo2EmBNb7ATjdjHQ26ORFXYlj9lIsNMfugal2?=
 =?us-ascii?Q?n2nG/YMhn/kh0s8tWW416OOgGhZVocNusMuPwuYPMzIoNHZ8p+vDbawm4SuC?=
 =?us-ascii?Q?AER1xJa6SyDCm9fQQ/Cq3l/+ukMJrxXaxWDhvUgy0//cp3+YnfecYEdMNM+K?=
 =?us-ascii?Q?Ef36DlQjpBpEu4EMSyNhbilGo2A2Voge4euTjY3EXmt5b3JhbqQ2/vFxasIO?=
 =?us-ascii?Q?88DRQDbqzdNvpettGOefzlOxvPyfN3lUa136ACh3CHQ1TnF3806JjLqCFaXX?=
 =?us-ascii?Q?oWWgWgNyr4FKRfcuUkF0knaXWhySUxUc90+kQNN+jDZ12a1fkGmhH3jHg2Gx?=
 =?us-ascii?Q?h4hVyP5HYEjPkbbyB5DiFPyin+TDhxrWI4/ZFI2lYTDj5lkK+d0rpf5Y0weD?=
 =?us-ascii?Q?GywWJVx2MT73SzR2ueEVR+/RwbOiO0Ilm7zZMzT3mkFUYbr/AFPIDC4QM0nn?=
 =?us-ascii?Q?3ALcgLBNyKA3uK+UmlQRCWC6lIlwiUN8wM9f9pzStv57/H/bo3SYq4+J+dDE?=
 =?us-ascii?Q?N/nbHifrhrs4BDVTPENbSE9pkcL1QxubBQwwGBF9vW9JNcyF6+Qlq0ybaOfq?=
 =?us-ascii?Q?FWeeSzQaZgnQUxTzn6vUko5cz6dzhMaIC60DxSGblP6XwvNs8Q8bGwgsPwcJ?=
 =?us-ascii?Q?1aZZJQQ0LQBJiA15fhNkz6GwaVGc+UPwKzsJsbMUPk3A4Hawsf81hsv/1rAw?=
 =?us-ascii?Q?b7Csf8nnuUDgkvEyo5d4bpMrVJg+BAHntw3tc2OLeaDXgmxrEylHWBWdJnK1?=
 =?us-ascii?Q?qmIULPm/UdkWjf/OuZMl0chENUKK2HB0VJveTTB5o4M5El0xsBoLoVBAfT7a?=
 =?us-ascii?Q?t6URW39fJIqDU6BD6TdkKIejBt4/umlHAgQcPGT6erzlEcyLraLo+TI8VY8q?=
 =?us-ascii?Q?vK7tay+iC1tc51cW+l2iEHxQBUSNPXFfxoEofHLmVVooQoD6hisLKdnETh+o?=
 =?us-ascii?Q?2TwRx24n6arYae+otp/J90m6h5m1M/gIDUhFDS6ULpaaGYHlAojUL7HlOqJa?=
 =?us-ascii?Q?0GIrYDS3nBemgG4H/f+ftwHQqVMaF/F7tXm0G5uOkUMc5OYACCNIkSSOORrg?=
 =?us-ascii?Q?UaKUSk0vFzzLGaYMLGzIW+FpW85MgGcMDpFAvqF3/4pxgpF8SplFvXs3yoXB?=
 =?us-ascii?Q?dEt7aX1B9WLDEgzGRr3AG1LmEPOBoJ10iGd+WkXdzXhcQx34MTUdRrt3AwZ3?=
 =?us-ascii?Q?Xn7yQhsuuBeMhu54ve//njB97uYrLKFXWbc6BJbQrUcMM3fqqbAIpNtbrh5y?=
 =?us-ascii?Q?D1LtnFY44N70nl2FMqzCljKBsE0o9xd5ZiyWAwQweUSzXE2rGF1c1bwK8fsx?=
 =?us-ascii?Q?S7PyrWI8qm7COtFge01G+48CDWUErauWSPLT7PAzvV4Y3iUBxLW1r6fIZu/3?=
 =?us-ascii?Q?E7qKFo+ni15S4NgJVSQBiiicTmRcjWJUkYYl8Dki?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9f84c0-876b-418c-eee1-08dc943a738c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2024 10:43:14.6967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSiaj6MXTMHnhg3FSr72EdpDIz6WE0leDyEFe9ILX65KqJ4sLsBX1eUvHvR6KsLQZuCH9SFWLYcf+ojpmhnfBlfUys8zYg+EMKYu+3Ve6+M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6580
X-Proofpoint-GUID: 6D6Xf_V3Wih84CbGyb30vR7UuG_dLkpb
X-Proofpoint-ORIG-GUID: 6D6Xf_V3Wih84CbGyb30vR7UuG_dLkpb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_09,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406240086

Hi Dmitry,

Thank you for your reply.

> -----Original Message-----
> From: dmitry.torokhov@gmail.com <dmitry.torokhov@gmail.com>
> Sent: Saturday, June 22, 2024 9:21 AM
> To: Agarwal, Utsav <Utsav.Agarwal@analog.com>
> Cc: Hennerich, Michael <Michael.Hennerich@analog.com>; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org; Artamonovs, Arturs
> <Arturs.Artamonovs@analog.com>; Bimpikas, Vasileios
> <Vasileios.Bimpikas@analog.com>
> Subject: Re: [PATCH] adp5588-keys: Support for dedicated gpio operation
>=20
> [External]
>=20
> Hi Utsav,
>=20
> On Fri, Jun 21, 2024 at 10:44:12AM +0000, Agarwal, Utsav wrote:
> > From: UtsavAgarwalADI <utsav.agarwal@analog.com>
> >
> > We have a SoC which uses ADP5587 exclusively as an I2C GPIO expander.
> > The current state of the driver for the ADP5588/87 only allows partial
> > I/O to be used as GPIO. This support was present before as a separate
> > gpio driver, which was dropped with the commit
> > 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> > functionality was deemed to have been merged with adp5588-keys.
> >
> > To restore this functionality, the "gpio-only" property allows
> > indicating if the device is to be used for GPIO only.
> > When specified, the driver skips relevant input device checks/parsing
> > and allows all GPINS to be registered as GPIO.
> >
> > Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> > ---
> >  drivers/input/keyboard/adp5588-keys.c | 30
> > ++++++++++++++++++++-------
> >  1 file changed, 23 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/input/keyboard/adp5588-keys.c
> > b/drivers/input/keyboard/adp5588-keys.c
> > index 1b0279393df4..78770b2dfe1b 100644
> > --- a/drivers/input/keyboard/adp5588-keys.c
> > +++ b/drivers/input/keyboard/adp5588-keys.c
> > @@ -719,7 +719,7 @@ static int adp5588_probe(struct i2c_client *client)
> >  	struct input_dev *input;
> >  	struct gpio_desc *gpio;
> >  	unsigned int revid;
> > -	int ret;
> > +	int ret, gpio_mode_only;
> >  	int error;
> >
> >  	if (!i2c_check_functionality(client->adapter,
> > @@ -739,13 +739,17 @@ static int adp5588_probe(struct i2c_client
> *client)
> >  	kpad->client =3D client;
> >  	kpad->input =3D input;
> >
> > -	error =3D adp5588_fw_parse(kpad);
> > -	if (error)
> > -		return error;
> > +	gpio_mode_only =3D device_property_present(&client->dev, "gpio-
> only");
>=20
> Do we really need a new property? Can we simply allow omitting
> keypad,num-rows/cols properties in case where we only want to have GPIO
> functionality?
>=20
> In any case this requires DT binding update.

I agree that we may not require another property however there are the foll=
owing two options to accomplish the same:

- The probe function utilizes a function called matrix_keypad_parse_propert=
ies(), which parses the rows and columns specified - which I would have to =
read as well in order to identify if all GPINS should be configured as GPIO=
. This would however mean that in case this is not a GPIO only mode, we wou=
ld have redundant code execution.=20

- If we avoid that and just use the return value from the function, it will=
 print out a dev_err message :"number of keypad rows/columns not specified =
" message.

How would you suggest I should proceed? I will add the DT bindings in the v=
2 patch.

>=20
> > +	if (!gpio_mode_only) {
> > +		error =3D adp5588_fw_parse(kpad);
> > +		if (error)
> > +			return error;
> >
> > -	error =3D devm_regulator_get_enable(&client->dev, "vcc");
> > -	if (error)
> > -		return error;
> > +		error =3D devm_regulator_get_enable(&client->dev, "vcc");
> > +		if (error)
> > +			return error;
>=20
> Why regulator is not needed for the pure GPIO mode? Please add a
> comment.

We don't specify a regulator for our kernel and the driver seems to work wi=
thout it. I agree however that it may not be mutually exclusive to the same=
, I will be fixing the same in the v2 patch.

>=20
> > +
> > +	}
> >
> >  	gpio =3D devm_gpiod_get_optional(&client->dev, "reset",
> GPIOD_OUT_HIGH);
> >  	if (IS_ERR(gpio))
> > @@ -790,6 +794,11 @@ static int adp5588_probe(struct i2c_client *client=
)
> >  	if (error)
> >  		return error;
> >
> > +	if (!client->irq && gpio_mode_only) {
> > +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> revid);
> > +		return 0;
> > +	}
> > +
>=20
> What is the reason for requesting interrupt in pure GPIO mode? Can we
> program the controller to not raise attention in this case?

I do not think irq is needed in case of GPIO mode since we do not use the s=
ame either. This was an attempt to preserve the driver functionality as it =
could be easily excluded if not specified.

>=20
> >  	error =3D devm_request_threaded_irq(&client->dev, client->irq,
> >  					  adp5588_hard_irq,
> adp5588_thread_irq,
> >  					  IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT, @@ -800,6 +809,13 @@
> > static int adp5588_probe(struct i2c_client *client)
> >  		return error;
> >  	}
> >
> > +
> > +	if (gpio_mode_only) {
> > +		dev_info(&client->dev, "Rev.%d irq %d, started as GPIO
> only\n",
> > +				revid, client->irq);
> > +		return 0;
> > +	}
> > +
> >  	dev_info(&client->dev, "Rev.%d keypad, irq %d\n", revid, client->irq)=
;
> >  	return 0;
> >  }
> > --
> > 2.34.1
>=20
> Thanks.
>=20
> --
> Dmitry

Regards,
Utsav Agarwal

