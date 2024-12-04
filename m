Return-Path: <linux-input+bounces-8403-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B79E4791
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 23:12:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6B5D16940B
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 22:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC7D1AA1E1;
	Wed,  4 Dec 2024 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M+4oqCco"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB2199947;
	Wed,  4 Dec 2024 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733350302; cv=fail; b=sob1y/Zyehmi3N0ET2u2J+RLxZa5Kp4WfwPzE1CglaxYWg8dGD3O8jGkXUblY7/2IwodThBbSbNIA1WRmnFaa0SieM2MYG5eiKuD4QW0S+wUXnQCZByflM+AwPYgLs4u8d6p5Hf6lkk5h8qDr4k77pzGQvIJU8L0BEv/TcG4B8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733350302; c=relaxed/simple;
	bh=MK6g8vArWecZdda/ACvj1t1aUv/kNtgWLa1jgDylmgE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dKDLdOQchcJP1+dLqMUD8B0SBMiF3cMuDTZ8fKGnJvNw9xw5U9e79Yd0LMyBFWDkms+wLByVTpByVcXfvCmrv+cpZteNRz5ry54GHUl9/z/rp5WTrHjs5Pqc6ml+2t8Sfx2rV5CFvbDimBdeTu7X9GRWEAweWmwAcjcgv7QCoZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M+4oqCco; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733350300; x=1764886300;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MK6g8vArWecZdda/ACvj1t1aUv/kNtgWLa1jgDylmgE=;
  b=M+4oqCcodWuten7SMPxNr/wMNle+ig4B4qdHTtY64ntxS2ZifFw+AvYt
   3PkBhRHdb0yFsxtRobpgjczS6ietouU4FKc4r9uMbUicDcuO08NLNfash
   Z8avu6SGs2M8T4EuuNDTtH3s5xlXna2y4+46pL/NGB+cAU7fa38RX4nCg
   nJYKGkMLR5etun6vX87MIQtMUH/ievyXeoe63sHFR71/vp6mZbvlx+ucx
   hnerhvnsBgVf1AUAGyla4Ag/Xby4L9KihJREcmzBEUXollAIS1k+FqFP/
   umO/wkLhWN35c5QzHkyAg+woLgP352dIDVIJgtODoBglDPNuwuV/FZTor
   A==;
X-CSE-ConnectionGUID: i9n0KEkoSziXCHaHMo3mBg==
X-CSE-MsgGUID: 4aK0UYDwQuin2EUpQZMKsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37302260"
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="37302260"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:11:39 -0800
X-CSE-ConnectionGUID: fVeW2zQFTdu7iHJGTxey6Q==
X-CSE-MsgGUID: 0Pz1tSMTR4SLpFbftgOX+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,208,1728975600"; 
   d="scan'208";a="93573690"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Dec 2024 14:11:39 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 14:11:38 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Dec 2024 14:11:38 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Dec 2024 14:11:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgNNfYvQnQrwIZvOdwqptboG1lr2RSkKtAyKQ8mwa1xjfwKavxrjXyMfSNOkYDthrhH4cUhiOTfqffJbNM8B9x+8hrlcwXx4CgPXB1uGh92/wOlEV4euItip8yjgr0AOJ5/Ze8qryydaPJLFOcUf6ELTNrDwzfeKYQsyqzoXx3mBcsdxn8ijHO7EeP1838vpOHoBwfJFH7biy6xPcqlMC1Xmio+2jfShm3nFR3hU2qle9F6nSpgc8hSLRWVc1J4pEZiCNtnKjIdr5AqaZ/3apzW0tPbPg0qsyOM8cM2TpQ9iyJ057s6ZKPFPjAndU9JXO0NDi24tIZ7S/K98IWBjzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvfEyAoPH9nlE94IbtBd+QD+ZKLv+MtfT53cO5RNyoc=;
 b=XELoUX8U3O86vgErnZ4fzhr2tpRiynI7Nh8w9NTavdlb5tmE0IPDzy9BQpTtLsNQJmvaCPnrHWme7F9fCqw+I+ugXkfIP4vlr2GO1I3F78g3E49ueaoRzJMWiDqtu5HNt205gj2hcXo6xzD0eNfzxFyHWDa1LB5qpxBYa401rBI98Ei5r716+ODWG7RPLs8/snCnXjhw3585C4Ia1vQFi5opZyOANpJVfHqeusVJTf7wXEmQTLlblEl5MNcZPmepgVvt6lG6P1hfcEC8YYsaiHkr1VzXdNvZI1JLvLxtn0VlNTbN358FyKZR0n8Wg5CI16KhFwkEHi6Zu2rGPWt+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6375.namprd11.prod.outlook.com (2603:10b6:8:c9::21) by
 PH7PR11MB7570.namprd11.prod.outlook.com (2603:10b6:510:27a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Wed, 4 Dec 2024 22:11:35 +0000
Received: from DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832]) by DS0PR11MB6375.namprd11.prod.outlook.com
 ([fe80::cd01:59f6:b0f8:c832%4]) with mapi id 15.20.8207.017; Wed, 4 Dec 2024
 22:11:35 +0000
Message-ID: <e7b8f141-efd4-4933-b074-641638914905@intel.com>
Date: Wed, 4 Dec 2024 23:11:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v30 00/30] Introduce QC USB SND audio offloading support
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
CC: Wesley Cheng <quic_wcheng@quicinc.com>, Takashi Iwai <tiwai@suse.de>,
	"Greg KH" <gregkh@linuxfoundation.org>, <srinivas.kandagatla@linaro.org>,
	<mathias.nyman@intel.com>, <perex@perex.cz>, <conor+dt@kernel.org>,
	<dmitry.torokhov@gmail.com>, <corbet@lwn.net>, <broonie@kernel.org>,
	<lgirdwood@gmail.com>, <krzk+dt@kernel.org>, <Thinh.Nguyen@synopsys.com>,
	<tiwai@suse.com>, <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
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
 <4C900353-B977-451C-B003-BAA51E458726@linux.dev>
Content-Language: en-US
From: Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <4C900353-B977-451C-B003-BAA51E458726@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0035.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::11) To DS0PR11MB6375.namprd11.prod.outlook.com
 (2603:10b6:8:c9::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6375:EE_|PH7PR11MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: d0a1b9fe-dc85-4ec9-76d4-08dd14b09de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXNJbW55Zm1PZlMxbkk2bjA2cUs2clpRRlhTM1ZBZkoyUEg5NWloS0F0eFBl?=
 =?utf-8?B?aHZkMkMxVDF1d1pmdkYyd05icXJzZDBnMHZlUGJGU3IzQU1LZHQvbkdZMFBt?=
 =?utf-8?B?YzRhOFRVM0RiUStBSFJvdWwwc2JyeDdqdXU0NXRDME9IZ241Q3p5Z01NbFp1?=
 =?utf-8?B?Vi9ac1hyMmJRZEJaOHlNVUJYcXdETWVGL0lyWmJ6S0RwWGRVRUNydUtsSDBm?=
 =?utf-8?B?eXp3SHdKdUt3R2F4QmpCMFhTRkxPNVptR3pIbzVqMGRIYWlxeE8vYXBuYlZn?=
 =?utf-8?B?ZHJ5dDdpOHhXS3dLMVYwSGZBNDVOckRRczQ5a3RjblhzK21zRnN3TnpXMlkw?=
 =?utf-8?B?YVZ6RmZsLy9qL1RxcVVaNVJBTWhNd1hKaldvZXdvb1Q5MFhnc3hHVTRTakJa?=
 =?utf-8?B?ZVc0cGtRR25GUGFrTjhQcC84OHgzQklPRTZYTERhYjhsdDJEQzQxSk1Kc0dQ?=
 =?utf-8?B?eE1RWnZuSW81N3FsOUNvUmpIZklwR1R5SWhXdFRXSzRHOWZOREZ3Sm9sS1BV?=
 =?utf-8?B?YmVMSUhaajNaUGVxN0dFenBFdTk4MXMzOWVGbGhMa2pCR0QwS09CNjVDcGoz?=
 =?utf-8?B?aVYzSmhvSXBRZHM0OXoycDRGUDJ3R0tiOGgwM00rT1B5SkhTT0dCbklQOEtY?=
 =?utf-8?B?bmJJY1JzUldKS3N2UlViWnN2Yy8yelJtQzlFYmtuUDNzUmNseG0ybUNtUVAz?=
 =?utf-8?B?anRzWVFoUlpaeStJOEdBNWVadVFMZ2pUNWgzWmw5YVhkVCtyMlpGbmtDay9V?=
 =?utf-8?B?dHR0dDJEd2dkZjlJR252cFhLMUlkb1cxR3VRbGtWMWNmZkpNY2hNUkd2ZXlG?=
 =?utf-8?B?ZlNXNS9obmhINkdxRjdwUzM0U3ZieGdzS3VMbVA5azRWTlJCWWNqQStXdmZL?=
 =?utf-8?B?TFVJWmxIZ1I5aTRRVUkwNk9HOTVvS1NzeC9CZVhZbUh2dkR0anRtYk4vU1VG?=
 =?utf-8?B?VVdEdDErSG9GT1REcWtFZE9LN1o5MHlmb3lLR1piQjlNUnQxaWw2RHpCMXVN?=
 =?utf-8?B?Y3lVNS9MaGZYNVNsSlJxSmZZZHoxbnczTE1tOGNZNW1PM3R1TS9IUzYwV1oy?=
 =?utf-8?B?QlNjTXA1UFpudHAvUXE5U1hJd3FMQ21QMTZXMUpqQ3FKbmt4b1V5SFRyRlZz?=
 =?utf-8?B?VnhUd3kxdkJZRExuOHYvUzBMVC9rTFNrWHlWdkZVSzZJYTl6VG5uT2I5MlRj?=
 =?utf-8?B?K0N5L1FWdzB4S21MWWhpWE5tdXpOK2xGWnVYYkkwVW13RGNmVzZ4dWVXNG1E?=
 =?utf-8?B?dkVET1NmNk5mRENvcis1dWV0V3VTVUtEaU5HdWorOEZHdUNPSmpqcm5RQ0JG?=
 =?utf-8?B?dWk4RExxZjR4VzZmUXA0UTVFaDFJaE9oYzcvN3M5RjdqcjY4MmRiU1N0UE4r?=
 =?utf-8?B?Z05nbjcvRmZUVDhJcVJDTE9FdnNZd2tadU9MZ3JUalB3QTJuNCs4OUc4UE82?=
 =?utf-8?B?SWllSGtpWnBUWkZaMVFCQU1Ka1k5SXg3aGRHSGZrNjdIN3hLTWhyVHdrSFFS?=
 =?utf-8?B?anJieTVseTZYOG9YMzNoZE1YZVpTTXY5WUJET1dBdXg0N1B6NjBaRHoxUjhM?=
 =?utf-8?B?TklTQmZRNjBBQlFIMmo3L3l6N3pEYUxlZElBSW1pUWREQ1JrbE9YTWJMd0FM?=
 =?utf-8?B?bE5CUm9FRmJBU1NraUQ4WHAxOXpWNGU3Rm5Kbm5NYThWeDRFcXovQVBPS3pO?=
 =?utf-8?B?Wm5QS0szejNrRDFUSTdUalBDM3hrRy9oQWJWVWZ6L25wM0N0akgzRCtEVzRF?=
 =?utf-8?B?N052bUZBZCtZZktjYjNJRjB0eDlCV3hpREdubS9jOTErcmVBUnU3TVNTOExW?=
 =?utf-8?B?WEhNNnVMdklWWDdMZWdpUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6375.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OXMvZjFKMnh0ZmhIeVZaNTJIRjRkejlicWQxU2xHbTJsUG1kOVZrd2FEV2wr?=
 =?utf-8?B?RlV1NjlCOURVbGhKRHFhVVVhdXExMi8yK2NJOUdkVXJrODFmM0JwTzBRZmIv?=
 =?utf-8?B?WEtPeXBhdGZJNVlJalhYakFOYitRdC9CaytSSXlyZXJ0R1JLV216c2dxVlRU?=
 =?utf-8?B?a1hYazdqUHRpU25GTzdqaWFLZVpQZmVCYm9NNjh0RkxnRE8wRXhYTFBzZ1dH?=
 =?utf-8?B?VUo2Qm45aGpVMDI3NUVHTVFPdWJYYXljeU1PWmNrdTNnWUJ3OVZGSGZoeGpn?=
 =?utf-8?B?VFFKOUptbVcvanUzUjVWdTdsWWo4dFFZTGc2cVpTVi9NREIxbHpyZ3UrcUZV?=
 =?utf-8?B?bGFQT2haMW1FWWtwd1l6VVJIOCtkT1hYNkNRTlF1VHJYNzRNS3pzd3NLQUt6?=
 =?utf-8?B?ZWxnamJkM2x1dkF3NWN5Sk12VE9LbXNGTlo5aXc5OUcveW9sUVFOOVhKdXdq?=
 =?utf-8?B?WmM5Y0ZPdG1tbys2SFRXZWxBc0RsaW9jRDRLaDRLckJBQ0Z6cUljRk1PUGNs?=
 =?utf-8?B?Nkg2OCtUQkM2bVhHNW5FM2QwamwxNzNVYmdoWkFyRXRkOUFxenZHMkN6NUpu?=
 =?utf-8?B?ejJmcFBoK0d0NFRMSHlDYjJHZnNaenRzbCswSklRKzVZTDk0RTNxa1hqVUpz?=
 =?utf-8?B?N2phbVNtM2ovdEMwZkV0enhSTGtqc2tVL0NKbDd3YkFReXFNL0hpWnpIUHow?=
 =?utf-8?B?dWhubFpSQnQyRDBZRWxRRG9BY2Rlb1ZDNXhhSTJlK09rbncwWkVxWEFYTWJD?=
 =?utf-8?B?V0xiZFpiQ1RBTmRmc1paNllVWWduMmFMK3FrSmtDbWpHa0VyUkczZEZYa3Nn?=
 =?utf-8?B?NUU4bUMvYXBzamRBTkQzaVFMQU05ekpTTHlmaXFOZmZMdVN2NHdNZDZBaldV?=
 =?utf-8?B?bUR4cmRNWHo3RmZOcmZ3WGlkMjlPZjgrRXM5ZHN4SzBLSjBnazVzME1uSk8z?=
 =?utf-8?B?Y0piT2YybmNiYXhNTkhHS2ZnSFhvV0crdjJ5V2kycXlwZzNKbHM1SkIwbUh3?=
 =?utf-8?B?MmVRVUI2Uk4wQTRGamZldjhCZVAxK1NkYWNCWmk3WS9xUmVZM2hUcG1NNWNG?=
 =?utf-8?B?Q1RrVWdjZ0djdEU5YnBKU1QrZmFZYnZRUlJwblhaSWYvMm1paEx0bXZ0Rk5T?=
 =?utf-8?B?U1FwSHpScGJnemRNVnBTajR3bGFzb2V2RURuNWNTR1VIdEViaGRIbHZEK1BT?=
 =?utf-8?B?MDBwSW04YlZ2Zm9jRE5SemtNR2s5U0N1elZZM2Q2anQrVTllVDhTVXpVUVo1?=
 =?utf-8?B?ZVlWam1xVFRkaStoRTI5bVZCU29zSCtrR29hT3d4MkhWMEliU2ZkdUIxTU5r?=
 =?utf-8?B?UWp5clUzVHp5VEhhVFZTcjlXZ1pqN3ZZdEtUR3dKVzJKTHh5Q2NteG1BbW5X?=
 =?utf-8?B?OWJ2Rk4zc0VyUEhtbTN5VlhZS3BDRGVUVXdYNXZBZDdQNUlBNFUrVUtGcmNK?=
 =?utf-8?B?MWFuS0F6UXRCOFRmMk5FclFlRWMrYXFLM1JXcjh4RlVIYURTc0FEZzJrSE5R?=
 =?utf-8?B?M3VOa0I4RndxanQzVVFaQzE3K2diS1FuTnRwVVNwci9jNllqQWZHWHI1enBK?=
 =?utf-8?B?SSs4NzZXZ0QvVFZQRlFBOU5tYTk0NTFoNEdqWTVsNGJmT2xLRWRUYlVNRHVz?=
 =?utf-8?B?NWliemVDbU5iSktJUHVzczdEMU91T0l5dTJuWUt6TU9MYno1K2s3VE5Da1VT?=
 =?utf-8?B?bUpHYVVqdWtYa1RwQjRrT0hVdXFnV0lOaG5QUEc4SVhXUmE5ZWFJS1NCRVFL?=
 =?utf-8?B?ZnFOUlBGUmtRaFFZM2R0RWMyMWRydDBodWJRZDZURHYxWEVrVjhpRG5STVkw?=
 =?utf-8?B?VXlvY3FVMjFSUHkxR2luZVM5REMrTTg3akdFcUVKbWNsUWFWcG1WTmtxTWZK?=
 =?utf-8?B?YkZ2QUNzdHhPenM1VVQweDRUcmlpdlVoN3dzalFVQ1ZyYVRqeWY5S0ZCaXU5?=
 =?utf-8?B?ODU2U0VMSmFKKzZDeUlUVnZzUHVBb2dtb3QxTXhRdTU0dCtYWW9nNWxNTFBo?=
 =?utf-8?B?YlF1YzlJVVVRMGowWHNjMG1VbDFDNEtudjk3eE9GNCtPdnA1bFA2djhvQ0dS?=
 =?utf-8?B?RWlYZENqaEIrMHhGa3ZlWGo2N3NKOCtXaUlZcGpCL3E1bzJaeUkwUFQ2NERt?=
 =?utf-8?B?ZkNPZTdHbWErcVErbTVNc3VHekxJYnJpMStURktxOVFDUm1tRmVvUXdmaEZR?=
 =?utf-8?B?OFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a1b9fe-dc85-4ec9-76d4-08dd14b09de8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6375.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 22:11:35.5319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ab/vJGzCOhf1D3pJ7aJi8pfmI6MSmaJvg662LECn4SLfQYQYk0uEQiME1UZMnI8o/0v6dZxJY933n7pfHx2fLE+bXtNZt7e8NHq8keBIe8k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7570
X-OriginatorOrg: intel.com

On 2024-12-04 8:47 PM, Pierre-Louis Bossart wrote:
> 

...

>> UAOL is one of our priorities right now and some (e.g.: me) prefer to 
>> not pollute their mind with another approaches until what they have in 
>> mind is crystalized. In short, I'd vote for a approach where USB 
>> device has a ASoC representative in sound/soc/codecs/ just like it is 
>> the case for HDAudio. Either that or at least a ASoC-component 
>> representative, a dependency for UAOL-capable card to enumerate.
> 
> The main difference is that we don’t want the USB audio *control* part 
> to be seen in two places. The only requirement is to stream data with an 
> alternate optimized path, but all the volume control and whatnot is 
> supposed to be done using the regular usb-audio card. It would be 
> complete chaos for userspace if the same volume can be represented 
> differently.
> 
> The comparison with HDaudio is not quite right either. In the case of 
> HDaudio, it’s an all-or-nothing solution. The external device is 
> controlled by one entity, either legacy or ASoC based. That choice is 
> made at driver probe time. In the case of USB, the application needs to 
> have the choice of using either the legacy path, or the optimized path 
> that goes through a DSP. I think the last thing you want given this 
> context is to make the USB audio device an ASoC codec.
> 
> I find it rather interesting that this architectural feedback comes at 
> the v30, it’s unfair to Wesley really...
> 

Hi Pierre,

Obviously I'm late. After scanning the history of this one, indeed it's 
been a while since v1 has been sent. And thus I posted no NACKs. At the 
same time if I am to choose between: provide feedback vs provide 
no-feedback, I'd rather choose the former even if I'm to be 
ignored/overridden by a subsystem maintainer.

The subsystem maintainers also hold the last word, and I have no problem 
with them merging the patches if they believe its existing shape is 
good-enough. For example, my team could follow up this implementation 
next year with a patchset expanding/updating the functionality. I see 
this as a viable option.

Kind regards,
Czarek

