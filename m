Return-Path: <linux-input+bounces-8820-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BD09FE2AD
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2024 06:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D341C161AD2
	for <lists+linux-input@lfdr.de>; Mon, 30 Dec 2024 05:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8442594A1;
	Mon, 30 Dec 2024 05:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QeZwzYPB"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E97D530
	for <linux-input@vger.kernel.org>; Mon, 30 Dec 2024 05:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735537587; cv=fail; b=JAvMn8zR1Mbn2s+RteOVYF3G3Ul4GapNTOwkHK89gOqHk4rhU9TykwEwgyqMHoAsdqPyYxdRK2/+xoLAsRqY9h0OpXH5JHZlwo9uBjxjnlc66JecxVpuJamenUCd169xWULz1IAlWmo2ZA0WOha/VJnv7y3WmtemzI6UeytZAOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735537587; c=relaxed/simple;
	bh=aXwTAOVsnhSGIhajWSDAN6P2YwY+vE9eLXdhNuyAMu8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bKlMaY/pyRcnfHaBY4mxLY1xS886MS7cCbN3oGvsm85ZdNalqSMnBsMJp0ucaE8RCHhE7lHk4k2AYfoLhRc4QC1wm9TmVAifAC9Dbva/MSxR4RrVTDZ4PguMaXGEM81j/imecRvjZJVRvWD0X21KMIn5P/dZ9KvKisUWtbfhcf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QeZwzYPB; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735537583; x=1767073583;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=aXwTAOVsnhSGIhajWSDAN6P2YwY+vE9eLXdhNuyAMu8=;
  b=QeZwzYPBFOUqKs6cltiGAo/YqgvGXmrwveqidOGTn43oz46wREgz6spG
   aO+XqIeN5UrulGw/Q4EXdj3MPXROjkNegb0nk20AmC7uHC/sNYExYPOqB
   uCs6LBYDKWZ007SK3LHS/l0JlX1pUJI4sDqq2DJaLijwDj9E/sn828bB4
   DrxXT4h4Z/aym+XrWZXKN77mlfByRSeu+dSCPB5ivHYTK75e+nxgjERzu
   m15vGIwxcjigqYtt1iaPLqXvchmjvdF3AsOwGNHm8tfKR+lD4+pVpI88Q
   AeRd+PmbdkGXQlfjF1kaGC6385ozlohfS/BRcMksQLI0+KGmUzKdV3754
   A==;
X-CSE-ConnectionGUID: jhKnfqGrRuaoBSurVRQ/pQ==
X-CSE-MsgGUID: l/FswPjXQje+mKSxOP5r3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="53367941"
X-IronPort-AV: E=Sophos;i="6.12,275,1728975600"; 
   d="scan'208";a="53367941"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2024 21:46:23 -0800
X-CSE-ConnectionGUID: /7jvxTXhRUaN3MD40KaErA==
X-CSE-MsgGUID: XyHg8NODSQ22NqyNfsGpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105784306"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Dec 2024 21:46:23 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 29 Dec 2024 21:46:22 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 29 Dec 2024 21:46:22 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 29 Dec 2024 21:46:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTlZcREvXLqpBWaZXrD0xgclLL5sxXRD8UntF2VV6uhv6M11LSw3nMeHa89jQY4l0mEy3a9+tVxtvz9MSaLYvBjQss16+5UockqPPubZetuU1HDuGR2PKP5eMXYFQ8YhIHUgA49nuTM0nzs2Sf/gsFx9cS1jWAAmREp2w2pH8DU17e6XNAnjfLtFcBw0lxKHOK+FMuidSoE85bQtyxsFK05mSJSMpIbidhoAAY2gNkzmC0gqgkejZ/BLMNNokZPgaCFn/DfOGeEaXXS5Fq31OEps59LiVN1cBnT4btxXNFBNsx4P5wE8DyTt3oopxYf42R9rFtJx2PZmlZ9CI8xQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCREWUy1ymsJcFbw94qH8IhCPz7QUqTMuWuISCls2uA=;
 b=BM2Xs/Pi8MIjTPTVFVS4GvLMpaUsRsReH1E4XGbItOg4dZ/FZ4ekoEM8IPacssOmnXRnrYeA+S/AiqlBI8AbnOlAPRZNknpxZA8EJ2r2yi7ippc2al44xhgQtkjDpFrcew/R8YnbWTiKatX/5EfMNVp0fTEaRXh0dRz++z30eyk9hGjg0huUYkgW5Fp5uwtpauXR74zihOkfG2wDqDGvjDEORCYsIIK5Ab1CcbwDtMCp8YPd6YXJHl22GQrl476WJBig+j0hCLG2Og5Lx35QuuIxXzuGJcSYjOXge/OrIJin+IOY/mCvG9IgwnnMCBd9kLtfezvlDadzX38PQvRxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SA3PR11MB8023.namprd11.prod.outlook.com (2603:10b6:806:2ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.18; Mon, 30 Dec
 2024 05:46:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%6]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 05:46:01 +0000
Date: Mon, 30 Dec 2024 13:45:53 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-input@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [linux-next:master] [Input]  5203b3a18c:
 BUG:KASAN:null-ptr-deref_in_input_ff_create
Message-ID: <202412301341.9f8a9fe-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SA3PR11MB8023:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5418f1-f24d-4e89-d6a3-08dd28953dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QYDrBpI5yQxIzpUbdA47dC/gLHoHQwislSKuwd3NBGq5+p5ilJXlYxT6aNam?=
 =?us-ascii?Q?omxp6EmYCjHV7gijysa2c+DKL2ID7h1/6kVvcyEMk3+m0SRgumX9jBULtDBI?=
 =?us-ascii?Q?lWeqquUXaIaoQRbJaDvX2P4VKcXX90P+xYXJAisZuKtGzrdwbsvQbnwTspQf?=
 =?us-ascii?Q?rT2eJPik7yPa9sVUU+W6gUNZ5YT7y3ZRi/BwWoQTFocerRe43ZTr20InDcgR?=
 =?us-ascii?Q?d8THl69VWNG3N4k8Nhsuj3Xrd9YG/UVmWXrUOEp11r7zWYfT19Xq/BAq6e8/?=
 =?us-ascii?Q?bRmEw6pzq5VBMn9PNt1R/Rk1QztKFrfnHmnYdM22E2qGAdnnL7Np5HolVwJn?=
 =?us-ascii?Q?W8A/5Ok53fJXGeIhEVJ4c5nQhqf8kq4pnz/tNXjbGbk+8od35vDZ5wPOUqQj?=
 =?us-ascii?Q?F2YM6CIssJaRmd0dcjYQjnwcAHwurkCpp3r9H0VmLL0fncnFXwzYrV7tVeAx?=
 =?us-ascii?Q?ljzViAROCaytRothJxkmggMOCGfXFBHuFQoG5/+4FxxzVVw0aXEOg5HF+f3m?=
 =?us-ascii?Q?HdnhEeLMGvxgGPHAtbZno7VIB9vwAWrgK/x03Xo/k5sWo3Yj054t+cOy6D0Z?=
 =?us-ascii?Q?ytuI30n/iCW5+5+fxUyJR6wAIq8utDdMBBQl3Hf3V1WcG6mhql5v+MVU/xnO?=
 =?us-ascii?Q?FvoS3cGlzavw2kUNyOPbUv2yIVOjq5uUR3K36pdFqmViGktAD574QMv40HkN?=
 =?us-ascii?Q?vq9X+s8lIADrJnMLtIITWhBfBXhgDB/mLO+7D4YIZ0+BMC8cHax9Bda0iIkS?=
 =?us-ascii?Q?Mc8nOnLTZL4vL4FPfxhrbMYwkCLGAw5bgGKxG1G+lhQOpDw4sPfHa7ELxoGl?=
 =?us-ascii?Q?/L6dvjnbAvhpi+rGIszhF3QHWsaLKo5mYlXC2G0fylotU0vb79MMeofs52PL?=
 =?us-ascii?Q?xCy8sMkokgBHlVluIySo0BXFMNjwEbGDQCvMoAerAqhGbPn74RCN2skPh9R7?=
 =?us-ascii?Q?crJYPPcaCALTwiPZ2M5/bwV2jiMYrIJHIaEKmuiL7DPr5ZV/zBYPxF2Q237o?=
 =?us-ascii?Q?CUwf0dzw0F9SD4DZSj/Hbbu5YjHmM6h7Zw02WB9gDazPPN0hxJt0gHsoNO3l?=
 =?us-ascii?Q?I9n3tqf5eSg9xiDn6hxTj7Du9IDa07ASD5j7+VLs+kVtCBDY4c30/4sURCth?=
 =?us-ascii?Q?IyBx7sUgc8CkcrdQav/R3mOqLBzmYB2nhWfP26DPaM++wXkv65xTBYSc7Imp?=
 =?us-ascii?Q?rH1OZ2C+k8hUZfsqFCDR7C5sw/eJDUb7GnE4G1YpBzpt4jrq1AHzhDqIpWeX?=
 =?us-ascii?Q?qbmVdKIe8gI5ZoerXqFGBlVfVWnpUgbSFXidv87yNzBC1LL0yGqnfB0wJ9lR?=
 =?us-ascii?Q?6dFTqYbSwmQFzl0QlnQYpiLRQIzNQVMSUl6VgmNxt6Jifg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JUu5SVU6bpgMzCWbGY3IdGXPuRvVeKx8xs6B/fgZ4m4yJX4CjXz+G+bxrWsk?=
 =?us-ascii?Q?YdHB/OV9RksbkmvhjhS9aJ7EuVTyud5zP6l1HCaZ1jtn8fdCh9GNFz6TZ8Ib?=
 =?us-ascii?Q?kKMDjzXA1EJr/mSBXztl1fb4ZuMNdYoT5YzBTZIWclu/TO2HbVSl+K6l7pKE?=
 =?us-ascii?Q?rXHtMTDH+Mn4shwdeYY82VM4djYt+pAK6f5nXL/JBXe7xRtmcNUq2ERDQgoC?=
 =?us-ascii?Q?vgf6RrSJ9OuUnqcqL76eMISR1IZFyz6I4IjHyrb2M5OIFa4HXMuS3CT0NP1l?=
 =?us-ascii?Q?WmjYPQzNiCBSdMnl8mQtxIzNccmlxC9zYtLJRgWVFUq5Mco7KSkO9pGMlw3D?=
 =?us-ascii?Q?466f1DNZjp4gM5PSHrrm0pxNr7vMOjKjt5EWBV7uFuFr4Qw5vYvtoXNQNNmf?=
 =?us-ascii?Q?2eVYY2RZCyd1PTSmmIbrIg+JHscKEfusRhrBZ6SYMOexP/UwzzrA2UM9M/aE?=
 =?us-ascii?Q?PTgmtyNq/4w7LAQm6UfxAwnJz+xb4c09emuWdXooQW4ABBY5N16oA2Jn8cmM?=
 =?us-ascii?Q?8Q4JmBNENOcYSZE+X8j6oce4WXjpTCnn3GcWcurg+//jpOFdfhlbRDMee7BH?=
 =?us-ascii?Q?MUIBjsHwS8w7af3lG/q3ooO6kF/CHqJ4tCeoNGVC5IAx1+vmVANgDe3Q+YO3?=
 =?us-ascii?Q?MiKDPSgy6Kjy6Be5hHV1smSziIImoVEX7iFD2HmZUHY5bfUCxAcP/Pufx34K?=
 =?us-ascii?Q?VXfF7M0ZRIveBv7k4M5ewn7uY+gN4149zD3As1TrhIr0mH5ctJAksVPsgYku?=
 =?us-ascii?Q?DxM9M/nBbv6AMNfa/TMzPOgiU4rpWOOrQMdavW+CwDfE9HWiZyROfHkatuBP?=
 =?us-ascii?Q?+2qiqi1V+qraVCsO1/DwGpeev76I7im5zxXKnNM8pwZxCjjA+6ZHfRyd32xd?=
 =?us-ascii?Q?QgYlMVQuMHpm8a2Sg7F+YYv6B+8bUanp1fht20bE3AHuk99S7XftgC+f0Nde?=
 =?us-ascii?Q?GNk894N6gAUDntpGgiQBYT8d8O1213mU6zYl78SeJFah4btyXM9I+bX57TXm?=
 =?us-ascii?Q?9FDJ67au1JVNphi/iq6kW1dmFd1fnM0sjxZPeIKcEWeML8BuZ5PBGCpi/13C?=
 =?us-ascii?Q?cawJA3ETMXpBi7eH+K3LK+9rBSCVPaLCpFMQ+W2KmW3WrSK7WHTbXuBlpryd?=
 =?us-ascii?Q?a+XXlp8Epww6zsPh2NRcadlJkJqfEitorR62HT2nmeuBsfstK0b5LpuFeGEy?=
 =?us-ascii?Q?6gkW//1UU+NkDdY7xiMZHxmhRLicaor2HLWwzQiwKj4yl8Y2YE8s1lJB3wd3?=
 =?us-ascii?Q?0cP7V8HpGa/z47qPPptnw0187CjQ2ffptkoaGyWfHWjUnT7+RTAooqFacqBp?=
 =?us-ascii?Q?xMkbNIjsWxUnO1z2LAeODcxB6uYcvNFxJoMY7Rv883weUnaKmshqmwvVUt/S?=
 =?us-ascii?Q?Lz0Tn4XJsfev84i6OQby4XvsNVQsL/D1L3fjQgBVe+xs7dd06KJUZYLjyVRV?=
 =?us-ascii?Q?Ml+kljwFXStu3QPLyQie4Moxy7URjMAXr2vJToyseqDfxEDBYvBTra8aFIGC?=
 =?us-ascii?Q?WS1a1+WXXehg3gdN/Ijpy9TasIOM2X89x8mnaFS8OmRR7VfATlP63njGPaVK?=
 =?us-ascii?Q?g2cAAskemYd78SUHpvwZE11/0bALdN0G/N0FrzaXqqS9ziwMt+sQb+t/AxsL?=
 =?us-ascii?Q?gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5418f1-f24d-4e89-d6a3-08dd28953dfb
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 05:46:01.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 32gQB0yoU5TPjcsyQ18z/KjPtarX6VEZoEjDFZ1HAkQWgvimCjFv5A1C7lnnKttTP4ZH/dwxcOks9V+gfWhiTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8023
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:KASAN:null-ptr-deref_in_input_ff_create" on:

commit: 5203b3a18c1bbf50ec5fff27489da8e9bce48ddb ("Input: ff-core - make us=
e of __free() cleanup facility")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

in testcase: kernel-selftests-bpf
version:=20
with following parameters:

	group: hid


config: x86_64-rhel-9.4-bpf
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-7700 CPU @ 3.60GHz (=
Kaby Lake) with 32G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202412301341.9f8a9fe-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20241230/202412301341.9f8a9fe-lkp@i=
ntel.com


[  391.529031][   T81] input: Sony PLAYSTATION(R)3 Controller Motion Sensor=
s as /devices/virtual/misc/uhid/0003:054C:0268.03D6/input/input2376
[  391.557504][   T81] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  391.565433][   T81] BUG: KASAN: null-ptr-deref in input_ff_create+0x11e/=
0x1f0
[  391.572577][   T81] Write of size 8 at addr 0000000000000040 by task kwo=
rker/1:1/81
[  391.580239][   T81]=20
[  391.582428][   T81] CPU: 1 UID: 0 PID: 81 Comm: kworker/1:1 Tainted: G S=
                 6.13.0-rc3-00005-g5203b3a18c1b #1
[  391.593476][   T81] Tainted: [S]=3DCPU_OUT_OF_SPEC
[  391.598097][   T81] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS =
1.2.0 12/22/2016
[  391.606203][   T81] Workqueue: events uhid_device_add_worker
[  391.611880][   T81] Call Trace:
[  391.615051][   T81]  <TASK>
[  391.617853][   T81]  dump_stack_lvl+0x62/0x90
[  391.622227][   T81]  kasan_report+0xb9/0xf0
[  391.626428][   T81]  ? input_ff_create+0x11e/0x1f0
[  391.631234][   T81]  kasan_check_range+0xfc/0x1b0
[  391.635946][   T81]  input_ff_create+0x11e/0x1f0
[  391.640573][   T81]  ? __pfx_sony_play_effect+0x10/0x10
[  391.645806][   T81]  input_ff_create_memless+0xe4/0x250
[  391.651037][   T81]  sony_input_configured+0x6f8/0x9d0
[  391.656183][   T81]  ? __pfx_sony_input_configured+0x10/0x10
[  391.661854][   T81]  hidinput_connect+0x919/0xcd0
[  391.666571][   T81]  hid_connect+0x417/0x5d0
[  391.670851][   T81]  ? __pfx_hid_connect+0x10/0x10
[  391.675650][   T81]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[  391.681494][   T81]  ? _raw_spin_unlock_irqrestore+0x30/0x50
[  391.687161][   T81]  hid_hw_start+0x5e/0x90
[  391.691353][   T81]  sony_probe+0x137/0x3a0
[  391.695544][   T81]  __hid_device_probe+0x104/0x230
[  391.700429][   T81]  hid_device_probe+0xcb/0xe0
[  391.704966][   T81]  really_probe+0x13e/0x4e0
[  391.709329][   T81]  ? __pfx___device_attach_driver+0x10/0x10
[  391.715082][   T81]  __driver_probe_device+0xc8/0x1e0
[  391.720139][   T81]  driver_probe_device+0x4a/0xf0
[  391.724947][   T81]  __device_attach_driver+0xc6/0x160
[  391.730093][   T81]  bus_for_each_drv+0xe4/0x150
[  391.734717][   T81]  ? __pfx_bus_for_each_drv+0x10/0x10
[  391.739950][   T81]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[  391.745790][   T81]  ? _raw_spin_unlock_irqrestore+0x30/0x50
[  391.751458][   T81]  __device_attach+0x134/0x280
[  391.756080][   T81]  ? __pfx___device_attach+0x10/0x10
[  391.761225][   T81]  ? do_raw_spin_unlock+0x83/0xf0
[  391.766109][   T81]  bus_probe_device+0xc8/0xe0
[  391.770648][   T81]  device_add+0x6d4/0x9d0
[  391.774840][   T81]  ? __pfx_device_add+0x10/0x10
[  391.779549][   T81]  ? __debugfs_create_file+0x209/0x2f0
[  391.784899][   T81]  hid_add_device+0x1f5/0x450
[  391.789440][   T81]  ? __pfx_hid_add_device+0x10/0x10
[  391.794498][   T81]  ? lock_is_held_type+0x9a/0x110
[  391.799383][   T81]  ? process_one_work+0x6c4/0xa00
[  391.804268][   T81]  uhid_device_add_worker+0x27/0x90
[  391.809326][   T81]  process_one_work+0x735/0xa00
[  391.814036][   T81]  ? process_one_work+0x6c4/0xa00
[  391.818928][   T81]  ? process_one_work+0x6c4/0xa00
[  391.823814][   T81]  ? __pfx_process_one_work+0x10/0x10
[  391.829043][   T81]  ? __list_add_valid_or_report+0x33/0xc0
[  391.834626][   T81]  worker_thread+0x2e1/0x550
[  391.839074][   T81]  ? __kthread_parkme+0xcd/0xf0
[  391.843790][   T81]  ? __pfx_worker_thread+0x10/0x10
[  391.848767][   T81]  kthread+0x19e/0x1e0
[  391.852700][   T81]  ? kthread+0xf0/0x1e0
[  391.856722][   T81]  ? __pfx_kthread+0x10/0x10
[  391.861176][   T81]  ret_from_fork+0x30/0x50
[  391.865460][   T81]  ? __pfx_kthread+0x10/0x10
[  391.869915][   T81]  ret_from_fork_asm+0x1a/0x30
[  391.874545][   T81]  </TASK>
[  391.877427][   T81] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
[  391.885382][   T81] Disabling lock debugging due to kernel taint
[  391.891486][   T81] BUG: kernel NULL pointer dereference, address: 00000=
00000000040
[  391.899147][   T81] #PF: supervisor write access in kernel mode
[  391.905071][   T81] #PF: error_code(0x0002) - not-present page
[  391.910909][   T81] PGD 0 P4D 0=20
[  391.914156][   T81] Oops: Oops: 0002 [#1] PREEMPT SMP KASAN PTI
[  391.920082][   T81] CPU: 1 UID: 0 PID: 81 Comm: kworker/1:1 Tainted: G S=
  B              6.13.0-rc3-00005-g5203b3a18c1b #1
[  391.931133][   T81] Tainted: [S]=3DCPU_OUT_OF_SPEC, [B]=3DBAD_PAGE
[  391.936969][   T81] Hardware name: Dell Inc. OptiPlex 7050/062KRH, BIOS =
1.2.0 12/22/2016
[  391.945062][   T81] Workqueue: events uhid_device_add_worker
[  391.950728][   T81] RIP: 0010:input_ff_create+0x11e/0x1f0
[  391.956132][   T81] Code: 6d 28 15 4c 8d a5 b8 00 00 00 31 db eb 28 4c 6=
3 eb be 08 00 00 00 4c 89 e8 48 c1 e8 06 48 8d 3c c5 38 00 00 00 e8 12 31 3=
9 ff <4c> 0f ab 2c 25 38 00 00 00 83 c3 01 48 63 d3 be 80 00 00 00 4c 89
[  391.975600][   T81] RSP: 0018:ffff888101b17598 EFLAGS: 00010246
[  391.981524][   T81] RAX: 0000000000000000 RBX: 0000000000000050 RCX: fff=
fffff81144e56
[  391.989356][   T81] RDX: fffffbfff0cf85f1 RSI: 0000000000000008 RDI: fff=
fffff867c2f80
[  391.997191][   T81] RBP: ffff88833b573000 R08: 0000000000000001 R09: fff=
ffbfff0cf85f0
[  392.005026][   T81] R10: ffffffff867c2f87 R11: 0000000000000001 R12: fff=
f88833b5730b8
[  392.012863][   T81] R13: 0000000000000050 R14: ffff88833b5730c0 R15: fff=
f88811b2ddea8
[  392.020716][   T81] FS:  0000000000000000(0000) GS:ffff888733680000(0000=
) knlGS:0000000000000000
[  392.029505][   T81] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  392.035953][   T81] CR2: 0000000000000040 CR3: 000000081946e005 CR4: 000=
00000003726f0
[  392.043786][   T81] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[  392.051618][   T81] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[  392.059450][   T81] Call Trace:
[  392.062599][   T81]  <TASK>
[  392.065398][   T81]  ? __die+0x1f/0x60
[  392.069152][   T81]  ? page_fault_oops+0x8d/0xc0
[  392.073775][   T81]  ? exc_page_fault+0x57/0xe0
[  392.078313][   T81]  ? asm_exc_page_fault+0x22/0x30
[  392.083203][   T81]  ? add_taint+0x26/0x90
[  392.087314][   T81]  ? input_ff_create+0x11e/0x1f0
[  392.092117][   T81]  ? input_ff_create+0x11e/0x1f0
[  392.096922][   T81]  ? __pfx_sony_play_effect+0x10/0x10
[  392.102170][   T81]  input_ff_create_memless+0xe4/0x250
[  392.107411][   T81]  sony_input_configured+0x6f8/0x9d0
[  392.112560][   T81]  ? __pfx_sony_input_configured+0x10/0x10
[  392.118229][   T81]  hidinput_connect+0x919/0xcd0
[  392.122943][   T81]  hid_connect+0x417/0x5d0
[  392.127219][   T81]  ? __pfx_hid_connect+0x10/0x10
[  392.132018][   T81]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[  392.137857][   T81]  ? _raw_spin_unlock_irqrestore+0x30/0x50
[  392.143542][   T81]  hid_hw_start+0x5e/0x90
[  392.147733][   T81]  sony_probe+0x137/0x3a0
[  392.151923][   T81]  __hid_device_probe+0x104/0x230
[  392.156819][   T81]  hid_device_probe+0xcb/0xe0
[  392.161359][   T81]  really_probe+0x13e/0x4e0
[  392.165721][   T81]  ? __pfx___device_attach_driver+0x10/0x10
[  392.171471][   T81]  __driver_probe_device+0xc8/0x1e0
[  392.176529][   T81]  driver_probe_device+0x4a/0xf0
[  392.181326][   T81]  __device_attach_driver+0xc6/0x160
[  392.186468][   T81]  bus_for_each_drv+0xe4/0x150
[  392.191092][   T81]  ? __pfx_bus_for_each_drv+0x10/0x10
[  392.196322][   T81]  ? lockdep_hardirqs_on_prepare+0x131/0x200
[  392.202162][   T81]  ? _raw_spin_unlock_irqrestore+0x30/0x50
[  392.207827][   T81]  __device_attach+0x134/0x280
[  392.212450][   T81]  ? __pfx___device_attach+0x10/0x10
[  392.217594][   T81]  ? do_raw_spin_unlock+0x83/0xf0
[  392.222479][   T81]  bus_probe_device+0xc8/0xe0
[  392.227016][   T81]  device_add+0x6d4/0x9d0
[  392.231204][   T81]  ? __pfx_device_add+0x10/0x10
[  392.235915][   T81]  ? __debugfs_create_file+0x209/0x2f0
[  392.241249][   T81]  hid_add_device+0x1f5/0x450
[  392.245789][   T81]  ? __pfx_hid_add_device+0x10/0x10
[  392.250851][   T81]  ? lock_is_held_type+0x9a/0x110
[  392.255736][   T81]  ? process_one_work+0x6c4/0xa00
[  392.260619][   T81]  uhid_device_add_worker+0x27/0x90
[  392.265676][   T81]  process_one_work+0x735/0xa00
[  392.270387][   T81]  ? process_one_work+0x6c4/0xa00
[  392.275268][   T81]  ? process_one_work+0x6c4/0xa00
[  392.280155][   T81]  ? __pfx_process_one_work+0x10/0x10
[  392.285386][   T81]  ? __list_add_valid_or_report+0x33/0xc0
[  392.290968][   T81]  worker_thread+0x2e1/0x550
[  392.295416][   T81]  ? __kthread_parkme+0xcd/0xf0
[  392.300126][   T81]  ? __pfx_worker_thread+0x10/0x10
[  392.305095][   T81]  kthread+0x19e/0x1e0
[  392.309028][   T81]  ? kthread+0xf0/0x1e0
[  392.313048][   T81]  ? __pfx_kthread+0x10/0x10
[  392.317498][   T81]  ret_from_fork+0x30/0x50
[  392.321775][   T81]  ? __pfx_kthread+0x10/0x10
[  392.326230][   T81]  ret_from_fork_asm+0x1a/0x30
[  392.330865][   T81]  </TASK>
[  392.333775][   T81] Modules linked in: joydev openvswitch nf_conncount n=
f_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 psample snd_hda_codec_hdmi=
 snd_ctl_led intel_rapl_msr snd_hda_codec_realtek intel_rapl_common intel_u=
ncore_frequency snd_hda_codec_generic intel_uncore_frequency_common snd_hda=
_scodec_component btrfs blake2b_generic xor zstd_compress raid6_pq x86_pkg_=
temp_thermal libcrc32c intel_powerclamp snd_soc_avs snd_soc_hda_codec i915 =
snd_hda_ext_core coretemp snd_soc_core sd_mod snd_compress dell_wmi dell_pc=
 cec sg kvm_intel snd_hda_intel drm_buddy snd_intel_dspcfg ttm dell_smbios =
snd_intel_sdw_acpi drm_display_helper kvm snd_hda_codec ipmi_devintf crct10=
dif_pclmul drm_kms_helper ipmi_msghandler crc32_pclmul snd_hda_core crc32c_=
intel ghash_clmulni_intel intel_gtt dell_wmi_aio snd_hwdep mei_wdt rapl wmi=
_bmof sparse_keymap i2c_designware_platform ahci agpgart dell_wmi_descripto=
r snd_pcm video i2c_designware_core libahci intel_cstate platform_profile d=
cdbas snd_timer intel_uncore mei_me snd i2c_i801 pcspkr libata mei
[  392.333958][   T81]  i2c_smbus soundcore intel_lpss_pci intel_pmc_core i=
ntel_lpss pinctrl_sunrisepoint intel_vsec idma64 pmt_telemetry wmi pmt_clas=
s acpi_pad binfmt_misc drm dm_mod ip_tables x_tables sch_fq_codel
[  392.443447][   T81] CR2: 0000000000000040
[  392.447461][   T81] ---[ end trace 0000000000000000 ]---
[  392.452777][   T81] RIP: 0010:input_ff_create+0x11e/0x1f0
[  392.458183][   T81] Code: 6d 28 15 4c 8d a5 b8 00 00 00 31 db eb 28 4c 6=
3 eb be 08 00 00 00 4c 89 e8 48 c1 e8 06 48 8d 3c c5 38 00 00 00 e8 12 31 3=
9 ff <4c> 0f ab 2c 25 38 00 00 00 83 c3 01 48 63 d3 be 80 00 00 00 4c 89
[  392.477653][   T81] RSP: 0018:ffff888101b17598 EFLAGS: 00010246
[  392.483580][   T81] RAX: 0000000000000000 RBX: 0000000000000050 RCX: fff=
fffff81144e56
[  392.491415][   T81] RDX: fffffbfff0cf85f1 RSI: 0000000000000008 RDI: fff=
fffff867c2f80
[  392.499249][   T81] RBP: ffff88833b573000 R08: 0000000000000001 R09: fff=
ffbfff0cf85f0
[  392.507082][   T81] R10: ffffffff867c2f87 R11: 0000000000000001 R12: fff=
f88833b5730b8
[  392.514916][   T81] R13: 0000000000000050 R14: ffff88833b5730c0 R15: fff=
f88811b2ddea8
[  392.522762][   T81] FS:  0000000000000000(0000) GS:ffff888733680000(0000=
) knlGS:0000000000000000
[  392.531551][   T81] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  392.537999][   T81] CR2: 0000000000000040 CR3: 000000081946e005 CR4: 000=
00000003726f0
[  392.545835][   T81] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000=
0000000000000
[  392.553670][   T81] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 000=
0000000000400
[  392.561504][   T81] Kernel panic - not syncing: Fatal exception
[  392.567476][   T81] Kernel Offset: disabled

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


