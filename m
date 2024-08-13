Return-Path: <linux-input+bounces-5544-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4C895042F
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 13:51:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727431C20ECC
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2024 11:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6B919923D;
	Tue, 13 Aug 2024 11:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="nE0RDhYp"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19A01991BF;
	Tue, 13 Aug 2024 11:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723549862; cv=fail; b=FWj4XpsvExIC3+KaIDRLFsXqAPLNxX2jbnoy2pQAdFY5dmegUYiocRhweE3YubhfJ8oLLYrzdSKd50uoMhptuszShznMWEyLBD8H25wAU+iQkEcADp0iVGTRmHY/EB0a4M5NdDK+2ZCx9LyqAK2usKAotGJtLHbacqsAmooep1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723549862; c=relaxed/simple;
	bh=j/UGFUZkQlvToG6K3FCUa6IrEAGCV1hmu5m8p4xAp+U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JeZO4V3tQknHycPno71mrk7zun634nag0UYPtSLMmdODEGupaD/vQwVDb4BRtEzP2h/5H8FHxywaFPBIxOPx0ao0lAaZAhifgfa12q0o+8SQZP78t+w4JaWtxC3FcpU+tjvKvJHYCg8DYcEkHe/VLxtl7mShPFNtdny2r+A3HWQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=nE0RDhYp; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47D8exrK023943;
	Tue, 13 Aug 2024 07:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=j/UGF
	UZkQlvToG6K3FCUa6IrEAGCV1hmu5m8p4xAp+U=; b=nE0RDhYpB5bSGpK4wL1yM
	KqMOLDnAUzzba05wYpH1CBJ0hatExXi7kRmlbBJa0Jy0c3vhTzsJ20vDoI2wXOIn
	x3R39cJIfnMjdVIwpou6z5RbCeEl234ExdWU04DwXhFFVgNmTx0KUeQqH8oTWaYO
	Gg1l4JvpXzxBOulyjpVf/zrx68K3esSaPqmkKxIIvYGdRB0eojXiwaDcq7KzQQDQ
	zIqhOnOKNwZVHIyRarRI+4uHN6JDInQ7AtPlNdAPSkT2FDji0Nc20dHhsi0RXE0h
	U6wXLEVTF+emreuexvjRNWTvuWKka7QPsRqBYJ2skAO+TTrd5L9TFCTkKqev8CKT
	g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazlp17012054.outbound.protection.outlook.com [40.93.14.54])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 40x541jfn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 07:50:44 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQEmHNS3Xo1/JZk7f8IOoFUGoUOHuMUy0iRSpe9cvlbV9oUQieap2aMClJThCVTO2GNp1jk5OEPQJ/twRshxlmws8PHm0AlPn3gS5QvsFSSdd6OHgHsWApCvUBEb6rIFuD2yAnXZ70K2dXlzGiuHPZlj5/mI+E57PufvrwafQPlZJqkMBNigpUZ7KEUcIc4ASmnYBozyTZr1AyvHzlczIJiCaAoPIOcZ2unXM0SypTO3ziW2D/kMBU8mE3fX+0Pqr2cb9y9qIiV8DTpk4p5Rb0+X6XqrFXViR+u1m5NdR3cPJuMu/240Ls53EwIsLoMFVwXnLpY92WtCm6yqBKhV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/UGFUZkQlvToG6K3FCUa6IrEAGCV1hmu5m8p4xAp+U=;
 b=QidiuQFVjeZWT6Oidwc9dMFolmE6dVWm5ngz5ccMxCBHzcrDKDhhg5bNPZvok94WmS++NwXvJJBJEaukpdvggiofJZ6btlMuyIV5ztzRF3suqIUrWYndCnivK4Rdtq44eUrhVR/4cheMzOViFHQDv/hDTfyn0Z0XDekcy3nDnzt2pykClwxw4xr6ZFbWdosC8X76p6EhQBRAHHuF+Ei30u9Fd5ciyAN0dTrpuI/lZVKXxLHi1W3vsK9+pT3PH04H4MlzGKXmS7FH/uJG0VPo6vAZVXjv52sJTFT5MRkDxYDi+kaME8lN7bwJjM8WBxCbSCDyG6GpftM0HHhlclhcNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by SA1PR03MB6322.namprd03.prod.outlook.com (2603:10b6:806:1b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.30; Tue, 13 Aug
 2024 11:50:41 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%5]) with mapi id 15.20.7828.031; Tue, 13 Aug 2024
 11:50:41 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Hennerich,
 Michael" <Michael.Hennerich@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>,
        Conor Dooley <conor+dt@kernel.org>, "Sa, Nuno"
	<Nuno.Sa@analog.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: RE: [PATCH v10 3/3] dt-bindings: input: pure gpio support for adp5588
Thread-Topic: [PATCH v10 3/3] dt-bindings: input: pure gpio support for
 adp5588
Thread-Index: AQHa7WabgX80uLigs0yl9EoDlHFIjLIlCHEAgAAJkYA=
Date: Tue, 13 Aug 2024 11:50:41 +0000
Message-ID:
 <SJ0PR03MB634347015AE14A06A3837E199B862@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: <20240813-adp5588_gpio_support-v10-0-aab3c52cc8bf@analog.com>
 <20240813-adp5588_gpio_support-v10-3-aab3c52cc8bf@analog.com>
 <172354752239.384988.5705833300903132689.robh@kernel.org>
In-Reply-To: <172354752239.384988.5705833300903132689.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-dg-rorf: true
x-dg-ref:
 =?utf-8?B?UEcxbGRHRStQR0YwSUdGcFBTSXdJaUJ1YlQwaVltOWtlUzUwZUhRaUlIQTlJ?=
 =?utf-8?B?bU02WEhWelpYSnpYSFZoWjJGeWQyRXlYR0Z3Y0dSaGRHRmNjbTloYldsdVox?=
 =?utf-8?B?d3dPV1E0TkRsaU5pMHpNbVF6TFRSaE5EQXRPRFZsWlMwMllqZzBZbUV5T1dV?=
 =?utf-8?B?ek5XSmNiWE5uYzF4dGMyY3ROREUwTlRoaU1tSXROVGsyWVMweE1XVm1MVGcw?=
 =?utf-8?B?Wm1NdE5qUTBPVGRrWTJVMVpqZzFYR0Z0WlMxMFpYTjBYRFF4TkRVNFlqSmtM?=
 =?utf-8?B?VFU1Tm1FdE1URmxaaTA0TkdaakxUWTBORGszWkdObE5XWTROV0p2WkhrdWRI?=
 =?utf-8?B?aDBJaUJ6ZWowaU9EYzBOaUlnZEQwaU1UTXpOamd3TWpNME16YzRPVGszT1RF?=
 =?utf-8?B?eklpQm9QU0pJT1dnMmRubE9RblZzWVVWa1JGSjZkemRaYUZkQmQwSjJjM2M5?=
 =?utf-8?B?SWlCcFpEMGlJaUJpYkQwaU1DSWdZbTg5SWpFaUlHTnBQU0pqUVVGQlFVVlNT?=
 =?utf-8?B?RlV4VWxOU1ZVWk9RMmRWUVVGRVowUkJRVU5hYzB0WlJHUXJNMkZCWlhGTFlU?=
 =?utf-8?B?bEphR2w2YVVzMmIzQnlNR2xIVEU5SmIwUkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
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
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|SA1PR03MB6322:EE_
x-ms-office365-filtering-correlation-id: dba94f5d-d4b2-4b73-923a-08dcbb8e2821
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MFFzNzRHaXdvWXNkYTNXQ3dxK2tMNjFYU1hmdmQvOXVYdDBHQzNMMnp1Ullz?=
 =?utf-8?B?MUdWU0hyWkorbUF3ZzZ4eUZMSXEzallhcDlxQWFwazVRaDIrRjFSRU0veG5K?=
 =?utf-8?B?NEVOQWNGby80ZU5vMnNnWHVZSW1hYWUwUWs2TDU5NU9scmREenRHaWRaeU9u?=
 =?utf-8?B?QWhXNDFGaVpWVjVtMkVlVFNnYjNSTnpmSG1qRm9GYXJPZm5NUmgwOS8vdUQy?=
 =?utf-8?B?U1VkUnpHZ1FXcHlFMW1MYUZpQzlqTEM5ZTh3WkZyVVlYVm1UandBcFIwYi9r?=
 =?utf-8?B?NGQ0SW50UlNMY1BFcmZCTG1CVDkxdGtzRFpEb0dBZE4wZ1FQQVhXZUp3YjYx?=
 =?utf-8?B?SkVmblpKTHJwS1hwWE91b2lvdFo1OUdMS3dmWHhDRE9wbCtuWmpwWGlZb2Ju?=
 =?utf-8?B?d0Z2RXdIZWswL2puRWNVZ25UTmR0Zy9rc3JMblJHek9JZUhPUlUwWHJjVHZv?=
 =?utf-8?B?RWJ3YlpQQ0ZEVkxmdjJwclZPL05ab1hDZVAvbDhaSzBLRENrdEZrMms1R3JP?=
 =?utf-8?B?Mk04TVlreEtTcjNuYnFLUnpjNWhVb08zZEdLV0JWL0RaNThSS3diL3ZJY043?=
 =?utf-8?B?ZTcrS0NCUnlwaWFYS2M2SnBqaTUwRVZHZElheTlEaTQ5bUZYN2syeDE2RXIr?=
 =?utf-8?B?NkdCNENZSnlkZCtyYmxxUE03NmROT2ZRVllubVpOVFEzUm1kazdWSFp1QVh6?=
 =?utf-8?B?ajV6NktPNlpLcUxiaDViVDI5aytIcS8zemxkM3lQendGQ0RmZmZhUlk3MWFh?=
 =?utf-8?B?ckMxMGNpNlo0ejU1M2JjZmxJMDB4aHRnUVgxN1RnWFB4MmxRUkdhTnJqRUVx?=
 =?utf-8?B?eHFYVGhsL01lUzU1eWFPUTd5QnFxaTJSV0JRYUhkK3ljaGNiRnlsd3lZVlhu?=
 =?utf-8?B?MWlXOHJRbFV1bDM4RXczUWVja3BsTmwraFZwVXpXODBYQlZzVWdXWm5kakVZ?=
 =?utf-8?B?SHdiWnI1NEpvRHVoL0hyTnN1QXh2TWx4L3B1TUNKdlVieU93ZkNBcitiMjBH?=
 =?utf-8?B?ZzRzSUJRNlFDK1JPaTY4SXZRTDR2YkR0ZTB2WVp1Y1NDZC9Gb2ZtUWxreUFS?=
 =?utf-8?B?RGYzanIwVnJPVW1ST2ZxTU5VUHNTOEdLMEVya1FWYmtpcEpBK3A1K1g1S0w2?=
 =?utf-8?B?QmkzMlZaSlVOV3paZFkveXZnVk5WZThBZUp1c0xTdHVBMDRPaXgvMnJ6UktB?=
 =?utf-8?B?bUxqSjFxRXRHYzYxdzNyZGRFbksvcUVac20vR3ZKOUo4cWh3SDU2WGROUHVH?=
 =?utf-8?B?MWEvcjJWUjNoWW1VMGh4OXdaQ2ExekcrZ1BuVjhlWDRBd1hiNDdVZjc2aHN5?=
 =?utf-8?B?ZFZmMEZEeThNbkFVaTVTbjhTbUp1d05BNlhFUzRuZ01lQVpkVEVLaUlkbFda?=
 =?utf-8?B?RkhSMFFvdHVETzd6OWRIM1k3VnRvblVYL2Rla2R1clRoc0l0cjFPc1lRV2tv?=
 =?utf-8?B?cUFKeHVzWFF4RjY0Uk1RTy9NdEdlOWdvVkZVNkxkWmhyT29FdmNFU3hFNCtx?=
 =?utf-8?B?MmpteEVJMklzajRGKzlEWWRqbWNUNmpaZUtLMGM4eDJaRVNRTEJnWnhrYk92?=
 =?utf-8?B?OWtib1JUWWhhbERkRit0VC9aUmhGMVkwZmY5UkUxZFBoa3h0WTd2cGgvVnhy?=
 =?utf-8?B?NXdxUlZLTE8zTUl4ZGFFSHk5ODA1d0VqY2M5VkJWYnVVOUhhaWljZ2paZ2py?=
 =?utf-8?B?TEF5MGs4UGpXWHJPc203UUZqUG5rN2tSNTNxckhKYWRRWWJ5MmNSNUxKcWdw?=
 =?utf-8?B?Y0lRRFBEdHJvTkw1YkRNTmM4UkxUc0l5cndsc21kK3ZGMWgrc3MrajVPaUw1?=
 =?utf-8?B?VXlZaFp1WVVqUVBJeVhmdz09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y2xoeGR0clZIRlcwbUNITktCRTZpc0VvTlFpQ0l3TkNiZW9TbWhNUHhIc290?=
 =?utf-8?B?clV4RzE2Kys2OUh0SGE5Sm5kMmJaM2RvenlqWm4vUUxhRURjYlJDTW40V1Y5?=
 =?utf-8?B?V214SnQwQ3NXQzg0Nmlmc1AvWjRVYVBCb2MvRy9QMzd3Z0xwMjVkelB4N2hL?=
 =?utf-8?B?eDdiMEZlZnAyS1RvYlJSWGlvM1AyNUpUdUhsdkxNcFEyalhiYWtqSXdKK2E0?=
 =?utf-8?B?S3lOZ2hodG5QeDkxL3pHL0ZvRkZJZVF5SndiUndkRkVOdW1hVXpkdzIwaVdy?=
 =?utf-8?B?QU5Gc0J3WjhmVHdJbVUzUUVoZHAvVGltbHhtZHBTT05LaWVmUFhsSmNuU1dp?=
 =?utf-8?B?Z0NCTGg3ZlJrNUhIM2h1Zlk1dUdESW1ZWDNYcUU5ekVtUUh3cjRpZEVKMHNY?=
 =?utf-8?B?VzR1SVNOQWt1d0pFNnYzeUFxYVJyY0ZoRnEvQkZ5TlpKbFpjWVhKWGVkakQr?=
 =?utf-8?B?Rjl6Y3NnQWwzU0dKWTdzdG80NE5Yall0WjgvUzRSVFBxK3FtaHo1QjVaN2U5?=
 =?utf-8?B?SEl5d0RGeTZJOTUwUEJCMkdOckdrTWR1MDNPVlI2QVV3MVN3akZsaHdmSHU2?=
 =?utf-8?B?WnZBZTN5NVppMUVlekRvN3pHendBeTN2a2pKNnE5cklJbHVTRVpTM255WmIx?=
 =?utf-8?B?U2Q5OWJMRzdNSEFvWWZKa05wL1FuUW5yM0xIV3gwNXlSaHhXdlFNWW8wWW9Z?=
 =?utf-8?B?TTl6UGY3Z0liRXZNZkh3RGdDWmI5aUJSR0JkZmE2S1UzZlpoc1ppeGh0cEhz?=
 =?utf-8?B?YXFiYkFvOS9KTDg5RjREbHk1dHBSbE9pZHZVWTg0OHBLL1dXMEY0S081amJt?=
 =?utf-8?B?amhCNTRLL3BrMWNjWk5lOXk1L3pLTnNjUGVIeUdKSzZxcXlGT21qY0RBK3NX?=
 =?utf-8?B?QzJIUlFCQUR2WGpIL2IxTFdudTNRUFdHemRtU0xNWkNVN1YxLzM4SU9hbG5Z?=
 =?utf-8?B?bnlzYkhQSEhDV09udkJpRzBjcGFqdm1aaGJ3TDNqR2FrU1dlOXBGci9WUFI2?=
 =?utf-8?B?VWh6WGlFcnFFeE1WaExHS09aUENGeS90MUQvU3Rva0MwOWtXbFUwYkdpQnJi?=
 =?utf-8?B?clJxVENMcEJ1MDMwRUt3SHkvWmc2c3V6VmVYYXpqZTZGTHRHV0I0Tmo3clVS?=
 =?utf-8?B?WllycHdLdGljVTMwUGVvZWU3QjY0S1VVNjJTWnNDQTZta2RPbDBRRUtqS2F1?=
 =?utf-8?B?NDFVUDQxRzRVN0JDOS8vZmFVMktoa2xab29XdDRmZWdLR253eUFXK2hBL1dP?=
 =?utf-8?B?Q2VFTXA1ZUY0SkZacVJxNDliTnltQWRqNDh5YWlKYjFvdUVnYi9LVnhJOXdG?=
 =?utf-8?B?OTc0cm93VG4yODhGNzVFeVV0MWxCRVdhYzBmeXA4bGRjN1BRSVFTUSt1eXJz?=
 =?utf-8?B?aTcwQlZmRlNLZlBVWFdDTGlOdksrZEFUN2c5ekRIRy9YcjFMcnhQWUNFYzJ5?=
 =?utf-8?B?NzkxbmJwdU90VGY4U003bThGZzVYSFVHWlJOSzN6OE9qNWhnKzFPd21GNnNy?=
 =?utf-8?B?S1pFUzZIMzF2SzFoWWV4WUZnS1p5aHp6SFhia0tCek45NXRJWmcwaTNCV09s?=
 =?utf-8?B?TnFmYXAxcXVGZCtyM3BLQStRSDJERFlBMTNSbFRzdXRBaldhYnZXREhxV2Rm?=
 =?utf-8?B?TlFMNjdBVE1IRlF6a3Npa1hCSG9xMDB4c0NjbHRqUTVwY0ttTk1sbWNVdm5n?=
 =?utf-8?B?QUlUZlFGT0x1RlErL0xwS1JMaVNvVDBvaWtnMGxKT1paejlXUkMzWTRKWWJP?=
 =?utf-8?B?VW1GNkJwbUdoKy9GZWhIaFJwNlpyazkzclpQVzVVemFMQ1JWbnRDcVcyQXE2?=
 =?utf-8?B?ek9KRWkxT2VuUDRlUDh0M0VJUStrVUlhZjFmYTcveGlWanFJTlJJWWpiRGt4?=
 =?utf-8?B?U0FFaHJhVm1IZWl0bjdqeWp3OGVnZGpYZGhhUitSczJqdW9Nd0c1VU90c2RK?=
 =?utf-8?B?c3pkeE9OKzVPSkVxYzhyUG5YZkc1b25CdE4zQk5RS1dTUXg5OVBUb2pvVitw?=
 =?utf-8?B?aUZwWGt6RjZGTUVYa05INGQ1ZmJmWWE4V3duQ01mTTBGbU81V1k3VFIwaitY?=
 =?utf-8?B?bmI0dUtPU0hNYldJYVhaVzhxd3dmMDl4MnNONnJrdzgxSzF1NzU0NUs4SU9l?=
 =?utf-8?Q?hYWzQgxbyyKxjtdpKng13VcV1?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dba94f5d-d4b2-4b73-923a-08dcbb8e2821
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2024 11:50:41.2726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 37CQoXVynsR+8upPl2SdNBC44RdTSeCNukAguc9g3mFF64VSxKkPEb0E6F3TKt3oInYVKbIU/Ngc10zlOFj4WoAm8++DwgtqIg4YS+on0M8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6322
X-Proofpoint-ORIG-GUID: -w_LCNimhxxl1MC9TOuzq3Z-jhV8tcNh
X-Proofpoint-GUID: -w_LCNimhxxl1MC9TOuzq3Z-jhV8tcNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_03,2024-08-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130085

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgKEFy
bSkgPHJvYmhAa2VybmVsLm9yZz4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDEzLCAyMDI0IDEy
OjEyIFBNDQo+IFRvOiBBZ2Fyd2FsLCBVdHNhdiA8VXRzYXYuQWdhcndhbEBhbmFsb2cuY29tPg0K
PiBDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IEhlbm5lcmljaCwgTWljaGFlbA0KPiA8
TWljaGFlbC5IZW5uZXJpY2hAYW5hbG9nLmNvbT47IEdhc2tlbGwsIE9saXZlcg0KPiA8T2xpdmVy
Lkdhc2tlbGxAYW5hbG9nLmNvbT47IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47
IFNhLCBOdW5vDQo+IDxOdW5vLlNhQGFuYWxvZy5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBCaW1waWthcywgVmFzaWxlaW9zDQo+IDxWYXNpbGVpb3MuQmltcGlrYXNAYW5hbG9n
LmNvbT47IENvbm9yIERvb2xleQ0KPiA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+OyBBcnRh
bW9ub3ZzLCBBcnR1cnMNCj4gPEFydHVycy5BcnRhbW9ub3ZzQGFuYWxvZy5jb20+OyBLcnp5c3p0
b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+Ow0KPiBsaW51eC1pbnB1dEB2Z2VyLmtl
cm5lbC5vcmc7IERtaXRyeSBUb3Jva2hvdiA8ZG1pdHJ5LnRvcm9raG92QGdtYWlsLmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MTAgMy8zXSBkdC1iaW5kaW5nczogaW5wdXQ6IHB1cmUgZ3Bp
byBzdXBwb3J0IGZvciBhZHA1NTg4DQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiANCj4gT24gVHVl
LCAxMyBBdWcgMjAyNCAxMDo1MTozMyArMDEwMCwgVXRzYXYgQWdhcndhbCB3cm90ZToNCj4gPiBB
ZGRpbmcgc29mdHdhcmUgc3VwcG9ydCBmb3IgZW5hYmxpbmcgdGhlIHB1cmUgZ3BpbyBjYXBhYmls
aXR5IG9mIHRoZQ0KPiA+IGRldmljZSAtIHdoaWNoIGFsbG93cyBhbGwgSS9PIHRvIGJlIHVzZWQg
YXMgR1BJTy4gUHJldmlvdXNseSwgSS9PDQo+ID4gY29uZmlndXJhdGlvbiB3YXMgbGltaXRlZCBi
eSBzb2Z0d2FyZSB0byBwYXJ0aWFsIEdQSU8gc3VwcG9ydCBvbmx5Lg0KPiA+DQo+ID4gV2hlbiB3
b3JraW5nIGluIGEgcHVyZSBncGlvIG1vZGUsIHRoZSBkZXZpY2UgZG9lcyBub3QgcmVxdWlyZSB0
aGUNCj4gPiBjZXJ0YWluIHByb3BlcnRpZXMgYW5kIGhlbmNlLCB0aGUgZm9sbG93aW5nIGFyZSBu
b3cgbWFkZSBvcHRpb25hbDoNCj4gPiAJLSBpbnRlcnJ1cHRzDQo+ID4gCS0ga2V5cGFkLG51bS1y
b3dzDQo+ID4gCS0ga2V5cGFkLG51bS1jb2x1bW5zDQo+ID4gCS0gbGludXgsa2V5bWFwDQo+ID4N
Cj4gPiBIb3dldmVyLCBub3RlIHRoYXQgdGhlIGFib3ZlIGFyZSByZXF1aXJlZCB0byBiZSBzcGVj
aWZpZWQgd2hlbg0KPiA+IGNvbmZpZ3VyaW5nIHRoZSBkZXZpY2UgYXMgYSBrZXlwYWQsIGZvciB3
aGljaCBkZXBlbmRlbmNpZXMgaGF2ZSBiZWVuIGFkZGVkDQo+ID4gc3VjaCB0aGF0IHNwZWNpZnlp
bmcgZWl0aGVyIG9uZSByZXF1aXJlcyB0aGUgcmVtYWluaW5nIGFzIHdlbGwuDQo+ID4NCj4gPiBB
bHNvLCBub3RlIHRoYXQgaW50ZXJydXB0cyBhcmUgbWFkZSBvcHRpb25hbCwgYnV0IHJlcXVpcmVk
IHdoZW4gdGhlIGRldmljZQ0KPiA+IGhhcyBlaXRoZXIgYmVlbiBjb25maWd1cmVkIGluIGtleXBh
ZCBtb2RlIG9yIGFzIGFuIGludGVycnVwdCBjb250cm9sbGVyLg0KPiA+IFRoaXMgaGFzIGJlZW4g
ZG9uZSBzaW5jZSB0aGV5IG1heSBub3QgbmVjZXNzYXJpbHkgYmUgdXNlZCB3aGVuIGxldmVyYWdp
bmcNCj4gPiB0aGUgZGV2aWNlIHB1cmVseSBmb3IgR1BJTy4NCj4gPg0KPiA+IEFja2VkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFV0c2F2IEFnYXJ3YWwgPHV0c2F2LmFnYXJ3YWxAYW5hbG9nLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvYWRpLGFkcDU1ODgueWFtbCAgICAgfCA0
MCArKysrKysrKysrKysrKysrKystDQo+IC0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPg0KPiANCj4gTXkgYm90IGZvdW5kIGVycm9y
cyBydW5uaW5nICdtYWtlIGR0X2JpbmRpbmdfY2hlY2snIG9uIHlvdXIgcGF0Y2g6DQo+IA0KPiB5
YW1sbGludCB3YXJuaW5ncy9lcnJvcnM6DQo+IC4vRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2lucHV0L2FkaSxhZHA1NTg4LnlhbWw6MTQwOjE6IFtlcnJvcl0NCj4gc3ludGF4IGVy
cm9yOiBjb3VsZCBub3QgZmluZCBleHBlY3RlZCAnOicgKHN5bnRheCkNCj4gDQo+IGR0c2NoZW1h
L2R0YyB3YXJuaW5ncy9lcnJvcnM6DQo+IC9idWlsZHMvcm9iaGVycmluZy9kdC1yZXZpZXctDQo+
IGNpL2xpbnV4L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnB1dC9hZGksYWRw
NTU4OC55YW1sOiBpZ25vcmluZywNCj4gZXJyb3IgcGFyc2luZyBmaWxlDQo+IC4vRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2FkaSxhZHA1NTg4LnlhbWw6MTQwOjE6IGNv
dWxkIG5vdA0KPiBmaW5kIGV4cGVjdGVkICc6Jw0KPiBtYWtlWzJdOiAqKiogRGVsZXRpbmcgZmls
ZQ0KPiAnRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lucHV0L2FkaSxhZHA1NTg4
LmV4YW1wbGUuZHRzJw0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQv
YWRpLGFkcDU1ODgueWFtbDoxNDA6MTogY291bGQgbm90DQo+IGZpbmQgZXhwZWN0ZWQgJzonDQo+
IG1ha2VbMl06ICoqKiBbRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL01ha2VmaWxl
OjI2Og0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW5wdXQvYWRpLGFkcDU1
ODguZXhhbXBsZS5kdHNdIEVycm9yIDENCj4gbWFrZVsyXTogKioqIFdhaXRpbmcgZm9yIHVuZmlu
aXNoZWQgam9icy4uLi4NCj4gbWFrZVsxXTogKioqIFsvYnVpbGRzL3JvYmhlcnJpbmcvZHQtcmV2
aWV3LWNpL2xpbnV4L01ha2VmaWxlOjE0MzI6DQo+IGR0X2JpbmRpbmdfY2hlY2tdIEVycm9yIDIN
Cj4gbWFrZTogKioqIFtNYWtlZmlsZToyMjQ6IF9fc3ViLW1ha2VdIEVycm9yIDINCj4gDQoNCkFw
b2xvZ2llcywgaXQgc2VlbXMgbGlrZSBJIGFjY2lkZW50bHkgZGVsZXRlZCB0aGUgY2hhcmFjdGVy
cyB0b3dhcmRzIHRoZSBlbmQgDQpvZiB0aGUgeWFtbCBmaWxlIHdoZW4gbWFraW5nIGNoYW5nZXMu
Li4NCg0KSSB3aWxsIHJlc3VibWl0IHRoZSBjb3JyZWN0IHZlcnNpb24sIGhvd2V2ZXIsIHdpbGwg
d2FpdCBhIGJpdCBtb3JlIGluIGNhc2UgYW55IA0KZnVydGhlciBmZWVkYmFjayBpcyByZXF1aXJl
ZCB0byBiZSBhZGRyZXNzZWQuDQoNCj4gZG9jIHJlZmVyZW5jZSBlcnJvcnMgKG1ha2UgcmVmY2hl
Y2tkb2NzKToNCj4gDQo+IFNlZQ0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2RldmljZXRyZWUtDQo+IGJpbmRpbmdzL3Bh
dGNoLzIwMjQwODEzLWFkcDU1ODhfZ3Bpb19zdXBwb3J0LXYxMC0zLQ0KPiBhYWIzYzUyY2M4YmZA
YW5hbG9nLmNvbV9fOyEhQTNOaThDUzB5MlkhNHRiZE9xMjNWbW1tbE1nS0RMb0RVTE9WDQo+IGVU
aHpSNG52Q3ZJazhJN2JaQ3RqWTN1VEMyal9zNFZ4UWFISXk3UGRUcjJpS0xDQThKdlIyZVJYJA0K
PiANCj4gVGhlIGJhc2UgZm9yIHRoZSBzZXJpZXMgaXMgZ2VuZXJhbGx5IHRoZSBsYXRlc3QgcmMx
LiBBIGRpZmZlcmVudCBkZXBlbmRlbmN5DQo+IHNob3VsZCBiZSBub3RlZCBpbiAqdGhpcyogcGF0
Y2guDQo+IA0KPiBJZiB5b3UgYWxyZWFkeSByYW4gJ21ha2UgZHRfYmluZGluZ19jaGVjaycgYW5k
IGRpZG4ndCBzZWUgdGhlIGFib3ZlDQo+IGVycm9yKHMpLCB0aGVuIG1ha2Ugc3VyZSAneWFtbGxp
bnQnIGlzIGluc3RhbGxlZCBhbmQgZHQtc2NoZW1hIGlzIHVwIHRvDQo+IGRhdGU6DQo+IA0KPiBw
aXAzIGluc3RhbGwgZHRzY2hlbWEgLS11cGdyYWRlDQo+IA0KPiBQbGVhc2UgY2hlY2sgYW5kIHJl
LXN1Ym1pdCBhZnRlciBydW5uaW5nIHRoZSBhYm92ZSBjb21tYW5kIHlvdXJzZWxmLiBOb3RlDQo+
IHRoYXQgRFRfU0NIRU1BX0ZJTEVTIGNhbiBiZSBzZXQgdG8geW91ciBzY2hlbWEgZmlsZSB0byBz
cGVlZCB1cCBjaGVja2luZw0KPiB5b3VyIHNjaGVtYS4gSG93ZXZlciwgaXQgbXVzdCBiZSB1bnNl
dCB0byB0ZXN0IGFsbCBleGFtcGxlcyB3aXRoIHlvdXIgc2NoZW1hLg0KDQotIFV0c2F2DQo=

