Return-Path: <linux-input+bounces-8398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7CD9E4771
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 23:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E429B2BDD5
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 21:14:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DDFB19149E;
	Wed,  4 Dec 2024 21:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqIh8fIe"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E2618E368;
	Wed,  4 Dec 2024 21:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733346856; cv=fail; b=gakUHVr1976GrTN1P8fH56IOJLsk4t83neg3ZT/L9VHJOyx4UdYlYiT8jkQERP0IwPDzPllRH2ZB1VOD8yz5JdGQ9rNaoTy5bv0BfItsPi1m5w6+QVH7hD0KMTaRnd2il2v1ra/a7FXnz6P2deWlBzvW2Aga070hIx/l4vKRL5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733346856; c=relaxed/simple;
	bh=TYmlI/wsSGarfLEk+6TL0/RlCxS2RokfmH56Zzcowhc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jC6FkHDbh9s53EIILjQ/G2SOI9E7hsNvbWfTpJP1c1SEzl/oiCW/MUVXe8Xx/s25sOT0hoDEMEG4FFzaxXfpCJy0mNfgf6UMjl/0Zn5EvbtYL0KyDt4pPH/lP9FNCKlGfgLfJsuZxEbA3IVVg4iV7YTqvd7Qo9WeLqC5yHRqeaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqIh8fIe; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733346854; x=1764882854;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TYmlI/wsSGarfLEk+6TL0/RlCxS2RokfmH56Zzcowhc=;
  b=YqIh8fIegamJOYB3DuXZTp4wvYwEOGiplEu1Q2lmuNFQ3uWft4DPwPzy
   iUCJGgignLtKwTWtr7AkQTijjnscCuqmKGrPeHZhQEHFybug9ElngbjyE
   fua/hwqL/EzevWl9EW9NuHCtKngZGMJV1Gac7WLv9TfqcRMumfg1cs4uf
   mmoe1bSIVvYOdjK6/bW0QDcduJkjLPaBA8llzH8ryGcvslANkll37RTXN
   O/uXduiwcwKoG+wOr5CHOHxz+JJxeUsNN42X7YCldr6PMYp13ViEL5cmK
   ofnFhd4LcRuJLLheGo1qgiiUDQDFv4wjhAUhVSTAO5s6Firi8rQgXv89r
   Q==;
X-CSE-ConnectionGUID: pItiDJmRQH2txN2Q5is30w==
X-CSE-MsgGUID: GJU825YQQgeGtbT6nNwrew==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="44304161"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="44304161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 13:14:13 -0800
X-CSE-ConnectionGUID: tZPVI4qXQIGkRUeBRGXU0g==
X-CSE-MsgGUID: ZaJirgFwRZyJ1eAOs71IdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="94315645"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2024 13:14:13 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 13:14:12 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 13:14:12 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 13:14:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OksjmAhMczmIhvzGI6h3ScJgvIfAcNw3fnne99ijExqtE5UE5yTRcpgpDUm51kfX79rqnqPMFSer8SwapFEXaybnbUsGc/NB2sIeD66Yyt109Ss1c0ojIvE5Kjk1ik7iccvQ6GD22Y4lYRgJDP1NoSkRqxxMOVa/CX8NenLy/71wWV08QQz14cGs35lecbCupUvTZXPxsfBNTFxoUzQOQUIjEaOqyXG8SUEAidc8IYW1qkniBbO0uuSEKDM/4mH3bq5PbepRDk+Wv0HsuADLsvRv6S8BjjCfwtVZXFJk5jqnhJePhyhHE+1Mj9BEnQThrO5AVFNGUxGvv9gQQm6Ppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDwiCQ3QfcREe4/87kbMRllxVTnj662qdr7c2f/c/u0=;
 b=F55enzdsVv3i/CJAFoNzHF0O8tsJSCqctafrMZVvlfZOye28jxjNcNOtpAj5eB3wTBS5cLCV5bI1Ht1mbFTck/bDC2gITdvVRK+yENdZBvl5WGLX+dvZ5huhYgKmCorZk9NhofdAzD0/wqgtxCJBoP0WJxHWm7dTmR66ex2F/VttsCuTs5gd+j8zuHIiKfQqeXHuBy4B1mmg99OJ7IvIBiOFklQUAhKuZThc9oZWdfVhTCJv/yxRLIOweh7u9k7FtRPngckfLD+oD5zALdAaHegGnnphPMhsMa9IWrKuOzyTLT6z6JM9P3tUoLYHf5bIPvAfPzr9zk4Ee1hmVFHYig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Wed, 4 Dec 2024 21:14:09 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 21:14:08 +0000
Message-ID: <58a561d6-dc10-484e-8214-5e03c4aef66d@intel.com>
Date: Wed, 4 Dec 2024 22:14:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Greg KH <gregkh@linuxfoundation.org>
CC: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Wesley Cheng
	<quic_wcheng@quicinc.com>, Takashi Iwai <tiwai@suse.de>,
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
 <2024120320-recant-tameness-6c81@gregkh>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <2024120320-recant-tameness-6c81@gregkh>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: 523f13f1-10ab-48b1-2101-08dd14a896f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YjRndjVWaDJ0TmVSWHJNOUl6S1BqRUYvNjY5Y3k1K09mYi9pUkRJbENhakRJ?=
 =?utf-8?B?blhHcmt0MndDRDhmZS9WRVZGSDBNRS9ST0hzWWpqOEcvWlMvUkQxVE1VNTAy?=
 =?utf-8?B?aUg1KzFOV0VFQnBta0hneGN1RnhNRDgwbmJVbmJibjNKUGNNamVTZmh6R3Mw?=
 =?utf-8?B?bWlXSkdDNWRUWDlMMytwOHlaOUw2R09hTHhBSmorcDZ2STlJODJjQnd2NFRG?=
 =?utf-8?B?d1NCbFlEVjRTTWlFbkJWTTNtaU5JK0xnWFQrMW90MmF1MW84L2IrcXJrNzhx?=
 =?utf-8?B?QmZzRnNpQ3lVRHdIUkozQnRtQzZzc3k0NUllRFExK3pBaWdqcGpwNVBYbjc0?=
 =?utf-8?B?NW52blN6ZkJ1NmYrTHA3eDZsdDRwWlROQlN1UlFFYlEzWFFvNjlrcnNWNnBy?=
 =?utf-8?B?MmJxMUtSNUtMTFdEejl6RHRrTm4xS1BkVEpBcUZjRDhZb2tlR21zRUZDNWN2?=
 =?utf-8?B?cXV2Q0ZweE5ZYXk2VVdTTEVUdytjNWlKNVQ5ODZscmlwVWRtSEJ2Y2lPUUMr?=
 =?utf-8?B?Y2VsekhCRzFmSWdaNStYUVhWS2Z1Z0duTlU1VUdPd3VOM25BblllQkJSTnVM?=
 =?utf-8?B?UTlqSnV6akI0UVFacHZObUwrckRvWVRmT2pqOFEwbU5DekoyTWVPQ1lvUUdk?=
 =?utf-8?B?bE1Da3I4ZUNkQ042TEFMNVRVNk1OUFZLZHZFRkFTaHNrcldiRk85TXFpR0ZV?=
 =?utf-8?B?eWFtWUpzYURvNU1kTThadnRrREFQZTBvcG52ZFkyQ0hiK0lIdmJLNE9wZEpv?=
 =?utf-8?B?RGNSVDl2RmdWdUxVcnpzREVQbEpQTk5nLzM2Q2ZrTWdCakQ2TzEwY3pGMC9N?=
 =?utf-8?B?aVFSZm8wRUpXWmJ5K1ZnaUpJSjVPRVRyZWRmeXlOdElLYU5pT0ZKaTRxcjFy?=
 =?utf-8?B?UkNRTklHSkVkdjM1MDExMlBjcXpCNHE1NW90akw0WUVrK3pGbjFiWWR6Vm1Y?=
 =?utf-8?B?dGxLc1FlU2RTSkIvbC9jVkZmNWQzTnd3eCtpa2NlaE4zbDJGN1R0ZE9yMHNt?=
 =?utf-8?B?L05iTm41Y25GWXZyUFVrWjRXTkpFRFF0dGxVaFVGaXhCSHljN0h2VGk1ZzBF?=
 =?utf-8?B?MktDOHphMGxobm50SjdRcnZCMmxqUkM3b1V0L2I4M0kzKzFlQ1c0R25aOXA5?=
 =?utf-8?B?MXQvRDV3UVVkOUtRc0lWZ1dkMG5yU2x6eWxDRkJzQTB5NEdlMlZzQUVTSVVC?=
 =?utf-8?B?b2k0MnVuSWtBVVMwdXB6ZXQ2YWE4bVo2dFJ3NjE1WTVkaytRV0tiUVRWd1JF?=
 =?utf-8?B?QWhDYXlZSEV1ckFLdkJnNXZTdHJ5elRaU2wyc3ozeVc4YVJtVkpKZHlLTDg2?=
 =?utf-8?B?bCtpOTk3VnlHK1A1MnM1YXNheWE4ZERUa3BFbDZsdDdRY2IwdVVmNGNLVWNE?=
 =?utf-8?B?YkdlMFB4RkdIVTUzMmFuQzYwSW5SZUdqcEIzMTNsaFd1cmxuSXROYmZPeGpv?=
 =?utf-8?B?Q2RocDRDMEZhVHRnSWJJY0xNSVY5UFVrbnVNZWhrMU1YU2kySGxsL1RKMkhG?=
 =?utf-8?B?cWhxb2VjUUNRcDZyRVlHdVhmUWJ1T0ZxV0NMcWRnYUNLeVgya090L0dtWWhp?=
 =?utf-8?B?Z1NhMk5EdkxSWXRIUlVGdVprSTRiUCtVU2lSVTRySS81ZzZCOG5sNUtrV21C?=
 =?utf-8?B?TkdXQW1pRlcrZmFRV2gvbHIyTUVoQWtISXJvYXRvb0dsdDkzS0kwcFU3TUl4?=
 =?utf-8?B?RzVWQWJEWXg0SjhzS1VIQUl1MExRTDc1M0VVOTNHU1Z1QUl1NmVMZ0FHTG8r?=
 =?utf-8?Q?u1OB3tKwxXbrmGgmCI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U1VIdWNrZURRWXVUSWpPUEszQjZ4TUQwRXhCbVJINW10anpYRmRZTFRKY2lJ?=
 =?utf-8?B?emJVZEZiRnNuSXZWcXFCUEk2ZEhXN1NyQXN6djZwMGVwTTBGSTNyRTgwNWx3?=
 =?utf-8?B?WFh3RnZwVnVJdHV2SDY3QlJHekNCNURZamdnOFE3WTBZQlR1Y3NzaUpGR2tm?=
 =?utf-8?B?NUpNTnJFdk02Z0F0N2hHMUpzWXVkZFZvZ0JZR0swTlI5amRIWldNNGk5anA0?=
 =?utf-8?B?NEloWmxMSjNGc2RjdVhaL25CMFhOcXJtYm5PM01EeGVVd2VDa052SElPaHpE?=
 =?utf-8?B?Y0tYQVhhdFhBdzRWZzhrclFVdjBLcTJwMWdod1dCRDhNVHFmVitrS3ZHU0xo?=
 =?utf-8?B?L05GLzFCR1craDhTejhNajZabjBpNVNPRDV2YlpkTkEybUpSUE10Q2QzWFFR?=
 =?utf-8?B?VFRFdFdFZWtNMi9Edll2SHk4TXlpemtWOFJyaUVlbC95eHlmOTBnQTlxVWdI?=
 =?utf-8?B?dkNreURQLzEwVXN1UHArMjJxdE1ld21ZREtSUkdEVnJLR0piQVA4Umd2cGow?=
 =?utf-8?B?dGdTM3RTa2hyWitFTkNnNjBxN2JWUUlrWjlYYnFqRVdFV000ZUNTbDYwUXBX?=
 =?utf-8?B?SWhWR3NDbXZ2cmg2SVg4NTFtaDBnbWQreGZXMi95dXpFMFlPb0w3WFB2dUlo?=
 =?utf-8?B?dXRaUkRMbFVvMzJlbnRoblU2Mk5TRE1iK3AxVHR1SUU2aG1XRkRvNXc3MVZF?=
 =?utf-8?B?QU9lOW9EWXh3QnFoc1JQU2loazBUVyt2ZGNwWE5JYkxnME56Ry85am5wUHg2?=
 =?utf-8?B?bW0ycDUyWmV0Tm9WVWpBampkUzJraitrMUIvSVhIZnFMZVJnaXBsVVNqUWlW?=
 =?utf-8?B?MXpqVmpTbUpOWG8yR1NyU1hEdUhWTnBid0MxRTJwU0JibFE0U2p2bGVPZHp5?=
 =?utf-8?B?VnVnd3ltemhxVUpRUTl1SDJZOVRCVkZqOHhLMGJEQm5taUJBWEt2T3N0ZXJN?=
 =?utf-8?B?aFJLZmlueVU5OEpDUGFPYUV6ZHN5bjd4NGRjWW5ra2szbmZyV3Q0bXN2bVpN?=
 =?utf-8?B?dHBaa0liSmFLL2xFU0FCelpTQkRqVENESGRURGw2QlVIeUxjR1VieTFVa3Vv?=
 =?utf-8?B?RmVkY3RtSzhqRFBTUFRvamV1SjdYdk9EMmExN09mTEcvRmRZL2ZKT0pYZHZt?=
 =?utf-8?B?TTEwRVYyRmM3aWt2eDhKUFpIYytvaElLUnZuV3h3Z1pnZllwdTVpTjJSTnhR?=
 =?utf-8?B?TlJ3WTlVejdnU1M4dW83YzhpZ0VaZ3VTajBkaU5TSjRmU01nQzJWWWIzejd4?=
 =?utf-8?B?TEVMMHVBQmxDeXlIaDFQRDczK05oYjZBMzRvejlGamZVK3YvdUtFUHVzdVl5?=
 =?utf-8?B?SmlFZDFIUUpLZmlkRGdvd0IxUDdNcCtaRlcrS0VwMkx6YmQ5N0FWTDJlK204?=
 =?utf-8?B?ekoyRGp2NmZRUHhqakhIY2RqR1BWbyt6TWZHNWsrbW5aVkNNQnZaamtOL0py?=
 =?utf-8?B?dDNpcjIrYk1DWVZJM3p3OWphc29JTE5oVlZXRWpkdFJQclhNTFJGSTNZMEo4?=
 =?utf-8?B?WjFKeUQ0OTNjUzMrNTRDUHYwRkErSkhxb3hQNzRsdTJ1V3VoSW9QaFI1RHYv?=
 =?utf-8?B?K0liNVRXL3RlTGxSbTM3WnZxdUJmMTUwNjJKWlF6ZU5LdTVudE4zVEJ3NmN4?=
 =?utf-8?B?QUl2MUVPaVpHUXl2QmFrOUpsZlNoVkFNcldNeE1vUDQ4MGJwOTJiZW42bC9z?=
 =?utf-8?B?by9NS3V4TlQ4b0ZLZkVvOFFCbjJUQkdnbkF5K3VvL2lBRk1MY3B3OWF1VHhp?=
 =?utf-8?B?eE4vVFErOWRGaUxQQ0VmQWc4bTRGWHhCRlpDaXk0UEpJbDlhN2ZiYitCeEJl?=
 =?utf-8?B?V0pJckM3TDF0ZUxuRlNaczNGMStxdVZoWDZBbEpFVUkvbVNNTlF5TEhKTmt5?=
 =?utf-8?B?WnV3UTgxRHRURjZ3U3N5VkZyU0xjSHNzZXg4MFhTSTFkZUFsSkJJTU5CbzZX?=
 =?utf-8?B?RFZFdWYybnU0cXp5azNrZ3VDNXVJbjFXRHEwRVZvK2x4K1NJUDErSGI1SHlV?=
 =?utf-8?B?QUl6amM2TUppSkRobU0vYnZBUnZNYnROT0hFbHpFTTNDR2krL2g4SWlCZGF3?=
 =?utf-8?B?eXZxK0pWT3o3ZVlLZndNdkk2QnBRRiswdnV3TG5IWjlPUmdhcllQaG9jQ3E0?=
 =?utf-8?B?SWVac2ZOMzg2cjNRbjdzRjBBQ0h6engxV2dTdjFmVUlEMnVtVlRleDc2VzdL?=
 =?utf-8?B?cWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 523f13f1-10ab-48b1-2101-08dd14a896f7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:14:07.9195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/zxRHOl/ecrmXfWX3sdbR4DetJU71+m7kcOlkzTx6bfH193anvgLcGk2jtXAZHHkRsJ8GDMtFRoDXsLGu8+NFCsoZwqwLsnZ2pgMJ/KFRo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6019
X-OriginatorOrg: intel.com

On 2024-12-03 5:57 PM, Greg KH wrote:
> On Tue, Dec 03, 2024 at 05:17:48PM +0100, Cezary Rojewski wrote:
>> On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
>>> Sorry to chime in late, I only look at email occasionally.

...

>>>> I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:
>>>
>>> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.
>>
>>
>> Well, I believe a lot has changed since then, not sure if USB Audio Offload
>> (UAOL) was even stable on the Windows solution back then. Obviously we want
>> to incorporate what we have learned during all that time into our solution
>> before it lands on upstream.
> 
> Great, can you help review this series please?

Hi Greg,

This series is large and I'd suggest to split it up, what I touched on 
in my recent reply [1]. Please correct me if I'm wrong, but you mostly 
care about drivers/usb/* part. If so, the existing set could be split 
into USB-changes series, ALSA/ASoC-framework series and a third, holding 
bulk of QCOM-specific patches. Me and my team care mostly about the 
sound/* part and we don't hold much expertise in USB. I believe Mathias 
covers this part well though.


[1]: 
https://lore.kernel.org/linux-sound/a8ece816-3d4c-4d60-b7c1-a7f7919325f3@intel.com/

Czarek

