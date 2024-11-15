Return-Path: <linux-input+bounces-8111-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 583FB9CD67E
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 06:11:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB6991F22BF2
	for <lists+linux-input@lfdr.de>; Fri, 15 Nov 2024 05:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE661684AC;
	Fri, 15 Nov 2024 05:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E229I3NX"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941BB2F26;
	Fri, 15 Nov 2024 05:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731647467; cv=fail; b=RK83siy+FSLADuJDrEeiDn8+DcJzEYGFSq0pUnaYhGyn6zhwjCIO+0Icif5ch190Ns+Ur97h/XAfOnxeEv+UWBw4qPZgmS2kyxyL/PWXeYq4kpX70s4jebT/+nGMSEpLn5COiyjxoHKOR5MnhUdI0z5rI8rLz+RNYrhHAgr83ds=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731647467; c=relaxed/simple;
	bh=bMof4FIpL1SnyL4QAlpzk/ifKtARSJDzYtMMiyiNyEk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cga044llyDVkaM5iGn5YsU7eZ05bfxL/4SAuY3cTy3F8V9tgkxK88Sy35eOI9u9UBSLCkdgRjIeRz4+tpk2o0V5+8XtXoHdCz1NzjAUWC+ftbkYYyakJeDW3QKw73PQe6U4F4c6tmNvP/Lxwm9p1tKRw+VpUIWqX1x5tId5t/kg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E229I3NX; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731647466; x=1763183466;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bMof4FIpL1SnyL4QAlpzk/ifKtARSJDzYtMMiyiNyEk=;
  b=E229I3NXWRDnic8ib49NMbc1B3hzDfxMEHYBzmizQ1T2/qnXw3YTdBwV
   /MXMO7C4oUfhvQ856tJzMf7fftklPZzxNKy7Nb0bCfN2T47uXlZxDLx9K
   T0TsF6nYJv0hJ5o+kJx8wnOgpJvDd8uUe5uBM9IsoY9Vjx7olpLQH8cWR
   OY5aK1goIXyM8xSg/KVriE11XEUDjM00fgx5HUTo+FT2g4PX2i/yTnjYA
   woGsUxb3aMGkyzqvougvQ1ak9BpIJZPTJwriFfurhSmlflABqeQiyOBRT
   M/XodKpqOfT4IjAOv0vvdTkD0K3bc9EDUwnJr+zhdpvHK+4ctmJbe2fKf
   A==;
X-CSE-ConnectionGUID: QEA6eGciSx2sPhWDsSQJxA==
X-CSE-MsgGUID: VAFrTKv2QhyL4AMgXPJIcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="57045736"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="57045736"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 21:11:05 -0800
X-CSE-ConnectionGUID: eHZIYTz5QJGe3cNb8MhP8Q==
X-CSE-MsgGUID: SG+XEOo6T8S804QRnmnKiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; 
   d="scan'208";a="88005708"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Nov 2024 21:11:05 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 21:11:04 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 21:11:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 21:11:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QW9dLXVmxCD3HspFW6ySV/o3bhUv59ODayFi7yTZsEcfUc75+GjBqlFL2NSFhB2WUCYIQqTYR8MRMFkI9N2y3kIE9YBDN0DmWtWYN9TPjGk8S2aS0h/w9XK9DiUHpCWYqhbkx/3S7qwWW2fNLfAZ8NgrjL53MXJSqY3Rjly4dfOUdXBTzt6cq86wKqMYWa7gfPBXjjjQRBSp3bPJ91YiMHc19lJSru4STBfhUjgZwnAwt9Y1e+B7IRMWXUijH67zOsknTzF8x583lhGAx/PYRGbTZ0AotUNXTs8kXxYnf+ttoYxbhbZjrTlaoe8OhV3rETx0PCpDJlDyUxYezY/PCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMof4FIpL1SnyL4QAlpzk/ifKtARSJDzYtMMiyiNyEk=;
 b=rcanOf+cGH2NOCg3YUPYNPEj/bsp+hwuRnV8SQdegq73Y7hEAchyT+4wRxoDsmhCUozF8zeYLHTDyfc2U5uLmwAlWzywlnczyzu20ZO6kmG4xQ0KdVCEx3WDHzhIFok0K3cCEK2OHW1YES39E/7U90mqjtpzqGSnApmBvb0dAS5lKP+uNpgc2sv9DyEeVP3gDBKXpMmV4EiD1c2W75UJm7mDKWRz4GFFjOxttBbVc5FFaVCcTlvUiOwNiGxFfYTuOkcq+BbMl7mBMdPUAyOqEScuAxnZnbaXt1nyfODkoSuKiyH71UVLAElXzT3JGcGYqZ1sVfE0RuA3kwVPf12Z3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Fri, 15 Nov
 2024 05:10:55 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%5]) with mapi id 15.20.8158.013; Fri, 15 Nov 2024
 05:10:55 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, "jikos@kernel.org"
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "Aaron, Ma" <aaron.ma@canonical.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>
Subject: RE: [PATCH v2 01/22] HID: THC: Add documentation
Thread-Topic: [PATCH v2 01/22] HID: THC: Add documentation
Thread-Index: AQHbNlbmu9jwsJUh506r8H8XRm+D8bK3ujCAgAASHmA=
Date: Fri, 15 Nov 2024 05:10:55 +0000
Message-ID: <IA1PR11MB6098EC67DEAA5336F4F47B19F4242@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-2-even.xu@intel.com> <ZzbIP7tOEns0Fy-U@archie.me>
In-Reply-To: <ZzbIP7tOEns0Fy-U@archie.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|LV3PR11MB8484:EE_
x-ms-office365-filtering-correlation-id: ced54807-701e-4323-3d75-08dd0533e214
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a3gxbS9OK2hwbWJ3M3NNQzhNT0lqTmJWR1luYUR6ZmRuSjlTS0FWeFpFaDRI?=
 =?utf-8?B?Y3ltUlBQTm1obnFPbTlMaHoyS2F5Ly9pZFc4TnN1cDhVSFV2K3BqcnQ5VzBY?=
 =?utf-8?B?UTZSWFk3dFFDbkF6bG1iSmZFZ1h1bDRSalR2OFpwNis5bkVKZFpmNTdselVo?=
 =?utf-8?B?c3IyeFRIMlVwbTlkMEFxOVRIWE1LYU5MK1NYTzExRGlaaEI4bFdRcnp4UEgv?=
 =?utf-8?B?a3JaTTYrSE9ocy9ZVzRYRjQ4UnY1dkl6UTRvWmR5Q1g3Qjg5RGdxM3ZhMXI5?=
 =?utf-8?B?YUcwM25od2JkTU5Rd0haRVNaaHdhdVFEc0czTHdMRUFXWFBxMkViY0NUZ1hC?=
 =?utf-8?B?cTY2TzN5c1JxVnF6ckxOeEtkZ2pLR3pFbzR1a1JkRFk2d1hFdUNVenFadTcr?=
 =?utf-8?B?RVByRktKSVhxaUVKWXZ1MDY4bmNwV3VLSFIrY0M3eWdPcmV5ZTF5dGZZbjFX?=
 =?utf-8?B?bFFNamFlK2xUMkx1MTZZeFJuZ2puZlZ6aW1EU0dXVWJOOVFUelhJMDNLOHh1?=
 =?utf-8?B?L1BKZ3lYTzFFb3pQMkUvZisyYjBsRW1sTVpicXEzNS9aN3hFL1dEL2Y1MCtP?=
 =?utf-8?B?YmRUUHE2cXlWYTFHL2NlVXQxc05FRnBRSlJkTGt6eXMwZ0p3VUlNd3B4Smlu?=
 =?utf-8?B?MHgzQUV6SDRtNFpzU2VDbTJLZG95WDVkYkd0NjlZU0NHMDhIQUxUdEVXSkdT?=
 =?utf-8?B?VlNqWEVPVy9rQlZOZS9NWklvcys5T0c4bzlxZTVYWitwU0I0Rm1MUStENFNu?=
 =?utf-8?B?Z2tyUTBFZVBIUm8rb2pNb1dYcWVNZGZJd3Y5dkRyTjNkaDBlMXRGQmNKYzlm?=
 =?utf-8?B?cmJSTlErOWo3dS9lRHJYc1VSQTZ1QjZwaEF2VmducXB6aFlISkFaR2JkbTg5?=
 =?utf-8?B?dzA4VTk1VzgzbmpaekY3NHIxZ3dWRVlBMEhXYTV2Mi83c3RhOVpzbXJNV1BU?=
 =?utf-8?B?c2JQRUJNZkVGMThIUnVEOHA5WWNiNjl4Y3dHYlRhKzlOTU1yTFhORXlybG1M?=
 =?utf-8?B?NXZFNmdVcTJGak00cnpUVGg2VWNWWHorckl0WEx2dkg4N1dCSzlFMGJCS0Rl?=
 =?utf-8?B?QVVxa0J4OTNadW00QXQwWHR5bkUzdkl4T0tqNTR4TG0yb3dpYTJFei9zT2hS?=
 =?utf-8?B?am96dXdHZE5TTlIxL0RIVmhHaXpQdFlFUFF0TjJ0eWwrTFFiNHBEM1VQaVFF?=
 =?utf-8?B?ak1SWjFqdnUrVUczTUF0Q0pQR1BJYkFYdjUzVENaWGRqaFh5c3ByRkNRMXJR?=
 =?utf-8?B?VnlrUWVINjduY3hBWlJDNG1VbzAzdUo4bGFucmFVeHdQSnBnV3p2VkI4Y3Bm?=
 =?utf-8?B?eXdSdWNoTThjVG1HWTZmeWw3eE5NUGh2cWlKcDlmZFJMSUpaSWFyaXdOVHg5?=
 =?utf-8?B?VXhGVEFnMFRJVURuODFDNHBUdzg5dUtXVW1HZkdJbTBiVkROdW1HUFdONTVS?=
 =?utf-8?B?dXZmYmxhWWtxYTZaMUFnQ1JSVTRxQ3NzVFJJYXBLL3dTZUNJYzN2dHJGekVl?=
 =?utf-8?B?UE1heUJwb1puWkR5cjVqZlhTRGRRM1NEK3k3TG5MVzlCM3NDcWc5SGFUYUl1?=
 =?utf-8?B?MC9Ba0dlUXhXR25IYWVVMGlrNlNCaFhhNGkwSHhXQUdZR2ZjNzVRaXRmSlNx?=
 =?utf-8?B?cThzS255d1FRMUFLR0FpZFI1K0E4MjNWUFFKMFJkaGROZUczS25ya3RSOVlm?=
 =?utf-8?B?K1BESVhKSGJKRzZIY0RKRW93RGhEdTZLUklxVEYzR2QrOTIySUJOVUpialV3?=
 =?utf-8?B?bmJWUkFwQ0hHN3RmR3M5ZlFYYURWWDZzR3NhOXNXc3FGNFJDM3h3TTZmY2tH?=
 =?utf-8?Q?9AUFsra2TR/F6bMZhDrcqU1ZBGwcQDLXhhUm0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ei82b0R5UGFpWTdkdWVBeTAvdHB4RXBReGc0VnFEaU1lOU1BYndsTSt3Vnlj?=
 =?utf-8?B?YUxBVnlLQzk0VGxzMXpsUVA5cXRVcE9jeWFGS2sza2Q2a0V5NFFWenNUMENj?=
 =?utf-8?B?eEwyM3NHcUZGcE1VTFVqSDRYQjBHOGZFREd1WDZIRmVoaHV6cE9WYWNWWTdi?=
 =?utf-8?B?ejRwYW90dDN2OEpjTTJITVNVK3lQZVdyVVdSQWpsYlRYS1VRbGluOVRXUXFs?=
 =?utf-8?B?NlBuSTRPS1VUVnpMT0xsL0FMYlREZ3RQZ1FOTUZEankxZ1VQWXhYbGhHUkZy?=
 =?utf-8?B?UFF5UzlZVFpZajNKUVpSaWtPeXRoVWxSWXBtWlBacEMvZTc4QWhXMVZSTU5v?=
 =?utf-8?B?ZDVnZGIxRllGQkUrT0h4cytWNTliU3MvK2Q3UGtmT2QxU2VKaUM0N2FWNjVR?=
 =?utf-8?B?a3RZZWQwY2dweC9UMFBpaDZFQmQwRjJ0RlR3dUJ3Y2IrNnpPUVRxdjZHbG9z?=
 =?utf-8?B?UUIxaytMeTYxTGVYZ21XN3FNQm1MQXFGYzgzRkZjTzhhWlRLMDl3bE0wQUdu?=
 =?utf-8?B?L3E5d2hhQkhTeGxlK253RktCeG50c2VhTzNQYmV3NzkxMjE4SlRKODAwUUQw?=
 =?utf-8?B?Qy9pWHhtcE1IeGVXNHM3bUZuRG5odXBsUG5iNVJxT3RDZFlRSXAvd1BSQVI2?=
 =?utf-8?B?TTlrMVN2TnNzT20yV0l5d09EUC9KMHp4OVpBV1Myc1RiL2ZNd21PVlB5b3FP?=
 =?utf-8?B?dTgrL1JVaTNaYVE5dDcwWEMvMGJkbkdnbE5ZSEpOdkdnVm0rUmNjL20rSTM0?=
 =?utf-8?B?bWlUNDdvdExiMTJVY2lHK3BxdXRaM3FWeEprVDFtYzNYOElRUzhIM0hSL1pH?=
 =?utf-8?B?ZEQxVmtlMEZXa3ROazNZMlFKSy95SVlnUmpiSVpHVStaUlpjY2tYNC9xYVlJ?=
 =?utf-8?B?U1ZxaUtrcDltNWJidXEwbW43S2hVcDhGL1haY0d3QVA2dzl2UHFVdzhvbUdH?=
 =?utf-8?B?TzFRRHBybnlaZmNLUUlJaEF2R1pKTGFtNDFsb1NEYy91ejhjU2tvNGJtaDdG?=
 =?utf-8?B?YWhuZHYxZVoxaGo2VEZWSVpDdUltZ25mNmFkb0hoV1BHbFJwTk9nNjlvQzc3?=
 =?utf-8?B?aEh6Q1BweUdkRWp5LzlVUjVuU2RkUnNFcFljQVZ6THFaVkdJVXhKeGtzck1x?=
 =?utf-8?B?OEFWZGlCeFZDTHdMMmNvdnBRYWJvSG9ncXZ3dnJuUVlEOGxJeHlUUjJmTDNZ?=
 =?utf-8?B?U3NCSHpVUFJSNWlkSDFpRU43emJvam4vdTNjMlhjeUUzcmxkb3BCZk9rVDhH?=
 =?utf-8?B?ektPNzUveEhENHVyRHFiM2w0T2JTOVo2WGYrOElOS1JMWVkzbTd5VVVPV1Ux?=
 =?utf-8?B?aWhHVDRYdkVlWmFoVUdrT2Y3RWpBL3Axa2cySk5qM2kzaUNTMUJJUVRwKzlV?=
 =?utf-8?B?N1QzamFEcjNJZk5FemhHckdJTnQ1SGtKOVMxcFU2eFlRVXNlL1BkUmJaVk5V?=
 =?utf-8?B?YnBldnR6OFJaOFU2NzFzQ1huWWt2Zkh1RjNpdjlyMDdxNmkxWmdhbTJ6KzAx?=
 =?utf-8?B?djcxVWJ6UUpYdlYxWExWVXFXMnp0VmNlQnZBcS9NYU9MUXJ0OFJmc1hwRVEw?=
 =?utf-8?B?NUpNWDZWV25hUVZmMnppd2RqamFqeHIySnd0QUpuWHlvVVBYaFlyMmdvNTN5?=
 =?utf-8?B?dkVyQXUwVzZmcXpGSFowRFprUW5hVEx3SmdmZjVHQU1tL2VhTGlQUlp4cjJn?=
 =?utf-8?B?Vm83T25MQ2phemJyMWJ2eFV3bGl0eXZQTXl4SFdoNUtSSUJHUFRnNnZaWnZm?=
 =?utf-8?B?WEZnb2E4TzlpQ0NDUlg2TkxPN1ltaUdkQXdpbzZzVEwrYWJlZGI2d2NhQ2tu?=
 =?utf-8?B?RUtFTjA0Z1paSytXZVVnN00wRC8vQmtuaUc5R0k0QzBLMkNYR0k0ZnE4UDlM?=
 =?utf-8?B?SWRjVy9LQm9FQVY1Q2h6d25xYUc1NTVNa2hVeEd4MUs3ZjFXcXY0Y2FTa0hn?=
 =?utf-8?B?TENkb3dLZ24vT3NhblJkd25JVkhwTGw3TzhQMXdKK0lmdFhmRGJXQ1c3SmdE?=
 =?utf-8?B?WW9JMDg2emJZOWEyeGpoV2NIekU1ZjYzMFJhaTlJYTlabXJEMjdObVNUQUFQ?=
 =?utf-8?B?VThrVmhkS2RmL1RMZXVkeWhtN1oxdEs4K2NxVjNhV1FTY1BwSTZIUU1saGQ0?=
 =?utf-8?Q?Fakc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ced54807-701e-4323-3d75-08dd0533e214
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Nov 2024 05:10:55.0901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWvtY76siHQ9mpqlPRO+mftpZw1QiXDx2I1pe2PsjxVl3cbfrv9+25SLLcqqYXPeh4Q4ZSF+xeV3G+MZfyvg+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFnYXMgU2FuamF5YSA8
YmFnYXNkb3RtZUBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTUsIDIwMjQg
MTI6MDQgUE0NCj4gVG86IFh1LCBFdmVuIDxldmVuLnh1QGludGVsLmNvbT47IGppa29zQGtlcm5l
bC5vcmc7IGJlbnRpc3NAa2VybmVsLm9yZzsNCj4gY29yYmV0QGx3bi5uZXQ7IEFhcm9uLCBNYSA8
YWFyb24ubWFAY2Fub25pY2FsLmNvbT4NCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVsLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+IGRvY0B2Z2VyLmtlcm5l
bC5vcmc7IFN1biwgWGlucGVuZyA8eGlucGVuZy5zdW5AaW50ZWwuY29tPjsgU3Jpbml2YXMNCj4g
UGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0ggdjIgMDEvMjJdIEhJRDogVEhDOiBBZGQgZG9jdW1lbnRhdGlvbg0KPiAN
Cj4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMDE6MzM6NTVQTSArMDgwMCwgRXZlbiBYdSB3cm90
ZToNCj4gPiArVG91Y2ggSG9zdCBDb250cm9sbGVyIGlzIHRoZSBuYW1lIG9mIHRoZSBJUCBibG9j
ayBpbiBQQ0ggdGhhdCBpbnRlcmZhY2Ugd2l0aA0KPiBUb3VjaCBEZXZpY2VzIChleDoNCj4gPiAr
dG91Y2hzY3JlZW4sIHRvdWNocGFkIGV0Yy4pLiBJdCBpcyBjb21wcmlzZWQgb2YgMyBrZXkgZnVu
Y3Rpb25hbCBibG9ja3M6DQo+ID4gKy0gQSBuYXRpdmVseSBoYWxmLWR1cGxleCBRdWFkIEkvTyBj
YXBhYmxlIFNQSSBtYXN0ZXINCj4gPiArLSBMb3cgbGF0ZW5jeSBJMkMgaW50ZXJmYWNlIHRvIHN1
cHBvcnQgSElESTJDIGNvbXBsaWFudCBkZXZpY2VzDQo+ID4gKy0gQSBIVyBzZXF1ZW5jZXIgd2l0
aCBSVyBETUEgY2FwYWJpbGl0eSB0byBzeXN0ZW0gbWVtb3J5DQo+IA0KPiBJIHNlZSBpbiBteSBo
dG1sZG9jcyBvdXRwdXQgdGhhdCB0aGUgbGlzdCBhYm92ZSBpcyBsb25nIHJ1bm5pbmcgcGFyYWdy
YXBoIGluc3RlYWQuDQoNCllvdSBhcmUgcmlnaHQsIGxldCBtZSBmaXggaXQgaW4gbmV4dCB2ZXJz
aW9uLg0KDQo+IA0KPiA+ICtXaGVuIFRIQyBpcyBjb25maWd1cmVkIHRvIFNQSSBtb2RlLCBvcGNv
ZGVzIGFyZSB1c2VkIGZvciBkZXRlcm1pbmluZyB0aGUNCj4gcmVhZC93cml0ZSBJTyBtb2RlLg0K
PiA+ICtUaGVyZSBhcmUgc29tZSBPUENvZGUgZXhhbXBsZXMgZm9yIFNQSSBJTyBtb2RlOjoNCj4g
PiArDQo+ID4gKyArLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0K
PiA+ICsgfCBvcGNvZGUgfCAgQ29ycmVzcG9uZGluZyBTUEkgY29tbWFuZCAgICAgIHwNCj4gPiAr
ICs9PT09PT09PSs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rDQo+ID4gKyB8ICAw
eDBCICB8IFJlYWQgU2luZ2xlIEkvTyAgICAgICAgICAgICAgICAgfA0KPiA+ICsgKy0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiArIHwgIDB4MDIgIHwgV3Jp
dGUgU2luZ2xlIEkvTyAgICAgICAgICAgICAgICB8DQo+ID4gKyArLS0tLS0tLS0rLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ICsgfCAgMHhCQiAgfCBSZWFkIER1YWwgSS9P
ICAgICAgICAgICAgICAgICAgIHwNCj4gPiArICstLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0rDQo+ID4gKyB8ICAweEIyICB8IFdyaXRlIER1YWwgSS9PICAgICAgICAg
ICAgICAgICAgfA0KPiA+ICsgKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSsNCj4gPiArIHwgIDB4RUIgIHwgUmVhZCBRdWFkIEkvTyAgICAgICAgICAgICAgICAgICB8
DQo+ID4gKyArLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+
ICsgfCAgMHhFMiAgfCBXcml0ZSBRdWFkIEkvTyAgICAgICAgICAgICAgICAgIHwNCj4gPiArICst
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gKw0KPiA+IDxz
bmlwcGVkPi4uLg0KPiA+ICtXaGVuIFRIQyBpcyB3b3JraW5nIGluIEkyQyBtb2RlLCBvcGNvZGVz
IGFyZSB1c2VkIHRvIHRlbGwgVEhDIHdoYXQncyB0aGUNCj4gbmV4dCBQSU8gdHlwZToNCj4gPiAr
STJDIFN1YklQIEFQQiByZWdpc3RlciByZWFkLCBJMkMgU3ViSVAgQVBCIHJlZ2lzdGVyIHdyaXRl
LCBJMkMgdG91Y2gNCj4gPiArSUMgZGV2aWNlIHJlYWQsIEkyQyB0b3VjaCBJQyBkZXZpY2Ugd3Jp
dGUsIEkyQyB0b3VjaCBJQyBkZXZpY2Ugd3JpdGUgZm9sbG93ZWQNCj4gYnkgcmVhZC4NCj4gPiAr
DQo+ID4gK0hlcmUgYXJlIHRoZSBUSEMgcHJlLWRlZmluZWQgb3Bjb2RlcyBmb3IgSTJDIG1vZGU6
Og0KPiA+ICsNCj4gPiArICstLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0rDQo+ID4gKyB8IG9wY29kZSB8ICAgICAgIENvcnJlc3Bv
bmRpbmcgSTJDIGNvbW1hbmQgICAgICAgICAgIHwgQWRkcmVzcyAgfA0KPiA+ICsNCj4gKz09PT09
PT09Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0rPT09PT09PT09
PSsNCj4gPiArIHwgIDB4MTIgIHwgUmVhZCBJMkMgU3ViSVAgQVBCIGludGVybmFsIHJlZ2lzdGVy
cyAgICAgfCAwaCAtIEZGaCB8DQo+ID4gKyArLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKw0KPiA+ICsgfCAgMHgxMyAgfCBXcml0
ZSBJMkMgU3ViSVAgQVBCIGludGVybmFsIHJlZ2lzdGVycyAgICB8IDBoIC0gRkZoIHwNCj4gPiAr
ICstLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLS0rDQo+ID4gKyB8ICAweDE0ICB8IFJlYWQgZXh0ZXJuYWwgVG91Y2ggSUMgdGhyb3Vn
aCBJMkMgYnVzICAgIHwgTi9BICAgICAgfA0KPiA+ICsgKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLSsNCj4gPiArIHwgIDB4MTgg
IHwgV3JpdGUgZXh0ZXJuYWwgVG91Y2ggSUMgdGhyb3VnaCBJMkMgYnVzICAgfCBOL0EgICAgICB8
DQo+ID4gKyArLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLSstLS0tLS0tLS0tKw0KPiA+ICsgfCAgMHgxQyAgfCBXcml0ZSB0aGVuIHJlYWQgZXh0ZXJu
YWwgVG91Y2ggSUMgdGhyb3VnaCB8IE4vQSAgICAgIHwNCj4gPiArIHwgICAgICAgIHwgSTJDIGJ1
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAgICAgICB8DQo+ID4gKyAr
LS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0t
LS0tLS0tKw0KPiA+ICsNCj4gPiA8c25pcHBlZD4uLi4NCj4gPiArSW50ZWwgVEhDIHVzZXMgUFJE
IGVudHJ5IGRlc2NyaXB0b3IgZm9yIGV2ZXJ5IFBSRCBlbnRyeS4gRXZlcnkgUFJEDQo+ID4gK2Vu
dHJ5IGRlc2NyaXB0b3Igb2NjdXBpZXMNCj4gPiArMTI4IGJpdHMgbWVtb3JpZXM6Og0KPiA+ICsN
Cj4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gKyB8IHN0cnVjdCBmaWVsZCAgICAg
IHwgYml0KHMpICB8IGRlc2NyaXB0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfA0KPiA+ICsNCj4gKz09PT09PT09PT09PT09PT09PT0rPT09PT09PT09Kz09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPT09DQo+ID4gKyArPT09PT09PT09PT0rDQo+ID4g
KyB8IGRlc3RfYWRkciAgICAgICAgIHwgNTMuLjAgICB8IGRlc3RpbmF0aW9uIG1lbW9yeSBhZGRy
ZXNzLCBhcyBldmVyeSBlbnRyeSAgICAgfA0KPiA+ICsgfCAgICAgICAgICAgICAgICAgICB8ICAg
ICAgICAgfCBpcyA0S0IsIGlnbm9yZSBsb3dlc3QgMTAgYml0cyBvZiBhZGRyZXNzLiAgICAgIHwN
Cj4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gKyB8IHJlc2VydmVkMSAgICAgICAg
IHwgNTQuLjYyICB8IHJlc2VydmVkICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfA0KPiA+ICsgKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiArIHwgaW50X29uX2NvbXBs
ZXRpb24gfCA2MyAgICAgIHwgY29tcGxldGlvbiBpbnRlcnJ1cHQgZW5hYmxlIGJpdCwgaWYgdGhp
cyBiaXQgICB8DQo+ID4gKyB8ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICB8IHNldCBpdCBt
ZWFucyBUSEMgd2lsbCB0cmlnZ2VyIGEgY29tcGxldGlvbiAgICAgfA0KPiA+ICsgfCAgICAgICAg
ICAgICAgICAgICB8ICAgICAgICAgfCBpbnRlcnJ1cHQuIFRoaXMgYml0IGlzIHNldCBieSBTVyBk
cml2ZXIuICAgICAgIHwNCj4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gKyB8IGxl
biAgICAgICAgICAgICAgIHwgODcuLjY0ICB8IGhvdyBtYW55IGJ5dGVzIG9mIGRhdGEgaW4gdGhp
cyBlbnRyeS4gICAgICAgICAgfA0KPiA+ICsgKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiAr
IHwgZW5kX29mX3ByZCAgICAgICAgfCA4OCAgICAgIHwgZW5kIG9mIFBSRCB0YWJsZSBiaXQsIGlm
IHRoaXMgYml0IGlzIHNldCwgICAgICB8DQo+ID4gKyB8ICAgICAgICAgICAgICAgICAgIHwgICAg
ICAgICB8IGl0IG1lYW5zIHRoaXMgZW50cnkgaXMgbGFzdCBlbnRyeSBpbiB0aGlzIFBSRCAgfA0K
PiA+ICsgfCAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgfCB0YWJsZS4gVGhpcyBiaXQgaXMg
c2V0IGJ5IFNXIGRyaXZlci4gICAgICAgICAgIHwNCj4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0rDQo+ID4gKyB8IGh3X3N0YXR1cyAgICAgICAgIHwgOTAuLjg5ICB8IEhXIHN0YXR1cyBiaXRz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+ICsgKy0tLS0tLS0tLS0tLS0t
LS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSsNCj4gPiArIHwgcmVzZXJ2ZWQyICAgICAgICAgfCAxMjcuLjkxIHwgcmVzZXJ2ZWQg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8DQo+ID4gKyArLS0tLS0tLS0t
LS0tLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tKw0KPiANCj4gU2hvdWxkbid0IHRoZXNlIHRhYmxlcyBiZSBmb3JtYXR0ZWQg
YXMgdGFibGVzPw0KDQpHb29kIGlkZWEhDQpMZXQncyBmb3JtYXQgdGhlbS4NCg0KPiANCj4gVGhh
bmtzLg0KDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiENCg0KQmVzdCBSZWdhcmRzLA0KRXZl
biBYdQ0KDQo+IA0KPiAtLQ0KPiBBbiBvbGQgbWFuIGRvbGwuLi4ganVzdCB3aGF0IEkgYWx3YXlz
IHdhbnRlZCEgLSBDbGFyYQ0K

