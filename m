Return-Path: <linux-input+bounces-8097-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BB59C82D6
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5176284A2E
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 05:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D151E0E13;
	Thu, 14 Nov 2024 05:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AV99M4oS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F6354723;
	Thu, 14 Nov 2024 05:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563814; cv=fail; b=B0HsiinWTtq5AoZE17/XxjLTrtDB1/X5607fWQpTOl1OeZ3N63tqknHqbMXkwlvmSJZxkq8Abp9CVg5PCkCN2NwmI3Zp6hdftrnsGMAby4NEWltqMsNeNlI0HmjHjzC79MDaRis39HLLLd+mrPAE59hTlcW6mEoraH2rdhwzz7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563814; c=relaxed/simple;
	bh=PnjfyE7dr45nq8PTExb0+VgkFmKOwZxZZT3wnV9QNDg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LYqYqOs+vA7c0C2nE92D7QrXpNLxJzC9hpP567Twe5ErwGqqQw26QDqjRzqlX/XUsqhm8YFdNJsxc2Mp4my5qTODWOI5/1sbQSwCWnqYF57iftbsKADrFFzJdnJFEoxpqaCa0USIwSqK4YpdB3oPT6O9mjJoOwS2j2LrUEPMFFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AV99M4oS; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731563813; x=1763099813;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PnjfyE7dr45nq8PTExb0+VgkFmKOwZxZZT3wnV9QNDg=;
  b=AV99M4oSpVTW4JYvDAk1ghD9IoXA2I+Xfqx1pyafZPdpuNsdvZpH8tYF
   VYjXJcH/doY+bynnOIdqIUVSmJflHMo/mtVglxp86llJXkyLUgQQdddtp
   4Mqpc+P+ijATWGmQbCdyTyc1dYqFXxEFZuJH+g+euLhoITCFAZu7mfvHv
   UiNlUc4q6d28dgsUUoROBYyZXnqidrEt/FALfFEUfgi+hDowEc7bv7OAv
   EbVD9PuzWdbKlCiDRXzQ1z0V47/eJHEBYg8El21UO38xDoGlpdgRDAjFB
   UN0JSKgLU6ouMP8x7yXljYgCV3OJPgWGzEtKAh+c9P41or4JXXvUPuxBd
   g==;
X-CSE-ConnectionGUID: EYdg6N0lSMCpfEdzXEq2iw==
X-CSE-MsgGUID: ZLOEu9w4TBKxL7rL+tu/AQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35415678"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="35415678"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:56:35 -0800
X-CSE-ConnectionGUID: Tv0uhoevSneEXaLa23Jq9Q==
X-CSE-MsgGUID: ijjryacNSZmq6p3BusxYLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="87980307"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 21:56:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 21:56:34 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 21:56:34 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 21:56:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kC5xd2kWScEc1FScpr2M6g1DasgMz8HOs/VZUpvRbjQripfJfAal490MhA25e0xw9IA9u1+W+huU9BH61sxWpgS6miTJgWh5ChN1gN8R9nZjtppqtZ+pmXn5qc3ETP6MNCoFTcEfbBHdoRa+Q1jeGUkjxC3JVi0E+fsQeoCZh7Q2jHNgn4yaPBrKjY1GZoC2lVrfUon4117ZHIxURS0DSptWy5ua+GE3FP5OzunwiOYgFfW4DitHVCIOfSh8LU4AltxCza5wQtTNKlM2UPL4tLBkfpAVB0h8+8v/n2NZ3T7HnS/qvlUUn4TGMVvryvrhrCudb2nzzK2GaRDkkQc6WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnjfyE7dr45nq8PTExb0+VgkFmKOwZxZZT3wnV9QNDg=;
 b=QjXyIArGyORNZOJoRkVwhRnjJTkBBhQ8TO1wgiDIdSRaZndEhwWSgobMBshAfEZwQLr5hShLMXgJZV89COnzvtY2umM3827dx9vWEwbDyJvelFJLg211eY0UY6FuzN4+Rah/F/3FGwKshzpTF4c1fqzwIKM1n89/3COwQCJ0jytYm4F9ZW/5Ci5A1Ix/DzmeHxX8XQnhHRUrI9X+qY+CiGMQtkmq3Oup7ZLvb7avwDBDFlP9W+n7oZoDGoQ2bull5DRMBzNczHECBjlWt8ojQsM1aXcY6JuuZoFUbimoKP9IEPWfnDEgROeLGYIZMw5vZesITNAkqvpgVfxKuzV9Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 05:56:25 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 05:56:24 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>, "jikos@kernel.org"
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "bagasdotme@gmail.com"
	<bagasdotme@gmail.com>, "Aaron, Ma" <aaron.ma@canonical.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "Zhang, Rui1" <rui1.zhang@intel.com>, "Srinivas
 Pandruvada" <srinivas.pandruvada@linux.intel.com>
Subject: RE: [PATCH v2 02/22] HID: intel-thc-hid: Add basic THC driver
 skeleton
Thread-Topic: [PATCH v2 02/22] HID: intel-thc-hid: Add basic THC driver
 skeleton
Thread-Index: AQHbNlbmWHFXZ+TATky2cgL42oR5VrK2QyWAgAACp1A=
Date: Thu, 14 Nov 2024 05:56:24 +0000
Message-ID: <IA1PR11MB60988FF5961FDCEEF0A9F6E1F45B2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-3-even.xu@intel.com>
 <e16278a6-da1c-416f-a012-0aea1a4ce186@infradead.org>
In-Reply-To: <e16278a6-da1c-416f-a012-0aea1a4ce186@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB7718:EE_
x-ms-office365-filtering-correlation-id: b42d208a-054d-4ace-c22e-08dd047112b2
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?K1dhUjU3SnM0OU1vQzlBTGRVbzYyZThmQkFOU3BDalI1YVRxOGEvNCt2Znp1?=
 =?utf-8?B?RCtHbzlrS0Z0VkRKL2djQWhWTldiOUs0cFpGSkZtR1dmdGx0YmRPY3FIejNv?=
 =?utf-8?B?RHU0Mk1WM1NkM3NNck1WNXA0QWE1blIyYkFIbkd2S1BNeGM3UVB5SW5kWlpB?=
 =?utf-8?B?NTYxTUFLbDQ5VnVxUk1ZSktqWU8xWFFjNE1aU3IvdTVUZVZ0L2F3SklEa1Nz?=
 =?utf-8?B?S0dsOTliUk1IbklqVHBYVzE5cU0wZnFoeXlqek9YNVVyM2RoMzhaQXVUdEVs?=
 =?utf-8?B?NXVrUkV6cWpIYTFvV04vR2VWTkdQb01FTDIzbmlMVGVDaXJmSWt0SDR2ZzlF?=
 =?utf-8?B?NXNRVHVZNVNMOGtnc0c4TGhteXJxZzN3WFRyblJkbkRzTXZLc1FwTXRtNEs3?=
 =?utf-8?B?RVZnVzRjMTdVOWZLUjVXM1FPK3B0Qmd5NXhHTHBZNzNQaS9ORXY3alorK2Ft?=
 =?utf-8?B?UzBVa3BaalpkQ2RPUDdwemJ2Q3BuQ29pM1g0bHZreXVmNHhLcW93SXlVelZa?=
 =?utf-8?B?cU9HOUlES0g0VUdjSFhLTjB4V2tRTy9BT2U4WmdzQ2ZQQWU0UlJaZXFzQ1RS?=
 =?utf-8?B?dFliZU5jSFh5RFRmSnFNSWFwWUh1aU5INDFTbGNsZjZUcWhpRjlLRjBMY2U2?=
 =?utf-8?B?SGRWTkhwL0w1RXVIL1pIUjdYRmV5YkxCMWpTK0o3QjBTaU1wNWswR3NGb0hF?=
 =?utf-8?B?ZEpVWWJLN0NZcmVIOU9rdS8zejFyMG04SW10cFpDSEF5YzZmdnBNeVNDMTdE?=
 =?utf-8?B?Z0tteDY5K3puODJ2Y2R5OXc3UWNoU2c3cHNqSm0wdHhiT1dMSnUxOUU4bUhI?=
 =?utf-8?B?aElHV2pvc2d5S2tHaXR4NGVOVElGTUExQVVyaWMzUXAwQWIzMkNrdm8xQUtT?=
 =?utf-8?B?SnJvemhBb25CbWxkT2FLN283V29xc0RHRzZ5UGRmamFOekhHQStWSnptNjJw?=
 =?utf-8?B?L2UzblgvWlo3WDdiOHg2cEo1d0NGWUpjVExXM1A2YTBTRG4xQlYxRjRJWVFP?=
 =?utf-8?B?V011MklUUkF4aUVackhtUU5xb2QydTZpSk53VGFpMHJRVGl6akZtMHhlTXUy?=
 =?utf-8?B?QUp5cGVPM0haZFVuNU1LbWZrNmI2Z3lRcHJRUVBLMVQ2MVJrTVJtdFE4VHlL?=
 =?utf-8?B?TlFCZ1FjK0lzSkxLY2pNdXZ2YVEwZk9ObUhrYWxEa3ZLM3AranZ0S3lOZFJT?=
 =?utf-8?B?eWh6V09NU3l2cDRHanZyTkJRQk91SThVS2JqM1VhT2VyOGIxRGlZZFhmSkdw?=
 =?utf-8?B?V3ZhV3NBRHFDZkVBRFdQYzhsbVlNSUs1ZXEyRWhrN1BDWTVhcmlQTUNUOVJQ?=
 =?utf-8?B?dFpjSmFQeTFiK0dKNlM5YWVMSldVUTRjRGxoeWZkZHc1cjVQU3NxUHY4M3Z5?=
 =?utf-8?B?MEtRNFVzeDFPSm9KQUNnQkJMaHNSbkNnVndMK01mM2Z0dUJLTDhDOGVjMXEw?=
 =?utf-8?B?N1c5eit4eEpuSkR4QzQ3Z2J6STk4MTYzZUpLY1ZPeVRjWmVheHVNTFZCWEJm?=
 =?utf-8?B?ZnR5YVROWTlJaWYzeWlNUEpPcWJvUm1NRWtsZW5LLy9aKzAxalN3SVgvOGZK?=
 =?utf-8?B?dVlzQWIwdCt2emZZR0lZM1poMUNWcXdJN2xhRmJyNjl1VUVoYnlMeHRFS0V4?=
 =?utf-8?B?cU1kdlArbWlKN1pvOTN0WnF4VDFub0QveWVydmpMV1VJK3ZhWmFTQTY0bHN5?=
 =?utf-8?B?eGtxWGJjSmRMc0s2K1ZGbEZyTFg4eS8rVTNPYnBoRnNIMXU0bE9rK0R2ZE93?=
 =?utf-8?B?OEU0RURLWXVXTXdZQW0yQnRBQW8vbzJFMU1qLzAzU0diN201ejFsYUNBMkxm?=
 =?utf-8?Q?J0PRuEVH0YOnuWOCieFxBp0HBMtYmRnGoNEjk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cVU1MWtadStScEtkeG5hdXQ4bEdDY0tjbDZ1d0l5eDE1SUdhdmtYK2RaUXVN?=
 =?utf-8?B?UDRSSFo1ZDlHUklEdFNJZWUzbS9WbGJ6aFZYVEZ3S1p4RDlodlEvWlJKTVpX?=
 =?utf-8?B?SnlKT2taMWhuR0RGbVdoMllpbUpOaTVjNjVpQVlQRG8wNmpyK3VlSDhEWW1i?=
 =?utf-8?B?bE5MKzl6MGcrZ1RQNVp3Um5MbEhjZUJFb3hmaTF0d05TWW5FVGpBVW45bWU4?=
 =?utf-8?B?akI0MXBld1BVYmdqSEJ2eTQvYmh3VHp5elNJRGxFZTh3NjN5amdTZGZJSzVl?=
 =?utf-8?B?WUhubG1LRUk2ZmxneWRaOG5UUkRQZ1NkMXJFMnA0U0JIanRuckRZTXB1WGZz?=
 =?utf-8?B?RTB2TFpOSjN6OUVkcHE4aWxRYm1MbGNyazNoMHQ0SnRUcEtnRHdIbmE2Vnor?=
 =?utf-8?B?UzR2VnpwSWlaQnB3VGd2cmZDNEo0ck9mN2NLQ1hUdER0SzJqUHNLNXpjTjJr?=
 =?utf-8?B?cHh3VmFsOVB5N2hWcjlxWFR6QWpnL1ptZ3Qrcm9zcHU0NTVTS0hhM3ZmRHhp?=
 =?utf-8?B?MGFCQWFRUmJVMlhPajNrZytaakRrcExSV29NQm94amdiRzAzdFl3MzkzcDAx?=
 =?utf-8?B?WEtQQXdhTTVBWm5JOUNJY1pIZUV2bmdiai82Z3RNUXc0b2VoVG0wTVhyNkgy?=
 =?utf-8?B?d0txbWx6S2Z1citqWXdjS3FkdEZWa3VoQ3QwNnkrZlE3S05KYzhrMjVvVEp3?=
 =?utf-8?B?MERDamR2ajdmUXZGQ3hwKzhtTlNlbDBkYnRUcHVyOTZwejFlY0JBMi8vZEFj?=
 =?utf-8?B?TExPVEdnd1ZKV09zMnE1dEpuR0JoTjZ4bnEvM3NxU0ZuR1l0OEtuTVVKOCt6?=
 =?utf-8?B?V2hBMUdRb0ZWYXR3eXdEazdacjBKQWRrVGxZa1RXV1QwRXpSeXlUcE9pY3Jq?=
 =?utf-8?B?a3NFUFZCam9JRjVWaTNkemp1K2svUVYrM3lweEdsd1BsZkJpVVpIRks3VHp5?=
 =?utf-8?B?czhZTzZxSlZHN1p2ZncreitvZXRzZmNGVXN6MGdoNXlXNXJqdUFla2h6c0M5?=
 =?utf-8?B?QUFqZERmQXZpKzJISGVuTmpsVzVWbzFhWlVaV2NLeXlTd1N0OEEvMmUxQ2Jv?=
 =?utf-8?B?M0RCb1B1ZVBFZjB3MWJUWk9CcHJhN3ZmanJLcWxaSDlpZkZYc3FCY3FXZGwr?=
 =?utf-8?B?bk91WTM4SHJhMWozbzZBYThSN2RCTmlyZ3liMEE5blJuNG9pc2J3dEgxdHRk?=
 =?utf-8?B?TGxWTk83dlhseHhXL3FabzNYNDc0Z09EYVhFYWlOVWZHSlcvakhmSkNMY2dM?=
 =?utf-8?B?SzJKSFBhL1dkUGRiaGZEcFl1bUpNZzJYaVgzajh3Y2d0bFVQWERkaEhuK21W?=
 =?utf-8?B?NTl3VDBnZUNpWEQ0R3l3d1JSdlIxbnFkVGV0Q2RtOEs4WENEaTJpTUVvSjA3?=
 =?utf-8?B?ZHhDSVY1SDBZcnArZm84OXp3SVhESitON1dWTjltL0dMZHViQ3dnYktFMVhn?=
 =?utf-8?B?S1NuVFUzK2F3WStGSUZwRWFDOFo1Yit2ZUIwUjRhVDhLeThXRER3V3I3S0tv?=
 =?utf-8?B?TXhrZWtvREVaZjRDZmN0ZGtwWEpPdmJMMXdleTFlb1JWSWtJZko2anBOVVJj?=
 =?utf-8?B?U1c3eWR5Vm5xaHVoRW5IRCtVREFBYWNVbXdzU1ZheWI5clBPMXpHRlcvOGV0?=
 =?utf-8?B?MThtOHN1bjVHTktFV0dTc2xVV0FpRE5laCtPVHdUclM2b0s1MktNZ3VQYUNQ?=
 =?utf-8?B?RXBsU0RKdUMwR29adnpaYnJVZXdWNjhsMC9MK0dpZ0RzR3JjZzRWT2pZc2h6?=
 =?utf-8?B?Qkp1aWNaVStjTDg5UDJwQVk4YVhwcVRpY0d4WGNjQTJ3em9TSWpjTlRKYWVy?=
 =?utf-8?B?bXgyY1dXOGIvdG1vb2lpaG1lSU92bmRwcjFlRmRFbVJWVHpZanRnVUJ6eUMr?=
 =?utf-8?B?MG5HN3F1a01WYmdacXlBbnhaaDRoRTNEekgwQzAyYmRPdjNKQ2ltYUs0STR3?=
 =?utf-8?B?UVBLL3haZ0t4d2JST0pFSjhyMWo2d3pJQ0FQUTVKczNDWHR6RGdvaWM2eENz?=
 =?utf-8?B?VFBQU0djNlNqam1ZVEdNYUVwdVR0cTRlZXVLbXg5S2UwMUd2UzQyenY2aG96?=
 =?utf-8?B?TXdhdVprdm13YWZNMzFudGF5S1FDWWRWVlF6d3ZPeWhYMExnU09md3ZlYUlM?=
 =?utf-8?Q?3NWQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b42d208a-054d-4ace-c22e-08dd047112b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 05:56:24.7769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ly2RAWTOcvhQvrwDyACAfPw8XiCBS9FKMfPiYT3NXu8VwGpbjp4sYL4gkH6N8Qca8ovs6nmdr7nMEtpGWriafw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxNCwgMjAy
NCAxOjQyIFBNDQo+IFRvOiBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBqaWtvc0BrZXJu
ZWwub3JnOyBiZW50aXNzQGtlcm5lbC5vcmc7DQo+IGNvcmJldEBsd24ubmV0OyBiYWdhc2RvdG1l
QGdtYWlsLmNvbTsgQWFyb24sIE1hDQo+IDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPg0KPiBDYzog
bGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZzsgU3VuLCBYaW5wZW5nIDx4aW5wZW5nLnN1
bkBpbnRlbC5jb20+OyBaaGFuZywgUnVpMQ0KPiA8cnVpMS56aGFuZ0BpbnRlbC5jb20+OyBTcmlu
aXZhcyBQYW5kcnV2YWRhDQo+IDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwMi8yMl0gSElEOiBpbnRlbC10aGMtaGlkOiBBZGQg
YmFzaWMgVEhDIGRyaXZlciBza2VsZXRvbg0KPiANCj4gDQo+IA0KPiBPbiAxMS8xMy8yNCA5OjMz
IFBNLCBFdmVuIFh1IHdyb3RlOg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9pbnRlbC10
aGMtaGlkL0tjb25maWcgYi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL0tjb25maWcNCj4gPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAwMDAwMC4uZTdlODIwMTI4N2Y4
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQv
S2NvbmZpZw0KPiA+IEBAIC0wLDAgKzEsMjAgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMA0KPiA+ICsjIENvcHlyaWdodCAoYykgMjAyNCwgSW50ZWwgQ29ycG9yYXRp
b24uDQo+ID4gKw0KPiA+ICttZW51ICJJbnRlbCBUSEMgSElEIFN1cHBvcnQiDQo+ID4gKwlkZXBl
bmRzIG9uIFg4Nl82NCAmJiBQQ0kNCj4gPiArDQo+ID4gK2NvbmZpZyBJTlRFTF9USENfSElEDQo+
ID4gKwl0cmlzdGF0ZSAiSW50ZWwgVG91Y2ggSG9zdCBDb250cm9sbGVyIg0KPiA+ICsJc2VsZWN0
IEhJRA0KPiA+ICsJaGVscA0KPiA+ICsJICBUSEMgKFRvdWNoIEhvc3QgQ29udHJvbGxlcikgaXMg
dGhlIG5hbWUgb2YgdGhlIElQIGJsb2NrIGluIFBDSCB0aGF0DQo+ID4gKwkgIGludGVyZmFjZSB3
aXRoIFRvdWNoIERldmljZXMgKGV4OiB0b3VjaHNjcmVlbiwgdG91Y2hwYWQgZXRjLikuIEl0DQo+
IA0KPiAJICBpbnRlcmZhY2VzICAgICAgICAgICAgICAgICAgIChlLmcuOiB0b3VjaHNjcmVlbiwg
dG91Y2hwYWQsIGV0Yy4pLiBJdA0KDQpXaWxsIGZpeCBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4g
DQo+IA0KPiA+ICsJICBpcyBjb21wcmlzZWQgb2YgMyBrZXkgZnVuY3Rpb25hbCBibG9ja3M6IEEg
bmF0aXZlbHkgaGFsZi1kdXBsZXgNCj4gPiArCSAgUXVhZCBJL08gY2FwYWJsZSBTUEkgbWFzdGVy
OyBBIGxvdyBsYXRlbmN5IEkyQyBpbnRlcmZhY2UgdG8gc3VwcG9ydA0KPiANCj4gCSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBhIGxvdw0KDQpXaWxsIGZpeCBpdC4NCg0KPiANCj4gPiAr
CSAgSElESTJDIGNvbXBsaWFudCBkZXZpY2VzOyBBIEhXIHNlcXVlbmNlciB3aXRoIFJXIERNQSBj
YXBhYmlsaXR5IHRvDQo+IA0KPiAJICAgICAgICAgICAgICAgICAgICAgICAgICA7IGFuZCBhIEhX
DQo+IHRob3VnaCBJIHByZWZlciB0byBzcGVsbCBvdXQgICAgICAgICAgICAgIGhhcmR3YXJlICAg
ICAgUmVhZC9Xcml0ZQ0KDQpBZ3JlZSwgd2lsbCBmaXggaXQsIHRoYW5rcyENCg0KPiANCj4gPiAr
CSAgc3lzdGVtIG1lbW9yeS4NCj4gPiArDQo+ID4gKwkgIFNheSBZL00gaGVyZSBpZiB5b3Ugd2Fu
dCB0byBzdXBwb3J0IEludGVsIFRIQy4gSWYgdW5zdXJlLCBzYXkgTi4NCj4gPiArDQo+ID4gK2Vu
ZG1lbnUNCj4gDQo+IC0tDQo+IH5SYW5keQ0KDQpUaGFua3MgZm9yIHRoZSBjb21tZW50cyENCg0K
QmVzdCBSZWdhcmRzLA0KRXZlbiBYdQ0KDQo=

