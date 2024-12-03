Return-Path: <linux-input+bounces-8367-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF069E2891
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 18:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 880C6B35ECE
	for <lists+linux-input@lfdr.de>; Tue,  3 Dec 2024 16:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4611F8935;
	Tue,  3 Dec 2024 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwWBh2VU"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0741F8907;
	Tue,  3 Dec 2024 16:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733242600; cv=fail; b=Lg02G6L9VXMTCyHxB9wU56OJqtJYwq1wX1/Gbe7hZyxAovSK1tMHka9ONk68jt8ouCzkdyRcMopIdvlk9DOWPn2zezoev74BV5nGM4L5v7QhdVVFRYKPkjucF+nCAaXlLCxLgooDZhn10E2w2CMRQ1jZkZ0KvylPTgzUtshorBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733242600; c=relaxed/simple;
	bh=z2QRqKn5sdJLL8/90T7N1mQvoEoLGGbe5l+f7gcrDag=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WNsY6t1In7R63uiTqKe7WIM/0GUs5QOwZwj8g0PtDuYETzgsI3zl/kv8vpvFPtc4Tec1I+UxAAjS7nslBJjtrj0SZjuuuIVWb1HbHTPhJg/aEqPaSgeYKtStGhLqYmWMFCcx048Rme/uhrGXQxAlftx15glaGGHmQq/53IdCFMU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwWBh2VU; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733242599; x=1764778599;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=z2QRqKn5sdJLL8/90T7N1mQvoEoLGGbe5l+f7gcrDag=;
  b=PwWBh2VU95o2RdFFigqlRZ8sntFT71wu0tW94c7tP55gtJ3P2lLcgSCR
   Qg2VFQn0UQFziShOI8bpgDXBydv2lRugCe5Mby8rLj22wHZT2KdrYGB10
   P82umxDzRmsQ0lM9yl5o4PAKDHnt8+kBOwux/PDU+Xqle8JOqroXLOQ5L
   mM+M6awro8fc4GY50leQyWpg3XQZfnkRjw82xkGc13h1mhClEf0vOqiNR
   hZCbOFVYmbn7yHTXo6zn9CLj7Ds21UapDxkO4oNhm2CyivlcMQQm9oH0i
   ItH5tHVjIy3RMRO4krXE6l4mRVJaHyigK+mRTvUd1T9F4PltpU5cSp+ta
   A==;
X-CSE-ConnectionGUID: u33Q5HLOQ7KRldggdMo86A==
X-CSE-MsgGUID: gnmFvaJiQlGghcnIjap7Uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33615216"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; 
   d="scan'208";a="33615216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 08:16:37 -0800
X-CSE-ConnectionGUID: gjzljII3TxOvPevDoN6a/g==
X-CSE-MsgGUID: utL51XOuQA6iX/UpBaOsXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="98494000"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Dec 2024 08:16:38 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 08:16:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Dec 2024 08:16:37 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Dec 2024 08:16:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ughJ7SNRBiHqU3/pGDxT59AHO5TiWpjiUb9e/gE/zG9R+/uCndrv0ULmPBGz0MsGTi7amkIY/tdG9nqPA8pYtNfch7ZDDS3wG43Y8AvZOLFwr4hsT9giiTQjzYNHRGANsJlorjmExBUm80OD7WCRcLk5h0oAOWd2Y8FMpEFJoIrEn16V6A3TPV0GCkgc5rdcKYpGWYAiy5CtqtkfZuGwBHpvSCaXY942mV0lgSNwplX1Zr8gWijEiiDYaFTEO61DXg69cO6Kk0c7CUkT9b2TQMK1eDgbIGQFq4TQDDTZp+cQGndv9226qq0VNqI1wAsJ5WS2QFKG6U531goQ3AKKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r6O9MyzYDuB9e7J59ICKcc3FFs1RjYmAocmB1v01qmY=;
 b=acNIxsHzDc/EDRcf8yp1o4LdeFcakcJtd7kILdAknCyd+HG6ZpfVsFH/CTotoBZY2vJdHYrFq3vM+M/xcQedWHZKxZwLTnByDqqrGiGCuCK6slxEMm/6FNsN/zQQ1GVLrclnx/Sx9RVvei402BT0vwrImRcEQ2z3PpapDNn0Ww1Yfu38bgEPtJyfByEf1206Gs4fnr9nryguqBVwr9PdM/QOJ85w9996ClcjjiWruQ3iHkM+9XvSwODFCV4bgVvvwUuYhi46U3mobIKS0hFAkAngmE2ZmGJCIRE8VPpzsK9AOpDCAsR2+1l9k+aY3qPBB0p7rcuk/LbunGAtBW13+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 CH3PR11MB8095.namprd11.prod.outlook.com (2603:10b6:610:154::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 16:16:34 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 16:16:34 +0000
Message-ID: <a8ece816-3d4c-4d60-b7c1-a7f7919325f3@intel.com>
Date: Tue, 3 Dec 2024 17:16:25 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
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
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0022.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::29) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|CH3PR11MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d6361ed-6d7c-40b6-ae96-08dd13b5daf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zy9BWDIvTHlyOXdDWGp1T0xnK3cyaHNLekl1TXhieGtpNDJwelBkMndUYmRo?=
 =?utf-8?B?VG1oQ3Y1Qm9hOHh5ZDhPL0NXQUZPQm56Tjd6ZXFoYWZrMzNvM29vUytFWWxl?=
 =?utf-8?B?dUxSYmNhQmJnYXZtT0hmVFlMeDRGNk1LZWhwb1A2UXZoNU80cXhuWnUzUEhv?=
 =?utf-8?B?OWxTUmY3SHoxaUQ1OVpySkprbTgvNmtwbVFiRm5iNmh2UVQ1WUUvK1NTZmxP?=
 =?utf-8?B?cnRKT3hXUkpzcmNoVlduUzM2UmU3dTF2aXlpZmVuSmsrbGRYcEFmSE1JYXIv?=
 =?utf-8?B?dS9TVUhZMUFoc3dsQjllSjJaai9pSFRSeW1nK2lRQUF4TkhaMUp2TStiKzFm?=
 =?utf-8?B?KzlBNHZ6dnRjS050Ymk0SVZPc1o5dzNESmtQVHFva3Rpc051WGs2Umc3SEhO?=
 =?utf-8?B?amJ6WXM0bWxuaGxCUDF6VTlEOU9NekdXZExaQjUxMDBFQ0JOd0VXK1RJK3Rq?=
 =?utf-8?B?VEYwT0xBLzBJdWhaQkp3aWQ0ZGc0QjJWdTVpQ2lqSmR0RnFPUDcxOFlneWlp?=
 =?utf-8?B?ZXFnVWMxL0FhM25hSFRNVi90b3lMcUZwL3pkRy9lVjJQM3ZnMWNCMGk2cDZQ?=
 =?utf-8?B?c0pWNFlqYU5jeDc0ditWT0svRXdsYldoZ1hPY0FvUTBkZHZ0VkpYd0haVGtp?=
 =?utf-8?B?ZWRlOWVTb0RlRGpqM1RnZDNOSlduVGxjVDg2K0ZkU1p5WDl6ektpRkRncndu?=
 =?utf-8?B?TWZkQ3ZSY2ZwOVQwUzVPbGR6VHE5dVNzaU11WWZ6WS9kbHduK2N4cnRIYzhn?=
 =?utf-8?B?UzJCdlRzZ0lXd29XVC9oNDlodnhHbVp5Vk1kNE0wL1ZPTHpsR01lODhlam9k?=
 =?utf-8?B?b2h2ckxLb0R5QzQ4enAycE1tZVc4Y3JUWmswUnJUejBxUVJXV0RMLzFyTFgv?=
 =?utf-8?B?bVF6N1ZSSHB2R09aZDhLSEZPQ2k0MHZFckJydVRzbmdQYnBKU2VWakhRcmN0?=
 =?utf-8?B?djVkZDUrMVlIdWVydVE0aHBDM1Yxb0EwWCs1ZlhxejY1TE40ZXhZV0ZFa01H?=
 =?utf-8?B?ZlV1dTNxcm9hWlVjbmxEMThib3pucU8xSlJUalhrVFhpTXJXZ0l4dlIreFMy?=
 =?utf-8?B?RnB5ZWc4RnNoa2M4V3RrczhGdnRFZFo3MmxVMzZzYVR1RnVFU3RiUHYrdTlt?=
 =?utf-8?B?dDJPeHRnQlc1V2NCZ1Q5eW94WkZiMjJTdzVYZjlBL29UaFNKeW55QkNYM0xH?=
 =?utf-8?B?VWthRjFobFFuN2w2dmJhRFNEekg0SGhIM0hoQmVlT29MT2NyMlZhd2RKdVYx?=
 =?utf-8?B?MWJRYUFsNjRhQ1hCc0V0LzluWkZRK0RMVEkzRWJwTzlWa3JIbVpHZUQ1cmNF?=
 =?utf-8?B?VXlSRHhSZ2dTcmxMcURoV2VtdzgvbTR0ckhrQ3pYOWNseVZGQTUzUThHUmF1?=
 =?utf-8?B?MUZGcjE3amVJTjNWb29MU1BWUHZ5eW5zTXhKMW9uVWxWK0JwZ2w2bVRPdm4y?=
 =?utf-8?B?L21BbmpXM3J1WmFaRlRoV0ZKVXd0SHRRYUhPdDB2UEVPdzF6aU9sZXRTSjM3?=
 =?utf-8?B?UDVnRGxTRjI1V1hLNVN0Ym1ja2xRbC9mL2NRWjkxaDE3UHZhQ0hTOGJmNjFX?=
 =?utf-8?B?c1RmVlZoM0Uza1dFS1ozQ2kxaWpHdDF3QzhJNVh5NmZKMVNSR3N0WGEvcjU2?=
 =?utf-8?B?T1QxdGo4WTNRNXNjTWkxRUpmUmp3RCtlaUZ1NTVtQ3luc2pxMkZqL2Y0Sk4z?=
 =?utf-8?B?ZGxxS2hRYTMyeThSQWtTTjY1aSt1VVdQcWxrZlRxV1VMd3R2VEpUKy9Ybmk2?=
 =?utf-8?B?c3NmVWFQZkJtcmQ1VGJDekVucHUvU3J5YUhFazkrQWk4a1Z0Y2Nmcy9yUTJD?=
 =?utf-8?B?WjBreXViRVRmL1d0aHVmZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THVmZGQxOVplMHplMlYxZE8vWDhNMWF6SFpOQ2hmSUVPeWNHdUVqcXRkMlJx?=
 =?utf-8?B?THRvb1Q5R0syVUpUZmNsTXA2c2w2NUlqdCt4RDNzbnJJZ3VCOTNWOUJ5dXM1?=
 =?utf-8?B?SHgyMVl2ZHN6S0JldXJvemQybnd4WDBKR1FHZTRMYWFiUlRxNUFEMXVDVWhq?=
 =?utf-8?B?K1Z6NVJMUFk1ZG4zVW9mdEZLb21sWFB1MjVDcTJIV2t2WEpWTVBxZ0w1ajd3?=
 =?utf-8?B?bk5IWTRXbGZFRU9UaGdPZkN2emZWMm80dEQ3VDN6SWdsRjlpQU5Sc25JYVds?=
 =?utf-8?B?UmN6OWpxSzNicUxZblRBemkwcmhXY1pKbUh3SFNueWRZNzBCYjhETEV4L2Mr?=
 =?utf-8?B?S1Z6dWxWQXl5Wit2T2s2TW1pUmY2a0VQYVV3dDZVWXRmSzNSRW5MSlNDdi9s?=
 =?utf-8?B?ZTFqRkxJdTJuaTROWHhHdE9uY0hSZ3J4bDVRN1RueGNCOTdsUElIMTJDM3pK?=
 =?utf-8?B?NFQxbmJDM2hNbVVjdXgvM1VLY01YRkdYbndianFobFJzYWRSb2IrRjdWVXJl?=
 =?utf-8?B?Y09ncXU3U1E1UDNOdTZZOUVCRmRzekNvaitrN2t6ejJpQ2JvZEZHbkc2VnFK?=
 =?utf-8?B?NHpTN0c2ZDFzZUhNVTVaYkErSStXR0FWZWRYSVN5clBiTGRxUHUrUEhwRFEz?=
 =?utf-8?B?NWhta0xjQVNLbkN3aW9HcWE0NDV0azl1UkRPMzVpOWp4enFhWCtBOW9RWWdC?=
 =?utf-8?B?TndubTc0bkFvdzcyRy9pR3JRNEJ5M3EzTnNHSE1SVVFHM1VCRmd6TmNPeWxy?=
 =?utf-8?B?NCtTTlJRc0RmazBWRzZzUFB3ZWQ3TDBWdkdkRFlLZFhZdjdoZ0NrQ0V3T25i?=
 =?utf-8?B?UnRwbUZUaVBXSDhtZElLcis2dnFxNXJLRlVBa3pmYW5vdHRkUGNyYmcrc29t?=
 =?utf-8?B?ZjcwUXdXcHZmWUFzQW1sQ3dyT2VtUDJmWmtpeE5WcXNKUHFuZWMzUVhMVi9k?=
 =?utf-8?B?UFRxdFVhaWhleWhXRXJldkxGTVNVTTNwcDN1dTNpRy9TbjhzeVJjeUhQaXBi?=
 =?utf-8?B?NGc4bkR0c3FQZVRCcHQ2S3RvN2RSV2pzVGhBbDB3NFpOTHlGVE1nMm9mZFJz?=
 =?utf-8?B?Z3U5QWhyeFZkNDNwVGdRVXNsWE5Yc0hjQUowNVB5TmwxcGY2NDNtSXhBOHE0?=
 =?utf-8?B?S2tNREFmR2RMOUhhdGNJb041T3NYd3JJSnNYUEZUSmtaWCtyc09DNEhvak1J?=
 =?utf-8?B?bEJQVERNSmVoc0piOXpOYnJqbFdBMFdlRmltMkR2UlpjK3NkUHpwMGlTVUUw?=
 =?utf-8?B?Ujh3aU1VVnpaQkRzRWliVVJHRnY5SVBZTjdlNUxIUEd5Q1RLajFYbGtaV0Zz?=
 =?utf-8?B?KzFCaE5mcUlhbXU4dW1TNEhGc3k5cHduSkc4NTk3eGdaUDhLMXhUTjduOFd1?=
 =?utf-8?B?T01CczFCQ01TTXFxRVJCN1pyQXJ0NmNOZWVPdVdhRHRyVnhqN3Y3dGlYam54?=
 =?utf-8?B?ZVhpR1pzVkxpOXZZQ002aUxqdUVjUG4xZlpqYUlJNGRUVVpkMFJ5RWJMZkVk?=
 =?utf-8?B?OUEza3hwSkVZWkYwREpjbWFBM2J3V01DSnFRemc4V1VZdkN1K3MwTGVPQ3Y1?=
 =?utf-8?B?RlNITk4zM1MwcklwYVp6djNicTVoUlp4SzQ1aEV6dkZnNE1HdU0vRFZMMWpo?=
 =?utf-8?B?akJrbFdHL0grOGJFcEhTZkNKYzRhRGR2S0VBSE8zbDkweWpqN2FuVloyWVZo?=
 =?utf-8?B?ZXpTNHFjemtVZXhadzdyUFRqaTlXNEZxczhBeWk2akRIK2VCeVc0OUMzNXhx?=
 =?utf-8?B?VUlIZGNQNzdFTi9aMGNvMnJtVzBvTnZNcHlnQTVJT0s5YWxveVFseDZaQ2pC?=
 =?utf-8?B?OGltTXhkQ0wvTXNONGE3UjR5MjdhTDU4NWJZQWRSZnFaeGYrZXBHYmhUWGY4?=
 =?utf-8?B?ME1RM0cvQUVMMlgwV2x3c280eU51YXpRNWphN3ZlWFpvQ0RHMmxwWktpSTVK?=
 =?utf-8?B?Zy9lMFB3ejFVUU5SUXNyaUZ6b0pzSG9UTXREZ2VLbDdlNmFYV3B5ZEU4TmU1?=
 =?utf-8?B?azN2SDFrL3FicVFPaGRUc2xIV2c5RXl1akJRMGRuYWY2SWJadHdrYkZRQllt?=
 =?utf-8?B?VTlYQW9OeXNFRWVrZEQzYjFJdGtKdmNId1k5K20xZWJkMVY0blJ1S2ZRODEy?=
 =?utf-8?B?K2Iyd1BhRC9Cbk5vc2tZeUFVOVBPTTZMQ2VzZXcyNVhEczVldmNtbDVoeG81?=
 =?utf-8?B?Y1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6361ed-6d7c-40b6-ae96-08dd13b5daf5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 16:16:34.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2pNWs+lwhCOIDYbIGQM5ZzUBb3SjeUs2+AdZrJjULTUNqiYGKtS+H2v2M4OMUmDknDHYYsME0ovYkutDEUW/gTcejqFzvKVcYwQumPpVlWA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8095
X-OriginatorOrg: intel.com

On 2024-11-15 11:42 PM, Wesley Cheng wrote:
> Hi,
> 
> On 11/6/2024 11:33 AM, Wesley Cheng wrote:
>> Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> 

Hi Cheng,

I'd consider reordering the series and splitting it up so it's easier to 
review, 30 patches is a lot. Right now, the QCOM parts are mixed with 
the framework changes. While obviously we want to see user/usage of the 
new additions, it is probably better to see QCOM-specifics last so that 
we can concentrate on what impacts all of us - the framework changes.

I believe that without much work one could simplify the set so that the 
output of:
git log --oneline -n 30

looks like below. At least that's what I've done on my machine. Notice 
that the top 7 patches target QCOM directly and make easy candidates for 
being removed from the current series and put into a standalone one 
instead AKA a follow up. Feel free to correct me if I'm wrong in any of 
these.

ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
ASoC: qcom: qdsp6: Add headphone jack for offload connection status
ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
ASoC: qcom: qdsp6: q6afe: Increase APR timeout
ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
ASoC: dt-bindings: Update example for enabling USB offload on SM8250
ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
ASoC: usb: Rediscover USB SND devices on USB port add
ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
ALSA: usb-audio: Add USB offload route kcontrol
ALSA: usb-audio: qcom: Don't allow USB offload path if PCM device is in use
ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
ALSA: usb-audio: qcom: Add USB QMI definitions
ALSA: usb-audio: Introduce USB SND platform op callbacks
ASoC: doc: Add documentation for SOC USB
ASoC: usb: Fetch ASoC card and pcm device information
ASoC: usb: Create SOC USB SND jack kcontrol
ASoC: usb: Add PCM format check API for USB backend
ASoC: Add SOC USB APIs for adding an USB backend
ALSA: usb-audio: Prevent starting of audio stream if in use
ALSA: usb-audio: Save UAC sample size information
ALSA: usb-audio: Check for support for requested audio format
ALSA: usb-audio: Export USB SND APIs for modules
ALSA: Add USB audio device jack type
usb: dwc3: Specify maximum number of XHCI interrupters
usb: host: xhci-plat: Set XHCI max interrupters if property is present
usb: host: xhci-mem: Allow for interrupter clients to choose specific index
usb: host: xhci-mem: Cleanup pending secondary event ring events
xhci: sec-intr: add initial api to register a secondary interrupter entity
usb: host: xhci: Repurpose event handler for skipping interrupter events

>>
>> Mathias Nyman (1):
>>    xhci: sec-intr: add initial api to register a secondary interrupter
>>      entity
>>
>> Wesley Cheng (29):
>>    usb: host: xhci: Repurpose event handler for skipping interrupter
>>      events
>>    usb: host: xhci-mem: Cleanup pending secondary event ring events
>>    usb: host: xhci-mem: Allow for interrupter clients to choose specific
>>      index
>>    usb: host: xhci-plat: Set XHCI max interrupters if property is present
>>    usb: dwc3: Specify maximum number of XHCI interrupters
>>    ALSA: Add USB audio device jack type
>>    ALSA: usb-audio: Export USB SND APIs for modules
>>    ALSA: usb-audio: Check for support for requested audio format
>>    ALSA: usb-audio: Save UAC sample size information
>>    ALSA: usb-audio: Prevent starting of audio stream if in use
>>    ASoC: Add SOC USB APIs for adding an USB backend
>>    ASoC: usb: Add PCM format check API for USB backend
>>    ASoC: usb: Create SOC USB SND jack kcontrol
>>    ASoC: usb: Fetch ASoC card and pcm device information
>>    ASoC: doc: Add documentation for SOC USB
>>    ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port
>>    ASoC: dt-bindings: Update example for enabling USB offload on SM8250
>>    ASoC: qcom: qdsp6: Introduce USB AFE port to q6dsp
>>    ASoC: qcom: qdsp6: q6afe: Increase APR timeout
>>    ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6
>>    ASoC: qcom: qdsp6: Add headphone jack for offload connection status
>>    ASoC: qcom: qdsp6: Fetch USB offload mapped card and PCM device
>>    ALSA: usb-audio: Introduce USB SND platform op callbacks
>>    ALSA: usb-audio: qcom: Add USB QMI definitions
>>    ALSA: usb-audio: qcom: Introduce QC USB SND offloading support
>>    ALSA: usb-audio: qcom: Don't allow USB offload path if PCM device is
>>      in use
>>    ALSA: usb-audio: Add USB offload route kcontrol
>>    ALSA: usb-audio: Allow for rediscovery of connected USB SND devices
>>    ASoC: usb: Rediscover USB SND devices on USB port add
>>
>>   .../bindings/sound/qcom,sm8250.yaml           |   15 +
>>   Documentation/sound/soc/index.rst             |    1 +
>>   Documentation/sound/soc/usb.rst               |  491 ++++
>>   drivers/usb/dwc3/core.c                       |   12 +
>>   drivers/usb/dwc3/core.h                       |    2 +
>>   drivers/usb/dwc3/host.c                       |    3 +
>>   drivers/usb/host/Kconfig                      |   11 +
>>   drivers/usb/host/Makefile                     |    2 +
>>   drivers/usb/host/xhci-mem.c                   |   31 +-
>>   drivers/usb/host/xhci-plat.c                  |    2 +
>>   drivers/usb/host/xhci-ring.c                  |   54 +-
>>   drivers/usb/host/xhci-sec-intr.c              |  439 ++++
>>   drivers/usb/host/xhci.c                       |    2 +-
>>   drivers/usb/host/xhci.h                       |   14 +-
>>   .../sound/qcom,q6dsp-lpass-ports.h            |    1 +
>>   include/linux/mod_devicetable.h               |    2 +-
>>   include/linux/usb/xhci-sec-intr.h             |   70 +
>>   include/sound/jack.h                          |    4 +-
>>   include/sound/q6usboffload.h                  |   20 +
>>   include/sound/soc-usb.h                       |  147 ++
>>   include/uapi/linux/input-event-codes.h        |    3 +-
>>   sound/core/jack.c                             |    6 +-
>>   sound/soc/Kconfig                             |   10 +
>>   sound/soc/Makefile                            |    2 +
>>   sound/soc/qcom/Kconfig                        |   15 +
>>   sound/soc/qcom/Makefile                       |    2 +
>>   sound/soc/qcom/qdsp6/Makefile                 |    1 +
>>   sound/soc/qcom/qdsp6/q6afe-dai.c              |   60 +
>>   sound/soc/qcom/qdsp6/q6afe.c                  |  194 +-
>>   sound/soc/qcom/qdsp6/q6afe.h                  |   36 +-
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   23 +
>>   sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h      |    1 +
>>   sound/soc/qcom/qdsp6/q6routing.c              |   32 +-
>>   sound/soc/qcom/qdsp6/q6usb.c                  |  391 ++++
>>   sound/soc/qcom/sm8250.c                       |   24 +-
>>   sound/soc/qcom/usb_offload_utils.c            |   56 +
>>   sound/soc/qcom/usb_offload_utils.h            |   30 +
>>   sound/soc/soc-usb.c                           |  369 +++
>>   sound/usb/Kconfig                             |   25 +
>>   sound/usb/Makefile                            |    4 +-
>>   sound/usb/card.c                              |  106 +
>>   sound/usb/card.h                              |   17 +
>>   sound/usb/endpoint.c                          |    1 +
>>   sound/usb/format.c                            |    1 +
>>   sound/usb/helper.c                            |    1 +
>>   sound/usb/mixer_usb_offload.c                 |  102 +
>>   sound/usb/mixer_usb_offload.h                 |   17 +
>>   sound/usb/pcm.c                               |  104 +-
>>   sound/usb/pcm.h                               |   11 +
>>   sound/usb/qcom/Makefile                       |    2 +
>>   sound/usb/qcom/qc_audio_offload.c             | 1974 +++++++++++++++++
>>   sound/usb/qcom/usb_audio_qmi_v01.c            |  863 +++++++
>>   sound/usb/qcom/usb_audio_qmi_v01.h            |  164 ++
>>   53 files changed, 5915 insertions(+), 55 deletions(-)
>>   create mode 100644 Documentation/sound/soc/usb.rst
>>   create mode 100644 drivers/usb/host/xhci-sec-intr.c
>>   create mode 100644 include/linux/usb/xhci-sec-intr.h
>>   create mode 100644 include/sound/q6usboffload.h
>>   create mode 100644 include/sound/soc-usb.h
>>   create mode 100644 sound/soc/qcom/qdsp6/q6usb.c
>>   create mode 100644 sound/soc/qcom/usb_offload_utils.c
>>   create mode 100644 sound/soc/qcom/usb_offload_utils.h
>>   create mode 100644 sound/soc/soc-usb.c
>>   create mode 100644 sound/usb/mixer_usb_offload.c
>>   create mode 100644 sound/usb/mixer_usb_offload.h
>>   create mode 100644 sound/usb/qcom/Makefile
>>   create mode 100644 sound/usb/qcom/qc_audio_offload.c
>>   create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.c
>>   create mode 100644 sound/usb/qcom/usb_audio_qmi_v01.h
>>
> 


