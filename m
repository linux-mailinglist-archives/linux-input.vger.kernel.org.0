Return-Path: <linux-input+bounces-16665-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBF1CD481A
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 02:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C6C3730054AD
	for <lists+linux-input@lfdr.de>; Mon, 22 Dec 2025 01:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67AB1DA62E;
	Mon, 22 Dec 2025 01:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDUDYBT4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B74D3FF1;
	Mon, 22 Dec 2025 01:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766366082; cv=fail; b=h8xjhUR2o/++bd+1YwP+llBNV2BzlAdANzZi8/Y0HfFZSX37DtpFnaaw/T2wZegTZQkiB83O4V2iWuF3PXvivKCli4qu2qu6W5GCL3nVCNwsbrDvq8xy1W9HDSRdAtxNg6ATBCWE6NnjvsBziHdwV/T80bkKbh6Nl+zGOVA/078=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766366082; c=relaxed/simple;
	bh=Rg9Y1WZygozr+kmiJNLHeUD+K5e4msVPLgnr0mYk4x4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qfOkJWVjA+CsaeGZEK5pCMKExlzNspiMNumNopLzzXaQ7Reu/1jJCJUaDk2eYjwjNHyEvchk3OXx0CSbMYtzQ0p4ssJ4QbvrXqlUJ71W0gad6Agxiow+d9j+AExwOdcR1+SbknY7/VZADkz/JJ5XQcHAsjSCtXSlkDL1a1zjEUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDUDYBT4; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766366081; x=1797902081;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Rg9Y1WZygozr+kmiJNLHeUD+K5e4msVPLgnr0mYk4x4=;
  b=UDUDYBT4NZLQYG7tzFW68eGoxOA4DPslTBmil9umTd+1OKDmjOwMx6bV
   RaylDyELPcxbbRjuPwZVzRtewzKl1vTVfF4sQKBePTboxZBLMZG9TXRK6
   ucBd6BVjbAEn2cT5zDl5xgyXs+iY07TaCLl3tAXPWU3TwL4X17ClqQXYp
   6cKhhOhSSejb9myCWDGwtKPgHKl+vc0IolRAy7UNW3jUSnbhQeaTPKpYZ
   8x++628yRNtewRURdl6Lq//ATeuJcA/cwuPR/91VD4kPZsL3efmUUklyZ
   /crjlcbXrskxGT/fZPtvXWhGhN9qfsQDdNeE2FaqoQKPycYb6kq1lC2fV
   Q==;
X-CSE-ConnectionGUID: e++7MvDcS2W01AknObnO3g==
X-CSE-MsgGUID: ltgp0llXTTG0PujmyueT/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68205522"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68205522"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:14:40 -0800
X-CSE-ConnectionGUID: tD8AzwLDQqGTdXG6/lUxog==
X-CSE-MsgGUID: QjHvwufsRlCAxpe4PgopTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230420966"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 17:14:40 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 17:14:39 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 21 Dec 2025 17:14:39 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.2) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 21 Dec 2025 17:14:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OaekAF7U4kWyH/dbhA0yEl6OP4whyjt+6uBiPWjyYCqkYLyhxzHDt7HJ8jS60ob8k1bOz6Tsgwne8hnPhbEbvFdKSHCjjEQWsHG8uAUbu5TsAPmPRsgUALUL8O+RqEehUI/ZlSaaArEwujhUM9p8ScP8k6cj5yRNybZfSgJY+MsINAe3kfxjvNkQDWGf7B4r6L3A2GUI3gXiE1RhKVYZhyhqEF+QJlZtwSq7eDJGAGtGZDH1NMzB43x28NQeXG9nwpmZ9ViISxQ4/wbehgQqEMKUfsYDj/AiI3VoG1apKU6wFRFFmcB/Oh0HXZ5eWxwy3+nPZXn2MlBcwtNPS5kPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rg9Y1WZygozr+kmiJNLHeUD+K5e4msVPLgnr0mYk4x4=;
 b=qr4Gcc6W2wSCksQRtyIenfWV48OMJSF+0MWGJ9M8CUAkQlzYzV+GaLdbwpSyGyt0UQqvVMG5cAyYBek7HoD9hGOJqaGvrzOpFaFeGrmbJPOFO163cJ7Gn9UQKNOEogddy7j4KHpZnJI6qXB3LHx/kLsv4LT2cvnE4rM507qxfPojE3ynBxEBWLHhd5boZehxAbIttWLU0+RJa3XawjBJeovV12fppX+1iH5ul0xnllKl8lbYcnQ98oXVziDyyOXftFurKHMvgYoupmGQ7fDJnq/RlLYnK8JWz7tyau/GEHIdhfn1M8shUAejqf7gJ/4JS9y+Lcx6dPNQt0eiqc9Euw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Mon, 22 Dec
 2025 01:14:37 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 01:14:37 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>, "jikos@kernel.org"
	<jikos@kernel.org>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: Intel-thc-hid: Intel-thc: Fix wrong register reading
Thread-Topic: [PATCH] HID: Intel-thc-hid: Intel-thc: Fix wrong register
 reading
Thread-Index: AQHccIS05OHOywy810WyyPgcz/gWBLUo728AgAPwDvA=
Date: Mon, 22 Dec 2025 01:14:37 +0000
Message-ID: <IA1PR11MB6098F000D71135EA4C3D79E6F4B4A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20251219011438.2104441-1-even.xu@intel.com>
 <176614956692.1654761.8104372490843697513.b4-ty@kernel.org>
In-Reply-To: <176614956692.1654761.8104372490843697513.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|BN9PR11MB5244:EE_
x-ms-office365-filtering-correlation-id: f7fd3497-9033-498f-9e98-08de40f779bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?d0dJM2VDL0dGMkRrcDdpMFI4MkVSTGVmcFZOU1k1a1RuQzNLSkc3VnhNZFFS?=
 =?utf-8?B?K2xxYTg0YXlobUpoVlhZa2VENkQvdzE5OWxBNlZpY3JOK2liWVVPTmpxbWhw?=
 =?utf-8?B?YkFGVklPWXVJMzlnYjA1UkZsMVdScTFZWmtFdW1URE9TNlBNUjFDNjBjR2Uz?=
 =?utf-8?B?cFdkcXdQZVpPOXp1cS9vcmJ0T2VSL3FwczJTNk5iRHp4RU8ybWJDb3FSSjVm?=
 =?utf-8?B?NTVSZmFYZ2kwTTEvRUpFQzVPTXJxSjBGNklPajE5N1Q0Uy9QcTI1cUxRdmpL?=
 =?utf-8?B?Nk5Bckx1UHEwS2tTWkM0MGNHVUxxY0p5NlVPbUhkdGg0bWRoU1BnYklvRGN2?=
 =?utf-8?B?N2NTZGtIc2hTZHJ0YUlxdUJRZ0E5UUo5UGVyNkpXUEN3aXc4eE5CUUpsQnJn?=
 =?utf-8?B?c1FNQzFyVTExSVJxQlZkMHBWenZlQk82YjdTQ1orRW9RV0l3VERqTFN4eUJ6?=
 =?utf-8?B?TEYzRmg0M2I2eDBuS1hUaTdvYzgxcnJSOGt3by91S2V1TCtFcGJIWjlkZmpS?=
 =?utf-8?B?Ni9VT3J6a0Y2V2gzV21TanRmQUFXUVhBMnpIRDBCNFphMmh2ams4dDFlQkpu?=
 =?utf-8?B?K0d1dUR0TjQ1Y0tWMWxoNjBzMTl4aktzSEdydjFjR2ZZZjBNTGwyTTJpcDZl?=
 =?utf-8?B?RDhIbCtMb3hYUVE2eTd6UzJSNXZ4eWZJOExCZkU3ajlobGtUWldSNG02OEZJ?=
 =?utf-8?B?b2hNV3JUV3R1Vk5YTnhmWmZwWFp1TU1kVFR4NERkcFJHWnV4YkljU21wL0lT?=
 =?utf-8?B?ZzV6V09rbmdoUlFPemJmanh4NEwxNlpRbGhoK2JKc1h0MU5uRmF6MElQMmpZ?=
 =?utf-8?B?cHYxcUU1cjVQWThlVUlUT0VDaGpkdXRFSFo3NCt3TmIyVWV5MU85eVR1bEdC?=
 =?utf-8?B?a2VJVWsya1pxMUpMMExXUWlKQncrSGI1VjBYTW5ZY0ZHbnlDZE1BOWt5T2JS?=
 =?utf-8?B?cklFanZ4TFhJak5nSTdyM1o2Z3M5SmM5eEtmTGpRazFqMm9oMjhyOTlWd053?=
 =?utf-8?B?VmlzVkNzWmlNWTdnb3pPeXJqWjV3MDJCZVdGcktTcUpjS1lnbGxNbUkvQjBC?=
 =?utf-8?B?S3hLbDBUWDIwSUkyVHdYemFrbXhRZTB2ZU1FQkxSa25Qa3Zod3pVVjZ3ZVJF?=
 =?utf-8?B?QlpQWld6eVVuL3IvOHhHcDZyNHc0eUo0eGxNbWdqQW8xOVIvWjJYZkpvdmVR?=
 =?utf-8?B?dkEyUng3cHlibkxwVjhIQWxDdE0yc0ltaVlWbXYzc29Lc3c0NmdUc0QwV3lk?=
 =?utf-8?B?dXhmVW9mejF2TVkvcFI0ZjhuNXo3MGszb3p6R3Q2TnI0eThNdENxMlR1amU4?=
 =?utf-8?B?bVdPYjFJbnluN2wzUmtDdVlTV3pqSnB2dGliQWxER2hpRXk3UzUxN0dSS0wr?=
 =?utf-8?B?OFBqYU1UVDAwaGliRVJRY3A2YVc4aUpYL3JxaUxPaE94TWlHdVZHZm9aVmU3?=
 =?utf-8?B?OHZ2T3NzU0F6VDUvd0tjd1VJbVU1amZrSm13cVJNUUlUQkVQMlIyTENFL0RT?=
 =?utf-8?B?N05lazZiOWdVT1B2aDlWT0ZaOXVRa0NGR0w2QkIrYlg2SWZsdHVrZjhMNjNn?=
 =?utf-8?B?RXpWMG5pcmRrbUtROHo5Umt2K2x3dWFINjhUZGd6ZDhaUzVVK0Z2aUl4YWtF?=
 =?utf-8?B?VFBjVDRjeG1TNThqS2hHRkplcmFIdzJzR3NDNDJoejZiUGNWbkRaTm04UklF?=
 =?utf-8?B?ZGVNNGJNK0hUckJ4OXNWeFNkcnZmSFlNdmcrTlpWVzQrNzVyMTFkT1JvTHND?=
 =?utf-8?B?YnJaZ0l4V1ZXTWtQenMrbUNzSEY1eEV3RUNNU0JwZzcva1JRcTNheU05SXJR?=
 =?utf-8?B?RlpoSis1UEVjbGVLb2Z3TWUxNjRNQ2RLcnRoSDhaL2MxRjR5ZlpmY2RpRFVu?=
 =?utf-8?B?bmc5cVh3d3VhUGMyTVk1M3REc0VxQVpuNW1Qd20zY1RhZDBMMlF6R1lzdm95?=
 =?utf-8?B?UnpLakxROURVaEhNSWcyQ0ZvdTRXWDRSdkZvdm5kaDlRUEFEQno2ZU9Sa1Rq?=
 =?utf-8?B?amlIRENiMDh3VSswSUNNQmpaS1ZiV1cyemFpZmxkM1NNVnB1Um5FWnR1c0Nu?=
 =?utf-8?Q?dzOCAZ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1prdzRZTEdNQUNkV2g4SzgvOVV2UFYwaEJveWNGcDlBUlV4SjgzTGVmd1FN?=
 =?utf-8?B?QVdGdEhhNWcyenVVbGpMLzdabGZuOVpvS2dtbEhjN0pnMFhmUjF6WXpQdkZH?=
 =?utf-8?B?V3pNd2ZESzJxRUdFbEZkTFZuSGNYU044OHFzNVRoaGM3cWxQWTkvVjdZelVy?=
 =?utf-8?B?cFl5eHhtdHdQYjVaSGNGRTdkQjZKa2VYZDlBeWlLbVdrSDQ5eWE3WXRxWjhH?=
 =?utf-8?B?bUV6YWZjMnVlYUkwVXpFSE8xcDNjdC9hQXZkc3hmdFJYTDR4N2VkbDd3MHJQ?=
 =?utf-8?B?RDZlS0xxWG9mVTdkcmJyU2hyWHlIcE14S0tDYmxjSEdDaVhXQ3pMVTJDVzdZ?=
 =?utf-8?B?UDZzbkJDTCtkNWs0bXd4S1JFd0F0Rm9nT0daYkx6dGNyT3FnRzBPU0h1RkF1?=
 =?utf-8?B?VGsvTFJQZVduWFRBYjIvdWNJN3VKQ3ZRcHVpK1JXRTZhMWlJVHplbDBia3A3?=
 =?utf-8?B?TWRsdzNSYTNhZTl0QTAyTmM0cnN4bm01QXNnVFM0Q0FnUjgwRy90TXY2bUxC?=
 =?utf-8?B?Zk9ySmxja1RJYlNBSlo0eUphaks4OW1rUG0rM3IzNkFYWG5ScU1WOFc4akR6?=
 =?utf-8?B?WnY4OFV2YTAyN2ovcHE1NVkzTkFrUkdGcUMwbS9qRlpMUEEwMXlLVTY5aFN5?=
 =?utf-8?B?d21DOU56UWZvS2FpYStRdUtnMzBkcHgvRlVwdXdEbUJ5UXdIWGJjTmVvTzNR?=
 =?utf-8?B?RzVYM3JESVRvbU84SHIzYlZVbDJxRWEweFpZWXJxZ241QUVOWnNFSzk2WHpT?=
 =?utf-8?B?S2tMbGF1WmdzaGRBS2pzYWkzRWkwYXdMbmMrbDBPR1kwRlUybzhvU1B2eWpM?=
 =?utf-8?B?S0dkcHFWcHB0REk3UkxzcVpvSVVUT2NKOXl6UXNrNldwazgzanJTck10Ym5F?=
 =?utf-8?B?N245Wmp6bk1zUWxyVEtTeDVvTWZNWFF2bWJZd1V0WVJnTDlMdVpPZGo5NXQ4?=
 =?utf-8?B?UzdKZ2p2ZUsvUnpJeWN1eCtPdW52R1pkanNCU3ZidnBzRWprQTM1WHhvSHdC?=
 =?utf-8?B?TDJpNVE1dVdIYk5sVVgzTDRteFhtT0JZeXRXN0J5U1lrcTRGcUxhd2ZUR0xH?=
 =?utf-8?B?Wm9ZNWlYOVIxMld0VCtSSU9YSXJYdTZmeFE0d2lISW51T1lYL0dMZlZEYXBV?=
 =?utf-8?B?TnpIU1ZkWnJaSytwWXRrMlV1NUwxTTdZQXExM1RzWXZjM2lLRzVWemZOdUVs?=
 =?utf-8?B?Wm92Z0RlbG5mSE9xNmtta2hsSVpRbU91T28rRjRwa2drK0s2YnB4MHlzVE50?=
 =?utf-8?B?SWdUNXlVd2huUUFwVExLZmcxOUdaYkt0YlhiSDdJb1kvVVVxaS9OYjVjdXIx?=
 =?utf-8?B?aThUSUR1QzhVUWtIRGs4cjhCL3A0UXFGRkhaU1JWRHhtTnN3QUtpUzZDeG5r?=
 =?utf-8?B?M2hrWmo4TjltZDludkFiL2l5ajdXeTV4ME1KcW1BTEcyaFBMVCtnTEdnYWJT?=
 =?utf-8?B?VHEwV0FjL0FNVGk0OGJrZFhIQ3BJRnVMd0k5cTRIMS9uQTRaWDV0eVF2ZytX?=
 =?utf-8?B?cjl2bnRIeGF6cHkrUWNHYTRwOEc5dnZWSWRqUlhLaThLSm16Y3doOXlrNitn?=
 =?utf-8?B?OUlxMm16RjJlK0d1WjNnVXd4aWd0cjk1UjYrUUdZTVl4dWNVUTAwRDRNYmZQ?=
 =?utf-8?B?TUhaZ1FUcnNNMTlWUU8zQXJqY0o5eWZoRS9VZER3bGtsMmxmZFRmRnZ1aFdC?=
 =?utf-8?B?bmhDeHRPL05jR3l3R3hHZVp1R09MSS9LbnphcUFoaTdsNEVITldQNi9vUU0v?=
 =?utf-8?B?SklTNSsrNEZTMEdaL042TXQvd2RheXhUU21CRFo4VFIyOWt1WW5UZFg4OVpV?=
 =?utf-8?B?SVdlalhUaTk4OHZSR3pmZk5kOXBrbUI2cU53R0F4QncwSUZrb2JTSXYzYk1S?=
 =?utf-8?B?cThZVnBTTzN2alFtNWQxUDJuaHBlL3RsWDNzY2loS3VBK08zditSU2lqQUUz?=
 =?utf-8?B?SEFHbUhLTFZqTnZkOFowSnFZM0M3RlRyNDF4VlBwcVUzYW5aNmlmbk83MTJx?=
 =?utf-8?B?bTVnK3lmU0dFKzRjak40SkQ2TTNOc1hUL1JJemlUZkRkN0Z5MnUvTlVFV0xl?=
 =?utf-8?B?T1NaRmFsL0xFd0pGc1A2YkRaK0dGTEJScndpbjJpTzVGT0w3OWY3eW9jZlhr?=
 =?utf-8?B?Zytic3hkdnFpYkhIMlJCYzNyMk1oaCtaK0MrbjdZRDdiNHdLQjJ1Y0dZNjVO?=
 =?utf-8?B?eWNaUE45VVRjdGlLdnhyS3FZQks2VmljVUtHS3drSHYweWxxblIxd3dQTUxC?=
 =?utf-8?B?SG8zM1FwQTIzS3ZVQU1BVzNGTEp4OTFnZEtIaktSem5WTlpROHRPVS94VlVs?=
 =?utf-8?Q?+TeXJbLJBvjMOi9tkm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fd3497-9033-498f-9e98-08de40f779bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 01:14:37.6453
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXkyexRlQ2GpxgpMEWNFV8zSjiXM03D8gSa8DoO6pinav8V5i/VIZeuDQLCeMaj/qEHHgt5A5DIi+iRArsAfqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
X-OriginatorOrg: intel.com

VGhhbmtzIEJlbmphbWluIQ0KDQpCZXN0IFJlZ2FyZHMsDQpFdmVuIFh1DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgRGVjZW1iZXIgMTksIDIwMjUgOTowNiBQTQ0KPiBU
bzogamlrb3NAa2VybmVsLm9yZzsgWHUsIEV2ZW4gPGV2ZW4ueHVAaW50ZWwuY29tPg0KPiBDYzog
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb207IGxpbnV4LWlucHV0QHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtDQo+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gSElEOiBJbnRlbC10aGMtaGlkOiBJbnRlbC10aGM6IEZpeCB3cm9uZyByZWdpc3Rl
ciByZWFkaW5nDQo+IA0KPiBPbiBGcmksIDE5IERlYyAyMDI1IDA5OjE0OjM4ICswODAwLCBFdmVu
IFh1IHdyb3RlOg0KPiA+IENvcnJlY3QgdGhlIHJlYWQgcmVnaXN0ZXIgZm9yIHRoZSBzZXR0aW5n
IG9mIG1heCBpbnB1dCBzaXplIGFuZA0KPiA+IGludGVycnVwdCBkZWxheS4NCj4gPg0KPiA+DQo+
IA0KPiBBcHBsaWVkIHRvIGhpZC9oaWQuZ2l0IChmb3ItNi4xOS91cHN0cmVhbS1maXhlcyksIHRo
YW5rcyENCj4gDQo+IFsxLzFdIEhJRDogSW50ZWwtdGhjLWhpZDogSW50ZWwtdGhjOiBGaXggd3Jv
bmcgcmVnaXN0ZXIgcmVhZGluZw0KPiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2hpZC9o
aWQvYy9mMzkwMDY5NjVkZDMNCj4gDQo+IENoZWVycywNCj4gLS0NCj4gQmVuamFtaW4gVGlzc29p
cmVzIDxiZW50aXNzQGtlcm5lbC5vcmc+DQoNCg==

