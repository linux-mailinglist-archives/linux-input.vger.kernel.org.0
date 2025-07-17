Return-Path: <linux-input+bounces-13586-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D98B098AE
	for <lists+linux-input@lfdr.de>; Fri, 18 Jul 2025 01:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D430858372D
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 23:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5E3E241676;
	Thu, 17 Jul 2025 23:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LmWikmZS"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943554503B;
	Thu, 17 Jul 2025 23:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752796791; cv=fail; b=Ds55d0fkX/s9ukH4HGFAKE1V8p8PhoRh7qx5BwyVc8/Qmag5UqqG4yZcD/6HGJvZ98miN4nnSguCQc01YoSHuVpjKexVQbzXBUGYnnLQOktUfvkswY4vOCXoJbC4OmLa3qrYw4Sd5Yrro5KfVLOEB3jj6NhlcmS6IDWSnOsaGjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752796791; c=relaxed/simple;
	bh=xIAeZjB6y2CaF5Kk3ysWd6KY1yue03D5oS4ONWNb17Y=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lgH9ZKuiRH/mw922WK67XMNdGTSMMxm8UkNk3uUXouwTo+SSwdE9d+WJUOeUQe7nebhuRGymY0zh31hlAblwyFMenBJWG+iNGd6FPn/aHOCO5CrD/o+Uzl/tROePasW/qty2JqKxXKCyRbbGoMxjDmcjuSgYTw7qBNsLZJptMeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LmWikmZS; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752796790; x=1784332790;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=xIAeZjB6y2CaF5Kk3ysWd6KY1yue03D5oS4ONWNb17Y=;
  b=LmWikmZSWa4YSKoRXGRkCEN72UcmKQZdI0oYf1X1r+8sdKOykyRipqD+
   LEu+CEb813geJ9o3K9uU9bnKd0UCPYbZReY8Mwq4lhht3UlPYE0RybYy1
   9SJoCdhSLdqK4R+93SE02tzFV8mjBrpUgA/NT2Bjt48YuhoWQuPGXQo1W
   BbSBvrTmG0M3//ISkElhzlOUKs2/hTtp7WWkbMYxPIagfdEaLdG79CarQ
   YcqXMd15xN6U/lKpPQ6PAaDpyjiAuIEY3cAr7NrY7wQoL8mHQkAHhIDM3
   V3V9yu4K5x0FWzXaK3fwE0xH4XFfXd8zYi4fdy+uekxC+Rq7zZEdEhAEP
   A==;
X-CSE-ConnectionGUID: ds38WtSoRnSgMriQl7ot5A==
X-CSE-MsgGUID: wm9MS0CoTGyoKICg9SPpxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="66535926"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="66535926"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 16:59:49 -0700
X-CSE-ConnectionGUID: hqMk5LAiS+KS/jDwpmNEkw==
X-CSE-MsgGUID: ZssdNt1VSdqo/7JGcTkknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="195060385"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 16:59:49 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 16:59:48 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 17 Jul 2025 16:59:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 17 Jul 2025 16:59:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYVL+yMTC0RsxufZsPImE/darzJ4e8ryVEJv1EAyc+49CiljYW28nGKmMo0YIpVAbNYhlG6Zyy1lhpai2mpD/adzXwPHRjt55D/arCfXPVMMxAAnm2ezl8fql0hpEAyYRluXFTbt4rLkKXolEMQpgp7lDY0H3PkRP+HM6FQ8STtcP5boBw9LKe/J1bXnNEbSee6ZcKUEntQXKkOhS9/u/+9U7eVmg0UPu5gN38Jn6OvzFRajyaevC/hjO71z60VQI7925DXu8gv8Dro6CLz35c/47dvJSgyqSwsluhnXa3G/jAdn5CaIJB/oHHKjB+k7DTw2QVmCCFLBBWW5JyRhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+UaayXb0JV3mrsPwil+I7FTagimYpov98VveFbFdd20=;
 b=F02u1peGmI+OUhXT7QESSfVzPlpuNtX2xNU+JQp6ikhPClbfV/jVwnA8F+/u1P7i0zUdcZfq4ZRADrfDXCbV+AhyDK0DJKCbgbl7gO3vMpAc3jXwtc0Luw8Pu1gSW4vUqjyaqHMizbk9agDWc1+9YjeeFfAA2zNZVQYJsA25/670Wj7XUZ6IQutQT3fvSE9Sn7Du+P/5pff4vyFKKXZ1VE4BC+U/snvqivnxSI0pdC6KwukBCoa/1YMjYqb91sSOdNsPJMlv5TZ2hsW6QPcJsWZVIcMjUP+5hSlyVxEcbvnghQ3ACJJQvvNug32D6jsyovQVrt1RzstICp9zLeVA+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Thu, 17 Jul
 2025 23:59:45 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 23:59:45 +0000
Date: Fri, 18 Jul 2025 07:59:34 +0800
From: Philip Li <philip.li@intel.com>
To: Jonathan Denose <jdenose@google.com>
CC: kernel test robot <lkp@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg
	<rydberg@bitmath.org>, <oe-kbuild-all@lists.linux.dev>,
	<linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, Angela Czubak <aczubak@google.com>, Sean O'Brien
	<seobrien@google.com>
Subject: Re: [PATCH 11/11] HID: multitouch: add haptic multitouch support
Message-ID: <aHmOZiQ7TAQ3TjpQ@rli9-mobl>
References: <20250714-support-forcepads-v1-11-71c7c05748c9@google.com>
 <202507151942.94dhYylY-lkp@intel.com>
 <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVNYePCuCw_SSTxwAdcastPP_azik44kG18o0_QK37OiZA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 42cc2e93-1051-4505-bdba-08ddc58e00d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ui9lR3VwNk1YWDdPODliZkUvaHdjeTZiVDFqOE01NWVkRGgycHlmb1psVHk0?=
 =?utf-8?B?SmdFMHY4c3BNaUoveWtubkhGTXhkcXE3bVl0bHVKaXVDcGZUTDZmY3FIT0FB?=
 =?utf-8?B?eVlwQ0xOZTlEME9aeFc2dDZoSS9NN1RlVjZaRW4rTGZxdTJGMXJ6eEk0RXdh?=
 =?utf-8?B?Q2grOWo5QWlLOER5cGxmemhzdDgvdVdjWWxpb2hRaUk4WlBrUmRQVzJ4NkNZ?=
 =?utf-8?B?UzAvMThObnBjaG1jZUx0Nm9ES01hQjkyQ2dDZDh0NThyRm11eDVWelY4Qm9l?=
 =?utf-8?B?QjU1NGE1UkFKckVNMXBOQWJMNUt5TGM0TUlMNFh5N2NYVXMxVHlBYmJVR2Mv?=
 =?utf-8?B?Njh2aVhXeDRBSkx0TUk1QUpqR0dDMjVnWkZWWXE2ZnQ2VVphZ09YQnNWcHVs?=
 =?utf-8?B?NG4veGpOaDJHNUtKLzVUU2ZqUnJ0U3QzdWhJSWQrL1VNcDBIOWo2WWRReFFh?=
 =?utf-8?B?eDArTnh4VmxlUkVGbGRDNG5vSWtGb0JmZW80Q25XVFhndm1jUDFWNlkxMEdt?=
 =?utf-8?B?bXZHZGU0Ritrai90dUx1MkZEVTRFbTlKa3NHY1hJRnJWMk9INzNVV1VqWXUy?=
 =?utf-8?B?UitqMWFSdTNleGlLcWlieW5wSTFYbWQ2bjVrU29scGNGbmplYjlCL214czV2?=
 =?utf-8?B?V1BsSlB2VW5hR0lMaVZtdWdxOWJESnd3ZWtYdHJzMEtMd3RJV2l4cWhGKysr?=
 =?utf-8?B?UWlGWGw5L20xSlpWNVdFb3lvYytsMWdKOWViZHRNY1lxVitZMGdnWVQ3c2Iv?=
 =?utf-8?B?cVdTZkpZNlE5TW1OMGs0Q2puekdvY0o2bitiNjJESndsZVdwMVhGbTdXbjlH?=
 =?utf-8?B?bDhqMEdnZW5HaWRxa2RjRmw2U0lkV0JGdWUydEEvWTVQVzQwaldzV0dNeFhn?=
 =?utf-8?B?NVQ2TTN0aGhsczBGUVNDbURNdFBKZUtyZ0cvbC8yczRjUFJwdEExdHVkUWRP?=
 =?utf-8?B?eFdESUFZTG90UDJMeWNzU2w4WkJoSnQwdzBmN3hKbFFnM2Q1UENoVmZib29P?=
 =?utf-8?B?cVB0VVE5ek5tTk5WbVBLcUlpRzRhV1hiK2lpZE1YMWFzL3RJK0hYODVyU1VU?=
 =?utf-8?B?T3FoMTB3V0NvOFJYcFlBd2JuS3k4QmpmZ29OWnNMUVlmUmxqUm5XSmIzQzdT?=
 =?utf-8?B?WStzd09TNWt4NGMxR0VBcEF3RDR0VlRUVHBWVTUweVJ6d0NlSHNVZWJlVjFG?=
 =?utf-8?B?eURra05QMEpEeGV5L1RBU0VDdzM3ZENWK0NOV1RIZDlId3hMd2JBNVhmaGlU?=
 =?utf-8?B?ZVJiWndWV0d5QkU4cHpGMnFSTlM1ajBPUmdPODk4USt0amFDMGpoOXV1cHpv?=
 =?utf-8?B?aUJ4NUVVdXVzRmJKWllUQTJVTGdnU2crRmhOMlV4bWlnV1l4bTJOWnJDU1Y5?=
 =?utf-8?B?RjFwU0xORU8rbit0MGI5eEZLZmxQM3FVVEIzVVh5TmR3dXh3T3lXZk5UeE1p?=
 =?utf-8?B?bFZxemhFTWRFZmFxa3pldHZPSklaZFdWTkxRaEg2L3FFTDgrNmR1ZGlpS1h2?=
 =?utf-8?B?ZG5TYnJLaE42a0haSWlPWFJ4YmNGQ2I4ZHR2MWNFdE1ndkxqNHk5MmJSRUZQ?=
 =?utf-8?B?VU9TY1ZqalR3SzFyaW5ONmhxNVh6b1FFa2oxWGtFb1dYeEI5cm0xaG1pVzRH?=
 =?utf-8?B?eEwybTlpNzM3TGh4TDJCc2lXTUJPa0JpZFBEbVl6QnJtMEhhdVJQQUxxTVJS?=
 =?utf-8?B?Z1owZnZmOVJmSHdTTU5HZUZ6U05mYjQzak54U3R2NlNlaUpUakdyZDJOcy8r?=
 =?utf-8?B?NE41amVNaXhZY0FFZmF4OVZyTWE3WGRCZDZZTVl1ekVjTEJYVEFuUmRvWnhW?=
 =?utf-8?B?RDREdDRHM1dvU2xjRGc3VmJreWtkNFR5SXRYUHBYYTJpQWhIUHZNYmJMVXZD?=
 =?utf-8?Q?AwuOUiJzqhzJZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmYvWkVIQWpoS25haGRMMVlDSmxQRSt0UkZ4VitmMWRKTGh2UkliQ05TcldY?=
 =?utf-8?B?eTlWd1d3SWRhWXpYQjk2QS9jcXpmakhpYUJQVENwUEpuWlZVaWxHQ1BTVzlj?=
 =?utf-8?B?MmtNUE9WKzZlUEdGWUhUMWxWVWVITlZENjRDL2trZHNFT3Z4aWVPZ2o3Z0NL?=
 =?utf-8?B?RlEvbEtJaDQwWGhNYTUvS0RDcXRaVnVWd21VUE5rdWZIb1RUVzNBS2E3VHlt?=
 =?utf-8?B?M2FYTXpTbkZncWF1RllOUlJnTm56UzRrYklBeTk3RmJpVzZ6M3QwOHc5NnZC?=
 =?utf-8?B?bjU5aGl1T1NvaS9xcHMvMkNkTUo1TEtLNFVHSG5vWGhLaXFyUGxNdGhmZ2Rm?=
 =?utf-8?B?SzVFWlVxTDdLaWNPczlpdDJGdU44OTFhb2RMWUJBNTJiNXFIRXlCUTRrM0RS?=
 =?utf-8?B?cmIxSTUwaHZIZ21uZWZ3ZnBCeS9mR1YvVWxraXN2NElwK3VsVitkcnIvdlFn?=
 =?utf-8?B?ekhZaWZvcDRHQ3I1N2JsVnZlOGJxZUtjL3BkZ1IrMGZBMG5vQ2NyYlNwNXZQ?=
 =?utf-8?B?WnpwdmRFZ2UvV3N5TmNMWGphOFpIbXFldDhFejl2cm0vSWFOUVl6MG42UDhn?=
 =?utf-8?B?ZUVlOFFaUTA3TXlKQWF3RElzVzhGc1NWajN1ZWVqZDRwVDIrQ3VGcE1HYUFa?=
 =?utf-8?B?dW1mVHZqZElXNlo5RWhSOEZSY01pTDdyZGJnYlFpTFVRdjVPNmdtY0FaanhM?=
 =?utf-8?B?b2J5QUpiSHNYZlpCanZZK2ZweE1acEdWSGVTKzNwakM5Mk9Da2lBdUI5WVBG?=
 =?utf-8?B?UVpCOWR2QmdVUjNDRDdLampHV1lVanhSc0Qwa2pOU2tCVEZHR3p4VGpmYkVs?=
 =?utf-8?B?MjFVQTlVY0ZjTFBabGprZDQyQi9HU3N4OGQwcXN3c3VLOEZ6dnhDUjRsSmFK?=
 =?utf-8?B?aWdja0srZUdCdnVRcGYvRmp1MXk0aDI5Q2JjekhmcThOQkhlWTFiMmlQaW4r?=
 =?utf-8?B?TEtJbEdyeFhmRmdpcUVZTmRaTVRZbWVkS2JpNlpnbnZZL0NwZW9mT3U2QUpv?=
 =?utf-8?B?Zm5MVG1yN3hSOFBacWpHM0tjdlRia3NzNWNtb3NtNyt1NWlXM2p4bWk5dkpZ?=
 =?utf-8?B?NG00eWx1OEVwQzVSZE5kRmxkSjY5SG51WGFMdUNlT1JhK2hROHFhdkhrcER0?=
 =?utf-8?B?dm5IQWMvaFFWa3phdkZ4aUpxWG5DNVRFcFV1TDNIRE9CK3NsN29xbFVoNmJw?=
 =?utf-8?B?V29WcUhoVk9wQ0Q5Mll5dmozS1lDcVIxT1E2RVJzVkkvMnJPZ3d0R1pKNjNp?=
 =?utf-8?B?NlVCbXRvN3FjR1RkS3JEMkJ1RXJSQXBaZ0xLU2pKK1J2OTFXVGt1STNOUWJV?=
 =?utf-8?B?R2h6bk9xYXlFNE52VzdwV1RsTThCMWZnNGJVaVh3Qi9FUmJDVm9JZTQyWlJE?=
 =?utf-8?B?M1VCbVcwbHR1ZUpDUVNTNjdKckxXTHkwcXlPOWp2clRHTW9Ta1ZsRnJyWXBZ?=
 =?utf-8?B?eTlnOEYvYU51TjYvbWQyUEZnK3BRZXRyWjhJS0xVbmFmaC9QeDNYZ0phK1ph?=
 =?utf-8?B?OGwrNjNiVnNXTlBSNWxjV0h2U2RoR0JJYTVVS2dXaEpMOEVKMWNlc0h6Y1Yz?=
 =?utf-8?B?ZUtkNllYZDdQSVl5SFlwbEwrWnA5OHZWSDhtYmF3MWxWaksvMllqUzZwSHBn?=
 =?utf-8?B?bXR5RUtFZG43YVV3ZzRDb2taSnVOVldIWSttNERmaGpOTVh3Q0FaSjJ3SjZ0?=
 =?utf-8?B?NnhKbmRZaDVVZWxSMkIvektvQUFDbmNJRjg5R1V6RzdWQ2NqanVHZ2NoQmR2?=
 =?utf-8?B?QmRvNFVCMDV0NXlqbGdSQlBUdjFZTHVYL1hkTnNaV09GcXRYRmNkMGNEbkR4?=
 =?utf-8?B?RWZvTkpQWUh1aVI0VjZRWnJlOStTdHRwLzZ6dXViRXBxVXZpR2ZHdi9USkRq?=
 =?utf-8?B?YTYvOW42bTVJRmo3am14NkFFRWhCTnNjQjNnK1A2YjVMR3V4MDhlazlicTBX?=
 =?utf-8?B?SEd5M3NjQWpKWTJuN2JvdUNMdDFqVVB2QzA0L090Z29DYU9CVHZGK0MxQlI5?=
 =?utf-8?B?MDJ2dWo4UlNFQUN0SU01Ny9wNGFCSEpSMXZBcGFqRngxRFFjcEt2eDBNTU1o?=
 =?utf-8?B?M1RjNHNvbkZWT1JybVlIZzB2S1pQMit3cGxqTEM4UUxMbDNRRFRlUUtpMytF?=
 =?utf-8?Q?o0QYaITJ3asSnVHfibQXkgxOd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 42cc2e93-1051-4505-bdba-08ddc58e00d6
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 23:59:44.9603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GKBJ1KtmfpWYwqkeQFuUfZpQyBIyoChOsUCOl4erdIAKeTJv9A/YV84m5yQhePy6tYY67KaIDnMAmxVQvtlzyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-OriginatorOrg: intel.com

On Thu, Jul 17, 2025 at 01:43:28PM -0500, Jonathan Denose wrote:
> On Tue, Jul 15, 2025 at 6:36 AM kernel test robot <lkp@intel.com> wrote:
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 86731a2a651e58953fc949573895f2fa6d456841]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Denose/HID-add-haptics-page-defines/20250714-231444
> > base:   86731a2a651e58953fc949573895f2fa6d456841
> > patch link:    https://lore.kernel.org/r/20250714-support-forcepads-v1-11-71c7c05748c9%40google.com
> > patch subject: [PATCH 11/11] HID: multitouch: add haptic multitouch support
> > config: hexagon-randconfig-r112-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce: (https://download.01.org/0day-ci/archive/20250715/202507151942.94dhYylY-lkp@intel.com/reproduce)
> 
> I'm having trouble reproducing this build error. I tried following the

Sorry Jonathan, the reproduce step we provide is wrong, would you mind to give
a try similar to the steps in [1]? We will resolve the bug as early as possible.

[1] https://download.01.org/0day-ci/archive/20250717/202507170506.Wzz1lR5I-lkp@intel.com/reproduce

> steps in the linked reproduce file, but when running:
> COMPILER_INSTALL_PATH=$HOME/0day ~/lkp-tests/kbuild/make.cross C=1
> CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__ -fmax-errors=unlimited
> -fmax-warnings=unlimited' O=build_dir ARCH=hexagon olddefconfig
> 
> I get the errors:
> 0day/gcc-4.6.1-nolibc/hexagon-linux/bin/hexagon-linux-gcc: unknown C compiler
> scripts/Kconfig.include:45: Sorry, this C compiler is not supported.
> 
> It looks to me like the hexagon-linux-gcc compiler is correctly
> installed at $HOME/0day so I'm not sure what to do from here. Can
> someone please assist me with this?
> 
> --
> Jonathan
> 

