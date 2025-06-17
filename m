Return-Path: <linux-input+bounces-12930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D071FADCBA7
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 14:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3240E7ACACE
	for <lists+linux-input@lfdr.de>; Tue, 17 Jun 2025 12:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7C92192EA;
	Tue, 17 Jun 2025 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdWgLcHH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6112D130C;
	Tue, 17 Jun 2025 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163547; cv=fail; b=EZOtYejbz+PELT3Wu6952UxTTRS4Q6EheM+UkY9rz4y8QNGSZNFT11GYVI1nCOIGIdbVYjshx8pZk7rDKRyvKFgZcaVXYp6QJhBj0cJEin8JVImrEIqCMgJCgTgGQz9nXMBLInwi2G5AdQbB2bFNGkG9DPJQVioYcTFlWN6rgIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163547; c=relaxed/simple;
	bh=HQDWIX5Yqv8jmnkqTvBfno/VkaQdHug92E8+CsC9j6w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N1Qr7GuB5Q4PHfiGslcEfogAMw1WpVdJ8so2IJAeg0SCmUS/ahUWFcYVjGmpP256gNClVnvm7c9y6HsbxreWZatTk+/7wmtKAz/tQ7+5ZXljgrc5C9oZNUzFxBRbHJbrVBs4I26JN8ctYuQwCzUJ0DOGsysyiWONUHC7RaMyfeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdWgLcHH; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750163545; x=1781699545;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HQDWIX5Yqv8jmnkqTvBfno/VkaQdHug92E8+CsC9j6w=;
  b=QdWgLcHHni2wSJa1YWvLOnt5YqET//6ztwsI6Xuq8I4/Vpj4VBoNAB8b
   kkR5e6H5MKNuFqCnQr9QIuAaKZgXnmxn9Kl/YPtLad2MHonl3te8SXCbS
   GVnxH6x//Vaf9Lsq9ojaHSVTb1JAuuC6KZCHvUgiCac4x2evRpDXRQtzJ
   aHeAdDFxP8q0oN8rYvn/YaatT8G/v1gg3KuF4WduKNXvc5q3dULYwJWGB
   vsCef15cexnJjoSQeG3d8wiueIMwiqNZkjcWvE+TJQcU+XyvLVYHrYt+o
   2PeV6Lr3QfMPAJ8VhRL2kCs61Qj1r/Imum/+80mzAwNJ47fQ5h/7/8z23
   A==;
X-CSE-ConnectionGUID: QxrOmsi6QIqB/oU/KZ1u+Q==
X-CSE-MsgGUID: Poo1fuPoSmy+EqcLbxZMWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52432904"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52432904"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:32:24 -0700
X-CSE-ConnectionGUID: PFKdLfQiQJaLsqeg+j+thg==
X-CSE-MsgGUID: 9QbBuycwQuKEZqxncGEiDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149660113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:32:24 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 05:32:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 05:32:23 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.40)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 05:32:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AN9tTgpI0Mwh7Yvy6CXitlA5nVhwWKYkrTDmwzbHzEscGe3kJo2rFlVqgopuN05GBS24BM1eCGESrReI9g56ZJSX5tei0SM+4S1lcvKKm2P8p98BM2GYVpXU/xVRqQDwKL9Dl/IfSIGyTIuYQcmzUkWAAENH0VIAeoYDVJYplOD1nQ1dF2KrQjAEJkZRKntQw9S6DJwQ/bMrLgv1Qto1/pClBdKpEFgJ/P05hpiufQmNmbbUC33d3+ple81CtSo5qvvBt2GrBysvZniGJCoPPRlhblKG46ne51wznpc/0rav2QsiHtJDgBA94mJX8Iaomo+l9Qbz1Ye0GiY1Y1oIIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQDWIX5Yqv8jmnkqTvBfno/VkaQdHug92E8+CsC9j6w=;
 b=adHBKyLoenhE6vtCnBvFhCyerJ44a5BnlHdHhgLVGGJI5mBydx2CbAfPdwosIhK0zV28FjOfXWvdssCTZhm1pXSjjGly33pfOtPN+KGlEivfrCpIqA4YbPGHsvy7CK1yWlkCoJMquoZXMRn0SpxfM/JzNde0aodhsssPxpNQsA2J4X3UtneIQl5QxafRN0SikA2dmWaSxo9ZoE5b708VnjDP/DeDJTg/zklPY9kUebkeKJPPqmqD9zHZlCxl+PIB1J/4pxSSVdf8EACevMv/EarqPg8J3i5kG4vp5u3NoI1RNF9REDODhQeOPiCvgpEuv4S8TrcD4pH26t15vGoy1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by IA0PR11MB7791.namprd11.prod.outlook.com (2603:10b6:208:401::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 12:32:07 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8835.023; Tue, 17 Jun 2025
 12:32:07 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Luke Jones <luke@ljones.dev>, Kurt Borja <kuurtb@gmail.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [REGRESSION] on linux-next (next-20250509)
Thread-Topic: [REGRESSION] on linux-next (next-20250509)
Thread-Index: AQHb2S6TBGDe1BxI30+ntJ8ysXhq+bP7i1EAgAvJpSA=
Date: Tue, 17 Jun 2025 12:32:06 +0000
Message-ID: <SJ1PR11MB612939BDB60526411DFDAC52B973A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
 <DA7WOJH0HZDH.36EH3U8BQJ0JF@gmail.com>
 <SJ1PR11MB612904F9F3109473838EE36BB96BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <b2feef03-ffaf-4172-9d00-09e3e37310ed@app.fastmail.com>
In-Reply-To: <b2feef03-ffaf-4172-9d00-09e3e37310ed@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|IA0PR11MB7791:EE_
x-ms-office365-filtering-correlation-id: a45cca9d-6ddb-4fad-6310-08ddad9af8db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YzJ4UDdZaFhzeHVtaU01TE1hOVZGRHJ1VXNkVUhkcHpCUUJwWnh0TSt3U1c3?=
 =?utf-8?B?YjE3cXF5NGJaY3hVamI3MVlnQ2RrMnBMSStuMUs3aTZCQTJKNnQzMm1EQXda?=
 =?utf-8?B?M0ZTUEpiQ2hHL2g3OExsdFlhZzJNMnN1VktCT1pobVVqMFptRjNJYVFLMmo0?=
 =?utf-8?B?a3FCVDQ1QW54dEdUbG5DVHFlSDNkSXJoN01pUndDZW1EL0lYSklaZEJFK1Zv?=
 =?utf-8?B?U3RmZ3VkQlh4alBQaTFRMmdMYmhpLzN4eWV5VmJ1dDluQzFOZDN0SDU0N3Qy?=
 =?utf-8?B?VVBjOFk1RDVsZ3VzeWxrUGRTei9MMzJhN0xWcktyeUt3MGlMNEtxNGJBOFVZ?=
 =?utf-8?B?UHZHM3NjNWsyS1ljN2wvbEhwN2JtNCtrQ0Q1V1pONHlMTENxUFNUMmEvU2dM?=
 =?utf-8?B?Y2dtZVpyNHZkc0NSVzBmdXVENjJ3Y29LNXRkYStRQUl5ZlFKVXFwckF5YS9q?=
 =?utf-8?B?Y3NwbTh3MDcvMFl3R1hud25uQmZ2amNaNVpmT2E5NTdlT1dMMTR6VFZweDNs?=
 =?utf-8?B?NkJsZExiK0J3TkRvWklkbWNIeG0zcDY0S3ZBeXNLandVU0FXNklkcWFFVzQ4?=
 =?utf-8?B?aTJVakVaOXlBMXVzeDkvNTF2WUFtRWhLYkVvWlBqNmpxaHdjK0hVQk81SFE5?=
 =?utf-8?B?aTg0bm1YWmVGeVNHSmQyV3I0VFVCNWlJaTZMSHpFL1M4bFFNQkduVnZSOWpE?=
 =?utf-8?B?NmhGS1hjRHZsQXZpTTkvMEhxYm1ZTE9IL28yZERtSkxvY29zR0h3RGVXZ1Uz?=
 =?utf-8?B?YjM2emhPV2tBMVlUOWIwUjBpTDJvazVDQVY1OVZXQTArdzlJVUhhbWR3dTRN?=
 =?utf-8?B?STZvY09aSVpoK25FSHBkeUNvOS83RmEwZGV6eXFWazRvQzI5OCtYWTFkakk5?=
 =?utf-8?B?anBGc0w3V1IxT1RkV0xvT1poNHhSc3U5bkxNV3JnTTA4VkdkbnhsanpteTRt?=
 =?utf-8?B?UWlib1NPUytad05Rc3JnQWViYmtadEJUUlRZUzVnQWw3UmQ1TGhNZ3pMaSsz?=
 =?utf-8?B?aG5iVkZWT3ZERVdQNXdYNHNDUnpCWm1CVU9KYlNlTng1dFZSRy9HVDMram1U?=
 =?utf-8?B?RTJ3TDN0SURFc3gyeUhWOGZRWHBhcloybTlsR2VadTE1TVkvaU12WHlyVWxX?=
 =?utf-8?B?QlI0MnBXMFBtL1BSMlFXRExOenh1bTc3R2JwUEVBaTJYVFVEcEtiQi85RVBZ?=
 =?utf-8?B?Z3Z2YmdSNlFtVnBIZDc0T2NuYjF4VDBTbWlHSndQdGtIN2s2eVltYzF2QnlW?=
 =?utf-8?B?bHFHR1ZIS3F2ZTd6NHVHL1M1aE9pRWxCczVOYmQrelFraEdDNFVrcFV5OXUv?=
 =?utf-8?B?ZWxYK3lKR2d6TlZLTkpUMjNrYXkxSm8ydmhqUTNzOENML1ZBT0pOMk10TE1r?=
 =?utf-8?B?NVI0a2kzSGlNWWx1cnJIUlJsOFhuT1NiSHkzeTgzN1h6QU56UmdtTjVucUhQ?=
 =?utf-8?B?dm8rYWhPNUFPS1lXQlBMR0FQc3hCMzIzTWFZU2FENzRVK1htdWVPOGNCQVR6?=
 =?utf-8?B?ajd4anN5WVNmNGpzZ0pqMHRhSlFjMUhkdjNUZGxNeU1WU045K1NCei9NL2NI?=
 =?utf-8?B?N285ak9jUEVJSml6aWtNYmR1S0xKNEdPTy9EUjZUVWZ4SUQ3VjdSOG9KMmZB?=
 =?utf-8?B?VU0yc1EwcmtLa1RtZjE3VUFSd0VCdVJzd2owVU41d3VFNmszVDE3eC9OV01v?=
 =?utf-8?B?bkVkSmE4QXJIQWVoeDZLZTJhTVZGeUNvMTRieGhESUV2NHhhWDdMUjhmdkZn?=
 =?utf-8?B?RkJhRFl0U21LNWVDUWd1QUJnYXVjL0VkQ2NjQjRzRnpGbzBDVnRoU3oxL3lF?=
 =?utf-8?B?Y2h2Ukoza0lrdW9NQWQya21nY0VFQnB6TGhJcmM0QXZoY2hkc1I1eS9OQjBq?=
 =?utf-8?B?elQ2SGVPWTdkWXpDUjJIdzAyNUlxMFM2K3JrMG4zZXcwaHBUS2xSNWlRaGIy?=
 =?utf-8?Q?0vWDnJx9b/A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NGVZeVBvYzI0WEpJMWdUc20rRUtoVmlURWtzM1A3T3lyY1FPek90Q3JiVzBk?=
 =?utf-8?B?WkRYZzQ4dFBFUjBkSEUwZTdJTDZwNFkram81VWRhRlB1VkpXUGRiakw3b1Rs?=
 =?utf-8?B?a1ZGZUVoTkg3Z1BFZDFUMG9mTkxIeG1EZzVSUHpOL2xJTHRpdUgrdXhwUjJU?=
 =?utf-8?B?ZVNnTFJ1Ni82MDRqcUJyNUJBZXRRN1VCcXZTVTZYTmpvOUVsZjh5VElxbGt3?=
 =?utf-8?B?MzlwMktMUXhQWUpFM0RPS0d0aDhuV3ZRRTNoaWliVVNhbThVYTJ0Q25CZFp5?=
 =?utf-8?B?QTM3L1FVNjY3eG5YbHNvMXFOTDB0K3Z0QmU1NitzdjRoZXNKd0c0Q2dzUU1G?=
 =?utf-8?B?UUF6V2FoSm9XQkZUNnRyN2Z4a3RzRnQvQjZtamczS1MxeGYydDlSZGczV3NO?=
 =?utf-8?B?bkpiYm9uc3JIRE1GbFJqTm5sNkVmVHNiM3ZEYW04THBkRERlVkxrQWRKVFlt?=
 =?utf-8?B?RzVETGxYbWNJS2hQMnhTaHRDMyt5MXJxVFhUWHQwSkpKK2cyc0t3OGhBWWlQ?=
 =?utf-8?B?MWFTRk94RHRiNlF6bWd5Vks5ZFRsanU3RTZSa3l2QXkzVDZvT0VtK2JMSXJy?=
 =?utf-8?B?WFlvZjZMWG1hTTJBQ0tjOTAvTUxhekRlMDdNSUhuRTY2YndWaHhHdmpQKy9n?=
 =?utf-8?B?NnBPNk9MZzUzL2loK2F3MlF3VllsUU15ZG93MkVhMW1INndVdDRoTFZGRzBr?=
 =?utf-8?B?Y1RhTGM2NVpuWXpOeEE5SDlHS0ZYNUtCdTRZS1VQc2ZwcDgzTXdzTmFkU3Bj?=
 =?utf-8?B?cEdSSW5MY3VCeUNvOXpOVWdGZ0ozaWs4d2xNSlE1UUoxL2duZ0RuRjBNUGVB?=
 =?utf-8?B?dUFGU2FwRWZuV3VpVEx4NmRTMTFqTTdBSmtQUVZBTXNVRGJkd0NZakFLdEJk?=
 =?utf-8?B?dlNRMmtEL0w3Nm5EWEZNQmZxbWZSVCtNQjdzSklmYlo5VkFpZmp6M2lnYW04?=
 =?utf-8?B?V2F0V0ZXbE5SZFc4TXk5ZzJ0Tjc2WTNvK2VBNzlhMDlBWGxTTjVZR1pwb2px?=
 =?utf-8?B?SW1Wc2FTU0tabGU4aFBRTW9lMjJ4WVBrY0d2dGMzUlBoSWJTZUlDZHRHQWNo?=
 =?utf-8?B?OWNwWlJnMlA1ekxsczJWR0JLT1ZMYzN5MEIxRnZtZzNPNTJaeEc3eDlqNWlP?=
 =?utf-8?B?RVB1ajhDNGF5Z201U3dBMkU0N1N5NVVYU2x6eEM2c1JBL2w5dTNzRHVNYXJY?=
 =?utf-8?B?MUpCc2duRXdoQ1R4S3paOWRkb1IzWVNIKzBGU0RySlRNaEo3UlFvVDQ5amFU?=
 =?utf-8?B?QThHZXhPeEtOeWsrNEkzYU1teTMrUTd3WmFRR2prWkdjemxlUkVlalJ5Q0xD?=
 =?utf-8?B?U1JQczFYdTg3Z2tablF0MkY3bFhOMzJnQnByYkZQczU1NHo5K2tsdmNNelpq?=
 =?utf-8?B?V0VDK2JucEZwUG9JUzhLcU1DdVRwRDVLcFRXRzZlRnZUalJNK3Q2TTh3NkZ0?=
 =?utf-8?B?L2UzZ2V6ZFQ2SUNOdncyYmRqV1U2T3lycHZYVXdRaXZadU9JYjJVWi9xNkNK?=
 =?utf-8?B?bzlmSWVFWlRhMm1KTlhHb3dQdXpINW5tNmRMV3lnc3FHT1VwOXJxM0hoQnlR?=
 =?utf-8?B?a3I5bzdvS3ZUaGVCdGk5QlA3MGlzREQ2RDcxNk1mNldIelBpajliSzZxY09T?=
 =?utf-8?B?MUVCVkxTR01oRitLU1pQaXVZVzJXUWVRajZlZUpJOU94UDJ2YzVsRmthV2F5?=
 =?utf-8?B?YnI3dGg5U0hzRFREemc1UFBSVUZrWERhdVdRTUF3NDB2ekowcXNpSkR2dUZG?=
 =?utf-8?B?MEFvRU1pR3o3S0EyT0NUbHhRbTE3ZnJWU3NXTXVsUS95ZW55VnZ1RU1OSCts?=
 =?utf-8?B?MWFGWXhtS0x6RXNSQVY1dFUyZTA2c0lPUkN1M2VBYVV2bjJIdTV2VkErbkdw?=
 =?utf-8?B?Y2hHZWVRWXgrOGcvcWFJRjRpa01HRW9nTGJwcmM1UzcvQUZ0eWsyNFFBZTRN?=
 =?utf-8?B?cTV4bXMyY0Vxb0ZiaXdYaFhLaGlNT2ZXczVjNXZlK0VSL04rWU1DdG5TU0ZS?=
 =?utf-8?B?R2kxU2txbkEzNWZERWxMOTlrZEFFZS9VNGZoblI4WStJYkxwZzZxNjNWSUVD?=
 =?utf-8?B?N0F4NWdzTExnaDVsczBCY2Jjc0k0NWJxU05MSTRHUlFKaFlGL0FiaGJ2VStr?=
 =?utf-8?B?dkJFdEwyTTBndnFZVElESXBrSE1GWVZTTmRGa3lPVkxlcUhHSHpCL1BCbnJx?=
 =?utf-8?B?N1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a45cca9d-6ddb-4fad-6310-08ddad9af8db
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 12:32:06.8023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMVt50M5CZXmWUZYjFBi0VkdILJ8WxpGM3OJARFnhboIoHuQjw9QMopm+KG9OFQXmLXwbxyV/VsE00c/GmveOJtyRH4BkRKLO0ffnB79/pc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7791
X-OriginatorOrg: intel.com

SGkgTHVrZSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMdWtlIEpv
bmVzIDxsdWtlQGxqb25lcy5kZXY+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMTAsIDIwMjUgNjow
MCBBTQ0KPiBUbzogQm9yYWgsIENoYWl0YW55YSBLdW1hciA8Y2hhaXRhbnlhLmt1bWFyLmJvcmFo
QGludGVsLmNvbT47IEt1cnQgQm9yamENCj4gPGt1dXJ0YkBnbWFpbC5jb20+DQo+IENjOiBpbnRl
bC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IFNhYXJpbmVuLA0KPiBKYW5pIDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT47IEt1cm1pLCBT
dXJlc2ggS3VtYXINCj4gPHN1cmVzaC5rdW1hci5rdXJtaUBpbnRlbC5jb20+OyBEZSBNYXJjaGks
IEx1Y2FzDQo+IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmku
bmlrdWxhQGludGVsLmNvbT47IGxpbnV4LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IHBsYXRm
b3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUkVHUkVTU0lP
Tl0gb24gbGludXgtbmV4dCAobmV4dC0yMDI1MDUwOSkNCj4gDQo+IE9uIE1vbiwgOSBKdW4gMjAy
NSwgYXQgMTE6MDYgUE0sIEJvcmFoLCBDaGFpdGFueWEgS3VtYXIgd3JvdGU6DQo+ID4gSGkgTHVr
ZSwNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206
IEt1cnQgQm9yamEgPGt1dXJ0YkBnbWFpbC5jb20+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgTWF5
IDI4LCAyMDI1IDk6MTEgUE0NCj4gPj4gVG86IEx1a2UgSm9uZXMgPGx1a2VAbGpvbmVzLmRldj47
IEJvcmFoLCBDaGFpdGFueWEgS3VtYXINCj4gPj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRl
bC5jb20+DQo+ID4+IENjOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4+IFNhYXJpbmVuLCBKYW5pIDxqYW5pLnNhYXJp
bmVuQGludGVsLmNvbT47IEt1cm1pLCBTdXJlc2ggS3VtYXINCj4gPj4gPHN1cmVzaC5rdW1hci5r
dXJtaUBpbnRlbC5jb20+OyBEZSBNYXJjaGksIEx1Y2FzDQo+ID4+IDxsdWNhcy5kZW1hcmNoaUBp
bnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGphbmkubmlrdWxhQGludGVsLmNvbT47DQo+ID4+IGxp
bnV4LSBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJu
ZWwub3JnDQo+ID4+IFN1YmplY3Q6IFJlOiBbUkVHUkVTU1NJT05dIG9uIGxpbnV4LW5leHQgKG5l
eHQtMjAyNTA1MDkpDQo+ID4+DQo+ID4+IEhpIEx1a2UsDQo+ID4+DQo+ID4+IE9uIFdlZCBNYXkg
MjgsIDIwMjUgYXQgMTA6MDcgQU0gLTAzLCBMdWtlIEpvbmVzIHdyb3RlOg0KPiA+PiA+IE9uIFdl
ZCwgMjggTWF5IDIwMjUsIGF0IDEyOjA4IFBNLCBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIHdyb3Rl
Og0KPiA+PiA+PiBIZWxsbyBMdWtlLA0KPiA+PiA+Pg0KPiA+PiA+PiBIb3BlIHlvdSBhcmUgZG9p
bmcgd2VsbC4gSSBhbSBDaGFpdGFueWEgZnJvbSB0aGUgbGludXggZ3JhcGhpY3MNCj4gPj4gPj4g
dGVhbSBpbg0KPiA+PiBJbnRlbC4NCj4gPj4gPj4NCj4gPj4gPj4gVGhpcyBtYWlsIGlzIHJlZ2Fy
ZGluZyBhIHJlZ3Jlc3Npb24gd2UgYXJlIHNlZWluZyBpbiBvdXIgQ0kNCj4gPj4gPj4gcnVuc1sx
XSBvbiBsaW51eC1uZXh0IHJlcG9zaXRvcnkuDQo+ID4+ID4NCj4gPj4gPiBDYW4geW91IHRlbGwg
bWUgaWYgdGhlIGZpeCBoZXJlIHdhcyBpbmNsdWRlZD8NCj4gPj4gPiBodHRwczovL2xrbWwub3Jn
L2xrbWwvMjAyNS81LzI0LzE1Mg0KPiA+PiA+DQo+ID4+ID4gSSBjb3VsZCBjaGFuZ2UgdG86DQo+
ID4+ID4gc3RhdGljIHZvaWQgYXN1c19zMmlkbGVfY2hlY2tfcmVnaXN0ZXIodm9pZCkgew0KPiA+
PiA+ICAgICAvLyBPbmx5IHJlZ2lzdGVyIGZvciBBbGx5IGRldmljZXMNCj4gPj4gPiAgICAgaWYg
KGRtaV9jaGVja19zeXN0ZW0oYXN1c19yb2dfYWxseV9kZXZpY2UpKSB7DQo+ID4+ID4gICAgICAg
ICBpZiAoYWNwaV9yZWdpc3Rlcl9scHMwX2RldigmYXN1c19hbGx5X3MyaWRsZV9kZXZfb3BzKSkN
Cj4gPj4gPiAgICAgICAgICAgICBwcl93YXJuKCJmYWlsZWQgdG8gcmVnaXN0ZXIgTFBTMCBzbGVl
cCBoYW5kbGVyIGluIGFzdXMtd21pXG4iKTsNCj4gPj4gPiAgICAgfQ0KPiA+PiA+IH0NCj4gPj4g
Pg0KPiA+PiA+IGJ1dCBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHdoYXQgaXMgaGFwcGVuaW5n
IGhlcmUuIFRoZSBpbm5lcg0KPiA+PiA+IGxwczANCj4gPj4gZnVuY3Rpb25zIHdvbid0IHJ1biB1
bmxlc3MgdXNlX2FsbHlfbWN1X2hhY2sgaXMgc2V0Lg0KPiA+Pg0KPiA+PiBUaGUgUklQIGlzIGNh
dXNlZCBieSBhICJsaXN0X2FkZCBkb3VibGUgYWRkIiB3YXJuaW5nLg0KPiA+Pg0KPiA+PiBBZnRl
ciByZWFkaW5nIHRoZSBsb2csIEkgYmVsaWV2ZSB0aGlzIGlzIGhhcHBlbmluZyBiZWNhdXNlDQo+
ID4+IGFzdXNfd21pX3JlZ2lzdGVyX2RyaXZlcigpIGlzIGNhbGxlZCBhIHNlY29uZCB0aW1lIGJ5
IGVlZXBjX3dtaSBhZnRlcg0KPiA+PiBhc3VzX25iX3dtaSwgd2hpY2ggaW1wbGllcw0KPiA+Pg0K
PiA+PiAJYXN1c193bWlfcHJvYmUoKQ0KPiA+PiAJICAtPiBhY3BpX3JlZ2lzdGVyX2xwczBfZGV2
KCZhc3VzX2FsbHlfczJpZGxlX2Rldl9vcHMpDQo+ID4+DQo+ID4+IGlzIGNhbGxlZCB0d2ljZSBh
bmQgdGhlIHdhcm5pbmcgaXMgdHJpZ2dlcmVkLg0KPiA+Pg0KPiA+PiBMaW5lIFsxXSBtYWtlcyBt
ZSB0aGluayB0aGlzIGNvdWxkIGJlIGEgcmFjZSBjb25kaXRpb24sIGFzDQo+ID4+IGFzdXNfd21p
X3JlZ2lzdGVyX2RyaXZlcigpIG1heSBiZSBjYWxsZWQgY29uY3VycmVudGx5Lg0KPiA+Pg0KPiA+
PiBbMV0NCj4gPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVyDQo+ID4+IHMtDQo+ID4+IHg4Ni5naXQvdHJlZS9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9hc3VzLXdtaS5jP2g9Zm9yLW5leHQjbjUxMDENCj4gPj4NCj4gPg0K
PiA+IEFueSB1cGRhdGUgb24gdGhpcz8gSXQgaGFzIG5vdyBoaXQgIDYuMTYtcmMxDQo+ID4NCj4g
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL2lndEBydW5uZXJAYWJv
cnRlZC5odG1sDQo+IA0KPiBJIHdpbGwgc2VuZCBhIHBhdGNoIGFzYXAuIEhhdmVuJ3QgYmVlbiBh
YmxlIHRvIGRvIHNvIHdpdGggd29yayBhbmQgMyBkYXlzIG9mDQo+IGZsaWdodHMuDQo+IA0KDQpH
ZW50bGUgcmVtaW5kZXIuIA0KDQo+ID4gUmVnYXJkcw0KPiA+DQo+ID4gQ2hhaXRhbnlhDQo+ID4N
Cj4gPj4gPg0KPiA+PiA+IEkgd2lsbCBkbyBteSBiZXN0IHRvIGZpeCBidXQgSSBuZWVkIHRvIHVu
ZGVyc3RhbmQgd2hhdCBoYXBwZW5lZCBhIGJpdA0KPiBiZXR0ZXIuDQo+ID4+ID4NCj4gPj4gPiBy
ZWdhcmRzLA0KPiA+PiA+IEx1a2UuDQo+ID4+ID4NCj4gPj4gPj4gU2luY2UgdGhlIHZlcnNpb24g
bmV4dC0yMDI1MDUwOSBbMl0sIHdlIGFyZSBzZWVpbmcgdGhlIGZvbGxvd2luZw0KPiA+PiA+PiBy
ZWdyZXNzaW9uDQo+ID4+ID4+DQo+ID4+ID4+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+
PiA+PiA8ND5bICAgIDUuNDAwODI2XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0NCj4gPj4gPj4gPDQ+WyAgICA1LjQwMDgzMl0gbGlzdF9hZGQgZG91YmxlIGFkZDogbmV3PWZm
ZmZmZmZmYTA3YzBjYTAsDQo+ID4+ID4+IHByZXY9ZmZmZmZmZmY4MzdlOWE2MCwgbmV4dD1mZmZm
ZmZmZmEwN2MwY2EwLg0KPiA+PiA+PiA8ND5bICAgIDUuNDAwODQ1XSBXQVJOSU5HOiBDUFU6IDAg
UElEOiAzNzkgYXQgbGliL2xpc3RfZGVidWcuYzozNQ0KPiA+PiA+PiBfX2xpc3RfYWRkX3ZhbGlk
X29yX3JlcG9ydCsweGRjLzB4ZjANCj4gPj4gPj4gPDQ+WyAgICA1LjQwMDg1MF0gTW9kdWxlcyBs
aW5rZWQgaW46IGNtZGxpbmVwYXJ0KCspIGVlZXBjX3dtaSgrKQ0KPiA+PiA+PiBhc3VzX25iX3dt
aSgrKSBhc3VzX3dtaSBzcGlfbm9yKCspIHNwYXJzZV9rZXltYXAgbWVpX3B4cCBtdGQNCj4gPj4g
Pj4gcGxhdGZvcm1fcHJvZmlsZSBrdm1faW50ZWwoKykgbWVpX2hkY3Agd21pX2Jtb2Yga3ZtIGly
cWJ5cGFzcw0KPiA+PiA+PiBwb2x5dmFsX2NsbXVsbmkgdXNiaGlkIGdoYXNoX2NsbXVsbmlfaW50
ZWwgc25kX2hkYV9pbnRlbCBoaWQNCj4gPj4gPj4gc2hhMV9zc3NlMw0KPiA+PiA+PiByODE1Migr
KSBiaW5mbXRfbWlzYyBhZXNuaV9pbnRlbCBzbmRfaW50ZWxfZHNwY2ZnIG1paSByODE2OQ0KPiA+
PiA+PiBzbmRfaGRhX2NvZGVjIHJhcGwgdmlkZW8gc25kX2hkYV9jb3JlIGludGVsX2NzdGF0ZSBz
bmRfaHdkZXANCj4gPj4gPj4gcmVhbHRlayBzbmRfcGNtIHNuZF90aW1lciBtZWlfbWUgc25kIGky
Y19pODAxIGkyY19tdXgNCj4gPj4gPj4gc3BpX2ludGVsX3BjaSBpZG1hNjQgc291bmRjb3JlIHNw
aV9pbnRlbCBpMmNfc21idXMgbWVpDQo+ID4+ID4+IGludGVsX3BtY19jb3JlIG5sc19pc284ODU5
XzEgcG10X3RlbGVtZXRyeSBwbXRfY2xhc3MNCj4gPj4gPj4gaW50ZWxfcG1jX3NzcmFtX3RlbGVt
ZXRyeSBwaW5jdHJsX2FsZGVybGFrZSBpbnRlbF92c2VjIGFjcGlfdGFkDQo+ID4+ID4+IHdtaSBh
Y3BpX3BhZCBkbV9tdWx0aXBhdGggbXNyIG52bWVfZmFicmljcyBmdXNlIGVmaV9wc3RvcmUgbmZu
ZXRsaW5rDQo+IGlwX3RhYmxlcyB4X3RhYmxlcyBhdXRvZnM0DQo+ID4+ID4+IDw0PlsgICAgNS40
MDA5MDRdIENQVTogMCBVSUQ6IDAgUElEOiAzNzkgQ29tbTogKHVkZXYtd29ya2VyKSBUYWludGVk
Og0KPiBHDQo+ID4+ID4+IFMNCj4gPj4gPj4gNi4xNS4wLXJjNy1uZXh0LTIwMjUwNTI2LW5leHQt
MjAyNTA1MjYtZzNiZTFhN2EzMWZiZCsgIzENCj4gPj4gPj4gUFJFRU1QVCh2b2x1bnRhcnkpDQo+
ID4+ID4+IDw0PlsgICAgNS40MDA5MDddIFRhaW50ZWQ6IFtTXT1DUFVfT1VUX09GX1NQRUMNCj4g
Pj4gPj4gPDQ+WyAgICA1LjQwMDkwOF0gSGFyZHdhcmUgbmFtZTogQVNVUyBTeXN0ZW0gUHJvZHVj
dCBOYW1lL1BSSU1FDQo+ID4+IFo3OTAtUA0KPiA+PiA+PiBXSUZJLCBCSU9TIDA4MTIgMDIvMjQv
MjAyMw0KPiA+PiA+PiA8ND5bICAgIDUuNDAwOTA5XSBSSVA6IDAwMTA6X19saXN0X2FkZF92YWxp
ZF9vcl9yZXBvcnQrMHhkYy8weGYwDQo+ID4+ID4+IDw0PlsgICAgNS40MDA5MTJdIENvZGU6IDE2
IDQ4IDg5IGYxIDRjIDg5IGU2IGU4IGEyIGM1IDVmIGZmIDBmIDBiIDMxIGMwDQo+ID4+ID4+IGU5
IDcyIGZmIGZmIGZmIDQ4IDg5IGYyIDRjIDg5IGUxIDQ4IDg5IGZlIDQ4IGM3IGM3IDY4IGJhIDBm
IDgzIGU4DQo+ID4+ID4+IDg0DQo+ID4+ID4+IGM1IDVmIGZmIDwwZj4gMGIgMzEgYzAgZTkgNTQg
ZmYgZmYgZmYgNjYgNjYgMmUgMGYgMWYgODQgMDAgMDAgMDANCj4gPj4gPj4gMDANCj4gPj4gPj4g
MDAgOTANCj4gPj4gPj4gOTANCj4gPj4gPj4gPDQ+WyAgICA1LjQwMDkxNF0gUlNQOiAwMDE4OmZm
ZmZjOTAwMDI3NjM1ODggRUZMQUdTOiAwMDAxMDI0Ng0KPiA+PiA+PiA8ND5bICAgIDUuNDAwOTE2
XSBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmZmZmZmEwN2MwY2EwIFJDWDoNCj4gPj4g
Pj4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+PiA+PiA8ND5bICAgIDUuNDAwOTE4XSBSRFg6IDAwMDAw
MDAwMDAwMDAwMDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFJESToNCj4gPj4gPj4gMDAwMDAw
MDAwMDAwMDAwMA0KPiA+PiA+PiA8ND5bICAgIDUuNDAwOTE5XSBSQlA6IGZmZmZjOTAwMDI3NjM1
OTggUjA4OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFIwOToNCj4gPj4gPj4gMDAwMDAwMDAwMDAwMDAw
MA0KPiA+PiA+PiA8ND5bICAgIDUuNDAwOTIwXSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiAw
MDAwMDAwMDAwMDAwMDAwDQo+IFIxMjoNCj4gPj4gPj4gZmZmZmZmZmZhMDdjMGNhMA0KPiA+PiA+
PiA8ND5bICAgIDUuNDAwOTIxXSBSMTM6IGZmZmZmZmZmYTA3YzBjYTAgUjE0OiAwMDAwMDAwMDAw
MDAwMDAwIFIxNToNCj4gPj4gPj4gZmZmZjg4ODEyMTJkNmRhMA0KPiA+PiA+PiA8ND5bICAgIDUu
NDAwOTIzXSBGUzogIDAwMDA3Nzg2MzdiNDE4YzAoMDAwMCkNCj4gR1M6ZmZmZjg4ODhkYWQwYzAw
MCgwMDAwKQ0KPiA+PiA+PiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+ID4+ID4+IDw0PlsgICAg
NS40MDA5MjZdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6DQo+IDAwMDAwMDAwODAw
NTAwMzMNCj4gPj4gPj4gPDQ+WyAgICA1LjQwMDkyOF0gQ1IyOiAwMDAwNzc4NjM3M2I4MGIyIENS
MzogMDAwMDAwMDExNmZhYTAwMA0KPiBDUjQ6DQo+ID4+ID4+IDAwMDAwMDAwMDBmNTBlZjANCj4g
Pj4gPj4gPDQ+WyAgICA1LjQwMDkzMV0gUEtSVTogNTU1NTU1NTQNCj4gPj4gPj4gPDQ+WyAgICA1
LjQwMDkzM10gQ2FsbCBUcmFjZToNCj4gPj4gPj4gPDQ+WyAgICA1LjQwMDkzNV0gIDxUQVNLPg0K
PiA+PiA+PiA8ND5bICAgIDUuNDAwOTM3XSAgPyBsb2NrX3N5c3RlbV9zbGVlcCsweDJiLzB4NDAN
Cj4gPj4gPj4gPDQ+WyAgICA1LjQwMDk0Ml0gIGFjcGlfcmVnaXN0ZXJfbHBzMF9kZXYrMHg1OC8w
eGIwDQo+ID4+ID4+IDw0PlsgICAgNS40MDA5NDldICBhc3VzX3dtaV9wcm9iZSsweDdmLzB4MTkz
MCBbYXN1c193bWldDQo+ID4+ID4+IDw0PlsgICAgNS40MDA5NTZdICA/IGtlcm5mc19jcmVhdGVf
bGluaysweDY5LzB4ZTANCj4gPj4gPj4gYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgDQo+ID4+ID4+IGBgYA0KPiA+PiA+PiBg
YGBgYGBgYGBgYGANCj4gPj4gPj4gRGV0YWlsZWQgbG9nIGNhbiBiZSBmb3VuZCBpbiBbM10uDQo+
ID4+ID4+DQo+ID4+ID4+IEFmdGVyIGJpc2VjdGluZyB0aGUgdHJlZSwgdGhlIGZvbGxvd2luZyBw
YXRjaCBbNF0gc2VlbXMgdG8gYmUgdGhlIGZpcnN0DQo+ICJiYWQiDQo+ID4+ID4+IGNvbW1pdA0K
PiA+PiA+Pg0KPiA+PiA+PiBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGANCj4gPj4gPj4gYGBgIGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+PiA+PiBjb21taXQgZmVlYTdiZDZiMDJkNDNhNzk0ZTNm
MDY1NjUwZDg5Y2Y4ZDhlOGU1OQ0KPiA+PiA+PiBBdXRob3I6IEx1a2UgRC4gSm9uZXMgbWFpbHRv
Omx1a2VAbGpvbmVzLmRldg0KPiA+PiA+PiBEYXRlOsKgwqAgU3VuIE1hciAyMyAxNTozNDoyMSAy
MDI1ICsxMzAwDQo+ID4+ID4+DQo+ID4+ID4+IMKgwqDCoCBwbGF0Zm9ybS94ODY6IGFzdXMtd21p
OiBSZWZhY3RvciBBbGx5IHN1c3BlbmQvcmVzdW1lDQo+ID4+ID4+IGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+PiA+
PiBgYGAgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgDQo+ID4+ID4+DQo+ID4+
ID4+IFdlIGNvdWxkIG5vdCByZXZlcnQgdGhlIHBhdGNoIGJlY2F1c2Ugb2YgbWVyZ2UgY29uZmxp
Y3QgYnV0DQo+ID4+ID4+IHJlc2V0dGluZyB0byB0aGUgcGFyZW50IG9mIHRoZSBjb21taXQgc2Vl
bXMgdG8gZml4IHRoZSBpc3N1ZQ0KPiA+PiA+Pg0KPiA+PiA+PiBDb3VsZCB5b3UgcGxlYXNlIGNo
ZWNrIHdoeSB0aGUgcGF0Y2ggY2F1c2VzIHRoaXMgcmVncmVzc2lvbiBhbmQNCj4gPj4gPj4gcHJv
dmlkZSBhIGZpeCBpZiBuZWNlc3Nhcnk/DQo+ID4+ID4+DQo+ID4+ID4+IFRoYW5rIHlvdS4NCj4g
Pj4gPj4NCj4gPj4gPj4gUmVnYXJkcw0KPiA+PiA+Pg0KPiA+PiA+PiBDaGFpdGFueWENCj4gPj4g
Pj4NCj4gPj4gPj4gWzFdIGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2xpbnV4LW5l
eHQvY29tYmluZWQtYWx0Lmh0bWw/DQo+ID4+ID4+IFsyXQ0KPiA+PiA+PiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LW5leHQuZ2kNCj4g
Pj4gPj4gdC9jDQo+ID4+ID4+IG9tbWl0Lz9oPW5leHQtMjAyNTA1MDkNCj4gPj4gPj4gWzNdDQo+
ID4+ID4+IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2xpbnV4LW5leHQvbmV4dC0y
MDI1MDUyNi9iYXQtcnBscw0KPiA+PiA+PiAtNC8NCj4gPj4gPj4gYm9vdDAudHh0DQo+ID4+ID4+
IFs0XQ0KPiA+PiA+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9uZXh0L2xpbnV4LW5leHQuZ2kNCj4gPj4gPj4gdC9jDQo+ID4+ID4+IG9tbWl0Lz9oPW5l
eHQtDQo+ID4+IDIwMjUwNTA5JmlkPWZlZWE3YmQ2YjAyZDQzYTc5NGUzZjA2NTY1MGQ4OWNmOGQ4
ZThlNTkNCj4gPj4NCj4gPj4NCj4gPj4gLS0NCj4gPj4gIH4gS3VydA0K

