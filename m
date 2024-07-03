Return-Path: <linux-input+bounces-4805-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E07924D7D
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 04:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E2C1F22BB5
	for <lists+linux-input@lfdr.de>; Wed,  3 Jul 2024 02:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD791FAA;
	Wed,  3 Jul 2024 02:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH2DXlM8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2008F40;
	Wed,  3 Jul 2024 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719972617; cv=fail; b=oVR1reVU56QUB9b84KK2OA+mxzfQZJ1mwQnzqDA3f7MR26ifgWXw9CRL9yJjkHx2F8ojVp0ePEGKA20JTdZQAdBF3UqCfgys/VfKo4rdkfxBbnQykvYXV9uWAWTmi3XFOB0FoTgOfEI0O9yGR4LZtbvTXpRr2ZXi0t1Xa8MenIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719972617; c=relaxed/simple;
	bh=uTfTBPom+3xphvWO1syb55QXfjJaWFUAuZd/vJUfCaM=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bzBPRqLRb0G39qyyfR9tdH80t3P8OJ3SX4TZLF7r6zYOhJsDKKaola4x/Nx/3I+s79cZOcToRboY2YiFjiVoQl0cmb7UD0qyk6eigOnOigyz5HBbys/aYn3dTroPTLMfZDTX46oQm9wGCg52mkoy1jxioAj3Gyb8xccL7xk+7bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH2DXlM8; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719972616; x=1751508616;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=uTfTBPom+3xphvWO1syb55QXfjJaWFUAuZd/vJUfCaM=;
  b=SH2DXlM8FrsVvniEhznbzEL59dmiEqOIv1mg8eidNjCZ5sWaMk0HvSLh
   qZiKbLA4gtjINAZLk7lxxwo9oUEZfEe9r5HdYvp0N9ZwUOekqdWkOeYm7
   fx7HBUVbf8QvpPhWHZ+KRkkWdXH93WmpQzmlsQubWHcn5KPe2ueVrbvH0
   3HimUpXek513R/Qq8EMXaPwwVjcoMD7Sessek0PHwGnz68n6lyuTdNJGT
   NqVNDPO9B5LQ+BMDIltAIvbX2C34s65li95K5UcipCIQb3yW0ZdJunFca
   jqRKGTSpFcip7e7SWHbXYwgkeYAZFSIK/+CxTVvwLD3mzKPx8YGGWt4sy
   Q==;
X-CSE-ConnectionGUID: sQHvCbtAQTGHb4+fLL0sPg==
X-CSE-MsgGUID: sDpQGofVTHauwVzSbmMtqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17310754"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17310754"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 19:10:15 -0700
X-CSE-ConnectionGUID: EVbfAp74QNSxpN3K9pCpUg==
X-CSE-MsgGUID: PRTjbVzcSIKi9bq/mkrW2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="69270677"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jul 2024 19:10:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 19:10:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 19:10:14 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 19:10:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 19:10:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OS4Xe/H6/liI2aib+xp5Wts//36SWQAEdq6y0AozhCiJZgxIkg1+hB40kbh8PS0uSxBtMlBcnNkFiGKqOGucqtpDVhreI97GFbdlnO7jqFOKMnBZPn4YjYZo1iD4k+b+SBgVDihyeZlZEuTXB51DorZn+5/xmezforF5Js5HIxKnHXkqmxRSmhT8R5aCeLkcsk4RSOBF6eYYuj1FKme0ErgQh4jCostFtO9n//5U6ueUNJ7ivHduD/NB0VevkQXtjnUDExZb8bhl3VqFvoWaH3Enp6UDFG2RO+K4WK15Pss/FBqKzHgeymbCkdgNaBJCKXfAqoK9kyXn3JIS4+Svyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WorbbNeW/z3IkIhGA9/g6suuTZnOdfqKIaf6pyGR0Tw=;
 b=hLWsUrAgqQtrwHm00m74Y/2nzmHjLiq8sWlhKy7xxmcT6EQs8/ilFsM00R5ZzBfsa2oHuNpVuhR0WRp7j+BX92ShxyvmjIJnN9NtXT7XpzWw6Ts1kh7N646pTS59STRZsOewPcJdgbMxQc/A5wMXjKObVYUBsdZgAN/UHwc0PBF/i5wI52j/jiYAcNCab4NoayAZPserXMAom4P+OiWHJ/aG814MeO4i4YsnBUGX1xtrdMjnaC3DqEAbn1kQ+CC1Zr8iOw/GFcAnpn8wqYbjocHUCvx+y5GOwJsyjwLBgots4caTBXS2qpdtf/uhMK/U0zDqoKIwAKgcWpcmUpX9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 MW4PR11MB5797.namprd11.prod.outlook.com (2603:10b6:303:184::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Wed, 3 Jul
 2024 02:10:10 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 02:10:10 +0000
Date: Wed, 3 Jul 2024 10:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb Connolly <caleb@postmarketos.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Bjorn
 Andersson" <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
	Henrik Rydberg <rydberg@bitmath.org>
CC: <oe-kbuild-all@lists.linux.dev>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, <dri-devel@lists.freedesktop.org>,
	<devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
	Frieder Hannenheim <frieder.hannenheim@proton.me>
Subject: Re: [PATCH v2 7/8] Input: touchscreen: add Synaptics TCM oncell S3908
Message-ID: <ZoSy9gGk62CTTl9/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240630-oneplus8-v2-7-c4a1f8da74f1@postmarketos.org>
X-ClientProxiedBy: SG2PR04CA0168.apcprd04.prod.outlook.com (2603:1096:4::30)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|MW4PR11MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a7b198-9399-4780-35e6-08dc9b054428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5W9jKNABGB3HilmbYtYwlZCIqQKRPgXw/7ALyZKom2f+9XZyqnnHyXiAGt/0?=
 =?us-ascii?Q?50ngVSH3/nAlUZ1fl1gpvOtj0TmDPim3WRsfTjcxB3cLz3BcQuNpHK2jwZHx?=
 =?us-ascii?Q?D/hxrhv1PKtsYCXlrB8NR84bNnqZf6eSVXOYvRWQSngBV5K0Y5qQ06cjKVK7?=
 =?us-ascii?Q?ejo+30vFnEtig6nIoB0xO5bSrAgPfblWMD3ed1avXLXBAFI0TJ0MaHemzQW/?=
 =?us-ascii?Q?pnh6y3k+iod0+XW42CdUdWI3ntg3kF/nqHzb4RfU1JMeg7MYUVbvSAXdbYCA?=
 =?us-ascii?Q?dV1GHBe0x9LpsjvrkwE0GVXCgqEa/qlwgQ4FYcj5iFPgXw1pmM5xBq9Kqt1d?=
 =?us-ascii?Q?mi3wr3X5cKMV7uB+5HxTM5SG1+MQdo0TWXIlonv/nNSsGPqzfyW7tChXmyeW?=
 =?us-ascii?Q?0vR0TfbeIMtH1L2iiOAvlbZLRhZ9DkYxrxp/gkSI5Bi2PQzRuVkTgmv90/fM?=
 =?us-ascii?Q?9vfK7Zh9BrFPKrQ9uLKh+namvcfbXtzUuKzwh+s6sWF74GX/saeHmxOcKTJw?=
 =?us-ascii?Q?mX6LZT+P7vqTE/MkIKGf1EkowyVQR52ojytqixYDGefaiM6ZD4OFpMe26UWV?=
 =?us-ascii?Q?LZ7krh+MGvdwITGmGn4GUYU774gRjjh93bdqvP0c0n9IuXmpRdzCVVTYkL2J?=
 =?us-ascii?Q?NfQQDNzHz+uyaN293NSma5OSyazQ3Yrhceh970V6p7lGVcF2xaO8tyYaorMN?=
 =?us-ascii?Q?OXWGI8xwT3Pa3/kUXZjA/jSuOYmFu5txljHOaJ43a7oWsSEmYP6xW2wGniWm?=
 =?us-ascii?Q?d2bb0FWXW5oJCNHOhqzkThsp8q+JzINT1xP5XhcwB7jW3mh1/alRd4rk/7d/?=
 =?us-ascii?Q?pTOMrcHs9L6JJRpOTrBPFcNbM2QsbxWr69MIMHZaa0sQm6ehBc4902e263Yq?=
 =?us-ascii?Q?2UuPu/UBraweCYrRQS2tJtxkyefk8rw5tsLMjuGMrucTKRAulw5OZDTamgkH?=
 =?us-ascii?Q?tGUcgGN4/438cjHr08q8YTOf7D4MuUNijeWlnOOK1U3xpRiI3+bu6JPczgbR?=
 =?us-ascii?Q?Gx1NUyKllLUnkcCKIyoXqBcajKel+99bksKBAtTt2lEVKlgWZEeMCiAWazA+?=
 =?us-ascii?Q?AmqihjRp+5ytsIDRlbjm5ggIyop2DOaxL7woPu69o3+WRK0U1fwQrElKkAvA?=
 =?us-ascii?Q?fEvWgWYOhN4eNDav19iWQDV5hveGinkbAH1iPqMMM8w+w+6EWTdRkfZh9lVd?=
 =?us-ascii?Q?9y/slV3TJ82knD+ez15vTg+3lqdCyW3t3+IJ4jsoJHS4Toigkh7e2Oboaga9?=
 =?us-ascii?Q?U+eswD4j43LSLESqkNCgvX8SdDsahNhhH8ONITtSxpO0S27x3X9GUr7wmMCB?=
 =?us-ascii?Q?/zOfqCAG4zoTulynOV5YTRiazqTqr5ZMADZ29wUPasBqTA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/LvmmYmXfO5GL/4OUANBFP3QSyeENivhzcl/fvjdVZQF5nQZVuvDfqqwfrVC?=
 =?us-ascii?Q?vpEb0xF5wDh8sD+LhTacSXt/av3zhte23aTIkyCEsSWWKOiltWiYEOh+Sf7g?=
 =?us-ascii?Q?H5Db5vHkkYLfL2brTkq0dTAlBzRLwFH7IkFegB6qr8eH1jkOrSlnjepaHNlq?=
 =?us-ascii?Q?+kgbtJg1q/j9AofeGJBLGupwJ04NxFbBspBwyovklC/mDjdR2VzcxO5dtJo8?=
 =?us-ascii?Q?21ghC0Dkd3gg/eS2CKt4TrkIf8v544dmB5/3HIFcNEWltMgJKr8pmdIoPLZr?=
 =?us-ascii?Q?fsKcQEuSEqpf1eAnvcZtyYc+fAVlK4CBg0JHr1ChajGqjZL/jnnJXuWNl3cE?=
 =?us-ascii?Q?8xDNZUa8LLKl9Z1WHBua8kPfEGmcJw0z4gOk0OFUdhbJvlT9oHMW6hXKXoak?=
 =?us-ascii?Q?6iUPx+0g7FsGS1Sd9jY5M0mZg0qZsSdjXKVMkwPaHUfZjOLpmo1lVmak3osO?=
 =?us-ascii?Q?LUedl8wb2EwV4seHxMuL13I08MhfbFyWjzt1wRDHcaaEK0AspFSYE2eAq2Iw?=
 =?us-ascii?Q?8k5vsed5CG8OQLyDQov5FKzMUYSBk9vDG1JEFQ6Rg+8EqjaPaCpuO4F+e2Rr?=
 =?us-ascii?Q?k7YTSVGZZzLBeJ6yOAXxMUkIbYljOMTCh04IRustqfwanlHKVgLBWRRO0lc4?=
 =?us-ascii?Q?i+PhpqNS2UZjMfVJrvVcaOL3qCn/niMujWOZncOZxwTUIBb3qXnWwlmBXhOW?=
 =?us-ascii?Q?P4TfOdCsJvBwl5ihQ6JE5Z7sjrkbyJdJWzqSC14hIc/ESoiuD4WIBEKynUyl?=
 =?us-ascii?Q?CK2k0YCr+objOwcVEroHGB2JuslgKTF5eQ6aTKMI7yqmncqSvN9oDv0kHtT/?=
 =?us-ascii?Q?id5KgB5AYuR34DnFf6R9zsMMoBt+w6jrmIOHlGwND9BiOXeMyWq8oS6OT6Xq?=
 =?us-ascii?Q?T93+psMQccR/OTT9OXCCDPJxXc2k0K+owvkfAq2wtN/tM6ikH1XdcW5td0Er?=
 =?us-ascii?Q?bGFdzbuOnLv1TCDC4Vf3SDNe/u4cTxCawdSnuPVUKQCFlIWHOaZXhF/j0Wpa?=
 =?us-ascii?Q?6r7rXtproshWPXfx8RjzXtlPFQ2eA99RvsB9UQkhQNIUGFnSoPtp9zZLpWSh?=
 =?us-ascii?Q?zR0BPMClucEVrcjn32j7Es/eMS6nOkGzTMF4Il+nHM6W5e9QTniTgnUVnpWe?=
 =?us-ascii?Q?NF1iOWqZp7PFQsrXZNRBM3oBMsO5gRTYwh8u2eeOa/fZavmF549z90hLFClC?=
 =?us-ascii?Q?G4h8lb5WxC/Xy2FdUebSNbcjKSI2rCkd/vF5fINaSXPaoJvmFfQGzrh5hCJX?=
 =?us-ascii?Q?cNWi0CgL067PG4x1Vw1qofO2Vkob+ZnzCTa1E6TJZyJw2nQi4+RcWdTZS2gx?=
 =?us-ascii?Q?mq+G6zbTt49hkzBcu9lf9eiDkA1kWqVFIZGgQ34aK7knCOo/HOJoQALuovIM?=
 =?us-ascii?Q?MnO+WBu51GoSVGUvz1eo/aLkMV7pl7l9U+6vEZIOKC96Q9wgimthIT7WIrX4?=
 =?us-ascii?Q?bcbaSABN4FANCTFR7/LQE/3BWqfa85f5DtelKHLSFDvQvhegyEBGS4ftltdF?=
 =?us-ascii?Q?vY19MpqmCRgZCbakG74YUbCeh5xR1vHdJssOneJI25XjRGRRv0uRl+ZD2wdq?=
 =?us-ascii?Q?pyv+Jn3pxecGj4RHkpqukydGk8uDQ5SBIZXSby2P2MzqRlwK6ZV8Ogrx54hh?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a7b198-9399-4780-35e6-08dc9b054428
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 02:10:10.4730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8kVlso6q2fyVfLo6EDA1XNzod9PkxaZfO4hGkFFPuwA8uec6vKIdIa3ZWjN3EN6oIw65rWRH8GjyLGogUW0XvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5797
X-OriginatorOrg: intel.com

Hi Caleb,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f76698bd9a8ca01d3581236082d786e9a6b72bb7]

url:    https://github.com/intel-lab-lkp/linux/commits/Caleb-Connolly/dt-bindings-panel-document-Samsung-AMB655X/20240701-034227
base:   f76698bd9a8ca01d3581236082d786e9a6b72bb7
patch link:    https://lore.kernel.org/r/20240630-oneplus8-v2-7-c4a1f8da74f1%40postmarketos.org
patch subject: [PATCH v2 7/8] Input: touchscreen: add Synaptics TCM oncell S3908
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407010930.wP312wLj-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/input/touchscreen/synaptics_tcm_oncell.c: linux/module.h is included more than once.
>> drivers/input/touchscreen/synaptics_tcm_oncell.c: linux/input/touchscreen.h is included more than once.

vim +14 drivers/input/touchscreen/synaptics_tcm_oncell.c

  > 14	#include <linux/module.h>
    15	#include <linux/property.h>
    16	#include <asm/unaligned.h>
    17	#include <linux/delay.h>
    18	#include <linux/input/mt.h>
    19	#include <linux/input/touchscreen.h>
    20	#include <linux/interrupt.h>
    21	#include <linux/irq.h>
    22	#include <linux/of_gpio.h>
  > 23	#include <linux/module.h>
    24	#include <linux/pm_runtime.h>
    25	#include <linux/regulator/consumer.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


