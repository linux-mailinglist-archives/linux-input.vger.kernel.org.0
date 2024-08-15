Return-Path: <linux-input+bounces-5583-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A4C9527E7
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 04:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 44B8F1F223B3
	for <lists+linux-input@lfdr.de>; Thu, 15 Aug 2024 02:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8500BDF5C;
	Thu, 15 Aug 2024 02:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNKZFZpo"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0806C8F62
	for <linux-input@vger.kernel.org>; Thu, 15 Aug 2024 02:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723688597; cv=fail; b=fM5aXsVkfJorGCm6ZffIyUvxLxBkFY1lnrerAPpDjGDVHTLmLTwE52ZD4G4PFVdsQvecOO5/GnGGuwnh9alQwWUHKotiy+3UIbj8eEux+sQVqH+igsiNpsUjPU9oNkwXbPFPni07P4zrDOVa7Lya9Sdc1reI5xvKrVT37/eEIQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723688597; c=relaxed/simple;
	bh=JW/JJqdpGckYbmfcDEN9qP3EI/kePeG2JivCVFwePBo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dn/rHD5WYqghLZ1SlQRSrMs/+z/yeu/T3RPjbD6SbtCEQaEa5IbwLHXHA1Uw9QvI5Qrxe+E2zdn8+4Z82o929BbrBxI/fV2U6FB5XJLHTDF+w3+Kime2mpj+F0Uv6O63zpNh55Rcs5WoCLH2ATpcx26dPem+1RqzdnrCQYNGlro=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNKZFZpo; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723688596; x=1755224596;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JW/JJqdpGckYbmfcDEN9qP3EI/kePeG2JivCVFwePBo=;
  b=NNKZFZpoeaU9VE/zEyVucwAzPEiH9Txp/RgZKDCQBt31D/NzUy/9NGRT
   tCisG6sB2y0kYuAttMoT4EMukMbTCvvkn8dgX48MZ9mijPn01fUC1sWph
   ZfKDMJV97gC2eQP9Unc7A89izzKSoppfxq1Kxx1mIXjpUy0uhAilDYQl+
   Ih0mZvpWTMkY/i6i+aXjgCjsiw/Dr88sPsOXUN0wDR3EN0AfqCc+q4xkl
   X1SCPquaINKRZI8E1bwClaXaW9pB+pGVCvw8AbLR+ND0JthHUmsS2gWF8
   uQ1QGJAHF0fP3l6nAvVbqPS3OhHPVcc6UKvnBnCz3XvOleCGoHO39lbhQ
   Q==;
X-CSE-ConnectionGUID: nqy4xarQTWqQSscp/dMhIA==
X-CSE-MsgGUID: ErFoPykKT8m3A7m+oX+o8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="25797593"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="25797593"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:23:15 -0700
X-CSE-ConnectionGUID: t39maRcqTI6Gxhr5stJXEw==
X-CSE-MsgGUID: yIgsTbPIQFKfBwnpqxOgIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="96722992"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 19:23:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:23:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 19:23:14 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 19:23:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OL3ICsMjbk30l5BaykB81Z7bvVaGY6MV13ZpDs2mCxeczFBPiI2Fj+g8OjEetc+r7yPCUbZnMta6vqmUPDa2umyEpCoVFJ4zDk7INvYMOGF+qXdgTsANmEPg2Iq6H0ZlY391M3CHUrp36o+eX+h/Jp54ObAT2hg3a59KUR2lV3QhJH7ZLPhhkaUyjvs7nMIoJQ3FW1f292wGq5UNpN7JGMR+UvG28UZcGbvFcu/4ogblDtaiY2SFqJIWdPQRWpc5MEXg7gaoYZA+K2SMbiav73lVw7pp5AolOfyINRL4byYRcA+OFm0rrj/YJ7LfxEeR7/8jsoFw58tm1XQbsClL8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JW/JJqdpGckYbmfcDEN9qP3EI/kePeG2JivCVFwePBo=;
 b=sms3ebAjuCrr6XPdbNma7H+P1eXXeo2VMfEVpks4HE9DIih2qZJ4Tb6weS66pDAiXgFUK1BBcmjVTZTALV9eLGWMuJcPwudKwDwZONS7XSzVXMmkxm/M/FRx3Yfw/OfG3hHvDWXY7vWM4jXcjHfOGfs0N4BLwfaY8ehR6qsFQRcAEPcaP4sJ2aL0Q/5xWurJtiYF3M+5qpxCu+OgFqebmB3bQLjHJFRAdTLQWrh2PV2Tk+SoHfPEiHYP5cshEJuX/Nbvb7S3MHL/83+/8ZVA19MCUbGqjam/iaw0otv+S+KdTfVe1Ttne0Lni4svzMiGL2rTvNcG6KI/mevMkbzrBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 DS0PR11MB7409.namprd11.prod.outlook.com (2603:10b6:8:153::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.33; Thu, 15 Aug 2024 02:23:12 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 02:23:12 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "benjamin.tissoires@redhat.com"
	<benjamin.tissoires@redhat.com>
CC: "Han, Hemin" <hemin.han@intel.com>,
	"Wang, Yoshi" <yoshi.wang@intel.com>, "Xu, Even" <even.xu@intel.com>,
	"ilpo.jarvinen@linux.intel.com." <ilpo.jarvinen@linux.intel.com>
Subject: RE: [PATCH 2/3] HID: intel-ish-hid: Use CPU generation string in
 driver_data
Thread-Topic: [PATCH 2/3] HID: intel-ish-hid: Use CPU generation string in
 driver_data
Thread-Index: AQHa7TOZ0OUYaB0DlUipGStnqNuxd7InmNwQ
Date: Thu, 15 Aug 2024 02:23:12 +0000
Message-ID: <DM4PR11MB5995682D7495E6FCEE860FED93802@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240813034736.812475-1-lixu.zhang@intel.com>
 <20240813034736.812475-3-lixu.zhang@intel.com>
In-Reply-To: <20240813034736.812475-3-lixu.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|DS0PR11MB7409:EE_
x-ms-office365-filtering-correlation-id: b3ddc22f-e6dc-4c29-93c8-08dcbcd1361b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IMDXUP/FICkBskB8QaKVo0Xr5A1RPCuQ10mUcCKxkg4662/stpNOYK0zMp7h?=
 =?us-ascii?Q?E9NPJu+0gjyklUbNGC336lycRxKWA2EEjxoWvzDhkRehPiMC8m2WEJAQhS6x?=
 =?us-ascii?Q?d1yzFX+gyZELUqum6HrPdQXNiusQdtuqiY8wQXvwwb9MuAZG0ZaQ4QrJll5c?=
 =?us-ascii?Q?zH3a3FB1g0tAtsqYlMKC+PrkSoDAtp6JfiJagz0EfPD7DBwQv6QpyJTqOgUt?=
 =?us-ascii?Q?DLgMw7nV5wsQBLPv846S2vtx829NkrzcGIcFG3Dsu1Uw+DFJ2zWiIVuPi68C?=
 =?us-ascii?Q?gjGN0JPtCD0uKBvNl/zvvMVmmm9vHc+QBf38SUB2EMVu7mJtBPqbjK7SjLGR?=
 =?us-ascii?Q?FhR/jhss7loksmTrvOBZTPLc3Gw7MAl3HxlDwlz9l2+JJCoivSwrOIujUwK/?=
 =?us-ascii?Q?5YjfQAeJci3SS5HL1wSgRz/1GiT4O29ldLsiPpe+tHWc7kG0mTAxoF5zSn5R?=
 =?us-ascii?Q?OUlACP27rw1UFTyJyQaa6rsYzE2hUFI+dTKQXx2eEQLvp1q0CzmGFF5U7JG2?=
 =?us-ascii?Q?o+gmwSnAdvMueUwokGqrqU33LgBzf/x3rgbZdrqt1EjCGjlJN2Ybwa5jAZaj?=
 =?us-ascii?Q?q8FuUCUdR14uPWLBryUlidQXVJ8HtBS459NnbrOSjvs31U7D3W4LyKv95oBo?=
 =?us-ascii?Q?t0zSznh+HpXu1ZXyYZ18KBdFxoYIAx091/+TAhbYhojqtj32OZqzASynuiip?=
 =?us-ascii?Q?vRul9dIA6alikD9j1nGRPbfCeW305FogRbSdkey9EXwTJ2v3nOIY2oa6sBnA?=
 =?us-ascii?Q?Gj/XPpucdl9ryl9AErw0ORTeZVXfotm85cixOQDVbrAWqd8MPhsjOIXzjNZj?=
 =?us-ascii?Q?ZolBng+XHByugOKUi/x7+U3ejhMu/Oo2v7dmYpWiCXJt+eA12pkQQMSSuu6G?=
 =?us-ascii?Q?WhjL+EADVFebhOQOpClR/FHPXHLVedcSopa9aSGiZPtyZ9v7FZxgfRQelu3G?=
 =?us-ascii?Q?fsd9kqPGNZN8tX23gPPLzRcdwJAdkWS8LVoTbm77FUxhRC6wjSHV2OfQI3yH?=
 =?us-ascii?Q?EnbW1+yWMripxNfjqOKWQjO1+ASf5xkF/yWnYfufeFaMr6EdSXa9/ndNLaPj?=
 =?us-ascii?Q?sgsiO+qU4/TLZrCAMzyfYvP/Mxfjzi1LIaqrzziC49iBdgMVVsAFuM9EMCZz?=
 =?us-ascii?Q?znmQXQ7lCQ+DzpaWmmXxyUDT0GCsJy6R3wHdcvdyvh6j1t/f+ekCA0gtrYcr?=
 =?us-ascii?Q?q6tDJqmhYE0tvl6ppjSRfbHARzeIuRPxlTl65qYZRimlvJT3xGsTA6+/4XIV?=
 =?us-ascii?Q?u7q1OIYLMnWt+I5tPy70YzSavvfO/iYg6PTGRR9qm8tRz43CEAHvTqsrkTDH?=
 =?us-ascii?Q?YfL+8rxPy7vTEPPPN4xcbEwn5NDIExCbadLMc0TzYb7rtBiVPpunR/mipuNt?=
 =?us-ascii?Q?dcMk6ix8lodQp5veFhhbVH9k0WrCBkG7bAxu2mY2bmigGjoWmw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rKqg6xR/6LLXTU7oK627JV0cE94S5zU3WXOccDdfLG3GazLDk7rU6GBjdgNc?=
 =?us-ascii?Q?aRCbPQ4IP5n+wYl8QbY+1A2JXe7pvyPotzR2jfDwjRs8ZI3BX3Cr0V69s4Yr?=
 =?us-ascii?Q?KDm7keTRu+beIBmjyaMJAcps3h293q3YtD/MqZVIr3/f0oNQgxbpXSuMI+Ql?=
 =?us-ascii?Q?GezSTyMjur3y2rR3iKzGJDMde0y71ONNBWauTwnUdGKhlKnpyw6dqYSSQfxp?=
 =?us-ascii?Q?rB5sMfKpFow5PXDwtcs+ECwxXult6LdfoWHedVzwKIYUqR0i40CiKFyEMmRs?=
 =?us-ascii?Q?bb9y3nLWsK7snKcJlGZT1yru1/vL/JyApJbp33hb1UyAOXgxUE+rASXqxiUg?=
 =?us-ascii?Q?TqBCAq7ImXtAkQPc82gyQ0VxKJdQRrv15YMmVygaNWTAhokFVE93RDSRqshs?=
 =?us-ascii?Q?FKqxHPozloHnotX/i4qKmw4iLnbwwSfsRkFAXw+by/MlRcw6c/PAWOfGWjqT?=
 =?us-ascii?Q?5cdrFQ8kj+3Ay38OypUE4Y5kzOraIUGmuXGL/aeDq9M5B313eVv0XDpjJfd5?=
 =?us-ascii?Q?OQF5D6uCtF3NZFdsly8+ygPESq0BprUs77vKWPyfcd87VDF9y0130eagEkGu?=
 =?us-ascii?Q?+UFYDKsVf4O0r6UgR2e1DjXDhewBNBjP8LPmM0ODCSqqX+53/40sQvp+Eend?=
 =?us-ascii?Q?96h1ijmuIgRKS4Keq/6H2Erm46UcFe/hUpf2/0eQrDbqyX6K308eQetQtBO7?=
 =?us-ascii?Q?JA0+RHIZCMpI4yme6OH5YjYmb0fg/Yzg5hum/pVNYLV3jX/62Poq227yxP0o?=
 =?us-ascii?Q?Ltx/yiLkrYKRR+Qg29SVZyVQ/k1E6m7UJhlRKtp8TswGydgWTBFqinbAKDCk?=
 =?us-ascii?Q?qE0WcBYCi4x75SuZ0RBkZvnQg1zuQ/FSzpsV4Zo/OKoeObVLL3dYsqMejWO/?=
 =?us-ascii?Q?DsflFezUuFdXBp+/DuUAWm0Utv+rQ2tEJUICNAw3PdfioxKXRB9Hf4LujNfu?=
 =?us-ascii?Q?RyNwr8MPGyMMK0Sjs1JKyXPk4nmE1nW/8p0+BjAk6I4HhqgnC6Pp2VA1UDIU?=
 =?us-ascii?Q?O0VNX+lsv2j22NbG5FQdibcqX+uZwphDzhRxEwuH7wGbp12n6Q8FwC/T7CRg?=
 =?us-ascii?Q?7a+uj67Ujx4FCk/rW7E4wyDdDn4vLlV5u1rxhko/t8EJQDdl0sdBYPmJx0cm?=
 =?us-ascii?Q?9cmKWYc+QG7qfQX/Um4hEjQ89/03Y23+Jg5lSyLQETKnqX+5gI4XKyeD/CZo?=
 =?us-ascii?Q?9gMBDn5ca8mRx0QUlq8Soq5grvpxgJ/MYrdlSHG2MeD1sTEcTXErFKrlJ5eW?=
 =?us-ascii?Q?7Ha9ba3HcVwy14OvAvSdriph27mOCVcLtVN2uQL7J1+rdaDdNUvuj4e648GH?=
 =?us-ascii?Q?nPUWCCqnuI1jBNwEanHSCa+XTsVcvhenaDgE1k2EfyVjmK82nytEhchvV7d4?=
 =?us-ascii?Q?kQDHCTMcgZ8hDqOSNcxyLR/wrpaxQkpXPo76TxtIEqkMdBNUvnL/7pYszpxf?=
 =?us-ascii?Q?RG0le1Zg+9hEeD6HAeYaivhCwX79AcbRAPh++IjdTlP6QBga4+y13NjkbOYu?=
 =?us-ascii?Q?ky4aONvIeWM9yB6M5cN51uo4CmtN7HeIIdkJLiihLMdemE9ChvwUdbZB2cDH?=
 =?us-ascii?Q?9HP77wSxDs7vBaacc7mDdmMsazFc7SehBw9SQ6na?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ddc22f-e6dc-4c29-93c8-08dcbcd1361b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2024 02:23:12.1714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BYpMJiszMnHthLFlPnr8QYhIHgOFRWJiU+yd1O412+rWjZWCgHZjFpiB0m7kuoALvgaeY2Kf/Xn5/moYTEciJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7409
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Zhang, Lixu <lixu.zhang@intel.com>
>Sent: Tuesday, August 13, 2024 11:48 AM
>To: linux-input@vger.kernel.org; srinivas.pandruvada@linux.intel.com;
>jikos@kernel.org; benjamin.tissoires@redhat.com
>Cc: Zhang, Lixu <lixu.zhang@intel.com>; Han, Hemin <hemin.han@intel.com>;
>Wang, Yoshi <yoshi.wang@intel.com>; Xu, Even <even.xu@intel.com>
>Subject: [PATCH 2/3] HID: intel-ish-hid: Use CPU generation string in
>driver_data
>
>
>+#define ISH_FW_FILE_DEFALUT_FMT "intel/ish/ish_%s.bin"
>+
The version 2 has been sent out to address the review comments from ilpo.ja=
rvinen@linux.intel.com.

Thanks,
Lixu

>--
>2.34.1


