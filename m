Return-Path: <linux-input+bounces-12352-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B693AB6266
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 07:36:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E85A3B2238
	for <lists+linux-input@lfdr.de>; Wed, 14 May 2025 05:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DA41E492D;
	Wed, 14 May 2025 05:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NsWsfi5w"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6091CAB3;
	Wed, 14 May 2025 05:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200997; cv=fail; b=f8wQz91BKq/xEWy74xYlIjXrwnQLz2Yrl/Ynq4WB7KoNY5acUAg/83F1lb64Qp4hY8Ow+a4CQkgNJtMXYrd4P+QDJQXgkm3iz76HB6f660weufi31QgV+087sJBdRhNdsWaKX1KCQFgJmdPnasOp4vXJBzGDlPnbw+sZ3RhD6WY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200997; c=relaxed/simple;
	bh=Jj8WZ06XgTlRFFdzu6wSp31+Zzp/q4nNwN7i3uD+p0Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=h6f66GG4DxQozoJQ14KTQf9b49cvyjsCUC9CFVY6g2qFQuM8oonMK7mFFHotw8O9WAKDeuC7tFqF8jciNNQR3cHlwqr0woZRMp8wN8KZ/o7igpn9MqgjIa5WGi0mDQREWUJiw/XbEPDLklp0wAqhWX9pQGROPXq7dye5SboRH9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NsWsfi5w; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747200995; x=1778736995;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jj8WZ06XgTlRFFdzu6wSp31+Zzp/q4nNwN7i3uD+p0Q=;
  b=NsWsfi5wcUyBsOKQjptZJMiJnqin9Eiwx//tsLnIkV1RsXRDRZYVDutx
   q8RZLqkfxwLhOCvlq82gIYLYI39n3ogMm87GD9qC5Sc5Fgl93lIswIAxs
   YA03CY/XgkV9npdfnxe7pBXZYi3a8mHdjxWeifKdkhHJFKamIcuvz/9Al
   V0a4T6UZ5sz4SuYwacs6X9xE6mUVYA9p2N8PjgeGyNDncxQwK5Sk4vVeV
   k/KgxdyEJyA9d2AThf0Gs1BqxiZHhe/6IT/qq7gq6/L9tXQFKajzmM0gZ
   ROh0xhTI5pVm0i2LkJ8dGZQgy7m/eqsJFS+cKDohnOxVeC8AyaM661n/J
   g==;
X-CSE-ConnectionGUID: HFdljOwyTO6SASs1eGcRGQ==
X-CSE-MsgGUID: 7JKoxTMSSO2w1NuFshMqvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49242930"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="49242930"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 22:36:35 -0700
X-CSE-ConnectionGUID: 8LYd/7ukSkS3rAOaoicpnw==
X-CSE-MsgGUID: YxlYcp3NSy6lSXzTe312VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="143042587"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 22:36:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 22:36:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 22:36:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 22:36:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgnTNbJM7cZEbOofOBffrk7SPI5hp/JJVZCsh8fQbzIKGqCJ8B2vDTgxOc1BB+upyXrrPt+lYhGVxkd8qjqORzFPgCxQBAlRamhxhroockzTbjDdAMj7Tg/eWQNLSggNBREyYfQrwhcMbTc8rIo1dAxyezl4f98upKxA+D/AZWAIbOXVpLIt190pF2XCy6dbNMlY31KvhGjTQWlplpi726MYK6WtgippGK9KOuFZxDdNeyOxRT7nZhEcpRT/EuUR9x8VZQO0XTPWg17HQyQ6ZP2BZ7mOTMUukbanmYT10QSBJmZ4UCLvOFN1MwvVHvQMIzL8z72ilpL70ZVWZ23qhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jj8WZ06XgTlRFFdzu6wSp31+Zzp/q4nNwN7i3uD+p0Q=;
 b=aeoIkrU+/NqQvoip10u/rW4eyU3RzFncQ7ESLbbLMPov/4lOImhbvdx9Tncw3hmwEuLWPKxO2wjQiRJ1MZHEQYeOKdf+ZNyHhzzFJMaU0E5v19cqrTf8teucQC9v1TJqlw9XFMDaKdIi1sITxGDHw9nvTL2Jw2YL0TGHXnh1L1gjw9tGww5RwiMS3/6Eu4KT2htmyYsRBJv+TOCfSGVD5zis+f16PyAxwHqHDNQv/EZgZ5xeygDg547F0LAS7npHMpH3MpWcivC3erq0NiewlaTNxdJ+rzwVPZPVxdYYU0RRsZEy4LLradGXQIkAbZA63mlW2xFAWLSoa0fihxXh8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by MW3PR11MB4747.namprd11.prod.outlook.com (2603:10b6:303:2f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Wed, 14 May
 2025 05:36:02 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%6]) with mapi id 15.20.8699.022; Wed, 14 May 2025
 05:36:02 +0000
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
Thread-Index: AQHbX+Mv8McLFtrq8UOfwwq5qyE1ubOcuU+AgAZUs/CALEHIgIADEzaQ
Date: Wed, 14 May 2025 05:36:02 +0000
Message-ID: <IA1PR11MB6098C49D2DCFFB50181972C1F491A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
 <TYCPR01MB84375C4CDCA3C55E1AB3BB2B98B72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
 <IA1PR11MB609844BC85412F8CC4315738F4B32@IA1PR11MB6098.namprd11.prod.outlook.com>
 <TYCPR01MB8437933013EF8C39BFA080BE9897A@TYCPR01MB8437.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB8437933013EF8C39BFA080BE9897A@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|MW3PR11MB4747:EE_
x-ms-office365-filtering-correlation-id: c621a796-1f02-4ddc-7d86-08dd92a936d4
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QkxlK3F3QTBhL2JSaFIxaWFNM1hoZFhlZzk5b0w3SFFmR3NHNWhLTzZ5K0dx?=
 =?utf-8?B?RDhDcmtKQzQzUWxTTmduK2Y5RGI0cDJjdjQwOFZIQi9zQjdmZWdMdDJPSjlr?=
 =?utf-8?B?a05pZTNGNHVVeXRybGRPN2pWaGxiSEZIbHBYYWVoZVRnMENpMnlFM1J6di91?=
 =?utf-8?B?dVFWSUkzdEQ5OVhBWXBUZGRzZ2VZcS9SS2ROdHdhSmErTUZqOXhSWHQ3Q2x0?=
 =?utf-8?B?ZjBRV3pvNFZBRE5VZzBoNkdDYkhHNEtPUy9LS2xYY3N6TURWMzZvR2tWWVRz?=
 =?utf-8?B?UHMyNU10VXh2WUlUWFVTQTlSZ2RzbmU5YmdvREVPZURWWU1lZW8wbExlN2w1?=
 =?utf-8?B?RllwRGM1ZktGOHMrSm9OWmIwU3g0UWJGSW9JZEZJNlBvRjlJTW56WlRVZ2Jl?=
 =?utf-8?B?YXRNMGpDNkpTQ0E2RGx4dUZEa29CQWhjZUh0UHlXMmdFQmVMOTBhTzAzUVVT?=
 =?utf-8?B?aS84KzZoYklhYW5LZTV2WmhXS3VPd2xSNkJvQzNEeW1HUTZhT3FpR2tyOUYy?=
 =?utf-8?B?SHRweVErUkhxblp1c3FCd1hBVjNlNExYWkY2UUV2RlVGOUV6SGdVemlWcFYw?=
 =?utf-8?B?SE5rVkk2NGhkWVQyblh0cFdqMjVIa0NMTjl4NjlpSi9xRllSMnhubFR0bTZi?=
 =?utf-8?B?cHViZ2RqU2VZQ29lMmhDZnF2dTNmUTIwK1VHbzBRU2RTM3M3U1ZHRUFyRVJX?=
 =?utf-8?B?TUt3NnZTSjdrR3Z0SkRpZ1dWNGR1eGVmam1QejJ3TVYyY0JPZldEU1QvMElm?=
 =?utf-8?B?ZkU1U0cxTFh5czVjbG5QUjBPdzRwcFpqS0l2ekRndkk3cVpBYVlPNTR4MTd1?=
 =?utf-8?B?RGozS2UrT2N5RWdYY2lOZmJhRWJnUS9zVkJVRUdvVVZCdTZwRGlLTEUwLzh1?=
 =?utf-8?B?Wmc0TnhaYkFoaHJSRTBpWVhrOHE5YXZKUHlNNXh0QktPblVmNHhsTmNBeDUz?=
 =?utf-8?B?NU1JWmRUWkJqSXZEd2g1Q2lRV2lqMGpucVJJSmJzeXpuWUZFOWZOUmxkVDMy?=
 =?utf-8?B?elRpZ2E0d3dubHZBRCtiSnZsKytUYnNzNUpMNzR3VUhuaFkxNXdlbER4Wmpu?=
 =?utf-8?B?KzlNY2E1TnZOWDBpNERORmhJVFFBNnlIZC9qNFcySmNPRmJnVGxyZzdKS1oy?=
 =?utf-8?B?Y0JiZm9YTkhDdWtVa1BTRnpiOURSVlQrRkVXbmFFaW81aXBRZU9IbmtoRGYw?=
 =?utf-8?B?QjUweGdGcUphVDlUTTZPU0lxMlM5bmRLSjlLZklyZnBJdXpwVlZtdUFiNkFz?=
 =?utf-8?B?dTBzamxJU2wvOVM1dDV0d3ZNb3o3WW53bk9VRm10UG54TlRIanAyS2RPb2Zl?=
 =?utf-8?B?RzlNV29DZHBpeERoRU5VMmFXbFo2N0g0Y3NFRkhkMnBMWDFlYU56S0tOV2lw?=
 =?utf-8?B?Q2J6MERVV0F5L0JiREZsL1d5T1VZQUNRcWZCMDlmMUJPbDF2bnY2MTZ5Q0tw?=
 =?utf-8?B?MW9pWWU2UVJTZnhiYkcyZFg4RGd2Yks1OEE1RzBUQWx4YjVNSmF6YUlSRmVa?=
 =?utf-8?B?U280M2d5U0J3dmhKWDhaRmVEZXNSQm5rL3JHYm9EajJTTTExSG5FejV5OGhI?=
 =?utf-8?B?T3owM3BFd0cxOWU0RUduS0pHYlh4T3ppRHZKQmdMSjRSZHAzek0rS2dDc0FO?=
 =?utf-8?B?bWNQeFdyVE5OZWtZditYUjloMkZLV3JPVlhpOVFZaXhuQjY5Z1BhQUFsdDNw?=
 =?utf-8?B?U0cyS1Rnc2hGWlQ2WE0vcTFma2RCb0k5aTRrdU1IUEJ2WEtiZVIzTk5IOU44?=
 =?utf-8?B?TDVGQVFqWFpnODJibWI3S2I2OWs1T0xMNjZsVlFBdkpRSTE5WjIwdHZmOVlI?=
 =?utf-8?B?SjVpOVFGUDdOeCttOEJrZzYxa3JBVE1WNDkvVkp2c24wbEMySnhDWnkwYUVh?=
 =?utf-8?B?ZXhMUHhpamcrMkxVSDJtNk9VVHBuOEZsVlROR21IQzBTejBGaHpJRkQ4ZmlI?=
 =?utf-8?B?aUU0WjMzb3RlV1ZUMkY1SmczWFBZMzdUNWRiU0JPb1kydjMvS2hyWnM2VWpU?=
 =?utf-8?Q?M/PtMb9FCfX0vUt3rDNfyk3isFluC0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGhPcGNlY0p6OUxXQ3E5SUpHQlNwR1MvcEZxU1RSenZvZTNJUCtFSWJvQks5?=
 =?utf-8?B?L0xjTUxhUVRRWW1JU1N0VGhMRlNjOWVFanF2M0tOZDdZS2FoMGVZbmFNWFVl?=
 =?utf-8?B?MjhFWmM3TWVQeW9FSnBrcDMyeHRYejdSZHFybmExWmZpQVBSRmJ6MVFyWnpR?=
 =?utf-8?B?dWRXNDJ4VkUyOS9QSWJtdXJJaFczVElrNkdrZ1V3T3Z1NnduMjhRcS9lUHNL?=
 =?utf-8?B?SkVOUlZuQlcxQXNlMFJ3ekdqcHJYQi85bTdYV1pwZjUvRUk0dHRjc3NINHYy?=
 =?utf-8?B?d1ExdFRrem5kSjZIVjQwVWpOQXRWOS8yZEkvSWQ0QjZseDEvRCtwZVpoMlJu?=
 =?utf-8?B?dm5DNVhLTW5zR3AzcTFqaFkzbWZ0K2VjT0dzblVYSTliZGlxTEYyb0tCUkhv?=
 =?utf-8?B?WSs1WVJpQ2RPT3REUjNNYnh5NVd2WUE3SzdNTThhNHFodlhtNGh5djI3RUIz?=
 =?utf-8?B?Q3FBSUwyanVlVC95eW11ZUxIT2QvTUFkeEMxMzJsUHcraXBZdWM2cUdYWkY2?=
 =?utf-8?B?NkRzT0NEaU9JVlVQMGxWNXNaYURjbVhlWW5yRUNoSDF5Y3gxdk0rN0Rid0ky?=
 =?utf-8?B?OHFDdlpSaytVY1U5Mkt0bEo0d3d0NmxyM0RjeEN3U05MeEhETWVDbkVSZE1D?=
 =?utf-8?B?dTl1dENRRS9DQUVxZjg3bGcvZ1RjTW5BR2FadVZIUE1XbkRQaUR0RHhLakNF?=
 =?utf-8?B?TlRiTko3QlZxcWFnOGV2OTFPU2RuYUFQZmkvOE1Ebk5XdDl3R3ZSY2RkdEcz?=
 =?utf-8?B?clpUcU9GMlFPWU9mTnRyTG9sRTN0b2NIMkEwVWZiOW5OdnhReXRBK0p0VlpM?=
 =?utf-8?B?OU00V3BzSTBZSUM1eVBrNzlkaHpLRDk5VmNjUDdhQm9iaTA1K2plMnRLNUhV?=
 =?utf-8?B?US9yMmtDMUVLV2pwYnN3ekllKy9uR3pKTTBwRUsxbGhFdm9xMmJzVzZJR21C?=
 =?utf-8?B?VElsWXNIdGF4Vnp1VGJmZzU1bElxMi94NnlxRXY4ME44bktwRjhTa3pEeFZY?=
 =?utf-8?B?L3pDdXBya3Foa3dqL1QwNVdsOW14NWhwVjNuSDI3YlM4ZUpFWllHaGVMbzlv?=
 =?utf-8?B?bDZZaTlmQStzNzJCTkFHZkZnclI0SGQ2VzBlcCtQYldramIrYWluZktxNzlp?=
 =?utf-8?B?cHhqU3FrUkk2SnRjeGVYK1ZzdkluQ0JLY3FwYkRGcGFlamxBRXN0TjNnZGlL?=
 =?utf-8?B?SjBoazBEdHdWM1NoQ0FJUDNrMk9QSm9hZFZ6VTJoQkFobld1dVJOMC9NQ3Fm?=
 =?utf-8?B?dmpYYWxNL2pkOWJEK1hwZ0pYMEphenlldklnS2pQL01UeG9BMHN6dzFJSWtP?=
 =?utf-8?B?cTJkQ1NnZkp0U2F0Wjh1U2k0SllqOEtac2lpLzZFRm1zVEE4bkRnQlZ3elRs?=
 =?utf-8?B?TURPeFo0UmZrUVRYaVhIS1F6OVNYeG9oU1k2elY4OE1KWFNxNkZLRE5UWFNo?=
 =?utf-8?B?VnNnUk1CcThlS1I1Qzd1LzVBTDhDcFFwSnBiWndTNGh2enVlWC84RWp0Ullo?=
 =?utf-8?B?Qy84L2tlRThQa09YcVJXcTJJZ2h2Q1RnWjBsNXBJYmYrcjVSMkluSG9sUDA5?=
 =?utf-8?B?a2srSGtYZjAwSFN0QkFHb0pOc3E1bDgybHNRZUQ3SUNSb1RwdlpNd1A1TEdJ?=
 =?utf-8?B?Ynl0dTdRUWRkSmovbGR4c1Rrci9xNmJyZTlDTDMvYktVYWRnYXk3eXRpTEgw?=
 =?utf-8?B?YklIcXFYM0xiOUt4T0NyWFFHU3BhN1MwU3N0VTNTcWF6ZEN4K0RmVUFSc1Zu?=
 =?utf-8?B?UkVYS0NJZDlPMmhnQ0M2YnBRcFVpK21nY2RmWC9UcmtlQTFDbFEvLzA5cGVL?=
 =?utf-8?B?YkNBbldQd0RnV0Z0b3ovVlJIc2NJeTNTcklISXNrMVkrMThLaW9leHlYRWFo?=
 =?utf-8?B?Tml2NFdSZTFZMGRXZnlNM0xrQ3BGNi95OFhmYVNpZGJnYWV6QXllOTNOVklQ?=
 =?utf-8?B?Q0FKejZTQ1JPS0psalhZSy9KSkpMODRUL0k3a0J0cHgvMFg1ZHU0VkYvZE1a?=
 =?utf-8?B?RHlaSldZdTN0WC95MzNJbWo0bm9lQ0U4MjZlNTFPRldxakRTcm1zdVRLSkVu?=
 =?utf-8?B?bkQyUVBkVDJNczdnQitmOGZyaWZGMmE5c1gvZGdxSXg5TVdicDZvMUxDVUpC?=
 =?utf-8?Q?zXWM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c621a796-1f02-4ddc-7d86-08dd92a936d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2025 05:36:02.3077
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SlcYZMcYlWIqCX6XSyNt6Is0Tu4H2v5hIfb6U29SsG0xa09D37OzMaky8TOY7zwJZ0wn5vOvY6XnS9v69wSckQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4747
X-OriginatorOrg: intel.com

SGksIFNoZW5neXUsDQoNClRoYW5rcyBmb3IgeW91ciBlbWFpbCENCg0KWWVzLCBJIGNoZWNrZWQg
dGhhdCBpbnRlcm5hbGx5LiBTbyBmYXIsIElQVFMgaXMgc3RpbGwgcHJpdmF0ZSwgYW5kIGRvZXNu
J3QgaGF2ZSBwdWJsaXNoIHBsYW4uDQpTbyBJIGNhbm5vdCBwdWJsaXNoIElQVFMgcmVsYXRlZCBk
cml2ZXJzLg0KU29ycnkuDQoNCkJlc3QgUmVnYXJkcywNCkV2ZW4gWHUNCg0KPiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRsb29rLmNv
bT4NCj4gU2VudDogTW9uZGF5LCBNYXkgMTIsIDIwMjUgMjozNCBQTQ0KPiBUbzogWHUsIEV2ZW4g
PGV2ZW4ueHVAaW50ZWwuY29tPjsgamlrb3NAa2VybmVsLm9yZzsgYmVudGlzc0BrZXJuZWwub3Jn
Ow0KPiBjb3JiZXRAbHduLm5ldDsgYmFnYXNkb3RtZUBnbWFpbC5jb207IEFhcm9uLCBNYQ0KPiA8
YWFyb24ubWFAY2Fub25pY2FsLmNvbT47IHJkdW5sYXBAaW5mcmFkZWFkLm9yZzsgbXBlYXJzb24t
DQo+IGxlbm92b0BzcXVlYmIuY2ENCj4gQ2M6IHdpYWduMjMzQG91dGxvb2suY29tOyBsaW51eC1p
bnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1kb2NAdmdlci5rZXJuZWwub3JnOyBZdWUsIExpbmcNCj4gPGxpbmcueXVlQGludGVsLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMC8yMl0gQWRkIEludGVsIFRvdWNoIEhvc3Qg
Q29udHJvbGxlciBkcml2ZXJzDQo+IA0KPiBIZWxsbyBYdSwNCj4gDQo+IEFueSB1cGRhdGVzIG9u
IHRoaXM/IEl0J3MgYmVlbiBhIG1vbnRoIHNpbmNlIHlvdXIgbGFzdCByZXBseS4NCj4gDQo+IEJl
c3QgcmVnYXJkcywNCj4gU2hlbmd5dQ0KPiANCj4g5ZyoIDIwMjUvNC8xNCAxMTowMiwgWHUsIEV2
ZW4g5YaZ6YGTOg0KPiA+IEhpLCBTaGVuZ3l1LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB5b3VyIGZl
ZWRiYWNrIQ0KPiA+DQo+ID4gSW4gZmFjdCwgd2UgaGF2ZSBJUFRTIG1vZGUgaW50ZXJuYWwgZHJh
ZnQgZHJpdmVyLiBJdCB3b3JrcyBmaW5lIGFuZCBwYXNzZXMgYmFzaWMNCj4gdmFsaWRhdGlvbi4N
Cj4gPiBCdXQgSSB3YXMgdG9sZCB0aGF0IElQVFMgRURTIChFeHRlcm5hbC1pbnRlcmZhY2UgRGVm
aW5pdGlvbiBTcGVjKSBpcyBkZXNpZ25lZCBhcyBhDQo+IHByaXZhdGUgc3BlYywgbm90IGJlIHB1
Ymxpc2hlZCB5ZXQuDQo+ID4gVGhpcyBJUFRTIEVEUyBpcyBvbmx5IHNoYXJlZCB3aXRoIE9FTXMg
dW5kZXIgTkRBLg0KPiA+DQo+ID4gU28sIGZpcnN0LCBmcm9tIG15IHBlcnNwZWN0aXZlLCBJIG5l
ZWQgdG8gY29uc3VsdCB0aGUgY29tcGFueSdzIGxlZ2FsIGRlcGFydG1lbnQNCj4gYW5kIGRpc2N1
c3Mgd2l0aCB0aGVtIGhvdyB0byBwcm9jZWVkIHdpdGggdGhpcyBjYXNlLg0KPiA+DQo+ID4gV2ls
bCBjb21lIGJhY2sgdG8geW91IG9uY2UgSSBnZXQgYW55IHVwZGF0ZSBvbiB0aGlzLg0KPiA+DQo+
ID4gVGhhbmtzIQ0KPiA+DQo+ID4gQmVzdCBSZWdhcmRzLA0KPiA+IEV2ZW4gWHUNCj4gPg0KPiA+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBTaGVuZ3l1IFF1IDx3aWFn
bjIzM0BvdXRsb29rLmNvbT4NCj4gPj4gU2VudDogVGh1cnNkYXksIEFwcmlsIDEwLCAyMDI1IDEw
OjAyIEFNDQo+ID4+IFRvOiBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBqaWtvc0BrZXJu
ZWwub3JnOw0KPiA+PiBiZW50aXNzQGtlcm5lbC5vcmc7IGNvcmJldEBsd24ubmV0OyBiYWdhc2Rv
dG1lQGdtYWlsLmNvbTsgQWFyb24sIE1hDQo+ID4+IDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPjsg
cmR1bmxhcEBpbmZyYWRlYWQub3JnOyBtcGVhcnNvbi0NCj4gPj4gbGVub3ZvQHNxdWViYi5jYQ0K
PiA+PiBDYzogd2lhZ24yMzNAb3V0bG9vay5jb207IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9y
ZzsgbGludXgtDQo+ID4+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtl
cm5lbC5vcmcNCj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMC8yMl0gQWRkIEludGVsIFRv
dWNoIEhvc3QgQ29udHJvbGxlciBkcml2ZXJzDQo+ID4+DQo+ID4+IEhlbGxvLA0KPiA+Pg0KPiA+
PiBDYW4geW91IGFsc28gYWRkIHByZXZpb3VzIHZlcnNpb24gc3VwcG9ydCBmb3IgdGhlIFRIQyBJ
UD8NCj4gPj4gbGludXgtc3VyZmFjZSBndXlzIGRpZCBhIGdvb2Qgam9iLCBidXQgdGhleSBhcmUg
bm90IGZ1bGwtdGltZSB3b3JraW5nDQo+ID4+IG9uIHRoaXMsIGFuZCBtYWlubGluaW5nIHRoZWly
IGRvd25zdHJlYW0gZHJpdmVyIHdvdWxkIHRha2UgYSBsb25nIHRpbWUuDQo+ID4+DQo+ID4+IEJl
c3QgcmVnYXJkcywNCj4gPj4gU2hlbmd5dQ0KPiA+Pg0KPiA+PiDlnKggMjAyNS8xLzYgMTA6MzEs
IEV2ZW4gWHUg5YaZ6YGTOg0KPiA+Pj4gSW50ZWwgVG91Y2ggSG9zdCBDb250cm9sbGVyIChUSEMp
IGlzIGEgbmV3IGhpZ2ggcGVyZm9ybWFuY2UgaW5wdXQgSVANCj4gPj4+IHdoaWNoIGNhbiBiZW5l
Zml0IEhJRCBkZXZpY2UncyBkYXRhIHRyYW5zYWN0aW9uLCBzdWNoIGFzIHRvdWNoDQo+ID4+PiBz
Y3JlZW4sIHRvdWNoIHBhZCwgc3R5bHVzLg0KPiA+Pj4NCj4gPj4+IFRIQyBJUCBub3cgZXZvbHVh
dGVzIHRvIFY0LCBpdCBjYW4gc3VwcG9ydCAzIGRpZmZlcmVudCBtb2RlczogSVBUUywNCj4gPj4+
IEhJRFNQSSBhbmQgSElESTJDLiBIZXJlIGFyZSB1cGdyYWRlIGhpc3Rvcnk6DQo+ID4+PiAtIFRI
QyB2MSwgZm9yIFRHTC9MS0YsIHN1cHBvcnRzIGludGVsIHByaXZhdGUgSVBUUyAoSW50ZWwgUHJl
Y2lzZSBUb3VjaA0KPiA+Pj4gICAgIGFuZCBTdHlsdXMpIHByb3RvY29sICggSVBUUyBtb2RlKQ0K
PiA+Pj4gLSBUSEMgdjIsIGZvciBBREwsIGFkZHMgaW5kdXN0cmlhbCBzdGFuZGFyZCBISUQgb3Zl
ciBTUEkgcHJvdG9jb2wNCj4gPj4+ICAgICBzdXBwb3J0IChISURTUEkgbW9kZSkNCj4gPj4+IC0g
VEhDIHYzLCBmb3IgTVRMLCBlbmhhbmNlcyBISUQgb3ZlciBTUEkgbW9kZQ0KPiA+Pj4gLSBUSEMg
djQsIGZvciBMTkwsIGFkZHMgaW51ZHN0cmlhbCBzdGFuZGFyZCBISUQgb3ZlciBJMkMgcHJvdG9j
b2wNCj4gPj4+ICAgICBzdXBwb3J0IChISURJMkMgbW9kZSkNCj4gPj4+DQo+ID4+PiBMaW51eCBT
dXJmYWNlIGNvbW11bml0eSAoaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXN1cmZhY2UpIGFscmVh
ZHkNCj4gPj4+IGltcGxlbWVudGVkIElQVFMgbW9kZS4gVGhlc2UgcGF0Y2ggc2VyaWVzIHByb3Zp
ZGVzIFRIQyBISURTUEkgbW9kZQ0KPiA+Pj4gYW5kIFRIQyBISURJMkMgbW9kZSBzdXBwb3J0IG9u
IExpbnV4Lg0KPiA+Pj4NCj4gPj4+IFRoZXNlIHBhdGNoIHNlcmllcyBpbmNsdWRlczoNCj4gPj4+
IDEuIERvY3VtZW50IGZvciBUSEMgaGFyZHdhcmUgYW5kIHNvZnR3YXJlIGludHJvZHVjdGlvbi4N
Cj4gPj4+IDIuIEludGVsIFRIQyBIYXJkd2FyZSBsYXllciBkcml2ZXIgd2hpY2ggcHJvdmlkZXMg
Y29udHJvbCBpbnRlcmZhY2VzDQo+ID4+PiAgICAgIGZvciBwcm90b2NvbCBsYXllci4NCj4gPj4+
IDMuIEludGVsIFF1aWNrU1BJIChSKSBkcml2ZXIgd29ya2luZyBhcyBhIEhJRFNQSSBkZXZpY2Ug
ZHJpdmVyIHdoaWNoDQo+ID4+PiAgICAgIGltcGxlbWVudHMgSElEIG92ZXIgU1BJIHByb3RvY29s
IGFuZCBmbG93Lg0KPiA+Pj4gNC4gSW50ZWwgUXVpY2tJMkMgKFIpIGRyaXZlciB3b3JraW5nIGFz
IGEgSElESTJDIGRldmljZSBkcml2ZXIgd2hpY2gNCj4gPj4+ICAgICAgaW1wbGVtZW50cyBISUQg
b3ZlciBJMkMgcHJvdG9jb2wgYW5kIGZsb3cuDQo+ID4+Pg0KPiA+Pj4gQ2hhbmdlIGxvZ3M6DQo+
ID4+PiB2NDoNCj4gPj4+IC0gTWlub3IgZml4IGluIGRvY3VtZW50cw0KPiA+Pj4gLSBUeXBvIGZp
eGVzIGluIHBhdGNoIDYgJiBwYXRjaCA3IGNvbW1pdCBkZXNjcmlwdGlvbnMNCj4gPj4+DQo+ID4+
PiB2MzoNCj4gPj4+IC0gQ2hhbmdlIHRhYmxlcyBpbiBkb2N1bWVudHMgZnJvbSBsaXRlcmFsIGJs
b2NrIHRvIHRhYmxlIGZvcm1hdA0KPiA+Pj4gLSBDaGFuZ2Ugc3ltYm9sIG5hbWVzcGFjZSB0byBz
dHJpbmcgbGl0ZXJhbCBhY2NvcmRpbmcgdG8gcGF0Y2g6DQo+ID4+PiAgICAgY29tbWl0IGNkZDMw
ZWJiMWI5ZiAoIm1vZHVsZTogQ29udmVydCBzeW1ib2wgbmFtZXNwYWNlIHRvIHN0cmluZw0KPiA+
Pj4gbGl0ZXJhbCIpDQo+ID4+PiAtIFJlZmluZSBLY29uZmlnIGRlc2NyaXB0aW9uDQo+ID4+PiAt
IEVuaGFuY2UgUXVpY2tzcGkgYW5kIFF1aWNraTJjIGRyaXZlciBieSBjbGVhcmluZyBUSEMgaGFy
ZHdhcmUgaW50ZXJuYWwNCj4gPj4+ICAgICBzdGF0ZSBiZWZvcmUgZG9pbmcgaW5pdGlhbGl6YXRp
b24gdG8gYXZvaWQgQklPUyBpbXBhY3RzLg0KPiA+Pj4gLSBBIGZpeCBpbiBRdWlja2kyYyBkcml2
ZXIgd2hlbiBkb2VzIHNldF9yZXBvcnQNCj4gPj4+DQo+ID4+PiB2MjoNCj4gPj4+IC0gRml4IGRv
Y3VtZW50IGZvcm1hdCBpc3N1ZXMNCj4gPj4+IC0gQWRkIFRIQyBkZXZpY2UgSURzIGZvciBJbnRl
bCBQYW50aGVyIExha2UgKFBUTCkgcGxhdGZvcm0NCj4gPj4+DQo+ID4+PiBFdmVuIFh1ICgxMyk6
DQo+ID4+PiAgICAgSElEOiBUSEM6IEFkZCBkb2N1bWVudGF0aW9uDQo+ID4+PiAgICAgSElEOiBp
bnRlbC10aGMtaGlkOiBpbnRlbC10aGM6IEFkZCBUSEMgRE1BIGludGVyZmFjZXMNCj4gPj4+ICAg
ICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIFRIQyBJMkMgY29uZmlnIGludGVy
ZmFjZXMNCj4gPj4+ICAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBBZGQg
VEhDIFF1aWNrU1BJIGRyaXZlciBoaWQgbGF5ZXINCj4gPj4+ICAgICBISUQ6IGludGVsLXRoYy1o
aWQ6IGludGVsLXF1aWNrc3BpOiBBZGQgVEhDIFF1aWNrU1BJIEFDUEkgaW50ZXJmYWNlcw0KPiA+
Pj4gICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tzcGk6IEFkZCBISURTUEkgcHJv
dG9jb2wgaW1wbGVtZW50YXRpb24NCj4gPj4+ICAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVs
LXF1aWNrc3BpOiBBZGQgUE0gaW1wbGVtZW50YXRpb24NCj4gPj4+ICAgICBISUQ6IGludGVsLXRo
Yy1oaWQ6IGludGVsLXF1aWNraTJjOiBBZGQgVEhDIFF1aWNrSTJDIGRyaXZlciBza2VsZXRvbg0K
PiA+Pj4gICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tpMmM6IEFkZCBUSEMgUXVp
Y2tJMkMgZHJpdmVyIGhpZCBsYXllcg0KPiA+Pj4gICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50
ZWwtcXVpY2tpMmM6IEFkZCBUSEMgUXVpY2tJMkMgQUNQSSBpbnRlcmZhY2VzDQo+ID4+PiAgICAg
SElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC1xdWlja2kyYzogQWRkIEhJREkyQyBwcm90b2NvbCBp
bXBsZW1lbnRhdGlvbg0KPiA+Pj4gICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tp
MmM6IENvbXBsZXRlIFRIQyBRdWlja0kyQyBkcml2ZXINCj4gPj4+ICAgICBISUQ6IGludGVsLXRo
Yy1oaWQ6IGludGVsLXF1aWNraTJjOiBBZGQgUE0gaW1wbGVtZW50YXRpb24NCj4gPj4+DQo+ID4+
PiBYaW5wZW5nIFN1biAoOSk6DQo+ID4+PiAgICAgSElEOiBpbnRlbC10aGMtaGlkOiBBZGQgYmFz
aWMgVEhDIGRyaXZlciBza2VsZXRvbg0KPiA+Pj4gICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50
ZWwtdGhjOiBBZGQgVEhDIHJlZ2lzdGVycyBkZWZpbml0aW9uDQo+ID4+PiAgICAgSElEOiBpbnRl
bC10aGMtaGlkOiBpbnRlbC10aGM6IEFkZCBUSEMgUElPIG9wZXJhdGlvbiBBUElzDQo+ID4+PiAg
ICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10aGM6IEFkZCBBUElzIGZvciBpbnRlcnJ1cHQN
Cj4gPj4+ICAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXRoYzogQWRkIFRIQyBMVFIgaW50
ZXJmYWNlcw0KPiA+Pj4gICAgIEhJRDogaW50ZWwtdGhjLWhpZDogaW50ZWwtdGhjOiBBZGQgVEhD
IGludGVycnVwdCBoYW5kbGVyDQo+ID4+PiAgICAgSElEOiBpbnRlbC10aGMtaGlkOiBpbnRlbC10
aGM6IEFkZCBUSEMgU1BJIGNvbmZpZyBpbnRlcmZhY2VzDQo+ID4+PiAgICAgSElEOiBpbnRlbC10
aGMtaGlkOiBpbnRlbC1xdWlja3NwaTogQWRkIFRIQyBRdWlja1NQSSBkcml2ZXIgc2tlbGV0b24N
Cj4gPj4+ICAgICBISUQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNrc3BpOiBDb21wbGV0ZSBU
SEMgUXVpY2tTUEkgZHJpdmVyDQo+ID4+Pg0KPiA+Pj4gICAgRG9jdW1lbnRhdGlvbi9oaWQvaW5k
ZXgucnN0ICAgICAgICAgICAgICAgICAgIHwgICAgMSArDQo+ID4+PiAgICBEb2N1bWVudGF0aW9u
L2hpZC9pbnRlbC10aGMtaGlkLnJzdCAgICAgICAgICAgfCAgNTY4ICsrKysrKw0KPiA+Pj4gICAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgNiArDQo+
ID4+PiAgICBkcml2ZXJzL2hpZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
ICAyICsNCj4gPj4+ICAgIGRyaXZlcnMvaGlkL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgIDIgKw0KPiA+Pj4gICAgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmln
ICAgICAgICAgICAgIHwgICA0MiArDQo+ID4+PiAgICBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlk
L01ha2VmaWxlICAgICAgICAgICAgfCAgIDIyICsNCj4gPj4+ICAgIC4uLi9pbnRlbC1xdWlja2ky
Yy9wY2ktcXVpY2tpMmMuYyAgICAgICAgICAgICB8ICA5NjYgKysrKysrKysrKw0KPiA+Pj4gICAg
Li4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oICAgICAgICAgICAgIHwgIDE4NiArKw0K
PiA+Pj4gICAgLi4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWhpZC5jICAgICAgICAgICAgIHwg
IDE2NiArKw0KPiA+Pj4gICAgLi4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWhpZC5oICAgICAg
ICAgICAgIHwgICAxNCArDQo+ID4+PiAgICAuLi4vaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtcHJv
dG9jb2wuYyAgICAgICAgfCAgMjI0ICsrKw0KPiA+Pj4gICAgLi4uL2ludGVsLXF1aWNraTJjL3F1
aWNraTJjLXByb3RvY29sLmggICAgICAgIHwgICAyMCArDQo+ID4+PiAgICAuLi4vaW50ZWwtcXVp
Y2tzcGkvcGNpLXF1aWNrc3BpLmMgICAgICAgICAgICAgfCAgOTg3ICsrKysrKysrKysrDQo+ID4+
PiAgICAuLi4vaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktZGV2LmggICAgICAgICAgICAgfCAgMTcy
ICsrDQo+ID4+PiAgICAuLi4vaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktaGlkLmMgICAgICAgICAg
ICAgfCAgMTY1ICsrDQo+ID4+PiAgICAuLi4vaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktaGlkLmgg
ICAgICAgICAgICAgfCAgIDE0ICsNCj4gPj4+ICAgIC4uLi9pbnRlbC1xdWlja3NwaS9xdWlja3Nw
aS1wcm90b2NvbC5jICAgICAgICB8ICA0MTQgKysrKysNCj4gPj4+ICAgIC4uLi9pbnRlbC1xdWlj
a3NwaS9xdWlja3NwaS1wcm90b2NvbC5oICAgICAgICB8ICAgMjUgKw0KPiA+Pj4gICAgLi4uL2lu
dGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuYyAgIHwgMTU3OCArKysrKysrKysr
KysrKysrKw0KPiA+Pj4gICAgLi4uL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1k
ZXYuaCAgIHwgIDExNiArKw0KPiA+Pj4gICAgLi4uL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2lu
dGVsLXRoYy1kbWEuYyAgIHwgIDk2OSArKysrKysrKysrDQo+ID4+PiAgICAuLi4vaW50ZWwtdGhj
LWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWRtYS5oICAgfCAgMTQ2ICsrDQo+ID4+PiAgICAuLi4v
aW50ZWwtdGhjLWhpZC9pbnRlbC10aGMvaW50ZWwtdGhjLWh3LmggICAgfCAgODgxICsrKysrKysr
Kw0KPiA+Pj4gICAgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1pMmMuaCAgICAgICAgICAgICAgICAg
IHwgIDExNyArKw0KPiA+Pj4gICAgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1zcGkuaCAgICAgICAg
ICAgICAgICAgIHwgIDE1NSArKw0KPiA+Pj4gICAgMjYgZmlsZXMgY2hhbmdlZCwgNzk1OCBpbnNl
cnRpb25zKCspDQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9oaWQv
aW50ZWwtdGhjLWhpZC5yc3QNCj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hp
ZC9pbnRlbC10aGMtaGlkL0tjb25maWcNCj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2hpZC9pbnRlbC10aGMtaGlkL01ha2VmaWxlDQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMu
Yw0KPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQv
aW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtZGV2LmgNCj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWhpZC5j
DQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9p
bnRlbC1xdWlja2kyYy9xdWlja2kyYy1oaWQuaA0KPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0
DQo+ID4+PiBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJj
LQ0KPiA+PiBwcm90b2NvbC5jDQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPj4+IGRy
aXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtDQo+ID4+IHBy
b3RvY29sLmgNCj4gPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10
aGMtaGlkL2ludGVsLXF1aWNrc3BpL3BjaS1xdWlja3NwaS5jDQo+ID4+PiAgICBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9xdWlja3Nw
aS1kZXYuaA0KPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRo
Yy1oaWQvaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktaGlkLmMNCj4gPj4+ICAgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNrc3BpL3F1aWNrc3Bp
LWhpZC5oDQo+ID4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4gPj4+IGRyaXZlcnMvaGlkL2lu
dGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tzcGkvcXVpY2tzcGktDQo+ID4+IHByb3RvY29sLmMNCj4g
Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiA+Pj4gZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhp
ZC9pbnRlbC1xdWlja3NwaS9xdWlja3NwaS0NCj4gPj4gcHJvdG9jb2wuaA0KPiA+Pj4gICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVs
LXRoYy1kZXYuYw0KPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVs
LXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuaA0KPiA+Pj4gICAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kbWEu
Yw0KPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQv
aW50ZWwtdGhjL2ludGVsLXRoYy1kbWEuaA0KPiA+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1ody5oDQo+ID4+PiAg
ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51eC9oaWQtb3Zlci1pMmMuaA0KPiA+Pj4g
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGludXgvaGlkLW92ZXItc3BpLmgNCj4gPj4+
DQo+ID4NCg0K

