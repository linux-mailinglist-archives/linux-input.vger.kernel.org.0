Return-Path: <linux-input+bounces-15026-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2813B98444
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 07:10:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9768E19C64E9
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 05:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3F2223DD0;
	Wed, 24 Sep 2025 05:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAM+Amep"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F22248A4;
	Wed, 24 Sep 2025 05:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758690626; cv=fail; b=WiCY0ixnn+W2/gAGYbP3vPumA7JbaJLImr9USGTGvflLfUi6l7onLLWP3koSoDp++dc2xe9Xss+pZdLwm/2NiFV8cW8uBlTVI4U4tD1hd6PPSSdfKzRTWSYGA/8OoSIf0naeU4ds7WgKxAKAKdptI4Yes4B69zoOS83Gcvh20Zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758690626; c=relaxed/simple;
	bh=FdzW1kH3KhH1v3lvOh80X7aeLoHJ1wwJCYUTkTxK/Ss=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kPAOtA9/bhHLMF+mMPoKmY1pD5i5iueTGb2jtjnQluXgDHiSieJ+u2MZYFBQHaz2/SPFfj/sC3af+O6kFKiBCva+1nxLI6nZCO/C7klakyXYR6Nj4l9Avm9IpiGC2xH6ssWp/1geaWLBs5yiK1vWVYrU5MVZcArWn8MZGcwcG5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAM+Amep; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758690625; x=1790226625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FdzW1kH3KhH1v3lvOh80X7aeLoHJ1wwJCYUTkTxK/Ss=;
  b=oAM+Amepwh1uMC/PRcYtIE4gkXGjkRXclyyWRzBa7EyVqmcuyygWd5Ng
   mhcwyjX+DHRr7scxh+tLiiYNwIn7syEs/mILFVitVACKQvrLZclpDMN95
   6FFEdc+gK5JaCAStgDEMwSe2bSmygWMErt+ruWwc/320Qnk/bRIQ8g4Tw
   OHIlO4WEXEtZeHwoFcOW2VRjBgWc883sV6J1Y/Do1I1aKhm2iqCchZJmm
   9RsH86Cfofmi6fjmlr+x7UXHcHJCyZLqoVo2LajUl6yPU4eUO08qAfQgv
   oZrLIBPaUKKqHQOJnhVe8vsJJ9WsMN3N+ZMuUopiRKLLUWAPtEqCuLzYG
   A==;
X-CSE-ConnectionGUID: zt4ai5SJTjaQSEtEIUcEPg==
X-CSE-MsgGUID: UcDlCNLjS6e8I2y8Fu+A3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60893784"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60893784"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 22:10:25 -0700
X-CSE-ConnectionGUID: OFlPpAf0S92kxaLpJ7dKnQ==
X-CSE-MsgGUID: IwyjGbpwR2exFC9rtmdskg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="182211475"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 22:10:24 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 23 Sep 2025 22:10:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 23 Sep 2025 22:10:23 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 22:10:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iapKvQS0ioGkkE5QOoVzgAsTGhCO5uG14UIdHVc7f7qSumgWwXXchkZt7oqSvJjU5dyFCc1Zu86ghh4DBs8onGCCXJJSOvy9TZlV4cfBX0Sv9FudHCsyUp9qCqbgxM7VuVPycUt5D12JqSgvrtedHh6D6c4JnI11SE6w304j5cQE5o2K0cmm7n6bZLbKDA3CiajaFDX4RPoIBV5wckSUPoPTuTsndVi0VIFtcMZ2w4Z+8prPri6ejd9CZ3WkrKcEYpqzEE+izYObNYA8ctVDv+dYynQpOHKbTEQNCvZecBget0LIY+GfyoxL/XvHR50vKcspmnhRdOGKHaePQqmaWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kZbq9G6nNOVAhNXwfg0FWD8m8JaRfClzDyXweOfSkjg=;
 b=tOwpmGILIn00UiSmvCEuAfe3xZCYD4zNoiWnVSYTzVOJ0UJQJSQBnRxigKbAKY2Q71WNZ5yJkUyJXoZOIcEwFiFgkoKGNrso86sg4+APFXnJMU57kkK6UqhxGXbyaLn/jMZzlR0LIWK9g4Dsx62yd+up5Ed2fAGWLl0YgWJ21JnE5W2S+hjvHJLMDIeXFERdS0cbO4JYeRnZByjWCAch30YZwEq4qFdCuQYFUs/IZ8lCheBIrEP+/oTcL81Rg3fgUjoqIxY0ZlYxOyFD7SrjGBpKMJCf4T4vHDieci01OIx9VG/YXgrA4TJuxFRjXfo79d7etuoq49Td0H82JMkkPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by CY8PR11MB7268.namprd11.prod.outlook.com (2603:10b6:930:9b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 05:10:21 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 05:10:21 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>
CC: "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device
 Id's
Thread-Topic: [PATCH v2] HID: intel-thc-hid: intel-quickspi: Add ARL PCI
 Device Id's
Thread-Index: AQHcLQ0KTDyUOmPTpEaX4EpIjfK51rShyLYA
Date: Wed, 24 Sep 2025 05:10:20 +0000
Message-ID: <IA1PR11MB6098E52245445967CCE00B4EF41CA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250924043720.5545-1-abhishektamboli9@gmail.com>
In-Reply-To: <20250924043720.5545-1-abhishektamboli9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|CY8PR11MB7268:EE_
x-ms-office365-filtering-correlation-id: 66cd73a9-0ee2-4854-6dcc-08ddfb28a919
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?JQRcOMv25el6HDKaUlG5i1/FzQ7+p/J/oL24HbAAUXka0ILgusLr+/W1rSFC?=
 =?us-ascii?Q?0Nh0LM38AR6TsDiafoJSOKov17R0CUKBnF249Q7n/f7za5khK+/nteDP62EA?=
 =?us-ascii?Q?SG0ff5PvZfSk8+EVDQn1lywb5ajW8cj3uY7kmY2up1SzXYowFPY/ymHWwnOP?=
 =?us-ascii?Q?jAsyTDH+78VtF98DHMwLfTcA9KKZA+RQG/xSOv8KhXRIPdspHUDW60qdGr0F?=
 =?us-ascii?Q?hhV73LNds6xzm87oj+u/9Oyxj1oQCtcgjGqloSjH4KVt0pvyepYIFq5MDmd/?=
 =?us-ascii?Q?0oOP22Nv7BzICyub3q+xHIxuK/UVAZgxlYYyYhPG2v0WM+HTdTGrD4jcekuP?=
 =?us-ascii?Q?B8guq7UqrX7z46aof6YfM3w56Kx4uGWSHfL7d8HTtN+ww71sTXJjwlm4r/SN?=
 =?us-ascii?Q?sYxNcfvXYLrlivio2csuIS2aQSL8w6JU1yO0gbLiI6kOGjbXdBSZm5fvGv7U?=
 =?us-ascii?Q?B6Ty8E78tg0v918pPh/W2PPmImH0Ubzfvsif8k5OvcAIV7g/K+WGqMNXEC7t?=
 =?us-ascii?Q?0B9kH5MfARxqKX2e5ZyuletvzlkD2AQPqsfD34JzgdDja9pUghe5eHif+l93?=
 =?us-ascii?Q?mdXcUeDMBW2YF3IrKcRCMDPPs/mUjEjMuqewfVKRYSS7m5OO2Isw/oDd17/x?=
 =?us-ascii?Q?UA/54TVJwprGx8pZ67WLmFm1w9+AKJFkBQUXvpCFp+r4dO0rPPCXxVTaC1ZL?=
 =?us-ascii?Q?0b7FcIxItGUyM+FyxbZ+gBlVMqGlqW6eAFzMTIeYwHkG5zFgWKvKsACyku3k?=
 =?us-ascii?Q?dqpavbZw4BXEbfF2MrmEuRFVnyovNrBAV6iJom3+zpn+2ibgPRMydtkasAce?=
 =?us-ascii?Q?SMov1dH6bVkkCxNwq9IX0+pnG/V5BaSxQX0YHg+kM2rZ4Z3KX4kup0pg/tj+?=
 =?us-ascii?Q?ZhoJ+IKF37LmdWjfj0zR7FOOWvA0C5L0JW88FKz+q5KwJjQiDDfyCem6QTK9?=
 =?us-ascii?Q?vHaUyRnUJxJ95PtHBai1fFL+E9KY2JwFG4uaKjCh0i/x8tOGawe9T31jevwx?=
 =?us-ascii?Q?7l9vtnjvK3oxUMXa86oUzEJTeyi37c/JU8Us2QI4GWpebg5eZXzoISBaK9OP?=
 =?us-ascii?Q?4+hlKLTX0Pwl3z3G66AKoO0ztjUFn4gKW02KTYpbxcLKBe6y268EeTtR5nOG?=
 =?us-ascii?Q?Fxan+maIyBKijIfvq/5Bs3C1forxDmNw5deAPHDkjLQKZ1JwLeZKcd2zbnUG?=
 =?us-ascii?Q?8SrWn/TkbPmXHtAiff6fDY2Q5W0f8UOJdzHCcIAWpoioGb61laqOkoxYamB3?=
 =?us-ascii?Q?+nweTLta5WqxdJYB6iqB2nS1ew7qyU3Qquu5+hLxEuoh5G/PrZXMWNHY8XCz?=
 =?us-ascii?Q?qSrvFyvlpfGlHyc1UpbZdiVJPoz5zBU1NgijeEAEd/bG0d9kzN+Ee0jS8lyJ?=
 =?us-ascii?Q?Lw8mVIN2NHgzpWwmh+cGP91bb6NC1KvmdS5NlmzhIBiAOImSf/BbuLVcGwjA?=
 =?us-ascii?Q?7IdtwNJPpdHA65BxXEGzDoO/qWR1lFEyVJ96uU4oSYcD7j2yMlyDQsZ0lZPY?=
 =?us-ascii?Q?F3ZrIfr2wQ/Ea7E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dGvtr5hRhyoQ7RWdkyzGVx1Yvn53hYvF+8mG9S0cFW/muyYx8bkA2QZtl05q?=
 =?us-ascii?Q?fkLH3NvKA88SOuC9e4D00cM7yVna6L4LOpylHiw5NRu2iZawHc6PUVXai60t?=
 =?us-ascii?Q?IhonjFohATiwISRs5bmVV6QTpBTbzYNmU8zllKF+/wvtIFkdqqNT+avkfd5p?=
 =?us-ascii?Q?hTZjciht08AO6rEuCB+17Ws1aPGvb7oyN06yeMpQtUNETnkaaOifRlkTnFt7?=
 =?us-ascii?Q?sI4UlnxwtA+7Yb5td9YkB30upcvTTRolIRIjRjS+6H13Xb7oqUsMhFA6vBJ2?=
 =?us-ascii?Q?tTX5EFpWlHgyjwLv+BDvbP1QKU5vSSbTz5+3/ZlTuE/u/OstDQ7w9HAHX79s?=
 =?us-ascii?Q?fqU19fOKhcJIwGgcrAvUde52apLF2T3pub5L8iNtWbpkZFGsz7WG7X2Gz0Gy?=
 =?us-ascii?Q?EfujAphek80dypAs6ASOxERwzFQTFrzJvvscwHdl73s/Wi3uem6NlwW81PgQ?=
 =?us-ascii?Q?QCILsDZQtgtIUylxFA3NX8itPTqsbZ+Qy0euSc2EHJdYOJEih5DMTvUmphgc?=
 =?us-ascii?Q?COqgfNyM6Nxp2bvtn3ujOAQHb0RXsUNmJ/Ky3sFy7zsuRNPy+PFPgEAHSwnm?=
 =?us-ascii?Q?5m115mmFddcJRNSXb4i98lYSBWecS/f7h8C+dDVx3HJxi8Qkt3FA/REpBFB7?=
 =?us-ascii?Q?NOcj/Es589GCtaZbe3nFx8LrNflkEk2qMzlwF5vxZ/wM5PQBAYkvPHnqtIqH?=
 =?us-ascii?Q?w42bzHW+4Scl5L9ayeKsybjwtllyeo/vW4dlB1OkkjZL/R+OqSrwWlWS9Fcz?=
 =?us-ascii?Q?tjsIpvzTq+U+6i270FMBviQvefobzdG1WCbz1axrOqtSAqoPr2fdL3Skqini?=
 =?us-ascii?Q?SAM72zd78XbpifWxEnEWMU/9uIrRV1P6zcHABycXu+i4JIZcp0T1jWAVwXCp?=
 =?us-ascii?Q?3WfgTOhuSD9o5HYlnrAFhK8wvULqLBnAIIFnRK1Flj2wtrrn9S5r0Tyu+OEH?=
 =?us-ascii?Q?K0sSoeJUlKXXJyC2m9xbke/ZM359TMiCSWC8/nbrpv2ykQ9uclabpQRLV+Z9?=
 =?us-ascii?Q?xPNUcxEON9IXPU2W5YrgN/9Fgy5nQC61V4oFHo/gbcZ5EGoiNIVIambulbAb?=
 =?us-ascii?Q?1LPYu0TK4zwMTRDH4jHHs3kD9g/80Ybt7d1XKdUvqcHSVrD0m2R9VmTDmILD?=
 =?us-ascii?Q?h90GjiwJl62R2R6+5CZjrQ9W4GZeKDKOin0vd5GVFrNfQ98M2wp9K5Gadbz6?=
 =?us-ascii?Q?hhjf3t9NgdhxfY+aqpnkXkJqiczJphQ4UVe6Jf2Q0wK/j7KgGwaO8LbhU2cg?=
 =?us-ascii?Q?NuRQPki1NtUvKOA+vUUKOKBRzYrCJzmTtZhIWrnagBtE5dTmZDE6Vtmueqcf?=
 =?us-ascii?Q?uuEFLqmwvBl2DYM5DlmwAjkRn03j4ifVJTezY2ISsxJdfzKCfFG4lIiODBRA?=
 =?us-ascii?Q?c+FiFeNeKHwj+bLAOJuB4NxO+mAB5krxlq7bU0RUEiNFqzootyi6e9aJeBGu?=
 =?us-ascii?Q?0ku5+6e62nzkZwaaUkvsIUBWFLIggq6LzZ3+mW44G7mCXcZLpWQhfiRz5rP5?=
 =?us-ascii?Q?vsU8CBbJRcNwsUdWM3JY4+Vij+bILZKC826isLezrXCoOHNY1CspueW8L7eS?=
 =?us-ascii?Q?wdXb8PSvsQclwOijfFQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 66cd73a9-0ee2-4854-6dcc-08ddfb28a919
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 05:10:21.0205
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HWPGEG6QhhZGSz8eEY+z7Zvfs87xpnN+m9ijvJimXJhAOfOpRMgOYt7cQe+ASs3sPcz1K8OUxPuao3x2/3XU8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7268
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Abhishek Tamboli <abhishektamboli9@gmail.com>
> Sent: Wednesday, September 24, 2025 12:37 PM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> jikos@kernel.org; bentiss@kernel.org
> Cc: mpearson-lenovo@squebb.ca; srinivas.pandruvada@linux.intel.com; linux=
-
> input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v2] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Devic=
e Id's
>=20
> Add the missing PCI ID for the quickspi device used on the Lenovo Yoga Pr=
o 9i
> 16IAH10.
>=20
> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=3D220567
>=20
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>

Thank you for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

> ---
> Changes in v2:
> - Change the max_packet_size_value to align with
> MAX_PACKET_SIZE_VALUE_MTL
>=20
>  drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 6 ++++++
> drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h | 2 ++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> index 84314989dc53..14cabd5dc6dd 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> @@ -33,6 +33,10 @@ struct quickspi_driver_data ptl =3D {
>  	.max_packet_size_value =3D MAX_PACKET_SIZE_VALUE_LNL,  };
>=20
> +struct quickspi_driver_data arl =3D {
> +	.max_packet_size_value =3D MAX_PACKET_SIZE_VALUE_MTL, };
> +
>  /* THC QuickSPI ACPI method to get device properties */
>  /* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */  static guid=
_t
> hidspi_guid =3D @@ -978,6 +982,8 @@ static const struct pci_device_id
> quickspi_pci_tbl[] =3D {
>  	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
>  	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT1, &ptl), },
>  	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT2, &ptl), },
> +	{PCI_DEVICE_DATA(INTEL, THC_ARL_DEVICE_ID_SPI_PORT1, &arl), },
> +	{PCI_DEVICE_DATA(INTEL, THC_ARL_DEVICE_ID_SPI_PORT2, &arl), },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl); diff --git a/drivers/hid/int=
el-thc-
> hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-
> quickspi/quickspi-dev.h
> index f3532d866749..c30e1a42eb09 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> @@ -21,6 +21,8 @@
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2
> 	0xE44B
>  #define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT1
> 	0x4D49
>  #define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT2
> 	0x4D4B
> +#define PCI_DEVICE_ID_INTEL_THC_ARL_DEVICE_ID_SPI_PORT1
> 	0x7749
> +#define PCI_DEVICE_ID_INTEL_THC_ARL_DEVICE_ID_SPI_PORT2
> 	0x774B
>=20
>  /* HIDSPI special ACPI parameters DSM methods */
>  #define ACPI_QUICKSPI_REVISION_NUM			2
> --
> 2.34.1


