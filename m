Return-Path: <linux-input+bounces-13678-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C4DB0FF0E
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 05:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16A653A8C63
	for <lists+linux-input@lfdr.de>; Thu, 24 Jul 2025 03:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B45019F424;
	Thu, 24 Jul 2025 03:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YRKzGafI"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D451BF58;
	Thu, 24 Jul 2025 03:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753326441; cv=fail; b=pC8cbbSFWjvnTOWhSSAJ3tVy4xlaQVN2CcBfsFA6vX46fzJaayigav1fHfTzgpuzlG9fhOju5D18ruxHfUD1DvbFx/5Iu6caAkWRbR/kdQEhaWURMupR+hlD3ScURSy7fqozXxbI2l8Ga4kC5bmQbitCk+bJubx7KUHBBjGTPec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753326441; c=relaxed/simple;
	bh=KVGBCC6C3l5lwIK9rovmfRtZyzsD3t06FcJZsZTcA+A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qb5HCgIQGjOtr5eImKEcjPynCrL3rR1ySa42UkkNEhzv/S8radCLLcd8eyk7TMyWjbWvf6YfjqvpTZn1wH2JLe2h9pGYRhQc3h2q71jolXPbV6G0qLt6i4RTa8W8QApw0HeWnx3Vz2x3cl5ATgUdo3s0bzLxxNkQZPbV4X2unR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YRKzGafI; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753326439; x=1784862439;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KVGBCC6C3l5lwIK9rovmfRtZyzsD3t06FcJZsZTcA+A=;
  b=YRKzGafI7JIfs5hVNWFYbuCSqTPiKT7+gZt6HuyT3edhgLJ1Ll0M7Vcq
   BPPr8bsMoMsBRTAh5207Wdu5qpQGq9AMeQO5qG4BKLIz6ozVxbafuxEqs
   k9bDDVIA8rFdPgqsmPf/D1ooyQYXDGWWWxTT2r8VVBg4Dxq7vtTA1TEyT
   H9nsxXtyT1FC/EdExnhqMkpbZ88VboQnJHSjIOyjGXI7YGO7FLwCBNqlU
   JvSiGYrrDQTly6Fnn+KKOaUYtk2PNDUtt3sED3IoVoheWNOgmcaslJ1D0
   8FMQYGMQCJXIXt/m6IJShlJYUYxWjEESXZQgq/sNSxcqI6pdM4Fl28eEC
   w==;
X-CSE-ConnectionGUID: 1B2Um6uqR56Vr13ToXSAEQ==
X-CSE-MsgGUID: CKF5l4tgSXuUNuNQsa3L/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="54718272"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="54718272"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 20:07:19 -0700
X-CSE-ConnectionGUID: KrHwfx1/S5mxsAcFZM0ymw==
X-CSE-MsgGUID: Lk9NJegoRUuDiECLqiof/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="159666149"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 20:07:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 20:07:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 23 Jul 2025 20:07:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 23 Jul 2025 20:07:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfo/MyizV5TYuHPoCkLdpKHXJyfVIA6I2F41Rjs9cdR5+EPZcICJL8vRrP5aEl7haW38hLGTlXe+DSmYR9YPe4/uXfoblJ9gh0QPM4KyPgueS5v+Q4GOuuh4E8DCh/4UqDqDJZe3w/unDWJROM/p5UCBZpHC45QQW2HuaErBQ0lergVUPXH+7sUybXbfuhfSSHl8fkKFZ7WOh0kjXb3Int2/Q/0KGIWp8VCR1QTG018P/BOxt5KbBTKxd8g0628aOh9aLKldMua9EUr+LXzKu5samPF2cyUJzSCZ/iqP5hBHAa48FDR+pkqkVS0cOnKSP7Wp/59lbRCguvUObMq6Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVGBCC6C3l5lwIK9rovmfRtZyzsD3t06FcJZsZTcA+A=;
 b=t8KyH3DmaOn/Safx/mhImfk6d0cn6EE+2hRT2nCKc3s6jk0BfiVBglPmFQEPz2USoF2ShdnXBGEDus3aLKYA9amCOfXtJg++4kj4CGmajl2gKSYlRvU1J7gHAw9cRfLytQjPwQBqPqyu7hi9s2w4kOV2pzuslX8Y8sh8p83OgjNrpUeC8XQyWTfKbilnl4MbjCsIwqPrhBbIuGSYQmUAIeiCx4RU93zYV5iVsR83b+uLZhMPdqJOpH9sb0s826VpxrbTRKPhbLKcOS29DFPbzw+8hCtOm/fxCBqEX0Fr9hX1OAxzoaNZtz+gAJvWeA67PbJSjx+dUJP/ToMWssnaPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 24 Jul
 2025 03:07:10 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 03:07:10 +0000
From: "Xu, Even" <even.xu@intel.com>
To: "liu.xuemei1@zte.com.cn" <liu.xuemei1@zte.com.cn>, "jikos@kernel.org"
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: "Sun, Xinpeng" <xinpeng.sun@intel.com>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"liu.song13@zte.com.cn" <liu.song13@zte.com.cn>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: Intel-thc-hid: Intel-thc: Use str_true_false()
 helper
Thread-Topic: [PATCH] HID: Intel-thc-hid: Intel-thc: Use str_true_false()
 helper
Thread-Index: AQHb/EPPSWtVozJlMEuEL93iMg47d7RAlkCA
Date: Thu, 24 Jul 2025 03:07:10 +0000
Message-ID: <IA1PR11MB6098588380705B3778770C46F45EA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250724103626535JRNAc8OZvk4dXKn-b0CVZ@zte.com.cn>
In-Reply-To: <20250724103626535JRNAc8OZvk4dXKn-b0CVZ@zte.com.cn>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|IA1PR11MB6291:EE_
x-ms-office365-filtering-correlation-id: c530283a-cfeb-4458-3197-08ddca5f2e2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cnorSUVqL1p5R2JEOHQxOHpQVExhaFlEdWJ3WkIyL1V2Tjc5NC91U1poelNj?=
 =?utf-8?B?NVRUd0kzSG05cWUzemFXMGgwWUtLbmYraERxekJVNUFPcFBRNEtUZGs5cSs4?=
 =?utf-8?B?d2E5My9XV0xsTW9jcVRMT2RYdWdxZjhubWhOUTFPMkJxM21EWVVCNVUzajVI?=
 =?utf-8?B?M2FDMERXMDFydDU3bFRLL0FBRENBS1pVVnNIOUorQWlEQUQxZmZVaU9Dd0pj?=
 =?utf-8?B?dFV6VUVSSjM4SjY1alc3akU2T2JLSHVYYjZ6WFR1ZVNPSVZwdytUZkRNVk92?=
 =?utf-8?B?dFo1V1hWZ1krc0wyMWRMTkVNUTdTd2hYcnp0TWN6bjVMdk94YTRuTjVwUFZx?=
 =?utf-8?B?L2NGWW54Nk9zVjVkYm1ueUhOeFcwQ200ckMrVG9QN1VRcUdVa0xySXloZVEz?=
 =?utf-8?B?cmJBdXhBeHIvQnpSOVp2ZGFVeWFSVGVmemw4TnlUNnE3c0tLYXpLRkROVjhm?=
 =?utf-8?B?ZVlMbm9td3BLemRyYlptTGw2RnpsZWZWQ094VnBMMWJjdWZOUHEwVlc0S3RL?=
 =?utf-8?B?T0J3a09GeHhhNkVKZVBkWVRZQ1lsazVUOGNOVU5rMDkzek1KUlEwSFlESUht?=
 =?utf-8?B?M002T2d2anVldGZ4UzBpckNFeWRXMmlyMitTMWlPNWdnby81QWFuS0Z6SzJo?=
 =?utf-8?B?dHFLWHBiU0QrMUlGMVY3RXBlQ2hDbCtsdXFDMlNlVzhtUFFraE9TMkhDWkhL?=
 =?utf-8?B?TGUzWUxLS3Qvd0trS0dmLzBLZjNpOVBmMmp0UWNkeDhEcmZ6Vno1OU1YcjVi?=
 =?utf-8?B?b2E0Mm5XUURycFI4ZDZIVmI4aVRjM2JIRWd1d0Zpb0RTNURYakR6Y2dkTERE?=
 =?utf-8?B?NWQvNHJNVWd2Sk9MS2dpeitFKzVWSzV0Yk1YcXNaTi93Q1AzRVI2RHB0R3JZ?=
 =?utf-8?B?cisyNERKOUVqTGhqY1NHaUZVUG5BbW0vdVBPdFhFNk5BcWhjblZzUCt0QkM0?=
 =?utf-8?B?RnR2WXZOTFpNNEN4ampkZW9tQWc5bUNCU3BBcTBnZ1NDeUZ5enpDck9acHla?=
 =?utf-8?B?K1RDU0NlQmRrZ1IwekNUdDFKT295SzdZV3E2YXY1aWoxZHBrbE15ZldHOEZw?=
 =?utf-8?B?bERpSkd5VkFHNnVtT2JVNkt6RUg4UXd1L3Y1VDI3VzRCejVRNzBTZ1NwZzJR?=
 =?utf-8?B?U0hEekwvMk1KTGdUV1hUZUxGaVdldFpoSWF6dHV3Ri95TFhHUlBkdFl0L09Z?=
 =?utf-8?B?WGlsbytFUW93VUxqMUd6WVVEYW90MjdYUVFsQ0RGcVJCVXdUN0lyOW1BUW02?=
 =?utf-8?B?cjVmME1way9BMG1pMVROMFdSYXpVeU1DU01HdldWTktzc1N1Si9sdGRtaHVz?=
 =?utf-8?B?TzFhVkVCMnhHa1JmVlQ2TFlTZXdWeXJJaitHbkJTNXlNWXN4OE53L09HYUVO?=
 =?utf-8?B?MU1raVd3NCtjRWhqM1RKeEdpUURyV1RUWjFvbjVwNGplbWZSM3ozT05oK0ZX?=
 =?utf-8?B?bDhsclY1L0lTVFAxSTc3b3hVQUFRMGlvSVhsMDJOTStDZHBtL2tyNTI2Snhw?=
 =?utf-8?B?Snlob05Cb3UyRC9uOWZ2cWhHeHBpTEJhOXhRVDlnMFdvelZmWnJoenpDRGVR?=
 =?utf-8?B?a2xGMk5mTVExY1BxVFBML2lvQjJDL0pHWW9sdFF1S3BhUkNLR2prVWtwRUJi?=
 =?utf-8?B?Yk1lZG9VOUkrTFFwRnFpR20waHZ3ZjlyRDd0Q1pTalEyNWxhbGNtcmRtSy9F?=
 =?utf-8?B?cGJzdTk3OUFuVGNldnJJaTVXaTJtdjhCZ1FQb2hvU1BXN2VCMXFTSlBpc2tq?=
 =?utf-8?B?RGppdDJHUDFXRjdLVDlEaWZ3Qk5zQnRIVTFlQkxYQXRUb3VFMmpLbE1TZFpK?=
 =?utf-8?B?STlDdERkVVVQeG9hU1JLVWZURS80M1FRK2NJaEp3aHdYcVBjdHJWdDMwNytx?=
 =?utf-8?B?WDhXczBKb0VBM3BQVU1hZnJIZURTWTNFTzVRTTdpRXdhREltZ2pFQmE5YU9j?=
 =?utf-8?B?SHA5dUdNY1dvRWx3cUF2OWorZUVHeldUTlpab2pzaldpbmt3NThLdjE2RXBk?=
 =?utf-8?B?STh5dnU3YnNBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2FYV1N2L3FxeWl4eGc1T0JBMU9FWEdJN2tzbGt6OTFOMjJWQ0w4MGc4OVVF?=
 =?utf-8?B?THlWTms1Qm1OSU1lY0V3SnloNFBROW1CaU5sS2p5bWFmWTNvR0tpa0NnanBq?=
 =?utf-8?B?YXByNDdSTUd5N0NUYnVtN0pZeExqckhXZ21ha3RUUUkwUjdMS1JrWWJWc01l?=
 =?utf-8?B?TVNMbWh2SEo1VmF6QWhYeGw3NVQ5bWtTWmFrUEplaDZHcFI4RmcwWDdhOGZS?=
 =?utf-8?B?bk0ySzdCRUtDK0ZkdHJYcXVwMjdYekhoK3hoZnE5SDB6MnhScDRsZmdzaFox?=
 =?utf-8?B?WEZ5S1lNZzVtamNPTG85WElQZ1dBS3FMUzl6eTVaOXNUVzhpM28wTHdiY2xr?=
 =?utf-8?B?WEtQRXdib0FaaC9kaysvR1ZDSDBUOEtKV05SVTVzMHU4Uk94VEMwcTlmZVVG?=
 =?utf-8?B?WlJZTFl2cGhkNmh0aWdzRXZkTmxYbXNGaU9ZUlRycmhtNjJxSWZocHBOZDY4?=
 =?utf-8?B?NDl2TkhzYVRZb1NGOWZiRWplSDJWM2VSb0xyaTdhRnRkaTU1emdUNktVNGZw?=
 =?utf-8?B?aW1mdkVub2l6NHR1ZG0wU2srLzlmTGUzSk1BSzdkQ2t0TzNqSGJENURXSWI2?=
 =?utf-8?B?SURmQU1XMDV2RlUyeU5WUUF4TEcvSWlaSzBQUUhUQS9JbVF6QmlwSGxQSWMr?=
 =?utf-8?B?T1p1ZENYbXhBMTVKT0xaVENQQWY1NlNQUHU2emRvTlZyQ1NWb20vRmpZcUFW?=
 =?utf-8?B?bjNidllMY3NlQXhHRUF1eEQvRmcwOHVaMjRvVTBoZENqamdBNHhIbUdGZWFu?=
 =?utf-8?B?aEJDekhwOTkreWM0bUMvc0xNSDA2WU9jTXNwbE9yVVZwQnRIWTFMd2ZSbmdS?=
 =?utf-8?B?VkpFSEVGU1hJby93V2ZhK0wzR09leTVjbU42ZDFncWZudUNEVXNpd1A2c1Zl?=
 =?utf-8?B?SXlaOUdWb2FmQjNUcHVxdkVYaHBxTzhFaGlpVTNPNnQwdHE0MDRBNUxxcjAz?=
 =?utf-8?B?Z1dVUGQ2UlZFTHI3bUY1UzNicGRXeExrejcwRGlwNTRFV0c2UDd6eEhrK1Bi?=
 =?utf-8?B?cHMxS25CQnNmYW5ZQ3h4NFZLSVBpT1BPYzgyekFkMDV6YytyMy9JSWtuVWRi?=
 =?utf-8?B?NDZkZ21mNHBaZ25ITG1SYmZ4bXRDZCtBMDNsRHp1ZlN2WlRvamVMYzdCT3lS?=
 =?utf-8?B?cEtXZUhNN1dld2JSUW5wMlhJSnBWMmlLSXJoOTNGOGdwNk5lR3hQVE0zamZs?=
 =?utf-8?B?REpGWEZsVkVSL0hNVGxCSC9QY1JScEp2ZC9sNTViUWdVU1p4QmlESFE1Sis1?=
 =?utf-8?B?RXhiUTdiS0V3SXBSNGticzE3V29DQlArMlRNQ3c4OGRzcjJDaUlEMFkxeDds?=
 =?utf-8?B?eS95S3NybXpLdjhORUh5akRHcjZodVRZeFcyaE1WVDlJVmt0dll2MXpZdU95?=
 =?utf-8?B?Qm90Y1dkZS9UWUlJT1g0bWtPL2IvL0VJWVRDMG9HTUgwUlNXdS9mVE1sWHRh?=
 =?utf-8?B?Y2RHVUxEUXptNDFLNmJYdk93Q1FBcFRnVzRpdGlBbFhYMU5JVEpMM2tRVGxt?=
 =?utf-8?B?aHlHWTl2MkRIdjljVWd3dkFhMTRIVk41bk5kQTZReUR6ZnhYejFMYjQvMnlY?=
 =?utf-8?B?dW84WHE1bGV2ampuMzQvVlVxeHNMZ2pNeTlCNytFc3dYSTV5dVdUV1ZOMStt?=
 =?utf-8?B?ajlMYUhrN1RyeW5wZ1ZKeHJsNnJvaGF3Y3ZWWkRodWZyNDRva0w5a0prUUgv?=
 =?utf-8?B?T1FDWWIzK28yOE5ZajlscUM5RkdoOXgzZjJRSXM4N2RTS2Rta2h1aGFuTXNI?=
 =?utf-8?B?dUdNeG5JbmVLMW1lejBNT2hncytMZk5QeHRMR2czWnJRcDVVQWQxK1JFR08x?=
 =?utf-8?B?WWhaWitFNW8rMTkyNmZEcllCQnZ1VEhyMnF6WjdMNWo3amI4MkNiejgxWnNQ?=
 =?utf-8?B?LzhZSk12TDF2cWxTTzVjR0Nka09YMW9mbzI3Zmg0WkFJaFlGaEltL3BMTEw2?=
 =?utf-8?B?dXNOMHEyZDNTWnhHMVVLdDlOeU5JYzVXUmlOMVVEUlFCdm44ZUcxNW8rajc0?=
 =?utf-8?B?NlhNeEpjTXBVMEhqekxRMWtHLzFtZ3pENUhjUWdONjlWcG5lRVVDL1JFUjJk?=
 =?utf-8?B?L045RkxJYzl4dnhHdjFQalp5V2pkcXUvK0IrQlJYRUpyQ2RydWxqTlJGa0tX?=
 =?utf-8?Q?bH3MBzHQ3eo1fQPLvg4gcppzu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c530283a-cfeb-4458-3197-08ddca5f2e2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2025 03:07:10.1748
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Odhc2Ccm9qE/dwiOF2puh71hCIx6dmcFx3MHN35knH9/MJMSP51944yHy3ZVY3+cHA/9mVxoU4bLpkE/wRF+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogbGl1Lnh1ZW1laTFAenRl
LmNvbS5jbiA8bGl1Lnh1ZW1laTFAenRlLmNvbS5jbj4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkg
MjQsIDIwMjUgMTA6MzYgQU0NCj4gVG86IGppa29zQGtlcm5lbC5vcmc7IGJlbnRpc3NAa2VybmVs
Lm9yZw0KPiBDYzogWHUsIEV2ZW4gPGV2ZW4ueHVAaW50ZWwuY29tPjsgU3VuLCBYaW5wZW5nIDx4
aW5wZW5nLnN1bkBpbnRlbC5jb20+Ow0KPiBzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVs
LmNvbTsgbGl1LnNvbmcxM0B6dGUuY29tLmNuOyBsaW51eC0NCj4gaW5wdXRAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFtQQVRDSF0gSElE
OiBJbnRlbC10aGMtaGlkOiBJbnRlbC10aGM6IFVzZSBzdHJfdHJ1ZV9mYWxzZSgpIGhlbHBlcg0K
PiANCj4gRnJvbTogTGl1IFNvbmcgPGxpdS5zb25nMTNAenRlLmNvbS5jbj4NCj4gDQo+IFJlbW92
ZSBoYXJkLWNvZGVkIHN0cmluZ3MgYnkgdXNpbmcgdGhlIHN0cl90cnVlX2ZhbHNlKCkgaGVscGVy
IGZ1bmN0aW9uLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGl1IFNvbmcgPGxpdS5zb25nMTNAenRl
LmNvbS5jbj4NCj4gLS0tDQo+ICBkcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXRoYy9p
bnRlbC10aGMtZGV2LmMgfCAzICsrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2ludGVsLXRo
Yy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuYyBiL2RyaXZlcnMvaGlkL2ludGVsLQ0KPiB0
aGMtaGlkL2ludGVsLXRoYy9pbnRlbC10aGMtZGV2LmMNCj4gaW5kZXggNmYyMjYzODY5YjIwLi4y
Yjc5NGJiNDgxYTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50
ZWwtdGhjL2ludGVsLXRoYy1kZXYuYw0KPiArKysgYi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlk
L2ludGVsLXRoYy9pbnRlbC10aGMtZGV2LmMNCj4gQEAgLTQsNiArNCw3IEBADQo+ICAjaW5jbHVk
ZSA8bGludXgvYml0ZmllbGQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9tYXRoLmg+DQo+ICAjaW5j
bHVkZSA8bGludXgvcmVnbWFwLmg+DQo+ICsjaW5jbHVkZSA8bGludXgvc3RyaW5nX2Nob2ljZXMu
aD4NCj4gDQo+ICAjaW5jbHVkZSAiaW50ZWwtdGhjLWRldi5oIg0KPiAgI2luY2x1ZGUgImludGVs
LXRoYy1ody5oIg0KPiBAQCAtNjY0LDcgKzY2NSw3IEBAIGludCB0aGNfaW50ZXJydXB0X3F1aWVz
Y2UoY29uc3Qgc3RydWN0IHRoY19kZXZpY2UgKmRldiwNCj4gYm9vbCBpbnRfcXVpZXNjZSkNCj4g
IAlpZiAocmV0KSB7DQo+ICAJCWRldl9lcnJfb25jZShkZXYtPmRldiwNCj4gIAkJCSAgICAgIlRp
bWVvdXQgd2hpbGUgd2FpdGluZyBUSEMgaWRsZSwgdGFyZ2V0IHF1aWVzY2Ugc3RhdGUNCj4gPSAl
c1xuIiwNCj4gLQkJCSAgICAgaW50X3F1aWVzY2UgPyAidHJ1ZSIgOiAiZmFsc2UiKTsNCj4gKwkJ
CSAgICAgc3RyX3RydWVfZmFsc2UoaW50X3F1aWVzY2UpKTsNCj4gIAkJcmV0dXJuIHJldDsNCj4g
IAl9DQo+IA0KDQpUaGFua3MgZm9yIHRoZSBwYXRjaCEgTG9va3MgZ29vZCB0byBtZSENCg0KUmV2
aWV3ZWQtYnk6IEV2ZW4gWHUgPGV2ZW4ueHVAaW50ZWwuY29tPg0KDQo+IC0tDQo+IDIuMjcuMA0K

