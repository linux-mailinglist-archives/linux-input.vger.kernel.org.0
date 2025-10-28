Return-Path: <linux-input+bounces-15771-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D537C123A4
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 01:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 395EB4FC708
	for <lists+linux-input@lfdr.de>; Tue, 28 Oct 2025 00:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB7017BA6;
	Tue, 28 Oct 2025 00:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIZXiKfe"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64E1F4606
	for <linux-input@vger.kernel.org>; Tue, 28 Oct 2025 00:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761612183; cv=fail; b=fg9YS+37t8lZasfAY/VRZaHJ5E1zeeIzJ9eoh9f81eGPcQpTZEDVIW7Dj54APymiV34vU2/j2xR0InyDGOufd0JGr6qE4rBioKiD3H/Dssaq76w/tyFQBdac6t+8dMAiX37D6U2+fa01sfI36e98HEXr7ceZ9P4DpRaI8QF9PV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761612183; c=relaxed/simple;
	bh=NNhINhLn/zEMUH5ZPK9R+GWIJ/JeyRnpThot7CSCfiY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XZBBEp7sfqPAwrOwbWfoXHwHTq1acP0cnEfuo8lzNS5WhPktPAys2vlNFjHVg7hB4l/Wvgd4bjLYtapheeJJKygDuIbk4DH2m5ZUrEAUhWOdEkQr0tXPgnBbeOLZecajgDOyY8AxJrPurT9iEHz//3zyYQDKZBtlHXQw6iOb8/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIZXiKfe; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761612181; x=1793148181;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NNhINhLn/zEMUH5ZPK9R+GWIJ/JeyRnpThot7CSCfiY=;
  b=gIZXiKfeRAREOev75tXUbCgtracVH6UqXtNMhVjVAy+a+qBqxYQDBXgs
   DMWoEP05iD7NUPJW+ZgcMt7+UDJF487/X5uuGFCz4gIoWHOqw2RJZheH4
   XdBsifA37Xi2UDofPm7JACcCkqT2h2wxPKpqf02hJVxSDTdeF8zsufpFw
   G3vfx241zCUSIhiCeUdYSuGlFdymNXpyYQ9URTEHUEK26FGlgU+qW/hJM
   bT0jZpIAbHy4h1jbAiKZEX7el912t6msJUFjwTnfLgLWvyMNV/61SBcRU
   268KjEYcV9B2taLGfuVcsvJwsEvSV61+cKcEbOXwlqMxEqiRmFh9Ewah5
   g==;
X-CSE-ConnectionGUID: GNWKxHs3TeCKVLg3kWKB8g==
X-CSE-MsgGUID: P/53z1RRSOKB/CpMTRuWqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67568777"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="67568777"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:43:00 -0700
X-CSE-ConnectionGUID: 7v0IjX3bTzKu6AaAJConXg==
X-CSE-MsgGUID: xDAzkdh8TnaF98jn3WZ50A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="185536216"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 17:43:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:42:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 17:42:59 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 17:42:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCDHScyjT320iffE9ZEz7YOIxC5M0VFKjg96ZWE4BoU4/8l3USww+P4FsZZRDAwK4c8P1+mFrN5ptEeCOIuJ8aQ0uzAGZHQvmu0xz0aRXJa8VSbTHDEHSqoKIc1aYLyKSem7y4z5nhs2ZjpiMZjg1HaTRsOf+5kdBCRd5QfOq7L7axdfUMv5onzSJd9djRr4j1Kb6UfPE4bIVwDHE1tiFzSpL2CDwYp5zPNmHE6Ro33JiuuDZWdUZp0Vulta4k/ouc2HvzwQBQsgPUXBLVtcXDW4mia+p9olhUqm7gC/xb7O25iO6VJTYFX75saJONYMwAGwc3QwC9llYO/3l3qllw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iDNgZ46csVnGTNe5H9pL36PGhRPvMksdkI0HOoM1cxg=;
 b=YnsiUniyFf3pPgFk43qCgDCbFk8rVY6xkySYZGY6pV3Ztc7HUi5G8Uz92nAjHgonN3opuHl96Kl7ulzZQ8QyvvH16P9lDoOBEKaAiPVqKtzGiJ+Jdgfipt4Di7ApLPaw5yN70hsLttCEhceowHUIPZx7iih1wIzv3nx6HUYc9jsYqOKbgcOnxub+xS0g5WG5R5/L7nmGLWcZTT9LbDXcQ75iSyZX34laDFPRKcNeqNJBUIq+iQncHmPbOuXu9TjShK58ryJbDDOGIM3oUL0YR/rb/DZm1y3T+elA4fQnpIt1JLZPBSYWTyH4weL16MXUHN59lUnNSXUfFaaG6ZjT1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SA0PR11MB4575.namprd11.prod.outlook.com (2603:10b6:806:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Tue, 28 Oct
 2025 00:42:57 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 00:42:57 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
CC: "Sun, Xinpeng" <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, Philipp Stanner <phasta@kernel.org>, Wentao Guan
	<guanwentao@uniontech.com>, Abhishek Tamboli <abhishektamboli9@gmail.com>
Subject: RE: [PATCH 1/1] HID: intel-thc-hid: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Topic: [PATCH 1/1] HID: intel-thc-hid: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Index: AQHcRzmHzWf/oRTLZEa81dPBIsu3MrTWuOjw
Date: Tue, 28 Oct 2025 00:42:57 +0000
Message-ID: <IA1PR11MB6098EF52A7B1A374D054625CF4FDA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20251027120123.391125-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20251027120123.391125-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SA0PR11MB4575:EE_
x-ms-office365-filtering-correlation-id: aa9ec3d6-75e3-4641-9f6c-08de15baf053
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?gdBWF6Rq4V2bKwgph9BjnJvE8kt88nmUfVFA02NK7D8BEs8LKYQgTTiWjcCC?=
 =?us-ascii?Q?yKLGfsBCNvRyntsv52VvUqrUf342QJcEFJB/myPY5zhGNaJRHhx9VRMCHTbM?=
 =?us-ascii?Q?8gDPRQ01e3vum7DV1var/DXP1Ror9RoF2pB920TXwlY3XKMFG2uliG5PnR97?=
 =?us-ascii?Q?SluyE5uiIxBkrZJWJ8paS+RD/GX6s4P1kmGtxn4i+8sjaB7+sCP6GFg5ShMx?=
 =?us-ascii?Q?YZlyQCsXg8KtIpke3pVInyzevDJpw+gtSdxd76HGOrj8FKaVcX8Q0ZhQjCR3?=
 =?us-ascii?Q?ez9blFz76aVTJm+CC20YzH3MaEzL+moCwiZF7SxbBUbmMjPBSIAXMUMlCkKc?=
 =?us-ascii?Q?wbW9Qf/Q4lO4SXIZ0Cx1oKyDmctE+Jg7GXtXrOxtgHN6Lrg63ez7Xlisorjp?=
 =?us-ascii?Q?FSVEgBf+3wZOiRoer1UP63JrNaZ92yT+uSr5P/qPg32cOmPGviqMqU1BZge2?=
 =?us-ascii?Q?8hVaVQXawltMmB+EF1hbvptO2gLmEF10vqn4e+UhXTU7iZMtbM2ABHpj680K?=
 =?us-ascii?Q?cE/6KmPoGVgStkMuyYPjwS7luncIUwbG4fgGH4QQ+ojRfwdv60r1wGXlvwoV?=
 =?us-ascii?Q?od8N52rJRtkyrYlAyqE7Z5f3ZXOVRqoTRiJ9kyuc89mUVqyBLqCNvwZ2fLml?=
 =?us-ascii?Q?LcUTwPo19Cso0QmuYGt4PvTNIuWShBstqbCnL4BBXGlSionr0AQFJJc/I0P8?=
 =?us-ascii?Q?ES4v/kyRxafhX3Bm2oSW86oWNg9fPbsfgG8lobVA61cxFr4fvP8ivYVd11Iv?=
 =?us-ascii?Q?pgbnKdMPP5wfbl+JzBtAE/InvPo/QYhXjq70erl0cX5Ffao9a5XHcWQkrEyi?=
 =?us-ascii?Q?ZXcP+eN1GfYFwm5qao2ZujKHcChcA6OA5O7LsLcUI4gAKpa0G0GCJeehIUey?=
 =?us-ascii?Q?vQ6VqeEimT64k+1zbofcn+hjhLU4qRSbeMUP9jsuM9HpA477uOQ9j0hshuYQ?=
 =?us-ascii?Q?ZA84oqZgGkHTBcNae0d/H2e4hYYeDlQnaygI4GpFoi9zt9lnJFHGAdaNaq5R?=
 =?us-ascii?Q?Lsa2p7fiMSaFESalV9LjOosRkGzg7/ZeNoai9f4njmeJGufWcT9j3409rvV4?=
 =?us-ascii?Q?I1VO1D/OUnteiPvKOP3t4n88rnZwVsyM8euPYqBxUfK+RTpVqNOBzCcAFe0I?=
 =?us-ascii?Q?Bp3BYAWusSiTjwQ6LAYkQfePyhkWET3Us/Fe8gcOgw9sSiYX1wPHEOwO1p6F?=
 =?us-ascii?Q?qaycHbI9dgrDLSY3H7Z6NU48Z62bpAfKdCup5rJ7WXleI8ZCawE2mfcKiOPP?=
 =?us-ascii?Q?USJOw43j5O8YEh/GbtoTPP/Lqt8Itq5FkYGaqmR4UKoWK25xgyjIMuJeF71i?=
 =?us-ascii?Q?3/4Gxy+b/zGzQ9IaRgeTEjlB0rYWLgbqdPg0eRNuN7EEJPWWAwjbrHZav5K6?=
 =?us-ascii?Q?Un6gb6R/c/YqNGr8ZQkLADRAFLz62m+Kdk8G5MIFz4ybtnxq8r5dhcGFMOwf?=
 =?us-ascii?Q?+zfBuptYhLmXfL75+glLZfuTIaSI3xLW6YS81OAwLQTjUyonrIYxay6DMdrs?=
 =?us-ascii?Q?RPXtAfeaMQ969zkngdr85PtWr9r35YJ3cDxg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2VSiqHMa/Wr3NrZBeRAxIM+Hvqfl7wfhk0UOATuO2xneQ+ANzChrwfX4bMH5?=
 =?us-ascii?Q?G+wWC+0xU5ZTYUdOhE4HajJqY7ctOM7CWYo5kRXNy4mXVlM4l5gPStWYbd6I?=
 =?us-ascii?Q?PIo2fbkpMFFjOUJRj6jFTQlobaTTX4vbtf1Y63zHbndnuiDvb2tI+3A4wSez?=
 =?us-ascii?Q?FQX3s8F90HZ8mobMKi6XxOXJBvVQlTIwQYXfZknKftz61+kpaG3D+Y5JEUTV?=
 =?us-ascii?Q?vTNYF45RqMwDTy5UMe1VhEj5K9Kxf8gVPl694NKSd+LTun/AU+KnrdxcDMu8?=
 =?us-ascii?Q?Vy7XqTedf26uWnfNLRUcJ2JXsF7Kq39XCaY+SNo9uJRclZRnzCO/r8UODu6E?=
 =?us-ascii?Q?7SD2kQLWsS553+SZLVEpzu2oKS+1YPDIwBVPVAdkjq7EfBgc4KWoFH2jmPvP?=
 =?us-ascii?Q?hUXWaLSKiVswnrLy9rU6SIniezWaVtxHS+adzVqwF78i81fDyIsEKmbduK9D?=
 =?us-ascii?Q?jeKPWGbOvhW0GqN4j84O4tq725FJiZGkqugvM2YJ877vuSlO7XUJJUeweVRs?=
 =?us-ascii?Q?wcZr2N6KUvNvTcyWNleMf4jnc5wtmimrLXKwe+qGyz0X0UW20GccsjqEKl0x?=
 =?us-ascii?Q?qy1gyxCVzm8asvkjdg8KYPxuLeGHhqjjkQ9KcMDU1o6qMahFsb2GiV4iTVvE?=
 =?us-ascii?Q?asc39qkKBOJ3c1o1dGI5ac6n7aWWEtPtVzWUNuzS7kB1LEmQ++nOBRx82hpM?=
 =?us-ascii?Q?90bTEBdCrkxLT1s7g1oWw+d8gQQaaAozYczSyMMgBBRwy1PTcpIBv9yE8O2r?=
 =?us-ascii?Q?XKzGdqKw0x4uf1XTCQLDdFrrPnpqcOD1ZdQBLueiM7R8HXAlJY02syXBrxMt?=
 =?us-ascii?Q?LBWhAny9Xam6+YhlbTpb6crX/M2dns0K7W0A1mWt6uNolWncsYfWOOsGVvR2?=
 =?us-ascii?Q?O/7Ii0n565hNbLJPYMdStwIrRmLaezLoXYbONoWcxjBsXmlks+FrgzsPL9VZ?=
 =?us-ascii?Q?aakNGO3Lb3sLGg9YT/3QstTsV5YdzhxGM/v0D8VuuUGlvnqMIlK/UOAo6HDL?=
 =?us-ascii?Q?st2zKz1bsLD7a5eyMeDky1b6hhwlVLAXjZXxa642JLutz6RGRZsilVtiE/3A?=
 =?us-ascii?Q?ooAKmiqbHM95VZLiyHwqisq0xpTqEN5VTbuO2Ft2p9w7to80CLerpyxlEHT7?=
 =?us-ascii?Q?DTeg5MkRJOyXC/6zqhmffwzGgUa6/hRVebdzTIR3C+iGJ/Nrvmw2IE8ket4s?=
 =?us-ascii?Q?c6vWwPqsy7tSzlnh6oC2rvtYsluSTTmVKRwMQlWnmpW/UWlGoW0NONVKqoIS?=
 =?us-ascii?Q?OrWapJW3Usp3S9ISk0DPj0Qn1oBku+iP3cgYL7cvsgWtbhAKNsJN1BTuMj2x?=
 =?us-ascii?Q?/yqtMGYLD0XJaEwvSKD+SZhqE1lCQMq3ByrXVdeK7VnsE1jv+NIx3IfBPyKp?=
 =?us-ascii?Q?IjYwExYPEB70J2hTKE+CuPpYkW4JbRXbw+7v5d7iw2X2kwAjit3R97o1Taqd?=
 =?us-ascii?Q?b34uTPfb09EBdkRtUap3WkWeZJ8BGJqx2aAIuHbjCU0lLjqEynCWN64soPR7?=
 =?us-ascii?Q?GgRiqUZEmwQVMTV5d3tMxOj9bLhntpwGz0DfkvdoamPcJsvAoUZ8o642yuG4?=
 =?us-ascii?Q?N+mqiKXT6QaDGYrq0Tw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9ec3d6-75e3-4641-9f6c-08de15baf053
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 00:42:57.3051
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2+mPkSscIO7JeknY6ewfdJWtE08P+TgyA5ABIehXk+VBVDCY3CzKwuUcqCq9P7DpGmfaQZdP4QdswkTDi0ccw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4575
X-OriginatorOrg: intel.com


> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, October 27, 2025 8:01 PM
> To: linux-input@vger.kernel.org
> Cc: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>; J=
iri
> Kosina <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Srini=
vas
> Pandruvada <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> lenovo@squebb.ca>; Philipp Stanner <phasta@kernel.org>; Wentao Guan
> <guanwentao@uniontech.com>; Abhishek Tamboli
> <abhishektamboli9@gmail.com>
> Subject: [PATCH 1/1] HID: intel-thc-hid: Remove redundant
> pm_runtime_mark_last_busy() calls
>=20
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call =
to
> pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

Best Regards,
Even Xu

> ---
>  drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 --  drivers/=
hid/intel-
> thc-hid/intel-quicki2c/quicki2c-hid.c | 1 -  drivers/hid/intel-thc-hid/in=
tel-
> quickspi/pci-quickspi.c | 2 --  drivers/hid/intel-thc-hid/intel-quickspi/=
quickspi-
> hid.c | 1 -
>  4 files changed, 6 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index 0156ab391778..cfda66ee4895 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -344,7 +344,6 @@ static irqreturn_t quicki2c_irq_thread_handler(int ir=
q,
> void *dev_id)
>  		if (try_recover(qcdev))
>  			qcdev->state =3D QUICKI2C_DISABLED;
>=20
> -	pm_runtime_mark_last_busy(qcdev->dev);
>  	pm_runtime_put_autosuspend(qcdev->dev);
>=20
>  	return IRQ_HANDLED;
> @@ -735,7 +734,6 @@ static int quicki2c_probe(struct pci_dev *pdev, const
> struct pci_device_id *id)
>  	/* Enable runtime power management */
>  	pm_runtime_use_autosuspend(qcdev->dev);
>  	pm_runtime_set_autosuspend_delay(qcdev->dev,
> DEFAULT_AUTO_SUSPEND_DELAY_MS);
> -	pm_runtime_mark_last_busy(qcdev->dev);
>  	pm_runtime_put_noidle(qcdev->dev);
>  	pm_runtime_put_autosuspend(qcdev->dev);
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> index 5c3ec95bb3fd..834a537b6780 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> @@ -72,7 +72,6 @@ static int quicki2c_hid_raw_request(struct hid_device *=
hid,
>  		break;
>  	}
>=20
> -	pm_runtime_mark_last_busy(qcdev->dev);
>  	pm_runtime_put_autosuspend(qcdev->dev);
>=20
>  	return ret;
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> index 14cabd5dc6dd..ad6bd59963b2 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> @@ -339,7 +339,6 @@ static irqreturn_t quickspi_irq_thread_handler(int ir=
q,
> void *dev_id)
>  		if (try_recover(qsdev))
>  			qsdev->state =3D QUICKSPI_DISABLED;
>=20
> -	pm_runtime_mark_last_busy(qsdev->dev);
>  	pm_runtime_put_autosuspend(qsdev->dev);
>=20
>  	return IRQ_HANDLED;
> @@ -674,7 +673,6 @@ static int quickspi_probe(struct pci_dev *pdev,
>  	/* Enable runtime power management */
>  	pm_runtime_use_autosuspend(qsdev->dev);
>  	pm_runtime_set_autosuspend_delay(qsdev->dev,
> DEFAULT_AUTO_SUSPEND_DELAY_MS);
> -	pm_runtime_mark_last_busy(qsdev->dev);
>  	pm_runtime_put_noidle(qsdev->dev);
>  	pm_runtime_put_autosuspend(qsdev->dev);
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> index ad52e402c28a..82c72bfa2795 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> @@ -71,7 +71,6 @@ static int quickspi_hid_raw_request(struct hid_device *=
hid,
>  		break;
>  	}
>=20
> -	pm_runtime_mark_last_busy(qsdev->dev);
>  	pm_runtime_put_autosuspend(qsdev->dev);
>=20
>  	return ret;
> --
> 2.47.3


