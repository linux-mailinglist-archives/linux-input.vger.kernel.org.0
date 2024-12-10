Return-Path: <linux-input+bounces-8478-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A40C9EB49B
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 16:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A542188C4FC
	for <lists+linux-input@lfdr.de>; Tue, 10 Dec 2024 15:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E611BEF81;
	Tue, 10 Dec 2024 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVFc8mu+"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5241BD9EA;
	Tue, 10 Dec 2024 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843926; cv=fail; b=fa/Fqq6LmRKChIYfHun4b8N1g0bNHVSpVMsT3nN/5/PS8pRe3i+IVh+YF2bilVsBHkLxLB98ZGO7TAQisA0iq2GDgNNPDv+my4AatJSkAyTOAxUJL06KcI9b7QqQFJG31P8l4iKi76OJpPlCoTDzrw3Dxlu6XOa+YCMaK9VTEf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843926; c=relaxed/simple;
	bh=uEG5fZ98OmDxks5m3gcXE0Taf7+fhsPkUjOXoFRPAeg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fIWNX8NJ2f2bbWG+dEP/AfK1BlT2SD7NV2sFQcwOK1odCegDXboMjpD+340M4iLUjieZ0eU4uW7It5F/8x33rpPaEZVHPRw6gA4RPhdDpbTCjo4E1buZ8z2WOvjhSjlC8UFRwQMVC5kd2Lp1sHwFBf8gjdsOktNr1mAngzdZGgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVFc8mu+; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733843924; x=1765379924;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uEG5fZ98OmDxks5m3gcXE0Taf7+fhsPkUjOXoFRPAeg=;
  b=GVFc8mu+UVj9Yqmpv9T4sDXWc4hpdLeAlN3aohpAtgOeo5sJn/0p06q0
   D6+01CVrIM+j1VVEJ704yoIinjNQfQFiOl/GtaFghcYRiXDGn+b8zAPp9
   8hwflbB0kMu/g144THeE+0xoQpCVbALfzY6VyK24asNIRZL5t+kWfnWAW
   83Ar788sXwvPYJi6GoWaM+W7Rxxkyvwi9FGw8O3KRWd5o7WkDQGA9bdmD
   eIUBkKHhmpm/co3R46Rm+OQauYupvzPNwBXmg+TcKhXw1bvD8zanKChXe
   g/Wqca1o940iW4aJuCmyQnKBBootwjHu28OYRM9TxsP22VkJpBB0ODUCM
   w==;
X-CSE-ConnectionGUID: iISfRVTbR6qZ1+RiiWxsTw==
X-CSE-MsgGUID: NvwupBgORhuAAPGbz1MrIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45206224"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="45206224"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 07:18:43 -0800
X-CSE-ConnectionGUID: abjEqhWTQBGn5TLtnL/AVQ==
X-CSE-MsgGUID: 04aTEqXQSga4W6W3/sAx0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="95255222"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Dec 2024 07:18:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 07:18:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 07:18:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 07:18:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUp9Ir1SDpYuCSy7XmPstyJBCqv1bDLednmtH0J75eWYZbyswHgDBbCZgfDqEX3hT99ltO9IZ1XTMWXcZLN/XAvOgBl8eTzf0VRK344QWuHJGMvxfuobVKZNzawQtDX3o6VSiBNyUFb5MTSG5TzXjMx4twEkUthtXQsGAI4CwSiwhuKio0atEoV7Tl0tALfGVoQxMahIRnu6HsF8uC9sP94cxFYe1SmeLQFa2PCNc27OJ5R3fHDIHZ+wspz8otvwSuJ01RQqwSecuQJleEFeSA7eelnYgr0dBzANWCpocqVGcybwIUEINzZA9F7BUQuBjG55WC8gORaGg1CtoIr5ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yrSMP+Z+SoIQFBMd0QNkAy1PEGzss7HShQ7xn2lKHk=;
 b=S77U+GgbtKUCyNNp6K5+bzXSQKMHPeQtZDJqYkDfsEf/93N5zGfi7A44bjGlG14Peas0Cx0HqVBDNn7pJsXbeZmzPMdkMzFvQZaebN2gg/RsVvwnjivvSr7L0nExWhxWsIxkLZDWkmp7DLtUoaD23ATRm1TplMtnTQ8+hV45wyRLCFOpsfcT63cmZurNyfMb3Eb1NI27UQAScuRiHrtd2N22qrFqq2tB2FaW4Ca1gcMPvxLvN3brwJIJCHb+TnCbuZ0TeVxC1uIKRq1429+ssC/yOmvcOm3BmtCCZpLQk+d2zdGWcUYzrFa5K84CGF61/3Rwp1cqaBsP6Ga2BkmM0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 DS0PR11MB6494.namprd11.prod.outlook.com (2603:10b6:8:c2::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.23; Tue, 10 Dec 2024 15:18:37 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 15:18:36 +0000
Message-ID: <3d9932fa-dbc3-4393-862f-92916e6e821c@intel.com>
Date: Tue, 10 Dec 2024 16:18:27 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Wesley Cheng <quic_wcheng@quicinc.com>
CC: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
	<srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
	<perex@perex.cz>, <conor+dt@kernel.org>, <dmitry.torokhov@gmail.com>,
	<corbet@lwn.net>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
	<krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>, <tiwai@suse.com>,
	<robh@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Pierre-Louis
 Bossart" <pierre-louis.bossart@linux.dev>
References: <20241106193413.1730413-1-quic_wcheng@quicinc.com>
 <edfeb642-297e-42bb-ad09-cbf74f995514@quicinc.com>
 <2024111655-approve-throwback-e7df@gregkh>
 <2f512d8d-e5f3-4bdd-8172-37114a382a69@quicinc.com>
 <875xoi3wqw.wl-tiwai@suse.de>
 <d0da6552-238a-41be-b596-58da6840efbb@quicinc.com>
 <CF49CA0A-4562-40BC-AA98-E550E39B366A@linux.dev>
 <65273bba-5ec1-44ea-865b-fb815afccc91@intel.com>
 <fbc04c06-c210-416b-9b77-a6bd8a71a637@quicinc.com>
 <9d95e6fa-afcb-4445-9fe3-e0eed95ec953@intel.com>
 <d7c52a11-bd2b-4cce-a0c2-6dc2dadfeaa3@quicinc.com>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <d7c52a11-bd2b-4cce-a0c2-6dc2dadfeaa3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0013.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::26) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|DS0PR11MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: e0f9feba-0e38-4056-ed5d-08dd192deab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVJEUCtITVJoN1FNRUN3OE1TaC94RThGdkxoVWVlTHVlQTRMZ2hjZEw2NFRO?=
 =?utf-8?B?aDJjL1ZaRWxpbkorMmhQU1I4M0tBdWhxSUVjdkpFR241TnlzU1hwSW1sdlNy?=
 =?utf-8?B?TFhJK1h0TGswK3dLTmF5UTkzUlRocVNLMStJSkg0Zk9uLzR5ZHBQNk53WHFx?=
 =?utf-8?B?M0JHcmkrSk9hNkppWko5T09kV082R21FcW5PQ3B6V3JMTk8ycUt4MVpUQ1I5?=
 =?utf-8?B?UGlJYm5EVzJpNGoxUkV4am1TT0lHUjZycHk5M2V3L2lUcFZZZzBmY1M0SktU?=
 =?utf-8?B?Rkcxem0wRnRLWEphV1hMb1h5UWJwS3F1dmgxRFlJbzNKT1lTM0thNUtlbUMy?=
 =?utf-8?B?cE5HWlBldkRlUmJlcEJRVDlNTjExNk1IQ2ROOGNGdndVUmZFeWZvcWsyNjl3?=
 =?utf-8?B?SXNicExhQTFFRkRNWSsrSzdHTXg3Z0N5N2VVUnR6TFdhek9vaUtTdzM3L3pl?=
 =?utf-8?B?MXBkODRmUHRzK1lsdW9lQmh0S0UvanZiUXpEN2lGZzhFZXl4WTYxK0ZMdnZP?=
 =?utf-8?B?ckF6RUgwcEdSR3FudzZQN1IzNXU3V0I1a2JJaFFoUit0aEZXaE9PNW1leWV0?=
 =?utf-8?B?LzVxVzZpelowQUpTVUNnYTY0dzBibS91by8vUkZhS0N3aHg0UDZvV05tVHR4?=
 =?utf-8?B?VGFiZzYwbVB1Y3diRUVSSHNEOGt3cDcvcFl2Q285SmJ5eVl3d3NsM1ltd2Vk?=
 =?utf-8?B?bFRDZHpmeHFHb3ZOamNnUWs3NWVGOTVRYnc4YWVnbGRQbzR2ODk3SG1wS0Zw?=
 =?utf-8?B?QmxYUTRTMUtNaXNPblJvOVN6R3YyZUxCMkoxSmdjTHg4ckNhVEQzbzc4aXBD?=
 =?utf-8?B?eXBFZEpFR3MyYXJmTkZxdHBGVWZzQTNNTUlMQmhXbnI3RElQNjJ4S1JibmUv?=
 =?utf-8?B?YmsvMHl1aFhqNTRqOU9WZFIwSDVKdWZmOC9WYXJDemwyWGNvWUFyQmlWakc5?=
 =?utf-8?B?Z2hsOWRsUUR3Mm5uNzNEK0dQM2wxNnZSSkpCM0dweWN4RitwS2gxUVl4QUg3?=
 =?utf-8?B?bzdTVXlBTGxlSFhHQ3Qvb2hYb3ZoU1ZYRTlLSWFlbXNyUkNpL1ovdlhOajlH?=
 =?utf-8?B?c2k4cnZna2RVaTVJb2x4TEN3L1RjVXpNTURZejlFeFBoWWxLNnpQU2VlblRs?=
 =?utf-8?B?RjIwcnE4QTZkVmZzWERkWkY1K3Z5L081cGxTa0Z4UmtrcmNJTEtoakd2THZ5?=
 =?utf-8?B?L2RSbGR5cGJPTEFxZnBnR0ZJMjVmSm5FOU0zNEhrc0VUek1mcmhpR0FMMFZP?=
 =?utf-8?B?TWxNU1U3ZTBKNUhJZDBHTUlOcGZGa1E2R0lMSjF3WWhrcnFNeE92YVpnTTli?=
 =?utf-8?B?a1I2cU11QTRnYlNCL0hKTCsxV0dFK254Ti9TZFpTcWFwVGI1LzhPMVRaaHlo?=
 =?utf-8?B?MWw2TlBvYVdZelRKcStyNVMySm5aajFQd0c1NmxXaDRjV1JrdW5kN3RDTEQr?=
 =?utf-8?B?ZmZ6VHZtWCt6RlA3cHEyNWVNaVhRZlFhWnVLb1E1cDFFSHZmYWF5VGNBdm9L?=
 =?utf-8?B?cmNMMWlHaTNRZlBXTytJR3A2ZGtnZWowY2VxRmJTMDJoa1Aza1lndUpuZFVw?=
 =?utf-8?B?TzhSSVQwSncxMU1wNHBqdTY3Nk5TbjdTakhZVmFDbmlhK3BEWWUyWnRQNkZs?=
 =?utf-8?B?SEc3aFVPcVc3VHpZOHpzdnh2VEswOTI4aFRPL1BBY2E1TFQzS1dwNkhIZlV4?=
 =?utf-8?B?ZGtFdFJGQVFtQTNKQVVvYXMwU1NwQk1VaEtWSXNBUE9nUlRrRytOSlhQUzJp?=
 =?utf-8?B?QjNaTjE4NHgwNHl0OXd3a0VsSEhXMXFrajA2RkZTeThZdE93RFI3SlZ0Q2N6?=
 =?utf-8?Q?4yvks+mSrNfcvfpH7Ss2dn15ap6cTg+rho+pM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTFoTml1MFN4Rk5qdkVQSytEelgzTUJNRE83Y0huT0hqUFpCUkRNbzg5NlI4?=
 =?utf-8?B?YXhPY3RqNXp4aXdwOUswbUJ1c3hTQ1NCd0dqZ0NGcFV3SHIyWG1uUnVMN0xO?=
 =?utf-8?B?OVB2ZFhTbkxzbVdtRVVCdnFsUjZZTkxWQk1KZllzOCsrQ3MvdlAzV3pmUFhz?=
 =?utf-8?B?Ym93MCtXK3FrMW9USjhYazh5MlRKTzMxcklOb0pISjNjUGlnT0phMG1id1Ay?=
 =?utf-8?B?dFF5MmhGMVRyc0QyaXd3UHI2emYwdzNkTFJsUmdkK2xYR1BxTkV4QlZGUm10?=
 =?utf-8?B?OXRJUkx2aUhudmcxQW4xMWdBd1NyV01sMTU1cDZHTi9kM09TZkprZWtGTnZz?=
 =?utf-8?B?b2lxbklKbnBqYWgzS0p1V0ZLbkp0Zk9EcVllV1ZTWmMvMFdWTEtqMVZlTVFi?=
 =?utf-8?B?L2RJMHhGUUw4RWxoSTA5bk5oQUJCV0FjNGVvQ3FIWm5ZUlhVcWZuUzdvT1Jj?=
 =?utf-8?B?Mi9LTUJmb2FlNW04TFl0dTFsRWFib2Mwam8xdVdVRXhtMk1uMC9kTE9NUWc3?=
 =?utf-8?B?YS9ZczV0UG9IYUxWUE9JVnlyUkw1d3VWTzd0dlNEQ3h3MG5icEQxUGNQTjZG?=
 =?utf-8?B?SU9NaGI1Y2VjQjkveWNoeXFYbTNLOG4vbmtRZXIyYTJNQmREaGlIK3Nxcita?=
 =?utf-8?B?YkI1d2YzZzRvZFlqV1UyNitNWmoyZEE4YUMrZXVpZHBsMEhZT2dMaEM3QVBL?=
 =?utf-8?B?VVR0NlNPRGNxdmd5ZHZZM3YyUjdlSEZRaEtNaVdUY1FoK3IyRlJKQ3BtZW5r?=
 =?utf-8?B?TkcwWjlrWTVUbHF6NXI2SXZIaS94d2JZVk96MVA4cnRnQ1FRU3AxSzZyM0Vr?=
 =?utf-8?B?ZnoxemJsUWMxbUc4QmEwemVyTlYrQW0zZDJTSktDOTcxVnoycGlGeDVuaHRk?=
 =?utf-8?B?UW5vWVQweUhKUWx3dHZ6OCt0dURQek9QcE53aUZWZ2U0VWwrdENwcFRjZ2ls?=
 =?utf-8?B?TGpkVUo0UTI1TG1ScitocHNJckdlY0ZoNmxDVTlwVFo4R3hCaGEyQUVjbVpG?=
 =?utf-8?B?d0kzbVE4ZmtlOUNWdnRBdFBiWTdLd3B6VjFxcWt3NWJJZUpHaUw1czhBT3hY?=
 =?utf-8?B?bXllWEY3YTRjRG5LTW1pK1JRZ2xGRjNWUXNrU0NBdE9yd3E2ME04UGxRZWNN?=
 =?utf-8?B?d253YXpvc21hVUU0N00xaWtmbVdsek5hbHp3aU9hWGVjcTZrQTVBV004T3VF?=
 =?utf-8?B?TVBpYWg5SGN4cGc2WkhpYzg0TzEzT3VLc1hlVVFzZytRWnJIN0R0T2NYM0pu?=
 =?utf-8?B?NnJ5ZkNzNEtzWVlSM2VvQVBNZ2tFWkJ5WXA0c0JldGlBelNhQU05L052UFZn?=
 =?utf-8?B?RmFLM1h5M0NCQ1JIRnVOZjRmY1V2YTJWeThhd0ZLc1BwN2JCRlgxQ1Z0TGw3?=
 =?utf-8?B?Q1VaRTVXM21aRmlnWXcyU0JQU0NhNUFoQS9mTFJuazRFdlhzRzM3b3Q5UHAv?=
 =?utf-8?B?ZXlGZ2RJTWZHWHgvYnhXTTFGQUdQQ3lsWXN1S0djWTE0d0ZVcXF2WmdTdEtT?=
 =?utf-8?B?REppemRJdmw1VEpTcS8rUDRiV2RUTHZiVDhZbjN3ZUg3ZndkU012MXVLeUJ1?=
 =?utf-8?B?dWpnQU5FNkNweWVXUjBIbnpqUkI0WHJuUEVvT0tNR2JISm03M2E3ZVd0MFBW?=
 =?utf-8?B?RFF1WlJEMEJDWjgxNGZsa25DZnR3YnVCOStSVVBCTEkvN1hmMTBqcDZneXpL?=
 =?utf-8?B?MDZWM1dyY1UyU2ZZVXNRTTRFVi9rZVdXME9uRGVwWWJXanRVOGxtdXB6SjBt?=
 =?utf-8?B?cHgvSmE3Y2VXalI4Z3dSUVRBVVRpM2VaenFyYUhFM3NVeS84czdpU1FCQVd6?=
 =?utf-8?B?aXgxa2ZNWm9rVFpqVDRCKzBPalJId3RnQzQvcFBhK0pmNTBZWVNEcnhoa3hq?=
 =?utf-8?B?bUlPZm94R003ZW1jQ29UZlJwWlVRYUM0UndJY2RpZW1PQVdXYjlMZHUyaHk5?=
 =?utf-8?B?R0xSUXF0Umt4SjVpQVZ0ZWNlVHR3VVQ5ZzMyVmRTd1pNZldJT0QyV0M4VDNP?=
 =?utf-8?B?RDVjd1FnemFDQ3I2d3BlTEFGakxpQ1VkSys0Tjhnak9zSzJyR05kM0Y3Tk02?=
 =?utf-8?B?SGl5MnBCQlZYeHBvZjJocDgyM2M0VXlOQzJkekVtMDFLc3lIZFZLdjVEOU9S?=
 =?utf-8?B?WjZIcE9sMVFwU3pTQzZIYUY0UkpqdHowM3ErTXFOUUtZRHVTN2F5clljamdW?=
 =?utf-8?B?bVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e0f9feba-0e38-4056-ed5d-08dd192deab2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 15:18:36.0792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Be7pUvSZqNW+aOpvVY7D5y7x7SWuYN+UCxMEw8QC+4Qh4tUAWBwRaoZDorH5t5X5+U3wLAUW1Z7kiHRmSpUpMvK5GA78fIpFfpVvU6q3auQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6494
X-OriginatorOrg: intel.com

On 2024-12-06 1:28 AM, Wesley Cheng wrote:
> 
> On 12/4/2024 2:01 PM, Cezary Rojewski wrote:
>> On 2024-12-03 9:38 PM, Wesley Cheng wrote:
>>> Hi Cezary,
>>>
>>> On 12/3/2024 8:17 AM, Cezary Rojewski wrote:

...

>>>> UAOL is one of our priorities right now and some (e.g.: me) prefer to not pollute their mind with another approaches until what they have in mind is crystalized. In short, I'd vote for a approach where USB device has a ASoC representative in sound/soc/codecs/ just like it is the case for HDAudio. Either that or at least a ASoC-component representative, a dependency for UAOL-capable card to enumerate.
>>>>
>>>
>>> Just to clarify, "struct snd_soc_usb" does have some correlation with our "codec" entity within the QCOM ASoC design.  This would be the q6usb driver.
>>>
>>>
>>>> Currently struct snd_soc_usb does not represent any component at all. Lack of codec representative, component representative and, given my current understanding, mixed dependency of sound/usb on sound/soc/soc-usb does lead to hard-to-understand ASoC solution.
>>>
>>>
>>> IMO the dependency on USB SND is necessary, so that we can leverage all the pre-existing sequences used to identify USB audio devices, and have some ability to utilize USB HCD APIs as well within the offload driver.
>>
>> So, while I do not have patches in shape good enough to be shared, what we have in mind is closer to existing HDAudio solution and how it is covered in both ALSA and ASoC.
>>
>> A ASoC sound card is effectively a combination of instances of struct snd_soc_component. Think of it as an MFD device. Typically at least two components are needed:
>>
>> - platform component, e.g.: for representing DSP-capable device
>> - codec component, e.g.: for representing the codec device
>>
>> USB could be represented by such a component, listed as a dependency of a sound card. By component I literally mean it extending the base struct:
>>
>> stuct snd_soc_usb {
>>      struct snd_soc_component base;
>>      (...)
>> };
>>
>> In my opinion HDAudio is a good example of how to mesh existing ALSA-based implementation with ASoC. Full, well implemented behaviour of HDAudio codec device drivers is present at sound/pci/hda/patch_*.c and friends. That part of devoid of any ASoC members. At the same time, an ASoC wrapper is present at sound/soc/codecs/hda.c. It will represent each and every HDAudio codec device on the HDAudio bus as a ASoC-component. This follows the ASoC design and thus is easy understand for any daily ASoC user, at least in my opinion.
>>
>> Next, the USB Audio Offload streams are a limited resource but I do not see a reason to not treat it as a pool. Again, HDAudio comes into picture. The HDAudio streams are assigned and released with help of HDAudio library, code found in sound/hda/hdac_stream.c. In essence, as long as UAOL-capable streaming is allowed, a pcm->open() could approach a UAOL-lib (? component perhaps?) and perform ->assign(). If no resources available, fallback to the non-offloaded case.
>>
>> While I have not commented on the kcontrol part, the above means that our current design does go into a different direction. We'd like to avoid stream-assignment hardcoding i.e.: predefining who owns a UAOL-capable stream if possible.
>>
>>
> 
> Thanks for sharing the implementation for HDA.  I did take a look to the best of my ability on how the HDAudio library was built, and I see the differences that are there with the current proposal.  However, I think modifying the current design to something like that would also require the QCOM ASoC side to change a bit too.  As mentioned by Pierre, I think its worthwhile to see if we can get the initial changes in, which is the major part of the challenge.  For the most part, I think we could eventually refactor soc-usb to behave similarly to what hda_bind.c is doing.  Both entities are the ones that handle linking (or creation in case of HDA) of ASoC components.  The one major factor I can see is that within the HDA implementation vs USB SND is that, for USB, hot plugging is a common practice, and that's a scenario that will probably need more discussion if we do make that shift.
> 
> 
> Anyway, I just wanted to acknowledge the technical details that are utilized by HDAudio, and that we could potentially get there with USB SoC as well.

Hello,


After analyzing the USB for some time to get an even better 
understanding of what's present in this series, I arrived at a 
conclusion that indeed, the approach present here clearly differs from 
what I would call _by the book_ approach for hardware-based USB Audio 
offloading.

All sections below refer to the public xHCI spec [1].
A high-level bullets for the probing procedure:

1. xHCI root and resources probe() as they do today
2. xHCI reads HCCPARAMS2 (section 5.3.9) and checks GSC bit
2a. If GSC==0, the UAOL enumeration halts

3. xHCI sends GET_EXTPROP_TRB with ECI=1 to retrieve capabilities 
supported (section 4.6.17 and Table 4-3)
3a. If AUDIO_SIDEBAND bit is not set, the UAOL enumeration halts

4. Create a platform_device instance. This instance will act as a bridge 
between USB and ASoC world. For simplicity, let's call it usb-component, 
a representative of USB in struct snd_soc_component.

5. On the platform_device->probe() the device requests information about 
resources available from xHCI (section 7.9.1.1), ECI=1, SubType=001
6. Allocate a list of streams per device or list per endpoint supported 
based on the data retrieved with the followup TRB of SubType=010.

(things get more complicated here, stopping)

Now, any time a sound card with bound usb-component would begin PCM 
operation, starting with substream->open(), the component would first 
check if the device and/or the endpoint has resources necessary to 
support offloading. If not, it would fallback to the non-offloaded case.


I do not see implementation for any TRBs I mentioned above here. The 
HCCPARAMS2 seem to be ignored too. At the same time, I'm unsure about 
the "interrupters" piece. I believe they make the approach present here 
somehow work, yet may not be required by the _by the book_ approach at all.


[1]: 
https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf


Kind regards,
Czarek

