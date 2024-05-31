Return-Path: <linux-input+bounces-3982-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F518D5D27
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 10:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45A551F23B29
	for <lists+linux-input@lfdr.de>; Fri, 31 May 2024 08:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897C414F9FF;
	Fri, 31 May 2024 08:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+PHdVDE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAB54E1C8;
	Fri, 31 May 2024 08:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145494; cv=fail; b=IJu86Wvb/da7d57v9y4rrOHKXvJCcSqyIfklbWV3RNfqeV+KnfZ762Z+EYnVIw2xhK+i64wV0EHmwp5QRGisidfwy6sxUB9IKEG9AZPO+O3rm2TrEv+8aRfH17XNNQu6ysqnZrWjQyhkLigtB5dcwhvWh8/HZSm/wCOjBhpckmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145494; c=relaxed/simple;
	bh=niiMzbhW2JTUHBYRlhvWpv1Z+lcQzNAz9Io/W73kOHE=;
	h=From:To:CC:Subject:Date:Message-ID:References:Content-Type:
	 MIME-Version; b=sNyNyUs2ZcvxI0ZumvAf48g+y/1eLp5Jgn20qc/KnvVUsU44mkQxRun89/FRCrcz0/fFAuSws/zKIcIaLSgaAjt0lOYAaeAZnY8n0tBihmCazHRLSe4kXgoAHV256iSfslAFb6TaTT7t8u/GwFqt4dF4EchxBUmOJgM3lu4vskM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+PHdVDE; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717145494; x=1748681494;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=niiMzbhW2JTUHBYRlhvWpv1Z+lcQzNAz9Io/W73kOHE=;
  b=f+PHdVDE9MtY/jSDqJDmW6fqHfBcs5E1mGao9fyt35cd2vBPSYw3kO8b
   a1R5mQskERlnu9RdM82AM3yPm2UAfZ5I0EGpHLR2igg+1MazX7SBI+e6a
   cMpL47ISeKQGeX9NeEHG6QbhxEvq09N46gK5/WOd2GZrHpE+NnvUcHHHN
   fDe/Z1jK03qkc2HhwAi7Cp7RbID0GcHXbBltmzDtx/vgyQ3Ar3Mwx3KMG
   GsqYjQDH4yrj/y0sl2fGLg7O3fGyacCv07Neb2JQSqA2rYSS1pwWo9gGr
   RbG8VYmQhk4/Nu+49bUgXv6WK0e4qqHrB8FZyxjOF3wA+ZHFj6m55ALAr
   g==;
X-CSE-ConnectionGUID: 7EQVJzbYTY+PjL/cuLjUpQ==
X-CSE-MsgGUID: urrlq8b8Q76qWlbYJcrDzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24241612"
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="24241612"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 01:51:20 -0700
X-CSE-ConnectionGUID: WPj1YzvDTRGYAQ1vT7zrng==
X-CSE-MsgGUID: 1C5CtlgiSQqTOCsSiht68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,203,1712646000"; 
   d="scan'208";a="36183271"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 May 2024 01:51:19 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 01:51:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 01:51:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 01:51:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 01:51:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5mWjfenkGmxkGy8KH9lC6CxRE9ke5bnFKVLv41PruhG8cLyzTRfeW/NtxL2atSsMaOI3OOsI1IHPfxXrx/uvPTj7cP/T6K2sYeNM8fS8ihKHi9zdLVPix/7rxKvY9iGgBOSAbh+9LpJDH9La2CExoNs1JZU/fVdOD5bX9GIXxrbDd0B/3t5dzYPzpoXueyWqZgD3+nZaOvLeeakHHJKfOGw2Hjh00++7JQhHr7R83wUCzTLHUFBCVBUQwxP8lFd72Q1uKpp8l9vBo6rzxr+36hS4oczYsENLX5wzxLEoqQGSQCm+LYHoTWhZd6+C/yemzWW8mf39xMlhMqAg/rYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niiMzbhW2JTUHBYRlhvWpv1Z+lcQzNAz9Io/W73kOHE=;
 b=EX5OPBcGfchNCQjUk1l7aJzZx4ATw2pSvsEhaXuPaEewdc96NVNavBENVHIIrKv1b/VzghhmYOzYpkeVN0AKPn3RVnj9+G9R2XU8SmAwik+hyzWQKNdhqp9NbgeLnySGjx8cSmirBFpvkOFiDslVhqc0wXoeO+Gqpb9pdFodce/S4PVyS7IJkfUWExhJ52x/Qb0D4oGvQAACVrkvtjLlz0gLRK48Mx1lV3UKiWBpjOAvqWiA0HJqygsM90r7f5cCjtffWokt09l6gtYYXWuM6UFYREmX6hoN+Kk5SUddDkjk3oCUZGZfqGa3C13Dkqyq7Zalk0w/SQeEEZivoCZHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 MW3PR11MB4763.namprd11.prod.outlook.com (2603:10b6:303:2c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Fri, 31 May 2024 08:51:16 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 08:51:16 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, Arnd Bergmann
	<arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Jiri Kosina
	<jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, "Xu, Even"
	<even.xu@intel.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Thread-Topic: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Thread-Index: AQHasPZUv9c8QpESZEiMh4a/JLYAj7GtvJ2wgAAO3ICAAQDKAIAAmITggAGnEFA=
Date: Fri, 31 May 2024 08:51:15 +0000
Message-ID: <DM4PR11MB599576317F5E81EE8FBD0E6093FC2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
	 <DM4PR11MB5995875EEC9ACCFC43D8B86A93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
	 <fcbdc4a5-abee-4de8-9fe8-c8486195b96d@app.fastmail.com>
 <ed3236173ff6fdb1cb6962f388b41e6b90586335.camel@linux.intel.com> 
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|MW3PR11MB4763:EE_
x-ms-office365-filtering-correlation-id: cbc6949c-8372-418c-7587-08dc814ed4f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?REk2emlLaHdhY01WVE5idXY5bjhlM3IxMUNRQmV3SnZvalBZSTVRTkRESGxM?=
 =?utf-8?B?eklqUlhmSjJzakI1SzErdyswL1R1aVRzMmNKZ0NaaGE3ejRzRzVQQ1M5L2ln?=
 =?utf-8?B?MmZtVmJEa0RPd3piMElJTy91dDUrQ3UyR0taNVRxazcwQUUvR0NmQzVodHVp?=
 =?utf-8?B?bW9BZnBKbnBGa29ldkI4aWRJdGcwNjFhUUE0bnVZK2c2ekR1bkZxQmRRaWtt?=
 =?utf-8?B?ZWxxZHlZR1ZxNGRUNHV3ejlXZFYyTUlZR1hjRGRjVllZQWZML012UExlVkhC?=
 =?utf-8?B?ZkF2U2pIQWc4V0ZwTjliYzFaQVNFLzBlVENpdDdFUiszZENWVnY5TVFQbzNH?=
 =?utf-8?B?bVo0cFpmWE1Ed3hLaHZlM2Jsc0o2RnFocmNWNm90RWVkaG1pdHRzUjBzZnor?=
 =?utf-8?B?SVBnTHhxUEVJWmFCa05lRjNDd3drVEZGUG8rWUNabG0yQ2w5ME1VOXdINWRu?=
 =?utf-8?B?ZFdlcWxpRUR5cm4raytZbXgycCtBMkVvZmc4a05VVFJ5WC9XbGo5dDUwUWRq?=
 =?utf-8?B?dTBtQlNSbFA4TjM3SXZQcTZFay9QZ1hya1hwN2lhUy9tTnlvTFhNdjVaem0v?=
 =?utf-8?B?c29adWFJWmVMNERha21kZzJRcEt6blpJcDd6TllJV1cyMjFlQkpxYXJyUDhv?=
 =?utf-8?B?aHd5dDBuV3pjalJmMzYvNEpUK29zSjdEZFY5NEdpL1JDdzRxbENDSEF0eDJZ?=
 =?utf-8?B?anV3K2tYM3kzOTVnTWNGOWdYaUMxRFA4Q1BmcjU0QjVBSmpTck1BamNaMzV1?=
 =?utf-8?B?UTJIUm1BQUZDQWtHdFl3a1l6eldBcXdiZXplMk0rN2tiT0pIVnpuM2FoVHV5?=
 =?utf-8?B?VTNDd0JwQVhVLzk5S3gxRWtmWFlWZm44MmwzekFWd0o3VTZNWmMyYmZHM05T?=
 =?utf-8?B?M1dqMnBTTGhjUjFmZ0tXNnI4UUVjNG5LUUd5azVoKzVudStzbFAybFRXWlVo?=
 =?utf-8?B?RmRBdUcxekxUTlZwVTlidmczQWkxZmhyUElETXJjOHVnMGRUSVh2WHg4VVR2?=
 =?utf-8?B?V09zenRKdDFQNjZLUUZ0anMwOUI5a2ZkUmZwMXJiYjdGblUzZTU0alhIcW9r?=
 =?utf-8?B?dlNtVEFWaU40RXlsRXp0RVRUcmw2d1gyS3ZOU2h5MmVkdzREcXZ2M3ovaWhX?=
 =?utf-8?B?Rlp6NlFkVG0vSDRwSlVaSnJBR2xGLzh4SlBKbm8xNXJ2U1lkTlVJYk9NSDJS?=
 =?utf-8?B?Qjc4alFUekd2QXh4MWh0RzZHSys4Sng1RWswK3VnTmo5VGNRczN1WU1MSC9N?=
 =?utf-8?B?dmxzN0hEMW5FQitMQ0FQdzJrWHRVV3kzY1FETVVvSGl6aUdTbjIyN0IycmZn?=
 =?utf-8?B?aUU2N0pTQ2pkS0lDT1BBTXBxSGszMmc0ajFpRlM3Z2dWZUErMW5udkRNSWpL?=
 =?utf-8?B?RG5LOGdiZHlRakthYmVudWRBOXo4d1JvSFFPZzJVWlpkdVhEM2RjSkpvLytr?=
 =?utf-8?B?dXpDbDBmcjhraTlvUy9IYjFHNVVVR3lGeHExWGR0MlBVOE4wQmNlSm16c2Vx?=
 =?utf-8?B?VGJlVmRBMU9TSFMzUlRhbmhxSjVJblRCbkd0VlRRQjdaQ045cU5nRzdJZXVD?=
 =?utf-8?B?bUtqeDlVMmFhVzloSElYcm54ZElLVEd4Wlp4VkFPTHJCWnNWZU9uRmNHWC9T?=
 =?utf-8?B?YjBQSjFxOXpCUDg2NlM1a2JRQVdITG5HRmRrcUo2azlNdVZDZUo0aGxWUGNw?=
 =?utf-8?B?NHY3WE1TMUNCMGE0a0lNMW1Rcm0wVGtURE1WdzU5WFVTZWI5M29EVW44MEFs?=
 =?utf-8?B?YTlSUHZiUWVLbTl3ZUtXMTFMdE0vWHJDUXpwMmFRSWxrbEhSTG1jSHViSHRO?=
 =?utf-8?B?eDU5NFlwZDhLZHJZaGtNdz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bmJoWGpXUzFhY3liOVJsRWdHc2kwb29lblRkN2ZOcmRpOThqY256ZFpFWUJP?=
 =?utf-8?B?TjMvWUlmMnRBZzNUdm5JZ3A3N0NrTTdCWlQ4K2J3U0pteTdBdjlxTWlVSGt5?=
 =?utf-8?B?V3o0dUtsdE1ENnB2QTZwSnN2a1ZQbCtuSitKRnE5Q2cxdWxvb3UrNXdjcFdR?=
 =?utf-8?B?bzY0Z000MHl3eWpSQkNnd1lTRGZ2YVFYdnFRVGRVaGdIZ2xBVkliS2MxSTdl?=
 =?utf-8?B?NVorR3pSeDZRUlJ2Q1RYN3I5SzI4bkNocER6bUhCb3Jyc1Yycm1CVm94Umdw?=
 =?utf-8?B?ZXUvb0JMcEg1UTRkekMwMzV2TlliQ0ZZQzcycEF0aStkeWRvVytFdG9uRytJ?=
 =?utf-8?B?WDRxeklVcXh3c29DaEJGeXRBTkpHNDNjUU5vRHZTVkNrcWNvMi8vVHNBY3dF?=
 =?utf-8?B?U2RUV05ySUhpSEJnSG84RllDZzVwamxibHc3Tkx4dVJWemZzekRhRjF3MUdn?=
 =?utf-8?B?NzRGSzErWjJKTzlrTmZUMjhUS3VXNEtNY3RtMUpPMVZyanlQRnFQd1k0RmF6?=
 =?utf-8?B?Z0RQZEkvZTloT1Q3WWRiY1pZc1JTT29pUE5kWWtDcGE4NzhtUFNsVCs4WGVx?=
 =?utf-8?B?L1lDNVVTZXZONXdkVVVSVHlNbDM0MU5vb3pXUExkY2JGNGpRNTV2SWNhZjNT?=
 =?utf-8?B?TGlFTW91ZkRkVXJrcGdoaE9laDVkQlVqUHJrY3FmaGh4SGpZUzFsekJDNE00?=
 =?utf-8?B?RTBpWlZFSlVSeFFoYmdyR1VxcEI2bWhEWGhHNDN4WEUraGFpUDNsa2FmMEZU?=
 =?utf-8?B?SGJNVWQ0KzZiM2NSUnJoWTBPNVhvc3BYZXk5TTYwc1dwcVl6Y2g0eEN3dUE2?=
 =?utf-8?B?Z3M0OHRKbit2eFZzYVNOMnZXaGlDT3JOblVidnJBdkFKaHo0OWpLcnpLNko3?=
 =?utf-8?B?YnExZGZ6VitTVEhTRHByQVFBNmVaazBvUGw0MlBpUGwyeFZyYkZsMnZkRUNK?=
 =?utf-8?B?S1h3YWZXR3o3K2VmbXRWMEo4LzhyZzRxNjkwNTNIQzFrUlAwYnJ3YWpjTEwz?=
 =?utf-8?B?MXZoc09wTXR6eGYvL0ZMdjZ6RTNvZHBRVmJwdyt0ZGdFcHRwcTJCUTNOUlQ5?=
 =?utf-8?B?V2l4SldhbWpET1FldStwYVlQeWcrWWRwZ0dXNytFUnlaS2hEVE1NazhsejNR?=
 =?utf-8?B?QkRkUkxTYWIwZVpVMXAvVkJWOUpSSTB5cjFacnpBL3NGSlBjQXp1VTZPWGlP?=
 =?utf-8?B?Z3IrV2tDNCtkS2ltcFBKT1pmd3hWYzRNZml1QTFkc3JkYTJiaHV5bDdZcStP?=
 =?utf-8?B?RzBQckRnR21OblZkWS9vR005SXQ2c3NJd0dDVERCc3pwcEx0WVo0d3l0SzRa?=
 =?utf-8?B?Sk1yOVd6SHFNZUN6U0ZjVEVVakpJUjhXVWdTNS9Cd1BLQk0ycWhHRWVsbS83?=
 =?utf-8?B?Z0lMRmpOS1hTbXRRNTJJZzZ0S3VqMDJZOEpKSGpmODJoNlgwSFpyNFFNdHZ4?=
 =?utf-8?B?QjJQZE56YjNtcEdVMnlVNTdEcWEvQWp0QkZRVGlnUnIvU2xDMVdWZmtLNm9u?=
 =?utf-8?B?NGZBbmJ3aXhwc3F5Ti9IbzgrV1VXdDN3bEY3MEV3RnJRVzBVN0h0SUVjNVRG?=
 =?utf-8?B?Z2lRd0FtRDI1RjBwUmtPMVAzWTdsNFc5aWRaNEdhVGgrMTg1bHJjZ2Q3OVNV?=
 =?utf-8?B?SWhFcHNUWUFiWkMydTNsVzkvem1vTVpmVTFuNWpjV2wzVXFqOWVIQnVoaW9h?=
 =?utf-8?B?dHJKOUk2eGsyLzVwSGg4WWY3NnQyZ2JJVzVubDlJTGNNN1lEWEhmN0k4N2M5?=
 =?utf-8?B?MzU5SDBNbXk0R1RiVURNemdyNU1lNk1mYVRjTnhQM09VT3VpcFBmOGVkZWZa?=
 =?utf-8?B?QWgyY1d6MGdveVhYQ3ZGOGh3cVlDTUJiUVorU2hzaVVBMXFpYWRQWFNlc25X?=
 =?utf-8?B?czlpcXRWTW5EKzFaRzdjNG1yTUJSWW4wVUV1WUM0bmRzS2tuSmJiWE5iYm9u?=
 =?utf-8?B?SS8raURYSTg4bDBmKzhYaDBqNHM1VmFNc3Vkd0ZsSzBMRnFCTmVqYlh3Rnd3?=
 =?utf-8?B?SlZ0TU43RHlmTFplNEZqQlJMYUE5dlM4SEFPMEpYWE1NWWJaS3dORHY1SFpU?=
 =?utf-8?B?d0g2MUo0amJGeGlsbThqWkJDQjhPMjF0Ny9TSkx0a2ZOK1JMTlIzRFdFR3BU?=
 =?utf-8?Q?nxKQcFLCxuE4wWtt0hhl+6bLA?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbc6949c-8372-418c-7587-08dc814ed4f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 08:51:15.9440
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9rN3hvXhMZy1IA07hpH/QVULpTP0VfGN2R8591mbAqWxExUAVMrFx2p3xpUsFYxNRk11AmjdYBf+/nenXajD/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4763
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogWmhhbmcsIExpeHUNCj5TZW50OiBU
aHVyc2RheSwgTWF5IDMwLCAyMDI0IDM6NDIgUE0NCj5Ubzogc3Jpbml2YXMgcGFuZHJ1dmFkYSA8
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+OyBBcm5kDQo+QmVyZ21hbm4gPGFy
bmRAYXJuZGIuZGU+OyBBcm5kIEJlcmdtYW5uIDxhcm5kQGtlcm5lbC5vcmc+OyBKaXJpIEtvc2lu
YQ0KPjxqaWtvc0BrZXJuZWwub3JnPjsgQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtlcm5l
bC5vcmc+OyBYdSwgRXZlbg0KPjxldmVuLnh1QGludGVsLmNvbT4NCj5DYzogbGludXgtaW5wdXRA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDog
UkU6IFtQQVRDSCAxLzJdIEhJRDogaW50ZWwtaXNoLWhpZDogZml4IGNhY2hlIG1hbmFnZW1lbnQg
bWlzdGFrZQ0KPg0KPj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj5Gcm9tOiBzcmluaXZh
cyBwYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4NCj4+U2Vu
dDogVGh1cnNkYXksIE1heSAzMCwgMjAyNCA2OjI1IEFNDQo+PlRvOiBBcm5kIEJlcmdtYW5uIDxh
cm5kQGFybmRiLmRlPjsgWmhhbmcsIExpeHUgPGxpeHUuemhhbmdAaW50ZWwuY29tPjsNCj4+QXJu
ZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPjsgSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5v
cmc+Ow0KPj5CZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4NCj4+Q2M6IGxp
bnV4LWlucHV0QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K
Pj5TdWJqZWN0OiBSZTogW1BBVENIIDEvMl0gSElEOiBpbnRlbC1pc2gtaGlkOiBmaXggY2FjaGUg
bWFuYWdlbWVudA0KPj5taXN0YWtlDQo+Pg0KPj5PbiBXZWQsIDIwMjQtMDUtMjkgYXQgMDk6MDYg
KzAyMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6DQo+Pj4gT24gV2VkLCBNYXkgMjksIDIwMjQsIGF0
IDA4OjQ2LCBaaGFuZywgTGl4dSB3cm90ZToNCj4+PiA+ID4NCj4+PiA+DQo+Pj4gPiA+ICsJCWRt
YV93bWIoKTsNCj4+PiA+IEkgdGVzdGVkIGl0IG9uIHRoZSBwbGF0Zm9ybSwgYnV0IGl0IGRpZG4n
dCB3b2suDQo+Pj4gPg0KPj4+DQo+Pj4gV2hhdCBiZWhhdmlvciBkbyB5b3Ugc2VlIGluc3RlYWQ/
DQo+SGkgQXJuZCwgcGxlYXNlIHJlZmVyIHRvIHRoZSBpbmZvcm1hdGlvbiBiZWxvdy4NCj4NCj4+
PiBJZiB0aGUgbWFudWFsIGNhY2hlIGZsdXNoIHdvcmtzDQo+Pj4gYXJvdW5kIGEgYnVnLCB0aGF0
IHdvdWxkIGluZGljYXRlIHRoYXQgdGhlIGRldmljZSBpdHNlbGYgaXMgbm90DQo+Pj4gY29oZXJl
bnQgYW5kIHRoZSBkbWFfYWxsb2NfY29oZXJlbnQoKSBpbiB0aGUgYXJjaGl0ZWN0dXJlIGlzIGJy
b2tlbi4NCj4+DQpIaSBBcm5kLA0KDQpGbHVzaCBjYWNoZSBpcyBuZWNlc3NhcnkgZm9yIHNvbWUg
cGVyZm9ybWFuY2UgcmVhc29uIG9uIHRoaXMgZGV2aWNlLg0KDQpUaGFua3MsDQpMaXh1DQo=

