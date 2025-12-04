Return-Path: <linux-input+bounces-16455-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 125B3CA2159
	for <lists+linux-input@lfdr.de>; Thu, 04 Dec 2025 02:09:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 147B2300EA2C
	for <lists+linux-input@lfdr.de>; Thu,  4 Dec 2025 01:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A818B155C87;
	Thu,  4 Dec 2025 01:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHvZjl+B"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6978182D0;
	Thu,  4 Dec 2025 01:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764810564; cv=fail; b=S9zty/SWzszzNSv5OWT3SfERHNSbX7BzEzaAuf6rL/3ynMv1YZ3KD6Mffw/DlU8DQeVDwKwEmZZMp/10AHK+2YZbCKsgyLruuEqDtTG5G6rNRW98xxh5KiYj99AcPco/tOC0MEoAn98Y0r5jjsNlDYhe0ki3GBf5o1ziw/qDvUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764810564; c=relaxed/simple;
	bh=NTVg7MvQJuCL+svQZGoDelyDnUdWcNdNhKzfbdvP73Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dsRr86raiaBS2Ga0VI+XXh9Cb2GH9k99X2zcJFaYtjXkAtxpHcIyteUTzOzIDF3F5sXqE4pkHZT9oY7qH9y8LLxkFsWwup86cmGQ3GwcW3kSBpDbKT53LE5CErDt94hT5UZeGgttnMtaYJ5qdzG5Gu8Y48gqjWbD+k6Shw0mxXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHvZjl+B; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764810563; x=1796346563;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NTVg7MvQJuCL+svQZGoDelyDnUdWcNdNhKzfbdvP73Y=;
  b=XHvZjl+B4wmtAtWTa6fGN+I2lE1FABtze5+TEyyvV4WKL7iP8x3YGcey
   Ua8W6+7/rsaTTEJ1tfaTY78yJFzmdLKjHx4ZHZ7X75RoEJQ9sdkQPC6aO
   Dr41XdSN9/53miwZKCncAbyWf6r95gLasG2cR20YCvcQ12LiCeCZawyRT
   4JZetmGmuaVSRuV4iX3nNtXX0QiDxLxaQGL8z9d7BrlrvVUdPQEA1IdlV
   Ipdj7frZ18W2iuUdoQYk+m2Znx45OLNBBGU2aIQHFj8MBKc7pr+akf6os
   vqRCOuzGxw9ndmqKWL8S5SKyT0E8guYqoyR6ZfYmIEy3FajQooQRWvPN9
   w==;
X-CSE-ConnectionGUID: N0wTn5vyQhSgthNEQCD5IQ==
X-CSE-MsgGUID: pJdlhbkeRfaVpWpQCQNkIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="78174223"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="78174223"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 17:09:08 -0800
X-CSE-ConnectionGUID: uV9lb61BSbic7IUgqQ3mWg==
X-CSE-MsgGUID: G3gnC9wRSgaiG0t+qfZf9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="225516354"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 17:09:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 17:09:07 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 17:09:07 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 17:09:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tXMXCKWCsHB3N8urU33X0MhpRqxXfxFKGT9fFNyNBnhMEcnvTENjjqmvLBnkYhV5zx8zncBa1E+zjRyvPETS3tZKqrctPnwtZKqA9lDYhA3UVrYhrA3dfrLFLc2YyMwUlCFuIVovR2UoS5x/HfMzt0JYsUwldYBmOQxYXg/PsEMyzN3BlEqmGd4qmKc7YpVSKPpBn5dCe2Cbggr2Ia6tkMakk4q2yYDpylU14P6D8SJyZO2DGRpTl0SkIPPMf4bI2+n4gxK+tSNiUCamkPFYyBal+hfizrYUMJCCR83sjjRRaPcHP+SdQSZHSWrEtlyZl2jY/P3CYU9OECuxIgh2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJkLSft36zom7iRhfTn+DfeDrCaO+zXurbua4OYPMdE=;
 b=y20v/KGtMaQ1B4Zz5W/k1rqhJJ3z8cVpDBJRJ9a/Zb6liMZV+AixfBSCIGzL5b3MrJ2tly/rfd62FxFwS18F4njBiEH+PkENtqvxgBf1wIr77yjSGWYM3bE5sGiW7WpMEwVlKUqTpxz/CSPI1VvqnnjlHvv4XKUWUtR1K0cL/F8/zCzKMqtYFwujLnIKQvK9+XQ1D0nPZcCe6uAKBKVsUCgPIvjIhL59ZlxdEO3aeWmH2Gu4xJRyL4fU6rRdD2NCZfgRcaczO53GpcMYC8JZOA3Od8XBliOua4IhzkJjprq8STLnMGXmTfYovIDiTdf7fxU6asBFOJaX6HUMsMmV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH0PR11MB5079.namprd11.prod.outlook.com (2603:10b6:510:3d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 01:09:00 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 01:09:00 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Thomas Fourier <fourier.thomas@gmail.com>
CC: "Sun, Xinpeng" <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents
 value
Thread-Topic: [PATCH] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents
 value
Thread-Index: AQHcZHYr7eXUdKFTSkOc2mJQznXNRLUQq/fg
Date: Thu, 4 Dec 2025 01:09:00 +0000
Message-ID: <IA1PR11MB6098C9F6FA78F599E6375638F4A6A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20251203165651.69215-2-fourier.thomas@gmail.com>
In-Reply-To: <20251203165651.69215-2-fourier.thomas@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH0PR11MB5079:EE_
x-ms-office365-filtering-correlation-id: 4da632b9-f729-4d76-5d5c-08de32d1b522
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?fskjkk12jmUw/d/LF62UFgHN/sqQwSt9sqADBT4F28RrbRo+2RNiH86U+cyr?=
 =?us-ascii?Q?EZW3mth5thjekUBSmE26yHOSeblx3f1npj1NxvYLfVRuVvLQsBTdmW0C64C5?=
 =?us-ascii?Q?cVG5Gfi0DkLmfmAwxkvw1gARyQXl5ll/zkl0qi5+CuIqfhvbi+KjShZuzvoO?=
 =?us-ascii?Q?vpQL1DxGXcv8IHk9yl1MV/XvDqY2NTGxTZnb1JoVo+L6W5tOyx6v53XHcI/7?=
 =?us-ascii?Q?29QgnMKbpDblV0ZRgBEnimee1N+KdtrCarfR03cxqMZeifDrg8TdejZW9OpU?=
 =?us-ascii?Q?SEVFGGxRYx2V2S5j+MTNFi6N1c68x0LiAbG2Oi2L45Fw7xl5/zvEdkXAocm3?=
 =?us-ascii?Q?vuq2KZwKQEKYrzDjvq+P/2OyM20OkG1KIDUj2hVOKhYO44norohAm5Xxpwf6?=
 =?us-ascii?Q?iFNGailDmZM8zIs50i0HdpVPjawuhbX+/kpvcbCxTE5cCKNo2q6ovXQg5WEI?=
 =?us-ascii?Q?6wwo7oaCK0zJWyLOvcRABaneJ+OkPu1RMV+Dv6qf4kdmOj7I/uq51vZuX53M?=
 =?us-ascii?Q?aRktqDIi6NKypudgTDPvgnDl9hLAAqeF0Rk8Tq3iPXAsM9e/4Zw/qClTbo5N?=
 =?us-ascii?Q?5wQEZJ+Y7YF3cPfNXWW1k9ng+3WccJX2p8q3L5Xxs/EAndQ/8/4kOtEob0RM?=
 =?us-ascii?Q?mEq/ZRLhuK8muwQJxBHf05z7D0btFy4mdV9b0G9r91vixhRou/6N6U15tJuw?=
 =?us-ascii?Q?moCayEqx3tFYcUnHtq/rZYj/xxoVSSV0GSBjV0tYTe8sop4eIRSYAcImzrfo?=
 =?us-ascii?Q?QBb4BFLB80Cz6iruPo6YkUGkB50Hr2yWP0zQaT83nx2Fp/lGhFxT7t701EvG?=
 =?us-ascii?Q?AKoVxfsQRCh++SCYWtNcXmutol6n/HGyC4nsAE3m2R21QQ2tySPg+hwHO3lq?=
 =?us-ascii?Q?H/IDIyVPVvisDvSey9w+C+B+j6dW8T9cF8g4eM+igV6dzi/CU1P7yIqWyYtU?=
 =?us-ascii?Q?KmKysJMCXPcoiPfFIRNjDwRCWRFkBI0ABpKvxivg6092wLbx6GSDPh667Tpk?=
 =?us-ascii?Q?P0C3X/K0/bimoG6vDDJ6c1PC4XPBpnARbQm5MNYUzMS1AceluV3lSBHw2zz5?=
 =?us-ascii?Q?S7s+RpJ1ATIOtW7NAhtNFEXGGKxjWmNNC4HjTq7M9oR6T7b+EXay9euzdt4V?=
 =?us-ascii?Q?LQjoK5pyfsKuzHPlZo4i/sNHpBpTc+xWnXXjeOqblHO6m6OYJFacBZeVDQWk?=
 =?us-ascii?Q?rAoYmZtZMjVPKO6eO2scWy+xPv5KUNCsRhcIsQ6YCf5rkweug+rEHwnDMuvK?=
 =?us-ascii?Q?kq9zQGY56LwEJubLJAxKLSxUP/NbCuMJrWpkhuEDc+RAtBe7Qgm94ZcGW1ei?=
 =?us-ascii?Q?oMSJo90ZFQ8wzF9UEvMt/VJndFc3won5IIYnEDBXx/Lx5qAm5mJ7ywXJMW2z?=
 =?us-ascii?Q?jPqub+S7dqP5hQOuvCwjDdIq9GhDe7DFPnvCxnpNK7LktKW9q15+YJw3lzCR?=
 =?us-ascii?Q?/uOyKQWfJ4b5BRnydreaFF39P4DRHoCKiLeovO1H9W5wTWs+UkVCPlayqstw?=
 =?us-ascii?Q?y37VstrvLBf7J5qXEoYU1MztBQ9ehhjWER4O?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rj2wNsQt4039bPseFOESaPx9Bxb9B158GL0gfAA82ozBeYSmeocfqzZ5vr4G?=
 =?us-ascii?Q?IXJlrBFs43I5VZtrX0EGQhOn5lBqmNfPNM8tgSAELodTZP7OxomQBRY8nMzE?=
 =?us-ascii?Q?/fayyF/UDa1EiN0xXd1ZpyG7BV6kY4UiBIExei6FenhBGxQDFDFBcrBnrFy+?=
 =?us-ascii?Q?xruKOulA2oa83aJ0X5FUrzK8IKJqE1sf7fCDTYH0A3IVesO8yzs4zF+WbwSS?=
 =?us-ascii?Q?X/wGP4dK7kR/qweW4Ujss9bhZKS+qIxcIqN1Z0l62lgdx1/LCpmnhYzIVOLi?=
 =?us-ascii?Q?u282VN5gfRtCKD2qvSdsbZxpfypXTx4ttdZR5q/JEoamv9r821nxv/jFAR+Y?=
 =?us-ascii?Q?zh+DkP5dh3xSuFEk+MgP/ruCRyAuqrsnR+ct0e3ox31jMdZw2UbUVdNKJooF?=
 =?us-ascii?Q?O+hWXxmsuopF8/h5WlRaQCR9GfXutEB8LC8p1jRyu0fxcJsz6JH1q/bVmyca?=
 =?us-ascii?Q?s2abWKEDByt3EssOixV33AYxInffpYo47omlv5vmqN2QQZ5i/KWpkd1oj04J?=
 =?us-ascii?Q?z1lTRmjsQM3ZXnkEpI2+8HlE/9MWwVhFSDkNSOX2zHRYCDYkyq11cfUpk3sE?=
 =?us-ascii?Q?IrARCIlpngbQAyfqwTrJW9cOOM2SA4gQHvl4jNVSYD6Cz7VsGGtoactk8MFW?=
 =?us-ascii?Q?uuLQeDEDWZ9nJJvDj2xh2msBZlwAWn3Jj6UjnI3Q1EY3bsnY2JWzo/In7syN?=
 =?us-ascii?Q?H51Nc0ZF2hWTWqeibEZt30m8RqSsL+roJ8pKY63+BtVKhuh7l/mvlTZVGssM?=
 =?us-ascii?Q?lrhDlPfeiMRXyKwfv85etvKh8J1NqK7ORWHnEAwNOjUpudyWY+EGBriSeko4?=
 =?us-ascii?Q?00EVYEjt+aTNbejiZqRI184MSe416ShFVBANxWCne1n+KVfqPHpeqR6IKOWU?=
 =?us-ascii?Q?8b+UNWgyDmtsVwoJRFy0HSBud531Biqe0Xg12zFBXA7sDeQXpkFJu4u5ekRc?=
 =?us-ascii?Q?lL2aC6Kf5Q5sG8d+7Ows3hDBT1+XDP7xLSZnR2bhYcLkbFP60TG9YSDOTTwg?=
 =?us-ascii?Q?XVUAhaaczxUedhlLbEDRUNa3Hywu2pm++mdgVi1NX3gcVdzVOgiPwaK5uFVM?=
 =?us-ascii?Q?FDB0rmqr9cxP3AECLouuWb9GvombCXTO47v+m8UenHInCI9W0FxRUD8UiWiY?=
 =?us-ascii?Q?dl+SBv/VUafEURUWe0CoQQfkA6garhfsrcztKninDpiaxvOFUe5N5One4rSo?=
 =?us-ascii?Q?K+xxpG+Ner7uOJAT5I7UDkIFTPeM10AGjy5s5UaNQAhrVZo4U9I/SvjDJ6Ve?=
 =?us-ascii?Q?qbVm3wPjiD2IMtBEfE8Hkr+Bei+Usg3NlY8q4UIA96eoMrdwxmImqlAQrp4k?=
 =?us-ascii?Q?fqyr02ld2pn9sRvnfMnJoYLPFXvi29q3l46qVZ5jUTQeCmPQYm4mAhbRumsB?=
 =?us-ascii?Q?MNDrMC22jAo5cBukmG1NZHkI0VXK92xwr0YFEtZE73PU6uNyKOT8MCGT8QcJ?=
 =?us-ascii?Q?VITB9OvDfqMjZaTRqvnyQcDjkoeiSh9rg7v7EAfrZZiBmbhsswAZHkA2OngW?=
 =?us-ascii?Q?aR5/WC66zt36epS9O8MG8smvmND73SEL5bBNNTgxvToZCScxKdK1DpJOA0Dv?=
 =?us-ascii?Q?CE79cADKFpoh1k9Y0sc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da632b9-f729-4d76-5d5c-08de32d1b522
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 01:09:00.1167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5JKNLNFr2yH7MhQNyTJt4iQNNea4Ypex+EycC5NRbstUKo6zusXUWwgdutaPPmPSeiy4XifXPN7J8gRDCiZ8+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5079
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Thomas Fourier <fourier.thomas@gmail.com>
> Sent: Thursday, December 4, 2025 12:57 AM
> Cc: Thomas Fourier <fourier.thomas@gmail.com>; Xu, Even
> <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>; Jiri Kosina
> <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Andy Shevche=
nko
> <andriy.shevchenko@linux.intel.com>; Mark Pearson <mpearson-
> lenovo@squebb.ca>; Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com>; linux-input@vger.kernel.org; linux=
-
> kernel@vger.kernel.org
> Subject: [PATCH] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents =
value
>=20
> The `dma_unmap_sg()` functions should be called with the same nents as th=
e
> `dma_map_sg()`, not the value the map function returned.
>=20
> Save the number of entries in struct thc_dma_configuration.
>=20
> Fixes: a688404b2e20 ("HID: intel-thc-hid: intel-thc: Add THC DMA interfac=
es")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Thanks for the fix!
Looks good to me.

Reviewed-by: Even Xu <even.xu@intel.com>

> ---
>  drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c | 4 +++-  drivers/hi=
d/intel-thc-
> hid/intel-thc/intel-thc-dma.h | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b/driver=
s/hid/intel-
> thc-hid/intel-thc/intel-thc-dma.c
> index 82b8854843e0..a0c368aa7979 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> @@ -232,6 +232,7 @@ static int setup_dma_buffers(struct thc_device *dev,
>  		return 0;
>=20
>  	memset(config->sgls, 0, sizeof(config->sgls));
> +	memset(config->sgls_nent_pages, 0, sizeof(config->sgls_nent_pages));
>  	memset(config->sgls_nent, 0, sizeof(config->sgls_nent));
>=20
>  	cpu_addr =3D dma_alloc_coherent(dev->dev, prd_tbls_size, @@ -254,6
> +255,7 @@ static int setup_dma_buffers(struct thc_device *dev,
>  		}
>  		count =3D dma_map_sg(dev->dev, config->sgls[i], nent, dir);
>=20
> +		config->sgls_nent_pages[i] =3D nent;
>  		config->sgls_nent[i] =3D count;
>  	}
>=20
> @@ -299,7 +301,7 @@ static void release_dma_buffers(struct thc_device *de=
v,
>  			continue;
>=20
>  		dma_unmap_sg(dev->dev, config->sgls[i],
> -			     config->sgls_nent[i],
> +			     config->sgls_nent_pages[i],
>  			     config->dir);
>=20
>  		sgl_free(config->sgls[i]);
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h b/driver=
s/hid/intel-
> thc-hid/intel-thc/intel-thc-dma.h
> index 78917400492c..541d33995baf 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
> @@ -91,6 +91,7 @@ struct thc_prd_table {
>   * @dir: Direction of DMA for this config
>   * @prd_tbls: PRD tables for current DMA
>   * @sgls: Array of pointers to scatter-gather lists
> + * @sgls_nent_pages: Number of pages per scatter-gather list
>   * @sgls_nent: Actual number of entries per scatter-gather list
>   * @prd_tbl_num: Actual number of PRD tables
>   * @max_packet_size: Size of the buffer needed for 1 DMA message (1 PRD
> table) @@ -107,6 +108,7 @@ struct thc_dma_configuration {
>=20
>  	struct thc_prd_table *prd_tbls;
>  	struct scatterlist *sgls[PRD_TABLES_NUM];
> +	u8 sgls_nent_pages[PRD_TABLES_NUM];
>  	u8 sgls_nent[PRD_TABLES_NUM];
>  	u8 prd_tbl_num;
>=20
> --
> 2.43.0


