Return-Path: <linux-input+bounces-12801-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADB7AD4780
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 02:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD87F189A8DA
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 00:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B7617597;
	Wed, 11 Jun 2025 00:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CnGrfhYF"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213481AAC9;
	Wed, 11 Jun 2025 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749602134; cv=fail; b=ZzttJ2AKdjapn55SSgB86oB5onInQUmpyxyTwoBy8p1a1jVkp2Zf39Z0aSq+K8W+BUXLp9KbFMQD5Vy1aiuW10tvBDy2ouYXHIghnWKy6p1XTlyOT3hu75XrRsiQMzLHNaTIosFHHbTGrMe7bfX3PXfDzawoK3GuxsQQhqksWkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749602134; c=relaxed/simple;
	bh=uc38GQUW1jA7XrJSZUX30xLG5lqjzIOYtCvCI8w/nvQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YrjsYJxSOwvoUNbcdUidXgP8qGiamnYHeQMGpjFjeRP0Jzr9ZuMpxvpBZNxWYwRH/CcxIFGRKN4rJ8FYD23+5pTJLv3gEbF/d44eXfp9LgwlgMtkOGlw5Z+lJOf/eoeEiadAiGwmao2Gv6W/HPwqSERSwyDOQEXBhCnoxzUTC+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CnGrfhYF; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749602132; x=1781138132;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uc38GQUW1jA7XrJSZUX30xLG5lqjzIOYtCvCI8w/nvQ=;
  b=CnGrfhYFueppnujhv3yrSBLK2fDpkHZASk4ljoU5q06+fPTY3ua72rzv
   CP2h24kFCC8xaxl5p2PHSIskJD3e08TNFhSNE17YthJ33SbspLtolnEbH
   Vm6fDkU+/YAdpyD6l+H41qR2ZCMvd9waKvHUyQ2lf7wR/3ckGo5b8YZ2G
   LCgnVh+mHaChmFBt6pTmD8Z7UElQntb/RYmhzadWITKpQiffDULA3W0zc
   MJzxC+a2wTvbLntKusjiHdlRckYHS3SJv9E0Y0LlbXtU9Kj6Q3BFTzKbU
   W/Inb5hYGfNlNBmapDDUryZX1xHXcwtSd/1V1K2DX73gOyLOxPvhiwLVd
   A==;
X-CSE-ConnectionGUID: vYCQir9WTzaQhXw/1/WW6Q==
X-CSE-MsgGUID: APn91cfNQ/aSzLTMXKsSJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="62385220"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="62385220"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 17:35:31 -0700
X-CSE-ConnectionGUID: A7418/22TFeU8Q5o5D3bGw==
X-CSE-MsgGUID: WIq+ObFHSsGepTNiOMj7WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="147370816"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 17:35:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 17:35:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 17:35:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.89)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 17:35:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=byUDHuYv4vyMbqTRct+FH8zzfmqZW+pbH2arHlQxRWii8I0tl23FZJzcvlLW7UM04yJDtydpM503whcmwqr5AN1kVBdiBy8n5i0zzLaWg5ocuww6s62AC2d5mm97okCeRFOl5prYdwU5cC6ow4vO2x6UZgIVwpOinrSa25IsafM8DWT8fMRsPCoK8cJtp/SqR+ga2n2jB45m7J6lZUU5EKebtxP4u3AEWQGI5CO5kVHDHr8c4RdyjxkbiNjUUPQxEP25rmhUoWzVi/d6GojT3IvPJxd3yCftlS99uqvT9PWOa21J2m2KOLZiIGflnNtA71mdrGAHCBaOkjV5CW8vZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4Fmfy7ApO3LJ85GVBJ3Xhr3kLchKHPsSCpSn2y81LU=;
 b=LYkhlZILyzNe66e9iqjDCZ2nQVF0RX5LrecT9+4a2RqHNKKtDT0nZ5dKXArT6xBRh3N0N7MEDYffvofKK8ENnDLVfVK9WagAKeyzgVDF00E9xAbXGbFPdTqi6qJofvmo66ClgYXz9Y0Anm3he6CzDS86dtzzb2D8XCwPbJl2ITLYBX4mUEhApBn/WQOAVOOI6eXa36meJyBydpVTvBbwguHwJBuMtpDvfTDf1DgOZix1KZ+3tBZ8q/yCb6O7MmA01zMjURfODe3j6YqpGWeSW40TMiW7giNFVtd95Ci4j6q5ENZVJIWXTr4a1aHl3R6/pcv2mAOV3FuvDXiLJTw8GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by MW4PR11MB6618.namprd11.prod.outlook.com (2603:10b6:303:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 00:35:23 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8813.022; Wed, 11 Jun 2025
 00:35:18 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>, lkp <lkp@intel.com>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Han, Chong" <chong.han@intel.com>
Subject: RE: [PATCH] HID: intel-thc: make ptl_ddata static
Thread-Topic: [PATCH] HID: intel-thc: make ptl_ddata static
Thread-Index: AQHb2j2m/6jmCJF8TE6NLvIuSht8CrP9GEFg
Date: Wed, 11 Jun 2025 00:35:18 +0000
Message-ID: <IA1PR11MB60983AE44120BCB78F8D4922F475A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250514061944.125857-8-even.xu@intel.com>
 <202505171535.Yrj5T8jh-lkp@intel.com>
 <r55n2p5s-1rno-n14q-8n6s-7737pr4655p4@xreary.bet>
In-Reply-To: <r55n2p5s-1rno-n14q-8n6s-7737pr4655p4@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|MW4PR11MB6618:EE_
x-ms-office365-filtering-correlation-id: af2ed2d0-61ed-432d-ac34-08dda87fd750
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?hpmOYKdP9A5lBZ5ERZMdwb/TNLyZwewPXCxyOYy2wqQPt0BH8cZO7JEqAa3y?=
 =?us-ascii?Q?ZkH+IHI7+wZ0OeylEgo2wHqmDYU70WAkC6NrBabJr7cXqKfbyPg9Qu6BKhkj?=
 =?us-ascii?Q?X6N6iSfZCk3Wvd9jvWf29+yau80xIuUsPkyczdCOPvECGVMAutcWQrftf3Oq?=
 =?us-ascii?Q?oaDED/oGyhGHvQMCaTn8JQoIcl5i0CI1nrFPijZmngtoWDKvFQc6Rz5X4e8a?=
 =?us-ascii?Q?Xu7LiSHPnoidpiXwdYTx4kGyj47g3syvKHUkupCYhG691uRVgVCo8itwtlVu?=
 =?us-ascii?Q?BP/xKkiPh5YMMX0Mp1v35pELiRSaCBoOOujfvbsHYQsVIdeWW1ArsiMcHhwY?=
 =?us-ascii?Q?y/gdLe5iHY7wCZ+Fh6cHBj1PyAKQJ0GY+mJbNiB4XBZ9c4t4wszVDZDm+Ecn?=
 =?us-ascii?Q?7qzU6lE13v3DFzO06u84jaNRQKTdbN4zmIMj8ugmGZmUt7AgRLRTduRJH752?=
 =?us-ascii?Q?tVrokSa6U9nXCors0raYYiyRfV2R514fGDo4RYRgPVc6VaCOPNHrmNsST7C0?=
 =?us-ascii?Q?dmU23X3dY3tA617yAMwEjNekLiBziv8GYZcqNHguTn/LLpNDq3MPvCNk3LRK?=
 =?us-ascii?Q?WEhh7sf4tKHy+cxYvw7Ncz1X8sfgXaRueC3ocr6aVXbKxg9fUfssgSpuNNZr?=
 =?us-ascii?Q?zgY7hUaTWky8UNoDGzVQjysV4x4RC5lbjmokDo2KhQI7WCgFraI1S17sMD7Q?=
 =?us-ascii?Q?Nb4joLzwAPRKuWIFkN3WSrmuyYUcO2vWbUH+t7XZZbYZi2WMnqj7nxu0S8Qx?=
 =?us-ascii?Q?wj73SauB2+7tyZprGOtCuLucGMUK25cHcQ1rPXu9k2upa2+PxhOOmcJiSk55?=
 =?us-ascii?Q?jsNh+MtagGEqPYjkqM2Vp/AibDEJNMmk0mvQlxAn4351zcwLjGcGoJhaJ10K?=
 =?us-ascii?Q?hWb3M9U7Z+LRu3RQp2hElsfkFSqoaKR6Ak6WAoq6nro1t6GpOpb1llkhE6x8?=
 =?us-ascii?Q?sb7jsYY6pUDMOZaLxajvDrOhZAqrf8Hha5R+qVTcs4aEZLzgDawxos7KrWGq?=
 =?us-ascii?Q?aboflKKoZccCqWqCJKl5+A+LPWPMDHpqTRgEz8nnMYl2Eb19UqLCOHxHNcMI?=
 =?us-ascii?Q?Zp0t2f7FaOEsseWe+gXS6oduSEsUquLy47Jt8BLjRqdlf0QGurW/OUumUp3J?=
 =?us-ascii?Q?NHmox16b1gHIaDQcfPES8//I134xaNqaiPle1m7vYrP6fJZrHdmnrckTpscy?=
 =?us-ascii?Q?bgIB4xV0e+UNKRedloJ/yEcSSS5YsCl7ozC9CcN5+CGtvsMDBSj4vyFqIW12?=
 =?us-ascii?Q?4nvL42Pi4m7d01tQRXeYgGNnOP2FphQ4uNw7lo46Gn9lV4V20PyJS7H+gU2D?=
 =?us-ascii?Q?1g4LcTS3CMH8HbLPT8UKBrulo42Auviz7jNtIrwtge5PW+pO1OnjadamsdAd?=
 =?us-ascii?Q?C2qUcpUVGwb5V6hpXOhgeLFxja16uAwSGt2xuyiUI6eOGTqr1kK6fyOgbJYc?=
 =?us-ascii?Q?zoBsAqfzwCA/CiLcG/8otVoEySobLS2DDDlBHN7afWfN3MGTBkdYB8Gf+wBn?=
 =?us-ascii?Q?jkMv9Z75tRtdiag=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XvRMcxK5dm65UbYrt+sA3incqQc8dR7LWTfDD+aatqSvvud7fJPU7bI6SAj2?=
 =?us-ascii?Q?1R/8TIc+FJu7BjXGkc7rAMxxjFXReTViVu6BnOry76Vq1eTWZxDnXbhDZaoH?=
 =?us-ascii?Q?V0khVnsdTGhVRZgynpH2qsZfxJcHaKK0LoCkDOa62zTP4uEjoRjAb7MEXb1p?=
 =?us-ascii?Q?DymPIeF6UrW4ze++iBLkoCU6p/+kWJq2NxYCDBe2vgHFCqqfhlYlUXAex0gy?=
 =?us-ascii?Q?r03dYl2CnbpXS7xnrCWkjJcQCeVUsYxLO3Ryy94VVT8lExj2lKRrZE0pPdcN?=
 =?us-ascii?Q?v5/W20SHmxYUIwomDYa2CwD7is95qbsXYzUEVAli882aYV5WW8vnA62d7/AH?=
 =?us-ascii?Q?IiiQKbAUeDrcngxrtWW7ZPrv2PGLDK7HQvFtdVmUr4cb+WNlRHORBKaUi30B?=
 =?us-ascii?Q?HnNfmogruwSG+iSeNfJ3vG/zNLC2vwObJrffmYLj++PeVJAHOgrFFgxDt1IL?=
 =?us-ascii?Q?D/I3y68fni3W5oGl8c8njMUa6KvmLyBpXiHEjNK4oSbZvo7gSFx1YmNrG33C?=
 =?us-ascii?Q?EMZhzH88eYIHGVh9Ta6xBC4GE97pKeF8ySc9X6lDMyoqsdudesuGstjVWinT?=
 =?us-ascii?Q?cB6ZHR9ZpvMWbaRCuX5Rk6YotJ9Sn2G+1yL6zNIPT5Z1A8x032RLBXEzl9hk?=
 =?us-ascii?Q?2fMWYH1oGXWRojuamMmwD757zDlxeg+yUSk33KDgwFcSKo7lmOj1jiGXSIvs?=
 =?us-ascii?Q?S15Wy9LJXPcWk4WFNcejZCe4cKSMEYfUraqLF8KkXU1YbTYLpFxNONDlEmGD?=
 =?us-ascii?Q?qJD1T6O6BnXN9zhXtHDTuruzctrf1xLnhdu6/TSK++rjrJbXVqC8UcRE+foo?=
 =?us-ascii?Q?QO1JpFl148mux/IaO8irdJMSPqFGh7xzmWw8z53a98ybS99ngMdpGrZsQZeG?=
 =?us-ascii?Q?QhXvdrtzqvWAs0Vh6uxyEuBzN2mcZSLt2RfmjS0q+2zfAPSRaTsnzU7iN8z7?=
 =?us-ascii?Q?JIE+6MPIvUwD3KcEx54WG60/SSjHgC15Q0PjrFYz8FTzwEo/XZTewMMQNhUa?=
 =?us-ascii?Q?t1tN18pTUWvU2XpEcb7P66TrmWt97sHD4AKzsbsQoJImb1EtmiVBYQ+YCruV?=
 =?us-ascii?Q?fb71s1m0WIY2XKyBmYiX0aebr/3RWwt41JZjQ1aM+kljsadI4zv06P0y5V2u?=
 =?us-ascii?Q?Q00HW/i91+nYduq/c/1bNxmxKQa2dQFsGguFjB8C/Ai94Bg2mSulcEMfF8yG?=
 =?us-ascii?Q?W4a/KveayHDy7nLuanDozxfs/Pc0MHxcQsgc6evDku7OwIgcUvamyCaFpCae?=
 =?us-ascii?Q?iA5DdinU1Z/22VptUOObJh5Q/D/m9Eju+ftRP5KHhmaaiA+BfOEXrUYOexx5?=
 =?us-ascii?Q?WB4SMhPGhLYVo+lMeMZg9kmFpgM3K0bobMbLlKwfGbrDQ3aMytAaoabGHNHV?=
 =?us-ascii?Q?wYAaaN1MjoF8yv8eQmFChaQaLMQqsP7oE72AGP+3BgvYHeJ8aEpSIflIXNDu?=
 =?us-ascii?Q?4h/Dc5ecIvVWZcqcD5Q8kZMf3ojFFovz1DzHq8lKi/GCCSdxredRXksSVv8/?=
 =?us-ascii?Q?+g59yH5gHSik69k2Dm22zJTBk+dQIQRTu0Z2csFooAOaxhGjVWjsO/39fUWs?=
 =?us-ascii?Q?UI4I6G/OWzOOC6mqvFo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: af2ed2d0-61ed-432d-ac34-08dda87fd750
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 00:35:18.2627
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pGAXGfVhkrSMnDbad/PWQ2CZFDqCftgOngGlpqPgZR+bkzZdB3KwWKVzuI80Ic2m9cF6IsXZBdh/mRVXCqHXuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6618
X-OriginatorOrg: intel.com

Hi, Jiri,

Noted, thanks for creating this patch!

I was prepared to submit a fix patch after the current patch set is merged,=
 thank you so much for helping get it done quickly ^_^

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Wednesday, June 11, 2025 3:27 AM
> To: lkp <lkp@intel.com>
> Cc: Xu, Even <even.xu@intel.com>; bentiss@kernel.org; oe-kbuild-
> all@lists.linux.dev; srinivas.pandruvada@linux.intel.com; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.kerne=
l.org;
> Han, Chong <chong.han@intel.com>
> Subject: [PATCH] HID: intel-thc: make ptl_ddata static
>=20
> From: Jiri Kosina <jkosina@suse.com>
>=20
> ptl_ddata is local to pci-quicki2c.c, so it'd better be static.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202505171535.Yrj5T8jh-
> lkp@intel.com/
> Signed-off-by: Jiri Kosina <jkosina@suse.com>
> ---
>=20
> This is now in hid.git#for-6.17/intel-thc
>=20
>  drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index 208e933e23d8..e944a6ccb776 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -21,7 +21,7 @@
>  #include "quicki2c-hid.h"
>  #include "quicki2c-protocol.h"
>=20
> -struct quicki2c_ddata ptl_ddata =3D {
> +static struct quicki2c_ddata ptl_ddata =3D {
>  	.max_detect_size =3D MAX_RX_DETECT_SIZE_PTL,  };
>=20
> --
> Jiri Kosina
> SUSE Labs


