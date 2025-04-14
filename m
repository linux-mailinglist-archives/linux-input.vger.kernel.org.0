Return-Path: <linux-input+bounces-11745-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F21BA875F9
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 05:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 759CA7A67DF
	for <lists+linux-input@lfdr.de>; Mon, 14 Apr 2025 03:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BBA42077;
	Mon, 14 Apr 2025 03:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e2zqjyZ4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E96E4430;
	Mon, 14 Apr 2025 03:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744599763; cv=fail; b=KSEUQkEURNe+f7hrdA6ZHZorLRATdQABTo7ju/xGrln5XO2ZHZGlZ8SW3Ug5B0oKWr6ZwwoWdpBHTZTGbo18H48CmEqmGGxgKujpe6ICjzhRAafdbI+xD55FvwlFEzNhUtD2PRaozd/1kEbaQoEsCNQ1xqYBoRfs1j0zFXzleXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744599763; c=relaxed/simple;
	bh=HZjWDzDxQpBaI5HhpQjpqr72h3SLkJ+M1OjTwbdKjJQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u2UZTW7Df+9UQzyeIrcKuR3+FM7Ayef9iN7t+v59qzjvpg45ajgG8HPuxVdV5nD0e/+KtrI6piAj/qYYHL6Zbs3c7TmBggzHEhgbd9i7bFVuTbpYh0OmVLd8ywOB39xKkzJpgX+iNmXlERLs+W4UmrmGJgM8OiHmWGSMyX53qYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e2zqjyZ4; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744599761; x=1776135761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HZjWDzDxQpBaI5HhpQjpqr72h3SLkJ+M1OjTwbdKjJQ=;
  b=e2zqjyZ49ijcG5R5j1YWPdBIPcTN9kY4SxYaJ+DiJ02VggYLWkwq+aZC
   nEePQ7Fj8JQTR2c8z4fR2xPxXgdxGuihfciQXadReW3jwo5EHWytx9Lzv
   l5zv1QNaWxodOQBr/dzfr3MWYPYVjsWrPl6X3VKSn/ul7/x5MB+AqK24O
   Y6C3TPsA4TKd7hqA7VMU9kFrjO6BGOmtMcDN6entFz0ehglR0ddXLSBvA
   FF5txrFBuL/9yTdewJOR0D5KEpA6XMFv4beCoYYIDQFvrCcUjd6YEVfw4
   HuRxhXpBXcm4bNn7srlyj/Tb31/v2lGqKoY7qfYSU6Bx9/Y9AGIIPDA61
   A==;
X-CSE-ConnectionGUID: PIaQxiptQjGBJFtOD9/zUw==
X-CSE-MsgGUID: Q27tTaMOS5OBao590fK23g==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45291016"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="45291016"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 20:02:36 -0700
X-CSE-ConnectionGUID: ndXX8LJGTt+nkQ9d/EtOwQ==
X-CSE-MsgGUID: 7z//RKwuROq0TE9JJilUSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130544295"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 20:02:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 13 Apr 2025 20:02:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 13 Apr 2025 20:02:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 13 Apr 2025 20:02:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ysyUZYgp2ReQhiXtuuUGfMOv72qwEz3eI86EJxEGUSvrACt2/n0cHyyAH84g0MV13rFzbdlUOmpqBLE+XFz7AP1XD7w0bkF7wiRNXgDd+0vVCP225rkft1UZ4nPECCluZy8UfsF4tqlGKFWGKQqdeD7p7rhlURthO+gvaKwSL+ZKDtihRGfDJfz0IsakRcYrd6Po1NylVJrI7ndq6cHaW2OEQBq0P8QtZrx0hkQrLxVUfIEE711ZoRp5S5r0I5eB8bEnFX/C91hu7aqTAtIXWYLnjiKRMPJTLZ9Nn+2OM4EppJ4hJaRqvU/LMUMerkFgL8o1zmRRsN/U05Rb/tAIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZjWDzDxQpBaI5HhpQjpqr72h3SLkJ+M1OjTwbdKjJQ=;
 b=RLP0Gm5S6zI2z2KmoMX2jJh8AVYiop0QNAv5jx4YWD+88Qu9evt/9ze2UoRoi5p8OjKbIsmL8lr4OWnKfHCzfKLlW/Raj6/+JY54abKoccKjg8mMWDxs1M6baWjUYc8sfVglsj5HM/EZxi5z8aflTLISQBbwYa86oM0Lz7KHVwns/LMKI4+7YnHPLpaJA/ju3fadZP2cTsYrjLCj2Yk1JprN1pnuPWG8SBGl1QmLpay4RLs0SZS7xSRCXeiUTGDcVPW7+iwILeKLJMCvMuKvdcjr9/W6dlki2xriLWjJUidiegdl0KqJG5UfVNAIpW9VJ3FABoIsRisObekA2C2XgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by CO1PR11MB4946.namprd11.prod.outlook.com (2603:10b6:303:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:02:26 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:02:26 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Shengyu Qu <wiagn233@outlook.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"bagasdotme@gmail.com" <bagasdotme@gmail.com>, "Aaron, Ma"
	<aaron.ma@canonical.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Yue, Ling"
	<ling.yue@intel.com>
Subject: RE: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
Thread-Topic: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
Thread-Index: AQHbX+Mv8McLFtrq8UOfwwq5qyE1ubOcuU+AgAZUs/A=
Date: Mon, 14 Apr 2025 03:02:26 +0000
Message-ID: <IA1PR11MB609844BC85412F8CC4315738F4B32@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
 <TYCPR01MB84375C4CDCA3C55E1AB3BB2B98B72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB84375C4CDCA3C55E1AB3BB2B98B72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|CO1PR11MB4946:EE_
x-ms-office365-filtering-correlation-id: edde3014-8298-4789-0bff-08dd7b00c97e
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?TUo5d0FNVHdQN1UrckRSMnhORzJjcThnaGM5K0pJaDJsV1NSQ3VLUTYvQ3R2?=
 =?utf-8?B?TEdweFE4eC9TU3NLeEdybDBNTE9ITXd5QTNEa0dVVHN6WVJnQ0ZvaFljait0?=
 =?utf-8?B?V3BuY2wxb0IwbDlkV3JIeEFQQzk4Qkx6V0hyL2NBMGp0SlJYVzU2aXJmQXFh?=
 =?utf-8?B?cWVYVEdiU3BHVVhabnlDSDJWdzNoT0paTTNlWTJyZDZzT3NVRUw3b0xkM3NB?=
 =?utf-8?B?TXhFLzB2S3MvWFhVaHJSZk1FVHFOYlJEalJuc2dZRVBxUUI1WVFqOVJJQTFI?=
 =?utf-8?B?ckIwZDFPa0JjTmxERVFZaEhZZmdxcDEvbkh1WjQ3L1ZzNlpXUUdYenJuQnFh?=
 =?utf-8?B?LzJkSGtMWnRNcytQMkhpYllvdTdVQkplcFJzQ01DQW5tamF5bDVlQUJ2LzdF?=
 =?utf-8?B?RHBpVVNPcFpCQStuQlpOT1F2VWZsaTVsN0VwV2VPYkhtREV5L1B1U1ZzZU4z?=
 =?utf-8?B?U0dIRWhJdGd5OUhINCt1WFUyVllDd0drSUc0QWpCSUdSQ203Nm5JODYrd3BJ?=
 =?utf-8?B?M29XbGpJRFZXWnNJWDZrZ3gxZ0VFc2pkNTI4Z1YvUlRjTWRaL2pVNS9nZy8y?=
 =?utf-8?B?dVB2M3A1L0VncjF0d3RpTnA5dWJYanBrTUtIY2F2ZUtDc01uUlB5SEdBalZy?=
 =?utf-8?B?bW9Uc2J0SzAzVUJSRHRMWUVYL2lPeXllWi9QOVA4b0Jsb0RuVUs5bXF3SVRG?=
 =?utf-8?B?ZExDSm42K0hKbGVCZ24vakNjNHExUkxjZkJRZjRrVFNod1RvQm0xUGRjV21q?=
 =?utf-8?B?UkpCdlIxekJEbFp6RWxQMVFBTklVb0tYRVE2Q3pQci9IU2ZMT1d3NGFzeStR?=
 =?utf-8?B?Tyt5SjFBb3J4OHlkMC9XMm1iT0VJbERMTklJNjkvd3pJYWRoN1l3TlMvL1F5?=
 =?utf-8?B?ekdHenQ4S0xPZEcweDBZM2dSalFRYjV3a2VJcUtkZ29xV0pVOUU3VW1xbmIz?=
 =?utf-8?B?LzlIcnNUTFVrK2RYc2phUlZOZ3p1U1lvNVVTcVI3OFcrVVpoZENpWmNqbndt?=
 =?utf-8?B?L08xM0s0c2djeTZVUmg3bXp6d0VZd1Z3U2V6N0VmakFUaWVaY3BLcVZ1TXVE?=
 =?utf-8?B?YWxBeko4dTBnNEdZNEQ4dW1hMlNlVElXN2V4OWNFOVFmWkNPYnpObXM3Rkcy?=
 =?utf-8?B?QW5sOGM1RzVPcW40SERITlQ4RTFvQmZpUVJlWFFwbEpVendqT2N6cko4dDFt?=
 =?utf-8?B?SlIxeWYvS0s5U1FlbmxkeXBqNzhOWUFBRWpGbHovUFJVTmVQV212WnZPUlgr?=
 =?utf-8?B?ZjhqYmpSN1lhN1VlbnRRR0tIaFFUaXhqdlFvY1JSZjFoYWtHc01ERkMzUkp1?=
 =?utf-8?B?WmZGcWdjTmtaVmVpUDNqSTYyQ1JMbDZoZEtzNmxLK1M1OXduUDF0eVVOTy8r?=
 =?utf-8?B?blltUk1vQk9GTS93RW41STYwanFwcncrbnE1NTV2TEZPMnFPdFJPV2NQZ254?=
 =?utf-8?B?czFjSWdmMFA3YldYaHdrelRIbzRsbmdralp0bUNKWWk3bmw0ZExNVU5qdXpF?=
 =?utf-8?B?T1dBZ1pGY0dTQ2hxUUlyRU1KTktwNFc2MDJlYVJHNDBjVnlrdWVVY0NMZ3hO?=
 =?utf-8?B?SkdkWEV5TVQrYlBBVTZFNThUQ1EwQjEzVGlFWGZlZlp5U3VkeVQ4TFd0TzUw?=
 =?utf-8?B?S1UxbkFKTWlBZDJSa0svWDBaWCszNm9rbi9iS1YzN2NqbnBBTU1OcnNaLzFW?=
 =?utf-8?B?MEhKMDhzalpJRzJ1c3M3b0E4bk54czB0UHVxYXJ0eER2ZnlKKzh3WGxJdG1n?=
 =?utf-8?B?MXJHSnhhdFZWUWZvUE55cURiWitOcUVkc1pjVzBLMVlwZm5WdytzSjhWN1Ay?=
 =?utf-8?B?d1diSWY1YytkVnUvR3NWVG9NMnRSNzNpblN6Ly94NUswekU5YnhQMTA4OUZE?=
 =?utf-8?B?K0ZNME1FM2xjbVJwRHU4ZDFsN3RzdmR1QkRmY242bDU4bEV6Y1BIbGFNRm1F?=
 =?utf-8?B?NHBKNFlDQWliL1JVMjVGcXYxWnBLNzNPSFk4RktoNWRDVzIrOGw5eFFqdG13?=
 =?utf-8?Q?PA94/Bmb1gegOiN/OaYMVllN/hw/k4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1l2Zi8yZ3ZXeEx6dDlxSUpjOFBoWTNzdXRnRlZqWFVtbnlRQTZxRVBWL3VE?=
 =?utf-8?B?dEt5UVFzMGtzYUhqL2ozR0laS3M0Z29MbXhwdTRhVVVIZUtVZExaQ2ZiWjRy?=
 =?utf-8?B?eUZlVlliaEMvSzJqbWw2aGo1SmRMc0dyZU8wRHpDblhzTXJwLzYxWGFhTUFL?=
 =?utf-8?B?ZFl6MFFwd2sxNFNzUUx4cGR5cGtSV0Z5REhIL0Z2N2RaVlY1UnF6cURPVzVn?=
 =?utf-8?B?Y3NvMmF0bld3ZDFsNTRiRkZFZFVDMlZyNU1jaTdOV2VCbzdZUEJRZ3hzbkpl?=
 =?utf-8?B?RG5GRjdsMWRxVGxkOHdqRkdJYUl3TmVXbTFFU1plb0JxQVR0RVJlVWNKZU8z?=
 =?utf-8?B?NmR4NzRBS0luZnZZMTRyd3A4bEI5TStBK3lpQVFyNjRhSTdBdmMzcHFMdDZp?=
 =?utf-8?B?YkNVRC9UR2MvN2VNc2dBeHJ1eDNwZUxtWHA3ZmJaelM3aDZ1VU1jTWJYamIv?=
 =?utf-8?B?YVM3TjB5NG15dWVPUng1NXJWeXFNUXdiUWJTemlsM1pmTERYMHRDY1lNU2J1?=
 =?utf-8?B?UFZLUTFWWmEzdW1ndkVQUGtvY2dUaldTYTc5Q0d5QXlBSEpPdUFjbGRKc1U1?=
 =?utf-8?B?SnF4bjFBdWRWTmtIakM2Z2d4KzJDTkJSR0ZFOXVwZ1lodGpGaThObi9PeEpU?=
 =?utf-8?B?VFU3Um1obkxNek1nVzBxOEw2YXpMbERWK1RGbGdvRzNoTU1PY3BoUDV2ZFRu?=
 =?utf-8?B?QjZ4SEZKanh0dFRxTkowYjVKVFhqR0tsbzBsNnVuSmV0NnR5QkVxWXBpQ29r?=
 =?utf-8?B?dGMrTnVRTHdjc2xHc2V5eXpSVTF3S3k5ZjBTL1Q2Ti9oVmhma21FWnMwdVJN?=
 =?utf-8?B?RXFkeFBLV0dqK0wwSzREckllNU9ub2FnQVNHYklLVFNMekE5M1pMRE5CVUV0?=
 =?utf-8?B?ZzBhb3hMNzlxU0lSYmR3cUw1UFRpaDExZW55RFpkeTYrSVYvS014d1Zvd3dL?=
 =?utf-8?B?NWNaY3FzZkM5N3E3TWRpZzlBYUhJVDMrU0ZMY3BYaXF5R3JYYm9abTlFdXFX?=
 =?utf-8?B?a3dDZDNIcThzTmcvdzFxN3AzazJFTzZuT3c5MXV6dlkvTGhQRmFKSlpQdWhw?=
 =?utf-8?B?Q1luYmpKM1FLaERvRmkxYU9pVmIrbHBXWFdmNWpLYkw2b04wcmZNOUhhUkxo?=
 =?utf-8?B?ekNWZFpHeVN6ZHY1N0l1cDY0SjI0Ni8xUkhFSjJ1d1NCaUdrczdST1cybHRO?=
 =?utf-8?B?MnkwcXVOQyszWWlUay9uNkVhdzN6L0llRERQS2ZaU1hIV0xkc1ZlS2JSMGpU?=
 =?utf-8?B?cmdaZEtUR05QSWk1d0paOHpOd2poMkNaMzhBRE5HRnhaTTJPQkZjSXhMQkhD?=
 =?utf-8?B?MERZcktxRURJMXlYTVgvSG9FV2RiWWlHbHk4WDl5ckc4VWpPd3UyZWsvODI2?=
 =?utf-8?B?MUkyR1A2UDRDK1pUeXY1OXJBYmZtUFNneXljWG9wNlV5Z2E0bUxIMTZSTVQx?=
 =?utf-8?B?SHNuQmhEbVQrSDlEK2IweVBLU2VRbjlLN2N6RVFGamdJK0htamw3S21yWkZt?=
 =?utf-8?B?YVBUQUkybzR2Rk1BZ3lJNjdGenlPRTFjTFc2QzFGNzFoaEtRK1pGZW1sQU1N?=
 =?utf-8?B?SnQyRnVZNE53Yi83YnkwMzRTaElNSDI5Vkl1K2ErYk5DYTJ4cElRcUZsNnhH?=
 =?utf-8?B?NGFoeVlsWVJ2VzVHMHZ0WW1kZE9NV2pjKzZWd3ZDc1N0UjFUQmhzUm54NDZE?=
 =?utf-8?B?dkNadHErZWd6WnZ1dGpib0Q1TlBuU21pTENZN3JBUGl4RmVab3lLK0M3M05Q?=
 =?utf-8?B?VzFhU2t5VEZVRFliSi9vREhJL0lNbi9ncWdPNUI0UnRZa2pGbVh5RFdJaXVB?=
 =?utf-8?B?MktIdE5mOFdsa21qL3ZUWit1d2tRVWgrN0prZjB4cnVHbFZMbFR3ZUdqVzhM?=
 =?utf-8?B?cGoveXhDQk51dWp6V3dUZFY3OHpTSEhvejc4a2RVSlRvaSs1USs5WEZwL0xK?=
 =?utf-8?B?bGU5T1JFS2NHMDd2alFxYkZvSmlVR1VBeis1QXJiQUUxUEN5dFBKMjI0TkVJ?=
 =?utf-8?B?NlBvZ1N4aGRxMkpRYUc0Q05JVTZybm9tMG9XQ3JOSDNpRGVxczBZV3NsSmVa?=
 =?utf-8?B?QytRMTVmNEJNQ2xqOW5iU09yMmF0d0xxK0paTU82SEovc3lVS09UTkZKU2tR?=
 =?utf-8?Q?2vcE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: edde3014-8298-4789-0bff-08dd7b00c97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 03:02:26.7067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpcnqq0daiAGwPiBYALFxDCqG2x69XWvh8tYscFu2qMLCCYBmV3z7/xBR+3Ra86ZZIJvs/PfQUyxbSC9b/qGEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
X-OriginatorOrg: intel.com

SGksIFNoZW5neXUsDQoNClRoYW5rcyBmb3IgeW91ciBmZWVkYmFjayENCg0KSW4gZmFjdCwgd2Ug
aGF2ZSBJUFRTIG1vZGUgaW50ZXJuYWwgZHJhZnQgZHJpdmVyLiBJdCB3b3JrcyBmaW5lIGFuZCBw
YXNzZXMgYmFzaWMgdmFsaWRhdGlvbi4NCkJ1dCBJIHdhcyB0b2xkIHRoYXQgSVBUUyBFRFMgKEV4
dGVybmFsLWludGVyZmFjZSBEZWZpbml0aW9uIFNwZWMpIGlzIGRlc2lnbmVkIGFzIGEgcHJpdmF0
ZSBzcGVjLCBub3QgYmUgcHVibGlzaGVkIHlldC4NClRoaXMgSVBUUyBFRFMgaXMgb25seSBzaGFy
ZWQgd2l0aCBPRU1zIHVuZGVyIE5EQS4NCg0KU28sIGZpcnN0LCBmcm9tIG15IHBlcnNwZWN0aXZl
LCBJIG5lZWQgdG8gY29uc3VsdCB0aGUgY29tcGFueSdzIGxlZ2FsIGRlcGFydG1lbnQgYW5kIGRp
c2N1c3Mgd2l0aCB0aGVtIGhvdyB0byBwcm9jZWVkIHdpdGggdGhpcyBjYXNlLg0KDQpXaWxsIGNv
bWUgYmFjayB0byB5b3Ugb25jZSBJIGdldCBhbnkgdXBkYXRlIG9uIHRoaXMuDQoNClRoYW5rcyEN
Cg0KQmVzdCBSZWdhcmRzLA0KRXZlbiBYdQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+IEZyb206IFNoZW5neXUgUXUgPHdpYWduMjMzQG91dGxvb2suY29tPg0KPiBTZW50OiBUaHVy
c2RheSwgQXByaWwgMTAsIDIwMjUgMTA6MDIgQU0NCj4gVG86IFh1LCBFdmVuIDxldmVuLnh1QGlu
dGVsLmNvbT47IGppa29zQGtlcm5lbC5vcmc7IGJlbnRpc3NAa2VybmVsLm9yZzsNCj4gY29yYmV0
QGx3bi5uZXQ7IGJhZ2FzZG90bWVAZ21haWwuY29tOyBBYXJvbiwgTWENCj4gPGFhcm9uLm1hQGNh
bm9uaWNhbC5jb20+OyByZHVubGFwQGluZnJhZGVhZC5vcmc7IG1wZWFyc29uLQ0KPiBsZW5vdm9A
c3F1ZWJiLmNhDQo+IENjOiB3aWFnbjIzM0BvdXRsb29rLmNvbTsgbGludXgtaW5wdXRAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtZG9jQHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDAwLzIyXSBBZGQgSW50ZWwg
VG91Y2ggSG9zdCBDb250cm9sbGVyIGRyaXZlcnMNCj4gDQo+IEhlbGxvLA0KPiANCj4gQ2FuIHlv
dSBhbHNvIGFkZCBwcmV2aW91cyB2ZXJzaW9uIHN1cHBvcnQgZm9yIHRoZSBUSEMgSVA/IGxpbnV4
LXN1cmZhY2UgZ3V5cyBkaWQgYQ0KPiBnb29kIGpvYiwgYnV0IHRoZXkgYXJlIG5vdCBmdWxsLXRp
bWUgd29ya2luZyBvbiB0aGlzLCBhbmQgbWFpbmxpbmluZyB0aGVpcg0KPiBkb3duc3RyZWFtIGRy
aXZlciB3b3VsZCB0YWtlIGEgbG9uZyB0aW1lLg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBTaGVu
Z3l1DQo+IA0KPiDlnKggMjAyNS8xLzYgMTA6MzEsIEV2ZW4gWHUg5YaZ6YGTOg0KPiA+IEludGVs
IFRvdWNoIEhvc3QgQ29udHJvbGxlciAoVEhDKSBpcyBhIG5ldyBoaWdoIHBlcmZvcm1hbmNlIGlu
cHV0IElQDQo+ID4gd2hpY2ggY2FuIGJlbmVmaXQgSElEIGRldmljZSdzIGRhdGEgdHJhbnNhY3Rp
b24sIHN1Y2ggYXMgdG91Y2ggc2NyZWVuLA0KPiA+IHRvdWNoIHBhZCwgc3R5bHVzLg0KPiA+DQo+
ID4gVEhDIElQIG5vdyBldm9sdWF0ZXMgdG8gVjQsIGl0IGNhbiBzdXBwb3J0IDMgZGlmZmVyZW50
IG1vZGVzOiBJUFRTLA0KPiA+IEhJRFNQSSBhbmQgSElESTJDLiBIZXJlIGFyZSB1cGdyYWRlIGhp
c3Rvcnk6DQo+ID4gLSBUSEMgdjEsIGZvciBUR0wvTEtGLCBzdXBwb3J0cyBpbnRlbCBwcml2YXRl
IElQVFMgKEludGVsIFByZWNpc2UgVG91Y2gNCj4gPiAgICBhbmQgU3R5bHVzKSBwcm90b2NvbCAo
IElQVFMgbW9kZSkNCj4gPiAtIFRIQyB2MiwgZm9yIEFETCwgYWRkcyBpbmR1c3RyaWFsIHN0YW5k
YXJkIEhJRCBvdmVyIFNQSSBwcm90b2NvbA0KPiA+ICAgIHN1cHBvcnQgKEhJRFNQSSBtb2RlKQ0K
PiA+IC0gVEhDIHYzLCBmb3IgTVRMLCBlbmhhbmNlcyBISUQgb3ZlciBTUEkgbW9kZQ0KPiA+IC0g
VEhDIHY0LCBmb3IgTE5MLCBhZGRzIGludWRzdHJpYWwgc3RhbmRhcmQgSElEIG92ZXIgSTJDIHBy
b3RvY29sDQo+ID4gICAgc3VwcG9ydCAoSElESTJDIG1vZGUpDQo+ID4NCj4gPiBMaW51eCBTdXJm
YWNlIGNvbW11bml0eSAoaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXN1cmZhY2UpIGFscmVhZHkN
Cj4gPiBpbXBsZW1lbnRlZCBJUFRTIG1vZGUuIFRoZXNlIHBhdGNoIHNlcmllcyBwcm92aWRlcyBU
SEMgSElEU1BJIG1vZGUgYW5kDQo+ID4gVEhDIEhJREkyQyBtb2RlIHN1cHBvcnQgb24gTGludXgu
DQo+ID4NCj4gPiBUaGVzZSBwYXRjaCBzZXJpZXMgaW5jbHVkZXM6DQo+ID4gMS4gRG9jdW1lbnQg
Zm9yIFRIQyBoYXJkd2FyZSBhbmQgc29mdHdhcmUgaW50cm9kdWN0aW9uLg0KPiA+IDIuIEludGVs
IFRIQyBIYXJkd2FyZSBsYXllciBkcml2ZXIgd2hpY2ggcHJvdmlkZXMgY29udHJvbCBpbnRlcmZh
Y2VzDQo+ID4gICAgIGZvciBwcm90b2NvbCBsYXllci4NCj4gPiAzLiBJbnRlbCBRdWlja1NQSSAo
UikgZHJpdmVyIHdvcmtpbmcgYXMgYSBISURTUEkgZGV2aWNlIGRyaXZlciB3aGljaA0KPiA+ICAg
ICBpbXBsZW1lbnRzIEhJRCBvdmVyIFNQSSBwcm90b2NvbCBhbmQgZmxvdy4NCj4gPiA0LiBJbnRl
bCBRdWlja0kyQyAoUikgZHJpdmVyIHdvcmtpbmcgYXMgYSBISURJMkMgZGV2aWNlIGRyaXZlciB3
aGljaA0KPiA+ICAgICBpbXBsZW1lbnRzIEhJRCBvdmVyIEkyQyBwcm90b2NvbCBhbmQgZmxvdy4N
Cj4gPg0KPiA+IENoYW5nZSBsb2dzOg0KPiA+IHY0Og0KPiA+IC0gTWlub3IgZml4IGluIGRvY3Vt
ZW50cw0KPiA+IC0gVHlwbyBmaXhlcyBpbiBwYXRjaCA2ICYgcGF0Y2ggNyBjb21taXQgZGVzY3Jp
cHRpb25zDQo+ID4NCj4gPiB2MzoNCj4gPiAtIENoYW5nZSB0YWJsZXMgaW4gZG9jdW1lbnRzIGZy
b20gbGl0ZXJhbCBibG9jayB0byB0YWJsZSBmb3JtYXQNCj4gPiAtIENoYW5nZSBzeW1ib2wgbmFt
ZXNwYWNlIHRvIHN0cmluZyBsaXRlcmFsIGFjY29yZGluZyB0byBwYXRjaDoNCj4gPiAgICBjb21t
aXQgY2RkMzBlYmIxYjlmICgibW9kdWxlOiBDb252ZXJ0IHN5bWJvbCBuYW1lc3BhY2UgdG8gc3Ry
aW5nDQo+ID4gbGl0ZXJhbCIpDQo+ID4gLSBSZWZpbmUgS2NvbmZpZyBkZXNjcmlwdGlvbg0KPiA+
IC0gRW5oYW5jZSBRdWlja3NwaSBhbmQgUXVpY2tpMmMgZHJpdmVyIGJ5IGNsZWFyaW5nIFRIQyBo
YXJkd2FyZSBpbnRlcm5hbA0KPiA+ICAgIHN0YXRlIGJlZm9yZSBkb2luZyBpbml0aWFsaXphdGlv
biB0byBhdm9pZCBCSU9TIGltcGFjdHMuDQo+ID4gLSBBIGZpeCBpbiBRdWlja2kyYyBkcml2ZXIg
d2hlbiBkb2VzIHNldF9yZXBvcnQNCj4gPg0KPiA+IHYyOg0KPiA+IC0gRml4IGRvY3VtZW50IGZv
cm1hdCBpc3N1ZXMNCj4gPiAtIEFkZCBUSEMgZGV2aWNlIElEcyBmb3IgSW50ZWwgUGFudGhlciBM
YWtlIChQVEwpIHBsYXRmb3JtDQo+ID4NCj4gPiBFdmVuIFh1ICgxMyk6DQo+ID4gICAgSElEOiBU
SEM6IEFkZCBkb2N1bWVudGF0aW9uDQo+ID4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10
aGM6IEFkZCBUSEMgRE1BIGludGVyZmFjZXMNCj4gPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGlu
dGVsLXRoYzogQWRkIFRIQyBJMkMgY29uZmlnIGludGVyZmFjZXMNCj4gPiAgICBISUQ6IGludGVs
LXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBBZGQgVEhDIFF1aWNrU1BJIGRyaXZlciBoaWQgbGF5
ZXINCj4gPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBBZGQgVEhDIFF1
aWNrU1BJIEFDUEkgaW50ZXJmYWNlcw0KPiA+ICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwt
cXVpY2tzcGk6IEFkZCBISURTUEkgcHJvdG9jb2wgaW1wbGVtZW50YXRpb24NCj4gPiAgICBISUQ6
IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBBZGQgUE0gaW1wbGVtZW50YXRpb24NCj4g
PiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNraTJjOiBBZGQgVEhDIFF1aWNrSTJD
IGRyaXZlciBza2VsZXRvbg0KPiA+ICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tp
MmM6IEFkZCBUSEMgUXVpY2tJMkMgZHJpdmVyIGhpZCBsYXllcg0KPiA+ICAgIEhJRDogaW50ZWwt
dGhjLWhpZDogaW50ZWwtcXVpY2tpMmM6IEFkZCBUSEMgUXVpY2tJMkMgQUNQSSBpbnRlcmZhY2Vz
DQo+ID4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC1xdWlja2kyYzogQWRkIEhJREkyQyBw
cm90b2NvbCBpbXBsZW1lbnRhdGlvbg0KPiA+ICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwt
cXVpY2tpMmM6IENvbXBsZXRlIFRIQyBRdWlja0kyQyBkcml2ZXINCj4gPiAgICBISUQ6IGludGVs
LXRoYy1oaWQ6IGludGVsLXF1aWNraTJjOiBBZGQgUE0gaW1wbGVtZW50YXRpb24NCj4gPg0KPiA+
IFhpbnBlbmcgU3VuICg5KToNCj4gPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IEFkZCBiYXNpYyBU
SEMgZHJpdmVyIHNrZWxldG9uDQo+ID4gICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10aGM6
IEFkZCBUSEMgcmVnaXN0ZXJzIGRlZmluaXRpb24NCj4gPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6
IGludGVsLXRoYzogQWRkIFRIQyBQSU8gb3BlcmF0aW9uIEFQSXMNCj4gPiAgICBISUQ6IGludGVs
LXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIEFQSXMgZm9yIGludGVycnVwdA0KPiA+ICAgIEhJRDog
aW50ZWwtdGhjLWhpZDogaW50ZWwtdGhjOiBBZGQgVEhDIExUUiBpbnRlcmZhY2VzDQo+ID4gICAg
SElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10aGM6IEFkZCBUSEMgaW50ZXJydXB0IGhhbmRsZXIN
Cj4gPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIFRIQyBTUEkgY29uZmln
IGludGVyZmFjZXMNCj4gPiAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBB
ZGQgVEhDIFF1aWNrU1BJIGRyaXZlciBza2VsZXRvbg0KPiA+ICAgIEhJRDogaW50ZWwtdGhjLWhp
ZDogaW50ZWwtcXVpY2tzcGk6IENvbXBsZXRlIFRIQyBRdWlja1NQSSBkcml2ZXINCj4gPg0KPiA+
ICAgRG9jdW1lbnRhdGlvbi9oaWQvaW5kZXgucnN0ICAgICAgICAgICAgICAgICAgIHwgICAgMSAr
DQo+ID4gICBEb2N1bWVudGF0aW9uL2hpZC9pbnRlbC10aGMtaGlkLnJzdCAgICAgICAgICAgfCAg
NTY4ICsrKysrKw0KPiA+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgICAgNiArDQo+ID4gICBkcml2ZXJzL2hpZC9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgICAyICsNCj4gPiAgIGRyaXZlcnMvaGlkL01ha2VmaWxlICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgIDIgKw0KPiA+ICAgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhp
ZC9LY29uZmlnICAgICAgICAgICAgIHwgICA0MiArDQo+ID4gICBkcml2ZXJzL2hpZC9pbnRlbC10
aGMtaGlkL01ha2VmaWxlICAgICAgICAgICAgfCAgIDIyICsNCj4gPiAgIC4uLi9pbnRlbC1xdWlj
a2kyYy9wY2ktcXVpY2tpMmMuYyAgICAgICAgICAgICB8ICA5NjYgKysrKysrKysrKw0KPiA+ICAg
Li4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oICAgICAgICAgICAgIHwgIDE4NiArKw0K
PiA+ICAgLi4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWhpZC5jICAgICAgICAgICAgIHwgIDE2
NiArKw0KPiA+ICAgLi4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWhpZC5oICAgICAgICAgICAg
IHwgICAxNCArDQo+ID4gICAuLi4vaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtcHJvdG9jb2wuYyAg
ICAgICAgfCAgMjI0ICsrKw0KPiA+ICAgLi4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLXByb3Rv
Y29sLmggICAgICAgIHwgICAyMCArDQo+ID4gICAuLi4vaW50ZWwtcXVpY2tzcGkvcGNpLXF1aWNr
c3BpLmMgICAgICAgICAgICAgfCAgOTg3ICsrKysrKysrKysrDQo+ID4gICAuLi4vaW50ZWwtcXVp
Y2tzcGkvcXVpY2tzcGktZGV2LmggICAgICAgICAgICAgfCAgMTcyICsrDQo+ID4gICAuLi4vaW50
ZWwtcXVpY2tzcGkvcXVpY2tzcGktaGlkLmMgICAgICAgICAgICAgfCAgMTY1ICsrDQo+ID4gICAu
Li4vaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktaGlkLmggICAgICAgICAgICAgfCAgIDE0ICsNCj4g
PiAgIC4uLi9pbnRlbC1xdWlja3NwaS9xdWlja3NwaS1wcm90b2NvbC5jICAgICAgICB8ICA0MTQg
KysrKysNCj4gPiAgIC4uLi9pbnRlbC1xdWlja3NwaS9xdWlja3NwaS1wcm90b2NvbC5oICAgICAg
ICB8ICAgMjUgKw0KPiA+ICAgLi4uL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1k
ZXYuYyAgIHwgMTU3OCArKysrKysrKysrKysrKysrKw0KPiA+ICAgLi4uL2ludGVsLXRoYy1oaWQv
aW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuaCAgIHwgIDExNiArKw0KPiA+ICAgLi4uL2ludGVsLXRo
Yy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kbWEuYyAgIHwgIDk2OSArKysrKysrKysrDQo+ID4g
ICAuLi4vaW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRtYS5oICAgfCAgMTQ2ICsr
DQo+ID4gICAuLi4vaW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWh3LmggICAgfCAg
ODgxICsrKysrKysrKw0KPiA+ICAgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1pMmMuaCAgICAgICAg
ICAgICAgICAgIHwgIDExNyArKw0KPiA+ICAgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1zcGkuaCAg
ICAgICAgICAgICAgICAgIHwgIDE1NSArKw0KPiA+ICAgMjYgZmlsZXMgY2hhbmdlZCwgNzk1OCBp
bnNlcnRpb25zKCspDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9oaWQv
aW50ZWwtdGhjLWhpZC5yc3QNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9p
bnRlbC10aGMtaGlkL0tjb25maWcNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hp
ZC9pbnRlbC10aGMtaGlkL01ha2VmaWxlDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYw0KPiA+ICAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tp
MmMvcXVpY2tpMmMtZGV2LmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9p
bnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWhpZC5jDQo+ID4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9xdWlj
a2kyYy1oaWQuaA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRo
Yy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtDQo+IHByb3RvY29sLmMNCj4gPiAgIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1
aWNraTJjLQ0KPiBwcm90b2NvbC5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9o
aWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9wY2ktcXVpY2tzcGkuYw0KPiA+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tzcGkv
cXVpY2tzcGktZGV2LmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRl
bC10aGMtaGlkL2ludGVsLXF1aWNrc3BpL3F1aWNrc3BpLWhpZC5jDQo+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9xdWlja3Nw
aS1oaWQuaA0KPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1o
aWQvaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktDQo+IHByb3RvY29sLmMNCj4gPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNrc3BpL3F1aWNr
c3BpLQ0KPiBwcm90b2NvbC5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9oaWQv
aW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRldi5jDQo+ID4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRl
di5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9p
bnRlbC10aGMvaW50ZWwtdGhjLWRtYS5jDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRtYS5oDQo+ID4gICBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwt
dGhjLWh3LmgNCj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2xpbnV4L2hpZC1vdmVy
LWkyYy5oDQo+ID4gICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1z
cGkuaA0KPiA+DQoNCg==

