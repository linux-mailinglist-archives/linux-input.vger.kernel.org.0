Return-Path: <linux-input+bounces-8614-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D31449F4007
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 02:30:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8975A7A16A1
	for <lists+linux-input@lfdr.de>; Tue, 17 Dec 2024 01:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A82D714A85;
	Tue, 17 Dec 2024 01:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBrkLq8q"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CA879CD;
	Tue, 17 Dec 2024 01:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734399037; cv=fail; b=VGHXs0tqNQtvHXbGC9yti40Yl/cqbVX3tFzFbtwhzLhxciuo+F1eqHJ3fEY+ySNlrs2q+VrN3ao3UNHHlh2pB3i/wdhRRPvLocbfaumqag9KMkb+jEc2aPyrK3eD3fo0a2+bPTShv8apjgisXTIJ/lAjyboFx3eOcr0oxzCnWvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734399037; c=relaxed/simple;
	bh=TTgvNitBSGZlOZNhffCnDWS9+MNLsqqXUIX/o85iRzU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CycuFGBki1sL1c+SFmiLqUe4GOIwu1cU2MZkSx7a8kurARk9wbyAanq4cJPibBy3uewWScib6yikyxZAR6XraNcUQhaEPqrTcaXvjRUMZ5Bwlv65x+ss28CuVi7vEjFTiXgYEMAwuDqLnC7DhipKvNkeiXnMx+AVxay4rBuocLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBrkLq8q; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734399035; x=1765935035;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=TTgvNitBSGZlOZNhffCnDWS9+MNLsqqXUIX/o85iRzU=;
  b=BBrkLq8qKyxatPjJQC5JQox6PFGZemqEUg7beVLbI2yIRHo4AVcZM6XK
   sHzE1ctDEAshTxF7wHbZ95dZ69GXgZcoiNrwOn3d/haJDeYpGeAO0vwTe
   D7WwNUbTkbOuaE2bqIP3WTmNogBWI3qhTtDNc6SkrLvAdnBDwVTDG/gvX
   7XXrwGzL3CBGjq9y0oEiSIX0GxCtSalg33jl6ao83f/1CxZjRju4uXD/Z
   3mgqB9Am3JhGi4enDfOHOaeQlYOMmii0ka94/VqVpWmz+4Xypxzh0v+BF
   9DK807IxV9WURSup6oxBUF/IlTrw5eiGmibx8YkB4rhzjOBcjXSo3Z4f8
   w==;
X-CSE-ConnectionGUID: UiE5c/gFSQ+sinlkPI1pBw==
X-CSE-MsgGUID: kDGB8IU+TcibXb7+HrNXuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="46220310"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="46220310"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 17:30:34 -0800
X-CSE-ConnectionGUID: vyBQhcgYQsqV0vaM/hgaeA==
X-CSE-MsgGUID: zleEUxsAS/aKEl2TCCA7Wg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="102408155"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Dec 2024 17:30:33 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 17:30:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 17:30:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 17:30:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CneHFMaDogDQ0WkQUhMGgwfhsOGbImaYkBtkhN+7UrxosIVW9VNVu6pVFYymJUevwm/Xr744DNriV2N91T9dLhwcRi5stSd7tkQUHpPoRCAq6y50EtRsEJSdL11Eq/fiHjt4PcdTkDRQPh6xQXDW/yD2Ko7qIYsmUsDORP1Nu8gw6kYEeCfKTC2XDQOxtNY03bUqCP3NNMPXLzyjnFVWC7mJf7S8mP7F+rP6fkfYc8LE87akZ00EYnExrCrBsXt20Sokxl25XMtdtNnmD49q9W5a0TFI8pXODBc6adqdatlfBNMwcslul0eUY+i9grf6outDGHcGfqOxoNntHZdV+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlmvgbMbQ7GT/MCnN0O5sXkC/AOWTOxNh8N2xuq1JCQ=;
 b=W9afk18tDZl5wRVE4xqBli2JBrajozce24jmleBSukUDclyXKOmsjawOA2hnfWsElBBavrBIS/ImbVbbu0eualLbXYHyo/hHWbTFBfIBgUzQbmhtppIHZiNhm+s+HIVmJFrOS2NHDR6HTQJb1HnOyfm1JEjPBGZlRGd2Sx1wON/RZr7nyDtJkzfizzvx+CrPC8LVPXmnzgVJuTDJ+dpRwQjzJjU/czyDY5wG+3kdzIdOpL2H+CuUmhDNzrBMWJBqXzNmIN1BFOYOhCc+YVONahe2ZBE6ePz6016doVZscb4EyEWinitYJpLhxXana2VMYsXj+wP82HwBNqdmwwomrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by MW4PR11MB6911.namprd11.prod.outlook.com (2603:10b6:303:22d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.16; Tue, 17 Dec
 2024 01:30:30 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 01:30:30 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Jiri Kosina <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"bagasdotme@gmail.com" <bagasdotme@gmail.com>, "Aaron, Ma"
	<aaron.ma@canonical.com>, Randy Dunlap <rdunlap@infradead.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
Thread-Topic: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
Thread-Index: AQHbT1u6VaYdJGYrTkyQM8AtFrVMzbLpFPGAgACSb2A=
Date: Tue, 17 Dec 2024 01:30:30 +0000
Message-ID: <IA1PR11MB609829F67A1D13E1FD4890E9F4042@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241216014127.3722172-1-even.xu@intel.com>
 <fc72c31b-b1df-482a-966f-f81459a733f2@app.fastmail.com>
In-Reply-To: <fc72c31b-b1df-482a-966f-f81459a733f2@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|MW4PR11MB6911:EE_
x-ms-office365-filtering-correlation-id: 77ede051-3a11-45eb-f6cd-08dd1e3a6504
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?P33gtHUnWHcVxu9oV4Cj9iHJywEm0O7thyTsheQp0aN+56r7gO4p1VUuLXD1?=
 =?us-ascii?Q?SwtAIWpoAILr/QICNmAhYlx6mkbjPnRXHcSys/OsSAXI20aEsWWNDYcZ/BL0?=
 =?us-ascii?Q?Cd3AIPzKivD9hWYp4RIU/xvyjvJEiObiEh0XZ9p6LivK43ZzgGypdoWsXD/t?=
 =?us-ascii?Q?WwiOXSTaiSVzPOC79U5d3Ac2LmDlj6F4brE2gxsKwxZCKrW5wPSPocuSArfJ?=
 =?us-ascii?Q?7oRUovF5Bm3jEQZr9Dr/APczvPCtC/2aoxRDDSP8qeh+70zOfyHEcauc2+li?=
 =?us-ascii?Q?VBreKx/B+1njqhTOxqI+Pd8M4IqbwVrEaM4ngtW6WP1mUDpjaRqPvAhiuXqm?=
 =?us-ascii?Q?dwTPCSZvmibNeW6RYk+OOHrBa9sgt9PyCCMMRsBVwzg7SXQiciJ0tLdn1cQB?=
 =?us-ascii?Q?ZG2a/p9c8NTJa+02NvheBZY1cJ4Zfkww09wSs80rnrPizqQRyem0721FKj7U?=
 =?us-ascii?Q?KQQJQNMawKuM7Z//TsFv/BR5PybfKJNamlwpCu04nmiDGAtodv4TRwwWCRKK?=
 =?us-ascii?Q?AWweuBDSEcQ/BRlRIR7H9ZAuKtxjISXU7LUYnNcunhy2mADVdRIjXqvKeDqM?=
 =?us-ascii?Q?uABqkNYXsRGusjwZFQTaGmuUGHgtlD6GClrGw8DaAj3rgPgJzyaE8lK3pTYu?=
 =?us-ascii?Q?SyBJ665MoxCcFLlMBN2QuZIaKzpuN4U3HiUmaj0ehNMg7CQAKyoDR5FIRNuL?=
 =?us-ascii?Q?2263WjY0jogvqvc/PT1iPw+Pn3aLiUr7cPamI0W2g/Uzc57sHl9oRKOHai6k?=
 =?us-ascii?Q?3DFPyBD696MnxQ/f4nVPgiEIssBrhOJeSN0y59YpoNDnTDmnHFxnVfGQfTYq?=
 =?us-ascii?Q?uEetknsjKJtaw7bEgCzXAhFapuy6YvClsdkmjxYCPmRQ/8YBssPgsav52TcQ?=
 =?us-ascii?Q?h0HEhikUKvmfxeREkPGYo3OOmKRCVHfddxPXpH2NqdRq3LjrJZFPFhTyMvpA?=
 =?us-ascii?Q?LbzAaIdytT0ht1kbIww7sZDLV86oCuXxZwbi36qFmJafZeVuLZy0U4bQYCNr?=
 =?us-ascii?Q?vF3pQezz7QzjxXxjlyL80FCBnF1lKExy9oolNmUdvJ47Zh/0Dprj9NApnQlW?=
 =?us-ascii?Q?cB7BpbUK5NL+TpncIDhFSTd4mILMk2BWCpF7+jDmMlUOptnaTaQ+V5RgZiVY?=
 =?us-ascii?Q?piRKE/5k772/An2YViP/Hdb6VK50LFUOVDUlBw0JzlAW0JM2WWIq+2vCkdZH?=
 =?us-ascii?Q?OGGeL1hZpZxfcqfDlcKThaWcq2tgaYeXufECea/evH+jTW7isKgE71Dh7xj+?=
 =?us-ascii?Q?/G5SmUaOkxDDKH7ntoOvyFsnTZo94sugY8QfPQ37mxCBYI5YlStLHzddtE1V?=
 =?us-ascii?Q?QEuQ4UMRM76LOYAarNS9ekpq9s2IpalzFy2/1VaD3D0W70GBoJwt75e8pxWW?=
 =?us-ascii?Q?glM1UXZgz5GHfkmjW0VMjm2hJ16BbArGeqpBWIn3Qw20mB/B1uYGilMY60tb?=
 =?us-ascii?Q?yJUIw992gO38S1fhrJ8gBrjJw9goshJq?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZtbhQeHw6uyqvmsbx1f5iaU9HJ3HcdX+FKMNux0j6UWSg7nvxMX8QluVqFUB?=
 =?us-ascii?Q?eJXokCvY/EJ0w7XMRHB+0+8suBdF9CD+GYz3zhYSLPe/tP6YZXrh4+Bvmzgk?=
 =?us-ascii?Q?c++lqJ6EMeqwPDNAH10t2y453ILna342DPtNoI+u5WkOnHQ+nnQv1uGupKdc?=
 =?us-ascii?Q?D+kxgm9wkyPv3dkHScrF0VlcxOeqUti1XJdO5TX3Su/qhn4cBENH5FSehiPd?=
 =?us-ascii?Q?2jyUTYWNuOG0zGHT9YyytSFd71/P+jMxua5aHYJMqWv5X5SAwacztwvTwfTK?=
 =?us-ascii?Q?WVSumHnL8K0WdFLiWiMTA5ywi0sNoFhn9fuko53R/ydte31SuX/XzKE7q2Xm?=
 =?us-ascii?Q?lNvpbRZYTpO+ttl4l+1C1alotMbN7vqn+XdYVwm65QM4bCmXflqUvGckTbqH?=
 =?us-ascii?Q?BMD0CZQi7Gq+EdWNtSpS72FaHThoiLdwCI5Zmqu9Uhs60mvEqBYgpWdw8vJ1?=
 =?us-ascii?Q?92oIQPK3J0CQNo5N1J2kQhaEWtUF+CZ2TZ6RHw3e2mVfNU1ka1+77QE6tQZJ?=
 =?us-ascii?Q?IkcbqYMkMte9kl+OPAAIuIL+qBKXi+6XfEBa7Q1/WL8zyucrwvtmLX71qVjH?=
 =?us-ascii?Q?Eh3bNdAvqLXdPHD8YQFDFHwgoOtiyNg/Z/VUnEDJCvXDQGbAGGKyl0vIsasp?=
 =?us-ascii?Q?BSRLiDef2htUcNCWnnM4qepxsFxD/MN1qa3T1v3rL89OyUAEzOZiql+qXUDT?=
 =?us-ascii?Q?lu6bHIThCt+zgMMguY4Vu5MfVvP3IKV+GbukldrsRMNR4HFLW9Dt7kLhqN1K?=
 =?us-ascii?Q?C7wPdt55cPvZQqXIlANxIgsM01bHXNMOvwssNDFdF5BlWF7eq8REx+xPrdl/?=
 =?us-ascii?Q?Hgvcd7SfpNADkINETlwrMiyEIGyvkc94EPO25DEqddqNfiIgQDuW9eLOMUQX?=
 =?us-ascii?Q?PPW6DcWchJ5aD616ej7YdYg+Hn+t7yQ9Ey7BMbA9S/xSfFwJzZ8tPZCkfoG1?=
 =?us-ascii?Q?toDfToTYTh65c0PNWq245FtiJ2YuMXodncRqvRdczIaKxUvVdltmz3LHioHc?=
 =?us-ascii?Q?PfRdTlCmDpSg+9dVKLg7Uf+wEeKAs9BQ/w8eRBy4mfUdIW5TMSzw6RnPxKe1?=
 =?us-ascii?Q?siAN2oBvGNdbWnK5RiLncE2yDxmZR/L+5o4BuzMBMPjOxzCbnaRfyM9KPPE3?=
 =?us-ascii?Q?kj15bxhn5ne92eylK3v/uRQg6aC16Po+rNOUsy1TORxu5h6uO71M/wR6uIlE?=
 =?us-ascii?Q?vVthHWtEmEaHylJdFf0Z40cLJ4cm0+YNBI3hv0uhMP4FZfk1RHsi6KkJT8cx?=
 =?us-ascii?Q?igRRunxVXx8PomMH3EhM3jDGHSaTu/Fk9vBCOUn/X81+D7dmOg+3T5/3aI77?=
 =?us-ascii?Q?4afwRaOflLw5nOLUfhFTrcWHhfrX0ITuq0w/BwtdLv5OoCxEcn3I2rdF0gvT?=
 =?us-ascii?Q?3SwHZR+0fNrKvEENGm5QaQocIqbrzXaNGlCpubB0fy4J0gksFctPl1IknL0z?=
 =?us-ascii?Q?FTjUCzO1aWQl/sqSjw8RrPUe8qcJExCRQhjrd+Z4d5VyGZLfC2hTyYMzvgnT?=
 =?us-ascii?Q?xPwUy+OuDE+q0s0/pCYS2zfkRyjAu7Ibh1nIOH/G8bnOj5OlKZ5Ab7YJuM2W?=
 =?us-ascii?Q?VfMy8MrbnRuM6GC6N6A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 77ede051-3a11-45eb-f6cd-08dd1e3a6504
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 01:30:30.8001
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEu80sV/K6nUKcOENxIWc9hg+HiIu8AD1ri2v9xUWvOGfKPGvCOIYjEUZ2PndLyKEtb8DMaaNohRtjnV3dKkfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6911
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Mark Pearson <mpearson-lenovo@squebb.ca>
> Sent: Tuesday, December 17, 2024 12:45 AM
> To: Xu, Even <even.xu@intel.com>; Jiri Kosina <jikos@kernel.org>;
> bentiss@kernel.org; Jonathan Corbet <corbet@lwn.net>;
> bagasdotme@gmail.com; Aaron, Ma <aaron.ma@canonical.com>; Randy Dunlap
> <rdunlap@infradead.org>
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> doc@vger.kernel.org
> Subject: Re: [PATCH v3 00/22] Add Intel Touch Host Controller drivers
>=20
> Hi,
>=20
> On Sun, Dec 15, 2024, at 8:41 PM, Even Xu wrote:
> > Intel Touch Host Controller (THC) is a new high performance input IP
> > which can benefit HID device's data transaction, such as touch screen,
> > touch pad, stylus.
> >
> > THC IP now evoluates to V4, it can support 3 different modes: IPTS,
> > HIDSPI and HIDI2C. Here are upgrade history:
> > - THC v1, for TGL/LKF, supports intel private IPTS (Intel Precise Touch
> >   and Stylus) protocol ( IPTS mode)
> > - THC v2, for ADL, add industrial standard HID over SPI protocol suppor=
t
> >   (HIDSPI mode)
> > - THC v3, for MTL, enhance HID over SPI mode
> > - THC v4, for LNL, add inudstrial standard HID over I2C protocol suppor=
t
> >   (HIDI2C mode)
> >
> > Linux Surface community (https://github.com/linux-surface) already
> > implemented IPTS mode. These patch series provides THC HIDSPI mode and
> > THC HIDI2C mode support on Linux.
> >
> > These patch series includes:
> > 1. Document for THC hardware and software introduction.
> > 2. Intel THC Hardware layer driver which provides control interfaces
> >    for protocol layer.
> > 3. Intel QuickSPI (R) driver working as a HIDSPI device driver which
> >    implements HID over SPI protocol and flow.
> > 4. Intel QuickI2C (R) driver working as a HIDI2C device driver which
> >    implements HID over I2C protocol and flow.
> >
> > Change logs:
> > v3:
> > - Change tables in documents from literal block to table format
> > - Change symbol namespace to string literal according to patch:
> >   cdd30ebb1b9f ("module: Convert symbol namespace to string literal")
> > - Refine Kconfig description
> > - Enhance Quickspi and Quicki2c driver by clearing THC hardware interal
> >   state before doing initialization to avoid BIOS impacts.
> > - A fix in Quicki2c driver when does set_report
> >
> > v2:
> > - Fix document format issues
> > - Add THC device IDs for Intel Panther Lake (PTL) platform
> >
> >
> > Even Xu (13):
> >   HID: THC: Add documentation
> >   HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
> >   HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
> >   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
> >   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
> >   HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementatio=
n
> >   HID: intel-thc-hid: intel-quickspi: Add PM implementation
> >   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
> >   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
> >   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
> >   HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementatio=
n
> >   HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
> >   HID: intel-thc-hid: intel-quicki2c: Add PM implementation
> >
> > Xinpeng Sun (9):
> >   HID: intel-thc-hid: Add basic THC driver skeleton
> >   HID: intel-thc-hid: intel-thc: Add THC registers definition
> >   HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
> >   HID: intel-thc-hid: intel-thc: Add APIs for interrupt
> >   HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
> >   HID: intel-thc-hid: intel-thc: Add THC interrupt handler
> >   HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
> >   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
> >   HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver
> >
> >  Documentation/hid/index.rst                   |    1 +
> >  Documentation/hid/intel-thc-hid.rst           |  568 ++++++
> >  MAINTAINERS                                   |    6 +
> >  drivers/hid/Kconfig                           |    2 +
> >  drivers/hid/Makefile                          |    2 +
> >  drivers/hid/intel-thc-hid/Kconfig             |   42 +
> >  drivers/hid/intel-thc-hid/Makefile            |   22 +
> >  .../intel-quicki2c/pci-quicki2c.c             |  966 ++++++++++
> >  .../intel-quicki2c/quicki2c-dev.h             |  186 ++
> >  .../intel-quicki2c/quicki2c-hid.c             |  166 ++
> >  .../intel-quicki2c/quicki2c-hid.h             |   14 +
> >  .../intel-quicki2c/quicki2c-protocol.c        |  224 +++
> >  .../intel-quicki2c/quicki2c-protocol.h        |   20 +
> >  .../intel-quickspi/pci-quickspi.c             |  987 +++++++++++
> >  .../intel-quickspi/quickspi-dev.h             |  172 ++
> >  .../intel-quickspi/quickspi-hid.c             |  165 ++
> >  .../intel-quickspi/quickspi-hid.h             |   14 +
> >  .../intel-quickspi/quickspi-protocol.c        |  409 +++++
> >  .../intel-quickspi/quickspi-protocol.h        |   25 +
> >  .../intel-thc-hid/intel-thc/intel-thc-dev.c   | 1578 +++++++++++++++++
> >  .../intel-thc-hid/intel-thc/intel-thc-dev.h   |  116 ++
> >  .../intel-thc-hid/intel-thc/intel-thc-dma.c   |  969 ++++++++++
> >  .../intel-thc-hid/intel-thc/intel-thc-dma.h   |  146 ++
> >  .../intel-thc-hid/intel-thc/intel-thc-hw.h    |  881 +++++++++
> >  include/linux/hid-over-i2c.h                  |  117 ++
> >  include/linux/hid-over-spi.h                  |  155 ++
> >  26 files changed, 7953 insertions(+)
> >  create mode 100644 Documentation/hid/intel-thc-hid.rst
> >  create mode 100644 drivers/hid/intel-thc-hid/Kconfig  create mode
> > 100644 drivers/hid/intel-thc-hid/Makefile
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-hid.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-protocol.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quickspi/quickspi-hid.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.h
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> >  create mode 100644
> > drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.h
> >  create mode 100644 drivers/hid/intel-thc-hid/intel-thc/intel-thc-hw.h
> >  create mode 100644 include/linux/hid-over-i2c.h  create mode 100644
> > include/linux/hid-over-spi.h
> >
> > --
> > 2.40.1
>=20
> For the series:
>=20
> Tested on a 'to be announced' Lenovo Lunarlake laptop that uses the THC
> controller and confirmed it worked well. The platform under test is using=
 the
> quicki2c driver.
> Tested touchpad and touchscreen and didn't see any issues.
>=20
> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks Mark for testing, will add your "Tested-by" in next version.

>=20
> Of limited value, as I don't know the hid subsystem well, I did do a code=
 review
> and it looked good to me (only minor notes are typo 'recevie' on patch 6 =
commit
> description and 'calcualte' on patch 7 commit description).
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks for the review, will fix them.

>=20
> Thanks!
> Mark

