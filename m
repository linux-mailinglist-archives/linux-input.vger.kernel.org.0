Return-Path: <linux-input+bounces-13814-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E73B1AC57
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 04:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DAB2B4E01CC
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 02:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0071A4F3C;
	Tue,  5 Aug 2025 02:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m2EBPNpv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6547E0FF;
	Tue,  5 Aug 2025 02:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754360091; cv=fail; b=jFkxpm+cI+9FIMWzKox74sidDn+hZw6WousfTiPoLRGixHt6HjaHxPK+E02+VXEMExiIeqikgLMle0pq3WZu8xkrGZkdO80Mg3d1MiB0YYkm921u8AJaOJFokvjmJIk5oVyaWbbIoY38NQkNMMEAZuiT7ltMAbZDqjF23sExLi8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754360091; c=relaxed/simple;
	bh=ThiKC8imGwBgbVbIYhQQMT6/NxaYa66xOek2vRX48To=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U9EfdxMAAk8+6JnSSCP8Ca+GItPYYXod0DbHO+gRQPJ8JEtVXCxmjZFLE0NDejcci29KCYJJLyL8rxvsrmu1uGWybYc3Htfs0KK6Ac6Nj/bYRXe4bh0kYojbJIjMhRbnhY6OHlXMi8eEPX0ZhWyoZQaiLDWP/iXjYx4UqM50GhM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m2EBPNpv; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754360090; x=1785896090;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=ThiKC8imGwBgbVbIYhQQMT6/NxaYa66xOek2vRX48To=;
  b=m2EBPNpvcZuW9a1i9OcZj4UgW5iPSyRhB3wyT2fuJPx9IaIxmTCscI40
   9UyWgWC143ZaanIFliWVZHLgM1FVig+fPYGEXdVPnyOpKNCJE4rd84vOU
   2wDJhTTbjcWrXRtj+vKyzFvS52IWipt/o7NamS5Kapkah4Ac6xZfoklL1
   1IbRzl1U0Shm0j0wB177So4+vhV+BCIdwWjlhFp5pa3DIk+MrFz1Y05sE
   d1d4tPrP4mdSs7EiO8RrFCL5xNJNW6Hejs2XSrfQ7d6cp4qzrVFSlF8A+
   MwXEj678vMXA8j5UnCbU7F4Ny2fRP5/hZGzsAqbiJ9wyF5g1BoIlG1Kb4
   Q==;
X-CSE-ConnectionGUID: FoihRuvdRB6a+KyjRJjSUw==
X-CSE-MsgGUID: pBUVtlBnSuOvrJ2ZBK2SOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="67707717"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="67707717"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 19:14:49 -0700
X-CSE-ConnectionGUID: 3CmVpjgdRCehWmRPclQfxw==
X-CSE-MsgGUID: gtRFbWzzRfKGRFiSgVTrLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="164318273"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 19:14:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 19:14:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 19:14:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 19:14:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCW1VIVeFSADvirgFKTEiWYC8qmkx++tIm3oLbwiVHCNnrCMezL8viUtrrI4ubFPpFfeSsrDKitYYOL8DR2dzhU0eTpy8oMbKxfjwFiblKH7CWnhPVBzRmBWsBxrYiA7gsN9dLZHjK8H6PTvdzndQt8UeahamNLqJLloZPdBsx8TfVBk4g/kE3NNRKaT6FeD33YojzO1QL6EPP2Wrzp1H9SgjLpPFGzoKrCWl9D12fh1OjnbtITpPumECuPuIXinSyAfLfisvOVU+vuHyq/G8fBjZmekSarT+PVRktTDYkJulUVxwXikysOE/atxIVKSBDlWwrUnkB44m2nr94KpSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mwfV75PTJHUCqnLUyCCuT8Iim+Ug9RQTh+H2/rjXeKE=;
 b=LpKB5u2QdznuYjCWLqBRTPTKr5ojI6IKRZ0XW/H33QdqP12V8+m9XD6hvKMAETH0YjBPathQqKVMbpm9XiSSFsKPFZEsMiloiykV7BXFDKSBN/Og3D9l9CNYZa6xpyHLPogM1sgBZYWGbih67W18cso9Dmpzm9V6+JVMjAmAkrU7A6Xfcm/k8Pd4+TOAZCIbvdKfwfAyJPpzZmVrloyZyBvDYEGQgT8pe1rlwvR881wy2S7Q5KvblXpuNF2SUMCO5eQ38EF44LMccbPSDcG7WKVfIvLZPueoHpflWqugjpPJIrX2EQf26ndTc7wKGHqRvp7HB4A3bHHRSB1AWn2s7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 02:14:30 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 02:14:30 +0000
From: "Xu, Even" <even.xu@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Aaron, Ma" <aaron.ma@canonical.com>
Subject: RE: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd
 ICRS/ISUB length
Thread-Topic: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd
 ICRS/ISUB length
Thread-Index: AQHcBEPvGmnxyvUZDkqA49XZjmAj8LRTVF9w
Date: Tue, 5 Aug 2025 02:14:30 +0000
Message-ID: <IA1PR11MB6098EF7F8015E19430762D27F422A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250803065726.2895470-1-aaron.ma@canonical.com>
In-Reply-To: <20250803065726.2895470-1-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|IA1PR11MB8245:EE_
x-ms-office365-filtering-correlation-id: e21917bb-a602-4a38-73bb-08ddd3c5cf9c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?dT47lVMynpYszIAiFwrKQhnRZ3RRs+RAkK/SjvlieSc+LDA/aLOcYNMXzvnG?=
 =?us-ascii?Q?fTLJ/EeUDDc00EAeWH2ajny/YkIPz54POggWFDHZSX5rbl5CGUEEDnDt8mGA?=
 =?us-ascii?Q?dUxfkO2fNjmCnf0iJK/PfRKxkQoafDbdhcQdqY/2GC+ONK0c9U258dLZbOCx?=
 =?us-ascii?Q?d1RlgloluAKf9Qb6k3QfDj7Qh3NrVQdILHtUhKKDOLiDfFmKa16/x7UaH4XO?=
 =?us-ascii?Q?szwre5FFy6Jezmv7a7VOPoaENsiPvKJKEuM20LcDWrkxbo2VWrvxpHNFQjHL?=
 =?us-ascii?Q?i4407lkeHVqR2PRyurS51m6RATmGUZ7Uh1+1agERa6Up1u1nliTnjdHEkYhQ?=
 =?us-ascii?Q?PGzO2BMJ5ylN60xeJWwLjZO1qFeqoXS0tKqqUnAG5mG8OJbcNrWhTcFGC6Lv?=
 =?us-ascii?Q?bJNt5wdkiYNHMjlmLbsCKq6F/7OIXumi4blKcpHQOuePEsfKEHdYv6qZhjJ3?=
 =?us-ascii?Q?nxIa6c2JEOSUqtO+xVCsD8R4avbpz6vzI9rUl4koQridZzWvbpgubVzZSXda?=
 =?us-ascii?Q?hj2ZHzsF67sajIKI+TTLXdp1rkiocCw849rrSwWfCp1n+7C01sNA87Vak4C+?=
 =?us-ascii?Q?u5txIOKKTpzsbV//hFh/3lgcvt90JMhLrRhBcu+bhvDS/dWYTa5YY/D/T0ha?=
 =?us-ascii?Q?tFTE5rbX8VgQGyRr/G7nMgsJKRg4CQfCBxaYxqgczXvwRMQtl4EhajPcXWM6?=
 =?us-ascii?Q?lqMI7zc5JVpnPxSLaY91JaDI4J0G3sdlJFY3PHR2ft17bA/mfX3XWFOy8CNO?=
 =?us-ascii?Q?fs8N5Zd8qMqazr4jLK9VF//H39AxudXQyqxybSoqVE5o3upZO38PpyC/QMTK?=
 =?us-ascii?Q?Q6O6Syp8cHnTI+aSJnWdVAOJgiaEvFacoJGrovLQwsWPS+1bogXJqP99LXIS?=
 =?us-ascii?Q?YNMifPZwSPeEPLZ3sd1HPLtScusVZRrl3aYQk809LJx27NlDr872HzdJbAij?=
 =?us-ascii?Q?NZ4NZk05B1kXUU6fD7+Dh0prkNNT2vzVifSyHhXw8WaUT7TxDRumfSFeyzwc?=
 =?us-ascii?Q?F/H0o/CDBG6P0Td5tWpMraCMPwDf7lbaIpggQZHF0Vh1gR631oIV2LXupzaI?=
 =?us-ascii?Q?soKVl566Qm9UEIcW82pAB6Irn4lW/HZ+yJrhIpNrSxPwJ2i6kzJVdIlD46kh?=
 =?us-ascii?Q?NbBZmM+SB1JvrdM738UaLoCeweN54T97oRE7Kp0nPl56WZxdfgLA2t5MPyaq?=
 =?us-ascii?Q?6bEwOswLEN9SjhcukEtu0tTeDuw+bKG+mcks6K6+B0DjQDpgxI0H9vi5OjZx?=
 =?us-ascii?Q?QDp0KTdVw2aTaXc7I1B3X09uccJyo3PBsDnBJUJcp4YkgItBUrZfz/VkZaCl?=
 =?us-ascii?Q?n/tyMn/PgYoE7p1yRFlVr8BqIBMgGDJ95SDwckQJPaS77kZrkHWSFIVs+UTt?=
 =?us-ascii?Q?A4Y3K0YJnGdmFc1XQIt1Yhkw8y6EIoLveR5faU3gSD4k8clDvpiJspD2rYX8?=
 =?us-ascii?Q?MZEWc/HTGOnME7HL65XecqZUx8KNL79+YsfhfVo8uzb6KWSwQeICiQ5Ye180?=
 =?us-ascii?Q?X27JxAVh1WIk7OQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3lFv8i9hx+lmOpfWDFzAN8BSZfLSx7yFMDtH3lmsib19xrf0RZ+Zl2pg8Vgy?=
 =?us-ascii?Q?HSp1/0XQiYgLA6ISrv+FMe2DOR+s2AQB200CQgpFvO+ACHhlefuis2ovjSJ6?=
 =?us-ascii?Q?mkq/VwQcGlLTcW6PTse8KVMZfX01b3/0Q1S5KCl5W3evfRL8z6MnbHZX1X0N?=
 =?us-ascii?Q?BEdcY5WM3auD6F7lKTq5L7luR6S4Y76OKjaiF6Ra4vPJHzmBk4xR0IZc5TO+?=
 =?us-ascii?Q?6HeIj4wGh+R1W6hLFFdsMg1QbUED/2tU8AmC+qmOPQTHWoJ08+mLAbHH72RW?=
 =?us-ascii?Q?NfsZERLdvLn4j3XTVxW4XtN4Pe6T0hSAXDnP8ERpYLTArClX7hxzXwhkUIi7?=
 =?us-ascii?Q?VabcLGcoC/WJZDZxMzuzZ5mGG9vUO1Gh02eeTFo5ELuHGM16ZjLijhKn5nzA?=
 =?us-ascii?Q?4Adh4/m3k6aZCDsQOes6FQ9atYwghcozsyr4fYN0w/J7Ph54DHr8g78cSyhj?=
 =?us-ascii?Q?ZMy01LnNauq5UCb98Z+Rt+D3igW6we7u+QC2pZFY/j7aW4PA3AcKb6IJ4Max?=
 =?us-ascii?Q?EJyeKju2DRlHy7rPxnkvJD6prnrtCyr1zl+jL1u5tKXA5kj36gECGRaQgYnq?=
 =?us-ascii?Q?PD3J7bYMen6PYsgzhRc8y3wUksgaH7bil0voIN3tXbuyuJ+nOhc4wGeNff16?=
 =?us-ascii?Q?vF5DhwJzjdvWFBMs9O9ZuqQ0j01PSAVEvwrKLeyAxOHf6WFAhcY5LBOgMsBJ?=
 =?us-ascii?Q?/jhejaaLWj9vMvGE/KUD8gnTNw05UE1Bk3JZ3XWr9TjHCixfWfvDE2WkUmBu?=
 =?us-ascii?Q?4QqafqTv+dbKirClAexWtQJj5vrN4NQ65DBp5xXYYP8s2elO4sdzXG6tr0MU?=
 =?us-ascii?Q?fMVDda15T7XW0DEPA7Q989DhvV/dnmVyr5JlxHVU/ycvoYMjO2nXsj+mTdNP?=
 =?us-ascii?Q?lhJAibs2y/ZL6xi4CUKe8KmbQ8wxuD68vl9unY/AlY0xBpnE1SbFn+uMVtrv?=
 =?us-ascii?Q?5GHLVCb3qDmtWR0AN1bnRtD1ODN4TvosaVywOrozpRD46ussOMkyXP1v3NKf?=
 =?us-ascii?Q?zeloo9SM78mheDpR8YnOm9xi4ADdZv3EA6dRGekuCBE2P1DdGhuZ+qSsrn7k?=
 =?us-ascii?Q?n+YHSSGq7/nrlZQZ3khgbzpfmceweJdgvZ8xauQBOj2zofxd+AjU59ug8PUV?=
 =?us-ascii?Q?52Neea1kItaLmFtdCPlzZ3LDFuteVrWyZ1Ixc18hce3SJmJrQB3igoSuPQ48?=
 =?us-ascii?Q?WTNJHEfx2XspHGzbAzSiz9wE8Csc9rzeQDYCoVy7EvMq/tRWNnIt8dJ9BIAk?=
 =?us-ascii?Q?ZT0e7jJtCkPNPDKzf3DgUGgEv930AskNHvJpqPFCcN39qdPStBdPQeY8aIKn?=
 =?us-ascii?Q?MQ0uJhl7j/IQsJn9PgKQsB20R0dwNOBPYO59Kf53Que8tiAeDMmcGz590Cjg?=
 =?us-ascii?Q?VfToth56vs2e4Jg5zYQmOo2waOx7okGf7ffSGyd0JgUd727uFIlPqPALWFnM?=
 =?us-ascii?Q?2oLGeaHqsRsjD0Kab/JzSfrzCrPNU+/1SSyeQf0L71L921GBffufTTM01I2+?=
 =?us-ascii?Q?oq0tyoEmxHXgWgEeObj2D73WZbzblGhH0Ij+qBe8wcfR+PACfYFGYTX4oGkW?=
 =?us-ascii?Q?5NG4tx252lTBALC322Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e21917bb-a602-4a38-73bb-08ddd3c5cf9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 02:14:30.1133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CwlkautuRzCcPggMYuWDNwqp62WeQhkycs+r28POdKhLuCQmlQIbX2LUvcZNxljFDX17oy3EXsLROjg2dq8WZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Aaron Ma <aaron.ma@canonical.com>
> Sent: Sunday, August 3, 2025 2:57 PM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org; Aaron, Ma <aaron.ma@canonical.com>
> Subject: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd ICR=
S/ISUB
> length
>=20
> The QuickI2C ACPI _DSD methods return ICRS and ISUB data with a trailing =
byte,
> making the actual length is one more byte than the structs defined.
>=20
> It caused stack-out-of-bounds and kernel crash:
>=20
> kernel: BUG: KASAN: stack-out-of-bounds in
> quicki2c_acpi_get_dsd_property.constprop.0+0x111/0x1b0 [intel_quicki2c]
> kernel: Write of size 12 at addr ffff888106d1f900 by task kworker/u33:2/7=
5
> kernel:
> kernel: CPU: 3 UID: 0 PID: 75 Comm: kworker/u33:2 Not tainted 6.16.0+ #3
> PREEMPT(voluntary)
> kernel: Workqueue: async async_run_entry_fn
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  dump_stack_lvl+0x76/0xa0
> kernel:  print_report+0xd1/0x660
> kernel:  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> kernel:  ? __kasan_slab_free+0x5d/0x80
> kernel:  ? kasan_addr_to_slab+0xd/0xb0
> kernel:  kasan_report+0xe1/0x120
> kernel:  ? quicki2c_acpi_get_dsd_property.constprop.0+0x111/0x1b0
> [intel_quicki2c]
> kernel:  ? quicki2c_acpi_get_dsd_property.constprop.0+0x111/0x1b0
> [intel_quicki2c]
> kernel:  kasan_check_range+0x11c/0x200
> kernel:  __asan_memcpy+0x3b/0x80
> kernel:  quicki2c_acpi_get_dsd_property.constprop.0+0x111/0x1b0
> [intel_quicki2c]
> kernel:  ? __pfx_quicki2c_acpi_get_dsd_property.constprop.0+0x10/0x10
> [intel_quicki2c]
> kernel:  quicki2c_get_acpi_resources+0x237/0x730 [intel_quicki2c] [...]
> kernel:  </TASK>
> kernel:
> kernel: The buggy address belongs to stack of task kworker/u33:2/75
> kernel:  and is located at offset 48 in frame:
> kernel:  quicki2c_get_acpi_resources+0x0/0x730 [intel_quicki2c]
> kernel:
> kernel: This frame has 3 objects:
> kernel:  [32, 36) 'hid_desc_addr'
> kernel:  [48, 59) 'i2c_param'
> kernel:  [80, 224) 'i2c_config'
>=20
> ACPI DSD methods return:
>=20
> \_SB.PC00.THC0.ICRS Buffer       000000003fdc947b 001 Len 0C =3D 0A 00 80=
 1A 06
> 00 00 00 00 00 00 00
> \_SB.PC00.THC0.ISUB Buffer       00000000f2fcbdc4 001 Len 91 =3D 00 00 00=
 00 00
> 00 00 00 00 00 00 00
>=20
> Adding reserved padding to quicki2c_subip_acpi_parameter/config.

Good finding, thanks for the fix!

>=20
> Fixes: 5282e45ccbfa9 ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI=
2C ACPI
> interfaces")
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> index 6ddb584bd6110..97085a6a7452d 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> @@ -71,6 +71,7 @@ struct quicki2c_subip_acpi_parameter {
>  	u16 device_address;
>  	u64 connection_speed;
>  	u8 addressing_mode;
> +	u8 reserved;
>  } __packed;
>=20
>  /**
> @@ -120,6 +121,7 @@ struct quicki2c_subip_acpi_config {
>  	u64 HMTD;
>  	u64 HMRD;
>  	u64 HMSL;
> +	u8 reserved;
>  };

Reviewed-by: Even Xu <even.xu@intel.com>
Tested-by: Even Xu <even.xu@intel.com>

>=20
>  struct device;


> --
> 2.43.0


