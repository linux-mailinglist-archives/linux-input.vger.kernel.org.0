Return-Path: <linux-input+bounces-10433-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D4A493FC
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 09:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 141BC7A3FDF
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 08:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC0F254844;
	Fri, 28 Feb 2025 08:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETJT8+/L"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07AE253F2D;
	Fri, 28 Feb 2025 08:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732645; cv=fail; b=VAQFLBJh4jiGHDdjQUE/GkFFXBGJJwEnxxt2BFqY5ITZ9VVwqUgmyZZpj93bROrFHYzRejoTU8F7uFzRlAHZ+N3DruJePscARmctahWc8eURjiZ/do0EABhJ53WXapd3oweHvdCLWBjGilV/dffw7k8DgEqPMW4qLn5ws6IHqOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732645; c=relaxed/simple;
	bh=P6jUfJX8igG2CstMhiejgG/RH74LJ8tJmY+2P25KbHs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kUqkgk1+A5XNay3GnoqskPDaikFUyfE84N4MgOQSbdh/5z94uO0H/YnrrdRG4AnQvTdMLk/YG+xAy+0HVe48QHImyCoH21jLEL1wfqsoSKsg6SwRdLpr4exV2uLmpVjT603lU1rjJXRPMIXl/23HxwvMHZwFODPXGIrEyqF08MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETJT8+/L; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740732644; x=1772268644;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P6jUfJX8igG2CstMhiejgG/RH74LJ8tJmY+2P25KbHs=;
  b=ETJT8+/LBLOsaWySk0U0hnkj+iuXhLsNqBe4i2TeOIl0IcUOQTY7HK+g
   RkbaAWvewnbbL1leRRY2ROar+ukmQMuInq+JkDg2q6bSYwhgyetjCBOBp
   0NXV4SWwQgmayjUvJ0/AxqqoCbVN3LszLorzRKgZT4ZhVCnvutxhyWBdY
   j0Ok45zQr6mO354lHwQCzo101ALwBdkE4jSMsOY1+bPtqgUoJienl9PAC
   tbS+fPNYrWRH2syF3Wbly6GhVxvLoaLcn3ZmGT5MvJY0rcmCKlkBWVOar
   jghSJ13+wOBdUrtmxMuhQvnSSx4W6fd4aZ29AHxYG/paXRHvEMWPqhOK/
   Q==;
X-CSE-ConnectionGUID: ylqyX4UfQ8KO/6+7t06zQg==
X-CSE-MsgGUID: QckvppwkTDmAt5i+IoX1eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="29249132"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="29249132"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 00:50:43 -0800
X-CSE-ConnectionGUID: pVnoQfcjRuy3Ii8wmGxAxQ==
X-CSE-MsgGUID: 2/+bYNjqQweYyJIpAg9byw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="117074358"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 00:50:42 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 28 Feb 2025 00:50:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 28 Feb 2025 00:50:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 28 Feb 2025 00:50:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLhPbFWPIiOH60ldiz/Lq238OeCluIq7SCv0yRSNaoHk24wBcg6uKNtdEKjijUXZtmpwsbIwqnIYx+Kw87HqP8G4FyI9qS5ca83TFva4B2DwU4e0R4OwI3fttxGaGgWE7uylHN/yVMPQNG0Z0FVyVHKOFlmUxZSdE9izp8TQDLkjyD4l3VemCrwtzEwxy2edz1IpqFLL9fOfv57NYNfOpEkU3EUg5pLrzLN1dwwxizRWhB4kR0mnYm34H6YP3HMTkXuT6ViMkUhOSg9t+f30pXWL2wyS4OHDtWmI/NnbNuBra9Ute0ff2scFwdDkF2Gg+pAKg1fQ6y9H5/jaTCazow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6jUfJX8igG2CstMhiejgG/RH74LJ8tJmY+2P25KbHs=;
 b=N1KRSihg/NKjS2omEqkA19BqlJYjT9ELvPJSrFCjqIrH6/fJsTJ5FB2GXh7AlEoPhs8SdqLPkZ6LsYVgnM3jxF3ThakwN+kuDc+yWSOnp0TyxxftqxjjuXCQlAv61rZ2a6O9os+sX6RuE5+xi6CvNBYpFrtCrFbXy3tIHQTo4KLprKQGmurLBZbhFAss5SySoT8ctGRyT3SaM/px7hqIZXdjc4ZoE9YKUCepXbO0YUgufqpRUAd+6OR18ik9h/pf52wbbRsTwUkdPTB2Qf/01IpO+dqvgGfe4dL6nH/QC0Kdz2AXgGenKfVev/r5p0e7DCHcLYedoAUNOQYahoaXWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by DM4PR11MB5326.namprd11.prod.outlook.com (2603:10b6:5:391::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.23; Fri, 28 Feb
 2025 08:50:35 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 08:50:35 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
	<bentiss@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: intel-thc-hid: Fix spelling mistake "intput" ->
 "input"
Thread-Topic: [PATCH] HID: intel-thc-hid: Fix spelling mistake "intput" ->
 "input"
Thread-Index: AQHbiby2cYAIaaLFo0SppdpAyOsDGrNcZ/Jg
Date: Fri, 28 Feb 2025 08:50:35 +0000
Message-ID: <IA1PR11MB609878CB4BD4898B984BA637F4CC2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250228084139.677391-1-colin.i.king@gmail.com>
In-Reply-To: <20250228084139.677391-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|DM4PR11MB5326:EE_
x-ms-office365-filtering-correlation-id: c853c587-1f34-4d76-8f48-08dd57d4f7a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?VjQ2bnh2SjFqOU5hUjFCbUZWblAxZi9YTEFIUkNMeUVSSGEzVEhzRlVyc3cy?=
 =?utf-8?B?WWxCTlVROTIzMHJlOEx3U2pxbzJlK0EySVBmVktQYUFRczVxdzhJUUpMeWF6?=
 =?utf-8?B?SGFDcE53QXBCN3JUek9UUGM4aEhMYzQxWXhWaitJU1ZIa2Z2WG9wcjYvWkpQ?=
 =?utf-8?B?NHdSaGU2Zk9vQjlsMFhQbGJoSmwvaS91T2dnbjZOcGRYMzM0OEJoREF2cjZq?=
 =?utf-8?B?V0VtMzVkcVJuazNJUEVsWVRmeTVld2xXakRXNTB3Z1poUG9Qd1VuczJkVW8r?=
 =?utf-8?B?VTFrU2QwZjI0aUtCMmlUaHBmZHdzMzhYZHdMcXMzbWI0ZWJhZjRsNHc5TDB5?=
 =?utf-8?B?WXNqTis2dFNtcHhYakZMOVJwL05tQlRJcGp3YS9RdThpcklwUnhWekFYdXdE?=
 =?utf-8?B?L3RZdUlsNy8wTW5pbnlrV3ZLYWRrVytrUXdtb0tOamQ1cEZocDN0a1BRblpI?=
 =?utf-8?B?Z3FVRW9hem1sM1pZNm41UHF5dXljcmozOGxzRHJoZFNMcUs4QXJUd2cyVDV6?=
 =?utf-8?B?ak1TWEIxRVVtc1ltd3REb2RpdjJ1VEcySU80ZHA3aFVOeWl2MGdGRmFJbWcx?=
 =?utf-8?B?YWFsRHo5NmZta1ZIVFVtM2dyTjZDQk9xMzN2dDdMaDZiSklqNTV0aVZWcDBa?=
 =?utf-8?B?QzY0eVByaTZXZE4zK2hYNUZ1b3FwcWR4ZEV0clk4NERkbndNTkM5OFJwQlNH?=
 =?utf-8?B?d3hOMUNWbVBEWnhBOCtLSWFmTUwreTJHYkpGendDUTNjUXY1OVFJYmcvWEM1?=
 =?utf-8?B?VnlIcVpielNQalRqWUY5Z29Yb0lsTk80ZTFSbTdWeDZjZWJodE8weFZXQXl5?=
 =?utf-8?B?cnpEdGtDWVIvQU94Z1NuOERib2xkL2pCS0hTQzVQWUFHN1MxMEJpTCtEYXRO?=
 =?utf-8?B?cHRTNWVhV1k3SkNOZlVycGc3amZQbWk4RXhNOXVkR2VOaWkva1hhczR1STJG?=
 =?utf-8?B?NmRobnJyY3EyY05FRGNTNU5BVXR3b3RFOGQ0Wk5DRjFjdGFNTW1MYzFmcHZP?=
 =?utf-8?B?Skx0bHZQOXA0Mk5zdGMvNjE2bDExZzdmanZmRVJYRHFTOWFzbG1xa1dXSUJl?=
 =?utf-8?B?Y3JuWUdrQUpyNnRJYk9qL25TTEhJUkNvejVjMXl1ZDNLVEJjWisvaXNyV2ln?=
 =?utf-8?B?ZVJaTXloay9Rc21sY2N4N1hrV29XdVZrMERRTWVVL2Q5ZmFpUFBzajdiekEx?=
 =?utf-8?B?QU1ydDl6V2k3MEpBRE91K2ZNSlFhSm0vWjZLcDBuZERkY1BsSVREZXJnNThr?=
 =?utf-8?B?ZkZrNVdTWjUwZll0NTlrYXRVUVliZXJQOWVjZ01rNVVmM3VjNWZ6L1NDNWZ2?=
 =?utf-8?B?aVZ0dUFqdW5ld0tYeEwyTDJwKzc5TUY5N1Q3THNITDc4a3JZcjFaYVJDS0Fl?=
 =?utf-8?B?QjVUdWZ5V0FKKzJSWExPd0FGSGpzcnR5SFdKUWhWUWZTVXI4c083aGwvcE5v?=
 =?utf-8?B?L1RHMW4vUFlrUU45TFRUZWd6U0kvV2xlTlpmMjlEVFRKSlJrdXZROUtSNWtR?=
 =?utf-8?B?MkU0QkRQeDEzVzJzZ2NRdXZsZUpRSXh4YTZOazV0R0czMGZ1bXlGUFVpYnNh?=
 =?utf-8?B?SmVsb3lQYjdhRXkwOFZSeFZMSmxCNmYxYnlTd0lYK3NvakRsV0UyTk43NVRS?=
 =?utf-8?B?WkhSSVVhSmJ4a0hXa1ZsaWI5QXl2ZFN2ZzBHUGsxWG1zUG1lK2FKNEFvVEhC?=
 =?utf-8?B?a1M0RERMNVBjeUFTc2pUVWF2MVRLM3NNNzJnODVIWjhMS0diQUE4ZlphVDlJ?=
 =?utf-8?B?QkNKRHYzN21aNlh4dUU2SmJRTkxqNXFRQVBNQ1liYXkvdFJMdk9zYnRobm1X?=
 =?utf-8?B?MUtDdXBNLzhzT1hoSTVTdncyZVRleFBMRFgwNS83Q3IzZXJaOHB2SnExOHNI?=
 =?utf-8?B?TFNubUxQTDdPMWN4cjZHV3RSaGIrNnVKL3k5K0pSd3MzVFhwaHBsemx4Mjl2?=
 =?utf-8?Q?+gVz1rGimETwvxdtMdtEOiQ4McDMtPPO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vjg3SEQzYkVOSHVMem1ubU1EUDBKZ1ZzRkk3ZmN4eUVuQjRTOTc1UHlSaUhx?=
 =?utf-8?B?U0hSR0hGL1p1Z0VET1BGQnpqRmdjaHFkUWdvaEUva2JYUlhsM1ZidHZNUkhh?=
 =?utf-8?B?Y2ZIRmk5L2hLeWRNc2VEQkVBSmtZYUJKTm5FaFpvVXY3V2V2V2VWUk51TFFz?=
 =?utf-8?B?Q3REZ09MZ0UrbXFZVVd4VXI5Z2VzbnhLN204bUtPNVlTM2tzUUlhNUJCL3g3?=
 =?utf-8?B?dHpHZ3Uyb0JLMi8zK3hPM1FCU3VabGtyL2NianRuUWMvY29lSVFuNWk2T0ZB?=
 =?utf-8?B?enIraGJJaWY5cUJIbFo5UWRQMXE0dTVHK3N5WUc4OXc0UW9NdUZWeGRjMUFT?=
 =?utf-8?B?RHYrSkpON21tTWMvTjJCRU5EbVBvNlVDSkdJbmErWXE5UEE1cnNXQUY4OGMx?=
 =?utf-8?B?RXJZUUJLOXQvM0FvUHhrOEFXYXo2RVhKTVJlWjFjaWpJcUZPNTNzaUxtSll5?=
 =?utf-8?B?ZnVNdWhnQUEva1QvTTNlakRwVkh4K3JXUC9oanhaYzhjYy8zUW96TDA1cy82?=
 =?utf-8?B?S3ppQ2pEMnp2WE9oUlRmemVFWGRyb1NkWitTa2NEVFcvaGFmY2YrNDk1a3Vs?=
 =?utf-8?B?Wkgwcld6NG1oRlVuTy9jc1Vjc1ZIKzlWZVpqNDRaTlh6cDdXZUFNYklxa0RD?=
 =?utf-8?B?UzlzTzV5Ym9jelZLeWQ3NkI5T2ZFcGkzeU05K0tUZ1BBaWhGYjNlZmNBK202?=
 =?utf-8?B?MEFqNHViTTdld25XV3FOOHJsWXd6dnFZVVBIVThUSmxEdXltWTZZMHYzSFAr?=
 =?utf-8?B?VW9Mb1c5M2NhcXlxRVBHR0YvamhHSWRKY1pKSUdJd1RzL0VhUGlIOC84S1hC?=
 =?utf-8?B?TEhjNUlENm42SFA5TWdzeEYxa1BMSG8vNk10VmtneGNJR2ViQ29pdFMwK1dT?=
 =?utf-8?B?T0tLY3JURDRyNmt1VFF0OWt3STZZOUdTbVVVZm1EK2kvTVYvNmg0TmNoWGVO?=
 =?utf-8?B?OERMUUROdGxhT2l0QUpZQkx2YnU1R2U3cTJONWREQksyYWdHUEFJN3JCSWRr?=
 =?utf-8?B?QWlNZXhWcFZLZmRsRXY4dEljUXNCSGZhQnc0dyszWHoyWlJxT1Y1K0EwZDFF?=
 =?utf-8?B?WkFSR0w2dmR4MzRZWExlVGN1aElFRWpyeDZ0cUcwYi9ZTm5hZ2N3UExhZFhQ?=
 =?utf-8?B?ZWY0MjBrUGRqMk81NXM2YmxvRG93TkVSR1dvRDFLY2N5TTNPZTdacTJCdHFq?=
 =?utf-8?B?WkIwRmJUTENIZ3NTM1E0bTVQQm9tYTUycnVkUmNJQ1hxWW1rTGwwRHI1VTNs?=
 =?utf-8?B?ZldiWGd3cURFT1h4ekJXazY3c3JBcHlJa2pVeFhRL1gzc3RyZjFUREs0aHBz?=
 =?utf-8?B?OHBXbWdML1oxK0NBbHNFdW8zd0VCR1FWWDZvRktYWk51c0tJbUxtQUZqNnk0?=
 =?utf-8?B?dWlHY1ZlNG1ZTWQvTDlWd0E0TmhPZnYyZnhYMHQ0cjJ1VnF2bG1HVUxmbDZq?=
 =?utf-8?B?N0N2dmJPRHJkZE9hU2lpSmRBKzUyZnovUGcwTjRBSlZZMytNTjM1b1JyT1hs?=
 =?utf-8?B?b0RyRGpaTlFSTDJ5YzBFYzdQRG1GcnQvaTNwYytJd1ZteDF4ZTF6NWhBLzZr?=
 =?utf-8?B?ZElSdjRkOGx4WEREMEtiVld3ckF2NUpyWVlILy9uMTVQYlFKUmtHTlVyS3l4?=
 =?utf-8?B?a1BZcTlvMlRnbDQ1M0lFN0JJUFJlQXdJS2lhMVJyckxsWEpLVTB6eUFYS1BS?=
 =?utf-8?B?WGxXVEJtbHJSSDljZHJ2UEo5MXBydHQ5NS9PbW13VUlURWZKL09DR01jbEpU?=
 =?utf-8?B?eVAwVlFsR3NxZUNGVTcvWDRKQ2o4NWNQTUVIbFk4Y2FpcGQxMWJIMEI5Zit4?=
 =?utf-8?B?RTUxdWpCUjNHcVMydkdkeW4rRzVHNGx3WHhaWGpBTW1GVGpNa01BYUQ5dzBB?=
 =?utf-8?B?UG9CUmtoTWczTVlTMjZXY2d6U1JRNjBBOTJoN25HRC9QSG9sL010UXQvTXZx?=
 =?utf-8?B?TEsralFTMEhUVWVpWERabmdwbDJOQm4vZ2RyRkJoOGQzRENBcGtienNDeDBm?=
 =?utf-8?B?YkcvQy9NNW9tQ25XNW9iQUo2dGM1SmJKUkJ0RS9BWnF5ZW9La1Q3VWt3d1hD?=
 =?utf-8?B?UUVkMnU0ZDc5Q1lwajNQVmlXQ1lyMCt1TmhKSEFCdFI3QlhVejJVVE5uZWxP?=
 =?utf-8?Q?HkRs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c853c587-1f34-4d76-8f48-08dd57d4f7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2025 08:50:35.5218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Axe+kTVID06jY9dsEZn1vR9bVsEILz2mvdBV5NJuVAs66vJ1BxP7HHJ1zH4JfigtdPqo6p+yguIxmgz/7i7X9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5326
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmkua2luZ0BnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjgsIDIw
MjUgNDo0MiBQTQ0KPiBUbzogWHUsIEV2ZW4gPGV2ZW4ueHVAaW50ZWwuY29tPjsgU3VuLCBYaW5w
ZW5nIDx4aW5wZW5nLnN1bkBpbnRlbC5jb20+OyBKaXJpDQo+IEtvc2luYSA8amlrb3NAa2VybmVs
Lm9yZz47IEJlbmphbWluIFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3JnPjsgU3Jpbml2YXMN
Cj4gUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+OyBNYXJr
IFBlYXJzb24gPG1wZWFyc29uLQ0KPiBsZW5vdm9Ac3F1ZWJiLmNhPjsgbGludXgtaW5wdXRAdmdl
ci5rZXJuZWwub3JnDQo+IENjOiBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3JnOyBsaW51
eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtQQVRDSF0gSElEOiBpbnRlbC10
aGMtaGlkOiBGaXggc3BlbGxpbmcgbWlzdGFrZSAiaW50cHV0IiAtPiAiaW5wdXQiDQo+IA0KPiBU
aGVyZSBpcyBhIHNwZWxsaW5nIG1pc3Rha2UgaW4gYSBkZXZfZXJyX29uY2UgbWVzc2FnZS4gRml4
IGl0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmkua2luZ0Bn
bWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlj
a3NwaS9xdWlja3NwaS1wcm90b2NvbC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQv
aW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9xdWlja3NwaS1wcm90b2NvbC5jDQo+IGIvZHJp
dmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9xdWlja3NwaS1wcm90b2NvbC5j
DQo+IGluZGV4IDczNzMyMzhjZWIxOC4uOTE4MDUwYWY3M2U1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNrc3BpL3F1aWNrc3BpLXByb3RvY29sLmMN
Cj4gKysrIGIvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja3NwaS9xdWlja3Nw
aS1wcm90b2NvbC5jDQo+IEBAIC0xMDcsNyArMTA3LDcgQEAgc3RhdGljIGludCBxdWlja3NwaV9n
ZXRfZGV2aWNlX2Rlc2NyaXB0b3Ioc3RydWN0DQo+IHF1aWNrc3BpX2RldmljZSAqcXNkZXYpDQo+
ICAJCXJldHVybiAwOw0KPiAgCX0NCj4gDQo+IC0JZGV2X2Vycl9vbmNlKHFzZGV2LT5kZXYsICJV
bmV4cGVjdGVkIGludHB1dCByZXBvcnQgdHlwZTogJWRcbiIsDQo+IGlucHV0X3JlcF90eXBlKTsN
Cj4gKwlkZXZfZXJyX29uY2UocXNkZXYtPmRldiwgIlVuZXhwZWN0ZWQgaW5wdXQgcmVwb3J0IHR5
cGU6ICVkXG4iLA0KPiBpbnB1dF9yZXBfdHlwZSk7DQoNClRoYW5rcyBmb3IgY29ycmVjdCENCg0K
UmV2aWV3ZWQtYnk6IEV2ZW4gWHUgPGV2ZW4ueHVAaW50ZWwuY29tPg0KDQo+ICAJcmV0dXJuIC1F
SU5WQUw7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjQ3LjINCg0K

