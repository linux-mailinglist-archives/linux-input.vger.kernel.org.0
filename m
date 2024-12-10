Return-Path: <linux-input+bounces-8479-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7239B9EB4C2
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 16:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DA4A28381C
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 15:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26EF71BBBC4;
	Tue, 10 Dec 2024 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9y1B0zt"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39911B86DC;
	Tue, 10 Dec 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733844290; cv=fail; b=da5TB9aWf7DPQBZev8bbxen4APPqhS0LvlSiEzFW2DAhpPARu+2/ljR8FN2PAUKf5yclU7hyUopoFTVH8wLgyenaKPJeNji7ZOKAiMEXRev7Os3KeeEMBsXXNswUC/Dain4rrPjzcbMwCv6UrSRjJVNfxWvIzHHG/iR+pfra+AQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733844290; c=relaxed/simple;
	bh=yUccVUFFqDMg/T8DWyOwXiLG3BxYWZJZpzDGCk7GgbA=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=om3GYEWiAkKuZT7lDvXT9agCevIrQiJL+jNjJl2VSbK/xrYIR3/6/jIRqbGxdzoowXSfvMpmQHkXk3EMCQhxGURzEGzeDX15DPerniVfkfjensR8U3QsYX2f60jVmeNhD93flzKhyyEl80pFzP8wy2FRjk4Fgds8uGxNMFV45rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9y1B0zt; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733844288; x=1765380288;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yUccVUFFqDMg/T8DWyOwXiLG3BxYWZJZpzDGCk7GgbA=;
  b=b9y1B0ztdFbXOVsG/fXmfDwDZTrCQ+aCbc1gckFy8YnNo+f1AdJBoA+L
   ViR5B9oghDZvYEGyI4UJdp5Zeb1M/oCgZ274os2+dGnC4fdiE4kgBwWxA
   3BRHR96IEJmm83ImbnkE1Pm7uUu7FYBnBYBSLl5xnPR0Jx6Y0dRddOdU/
   yjCM8YYSoGo7U5s8z1OTTjFrBtp+wB9rrKQ2xt6LXCkivv4K6i/tDDfva
   cCkwHWWEYAJdeXwzOVUws0HhPFXzRvhlA513Z5uaXWlQzZCCUIGCStJd7
   AxAlW0Yxw5NN4Q/BW1BVg6nDAsd+vRHB1+Gg/UICjcPFjBWIW8dRHzUQd
   g==;
X-CSE-ConnectionGUID: anI8b2I7TmqeDFgVy1QYZg==
X-CSE-MsgGUID: wsIqLJjCQMaqzPjYeWO2Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34074969"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="34074969"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 07:24:47 -0800
X-CSE-ConnectionGUID: yZTSiiU/Qk+8wkHxbWSsXw==
X-CSE-MsgGUID: 4Jwv2PDeQpu2Abh+PBM3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100498402"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2024 07:24:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 07:24:46 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 07:24:46 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 07:24:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9vtCCoYd+qxxH5PQlzFS/ZfG/uvNPoW/aOBy3NugL64SR1BKN2vOODAZQ39Rof4FqOZ02lmJFEYfTbBN15Q9JazNyXiWBTtI8EtqfyLDzaj0SDa5mQoQik/y9Vz7zkC48lpOmJiMG23P+th97RtePzjEV29PfsQHfXnPZf4maKF/VROkYa3nbFdH65E/F7gOATaV1F6lRtTCXrM05gt8jGmGUBjAfApcSFurNnJB86+/ucRGhmxyndmfHIH08J+z3r6NXYBLpEimwvX6vxqXEHVi2j7YNTtrfr3KL9kOknE44wzWjYbWyjwzXxDD1IRvmuJDYcuJ21ZwVg7tu9hfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nc3u65XXM/K8l7uQsyRGkeMV+19d41MCBdn7d6OKULQ=;
 b=jl+sv8kllM/4jwf1RkqunAYE/1rWHMg1vLEGV1cLpm+bY0+giDZjFnG5nRay3eAg5S4W1U1KxhKkYv2AYqZdV377YBApvDgyYgVm1/NGr/u1pEGq2Q0UBvrbZ3pit0zUrUmJSpzA1eP0ijutJavUdvEnNvXqqLW4jL9RZTv4/uUbZqtPKvOF1imj/syFfg/BdkFNBS/ReOUW7XNjk25xTqTLdDkDU+ii40fNXVQzO2xUqk0j8XIBnZXbb1nkx0Szf9Vu6RY5ZC/30QofXw95zALM5EJ96LXkTnBqrwY+QuySxyjOoGD/GsDD8ZVJ0X0wShb4n3l9diIAoMunLrrDcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB5311.namprd11.prod.outlook.com (2603:10b6:5:392::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.18; Tue, 10 Dec 2024 15:24:42 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 15:24:38 +0000
Message-ID: <1b77ad01-9621-4d2e-84c0-077032fbc5ef@intel.com>
Date: Tue, 10 Dec 2024 16:24:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 28/30] ALSA: usb-audio: Add USB offload route kcontrol
To: Wesley Cheng <quic_wcheng@quicinc.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-input@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <krzk+dt@kernel.org>,
	<pierre-louis.bossart@linux.intel.com>, <Thinh.Nguyen@synopsys.com>,
	<tiwai@suse.com>, <robh@kernel.org>, <gregkh@linuxfoundation.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <20241106193413.1730413-29-quic_wcheng@quicinc.com>
 <1a361446-7a18-4f49-9eeb-d60d1adaa088@intel.com>
 <28023a83-04a5-4c62-85a9-ca41be0ba9e1@quicinc.com>
 <1644aa6b-a4e0-4dbd-a361-276cb95eb534@intel.com>
 <3e246be8-22a9-4473-8c78-39788ae95650@quicinc.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <3e246be8-22a9-4473-8c78-39788ae95650@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0002.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB5311:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d21132-a032-4522-8842-08dd192ec275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bU94MHV0N1kzNWlrWVhsQXVkeXdoZzd5RTBzV3hadUJJOFB0Yk1RcnFMQkVt?=
 =?utf-8?B?VEYzTVJlbFk5dDhkL2N2cWc3b3JtLzJkSXMvVndINVJwUDBDd0lVQ2lzcEh5?=
 =?utf-8?B?TGVFRy9pejhadXlIbW9KQ0N2dFZPR01MTlZJZWNmSklGaXZIdzVRUG9HN1li?=
 =?utf-8?B?bUtKRk5YUmVaVUMvWGJPUWpyR2lkK2Juc3ZzVzVNK2J6Y0Q3VG9rQUpkM2dk?=
 =?utf-8?B?RVdPcldhREhrczdzMndZOVFBY204M3RPY0gvTUF6bnBxVHoybDdHYVRsem81?=
 =?utf-8?B?TDZpcDFDTWtKVHRxZnhBVldjWmhUeGxSZGN3bldzamJ2V2lMSnFYbXUxdTEy?=
 =?utf-8?B?RW9BME5MakhOQTFKd1FKcGcyaGJvSko1NWxpUGkzUG41MXQvc0t4eUd4VFdL?=
 =?utf-8?B?RklqU3huaTFpNDhMbFY4NlZEK0gzUEp3dFdzME1BbnBtejBMUklMN1plZy8x?=
 =?utf-8?B?d3cxaVRpenZCUEp1c2RxUE5zOURBc2tQTkFIcmY5VkVEQzE0WGE1ZnF6RFN2?=
 =?utf-8?B?WjJQQ1l4cTJvNHMrWXF2ZGtJSkpiWENFYnhuNmxaZEx2TGNtZHI4c1FtelI2?=
 =?utf-8?B?djkyVkNkcGJBRlVOd3Z6WXNlWW1lZ2NaUGtQRWFwcTJmZndFbEJHTkUvVk94?=
 =?utf-8?B?S1dJSkFONFQwWWRIK1ZZRmJVeHVCVGNzYklyT1BOSVh4RG5GWEQ3VTRmWDlU?=
 =?utf-8?B?enQ2QTBQdFVsT0huaGh6ZUhKWGxwZUFxMUpRMGlOenBQNmxINlZOSk5VNFpn?=
 =?utf-8?B?VUlTclQrc1YwSnd5V0JmL2FjMGJqSFJrVmZZL3lnUkJ6WENNY1duYXFyY0NP?=
 =?utf-8?B?ay9XSktzWW5GY2JRcnZaTFgxVjFOTGsvbXN1V3NncW5XWGxhV1hlSFpEOWdD?=
 =?utf-8?B?KzVtaG9heDhmUDVtTzJlNFVDcTd2a002UU9HbWpYVGlyRTBscGhpaVdlenlo?=
 =?utf-8?B?aitpTUxNanlFQldjc1Qza2xhbmxPY2NQd2NkMzNOVjNYYzZIL3M4VGhZb05K?=
 =?utf-8?B?dnh5czlBZyt6NkxXSDB0Y0lNQmdhSjVxSWhkaTVKZm1zd2RUQmJjV0tSdmp2?=
 =?utf-8?B?UXhRNHZIV0FCcFppVlluVFdPQkJ3TmJSZjFkWWw2TUJXT1R5eS9FKythc3lT?=
 =?utf-8?B?S1NRTFVEUDA0RUtRNm5DTFZuRnpSVUNQVWtWQU1TVHN6dTVLcGZqR3BXZ1NM?=
 =?utf-8?B?ZDNiN093dlJkTnphcWtIRGlKTFNrd0hpT2JiVEhWRXBqRThWZEdjcG1zTm16?=
 =?utf-8?B?UVVFM2p4M24xd3BBTmdCbXlQcGcxRDJCRXpxNi9obERRaVNtN3ZZd3RiRmRq?=
 =?utf-8?B?bzhwQ0kvZ1hwRHV6eEJFM2I1RmhRczVTaUxVU2tMcDJ0dVlXSDdSbXViOTZT?=
 =?utf-8?B?empIYlo4L2JiZU9CaUMzUVBiSWhXMzM0Wnk3YjFkOEN0U1JDQzFiaERac1hU?=
 =?utf-8?B?amRaMDZlUGxhbitKV2hjVzhZcjM3NWIwdzd6MFE0aWMwSVZ3S29hd2VqZE9w?=
 =?utf-8?B?cmtnV3M4Q01pdG5JTm5UenNsTGdpT2xYOExBWUFNYmNBTlVQUWJnSlBmUWVC?=
 =?utf-8?B?WWxsdENSUytaUUxGeU1PUXdEUU8rVGNjM1V6SjBnU3V4K0lnUmNoMTc0cFJm?=
 =?utf-8?B?WjBHMFJROFR3ejdQWUFPSWRldFFKYTJrN0krOE13RmRSYllOcEVmZ056cExo?=
 =?utf-8?B?dUFENmdGRk0zcksyLzZ6SVhyc1p2TzhPRlZNS2VDSkt1WWlIZmZJWmlwbCtu?=
 =?utf-8?B?cTBxQk44U2ViS3RWVElRcFQ4V0RXaXVaNGVEZG51TFRQNkdWdVRhRG1VNDRE?=
 =?utf-8?B?MlczYW9XV1VvRmFQTFZuZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWdweEtibFNLaERvUDViM3JIQllCMy8yajk5bnVCRVFDOFErM01EWnp6eGlK?=
 =?utf-8?B?azl1NFdJRXhuckhDWEdSOXVjTXpYNWRYa3ZlQlpCWGJqQk44TTR0ck5EMFoy?=
 =?utf-8?B?NEZiak5McHdYWjEyeTQ5TWNYaVJraVd3MVpKZjdhSlVFb0t1YS9DelZSaWI5?=
 =?utf-8?B?aHpHT3ZQdE1JK0VKbHV4ZlQ5YUd4cDMyckpXYXJjbExDeE1odysvR0VtNUNn?=
 =?utf-8?B?N0NXaUhJQmFQVnpweXB0YXlxazlNY1IzS3ZiVGxvY0ZNMUZoVG56Smd1RXp3?=
 =?utf-8?B?dCswWFAvTE1UNCt0UG1aS0lSckZPRWM2QVhXS0NVeVZFRVRuaXRuUW1vNElB?=
 =?utf-8?B?NEg0aExnY0R3VFg2L2xjaEw1NitPcXovd2dGMzh4Zy95SnhxSXlydmV1M2Jv?=
 =?utf-8?B?MjZhZ0w2QmxZdFUyZkhYVUh3SmI1Z3B2aFAwVUpKQjA1VnNqWXo1V3JzUUlN?=
 =?utf-8?B?ZCs0RVVHb2didzNwaStkWmVNYnJ1dUdvQ0czOGJGK2oxR1p0TzZQekhmeWJ6?=
 =?utf-8?B?SDAzaFR4YlExQTA3YnpJY0tFdDBic1NxcGcvOEhSN3d0WlRCcVZ4TzJ1VjBo?=
 =?utf-8?B?WUxrQXIzSFBuS2EzU3Rpb2ErVEtOb0ZtQk1zOWNDZ0E5alo5cTRhdFk1Nk1R?=
 =?utf-8?B?emhJWXFWNzA1RXJZTVBjU2xPVzR2bm9CUXl3RmlISG1QK1BrbzZzb1RKbWF2?=
 =?utf-8?B?VzUwQXF0U0U2WmVadXBsbnZXc210S2hiaGZRS1JVNEZkM1M0NlBKUGcvcFFP?=
 =?utf-8?B?SnpieTB1V2tmaTZUaVYrMzBkSDU4VjZ0UHdFK0JRbW9GcGJHRG5neUVRcTJm?=
 =?utf-8?B?RTBXSE40RXRNemphQlQ5T1B0d2VxWm5LZ1lJaE5iaXVaZzMyaTZUdS9PYlRW?=
 =?utf-8?B?K0VDLzZHTEp0WmM3bGhiWTBhcTJrOU4zWWxtUHl6Y09OMHZGaVJJUzYyTFhr?=
 =?utf-8?B?RnlPU0lpRmdpcTNPU2dMZzFubG1hU1NUUXNPS1Q1L05YMW9MSklzYm9rY2dJ?=
 =?utf-8?B?cHZZRG9kdStuVnBnSG5rL0RGMmI3NWF1YWg0RTl3N0V2OWZrTlYxclQvWnhh?=
 =?utf-8?B?Vi9PQ0ZrOWpzS1lNTnpmZnMrU1N4Szg1Z1kwcnl1YkF6Y2pBYi9NYjVpVzhK?=
 =?utf-8?B?L0prZ0VXcm51TmF4SVhUbXdmaFkxRk53aXpIL241ZjU1VkM1VndodCs0THZG?=
 =?utf-8?B?dXlOdHJMUHhKVGI1MTllbnZoeXZBcHkvZHNaZS9FaFBQcW1XOS9WbjFVQWR1?=
 =?utf-8?B?cmpjcS9MOHYzcUgvdFhVL3A1b1F3NGxVN3ZJY0plRTF1WGJqVU0yUzllblgr?=
 =?utf-8?B?U0ZnMzBzaGd3RTdoeUtreEk4ZGNOUW8yQ1J6YzArOXMyNlhqL2JydUcvUk5a?=
 =?utf-8?B?amZRRkMzR25sblByQWVYeFVXL1ZYdTFoVUpRcHVJazB1dXIzYVB6VzdNOVV4?=
 =?utf-8?B?elhZeUxPbWJVaENtelEwak00TnZINXlRWjUzUkJKUzdUVldlTTNOVEpPZ2tB?=
 =?utf-8?B?aU9rdDc5alNadEJncThqNjlKZzBqSlZvZGplMlAwUzQ4NTNjT3B4ZjdmV25I?=
 =?utf-8?B?SEltNlhEVWxJV3pJNnpkK3hmOEhOY0VnUjNjWFFya1ZEMnhST0xtYnBjZzFp?=
 =?utf-8?B?NzY3SVB0eHRGRTVuS1p6K1g5Ujg5NzNsS3l0b1BrOFM0VXJlNWx2R01haVVG?=
 =?utf-8?B?KzN1YmVzZXJSY1VqeGlJWUhUUEN3OVI5RWx3SGY2TjlkajRzSWxpZWErdy9H?=
 =?utf-8?B?UGpRME5QYU9ZRE1EaGVDWHAzNGJ3S0laVnc3cE1DT3pIQXdSNm9ZR24rSTli?=
 =?utf-8?B?UGtLR0RQb0Raai84YkcwQXZZeWxpS1dkeHFaazlWYklsWG1DQWFsdTVEZ1p4?=
 =?utf-8?B?eVJjdHJ5T3JZQytnVG9MS2wrR1pjSDhZWjJVRVR0TW45YmpacERXK2V6d0or?=
 =?utf-8?B?NU5KK2dxOHl0eWZYMklKZmQ5VENYcE5SaXB2d2gvcUVpUlMvd0JJd1RsR1BJ?=
 =?utf-8?B?Z0JPNVM4dmJHZVpXQnVxc2Y5SXlFRTFZcFVVU2ZtQVRIMXZ4RUlnZkx4K3Ns?=
 =?utf-8?B?bUc1c3F0RVdjd0dWNC9IeFNQc242N29lMXNvaThCRWNuNStoanlSSWQyNmRj?=
 =?utf-8?B?NlJBQTc3VkZ3OVZMTXFFTGYrL3FWeThHMGtsZVRXcE9Vc245c1pKRFpNMTV1?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d21132-a032-4522-8842-08dd192ec275
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:24:37.9690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdt8vUNme/g7xnpuk2HfbUUoyPcgNhbV12K2rXRu/dxAv26h304cheNQRBV4m6rv2/A79tsOirL5vOC/3cevZ1d5vPlP+hugqP3Lhaca4vk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5311
X-OriginatorOrg: intel.com

On 2024-12-06 9:43 PM, Wesley Cheng wrote:
> 
> On 12/6/2024 1:09 AM, Cezary Rojewski wrote:

...

>>>>> +#include <linux/usb.h>
>>>>> +
>>>>> +#include <sound/core.h>
>>>>> +#include <sound/control.h>
>>>>> +#include <sound/soc-usb.h>
>>>>
>>>> ALSA-components should not be dependent on ASoC ones. It should be done the other way around: ALSA <- ASoC.
>>>>
>>>
>>> At least for this kcontrol, we need to know the status of the ASoC state, so that we can communicate the proper path to userspace.  If the ASoC path is not probed or ready, then this module isn't blocked.  It will just communicate that there isn't a valid offload path.
>>
>> I'm not asking _why_ you need soc-usb.h header, your reasoning is probably perfectly fine. The code hierarchy is not though. If a sound module is dependent on soc-xxx.h i.e. ASoC symbols, it shall be part of sound/soc/ space.
> 
> 
> That would basically require a significant change in the current design.  Was that requirement documented somewhere, where ALSA components should not be dependent on ASoC?  What was the reasoning for making it one direction, but not the other?

Well, some may call this a common sense. ASoC is founded on ALSA. There 
are no ALSA-core components which I'm aware of which have a dependency 
on ASoC components. You may not get compilation problems now, but such 
approach does not scale and will hit circular dependency problem sooner 
or later.

Kind regards,
Czarek

