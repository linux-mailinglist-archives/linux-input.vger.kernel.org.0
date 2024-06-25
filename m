Return-Path: <linux-input+bounces-4610-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC791686B
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 14:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C05E1F21332
	for <lists+linux-input@lfdr.de>; Tue, 25 Jun 2024 12:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC93157A6C;
	Tue, 25 Jun 2024 12:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJbKNOAY"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542DD14AD2B;
	Tue, 25 Jun 2024 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320133; cv=fail; b=JC+QsrODlboJUyFjUg7Z9NQCPXpMCRcLZi9bIgbq/pJSJnHsv7G7tv2EeXuMC6yjef4TcDmjODeHluuTJ7+/J+HK8rCBfrNBOfzEUYlTzE3Hg+OwZPCtyhUyqE+0azVtOXeLl4utlilTwtRD84RBBJkrxhlnoUr8ihRJEFOdKSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320133; c=relaxed/simple;
	bh=g44pi5Xs4hPKpIahgvtBZhj79WVgTvddJZITtLLqTmQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qH6uvjmWa2fGkQpAaEZbRRwGPNu+ZwEm8rCD0cCnBCzXzgoUO2rG7UIPWdPAI6QxrCa0V/ebSYUmJ7WB6VaSR8d6aMA1HfwCabR363UtaFpDUMFwzKIMNVulIedBDrAVafEnD2AAGqMfxy8iLD3TuW6u953nezGa3nvBz1YEads=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJbKNOAY; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719320131; x=1750856131;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=g44pi5Xs4hPKpIahgvtBZhj79WVgTvddJZITtLLqTmQ=;
  b=eJbKNOAYYHAoFN3tWPrXUy/l9FaZE37GH6nv/wUK/KaF+BOxLOiQOL8r
   9zKZRYgSMBVXqjC1AObioqgkDdJFf7jZOrC4RFfn9cDjPIqoragKdTHsC
   3RfBaPJKyyDP6J+ZlGZehL1XMRX6y+eYC4YbNoFnw7e97WLEt58B7xfHT
   UDXGZErAo7MPWLRzZy+zwnBRY6i+Kz94/KUCUD1rl1duOCzp4tws7ceKY
   J8Oqvk58RllcKvWgBNwHKHCYMNEocCk2IIlKT1/AnmhZIS7xiq5gimRdx
   TKQ39h395IxyHlIfuKy/+n9+d1M6XoLATW6khiOMKYxipOm1pyb/taAFu
   Q==;
X-CSE-ConnectionGUID: wXWoP1zwSgK0UiUp3yVoEQ==
X-CSE-MsgGUID: fUgXu+cgQPCVaMa3calJ4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20214270"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="20214270"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 05:55:29 -0700
X-CSE-ConnectionGUID: DAfdpKBjT8yJ0UJHz+vjhA==
X-CSE-MsgGUID: qE7JRxOvTISFHj+f1j9www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; 
   d="scan'208";a="74840818"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jun 2024 05:55:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 05:55:28 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 05:55:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 05:55:28 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 05:55:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P877rga0ffxa36oerW/54lgJySlksVhmHUs/ljksxYw/ove5mGoGDAz+v9ofg7MvFUlVM0t9TGG/91if0Ah4ey2x4NIJhgSJwo8OfLoCzJ0/89Vu+7KsQv6Y8YrBLWMD7jgHJHt6oJz729Z2MGJfM6blOzrs5GLBmselbYYy3O3Bbb6C2qi3hpRnsrEbx4bdH3dvaZK1KmqWnIGf/uBKThqowCNr6ZTSGieuBdOXlbXOeJu63YkVFZxSyaI54lFUzmuIDvj76ZtEO0Sa/Tvc8SanzgGf0KkrgOKIBFil0+TGHgN4DTiXyLRAZyUqun5MHAueArihaxhUhnqkdupLVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWov00CtmkGmnXw1yr4tlqb4big4vy+jr49WOSXgTwU=;
 b=FXvN27RxSnJUQTMjwIugTalx9jOY/r6cxCH8Wsy9iVSVMYn3nZEq3uI/hsRhmq0CmxCZR+m7pZFp0LMBig14tYOIBJbgGqCa9l0k3Sv9i5Q9mgdSyl0vVtpVKczXt7aeIR2ACePgMD1dm/0/q6RuCC4ZsIMTH5lRACz9Lwfph0API0Z1Edxd/0e6Y8dt0ay/vvktjtNf9jxGGG50vp8ccphFJtfDdszLuEA8sC1ekesWnUK7O2eTaUahdC4ai4+F4mH5ibQdroYjGzHsVcMSQcSmCyNLaWr7BTOjgPwN6X7K7dQgFtpU85hnXMGTl0T6fUET25JUvlYLGZsky6tC9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB5277.namprd11.prod.outlook.com (2603:10b6:5:388::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Tue, 25 Jun 2024 12:55:26 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 12:55:26 +0000
Date: Tue, 25 Jun 2024 20:55:13 +0800
From: Philip Li <philip.li@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, Linux Memory Management List
	<linux-mm@kvack.org>, <amd-gfx@lists.freedesktop.org>, <imx@lists.linux.dev>,
	<intel-xe@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-mtd@lists.infradead.org>,
	<linux-trace-kernel@vger.kernel.org>, <netdev@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [linux-next:master] BUILD REGRESSION
 f76698bd9a8ca01d3581236082d786e9a6b72bb7
Message-ID: <Znq+MVbzKvDAXkaX@rli9-mobl>
References: <202406230716.DQbMBKh0-lkp@intel.com>
 <20240624123154.4c3125c3093636de35b407dd@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240624123154.4c3125c3093636de35b407dd@linux-foundation.org>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB5277:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed01ead-e6b9-43ef-2104-08dc95161537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|7416011|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZhSH/lbW6BitPLq78KS+g/XWUmze0Slwf/YlYwkex05hCx546pEv+Pp3fJWU?=
 =?us-ascii?Q?cMxNC6avhZcmDuQJNXf0cxGk5Z80vEBsqP1rkA9rRtUb3ifloSmX7kltzQWO?=
 =?us-ascii?Q?T7eNpMBw+oabQ0hdRMnqu/MT2cEUJ8HOBEn/pCyLFUwirzmX5Q7SKTCu/otb?=
 =?us-ascii?Q?sOscJalebYSszmBonJxK+TWqSdKLO3H6Ubo6Q2H0BR0tQ/+VL6NdHvhHxmhh?=
 =?us-ascii?Q?KaSFV03QrA6SHDqmibCO12VMoYwMQA4wdlZmcXhCeZG0RhqmjZD2DBSiNIlU?=
 =?us-ascii?Q?EhEn1brmoMQhxyDFKfo6ToBWE02ZKARLywmC0GQfQBm2fyepNcRAd3PDEzg6?=
 =?us-ascii?Q?yFNhE4FCDrDg4zpplocH+vVN/Xruahgk28tbEhbbqy2mQvbZBrk+6XEwCICi?=
 =?us-ascii?Q?m7JgUB0jWxnISCOK2RB2putNxZ++mxmK1IBF/ZGZlZaTe5IvAkUWGSZhvU0L?=
 =?us-ascii?Q?2uuzhTfMQRTZ7wjUOLn8gKmNV+cec6DenhRHjaIjK0RjWkmdSVLFX6uMgpiY?=
 =?us-ascii?Q?+DxNBM72IG8Y2z8maGbPzHBf0dGMyIppIwKH9QAH4ifDUJg01QhX8VTzesJQ?=
 =?us-ascii?Q?Cl5no1KzpLgB61fQVZ+Ev3IaNUVxhkhCyJWAGAcbf+ApBAp08HHtXyYjA4yJ?=
 =?us-ascii?Q?MjdCTeDyfB/VIyTLhk0vR0RZYTt2dRtLBNnDm2b00DS5UFVLcHVRNZaRlfkt?=
 =?us-ascii?Q?2V+MvK8CfUWowRz2bCwtF9yQc3UKDlNK5M0sKtSlEF6fr/fleOiv0mCVbnw5?=
 =?us-ascii?Q?BqxdOowwefHV4dQ/VJohwb6q+VWkO1y/xpaaQcx10s1bOo/0+4enqHxM3JYx?=
 =?us-ascii?Q?n1DL6MEmliWDV3kmb6/cVj7L1kEw5pNeoONADGNPg76LBE1LoIBLTUzFSk+m?=
 =?us-ascii?Q?iSnhOoF1ZzTjnI5CiA9buHP34wJMmSq/wmTlnZc15FsxqDU0IA6cwK4bg0gq?=
 =?us-ascii?Q?cqnnwXrM862yLA/sxRQXgoGcdxVwetrNzq3i9foijaHw9qGMGJjrSfhT6o6h?=
 =?us-ascii?Q?xNG9A/kco/qTcgLq6auxOKOlySQomz0NdxizgNXRxCrBZo4TX2NDjwV9SOCL?=
 =?us-ascii?Q?CYj3mTWR0dBkLN9AzQr2guDe7PIKgTX+yIBMRingnguU8Ha8YjbpiwAN/Tqw?=
 =?us-ascii?Q?9m/WvlUpW7rDR3v4dKOM2UoEyIksXaV4jSed+L+WQCLzUUpmq92fbA2FrO/S?=
 =?us-ascii?Q?6PeHxPghz9Fb+8qZ6tIRdd8wYH7bCSR2tTGH875Ky08ZWqznZqjSIpT/agv6?=
 =?us-ascii?Q?aSecfBaCLYU3mmtrQYygJrnodOi5321QuwgZHLJQ3w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FyIu3o/UWaqo0W+2ziYcAR2/11UTCK0oJYOJ+Hp3uriZ7xEiy3zUkLxAlalM?=
 =?us-ascii?Q?x5edpZuy1NTrWFtVCUCYCkfakYjwIrNvOoIOSaFJJXUGpTjy8dZycEfFIv17?=
 =?us-ascii?Q?XTDYERWA0DNY+h/8poirYc4VjJOqlEYoBntNdmaBxws2sPfshpcwDrdxQGzj?=
 =?us-ascii?Q?KebZp1Ky0yhYgu2OpgqRP2ba4czSQf9Pl/UFCtV98XvMF+re3VpCixljePY5?=
 =?us-ascii?Q?Jgs5orlSrYfh1KgCBOJJJ2VCSs+0ISnKN3vjfKZFaXkxEQjwpZOOp/XM2alD?=
 =?us-ascii?Q?tGnYrWTb+O80wAKcKDFQjrtaGfMszDaG0TuiaTUahCJzovx5p63XLBiVXSBx?=
 =?us-ascii?Q?wMRGSVM0I9u+ZsIJHesRHRM+TqcwPYnOflldvFMDbKLM23iKahUpiYv7YXy1?=
 =?us-ascii?Q?fDPo7NZU+YKgxqVARhsr1Z92VrFkzJvsnTJC+HpHQQ87zHf9rGJCVQmIKbJy?=
 =?us-ascii?Q?Jn0f80lvCxMD8YFIPddgzrU6NvPpuCXJVeuBkCB1BFvPFBf4koaYe+n14Vlu?=
 =?us-ascii?Q?O67/wk19J+N8178WQz5uiHUNzB+l/SRvbqcbmxesfzJiYh/wpbhQqMqN2c5v?=
 =?us-ascii?Q?KKbyLN37DBWtorSoCUhe2nhyQP2OT2fYxtgzzF5B6Qoc4VKcEB7xIq4TPpfL?=
 =?us-ascii?Q?GbuIzWxpiVQCBIoWAJIgPrewSEnDJAQ9IyVO3AOV5G8DTeZU9Dl0N7gwu//O?=
 =?us-ascii?Q?f68dC8GIxfJWYQ2oDZDjQv0EOxtOWw9Lm4LHZvrCexuudlcNr45jCG6sL6uu?=
 =?us-ascii?Q?Z0EVbIOz4qnwA4LD7O7dblOx6EpWWpYaqakqFLqtGaAJCXzQUb9jvo2V/eaS?=
 =?us-ascii?Q?1s/Y1DkADA3H4PJdeHR3wrrBqMltwbF9Bge/zYsxa0SWtiGThEFdeY0bQa76?=
 =?us-ascii?Q?/wcL3K6eipfOsavXZEadyjhpLTvZ5gBatbOs+YSE3O6ZCabv30WOqILhROYg?=
 =?us-ascii?Q?8fkU6dTuF3TXkLEmI+6u8FuGiaOmLL+xHy63Ws/L0IdxdY3udzuMOOJmpXN9?=
 =?us-ascii?Q?0rJsDeQX7BkhCoAOOumLJMXRA8gGvGn145R+lC4zoiKwSMSRiaHfMYZUK4XE?=
 =?us-ascii?Q?ckRhvVKsdtYhluMFG60oxvW1lDhxvsH8GKcKDU+GQBFNSiL90WvP4bgG/+M9?=
 =?us-ascii?Q?W3YqkTAjBk2I9drYc6j2daZOqG/CXcLl12jzHnjBu6wMjhdri3r2S8wWjUq6?=
 =?us-ascii?Q?J13jSMS5YQqpqOPThQR855oExymcWY9xrJuLFp0Km1Z2TLV4IEHIi8cOfOkZ?=
 =?us-ascii?Q?BkB2fxNuniAiw3l2egsz9kpxHdqwfMmboqpxFOXOc0DNoSjPU/uJumtVhJB5?=
 =?us-ascii?Q?jWLzHTMScGrgoRwnuJc52/oSGU31jVXWb2fCB3DAxtGLc+AR5lnw0r1QmIve?=
 =?us-ascii?Q?6GmIEDHDjjukjDTdzlf4Bn+8qap81Uw6UFRSoxlHC8k4FRu8kAWigvWFhrbr?=
 =?us-ascii?Q?wSTodaj823UTcitysuB/3pdLdiFQmEL5KwTt6SvSjxSvMzN3sPmgl+9/H83l?=
 =?us-ascii?Q?ATtFqCxWpgB77/5m1aw0jkeRb2KqL9xBpUHZS70iuczCe8ffOCw0anWGEZpE?=
 =?us-ascii?Q?YVNftbCVCe7vJJnlUgZv9EwVWzDyhu29kszZAswA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed01ead-e6b9-43ef-2104-08dc95161537
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 12:55:26.0864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /3v4ISKi8dIs5u6YAztN4x1hkwhMEgNJ+hBkoDH2xpqAO65AE5e9HLB8aafw8/iW8bUchXQXB+5d4aoWZ/XnaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5277
X-OriginatorOrg: intel.com

On Mon, Jun 24, 2024 at 12:31:54PM -0700, Andrew Morton wrote:
> On Sun, 23 Jun 2024 07:11:24 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > branch HEAD: f76698bd9a8ca01d3581236082d786e9a6b72bb7  Add linux-next specific files for 20240621
> > 
> > Error/Warning reports:
> > 
> > https://lore.kernel.org/oe-kbuild-all/202406220536.JnAncjqz-lkp@intel.com
> > https://lore.kernel.org/oe-kbuild-all/202406220754.evK8Hrjw-lkp@intel.com
> > 
> > Error/Warning: (recently discovered and may have been fixed)
> > 
> > drivers/soc/qcom/smsm.c:(.text.qcom_smsm_remove+0x70): undefined reference to `mbox_free_channel'
> > 
> > Unverified Error/Warning (likely false positive, please contact us if interested):
> > 
> > include/linux/container_of.h:20:54: error: invalid use of undefined type 'struct thpsize'
> > include/linux/list.h:645:25: error: invalid use of undefined type 'struct thpsize'
> > include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct thpsize'
> > mm/huge_memory.c:455:21: error: implicit declaration of function 'to_thpsize'; did you mean 'thp_size'? [-Werror=implicit-function-declaration]
> > mm/huge_memory.c:455:37: error: invalid type argument of '->' (have 'int')
> > mm/huge_memory.c:558:35: error: 'MTHP_STAT_FILE_ALLOC' undeclared (first use in this function); did you mean 'THP_FILE_ALLOC'?
> > mm/huge_memory.c:559:38: error: 'MTHP_STAT_FILE_FALLBACK' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK'?
> > mm/huge_memory.c:560:45: error: 'MTHP_STAT_FILE_FALLBACK_CHARGE' undeclared (first use in this function); did you mean 'THP_FILE_FALLBACK_CHARGE'?
> > mm/huge_memory.c:579:17: warning: assignment to 'struct thpsize *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> > mm/huge_memory.c:579:33: error: invalid application of 'sizeof' to incomplete type 'struct thpsize'
> > mm/huge_memory.c:583:44: error: invalid use of undefined type 'struct thpsize'
> > mm/huge_memory.c:608:15: warning: passing argument 1 of 'kfree' makes pointer from integer without a cast [-Wint-conversion]
> > 
> >
> > ...
> >
> >
> > |-- x86_64-randconfig-014-20240202
> > |   |-- include-linux-container_of.h:error:invalid-use-of-undefined-type-struct-thpsize
> > |   |-- include-linux-list.h:error:invalid-use-of-undefined-type-struct-thpsize
> > |   |-- include-linux-stddef.h:error:invalid-use-of-undefined-type-struct-thpsize
> > |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_ALLOC-undeclared-(first-use-in-this-function)
> > |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK-undeclared-(first-use-in-this-function)
> > |   |-- mm-huge_memory.c:error:MTHP_STAT_FILE_FALLBACK_CHARGE-undeclared-(first-use-in-this-function)
> > |   |-- mm-huge_memory.c:error:implicit-declaration-of-function-to_thpsize
> > |   |-- mm-huge_memory.c:error:invalid-application-of-sizeof-to-incomplete-type-struct-thpsize
> > |   |-- mm-huge_memory.c:error:invalid-type-argument-of-(have-int-)
> > |   |-- mm-huge_memory.c:error:invalid-use-of-undefined-type-struct-thpsize
> > |   |-- mm-huge_memory.c:warning:assignment-to-struct-thpsize-from-int-makes-pointer-from-integer-without-a-cast
> > |   `-- mm-huge_memory.c:warning:passing-argument-of-kfree-makes-pointer-from-integer-without-a-cast
> 
> Is there a way for us to obtain that config file?

Sorry, kindly ignore the issues associated with x86_64-randconfig-014-20240202 kconfig.
The bisected reports for it are mostly wrong such as [1], [2] due to bot issue, thus these
wrong info was included in this summary report as well.

[1] https://lore.kernel.org/oe-kbuild-all/202406220112.qjyQbasK-lkp@intel.com/
[2] https://lore.kernel.org/oe-kbuild-all/202406211750.Ks4k82Gi-lkp@intel.com/


> 
> "mm: shmem: add multi-size THP sysfs interface for anonymous shmem"
> moved things into mm_tytpes.h but didn't include it so perhaps this
> will fix:
> 
> --- a/mm/huge_memory.c~mm-shmem-add-multi-size-thp-sysfs-interface-for-anonymous-shmem-fix-4
> +++ a/mm/huge_memory.c
> @@ -20,6 +20,7 @@
>  #include <linux/swapops.h>
>  #include <linux/backing-dev.h>
>  #include <linux/dax.h>
> +#include <linux/mm_types.h>
>  #include <linux/khugepaged.h>
>  #include <linux/freezer.h>
>  #include <linux/pfn_t.h>
> _
> 

