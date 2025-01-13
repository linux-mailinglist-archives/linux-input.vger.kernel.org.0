Return-Path: <linux-input+bounces-9169-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D3A0AF82
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 07:57:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDAC3A64F3
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 06:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF74C231A35;
	Mon, 13 Jan 2025 06:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HMdPntjp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCD1BEF98
	for <linux-input@vger.kernel.org>; Mon, 13 Jan 2025 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736751471; cv=fail; b=GRQOglvdZVwJHYEvryn/dt5Xz1ebxlITKW4Dsh67o/SBC22G1ft7fiLVuIp12SCzRa0+55KMpVqKlSw76X7rdGREDSq4EcZhWcx5yj80rDUWWxGh/AqoOLXvgb3Y5C2CAiF2Qlnxpwtfa9m1p9mquC9tep1ZbO5rsjf+6W49350=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736751471; c=relaxed/simple;
	bh=bxyS+HVT0On4Aya4hXeoOegoS2eT+XmkG9lVcg7X7fs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XPqz/t5n19uPKtkG5mgmG7Q+zzh6zRd8OOfAJAp89+aWlhczFvPqtyTpJI3YVh1Jb/NEKG+/1ntCroH4l4qXI13kniUWdmyue7pQgAM7nk4Ng3cvVvYxGLYNoBPGj6EgadEKXAFNotQIFFsBnC2FF7YWtB5XQzdJvBXevZzKEus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HMdPntjp; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736751470; x=1768287470;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bxyS+HVT0On4Aya4hXeoOegoS2eT+XmkG9lVcg7X7fs=;
  b=HMdPntjpWBPEPDWAEMnTG6CJOT5+dg7SdO5+h8jA/AmaNOPw0ag9ce1a
   80WNHa0hLpe+CHkRLTXc+Xoj45Xgpv44IWiDmyBOvjznibkJ549wnEJrV
   88X/tNW0PvKdPz02C1aLdgt5K73sWlHy/gPMOoaRt16O/6JwPoLH9VBDE
   vyWjD6YNtUcai3Ek8tZ4RvXC5kIApgYdQPFk+GBXecqlfniBV6bcM1qFU
   eytLmlJcrPE8l5rXmVYNcrS+R3lSz9DPz0GBmxxOoVg9D6OWbsNwg80Oy
   9zbgbl81J/ij9E8htr/5zw9A9mjq6NbhtQ/Wb1qeuC0BFCPrp08yWB8ay
   g==;
X-CSE-ConnectionGUID: KnQi2IVNQ7O0CiYmbLfE1w==
X-CSE-MsgGUID: lnd6J6KhR/i07cbMzHkQcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="36279567"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36279567"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:57:49 -0800
X-CSE-ConnectionGUID: rBV+OrLHTqiZ9OT8wuedEQ==
X-CSE-MsgGUID: RuZLGYasStSEpS0MIiI6Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104339116"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jan 2025 22:57:49 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 22:57:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 22:57:48 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 22:57:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqS7hf2TQZMI9rIvBEktLlJNlEb1m8ek7UMzyZl1cTNBye49yEeFbGlCArh2mCjASfrfDVj4POWJPZjYqmg1k2KcGSAWWhN8iIdn/kxKBsDFV6Oj9Oj5bpC5nyPe/TYb39UHdeUtntuTgsfJY4yk2DP+OsLbCHmIX6mdwXeoTIoR2T07AZlraDEvlQTH3RTXb+V33XPxESJUXS7N0HiFJGWPMZbTNFEZfRbJTdwti/swS2zP48b/S8jUbHv+lcV28Potu/Xv6APpGRJ/4emC7Rzu0lLNwkZ40KWVPAG1Mn0Z6ngnis6GFV/egnIPKjCcnEdpnpzRsQ/0vKerSlP2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AZqxBwagL7IENbB86YLnIzrHkA5LHJ4mz3LEwX1VaXQ=;
 b=f5DOoEVeY2vGdk+43xOpNapfgrk618LATlIAOtIt0gXcjXPepvUdskg+8DGGXfJ9UZ/mvwR3R7oKhFo0U+3zvqY2XwChinxlz/yQt70yOcSYYGPgCQJOf/DgRyhO9rBc9H841iRyMf/cAAxxaUS1doob3PQpmDSxdK2AQrBrA08G/72slAa20QtA/GAjZ6Lj/PGM+vCIX17XDXgkLq6kZCntPB4WN1MGi2nIctlqZZiYFg+VHr0TbT9UB33sU3eV+Rq0rhHUlHhngJirUagcIze6wUmmA6Rle+hryRiVao5edok9z4WvCyA6pZTxRH5Fc8nl4AUcUkR3JXnrwncymQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 06:57:13 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 06:57:13 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [bug report] HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C
 ACPI interfaces
Thread-Topic: [bug report] HID: intel-thc-hid: intel-quicki2c: Add THC
 QuickI2C ACPI interfaces
Thread-Index: AQHbZYKaxeWLhmpwn02fiqReiNl9YrMURWYg
Date: Mon, 13 Jan 2025 06:57:13 +0000
Message-ID: <IA1PR11MB6098EB8551B115DF2557DD75F41F2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <fa15885b-4560-4b96-b103-ca40c338f103@stanley.mountain>
In-Reply-To: <fa15885b-4560-4b96-b103-ca40c338f103@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SJ0PR11MB4782:EE_
x-ms-office365-filtering-correlation-id: 9cb0250e-bf88-4809-1e5e-08dd339f8225
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HBsBSDio4FG6/b7OydKT6nxKEsVeqpWMb54vbu3pYzA5urdOISDZxOaI9XqO?=
 =?us-ascii?Q?fiH+9vJvmRHAf+UDqnlc8wpG4J8WZWrpK3jn4B6Swi1/V9pOOcgMVOahk+uk?=
 =?us-ascii?Q?UHDoMq3EtmpyXeu+hr3sIf6KfSbuHB5hJQUeRxpaKJRRC8VpJ2L5h0Ux7pnM?=
 =?us-ascii?Q?6olph/NGs3zZvVhEwdf+A7pynESMQhhnQqFX4flPOJeq9vjQQvh7chCQHKG2?=
 =?us-ascii?Q?Q4Usxk6/EjvsT5aLfWIXtVEjWem6q2cMfL6CpjQy34FFP8KCKSXSPNJOaESS?=
 =?us-ascii?Q?cdCgFdCpmcLypzU5HMBOQCw3kk7sNCPwbQWTRV+k1D26z/z/6qgeAnQSM4C6?=
 =?us-ascii?Q?Qg5RlXqhFaRcYSoawnjrpgAowDJHgUus7EctTIn8ouREuvn3MzW43w4vQLck?=
 =?us-ascii?Q?tdFvuaHlf7/iQuyCA4LfAIlKG4a2CAlMH599dNdi5q815uyffeNifBxMa2dB?=
 =?us-ascii?Q?czezZpIQFmTaqgKdDhf7Uj6i/jmJ4wVs94Ob1sehw6F+Ue4dW+m0oanDBldC?=
 =?us-ascii?Q?3dbTPvzE3lDyXaALduP6vrka2CPcJB2sl7eZglBnCLTPHUsdh78h4XIyopqV?=
 =?us-ascii?Q?gq0aoqsJQnVVAOZyP2DQD4DOcQJA6zh5uaSkBjB39JXzyX+Udgy/TUbH2aKO?=
 =?us-ascii?Q?mZG8Y5r5YiUgNCj18GnS4p4iOS6jr6GYmXT2JLqLbZ7+OIw692np6Q99Yy8w?=
 =?us-ascii?Q?M4wM8Tn3BweWN6CY871XMt6dZXTqGuyC0tIdIMAOm7OpAhG0EljC+QHvaWXc?=
 =?us-ascii?Q?zk5RRL2/tjcfYxOgfOWVDiFy5znu9mdRjmafMmKTxDP2kZ/oTf11Gth9NNjM?=
 =?us-ascii?Q?ujTvjQmOESCcOORNFbQUh+JAp00s0u+VmFOnXCpnCdNTCvnzAVLVCJ+3LfPK?=
 =?us-ascii?Q?qjuQnkejYjYXgc+vtLO2XP9ReD+/WlEFcr3ZNH/zS263k2iKS8xn1Nhvbgpv?=
 =?us-ascii?Q?NqWVN336MN+Jc2vSA6t3TGPMpPBCSrNv6iPWy6SNy0wYSlmFK8hIP97QgHeI?=
 =?us-ascii?Q?o/F8o7wpJPM2n8ubIhgQIJB1xLAQCCAb/FVplVJWzZzHf9Y277ntrfYBTtos?=
 =?us-ascii?Q?8KOFRBIxR65NKpGsboRxAFfJUKD92VPbrmX/s4m2LwCFyARleII5VxK18RpQ?=
 =?us-ascii?Q?1WANRsZutXX4KRAu4y/GESJr43fiDZqqhyH0xJUpWJ7s2MGDmAevbz7RQGNZ?=
 =?us-ascii?Q?tmr/YL0Ei1ZAZgu6jbpMPqVTH67nSPzt2UImVI+x10WIzEwK28H6zs/4GRVp?=
 =?us-ascii?Q?Fm2xrgFdNPouLTn1laf392qj2/gazViHVHs2jqQU8ZNPibqU6Y9zqgCrAkz0?=
 =?us-ascii?Q?VaTeQn8iMlxXx87U3CD+A0iNziUSpykv+CL5y7sVB8qM1tkt2AET7smlUAtX?=
 =?us-ascii?Q?6xLfOBLNZ8JV9mFBeDI2IbLwQzJx6a0GzbCYSfyhVomWGcpxdLSDHwo5PjTB?=
 =?us-ascii?Q?NKIi2dyqJO6CvToMb+BwwodAH8gKtwiy?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V2d4ZC8/0DlNuGcO5/xsvzt3BrmX8T70Zdclbz//PXlkh0su0vG4ewIpb4Mn?=
 =?us-ascii?Q?z5e+fMrcH4jfdyPhcXq+cgib5KkJ0eqjpBm3n4reKz5Lh7ih3S8Mhzslov8D?=
 =?us-ascii?Q?3L2pz9Z6ElAKE2hI8yoOi1yOluG5gWR8+r2dgRWLuVMfwDOxc5VxWrcLcGPM?=
 =?us-ascii?Q?IaDDksxQd5ADvBiuwLdMGRY3wwg3CQ3IX3o+L+ositEiZQu0XXleultG/pBG?=
 =?us-ascii?Q?q/Cwkzs3RxTJ6rJyms4Eq0iRmxnHXYax3e2mgU1knZ6LBsxWKzYD1NPdzjsf?=
 =?us-ascii?Q?ekgdrtaz+jVDHZ1/Xc/jcqdpomwsSP+B1Lf2+gBLtJsUOW3v/CNEVmoJ99SO?=
 =?us-ascii?Q?Q0rN9GVZyHD8oeSRRl/owny4a0eG03vuOjOeusNC5llv/JI6icKjoENqC3D8?=
 =?us-ascii?Q?jWNCI43qjMlFtxpfdBUwiBmEXb9HUIyaHHkg/VvaS9giWHAUqM/qu9NH+/yf?=
 =?us-ascii?Q?ufXTityIHHQGvx0wpHO+ttfhugPznFHNs7FFIZxttDTCx+bmbBCQjU3im2xN?=
 =?us-ascii?Q?hzFmcYHpvdZWPUNZw9ILTAZdlmf30FCxdFr1p7cBsLEN48AEp7/5j3Iu2hrY?=
 =?us-ascii?Q?ABSUkt2H+rT8SRrrkRHS0ZKYlnDgMLjPeXqVZZiublauCmYIqVXyHLS2ITOU?=
 =?us-ascii?Q?Ka4sYodGQF8vChE3450yxYZmVC+N2exwOOaEVtPYmP2DWUHmxFxKyB/FySGM?=
 =?us-ascii?Q?3QciU+IhIjEA9tyn6gkRqM/a+5rHlYoWtFrR9FJ6nVh1LhdyQfNyRY51Jj0K?=
 =?us-ascii?Q?FdgqPAWjzlZLkqx5dDl30JE3txuInHXJlCScEs6LCyffl6ha9pon5DMQN5JF?=
 =?us-ascii?Q?kt36A5kR5HIONevgJBzLbCX79XCt0rTmZFk/RSa9AZuTSDyky3X+h/qRLd+3?=
 =?us-ascii?Q?hG38PPeZgr9hfrBSsopw5v8WCHz5s7Qnq+AtxQdFZ8tyNiAHno12vdPsPrVo?=
 =?us-ascii?Q?XmIpW1L/ljFmC3lu+BUMUsXLOHgzgkAYc+sLWEkoTVVnZsGeyhUxenSlhaba?=
 =?us-ascii?Q?ydpHPIpldVMXjADdKB51FrG5In0emVdkNpSYlvh2piTd65bZLGj/7uz9YPUX?=
 =?us-ascii?Q?9IduADstNqd4uvYq6we8mj3Pa2FCJiIQjbMwWF21h7h0ef5JvncrHMvQpsJg?=
 =?us-ascii?Q?N692yZ+6ptBXBwEfUe8bSzsWKby84vXn96HnmiQJIfBCT3lk3IZrJZMDPY06?=
 =?us-ascii?Q?PoVY8Wg7J+59uOzQbuKheABprDmnjc811HGkemFKDzeuMwDsbEy7MjSWMq+C?=
 =?us-ascii?Q?NT3NiqAplSdPQqeiHZKMTWFr5i6bRIddAgnw8a5pVWwyR36kkHOVuiwA/2gS?=
 =?us-ascii?Q?X6WBAUg/UmHknwkHhj+BiEf3G62CtfNB7pODNi9YesqBqxTaq8/Ln5H0Wx9P?=
 =?us-ascii?Q?DVacYL9xmxhatNWhZiXM8d1ySV9KToChDw0/rluK522XOEgFzHwHXY7eUGMK?=
 =?us-ascii?Q?WQNvy45eDYImmxkhSs+lwqjrglUEH7ru9koplphId9tMWlMZnm8LfdHghWLo?=
 =?us-ascii?Q?Qe/LdF4C/bi/GzgJi78mRDYsH+a18wnCoYUC0Vx9WglhKEBrpbGo5htuXvgy?=
 =?us-ascii?Q?uK86eENH9T1dE1VZRgw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb0250e-bf88-4809-1e5e-08dd339f8225
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 06:57:13.2244
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6xgOuL3IFz50D7Kx8GWp0MOqbPNcIIOBmnODFJVK3XzquklY+IcG9MB9hpQW+51NDcvwX8+Y7ExsZVyp20hs4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-OriginatorOrg: intel.com

Thanks Dan!
Will create a patch for the fix soon.

Best Regards,
Even Xu

> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Monday, January 13, 2025 2:16 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: linux-input@vger.kernel.org
> Subject: [bug report] HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2=
C ACPI
> interfaces
>=20
> Hello Even Xu,
>=20
> Commit 5282e45ccbfa ("HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2=
C ACPI
> interfaces") from Jan 6, 2025 (linux-next), leads to the following Smatch=
 static
> checker warning:
>=20
> 	drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c:59
> quicki2c_acpi_get_dsm_property()
> 	warn: potential memory corrupting cast 4 vs 2 bytes
>=20
> drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
>    116  static int quicki2c_get_acpi_resources(struct quicki2c_device *qc=
dev)
>    117  {
>    118          struct acpi_device *adev =3D ACPI_COMPANION(qcdev->dev);
>    119          struct quicki2c_subip_acpi_parameter i2c_param;
>    120          struct quicki2c_subip_acpi_config i2c_config;
>    121          int ret =3D -EINVAL;
>    122
>    123          if (!adev) {
>    124                  dev_err(qcdev->dev, "Invalid acpi device pointer\=
n");
>    125                  return ret;
>    126          }
>    127
>    128          qcdev->acpi_dev =3D adev;
>    129
>    130          ret =3D quicki2c_acpi_get_dsm_property(adev, &i2c_hid_gui=
d,
>    131                                               QUICKI2C_ACPI_REVISI=
ON_NUM,
>    132                                               QUICKI2C_ACPI_FUNC_N=
UM_HID_DESC_ADDR,
>    133                                               ACPI_TYPE_INTEGER,
>                                                      ^^^^^^^^^^^^^^^^^ Th=
is says INTEGER
>=20
>    134                                               &qcdev->hid_desc_add=
r);
>                                                      ^^^^^^^^^^^^^^^^^^^^=
^ But this is a u16 so it
> corrupts memory.
>=20
>    135          if (ret)
>    136                  return ret;
>    137
>=20
> regards,
> dan carpenter

