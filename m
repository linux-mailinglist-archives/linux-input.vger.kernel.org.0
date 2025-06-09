Return-Path: <linux-input+bounces-12738-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C9DAD1C3A
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 13:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704593A2568
	for <lists+linux-input@lfdr.de>; Mon,  9 Jun 2025 11:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6119253346;
	Mon,  9 Jun 2025 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iyRTR/hm"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9C1E0DCB;
	Mon,  9 Jun 2025 11:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749467206; cv=fail; b=lB6f8cJWXcBr66N1ptBHU7a/JPwe1pu1qc23Ngxb5+fB5OK4F+beGprMjBp2n6QeJCEHP6FloJduKuq2zBv2xQ5qRVPiOIp/w2Hv8FuEetC6m5q5R/oYQwz0YvLXHeG/wk6wKIsKwtoGrS8iQXkaONsg4b5qn5K/eF5HCAeoYj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749467206; c=relaxed/simple;
	bh=JUYTMS3ASyweI8DJebmZSyJBDI/VBhfDmAIHIsNk0Mg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f3+V70VDIvoCtzILEfM+SRbivKa68HwdsJD97u9pGVY0BvocVlcoCe6f6ewSeqccUlgVvbytevV4ZmHbrt0no8miC0gkQo9FGKohlNqmMrOowf3wuOSZwKVtrqT+ZDpbhR6FQ88Lp47hnJdVmQwRowR19eCNp+O2GtS/2WaUz4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iyRTR/hm; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749467205; x=1781003205;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JUYTMS3ASyweI8DJebmZSyJBDI/VBhfDmAIHIsNk0Mg=;
  b=iyRTR/hm5/4cfQemZF78S0srharQewn8DDZityXd1z9ZobrOpLIvzTVm
   uug31ER0KhxC6piE2LIcRma1F4uvpNBEswq/AIn88aPb29ZAGMNEF7nQa
   phIik2jy6VJfu2NT7L1SkmtjqB343pn8TeuDgWLsmlonytQqh1YnMVWqt
   GwZsEFMlbu663A6r0bkL1H6JGBNbHf8o8sCb+79j86zKUufurvYFc8KCX
   zGQuyPxbrNR3S7Gw8HrFmL8QZS5z2IKREWplZHWb9tK0KAUEzwI8bJqKu
   akSsAhtgUG8LQvrlqag8xaNd5nLKyEihbaaWGcYnHEbIOqUvF+KIav8RO
   w==;
X-CSE-ConnectionGUID: GxdJiWzdQ+Gj43DG6Xs1Zg==
X-CSE-MsgGUID: sJDNIgyfT6C4JyIi4HcPKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="62193078"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="62193078"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 04:06:44 -0700
X-CSE-ConnectionGUID: B2AVCwb6Soe/b0AN3s30rQ==
X-CSE-MsgGUID: qz+SStE6Q5OMvItYJYVCFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146417142"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 04:06:43 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 04:06:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 04:06:43 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 04:06:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siblbWddFdN95lE1GWTRgXD+7YgBTTITd7YM/zDcbgz6XYpXCM5HXd6I/YI9EjSXmj99xt7VnPNxU7EhHtS1P1HhgtlbasOgqg8Iia2/HiFv8z+lcGJa4dzK179LmU8RzKAOB320kDM9DVB6e1GjBVxtFax/FlQXZ0dsfRtzSnGpuY+/lV+cBmqE46iy1CzCIh/KyYiI1TZcwCOmeBSzdK7Vp80IW546XBYu808eS8N4y+/+eGKxdSiKPynazgHYbra5aQCqA00p2IeCkuxa+5Y2Ebk44gwMoG11NXh7hInphm1zISGKbi8PanRZKEUxgv/igZCOVH+Kl8UwoEIpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JUYTMS3ASyweI8DJebmZSyJBDI/VBhfDmAIHIsNk0Mg=;
 b=ZbarSE0xrBW24AAw7pH7Gk070/aNtuAK8cecOw1HkqbDDmAcdQaeL/JSDDxJiPqT53EHVjgLL9cSvbVTyVOnJwZC4Yo3qr6gZDyjUp7WkOZaTO/vq4M3hJsIbMQsVq6RZpsO19AqFBOIwAerAx/++geHkH7W0LGeTrf75L1EfwVJWFDwgalr+YB0At8ybFjLmgKg24ajp4bQBtC1SPvThTRMS+0gHlLc5ZywOeJM0NeBILb9QEUrq5IpT/f+5Y0ZhtlDFXaRYxSDGzoB4TZxlH4fok32FgEh47nXT82u4SIbhX0fUo0pOa75g1e8lnrGeKyngBWuT7QmKS46iOWQbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ5PPF4DC104A0B.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::827) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 11:06:40 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 11:06:40 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Kurt Borja <kuurtb@gmail.com>, Luke Jones <luke@ljones.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [REGRESSION] on linux-next (next-20250509)
Thread-Topic: [REGRESSION] on linux-next (next-20250509)
Thread-Index: AQHb2S6TBGDe1BxI30+ntJ8ysXhq+Q==
Date: Mon, 9 Jun 2025 11:06:39 +0000
Message-ID: <SJ1PR11MB612904F9F3109473838EE36BB96BA@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
 <DA7WOJH0HZDH.36EH3U8BQJ0JF@gmail.com>
In-Reply-To: <DA7WOJH0HZDH.36EH3U8BQJ0JF@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|SJ5PPF4DC104A0B:EE_
x-ms-office365-filtering-correlation-id: 2f560645-158d-4b71-0b66-08dda745b5b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VTg5QmZMejJuY2sxaHlWYzhpMS82ZlN4dTI5TUtRNmNzMTRGTkZyZFdBWjRZ?=
 =?utf-8?B?MjFpeHlScDliUWc5a3FpZ1NLbUd5aml3RlJCekt6bFNaQUxpYVI2aTRJdnhW?=
 =?utf-8?B?eGEvNzFteEJPeWx5OS80RE9WMmdHeGVLY3hMUEYrRHZzbnpxVGJUdTc3eGp1?=
 =?utf-8?B?UXJ0R29qeG5wTDEvUHJ4UTMvNGdiWk9ic0l5RURUcVpOVkRES2pydzg3c2dl?=
 =?utf-8?B?dEJKN0t5RGJVRGtmcFdydldIaEpsZTlhanFpNGZoSGZpVnJ5WXQ4MEdJdHlS?=
 =?utf-8?B?UjRmNnlLbEtCN1lmUWl5elpqOERMMmQ0K2RPOWZISVdrSUxOQ1RCTmpHNWRk?=
 =?utf-8?B?K0l0YnhkelV4UTFwRWtHdjZVYm4zcnBFbmU4b0pQamtNbVJDdm5SVUh1U295?=
 =?utf-8?B?empRWWdGd05idW5zaDlScGE4SEdhbUJVUDVrNmx4R3kvMkczMWR6WldCeVNB?=
 =?utf-8?B?WlArbit1TXVsaE5vTFdPZ1BER1UzOExDbFhmamdJRlNWZ2xrQk1WUzNUZUdn?=
 =?utf-8?B?bTN1WGczUUpQLzJhQ0ZCQmJUZ2U0MythT0pSRUtWTitDdlB0d3FpU2xzMFh3?=
 =?utf-8?B?RnRmem54bVBOZEFkMTJoYkRsWDE5RDNOMzZjbHl0OGJER0RYUjJkeFVLVXhx?=
 =?utf-8?B?ODhvb2pSblJ1cHVUZkh2TUhkblpvdVJCR29acFpiRlJqd2pjSndOSTRwTFhY?=
 =?utf-8?B?TVRBSkFhOUhpSGhIYlh4ekZEbC9ZZlRnT0hHdHIxWVljcVF4VWVNcEhIV0tq?=
 =?utf-8?B?bkZwNEwxREdUclM3d0IvWFEzc1FnOSt0TEs0dWIzTDZLcGN1MzRiY1pBc0lx?=
 =?utf-8?B?aTNXNXdtZ2NCVklpclJxVmhjMk1ZOWt2TTBNTWs0UERoOHBta2xqaGN5U3h5?=
 =?utf-8?B?SEVBeCtsOFp0WnZGRE51b1Y2aVgyQTFOVG4vNk9TbVdCQzZmeitrMGVtTjdL?=
 =?utf-8?B?Zm04OWl0aGVZU2hWd0NYa1dZZjUwMnZzQURIT3A3eXRPOGtoUFhCNXovb08r?=
 =?utf-8?B?SDliaUNhakFBUE1TbTdUdVhIcE1mMisxQk5iK2JCR3BlcjYvVkdwaHROVVRR?=
 =?utf-8?B?WXkwRjdvL0tkY0VwRVJmcVhYVFIydzZ6UkNYMzZvVGxERlQzUmx6QTgxWnp1?=
 =?utf-8?B?aDk5R2dDTmsrdXNmN2pVODlhWjFnSG0vQ0NrWlVYU1hQVlBFL2IyYVRJa2NU?=
 =?utf-8?B?NkRQZWV2Ym9oVmdPdktQVjN6c3NwSnFqcVF3TnVaUm5KaGxZR21HVkJFMG5S?=
 =?utf-8?B?R0FXRDdJcTRiME1udzF3dFVsR3YxNjRzL3FTZjExb2N0YVB0YmFYcWxkQkFR?=
 =?utf-8?B?M1BBNlV3Q0p4U1JPeUZyNFRCU3ZCZm04SnFJMk56L0xBYW5ZUzVKYkRwM3Bz?=
 =?utf-8?B?dGhNbU1rNnlEakJqbGpEWllnRTlOWnl6V3QrYWxUSXBGL3FWckNEWXJNc1pK?=
 =?utf-8?B?VFA0RWNtTGtCbnRLTWJKVWlRY0ZoZER0UkhSSzBQaVRSNFVOWTF6UU5sU0xs?=
 =?utf-8?B?QzRQb3Z5alRmNG5xZWZQbTlmWFlyR29JWGRuM1MydC9hSlNiZXljVlM5d0xP?=
 =?utf-8?B?c1hNcmpwSW1vaG5IbmZlaENZd25qV2JFOG1FODRMN3VXbXBWZ3NVbE1Za3o3?=
 =?utf-8?B?OEhxWWp6K294b1pVSnlZbkVjYVR5czR4UGMzTkJwa0JYWHFPWEU4NXlVRmtJ?=
 =?utf-8?B?Q3lrM09SbkoycERuRFpxM1ZWWk9QZWdFUW5RTTB4b1NLNlBJQW9LUVpKblJu?=
 =?utf-8?B?K094SkdMNW9NT3djS2hUL0dFcGtadkZHRGFQSjZCMzBqL3pMVkNPQ21rNUJO?=
 =?utf-8?B?bWhTcWJlRmdheWlQeFdYZUNBMFpvWm0yM3J0SEpwcDM2NHY1SnlkbWRQYUpu?=
 =?utf-8?B?ZzUrZGV5YXJNa0h1OWpQbnNEVjNMUmdsbjBDWS95bGZUeGl5Z2ozSzZBblpX?=
 =?utf-8?Q?iEsXMqymtoo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWpxQk9iT3JNbVVuT2drRmR5M2Fad291a2dWMEFZMlRYMVFvQ1BWNHl6c0o3?=
 =?utf-8?B?RlYvTE1ETmFjallZaGsxbW9EaU9mV3orMEU0UHlKZWQvTSs3WndpMWhOVVVw?=
 =?utf-8?B?U2dmeXdRZDc1Z29qZ3JhMWVEZW05cHFWeUlWQXZ5eVkvcGgzV0NBZnhDT2N1?=
 =?utf-8?B?TmhZMjAzTTkyY3A3MGJJbkM2NE90MXRpTWF4NEY4WXhPekFUbURIQVgvSTRL?=
 =?utf-8?B?UDc3VmhxMit6NVZlVmt5Qk5WNzJhYTNGYmoxamxhdFhkeVZicklJMUttQ01N?=
 =?utf-8?B?WExwRUNpRlVwVlR2VWJrektQNlBKdWR5NThodzcvTm52UklmNlpSbTlPOHRx?=
 =?utf-8?B?blA3RXVuSGF1aUN4NjUzZmhNeDBLdHhlL3Q5MGZJczB5SWRYUzFXTy9ldTMr?=
 =?utf-8?B?TDkrMXh4dGQ2cmJlSlBqS0lGZmliNHpLb0ZnWXo1aEdTai9TM0RLVU9pVkJY?=
 =?utf-8?B?NEN1WjdpUDlxM0JvaEVuZEtYVmxNcWVsVXFNNGIvWVg0VEFwUTZVcURkL1Ey?=
 =?utf-8?B?RUU5ZUR3UFY1U0k1UXlZNHFMZXE4YjUwQnd6OGNlT244bytzSXhScHBGVFh5?=
 =?utf-8?B?b3prQTlMaVFLZWZuekVvN0pUbEx0elVmYjJ2S3NUSmMxRkJmSTg0SlhmTWE4?=
 =?utf-8?B?RTR3WThUbUlHOXFTRFZmM2dkTlcyQVRXNnpHRUpwUWdicytQK2xNRjZCS1ZH?=
 =?utf-8?B?ZTgyUkpUb2QrdXovZ05hSS85Zys0ZDhZWWhISHprV0VnR3BqdEhUUzQyYjBL?=
 =?utf-8?B?NUMwa2Ywa1ZjMlp6Tkhad3VsKzlpNTlpZDN3di9MOWFzc3V2RndwcXBzUXFj?=
 =?utf-8?B?R1gxZCtYenBmSWFtdCtHZjJPUXFhZUhJRnJoQmtyVnRYTkhWT093ZXJJYTZo?=
 =?utf-8?B?bGV6RFQ5SkU1QkM3cTRXQWVKUTRtNVZPL0ZIWDdBanc1K3lYUVhrQ2JTSE1U?=
 =?utf-8?B?MjJGdTA1SVo1WjZPYWhJM3RTSDJUcGpPZk4yaWt0eEIydCt0MVZ0VklxMU5X?=
 =?utf-8?B?R2twYzF2cVRJVjNmeXRBNUZNZXNBWWszTldOU0VYbkhNU2UzcGdEZDJUNlhL?=
 =?utf-8?B?dmN6eGN6SWk1L1I2MmVrWWIranQrSi81S1BRdW1Dekt5anMyRjNvNlhCVzd0?=
 =?utf-8?B?dnQraERCdHJIY01pckQxVDFlWnBJRWtmUUh0SzN6NFIvWVdpOEp1RHRJR2FX?=
 =?utf-8?B?djJlNWNkNlIvV1lDenh6WE9MVFl4RVNMUEhaVURxTHFZQ0ptMWgvK3dvbndW?=
 =?utf-8?B?UWtySCtrTHRoUXczU2VFRlNDbEU0SEF3WURjdEhvcWtBVEdKVEZBbEVFOGd0?=
 =?utf-8?B?Tkc0Rm9iL1VvbHdySFJNeXFOQ3Vob3BXazlJUnBtOEc4SFNaNXMzc1BIMnJr?=
 =?utf-8?B?aTZzZElBOTE2dklJVEYvY3pqTFZUZW9IemwzU2Vjc0dOMzlYVCtBZWRDMzJ3?=
 =?utf-8?B?RFRmQ2MvSTBJZE1QNHpERmRFMFFSdzNVc2I3VGtFK2N6VkhyLzRMVG1rN2ly?=
 =?utf-8?B?TElhaXozSTRvbUs1NHRhTm1EWCtvZVMyZnozVTYvN09RUU5JWUJLZk9sVDVp?=
 =?utf-8?B?a0dKUFFxUHMxa1FGSGorYWp6dnYwYkY5YUhmK05ZUjBHUDVHT1JDZG9xVVBS?=
 =?utf-8?B?K1I3L1hPbk1PZHV5R3hQcHVrYU9TQld1YUlhT3lBUG5BckQzbXl4dnZVQ283?=
 =?utf-8?B?YWp1a0htUnNsV0lpRDJYTDhLaGJYTHd5dXJqZGlWYWZ0Y3dwd1dUb1I0ZFpi?=
 =?utf-8?B?bW5PbE51U0RIci9xKzByZkRiQ2FBQ3ZDaW1EY0hROWlUZjQ4OEE5ZjlwcUlx?=
 =?utf-8?B?MnlPYitWTmVUNjVWTjFFUHZDeDdQYUs5UTVnS0NadVZEaTA4TDQzVjdkcDcw?=
 =?utf-8?B?azIxSnV6MVY3cFRJVGF4N0RxK0p6blZiWkIwc2RIME9iRnlPQ2FDN1lqd1Fh?=
 =?utf-8?B?a0ZTN3d3TTZoSUkrWlp5b3gwTU5JK2lEc3ozWnM1WUtBdzFPSVBUU3dodElp?=
 =?utf-8?B?c25FOExRdkVXT05adkduNGlsakFrNmp1cE94alBmeFFJSVlmeERUVkMrVzRX?=
 =?utf-8?B?MGc1VEEzYkhhTzhJQTd4SHk3ZStyYjlsaWFhMFU3TlZ6OTdOdUZ3Q3lMeHQw?=
 =?utf-8?B?SEg1S254WEdNOHE1RHljY3BhdEIvVmEvY0xBaFY1aXB3TEkrYjBNSkJ3TkZR?=
 =?utf-8?B?T3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f560645-158d-4b71-0b66-08dda745b5b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 11:06:39.9553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x7z7f8hkNWIKDxsCy5bdjDu8PCxVukdzrO15TeLLLglhneBNeXuqgjZZl/59I5p5B4uj26qd/4SLAP6RKppaKjt/w/nJu9kCeMacxFfXK0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4DC104A0B
X-OriginatorOrg: intel.com

SGkgTHVrZSwNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEt1cnQg
Qm9yamEgPGt1dXJ0YkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgTWF5IDI4LCAyMDI1
IDk6MTEgUE0NCj4gVG86IEx1a2UgSm9uZXMgPGx1a2VAbGpvbmVzLmRldj47IEJvcmFoLCBDaGFp
dGFueWEgS3VtYXINCj4gPGNoYWl0YW55YS5rdW1hci5ib3JhaEBpbnRlbC5jb20+DQo+IENjOiBp
bnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmc7IFNhYXJpbmVuLA0KPiBKYW5pIDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT47IEt1cm1p
LCBTdXJlc2ggS3VtYXINCj4gPHN1cmVzaC5rdW1hci5rdXJtaUBpbnRlbC5jb20+OyBEZSBNYXJj
aGksIEx1Y2FzDQo+IDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+OyBOaWt1bGEsIEphbmkgPGph
bmkubmlrdWxhQGludGVsLmNvbT47IGxpbnV4LQ0KPiBpbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IHBs
YXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUkVHUkVT
U1NJT05dIG9uIGxpbnV4LW5leHQgKG5leHQtMjAyNTA1MDkpDQo+IA0KPiBIaSBMdWtlLA0KPiAN
Cj4gT24gV2VkIE1heSAyOCwgMjAyNSBhdCAxMDowNyBBTSAtMDMsIEx1a2UgSm9uZXMgd3JvdGU6
DQo+ID4gT24gV2VkLCAyOCBNYXkgMjAyNSwgYXQgMTI6MDggUE0sIEJvcmFoLCBDaGFpdGFueWEg
S3VtYXIgd3JvdGU6DQo+ID4+IEhlbGxvIEx1a2UsDQo+ID4+DQo+ID4+IEhvcGUgeW91IGFyZSBk
b2luZyB3ZWxsLiBJIGFtIENoYWl0YW55YSBmcm9tIHRoZSBsaW51eCBncmFwaGljcyB0ZWFtIGlu
DQo+IEludGVsLg0KPiA+Pg0KPiA+PiBUaGlzIG1haWwgaXMgcmVnYXJkaW5nIGEgcmVncmVzc2lv
biB3ZSBhcmUgc2VlaW5nIGluIG91ciBDSSBydW5zWzFdDQo+ID4+IG9uIGxpbnV4LW5leHQgcmVw
b3NpdG9yeS4NCj4gPg0KPiA+IENhbiB5b3UgdGVsbCBtZSBpZiB0aGUgZml4IGhlcmUgd2FzIGlu
Y2x1ZGVkPw0KPiA+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDI1LzUvMjQvMTUyDQo+ID4NCj4g
PiBJIGNvdWxkIGNoYW5nZSB0bzoNCj4gPiBzdGF0aWMgdm9pZCBhc3VzX3MyaWRsZV9jaGVja19y
ZWdpc3Rlcih2b2lkKSB7DQo+ID4gICAgIC8vIE9ubHkgcmVnaXN0ZXIgZm9yIEFsbHkgZGV2aWNl
cw0KPiA+ICAgICBpZiAoZG1pX2NoZWNrX3N5c3RlbShhc3VzX3JvZ19hbGx5X2RldmljZSkpIHsN
Cj4gPiAgICAgICAgIGlmIChhY3BpX3JlZ2lzdGVyX2xwczBfZGV2KCZhc3VzX2FsbHlfczJpZGxl
X2Rldl9vcHMpKQ0KPiA+ICAgICAgICAgICAgIHByX3dhcm4oImZhaWxlZCB0byByZWdpc3RlciBM
UFMwIHNsZWVwIGhhbmRsZXIgaW4gYXN1cy13bWlcbiIpOw0KPiA+ICAgICB9DQo+ID4gfQ0KPiA+
DQo+ID4gYnV0IEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgd2hhdCBpcyBoYXBwZW5pbmcgaGVy
ZS4gVGhlIGlubmVyIGxwczANCj4gZnVuY3Rpb25zIHdvbid0IHJ1biB1bmxlc3MgdXNlX2FsbHlf
bWN1X2hhY2sgaXMgc2V0Lg0KPiANCj4gVGhlIFJJUCBpcyBjYXVzZWQgYnkgYSAibGlzdF9hZGQg
ZG91YmxlIGFkZCIgd2FybmluZy4NCj4gDQo+IEFmdGVyIHJlYWRpbmcgdGhlIGxvZywgSSBiZWxp
ZXZlIHRoaXMgaXMgaGFwcGVuaW5nIGJlY2F1c2UNCj4gYXN1c193bWlfcmVnaXN0ZXJfZHJpdmVy
KCkgaXMgY2FsbGVkIGEgc2Vjb25kIHRpbWUgYnkgZWVlcGNfd21pIGFmdGVyDQo+IGFzdXNfbmJf
d21pLCB3aGljaCBpbXBsaWVzDQo+IA0KPiAJYXN1c193bWlfcHJvYmUoKQ0KPiAJICAtPiBhY3Bp
X3JlZ2lzdGVyX2xwczBfZGV2KCZhc3VzX2FsbHlfczJpZGxlX2Rldl9vcHMpDQo+IA0KPiBpcyBj
YWxsZWQgdHdpY2UgYW5kIHRoZSB3YXJuaW5nIGlzIHRyaWdnZXJlZC4NCj4gDQo+IExpbmUgWzFd
IG1ha2VzIG1lIHRoaW5rIHRoaXMgY291bGQgYmUgYSByYWNlIGNvbmRpdGlvbiwgYXMNCj4gYXN1
c193bWlfcmVnaXN0ZXJfZHJpdmVyKCkgbWF5IGJlIGNhbGxlZCBjb25jdXJyZW50bHkuDQo+IA0K
PiBbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcGR4
ODYvcGxhdGZvcm0tZHJpdmVycy0NCj4geDg2LmdpdC90cmVlL2RyaXZlcnMvcGxhdGZvcm0veDg2
L2FzdXMtd21pLmM/aD1mb3ItbmV4dCNuNTEwMQ0KPiANCg0KQW55IHVwZGF0ZSBvbiB0aGlzPyBJ
dCBoYXMgbm93IGhpdCAgNi4xNi1yYzENCg0KaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9pZ3RAcnVubmVyQGFib3J0ZWQuaHRtbA0KDQpSZWdhcmRzDQoNCkNoYWl0YW55
YQ0KDQo+ID4NCj4gPiBJIHdpbGwgZG8gbXkgYmVzdCB0byBmaXggYnV0IEkgbmVlZCB0byB1bmRl
cnN0YW5kIHdoYXQgaGFwcGVuZWQgYSBiaXQgYmV0dGVyLg0KPiA+DQo+ID4gcmVnYXJkcywNCj4g
PiBMdWtlLg0KPiA+DQo+ID4+IFNpbmNlIHRoZSB2ZXJzaW9uIG5leHQtMjAyNTA1MDkgWzJdLCB3
ZSBhcmUgc2VlaW5nIHRoZSBmb2xsb3dpbmcNCj4gPj4gcmVncmVzc2lvbg0KPiA+Pg0KPiA+PiBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGANCj4gPj4gPDQ+WyAgICA1LjQwMDgyNl0gLS0tLS0tLS0t
LS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+ID4+IDw0PlsgICAgNS40MDA4MzJdIGxpc3Rf
YWRkIGRvdWJsZSBhZGQ6IG5ldz1mZmZmZmZmZmEwN2MwY2EwLA0KPiA+PiBwcmV2PWZmZmZmZmZm
ODM3ZTlhNjAsIG5leHQ9ZmZmZmZmZmZhMDdjMGNhMC4NCj4gPj4gPDQ+WyAgICA1LjQwMDg0NV0g
V0FSTklORzogQ1BVOiAwIFBJRDogMzc5IGF0IGxpYi9saXN0X2RlYnVnLmM6MzUNCj4gPj4gX19s
aXN0X2FkZF92YWxpZF9vcl9yZXBvcnQrMHhkYy8weGYwDQo+ID4+IDw0PlsgICAgNS40MDA4NTBd
IE1vZHVsZXMgbGlua2VkIGluOiBjbWRsaW5lcGFydCgrKSBlZWVwY193bWkoKykNCj4gPj4gYXN1
c19uYl93bWkoKykgYXN1c193bWkgc3BpX25vcigrKSBzcGFyc2Vfa2V5bWFwIG1laV9weHAgbXRk
DQo+ID4+IHBsYXRmb3JtX3Byb2ZpbGUga3ZtX2ludGVsKCspIG1laV9oZGNwIHdtaV9ibW9mIGt2
bSBpcnFieXBhc3MNCj4gPj4gcG9seXZhbF9jbG11bG5pIHVzYmhpZCBnaGFzaF9jbG11bG5pX2lu
dGVsIHNuZF9oZGFfaW50ZWwgaGlkDQo+ID4+IHNoYTFfc3NzZTMNCj4gPj4gcjgxNTIoKykgYmlu
Zm10X21pc2MgYWVzbmlfaW50ZWwgc25kX2ludGVsX2RzcGNmZyBtaWkgcjgxNjkNCj4gPj4gc25k
X2hkYV9jb2RlYyByYXBsIHZpZGVvIHNuZF9oZGFfY29yZSBpbnRlbF9jc3RhdGUgc25kX2h3ZGVw
IHJlYWx0ZWsNCj4gPj4gc25kX3BjbSBzbmRfdGltZXIgbWVpX21lIHNuZCBpMmNfaTgwMSBpMmNf
bXV4IHNwaV9pbnRlbF9wY2kgaWRtYTY0DQo+ID4+IHNvdW5kY29yZSBzcGlfaW50ZWwgaTJjX3Nt
YnVzIG1laSBpbnRlbF9wbWNfY29yZSBubHNfaXNvODg1OV8xDQo+ID4+IHBtdF90ZWxlbWV0cnkg
cG10X2NsYXNzIGludGVsX3BtY19zc3JhbV90ZWxlbWV0cnkgcGluY3RybF9hbGRlcmxha2UNCj4g
Pj4gaW50ZWxfdnNlYyBhY3BpX3RhZCB3bWkgYWNwaV9wYWQgZG1fbXVsdGlwYXRoIG1zciBudm1l
X2ZhYnJpY3MgZnVzZQ0KPiA+PiBlZmlfcHN0b3JlIG5mbmV0bGluayBpcF90YWJsZXMgeF90YWJs
ZXMgYXV0b2ZzNA0KPiA+PiA8ND5bICAgIDUuNDAwOTA0XSBDUFU6IDAgVUlEOiAwIFBJRDogMzc5
IENvbW06ICh1ZGV2LXdvcmtlcikgVGFpbnRlZDogRw0KPiA+PiBTDQo+ID4+IDYuMTUuMC1yYzct
bmV4dC0yMDI1MDUyNi1uZXh0LTIwMjUwNTI2LWczYmUxYTdhMzFmYmQrICMxDQo+ID4+IFBSRUVN
UFQodm9sdW50YXJ5KQ0KPiA+PiA8ND5bICAgIDUuNDAwOTA3XSBUYWludGVkOiBbU109Q1BVX09V
VF9PRl9TUEVDDQo+ID4+IDw0PlsgICAgNS40MDA5MDhdIEhhcmR3YXJlIG5hbWU6IEFTVVMgU3lz
dGVtIFByb2R1Y3QgTmFtZS9QUklNRQ0KPiBaNzkwLVANCj4gPj4gV0lGSSwgQklPUyAwODEyIDAy
LzI0LzIwMjMNCj4gPj4gPDQ+WyAgICA1LjQwMDkwOV0gUklQOiAwMDEwOl9fbGlzdF9hZGRfdmFs
aWRfb3JfcmVwb3J0KzB4ZGMvMHhmMA0KPiA+PiA8ND5bICAgIDUuNDAwOTEyXSBDb2RlOiAxNiA0
OCA4OSBmMSA0YyA4OSBlNiBlOCBhMiBjNSA1ZiBmZiAwZiAwYiAzMSBjMA0KPiA+PiBlOSA3MiBm
ZiBmZiBmZiA0OCA4OSBmMiA0YyA4OSBlMSA0OCA4OSBmZSA0OCBjNyBjNyA2OCBiYSAwZiA4MyBl
OCA4NA0KPiA+PiBjNSA1ZiBmZiA8MGY+IDBiIDMxIGMwIGU5IDU0IGZmIGZmIGZmIDY2IDY2IDJl
IDBmIDFmIDg0IDAwIDAwIDAwIDAwDQo+ID4+IDAwIDkwDQo+ID4+IDkwDQo+ID4+IDw0PlsgICAg
NS40MDA5MTRdIFJTUDogMDAxODpmZmZmYzkwMDAyNzYzNTg4IEVGTEFHUzogMDAwMTAyNDYNCj4g
Pj4gPDQ+WyAgICA1LjQwMDkxNl0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZmZmZmZh
MDdjMGNhMCBSQ1g6DQo+ID4+IDAwMDAwMDAwMDAwMDAwMDANCj4gPj4gPDQ+WyAgICA1LjQwMDkx
OF0gUkRYOiAwMDAwMDAwMDAwMDAwMDAwIFJTSTogMDAwMDAwMDAwMDAwMDAwMCBSREk6DQo+ID4+
IDAwMDAwMDAwMDAwMDAwMDANCj4gPj4gPDQ+WyAgICA1LjQwMDkxOV0gUkJQOiBmZmZmYzkwMDAy
NzYzNTk4IFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6DQo+ID4+IDAwMDAwMDAwMDAwMDAwMDAN
Cj4gPj4gPDQ+WyAgICA1LjQwMDkyMF0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAw
MDAwMDAwMDAwMCBSMTI6DQo+ID4+IGZmZmZmZmZmYTA3YzBjYTANCj4gPj4gPDQ+WyAgICA1LjQw
MDkyMV0gUjEzOiBmZmZmZmZmZmEwN2MwY2EwIFIxNDogMDAwMDAwMDAwMDAwMDAwMCBSMTU6DQo+
ID4+IGZmZmY4ODgxMjEyZDZkYTANCj4gPj4gPDQ+WyAgICA1LjQwMDkyM10gRlM6ICAwMDAwNzc4
NjM3YjQxOGMwKDAwMDApIEdTOmZmZmY4ODg4ZGFkMGMwMDAoMDAwMCkNCj4gPj4ga25sR1M6MDAw
MDAwMDAwMDAwMDAwMA0KPiA+PiA8ND5bICAgIDUuNDAwOTI2XSBDUzogIDAwMTAgRFM6IDAwMDAg
RVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+ID4+IDw0PlsgICAgNS40MDA5MjhdIENS
MjogMDAwMDc3ODYzNzNiODBiMiBDUjM6IDAwMDAwMDAxMTZmYWEwMDAgQ1I0Og0KPiA+PiAwMDAw
MDAwMDAwZjUwZWYwDQo+ID4+IDw0PlsgICAgNS40MDA5MzFdIFBLUlU6IDU1NTU1NTU0DQo+ID4+
IDw0PlsgICAgNS40MDA5MzNdIENhbGwgVHJhY2U6DQo+ID4+IDw0PlsgICAgNS40MDA5MzVdICA8
VEFTSz4NCj4gPj4gPDQ+WyAgICA1LjQwMDkzN10gID8gbG9ja19zeXN0ZW1fc2xlZXArMHgyYi8w
eDQwDQo+ID4+IDw0PlsgICAgNS40MDA5NDJdICBhY3BpX3JlZ2lzdGVyX2xwczBfZGV2KzB4NTgv
MHhiMA0KPiA+PiA8ND5bICAgIDUuNDAwOTQ5XSAgYXN1c193bWlfcHJvYmUrMHg3Zi8weDE5MzAg
W2FzdXNfd21pXQ0KPiA+PiA8ND5bICAgIDUuNDAwOTU2XSAgPyBrZXJuZnNfY3JlYXRlX2xpbmsr
MHg2OS8weGUwDQo+ID4+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+PiBgYGBgYGBgYGBgYGANCj4gPj4gRGV0
YWlsZWQgbG9nIGNhbiBiZSBmb3VuZCBpbiBbM10uDQo+ID4+DQo+ID4+IEFmdGVyIGJpc2VjdGlu
ZyB0aGUgdHJlZSwgdGhlIGZvbGxvd2luZyBwYXRjaCBbNF0gc2VlbXMgdG8gYmUgdGhlIGZpcnN0
ICJiYWQiDQo+ID4+IGNvbW1pdA0KPiA+Pg0KPiA+PiBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGANCj4gPj4gYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgDQo+ID4+IGNvbW1pdCBmZWVhN2JkNmIwMmQ0
M2E3OTRlM2YwNjU2NTBkODljZjhkOGU4ZTU5DQo+ID4+IEF1dGhvcjogTHVrZSBELiBKb25lcyBt
YWlsdG86bHVrZUBsam9uZXMuZGV2DQo+ID4+IERhdGU6wqDCoCBTdW4gTWFyIDIzIDE1OjM0OjIx
IDIwMjUgKzEzMDANCj4gPj4NCj4gPj4gwqDCoMKgIHBsYXRmb3JtL3g4NjogYXN1cy13bWk6IFJl
ZmFjdG9yIEFsbHkgc3VzcGVuZC9yZXN1bWUNCj4gPj4gYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgDQo+ID4+IGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+Pg0KPiA+PiBXZSBjb3VsZCBub3Qg
cmV2ZXJ0IHRoZSBwYXRjaCBiZWNhdXNlIG9mIG1lcmdlIGNvbmZsaWN0IGJ1dCByZXNldHRpbmcN
Cj4gPj4gdG8gdGhlIHBhcmVudCBvZiB0aGUgY29tbWl0IHNlZW1zIHRvIGZpeCB0aGUgaXNzdWUN
Cj4gPj4NCj4gPj4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB3aHkgdGhlIHBhdGNoIGNhdXNlcyB0
aGlzIHJlZ3Jlc3Npb24gYW5kDQo+ID4+IHByb3ZpZGUgYSBmaXggaWYgbmVjZXNzYXJ5Pw0KPiA+
Pg0KPiA+PiBUaGFuayB5b3UuDQo+ID4+DQo+ID4+IFJlZ2FyZHMNCj4gPj4NCj4gPj4gQ2hhaXRh
bnlhDQo+ID4+DQo+ID4+IFsxXSBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9saW51
eC1uZXh0L2NvbWJpbmVkLWFsdC5odG1sPw0KPiA+PiBbMl0NCj4gPj4gaHR0cHM6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51eC1uZXh0LmdpdC9jDQo+
ID4+IG9tbWl0Lz9oPW5leHQtMjAyNTA1MDkNCj4gPj4gWzNdDQo+ID4+IGh0dHBzOi8vaW50ZWwt
Z2Z4LWNpLjAxLm9yZy90cmVlL2xpbnV4LW5leHQvbmV4dC0yMDI1MDUyNi9iYXQtcnBscy00Lw0K
PiA+PiBib290MC50eHQNCj4gPj4gWzRdDQo+ID4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvYw0KPiA+PiBvbW1pdC8/
aD1uZXh0LQ0KPiAyMDI1MDUwOSZpZD1mZWVhN2JkNmIwMmQ0M2E3OTRlM2YwNjU2NTBkODljZjhk
OGU4ZTU5DQo+IA0KPiANCj4gLS0NCj4gIH4gS3VydA0KDQo=

