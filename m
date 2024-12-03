Return-Path: <linux-input+bounces-8368-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF589E271D
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 17:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D57971632A2
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 16:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E38291F8AC0;
	Tue,  3 Dec 2024 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WDUlO4rH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD201F8930;
	Tue,  3 Dec 2024 16:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242684; cv=fail; b=nAgsytbC3opMtdpcSJQcRqTPWjOgyRWU6wtRggJlr1b25Fst/Aihv0cGSaiKuMi0hYxQgM3ePM2vcx+FC3R41/HDdAJo38IW0G5SvtHXUMc/aSse1zuSM4BMO9FurCke3NqlyGxG8rKhxm7qrGyXklbNvht/I+k7TGdUq1rXwaQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242684; c=relaxed/simple;
	bh=pV8wnFybLjxtsoPTx2QWhvUaFZPLAia0i9DdbeobF38=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=q+gkaKF9VfXKaPob7hodayfWtCvXIIEvnQaZdLMt/5Meo7m5x8vumz9GElsxDTbrXg0K83TYRcMdfO80P0Pzz9E9UB49EPQSeTsMhLlk+p7VRuzJMBGB+g1aa/ToAH100YK4dwR14H6DizHnLJmVrNoteVaBEXGAuQVrt8B2FqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WDUlO4rH; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733242684; x=1764778684;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pV8wnFybLjxtsoPTx2QWhvUaFZPLAia0i9DdbeobF38=;
  b=WDUlO4rHC6yAwSDQE4cA8ZqbN8M+eSxNvGU8nImf2Bzf6UPml13h+vvr
   3eIaWobHKGm5aoJNX34Gpj6CggukeBWoAi/KH7uVX/vqNW6JDuni/HXom
   S1NzWeVMwL+T8PEATHl948vULOIc+AGP0Jp45CkL1+HqGvLZ6eAV0NUIm
   ZDRk5hPlIuaxo28cSi/++Bw7HCpqiAvAJlqtx+PefkI6lytlvSbl5bY8h
   y773H7yAE1eECYwQOd6a1Bf2zTfCERZnF1ADpjxNxvpyw61iswin7P1Gd
   VcnH2HpGg1CmK1wJLQt+QEEOzXA1/h+ZzIDdI0goJT9Tbvhq18gwC6K6V
   w==;
X-CSE-ConnectionGUID: m6M4ZQzhT2uaMr+LaOzsPQ==
X-CSE-MsgGUID: lF8zwdTKQGWd+nbQnpe97Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33344852"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33344852"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 08:18:03 -0800
X-CSE-ConnectionGUID: xt0A7vc+T0CjJkMCPdsoyQ==
X-CSE-MsgGUID: riygdoIWSAuM723RGmSFzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="93887580"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 08:18:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 08:18:01 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 08:18:01 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 08:18:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAur5mm+K/ApckcYRL6PE/b+lHoXjo+6GNRtiYG1KLzCI+ae21QkLXyyad4WPcOFip1bnKzIwhavhK+PUC4u/HIyVs6PUlLEDqqHwq+5lhPZTrR0RZoVkFA7CjdttIEQYOc2Dm34ezsc326TwqXeqneJPZ6t2hauknKHBbg3WJdnpGCrwGJLjvQ9fG61I4JKZ0J/azsAMfqAItKp9OM2Qf6sB46ONg8SMXyA/RaLY74rf3TQjZjdvINSCoCxguALaTRlIAM7U2lAjCzCue65ILhm8lfSl0lwaMDv0ns5FRD7XHd4vRLB7sr6OMzqcRb7dKnEWR7EJ52fJ3pror5f6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8t4VPdnzJlTimzj3FBtQFScHoB1NHsK/4KAmKnlTdg=;
 b=vMR+FhQFyFrfYbE6wjXP57DuFFRLt6oip8++NyRg+Ge4XCiQEkW9cTyHO2WVhSJKtxPTpLZGEbqUhbut9ZuVZTy4qsM6LCJYhqmuZsW5+loRVX+FWImdx0xpn/VyQdj2VWA7A6UZmVUJUzhV43cQCNlvcuTzyBq3huYhmzg+JFJuoVMx5Wx7Sa6KPgQ2kzA+5m4RD+zgNPvM5dcSSsEYtRXVB3Lkm9wmGNhlRRbnw3JuxoJQTbhvStmvlWqYPnB6orZ3V0NbXYB8gLrV12GUV94VprDPKuBvXdRMLIdyRcL8VASufd9ICOlAYQGEC+ZXANkZ2N1uTMJ7hCZgzaeOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 IA1PR11MB7892.namprd11.prod.outlook.com (2603:10b6:208:3fc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 16:17:56 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:17:56 +0000
Message-ID: <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
Date: Tue, 3 Dec 2024 17:17:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Wesley Cheng
	<quic_wcheng@quicinc.com>
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
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|IA1PR11MB7892:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c4c17c-2e04-4b23-bb80-08dd13b60bed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTdZY2pGaC8ycytaRlRsSDZLUE1GaWptVGhhT3IyRjlaQlNEdGx1VVQrN0VR?=
 =?utf-8?B?ODBQUTdrRWt3Q21jeDF4U014LzJvTW1mUWNIbEJLNkNvL254ZU1VaDB0Z1dj?=
 =?utf-8?B?bi9Vd3dJd2V4UURFc0RRTnU0TDFQb3Uxbit5RXBnQlE1RXpqaDc4aThmTGtP?=
 =?utf-8?B?VmFxN0pReUhvTllpNmYyZy9xd3Bjb3FDTitDU0dvL3piTnJNTnN1NE1mYUdM?=
 =?utf-8?B?SER4STJZTVBDbWVHK1NZT240VjlTS2lQVkJVWHdGN05IL3BrTUdTbXRJdWdz?=
 =?utf-8?B?RkpaWEx6R05idkVneUpac2YwaUhlbm5GOXdNYzhWSW40REdwcUo1a2JIOHdC?=
 =?utf-8?B?VzA1NjJLcDFpckcxQ3FncE9lM3RTM25jV0ZaaS9ZOUtLY0xVYkZlcFlIZTJs?=
 =?utf-8?B?VlBQZ1pWM2dQMGg1Y1VNRFlvMFRrQkd0NTZJRWxJb1FkdGY3VW1HTFVxSWNG?=
 =?utf-8?B?aGMzMUIvS1pQTDhXL0hXSDRDakRYTG5hMVJ5Tk1vZTNIYzcrcjBPbWJselBl?=
 =?utf-8?B?UXc5Zk9LeXlQcnlLWHFkT3Rhc1YvamQ1akR6bG53U0lucG1GYU5FSWxkelZi?=
 =?utf-8?B?aTlHdFkvbSs4dWtieUR4dGxRMHV3UWRQQWFyWTRrLzZlam9lTnRjZWE4ZDdL?=
 =?utf-8?B?TFY5dGVmaUxoNElZOExobjZQZEJ2U2ZkSzdIMDJYOTJhZkFmQ3lBc0RMRHRU?=
 =?utf-8?B?V3UweFYxdFQ3NjhZaU1NRnBlb3FCRUYvSDRnaXdtTG55TitmalFZOVJ5TUw5?=
 =?utf-8?B?Tnh3Nld1eHBMT0w2eG1pUEd2ek94TjMyUzZzZmY2T0dFU1I3bHB5MnJuVWhx?=
 =?utf-8?B?T0pSVTlMUHc0YlA3bm5YelZjUGZMazFaQmZBd3NmTFFGMmdvRU85NkZoYVVm?=
 =?utf-8?B?MzVTcFVPTnozWlpXTnVkbHQ1WlkvUzFUMDdwa3E1RXhQdW5ZNkpKcWNLZGUy?=
 =?utf-8?B?Nm8vS3lZSHg1WWp5K0poYlF4aGRRb3hqTXlTNkovMFlJaCt0aEhJcEViZmo5?=
 =?utf-8?B?RGtjQ0NLNTNscG96aHBBaUgwZXRUeTg5SVZLbzIyNmlWbjZBaDluQklnUmRo?=
 =?utf-8?B?ZzFYTU9pSFJsUUpnU21WMzFlQTdXOEhVcVF3dnNJMXNGZ1B5VDdTc0czLzJl?=
 =?utf-8?B?U0ljd2x3TDRFWGtBS3lhLy9ZMjZsY0R1S04xbWpONzd3dDBmc1FyZmJLTWY5?=
 =?utf-8?B?Z3VRTzFaRnpUYUpyTUtPcVBRcE1yamNsbTJUZ09lWXU4aEZiSmhBdkNiQkNB?=
 =?utf-8?B?NWwxODFUYWdkVEI3bXNCYm5YZFFleWdOaTdqODc5NVVRQTRWRno3c2tRY1V5?=
 =?utf-8?B?d1o1RzdIa1YxNHZ0V0RmeVpMeHBkRXl2T2xMNTY2WmRPQXFPU0hoK0g3Vjlq?=
 =?utf-8?B?ZUQvbFk0anJ0YytscElnN0N3VFRqSzdGcldNVXp6bENmT3NqcWw3VnpwVEV3?=
 =?utf-8?B?Ui84dWUrZS9kUXdWdGV0MXVYNmMwOHhGZmFnMEVCRmdCdE5uNWl4Q2dVWGtj?=
 =?utf-8?B?Y0dJRjZYckRyY0dyWHhiaDdWdDRsbnJwS1piRlhZNlJRbkdJVFdVQkd1YVN4?=
 =?utf-8?B?dTlETlB6QVpzVE9mUGJhWVA5eTN5TStDMTA0SGJLdnlWYXR1QjB3cXMrbGpw?=
 =?utf-8?B?dDhzY0Y1YXVlKy9URHdpRjY3aDQ5S3R0SXZoWW5jQWEvbGsydVBzc3FJTWhD?=
 =?utf-8?B?Z3liNVdUZSswT3p1c1NNalpwRGd2bUgwbjNMYWZld1B6NUtsaEVLeVhPckw0?=
 =?utf-8?B?OU5Ra2J4d0hVWXRmcWRTK3RKNVlueWlHYzJZNnN4REFzNXB5MVllV2o5M2tk?=
 =?utf-8?B?Z1NQSFdtQkI5eXlZVHFtdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1ZQMktveTBuTVV4b3BYU3pYTDRSbldoR0s1Nnk3NWJjTjRVcEppNGptb1pl?=
 =?utf-8?B?WG1rZUFIZStKcTVYejRaMzFJZnRZNk1XOEkrV3hJMW1PQTIxUWlZOHFlcG1j?=
 =?utf-8?B?eGc3ZmZRNnhFZFJwSERQY3JrUzhoWDQ5akx0VDFhR3huT1J2ZXZWLzJ3Q09l?=
 =?utf-8?B?MVl5aGdLQUt5M3RTSjVHUEdLRDNkUzRsMHVNUTR3SDIvNGZoT0swWjFoSVN3?=
 =?utf-8?B?WTcwQ0h5STJNSmdkN2hRb0dXdC9vQS8xRHdsNjk2emUycHlYTHVJSTZjNW9Q?=
 =?utf-8?B?RlpkSzg0dUJWT3RISWF3QVFJc09vSW9CU0FFSHRUK1J1eXBZeTJWa2Zramwy?=
 =?utf-8?B?V1lHdmRFbzdla1FZdlZLcTFzTnJwaVVpZUNlYXh6aTMyMW43YjAzUnRVUmRQ?=
 =?utf-8?B?aGQvcmZyWmJySkhsc2x4Y1FsYkpPUUxwd29ZUnV5YXhFRFhiZzNIMjZidEE1?=
 =?utf-8?B?THB5NmlQa243RkZJMFVtcUFLOXdMMkk0eVNqUUtWZmxJTGR1Qk9OWGJEY2Jv?=
 =?utf-8?B?QSswZWVQVGZ1eWhESEhpdmduNVJIRmtPcW5PaUJWRjFZSTJFb3I4eTlVK3B1?=
 =?utf-8?B?QkpDKzNwTHJveHZtaHBJeGMxaTZocmF3OW5oanFjalVEQWtEelhVNjJCeklQ?=
 =?utf-8?B?VHJhL2dZZ0diYjB4dWZFa2JNalNObTFiMHFoZDBVYlJOdkdIOWx2dGF6WStv?=
 =?utf-8?B?ZStqMlhWYUl5OCtmVyswUmF0ZnVRWEJrTzdKNisycis0dHJpU2RJUWF6T1pL?=
 =?utf-8?B?R1NMUW1KaEJlMFI1TEpwQ0d5THpieUhTWnpmYmx3cVE0cGtkenBGRitHWGE2?=
 =?utf-8?B?S01rZ0w3OEVJMTdOTHFiRE5FWGZMVUxXbW5NQU9JcGhRcUhTdFh3a3RjNVFl?=
 =?utf-8?B?OFlLcUtIQlphRFo4ZnlMa1RQaVVKTnAvY29tcjZyZkNIQ0ZwT1RWTkEwREFK?=
 =?utf-8?B?QVYwWWZ4WjhBWmJ0aXRQdElqSEJpb0RkR3c1d0xEZ3FWTGFLODVjWStVRTNa?=
 =?utf-8?B?N1JnT2tQY0lDY2l3Q3N5aWlrTFpDMGhnblVSa3Vqd0s4andVUDQrV3hQdDgv?=
 =?utf-8?B?Y2tzcTRVa3ZDeUlBMEV4S0g1ZnlRTlkvSW1MMVpJMjd4Y1ljazNxNXd6U0g5?=
 =?utf-8?B?VEQzYlBsTGc0Q0pBa3ZBMkNmZGxNL1JGN2ZwSGgxNDV4dFhnK2o4aGk5RmJ5?=
 =?utf-8?B?dm1RSjZpMko3eDFLZFlXVk9IMzhLSHFZZ1B6cTY4SklzSkVsQTFSTFhTYW5w?=
 =?utf-8?B?S3UwM1k5YmxGelRsWkFVSlZxcjQybnZsdjBldE1tNE5VTjR6Zmw2L1E3dE1V?=
 =?utf-8?B?TUUxRGNJeFIvOStsQlB2QVdpOE1rcnBSTktIcjRreUdoOGFydmVTQWNpNzRV?=
 =?utf-8?B?K0NJeEUvK1hYNFZHbWJtYWo5VysrWFBhRWFGVmZsVlB2b3JpdTViVzYzcjYx?=
 =?utf-8?B?Wis2M3E3RFBBWVUyeTJhK3NkVVEvSHZuM0pYTy9nSTZEV3VVMzJ2RkQ0aUk3?=
 =?utf-8?B?cW5mQWVvSDkwSHVtbGFHWFFtUXp4YkNBL3pJQzRaVVFNVmwvcmtVSjJzZzk3?=
 =?utf-8?B?bXVaUUV2Qlg2S0hsZ1paem00VUNzdVduekoxK041a2RCa1p4dkx5RmNyWTRh?=
 =?utf-8?B?aHhMbWZjejFxaU9QdnRIWVFKamZpdDhOSVYyRmVSYVEvbkdjUnNiYzkzMnpa?=
 =?utf-8?B?dGtlOG8yeTFOajVwdVVsalRHUWhSUlo1UWNMdVNoVHdGUGNvVGVnaG51UFRs?=
 =?utf-8?B?UFJEdVBlaG1laTNPU2Rncm9Xamh4V2NDbTdlZ29iUXFVZ25kais2aVZZL293?=
 =?utf-8?B?YlM4NVBjdXlFTVZJcXdQeEVHc1FPOHMrMER3VlZ0d3ZXVU1NMUJOdHZ3UnJk?=
 =?utf-8?B?cjhrTS93NzNNdVF1WXNFZ2NqZGdRWlJWazNIRXFBcWpVVGZwNmZDek55U1Ar?=
 =?utf-8?B?UjhmNUZkNXZIaXdoWHNsY0ZCQkRDT1JESnV3bXMwclo5ZFdtaExRRjFOdlVr?=
 =?utf-8?B?MU1RWmIxc2JncG96K0o5blF4aHViazl2Yk45SzI5aDVoSUQwdDdiczNSTzZE?=
 =?utf-8?B?K3ZvZ3VZNkttKzB3dS9uWGNQWEtBbkJTWHgvb2w4VU5LSWtVdnFTSFRGdTBL?=
 =?utf-8?B?alJ1aWtiN3MwUWFydUh3Q0xPTDh5Wm5kQUMwVXFBTlZFZk0xOHJoalN1NWx0?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c4c17c-2e04-4b23-bb80-08dd13b60bed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:17:56.6000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOxsAjPAumgMej79D1jjM6KM0Qv3EKF7l9WpKMvZ6VZX3qxpKbmzogt981x/dZz3oCRHrCiNbw53sxO05yPnCr96DevRCBpImoseB31vnnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7892
X-OriginatorOrg: intel.com

On 2024-12-01 4:14 AM, Pierre-Louis Bossart wrote:
> Sorry to chime in late, I only look at email occasionally.
> 

...

> My Reviewed-by tags were added in the last updates. I am not sure if anyone else at Intel had the time to review this large patchset.
> 
>> I believe Amadeusz was still against having the two card design, and wants the routing to automatically happen when playback happens on the sound card created by the USB SND layer.  However, even with that kind of implementation, the major pieces brought in by this series should still be relevant, ie soc-usb and the vendor offload driver.  The only thing that would really change is adding a path from the USB SND PCM ops to interact with the ASoC entities.  Complexity-wise, this would obviously have a good amount of changes to the USB SND/ASoC core drivers.  Some things I can think of that we'd need to introduce:
> 
> The notion of two cards was agreed inside Intel as far back as 2018, when Rakesh first looked at USB offload.


Well, I believe a lot has changed since then, not sure if USB Audio 
Offload (UAOL) was even stable on the Windows solution back then. 
Obviously we want to incorporate what we have learned during all that 
time into our solution before it lands on upstream.

UAOL is one of our priorities right now and some (e.g.: me) prefer to 
not pollute their mind with another approaches until what they have in 
mind is crystalized. In short, I'd vote for a approach where USB device 
has a ASoC representative in sound/soc/codecs/ just like it is the case 
for HDAudio. Either that or at least a ASoC-component representative, a 
dependency for UAOL-capable card to enumerate.

Currently struct snd_soc_usb does not represent any component at all. 
Lack of codec representative, component representative and, given my 
current understanding, mixed dependency of sound/usb on 
sound/soc/soc-usb does lead to hard-to-understand ASoC solution.

> 
> Having a single USB card in IMHO more complicated:  what happens for example if you plug-in two or more USB devices? Which of the USB cards will expose an optimized path? The design with an ASoC-based card which exposes as many PCM devices as the SOC can support is simpler conceptually and scales well. This would allow e.g. to allocate these PCM devices with different policies (last plugged, preferred, etc).
> 
> Conceptually for the simple case with a single USB device, it does not really matter if there are two cards or not. What matters is that there is a clear mapping visible to userspace so that application can decide to use the optimized PCM device, when enabled, instead of the legacy one. And in the end, the application is *always* in control in terms of routing. It’s really similar to the compress offload path, some application changes will be required.
> 
>>
>> 1.  Exposing some of the ASoC PCM (soc-pcm) APIs to be able to be called by soc-usb (to mimic a FE open from ASoC), so we can trigger ASoC DAI ops when USB SND FE is opened.
>>
>> 2.  Proper fallback mechanism in case offload path enablement fails to the legacy USB SND path.
>>
>> 3.  Master kcontrol to disable offload logic for each USB SND device.
>>
>> IMO, both the points you mentioned correspond to the same topic.  If we go with having offload being operated on one FE, then there is no need for the kcontrol of PCM mapping.  If we have two cards, then we will need the control for offload device mapping.  Can't speak for Pierre, but at least with my discussions with him, I don't think he's against the two card design, just as long as we have the proper kcontrol that notifies userspace of how to utilize the offload path.
> 
> Even if there’s a single card you need to have a mapping between a ‘legacy’ PCM device and an ‘optimized’ one. This would be a scalar mapping instead of a (card, device) pair, but it’s a minor change.
> 
> -Pierre


