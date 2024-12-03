Return-Path: <linux-input+bounces-8365-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F199E26CE
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 17:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7F7A16602D
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 16:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D6A1F890F;
	Tue,  3 Dec 2024 16:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeGUbJA6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C881ADA;
	Tue,  3 Dec 2024 16:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242447; cv=fail; b=tDfWqQV1KDvcmH2mMULcWD80GMelmwpxGWe17YyIyKT+qM659/ZSM7jLkW83NUV7tp/lKMStgkT+mI80AH3JIf2zhk67i9t3+tNrmAobyyCjVG7vuQcGdnkkh9nqq9v7k6sydnkooZHPrsaeDTyFWdBZxK/3EXzuRhr+hH2x8ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242447; c=relaxed/simple;
	bh=UG37uCPlObZ3nR+J/bbABPoZcxV9Bdh/r56KGZrKpW4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QVUhSHA7c5hSbCFmVHiNVmYmLbtPu+EDL1R4OtQ/rrdv6m6t9cwiDaN7h7Gsm54ndDoJPhmbSy0E+beMeZIu5aLeX5uf/S0zP64SgCtjJdSsWpTX0JJjgs/3CZIbgYXdiqfCMy00Znc/Czl8jDoFbrsIFrkLHooffRWyVvXVu1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeGUbJA6; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733242446; x=1764778446;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UG37uCPlObZ3nR+J/bbABPoZcxV9Bdh/r56KGZrKpW4=;
  b=GeGUbJA6Y7n17b1WL0zOdOi174gEjDtA7tAfJvthtx8fU3s3vUvlibOi
   i2X+INonyHiKdOylKX9D5M/6SbanJ3KKZIm9uAWPDiQJ8GyP2Cg36epXf
   ZM4Q0DYV5Y51BSRZFg/9qnFL6wL7O9i5G/bhZc4iBf012W8nb+NRmAkd0
   zACO/TFuli/9tH8J1SLihle9yeQPjuWpA/tsLajfHvCn7+hBRwr1NpiGS
   f6bbX7GakAOUo9NFdJe1Ztn2WduyeX6uBSOkP1PjbHWTc87pdUycRdzkt
   yj6DSksFgTo4twR8Kn1sTkF5+al2XTo2BvlBqJztmFU4pesw3hI+hCPoD
   g==;
X-CSE-ConnectionGUID: pU/H/2Q0RR+uMqhiTS9Sew==
X-CSE-MsgGUID: icyAEYCJSpy8/hB+eC+fDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="58867789"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="58867789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 08:14:04 -0800
X-CSE-ConnectionGUID: FMngz3vjSUa7QYnVzIZOwQ==
X-CSE-MsgGUID: d8wvUMxIQ8KjGdir47/NcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93575076"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 08:14:03 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 08:14:02 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 08:14:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 08:14:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iN4k9rLvoI7SOBCg/aJtQZaOzjDQhGxSynHYZrqD+qQ0x+UCzEGwwuqAkxieigx8RPTNhCmtxXJQnCnv3/yq+OAWMhZJj+U4yOvpyoqAA9fOdQmxdMgTY6//g3thP5PGfDf5I7uYEJ0AyU10/GMYbwjd+e6J6xmtyqTQjkugwKmJJdzT+7h1cYR8uP4Un5jD7N7EXEXionXtDzc1CzyQl1IC5ygg3rzSzgjjKr306bVPVSG5lvr7XqGKjaip3X0XtgL2t0NPmMGYmbqsJawpy61hjd+2vHwWXt2wa87teNoF59F52WPwV9RqIFuhUZcuDCp3NEQg/ALsaucdDSFv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DP/yOKI3Q29Sz2KPoaK1WmtM287IyyyorjWSaB/o8QU=;
 b=g/Y9KDTULYFPdCvvEGaKsg95Z6mKmPmsATeTV+vXXHnP7iIfW5yob8oFmXSw76aT8URnuuNpZdtfSU4KTs9UYsfd+cDzt4c7vqgbALEEF3wPg/n2hfZW8I4niGhwHHyIHmBkU4IdPGuoVzi+Bf5/OooOAWED/9PGEAm1Um/MUuamz7eSzoWpo3kmZ4UApdPmpvSgFf6z+6Me6yAI7smD+aiCPb6UmkzxocvZr24e16ks7cOjUOghDyD6bLKJO6jVcSJDXZlQjhXdZCoMQ+BzzTqTe57LWH43s4xI8aMRhzq10azLQM0w/hrZODHtaxeYbz+dD7omTXQ0b5zupFXTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Tue, 3 Dec 2024 16:13:52 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:13:51 +0000
Message-ID: <1a361446-7a18-4f49-9eeb-d60d1adaa088@intel.com>
Date: Tue, 3 Dec 2024 17:13:44 +0100
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20241106193413.1730413-29-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::22) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 98f0a1f7-3e73-4c32-d15e-08dd13b57a1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2dVdTVmL1IrZVBESURxY1I2N2ZlVkFEcnVha0RTeUp4WGdSeVJDUVU4cjU4?=
 =?utf-8?B?SkUvcHJaZlhKQ0V6MFdJTlh3V1pvcXlRSjhTUlpLZk90UDBxZGxzcGFVTHdw?=
 =?utf-8?B?ZndSWmtMTjEwU3p4OGVlVmxzdXNMc2RmY2szZFB1M000WUJmZjhHb0lTcGdZ?=
 =?utf-8?B?NndzaVVhSjBDRHNYNVVKdHdtczZxL2F1ZHR6Y3N0YmxDMzF1d2d1eW9MUmQ0?=
 =?utf-8?B?eHN1NDFYVEEvSlBCNmlYano1SUVuQTZlc0FpV1FaZzRVQ3U1YzVpZWsycWMz?=
 =?utf-8?B?dVJrdlNZYWxtMWFiWE9yRklicnpzMUxENldrUWZrd1lzVzVERWxqUVIxaFo0?=
 =?utf-8?B?NGo1c0t3WkdPMFNZUzNicnkxZDZjbFhvcVRva21XYjJ6ZE16U2F3dE1mK0w0?=
 =?utf-8?B?dndGVTFxdzFzbWlsR05UWXo2M2F5YnY1VVdqMUNHU3RTM1JqZGh2TzZidDB5?=
 =?utf-8?B?NXJ0Wk45NlhWL0JZMmphZFZsUXpGeDBsUDgrWXVYWUZxUjE0QkhwbGZPM2Fv?=
 =?utf-8?B?eW9BdTkxS0EwRlc1ak5mbmFERDA2ZExjWXNrRU9FejM5cktwbFJxT2J4QXJi?=
 =?utf-8?B?UHJTcXBoVmw3SSs2Y2ZjVkk1SkhVblBESXZSV3ppbzJhUjVNb29id2Fjb0VY?=
 =?utf-8?B?aFp2ZkRQcmpBWG05SW45TXhyM2xxRndWVzNDWGovMjdGbUdjeDdwVVRta2xE?=
 =?utf-8?B?WG9Fa3BsWEtnckpOWk9hWHNXK25SRzAxVXRZKzVSZDlPWkFndG5vSS9mWWdx?=
 =?utf-8?B?c0t6ZlJzcWpKa3ZYcFBMdGJQOHhnV0RGWEFKSmdvTU13STIxMHFmdjNaYUdu?=
 =?utf-8?B?SWdkRmROYWw5cE5kMkFvZTdjM1hwSndUVFR2RmVsSDA2ZkdSb0JBdFZQSmJh?=
 =?utf-8?B?emRoV2c5U1hWZXhXOEZPNTg5MjMrWHhiRnRwdDNFUzdPcUowSkFJODZVTGZJ?=
 =?utf-8?B?OVN4a09BbzI5cnovbUh1THBqWERyRjMwaUxxeE10MFhtVi90NGk0RHZFUytJ?=
 =?utf-8?B?bklNMjI5d0ltLzFyeUdxZDJWY05tSXJlSjdIb2V6d3hHcGtwZWV2WnhpdmJ1?=
 =?utf-8?B?Y1h6Z1BaYmJaUjNTc09TblpYMVNuZUNGaE9CbExXWWRCZE91UFpLN3dtcW1n?=
 =?utf-8?B?SnhZMUVEL3plMW5tT0FCY3BKUWxFejQxTG5qV2gxc3BvYmF0ZFNpNnhUdVdv?=
 =?utf-8?B?UlZYWlQ0WlVES2V1bjNGcWdlYlY4b3V0cnBZZ0xkUzZMUzA5M213eEhERk8v?=
 =?utf-8?B?MXNVVTRpYVZONUpkbEdRSStGdGRMbFFPNDZUaWRqa3IyM3ErcGxSdU9zR3Nl?=
 =?utf-8?B?UnoyeEdHd0wyS0ZxNWdocVJkem80L0FMK1Rjb01rYVl1cnQ5ZzNvT0dVYzI1?=
 =?utf-8?B?cnJzeGM3RTVweXBmaWRHRWcxRFY1QUN0Sks3bEhQYVZtenVFZmhHWW9HYmJy?=
 =?utf-8?B?ZUJlckRiaWEyTWgvVEdGZVp1QS9FWEtwOHlmRERDM1F0RGNGSitKWlJQR1FE?=
 =?utf-8?B?RHRiRldTQ3E3blliZW44Q2JEeWRMMzE4aXNIUCttemlSeXRPRjloSjlEUTVD?=
 =?utf-8?B?bnZKQ051SGN4MGVXRDcwMXAybkZIM1BmanhqQ1JlUFBUUXNtWk83QnE0L1NB?=
 =?utf-8?B?WFNVN0ZYSTZ2S3BZZncwemVlTStwSW5tVmlYV3AzY21RcHZjU2dsWWhWeUdK?=
 =?utf-8?B?Y3lvVXRUNjJzQXcrWnpLZWJlRnJNNDJ3OVR2WmRLK3o2ckRSbEFrNExvckd2?=
 =?utf-8?B?V2R4ZWJHSGR4WlhUR2dWclJtMnZGYmkySGpjVFNlOGc1ekRySWJ5bnQ0N1Fn?=
 =?utf-8?B?ckxQWUp5aHNJaTNncGtkdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHpKYWdOZHVqTnFuaVZUcEFuMjgxVVJNNHRmeFZRRVh2WGNVTmZxK3Z2T2hI?=
 =?utf-8?B?djl2WTZQSURlTk85U3d0SHlOQVdpWHVoM3Y3SHg0TWVyYjN4Qi9JQzAyTnBL?=
 =?utf-8?B?dTNIaC9GaVgvNk9QNlpCWnIyc1R4OXhxSGVmc1lWNVZXQ1MzaXJ3bm1Fcllz?=
 =?utf-8?B?UE9oZW9JNHNrdWwvRm5zOHUwM2NQMmpOd2VBSDhoUVEwZGpNcy9ybVVkZXpT?=
 =?utf-8?B?TytLWUxEc3ZoMW4yVXBvV0pNYnBORTN5OVhkSWo5d1FpVGNJZ1lsOEdLVUxT?=
 =?utf-8?B?V2w5Y0FTK3I4d21NM2dheXgrTEJqODZienZzaEswa01qODBNMzUxNVNITFRi?=
 =?utf-8?B?M3pneTVIWmY5dVVrZGR5VTFnSDB0cEN2U1NjdU4vOElIa3BPdFBwTkFxZGt3?=
 =?utf-8?B?Ynh0WHBObVJLQTdXVk5Pc0Z5bXc0MmFqc2ZEN213QzFMQ2VWd3lTSldJNS9O?=
 =?utf-8?B?Q3dnb1VPellMZWRlNmI3VVp2eHlCM2VmMVJaQlM3ZTBjYm8zNno3M3cwRXQ1?=
 =?utf-8?B?Q3JEcVBhVlRFejdZa3ZDQWJqSWZjcDZ1MHVaT04vQ1hxZjhUR2M4bGdCVGhJ?=
 =?utf-8?B?V2N4QjIxdE11MFp2V0E0WUdLeER1ejBSZlZkWWdvWDFtWG9yOXJ2UnFkR3F6?=
 =?utf-8?B?bEYxZ0xlZlNwcUFITGpDSUdCblNTR0Vwc2hQbmxVMXhvRlJWNTc5MmE2R3ox?=
 =?utf-8?B?WEJ4UjRrZ01xaTZNK3Z6TVBRWVR6SnIrVFdTQUkvWGJTYUN3QUZhQzBoeGs1?=
 =?utf-8?B?dXNGUk5kQklEaktLdTBVUUNEb1pqbEhTVDF5TDFrdytIc1hkTG1VeU84NGlv?=
 =?utf-8?B?Z0I5d1lIbnVJOWI0ZVJhWU1rQWpDc3RlTlcyMnFHVFhaVmhJVUZuYVhsa1FM?=
 =?utf-8?B?VmJuamZJSDhMbVpTSEt3WnQ5TmdvYzgvbDVhUXRnWG43Mm1nWkljTjdRUUtz?=
 =?utf-8?B?YUNGNmVnbmZBdmFkZWVlYmY5VDc1bmYyVklldHNaRnNNMVQ3VVIreGRDWDdy?=
 =?utf-8?B?dUZTY2FsWHlha1dBZGcyaFNkOVN3NmxLcEpab3VDK2NmUURGdFVmbWtTcFJp?=
 =?utf-8?B?UC8rL2k5aEEySHIwYWMzejd1SG9qbE9aNkVSQjBWR3lDdmk5WW9aUDE3a2V6?=
 =?utf-8?B?cURVSENHZ0hVczVPUEJSRHg3ekp5bWNsSDBXTTZsQlhhQlpNS0hMNTNWTUw5?=
 =?utf-8?B?eEVlL0V2cWp6c3ZVOUFhZXRUYkZBbGRzVW9KcHNnTUx5Y3Q2Y0MwVHFlWjE4?=
 =?utf-8?B?VWJkU1FLUEZlRUx1RnVZSWFyN3RTL043c2laLzNMS1k3Y09VeWxOT1NLMmFD?=
 =?utf-8?B?Y0xBWDI5OEthaWlWTnFSMlBObkhqMU0wTnVIRVJtZEJKeW1rd3pVNGlMdkdM?=
 =?utf-8?B?OWZwWmRvYWdyRldQd2hMMWhWbnBPajBqeXdRbjg3K3AzRGd5RlJFWTJCNnNk?=
 =?utf-8?B?NUJnc3B4KzNIbXRkdXBIRHZtUXFsWUtXSHFpTUhZOUJoaUpHS05xM3NyYUVL?=
 =?utf-8?B?THoxK3R1SDBYV0l2MTJxTzhTcTV1TDVtclhPK05FK0VNOHNwcGcwcTRRVDMr?=
 =?utf-8?B?UTQvM3F1UUZhRk1LdUsyS0xiQmVJczZVa3JRRzlYbGE3UHdvbFlJaFk4eXhJ?=
 =?utf-8?B?MDlxQlIzSkJqcTROZEc3dmF4c3g1cHV5czQzTkxUUlhkdkkwQVpVWW02U1NL?=
 =?utf-8?B?K3FvY0UyVk96Z3FUOUVNQzk1R0FPMFB2akg5SmF2UHBIM3E2NE1lWUVFU1Nh?=
 =?utf-8?B?VVFCSUtuall4T0ppWllmWVF3YWdDMk1saTlrSWdPeUFpTXRCOXVNL1N4OVFt?=
 =?utf-8?B?eEZUQ25heEllYWZRNkZCMkZad3dLRGEyeUtOYVJXRU1CZVRyR1Z5ZDBuUW9l?=
 =?utf-8?B?QjcrMEhFeENlMDNIbllLU09iZGJnK3FRay9Lb3dIWVhqNVJzTnJBMDJrR085?=
 =?utf-8?B?YVlid1pKcXZ0T0VsM1cvdzJyYWdiVmFscmo3VTJaTjlPS1NQZnhmSUZwZnhs?=
 =?utf-8?B?MTZWL2U4TDBSNXdZUVhhcUdlSVBxVlo2eHlUZG0waGFxUjhLUFQvU1lBZllY?=
 =?utf-8?B?bXREbDVVYi95MnprUUFQaHRNTmlzSldmbTNMUVhzcy9IZVh4aVpyblhCVTEw?=
 =?utf-8?B?eVNZblIydTlRSlIzM1drVVJqNXBobDNHVXJGaVN5NGVTVU4rcVZDWElYUzFv?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 98f0a1f7-3e73-4c32-d15e-08dd13b57a1a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:13:51.8079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTdkAeIX6sCYEDTdpywOHcA3HTNiv8US/xc73QB1ygyawPpNaO2tnyRSPz/Ohg84Hp/81Tlku2dmUdnAsAPLE8VC8tpGIgOt81l/697RshE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
X-OriginatorOrg: intel.com

On 2024-11-06 8:34 PM, Wesley Cheng wrote:
> In order to allow userspace/applications know about USB offloading status,
> expose a sound kcontrol that fetches information about which sound card
> and PCM index the USB device is mapped to for supporting offloading.  In
> the USB audio offloading framework, the ASoC BE DAI link is the entity
> responsible for registering to the SOC USB layer.

...

R) += mixer_usb_offload.o
> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
> new file mode 100644
> index 000000000000..e0689a3b9b86
> --- /dev/null
> +++ b/sound/usb/mixer_usb_offload.c
> @@ -0,0 +1,102 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/usb.h>
> +
> +#include <sound/core.h>
> +#include <sound/control.h>
> +#include <sound/soc-usb.h>

ALSA-components should not be dependent on ASoC ones. It should be done 
the other way around: ALSA <- ASoC.

> +
> +#include "usbaudio.h"
> +#include "card.h"
> +#include "helper.h"
> +#include "mixer.h"
> +
> +#include "mixer_usb_offload.h"

