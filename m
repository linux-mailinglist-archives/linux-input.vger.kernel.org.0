Return-Path: <linux-input+bounces-16629-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE9CCE231
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 02:26:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C659730257FF
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 01:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E913222560;
	Fri, 19 Dec 2025 01:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MerofmFs"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A119AD5C;
	Fri, 19 Dec 2025 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766107603; cv=fail; b=YpC5OfaFJhPh3P4ZSsYfdxgG6nBCb4+Q07maSqRzO4xML3OsGxTQDMaJqJR8IQZsXwT5xm7ufPcjo9iwmMbhkIw0wWw7tYb3+KZFZ/CyaXD1yArPqqZhfk3G+Nc9RIqFhLBj0bTdeOIcpLTjdFyI1JMZjOEqND6Uk4TmLQc3GTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766107603; c=relaxed/simple;
	bh=Gei3kkVrahaegBlotGsjk7xYChEMeQWY2SFDIQP8Vs4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k+ewQh6wEia+JHlBKgSEjAO6WTekdGCSnFGxJaQxI0lZFVwIZ6jrTJxov+8kaQC+nHAAHanA4AmU+DG83Opp5iUTrw9D6SdM1oTpQJnP9YANC1kSHM/gRAxsf7oNXxmKStUyjdg5mGcHAjnz9xHreVxIwiAbnCXlFqqo7oG/RGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MerofmFs; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766107602; x=1797643602;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Gei3kkVrahaegBlotGsjk7xYChEMeQWY2SFDIQP8Vs4=;
  b=MerofmFsak7A+qDPvWfaJbWULpxYyx1ERKukuojDcHbmiz1SkAzZguZR
   8YK/xpOBA0e3w9sE+UMhI6eYEOH1RVKvYXxNXoxOUi0s2jgUQZbPspbv4
   9lPR6AmWkdkXzfTg78dzVQrXyCLqBdF2K+sPv0nB8eBw85+nRtKjPdgZR
   GCvVH6C2mtE3IjguEbYpXOGeJ3r3yyR69kyC5cSRDQmO0NizlMWOU5EpT
   vcPo5MWJLsLVIWHJ/ZJyMk90BfXjjdDMkHzp7gfXJm7YeNxrybwGA1AHB
   0pQlK2w1ZmEYZz5cTwy+8ALfYtUWLrw4HsOBprzy5BWhlzIrFKxzAcnMJ
   A==;
X-CSE-ConnectionGUID: +Q4FMgxmRiGyKGAebfxtow==
X-CSE-MsgGUID: /8tr3GWgS5mh5WM/HWM51Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67947926"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="67947926"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:26:41 -0800
X-CSE-ConnectionGUID: UNVEywdGQFirBhFHuSOzzA==
X-CSE-MsgGUID: PC57oEfURQSwEMuFXoMTLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="202910304"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 17:26:40 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 17:26:39 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 18 Dec 2025 17:26:39 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 18 Dec 2025 17:26:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PHYwMFc3zxLCtr3WT+T8B9x6/SXbY42VNqbWJU4Cbis2DCROBSNzU6R592fkXB5H8jGcN2h2Ypl7Pp33ScuP6YT2Eyw3KAgUzyDVrTV3i3GdHjK2qAqs88ngEC7DYbXw042G5ZAIvQqZibLRxzsUMlf56Z6ACk2dX66mvbj/7FzRJUnfPtfQJGVgMqCbpQtgh+Mqsf6VonF0zjbCoX2s3rShfVwBvcqFpWJCmzoTpeg5p9IwTHWqVlFvbM9JnnLyu8rXl8t9IEyrGOQGJO7Th7azUcE40Wm4wM/M6Z+yrMNg33ohRWoNIRs2bZ8kJMa1+g1H0ktXdqRHNEd6ONONoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gei3kkVrahaegBlotGsjk7xYChEMeQWY2SFDIQP8Vs4=;
 b=PXGWoHIYLYmREyRWIyNeTjfZm04osyYoi1hT+GvXV3lUopqynBE29nboR4VUi1XFXSgRkFtAM6qH0VWoptNYn3Y96SgOtZPk8+LyqjLK1sgaRavUjFeiWIL+Sw14evQ/lZHLiRqpRKsbCTVCE7eR0VjHKIRNxdoaOBv1pbqepERdikbDZMqvYEfX0PcpbMrA5P9wS0mkOZbj7wFAsGGJ5SCMA5YCjceRfHsEBK4Na8RgahGx50mALVXzG546Cyt9SIMYkYxM63wnFPyYD0TS+1bPXCsdSm81xgaiVmwW+bXDhLRr3qc2znWw1MAVJdGTr/ZmyQCr8LgFNeFzBsvvxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by SN7PR11MB7707.namprd11.prod.outlook.com (2603:10b6:806:322::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 01:26:31 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 01:26:31 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, Vishnu Sankar
	<vishnuocv@gmail.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "Sankar, Vishnu"
	<vsankar@lenovo.com>, "Xu, Even" <even.xu@intel.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, Richie Roy Jayme <rjayme.jp@gmail.com>
Subject: RE: [PATCH] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based
 firmware matching
Thread-Topic: [PATCH] HID: intel-ish-hid: loader: Add PRODUCT_FAMILY-based
 firmware matching
Thread-Index: AQHccDasK2NodRdlYkaiwJRffZs8OrUoKlyw
Date: Fri, 19 Dec 2025 01:26:30 +0000
Message-ID: <SJ0PR11MB5613BDF3C10AE8093404639A93A9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20251218140003.636901-1-vishnuocv@gmail.com>
 <950d627dc280af94a1073da7938a6f2a09e31e34.camel@linux.intel.com>
In-Reply-To: <950d627dc280af94a1073da7938a6f2a09e31e34.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|SN7PR11MB7707:EE_
x-ms-office365-filtering-correlation-id: 2b9f3d5f-a3d7-446a-5ec5-08de3e9da3af
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MHNGWVlkNE5tYTU4Tnd4Ny95S1UzdjlDQ1hXck1Qb0Z3elF1QXRiU3I3emRI?=
 =?utf-8?B?UWVwNG0vR1JxRG5hVW01V2wySUdDUGRVSTZFN3lKT0p1U1ZmemtQY2htVUI0?=
 =?utf-8?B?b1NIK0gwTWM0RElaZlh0WWZ1Z2hWQ2k2dVRDYnIvZjEzNXRzS3REcFF4SGo1?=
 =?utf-8?B?KzRtOWR3b0pGeVJyK2pqNllPN3JvS1FyVzRFMWFpbU1nL0VDbmZXcHBCMm9z?=
 =?utf-8?B?NVZHZjA2cCtnbUlLZU1valMyMXNMaHpmdzZyOUV2SG1YZnBOL1BZS1dvUGRV?=
 =?utf-8?B?RkQ1cWh1Y1lUTWlubFB3b3ozMGNLbko1azJVMit1d1Q0cko4OTY2UnFlWWtG?=
 =?utf-8?B?NHA0dUF6cStudStCc3UzM3d4ZjJ5MkpaYUVqRlcrV1JYdytsSksrUDlEWk1W?=
 =?utf-8?B?ZzJaUjNOZ3VJVzZ1ejVOcTFkMElkRkJNcC9KZUtmUWNiNHd2VENTMGpwREhD?=
 =?utf-8?B?WmEwYXBoUzVkVjBYNXJDNVNFT0VSUHVyR3VCcGNtZ0ViZkRYZEo0SDdLbGsr?=
 =?utf-8?B?ckZWYjVCRE5sazR1ZzljS2NDdThjcDd2OVZna0hLS3VOdFIrOTN5WktZTHVC?=
 =?utf-8?B?eTNTUG43V1NKb2R6M2djRjFBcnVVMk9RdjBYVlFyWnVkTnp0eVh6ZWZyY0JG?=
 =?utf-8?B?cCs4NUlWR0dGdit0ajZ5d3hHNVRST0Y0SUZWQ3dZVWRqVHZEa0ZlUm85QzNQ?=
 =?utf-8?B?SkRwNndJVFc5ZFJ4T2NQUDMyV2RlVFhJbDh1YnNQSGt5bTNRMHlpaWVQZWw0?=
 =?utf-8?B?OU9aV1A1VXZ5VlBvRDFSeFc5N2JXNHY1SHB4TlJtTWpPZ2gzc2RRdm5YL05a?=
 =?utf-8?B?OUNHaDFNd1pyMzNqZVFkTldoVzhidjJYNUk4SnZSRzVCZnZWd1d5dm5sd09h?=
 =?utf-8?B?aE5pcTFrMDVFOVVFMUNlalRrY3VCeUU3VzZFVHVHSUxXSTQ1eUxHNzlrN0NM?=
 =?utf-8?B?cWd0MjF0YkFnYmNma3MzQ0xVa042STlqMERvQTRuZ0xOeUJWbUdTVmRwMUp2?=
 =?utf-8?B?Qys3MitjT05nNzdVVHR2Skh3NyszRzJLMmVSWnMxV3RVNGJObUpkUmdmT3RK?=
 =?utf-8?B?MlRuZjBiWFI5VUMvQzZ2NURuL0RXV1EzSDZzSCt1TC9TWUI1OHh0ZG9UemNZ?=
 =?utf-8?B?OXNkUGNYSXU4RVpGTFFLZy9IVjhsMFprL25oOEE5TGlvOW1FLzQ0eE93UEhG?=
 =?utf-8?B?OWR0Zmt2blQvai9WRHZzckZ4UVZEM1NIbEx0RFhkSVluVmZRNGxwaGttcmt5?=
 =?utf-8?B?Y1laR2RDM2IrLzg3SjViK3FMbFVIcDdYbGFuMUNOdXU0N2ZUQXhHcmQrVjhw?=
 =?utf-8?B?ZmE4bW93VTlkWkg1VkJXVy9BRGs3ekJnNWhGc1ZOUzNER3hCOFNweUdETDZ5?=
 =?utf-8?B?UEkra3RVZDI4Q3BkQ0IzRno2eWlnYlkrdWpSeGtyY0ZYWTRhRTdmQW9tOVc5?=
 =?utf-8?B?TmQ5REhTYi9PeU5uYnJ4VTJWM2hvT2dYRE9oc1N4TUJzT256STNCeU5ERWRS?=
 =?utf-8?B?WitVVnRDZjJjY1p0TURyNjhhbkNpR3pMNlBGdnJjRkJidDlSSWZiUXNtOU5k?=
 =?utf-8?B?d3NUalRwVDdYRkEvYzFJdzFZUXhBdmRhR0tXUFBTemMwa1VERitpcUJmZ0sx?=
 =?utf-8?B?NU1WZzArcW9wWDQxQWNLRDlsamtFTW8rRnNGYjZGS1dtNHN5N0VnaHNnZzZR?=
 =?utf-8?B?WG5uOUg4MVg1UmJidlVKWGo1anZERjRzU2hNU1BSV1MwMzVRV0VlWW9Fbk9H?=
 =?utf-8?B?Z3BIaFBNenA4UWZSNGJoS2dVUUx6T1RMTEVCS29uQVh5L0V1Zm0wYmY3Y1dW?=
 =?utf-8?B?Q00xcXRnSVp1NENoT3U5c01OZUtrUTdWT0FlaHNRbWRPTWMvblFLNEhSQ3E1?=
 =?utf-8?B?WWNOOHVtV2dkNjdvRVFxNzZaSWtIK0dlTzBKQWNnTjdwbWhiK0ZuWlFGL0wv?=
 =?utf-8?B?T3czZ2owRndLZlptSk01Z21RTERkZEFaalRxTjhuMEZxWGJ4dDlpMjYyUlR2?=
 =?utf-8?B?bllJMjFBSFh3SlV3TWJFek40QWJSN3IvWkRVRVhpcXlYdHdPZEY4REg5WUsw?=
 =?utf-8?Q?5ox+PA?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c29vVXhGS1RNU1A2VS9LQnZpTmc4M2JnTXp2eW1rd0ZPMGpiaFhDZko5V2RH?=
 =?utf-8?B?UTNmbU8vNnM5dFdHMzdJbnVJc2xLSW1LdVdEMm0xUWFWRlI4aUhJTFcvblha?=
 =?utf-8?B?M2IrUjVscnNzbVV4aVZBemMyRTRvN203Z3Z6MU9QMldaanBLM2xxSFQ1UXEw?=
 =?utf-8?B?eDhaTzQxZFFmcDh2a2luWHF4d0taOW5uL2p5UUd4aitNRlVGMndUK2VxbE9w?=
 =?utf-8?B?NHd3a1J6dDNFRnB1MTZOODlvV09oU0JqK3pqWWgwS0JVRkpFaHZPS1RHOE43?=
 =?utf-8?B?YmpKVEVkekRrUTlIQkl6OE13VUlFV041RExCa1RsVzBaVjRGNm1HTmkybW5Y?=
 =?utf-8?B?SkN1aWc3UWp4RVJ4UVgxWmhocVhqWHBnV2dJS21Ua2VjbnlzeFdiY2ZnQkF5?=
 =?utf-8?B?OXV6RFBzQWFLa0FOamxpdEdEQnYrYzdOVWVlUmhaVjZ4SGs5QWl5c3ZZbmNT?=
 =?utf-8?B?WlZuTmtuZlpOU29nNHN2elloblpYQ3ZhNWZReWNPODNjYkdveGU0bnRoS3Jr?=
 =?utf-8?B?ZXZSRHVOZ0FEcXpQSzJBeWxhYVRoZ3VYcTg5NUpyNUVUdk5ucWpwSkVwL2dk?=
 =?utf-8?B?U3JyUU9KcEIrYnAxWW9Uc0paWVpiY29NR09qNUJ5S1VlT0hxMnlLcUpYaEhS?=
 =?utf-8?B?dlpiOHU3TmdGemVmc1Q5VWhVZ1dyMnZYdFNHeTBBWTJDcTZWRThmY24zSUVQ?=
 =?utf-8?B?SUJJZmZQVlJualN2TUora1o5MFFkSFkvYnQyM2pnSHRJdkw3Z0JaYVUrV01U?=
 =?utf-8?B?N0daWlEwUGQyMW5JM1BTL3VRZGljeHdXajBaSU41ZTdEUXMySnZOemJ0RWZX?=
 =?utf-8?B?N3RKTGo5c3FWMU0vdXRHTWhLVjk0RVJvaU9KbW9aY0FUMmhZdDUwKzRMakJW?=
 =?utf-8?B?cG4xUFNUVzJXa2tvallKeU1oVWNMZGMzdW56TEtBdk5zaUZlNDlNYk5RWGU1?=
 =?utf-8?B?TnhTc3I0U0tWMkJ1NUM3bXMxcXF1YVdKQitFa2dSbUZIUXVYcmNCVEk1VTBS?=
 =?utf-8?B?Sjg4RGthK0JzejBXcHEwZ255VXNFYm95eTAyV1pHVHQ1MGhvNXVWdGJnaG5w?=
 =?utf-8?B?RFlUVXM3Z3JwMDcyc1RwUDdzVW1SOU5jQ3FXNEo4em1LTnBmN2VFRkFPeTFu?=
 =?utf-8?B?cTZ3UnNva1NsMUs0ZzI0QTRrNXNGVkd4L0xSV3Z1RUpMVVM5aXdtTlp4UUtr?=
 =?utf-8?B?MGQ2ekRxSGZBYXRseitRRW9Gd0VTQVpndFdXS1I1emRHbmJZejEzRnU3SEk0?=
 =?utf-8?B?U0xGSmRac25LWm5uQ0g2eUI5dU1PSnMzWTg1a2p2YkJPdjh6T0t5Q1VJZWdC?=
 =?utf-8?B?eDRnYkVKeHpTelc0dHpWT1ZneUcrUkkyK25LdE00WnpqWHVOL0RvTlFodGZ6?=
 =?utf-8?B?dXNrZ3Y0b2pmR1RncU9iQmg3M1NFbkNGemMxU2hNM055Ri9UMXIzQko2Y3oy?=
 =?utf-8?B?RzdicGFTaTFMRFRocTJuWXlmWFhHeForWjhJb2c2ak1SUFFqU1J3R3NNWitq?=
 =?utf-8?B?WkhaNURUWGMyTXpKZXNoNnQvYm9yNmdYUjVrcUU2NmlMQVNScXYyaW4vaEMr?=
 =?utf-8?B?N2NFZFl6bDVqTXcydFZ4UkV1SWpUd0Q5WVZBOFFjdmdEeWZkM01VYmN0MVg0?=
 =?utf-8?B?ZWV3cTBlNHpHakRMdXcxV1dTd0UzeDByMG5JVnRRTXByRDdTeVJUMVJ2Y0Ni?=
 =?utf-8?B?VWtzVjR3cHVvcW5RUlFtNlRJWExvMjdRdkNtSkNOd25RbjMyNG5zczViTnRK?=
 =?utf-8?B?YnRXTUlKUVVwaStNRDVuRWU4L0RnMTl4MFRsMmxsVnJabDBwSEJXaHpLRm1H?=
 =?utf-8?B?MzMyajJ0N25nVjJ4RlpPOGcrZFc3ZDlLNXdjNmJsUzcycC9mbzFMamxhU0xY?=
 =?utf-8?B?UjIrc2VadVRMR3JaQXgwUm0rak1Da0hxODAwOWpYVmlac1doOEVtUkpKNDY2?=
 =?utf-8?B?SVB4K2pLU3B2aEpEcEJYalpHbldwbGZlS0gvWTVmc0I0ZExYZ3BGSEd5ejlK?=
 =?utf-8?B?K3JMdTE2WnZzLy9CbStmNzRFOWd0QjFsMnB1cnQ3S1pqTkd2M2w0Qy9Gb0dP?=
 =?utf-8?B?T293OUNkYWhaOUp0M0ZlSktHWTg5ck80MlBWUndWVW5qTURlMytGUnp1cDdV?=
 =?utf-8?Q?A9Dj0YZZ1NKtp21RBzhHdTvzO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b9f3d5f-a3d7-446a-5ec5-08de3e9da3af
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2025 01:26:31.0091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SymSCVhlNWPuZSxvr4RBV8eR42EOnzz5rws///BUYpDBtdvzoMM8klO2QdeK68GlSC3AKHyxeCFQdrssfqXnJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7707
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc3Jpbml2YXMgcGFuZHJ1dmFkYSA8
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogVGh1cnNkYXksIERl
Y2VtYmVyIDE4LCAyMDI1IDExOjU1IFBNDQo+VG86IFZpc2hudSBTYW5rYXIgPHZpc2hudW9jdkBn
bWFpbC5jb20+OyBqaWtvc0BrZXJuZWwub3JnOw0KPmJlbnRpc3NAa2VybmVsLm9yZzsgU2Fua2Fy
LCBWaXNobnUgPHZzYW5rYXJAbGVub3ZvLmNvbT47IFpoYW5nLCBMaXh1DQo+PGxpeHUuemhhbmdA
aW50ZWwuY29tPjsgWHUsIEV2ZW4gPGV2ZW4ueHVAaW50ZWwuY29tPg0KPkNjOiBsaW51eC1pbnB1
dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IE1hcmsgUGVh
cnNvbg0KPjxtcGVhcnNvbi1sZW5vdm9Ac3F1ZWJiLmNhPjsgUmljaGllIFJveSBKYXltZSA8cmph
eW1lLmpwQGdtYWlsLmNvbT4NCj5TdWJqZWN0OiBSZTogW1BBVENIXSBISUQ6IGludGVsLWlzaC1o
aWQ6IGxvYWRlcjogQWRkIFBST0RVQ1RfRkFNSUxZLWJhc2VkDQo+ZmlybXdhcmUgbWF0Y2hpbmcN
Cj4NCj4rIExpeHUNCj4rIEV2ZW4NCj4NCj4NCj5PbiBUaHUsIDIwMjUtMTItMTggYXQgMjM6MDAg
KzA5MDAsIFZpc2hudSBTYW5rYXIgd3JvdGU6DQo+PiBBZGQgc3VwcG9ydCBmb3IgZmlybXdhcmUg
ZmlsZW5hbWVzIHRoYXQgaW5jbHVkZSB0aGUgQ1JDMzIgY2hlY2tzdW0gb2YNCj4+IHRoZSBETUkg
cHJvZHVjdF9mYW1pbHkgZmllbGQuIFNldmVyYWwgT0VNcyBzaGlwIElTSCBmaXJtd2FyZSB2YXJp
YW50cw0KPj4gc2hhcmVkIGFjcm9zcyBhIHByb2R1Y3QgZmFtaWx5IHdoaWxlIHByb2R1Y3RfbmFt
ZSBvciBwcm9kdWN0X3NrdSBtYXkNCj4+IGRpZmZlci4NCj4+IFRoaXMNCj4+IGludGVybWVkaWF0
ZSBtYXRjaGluZyBncmFudWxhcml0eSByZWR1Y2VzIGR1cGxpY2F0aW9uIGFuZCBpbXByb3Zlcw0K
Pj4gZmlybXdhcmUgc2VsZWN0aW9uIGZvciB2ZW5kb3ItY3VzdG9taXplZCBwbGF0Zm9ybXMuDQoN
Ci4uLg0KDQo+PiArDQo+PiArCWlmIChzeXNfdmVuZG9yICYmIHByb2R1Y3RfZmFtaWx5KSB7DQo+
PiArCQlzbnByaW50ZihmaWxlbmFtZSwgc2l6ZW9mKGZpbGVuYW1lKSwNCj4+ICsJCQkgSVNIX0ZX
X0ZJTEVfVkVORE9SX0ZBTUlMWV9GTVQsDQo+PiArCQkJIGdlbiwgdmVuZG9yX2NyYywgZmFtaWx5
X2NyYyk7DQo+PiArCQlyZXQgPSBfcmVxdWVzdF9pc2hfZmlybXdhcmUoZmlybXdhcmVfcCwgZmls
ZW5hbWUsDQo+PiBkZXYpOw0KPj4gKwkJaWYgKCFyZXQpDQo+PiArCQkJcmV0dXJuIDA7DQo+PiAr
fQ0KSW5kZW50IGlzc3VlLg0KDQpIaSBWaXNobnUsDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2guDQox
LiBQbGVhc2UgcnVuIHRoZSBgIC4vc2NyaXB0cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0IC0tY29k
ZXNwZWxsIFtQQVRDSCBGSUxFXWAsIGFuZCBmaXggdGhlIGlzc3VlLg0KMi4gQ291bGQgeW91IHBs
ZWFzZSBhbHNvIHVwZGF0ZSB0aGUgZG9jdW1lbnQgYERvY3VtZW50YXRpb24vaGlkL2ludGVsLWlz
aC1oaWQucnN0YD8NCg0KVGhhbmtzLA0KTGl4dQ0KDQo+Pg0KPj4gwqAJaWYgKHN5c192ZW5kb3Ig
JiYgcHJvZHVjdF9uYW1lICYmIHByb2R1Y3Rfc2t1KSB7DQo+PiDCoAkJc25wcmludGYoZmlsZW5h
bWUsIHNpemVvZihmaWxlbmFtZSksDQo+PiBJU0hfRldfRklMRV9WRU5ET1JfTkFNRV9TS1VfRk1U
LCBnZW4sDQo=

