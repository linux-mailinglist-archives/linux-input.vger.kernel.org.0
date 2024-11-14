Return-Path: <linux-input+bounces-8098-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C45D9C82E1
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 07:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B3D8284A2B
	for <lists+linux-input@lfdr.de>; Thu, 14 Nov 2024 06:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46CD71CCEF0;
	Thu, 14 Nov 2024 05:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A5PrbhAe"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2746115C14B;
	Thu, 14 Nov 2024 05:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563994; cv=fail; b=rPp/BDaXpymJhYwZERKcpqCsTc+srtn9GqCFoRP57C479NFRcmLI+zb/STqQvIjaVtxxzQpVWSveFT/85srybytu09MRUQwrxkmnuiKoarDTWiPcjEZvNy2M1tKUKxXMA1zLaBotm77Iw7+6dPu0PfMjVqx5jItmgrpQ9wgKWYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563994; c=relaxed/simple;
	bh=wHnmNdJbD+mzbKa8EgUGKCMAzsLk1iNKjx3QbEKtYoY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r0xkUEDZJMnnqJT15cXapNGJ9dU0kQmXidz15j3ham6H9nSDSg2P/ZJySVU64Y8ZCsss/2JKfxQezd30zEjtxFe/tXup7AiLRdtKmq4AC5LUMP4YkgQ2pxivBesHVfBQJc6UjgLTCo8lw930KLWwSS9pIajVLtXwpPmN3CgMLks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A5PrbhAe; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731563993; x=1763099993;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wHnmNdJbD+mzbKa8EgUGKCMAzsLk1iNKjx3QbEKtYoY=;
  b=A5PrbhAeUwA6rd4LxOPH3otLmDiDlsJCPpGqnWSI3oa8fsHyZDRaSCxy
   49NorYZMRigBHNp4XrlezuITL/q9PXLnQdGs+uXvsb+B/NKl0eXxyEhFj
   9kAJASKsqh91BbEWs8tJSU+gRs/YMruFlrBKNEtkqpUyNtdGJLNhvADCu
   zmPfWM0TV4REFoBFc9Ol5dAEZ9ya2VTs29bYG7jMiGJVSs0nMdz2sa8P8
   RPgySHLvEC8VSxLPPz2MDHLzZwkX239db1/OuvAPxyLscL4eAgPCZWHa7
   Q+ljeLWtw/cwk69GK7oQ174GiQBjYPApvg9XajeRN94TYbFSDMEMw/8hz
   g==;
X-CSE-ConnectionGUID: 0iE4ZOmkQfCkkdwodts77A==
X-CSE-MsgGUID: MNiWaAJ0RMSDI+wEmXJolw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="35281455"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="35281455"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 21:59:52 -0800
X-CSE-ConnectionGUID: mzM6x7fcTpqq9GoYWaNV/g==
X-CSE-MsgGUID: 4y1k6AV3R2eCF90jN+iXGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; 
   d="scan'208";a="87849654"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Nov 2024 21:59:51 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 13 Nov 2024 21:59:50 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 13 Nov 2024 21:59:50 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.43) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 13 Nov 2024 21:59:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nW/FhNTLhUMHzBU+mx9LdWF969APeiWVj29bYJNt+99CUQmH9kL6S7nA6FEpu1PhlZtkzUr/5HN39+bcLIRnZmb4GsiepDfkyM/st5n+cMTViGCDOZYzga01QuUk74o16/fSCpw3QL4kqJILEHgSzuQ9XOyTyTauGRQMZ84Ia3/ZD6xN/cDnmrvRKrZC2gWhNZCmMN7fXO0fBIscrfvIjRAXIisDyWgB7UXvy3l/RqcGTEBGAas8/k/3xmSyeocEUxLVjg9X+6IQWOOf0KaSDt+WhFvFkzCjy2ke8pCs90lXZ6cDFXfqpEEvq16cmYGk7fz/zrPFpGojZKTgsVJk7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHnmNdJbD+mzbKa8EgUGKCMAzsLk1iNKjx3QbEKtYoY=;
 b=n4YhMuej78cs18sd5/efDrU0gc0+agN/QjYKrhWXCwokrDZiPwMgc8WMDa4fTZ0URsvjW4UXQrKyZrNsizNGHVyjRFMSVQ1yRCFmGvV24aj9YCMM5MAKxuvK4YPxcCqSJ5v3y/D2+w1ZrFFgfxLkfIh3WYW5RjkM3mkd2JJkFzEaLf93l/MABlLHkKoQ2ynrbGERLnUw3GismCD825hMs/WGlgI22DsyoB57w5ljN0l8R2DjWF46FwS9/9hUADBNjchQHMaMrkdN8/9GRx0FQnlQmv9n/4kYUYA0eQcYtCeCGpIinMPLYwNesq7zrLqc8KkIQEw3sxkD0ChACcRIqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB7718.namprd11.prod.outlook.com (2603:10b6:510:2b6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 05:59:47 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%5]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 05:59:47 +0000
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
Subject: RE: [PATCH v2 11/22] HID: intel-thc-hid: intel-quickspi: Add THC
 QuickSPI driver skeleton
Thread-Topic: [PATCH v2 11/22] HID: intel-thc-hid: intel-quickspi: Add THC
 QuickSPI driver skeleton
Thread-Index: AQHbNlb3cYXSwCLHDEmIwEe4qoLBJrK2Q7uAgAAENgA=
Date: Thu, 14 Nov 2024 05:59:47 +0000
Message-ID: <IA1PR11MB6098A9AF39625E60C2569339F45B2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-12-even.xu@intel.com>
 <5bf8c9d7-fc12-4463-bc13-5af567a92065@infradead.org>
In-Reply-To: <5bf8c9d7-fc12-4463-bc13-5af567a92065@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB7718:EE_
x-ms-office365-filtering-correlation-id: 24183504-0193-461e-3159-08dd04718b85
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RnQxM3FvTXpRdnZSMjFOSjhZRktESUxQTDFNL1BoY241eDFBRkdsSHd0M0Fk?=
 =?utf-8?B?bDhGWlpsOXRjOURSNW85MWtlMDFQd2NRM2o5OWFPSXIxMlJwNWt1dzZpVEFW?=
 =?utf-8?B?UDByRDgvT2Z5UDZkR2ZPWlJMeisyK24xd2VsdjQxa1dJNFJkMExFWW9KQ29B?=
 =?utf-8?B?clFycG5xYzFYQmZMdFNwTkd5REdvbVcrTVE0OFRWWDV5bTBwSUVtckhkbUpL?=
 =?utf-8?B?NUNKNzZRb1U2Z2RaUFJHWDcySVp0OTN5azZoYU5BakVxTExZT2ZzR0dhVXhB?=
 =?utf-8?B?Y0N6LzRQRHE3U2E3ektXL1JIUGJoTTZZa3EwZytjQzkxTmlaekMrZ2FNVjZK?=
 =?utf-8?B?M3IyMEZtaVdCbjE3Y29pdENReC9TRkZOZ1plZUNXa0hJTVB0amhNNlZ3bmg4?=
 =?utf-8?B?VUtaVDhZc3Y1dHphNDBUZnl3bXYzRE1NQW5BdzloeVdTTmtMMGFwK2RMcHFO?=
 =?utf-8?B?Z08vYnMzenpFK3piMkc0b2NORHVMb0xEbE9MRGVDelRBendHb2k5ZWRoa0tQ?=
 =?utf-8?B?SXVzQVpYMnNmN1lZMTBOdTJVbnRETmxqZE1DRVJWS1hhanBTUzZJUTZ5b05W?=
 =?utf-8?B?NHZMQTB3WHQrRnBsaHNCTkNCZUxkdmJveVl6VUV2S09iVm1rS0pxazhRemg5?=
 =?utf-8?B?VXBUQ1QwMWVmV0pxNmI3QzM4UW5FQmpEMVE2MzJTZmVPRnVtYmt1ckVYM0Fz?=
 =?utf-8?B?WGNKaWxiT2ZDK1o5alZKNmVCY0xMZWF4c0FMUmgxOXhvajNIUEp3b0RiSU95?=
 =?utf-8?B?RjJLZVdiL0dFOHNoL0prM2o3dFMxb1hjQXRyRlR5N3E0YkI1VnhPbUtuelkx?=
 =?utf-8?B?blVCZzBHQVZqNTJMODhiNks1SHk1eXc1aVNVSlRMU3BCR0NoelBvdDU1OFFM?=
 =?utf-8?B?MFpHRW1sdzZ5czBld3FmRCt4MEZ1MWd1NlZmS2xCWlpmbkxqVHBIWWF0NklO?=
 =?utf-8?B?cUdSY3U0Y3dJMjFBSWxCanErZlcybWtLMy9aRXp1VVFuQURWb1BId1dReklj?=
 =?utf-8?B?bkZFNFNyV2VvZ2ZLbnZMSUtDNkpyK3BlZG9hYWQ1azRvYkUxamdEVW1qMlBu?=
 =?utf-8?B?cGFDYjRTNFpVZ1ozU3hJZ1BFT2pMOXhWaE81dnNsVXlrdzI3OGx6dFdyYXFE?=
 =?utf-8?B?MmlldHlCSFY4Z1pIbnlhS01jYnpFMkRpNGJrc3Q0cGNseEc3S21NRjkwdU5a?=
 =?utf-8?B?VGZrd1RWWG1MdGNWVUVqYnpTL1g5ak1NYzJmVDJkT1NteS9LKzlJelBYRFV2?=
 =?utf-8?B?QTJYdHR1SnEvQTZiSGpTcWcyeVN6cWFPMTlVL0JTQVBKbkRkcThvSE9LSzBL?=
 =?utf-8?B?UW9vRm9teXdvcVJNWW9tRlhWS3RpVHBHNzRuc2o3amNENGx1Rm83Z2Y3ZDda?=
 =?utf-8?B?aTNRcGFSWW56V2cvNUxpbkVhR1pMWVRpNzBUczBFTHFXcXBnR05GMHBveHFn?=
 =?utf-8?B?VEJmUGRQWGlqSmFqMFhmQi8wWGhXeDUza2FjSlB5TXdxNnA5dUJZZE1ERkFF?=
 =?utf-8?B?REhuNWk1TXg4VHlBcjZiVC9PVHpud2hqSEVaam8xcTg3TFhqT1o1czFSS1R0?=
 =?utf-8?B?d3RSb3d2dFZJUkRIS0I3VEJheDRqUkluWkRubkdHT21zeFEwN1ZrOHJZU2pD?=
 =?utf-8?B?a2VQM0pGbTJkQU1HVUdVOHpPUzRGekVMQmJ6c2lwNnVSTU5FSlBCVXkxTmlk?=
 =?utf-8?B?Q3FmM1JzMllCUVNGWDUxZ0N1bGk0RTRFT0JER1dxbm9peCtyZ0oxVFpoK2x2?=
 =?utf-8?B?TUZZZVpEdnlJMGh3RGhRTFgxZm8vM1lPKytVS3RZd3gzUElJb3VoZldPNFZN?=
 =?utf-8?Q?MRuWfC8pxBnGpRP1dLbBnjKuO/fAmh+wQ/Wqk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVJsREZxdUkvWGErcm1OeEF6c2dCcEJxS0ZKYzVIMzNvMmVzUHJHdUFuUUlG?=
 =?utf-8?B?VThRZ2UvSERKSDJvMmZDQ21hTTY1UTl4RkRqTWdQVk1KMlpBWms3ZVNzMXhx?=
 =?utf-8?B?WFJlOVhEWXNxZHVPbHZ1WmpvTzhncW9ENjhjRmJabnB6b2cwR3BrYzBtb2Zq?=
 =?utf-8?B?YjNzNlk0S3p6NVRONU5TblNFR2xDbXVDSGZVYnpKQkpmcEY0SFY4SjdvYnox?=
 =?utf-8?B?ajV5enZBb1VWMEViZzdiWUZDT1Jxd25nMmpBYUw1M1V4OTVIYmEzNXI2VE00?=
 =?utf-8?B?Yjh6VjJINllKN1dZVlcrcUN0NkRIbUhBbWl1dDlydEFuSXg1SExFQ2pScklq?=
 =?utf-8?B?VU9VU29FUEFWTVFnS3MvTlBTbkMyVjl3djBwbGJvbk9GZjRlZDFFbEVxL3RW?=
 =?utf-8?B?bGFycUtHODBKTjdaZ3FMTXFkenBaNkw0RTl2b0tSWGtRVUxEelJERGJ3RzhD?=
 =?utf-8?B?M2p4NjdlVEdFUndleGZDVFdNVDZJVkE1Z0MyYXVYbllyYXFnSjhsZkdrQWdh?=
 =?utf-8?B?SEtaVjZPM1lNUkZoN2RYS1h6S0p6dE9wSVJZdjkxUkdvQmlFMndSM2VUSklh?=
 =?utf-8?B?ekxTckhjZTdZSktnVVFOL05yTE5DaUNPZUlPNHZLbDZYdkE1dUNFZmpDbW1l?=
 =?utf-8?B?akhSSFR3ZVY4Z3ZlT1hoV0NDOGVBSmlzcGh6c09Ra01maUE2enE4dnRLc21E?=
 =?utf-8?B?YnNoUWNYMUtUeiszOXZrTjZvK1Z0TVhTaUtabGlnMTVsekJBcE5YLzhUaTVX?=
 =?utf-8?B?VlRuVzZHNTJjZjlHOEl3ZnlQRlByWS94Mk5LYk4vejYxYU9Qd1lsbzNPZUVV?=
 =?utf-8?B?TU14WHBKcThtcFYxdHM4ZDAxaGpmeFVmajZucm5Ga1FnQzNUcVhLazM5QmZX?=
 =?utf-8?B?RVRCTU9KUDBjZjdXT0hNeHc0K2hXN0V4d05OQzRuRnhYUnYzdk95NEVHUzlS?=
 =?utf-8?B?T3k0VEd1RGtPeW5YUEo0MHF1SitKcEs3MjAxTE1YTFNpaUw2Sm1LanBuV0Fo?=
 =?utf-8?B?R2xsOHZZZ0xaU2ZUdjJIZlpLb3ZtejBuYkh0NCtMUUhmaUVSVVZBUVVyUVhk?=
 =?utf-8?B?aWhtSVYvZzFxYkdlQzJhMk9ucjR1alFTMDFaVG9DT0srb09oRVNqUDN2NEVv?=
 =?utf-8?B?UWFvWDEydEJiMHZ4TDNkTHcvcHMwYXFVRUhreXloUUU4R1JVeG1xQVdLZnNM?=
 =?utf-8?B?T21sWGJoblpXUWVIN25SV2ZQWjI1RkpyUjVRUEo0ZE0rWmV3LzkzcWxvb1hn?=
 =?utf-8?B?d0ZjczRwRm1MQ2FodG8xekxDZkcyK3BWZzVKVFY2UVlza3pQa1M4WkdGbWRu?=
 =?utf-8?B?L0tMb3Y0SDEvYlpKZmJyM09mOS9tek1SNkxhNFByQUQvM0FDbXdjREdMRStE?=
 =?utf-8?B?a3dhUlJqS09SSFR4ODJvU3lIVnVRQk5nQzJ2UUswYzJCMWthbjJWV2VRT3A2?=
 =?utf-8?B?c1Y5dHdvOEtRdFpyOTBlR21CSDV2LzhsUDdGVmE0dmd2ZUttV2ZQQUhxeVJF?=
 =?utf-8?B?cXBySWkrNk96SW15OE1lVDE0cmpNTGNJOU1PTmVEZzZ1NFhrc2V2a0VxQTJP?=
 =?utf-8?B?NGF1blVPckxVRU8ySkNvNjdJRFgzM2dCNXA3TkFCNk9UbC95VTB0VFI5eXRL?=
 =?utf-8?B?YUZjdmtIZjdDVkc2OWhpbkQvajhDRDFXckVDYW1UMHRsN3hXWURCd2JNR1Q2?=
 =?utf-8?B?YTA2TzlrS2hRcyszckp6UmF6R2JvTmpuTC9mTFlaMTI3R2dMRE8zeEtNQmR3?=
 =?utf-8?B?VnRnWExQYTRaTkRvWE5GOXJUQk04N1d5S3A5OUwyWUhlZHBKRFFoQ0NNSzhZ?=
 =?utf-8?B?NUkwVnkyZ2dyWWJxY2xDZVdUd3lGWlF0ZldNY0tsWmpkSGc0UnZsTUVxWFRI?=
 =?utf-8?B?dE1zYjVHQzZsZmZCTkk2d0lGVkFEaDRRTEpRdEN2NkMyWi9HNGVqdzJSUjdI?=
 =?utf-8?B?eWFTN1BJeVVEaXJSQTVXdWJCQlhqTGV2NjBhVWhMKzA4dWgzL01iUUpXUjJH?=
 =?utf-8?B?YStHMzR6Y2orSk16blF0MnFpeFZkR0FFQnZpaVNYOGtnOXRLTFQ5UTNaZURK?=
 =?utf-8?B?dUxqVTFGVnNSUndmUTliMWdqbzVaZ2RWTE1PTHluZEVOU3dCS2dHZnRjNWFn?=
 =?utf-8?Q?vRAA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24183504-0193-461e-3159-08dd04718b85
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2024 05:59:47.5026
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0BkS4FZIR7xE3N0WoJLtb3w5C7B1LsnNFi5D6+OZ2AGEsadW1+Vonb/uWzu/n2kteFiBWl9QJOEZRrQF2OcUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7718
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuZHkgRHVubGFwIDxy
ZHVubGFwQGluZnJhZGVhZC5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBOb3ZlbWJlciAxNCwgMjAy
NCAxOjQ0IFBNDQo+IFRvOiBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBqaWtvc0BrZXJu
ZWwub3JnOyBiZW50aXNzQGtlcm5lbC5vcmc7DQo+IGNvcmJldEBsd24ubmV0OyBiYWdhc2RvdG1l
QGdtYWlsLmNvbTsgQWFyb24sIE1hDQo+IDxhYXJvbi5tYUBjYW5vbmljYWwuY29tPg0KPiBDYzog
bGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC0NCj4gZG9jQHZnZXIua2VybmVsLm9yZzsgU3VuLCBYaW5wZW5nIDx4aW5wZW5nLnN1
bkBpbnRlbC5jb20+OyBaaGFuZywgUnVpMQ0KPiA8cnVpMS56aGFuZ0BpbnRlbC5jb20+OyBTcmlu
aXZhcyBQYW5kcnV2YWRhDQo+IDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxMS8yMl0gSElEOiBpbnRlbC10aGMtaGlkOiBpbnRl
bC1xdWlja3NwaTogQWRkIFRIQyBRdWlja1NQSQ0KPiBkcml2ZXIgc2tlbGV0b24NCj4gDQo+IA0K
PiANCj4gT24gMTEvMTMvMjQgOTozNCBQTSwgRXZlbiBYdSB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmlnIGIvZHJpdmVycy9oaWQvaW50ZWwt
dGhjLWhpZC9LY29uZmlnDQo+ID4gaW5kZXggZTdlODIwMTI4N2Y4Li4wZDBhMzg3N2VlYjAgMTAw
NjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmlnDQo+ID4gKysr
IGIvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9LY29uZmlnDQo+ID4gQEAgLTE3LDQgKzE3LDE1
IEBAIGNvbmZpZyBJTlRFTF9USENfSElEDQo+ID4NCj4gPiAgCSAgU2F5IFkvTSBoZXJlIGlmIHlv
dSB3YW50IHRvIHN1cHBvcnQgSW50ZWwgVEhDLiBJZiB1bnN1cmUsIHNheSBOLg0KPiA+DQo+ID4g
K2NvbmZpZyBJTlRFTF9RVUlDS1NQSQ0KPiA+ICsJdHJpc3RhdGUgIkludGVsIFF1aWNrU1BJIGRy
aXZlciBiYXNlZCBvbiBJbnRlbCBUb3VjaCBIb3N0IENvbnRyb2xsZXIiDQo+ID4gKwlkZXBlbmRz
IG9uIElOVEVMX1RIQ19ISUQNCj4gPiArCWhlbHANCj4gPiArCSAgSW50ZWwgUXVpY2tTUEksIGJh
c2Ugb24gVG91Y2ggSG9zdCBDb250cm9sbGVyIChUSEMpLCBpbXBsZW1lbnRzDQo+IA0KPiAJICAg
ICAgICAgICAgICAgICAgYmFzZWQgb24NCg0KV2lsbCBmaXggaXQuDQo+IA0KPiA+ICsJICBISURT
UEkgKEhJRCBvdmVyIFNQSSkgcHJvdG9jb2wuIEl0IGNvbmZpZ3VyZXMgVEhDIHRvIHdvcmsgYXQg
U1BJDQo+ID4gKwkgIG1vZGUsIGFuZCBjb250cm9scyBUSEMgSFcgc2VxdWVuY2VyIHRvIGFjY2Vs
ZXJhdGUgSElEU1BJIHRyYW5zY2F0aW9uDQo+IA0KPiAJICAgICAgICAgICAgICAgICAgICAgICAg
IGhhcmR3YXJlICAgICAgICAgICAgICAgICAgICAgICAgICB0cmFuc2FjdGlvbg0KDQpXaWxsIGZp
eCBpdC4NCj4gDQo+ID4gKwkgIGZsb3cuDQo+ID4gKw0KPiA+ICsJICBTYXkgWS9NIGhlcmUgaWYg
eW91IHdhbnQgdG8gc3VwcG9ydCBJbnRlbCBRdWlja1NQSS4gSWYgdW5zdXJlLCBzYXkgTi4NCj4g
PiArDQo+ID4gIGVuZG1lbnUNCj4gDQo+IC0tDQo+IH5SYW5keQ0KDQpUaGFua3MhDQoNCkJlc3Qg
UmVnYXJkcywNCkV2ZW4gWHUNCg0K

