Return-Path: <linux-input+bounces-4700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F3D91BFB7
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 15:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77D0AB236BC
	for <lists+linux-input@lfdr.de>; Fri, 28 Jun 2024 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9184D1E529;
	Fri, 28 Jun 2024 13:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="QAXfHkRZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E911E50B;
	Fri, 28 Jun 2024 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719581907; cv=fail; b=PbLX6wUNNIaLJewInDZlXKNcUs4KguwbPZxJ4SxWelLs1g0CBmA/nHJlCQ2J8lQnAYHzPXuydU+hm9XXGirds4a6otxkCV8dg6XyuTQCs4AgDDaooYsTx/3afjn91iYVkZ+uqh7+zGcvTZJ7nHlDvrn8I0K4mza/9LR/X9/qw0U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719581907; c=relaxed/simple;
	bh=GmHYINVrOVuL/9JV17ZGwEaAREwiW2LRQjtst8QeoEM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cMEdIuyrXAgpEnG0g3Gl5JU6Wfe5Ru+KDhCVJcFEWmc8G+jCWxwC8QhJzLjR2HL6M5B0+/f5foSavWzlmiUNvdgD8gwsXtxdZrVT7enf1p/2F20l/H1fS2dxI8Qeg6G8q7RH2QDOBxxNzJk0Ip2jLWL9Qr9kCp5Gqn0w7t7+DKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=QAXfHkRZ; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45SBR7dr013931;
	Fri, 28 Jun 2024 09:38:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GmHYI
	NVrOVuL/9JV17ZGwEaAREwiW2LRQjtst8QeoEM=; b=QAXfHkRZBk2NrQrGKn41q
	KMT9Le4RMxSSJTxQSA0VPyva1Pf0FrGo8S51OmM/XCb8z5+lMObw7x8LnCzenoPM
	HJizWFcbn+QXxMtdU+4bZ1fdgC9CX79uLrvfnsbcc1kp0txwybtdLuhBPswciLUO
	Q4DCmOAIYZRF+Ja1IhX/yJxWL0BqoxHZxMWXm8UidsKN5jyIPxt61qsiVraHXbCe
	H/bITlZ3L8honEgkR6xwawqF83QO03Yp9Xx7kCEc548ipvc7vW/z3c31XTc4fP+A
	Lb7svccZjFQqpUAfmfhVwWR/YzksJJRQjAn+vPdf9sQkqH396m53BxtSFsLnoYud
	Q==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2041.outbound.protection.outlook.com [104.47.55.41])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 401a6vkw4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Jun 2024 09:38:23 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MyvHYpVgrqGf6IzZY+J4dczq5YJXpQDtjDFslA7lCX245eo5XeywShkzfeCO/TMrGq6MVVIpsmuIXC7OMz4X/VL61PYRVe4T2ZWyn5of63yw5JB68vaLIgUHNGDevgpx8yb70PAQpinJKiM5zAnGA0E423x57Et5OF6itfdi5NCSv8gKj9Oe0QIMKIU4+JzuZvVEkslDtVa83jo7wCjRgvheAXHgNnDIHtpREJhvZJKDHDMPoi3x382Ut737GN7ulzjujfWaeFZauKnpnNP9lTHg+p1J6RMGXMjFOYQpwaQWnF60+PgTjEMFNNg9nKff/SInOO/Cqcraa4Nx+k8vjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GmHYINVrOVuL/9JV17ZGwEaAREwiW2LRQjtst8QeoEM=;
 b=ThhVH4CSw8cyHCr734PSLs4rBzHtN8UdQ33u9eo4RgzxfSeiosWUXQHEhlQCD21GwoGt/7a+7OqcK/wTbsYd+SKm64rNWzyp78I+FoS1h3I8TUEq4Izg7rtjbjx4A1Qzm/ClV6z5bQhBPELHec9szMkYqA0Ko5jWtUR9nS/R3cREZnL5egletCRWgtvnx+oYtzG0oZgzCFWkllfyYhwG8kQzCszVyhXVjUQkc6zc2CsXoLegwF3rOkaityuRNEnHA9hrp/0xzqKNgSQYF+nkAojeaz3piwVleJc9EnnPTIhBxUyF8/b25ymAhzySsTP4iiHwpg7zV4cJ3Oi9OdHMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by DM4PR03MB5998.namprd03.prod.outlook.com (2603:10b6:5:389::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 13:38:08 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 13:38:08 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: =?utf-8?B?TnVubyBTw6E=?= <noname.nuno@gmail.com>,
        "Hennerich, Michael"
	<Michael.Hennerich@analog.com>,
        "dmitry.torokhov@gmail.com"
	<dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>
Subject: RE: [PATCH v2] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH v2] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AdrJVdnSzNlyofTJQlia1zDLY76hugAB3YOAAABRFlA=
Date: Fri, 28 Jun 2024 13:38:08 +0000
Message-ID: 
 <SJ0PR03MB6343973C6C7C5525114E318D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
 <SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <1fc545709ad2aee0b70a8d1c561516d94cb6fb1e.camel@gmail.com>
In-Reply-To: <1fc545709ad2aee0b70a8d1c561516d94cb6fb1e.camel@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jZFdGbllYSjNZVEpjWVhCd1pHRjBZVnh5YjJGdGFXNW5YREE1WkRnME9X?=
 =?utf-8?B?STJMVE15WkRNdE5HRTBNQzA0TldWbExUWmlPRFJpWVRJNVpUTTFZbHh0YzJk?=
 =?utf-8?B?elhHMXpaeTFoTlRsa1l6ZzFOQzB6TlRVekxURXhaV1l0T0RSbU1pMDJORFE1?=
 =?utf-8?B?TjJSalpUVm1PRFZjWVcxbExYUmxjM1JjWVRVNVpHTTROVFV0TXpVMU15MHhN?=
 =?utf-8?B?V1ZtTFRnMFpqSXROalEwT1Rka1kyVTFaamcxWW05a2VTNTBlSFFpSUhONlBT?=
 =?utf-8?B?SXhNREF3TmlJZ2REMGlNVE16TmpRd05UVTBPRFl3TlRJM05qRTJJaUJvUFNK?=
 =?utf-8?B?cmJFSk5kbmxvUTBSS09GbGxiVVJGWkRGRmRqTTBTVXgyV1hjOUlpQnBaRDBp?=
 =?utf-8?B?SWlCaWJEMGlNQ0lnWW04OUlqRWlJR05wUFNKalFVRkJRVVZTU0ZVeFVsTlNW?=
 =?utf-8?B?VVpPUTJkVlFVRkZiME5CUVVGQlVVRjRiMWxOYm1GQlZtdHlTRlJuTjNSUmRX?=
 =?utf-8?B?VlhVM05rVDBSMU1VTTFORVJCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJTRUZCUVVGRVlVRlJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlJVRkJVVUZDUVVGQlFUTk1hRk5tWjBGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VW8wUVVGQlFtaEJSMUZCWVZGQ1prRklUVUZhVVVKcVFVaFZRV05uUW14QlJq?=
 =?utf-8?B?aEJZMEZDZVVGSE9FRmhaMEpzUVVkTlFXUkJRbnBCUmpoQldtZENhRUZIZDBG?=
 =?utf-8?B?amQwSnNRVVk0UVZwblFuWkJTRTFCWVZGQ01FRkhhMEZrWjBKc1FVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGRlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFXZEJRVUZCUVVGdVowRkJRVWRGUVZwQlFuQkJSamhCWTNkQ2JFRkhUVUZr?=
 =?utf-8?B?VVVKNVFVZFZRVmgzUW5kQlNFbEJZbmRDY1VGSFZVRlpkMEl3UVVoTlFWaDNR?=
 =?utf-8?B?akJCUjJ0QldsRkNlVUZFUlVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJV?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVU5CUVVGQlFVRkRaVUZCUVVGWlVVSnJRVWRyUVZoM1Fu?=
 =?utf-8?B?cEJSMVZCV1hkQ01VRklTVUZhVVVKbVFVaEJRV05uUW5aQlIyOUJXbEZDYWtG?=
 =?utf-8?B?SVVVRmpkMEptUVVoUlFXRlJRbXhCU0VsQlRXZEJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUWtGQlFVRkJRVUZCUVVGSlFVRkJRVUZCUVQwOUlpOCtQQzl0?=
 =?utf-8?B?WlhSaFBnPT0=?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|DM4PR03MB5998:EE_
x-ms-office365-filtering-correlation-id: 24182faf-9d5e-46d0-4197-08dc97778bc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?aStrU3F4N3lHS3NKWGVLUStFNDRUN2JBNm5zWTNwNUUzQjFXMW9vTTV5eTBq?=
 =?utf-8?B?cmlrWjB4T1VWbEpleUxCTlBSNS9rYkw2aktPWUU4Kyt4K1V0L0g5YmJjRXpu?=
 =?utf-8?B?bUFaTFpia2Q0Vk00cG05OFJGSjlDZXRCL0FmQTdnTU5MZTFXOUk5ZGhDM2JJ?=
 =?utf-8?B?ZEFRVXBLWWJIVGdhQ3NnTjkzYkFOM1d3Q1cwUUg1SUJtZHBUakdnOFk3VVRq?=
 =?utf-8?B?eFc5SkJTWXlrWjNsMWJzTFhtL3BqZVJwT0FIUXZhbmhKZEtxRHMzdUZmdFdi?=
 =?utf-8?B?a2V2dWtKa29qZ2dvbUpkUVBoeHZzcm95VnlxWnpIbk9NY1NkVFp1VitxejJE?=
 =?utf-8?B?KzRmYStXRmMzaXhlNVRBSlRlbWV0V08vRHRuUWpoMXcyT1M1QlIvYVNRNWhC?=
 =?utf-8?B?WkgwalVhZ3MrU2luT0ovY0hMMFRPQlBNK1huSzFyR1BydDhuVzltakNoRk5Y?=
 =?utf-8?B?aEtqTmZoVVFnSDk2NTJMMHNzSEcyYXl2V1ZrUldVVVQxYmpZb2ZOODVTWE41?=
 =?utf-8?B?a0E3T0VxQnRDM1phSWZ1M0M5RzhpbVhnak5iaUlNTzRpUWFSRHNCZXE2ZHgy?=
 =?utf-8?B?OTlmakpCZTVJeDd2Qm1kalJidDFqZGpzTlpidFMyWXNLbWhNMFZab1ExaHA0?=
 =?utf-8?B?dlBwYkVvRllDMzJrRnA4akREcnVkbXkya1JmSHloSlZIOFlySzdkYWJ6ditP?=
 =?utf-8?B?aGoyRzkrYjk2dEhhQ2k0N3EzRzMxSEhMbHNXRmt3aGtvbnV6eXFUWTlvRkVW?=
 =?utf-8?B?WUlSN0FtY1RxTUwxU2N0UFdFMzBmZ1VNck1QUXlxQ0J5akI0dGNHQ0hYSVIr?=
 =?utf-8?B?L3RMSWVXM21ONlVnSWxBV0dyYXZ6d2FKempidjJ2TjJzanJxRkZGd2hFdWhs?=
 =?utf-8?B?dnZzMDFtMVM2Um56TGRnNmdxTHRTYVFVaTM2U0pBSU00dDVEckpERi9uRnlp?=
 =?utf-8?B?R1ErM0QzcHl4aGNIOW5tUUhOSlo2bzdvb3JSa2RZWjcyM2puTmxWeG1Gb3V3?=
 =?utf-8?B?RUpIQUZ1RHlQdk5lREVsVTJBdVpZbnNvMGo4T2ZDenFPZkFablhoMDY1RUdx?=
 =?utf-8?B?bVllQ2J1M3BhblVGVGhEYkh4bGF3SWp4WW53WUxFb2VCRk94enlCWmcwRUVz?=
 =?utf-8?B?RE4yMlphQ0hvakx2MitKdTc3ZDY2eGFrdG40bk1WL2xOa2g5QWNoRVNhU3Yx?=
 =?utf-8?B?MkhTTDZ4aHJHdWVmZkcvUEJCODBPaHZuWlZqTVhlN3B3Z1JjQXZZZkpsK3dB?=
 =?utf-8?B?WXNEeFZsdEdQWnJadmRMYWF6bU1FeUdnQnZWRHFBNm9kTGdYM24rUVQ3ZXZ4?=
 =?utf-8?B?ZzhSVjUzcDNQSmZIMkljN2QrdmkvQ2tRQkVvT3lDUStMZCs2VFNzK3hHbWJX?=
 =?utf-8?B?S25pYy9VSURqZjVtOUZlS1dBZ0VlTHlDK3VNVXc1aDRpVGRiZExnUHI3OWNH?=
 =?utf-8?B?U3NpZlRkdGVFMmpRbXppR0YyMklqdExJam1ybzlobllNMllXS0ZoSGg5QzFN?=
 =?utf-8?B?VWlYc1FNdXJNSjBLSkZnSTYwNEpuOGFKVzFRTUVyWFBudGVNVHVDc0JwV0ZE?=
 =?utf-8?B?NEFoSUpNcGxPTUhhZTNnS3lOTEZIc0ZDcjRTL3lCemN3ZlNVZ0dGQThPY3R6?=
 =?utf-8?B?bHdpVTVtZVI5b0RIU1JIaEhESkFIaDZyZmRkb3o0TlFLVGRtSkgycEdKRFBj?=
 =?utf-8?B?OGR5M2VmOWxvVDk4am1jVG4vZ0ZBUUVHNkpZdVpWZnQ2eFlDcDk2ekhYZ0pq?=
 =?utf-8?B?QStJa0Y5QmZLRk5vRnRQK05YR3VhZnJrZmxiRytIUjFSZTUrK25UdXVrcGdW?=
 =?utf-8?B?ZTFlS091bEFkNk9lYlpwUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M0hiUDNaN3ptKzlEYVY5bDg3UzkxUm8ydHBkR1lUdVFsRWdMNFhUMHZXbng0?=
 =?utf-8?B?ZkxlQmg1Qm5YV0JxcG9ldGF6c1VqL0Z2RmkvNlVGMmFSTENKc1ZKMXVDRWlR?=
 =?utf-8?B?bjNUTE9lclJ1OHZsdVVtV0pJQ0tha0pHSUtaNmpuNytteHhjcDQ0TzJUc0Z4?=
 =?utf-8?B?WEJWcXdtL0tFVXhabTgzb2RzWHQ2UCtldWVFbGRQdDdvYmIrSkJOc3krSWVj?=
 =?utf-8?B?Sk1nVm1CZ2R0QUVVQmdIcm5pbThrTjV4aWFTQ2hHYkx6OUM4ZnBQa0pqU1Ev?=
 =?utf-8?B?UGV2NU8vTG5SMFQxcGhjRzJBWVZZWTNrMEY4SkYzaTFRcFlIZERxMllOSXls?=
 =?utf-8?B?L1daVzkzVkRCdGJaVmZSWStJcXNhMUNNNUJoMnc0OXFHYlZVUHFiY1RQeVlJ?=
 =?utf-8?B?RnNNK2I3enFBdHRaN2xpOTFTdWRvQnlKZDRURlN5Z00wbCtVbkEyRFE1dzBK?=
 =?utf-8?B?LytHQWxoZGRQazY5UW1UK2NXd01GdnczT0Juc3RoTUxUdnd5RmRCQzR1b0JI?=
 =?utf-8?B?dW9QcUpyTkRZSFhQWDEzVjR6dzArcHJFTjVzU25PYW5PZjhwVUlabEdPdzB0?=
 =?utf-8?B?c2ZjeXREazZlQ095QnZvQTQvUGlUQUFIVlI2Ky9OYUdubjZTcUFyVksxckU1?=
 =?utf-8?B?ZVZFLzYzdEJ6bmlWM09XVlNBZ1N3SnpTUGJFT0xxeXZhcm1rRnFMeFNVeVpM?=
 =?utf-8?B?T1AyME0rbXE1WmR2dnV6NnNIVmdqSVlqSzNOSnpWejhYVHhkUjc0R1FoSDJB?=
 =?utf-8?B?aFk1VUx1SWZKSHMzc0l6VFovVHZVa043a3gxZjZuemNrOXJGR2psNCt1L2Vy?=
 =?utf-8?B?cHdHTFZsUXhnVmk0RmdIUVA2N2x3SjRLRm1sZmwzdmF2Y1J5RmZsaFJ1Y0Fl?=
 =?utf-8?B?MU1wL3kySG5uQjBDaXhwQUlOTUdKWWlkVmpycHoxdCtnQ2ZJei9Hbitoby94?=
 =?utf-8?B?NjVYdlVpOHNTNmxFcnJ0MFROakkwWFJsN3lrZXVEV2hyaXM4YVUzekVlTUwz?=
 =?utf-8?B?c1VDRzRGWWh0bG9JSG1vcmJGK2F6cVZGdE96Tm41TFJqTzdBTTdad0Evbm5k?=
 =?utf-8?B?Q2VyajU2bGZsM0hPWkVhUzVmVUdrRGVIczVhK1doY2M0a3JJbDcxekNjN2h4?=
 =?utf-8?B?RFJpUzVFMGZEWElEeW9DVzk3M3Z3NG9VT2FhMlplWDk3S3d2UndGV2dPVDZu?=
 =?utf-8?B?ZThSWFZ6anpSdExpY01rSm9ydG5icE1LYzBXai9BSXFUTVVTOFNCRVlPVHlN?=
 =?utf-8?B?VDFDMEZVbFg0bGgvZEViK0ZGTkhJeUZ2UUdrUXRsNUw5KzR2Yk9pMXhydnhS?=
 =?utf-8?B?YUFjd21mSjNqUFRkelREbjNZOUxneXhJV2s2OTE3bnFWY3RPMTV3Y2hIRno0?=
 =?utf-8?B?UGY2R3JLSXN6aWhKNnJqVURPWmJMSFE3bXRGMEUrNUQvK3FvaEptakJ6aVB2?=
 =?utf-8?B?aTFxQmY1ZjVnNzhtaUNJSDN2cStxUGVxbGJEZkVlQWJEOExyQVBrY1E4RG4v?=
 =?utf-8?B?MUNLdXB1ZDBiZXpCOHFZeGttWEdlMU1CdFoyMU5SNS9TK0crZ1RPQ01Va0Rl?=
 =?utf-8?B?V1ZLRDZQOEdIRDlvZUgvdUZQZjI3T2xrZ3MwQ0hFTkpIZEJnUzlxRUUwWXhL?=
 =?utf-8?B?b3ovNkorNmppeUIyaWpteWlxRHFobHBkRTJ4WDd4aFIwUVY1TkhUVVhmc2FK?=
 =?utf-8?B?a1ExWXlyRitqMjlJRjhzc1FEUXZBQy9mWWwzYyt2UHRTa3I1akprWkt3bVFt?=
 =?utf-8?B?ODNERW9LcmR0dVdiaW4va2M1ZElqb1plQ1BvZmg0cWlJRFZsTkxlT3lxREFO?=
 =?utf-8?B?cTlJUURmZGp5MGtrR1dCY291cFZVK0VScEtLUUtCNFVMdm9URjJhWEs2ZG9J?=
 =?utf-8?B?dnlJbW16Z3g1aTlvTE1yUFNONG1sOHRVbStmbmdnMjFKNmRsUlpnMURlZyt4?=
 =?utf-8?B?bFh4Ym5VZ1RBOWo0RU1BNUh1QTdRWkRSQWpSaG1iNE1YRTBGdGJlMWdSZlAy?=
 =?utf-8?B?OUFkMzdmUjA5WXk0bEdpSVdnVzNIZFJjNGhLcHc4eWRsem5UTm1pWjVhd3di?=
 =?utf-8?B?UmxyUkZQOUY3N3VOUjRCbDR6cE9QTlF1cndBSzFVdlV1cGtJYzdwOFA2djlV?=
 =?utf-8?Q?ywdX9A008R2jndIMpyhNzAw/Y?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24182faf-9d5e-46d0-4197-08dc97778bc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 13:38:08.0770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SN0Hg+rRlPMA3RXp0IKKBK2I/kB18Q/RFCztME5Swff4uLer7/RJY6hzGtd9KqOnMlwQnTUY+uYEqgW0hAJXMc5TS3Gh6iUK2/lKSPLl1do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998
X-Proofpoint-GUID: snBi5PR78as7SKw3XPHKwzh822jQgQVq
X-Proofpoint-ORIG-GUID: snBi5PR78as7SKw3XPHKwzh822jQgQVq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-28_09,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406280102

SGkgTnVubywNCg0KVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTnVubyBTw6EgPG5vbmFtZS5udW5vQGdtYWlsLmNvbT4N
Cj4gU2VudDogRnJpZGF5LCBKdW5lIDI4LCAyMDI0IDI6MTYgUE0NCj4gVG86IEFnYXJ3YWwsIFV0
c2F2IDxVdHNhdi5BZ2Fyd2FsQGFuYWxvZy5jb20+OyBIZW5uZXJpY2gsIE1pY2hhZWwNCj4gPE1p
Y2hhZWwuSGVubmVyaWNoQGFuYWxvZy5jb20+OyBkbWl0cnkudG9yb2tob3ZAZ21haWwuY29tOyBs
aW51eC0NCj4gaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnDQo+IENjOiBBcnRhbW9ub3ZzLCBBcnR1cnMgPEFydHVycy5BcnRhbW9ub3ZzQGFuYWxvZy5j
b20+OyBCaW1waWthcywNCj4gVmFzaWxlaW9zIDxWYXNpbGVpb3MuQmltcGlrYXNAYW5hbG9nLmNv
bT47IEdhc2tlbGwsIE9saXZlcg0KPiA8T2xpdmVyLkdhc2tlbGxAYW5hbG9nLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2Ml0gYWRwNTU4OC1rZXlzOiBTdXBwb3J0IGZvciBkZWRpY2F0ZWQg
Z3BpbyBvcGVyYXRpb24NCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IEhpIFV0c2F2LA0KPiANCj4g
T24gRnJpLCAyMDI0LTA2LTI4IGF0IDEyOjU3ICswMDAwLCBBZ2Fyd2FsLCBVdHNhdiB3cm90ZToN
Cj4gPiBGcm9tOiBVdHNhdiBBZ2Fyd2FsIDx1dHNhdi5hZ2Fyd2FsQGFuYWxvZy5jb20+DQo+ID4N
Cj4gPiBDdXJyZW50IHN0YXRlIG9mIHRoZSBkcml2ZXIgZm9yIHRoZSBBRFA1NTg4Lzg3IG9ubHkg
YWxsb3dzIHBhcnRpYWwNCj4gPiBJL08gdG8gYmUgdXNlZCBhcyBHUElPLiBUaGlzIHN1cHBvcnQg
d2FzIHByZXZpb3VzbHkgcHJlc2VudCBhcyBhDQo+ID4gc2VwYXJhdGUgZ3BpbyBkcml2ZXIsIHdo
aWNoIHdhcyBkcm9wcGVkIHdpdGggdGhlIGNvbW1pdA0KPiA+IDVkZGM4OTYwODhiMCAoImdwaW86
IGdwaW8tYWRwNTU4ODogZHJvcCB0aGUgZHJpdmVyIikgc2luY2UgdGhlDQo+ID4gZnVuY3Rpb25h
bGl0eSB3YXMgZGVlbWVkIHRvIGhhdmUgYmVlbiBtZXJnZWQgd2l0aCBhZHA1NTg4LWtleXMuDQo+
ID4NCj4gPiBUbyByZXN0b3JlIHRoaXMsIGtleXBhZCBzcGVjaWZpYyBjaGVja3MgaW4gdGhlIHBy
b2JlDQo+ID4gZnVuY3Rpb24gYXJlIHJlbGF4ZWQgaWYgdGhlIGZvbGxvd2luZyBjb25kaXRpb25z
IGFyZSBtZXQ6DQo+ID4gCTEpICJncGlvLW9ubHkiIHByb3BlcnR5IGhhcyBiZWVuIHNwZWNpZmll
ZCBmb3IgdGhlIG5vZGUNCj4gPiAJMikgTm8ga2V5cGFkIHJvd3MvY29sdW1ucyBhcmUgc3BlY2lm
aWVkDQo+ID4NCj4gPiBUaGUgImdwaW8tb25seSIgcHJvcGVydHkgaXMgaW50cm9kdWNlZCB0byBz
aW1wbGlmeSB1c2FnZSBzaW5jZSBpdA0KPiA+IHNlcnZlcyBhcyBhIGNsZWFyIGluZGljYXRpb24g
b2YgdGhlIHVzZXIncyBpbnRlbnRpb24gYXMgb3Bwb3NlZCB0byBiZWluZw0KPiA+IGluZmVycmVk
IGZyb20gdGhlIG51bWJlciBvZiByb3dzIGFuZCBjb2x1bW5zIHNwZWNpZmllZC4gVGhpcw0KPiA+
IGFsc28gYWRkcyBzaW1wbGljaXR5IGZvciB0aGUgYWNjb21wYW55aW5nIGR0IGJpbmRpbmcgdXBk
YXRlIGFzIHdlbGwNCj4gPiBhcyBpbnRlcnByZXRhdGlvbiBvZiB0aGUgc2FtZS4NCj4gPg0KPiA+
IEluIHN1Y2ggYSBjYXNlLCBhZGRpdGlvbmFsIGNoZWNrcyBhcmUgYWxzbyBpbnRyb2R1Y2VkIHRv
IG1ha2Ugc3VyZQ0KPiA+IHRoYXQga2V5cGFkIGFuZCBwdXJlIEdQSU8gb3BlcmF0aW9uIGFyZSBt
dXR1YWxseSBleGNsdXNpdmUgYnkNCj4gPiBjaGVja2luZyBmb3Iga2V5cGFkIHNwZWNpZmljIHBy
b3BlcnRpZXMgKGtleXBhZCxudW0tcm93cyBhbmQNCj4gPiBrZXlwYWQsbnVtLWNvbHVtbnMpLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogVXRzYXYgQWdhcndhbCA8dXRzYXYuYWdhcndhbEBhbmFs
b2cuY29tPg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg4LWtl
eXMuYyB8IDMzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiA+IMKgMSBmaWxlIGNo
YW5nZWQsIDMzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lu
cHV0L2tleWJvYXJkL2FkcDU1ODgta2V5cy5jDQo+ID4gYi9kcml2ZXJzL2lucHV0L2tleWJvYXJk
L2FkcDU1ODgta2V5cy5jDQo+ID4gaW5kZXggMWIwMjc5MzkzZGY0Li42YmZlNzQ4Nzk3ZGYgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9pbnB1dC9rZXlib2FyZC9hZHA1NTg4LWtleXMuYw0KPiA+
ICsrKyBiL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC1rZXlzLmMNCj4gPiBAQCAtMTg4
LDYgKzE4OCw3IEBAIHN0cnVjdCBhZHA1NTg4X2twYWQgew0KPiA+IMKgCXUzMiBjb2xzOw0KPiA+
IMKgCXUzMiB1bmxvY2tfa2V5c1syXTsNCj4gPiDCoAlpbnQgbmtleXNfdW5sb2NrOw0KPiA+ICsJ
Ym9vbCBncGlvX29ubHk7DQo+ID4gwqAJdW5zaWduZWQgc2hvcnQga2V5Y29kZVtBRFA1NTg4X0tF
WU1BUFNJWkVdOw0KPiA+IMKgCXVuc2lnbmVkIGNoYXIgZ3Bpb21hcFtBRFA1NTg4X01BWEdQSU9d
Ow0KPiA+IMKgCXN0cnVjdCBncGlvX2NoaXAgZ2M7DQo+ID4gQEAgLTY0Nyw2ICs2NDgsMjUgQEAg
c3RhdGljIGludCBhZHA1NTg4X2Z3X3BhcnNlKHN0cnVjdCBhZHA1NTg4X2twYWQNCj4gKmtwYWQp
DQo+ID4gwqAJc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCA9IGtwYWQtPmNsaWVudDsNCj4gPiDC
oAlpbnQgcmV0LCBpOw0KPiA+DQo+ID4gKwkvKg0KPiA+ICsJICogQ2hlY2sgaWYgdGhlIGRldmlj
ZSBpcyB0byBiZSBvcGVyYXRlZCBwdXJlbHkgaW4gR1BJTyBtb2RlLiBJZg0KPiA+ICsJICogc28s
IGNvbmZpcm0gdGhhdCBubyBrZXlwYWQgcm93cyBvciBjb2x1bW5zIGhhdmUgYmVlbiBzcGVjaWZp
ZWQsDQo+ID4gc2luY2UNCj4gPiArCSAqIGFsbCBHUElOUyBzaG91bGQgYmUgY29uZmlndXJlZCBh
cyBHUElPLg0KPiA+ICsJICovDQo+ID4gKwlpZiAoa3BhZC0+Z3Bpb19vbmx5KSB7DQo+ID4gKwkJ
cmV0ID0gZGV2aWNlX3Byb3BlcnR5X3ByZXNlbnQoJmNsaWVudC0+ZGV2LA0KPiA+ICsJCQkJImtl
eXBhZCxudW0tcm93cyIpOw0KPiANCj4gU2hvdWxkIGFsaWduIHdpdGggb3BlbiBwYXJlbnRoZXNp
cy4uLg0KPiANCj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAr
DQo+IA0KPiBkZXZfZXJyX3Byb2JlKCkgd2l0aCBhIG1lc3NhZ2Ugc2hvdWxkIGJlIGhlbHBmdWwu
Li4NCg0KSSB3aWxsIGFkZCBhbiBlcnJvciBtZXNzYWdlIGluIHRoZSBuZXh0IHZlcnNpb24uDQo+
IA0KPiA+ICsJCXJldCA9IGRldmljZV9wcm9wZXJ0eV9wcmVzZW50KCZjbGllbnQtPmRldiwNCj4g
PiArCQkJCSJrZXlwYWQsbnVtLWNvbHVtbnMiKTsNCj4gPiArCQlpZiAocmV0KQ0KPiA+ICsJCQly
ZXR1cm4gLUVJTlZBTDsNCj4gDQo+IEFsdGVybmF0aXZlbHksIHlvdSBjb3VsZCBqdXN0Og0KPiAN
Cj4gaWYgKGtwYWQtPmdwaW9fb25seSkNCj4gCXJldHVybiAwOw0KPiANCj4gQW5kIGlnbm9yZSB0
aGUgb3RoZXIgcHJvcGVydGllcy4uLg0KPiANCj4gPiArDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4g
Kwl9DQo+ID4gKw0KPiA+IMKgCXJldCA9IG1hdHJpeF9rZXlwYWRfcGFyc2VfcHJvcGVydGllcygm
Y2xpZW50LT5kZXYsICZrcGFkLT5yb3dzLA0KPiA+IMKgCQkJCQnCoMKgwqDCoCAma3BhZC0+Y29s
cyk7DQo+ID4gwqAJaWYgKHJldCkNCj4gPiBAQCAtNzM5LDYgKzc1OSw3IEBAIHN0YXRpYyBpbnQg
YWRwNTU4OF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQ0KPiA+IMKgCWtwYWQtPmNs
aWVudCA9IGNsaWVudDsNCj4gPiDCoAlrcGFkLT5pbnB1dCA9IGlucHV0Ow0KPiA+DQo+ID4gKwlr
cGFkLT5ncGlvX29ubHkgPSBkZXZpY2VfcHJvcGVydHlfcHJlc2VudCgmY2xpZW50LT5kZXYsICJn
cGlvLQ0KPiBvbmx5Iik7DQo+IA0KPiBTaW5jZSB0aGUgYWJvdmUgaXMgYWxzbyBGVyBwcm9wZXJ0
aWVzIGl0IGNvdWxkIGdvIGluc2lkZSBhZHA1NTg4X2Z3X3BhcnNlKCkuDQo+IEl0J3MgYWxzbyBt
aXNzaW5nIHRoZSBiaW5kaW5ncyBwYXRjaC4NCg0KWWVzLCBJIGFncmVlLCBvbiByZXZhbHVhdGlv
biBpdCBtYWtlcyBzZW5zZSB0byBkbyBzby4NCg0KPiANCj4gPiDCoAllcnJvciA9IGFkcDU1ODhf
ZndfcGFyc2Uoa3BhZCk7DQo+ID4gwqAJaWYgKGVycm9yKQ0KPiA+IMKgCQlyZXR1cm4gZXJyb3I7
DQo+ID4gQEAgLTc5MCw2ICs4MTEsMTEgQEAgc3RhdGljIGludCBhZHA1NTg4X3Byb2JlKHN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQpDQo+ID4gwqAJaWYgKGVycm9yKQ0KPiA+IMKgCQlyZXR1cm4g
ZXJyb3I7DQo+ID4NCj4gPiArCWlmICghY2xpZW50LT5pcnEgJiYga3BhZC0+Z3Bpb19vbmx5KSB7
DQo+ID4gKwkJZGV2X2luZm8oJmNsaWVudC0+ZGV2LCAiUmV2LiVkLCBzdGFydGVkIGFzIEdQSU8g
b25seVxuIiwNCj4gPiByZXZpZCk7DQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKwl9DQo+ID4gKw0K
PiANCj4gTm90ZSB0aGF0IGluIGNhc2UgdGhlcmUgYXJlIG5vIElSUSwgeW91IHNob3VsZCBub3Qg
bWFrZSB0aGUgZ3Bpb2NoaXAgYW4NCj4gaXJxY2hpcA0KPiBjYXBhYmxlOg0KPiANCj4gaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjEwLQ0KPiByYzUvc291cmNlL2RyaXZlcnMvaW5wdXQva2V5Ym9hcmQvYWRwNTU4OC0NCj4ga2V5
cy5jKkw0NDlfXztJdyEhQTNOaThDUzB5MlkhNVZfY0xybVZUNHQxd21WTnNVYmFHZWxSNEJBTUpE
ajNsMzVDDQo+IElJT2ZHSVhEaUNWRVk3cXU4WmM1dV9yNzMyMnNKUXNVVFJOV3plaHhaOHE5ZnNK
R282SHokDQo+IA0KPiANClVuZGVyc3Rvb2QsIEknbGwgbWFrZSB0aGUgcmV2aXNpb25zIGFjY29y
ZGluZ2x5Lg0KPiAtIE51bm8gU8OhDQo+IA0KDQo=

