Return-Path: <linux-input+bounces-4030-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8698D7A38
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 04:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3E962812A8
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 02:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D397AD5D;
	Mon,  3 Jun 2024 02:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nu4GKafA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477CFF9E9;
	Mon,  3 Jun 2024 02:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717383506; cv=fail; b=l+37F+RyYRfMteluREk/qc92Y/Ntf1u6BUEaMMdhRTWTRVGevv8gZU9ridfDgtq+P3hqC7dqRzg8OwKiBk3lk7V24tWGC3nlmLTw8+mP/7keGfJSt2mAkqf/Y8ezYuwN8ND5GmDIxSJRafFPrjg1sJn9T98+oxE4X676EIp5mSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717383506; c=relaxed/simple;
	bh=KTiql3UZ08+403GisBkc97Wbb2O1EtnPUsgkcm52Tcw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dlSnRjMApAwtZQn4o9Wb60s9LGtWYf9dberIwj4N6EKjAwEZIvNArNNGJ8CseqKDu/4txinBIDlPdoV3Fo5WDJl/Ad9nT+x5YH6gh2XPc59WmZyp66X9WhV5DhBS1DPOmGm7o7CwXOahTI10eYYBFMoFkVM98cvg3QdK0/zi0dw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nu4GKafA; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717383504; x=1748919504;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KTiql3UZ08+403GisBkc97Wbb2O1EtnPUsgkcm52Tcw=;
  b=nu4GKafAHcFQwDjx+BWY7Dkzbh0+b9QJLVUc5ek53I84VgHpdINLRV99
   ddTo7UUuLv29VZlD7Tq7DNI27vCHaFgFRP3Dx8GxG56TO+/gfOPCHdPLo
   WFy8vHOejdymtgprJpNuJs+BsmPfTHWILhfw/QkJI/vgQLsi1Q57ccKqw
   C/MLgzzEoXfI2waoWQi/HM9J5uvNa0h8HNEgx4P2nUX5SvgQEmpGJlI3h
   TCxltELZPFIME0r8L0rMggqdenw4Sjbo6mzvjzH4GTN1hJUaFD2FoJLA/
   M3IMagzw3BC3UbWQiGWw4gmU+1sk2/ZkOWGvq3gz73uF7cL/xp4CNfuWF
   A==;
X-CSE-ConnectionGUID: hSJMsvI8R0WJvHDHhGGIvg==
X-CSE-MsgGUID: Mp48FD9NQU+QXLughul5Cw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24980698"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="24980698"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 19:58:24 -0700
X-CSE-ConnectionGUID: QoN/Tm5VT9+nH4LEI3FVDg==
X-CSE-MsgGUID: yHJf9i/QQ9mC3d6FmxtisA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36825923"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jun 2024 19:58:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 19:58:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 19:58:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 2 Jun 2024 19:58:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d8p/E6e72qOf1o7m47+LNUo1M/0cj0MHEljtMj4U5P9bw029R0TBSu3Xo+BTbxDG8wTyEv/A1UH6dHWRZKCGis4JigFyU9xgfL7txrQwNwVDBXqP5ZDWFronlB/I7ynkOTPGe9J8AtaG5G833GYLaXv5I/1rDLvnL5ueO52mxAR5NiHOog9pg8VMkKDDO6fFLiaFgVISITfEscBfAC9OR3+kiqgZC/BFaRHOFaKB0JsKgDmY/fquXzSoBw4I1LUCnDEpl3WmKocB5+v7ADnQc3zI1HztsumxKOntHQU00HNljyULEbnjvUNYPfnUy0z1M7euwZNQYBdSlIFxrT02MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++mY/ifkho8BD7HJp0NG0LRKxOHM0D9X/qg1SR4mONM=;
 b=Za5ycg/FMvxjo54Yt/c/HwMbD62pOEvZvVvgsgAhvyJHPFoSzsH75VwvsKPxSZrSpD8l/lFnBdnLtyazyttpEyt6x3hgtBiigECX+CNwm34G3PhbpEbAGStPzWOS4ARfHIu+aoVYzQGZiIkVlhh4Me8wIpw2hUcywYlAG+RPGCGWmKM/10+b/4ZC8z4Tn9E5oqTV+boU3QIk1w4S9VD6mKzq+5a5JowmSBSpuCEXMOOrXB97orDoFvdDETwdpfY4FHx5KwbfayoyUViokHMidJD6Q7/kqLHA0n9BmLtXnSpBm/ndQcjCSkax3LpI0tBmqM5nraU9v9VO1wyOr4lNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 SA1PR11MB7087.namprd11.prod.outlook.com (2603:10b6:806:2b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Mon, 3 Jun
 2024 02:58:20 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 02:58:20 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
Thread-Topic: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
Thread-Index: AQHas3ei8UwVwp3NNUSh33LfV3FKILG1XGIA
Date: Mon, 3 Jun 2024 02:58:20 +0000
Message-ID: <DM4PR11MB599552C6835165C5FCD7F65793FF2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240531162836.157891-1-arnd@kernel.org>
In-Reply-To: <20240531162836.157891-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|SA1PR11MB7087:EE_
x-ms-office365-filtering-correlation-id: 7027a166-ff9e-478f-bf8d-08dc837906b9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?tAGmRa6RyBJYk6PvNNVR9lystc8D7ILxl18qKjTL6C7vaS3IH36rW91KIpge?=
 =?us-ascii?Q?l9yHsxj95ka3cRmQIFg+ZGKGNoU+XgRlOeXiIxAG6Mr+MV2hGy8Sr64ZsKcT?=
 =?us-ascii?Q?fCdL4Q4eYLM6hFFfHXHMzYSFJxR24aSIqb8H66UXt2C4lhEPJ+jWTZdm+ZUX?=
 =?us-ascii?Q?mDzzSVt10NWP1VoBrIISujngFG5m2D0bKOnSqiyYGrjoCrVfZNz3PKlxt8IQ?=
 =?us-ascii?Q?A2v77gJWwzMuOHSOJr9jIiGxRgx0/RmDLpLpwAq1pM6MbI093jdfZlzJ8ORZ?=
 =?us-ascii?Q?PNUgga4keD13dWS23KPBwWQAfnm4tvT/IZln8wfQpJ/PI4KQ596sUlSSS9ba?=
 =?us-ascii?Q?YW1HpOfFanz8TtRx7JctUEZvtq4/sf29dHt9IZmy3eryDM/OdUccC5nxxMvs?=
 =?us-ascii?Q?OjapLeaqKRXmEQs48qsSSK2cH12WkZhldQUDlOLXMPu3LEJcx6yYsukLFvyI?=
 =?us-ascii?Q?QZvMOQ+SsCHY12LNlh2a8ZeN2/GyNuI0Ng48ggTuNxa+uuCQs3lSINm22Z2A?=
 =?us-ascii?Q?Sx27bilziW9IG+cvwVnFfKwhgL8LVY9IRpFJ6425CZUQZoIWJqilqFvKo9N0?=
 =?us-ascii?Q?x+eE6Qd4MkrGaKdzlk/NIID6+kEcLLv9jQOvPvAZtJqoqqjD5dmMqRg/2vhl?=
 =?us-ascii?Q?oDcdWG0Re8EkwNssVX1vslBpPu1PfVyujxUOd5o7bBCkZ67IiFKawYGNn4tL?=
 =?us-ascii?Q?aCwRks8zGp45+vXT3zjj4hHpzf3jlKTLubayplOk2x+slKTXFA/K4LhxmX+4?=
 =?us-ascii?Q?R+P1r19vdtP/J2G750Shdey1NTNchhZ8WqS3rSGF65OcP0J3No6h8NpSgZqm?=
 =?us-ascii?Q?zkgqZAUhedvWNwmkpi67ZEriWblS5miarNZzL9gmymIYMdqjdtnYdPTMFSwK?=
 =?us-ascii?Q?MM8UetwvjNkvrdQ/ZBKM0b0YMIT5AeWbEk5HPpZjadGge0HoKfznmR2rBl2c?=
 =?us-ascii?Q?m5dmPQgpbGO7k/sWRERcBpCXgQyn2sDSW3hBWf5HSzahaX+tPpN6471YTCqJ?=
 =?us-ascii?Q?ok8I3EhjqQZZwEEakYPe5ZcSMhLNWRKiSGiuuicsyFle6P2ZisoUEdWefg/E?=
 =?us-ascii?Q?UeKZkowyw5+Uh4mnONl/h8GRAt0vFMj0Ikm7yCyWZRjQGNCSddvNhMYX1NxF?=
 =?us-ascii?Q?6H5w0Znfw4V57ATmcuQxoXrfT03X9S9Bwaf90yKZJpUpLR3rHrXvf6zlpB45?=
 =?us-ascii?Q?5udowu9TKfPppn0M14clUSiy3R2JgugfSgG6kLn66AgaobcFCgw8LEwGo8P0?=
 =?us-ascii?Q?EHVmfXrxaJ4bcZdmWUFN2hiAcax2MBBGOWKX+Etwzg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JfdYMoK9XZuHnkTrV104/1MJJhH1eOJMzwvsQB4dE9+jZ6vxRotRaye9HcfS?=
 =?us-ascii?Q?GypWNfJUMjb/wsYJ/Xv6t3JdlZ+U6+DvnBdFg2+ufq5spPgp6nprAfY19IgL?=
 =?us-ascii?Q?W84DGSarjdyRAnYAJGdKyq1I9KCJIty2bW5+Stcz8MZBR9GICLUfOuCbHFqr?=
 =?us-ascii?Q?e0ZW2VyXsWsbZ1bjJydEGZYYxhU/JJEWwrLpctxNkFZXI0IHACGbIyQUmZQw?=
 =?us-ascii?Q?MngykGoK0U8gaEWXaJngbVe5LrvULRBYaikCqAEKGyNEdb/B7qFr5pWo7Ap3?=
 =?us-ascii?Q?c4N1slo4iTSktRp/6T/Zopohg0plAgANvcyWt1SC1+d8a0ggVviRm8YirDWG?=
 =?us-ascii?Q?5RyE5MKHsB2Ge7mzDJEZ+wf8UNlAKf7d9mD52E/xTsbwlVq9doGdf9++Zh6P?=
 =?us-ascii?Q?UTj6t//5HlfJ9Z30HYS/fMsVuEuywczNeGSvWn9E5T9VcXXwbAeyD+Ch6T3m?=
 =?us-ascii?Q?3rIoGGbPojKJ4isVKgfA+ROdmEyUgRSAdjE3ATdGHd4HyI/GIttFZGFZzT4s?=
 =?us-ascii?Q?astczdPDVT/4c+XYfY04VPgQ4sIy8CQysBVBwU2GhCrHH9xpfDTYu8Nd2HVt?=
 =?us-ascii?Q?hpUY055fvSkjdn7vKyT3QPV+HIJ8DDbCTVjhYL88/3Z6i6ch+NBx46ISDqH1?=
 =?us-ascii?Q?ng4cYse9zZ4GCuQ6BCJOtIX74nUZWnITkQeEwEUEg+W2qOo9patHFfM39m/X?=
 =?us-ascii?Q?Sg+YYEBzYodi82+9dRxy2NuSPIdEN9kJZeNojVIt3y18bTc3Kpzy9qy7sJw4?=
 =?us-ascii?Q?P5EIaqLbm8Oc2q9ViMoQmsIMsid+lCFGO4i0AH11v1x4obiAAgMuj4RRnSPt?=
 =?us-ascii?Q?HnBUJsXCbZ4dofHcCI2jSNb3jwOQ2SyLm6zaX+28vWXoXYjp3GPLPEWxzk6V?=
 =?us-ascii?Q?1Win4jBrm5C2z59zB6KktztnOSWxtCLjwpg9OYJ8Nk6sG+F0bxo0Z1JUsQWX?=
 =?us-ascii?Q?Jd1unYyKP7yR1DKskToE+/d/RrUGItGIPq167W2UnD347OYR+FEzTpCBu2f9?=
 =?us-ascii?Q?FTOZ/TnSXg2gVMTHMfzveCOFbV/aJi4IOVgtswKi6lg+okNQ/E9InWvITu5y?=
 =?us-ascii?Q?yaXpskia+Ucg/qjpLv4UMPq9k3gkt7TZMX3mTrAjwo7+8D4vrMvVNXsbwx/W?=
 =?us-ascii?Q?lhdGHNH0svilLP2MUEAK7F6T202k7GlyOnCutRMBTWCIlvZxkMf4+ksh/gZK?=
 =?us-ascii?Q?3xwfB2yhHWBXXoFSPlUpCGYlXGF0+S4vhDo9QQI0FeG43rxm24PFP3w1xrrO?=
 =?us-ascii?Q?CjQg9qqPGf8Lmiva4d6UmICpnawzQFKRCv37uV9hcMcMu85IbWTPyUZYshK6?=
 =?us-ascii?Q?4ke4tz1MySJHgKJ/ka+/o971NULBTTwbeKBtGVFyeyX2P7KgwYA9tt1zz9k4?=
 =?us-ascii?Q?5/HCkoA/AyLyfyUpqlLj21JloeFzZr+28W1h/kAN/fZtbp6I0BRnbWPo2l6o?=
 =?us-ascii?Q?GkFxYDTa7/yyzLaxIyR1E/Uw0SKkCc6ctec638zIQipC5edWG/B7sI9VZD1N?=
 =?us-ascii?Q?5wC9lqe5IaJwUG1StypX+NdHIpg+hI9oEJ82QkHFyKdJc/CA+7DBvJCaaprX?=
 =?us-ascii?Q?S//d+XnBXpF93GhksMe8nDPMZS3Oxa5iIGRx9LL5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7027a166-ff9e-478f-bf8d-08dc837906b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 02:58:20.6555
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiT0laPgRxZnKgDgCTQqugMBBONp+wsRBFdeSS/eoN2COPkMbmiXh8Rb/o+6Bw7w8lmSxxmCsFM7V2JhM5jdlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7087
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Arnd Bergmann <arnd@kernel.org>
>Sent: Saturday, June 1, 2024 12:28 AM
>To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Jiri Kosina
><jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Zhang, Lixu
><lixu.zhang@intel.com>
>Cc: Arnd Bergmann <arnd@arndb.de>; linux-input@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
>
>From: Arnd Bergmann <arnd@arndb.de>
>
>The newly added file causes a ton of sparse warnings about the incorrect u=
se of
>__le32 and similar types:
>
>drivers/hid/intel-ish-hid/ishtp/loader.h:41:23: error: invalid bitfield sp=
ecifier for
>type restricted __le32.
>drivers/hid/intel-ish-hid/ishtp/loader.h:42:27: error: invalid bitfield sp=
ecifier for
>type restricted __le32.
>drivers/hid/intel-ish-hid/ishtp/loader.h:43:24: error: invalid bitfield sp=
ecifier for
>type restricted __le32.
>drivers/hid/intel-ish-hid/ishtp/loader.h:44:24: error: invalid bitfield sp=
ecifier for
>type restricted __le32.
>drivers/hid/intel-ish-hid/ishtp/loader.h:45:22: error: invalid bitfield sp=
ecifier for
>type restricted __le32.
>drivers/hid/intel-ish-hid/ishtp/loader.c:172:33: warning: restricted __le3=
2
>degrades to integer
>drivers/hid/intel-ish-hid/ishtp/loader.c:178:50: warning: incorrect type i=
n
>assignment (different base types)
>drivers/hid/intel-ish-hid/ishtp/loader.c:178:50:    expected restricted __=
le32
>[usertype] length
>drivers/hid/intel-ish-hid/ishtp/loader.c:178:50:    got unsigned long
>drivers/hid/intel-ish-hid/ishtp/loader.c:179:50: warning: incorrect type i=
n
>assignment (different base types)
>drivers/hid/intel-ish-hid/ishtp/loader.c:179:50:    expected restricted __=
le32
>[usertype] fw_off
>drivers/hid/intel-ish-hid/ishtp/loader.c:179:50:    got unsigned int [user=
type]
>offset
>drivers/hid/intel-ish-hid/ishtp/loader.c:180:17: warning: cast from restri=
cted
>__le32
>drivers/hid/intel-ish-hid/ishtp/loader.c:183:24: warning: invalid assignme=
nt: +=3D
>drivers/hid/intel-ish-hid/ishtp/loader.c:183:24:    left side has type uns=
igned int
>drivers/hid/intel-ish-hid/ishtp/loader.c:183:24:    right side has type re=
stricted
>__le32
>
>Add the necessary conversions and use temporary variables where appropriat=
e
>to avoid converting back.
>
>Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from
>host feature")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
>v2:
> - fix minor issues introduced in rebasing
> - rebase again on linux-next without the cache management patch
> - fix up changelog text
>---

Thanks for your patch. I have tested it on LNL platform, it works fine.

Please fix the build warning reported by kernel test robot. https://lore.ke=
rnel.org/oe-kbuild-all/202406011319.hk4MAysc-lkp@intel.com/

  drivers/hid/intel-ish-hid/ishtp/loader.c:170: warning: Function parameter=
 or struct member 'fragment_count' not described in 'prepare_dma_bufs'

After that, please add my name.
Reviewed-by: Zhang Lixu <lixu.zhang@intel.com>
Tested-by: Zhang Lixu <lixu.zhang@intel.com>

Thanks,
Lixu

