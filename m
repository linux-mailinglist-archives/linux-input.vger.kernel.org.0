Return-Path: <linux-input+bounces-8099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 843CC9C82E3
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 07:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1056C1F216DF
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FBA215A848;
	Thu, 14 Nov 2024 06:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFkbtEPZ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404801E4B0;
	Thu, 14 Nov 2024 06:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731564120; cv=fail; b=tm6vo/QjEokS65FR9Dy27VBZ7rb4KZeeVqfvnHB7VfeBFMqwgZ0sem74ATjCum0zEvAKuDn8YRLhJjgDO/jlPtdh5I/rJFAjVWhMhBf+gAp2og1eQkr1maojfnl8hb09snLsg7bl30mbEnkdGjimW6d0n/FpKGdUu4i+Bfh2CUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731564120; c=relaxed/simple;
	bh=h4JhwAneW/QSktIaV7iIjnHEYurJjC+6602LQ/xYiPk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=G0XVM3HgdPPKT5v1bHqhLZlwfdbtiqi3vTpaLDl84KTptw99kZ8swNNP1RAxtASoMRQ9KrDfwDV9sm5xxy0NuVgXESq+DPwON3Nv64xCexfTUveL10EYABj+VGnOK0N3gD+OLbH1Wj/CQtvdIv9mX4ZL2NYGDlBZBbhDdaGrtXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFkbtEPZ; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731564118; x=1763100118;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h4JhwAneW/QSktIaV7iIjnHEYurJjC+6602LQ/xYiPk=;
  b=NFkbtEPZwkSLT7H7rXqibEzLC6kwCYu4msVu5HpbsowAVaeykRlQ04JJ
   njMTxyr+KgCIbQp5WcTSAMyWOV3TRWgCFAnRcF9A49jovdZkJKfvnEXuR
   tVyJNhxY9N9LmcxE5d69kLk9nB4Htk9niGIGr0q1zMfMDkDUzxZe4oST2
   y7gXKuYhqnGlP9jGVttxa4uXjHJytV5E3nnBhBqCs1a/ZIFZ1DZHMdF5A
   DUnIN0o630UOOnM1e89sbSiuIZUQvCQ4kZuCIqAOWDpZ/O3Ih8AbZMjiv
   z95hzuFzQSI6QtnQBXgf3w7HwggnSZsbrcyXPLf9XsaY2JA7mwMgNdhXp
   A==;
X-CSE-ConnectionGUID: urmEY/UXQImeQiDvkGcjWA==
X-CSE-MsgGUID: gsnvywm2QMKRxXTLaH9iUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35281768"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="35281768"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 22:01:57 -0800
X-CSE-ConnectionGUID: 2y8jQtTtTdWp2LVQYDRWLw==
X-CSE-MsgGUID: 5Z+bJr+VQjmXubd7IbLe0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="87649651"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 22:01:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 22:01:56 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 22:01:56 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 22:01:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tclspeEJKDtXVlsNb6ZISNC8zKwxnjrkT2QtsN6kyqP5vkBJ5f30fpJYCy7uOEBfPxrbmJf6DmazUQ9KNXvmNT2z3PK8LHRJp40kH8BLf+EXUFKDh9gc4k5+edhiQr78N6DMpJapZFkCyrxJ8PcXH4u7IpR2qdBvGsSuQGu1mCuNupu+9EutYCML781DOSRImFc2OaPbOFvS6W1dSV73hllCTh7aM3K7XDkNpqDrV1oW6eDeJXMZY/dixoeuAYjDEtaqxgFayHCBrxYT4rHBzRjigqtW/1goO9xwK3l4DbXx56QLk8g51KoTAgLjsapZQvadtl5ZIGAXtBwo+M6LuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4JhwAneW/QSktIaV7iIjnHEYurJjC+6602LQ/xYiPk=;
 b=t49xPltek4yMwqf9nZx9xYigJbdPFMho6VhkN5tfFmlboKzc6WKzVqpCTpPCNUzpiZHPvVFfyqsY+OfuWARY05cxGOS9TVllAS9jdlBzqNfJGwVV4KE8UB8dzg2sUOZX5WQ5/CvnkpHLiQymub9Fh57uK4gzba54xX2AJhPjn7OQ8OaQdPGL0ngKDK78gBMIqIB3cN+YcGQ5l2uBnuqZbTZYZWonnjhUEWEEsZhp6ufl3q/tT6AGZUrF1/Txxh9/al8aAPFw2rJ+4Xq3C+NcG7YOMbe5b8zJtxC+XL5fJtHU2xvTAEQaeeKcaRCfYqfap0tpIn7I1+uQMBifWtpYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 06:01:52 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 06:01:52 +0000
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
Subject: RE: [PATCH v2 17/22] HID: intel-thc-hid: intel-quicki2c: Add THC
 QuickI2C driver skeleton
Thread-Topic: [PATCH v2 17/22] HID: intel-thc-hid: intel-quicki2c: Add THC
 QuickI2C driver skeleton
Thread-Index: AQHbNlcLCFip6/VwXEyeDBESSPnIhLK2RDQAgAAEVGA=
Date: Thu, 14 Nov 2024 06:01:52 +0000
Message-ID: <IA1PR11MB60985A043C919C7B19704A9CF45B2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-18-even.xu@intel.com>
 <f78a4c4f-1efa-4aad-87e9-14c90d6e437f@infradead.org>
In-Reply-To: <f78a4c4f-1efa-4aad-87e9-14c90d6e437f@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB7718:EE_
x-ms-office365-filtering-correlation-id: ba026d2d-4ddd-419d-ad25-08dd0471d617
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?czBzQWZKRUIrWkZ5OWVUSE1VemIzMG4vZ3pCRXdNQVpIckduRzRCcHFOc2Z3?=
 =?utf-8?B?WE1vck5KeWxCbU5VQnptSkpodVkyY0lWcmtmUjdkUmNNeWZ1djgwVGpnUWE5?=
 =?utf-8?B?b1dzV0tGRG5SNWRFN0ttZlFHS1FES3R1bXpFL3JtSUw2R055WG1pZU42UmNE?=
 =?utf-8?B?VGVOV3FXeTc3dHh3VWRTeHV0Y1EzN1dpazJzczBoaFBKZkl0S0JEWE9wbmtl?=
 =?utf-8?B?S3VORlQwRkFOTVB6bW5rQnJQZjFuK3BRekR1V21ITVE2dHJFWmUzU0NMa1Jl?=
 =?utf-8?B?RFZ3QjlrYWxSSnMzWjB6U3VGTHF1VkRaeXlEWDBiSE1kMjh6bnFuekRBUzRP?=
 =?utf-8?B?UUpTZEVUQkFlZThZTGIxUVdkMUhsdUpNMnJQTDFLVDJTQ2pZQUk2YTJ3STV1?=
 =?utf-8?B?SHhqcXdRWXZBY2p3ZWp2VGFJd0tQL1pjeWUzR1RUOFdMRlkvMG5UVmgzOW0z?=
 =?utf-8?B?Y1dMTmxoaXkvREFPdzI5ZDgvMk9leFl5cGVvWmZZMXp3ZVcvZHI2LzFiSXVL?=
 =?utf-8?B?MzhXQTlOQ0lvd3dQdzdPMCtYYVZBSW0zMENqc1BwQzBEZFdUc1ZwTTB1SXJi?=
 =?utf-8?B?eTg4SW9zVlFMNDBMTno2MzVlRkM0ZVJPVis0b3JuOW83elo4QTAvZzcyUUl4?=
 =?utf-8?B?cEwrRU5LR3RscTgxYk5oZGxDZDYzWUpMQUpPYWl5WFhMV0FaekdIUVRpclhI?=
 =?utf-8?B?bEdoVm5weWk4dTZ5MGVnTzgzODZPL01xNEY0cnJoRHBISzZXZkUxcmJRek9l?=
 =?utf-8?B?UzJrMEdsaTg5bGVoWDVHbzR5b0pJZHltc09MMlloL09LV1V2bjRvRWY2SHJI?=
 =?utf-8?B?bFNhQXBMWE1uWnFoOHN5T2RtR3YvbklGeW00R054anJndlVXR3Q3Ny81WDRK?=
 =?utf-8?B?cVVQTGtIUTRNMEViUFdKbjA2M21tYW1kYkFvN0lKNU9qVGdzaTdmanp6eTFj?=
 =?utf-8?B?Rml0MDAzTnk4dk1mb0ZVVC8xTVVXMEIzYk00UGxqTy9UOTNwTU55Y1ZDL0ov?=
 =?utf-8?B?Yy80QlI2Zlc3MDNOcmtTWk1GYlNBUTRuUjZ0dWRCMkRKME5NQW9TaWQrYld2?=
 =?utf-8?B?Y3hySGoyNFdyMnc4Mi95ME1UU29kQWtLaGNuNG9VS0dWZW44RTRuNGNmR21M?=
 =?utf-8?B?ckhWdmEwUHY3QkorcmF3UUxsdzdURWJYR3dlRzU2STJKa2IrNU1tZlFpK29i?=
 =?utf-8?B?OEZQR2FMYjhPbUo5VWVXRWxRamoyZHJ3NVNJbEZKcGl4RVpTTDUwdG9LSzNt?=
 =?utf-8?B?YmFaQW9xYXdLTFpSbTRkTWlRNTZEa05OSXpkYkNrMVFhaWpndkJvTDNIN0hs?=
 =?utf-8?B?eVljQW1uMjUvakhuZGI3dWc1bzRlbHJoNEZ6eERnV2g1Q25HYWVKSGFwKzJn?=
 =?utf-8?B?aEswelhkZzI0blZGdklSemJpc2o3ZVh6SVkwR1BOc2NUWGp4UEg0UVI5a1ZH?=
 =?utf-8?B?STRHMmNwTGVJM2RVNzhFbmxWQnZTMzFPUW81NXl2aUlqcVpua3YvVXVDWTlp?=
 =?utf-8?B?RHNXOWlFQlNSTHo3eDVXRVdyZTU5c29SWlpod3dUNytqVTkrdG0xTzJySGFV?=
 =?utf-8?B?MG5QSlpVWWYxTGZiMGVLTGVPSGk5dzA5MmZrM25TdC9TRWJ0VEphMWdEMnAz?=
 =?utf-8?B?K1R2d1Z0SkhwQ1cxSHYveksyZ3NHQVN2bENPeGJyWkVBMHdDS2NyUkxDYlh6?=
 =?utf-8?B?SXV4NGlER25tTnl3aFBDUjBMRnFlS29lNTVaR0JCeGlwSmdHVk41d0pSNGR4?=
 =?utf-8?B?NWZXTGhPZ0VJN2RUeHJVREhMQTdpSGllc3FXZnRaT2JLZEdvN0VVY0Z0U0g5?=
 =?utf-8?Q?u24y6InvOjZvuafWJCSzdUETz6wOBmvTjakVw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cnE4c2dNejNwTTExNkRNWEk2WUhBRS9IZFB5Zm9Fak0wMllrM3c1R3BvSlln?=
 =?utf-8?B?a3h5Z1BkSVVqemNuVlZUVTJCWW56UmxhdlQyZDRNOE1ML2JoSGRsVi81ZjFQ?=
 =?utf-8?B?WHg1Tkl4NE55VVlidVJQZE1wVlJueEYxbFdaL1Q5dE1iTzRLUXV2alFwaTRS?=
 =?utf-8?B?eUZoRHNkL1JobUxuZXVBU2s5U3FMc3NncUdkS1k0Wlhma3RKNVNPelhDR0E3?=
 =?utf-8?B?cVhRVkZsWTMrK0hQdzlvd01ORkNuUWlGSzlVK1c4QU1wNWNZMVZMNWExTHNs?=
 =?utf-8?B?QmdiNE9KZGxKaG55Sk1sTlEwV1hzVjJaWm8ySzZrVHZpam9CNG00QStob2Fi?=
 =?utf-8?B?ckEwdXNOUmtPUGxmL1R0WVlhRnJ6cytZNnJZVUdSVEtsaWo3M0F5OS9uNXBz?=
 =?utf-8?B?UWV4RXd4Q1cvSlNsRHNTSEdFaUhNMWMxWjFUYkdIZm0yMElrRUpFRlB2dS8w?=
 =?utf-8?B?eld6Q2hybjE2ekhYaCs0YTcydzVnejkwUUJSeC94K2FPbElDWEhmVGFyTzZn?=
 =?utf-8?B?NU5uZFFEaE1weXJvNTdvOEMzdktiNnZuc3kxQW16Z25IUkZUdFZ0RHRXekVY?=
 =?utf-8?B?ZHoyMC82bWF3V05DZm54eGxmSXQxZzlERkxiOXliOVBKb3pzNDN5V3plREtV?=
 =?utf-8?B?amxDK05BNlMwWWtKRWJuSWl6ZGlHR3ZKd0lzSWM3OGtjMnNZT0hTWDVHY2Rp?=
 =?utf-8?B?YWNmNWJ0RVpvWFRhVldBMEhCUGFjOE5EUHFqMjBJdVVBanJRVXU4dGJ0ME5u?=
 =?utf-8?B?a0pBZERmWjM5OXVra3c5dERuRHhQWDZVcVd2OFJJV2t2RTZnYkwzdk9XVlhI?=
 =?utf-8?B?QkRoMk10WFQ3VEhOeXhiS1lZYTdpS290MFI3akdIUEtoWnJ1Vy9tR29FMGkr?=
 =?utf-8?B?anJlMm5yVVdDT3pYeDZsNjZSM0t4ckVLUkpzMGFFZ0s1RUtMbDJNVjdKK0xz?=
 =?utf-8?B?YnkxbGplZG9xNHB5bk1XOFFudUtJZWU3MmNFWXVNMlBXUDRYQnQwZWJEa2cw?=
 =?utf-8?B?NmxaOXpVamZaZUJUZ3c2MU5lZEF5YkF4STRnbjIwelVUNmx1Ym9rY0tGMDFX?=
 =?utf-8?B?cjc5bE83VEkrVHVJTElLNVRNNnRRc1hONnd6alRxTDdCZXcvTDc3M28zRElu?=
 =?utf-8?B?WEdOS2sxU3BlZDR6a2JFUTYra0JSaGJVTVpsRDVyejBQNEQ4Ly9ib2dJbVZa?=
 =?utf-8?B?eUthalpNb2JKWWRBRndlRVY0QnFtajBxbTkwUWJkMUdXRUVTd21XdDVlR1U4?=
 =?utf-8?B?MWtXUVhKMW4zYWpzcUk5dGtrQXovWEgyK0tmVWVxRUdvMWo1SjIxblk2WC9S?=
 =?utf-8?B?ejc2SWZaYllWVHl4N0hudWpWUys0dmxvMFI2Kzcxbm9CWVNDdnJDeUhoMExM?=
 =?utf-8?B?SldFLzMwUlpDdXJwUDZoc3hoOHhia0xGT2VERVowSjV5U0VlUzVYTlJ6UUdw?=
 =?utf-8?B?dk90MGFiNXo0bUlvZkFDRHBBSzkva3JOamdBUDg0TmNCS0VDdFZ1anBTWXkw?=
 =?utf-8?B?Q1NWUTRKdlFTMVI1UWJFTmQ1YytTRjFMQ1lZWUNWNUtPOUNoOFZOVU1RUW1T?=
 =?utf-8?B?enhrVytWN0xFWlZ0MjFwODFEaU41Y0EwNzRnME12alVCSmIrVVl5VGxVVmpB?=
 =?utf-8?B?Q2pyTDNqWmEyanI2KytwVXpVODlMdGJ2UDUyNHVERElrcVZsTWllQXI5S3BZ?=
 =?utf-8?B?MGVUZ0l3N2tsTW5rSUhuOS9iQjZSRUx1ZmxwZko3VWwzT00rU0Ribllsai9k?=
 =?utf-8?B?OURHUGRKTTFaak8zRytlOUl2THRDZVRlVE92RTZsUHpWN3RrcWd2SkJ6Skdr?=
 =?utf-8?B?VStxTmhrN1JzVGRwMWNYZlMyeFNucGdubm90YUhLL0V5MkdMRnpXbTZTenRw?=
 =?utf-8?B?emNHTHNMbSt5dktvZXlmWEw0UjFmTy8vVENnVW5OVjI5ZXdYeHJlckFreFMw?=
 =?utf-8?B?TWtEdGNLWE5VcU8wZVNXQ0p5bGtGYWJlVWZJTElsNng4SlNGMzBjTFV6TW5D?=
 =?utf-8?B?aGpkazFaTm9ZSVlsNWtWMml5QmNKRUgvWTdNMDNnUlpSd0I3TTJkaFJSOFQ0?=
 =?utf-8?B?blhaL1NFdWY1UFNXNUtKWmtqZFUyd0d2LzJXL3B0KysycGpsS0hNNVR3SStl?=
 =?utf-8?Q?IGV8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ba026d2d-4ddd-419d-ad25-08dd0471d617
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 06:01:52.5690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKzJKlqkrPLJVschjFUFCLmwvMxyAuhRaxLF2CpyWaxtHoS5Ev9sXektoXXKNAUMwY5sOjhcqR1b2bbTsgK4uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxNCwgMjAy
NCAxOjQ2IFBNDQo+IFRvOiBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBqaWtvc0BrZXJu
ZWwub3JnOyBiZW50aXNzQGtlcm5lbC5vcmc7DQo+IGNvcmJldEBsd24ubmV0OyBiYWdhc2RvdG1l
QGdtYWlsLmNvbTsgQWFyb24sIE1hDQo+IDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPg0KPiBDYzog
bGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZzsgU3VuLCBYaW5wZW5nIDx4aW5wZW5nLnN1
bkBpbnRlbC5jb20+OyBaaGFuZywgUnVpMQ0KPiA8cnVpMS56aGFuZ0BpbnRlbC5jb20+OyBTcmlu
aXZhcyBQYW5kcnV2YWRhDQo+IDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxNy8yMl0gSElEOiBpbnRlbC10aGMtaGlkOiBpbnRl
bC1xdWlja2kyYzogQWRkIFRIQw0KPiBRdWlja0kyQyBkcml2ZXIgc2tlbGV0b24NCj4gDQo+IA0K
PiANCj4gT24gMTEvMTMvMjQgOTozNCBQTSwgRXZlbiBYdSB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmlnIGIvZHJpdmVycy9oaWQvaW50ZWwt
dGhjLWhpZC9LY29uZmlnDQo+ID4gaW5kZXggMGQwYTM4NzdlZWIwLi4yNzVlNDJhNGY3YTEgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmlnDQo+ID4gKysr
IGIvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmlnDQo+ID4gQEAgLTI4LDQgKzI4LDE1
IEBAIGNvbmZpZyBJTlRFTF9RVUlDS1NQSQ0KPiA+DQo+ID4gIAkgIFNheSBZL00gaGVyZSBpZiB5
b3Ugd2FudCB0byBzdXBwb3J0IEludGVsIFF1aWNrU1BJLiBJZiB1bnN1cmUsIHNheSBOLg0KPiA+
DQo+ID4gK2NvbmZpZyBJTlRFTF9RVUlDS0kyQw0KPiA+ICsJdHJpc3RhdGUgIkludGVsIFF1aWNr
STJDIGRyaXZlciBiYXNlZCBvbiBJbnRlbCBUb3VjaCBIb3N0IENvbnRyb2xsZXIiDQo+ID4gKwlk
ZXBlbmRzIG9uIElOVEVMX1RIQ19ISUQNCj4gPiArCWhlbHANCj4gPiArCSAgSW50ZWwgUXVpY2tJ
MkMsIHVzZXMgVG91Y2ggSG9zdCBDb250cm9sbGVyIChUSEMpIGhhcmR3YXJlLCBpbXBsZW1lbnRz
DQo+IA0KPiAJICAgICAgICBRdWlja0kyQyB1c2VzDQo+IA0KPiA+ICsJICBISURJMkMgKEhJRCBv
dmVyIEkyQykgcHJvdG9jb2wuIEl0IGNvbmZpZ3VyZXMgVEhDIHRvIHdvcmsgYXQgSTJDDQo+IA0K
PiAJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgaW4gSTJDDQoNCldpbGwgZml4IGl0Lg0KPiANCj4gPiArCSAgbW9kZSwgYW5kIGNvbnRy
b2xzIFRIQyBIVyBzZXF1ZW5jZXIgdG8gYWNjZWxlcmF0ZSBISURJMkMgdHJhbnNjYXRpb24NCj4g
DQo+IAkgICAgICAgICAgICAgICAgICAgICAgICAgaGFyZHdhcmUgICAgICAgICAgICAgICAgICAg
ICAgICAgIHRyYW5zYWN0aW9uDQoNCldpbGwgZml4IGl0Lg0KDQo+IA0KPiA+ICsJICBmbG93Lg0K
PiA+ICsNCj4gPiArCSAgU2F5IFkvTSBoZXJlIGlmIHlvdSB3YW50IHRvIHN1cHBvcnQgSW50ZWwg
UXVpY2tJMkMuIElmIHVuc3VyZSwgc2F5IE4uDQo+ID4gKw0KPiA+ICBlbmRtZW51DQo+IA0KPiAt
LQ0KPiB+UmFuZHkNCg0KVGhhbmtzIQ0KDQpCZXN0IFJlZ2FyZHMsDQpFdmVuIFh1DQoNCg==

