Return-Path: <linux-input+bounces-8366-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 009209E26E4
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 17:18:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8FE616ABC5
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 16:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 661C51F8919;
	Tue,  3 Dec 2024 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bg68/SyN"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BCF1EE00B;
	Tue,  3 Dec 2024 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242531; cv=fail; b=Nltof6H6zE/MsXC1xxFzvH5GZymCt3GWPqeFSKGDNw65zNmp8jljc+1qvK7j7zwZjUN3ihQs5IXRy4G4k5x4xuOnSX4oxF/M7aCVFWIL1BR6HRHNI1m3DJN3iqI846DnV8JqMKOFjmL3bgWQg4VMYxHijzbzluM1Dugc5KB/Id8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242531; c=relaxed/simple;
	bh=MFIn+L3oJL28qSxLqUdwontACV+Hra2XJj8s7o8lROI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WM4A8E9CdweyOWn+nvdHUVW0x8KsFWtPyHsF2095YJUKGuYf94Ea6rUTsJwhTz/g0UjhYSlLUVgzrR00pZjowohvvn1lZbrqUjcdEP+hWRADmUM9ZFNpMbZDBd2tsZsI/6vau1RsL8vAOozUeiNnUeQnxGGnpJkJK635n2iIPs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bg68/SyN; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733242529; x=1764778529;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MFIn+L3oJL28qSxLqUdwontACV+Hra2XJj8s7o8lROI=;
  b=bg68/SyNl3oB7BCJe5JcA7Z6xbvHmP1CpsjI5IDBedFB+ez4R5YbQP+R
   FRge30Aa2ZWMVKmFBdtE6mUAHHX3jui4b+MYHBbsfkHxgb3P+EBrlN5bx
   hWr6BNPkOI1uofMVB9PohJL0rwLoCF07kpdE4RdXYRoGLqIJU77cxrQl9
   OkzAAtmPrslSGDZh9uw7MZUdZ2ZSE9gsgiyJ7vKeF6IkF7g+sd6T9kTgO
   eW1cdADiPWhQ4jJv/ihd9UHM01O8JkW4QEU+nUhX7PHNdlkFsxj1Ck7IJ
   e+VrMIkIntqABINKmua+eAfhF8l3pT4tQxDF0dPAJKm/YazqnWWlYTyhT
   Q==;
X-CSE-ConnectionGUID: iDb/E1qBTpaabkNmSORDdw==
X-CSE-MsgGUID: FNkIwZiuQsiF68iApwPEIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33386174"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33386174"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 08:15:25 -0800
X-CSE-ConnectionGUID: Nhu2cJbNRhOushdMDGAB9w==
X-CSE-MsgGUID: VDPOZgNJTvWkHXB9qDZeMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="97920836"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 08:15:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 08:15:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 08:15:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 08:14:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBs3Z2X5CLLvtTd0eEEbto9L8XiejVxYFGMhJ2M2bqDb06jPvJDqRx8xWGCbM0vpt1c6tmdF5W4yRh/KfpcLx7a3mUCEcJup64y2aKXfWgaR7U45Iul66wdI1SU8yr2p++U6OG/jVQwzgR46PHp8BRrnpuLhICHE7GRZ3HXRujY8DPELkbaJh+3CSKQHllSLmWSn0ruZYkx0BC2WOXWrniPENdMtulJ4fWIWZdZStTPqwqR01cXRzCR4GjTkscGzRcRrcsXgGZL1LRmm1LHZj900GDifAJ0FTZtDbX58os0WVQaGnx/yoz+Xr7SwxXgSKkz5sOBEKVZJuahppW12Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdaOR8VpH+w3IJBPVPBkwH3CEDeM2cm+IWoUpbNcf+k=;
 b=SR15rdy6PLFDcP1c892sOmlYKBkg+6dLcv6wtXRUcjKZ9eKQ3yooNLh5QHudSAFF04bj1/3w9nKiAXufif/jva2F/qiTrzD5Z/0FhbR/DOhG07dfzq00KlGb4HlkODu4DClPui3WN+ypFulbXj7y2Bsfv584dwBukEzBsJHQrCpBuiC38/BRqOZ+DtcjbkieB4zphMGT/ylOKGBgrmc8dkTL8p3Swwi2PMCruTlvj5iSkOo0m+xqVfD312gT1ySGrDi2UntinQYAqhFrsb9dtYDFMRMucGH63ECrvkD7R8Jc5u4OMsz3Lz0PEKLThZJyKpNaxuw+fZDtNAwEjZYPxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DM4PR11MB6214.namprd11.prod.outlook.com (2603:10b6:8:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Tue, 3 Dec 2024 16:14:37 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:14:37 +0000
Message-ID: <2075e22b-f6ec-4868-8880-cad78a6a35d9@intel.com>
Date: Tue, 3 Dec 2024 17:14:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 14/30] ASoC: usb: Create SOC USB SND jack kcontrol
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
 <20241106193413.1730413-15-quic_wcheng@quicinc.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20241106193413.1730413-15-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::17) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DM4PR11MB6214:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0f6c6d-e13b-40e5-a6f0-08dd13b5953a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NzVSQkRRcUNqUnZVbDEyN05VeTBBVFBsWGZXeWFLand2Z0dhQWx1d2Q5Nldn?=
 =?utf-8?B?S0JPanVnY1hzaEFxQ0twdndDRzJxSThyQjMvK1RCQStya21CN0JXVis1cGUx?=
 =?utf-8?B?Y0ovN0VtZjNGSEVkOTk4RUtyNDFFMEZpQnBuNWRjSURNUHRkMXB4UVBMck9m?=
 =?utf-8?B?YXZWQ09DeEtNSG9jVnhkcG5tUmE3b1lCY1VGMWR1YVpUVzNGMmp4a0lVQ0U4?=
 =?utf-8?B?TlV2QzEvbHQxTFpOT0ZrdGhxZHJ1NitKdGxsckJ1OVU5a2xxcVltMW1BVDBq?=
 =?utf-8?B?cFVUd2FMYmRNaDZnMFRGcDdXa1p4VnlMc3doU3JNQjdoZTFBenhYL09iNW9O?=
 =?utf-8?B?eGQ5M3VQdkNRNXpRZmVkS1FKQzdmZTNocktqcUJtbmhRemVyenlNM1R0RDhH?=
 =?utf-8?B?UkNQOHlBekY5N2tvUVFiUERIU1IrUDlvcXhQQlVMMVNOMFFlb0FRK1BvMWpI?=
 =?utf-8?B?dllTWHQvNnRHbDE0alJ0c0l1cDJYMDU3WVRNYjJIbm9VNzZkbGhQczFFQ0sx?=
 =?utf-8?B?OVlmWC85a2VMWWVONnJVNHg4bEwyM0cyUC9TMm9iUFUzZWtPTHdBMXYrajNZ?=
 =?utf-8?B?RG04S1NDSTRYdlNsblZmWUs2MFNVL2ZDV1VrK3NTSmVpbGpldkl1Y0NTNW04?=
 =?utf-8?B?NjlyQjZuTUlXRFFqbUN5WmgzdWZTOXJwS29hM0VkaDN0SHIwM2xHZE5NZTMw?=
 =?utf-8?B?Y2s5cUxVS2VPcVlEZU0zUFIyRFhCNEFKTCtrZ3g2eUFYY2hxYmliaFozaEg1?=
 =?utf-8?B?Ykp2MlIzYnYxbkxrV2ppOE84eFRJNVdQSTRDV0VqTTdTb3VlS3dwMnB3UXI2?=
 =?utf-8?B?YzdGQUFhOE85YXBNUjFkbVhaRnNtMURLa1B4U0E4OURiYVV5a3p6V011aHlo?=
 =?utf-8?B?ZEFnQzF5aWwyaTlabFd4NHQ2RE9NVStldzNqYlczZGtEU1RTR1hGSCtMZU0v?=
 =?utf-8?B?ZlRLc09wSC93MC9obXY1WmpYdFFaTW1aaDVxZjdFVUhaWHdZWXlaUkhOa042?=
 =?utf-8?B?SUx0Z0drVDIySHpSN29qZlMwbVZyQWtTcTJLNmUzWFk0U1QwQzRwOTlmaFhs?=
 =?utf-8?B?eFdxM1pZVnpFaWVUYTdEc0p1dElMMFNlV3F0UXVWWHUraXc4ODB1dzlvaU5r?=
 =?utf-8?B?alUrR21vQWJWZXBLMHRITndIVzFMYmpDbERDV1dPQ3ZIUHcxYWRpUUpXNnZp?=
 =?utf-8?B?ZjFNeDVsajJhN0x1MGpsVEtodUhxNldPQ2x6dm9taHNucHk2bkJGY2lpK25S?=
 =?utf-8?B?YVNXV2JJUXVhQ2lBSll6a0xXVmVwMUMvK3h4TWdoaHpSSFJzalRxbU16R3dF?=
 =?utf-8?B?VDFBbzZXUFRQUzdtb3FTQlBWZ3kzMnJ3cEVOK0kzQjI0bjhaUTlWMW9tcU9o?=
 =?utf-8?B?VllJbzVMRXErQ0pHR3VGUXVRSEJJUFdONjRPN0xMcWd2RWtQZXpxWjBvb3Br?=
 =?utf-8?B?aWVIUnFGZkVUSkdmUGNEUEJaNy9UbHRValdRdzE1YmFORFdDU1YzK2oxREUr?=
 =?utf-8?B?WWRLUTQ5SHFqY3Zub2pKT2tuWkNYaFdha3NUc0Vkci9oWk8zYXRUODk0ZHVS?=
 =?utf-8?B?Rk1FQ3NyeUJJOUs0djBwaDZGYXFzY3Z1bDFKQkEzclRzS0JBWEQ3V3NwaEwy?=
 =?utf-8?B?NUhjYVM2RFV3dDdOMlhqS1d5cTQ5eWFyTkZJQmVqOWNHa29CaFllMXkxeDBr?=
 =?utf-8?B?aDBDSkJiNldYYjJJaG5FNytvWFFYOEV4b1BVa1lvKzBtcU9Ra2dPTUZGN2Z2?=
 =?utf-8?B?bXVmNlZsRTZwUEhWNVhDeVB2dEwyY3M5SnVQMGJMTlNSNHJwTHd6aHdiaUkv?=
 =?utf-8?B?MGRRRlhpd2hFaWMvcHZDUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDRVRnNWVmkvWm1QY1RMNlBGTzJISjFtNlkySmpIbEk2NjdUZXB5b0E3Q0o1?=
 =?utf-8?B?elMzbVorVFJKd3dsQk9FZGdsais5WTl0dGNxQWROTzFYTmVYNnlBOTdNMzN0?=
 =?utf-8?B?NkpRK3k4Q2k2eVd1UE1WdXo4Wm5DelpBMllPcGZBZHNVRGdpdFVtMU1mVUR0?=
 =?utf-8?B?VTF3aFdyRndwVlpvSXZYcmRDVmNRMU1oSis2ZTRSMXl4eUxJZWFpb0pVZVdF?=
 =?utf-8?B?SVByQUI0VHdncm1PYVNaZHluczhrOXpYbC83SHkwSmo1OS9VV0JtMThrYW9j?=
 =?utf-8?B?NTFSdTVESldwa0dIOGxudWhkUFpOWGk4ellGb2Z0U0tXQzF5S1pDOHMrUUJU?=
 =?utf-8?B?ajB0UEJ2MjJwdFhOSzE0Um1sYVJHNllSYzFaQ2FBejBnYzFYcmx3cUFVRUNt?=
 =?utf-8?B?K20yZ1A2VzE0VzlSQytPeGYxbk9xM2NVTzR6ZEN4dUFVZkNUNjlDQ3d0cnJw?=
 =?utf-8?B?Z3JHUEdwc1JGdGxRaDFjQ3NpSGt6a1VlcTlSV0MwNjdUK2FVS25jVktXMGNM?=
 =?utf-8?B?M1d4UVJtNms2eURXa1o2RTExSEUrVklVbmpTUE5KTkpxblllOSt0Tkp5dGk0?=
 =?utf-8?B?cnJKenRndE15OHdUUGtNdHZycGpYUGZEWWE5MjRZdGk2bkRKTldFd0djWG80?=
 =?utf-8?B?QTZyc3I4RitpNmVQZjVzcHdlL1A3bkprL1VhdXBjZGkrWkY5U2w1azdKTXhn?=
 =?utf-8?B?dzNXU2w4eXFMYUJpZFdoQ2x0UXNsUDZobkFBdTBZWVJNUUVad0szV2hGNitZ?=
 =?utf-8?B?OFc1THNhY1NYVE1VK2tTd2V2QkhzLzBFT204eUQ2ZVdQMFZUazVTSWg3VHpk?=
 =?utf-8?B?MmcyQ2k1RzJRWDdiSHBJc2NZcTR0RmlBQTNzbk9NK3lDUzlXRXF2TTFrbm5o?=
 =?utf-8?B?dldqNmV4ay94dEdMOEdNMWlac3V6UkhFYkhuZ09EWmdDZHZ3aXJrZENTcjY4?=
 =?utf-8?B?b1o5SmlWbE1mR0k0aEdiU2NzWmtVUTRjVXRFOU1YKzZ5dWNrbHBvaHUra2p4?=
 =?utf-8?B?RXZpUGNTWGVSSWpLamFabENIdWZseXB0Tkk2eVBsRnRiRy8zalF2WXQvNWow?=
 =?utf-8?B?RXMwQmpnMDc2ZXFKclNzUXMxYm82eW1vODJSWlVBOHNrbmZUOFo1bjZrcXhB?=
 =?utf-8?B?RXZNc3FZS0VzR2pLKytwZXcyVVpPZkZJdXM5VVo0b1RPTEU1bngrMXRvL0lH?=
 =?utf-8?B?Q2xXYVVsS3Uvb01lUFowanpwSGVXZSs1aWNGRnZKMjhsSGtydEtjbEJUcWJs?=
 =?utf-8?B?eDNvUWZOSmJOVU1zaEZ2bTRkanovbG9aZVAwRnRMaTNZbERiby9HZ3VkcHVU?=
 =?utf-8?B?T2t0ZTNpR2d0dTRPdW93MGUwMUFhN3l2RVlJeG9HTnE1ZE5wTmpZQ0JsUXBq?=
 =?utf-8?B?Tngwc1JTRGZvcDBSL0d3a3MvRTE5MGtCK1VFdDNtQlhvTnlxdW94bEJzZGhl?=
 =?utf-8?B?QjlxSU93V1FUVFBJR0hGS1ZGcFJYdXFsRTloZEJVYTdKaENqZ25lZ1lDNzVw?=
 =?utf-8?B?ZjlkcjJYRkVHY1VNNDltY2ZUWGdzeStzUEFNbldrVW15MVQvbW0vQ0g1RjFl?=
 =?utf-8?B?ZXM0RkZKSkZrN2gyYVRHU1dyaENGOE9SNDRrRXNXL2lBY3Nqb3F0dXc4YW9h?=
 =?utf-8?B?NjFSOUZlK05YaHJXNk1HSXJjQ3FDUVN1OHdVVlR2VWY5TmZrd2hEeUZ4TVB5?=
 =?utf-8?B?eUcyRENoaW9MdWRCdEFhdVVxcENlWExMbXdpdENUSHJRNGo1R2t4Q2oyTm02?=
 =?utf-8?B?b2QvSXFVNGlOZ3NZSDRmbmk3SWpHSkUrOGFoL0VKclBSakdPbzd4a1EyL0hu?=
 =?utf-8?B?UjNmZUVhUTdZQ3NuSXU3SmhoL3plcEd2cWVkOVZ5RU16dmhWRmhGdjZQeW5P?=
 =?utf-8?B?Qks3YTJRWkEzTFpzRHloTmJQNUVuUHZsUW9tQytqb1JKTHMrOUZOMjRkVDgy?=
 =?utf-8?B?N09vbGhaV1VHSDJJclFlZmNwVnQxVXo0MnZVRWlBcElRM05OL2xhUHpjdWt3?=
 =?utf-8?B?d2dHV2ovUi9uRXpSWEhzYkdxWDNOOXl3c3ZSUjNXNllXOTZkTi8vNXgzbFhL?=
 =?utf-8?B?QmJDQ3hocFdad09DcTZ6VDB5RXNEaSs5N1I2M2lVT1dIZ1ZCM0ZmQVZwd28y?=
 =?utf-8?B?NnE5TmM0WmZHRDk0QldVQUhJbnhzUDA1ZU1RdnEzNUtyeERYZ2traFY2MGZS?=
 =?utf-8?B?bHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0f6c6d-e13b-40e5-a6f0-08dd13b5953a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:14:37.2918
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /mYTd1mHlHbehts+PJUkLGaU00mOB/v6XhBUBiltjddwVzPNYnjYVMoiw2S6tMLRST/ZJ5Wb0BJkI90h3WOF/Yzbhzf2htgcCKE25YtaUFQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6214
X-OriginatorOrg: intel.com

On 2024-11-06 8:33 PM, Wesley Cheng wrote:
> Expose API for creation of a jack control for notifying of available
> devices that are plugged in/discovered, and that support offloading.  This
> allows for control names to be standardized across implementations of USB
> audio offloading.

...

> +/* SOC USB sound kcontrols */

I'd suggest to use 'SoC' over 'SOC'. The former is predominant in the 
ASoC code.

> +/**
> + * snd_soc_usb_setup_offload_jack() - Create USB offloading jack
> + * @component: USB DPCM backend DAI component
> + * @jack: jack structure to create
> + *
> + * Creates a jack device for notifying userspace of the availability
> + * of an offload capable device.
> + *
> + * Returns 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_setup_offload_jack(struct snd_soc_component *component,
> +				   struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_card_jack_new(component->card, "USB Offload Jack",
> +				    SND_JACK_USB, jack);
> +	if (ret < 0) {
> +		dev_err(component->card->dev, "Unable to add USB offload jack: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to set jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_setup_offload_jack);

Do we really need this one? Error reporting/handling for both 
invocations above is redundant, the log message should be provided by 
lower-level API. No need to pollute each caller with them. And with that 
part removed, we end up with basic ASoC calls, hardly a new-API candidate.

> +/**
> + * snd_soc_usb_disable_offload_jack() - Disables USB offloading jack
> + * @component: USB DPCM backend DAI component
> + *
> + * Disables the offload jack device, so that further connection events
> + * won't be notified.
> + *
> + * Returns 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_disable_offload_jack(struct snd_soc_component *component)
> +{
> +	int ret;
> +
> +	ret = snd_soc_component_set_jack(component, NULL, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to disable jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_disable_offload_jack);

Code duplication. ASoC already provides the API and the logging is 
redundant here.

> +/**
> + * snd_soc_usb_enable_offload_jack() - Enables USB offloading jack
> + * @component: USB DPCM backend DAI component
> + * @jack: offload jack to enable
> + *
> + * Enables the offload jack device, so that further connection events
> + * will be notified.  This is the complement to
> + * snd_soc_usb_disable_offload_jack().
> + *
> + * Returns 0 on success, negative on error.
> + *
> + */
> +int snd_soc_usb_enable_offload_jack(struct snd_soc_component *component,
> +				    struct snd_soc_jack *jack)
> +{
> +	int ret;
> +
> +	ret = snd_soc_component_set_jack(component, jack, NULL);
> +	if (ret) {
> +		dev_err(component->card->dev, "Failed to enable jack: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_enable_offload_jack);

Ditto.

>   /**
>    * snd_soc_usb_find_priv_data() - Retrieve private data stored
>    * @usbdev: device reference
> 


