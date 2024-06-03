Return-Path: <linux-input+bounces-4031-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0D58D7A5E
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 05:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C3D31C20853
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 03:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041EDBE6F;
	Mon,  3 Jun 2024 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TePv4uO2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5370BBE48;
	Mon,  3 Jun 2024 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717384236; cv=fail; b=dPGCO+uRx9J99pWbT0j9tYo4K5ecHDT/iNZ4XOXO8vOPojQMMIZbm0CC7lsBturjGjomkuV7XcIM3MG4Cp6/eFqVER2MW+pyPfx8EdBna66xj0NyLVpAF45/lNChapaw5LfpSpZBpfZpZB0kW66Ajv+GIQbXyeT0vU/wLs9wo/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717384236; c=relaxed/simple;
	bh=nM5DQ/df0BVFjmjGLCPpHvTohH94nfuND8/rw/1+ol4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GLROUpc1a6WoDCkGXAmfHhKBzNrr55HWM4+XJZ9DrEtx9SYpXeRqyNL7A0GvpZcnIPAM1jzxCX8TQZemDxQVdJTDhU4n881VPIQCpafbEemzmXU94eSa9lxdfZDYkX113akRkv+PyHsLfRjqAt7CwiT8xQC5BntUO0rE9T3egqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TePv4uO2; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717384236; x=1748920236;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=nM5DQ/df0BVFjmjGLCPpHvTohH94nfuND8/rw/1+ol4=;
  b=TePv4uO2n6wLx3Nny2GhvGDs5hhqmwzFrO50T0V+PGe9O6eR0J5KS/Cx
   IhcbKvNXFTTBxHIu8IGdi0EUFGAIQXOOKVRVW4BxbZhKN/F1Jfo8JTU3f
   mq4DnCSD2u9BV2LWIkAKJaO6z8Jjrc8XixVssE886/A9aKr0zcGEQzMVF
   49f7tAz2c9QPev7GdzofZ39n/CBnV3yUW54/qCw5LrRuwfp/InHSi7RBE
   1DwaBI3cxj1TtyT8zL4iVH6J0tjDni5ZaltV66ahGK3cMh1OXKgsRZ9Mp
   V9JWhoZbhaIjrRn+MktecccISOJ6tiQ6oAs85iGTir3hROd7WCeAHYojH
   w==;
X-CSE-ConnectionGUID: bKloK8ODRo+ZnWogyU33ig==
X-CSE-MsgGUID: 8BOkkPDYSzKIGtqzbAFrfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="31359476"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="31359476"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 20:10:35 -0700
X-CSE-ConnectionGUID: Oq4k/KkxSIimOW1mhooQsg==
X-CSE-MsgGUID: ix27TWuMQeWQ94G+dtwUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="41169196"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jun 2024 20:10:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 20:10:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 2 Jun 2024 20:10:33 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 2 Jun 2024 20:10:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 2 Jun 2024 20:10:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAYZf/iVb7k5gg7fEGqtQIXnjBOJqOXAj3PxmGdbZOABNNUihxwca74K2xh6CMrceLDbZ08CiByXLIM+qHcKNcywpvm6qYEw4+n1b3/HDiTT+KUWBtr5Vk4FHSO+L6cjfhQEVZHrisHG9xqlG0W5Ox1oQTvwLAhLmpBN0p+4bs8eyjEBTubwix2qI5TJan+dYuqxCMcSjrIGFqVcEGSRhU5pMYIg1dvkOdnIsk2uMxe82veiuiEnTcjkLWmBWE0Zl1R3YDQQzoWmCuIL7M6Tu8pgFE7vrXrPxby8158ADb6QLJ2jPjv06V7e6p/kkp6qHqLBDUH4BSgp9MTeZ4s6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btOeE0Yrc111LagWumD5tyAROW9SK5uZDiN2lnwzTOU=;
 b=fOHVrTfpwU4vDmwEdWKsK/phxNAzNUaj/pP3gSrf7MbxQ6DVvnl593jq9Qxlz0YlGUbAM6aFd7Dfi8wMU9kz2K4Ytc8bC6EVrWxHA8/T8tAkIs63MIcFtSotMO1oWYs9nQSBLKOllFRMFzWKWrPbhMMAAM2oDOM9yH+N++lYfs8OwEpAk5lDPYoQ+BR7PVZ+p3bxGCURa2r78EtIrztf0MCZeLgpJGxuA0v9ieqw4LejSPgPqQvgf2C9h+MJLS4xX9wsZxzszPtXNS2oJvUiCwpOh39IOjpmI0u7hGK8R3B26F0ssZ54inhq7jGqJxclDI013leAvWwQ7S1+ndygnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 DM4PR11MB7375.namprd11.prod.outlook.com (2603:10b6:8:101::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.35; Mon, 3 Jun 2024 03:10:31 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 03:10:30 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
Thread-Topic: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
Thread-Index: AQHas3ei8UwVwp3NNUSh33LfV3FKILG1Xyzw
Date: Mon, 3 Jun 2024 03:10:30 +0000
Message-ID: <DM4PR11MB5995E948FEC165CC5A27488193FF2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240531162836.157891-1-arnd@kernel.org>
In-Reply-To: <20240531162836.157891-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|DM4PR11MB7375:EE_
x-ms-office365-filtering-correlation-id: 8caf70c5-8d43-4048-91ef-08dc837ab9ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?+m2f7+a4P3tasEOoFfEPOsKJiz9x7Y7pW8VfDjU9HG8DRglosEA8hdazy+2P?=
 =?us-ascii?Q?++dSodn6etiFhb9cFpzq7BQUezWAvdWTtwfCw0+fKuDR8kQUJdL4Zdr9Nli6?=
 =?us-ascii?Q?r4v2vlMDS++e3R+8SeHKPNs1ZuQx8bG7pGdwgVHWTRLTYtVU4XcX0I10RtFt?=
 =?us-ascii?Q?bqHFBW+PClcSQcPr9Q7eIC7PREw6d1PH1kcx849emDWhY8/KLBDzB+Qw+uXx?=
 =?us-ascii?Q?udcJpXjDal6HQ48i43cBk3Si86G4rx78j4ALG3t6eN1DA/FZoSSP7v5v6UUO?=
 =?us-ascii?Q?jle7N+108CEH4phkQJsFiEE5QRikSwnSfSSPE1ZhC+WrglU0as36EGzQIf9T?=
 =?us-ascii?Q?2uhQas4LjFYGpqL+gaZ6UQSTdliVPg+yNnsGG+0PvDy2qg2+QvOL/kPLtnLd?=
 =?us-ascii?Q?ZKUJ4W1NALTcbipRZhe2YuD7kfFJPQlwhmS/wS47dndaV2TIiiMi5b8XjT0B?=
 =?us-ascii?Q?wVM1F617P6dkhKTJJmZK4ouCWAQqJuIcz3pKgO3N0i9eiURZNDBZ51uj1EIY?=
 =?us-ascii?Q?NUFlPmFzQoa0VeAShkDpGEL2w+0iR9xEXwiEj7HNUO54g2M4n0Z+3ajZEMvp?=
 =?us-ascii?Q?FV3g/Q6uopk+2uKvGn5zfzIrm9xcfyUg0Ivs/a0747hEtWiT+TYYnS9SLAT8?=
 =?us-ascii?Q?A4IsUVHPV17O+bn0wgDfAUv/pPgeBxa2NBzAObbOJoQfwwoecnVxWIQBjgD/?=
 =?us-ascii?Q?ZsuYLQ1BwW5QohBXXjW51YOXphj+JIEErY9xdQtoK4t7T7hNMQDPfk+86p+i?=
 =?us-ascii?Q?ufON+Xar5CODNyUIZGmmzCzZ1CoclXflAGbx9AxTx2zTNq2FFitpMipiKWSt?=
 =?us-ascii?Q?PkaFAoSyGJ121XdQmhSgyOTdqY+geFYLvQiiLW+psoH0KRQssklMSe5pph4+?=
 =?us-ascii?Q?DcgNhN8HW2IYspZ/NPJdEToUUzyo+gwf5dqDV7fEUQmRP/bIultztiN6jhFC?=
 =?us-ascii?Q?fT6aoQMr9vK9L085RQ47YPBSxxw41eUBZLUN5wTJBM06zRZ5qU/+1lP4+M9D?=
 =?us-ascii?Q?vUAS1dJRmx0+8p3d5SwjxRqF7ERu53NT4NLkd6n7HIoB1wgNVlnmSq6x0ud2?=
 =?us-ascii?Q?KNWtyF1TkMIIaXLfKM8r2BZSNJXRwRJmt6v9/zBfS77y6NZAAMXIOEPF6nX3?=
 =?us-ascii?Q?tXtpdQfIMOepewJaYWDZjg8vPLrgA8hhP3LfNEixyx0d7GO77dR4XvoY6oij?=
 =?us-ascii?Q?7VE64xZcT6in6IrzXdeeTvtp7S6WcGCzv7mU3K7YUu6vy0DwmufLz/esRiCp?=
 =?us-ascii?Q?i4upxEj/4EFWNDij2B7dUVNPgo/Sb8IFbIA0RT88EydTFw4a7BfhbkyGcGPb?=
 =?us-ascii?Q?hDwrRK2gtoppA/k6g2z0klejBYzJH2tQen631hlC00Bg6w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Qsqhu4hWpHK+5HmubwfiWansMydTvvdz3OEicmgFHG+5MpM8eEYbzdnh+YD?=
 =?us-ascii?Q?rxLoy29Kt96c2kFrsC+fP3KYislCCb6OFPQR4FcKl7nJul4EccJdC2rnU5MW?=
 =?us-ascii?Q?S0xnhWfESKt8WoUhEfk8Tpm9says2RaiWDr/aS9mQclg69hTnVd3TDWCQ4PT?=
 =?us-ascii?Q?OKSZT/WzijGky4U4WMk9QK+uP+PjSEwayRWEsClg7IPeUf+O+3p+sn26CJtH?=
 =?us-ascii?Q?xpy/3ItDvBUNpvCc9C/JJxXbzHi7zU+KEI1mIl8aWwU3CLur0KQTwRkQYG/q?=
 =?us-ascii?Q?xRq5cQdDrb6t6+BB8Lvx1rF4py1zetq3/OabOQIVRAwQ7nOPdBfeQIXZdAkf?=
 =?us-ascii?Q?aAiJUTd0QaR6xwFy9DTYOniuY0RNPo7+ZDYPwqHHMjpXlBrWDRSorzhEdlAx?=
 =?us-ascii?Q?ujnhRNZo2Jt5DiUx2OCqVe2uCYriHR478WwZNtht6gC6PdyaYdg3qItxUAqM?=
 =?us-ascii?Q?4z+5iOrL+TConqAw/N7Cob7786qJlkR7l4zH51ahWSALJKFO1d8KH5xDVR7D?=
 =?us-ascii?Q?ukGQiyI6MOKpAj93ql6sMAXSUVSt70I5AJso4TsRI1B4+44Duj4xOlgsstGv?=
 =?us-ascii?Q?+tH6OipjDR3oYoRtVbxvaSfTlZ7fOxV3YXSpdn6YG87/wvl/65Nvz6aHDr1K?=
 =?us-ascii?Q?kWRHBwIj6x2WHLArG/R/0LdUxvrGxqv9/0agyB1ZLblJePzyRxXrsY6dHbu+?=
 =?us-ascii?Q?gAafTER7/ZmkmXF76/dwPyc/WFKnWWgjLJFo6k6XDHTXfPRR/Mf3slH2NUdL?=
 =?us-ascii?Q?vJIHvqN3MD7RCXY7BnTpOLVW6Jq032Jrz+qZ8QQ5jwsrkHQfLBIrkZWW+Dfh?=
 =?us-ascii?Q?XpXHkZwPBJyPckeTKnbk7NeUyBuZvP1PFavlFQONzhSxOylrp2i7dtEN1cwl?=
 =?us-ascii?Q?nRvN1FaQt1K2uqVW446rVgcZqRR3S/nynySht0GoyJXrBazot5urREsSlRFB?=
 =?us-ascii?Q?lltp84zyQa28/wrL2SEt4le84NpfE7OFbG6QnTaYE2rkbpyafBOeWsXSTJ4e?=
 =?us-ascii?Q?7JJrhBdaNh4FIlDR9pJWPAc9gGnq2IgqZVyFMYxzzz+zuiO2sHgjiLUlOwTU?=
 =?us-ascii?Q?fhGGBvSnamTlsq62UaNCN7jvqyIwDIQkCU+Li4BeATNb/PC7xqzOm/zaNSgp?=
 =?us-ascii?Q?Ht71b5BKmK246lqrUxMmk6w6ZfHudgwAMVCHXrIcJNqA+HfcSlr8bIYJPIRj?=
 =?us-ascii?Q?u7Puqp896oTTobOxmzW06zmJPTy1qhhHQ71UdT8RHtrA3qP8E8lvgxr0cM+P?=
 =?us-ascii?Q?pjKvPrXO0n+1Oy691kQt3t/nJtrDzc+E10jM9JiyRASE1S0f/T5Rj1zz0ZFF?=
 =?us-ascii?Q?fFaMX+uFHwLnQFyPvwU5+jsQBQKMZClqV2nuy7qk8oILAxZbEkvAaEDBJPwO?=
 =?us-ascii?Q?qkrpHOZlAAw21w/MNULf5Vvakd42Sp2dsy4KFLe8FIWhQSUOckGXc9TeXsSt?=
 =?us-ascii?Q?4ZtYGWMP6EZSaAMOGc+upCLH1mGLg8JHWeJ0x+1H7+Ny6Q4pwwNPY6WqNt/M?=
 =?us-ascii?Q?S1XKqKEPz2HYUQOMHC1W6rT1dVrNYUCJJmSLEONHQtH70UVJQEMLWbiL4Q5A?=
 =?us-ascii?Q?WUdLaEIyhqWOVkmZLi24x00fHh0n8JZw7paJ5xSq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8caf70c5-8d43-4048-91ef-08dc837ab9ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 03:10:30.8091
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kh99xFSPNXDC+QfZxjxVTA70bjhWuzUaj/d39IaWeAUi8nonkOm7RiPdFRAzcrKKERVbkhJAy1+DgFLIrJ1hEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7375
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Arnd Bergmann <arnd@kernel.org>
>Sent: Saturday, June 1, 2024 12:28 AM
>To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Jiri Kosina
><jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Zhang, Lixu
><lixu.zhang@intel.com>
>Cc: Arnd Bergmann <arnd@arndb.de>; linux-input@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: [PATCH] [v2] HID: intel-ish-hid: fix endian-conversion
>
>@@ -228,23 +233,24 @@ void ishtp_loader_work(struct work_struct *work)
> 		return;
> 	}
>
>-	fragment->fragment.header.command =3D
>LOADER_CMD_XFER_FRAGMENT;
>-	fragment->fragment.xfer_mode =3D LOADER_XFER_MODE_DMA;
>-	fragment->fragment.is_last =3D 1;
>-	fragment->fragment.size =3D ish_fw->size;
>+	fragment->fragment.header =3D cpu_to_le32(fragment_hdr.val32);;
s/;;/;/

>+	fragment->fragment.xfer_mode =3D
>cpu_to_le32(LOADER_XFER_MODE_DMA);
>+	fragment->fragment.is_last =3D cpu_to_le32(1);
>+	fragment->fragment.size =3D cpu_to_le32(ish_fw->size);
> 	/* Calculate the size of a single DMA fragment */
> 	fragment_size =3D PFN_ALIGN(DIV_ROUND_UP(ish_fw->size,


