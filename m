Return-Path: <linux-input+bounces-8402-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF5A9E475E
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 23:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26B89162D31
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 22:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66385194C6E;
	Wed,  4 Dec 2024 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVDjvOtk"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A4718FC75;
	Wed,  4 Dec 2024 22:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733349755; cv=fail; b=riRx/xNCO066FXvgpWwQtK3JpmM5qEkJnmjQN7zMEBuOAr4JinRaQbAxG2/KS1gwhKXkG+xiWIckyY+Dv1oU3SNlmljpzNbd7IspFzMjthbupDjcqaIc/Rz4x2E+c0RNXJPTgj7u9v4E8j9t9fn1sheO7kdqOkpYq8doV8hbTDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733349755; c=relaxed/simple;
	bh=Bp2Q10NZrRSEfE0sdy+Cd0+I73qHqEGPLnIu7Fzkwtw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I7Qf6EIHZTL5/eO7pORVfJWOXr5s5ZhRxvB1XNMk1WAXHsngbQlclXejRRFD94uOqQL845WxXe+wZ5mR7IyJyExQFdiTzqBKhBubAsNQm/y9bDLNWgmQCkOQPvbF8aaVsmWKQHDQfsyHICT4DIeY9XUyAmd9MdhKGCwCrGI4/rs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVDjvOtk; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733349753; x=1764885753;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bp2Q10NZrRSEfE0sdy+Cd0+I73qHqEGPLnIu7Fzkwtw=;
  b=jVDjvOtkZqsMBd9k1hxYC+h5Gw3u8G/ssY9a2bAA4Mlw45qy3z18fwQn
   qs87RIeWxENojUJgOqeFD0Q5y/Hd/68qb7o0/m64vrGcTNP8UTTi/dCg/
   8unMAej51EhWnkiTSPWbORiy3DNaYVtNCV6+6AubyAuhF/+LhS9cdSeKS
   vw3GGGfEH2rCCICLOihaz3q86oakHCTp5gKf/A1VmaGJOrNpHFCuVHwx/
   itufPoC1JCGBaHKzjemyzzXKwV1ZwzyKSbxRqQTAf8Z13ILWj3n3SLjBh
   NoUYboYSME30LdI3DNzBDD8IwnFzYUvvGn0ZSfHp+YcRmSbAlZKoNfw1y
   g==;
X-CSE-ConnectionGUID: 2vF65u/ST9eZdSV8pBAplg==
X-CSE-MsgGUID: fwuVSR4rS8GvTAEJW6UapQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="51052794"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="51052794"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:02:32 -0800
X-CSE-ConnectionGUID: HF1EfGp+ScGEcqVZHSTc9w==
X-CSE-MsgGUID: S94m53E5QVul0mewE+6CYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93743218"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2024 14:02:31 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 14:01:53 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 14:01:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 14:01:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CuHD0taNPFQrI/o0vIEnD4VtBO8XSPlVnzWxRQFAcHIzJzYOgKFdQneFRveNSWv5YkLp0R3oQFrZFNyZK//k3vA1fv10teqj8FP+82ycadiVIw62tFAmdYw0pXpf81Bcs6KwEE254/sx9MGltecaKkYpxB9z9N8r7WZSscrbeBvwxi0nArsgCTjr6as38p9NlYEGdVaKMt3A0HJueObEH40rVmxZiaVC4Lb5pFh+INJtpsfkuD6REC4nEjXYP2wwTIQDjKRLR+1ZmU768mn4SwXgiSMB8CsgForkzJjdMk91TndwJ7Zu/cX9PqByovm5WDrmRvu45AhkwRJAdpC79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPj6sNa8nkZ/PghfjlRootnTXKLi1aU8bo1N8+b8cGI=;
 b=orXfxkc0CcnhGk2J3+ZldQZXveqB2pbrrltVM3HznDuQl0Za6sm44xgapQheqgnLgmT96YJvh32MuF0one11QDLLc7soe/5zPQkJJSAKKj/UWIQGW+vrtu3HarhwY4QVjr5M6iZvEz31mXeIkmUHnh38MTe0REYKe4xudXrfciDtF4PeNVoQtF+Mtn6KWX9DeQELnQwVybUjI33B/iwLxPI+4W0UA/UBxnEwyomAR4Ukdzk16hrD3N4TJS6/D75efMSakfsXNpBCgqHThwMB6FvVZph/xH2z3uJ7WNxY528bMZBrCQfKXqpX3NRSIS+xL8YTbA1XS+sNeWucB2OCDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH8PR11MB6877.namprd11.prod.outlook.com (2603:10b6:510:22b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Wed, 4 Dec
 2024 22:01:39 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 22:01:38 +0000
Message-ID: <9d95e6fa-afcb-4445-9fe3-e0eed95ec953@intel.com>
Date: Wed, 4 Dec 2024 23:01:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>
CC: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
	<srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
	<perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>,
	<robh@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <fbc04c06-c210-416b-9b77-a6bd8a71a637@quicinc.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <fbc04c06-c210-416b-9b77-a6bd8a71a637@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::23) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH8PR11MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: dd344714-4251-4e68-5c41-08dd14af3a08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXdmdG15d1I5SjBIeDNBUmxFMUcvOFpPWVF6c2pjbVhDUDViYTl5TUh6TVha?=
 =?utf-8?B?d2ZwcEM4Z0VLbmJEdW1zY2lYQkxZdm9MdDhrcjFZYURDbUFmZmxqSXg1UFhI?=
 =?utf-8?B?VVE2WUlmR09mWUIrcWM0SURDM3RBWGFVcVpBS2ltWDZrTTBRZ3BJSUFmQ25y?=
 =?utf-8?B?ZlBxMDVhMmc5WkdsS1BLNnlnMTdyakxsS05hK0lRRHBaSUNTY0k2eFV3M29O?=
 =?utf-8?B?OVN3WkU3bGdhZ1I2Z1YzYU9IWGJJSHkxb1VWNEtaTnBqTGw2RGE1VUlSNWF5?=
 =?utf-8?B?TmZsbWtlR1pUYkJnSHBxNW1PTUdSd24yR1J5R3RhTVRTNzQ3cnVIVnA5WFZN?=
 =?utf-8?B?QUpCNGJkQ2Qwb3owTnk0VHFSQmFsRjZUeU0xNy94QXNEM3pOTWEzR2svV1Vz?=
 =?utf-8?B?aXg3ckovaURlUzBBN0ZrYmJ4MHQzU3Q5RXROVjFCOE5MUWNhek1xdUVRZzVP?=
 =?utf-8?B?NFV2ajVJd0s0YUh6a1c4R09HVnJKUy9MM29lOWdFOC9TKzBQQ0JxWGJIQzRT?=
 =?utf-8?B?NXV6U3ovRFMzRVFpRWpvcmhxYm1SYlNXYXlsTE1mamxmcE4xeHpTeUE4c2F5?=
 =?utf-8?B?Q1RrSklmZEkyU0YzRUc3bGRjU3c0RTUxSE1CRmhaMWxBc3NVTVJZNWIxbkxD?=
 =?utf-8?B?ZjFoTnVTR2RFaTd4OFF3ZlFMUWZ1ZjF1bC9CT3gvSlM1S1BQM3BtcmRnTlcz?=
 =?utf-8?B?YnpnS1hMOTBmQlBDYzlqcXNJclEyMS94VlNtVmYrV2hqMW5DUFFHcVNTMEdO?=
 =?utf-8?B?SE8ybUl1M29Lc0dPOS9QcmRaVE9lOVFNdC91YnFmZ24vdkF0Qi9hdVhZSXF2?=
 =?utf-8?B?YUF4b21WZWE4d2F2TGxDN21UT3FpT0pYSndGLzBhN2tnU3ljVkZSMnNmSGNo?=
 =?utf-8?B?Z21VbzlYL1BJTU1RZnRUSmlObTU4MDZ5bEQ0ZHBva1l0YUFZdGg2eDRFNTZ4?=
 =?utf-8?B?MUlpV25aTjlNVjJrV1F5L2tLNlhMN2hVUXArcHB5MFBhb1NyYXVab3VUTVlv?=
 =?utf-8?B?Y1dDQ3IwSEs5YUpFeTFab1kraDloNXl0VmdkU3FaSm1tOW15YjgrVTY0SExH?=
 =?utf-8?B?NG9RcHdvMENzc2Rod1lud3E4MS92bEd1TndVYVlNV3h5L3k3cEZ4QTNQMFNx?=
 =?utf-8?B?NlVRWkNrWG9jL2dIdmZSbXJJZ2JiNzNjWUhnRWVTRStKN09xVWxiWGlqaHdp?=
 =?utf-8?B?OWdQeFVaOXYyZ2Fjc3N0MmdrdzBQUnZzaEVlM3RGTHlTKzBtcUMybVV0K3d2?=
 =?utf-8?B?QWMydmNJTHQ2WE44cnBKbTZ1Y1UvUnFjV1hkOFV4dUtJOWNjc3d0US8wWHZw?=
 =?utf-8?B?MlZiRFdjN3hNVzFFVlZJSXpSZmxoNmM0bTBvWnh4MGI2MWdYTE45OGJWMGd5?=
 =?utf-8?B?djdLcHFrRkhua2dqRmN0VVFlUytNU1plZUk0dFdXUkQ1dGJBVXhnRXd6S0Fo?=
 =?utf-8?B?YTBLOEVKdHVvdVcvSXQ5MThyekRPTU50V0owZUptSU9Idno5d2J3TlV0MXFu?=
 =?utf-8?B?VEhwSFo4VTJwVzhYQ3dPenRJSkZPNktuOVlDVzNzcVBtZTUvdWdqVC9iT3Rr?=
 =?utf-8?B?ZW4ycDkyYWQ2aDVhb3lqWngwM1NVTHNUb2I4NnFKb1JJckpoQnNsNExSbnNB?=
 =?utf-8?B?cjlDUUhwVWRMMDVXTkltWER0M3JnRjhsVnV2eStNMndPaVI5dVJEeGsyVFJ3?=
 =?utf-8?B?clNadC9icjg4TEV3alV6eTZ1TXkwejlyVmJZVmN3VTJqWUNMS05aYUd5dHhO?=
 =?utf-8?B?ak1tbExpWUpLdjNmRDlFUDNqd0pwZEVabGVza2FjMllOb1ZJN3JOTHlrb0h0?=
 =?utf-8?B?TWxNWldlQzJaaVgzdlltUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q01lV3VvUmZwN2s2ejhwODRrMzZvdzFKK01XeXdNTE1WbEpqSTByL2RhOUR4?=
 =?utf-8?B?OFBCekNqeTZhUDFlbHRhQjA3K2F1K09jZUgxQWF1TU9PaHZBL1FQSDA3bDNP?=
 =?utf-8?B?SUxtYzN0NldhRGFQZERIUEZzNGNoU3huMkZ1bTE0ZHYxVGRLdmdJMnRrZ3Bh?=
 =?utf-8?B?a3c0Yy9yY3hORFNpa0E5SVpzR2ErdFM1bW5OTHlua2NhMzhTOWJPRWdTdUFy?=
 =?utf-8?B?WnZuWWF3T2xWWmlKVlNDbTVCWjFDUHRIMWZnQlIvSVhzc0MyNHJ1UzQ4V2R6?=
 =?utf-8?B?Wk9yalFrdW5uYmJ0UmZZN3MxZTd3RFNxSEdjZE4wdkFqdU5BbGdacWcyQ0lr?=
 =?utf-8?B?SC91ak1odFZxNlJ4QXZoUkJncXZRUHNyRVpCQzUxMmhoV3kyWithb1lLS2dH?=
 =?utf-8?B?V1N2UGtqRExMVmJuVjg2SXJMM2RLdHRvYU5ranJCbXY1MlhWYzNsdklzUjlL?=
 =?utf-8?B?b0xDQTNoRllUYVhsYjB3aHJsNko2SHh1ZTdXNFZCUjBJa0tyTGJsOXdXaXMv?=
 =?utf-8?B?TzE1bEpFcFdXTXRoOXRqWnBQUFBHaXE4SkRSK0dzYUhZc1E2cGdsbXgwMmd4?=
 =?utf-8?B?bmlrZzBqNU1yNjdkd1ZZUFlxUExmUC9oTlNTbWU2WVBWNDI2dEZhVHhsZENX?=
 =?utf-8?B?eVdVeERVRmhaK3NPT0JKcm9odjN4NUtmQ3pBeWFrdEYweTRTNzFoWkZMWkgv?=
 =?utf-8?B?N0RNd1d3RkFGYmE4c3kyTTR5RFJOUkw5ckJkYTVuOEY0MHdUTnhNMW1KVEVt?=
 =?utf-8?B?d05jMmFGSmdzcnFnM2FiVHZkUks5c1RJZlBoanNBYS9MTXFvVGpxN01qd2pq?=
 =?utf-8?B?Z1VCVWpyK2FiWDFpclg0OVRiZlJJOGorR1hueGM3elU5NFNtSlhPNnZuMDVO?=
 =?utf-8?B?WU9VbVVla1JjWGZuanExMS84Umk0clV4ekt6NWdsTG5XSUhwMjBjNmV6TitZ?=
 =?utf-8?B?WXlaOWpqbk9lbENCTXgxVTM2S3V5Tmd1UWxidGU1QTZoRFljV0I2OW85MTFQ?=
 =?utf-8?B?UFRkLzJ1NDVwME4yK1dYOUw2R2VsV0xIRHRUT3lwU240YWI5NGNiMmpSK1ho?=
 =?utf-8?B?SFBkM204dTg4aUcwejdSL2d6ZzJKQ08reTlCbnViMWNnQjFxeTBJblJoUTE5?=
 =?utf-8?B?RmxxaWlGRk8wZEk2WlRqOEhLeTdGRjNTMUMxRnhiRTdyOVpFNmhYUW9VN2ND?=
 =?utf-8?B?R2tlZ0RPZVJPT3hHY2gwZmdrZTdVbStnYVhDU0FvdkZiSzB4NVNwYUdnaWs2?=
 =?utf-8?B?aEhsUGlTODU3T1YzNFJKeDhMcFBQZGc4eDAxSWFWNGtHWlRibEdlMXl0T3kv?=
 =?utf-8?B?SlRCMlBiL3pBa25QZEtIWDZNUWJRT2FtYTQrSGVLRk96OGpEMU96ajdXcWFm?=
 =?utf-8?B?RnYvOVpCenZtVUpackdVeHBQOUo5ODdVVXQ0UTZQR3dkdUpzM3RaT1NaRmZ3?=
 =?utf-8?B?NTIxY3hRNlM2Y1hqM0VRNHZSanVoQWx5RStoODY1VXkxNkkrS3ZLQzZCeVJR?=
 =?utf-8?B?M21WbC85bHFLWERUN1A1VnluQ0pnYXR6d2xRcFZ5aUVkNXM2MmxVTU5ZdlA5?=
 =?utf-8?B?VlA1N3JuWmJQNGhBR3pnbmdScWM1bWlYcmxWWi9BVGl5MnU5N3F1RkhueHlR?=
 =?utf-8?B?UnZPMERXN2x1d0dXdzA2R1dxMzNuSytHTnJDNU5UYzB0czMvdU1uZWlqeDFq?=
 =?utf-8?B?Wm5KT1NwNkFBdVd1aVRkZ2JOd1RPcE45SHFiUzlpeCtla0JxYjJqRjIvM0Vt?=
 =?utf-8?B?bWJiNmVibmFibGlQQUZpZStxSVlSckZtYU0zMDRibG5yYUg1WkZYcnBkMU4w?=
 =?utf-8?B?RlZ0dW9CeXE4VUMwQWZ1bXd1elhqWUZJTE9nTmRZWUhEQ3JpQ3E5SjVMTTdn?=
 =?utf-8?B?VUZxTDZtTmtsSlBZRTkyVnNoRzhINnZPYk9mWmFTb1ZyOUR2dFJsK0NIZmdt?=
 =?utf-8?B?b0dwMXk4OVZpSm4wT3c5Y05WZnc4WFB0WFYxaWhReGtHeDMydEhEaDkzTVdP?=
 =?utf-8?B?SDJzK1N1MjM2Z0ZyWHZwSzhWU04wSUZiTDRWa01wNVJMcm5ONHB2TXF2dzA2?=
 =?utf-8?B?YWd1VGgxSUNDV3J5WWhwMk1jN2dCWDhEbkxvSXpNcnVrZVMxWXB5WklZaG5L?=
 =?utf-8?B?eis3Wi9pdFlaR2lHNTdQSXZuZkwvQUZkMTd0VkRkTEZqaWk0YmNwNVJxSTFr?=
 =?utf-8?B?eWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd344714-4251-4e68-5c41-08dd14af3a08
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 22:01:38.4971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nbOrC68+oizyQdG1XdLvRbDt4r/KfHd5Xx8aR6NXGcQOW6FQWQMLgItivAhR04HljogYW69IWHJKs4D9QlTf1aLmh+Wk1oXxQzPpBLZjXe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6877
X-OriginatorOrg: intel.com

On 2024-12-03 9:38 PM, Wesley Cheng wrote:
> Hi Cezary,
> 
> On 12/3/2024 8:17 AM, Cezary Rojewski wrote:
>> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
>>> Sorry to chime in late, I only look at email occasionally.

...

>>> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
>>
>>
>> Well, I believe a lot has changed since then, not sure if USB Audio Offload (UAOL) was even stable on the Windows solution back then. Obviously we want to incorporate what we have learned during all that time into our solution before it lands on upstream.
>>
> 
> Hard to comment further without more details on the lessons learnt you had on Windows.  I just want to make sure we're talking about the same feature here, because I see sprinkles of the xHCI audio sideband (section 7.9) on the Windows documentation without much details on how its implemented, which is different than what is presented here.

The comment was directed towards mention of Intel, 2018 and Rakesh. The 
decisions made then do not bind us, and current Intel's Audio team has a 
clean slide. Wanted to make sure it's clear.

>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>
> 
> Just to clarify, "struct snd_soc_usb" does have some correlation with our "codec" entity within the QCOM ASoC design.  This would be the q6usb driver.
> 
> 
>> Currently struct snd_soc_usb does not represent any component at all. Lack of codec representative, component representative and, given my current understanding, mixed dependency of sound/usb on sound/soc/soc-usb does lead to hard-to-understand ASoC solution.
> 
> 
> IMO the dependency on USB SND is necessary, so that we can leverage all the pre-existing sequences used to identify USB audio devices, and have some ability to utilize USB HCD APIs as well within the offload driver.

So, while I do not have patches in shape good enough to be shared, what 
we have in mind is closer to existing HDAudio solution and how it is 
covered in both ALSA and ASoC.

A ASoC sound card is effectively a combination of instances of struct 
snd_soc_component. Think of it as an MFD device. Typically at least two 
components are needed:

- platform component, e.g.: for representing DSP-capable device
- codec component, e.g.: for representing the codec device

USB could be represented by such a component, listed as a dependency of 
a sound card. By component I literally mean it extending the base struct:

stuct snd_soc_usb {
	struct snd_soc_component base;
	(...)
};

In my opinion HDAudio is a good example of how to mesh existing 
ALSA-based implementation with ASoC. Full, well implemented behaviour of 
HDAudio codec device drivers is present at sound/pci/hda/patch_*.c and 
friends. That part of devoid of any ASoC members. At the same time, an 
ASoC wrapper is present at sound/soc/codecs/hda.c. It will represent 
each and every HDAudio codec device on the HDAudio bus as a 
ASoC-component. This follows the ASoC design and thus is easy understand 
for any daily ASoC user, at least in my opinion.

Next, the USB Audio Offload streams are a limited resource but I do not 
see a reason to not treat it as a pool. Again, HDAudio comes into 
picture. The HDAudio streams are assigned and released with help of 
HDAudio library, code found in sound/hda/hdac_stream.c. In essence, as 
long as UAOL-capable streaming is allowed, a pcm->open() could approach 
a UAOL-lib (? component perhaps?) and perform ->assign(). If no 
resources available, fallback to the non-offloaded case.

While I have not commented on the kcontrol part, the above means that 
our current design does go into a different direction. We'd like to 
avoid stream-assignment hardcoding i.e.: predefining who owns a 
UAOL-capable stream if possible.

Kind regards,
Czarek


