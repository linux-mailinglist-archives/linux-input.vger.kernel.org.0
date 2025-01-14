Return-Path: <linux-input+bounces-9215-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E0A0FD45
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 01:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B7343A6E33
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 00:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E065E1EF01;
	Tue, 14 Jan 2025 00:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2c60JON"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5BA29B0;
	Tue, 14 Jan 2025 00:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736813700; cv=fail; b=ObnrKuGjq/aqzxy18V4GwTdnZMrp8p7gAsswg5kd/h/Af7iPNCV2ECV9M88OhIxEqgZkeGijzn8bugDpIRxSRb9AMpVLegxJ/wdp33e5uwQauGwGDhqBq0GqnJDy6PYG2Kto12MJBzqj52xkU4PvYmzzopQ+x9//C/KNOX4rSAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736813700; c=relaxed/simple;
	bh=Vgm+UImHhcw0bmhGCKm4dBnJHDnczOt2RxsOxQ9SgUo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=S8yA5aIt/LO+ZSE5QT4M2Fmk7jPviOXco5mIpO7h7WDhzfLY1Gs5dTDnM/zpvgkYowftL0lHZR9uUjdgzuFV3FalSOapLJ1ZdLn4m65njEAN1lV+sYoDKBZ3BqkyuPym4DlxW0llFhpdYL5by+b1dE771EbHTGhzVtqgg6Epqqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2c60JON; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736813699; x=1768349699;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Vgm+UImHhcw0bmhGCKm4dBnJHDnczOt2RxsOxQ9SgUo=;
  b=b2c60JONKDmHdmHL98cmegVC797rbKvJO3JEu9Vlu0NcGfxkdIl9hR/3
   xhko6oAOUmUwEc5mZLjW0so21INnDGeqRWFpcJ4Kn2hGatOk0v3Q8Ko7G
   CBmKEgI+qRijWSLADRiF5YnOxIfYojn9bo+c1qzmv3NF96d3OnhgBjQjM
   7UctR39bmRyPEnMRb/FzSahZSTz21xqYPDWTezJ/Hb4OMbCKxYTcW31fz
   /6CJvd9ZCQqVZTvh/YGzGc83MNX75kykvRWrtBOd0L20AG8yVqBaDHbB/
   OR3h60NJ/u5ogwa78HrUW9jW71QpHPJBn+g3sGDWeQ89mDaSSGHkisv/A
   w==;
X-CSE-ConnectionGUID: 9MlxrX2aRJmi6EiO/LBNdw==
X-CSE-MsgGUID: GFBbMhV+TSC36moS0Gu0bQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="24697693"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="24697693"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 16:14:59 -0800
X-CSE-ConnectionGUID: Sso/9b2GSIqKpETRgc2Jiw==
X-CSE-MsgGUID: fTv9zzHdSrW9du7/trl2zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109259405"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 16:14:58 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 16:14:57 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 16:14:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 16:14:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=npr0YasWWytYPKRs0AB/DNMmVG7+Y8y6nwcgnKZN0qSjNxZsnyb+9M78raTdE2aJwVfmqer4oQJ6A24uCmABw48rN3F8NfOQz4wPT80jrID2J4kwvpKR04bDPlSLpQeYL0iTssUbO6pp7zI+Egio2o7yWc3PYEZqQfwp/A+T0KPaAnDWfzTCDcESPiiDEyAi7cO/aET5fAcZosLWBHM5luolTZU5PlOmgDMloo05VMDFOXnyEamUn+mrb/j5jW3oHQ/7lcmqDv8talmnXMiZkoQbr8KDHlJKU0LaHeXBQK3zzD2jVUGbCTGp52fxGxxcZqEeb8/XrBaGmL+8ef/PNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vgm+UImHhcw0bmhGCKm4dBnJHDnczOt2RxsOxQ9SgUo=;
 b=HL/vtSpADLHZF/U8DEQoaKbpfqMei/uxy4xcis6tSHIpxUon8MRz6zpXoTeZV5z4/8iw6eXvlpLu5SY0xtSyaCU5KChi3xsW8+q0Df67HjIuE3DnXm9QcBw9gEd38BUcwgVBxuFQ7q67Fm2EftwKAN/2ElD3ZPk/HQSldZabM/r1TtsV7ag8pHFv0p2vFbexG9PfQ5l40nT8KG+aTWc9IdQ0g5Ge1YMomt3F6HTLDQOjSTLSOwA5RoV833kh6mwih3WlerZTjf4MVXcMK9lPqtd137S0XnNFqWMxJexzLlxQkJmvVboCRe73rJyOZj+MKHUK2U5RDWRW6HYLyeKC9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 00:14:48 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 00:14:48 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] HID: intel-thc-hid: intel-quicki2c: fix potential
 memory corruption
Thread-Topic: [PATCH next] HID: intel-thc-hid: intel-quicki2c: fix potential
 memory corruption
Thread-Index: AQHbZZhmkjpqkUeKDkeKPeKEMjFUW7MUexoAgADsU1A=
Date: Tue, 14 Jan 2025 00:14:48 +0000
Message-ID: <IA1PR11MB60989CCEB4B69AEF292C65FBF4182@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250113085047.2100403-1-even.xu@intel.com>
 <173676293248.2279462.11753863703231864187.b4-ty@kernel.org>
In-Reply-To: <173676293248.2279462.11753863703231864187.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SA1PR11MB8573:EE_
x-ms-office365-filtering-correlation-id: dcc9491d-39c6-4feb-21ab-08dd343074ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VytKQjlGVVNReUE5WUpWc2FGb05YWG9UemJLU3ArbnNjVlpmaXQxNUluYW9X?=
 =?utf-8?B?WSttdThmaXpCUVlpMEhxeEJ5TWtiSzVCVktoS04wSVV3VnFMWk42SDU1anNY?=
 =?utf-8?B?cHVjdGFubFV0WUwweHBkdEVwN3pNcXRHWENZbFQ0S2lZaTVNZG0vVGl4KzdU?=
 =?utf-8?B?TmJVVEVtWUVJWnIxRHZ3RzBDNXg5Z01Qak9QbGprYkxNNWdsd2E1VTMydFFG?=
 =?utf-8?B?T3ViTlRjb2g4Sm9nZTgvTGI2dGNFTlRaYXhoSlVPb0k5R2lPY3loSVVCSS83?=
 =?utf-8?B?d050Rng1RWV5QWFLVEJoSWgyL3VnQWhhendQMkxmMGN5RityQ245YWdlQUdK?=
 =?utf-8?B?MGNhZmZvT1RhSWxsSXpsc1ZUditaUFc0aldsWEJaeXFqOG5sRXBjMVQvV2Nz?=
 =?utf-8?B?NFA3MFFkbERLcFI2b3dUa0ZvTmpqL3dtVWFINmRETlFDWTQzNnU5Y2E3K280?=
 =?utf-8?B?NjF3Ykw5ZVpKZTNMbzZWd2hNMjU3aWU4b0piNFlWQnNrOGJUa0tJaWRyVVds?=
 =?utf-8?B?MFk2QWI1WDlmZk81bHlCa3p0UERLQWxjQzNvRG9RZkxacG9ZTE80Z2lqeHd1?=
 =?utf-8?B?U3daYktSM2xKNnN5R2hxZkN0a2ZSRFFLREU2TlhwOGd2SVNGa3FydnpCT3R5?=
 =?utf-8?B?R3UwL0RhR052OWhiZm9ZVW1lbmg3RnE0V0ZWLzIzVHc1TGJGVzFvckN2QmFZ?=
 =?utf-8?B?NXZEbi93dHBkQVF1bkJWTkNETGdSZ0pwR3lseTR5OGFHUUdZeG55RU10TTZO?=
 =?utf-8?B?TU5xZ0hxelpmRm11NDFHeEpTVjNsRHVSVEVFRTFJdkxIRFZKUllMS1BUb3dv?=
 =?utf-8?B?ZlRWWllTRHFzcFlSWkZySm1iQ2doOGFHNHc2cGZtd2dUVE4rbEFWZUdDNm1z?=
 =?utf-8?B?Q1RBNmM0M2o4d0xWcGNUVGNXWktVd1NhUGY1ZUtSM1FCSGNZS0RIN3BMNmln?=
 =?utf-8?B?YzZIcXBpTE53dHljT2c2bzh6R3FCWGxYZXVmNlFGa0U1WE96Ri9pL3pDL3FW?=
 =?utf-8?B?RzV2amFHU0FSRU5WY2VadTBiQ1JCNU9WN1VXdGM2bm5xVDU2UUxkNzZ2c1ds?=
 =?utf-8?B?QllxU0ZjdkhoMk02TlNMVS91cGs3S0huUm04UG5PelJGZ3U0Y2RCRjV6R0Y2?=
 =?utf-8?B?Y2pFYU1JNklZMG55S0g1VG53OVlWY0trdGU4eUp3dk1jVndMd1JFZmJhOHZP?=
 =?utf-8?B?L2xqcW5DY3prMXRFRjd5amZEQ1Fzb2s2aFloNC80Q1dRSk9DVytoZkN6YXJj?=
 =?utf-8?B?a2FFb0ZuTFpyMlBXcWcrb1hIQlhUZHEreWJIOVVIRVNwOFpqOWVPem56TEVM?=
 =?utf-8?B?SVc0a25hZ2VZTHR0NXhWNlVGamJPWkJwbDZGeGd4OVFUOUpzLzdnQ3BTSEla?=
 =?utf-8?B?QmcvQTdPcDMwbS9iNEJHQjBFNWhQeGNrdlQxTmtFZzFXTTFidldKRzBQVVNx?=
 =?utf-8?B?amo2TE9YbUxzVFQxWmdZU0o5czJtQzQrOFA1bmhIcmwwVDVBQko3UThHVkFn?=
 =?utf-8?B?aDcyM0tzOXdRZURPSTdpWlhOR2ZxMUFhU3J5dFNXUDJ6Wmg3OG5EdjU3Mndv?=
 =?utf-8?B?TDVvM2FWWkc4d1NjUFgvUE04NklTYjBXbzhiSkhZWnFJWHFTdHdOcDBkMy8w?=
 =?utf-8?B?OWdXSXUxYjBPSnl2clMyRHZUdkZ2Ukt6L2JWVlFIbjdPait2azJQOWEwRnhG?=
 =?utf-8?B?aHVWK245TVpiWTNYaWJDYmtNYzJvYlVCNUE1bmpNMkV3S3FrWjVGcjFBVDU0?=
 =?utf-8?B?MFJQMWxWOXlkdjFESkdFSmtkdHBQaWEvRzFlREZUV3JpV1NQTTVuODZGeW9F?=
 =?utf-8?B?R2hPbFBmbXJ5cXJoZTlYYWVyTnBOUkEzYWFQNkRzbm9Ma0E5b2FOWHdsaTNT?=
 =?utf-8?B?UHlnOHc5YTJUVENIQVIrTUpydmF2aUpaQzh4K0FiRFVmcXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDVWRTdHVEFzeWJMSUVQWjAyKzJaNDBZWFZXanYzazNxdTUrYVRlMEJpZ05m?=
 =?utf-8?B?YUhja0RuQjE4ZFF1K1JIKzhpczZqWFQwL2ozL05Ea09RYUY5dVhyNFJpcy94?=
 =?utf-8?B?M2dkdXlEdXdCdkozNnF2NGFxMzN5SUw0K2lLMVhlUWMwZjROTVZybzU5OHUx?=
 =?utf-8?B?Mk1WeVRJcy9kaDZnaWRCU0YwVW9lSnlWVStjU3FnMTUwVTQ0NU9XcEhBaWpF?=
 =?utf-8?B?Mlh4SzgzeDJLWDdHV2dDbzI5T0JLTUs2SFhrUlpBSi93TUJZNVNxdlJhdzZh?=
 =?utf-8?B?Vkp0bFRsMHVQdCtnT1VBYVpRUEVaTTRYcjAxMVlUZVJzakU1WW90WWhBMkNk?=
 =?utf-8?B?VEUvczZBUVoyNkNYVEI0VGkvZWFHRUZWUzZUZHdianJQUUdaWGRBVURrY0d3?=
 =?utf-8?B?UWZ1NWh0WlRRbUg5c2FxVXlvblRZbXh5MHRmeFBLOE5WSWNZYmcwR284V2g5?=
 =?utf-8?B?ekprZUVGNGgybnppUVA5QzZPdWV2bUIyU01XOWZLbVgxQkpldDNtdWN6QThU?=
 =?utf-8?B?dVE1YzJvdzZkMDJqMlhCZkVuV1RsUWZQbEh0aXAwVSt4VnFTOHUvZVlOVnA0?=
 =?utf-8?B?SXJ3ckhJTVVPdElIS1ZqdzVGR3hBdjVhM3RlRWZLaUt3NmFQT3EraDRYM255?=
 =?utf-8?B?dDRFaHNPam5NZWhTUnBRZytQdGZuYkdoZFYxZFlRaFFsKzEvMW9IcWJxZmhE?=
 =?utf-8?B?cGdZNHRNQXhBcU8wSnJmT0l5ay9vS0ZvaGszRXdZbmxXbzNZYjNROVRLamVq?=
 =?utf-8?B?Y0t4L1FrN0V5Q1BiS2puQzJNcGRzelIwMi9UbHc0WjFGT3czdElhQk1nUGor?=
 =?utf-8?B?UG9aNlQ0Z01FV1JLZGtnU1JQOWhHcmg4Sk9UYlRrdzdIWUpOajhwS2dPQVhU?=
 =?utf-8?B?eUkyY3N1VXAvaDJDUTRLYmFCUDI0NDR2NzBFdFEyLzAveTdiNVlsUHhkbm14?=
 =?utf-8?B?L2NmSTc0eWZrNXNvWnZrWityUU5XNDZIbXJLdjNxZWFVWk1nQTMxM1JJZ1ZM?=
 =?utf-8?B?Z1RsdWp4cjEyNTJwa2d3Q2JlMVRjRHFYUjRxTTE5UTRZWUhUMjRHMjQzbTVq?=
 =?utf-8?B?RFZleVJhWHZ0dlFGWlBMMnNsdmEvbldreTFsQWtCcVp1My9Xay9oQWk5MUF3?=
 =?utf-8?B?UkVabXBlN000Z1NUWXpmSFlQbHp3WUxZTEhlZzVyRUxaVFFjSjE3NHBvL3NK?=
 =?utf-8?B?V2xvK1MxdENwK2taTXJMME1wOEpSRVJvam83ejNKT1FubFcveDY5dE5XUDV1?=
 =?utf-8?B?NzR5NFRFajJiT0pOYXl6dGl5M2J2NmJCL1RJY1h5Tlh1RmlEdHlDOFpWK2g1?=
 =?utf-8?B?TFgyTVBsQnBROWo2NERkc2Q3TTBLK2hoVmdoK0tZWk9pR0hBQndpVHN0WXE5?=
 =?utf-8?B?QU5VaDVNOHROMWp5WHFzZkhtcmFpZFJoR1RuSy9VSVdES3FOUVBpZXJnS0x3?=
 =?utf-8?B?cWlqcW1EM0l0WkhnMTlRMlRzaW4zUlhvNmFNL2Q5QysvbHZvclJ4SDFKQ1JD?=
 =?utf-8?B?TDg2aFdrY2ZqdzRuTmkyY1FNRWxmWjdQMmNrbktKYm4wdWdmMjhXR0hUQzlt?=
 =?utf-8?B?bjNoOTVYeG0xOVRpVDlybi8zSmptdXQxbndPK3MyWmhFcHdpRjhwdDJib2Vp?=
 =?utf-8?B?ZE85VGFsV1NHbkRqcUQ4Z1JZOXE3c2UzczBsSm1JQXdDTTNva1BwSEE1UStC?=
 =?utf-8?B?VG5NajNmd0x6N2tyd1d5OXU4WEUrMGIreUwvY0tRcHpyZm5MY1ZKZ2NzUSsz?=
 =?utf-8?B?bFhMSitEbXNDOUZibW0wcWxPY2FYSW11dzhIS2pwalhad3pINmsrTXVtTHNC?=
 =?utf-8?B?bU9MM2hMdWE4aXBxWStlMzRUZzh2enpwTlhUbXNNZmRRWTkwMHlzekZycjBm?=
 =?utf-8?B?VXc0T1dRYk9uWnd6Qmh0dzFDZzVRbWFjcWVxcU5pQTRjN3lkZXFmcGI1bDU4?=
 =?utf-8?B?eUtwK1d0ZkROeVJpbTZxUlVDU3dLdElDUStnOWoyaUNOLzF1Rm9hWVd3NmM2?=
 =?utf-8?B?MXpLSW9vam5neWZBSVo0aUxTVTJVUUdod0YxenU5a01NNGE3VEJDYlJSK2J4?=
 =?utf-8?B?aTcxYm5tT1dYVVBneVlsWUh4SDZacU8rRlFEc21HYkQ3RFlaOS9KY3I1Wjh2?=
 =?utf-8?Q?K9R2yA9wX9UgqML3xWw+w4nCb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc9491d-39c6-4feb-21ab-08dd343074ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 00:14:48.0637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 53z/u+MQZ5yLRbtptyWzZjKXdVPsEK23x7Av1CEKE23FjHuTFMPxK3QXCTLT9M+voM0yQHxAEdo24DyC/pWoKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-OriginatorOrg: intel.com

VGhhbmtzIEJlbmphbWluIQ0KDQpCZXN0IFJlZ2FyZHMsDQpFdmVuIFh1DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxMywgMjAyNSA2OjA5IFBNDQo+IFRv
OiBkYW4uY2FycGVudGVyQGxpbmFyby5vcmc7IFh1LCBFdmVuIDxldmVuLnh1QGludGVsLmNvbT4N
Cj4gQ2M6IHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tOyBqaWtvc0BrZXJuZWwu
b3JnOyBtcGVhcnNvbi0NCj4gbGVub3ZvQHNxdWViYi5jYTsgbGludXgtaW5wdXRAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBrZXJuZWwtamFuaXRvcnNA
dmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV4dF0gSElEOiBpbnRlbC10
aGMtaGlkOiBpbnRlbC1xdWlja2kyYzogZml4IHBvdGVudGlhbCBtZW1vcnkNCj4gY29ycnVwdGlv
bg0KPiANCj4gT24gTW9uLCAxMyBKYW4gMjAyNSAxNjo1MDo0NyArMDgwMCwgRXZlbiBYdSB3cm90
ZToNCj4gPiBVc2UgVTMyIHRvIGdldCB2YWx1ZSBmcm9tIEFDUEkgYW5kIGV4cGxpY2l0bHkgY2Fz
dCB0byBVMTYuDQo+ID4NCj4gPg0KPiANCj4gQXBwbGllZCB0byBoaWQvaGlkLmdpdCAoZm9yLTYu
MTQvaW50ZWwtdGhjKSwgdGhhbmtzIQ0KPiANCj4gWzEvMV0gSElEOiBpbnRlbC10aGMtaGlkOiBp
bnRlbC1xdWlja2kyYzogZml4IHBvdGVudGlhbCBtZW1vcnkgY29ycnVwdGlvbg0KPiAgICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL2hpZC9oaWQvYy9kMDhhMTA0OTY1OWENCj4gDQo+IENoZWVy
cywNCj4gLS0NCj4gQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtlcm5lbC5vcmc+DQoNCg==

