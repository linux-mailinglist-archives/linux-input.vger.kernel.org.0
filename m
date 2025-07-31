Return-Path: <linux-input+bounces-13729-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BCBB16A94
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 04:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC1D71888B49
	for <lists+linux-input@lfdr.de>; Thu, 31 Jul 2025 02:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9AD20298C;
	Thu, 31 Jul 2025 02:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mf03bHau"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B41A15383A;
	Thu, 31 Jul 2025 02:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753930557; cv=fail; b=RHZfXzdZOxGPT3R4Cn5rCldMYIH1Q+B52NrZiYFpyoaN9/SzHIuRy/736+A2VrbaBUrHxfFUKWbcKAsR5FIunL391UB8J5hjiPT6YPNSsoIOZFPSOQA4WeaGSKFY5Lcs5csC4Qe9L9ixt+OHTzSio7WH81hzBmkJ2Jjp59MDcV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753930557; c=relaxed/simple;
	bh=6XnpGzKvPFdvuIrLhYF3jxKTsH3gLyW17EmEC9k3Kfw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AgezKZuc4ZFN3mx7sjTAV30CAeoI54G7U8FFhWs55ND3aJKie4Z9VNmxLiWdNpOAVHjRqb4xZ8h5+VA0cdr1n+fn5c8q4cQ2WQgWcOQdwUlX+d6N05RTKOpGWZyPaXxGCsTs4z7ewiVXOOY7wotgRs+iFd+llnk2YocOZ8iYhpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mf03bHau; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753930554; x=1785466554;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=6XnpGzKvPFdvuIrLhYF3jxKTsH3gLyW17EmEC9k3Kfw=;
  b=Mf03bHauAU7U2GuN42LUNj6Z6yXpuUWL8ej5jrCQCcNl0G3ouJP9SzU8
   9AvvN/3m04GxGwbfNTVY6kwgsqmXs4ZQ652gmX5Y4x5DuEXMI8I/BrJCh
   xwFHwqxeBkkVcYvYW2f3iTMuNU4TRGBz6vs0fKQJMu0ejqrNMKB0evUZf
   BV2e7QypGhwicDQDXLYwQWi5QmBMFXGGW3fS7X45Hb8NkAjnbrmiNN5k1
   L++CmzHabQ4P+ujupQm2FmWTgj/vdnNIni7hQwoNqsAO/DYDQqN0mKvtw
   CEdONSX9zfi9+3aDIsYssYr58KMXxWIEvBxplWHNWnNqPWdiEFkIaxenX
   w==;
X-CSE-ConnectionGUID: 5iuVFfYdRsS1DzzUFPINOg==
X-CSE-MsgGUID: GtsVuDRKQnqWDQLqHYDavQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="58865995"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="58865995"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 19:55:52 -0700
X-CSE-ConnectionGUID: WsPBLYssTJOMay2jAVgSsQ==
X-CSE-MsgGUID: ireEiTp3SxyJVM/UXdUYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; 
   d="scan'208";a="163178726"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 19:55:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 19:55:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 19:55:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 19:55:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JwvX/Yegc4ysazXReygxFsutFndtswTf92+fawS7U9cQ9mNRfYNXR+S5t6XCPhTwUS1fy4USKL2TQqdjZRoDUjHyCdGjCBOUwokZakrwcOvhrc7oTqWEZg8iigv8djt6YVf9ANR/ljAdDKQEv2bQ36w9F2/Ul/mpg8PcvEOUpwgflzB/hpY5FKnbRGPdhCdYCvv2HdCtMlh9AEIZ7kOO89WNEexsleWuJXmpuNfqc/SHA22QvgnWtv4B1Y3k7u5gjkBwchJpP/GVWBTX5gomkukep1kk//snneQHI9NOHWnZ/OARaXVIu73TkD26hOfYXBlx1lCzG8RxqdvFbmNADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM1u5WpsXehMmVc5nqyhVb+07D7c0eK7gV+XUAtqAUY=;
 b=U0CpYR16e60yqCU+H4m1gLOTt48Ry/ha58325MXC1KlrByOulvtIYngYsQ1mEKw9nqPKEYS5O75Um0rGNO/JC11MhYz2rc1xUKTccxT/QABojQ6o1NnNpivH+S1D0HdtBlk+B4Sz4X4y5yg0j+hVeOYMuCKFKJE8Ra9ASOg2pTg+CUWTSaP92BrnVse0+h3ZIbuA04+bZjhF/e+I7gC206WGF4LcoaeJkWxAsfa8COixG89HPFY1SjxFfxBbdy6QAPd601C8FO2+H1cAXwXZh+qoHPrWg83KsZ/b2c9FD4qnirCguDtK1sML30Z3/veub1rFKMQWQ10m+YkHTg1oVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB5981.namprd11.prod.outlook.com (2603:10b6:510:1e0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Thu, 31 Jul
 2025 02:55:47 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8964.026; Thu, 31 Jul 2025
 02:55:47 +0000
Date: Thu, 31 Jul 2025 10:55:35 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Jonathan Denose <jdenose@google.com>
CC: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>, "Jiri
 Kosina" <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Angela Czubak <aczubak@google.com>, Sean O'Brien
	<seobrien@google.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
Message-ID: <aIrbJy7Rb6aVNOk9@xsang-OptiPlex-9020>
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
 <202507151942.94dhYylY-lkp@intel.com>
 <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
 <aHmOZiQ7TAQ3TjpQ@rli9-mobl>
 <CAMCVhVNTWKg89MhPJeVvKK5ZhXYy2WCJFBGJo2Hg5=aCUZz32A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVNTWKg89MhPJeVvKK5ZhXYy2WCJFBGJo2Hg5=aCUZz32A@mail.gmail.com>
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB5981:EE_
X-MS-Office365-Filtering-Correlation-Id: 26423380-1fef-492c-7194-08ddcfddbfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjZVZVZDQ0lJR3c2cFJ6VHJBMzl0a0JDblhqaFBrdVUrU3pjdHVtczFONnNT?=
 =?utf-8?B?OXc2Q3NGbFZldU5CckRNMExQTnVWRHg0akF5ZHZVWHlQenhKemIvWjFKYk1F?=
 =?utf-8?B?WDZ4bzB3TnNFVDZzR0xqU1AwTEFoWlYwVTVSdmNUUmpISzk2S3hwS28wU0x0?=
 =?utf-8?B?K3pCN2l4VklxZGg2MHpQVU4yaTluZ2hyR2NDcUViZTRBSFFrRlRYL0hCVUow?=
 =?utf-8?B?cTZVN0wvWVNXc3JRR3UzWXVlekh1bWRvSUNvaHhmSU9LWDY0eTVjaFlPNUty?=
 =?utf-8?B?VkF2eCtqVDFGaTJ6RmFJTnBiaDAyMlRhYUVvdGtwd1VSTG1hcDNna2lhU2Z0?=
 =?utf-8?B?VXkrd1VydTVUdWVGSmNGZjlzT1lNZVN4bDVIb2FZYmRCeVFaMnVoZmlwL0wv?=
 =?utf-8?B?UGVDT1JnY25lSGk3Q29ZRVZBaFBpenc2eitFTnR3TEpLV0dLTis5OW5CM0M3?=
 =?utf-8?B?bHlMRGduY0hSQ2hhTXBzWHB2Ri9vUU83ZDk3dE4xeFc1bVF4MTVZbmVuRW1O?=
 =?utf-8?B?emdJMnpvNHpPQW85QWwrNzdIM3dVanVhSHFpdnJSOG5VK0RROG9EQktxVE90?=
 =?utf-8?B?OXZNeXBDNWhzb3BtS3h3MDlwUUxtUDUycnpNVkJEVnVheUN2SForREt1MUZK?=
 =?utf-8?B?Q0J3NysyYlYvMUZNREgyMkdDU3BZYTFLdlFpbXRtSUl1dE10TC9vRzJzeTVv?=
 =?utf-8?B?eEJ0K012d0p6QWQ2YUtrMm1VYlB4UERBOVM1Vk9adjBOcHVQaTRHcndPVlI1?=
 =?utf-8?B?V0kwZlhCUDZTVTJZallMZXh6UlUvOXlmM0RUdUVQT3N1QTVTWjFTMFBxbTV4?=
 =?utf-8?B?cVNVTkxXYXk5TjFub2xWb2Z6cExDekY2dzRYSTFXVk03TERBSzFwcTFBTmdB?=
 =?utf-8?B?bEp0aXNLU0E1VHViazM4NTZGdGt5SUZWYmh3S3RSUzAwVkFNejRzVXdaM0hk?=
 =?utf-8?B?M0g5a2F5ZzU3aFh6R2VyNVZMUTdqSjN4TmdydUtQSUJyNG1TNlFUNmlDRjAv?=
 =?utf-8?B?aGNyNzNkSlVSb3RKSm53NnF3UWdRNDVmWEtPakwzV2RKWWZZWk1hZHZicTZO?=
 =?utf-8?B?UFlnUXo5SVhTcEdJR1dDN2pMc2NhcDhiUHNhR29SU2lpSmMzQ2o2Nkd5eHJt?=
 =?utf-8?B?eitEaVdxdGJPdjVERGZOM1Y3aVpDdVkvK1NjVXNSaVNhNEgzREx4c0RpUmk2?=
 =?utf-8?B?aUpHQnUreTVDS1dpWitnODRHbUxSdDNqVHpjYUoxWlFWdk0zUUs3bHlBUmZa?=
 =?utf-8?B?Qm5NYzh0WWk1SzIvYXlPNVpZOTR2WExDRkdST2kvcWp1VlFzUlBHYkJ6U2JZ?=
 =?utf-8?B?L3ViUHNDaEFkNVVRU0hxOVFTSkFaYklWdWhZZllPc3BDd2FjT3VkUHRNSDR4?=
 =?utf-8?B?S3Q0OVgvY1BvV0cwNmpyeDZnM3dGV2ZueFRuT2VvNlJMaDloYkpqbUczTGNB?=
 =?utf-8?B?dU9wenM2WlU3N3FiMmRLbmoveVJMbGxqVm9YVWVSamk4L3hValpoK09HdEtJ?=
 =?utf-8?B?b1YvdGs3RnlnbnEycHNMQlJkVitQQXl3SEhXandqMDVmWmxkcTIrMWwrd212?=
 =?utf-8?B?Q0tUTUNicUFDYzkrT2o1ZEZMRnp5dk1UWGZNMUpVZUl2bEpKZ3N1aldueWR5?=
 =?utf-8?B?T0MwdVFwZzI4aWRKY0hNSkk2UU8rc0dSMlIrNHRpb1VmZDZERjREdFk4RmZh?=
 =?utf-8?B?L2w0QnF5NU5kNTNKaG00ai9UeXFOUlUvT2lGNnFKRnRpUnpmeGxNRmQyN2hC?=
 =?utf-8?B?bm5Zelo1T05qd0F5a3dYc25tMUpMWVpVbnVTSXRKb05FcUZwRjZaRE9Famo3?=
 =?utf-8?B?eHlJQ3dSQzQ5aDdFaG0xNWkzWUNCZ1paR0F3MHVOVHl6SGo4QnFnTzhjODJI?=
 =?utf-8?Q?Q2cgAQhshmn6p?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODBmL2tRbGFLaVNZQ1Zkb0l2b01XcHZvSGt4MjhpbUdtS0NFV3krc0RwcndF?=
 =?utf-8?B?RXRZbk5GRGlKVGhmMExqUTBlR0JhT0VoNnUwVWJYQnlOamZERi9YR3RjRGhX?=
 =?utf-8?B?ZUxJcUhVTWNnb3JxQy95SCtwMGxGM0ZBQ1ZWbUcwejBuQVg3bUtDQnR1M1Ev?=
 =?utf-8?B?cjZGZWNzeVU1UWZyNW96OWp4UDFXa1ZydkJmMjE4dFlGWStacjJhYktRS25E?=
 =?utf-8?B?V1RwQjR0aklOM3ZwV2ZpQ2tkcmF1alRCd3k5cXM4Vmg3Rzd2dGxRNWFVL3lU?=
 =?utf-8?B?VXc0K0NlcHN2Rm9mdS9hVWhsVzRhNXNCZzRDOTZvcEV0dy8xblNsTkdVNVdx?=
 =?utf-8?B?UzRNYWQzNE5kV1BCRytCZDF6MUJETm9sNFNzVEVSb0ZZOEFKVU9lZnFzTmxh?=
 =?utf-8?B?bmdOZGlhVktMZURuYVlhUEREbFJPNHhUQTR2eURjZC91cnBlWW5sQVU2ME9U?=
 =?utf-8?B?LzZLaENGNDd4YnJ0OWFMZ3JENGtLeXpWUjFPeFhXOEZ6WVlTYXdxTzFRMXRP?=
 =?utf-8?B?bCtGMG1JUlhkd1orODRQSEJEZ1gzMFRvdGdhQXZXUXlKSGRBMDQvNEJYUUtC?=
 =?utf-8?B?OVd4ZHJweUlCdHl5SFJseTRMc0hUSXczcUJDTjVoblZOdlJvTUxkVVJKWHRL?=
 =?utf-8?B?TGluZy8yTHNzVitNUEFTZ3N2YlIyOTVSTzhZdll1bWIvTlZhMTltNW9oaDZp?=
 =?utf-8?B?REpwZ2tITktNNWgxcEw2YlRqczBWcDJrV1ZVaHdHTHVFVXdWU0tWb0J4ajNK?=
 =?utf-8?B?Sm9NanVCSEx1ZVlFV2ZKRkVHQVFCZmR6dmdKOFRDSWkvNDJWQXVDM2dsa1Q0?=
 =?utf-8?B?Z251WGJPMGlQQ09ETE90OEtrRGtWMmhTdThTd3d1OEpJOGhsa1dzTVNtcGxj?=
 =?utf-8?B?bzk1cWJkejFtcnkxOEFnYzRjbUtDYm1TV0xYR1B0dFBib2VldjNnK2tVRHly?=
 =?utf-8?B?K29OVlpwcTd2eFFsTFpZRlJzVUtESXJYZVN2T2F2QjVDaEZuUERaWG5xckhV?=
 =?utf-8?B?dFZxcWU0VWhkNE9GdkwzLzNyT2I2cE0xZFZwNHBrL3lSckVDQXFpVWY4MFVa?=
 =?utf-8?B?dytHZzYya0NPMytwbGtObGxCOWpSN0xUNVB5RmJMNXVBRnRhVGZ5bkhsN3VM?=
 =?utf-8?B?TEFVV0Y2NU8zY3RCZjh6MEN5OVJwdkt0NjdUR05XQUhUeTJlMjBoaU8yb3BJ?=
 =?utf-8?B?bHdhWHczYVJ4bnlhT09teWVqVGpLM25xSHVKY0s0Vk1vUkppYTZIWjZNNnBm?=
 =?utf-8?B?aE9pZWRPQ3ZITjVTWERBOWhWVGFUQmF0ZVdRMUpBNHFZQUlWV1hySUlBMFNM?=
 =?utf-8?B?MllJQnV5WVFQRXU4K1hYNFplemloWDM1S0lOVXM0T3VJaDVMU2FhWEtHSU5H?=
 =?utf-8?B?cHJVSS9TL3lBdkl0K05LTHlia1VacHdtbnEraUl5OHhNa3d1M2lhRjAvTTA5?=
 =?utf-8?B?QW85Rkw1VVZNczFUT0huSnV6UXY3WlRFcHRoZm5GTTlHRXZYUEViZitHYkpT?=
 =?utf-8?B?UEtLUHZva3dhZnFGK0ZhMmxzbzkrYlMvb3FkQ04zQ0RwTGExSi9rZ0RCWTdD?=
 =?utf-8?B?bW9PM3RLdUw1WG1pMHg2Qk9lY05EMkhNZzJtdXdpY0hveno0S3QxczJhcXY3?=
 =?utf-8?B?TnJlWWY1Vjh2KzV6UVhaSjFHUG9oa1l4em43WkJpM0lhb1ZPTFVteUgvY0lw?=
 =?utf-8?B?enUycTF1dW5rajd0K2VmZ1poK1dteUNWeWE3N2hwblEwTE1zVElTRTNUUlpz?=
 =?utf-8?B?eXlTYmhLUDRGTTc4bUpLR2U3V0hyZTRGaFJwTzZTdGkrMFNEb1RlRHFVQ3hs?=
 =?utf-8?B?UXBGbVZjZnJiKzBzbEROajVzd0xXRnp4YWVVd2hndXhMUXZzMXlHNWVrUDB3?=
 =?utf-8?B?NFFuTUowc2xEdytvUVQrR0sra2l0NUlEMHlqbWNVL3lGY0w3NWJyMW9XV1B1?=
 =?utf-8?B?MHRMZXg0WEdJa2ZJdUdkR3pGc2RPWDhnaWVzS1ArVWhRRzVlcDQxTUtUOFJF?=
 =?utf-8?B?UnYrMXlOVUJBYTNjUlZ3YzlRMHhDWHByMEFZdmxjSEQ5T0daM2oxcVdVVjU1?=
 =?utf-8?B?ZHgxREVXRmtqUG4yTlJaS3ZYd25obnVsL1QwQ0MwenkwdVRSYzA0aU9aU1RO?=
 =?utf-8?B?ZUdlbWtWRDJrTGlPZXRBRTByR0h3ckZ6dkVPbUZGV204YXdaWTE0SHFYY3A0?=
 =?utf-8?B?cHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 26423380-1fef-492c-7194-08ddcfddbfdc
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 02:55:47.1829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui6KyqCsbD6qxMDF1TjrWjPhVEl8FNqtgqekNYXeEqKkuYZK+g/juojPwySHlTXzMbSWhDUI7a2yv8Vvw8sr1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5981
X-OriginatorOrg: intel.com

hi, Jonathan,

On Mon, Jul 21, 2025 at 11:06:33AM -0500, Jonathan Denose wrote:
> On Thu, Jul 17, 2025 at 6:59 PM Philip Li <philip.li@intel.com> wrote:
> >
> > On Thu, Jul 17, 2025 at 01:43:28PM -0500, Jonathan Denose wrote:
> > > On Tue, Jul 15, 2025 at 6:36 AM kernel test robot <lkp@intel.com> wrote:
> > > > kernel test robot noticed the following build errors:
> > > >
> > > > [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]
> > > >
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/HID-add-haptics-page-defines/20250714-231444
> > > > base:   86731a2a651e58953fc949573895f2fa6d456841
> > > > patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v1-11-71c7c05748c9%40google.com
> > > > patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch support
> > > > config: hexagon-randconfig-r112-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> > > > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > > > reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/reproduce)
> > >
> > > I'm having trouble reproducing this build error. I tried following the
> >
> > Sorry Jonathan, the reproduce step we provide is wrong, would you mind to give
> > a try similar to the steps in [1]? We will resolve the bug as early as possible.
> >
> > [1] https://download.01.org/0day-ci/archive/20250717/202507170506.Wzz1lR5I-lkp@intel.com/reproduce
> >
> > > steps in the linked reproduce file, but when running:
> > > COMPILER_INSTALL_PATH=$HOME/0day ~/lkp-tests/kbuild/make.cross C=1
> > > CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited
> > > -fmax-warnings=unlimited' O=build_dir ARCH=hexagon olddefconfig
> > >
> > > I get the errors:
> > > 0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown C compiler
> > > scripts/Kconfig.include:45: Sorry, this C compiler is not supported.
> > >
> > > It looks to me like the hexagon-linux-gcc compiler is correctly
> > > installed at $HOME/0day so I'm not sure what to do from here. Can
> > > someone please assist me with this?
> > >
> > > --
> > > Jonathan
> > >
> Great! Thanks for providing the correct reproduce steps Phillip.
> 
> I tried them and both of the make.cross steps completed successfully.
> I am not getting the build errors that the test bot is reporting.

sorry for this. just want to confirm one thing, did you follow below steps?
(the link [1] above is just for example, we need do small modification to
reproduce the issue in original report, there are 4 diff in below with [1],
(1) use your commit, (2) 'wget' command to get correct config (3) change to
use clang-17, btw, clang-20 can also reproduce the issue (4) change build
source to 'drivers/hid')

reproduce:
        git clone https://github.com/intel/lkp-tests.git ~/lkp-tests
        # https://github.com/intel-lab-lkp/linux/commit/4ccef2fdc95970f67857113edb4103d53205ac9c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jonathan-Denose/HID-add-haptics-page-defines/20250714-231444
        git checkout 4ccef2fdc95970f67857113edb4103d53205ac9c
        # save the config file
        wget https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-17 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang-17 ~/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hid/


I can reproduce the issue with above steps, if you still cannot reproduce,
could you give me your full log? below is mine just FYI (this is for clang-20,
and I use some different folders but not important)

xsang@xsang-OptiPlex-9020:~/linux$ COMPILER_INSTALL_PATH=/home/xsang/cross-compiler/ COMPILER=clang-20 /home/xsang/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
Compiler will be installed in /home/xsang/cross-compiler/
lftpget -c https://cdn.kernel.org/pub/tools/llvm/files/./llvm-20.1.8-x86_64.tar.xz
/home/xsang/linux
tar Jxf /home/xsang/cross-compiler//./llvm-20.1.8-x86_64.tar.xz -C /home/xsang/cross-compiler/
PATH=/home/xsang/cross-compiler//llvm-20.1.8-x86_64/bin:/home/xsang/.local/bin:/home/xsang/bin:/home/xsang/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/xsang/.local/bin
make --keep-going LLVM=1 CROSS_COMPILE=hexagon-linux- --jobs=72 KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 O=build_dir ARCH=hexagon olddefconfig
make[1]: Entering directory '/home/xsang/linux/build_dir'
  GEN     Makefile
  HOSTCC  scripts/basic/fixdep
  HOSTCC  scripts/kconfig/conf.o
  HOSTCC  scripts/kconfig/confdata.o
  HOSTCC  scripts/kconfig/expr.o
  LEX     scripts/kconfig/lexer.lex.c
  YACC    scripts/kconfig/parser.tab.[ch]
  HOSTCC  scripts/kconfig/menu.o
  HOSTCC  scripts/kconfig/preprocess.o
  HOSTCC  scripts/kconfig/symbol.o
  HOSTCC  scripts/kconfig/util.o
  HOSTCC  scripts/kconfig/lexer.lex.o
  HOSTCC  scripts/kconfig/parser.tab.o
  HOSTLD  scripts/kconfig/conf
#
# configuration written to .config
#
make[1]: Leaving directory '/home/xsang/linux/build_dir'


xsang@xsang-OptiPlex-9020:~/linux$ COMPILER_INSTALL_PATH=/home/xsang/cross-compiler/ COMPILER=clang-20 /home/xsang/lkp-tests/kbuild/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hid/
Compiler will be installed in /home/xsang/cross-compiler/
PATH=/home/xsang/cross-compiler//llvm-20.1.8-x86_64/bin:/home/xsang/.local/bin:/home/xsang/bin:/home/xsang/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/xsang/.local/bin
make --keep-going LLVM=1 CROSS_COMPILE=hexagon-linux- --jobs=72 KCFLAGS= -Wno-error=return-type -Wreturn-type -funsigned-char -Wundef W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/hid/
make[1]: Entering directory '/home/xsang/linux/build_dir'
  GEN     Makefile
  GENSEED scripts/basic/randstruct.seed
  WRAP    arch/hexagon/include/generated/uapi/asm/ucontext.h
  WRAP    arch/hexagon/include/generated/uapi/asm/auxvec.h
  WRAP    arch/hexagon/include/generated/uapi/asm/bitsperlong.h
  WRAP    arch/hexagon/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/hexagon/include/generated/uapi/asm/errno.h
  WRAP    arch/hexagon/include/generated/uapi/asm/fcntl.h
  UPD     include/generated/uapi/linux/version.h
  WRAP    arch/hexagon/include/generated/uapi/asm/ioctl.h
  WRAP    arch/hexagon/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/hexagon/include/generated/uapi/asm/ioctls.h
  WRAP    arch/hexagon/include/generated/uapi/asm/mman.h
  WRAP    arch/hexagon/include/generated/uapi/asm/msgbuf.h
  WRAP    arch/hexagon/include/generated/uapi/asm/poll.h
  WRAP    arch/hexagon/include/generated/uapi/asm/posix_types.h
  WRAP    arch/hexagon/include/generated/uapi/asm/resource.h
  WRAP    arch/hexagon/include/generated/uapi/asm/sembuf.h
  WRAP    arch/hexagon/include/generated/uapi/asm/shmbuf.h
  WRAP    arch/hexagon/include/generated/uapi/asm/siginfo.h
  WRAP    arch/hexagon/include/generated/uapi/asm/sockios.h
  WRAP    arch/hexagon/include/generated/uapi/asm/socket.h
  WRAP    arch/hexagon/include/generated/uapi/asm/stat.h
  WRAP    arch/hexagon/include/generated/uapi/asm/statfs.h
  WRAP    arch/hexagon/include/generated/uapi/asm/termbits.h
  WRAP    arch/hexagon/include/generated/uapi/asm/types.h
  WRAP    arch/hexagon/include/generated/uapi/asm/termios.h
  SYSHDR  arch/hexagon/include/generated/uapi/asm/unistd_32.h
  UPD     include/config/kernel.release
  UPD     include/generated/compile.h
  HOSTCC  scripts/dtc/dtc.o
  HOSTCC  scripts/dtc/flattree.o
  HOSTCC  scripts/dtc/fstree.o
  HOSTCC  scripts/dtc/data.o
  HOSTCC  scripts/dtc/livetree.o
  HOSTCC  scripts/dtc/treesource.o
  HOSTCC  scripts/dtc/srcpos.o
  HOSTCC  scripts/dtc/checks.o
  HOSTCC  scripts/dtc/util.o
  LEX     scripts/dtc/dtc-lexer.lex.c
  YACC    scripts/dtc/dtc-parser.tab.[ch]
  HOSTCC  scripts/dtc/libfdt/fdt.o
  HOSTCC  scripts/dtc/libfdt/fdt_ro.o
  UPD     include/generated/utsrelease.h
  HOSTCC  scripts/dtc/libfdt/fdt_wip.o
  HOSTCC  scripts/dtc/libfdt/fdt_sw.o
  HOSTCC  scripts/dtc/libfdt/fdt_rw.o
  HOSTCC  scripts/dtc/libfdt/fdt_strerror.o
  HOSTCC  scripts/dtc/libfdt/fdt_empty_tree.o
  HOSTCC  scripts/dtc/libfdt/fdt_addresses.o
  HOSTCC  scripts/dtc/libfdt/fdt_overlay.o
  HOSTCC  scripts/dtc/fdtoverlay.o
  WRAP    arch/hexagon/include/generated/asm/extable.h
  WRAP    arch/hexagon/include/generated/asm/iomap.h
  WRAP    arch/hexagon/include/generated/asm/kvm_para.h
  WRAP    arch/hexagon/include/generated/asm/mcs_spinlock.h
  WRAP    arch/hexagon/include/generated/asm/text-patching.h
  WRAP    arch/hexagon/include/generated/asm/archrandom.h
  WRAP    arch/hexagon/include/generated/asm/barrier.h
  WRAP    arch/hexagon/include/generated/asm/bug.h
  WRAP    arch/hexagon/include/generated/asm/cfi.h
  WRAP    arch/hexagon/include/generated/asm/compat.h
  WRAP    arch/hexagon/include/generated/asm/current.h
  WRAP    arch/hexagon/include/generated/asm/device.h
  WRAP    arch/hexagon/include/generated/asm/div64.h
  WRAP    arch/hexagon/include/generated/asm/dma-mapping.h
  WRAP    arch/hexagon/include/generated/asm/emergency-restart.h
  WRAP    arch/hexagon/include/generated/asm/ftrace.h
  WRAP    arch/hexagon/include/generated/asm/hardirq.h
  WRAP    arch/hexagon/include/generated/asm/hw_irq.h
  WRAP    arch/hexagon/include/generated/asm/irq_regs.h
  WRAP    arch/hexagon/include/generated/asm/irq_work.h
  WRAP    arch/hexagon/include/generated/asm/kdebug.h
  WRAP    arch/hexagon/include/generated/asm/kmap_size.h
  WRAP    arch/hexagon/include/generated/asm/kprobes.h
  WRAP    arch/hexagon/include/generated/asm/local.h
  WRAP    arch/hexagon/include/generated/asm/local64.h
  WRAP    arch/hexagon/include/generated/asm/mmiowb.h
  WRAP    arch/hexagon/include/generated/asm/module.h
  WRAP    arch/hexagon/include/generated/asm/module.lds.h
  WRAP    arch/hexagon/include/generated/asm/msi.h
  WRAP    arch/hexagon/include/generated/asm/pci.h
  WRAP    arch/hexagon/include/generated/asm/percpu.h
  WRAP    arch/hexagon/include/generated/asm/preempt.h
  WRAP    arch/hexagon/include/generated/asm/rqspinlock.h
  WRAP    arch/hexagon/include/generated/asm/runtime-const.h
  WRAP    arch/hexagon/include/generated/asm/rwonce.h
  WRAP    arch/hexagon/include/generated/asm/sections.h
  WRAP    arch/hexagon/include/generated/asm/serial.h
  WRAP    arch/hexagon/include/generated/asm/shmparam.h
  WRAP    arch/hexagon/include/generated/asm/simd.h
  WRAP    arch/hexagon/include/generated/asm/softirq_stack.h
  WRAP    arch/hexagon/include/generated/asm/topology.h
  WRAP    arch/hexagon/include/generated/asm/trace_clock.h
  WRAP    arch/hexagon/include/generated/asm/vga.h
  WRAP    arch/hexagon/include/generated/asm/video.h
  WRAP    arch/hexagon/include/generated/asm/word-at-a-time.h
  WRAP    arch/hexagon/include/generated/asm/xor.h
  SYSTBL  arch/hexagon/include/generated/asm/syscall_table_32.h
  HOSTCC  scripts/dtc/dtc-lexer.lex.o
  HOSTCC  scripts/dtc/dtc-parser.tab.o
  HOSTLD  scripts/dtc/fdtoverlay
  HOSTLD  scripts/dtc/dtc
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/asn1_compiler
  HOSTCC  scripts/insert-sys-cert
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  CC      kernel/bounds.s
  CHKSHA1 ../include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 ../include/linux/atomic/atomic-instrumented.h
  CHKSHA1 ../include/linux/atomic/atomic-long.h
  UPD     include/generated/timeconst.h
  UPD     include/generated/bounds.h
  CC      arch/hexagon/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    ../scripts/checksyscalls.sh
  CC      drivers/hid/hid-core.o
  CC      drivers/hid/hid-input.o
  CC      drivers/hid/hid-quirks.o
  CC      drivers/hid/hid-debug.o
  CC      drivers/hid/hid-haptic.o
  CC [M]  drivers/hid/usbhid/hid-core.o
  CC      drivers/hid/hidraw.o
  CC [M]  drivers/hid/usbhid/hiddev.o
  CC [M]  drivers/hid/usbhid/hid-pidff.o
  CC      drivers/hid/hid-a4tech.o
  CC      drivers/hid/hid-alps.o
  CC      drivers/hid/hid-apple.o
  CC      drivers/hid/hid-belkin.o
  CC      drivers/hid/hid-cherry.o
  CC      drivers/hid/hid-cmedia.o
  CC      drivers/hid/hid-cougar.o
  CC      drivers/hid/hid-ezkey.o
  CC      drivers/hid/hid-icade.o
  CC      drivers/hid/hid-ite.o
  CC      drivers/hid/hid-jabra.o
  CC      drivers/hid/hid-kensington.o
  CC      drivers/hid/hid-ortek.o
  CC      drivers/hid/hid-razer.o
  CC      drivers/hid/hid-rmi.o
  CC      drivers/hid/hid-saitek.o
  CC      drivers/hid/hid-sjoy.o
  CC      drivers/hid/hid-tivo.o
  CC      drivers/hid/hid-udraw-ps3.o
  CC      drivers/hid/hid-led.o
  CC      drivers/hid/hid-wiimote-core.o
  CC      drivers/hid/hid-wiimote-modules.o
  CC      drivers/hid/hid-wiimote-debug.o
  CC [M]  drivers/hid/uhid.o
  CC [M]  drivers/hid/hid-generic.o
  CC [M]  drivers/hid/hid-axff.o
  CC [M]  drivers/hid/hid-appleir.o
  CC [M]  drivers/hid/hid-asus.o
  CC [M]  drivers/hid/hid-aureal.o
  CC [M]  drivers/hid/hid-betopff.o
  CC [M]  drivers/hid/hid-bigbenff.o
  CC [M]  drivers/hid/hid-chicony.o
  CC [M]  drivers/hid/hid-corsair.o
  CC [M]  drivers/hid/hid-corsair-void.o
  CC [M]  drivers/hid/hid-cp2112.o
  CC [M]  drivers/hid/hid-cypress.o
  CC [M]  drivers/hid/hid-emsff.o
  CC [M]  drivers/hid/hid-elan.o
  CC [M]  drivers/hid/hid-elo.o
  CC [M]  drivers/hid/hid-gembird.o
  CC [M]  drivers/hid/hid-gfrm.o
  CC [M]  drivers/hid/hid-vivaldi-common.o
  CC [M]  drivers/hid/hid-google-stadiaff.o
  CC [M]  drivers/hid/hid-vivaldi.o
  CC [M]  drivers/hid/hid-gt683r.o
  CC [M]  drivers/hid/hid-gyration.o
  CC [M]  drivers/hid/hid-holtek-kbd.o
  CC [M]  drivers/hid/hid-holtek-mouse.o
  CC [M]  drivers/hid/hid-holtekff.o
  CC [M]  drivers/hid/hid-kye.o
  CC [M]  drivers/hid/hid-kysona.o
  CC [M]  drivers/hid/hid-letsketch.o
  CC [M]  drivers/hid/hid-macally.o
  CC [M]  drivers/hid/hid-magicmouse.o
  CC [M]  drivers/hid/hid-mcp2221.o
  CC [M]  drivers/hid/hid-megaworld.o
  CC [M]  drivers/hid/hid-microsoft.o
  CC [M]  drivers/hid/hid-nintendo.o
  CC [M]  drivers/hid/hid-nti.o
  CC [M]  drivers/hid/hid-pl.o
  CC [M]  drivers/hid/hid-penmount.o
  CC [M]  drivers/hid/hid-picolcd_core.o
  CC [M]  drivers/hid/hid-picolcd_fb.o
  CC [M]  drivers/hid/hid-picolcd_backlight.o
  CC [M]  drivers/hid/hid-picolcd_leds.o
  CC [M]  drivers/hid/hid-picolcd_cir.o
  CC [M]  drivers/hid/hid-picolcd_debugfs.o
../drivers/hid/hid-haptic.c:13:6: error: redefinition of 'hid_haptic_feature_mapping'
   13 | void hid_haptic_feature_mapping(struct hid_device *hdev,
      |      ^
../drivers/hid/hid-haptic.h:83:6: note: previous definition is here
   83 | void hid_haptic_feature_mapping(struct hid_device *hdev,
      |      ^
../drivers/hid/hid-haptic.c:51:6: error: redefinition of 'hid_haptic_check_pressure_unit'
   51 | bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
      |      ^
../drivers/hid/hid-haptic.h:89:6: note: previous definition is here
   89 | bool hid_haptic_check_pressure_unit(struct hid_haptic_device *haptic,
      |      ^
../drivers/hid/hid-haptic.c:65:5: error: redefinition of 'hid_haptic_input_mapping'
   65 | int hid_haptic_input_mapping(struct hid_device *hdev,
      |     ^
../drivers/hid/hid-haptic.h:95:5: note: previous definition is here
   95 | int hid_haptic_input_mapping(struct hid_device *hdev,
      |     ^
../drivers/hid/hid-haptic.c:81:5: error: redefinition of 'hid_haptic_input_configured'
   81 | int hid_haptic_input_configured(struct hid_device *hdev,
      |     ^
../drivers/hid/hid-haptic.h:104:5: note: previous definition is here
  104 | int hid_haptic_input_configured(struct hid_device *hdev,
      |     ^
../drivers/hid/hid-haptic.c:403:5: error: redefinition of 'hid_haptic_init'
  403 | int hid_haptic_init(struct hid_device *hdev,
      |     ^
../drivers/hid/hid-haptic.h:114:5: note: previous definition is here
  114 | int hid_haptic_init(struct  CC [M]  drivers/hid/hid-redragon.o
 hid_device *hdev, struct hid_haptic_device **haptic_ptr)
      |     ^
../drivers/hid/hid-haptic.c:569:6: error: redefinition of 'hid_haptic_pressure_reset'
  569 | void hid_haptic_pressure_reset(struct hid_haptic_device *haptic)
      |      ^
../drivers/hid/hid-haptic.h:126:6: note: previous definition is here
  126 | void hid_haptic_pressure_reset(struct hid_haptic_device *haptic) {}
      |      ^
../drivers/hid/hid-haptic.c:575:6: error: redefinition of 'hid_haptic_pressure_increase'
  575 | void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
      |      ^
../drivers/hid/hid-haptic.h:128:6: note: previous definition is here
  128 | void hid_haptic_pressure_increase(struct hid_haptic_device *haptic,
      |   CC [M]  drivers/hid/hid-retrode.o
     ^
7 errors generated.
make[5]: *** [../scripts/Makefile.build:287: drivers/hid/hid-haptic.o] Error 1
  CC [M]  drivers/hid/hid-roccat.o
  CC [M]  drivers/hid/hid-roccat-common.o
  CC [M]  drivers/hid/hid-roccat-arvo.o
  CC [M]  drivers/hid/hid-roccat-isku.o
  CC [M]  drivers/hid/hid-roccat-kone.o
  CC [M]  drivers/hid/hid-roccat-koneplus.o
  CC [M]  drivers/hid/hid-roccat-konepure.o
  CC [M]  drivers/hid/hid-roccat-kovaplus.o
  CC [M]  drivers/hid/hid-roccat-lua.o
  CC [M]  drivers/hid/hid-roccat-pyra.o
  CC [M]  drivers/hid/hid-roccat-ryos.o
  CC [M]  drivers/hid/hid-roccat-savu.o
  CC [M]  drivers/hid/hid-samsung.o
  CC [M]  drivers/hid/hid-sony.o
  CC [M]  drivers/hid/hid-steam.o
  CC [M]  drivers/hid/hid-sunplus.o
  CC [M]  drivers/hid/hid-gaff.o
  CC [M]  drivers/hid/hid-tmff.o
  CC [M]  drivers/hid/hid-thrustmaster.o
  CC [M]  drivers/hid/hid-uclogic-core.o
  CC [M]  drivers/hid/hid-uclogic-rdesc.o
  CC [M]  drivers/hid/hid-uclogic-params.o
  CC [M]  drivers/hid/hid-xinmo.o
  CC [M]  drivers/hid/hid-zpff.o
  CC [M]  drivers/hid/hid-vrc2.o
  CC [M]  drivers/hid/wacom_sys.o
  CC [M]  drivers/hid/wacom_wac.o
  CC [M]  drivers/hid/hid-waltop.o
  CC [M]  drivers/hid/hid-winwing.o
  CC [M]  drivers/hid/hid-uclogic-rdesc-test.o
  LD [M]  drivers/hid/usbhid/usbhid.o
  LD [M]  drivers/hid/hid-uclogic-test.o
  LD [M]  drivers/hid/hid-picolcd.o
  LD [M]  drivers/hid/hid-uclogic.o
  LD [M]  drivers/hid/wacom.o
make[5]: Target 'drivers/hid/' not remade because of errors.
make[4]: *** [../scripts/Makefile.build:554: drivers/hid] Error 2
make[4]: Target 'drivers/hid/' not remade because of errors.
make[3]: *** [../scripts/Makefile.build:554: drivers] Error 2
make[3]: Target 'drivers/hid/' not remade because of errors.
make[2]: *** [/home/xsang/linux/Makefile:2003: .] Error 2
make[2]: Target 'drivers/hid/' not remade because of errors.
make[1]: *** [/home/xsang/linux/Makefile:248: __sub-make] Error 2
make[1]: Target 'drivers/hid/' not remade because of errors.
make[1]: Leaving directory '/home/xsang/linux/build_dir'
make: *** [Makefile:248: __sub-make] Error 2
make: Target 'drivers/hid/' not remade because of errors.



> -- 
> Jonathan
> 

