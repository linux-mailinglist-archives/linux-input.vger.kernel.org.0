Return-Path: <linux-input+bounces-14783-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F368B7D76B
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 14:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF4047A1435
	for <lists+linux-input@lfdr.de>; Wed, 17 Sep 2025 01:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E99F139D1B;
	Wed, 17 Sep 2025 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ADN1b+pN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B558F5661;
	Wed, 17 Sep 2025 01:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758073418; cv=fail; b=k+lQOYlTTf+4X+d+TGA1XcALNYI129XafrzJe34Ygz26Ok/YEOnjYr5qOU57iFVwXzyRrz5ue/esAcNqod0qBcu02fE/yVMwRYbfnqlCdoNVw78K2q0hp5k3Vw9sjr9m0M9mP33JB4GBT/VFCtEcmaHRZ2kIsvcm83NYUHtmQfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758073418; c=relaxed/simple;
	bh=q+nDtA6dPQ25YbcjfnjCHaQ9ix4qo3rV5icIz4I4Yfs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tvlNZInf5rTAtfv1i8jcX7sN+1AnE0zBEiPeI/dcvU3PQeUwjD1Y4LnT5pGpvt7VI3/exNSe0z9hZvLUdWxyhSygwovtnHYy61loT4EIIo6TlP3fLURhdMWc+RuvQSQN0TdP6wdK8DfkEEZNYPcwuN8xd0ma7+o2JV+VAt3Qm0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ADN1b+pN; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758073417; x=1789609417;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q+nDtA6dPQ25YbcjfnjCHaQ9ix4qo3rV5icIz4I4Yfs=;
  b=ADN1b+pNyqtHFslAO9RarPaBKgwUwaNSVoZw4CFnvD/ZAsfTEYoJYN9g
   iZ7IcZVzwXL/yeSBc/u5B8IshkqCuQFRDKiOsor/Z0oJZBY6SM/lZm6qG
   QrxpvLg6i8tQPVC+okStit8u3z4fWzMZjlb/AY5bUcE4ZqDOV/GfU7A97
   /2BjgsIVliC5SNHXpTgb/abbFU/QC95AvcJWuMhT4GpbUvg+s9Q0bkNH3
   Xxl9WuFEkM6UeKKfWGlKcgUXT3aH+kcygMmAJceajfeJFgl0cKojBLBgj
   1+7Iwrvr6H9JRvi1k17uDL0K1rvkkQ0UaaUzVAYsF36pcjtBzVSLN2SLK
   w==;
X-CSE-ConnectionGUID: SaT54oOqTVyjM19qX4OFHA==
X-CSE-MsgGUID: 0BT1B/3jSv6othBtIkEceA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="85809144"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="85809144"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:43:36 -0700
X-CSE-ConnectionGUID: 6oQqMSngRp2W5BIUeDd96A==
X-CSE-MsgGUID: 8wzzyg92Q+eMYgYu4pQWcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="179109865"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 18:43:36 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 18:43:34 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 18:43:34 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 18:43:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nt0dIA3Daq0J08AMyVM0XVNi3OMrKoLmq/UA74S2eBITmc0ZxYTLeoOCOcbKI36xYO3dq9Pe7zUcHdO/QTuKYt3Z0PVqjsmHyNj0gW2xP46z2AyNS+AhkPQh37AHvMV1333B+rmjKMaFa9FhAdXp6adMfOPMZsJyUpo5R8k/xHgiERJW0k8DW0u+qrtakV+5I1/+wgvlhlHmBthPtFzpYUJB6uHa9Zi1r4BWGxN0Djc5kbwlqKkQDXS1ku0/JVHJsxvRbg9VMOKrBhjmrmqS3P7S3+KC9G6hK0Tt9J8GHFynBnceXnkqiyaxZt9tiF7t9aXmsEbo9BN1ojBdt5s49Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+nDtA6dPQ25YbcjfnjCHaQ9ix4qo3rV5icIz4I4Yfs=;
 b=bq3BRRlwEZfcn1q4/ao/xWOweT1WVF+tibnVdYzGfWLtLUcJyT+94tl0ruRpAUsCCgGPlOZrtO2NoIN6N2yDNijjF086d7gEiO5aSQcAjHElNBaq4sahquxYs4GcVVQkseS9MIKHix1nyPPmveoqAq/86uO5FkF0mKvJTEGHtnGiWG5/tYl9MyWMa84Ifr7HKi18npu6m+FGMmJtqyMP+7EIyO992wwvi7+rmOGniZHCcSz7hIghCvOoPadcw1gJhPYvMhdrNVKZxXrY3/PFVFkAd1QLHh4C/KaHq3Wjxk4fSHBBjKURNKVLb9hQHTYjV82wPBFoBCFOzVFp9uP4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) by
 SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Wed, 17 Sep
 2025 01:43:31 +0000
Received: from DS0PR11MB7829.namprd11.prod.outlook.com
 ([fe80::7ef8:88e9:9862:d4bc]) by DS0PR11MB7829.namprd11.prod.outlook.com
 ([fe80::7ef8:88e9:9862:d4bc%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 01:43:31 +0000
From: "Sun, Xinpeng" <xinpeng.sun@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Xu, Even"
	<even.xu@intel.com>, "Zhang, Rui1" <rui1.zhang@intel.com>
Subject: RE: [PATCH v3] hid: intel-thc-hid: intel-quicki2c: support ACPI
 config for advanced features
Thread-Topic: [PATCH v3] hid: intel-thc-hid: intel-quicki2c: support ACPI
 config for advanced features
Thread-Index: AQHcJrWg5UZhIUmV/0y8yx4Pt99oV7SWdn8AgAAkumA=
Date: Wed, 17 Sep 2025 01:43:31 +0000
Message-ID: <DS0PR11MB7829F99863149A2E6965E51AEA17A@DS0PR11MB7829.namprd11.prod.outlook.com>
References: <20250916025721.3375164-1-xinpeng.sun@intel.com>
 <6e052f056904651aae3cdb2ea50ca54c252cb4a2.camel@linux.intel.com>
In-Reply-To: <6e052f056904651aae3cdb2ea50ca54c252cb4a2.camel@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7829:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: c50c0535-ce8f-4ca7-3a0f-08ddf58b9b8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?YXdxb2syY0ZCMW1iNzA0d2hGRGUvOXh5S04yMDM2T3lsSlZ5RDN5Q3YxT3RL?=
 =?utf-8?B?V0pYQlVVdjQvUlB5ZDZaaUttVWJ2azNEU05rdEtvODBSV3RML1JLc1ZyNUhH?=
 =?utf-8?B?aThXVFhiVHlVSUk4TzFEUDB3UHNRSGRqZ0NDbWpQU3JPUVY0STFna0Q0T2Vh?=
 =?utf-8?B?K1RxbnlQc0NLbjNRYlpDNXpNZi9Wc2xDUGdRckJhYVo0VlhKMjlwd1lWd2Fo?=
 =?utf-8?B?NkJLRzluSDhFWTFFNXA1aXNORVR4Y3BNZFcyaGNLU04xMnh0NFhhaWlMVFdD?=
 =?utf-8?B?Z3dQTXpDS1MrWFB0cGZmN1oyRnk4QmlZMEE2TGViR3NzbHUrWE95R2gyNFda?=
 =?utf-8?B?L0p4WEFieEZRQ1FyMDd6NjNnejJOWVBQVzdSYWEwNUVvNHRMbzNVanFFMDFq?=
 =?utf-8?B?eUZMbVhtT29wejh5SFhjY3VVLyt4dGtFQU1QbnArbEZMNUI3T3JEeDR4R3Jv?=
 =?utf-8?B?b0pUdlIwdm5wZGxuVWE0Z2pUYVBVZW9zNG1PeTFQMjFteHZ1V1hPK0tPUWVh?=
 =?utf-8?B?dk8xSEZMcjRtZjIzSWo0cnYyU000b1FFRlNsSXNZZ1VhY0ZhVGlsbzFGeXE0?=
 =?utf-8?B?ZFh6Vi9HRDRQUlVmc1QzVTBONm11cnRCUkt5cmcvZHJPdm5XMDJCVnNpVjFL?=
 =?utf-8?B?ZWFrN3dFa2pFTHl2eWY0aldRL0xNNm1NaVpaMlRXSHluNkIwTG5hZmJWWlVx?=
 =?utf-8?B?ZlJrb20xaGtJRyt4OTRqWEwvWHkwSkpXdGtNUHZKMzVWb2dIZlZvTVRETmZj?=
 =?utf-8?B?SGxaN1E2eE44SXZhSDNwRW93bnlHVHpWOG1NZVNSVTRIaGI2c1ZHV3l5RHl6?=
 =?utf-8?B?RkhIb1B5U3dubVovaGJhS242Tnp6U2pWbWY3T0NIR3Ntc01KMXRaVzdjSnoy?=
 =?utf-8?B?R0dwMkEzVUR2bklwOGp5NFN4UW5Ia1hXY09BZDJ6d1JKV1dhRFBLb0hLbmFr?=
 =?utf-8?B?U2NhcnBGQ3BHeVdXVjB6ckFVdE8rQUtIVzlCS0I4NVkvWjlZSWsxNlp1bkFt?=
 =?utf-8?B?Z0ZCWTN2VE9OOFlOQktOb0E3cm03dU9rcEgwYWU4YXhwQzdWZEZJMm5kbVVw?=
 =?utf-8?B?T3QxZ1lGem1BdDUxekZYNTBrYWo1a0laN1BnUDkvRm1PTzNZQnZhSGhCV0Jk?=
 =?utf-8?B?b2crNTBaMDFiYU1hOUlZVTRYS29SKzBPdDVHblN1SDdKVk9ybERybXVwQXBt?=
 =?utf-8?B?SE5CeXhFWVpmeitUMWM1OXVCb0FnL2o0QmY3bjZUdjhqTjFWZmJjWG0zVlFo?=
 =?utf-8?B?dm1sdTVQUEhqQjdyNk5LNkJuNXFrdkhRMlJpeldYeDM0ZTJYMElISVV3SWJl?=
 =?utf-8?B?WElvVWpxdSthWG1iS1pUYXlZQzhXRlNVRStUMHBUTWtDUzNTc3dqK3VZK1Mz?=
 =?utf-8?B?QXR0eG9yUkt5ZU5YUVFHR0FVWGx4OWorVG5sUGl0VFlPNDFvTFFjYjQwOWsx?=
 =?utf-8?B?R3FuVDJwUTRFU2p5MGRkYjlzazJBRTZ1c1BEODd4dWhGVndPUmQ1VjRFSnBJ?=
 =?utf-8?B?UzN6VnhNNmVYZHVCdlZta29mUEF5K01MdFpJZmh4a1R4TFo5VjNMdXdQTXdh?=
 =?utf-8?B?UVVsajY3clpmUkZ5QU04S3FCcjNYUXprMGJ5RENyZEJNT0dUM3hrV1dqekZ6?=
 =?utf-8?B?Uk5ZaUNIOHNGWDI1Qk51ZGxlSEo3dEJVYnA5SkFqaXhtSHZzd0pkeHIwb1Jm?=
 =?utf-8?B?NmEzRTdiQjJNZEJzY2JvZjByOXUzWGs5WnF0eU9kb0hsVi9iRWZPNjVuNkZB?=
 =?utf-8?B?d3hrVUpWTlhaRXVvaVR5dmpUQTY5L01QQVdjRjA5OWErVS9vT29iWk5uSWdi?=
 =?utf-8?B?Q2dubVVzUGRNWXFzMmloKzZzdjFzMno3Uis2ZnY0a2ZITTB2RWkzVXpKYXYr?=
 =?utf-8?B?NzkxdmJwaEdxZDBKWU9IVFhlR3BETVRrZDY3eHVKMENtVGppQ1lieWdBdVE5?=
 =?utf-8?B?YlUvMlc3anY4ZnNlYUlTOE9GU2FSTlM3a0tQTXFWcGVqcFlVbWRXTWxPemMw?=
 =?utf-8?Q?nYLK/w30tbeyZjxm5DQf0mskq2eJQk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7829.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXZTaHErZzZKMHRTeStEQWtMZVZNMUpibDRyNWlwMVE4TndaM080Q0xTZCtS?=
 =?utf-8?B?ZFZsWWVRMjF4TnZJUGVhYVR5bHdPazdIblV1Wm9qUXJjV1ZMOXNHQkpLVmkv?=
 =?utf-8?B?SEpsNlBidkErWkZQRmhTWkZVcmxvU1ZFbkVMSFp0VlJ0WDhtSlh6aTN6QlFM?=
 =?utf-8?B?bytxaUY1RTdQL1J5aVlneUMzclNJSTR5UVRrcWU5Qk92L2pWRXN5aXBSU0pE?=
 =?utf-8?B?b3I2bXlPMTFwOHNVUFlYd2U2OUhmcWVBa3plTy9UUytNUVNhWDMveGdJZDFx?=
 =?utf-8?B?ZnR4L3FDbnFGVVRoMVlGT1lCNXpCYlpTUDJoVkduV3lraFB2blZFNXhsTkZD?=
 =?utf-8?B?QUlYVlBUamYzYmZXR1JEQjFEYWtrNW5lWkRWMnpUaTZCVjB5QXorSjc4Ukxy?=
 =?utf-8?B?Y2grUWIvbi8wVnNKVWRJNmhRTEIvYlNXQmZNbGNrOEpRTU9JNDFLdnVrWklm?=
 =?utf-8?B?LzZWMXdZZmJqR1FKWHBRRzVVRm9KbXJyN25hYitWc1dMdklQYUR4UHNaUjE0?=
 =?utf-8?B?RmRBRnFYOThySVU5N3RBME5pcWRQSkovWnNkcFArcjc3cVFZeG5iZllqRUpJ?=
 =?utf-8?B?YXlxOE5seVVZTTZSMzdUa1AzSVJIODVQQ2hkNGZDNktVVzdEd2tjQUkzTTdI?=
 =?utf-8?B?NTZKZ2RxYkhXbGdiQkN1UEZoa0p3bW9WRXRCcVFoZEZOWUhzMkN2dG5TWTBB?=
 =?utf-8?B?b21uREhiZFJKL2ZXQXYrUUFHS0k1aDVuYWxaN3NRb2d4U0JuTStsVC8yU0Nt?=
 =?utf-8?B?QVRUdVpVbktULzNiS0NJSEpxVklxNnRMWVZFb1gvS0phQmE5OExObTdlR0p2?=
 =?utf-8?B?MmhaVGowTkVHMzFTR1FLQUxuS3hUYUVPUGdZa3pkcnhOdmRQWWdpaVpWUEp1?=
 =?utf-8?B?VEhvclU0TE1QVG96SzJCTVdFVk01VllGYXh2TElFR05LdkRGd3U3c1JlcmpG?=
 =?utf-8?B?dmNlZ2M2bXlTTFlHRmNMdSs0MVhOUFBiODNhTmtZWUtUNHo3SHFpUGIrZUJ4?=
 =?utf-8?B?K1FpaVMrQXk0U0tkeVdvTUxCOS9SUlFyRERDMTRMNEs5S2FOSnBsWENwQ3RW?=
 =?utf-8?B?ajI3ejRqbmtSYVB3U21PN0g1dlRZcUFCTUFRT0ZIcnRvKzliOHpnNFJCQkxX?=
 =?utf-8?B?L0xoN0ZLamFXV1RBekxwb29wMDdacEQ4VkJSU3FsMC9vTkN3VldlL3hkNjIv?=
 =?utf-8?B?OERWR29QaXRTWml6cTNXM3BSTnV0YXZEdFpKcW9ialg2dGl6bmVMc2c2c3JV?=
 =?utf-8?B?OW9LYUlrS1JEb2o1UmZEd0s5ZGhMZ2lTYkNmYWFYUVZNWDA3RWo0V3ZwTEpJ?=
 =?utf-8?B?Q3hNNjg3d3pVZHNhckNBcTYvbUk1bGQ0MnRUMm00cWtQSGtLTkNMclZYM3Ns?=
 =?utf-8?B?a1ZKSFBUN1VnU3Q3NnJqSWgwY3dWQitPQ1k1NnZRY3YweEhGWXBUQlkyS1VG?=
 =?utf-8?B?cFdTNkNzTFQ5d05oNmxGd25CTDVpWlZTT1NueTNia3JHZU9nQ1hTUzBPeVRR?=
 =?utf-8?B?dHh6bEZLVFUvSk4zK1NGQytqcG5WWFE4cStmbFZSSXRmTUhiSjV2amFLa1h4?=
 =?utf-8?B?OWxnTVozSHN3ZHl6cGkyYXZJdXdyNDVwZ1ZjQW03c0ZlT3cxVm9IOHpRRDNh?=
 =?utf-8?B?L1dmOXFjVmx5UGNJbmNBTnVNNnYvZFQzS3R5TUxublFPN2YxOS9tdU9OTHA3?=
 =?utf-8?B?c0wwR0hyWmJ1V3Z6YWtlVXplUkFGRFVYR3NQZ0VDRi90bFNFc2s5ZTJVNnZo?=
 =?utf-8?B?R2hmNlpMNk14QklYL21ZS3ZEQjA0bm1HVW4yVzVJc2t4TFNvSVJHQ1cza0Zt?=
 =?utf-8?B?emNoVFdRczBuKzcxZ2p0bkRjd2ZTSG9YZENWU0hXdC9XRHVHVmZ6QzhJbEVB?=
 =?utf-8?B?ZEYrYTh6dGsybTlsbEgyYTNaOGNwSFhVVHd0T053QllZWDUxM1JqZEMrdkxv?=
 =?utf-8?B?VzlMTm80VjUzSFVtNUV4bTVYckZUT0h2azdCQUdXRzJTbjNPemdIVTc5Zy8v?=
 =?utf-8?B?SE04SUVodHNKM05yNnBwVldqa2JHUzNsMG8ya3FtUjJBWWhmSlBaUHZNQjRx?=
 =?utf-8?B?ZWt2UmlQN3FNZmxLUytUUDlpcFZjZmdiaytPbjFjV2ZhNllydms2K0dyYVJn?=
 =?utf-8?Q?F4MlUIWcEtHxPWMYv7ZHrA369?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7829.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50c0535-ce8f-4ca7-3a0f-08ddf58b9b8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2025 01:43:31.5055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8wGHlf0iSGtloZKT3jsPw7cnSK5IdVhVV9YrUrHumbFxoPAvIPyuO0ijf2Ss/qcspGauasptaa8wpuOsD0R1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHNyaW5pdmFzIHBhbmRydXZh
ZGEgPHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBXZWRuZXNk
YXksIFNlcHRlbWJlciAxNywgMjAyNSA3OjMxIEFNDQo+IFRvOiBTdW4sIFhpbnBlbmcgPHhpbnBl
bmcuc3VuQGludGVsLmNvbT47IGppa29zQGtlcm5lbC5vcmc7IGJlbnRpc3NAa2VybmVsLm9yZw0K
PiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBYdSwgRXZlbg0KPiA8ZXZlbi54dUBpbnRlbC5jb20+OyBaaGFuZywgUnVpMSA8cnVp
MS56aGFuZ0BpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIGhpZDogaW50ZWwt
dGhjLWhpZDogaW50ZWwtcXVpY2tpMmM6IHN1cHBvcnQgQUNQSSBjb25maWcgZm9yDQo+IGFkdmFu
Y2VkIGZlYXR1cmVzDQo+IA0KPiBPbiBUdWUsIDIwMjUtMDktMTYgYXQgMTA6NTcgKzA4MDAsIFhp
bnBlbmcgU3VuIHdyb3RlOg0KPiA+IFRoZXJlIGlzIGEgbmV3IEJJT1MgZW5oYW5jZW1lbnQgdGhh
dCBhZGRzIHRoZSBjYXBhYmlsaXR5IHRvIGNvbmZpZ3VyZQ0KPiA+IHRoZSBmb2xsb3dpbmcgdHdv
IGZlYXR1cmVzIG9mIEkyQyBzdWJzeXN0ZW0gaW50cm9kdWNlZCBpbiBjb21taXQNCj4gPiAxZWQw
YjQ4DQo+ID4gKCJJbnRlbC10aGM6IEludHJvZHVjZSBtYXggaW5wdXQgc2l6ZSBjb250cm9sIikg
YW5kIGNvbW1pdCAzZjJhOTIxDQo+ID4gKCJJbnRlbC10aGM6IEludHJvZHVjZSBpbnRlcnJ1cHQg
ZGVsYXkgY29udHJvbCIpOg0KPiA+IC0gTWF4IGlucHV0IHNpemUgY29udHJvbA0KPiA+IC0gSW50
ZXJydXB0IGRlbGF5IGNvbnRyb2wNCj4gPg0KPiA+IEFzIEJJT1MgaXMgdXNlZCBmb3IgdGhlIGNv
bmZpZ3VyYXRpb24gb2YgdGhlc2UgdHdvIGZlYXR1cmVzLCBjaGFuZ2UNCj4gPiBkcml2ZXIgZGF0
YSB1c2FnZSB0byBpbmRpY2F0ZSBoYXJkd2FyZSBjYXBhYmlsaXR5LCBhbmQgYWRkDQo+ID4gY29y
cmVzcG9uZGluZyBBQ1BJIGNvbmZpZ3VyYXRpb24gc3VwcG9ydCBpbiBRdWlja0kyQyBkcml2ZXIu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaW5wZW5nIFN1biA8eGlucGVuZy5zdW5AaW50ZWwu
Y29tPg0KPiA+IFRlc3RlZC1ieTogUnVpIFpoYW5nIDxydWkxLnpoYW5nQGludGVsLmNvbT4NCj4g
PiAtLS0NCj4gWW91IG5lZWQgY2hhbmdlIGxvZyBhcyB0aGlzIHYzLi4NCg0KV2lsbCBhZGQgY2hh
bmdlIGxvZyBhbmQgcmVzZW5kIHYzLg0KDQpUaGFua3MsDQpYaW5wZW5nDQoNCj4gDQo+IFRoYW5r
cywNCj4gU3Jpbml2YXMNCj4gDQo+ID4gwqAuLi4vaW50ZWwtcXVpY2tpMmMvcGNpLXF1aWNraTJj
LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzOSArKysrKysrKysrKysrKystLQ0KPiA+IC0t
DQo+ID4gwqAuLi4vaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtZGV2LmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCAyNCArKysrKysrKysrKy0NCj4gPiDCoDIgZmlsZXMgY2hhbmdlZCwgNTMgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYw0KPiA+IGIv
ZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYw0K
PiA+IGluZGV4IDg1NDkyNmIzY2ZkNC4uM2NlNWE2OTJiOTJiIDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcGNpLXF1aWNraTJjLmMNCj4g
PiArKysgYi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3BjaS1xdWlj
a2kyYy5jDQo+ID4gQEAgLTIzLDYgKzIzLDcgQEANCj4gPg0KPiA+IMKgc3RhdGljIHN0cnVjdCBx
dWlja2kyY19kZGF0YSBwdGxfZGRhdGEgPSB7DQo+ID4gwqAJLm1heF9kZXRlY3Rfc2l6ZSA9IE1B
WF9SWF9ERVRFQ1RfU0laRV9QVEwsDQo+ID4gKwkubWF4X2ludGVycnVwdF9kZWxheSA9IE1BWF9S
WF9JTlRFUlJVUFRfREVMQVksDQo+ID4gwqB9Ow0KPiA+DQo+ID4gwqAvKiBUSEMgUXVpY2tJMkMg
QUNQSSBtZXRob2QgdG8gZ2V0IGRldmljZSBwcm9wZXJ0aWVzICovIEBAIC0yMDAsNg0KPiA+ICsy
MDEsMjEgQEAgc3RhdGljIGludCBxdWlja2kyY19nZXRfYWNwaV9yZXNvdXJjZXMoc3RydWN0DQo+
ID4gcXVpY2tpMmNfZGV2aWNlICpxY2RldikNCj4gPiDCoAkJcmV0dXJuIC1FT1BOT1RTVVBQOw0K
PiA+IMKgCX0NCj4gPg0KPiA+ICsJaWYgKHFjZGV2LT5kZGF0YSkgew0KPiA+ICsJCXFjZGV2LT5p
MmNfbWF4X2ZyYW1lX3NpemVfZW5hYmxlID0gaTJjX2NvbmZpZy5GU0VOOw0KPiA+ICsJCXFjZGV2
LT5pMmNfaW50X2RlbGF5X2VuYWJsZSA9IGkyY19jb25maWcuSU5ERTsNCj4gPiArDQo+ID4gKwkJ
aWYgKGkyY19jb25maWcuRlNWTCA8PSBxY2Rldi0+ZGRhdGEtDQo+ID4gPm1heF9kZXRlY3Rfc2l6
ZSkNCj4gPiArCQkJcWNkZXYtPmkyY19tYXhfZnJhbWVfc2l6ZSA9IGkyY19jb25maWcuRlNWTDsN
Cj4gPiArCQllbHNlDQo+ID4gKwkJCXFjZGV2LT5pMmNfbWF4X2ZyYW1lX3NpemUgPSBxY2Rldi0+
ZGRhdGEtDQo+ID4gPm1heF9kZXRlY3Rfc2l6ZTsNCj4gPiArDQo+ID4gKwkJaWYgKGkyY19jb25m
aWcuSU5EViA8PSBxY2Rldi0+ZGRhdGEtDQo+ID4gPm1heF9pbnRlcnJ1cHRfZGVsYXkpDQo+ID4g
KwkJCXFjZGV2LT5pMmNfaW50X2RlbGF5ID0gaTJjX2NvbmZpZy5JTkRWOw0KPiA+ICsJCWVsc2UN
Cj4gPiArCQkJcWNkZXYtPmkyY19pbnRfZGVsYXkgPSBxY2Rldi0+ZGRhdGEtDQo+ID4gPm1heF9p
bnRlcnJ1cHRfZGVsYXk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+IMKgCXJldHVybiAwOw0KPiA+IMKg
fQ0KPiA+DQo+ID4gQEAgLTQ0MSwxNyArNDU3LDI0IEBAIHN0YXRpYyB2b2lkIHF1aWNraTJjX2Rt
YV9hZHZfZW5hYmxlKHN0cnVjdA0KPiA+IHF1aWNraTJjX2RldmljZSAqcWNkZXYpDQo+ID4gwqAJ
ICogbWF4IGlucHV0IGxlbmd0aCA8PSBUSEMgZGV0ZWN0IGNhcGFiaWxpdHksIGVuYWJsZSB0aGUg
ZmVhdHVyZQ0KPiA+IHdpdGggZGV2aWNlDQo+ID4gwqAJICogbWF4IGlucHV0IGxlbmd0aC4NCj4g
PiDCoAkgKi8NCj4gPiAtCWlmIChxY2Rldi0+ZGRhdGEtPm1heF9kZXRlY3Rfc2l6ZSA+PQ0KPiA+
IC0JwqDCoMKgIGxlMTZfdG9fY3B1KHFjZGV2LT5kZXZfZGVzYy5tYXhfaW5wdXRfbGVuKSkgew0K
PiA+IC0JCXRoY19pMmNfc2V0X3J4X21heF9zaXplKHFjZGV2LT50aGNfaHcsDQo+ID4gLQkJCQkJ
bGUxNl90b19jcHUocWNkZXYtDQo+ID4gPmRldl9kZXNjLm1heF9pbnB1dF9sZW4pKTsNCj4gPiAr
CWlmIChxY2Rldi0+aTJjX21heF9mcmFtZV9zaXplX2VuYWJsZSkgew0KPiA+ICsJCWlmIChxY2Rl
di0+aTJjX21heF9mcmFtZV9zaXplID49DQo+ID4gKwkJwqDCoMKgIGxlMTZfdG9fY3B1KHFjZGV2
LT5kZXZfZGVzYy5tYXhfaW5wdXRfbGVuKSkgew0KPiA+ICsJCQl0aGNfaTJjX3NldF9yeF9tYXhf
c2l6ZShxY2Rldi0+dGhjX2h3LA0KPiA+ICsJCQkJCQlsZTE2X3RvX2NwdShxY2Rldi0NCj4gPiA+
ZGV2X2Rlc2MubWF4X2lucHV0X2xlbikpOw0KPiA+ICsJCX0gZWxzZSB7DQo+ID4gKwkJCWRldl93
YXJuKHFjZGV2LT5kZXYsDQo+ID4gKwkJCQkgIk1heCBmcmFtZSBzaXplIGlzIHNtYWxsZXIgdGhh
biBoaWQNCj4gPiBtYXggaW5wdXQgbGVuZ3RoISIpOw0KPiA+ICsJCQl0aGNfaTJjX3NldF9yeF9t
YXhfc2l6ZShxY2Rldi0+dGhjX2h3LA0KPiA+ICsJCQkJCQlsZTE2X3RvX2NwdShxY2Rldi0NCj4g
PiA+aTJjX21heF9mcmFtZV9zaXplKSk7DQo+ID4gKwkJfQ0KPiA+IMKgCQl0aGNfaTJjX3J4X21h
eF9zaXplX2VuYWJsZShxY2Rldi0+dGhjX2h3LCB0cnVlKTsNCj4gPiDCoAl9DQo+ID4NCj4gPiDC
oAkvKiBJZiBwbGF0Zm9ybSBzdXBwb3J0cyBpbnRlcnJ1cHQgZGVsYXkgZmVhdHVyZSwgZW5hYmxl
IGl0IHdpdGgNCj4gPiBnaXZlbiBkZWxheSAqLw0KPiA+IC0JaWYgKHFjZGV2LT5kZGF0YS0+aW50
ZXJydXB0X2RlbGF5KSB7DQo+ID4gKwlpZiAocWNkZXYtPmkyY19pbnRfZGVsYXlfZW5hYmxlKSB7
DQo+ID4gwqAJCXRoY19pMmNfc2V0X3J4X2ludF9kZWxheShxY2Rldi0+dGhjX2h3LA0KPiA+IC0J
CQkJCSBxY2Rldi0+ZGRhdGEtDQo+ID4gPmludGVycnVwdF9kZWxheSk7DQo+ID4gKwkJCQkJIHFj
ZGV2LT5pMmNfaW50X2RlbGF5ICogMTApOw0KPiA+IMKgCQl0aGNfaTJjX3J4X2ludF9kZWxheV9l
bmFibGUocWNkZXYtPnRoY19odywgdHJ1ZSk7DQo+ID4gwqAJfQ0KPiA+IMKgfQ0KPiA+IEBAIC00
NjQsMTAgKzQ4NywxMCBAQCBzdGF0aWMgdm9pZCBxdWlja2kyY19kbWFfYWR2X2VuYWJsZShzdHJ1
Y3QNCj4gPiBxdWlja2kyY19kZXZpY2UgKnFjZGV2KQ0KPiA+IMKgICovDQo+ID4gwqBzdGF0aWMg
dm9pZCBxdWlja2kyY19kbWFfYWR2X2Rpc2FibGUoc3RydWN0IHF1aWNraTJjX2RldmljZSAqcWNk
ZXYpDQo+ID4gwqB7DQo+ID4gLQlpZiAocWNkZXYtPmRkYXRhLT5tYXhfZGV0ZWN0X3NpemUpDQo+
ID4gKwlpZiAocWNkZXYtPmkyY19tYXhfZnJhbWVfc2l6ZV9lbmFibGUpDQo+ID4gwqAJCXRoY19p
MmNfcnhfbWF4X3NpemVfZW5hYmxlKHFjZGV2LT50aGNfaHcsIGZhbHNlKTsNCj4gPg0KPiA+IC0J
aWYgKHFjZGV2LT5kZGF0YS0+aW50ZXJydXB0X2RlbGF5KQ0KPiA+ICsJaWYgKHFjZGV2LT5pMmNf
aW50X2RlbGF5X2VuYWJsZSkNCj4gPiDCoAkJdGhjX2kyY19yeF9pbnRfZGVsYXlfZW5hYmxlKHFj
ZGV2LT50aGNfaHcsIGZhbHNlKTsNCj4gPiDCoH0NCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oDQo+ID4g
Yi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5o
DQo+ID4gaW5kZXggZDQxMmVhZmNmOWVhLi4wZDQyM2Q1ZGQ3YTcgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaA0K
PiA+ICsrKyBiL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tp
MmMtZGV2LmgNCj4gPiBAQCAtMzgsNiArMzgsOCBAQA0KPiA+DQo+ID4gwqAvKiBQVEwgTWF4IHBh
Y2tldCBzaXplIGRldGVjdGlvbiBjYXBhYmlsaXR5IGlzIDI1NSBCeXRlcyAqLw0KPiA+IMKgI2Rl
ZmluZSBNQVhfUlhfREVURUNUX1NJWkVfUFRMCQkJMjU1DQo+ID4gKy8qIE1heCBpbnRlcnJ1cHQg
ZGVsYXkgY2FwYWJpbGl0eSBpcyAyLjU2bXMgKi8NCj4gPiArI2RlZmluZSBNQVhfUlhfSU5URVJS
VVBUX0RFTEFZCQkJMjU2DQo+ID4NCj4gPiDCoC8qIERlZmF1bHQgaW50ZXJydXB0IGRlbGF5IGlz
IDFtcywgc3VpdGFibGUgZm9yIG1vc3QgZGV2aWNlcyAqLw0KPiA+IMKgI2RlZmluZSBERUZBVUxU
X0lOVEVSUlVQVF9ERUxBWV9VUwkJKDEgKiBVU0VDX1BFUl9NU0VDKQ0KPiA+IEBAIC0xMDEsNiAr
MTAzLDEwIEBAIHN0cnVjdCBxdWlja2kyY19zdWJpcF9hY3BpX3BhcmFtZXRlciB7DQo+ID4gwqAg
KiBASE1URDogSGlnaCBTcGVlZCBNb2RlIFBsdXMgKDMuNE1iaXRzL3NlYykgU2VyaWFsIERhdGEg
TGluZQ0KPiA+IFRyYW5zbWl0IEhPTEQgUGVyaW9kDQo+ID4gwqAgKiBASE1SRDogSGlnaCBTcGVl
ZCBNb2RlIFBsdXMgKDMuNE1iaXRzL3NlYykgU2VyaWFsIERhdGEgTGluZQ0KPiA+IFJlY2VpdmUg
SE9MRCBQZXJpb2QNCj4gPiDCoCAqIEBITVNMOiBNYXhpbXVtIGxlbmd0aCAoaW4gaWNfY2xrX2N5
Y2xlcykgb2Ygc3VwcHJlc3NlZCBzcGlrZXMgaW4NCj4gPiBIaWdoIFNwZWVkIE1vZGUNCj4gPiAr
ICogQEZTRU46IE1heGltdW0gRnJhbWUgU2l6ZSBGZWF0dXJlIEVuYWJsZSBDb250cm9sDQo+ID4g
KyAqIEBGU1ZMOiBNYXhpbXVtIEZyYW1lIFNpemUgVmFsdWUgKHVuaXQgaW4gQnl0ZXMpDQo+ID4g
KyAqIEBJTkRFOiBJbnRlcnJ1cHQgRGVsYXkgRmVhdHVyZSBFbmFibGUgQ29udHJvbA0KPiA+ICsg
KiBASU5EVjogSW50ZXJydXB0IERlbGF5IFZhbHVlICh1bml0IGluIDEwIHVzKQ0KPiA+IMKgICoN
Cj4gPiDCoCAqIFRob3NlIHByb3BlcnRpZXMgZ2V0IGZyb20gUVVJQ0tJMkNfQUNQSV9NRVRIT0Rf
TkFNRV9JU1VCIG1ldGhvZCwNCj4gPiB1c2VkIGZvcg0KPiA+IMKgICogSTJDIHRpbWluZyBjb25m
aWd1cmUuDQo+ID4gQEAgLTEyNywxNyArMTMzLDIyIEBAIHN0cnVjdCBxdWlja2kyY19zdWJpcF9h
Y3BpX2NvbmZpZyB7DQo+ID4gwqAJdTY0IEhNVEQ7DQo+ID4gwqAJdTY0IEhNUkQ7DQo+ID4gwqAJ
dTY0IEhNU0w7DQo+ID4gKw0KPiA+ICsJdTY0IEZTRU47DQo+ID4gKwl1NjQgRlNWTDsNCj4gPiAr
CXU2NCBJTkRFOw0KPiA+ICsJdTY0IElORFY7DQo+ID4gwqAJdTggcmVzZXJ2ZWQ7DQo+ID4gwqB9
Ow0KPiA+DQo+ID4gwqAvKioNCj4gPiDCoCAqIHN0cnVjdCBxdWlja2kyY19kZGF0YSAtIERyaXZl
ciBzcGVjaWZpYyBkYXRhIGZvciBxdWlja2kyYyBkZXZpY2UNCj4gPiDCoCAqIEBtYXhfZGV0ZWN0
X3NpemU6IElkZW50aWZ5IG1heCBwYWNrZXQgc2l6ZSBkZXRlY3QgZm9yIHJ4DQo+ID4gLSAqIEBp
bnRlcnJ1cHRfZGVsYXk6IElkZW50aWZ5IGludGVycnVwdCBkZXRlY3QgZGVsYXkgZm9yIHJ4DQo+
ID4gKyAqIEBpbnRlcnJ1cHRfZGVsYXk6IElkZW50aWZ5IG1heCBpbnRlcnJ1cHQgZGV0ZWN0IGRl
bGF5IGZvciByeA0KPiA+IMKgICovDQo+ID4gwqBzdHJ1Y3QgcXVpY2tpMmNfZGRhdGEgew0KPiA+
IMKgCXUzMiBtYXhfZGV0ZWN0X3NpemU7DQo+ID4gLQl1MzIgaW50ZXJydXB0X2RlbGF5Ow0KPiA+
ICsJdTMyIG1heF9pbnRlcnJ1cHRfZGVsYXk7DQo+ID4gwqB9Ow0KPiA+DQo+ID4gwqBzdHJ1Y3Qg
ZGV2aWNlOw0KPiA+IEBAIC0xNzAsNiArMTgxLDEwIEBAIHN0cnVjdCBhY3BpX2RldmljZTsNCj4g
PiDCoCAqIEByZXBvcnRfbGVuOiBUaGUgbGVuZ3RoIG9mIGlucHV0L291dHB1dCByZXBvcnQgcGFj
a2V0DQo+ID4gwqAgKiBAcmVzZXRfYWNrX3dxOiBXb3JrcXVldWUgZm9yIHdhaXRpbmcgcmVzZXQg
cmVzcG9uc2UgZnJvbSBkZXZpY2UNCj4gPiDCoCAqIEByZXNldF9hY2s6IEluZGljYXRlIHJlc2V0
IHJlc3BvbnNlIHJlY2VpdmVkIG9yIG5vdA0KPiA+ICsgKiBAaTJjX21heF9mcmFtZV9zaXplX2Vu
YWJsZTogSW5kaWNhdGUgbWF4IGZyYW1lIHNpemUgZmVhdHVyZQ0KPiA+IGVuYWJsZWQgb3Igbm90
DQo+ID4gKyAqIEBpMmNfbWF4X2ZyYW1lX3NpemU6IE1heCBSWCBmcmFtZSBzaXplICh1bml0IGlu
IEJ5dGVzKQ0KPiA+ICsgKiBAaTJjX2ludF9kZWxheV9lbmFibGU6IEluZGljYXRlIGludGVycnVw
dCBkZWxheSBmZWF0dXJlIGVuYWJsZWQNCj4gPiBvciBub3QNCj4gPiArICogQGkyY19pbnRfZGVs
YXk6IEludGVycnVwdCBkZXRlY3Rpb24gZGVsYXkgdmFsdWUgKHVuaXQgaW4gMTAgdXMpDQo+ID4g
wqAgKi8NCj4gPiDCoHN0cnVjdCBxdWlja2kyY19kZXZpY2Ugew0KPiA+IMKgCXN0cnVjdCBkZXZp
Y2UgKmRldjsNCj4gPiBAQCAtMjAwLDYgKzIxNSwxMSBAQCBzdHJ1Y3QgcXVpY2tpMmNfZGV2aWNl
IHsNCj4gPg0KPiA+IMKgCXdhaXRfcXVldWVfaGVhZF90IHJlc2V0X2Fja193cTsNCj4gPiDCoAli
b29sIHJlc2V0X2FjazsNCj4gPiArDQo+ID4gKwl1MzIgaTJjX21heF9mcmFtZV9zaXplX2VuYWJs
ZTsNCj4gPiArCXUzMiBpMmNfbWF4X2ZyYW1lX3NpemU7DQo+ID4gKwl1MzIgaTJjX2ludF9kZWxh
eV9lbmFibGU7DQo+ID4gKwl1MzIgaTJjX2ludF9kZWxheTsNCj4gPiDCoH07DQo+ID4NCj4gPiDC
oCNlbmRpZiAvKiBfUVVJQ0tJMkNfREVWX0hfICovDQoNCg==

