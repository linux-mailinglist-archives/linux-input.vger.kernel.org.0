Return-Path: <linux-input+bounces-12873-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2865AD8165
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 05:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FB5F1899D69
	for <lists+linux-input@lfdr.de>; Fri, 13 Jun 2025 03:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10C502475E8;
	Fri, 13 Jun 2025 03:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KLrNxOVT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AAA1DED47;
	Fri, 13 Jun 2025 03:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749784078; cv=fail; b=sIAXmW5W1u5S2AR39spCMv6nuajmJKXDM8gTVMsSEL9Z7yIH87nSGFCV3GFBfqLfJ00ZlPgD7Ys1NwaxuLhQ35khW6qJ9DLV2P8uB8A2gq4/nOMG/rk4TDvxOKnOjE3s4S71fTGng+tmmR5j0q3rPfhBmU8arMFg5i8zZ438AOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749784078; c=relaxed/simple;
	bh=0+dH+dorIydWXJnJ9fKDUhH3QLHSfaa8jfS8ToRsOkA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nnrA0SPma0eceL/VV/5KpsUnFEySOxlcOd07biwdj1IuTRDL1Pu4acwHPg0kncGCOBH+kvNwtz4SOSE3kOVlw62wOhDY/NGxeIWn6jMZ6X8sORisWute4/TzV5CqQ679m8yZ0BPKaTsaDyhxPO6NWzYWKea8OuF9zIZhst+H1tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KLrNxOVT; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749784076; x=1781320076;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0+dH+dorIydWXJnJ9fKDUhH3QLHSfaa8jfS8ToRsOkA=;
  b=KLrNxOVTI9R0Lx8iR2pRVrOqfUPIyXUq+2Y2YB3FLY/XddmmtubRx0pr
   KkSm/DAO+cFbY+AGv1HtZTivbz1qdbuZVL9xyie0Z6XCLiKcJ7i2lGSgw
   4hsNJPWwOZrGamN/sXaQS+x4fn80bcAUDsh6I4gH5Ods1Iqlp1qnMcJfR
   RB04Um7TKPXLh+5FVXwb1oV6c2nhltZg3hdgJfPtchG/Ec5W5522EOEQB
   chBw9apfDlpSA5UOt8FKttivm3texogmzDkB7xdKCcLO39XEHtM+2yx0k
   qi345U5+7CH1m+uVLiSj0L6nJC+W15B087JGwPiG4LCcBxB8tc5g2AUDd
   w==;
X-CSE-ConnectionGUID: zvXCZ8QKQ7W21DDornMNOQ==
X-CSE-MsgGUID: FovPV+9NQ1CdedMYg0POMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51706366"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="51706366"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 20:07:55 -0700
X-CSE-ConnectionGUID: 3LaP/JdzTxixwDYcWG9PYQ==
X-CSE-MsgGUID: wmmSeUMLTVCL0MnqtVmY2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; 
   d="scan'208";a="152470512"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2025 20:07:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 20:07:55 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 20:07:55 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 20:07:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZSJYNSLWD866AuXS8Jl5Wv8ER4liIQdF1Yup3ON9A1DH2AUmgRO2rao7QCUmk7Z6OTSwxyxJ563HVtT45m0UCaVQ/IYue+td71OETpKaaKAh3Rho0csSQ7D7wK/HUz0bwf4jfdA5lQEyyXFBTo7C9o8F+AIicXnVUsAMdocxm3LCVBGgL57iwLgHx4VDSBeoB0M1Stv4Xi61YbKss5NlqBZk/Ogjhtqz6tjTBQ9y68d3W7YMWG2nFCcDHyzDEfgogIYkjVzovD8viqHpyOBaanndhf4oofhj+t+Ig8WDugT6+M73zHTj9xEpLkKJ5SfP+No+OKdZ8paN0d4sJHBSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRJgzV5JTePdQMcotGrwiL4MrTa9twy0qDgrNAYVOis=;
 b=Sikq9rQahTb51kd7Mez0+Il8YHBlT7b6IiCTfbyDU7AEv+dpiPC8U9gt5L7KX5ltX7w5/+xDI+ToEXZjwC23GyxfQ8bIgucxVFrIxS92yGw5PaGOAbO42FLQffyqAVo/Am7eRGq9tFH/MLhfMSS0TzPA0XwkYnkAnRHVuG94dbckBPuq7cpaQSuOslg7U3Ta0Mt3+hr1edOUO7M8PVaQSH3UM72A1E6vEsHHfULeAmMJhv2+7XGeRjN1q6vN89ck8pXAeSrsonL5mqag/SXo7XvJJRjIap1ZCLbkThuHyTiXUkI15+kyMuzjRpYMHSKQNJEjLFbC4QypPNpJoLyxjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by MW5PR11MB5860.namprd11.prod.outlook.com (2603:10b6:303:19f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Fri, 13 Jun
 2025 03:07:19 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8813.022; Fri, 13 Jun 2025
 03:07:19 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Linux Documentation
	<linux-doc@vger.kernel.org>, Linux Input Devices
	<linux-input@vger.kernel.org>
CC: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "Han, Chong" <chong.han@intel.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: RE: [PATCH] HID: intel-thc-hid: Separate max input size control
 conditional list
Thread-Topic: [PATCH] HID: intel-thc-hid: Separate max input size control
 conditional list
Thread-Index: AQHb3ASbQYlPNQdTJEu9Ud0lDAMuUbQAZ+sw
Date: Fri, 13 Jun 2025 03:07:19 +0000
Message-ID: <IA1PR11MB60982832D70B9CD4E30A9539F477A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250613014327.11514-1-bagasdotme@gmail.com>
In-Reply-To: <20250613014327.11514-1-bagasdotme@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|MW5PR11MB5860:EE_
x-ms-office365-filtering-correlation-id: d3ae5a2b-98a5-4c0a-4f61-08ddaa2768d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?h9cw2M0hDkP5b4Kh7F/WrKv3bRPlQSJu9IPorrwkQ2kxRGXu8ZmiEec5GKoO?=
 =?us-ascii?Q?dlXsWD+FcfssfdLSxXif0zzC2NCVdYiJoOFoCkGvNBBghj4AgNqBdDTzGrYc?=
 =?us-ascii?Q?u6PM5drQW9lYX11Q7RyXkFOLp4XFcR7o+PtJfdTOQdPw7HFZTptHu9yGfDvI?=
 =?us-ascii?Q?9ifcl+VgPTfjclVL4OP41bAptALXr8Uns7dwq1g5l3RiadYGrPtNZJx2lfNS?=
 =?us-ascii?Q?VK/dk3IAlNgy/7mM1qhkFmMhts8+TNBVLgRw4UYu9yqCORizz9iJRCKi7M+a?=
 =?us-ascii?Q?P4mC/WWNJoNaZAJFP30Kh/OA+yohV6xWDNq65t99/K1P5zIv/4vy3GcuB/0B?=
 =?us-ascii?Q?lr+tQ3xDauKYtuDyQBI53ry9ysQuL785ZTyNc5XGU8YrC8QCUPWUoU7NqeYU?=
 =?us-ascii?Q?hf53WEuqE7B/UYzT90kAVPhPsFK+ISKdtn2tlFk2rGa4JxNeDpzms/oS/+7b?=
 =?us-ascii?Q?tIPjC5vil4JaA25mL9fAKnS59F+7dSKGPIlLJD6owzpS9r5wJz3LCLIyvSnZ?=
 =?us-ascii?Q?MPZtlxWnFYggnUWpABOGdGH3WvLEMw99X7U0jxdem0J0bXuWH43drhb7Ep2b?=
 =?us-ascii?Q?Nvi5ng4mtyFI+vzoNkWDFk/Qp6r25tUehPav9zWt1PfMx0bFIATw75WKu9gy?=
 =?us-ascii?Q?Ty7qMwmHQinN1H8OHcDL7Iaa678SBYwfqA6Sw4Cc9pXhIAzmHCxWmH1pZums?=
 =?us-ascii?Q?pq4jQ3DLpaNNefCUYvtQytlz0b+RAGA8cdrYSxlXS8yywrZaGANVORdSoNJL?=
 =?us-ascii?Q?q66MJErTgn3h6dl66dTvJnoejoBFMPSkxnnI6bHI1QE4B7XN4ZH8W6cy9Y9O?=
 =?us-ascii?Q?+Wt6rpW/XMB9a0nUeNjsA+d2gM/ALLPheMoVf/t0m3IJVwW3ps5JyA0Zb52L?=
 =?us-ascii?Q?GNsqXb0qI/k7EbjNk0IZLTVHPWLkq0AW8KqQMJRW4WcWBDvfgx0+a+1MUZk/?=
 =?us-ascii?Q?gnOIuWHHQ2rQeSd6w7hCrGno/mKvXapWTaz+wVMGePERILnxwj2/u17rARjE?=
 =?us-ascii?Q?izJmuEVPjjiEAuLe7B0u3RL7sepCu8vxhJyfouKB+kytUEMt5Ei+T9gfyl0y?=
 =?us-ascii?Q?D6HGJmDO03BkpgqYSaB98fUnxGOXWvm23IgJZmUgxPMum6iuKgn7KgS6Z+ss?=
 =?us-ascii?Q?QBNemBMi2HDac1EyLLUEcJMx/jG4YvCyapeYqgSGaGJaKgAbTVm7MOMrmGBV?=
 =?us-ascii?Q?MsJ78Q1fRfdjmbCunSMgUVyc3LFyGIhXGeHBdFQVYqpHKq9pZTJhWvBMckgI?=
 =?us-ascii?Q?FFMDih4n0BNnk91u3/ZbSAdGrU8kfRyax7KlB/0tTlGI9l0qaNEHuMaxltJq?=
 =?us-ascii?Q?rxNqijtJ2h1N5cbzKHL2ZZ5T3qMoQsAeTxM9v1N4O6wuHDL+XjtiIDVjF67+?=
 =?us-ascii?Q?Z0EkDuEZXeFEHmdNbPMSdFj6DbltRRfCGJTt8fALFtr+HYQW02M8UoqWTVq4?=
 =?us-ascii?Q?tES/IiEdZVISyS1KAXY4zg5rfmIdpMLcmE42v1sbx6zfcX/UcD22XrMq7wCK?=
 =?us-ascii?Q?MCh/8S++MvDnQ3I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?35qJN9eY5yPSTk/WvRgxEAjs9hv9ijzHrp1PsJ23NfPtJE9ZD6T5X2Qrpfns?=
 =?us-ascii?Q?LaXX4wMuQDUsQm/LeuKE749WNByHoo3q/UeIajlwG1GmCl5NxXTsjw9s87qK?=
 =?us-ascii?Q?BdVWM1uJKU+HiPSDT+ENpfX9CHPOLcB+1nE/BmdCZt0Dx1JOyETgqYHQufci?=
 =?us-ascii?Q?wpfipeNzW0g8wfoy6y/rXXwgoLJ5xgpLwIjVjOGaUhDwgMMa9mr4hEXc6zYi?=
 =?us-ascii?Q?0MWktHxKHUIhCgFmiC55iyZzAvBni+pxUA4/UTiE8KffErtWV/ZG38n4ICvy?=
 =?us-ascii?Q?viSGoURnSly5I+iJ6EssRUetaTY2Cl0vgkbz29bmpo70F4ipxdLpHltRsuaY?=
 =?us-ascii?Q?4RWaETHPavTgw9pWRsaz/bV1C0xeJPkyIQA7Qyr4Bnzrxw6yO1NHqf5qEVP9?=
 =?us-ascii?Q?tpqTmXU/UJK9x8is0x0IxCGnD9IgLRrXjHTreaLlsT0Plt47HjXYfvYjPw0V?=
 =?us-ascii?Q?phrzNrClNCytU0PgQuTE4LuIQDAk1ey2w6T9ndqIet++rDjx9v1UJNUq4xBM?=
 =?us-ascii?Q?MVAIRIUOLvyZMo45zRkcGhjiG27nIYNNDx1TfeDePpSOOeqpxMuTJ3ozSRKz?=
 =?us-ascii?Q?KIzQAu2x08jhgmfvjAXW3hB8LoWLLS87KSdVvOZktuL93HTn2aTqHv4cGweD?=
 =?us-ascii?Q?3uZT/djmf7cuzP/qc731yCMn141i/2/zB5uLhvk18qu0sGbk/skl0598+EhU?=
 =?us-ascii?Q?R+5P7LmjOlJeZbBydIA6+/uukOQZgbIsRHJHT+qURJohjNgwGtphxMMJFaL0?=
 =?us-ascii?Q?MF14tkVAnHM3Dx88pPSX5w1VcxXSD9yhRBMmQ56tZiSjgJcN7TkKvBPxNqxZ?=
 =?us-ascii?Q?ui3bKrmS1aV/MqtYc8q/UL7DdAkIrYhri4G2oZYtWCBcgSYFAzTEqIJpRtY+?=
 =?us-ascii?Q?A736N6W3Edw9ckpES59HVuPG7NLeLT/Fqem7B9O5BKl4F4S0GLdXb2PFASAz?=
 =?us-ascii?Q?wmCkRTB3on/d7h/ScXOaY1igAWHfW1xQzS0s5BbR6Rr8RdZG2extq0g99JIR?=
 =?us-ascii?Q?PWDbCQTtFqNCDosfIATcsbRzvkinUgAbYlrvofsOspM97Z4iXDjJjQmhHbb1?=
 =?us-ascii?Q?vycbQALASOocFyVEowDVNIGY97rnrKFQbw7LwI8vQ3ecPdTCGrR3hdCRJPzC?=
 =?us-ascii?Q?1JMXtBsQBTDBGkAqWr0Qog1T+diCI19Stfd/ZamqDzjkLW4aHzIn+V++cmv9?=
 =?us-ascii?Q?h04+HQNHMMeyh6aZt/pUO7WjomsQ9VBDrtm+d7HZigcg6rGdHShkOHb9T2VF?=
 =?us-ascii?Q?7atTNfyc1ruEVyRmgmDtyhdfMV1Y8L7hFdGg+wB32PvELwNTdQSt2IBQfSjW?=
 =?us-ascii?Q?2IADCBlJ1a04r7SX+yEbUYaK5Goq3qaOy3z59YBiRjDbQHS3TezhJxabOjtg?=
 =?us-ascii?Q?GMsfC6v4s0T+kDUGcNNi0Zf2qSd+EjLkSqnlKOvJP6zSnBSygv62aMSmQHEP?=
 =?us-ascii?Q?BOYnrcNy4ycx0teFsu5SjsBnEeVYV/Qdc/P6Nm7ghFDpgo0VIfEgX/W+mSD9?=
 =?us-ascii?Q?bvexCd5I0WYPu2xQOMeaI2HN0lbludZ9HZ2w7xuolzYzrZ7iB1ggvmuZzMOr?=
 =?us-ascii?Q?USTUbKQcxGK4ZkEviUo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ae5a2b-98a5-4c0a-4f61-08ddaa2768d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2025 03:07:19.5282
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qn580ZT+3aMGaaKKFCxCaLEew/wXC7GGvMWGx8F6bkJvuQqinr47m1vuSfTGcCbDesuMX5/i4PQufCtiQapauA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5860
X-OriginatorOrg: intel.com

Thanks for the fix, Bagas!

Best Regards,
Even Xu

> -----Original Message-----
> From: Bagas Sanjaya <bagasdotme@gmail.com>
> Sent: Friday, June 13, 2025 9:43 AM
> To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux
> Documentation <linux-doc@vger.kernel.org>; Linux Input Devices <linux-
> input@vger.kernel.org>
> Cc: Jiri Kosina <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.or=
g>;
> Jonathan Corbet <corbet@lwn.net>; Andy Shevchenko
> <andriy.shevchenko@linux.intel.com>; Xu, Even <even.xu@intel.com>; Han,
> Chong <chong.han@intel.com>; Bagas Sanjaya <bagasdotme@gmail.com>;
> Stephen Rothwell <sfr@canb.auug.org.au>
> Subject: [PATCH] HID: intel-thc-hid: Separate max input size control cond=
itional
> list
>=20
> Stephen Rothwell reports htmldocs warning:
>=20
> Documentation/hid/intel-thc-hid.rst:200: ERROR: Unexpected indentation.
> [docutils]
>=20
> Separate conditional list for max input size control by a blank line to f=
ix the
> warning.
>=20
> Fixes: 45e92a093099 ("HID: Intel-thc-hid: Intel-thc: Introduce max input =
size
> control")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-
> next/20250611142409.7d4683b0@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/hid/intel-thc-hid.rst | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/inte=
l-thc-
> hid.rst
> index 23d5110cb8710a..8b378c57b5aac0 100644
> --- a/Documentation/hid/intel-thc-hid.rst
> +++ b/Documentation/hid/intel-thc-hid.rst
> @@ -195,6 +195,7 @@ This is a new feature introduced in Panther Lake
> platform, THC hardware allows d  a max input size for RxDMA. After this m=
ax size
> gets set and enabled, for every input report  packet reading, THC hardwar=
e
> sequencer will first read incoming input packet size, then compare  input=
 packet
> size with the given max size:
> +
>  - if input packet size <=3D max size, THC continues using input packet s=
ize to finish
> the reading
>  - if input packet size > max size, there is potential input data crash r=
isk during
>    transferring, THC will use max size instead of input packet size for r=
eading
>=20
> base-commit: da04eb7791c461bc0f113ce96af4ed59bcc12555
> --

Reviewed-by: Even Xu <even.xu@intel.com>

> An old man doll... just what I always wanted! - Clara


