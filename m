Return-Path: <linux-input+bounces-15487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A30CBDBE86
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 02:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 487054E0338
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 00:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2201A9F85;
	Wed, 15 Oct 2025 00:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkxMRiHz"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380EC946C;
	Wed, 15 Oct 2025 00:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760488004; cv=fail; b=gakAok1TpKuQHXV2LVVomQQ0yDrIyYWl5gYLwzRHUZxOAykReedaLyuoRN3pmHbsGnyRBUHJDulRn4VX2w6CcIXiHQRChEDvrtfe6D8/vAcTfk+/kPdJ7eMlT93QPl87fx9Bm84WYBLuBF1weFlDUQ2r5lgqnkW+ESSmvcfhpRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760488004; c=relaxed/simple;
	bh=in8g56I5i6ZtzYq6FbGQ2+DU57X8eo1F98lQ5KaT3Y8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a7lBCaVJDHIUjxicW6E/Y8ph4fW54Invxh5NmmrcWUXP0L/S+jtkp9xNqNa5/guwjn9SmtbL56tMpdkTQm9ZfM6Gv3TCYcI2P/mFFKWEB1nW/mf+FBYxN4jLPm7L2ZD+KM5612gTv34qPm1pryRgMLqydi0hHSwb3vRCUYUCoXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkxMRiHz; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760488002; x=1792024002;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=in8g56I5i6ZtzYq6FbGQ2+DU57X8eo1F98lQ5KaT3Y8=;
  b=fkxMRiHzKFJ/yFpziMsNqwaH3IisGAo9nvroz1oyyxLVF2WLMQ3F8P1Y
   9xRSlJYoTg6vM05+d3+Ey+8g5xR8MTu/jveVo3v2Dzr1o7ZquQOcc09EP
   Lre/+cVF/L4zR/6UkZ+t9d3sEQCiYdF3szr4K8/1M6yVlOtY2oRRhvuHX
   ANjF9Td0gpFK76wMumwyHK8G7wPs4M4ZWvlEcXcnI+rCbnIFFWpB79X6i
   N76W0RL5ehY6r/yzafFKL9Blwu91lQ8VqFGri4wKnUW7JG04+4HOgPlOL
   c2NUK44FSsVCwpXQtS6ssNga6XSDnbdC+ARI9kHARORcs0IAB/wvch4YI
   w==;
X-CSE-ConnectionGUID: R4f1HCYQTeKXUyjGbKZcRw==
X-CSE-MsgGUID: BZnjnlw3QYSgAiplgCuFjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="72930084"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="72930084"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 17:26:41 -0700
X-CSE-ConnectionGUID: AY1Qh2FwTLOT8ws2NKSp2w==
X-CSE-MsgGUID: 1yPs09sJSFKL+9XshpKagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="186446596"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 17:26:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 17:26:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 17:26:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.47) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 17:26:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7HST5f4EGFvM1sgaCVBRd6UdtYj44tLcleZc9i6JEvtMkrJGzFQvnZ5753yFbkpeEiCL9hxXWXLfiMxVeo3anBOUnbj3GNDgjZjoe/OuFntEaOHCj8TJ2IoWlGzlyD1K+QsrWoc0zmSXKdYDw5Ad9ICHDMFOvir/Z+z4EllIllH44w2/2DFWF1d0n+nbffrv+V1GdxrhI7GI4Ob4JIk1ZrN4tOsm1Itf4W0v6tS8P8cM1U3r7gkvbCQwjmdFRLDzNxe2jWImiFSTHN8AXFXfKeL/QoJW2cgi2BBJPUTCt1n5FhJtCd1LH+qK5WX9v9g+SL/6yX1Bh3l+LiOpI9sGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e71jrnZfYyCfjQr6r6YW3D0U10QIRDTP0yRPyrygPcM=;
 b=ioTGwoylo+XdsAkfF8j6Qm/kGmRnnzCdGrT0DNkZk1VA3NgM9SXvCdO/IELQRvTq6T1Za8xg7oBPhdZOQgb4FEu/uQNKaEeAl4TjCknVWzqoW01qFpvBBo5IeBVqZiUimh+0ArhNZO+fflLZ7oDLt7Tr7/JT8j+EwyG4Jd4Q+1mwoz++vfEYmK8HcI56REUHYrj/NbKHdxpZeEqYOQ0WE+tqMdYjQJgLJxJbSph0Se/MBs/SaPRl7duroKxs4ctJw6iNa3j591nPpDCHb9Mo4I/fWNgNtZvDJGgU8JQxQ6u2dFpo+bSMhiL/uB8wHKBdl1ZjUGrZd7WHC2oayjVSXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH0PR11MB5829.namprd11.prod.outlook.com (2603:10b6:510:140::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 00:26:38 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 00:26:37 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui1"
	<rui1.zhang@intel.com>
Subject: RE: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first
 interrupt from level to edge detection
Thread-Topic: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first
 interrupt from level to edge detection
Thread-Index: AQHcKTRknzMjmEefFUCBps0dqYivFrTBh4qAgAD6t7A=
Date: Wed, 15 Oct 2025 00:26:37 +0000
Message-ID: <IA1PR11MB60984422D391F9C82AE31243F4E8A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250919070939.223954-1-even.xu@intel.com>
 <13o2s0so-nq3r-5909-4n2n-o97q2s35025n@xreary.bet>
In-Reply-To: <13o2s0so-nq3r-5909-4n2n-o97q2s35025n@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH0PR11MB5829:EE_
x-ms-office365-filtering-correlation-id: 7cba3c1b-e8f9-4a47-f845-08de0b8180db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?opwzmy2w/ScWcxakpn/yFScaI5tXBIUaoDqJE9eWVjnJFBnFdIqSxUwMmznt?=
 =?us-ascii?Q?qSEknIoqZKgx45E1ibTjbO57K5uUPn+FmjzXJIJkuNUnm9bpQMEr7gcvwslS?=
 =?us-ascii?Q?GRueCc/XHZUbQ/42tMn3zMCbM4tEd7/FWwiZiwqrNRkmw3OsD6luRoPHOio9?=
 =?us-ascii?Q?xbxYmKlbVl6CC9K2jECd3npjg08cD7HGQSzIdUYydFI1+2hUZ6/NOkrOgoag?=
 =?us-ascii?Q?YVd4q7L7+WGibyPMaVZ1QEUIpsNGhU2raWhASqywVpOr9c3KhISpYwggweNy?=
 =?us-ascii?Q?gGJ04F3Rpn4HnvuOQw8QxDk73jgtwbjzheoY34n/6jk71+0yx8LdQCT8yAn8?=
 =?us-ascii?Q?LNs63DVmkoQcFWFyC5rcHZyc5DJjDTZIrWNTL1Skwt6CPfHbWjKYq1zZnLcO?=
 =?us-ascii?Q?hZvVfAFQ3T3Q2wZrc3AFku+6Ki39nh94kHuhrsxz6uvsUt+KKbgqJiWHgeat?=
 =?us-ascii?Q?5Jchs+z0Da+RxJvK7j9H1Myriwhx5wGoQ7bpBfUGk3Ng3NtfAh7+2Nruq3PC?=
 =?us-ascii?Q?JNZNp5akjA7mka6XBkVBnSmYv4+2tfXDYdkfXHHlx5SUrUPV8FuQ4hiJ4iLE?=
 =?us-ascii?Q?f3qWTmCa4dFJyviEg6nxrJYkRC+Lsw/5xLdYAxreBA2lMsy0NFrFrlDwSgTV?=
 =?us-ascii?Q?rAHZu9Zgj/+GbZzfP3fXxQ4mOthflBJrotd7xcbsoBkaWT9Kd+a8iycqQwD7?=
 =?us-ascii?Q?bdOHlILFcwLFMZbS8r0VjQOLrhPq9OAURl5LZF+Lb3HPpmno5/8Fuu8FnVFZ?=
 =?us-ascii?Q?r0p4FBhroAImHlnWsmE5l/vWEAHN9BgUw/UHnsJSNOZvP0UN9ohZo9/Qe9EN?=
 =?us-ascii?Q?mtU3Js0lWPW+C3VwQspOhHS0d7UIByR1A6tsaOi+wn7pwlPcjhXQ02hHFbrO?=
 =?us-ascii?Q?F1z04uO2YyLJPgxHeib83UvOQbVKi1isnmmnYRVd4wM67djJx4tFPdsb/kH9?=
 =?us-ascii?Q?eJDuBMCsNDbco/e6r3OGNn4U1ZzuX0phJpP2E421LbOMkj0VPb07pzPJokXi?=
 =?us-ascii?Q?HmaG1QQusLjUTQaP94Lx59nOq67fFqlGWPoxlju2QwZ5jFn7Nz9jU8Q8mSB1?=
 =?us-ascii?Q?wKV4/bYfPH6Ki4twow189/n2tvR9l6Mxmw8lBKpFNdLzl/Sdh7590bb/HBv4?=
 =?us-ascii?Q?R8Wo+pwmyL4zsatjt4IVnPTVhrwd9vXwUF5wjI7pq2e8zGqaUguZ2vXGGK8m?=
 =?us-ascii?Q?ehQ5v6EBqNX+BNzMR4mY6C84RVuudz0N2jMXtna1/06fTYeipKOOQieL1HKK?=
 =?us-ascii?Q?x8i/2CSBA6FPSXnitUoz3hN5u8FkroBrlt9uE0XrNLC4kmqd3tn0j4woWk1h?=
 =?us-ascii?Q?08SE22pc4gJ2rY9uDRlJ49VTFzI2lCYcXwFwLX5WzGZn+jdAlEdmimrN3Q2i?=
 =?us-ascii?Q?k30VLVWRUE1WAuYOz5Ny1C56DaVkEox5MxHoILdp6RHn/xncx8lYg4E79HoW?=
 =?us-ascii?Q?lxq5ls8qhhLrCly7FgwEI0+NXvLZMTOJ6He/aUiE1SGDplhGcbISIoKR3CWC?=
 =?us-ascii?Q?yKe3qKiEK09vbnAIG3kLuwzTCDOeUaQh8uTy?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LFyFnukUuWGGy44Rfh375FMsNd9Kd4szTXo4G0eV5bnfpsKxdnQFrsan/LyA?=
 =?us-ascii?Q?PB9XNykIVaKCHpksphEn3xQDJDWCShrbjyAub1hpguWTT9eDey/Ved/mFDze?=
 =?us-ascii?Q?MSOXfvJXM8zTd91WbltOLADyHxB0bM3v1jzy8/oS/VyukI/oDjViEv/HQBo5?=
 =?us-ascii?Q?HsS3RNcipO4ZoiTGx0cTnCdfe1Pb/aKWgY4OR/vRavRBNfS/gbUGjoVl9b1b?=
 =?us-ascii?Q?hJYNAQWlO1sogtbuAfP6S7PanBk7nM8mjQVz5LOtwzoxy2aK6mGuS5/pF9V7?=
 =?us-ascii?Q?rIevcwdKNxGgWrggqYIsnltHhof0ZmYk5NLFoJqRVE/DbVkZxsy6vpZsvPMy?=
 =?us-ascii?Q?WCrJH0bKLxCK+9/VYTNquOCcBpTYrrn/nG4UY9sF5DIbRnlY9VpV8qm4BVPJ?=
 =?us-ascii?Q?VGM6UswP8hGlkqzY54Ox8XsN8sreIH0eaaS5B97sKpG6JXxmXIjkko0WV+yi?=
 =?us-ascii?Q?Ok/AHpp/7BoelCWuZCMpjIPrR/t4M9Bd7gBhnp4S2GDJRhVP6D2N4+vb0tJp?=
 =?us-ascii?Q?fnWTfidE7raBIrAAYhZKZdOQgykFuvNmKB0qSj1cEKo8VK+5+zPwBRBykUDg?=
 =?us-ascii?Q?MHn+To6nQC5zUUjUsLkSmO/uTris7TY/AB3RL+ri7WyC5PTlvx2KcNWBCZII?=
 =?us-ascii?Q?1tMWEXQMFhOSEQiF9n+V/lKgYq6868SDKm9VDG+0YZ9t8ERG5f8UnRUgHmJn?=
 =?us-ascii?Q?B9ppkkNCkF8tupUyk/1eJ19QkNVocVjyMYKiDxCeJ5p3DwUxBaC1So4KU1qT?=
 =?us-ascii?Q?jMcBNaac75yXn5+87zo5TvkWuaKHulVxI6ep8jbVS0Oo0DnepQndgqDPaM8p?=
 =?us-ascii?Q?DAUthdh1vwnRFxIEv1q0Ysd3YdEl25/YzBAG1d0O9X+Rg23uAz0mgkD341Az?=
 =?us-ascii?Q?FDuHRZUDnYDUvUo9qk+J82Y6RrshBH2U/COeW4f17Hdu3Uhfce1GYMHgzz+y?=
 =?us-ascii?Q?jWUcXZt3EaRcLQ7FYgeWYL3G2ZWwiy6S/Ysjud8jpa/Ma/LPIMZWjGVv0HDq?=
 =?us-ascii?Q?XIAPOKiGgZpwDEqbQLdcHK3RKZyvjiAjyRJ/dQsYngae/DwO3V9gezyi/F02?=
 =?us-ascii?Q?z2/Xdpc4gTNdkZbhR/vbE9mppEWT0E5reOXpVWh9zBBfUuPOxkGi/p8kSKva?=
 =?us-ascii?Q?lWojst7czv+DBDGofGO0hfJCywM75nK0GjtYGNl3TZULrrOZXfbG5b5+PjUY?=
 =?us-ascii?Q?s3ptZITl5h+45BVA9vJh9jqZKWbgyDYRfIM7/cB6HbRIoxIM+t6q2nvO74/x?=
 =?us-ascii?Q?5ZQAxH3tAWgAMISQpFiRQ/VbIJ8uDk3duXg5p4t2RgZS969ol/Crql2SCvhc?=
 =?us-ascii?Q?kuMUYl/FUsqMvAsihp8JqB5W+dVWHuYd1LChRARz1OSRtNuACWAxegr1rZDo?=
 =?us-ascii?Q?Lz5RiHhU3V9fg9eDZpZTyEBPyXpfi0SMD66Ol0hmXaMjKceCo3uZ0TUqutLy?=
 =?us-ascii?Q?yzCaS/u3IyhDe1wWKT+06KpFG5zMfGtnl5/HxPm5cX2fEwoZWklcDbi/2/DW?=
 =?us-ascii?Q?aMx/ZmChigos1HztW8G8bfBRq9TEHPX371KoIrH7yUkT7H17mCHUsR5mDJQs?=
 =?us-ascii?Q?QzKSLVLAw53aEnbP3qk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cba3c1b-e8f9-4a47-f845-08de0b8180db
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 00:26:37.3059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xsIeoml0N+EdJatZKqpam/nAsWrsE2G1etr147WoDiC1mN7Drr7rTiH06IaDD/PMEJmXl0KgjIwaBlrYW2s+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5829
X-OriginatorOrg: intel.com

Thanks Jiri!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Tuesday, October 14, 2025 5:29 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org; Zhang, Rui1
> <rui1.zhang@intel.com>
> Subject: Re: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first int=
errupt from
> level to edge detection
>=20
> On Fri, 19 Sep 2025, Even Xu wrote:
>=20
> > The original implementation used level detection for the first
> > interrupt after device reset to avoid potential interrupt line noise
> > and missed interrupts during the initialization phase. However, this
> > approach introduced unintended side effects when tested with certain
> > touch panels,
> > including:
> >  - Delayed hardware interrupt response
> >  - Multiple spurious interrupt triggers
> >
> > Switching back to edge detection for the first interrupt resolves
> > these issues while maintaining reliable interrupt handling.
> >
> > Extensive testing across multiple platforms with touch panels from
> > various vendors confirms this change introduces no regressions.
> >
> > Fixes: 9d8d51735a3a ("HID: intel-thc-hid: intel-quickspi: Add HIDSPI
> > protocol implementation")
> > Tested-by: Rui Zhang <rui1.zhang@intel.com>
> > Signed-off-by: Even Xu <even.xu@intel.com>
>=20
> Applied to hid.git#for-6.18/upstream-fixes, thanks.
>=20
> --
> Jiri Kosina
> SUSE Labs


