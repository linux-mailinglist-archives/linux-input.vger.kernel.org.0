Return-Path: <linux-input+bounces-8421-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 607819E69CA
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 10:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 262F21656A2
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 09:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74E51E493F;
	Fri,  6 Dec 2024 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jv6LOqbq"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D27D1DF978;
	Fri,  6 Dec 2024 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733476198; cv=fail; b=LHhGHN7G3imb+5f6v7PBiVczNzSjURBmq3AkHW4vSVIc1Occh1j6FqgfVE/51kKNp4FOoR7mC5h0xDeWzSV0xtqWB49UrEwSigfQyDjtyiY+8HW30WttYjogSvFwkXX0IYVfA2kvv2z+0W2GiqthvMTRKp5EuPwcK3kcs1j35xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733476198; c=relaxed/simple;
	bh=0mqoS8tjvJf+Pphvjhp2oWZiX4BjLanH6gSHBBLRJlQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eDko0smQFOeXN254BL2YqWYUZ7yl45A+mB2CqzG2KW7Aaib2l97S1kHgGLs5IgRt4G4jX0X/wUXKuhmO/A5cpBZgz3+OjvvUSHCpm0BYxpXHS4I2z7GT4Ho91esiUE+O7WD2q/EqWSmvceNz3nfR+Yev/5ZNScxUED3+PUaLvA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jv6LOqbq; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733476197; x=1765012197;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0mqoS8tjvJf+Pphvjhp2oWZiX4BjLanH6gSHBBLRJlQ=;
  b=jv6LOqbqRZ20Ga3U9nzRnDMnFNe2hUmmgXcEN+v8jPv/qOVnUkZM37lT
   HoxjYaDIXpLzstY0S/yzORVD+cIPdnJLS3J1EtX3CHAnphetlyOULjijI
   yzivPoERdO4ShJmMxAkG4BHWPhPYq6wpAqW3cbOVk5NaUoPDFOvHWZ3DH
   HjTPTym90+i+iF6PCpBmpg/O27NfY5YmsOrVizlXGC9/hJXWN25rR0H8H
   VtZP1tl5cHRQQSxaz5nDW5sAgB2dHc++AUY0wq5GjyML5Q7PSsi5pbpEB
   /hkS9qBCSWQHCOiOKtaG8KyNmBOrT9DZVNUcxrDf++8SvYkwM/aF2DpuK
   w==;
X-CSE-ConnectionGUID: wAnBTlVlQzyBP6sTLpZsjw==
X-CSE-MsgGUID: E0padCOOQqCS6bljnDlryA==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="37756081"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="37756081"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 01:09:54 -0800
X-CSE-ConnectionGUID: wuhqapj3QL+3hAqJxQ07Cg==
X-CSE-MsgGUID: fJpGCB7uQRao5/4MoRjjnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="94033627"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Dec 2024 01:09:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Dec 2024 01:09:39 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Dec 2024 01:09:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Dec 2024 01:09:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQGF1qFwt9nP0k/eNQ5CsI+Y/gH8LU2eAa4AcI2lyNof2XAayHurmNFbyv4gnjSjlINIgLyLZ8SBYuiS8IaY+Yq9KZDt87NwszdcAPfvhsLmccTu/rpmDnxbTzzmIxZoeUStiUNYWIb6g1tdMhFIcaeKJ4CoL2j0fKpxs491gWYvgWoNx67Tch9ObAddSxgYzHtDnlTmewpotZisGLRWeNBx+wYiWXdJXnqESVIF83YoD7vGNs5yPNYPgsau+8lND5QqK+swNfkns7SleBd/vKZINL8OIqQ4ndiIUGxMa6p7EAi3bMwOmdhzwtxKHQ/ULCkRJX4xIj320ul93hEm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Kksa3W+mYefdJN0B5WTVSgaYTcE2zLzl/jYyb82J3I=;
 b=uc7JAgQ1PxaKzEpl7Ncs4/6yiL52H2hfpv2Xn7uHqmDTCmYlLf6tcIAHpksrgmFLqQZAmgw5dLfsdcKp/jOcf3CkvJXs0y/nwd+FkyiEI37zmnKcbjfdAwuEtqsUeBGsE0vKOejAiuLz9LEo2BGCEiIKuZtBRHrYnKWsLsCPNcZr31pX3G26L32paIu65ryvp2NEhdS7vFrZlSTUcR/hlXaS9DYXSrDI4nrgs7ODTGqZ9JttnXu5JM+aQswVM2fFOFUtMyr3jW0ZrmO1ZtBi9+saSs9VYrLB1wrVY5nKjjmhRuSXGZgweffg8rWDnAD3r2rZBh/Rox6I51o9OGHfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 MN0PR11MB6158.namprd11.prod.outlook.com (2603:10b6:208:3ca::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Fri, 6 Dec
 2024 09:09:36 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Fri, 6 Dec 2024
 09:09:36 +0000
Message-ID: <1644aa6b-a4e0-4dbd-a361-276cb95eb534@intel.com>
Date: Fri, 6 Dec 2024 10:09:25 +0100
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <28023a83-04a5-4c62-85a9-ca41be0ba9e1@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|MN0PR11MB6158:EE_
X-MS-Office365-Filtering-Correlation-Id: ab750199-d82e-44a6-af8f-08dd15d5b500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djhnUVRtdGVOY21Xc1ZNaGNqdXI1YnBZeTczY2IwbGJvVTI5SGJENmNIY0U2?=
 =?utf-8?B?Nlp1VmtzaG5HOWpyUXozQjNodUJnNUNtWE5NakxOSXh0d3lZUU0vNCt0blNH?=
 =?utf-8?B?WEdhcmRFc0x1RmtncWFNOXhkakNMMURGaVpjY0loczV3R295MTgzRVRjaUdq?=
 =?utf-8?B?eElsY0RnbUxMZnhoZE9Lc3lXbHdwMVg5ZVI1cTZTSHMvNUNWRHFGT1RFSGNB?=
 =?utf-8?B?L3NiNFRORHhVNVlKYjVqd05rLzN0STZNTXo5eDR6TnUyUjc2azZ0VWNWelh6?=
 =?utf-8?B?VEtnSFI2U3Z0Tlk0SGJZYlFlTnEyTHBmM2dFWUtYUkRLZnJrVzZRcGtTMWpU?=
 =?utf-8?B?SngweUp1Slp0dFdyaFp3TVZRdVVmcDI2SXljeDVnWjhwN1ZFM1BIUks0UHNN?=
 =?utf-8?B?cU9nN29qdmhCalJYazkrUWtLNEl4RnI0QXpScXFtSmpDMDBIc0V5ci9HcWNu?=
 =?utf-8?B?SFk0clM4aUl4bmF3dmNhcEVKeld4MUNyN3hkQm4ydGlRUnBvQkRFQmRQRXV0?=
 =?utf-8?B?cmJjSy9YSFlMb0xzWkxyMGFuc1lHMzg4TUwwYlBGQklobTFWb3BQdnBYOHFN?=
 =?utf-8?B?NGF6dW8vd3Z4UlVJZUJNR0p1VDhMeS9zUWdlYkh3clhKaTM3eDNCMDZXa0dQ?=
 =?utf-8?B?bFhJYk9qN003a1VxNDJBZUdPc05iUDRwa2ZHNklrZ0dTZ3psOFJGbUYvWEdx?=
 =?utf-8?B?UDZVbGE2Q0g3NG5UeVR0ckkzM0hMdDM2SXNpOWtOODZjTGZXSTNEQ2ZzK20r?=
 =?utf-8?B?SFhwNzZnOW5vbDRKOVlvMXBPbW0vWjNqUVZaNklDbHR5TWthaWQ0K1VVb0Nn?=
 =?utf-8?B?QWc4R3FiKzA4NDRacFl0NzNsejdlb2U5VFhKUFVLZm1LV0JySCtVdDIrNWp5?=
 =?utf-8?B?b0pLK0RxU1RrbmtEcnlSTks4MzdFeWFWRkJCcHk5UHU3bVBudUQ1ZXhzNHdz?=
 =?utf-8?B?YjBMTGxsUmdFVG4zcTRsdWNBdU5jRXAzRnc0WDVWMjUzalFHSk1WNGdtakNO?=
 =?utf-8?B?a2lvRllQeDZtOVVvTm1RQzRDYmoyMmlxZ1R2MEp6WEw0Sjc0NWZlUjBieUIr?=
 =?utf-8?B?aTJaSitzVzYyWGJFUHgrRk80azRXY2c5ZGo3aEhlblFXMFhFeEU4RnFkNVQw?=
 =?utf-8?B?VXBvaWdoaWxmcFV4M0FVZDhxWVgwWE1EOTZDMFFYTHk3cFN1SVhkWXJCcSsw?=
 =?utf-8?B?UDZxN2xNRHMyMWdhOGtNbU43aXFQY2xGTEZaODdnYTJkdkR6SXV0MnMzNUxD?=
 =?utf-8?B?WHpacjQ0N2lrS3JBUEFKUjFOZC9iMGVrVFZSS2RUUjlLaW5sd0RtNGxUbGdv?=
 =?utf-8?B?R01LdVhhWHhmc3JsNkxHVzh5UHhhZHV5YVBrcmVkS2dFeVh4a290aUVMdE5t?=
 =?utf-8?B?ZmZBZWZYVDVSUmJHY1RBOUkwbWFUT1ZHNG8vd2x1L3BaVm1DVE1Ud3NyaThP?=
 =?utf-8?B?RzdEMWZrWE5sTkNHV291SURoYndsRWRwV0JHQ2llZlNYVkhCMkVmeG1lMjRF?=
 =?utf-8?B?S2NQVU1OWGpvWDFUN1VyTCs0eFRNejdjcS9yWktsTnByZkMyS2R3ZENoN0lq?=
 =?utf-8?B?SkVBQWpkQTV1NU9KK2NYZm0wd0NpclZkM3dHU3VWL0ZyK1NHRWtialZDaTBp?=
 =?utf-8?B?OXpLb08wRG9YeVZ2dU04dmNlb2dGMnJOd1p5TVozSDJlbmxWWVZSeTY2T2dw?=
 =?utf-8?B?b2dHczkxeVcwM0J1UmRBajFMRlZoQUJ1NGdzUzVaaENFTTBnbXNFVWRkU1Iw?=
 =?utf-8?B?OTZRSlBVeEJ4eEVEUTBaeDBWSndhWk9qdlJXZWJIVEtieDR6aTRaNXVVMEEv?=
 =?utf-8?B?VEVyK3JvZnh1U00yS21Kdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2g5c2F3UHdScStYaUlubGd6N1hmSUU2dTZZK2RoQkNxaU5OSVl0VnpOenpL?=
 =?utf-8?B?OVp3QnpBK2RhbTNsQWlOVUFHMnN0cS9Lb2dvMkpVU0UvUnZjR2V5NWlhdWtC?=
 =?utf-8?B?bncxaTA2dWxsWUlOdG9JY2R6TFNjUVZ4Q3VZR0hRSjJwTDIweUxmSzFaUHY5?=
 =?utf-8?B?L0xQd0Rrc3UrY3hwQ2ZFOWJZOGtzOXpHWWh1SEZBZnQzNE9CdDFvR2xvYXZT?=
 =?utf-8?B?Wmg3T3BQc283SmRKaDRZVTZWSklrU3I3dW15TytGbWVIcHl6b21OUHlqMHFz?=
 =?utf-8?B?N3lUYXFob2diU1YveGFFUHRMVEUyL3pmZWdSZTRuZUQ2UzF6blJNUTlKMWRy?=
 =?utf-8?B?T2xZYkw0QVlLT3ZFWmcyUnlJQlprM0M4aStDeUpWY0NRcTVLRExtVWMxOHlO?=
 =?utf-8?B?TkdsdDBFWWlFb2h1NlNkaFE1ZUxkSGVCVjN3cGFlMGpoVi9Rem8vekttd2J2?=
 =?utf-8?B?aEJ6YmVINHlHZVFMaHdzRStaMEM1OGxZT3lmMmYxVmlFNURneXdlQ0oyM2do?=
 =?utf-8?B?dHFlcXBORDMyNEVBR3FFaW03cjZrWlpoT0VFQy91bENNYjZCd1hzSEIwaGI1?=
 =?utf-8?B?Nlc5a2c3azBFblJJQXQ2ZWdpRy84U0phcVJpelZJNkhYdlZsWWlrU3pyTjFh?=
 =?utf-8?B?NWQ5eUlqS3V3OXpLN1pSaVFqeGs5S2phejZaYjVJU2h6UWlYbGxwa1U4MjB6?=
 =?utf-8?B?dkxRTXcxMHdmV0ljVTJ4Y0Y4czJTcFZLeXlXT0h6aUVvNmVoMERNT05nVkhu?=
 =?utf-8?B?TEluMVdacnB4WXRvdGZhaldXVGFzRENvRDZxalRHMGI5OVpRellJbFdBMnRZ?=
 =?utf-8?B?YUplWHA0WnFVSXEwQlgwdFpuUEhZdC93ZHZRQ3ppVERXeU9qZEdLTWdSbWdW?=
 =?utf-8?B?T0RQeFpUUkZ4cWFCZWIxUFhSaHRueEdZTHpXek1FS3N5R1U0R1VzTE85TVRv?=
 =?utf-8?B?U3FXQyswTklkdGFBQVhSaUJ3b0tpRkNKcVF3U0JKOEs1Zk0zaEVJMnIzTmtB?=
 =?utf-8?B?VFY3aURvVjh1SFIwU0xSMmlWeXIzNXNVNndmUGk3RXVCVEhjb2c2QTF6L053?=
 =?utf-8?B?Z210aUwydGtmNjk2QlJEUVg2aXAxRTFFTjJuRkg1R0lwTTlESWVvUG1pR3h4?=
 =?utf-8?B?WDBSc245U2lhRzBSOVdWMUM2Ri9FN1BycXJCd2YvejFyYTFGeDdvU0tkbXoz?=
 =?utf-8?B?cTc2R0M2cUFyMzZaRFRVNDFMMW8wWjhIS0xjUnEwVW1uWlY3NHNqOXltRDJm?=
 =?utf-8?B?OCtsV0F6bHhUUjFON1pJQTZXbXlxdmFnOW9MWXU4VjQyTHF4dEJ6RU52cDhq?=
 =?utf-8?B?Tmw5TCtDR2h1Rll1TmxOUFdBOUNKUHZ2bFcyV1RyWVVGNlRYQWtqckNEcW9C?=
 =?utf-8?B?dHFLUFpyNkROVVNndjlPSC9LMjJlN3k1akxnT0tMSWk5WkhIMTZxNkM4QmVE?=
 =?utf-8?B?L0Z1L2hIMmx1M0JGTjU5RHJhWkNqQUExRkJycGk3cG10WHkyY1FnbHQwRGN2?=
 =?utf-8?B?dGtWWTYvcWh4STR2Z2ViMmdwYTZMOGt5NHg3M1ZEcTNLd1pWNHdzTHN1VDcv?=
 =?utf-8?B?RmRrL1VNVG5PR2YzR1lxQktZMDNyUUZzUUQvQ1A1NVFIT2Z0UllGNjVEUzN4?=
 =?utf-8?B?eWtubWJ4NnBlcURwcnBXQmpQdzBxQ3FLbm1LcTRDYnR3UU5UeE9MVmJNMWJt?=
 =?utf-8?B?SXp5SXRXUzMrVGRpc2JZZnVBdTFaOEMycHZ6bXlQS0x6c21ZTWk3RGxnUWpZ?=
 =?utf-8?B?TnZXbTRqRGQwTnRTOTZXTkwrL3E4TzZPTkZjOEtlSVRCcExST1FlWHVDZmdx?=
 =?utf-8?B?VGxzTzBraGYxSTBzVkFmMCtkTi9Xekg3ZUFVdkVsdEZFUmM4OTJyQXJ6MGhM?=
 =?utf-8?B?WWhDWGt3V05ZQmpZSVVzM3JiTmFKKy9IZXdBK1U2N2taR3BZMDF1Y2U3NTVI?=
 =?utf-8?B?eWZNeEErQlBYYjExaC9ybnV1dnR0V3AzR2xxczlxTDFnMW02VWtPVFl1c0Ru?=
 =?utf-8?B?MmtPYVZwY0hmRHZXOXk1aGNyUTJMWHdFdGVOaHBQOVZOdUJCZXdJQmZmNDUv?=
 =?utf-8?B?WnFQV1ZkZWM4ald5TXBnNlJJSXVWdHNHVWtwMmZmaXV1cXdlRVFDUmJ5R0pX?=
 =?utf-8?B?ZnliYllhUE95WE9ZRkpvZ1hXRHhoZEpiaHJ2ZEQrTTZGNkwwRlBqTDNwajAv?=
 =?utf-8?B?bnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab750199-d82e-44a6-af8f-08dd15d5b500
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 09:09:36.6853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H7uUGhjn0jzQGzEBdjV7m4Wp3QI7apiiPmYmNWsrmneQAfE55Qe4TW2z7As2+0x0i6+wB2FHdF58/3xB5i7VsXkPOPN7KFpbACGd8GaphH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6158
X-OriginatorOrg: intel.com

On 2024-12-04 12:15 AM, Wesley Cheng wrote:
> 
> On 12/3/2024 8:13 AM, Cezary Rojewski wrote:
>> On 2024-11-06 8:34 PM, Wesley Cheng wrote:
>>> In order to allow userspace/applications know about USB offloading status,
>>> expose a sound kcontrol that fetches information about which sound card
>>> and PCM index the USB device is mapped to for supporting offloading.  In
>>> the USB audio offloading framework, the ASoC BE DAI link is the entity
>>> responsible for registering to the SOC USB layer.

...

>> R) += mixer_usb_offload.o
>>> diff --git a/sound/usb/mixer_usb_offload.c b/sound/usb/mixer_usb_offload.c
>>> new file mode 100644
>>> index 000000000000..e0689a3b9b86
>>> --- /dev/null
>>> +++ b/sound/usb/mixer_usb_offload.c
>>> @@ -0,0 +1,102 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +/*
>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>> + */
>>> +
>>> +#include <linux/usb.h>
>>> +
>>> +#include <sound/core.h>
>>> +#include <sound/control.h>
>>> +#include <sound/soc-usb.h>
>>
>> ALSA-components should not be dependent on ASoC ones. It should be done the other way around: ALSA <- ASoC.
>>
> 
> At least for this kcontrol, we need to know the status of the ASoC state, so that we can communicate the proper path to userspace.  If the ASoC path is not probed or ready, then this module isn't blocked.  It will just communicate that there isn't a valid offload path.

I'm not asking _why_ you need soc-usb.h header, your reasoning is 
probably perfectly fine. The code hierarchy is not though. If a sound 
module is dependent on soc-xxx.h i.e. ASoC symbols, it shall be part of 
sound/soc/ space.

