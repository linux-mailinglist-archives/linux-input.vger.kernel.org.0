Return-Path: <linux-input+bounces-13398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8EAFAAC2
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 07:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DAB73A289B
	for <lists+linux-input@lfdr.de>; Mon,  7 Jul 2025 05:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C653225C81C;
	Mon,  7 Jul 2025 05:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MIX+UWmA"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5B72614;
	Mon,  7 Jul 2025 05:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751865088; cv=fail; b=eLktbVQoX3vDfTiab3m9YrNZ89Fco8Gn8Xv5sSf3l+/1ePYcjuIKFZtOkSsaWssGRZQcfomoPZfDpesSSX6h4FlfzGb6AmxsV+nyVbRK9UZKVyqdkWHw0c/srLqOd1rZgc7IZzE7jM31dwcQt5elS5IoRpfNadCTxZzAJyXJ0s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751865088; c=relaxed/simple;
	bh=fqi5kimI4qz20jM7SKWM+4+onJjxgwPRkG7Q7mXSxok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jUs3iCwFlVvq6sIWii+OZvNAiMOTT+KOofAqpEt5ZlkrQyTqAjCgs46os3bRv9oWLcIPJr38JcCovGcvFOiAZgdyviae3G3ua6I2p0XdrjtD4PIwslxktThit9ETVlKaTVLkVlvcM97Q+JE2ZnjjPcQXdyUDenwh7bcKcQp954M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MIX+UWmA; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751865087; x=1783401087;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fqi5kimI4qz20jM7SKWM+4+onJjxgwPRkG7Q7mXSxok=;
  b=MIX+UWmAtJydWkAbK0LwK0IfMai9cdzlQpHv11fE10acWCs+po2p+ya4
   jRmMUq8DeIcM40BAUa29imi4nrEbKBh6xOdDdaTXAfAhnu2ak9Grjfa0K
   qw1Qbzjao6VR6L8/DBlC0J1vghyDg9vGhPMIO8ghvJ61F9oP+mvKPavAg
   cf88tan8pSSZKU0E+cRu7kdCkp2w7K5kxXTJfUwss254EE9jAHZ2rawj4
   bi/e3Tg9dbAagb5Ti92G/vhFNzRKP6MD/xW/WyO+4/lkrYEwClulhANgk
   U0tWRPHS4UeOml4rGn3neJIYrRc6tILcOPl/P/8zO76fTgpZSw9VpXcQk
   g==;
X-CSE-ConnectionGUID: 3a+fSc5XSamQ9BOXIyPpoQ==
X-CSE-MsgGUID: faNrScZxT02Mm1xZSOb+Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="53295365"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="53295365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 22:11:26 -0700
X-CSE-ConnectionGUID: /QoxpB8OR32oi6h/oKvQ/Q==
X-CSE-MsgGUID: ErhrJw47TkWTi9NnGxLV0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; 
   d="scan'208";a="155474030"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 22:11:26 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 22:11:25 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 6 Jul 2025 22:11:25 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 6 Jul 2025 22:11:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GwNps+q+jJqjroO7rXz6/2gCriWP5In5qtUVaxMqJsdJY52Rw7nNY+Pq1MxzInrpNSKri5pQCcI0VZWEhnGPPKcWdpe5pzbznYtuPnfGoVMIsBF1pJ/qyx2G78YCOuJqy/NTyHIWJX2ckp4E9CqDSA/6dyNR3yobRwXo76LWEJuvNlNFwmRRIDRXQufzs2xmtko8u609AR5WfeXt41BX0Zv2anW66BY5YjueIrmvofnZf3ATg65rPvI0w3tNgb1cTi3lfXggNQqIUC3jUR66gQafhSinHias8n5h4+26UVwxuqBvnNcY0pay5UsgsjhdbXhmR26Ru/CYRdsWETFo1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcdbHEC04fC/JscDH3Qm8QVdXTWX+SZAaoHVzbPHpRM=;
 b=Sn+BimbPtlKlt/XRTqIRcxQGfqEbMb8sx+WdjtP/cDQizwuWNxgUAGMmCnSLqzBFjdcfMCfrj6YFbpyLqE6PRjDAR/9NnQ/uwTEOcHMarBJffeIENb6YZUMBA9knzBP9yZwniU1j2W43gR+cwVjmpCPlg3FORRA8mZOjnlxx0EcFIUqonhQr8rszlME2qAhj7G21nC7uVeYXJVMijrwoKXuEE7iDWcONKBjYsTMgBaxn3CXfFI3FuPTf5bXrATCRC2ke9uv85imo/F2bFKlMDfDN5ky7GSxTXoQRxUE5rjzWKtve0Pf5OesVZnD0or4rDYAyXMzvyj9c9YQn/l8/7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SN7PR11MB7975.namprd11.prod.outlook.com (2603:10b6:806:2eb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 05:11:17 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.8901.021; Mon, 7 Jul 2025
 05:11:17 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
	<bentiss@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, Wentao Guan <guanwentao@uniontech.com>, "Philipp
 Stanner" <phasta@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 26/80] HID: intel-thc-hid: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Topic: [PATCH 26/80] HID: intel-thc-hid: Remove redundant
 pm_runtime_mark_last_busy() calls
Thread-Index: AQHb7Lji1JEHGAu+UkSBMiTKDqszK7QmIWBQ
Date: Mon, 7 Jul 2025 05:11:17 +0000
Message-ID: <IA1PR11MB60984AE7829B68663679EC7FF44FA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075418.3218839-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075418.3218839-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SN7PR11MB7975:EE_
x-ms-office365-filtering-correlation-id: 2518d33d-7ec2-434a-4c1d-08ddbd14b411
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?funNVR46AYcg87Fn+l65znLoZBAXUhioATc4eizdMkVJckffbazwy/z06qXR?=
 =?us-ascii?Q?S6rm2Ia01c8n0lc22fjTmncUBtgE1nug9EbxNXnptK8UYNLC+sK3uesGLUQ7?=
 =?us-ascii?Q?av0/UrB9bN1IZxC4Tp879MC1KswEU4JOqx8uB+Tn4MNk6GUillh9c901EHPg?=
 =?us-ascii?Q?JCJIdFYm/zrnwva4UxpJAmB1Bi/MVpdLRl+oZKZK7K51/q+G2NP6xIg4kY4D?=
 =?us-ascii?Q?PpUJKrRw9Vjb62U/idMGoIWeg21D7xpQYWJustDbM8kKLoRi/rSmPOv9BiPB?=
 =?us-ascii?Q?H1tfMNV6Hutzxrh6zU6g8in3G5T7mfaJTUzNAtZxvLdoYHroLLGkE8chpLXl?=
 =?us-ascii?Q?7Q1AVjEhmNQWZCkrcRtild88iBHLmc3PwWopMsG6gxgonYRpaPaT3F9JTzMy?=
 =?us-ascii?Q?4YzwcQQ3KxFTrfWRXzeEp4Qr6a7r/3DhUEw5Z/m1DNIB/FFmSGKAjuegHE5R?=
 =?us-ascii?Q?78N2qMrDDsGXpnwWlDkDi0djNDbkgMfNCJjWbdUPw4/EZkhxU9sukxuy2TnJ?=
 =?us-ascii?Q?mqI/2836PcbzWEyDNRVEqG5qYi9/LrQGVXFGPH+eNDGVsbe5DQOAwJD4Zl8w?=
 =?us-ascii?Q?8k5Jtb4Q4MVk8uvSZS7s/2FZ591QKHfYEzxr5yprWFBInoG5DjMn6F/O0q7l?=
 =?us-ascii?Q?aHb5JrdkzqeVFGpfxDOjlLnB85CPAGjVxMteIIFcbbnVjYqMVkgzjNSZxG5m?=
 =?us-ascii?Q?u8mmMWH0tEBV68Q6tCs+OEVmb+9XhMG/GaxInEwnf3G+rInMJ9dTrk+329iI?=
 =?us-ascii?Q?i1XZBGi+Il/dDFLat8mJgzk9cBIOfmM/QNdyRtBrsp8mnF63ltUQNcPI0Pcl?=
 =?us-ascii?Q?nYhXv2ECl6Rprm/+Om6cgjG8/sdxtGm0whfot7519hOA3y5U4v9PGxwkUmtO?=
 =?us-ascii?Q?YWjdfweQt7LppzjKtSLd+JDBWas0RnT6sSGG2VauvPI2kUxHt4bq0Uvw49Lt?=
 =?us-ascii?Q?jmc6fiHAxr2BRTaHwwtSMEDFuozm/d0aU35ks9QFduTDB/MrJL6oEq+p4RiJ?=
 =?us-ascii?Q?Vzfj+8bBPovLcvnwZ/dx8sxouDPFmo1R8sV4SkFAbXMby9V/brSlXJju3nQx?=
 =?us-ascii?Q?45VbO/T1TD/1E0GS6zqIWdWwh9eG99e6Wss68FFZ9e5Gm72wWPcSGc4jjf+h?=
 =?us-ascii?Q?CtCZ+LttW/2+V0/tfHyqJDr1g+2tGB6UMZFdxR5pEl86Z4HFmzzKE3mGvO9x?=
 =?us-ascii?Q?0aAMbNRZQp/ld7qlV3F86958XKGkihCEXqnd2PTI3YpBKNfdx5koLGFnO04d?=
 =?us-ascii?Q?NJIG6D8N85ZCVtzqLWEAIlPUQsJK5toxf0mt3XkK7To8kQOq3xCuFfvDV3n7?=
 =?us-ascii?Q?DUDiHbKy5MXBYzFis9xC2rPhwxNjeWtGIdGT4Sq3CWhiw6weAy8pXuE2hR2R?=
 =?us-ascii?Q?/Odxo77k5JJwTdCO1xrn7W0lW1nhM0vNCvqAw3C0cTo31OURFr0fGJnBMRc1?=
 =?us-ascii?Q?MuUiD1eo1XyYuasTXGLBNeIUcUy1FWixyQ2gq/6Z+9jkA1Q4athQTa0Egjzc?=
 =?us-ascii?Q?9Uick3m1edieWyw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?geVXKoqvjzT6bm+bIXq5pxxwGUkg51yTRjGqtUuB2epKYJMF+Xt7nXjRifjd?=
 =?us-ascii?Q?Lk49uEoUW/ChgJ8FFrpel9G77s7Xu4YglDHEXUze+xerUVLrWOPCR6dlVWhw?=
 =?us-ascii?Q?gaEyZT2X2Vj8A1hHWTFBz8qxrRRvaN58yZgwgbGfHclHoPF6o2RIhOPCvaw+?=
 =?us-ascii?Q?ZekWfdZ0iHk2lvNSllUYBChnuzLvew+iEHjNOy7HgjhZrLLJVRh86HrXzpQi?=
 =?us-ascii?Q?jD2EaOPdyM1yn9ufuS8RmWNVtZ/ck4eqJQHnTECXlVn0DOVzsz0N34MmEjGi?=
 =?us-ascii?Q?5vANyjp1fazwEistdekMn8Ga+iPPDmhDAiRYdj4Pw9phfTTGr2jxfVJV+ENB?=
 =?us-ascii?Q?beA0PKnkOiqL5nIvj2+JqbC23x7hxenwP0gHAZemfzEcI1I8t/fvyIhYxECz?=
 =?us-ascii?Q?Ytjlyx1/185QuDYPiMUIfFUnpqzqIWgKf95O28CPUZrPzv9x4iPcrq2WoJGt?=
 =?us-ascii?Q?rQJP+Dal3wd1Ebgbhtp9H0GZ4w+cBmYKWmcXmXZd9RtKWRppA3ozBqU2/6zN?=
 =?us-ascii?Q?XHBqdir8IIpTqtqe5UOs3TmzRHHUbUG5pEExDTA7TAhBbVpnxjYTw+AJHh6T?=
 =?us-ascii?Q?gducnouRf7PoTAQFLLc5R9ZSK9SW6rtkQQWjKXHZ/4Y0X7ErfcYIw0dIm6nV?=
 =?us-ascii?Q?ynnj3TITlJoRBILRokPt+uUFAxulSxcSqkvo4DJWeVdUGclUbp9KificBE51?=
 =?us-ascii?Q?vzAyQzIUdK/Fwyd5xKZk3fpgNUYQXfHofBtKqNYcWVahUfJy72KadbdmaGbe?=
 =?us-ascii?Q?PZ/rwea+yrad/f18cKptVa50IKl8bkxF6yC8US04PxGkLfYepBAJzo8wteRZ?=
 =?us-ascii?Q?NU/geatWQ5L3l3vqNBnp85VFwHlTHohrXJlF5Vg9ahAfX/u/f55ui5U4fDbW?=
 =?us-ascii?Q?u08IR0cj5Vn7xpsp/TsqMPhEXtckrOm0TsMmLmzOS9IZA/XzuHjsE8fYGAn9?=
 =?us-ascii?Q?FkmLiWmYhmDVuMxNKuT50jvN4Zcg/YZM2mKfMvMgZ9a33ewiardvSAb+VuKd?=
 =?us-ascii?Q?TrVmYIQM+4X91KBVfnIVOKpRlCXqsgiPO8H10z/KtZhhnZbBA8E1cdviEiBY?=
 =?us-ascii?Q?jQdFYkKP5odQgFsxOLq+IB++PIi30Vj0GLOHbc3UZwZ2K4KwiJR3bV2lWoWT?=
 =?us-ascii?Q?ajoSjp8x9fVSpO+lTixK7JjSsE797YriPS4UtV++F5YWvmDooAqq7Hyd+Oma?=
 =?us-ascii?Q?urxzEEyAhOJct/ySZPUarkDEN+Z0tX2Sa1MXeUgpMED0X5JVNpXHYy4RoI+Z?=
 =?us-ascii?Q?NtltsuNMNLawuthIpaNb/W+pa5tkT9yfeeYaZPzE79czofg5OfaJbWdyA5/B?=
 =?us-ascii?Q?5eYVwQcJTboG46aUMcfvcaQJY3WANH2S60kdXABmJIWiWND/suIhE9GPcVAh?=
 =?us-ascii?Q?cJkh4tExQ/Myw1w2RKVVGputUepwe+OFPwzNBS75qmdU6kNag4JZrSZVZQot?=
 =?us-ascii?Q?32DU1sIKibeYfn7Ou9hAqjwWVay4PlF46J4kiiwszwW/1JbQB/QRbkLq6H4I?=
 =?us-ascii?Q?eScDODn37fGHVsbxJApLqFOOG8DEBlGVnKw+XYYwBbpCGenoKXlITLMr3CUs?=
 =?us-ascii?Q?yaTf6OIod8WCAiNQxRg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2518d33d-7ec2-434a-4c1d-08ddbd14b411
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 05:11:17.4484
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+6Z6Be0s7vitMCz1rgzHos0ef9t6ECLfkMFRuJ5JfsDLDRgAxaT0nyx+mdC8co6OFrJv2BC89BoJESLIl91aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7975
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Friday, July 4, 2025 3:54 PM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>; J=
iri
> Kosina <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Srini=
vas
> Pandruvada <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> lenovo@squebb.ca>; Sakari Ailus <sakari.ailus@linux.intel.com>; Wentao Gu=
an
> <guanwentao@uniontech.com>; Philipp Stanner <phasta@kernel.org>
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 26/80] HID: intel-thc-hid: Remove redundant
> pm_runtime_mark_last_busy() calls
>=20
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call =
to
> pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> The cover letter of the set can be found here <URL:https://lore.kernel.or=
g/linux-
> pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>=20
> In brief, this patch depends on PM runtime patches adding marking the las=
t busy
> timestamp in autosuspend related functions. The patches are here, on
> rc2:
>=20
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 \
>                 pm-runtime-6.17-rc1
>=20

Make sense, Thanks for the change!

Reviewed-by: Even Xu <even.xu@intel.com>

>  drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c | 2 --  drivers/=
hid/intel-
> thc-hid/intel-quicki2c/quicki2c-hid.c | 1 -  drivers/hid/intel-thc-hid/in=
tel-
> quickspi/pci-quickspi.c | 2 --  drivers/hid/intel-thc-hid/intel-quickspi/=
quickspi-
> hid.c | 1 -
>  4 files changed, 6 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index e944a6ccb776..599f12d3e657 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -328,7 +328,6 @@ static irqreturn_t quicki2c_irq_thread_handler(int ir=
q,
> void *dev_id)
>  		if (try_recover(qcdev))
>  			qcdev->state =3D QUICKI2C_DISABLED;
>=20
> -	pm_runtime_mark_last_busy(qcdev->dev);
>  	pm_runtime_put_autosuspend(qcdev->dev);
>=20
>  	return IRQ_HANDLED;
> @@ -711,7 +710,6 @@ static int quicki2c_probe(struct pci_dev *pdev, const
> struct pci_device_id *id)
>  	/* Enable runtime power management */
>  	pm_runtime_use_autosuspend(qcdev->dev);
>  	pm_runtime_set_autosuspend_delay(qcdev->dev,
> DEFAULT_AUTO_SUSPEND_DELAY_MS);
> -	pm_runtime_mark_last_busy(qcdev->dev);
>  	pm_runtime_put_noidle(qcdev->dev);
>  	pm_runtime_put_autosuspend(qcdev->dev);
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> index 5c3ec95bb3fd..834a537b6780 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> @@ -72,7 +72,6 @@ static int quicki2c_hid_raw_request(struct hid_device *=
hid,
>  		break;
>  	}
>=20
> -	pm_runtime_mark_last_busy(qcdev->dev);
>  	pm_runtime_put_autosuspend(qcdev->dev);
>=20
>  	return ret;
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> index 5e5f179dd113..2b518d88645a 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> @@ -335,7 +335,6 @@ static irqreturn_t quickspi_irq_thread_handler(int ir=
q,
> void *dev_id)
>  		if (try_recover(qsdev))
>  			qsdev->state =3D QUICKSPI_DISABLED;
>=20
> -	pm_runtime_mark_last_busy(qsdev->dev);
>  	pm_runtime_put_autosuspend(qsdev->dev);
>=20
>  	return IRQ_HANDLED;
> @@ -670,7 +669,6 @@ static int quickspi_probe(struct pci_dev *pdev,
>  	/* Enable runtime power management */
>  	pm_runtime_use_autosuspend(qsdev->dev);
>  	pm_runtime_set_autosuspend_delay(qsdev->dev,
> DEFAULT_AUTO_SUSPEND_DELAY_MS);
> -	pm_runtime_mark_last_busy(qsdev->dev);
>  	pm_runtime_put_noidle(qsdev->dev);
>  	pm_runtime_put_autosuspend(qsdev->dev);
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> index ad52e402c28a..82c72bfa2795 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> @@ -71,7 +71,6 @@ static int quickspi_hid_raw_request(struct hid_device *=
hid,
>  		break;
>  	}
>=20
> -	pm_runtime_mark_last_busy(qsdev->dev);
>  	pm_runtime_put_autosuspend(qsdev->dev);
>=20
>  	return ret;
> --
> 2.39.5


