Return-Path: <linux-input+bounces-13930-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F0B219F3
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 02:55:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9671906134
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 00:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C8B2D6612;
	Tue, 12 Aug 2025 00:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9b/gBfK"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704E824BBEC;
	Tue, 12 Aug 2025 00:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754960112; cv=fail; b=TEqnIrt0/D+Y+1sn0gDUqfCl5MpdHxBpjjrWpe3J5Ojr+IHnHIsIf9soH05y9ODD4hJTaX9qdUJ/p89I9Jnw5dhDa+fjn4HrEasswaMgroPy1pBeN7kA4a2Yl3HANLqxmCZVL+dQkWeW7HmKojy/EHbW/8+jcI2zijV42HudUmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754960112; c=relaxed/simple;
	bh=PdzUrkikAzcMuksJhB6dVo7TjnQWtSwJAqIJPZDQq+A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fA2lu+GTpNWUda83YDaXoGg3vXZRtPBC0vDQ7y/UZQHlvW1J8/bYwQN4jfu+HuHKhD+TDx0tuTjIByyvcoS+1PFOfaOH4uY3eomFEcn+lDICqP/fhB+1hyii9wGiDRrAEMcMyDz5wlBa0VaGpwceFNrYrDx6B3i9CHWHnDLGkwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9b/gBfK; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754960111; x=1786496111;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PdzUrkikAzcMuksJhB6dVo7TjnQWtSwJAqIJPZDQq+A=;
  b=A9b/gBfKAnjMLOblwDOr5oJQcF890oLX3fq9bYchMJpPg88DgjJ2zu1p
   N+FIgI4FNAZJYVT07knuLchOVBHmgUyD5Np+rJuwZkq+qbW96vijsQFia
   pdmoE8P4a9iPdOcUVw9QAC7FPZWtTVx0Kpo6UFDw2f6x3OTnfByj1yJIU
   IeTnmmHjX79LxrnE8ogYUSPs5vVCg5jXeBhNDYN78lp1YGb+81OGUGTI0
   GUYNagKX2mVj/oAtqiJKq5IwthtW/XwLGj+//XOe65MfWPodUuaBecdnl
   J0qIeEpiVwyWlszVsMLIeHvqzpEFLBDTsuaz+8SYfBFeY29BFIBh1h5lk
   g==;
X-CSE-ConnectionGUID: xR2zut0HRBO9juNFyjcQtA==
X-CSE-MsgGUID: QLvG+xPLSPa3pEx0CRvtUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57181499"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57181499"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 17:55:11 -0700
X-CSE-ConnectionGUID: AW/W8+tNSayw+NWB3xWiGA==
X-CSE-MsgGUID: TBbYHd+iSbei6jl6btqt6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="170258079"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 17:55:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 17:55:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 11 Aug 2025 17:55:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 11 Aug 2025 17:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xlrisVStjc1PDxf4BEVK1jgL3RSmgVzNgmXRvFe1IBzyVOJS2RVhdUemlHSoMjlPEtk983YSBJFrQfFN9N/QD22dDoLRQpEykYGJ5H461h/CpyKI51djj8pH3CkrwGgbgvQ6iwJBU2qVCoA4+a+SlvqE/wSczMLoaEcpkEK/g/v9vslDpHXw1Di5zzyXBB2YxlNgMxHf+6O1/emnYOUCoVYKl+EwbeE8lHKWpAD+HJLa5ukC/CGjNO5y4IJMOKaFEFn8iX+dewRlY66C8sITETMZY3AHIaB+rBwitDP/dkV6t5/HMAmBkYUR30RpfEZGqrgLta6BTzHXLdCmnpnbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdzUrkikAzcMuksJhB6dVo7TjnQWtSwJAqIJPZDQq+A=;
 b=L0/2PK0DXVRS0Nrlp3UN8FAHwQX6JRd205WC/OiOM9eGlTcCtnzhLfPvUKP058i78fgHrJicZwGmxrD/6GyXW+B4XnbhiVaiKhOHNE9t7w9tP1P31TRRAW0B/5s1HpD2ySDBPlTN3PGCoa8lWpOJhydN1VeNNpdY//yTDOCXBxvDrQoF1ImagpxV0IpO9iTRtXFiR9pnnmCMsEVRRLrImVDO8RuvtCYItqDw8BnFZm46yomaM2fhHEttleIah55gyPjx6aMe4BX7JQqnVHf87m2kpOspr56VrkirvYDFc+ewEGEFCfnv7niywrP/Gs1gerR9qrcdJx7RoU/c8hviZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH8PR11MB6999.namprd11.prod.outlook.com (2603:10b6:510:221::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 00:55:06 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 00:55:06 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>, "Aaron, Ma" <aaron.ma@canonical.com>
CC: "Sun, Xinpeng" <xinpeng.sun@intel.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd
 ICRS/ISUB length
Thread-Topic: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd
 ICRS/ISUB length
Thread-Index: AQHcBEPvGmnxyvUZDkqA49XZjmAj8LRdYIcAgADeXvA=
Date: Tue, 12 Aug 2025 00:55:06 +0000
Message-ID: <IA1PR11MB6098D37F90780B5D22645FE4F42BA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250803065726.2895470-1-aaron.ma@canonical.com>
 <qosrs9q2-6qrr-46r7-7nnp-s1nr1o265885@xreary.bet>
In-Reply-To: <qosrs9q2-6qrr-46r7-7nnp-s1nr1o265885@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH8PR11MB6999:EE_
x-ms-office365-filtering-correlation-id: 0401ac5e-8336-4b81-30d1-08ddd93ae14c
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?47tiBs84te2LJ8APBE0NSpvgIgH6xt//vGmybKpfty1FgqhrvsG9rolKFlS+?=
 =?us-ascii?Q?KVNONc5njY6FNUnTn7n0zbYfwIfSkNyoGeUtc8atlDbpYKSrhhJCs5uxrhXh?=
 =?us-ascii?Q?kO+A+sNzJViAAEiMefxrGahaRXpXqGUt5inHtjggMWxIF6x24sgjGq27T1OE?=
 =?us-ascii?Q?GxkhrZUMXts8+CCf8YnqUeV3ZT5LyvKwvwVKOYnY4T9WticSFGmznzpWuwCY?=
 =?us-ascii?Q?0VrdNBfBj+uSfK4rW7GLnkz4TzKNvlekiFquY5iTZJo+PYtaZCCWTCTjO4XL?=
 =?us-ascii?Q?tOPruaQB04c+49eDgPnBzHcKWG3eTfnRmOyrlqbLYzYbxCnm/dkDTtWI3KzX?=
 =?us-ascii?Q?9OV1Bgwxz3N4QkCOyCGXG+vvoCOJGv2/c5juYZJo0zdSLw4VLIFLx5PpGg5q?=
 =?us-ascii?Q?XRVQusRF5tTp3Yx+t4mE7BKMRueWIWnmD95noboNPfvk+CW4ze5G+CRhX+1t?=
 =?us-ascii?Q?fde2LnAcyt3WymED1QQiQCvPfZKs5pOX+Ai8t1ww56nl58jjPosmVRVW/XoZ?=
 =?us-ascii?Q?RJY1/vW9kIDkxwOrV7XvMO9Nd16V4MIR6brhVD7/9cMHCkfGxVstnsYBLrX8?=
 =?us-ascii?Q?ga82Snr0JLldUdeofkyHAknm9iivvXkvlOoEIhnvJkPEIhlua/7G9nEDk/9z?=
 =?us-ascii?Q?C6PyIbfx2FTQwZSyMG98nw5NLDWYYhsGmKfte7WlUDKkk0l5V+myYwu2ELYp?=
 =?us-ascii?Q?reu9oI9FuG1zGafbSABpBD76c2qOOUcXeIjDIKD+h8jnLFKPEesZboPqTn3h?=
 =?us-ascii?Q?2UUK1SxifyR2V6/AYqTiKhPwbh8iyQ4yO0vkBsBDwaWeYeeGH0chKZIFO7EW?=
 =?us-ascii?Q?cGWRYH5UpTihjo+zvrSQ1oqNKhbfsyRGU1TBzwuNA1g3gD4SHmu1gl3AumW+?=
 =?us-ascii?Q?faJvr8cfxjKH4ryT1sT8i8BL/eM/+UZWCk7MDKYMUurDSyglBjrs4eN15mtF?=
 =?us-ascii?Q?RYrwBqKcjqsGLXBqk2wXlyinEF4g1q12FD5t8Xx58jyuoyMgsa63nJsiykfr?=
 =?us-ascii?Q?EU4xvUG7Y5BEYuXnwvGV6r6WAxyWttiPkGDssiApVKFltDUUz/LYil+3Ux2T?=
 =?us-ascii?Q?EG3iz418ZQlS8YDCvH03BD8mXoIfpVadzML9MM0b83M7VbiUNpLazBsANlAc?=
 =?us-ascii?Q?KVVtS22P8azLROymd3MAwnE8Kltt0NH4HFse1dk/Cp7PdEFXaTAweOF2njcD?=
 =?us-ascii?Q?GcMHh3Kiv4AhJzXZlfCleoi4vfelvL7Wf5JEaHxD1NgCpccWY7Tt+vbFEvAu?=
 =?us-ascii?Q?glPfGvEEVddSvjFxEhNFvhK3cf2JpjdRdOK18HGI1+XSaFcedeIXic/uk4Ds?=
 =?us-ascii?Q?ut1s/Hvfbrnpy694C5guHES3dM3GuiSBlyt88IU87wv6yu7UyPCt1jypDBev?=
 =?us-ascii?Q?UXxJdIvCePYEZmZk+S0fh3Ei2f8nC0vRh3ztbrswDmUFEBkJfrCgcabiI63P?=
 =?us-ascii?Q?5I4VPNy7IOhB4t9RoTHxzj53lGb/l/p4o/yTRM3zkkV41jQ0i6lnIw/r52gy?=
 =?us-ascii?Q?0QBTcjZW8moJKCY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JJaOPr1ULHJwm7wd98c0DpYeynNu1ZYf8uqdLc3SROJVi3z5DPq6ga7rdYUf?=
 =?us-ascii?Q?AeGLmyQ++juSNqxt7nvHAIcWWaKPF1PmwqS6/zRcGrQ/QQgm1vqzMcaRTkgC?=
 =?us-ascii?Q?h3SRoyamY82yOuP3M1OiSWCY0r513408Bi8ZYwwZgTTLMj002l6UxQ/9r8Nr?=
 =?us-ascii?Q?+Nk/aqh3AT2WAzU699JJxlgpmmYC1ecQN1FJpgmE+IZIlJyK/X4FGEIfzxHA?=
 =?us-ascii?Q?9YM9LKyQVoR9fI6XlqwynXXuee5pypjKJ7TKqJmkMSPJc6/vS7RYifV//lKf?=
 =?us-ascii?Q?j6vbEeNEy/k8IOzamWl98/xmnusQjCd4AS1AuIpZBNlh3r9gTX8UZ3ujp6lT?=
 =?us-ascii?Q?FLaZVtCtS6ScxhDOOCd6L1MMZ60upSVHGORkTN5gJ3wtqV1NXEH7Vbxc/SRn?=
 =?us-ascii?Q?JrwaVd2l1166hPNRZO5hlF5fOhgOZUgnOCBrc899HYxu0TeymC9HBApvFPMo?=
 =?us-ascii?Q?Sg67FtXx6WxHkWXfOWLQG7AfMD1SdggONkM6yaYFKjFl/3VJJx2XQH8/VWx8?=
 =?us-ascii?Q?a16pVkvaFJebnHqunF4LPhN99q/xUyOt8ntawaiEk7jyNRNh7EN+lCFXOxmd?=
 =?us-ascii?Q?I5R1sFKccy1vPyJY6CV/S4/Giozdoapgt9/ZoeP94Jk6Ek789aIwAtTI1+9Q?=
 =?us-ascii?Q?23UXeyw0tKQsZGTBYMoPqHiOiuG1+ERa+1cpjm7ij1kVR0OI5axXa+w8aKDV?=
 =?us-ascii?Q?nEiVxka6ZXVV1XizEzCnxOj5H9nQ5DCU9eGHm+mqxm4lI+OYuvBoWSo6BTF5?=
 =?us-ascii?Q?a2fqSMXeLxb9k7obFsEJYoKu1PQ0OCS7RqIoQvwhgq9Mc+1bkRAHD+PhxQEL?=
 =?us-ascii?Q?xCaYuh+4eVWeCWXT/yTVDvGpFd+w48cZZLWCT+NVYrFE8L4bUQUEC2Y+qESw?=
 =?us-ascii?Q?NqT8aDzL//EkNkjAAULOCchHXP3ZL/fNE1dpJWZjQK0q3WzFDA1LgzwoE3BB?=
 =?us-ascii?Q?4Fx8Bk9C5ipd5y8aU8yLn8rg28EIufqHGqrsGg0Bg/W9dcBGmea6w22TFiKc?=
 =?us-ascii?Q?p5OVGwaMAAf3IwOPtHjoXDAGXvNiUp41uxB5kMi7R8PukMgzRIZWlxtYWZeH?=
 =?us-ascii?Q?hSG/tHF7cJh7QINHZcdR18Lmb2GDSLvXVZrZ+JFnmrqrxjEl71l7lr0bSQzm?=
 =?us-ascii?Q?Vd/uxYrUqLsJ/wMyXrqVcCFDG+FH/0+pY7oe3IStO9zWabzK9poxlxOh4jvF?=
 =?us-ascii?Q?On+v4y5j+QFd4vtkfuLBLjlq56p5zbSfxhkmKZLYR8mST7oJSVh8O3u8oXvn?=
 =?us-ascii?Q?TdLWIOG3tgvDwW4cXJBWUKiFtmTJhipz8uh7hYxpGvUSVSm92Ww2iorUy3yR?=
 =?us-ascii?Q?hFlPdLbuIx3V0cuor9fgx8/6TfPg5Dvfv/5gtZNt1aju7W24+vTdWu8rOk7+?=
 =?us-ascii?Q?AYDT+1+hPuEyK/ymFwWmC7zkYCcdV0C6o5UECYnd2JRfKYAOaEEyrp2L0Q4h?=
 =?us-ascii?Q?5GK1eZjdEikJrfMVC+Lfr6kdr6GfAc9myh3WPwRRUoxNn4Vk1j0FMR8nYS86?=
 =?us-ascii?Q?/ld3zbhULsqydtEHxI2sC3VzDquQUCjbFxvTCm8e+lsiqtezopgBcw+wiSzT?=
 =?us-ascii?Q?t/iOjW7HrbjNreyvuzw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0401ac5e-8336-4b81-30d1-08ddd93ae14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 00:55:06.7554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vZImqxxKpxdOSNsGjnh4ceOoyrgOELC3e+eF1aC1nYSO1BAvGtkMh9Es0BaVnP49lzjaQyLJcw3qlm29eZTGuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6999
X-OriginatorOrg: intel.com

Thanks!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Monday, August 11, 2025 7:39 PM
> To: Aaron, Ma <aaron.ma@canonical.com>
> Cc: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> bentiss@kernel.org; linux-input@vger.kernel.org; linux-kernel@vger.kernel=
.org
> Subject: Re: [PATCH 1/2] HID: intel-thc-hid: intel-quicki2c: Fix ACPI dsd=
 ICRS/ISUB
> length
>=20
> Both patches now applied to hid.git#for-6.17/upstream-fixes, thanks.
>=20
> --
> Jiri Kosina
> SUSE Labs


