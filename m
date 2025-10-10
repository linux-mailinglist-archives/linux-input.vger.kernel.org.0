Return-Path: <linux-input+bounces-15357-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76841BCBBE3
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 07:54:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68C4219E660F
	for <lists+linux-input@lfdr.de>; Fri, 10 Oct 2025 05:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66B91F2B88;
	Fri, 10 Oct 2025 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inBwjisb"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FB1635;
	Fri, 10 Oct 2025 05:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760075682; cv=fail; b=gKfQSxvGE6I9HHlXCwJcqEADsqKnZ6HqGyk5yROgkCDW1ol5iiLiRT5+FEFeBi7bJt05TaC3U3CmLq3F9+RNK/XNRDnYQZai63TOm6QVZFsp+1Fnt4PKZkLINDXxURi2adyxXEqDiZxJt8qk73MIq0b2TkrlyIR+DGWRmJLUYbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760075682; c=relaxed/simple;
	bh=JzKjmGI6HsRJ3gNtP3vmGs0l/3VRlaqrY8HVnYEnq9k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=K5jT25b6nfj5cTvYAkxG3JtWQtNBCV4WD3uz9WKkJcROeteA/Be7R7gtN8LJMYxMnizzbOpqLQIL5j4Y8gHXwYHJH+jhj1cRYXxhNrqmodpclxr0kshK7osCQ6NYkf/AYSKdxLJOH2jqsJyV4eJRGZsEEpG+fI1SB1msVxgeV6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inBwjisb; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760075681; x=1791611681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JzKjmGI6HsRJ3gNtP3vmGs0l/3VRlaqrY8HVnYEnq9k=;
  b=inBwjisbhaE6p6dFDl9uWRKW5AEyy+TlXnEUzfQdFW0i6ETY6BV9hz3M
   xSkryC/lcPiyclS0m8ZqGei3/lElD5g8j8W9tTiuAg9ILqJ2oCyznUUTG
   XzC5GairC3015qZI+dp3yszhHB+Bgy+9Ni58P1GECahjBhbAU//be9Jsz
   KDosrVZ7+yNJYpOF8xBOaUbm4fUwYnuE6p7gCiXgiM8mYiwviqFxeXvS6
   b0V7t8fviUD6T0Ly2UgqAq0Q53/BxyD+T7Fu+WcbyV5jTipr7l84ONHEX
   Fcg4UzueXNdeAN743LDyD5to/rqUoZUTOlxgODmY1wLtiDLx36WdvRCkM
   A==;
X-CSE-ConnectionGUID: olv564KCTZW0xCFYBbkZEg==
X-CSE-MsgGUID: YGPiVbj+Sy6aHjQWa2edPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62194231"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; 
   d="scan'208";a="62194231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:54:40 -0700
X-CSE-ConnectionGUID: TNgOcwpCQZimdvmz7rEWsg==
X-CSE-MsgGUID: CSS7U3gXReWMiJ1Xhp49sg==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 22:54:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:54:40 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 9 Oct 2025 22:54:40 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 9 Oct 2025 22:54:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqBRvIOc0IhKdCee3zNXu9Pb63gv59kV7BoYArr1xgrWLy3aNkfqdCt8iJs+7xDWE9nORIl4jhTpvi4huo6ihlpiJovw+XpGrNiKUrvNv0rG4xAJEl2XNN95VluxlGbEe86LPBaS52JOMUC8YofqoVMYdlYXe8S8U6ibc7wiYD6zP3hCN5WDI/6SWx2Nc6okFIqb+h2onfYxiLdHFG1CBJSwkdx96GPSFnxchf1OtZnmpe9sRPsevEPF/3j9iiiLfkIVSlK9d6vHzrOoALxDZWvCQlkPMtwcXspPpoC/XkQj6nj/r8PhkvVv1hFvoxntJ1AuXZvfYaJRaS2bruKrSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ddvoToaR8S5HDxhu3B/itWTPcFsEiRih0y0XZveiiXk=;
 b=vfxoXR2Q7Pgf4O8abN2pef1u+G9j2daKH3/eWo7H05KEN+oIfULl/5dIbR0MtqEOGniUbN0IcqAoTW/2G//pmjU1G+gdhotlKEscwfaD1v6HYrQM2hJLBCgpb+w6bKL4brXeB3FmO/s7KhTxYithifiBkUkMv8u0RooMOa56ED7MniRmzGHOhZmL2ob5+7Bt3EglrM846svXkWDlOexve+kI3CMWUlBnOxjZvjhf9e+BH8n18lpkZfLyl57SU6P3KrK6T9ncp/SsXmGk51AtdOhh9GJpmkUMCTY5bi2r/OzBXjOGKUgb1b/D/SmDGtb6x8XOjWeC5L+kmEdcy9ogxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Fri, 10 Oct
 2025 05:54:32 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 05:54:32 +0000
From: "Xu, Even" <even.xu@intel.com>
To: "jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>, "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui1"
	<rui1.zhang@intel.com>
Subject: RE: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first
 interrupt from level to edge detection
Thread-Topic: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first
 interrupt from level to edge detection
Thread-Index: AQHcKTRknzMjmEefFUCBps0dqYivFrS7AYkA
Date: Fri, 10 Oct 2025 05:54:32 +0000
Message-ID: <IA1PR11MB6098BBA07A3E02D141AAA0C8F4EFA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250919070939.223954-1-even.xu@intel.com>
In-Reply-To: <20250919070939.223954-1-even.xu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|LV8PR11MB8697:EE_
x-ms-office365-filtering-correlation-id: 1070066b-ef48-472b-5193-08de07c17c1c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?bks4EqmYMA+ibBZdlCaGC1kwQkVHt8ZMsW860F4YWWgCwCtcMVMF5sZ/kJSo?=
 =?us-ascii?Q?DwYtUFprLbTsVfOSra+OxQAJ2vDlGn8znG7vW5dDxFcw10ONFfK2yJ0tw/SW?=
 =?us-ascii?Q?wY8tldik6hsfsMfl/dXjdIQioylzFx6onZUKejp2zO6aZQ+nOO9sgT30wBzm?=
 =?us-ascii?Q?NT/0yH/LbQyclgsDw3nwR5oBL1WM9LNXibBoU6M4m4nKZIacFjiJikLSg6pV?=
 =?us-ascii?Q?XGNFwwupu5ELSfz7vuKCKDyv34SetfZBWLfUnztjZ9sCgxvr23+nZzqyvLz+?=
 =?us-ascii?Q?2TM01E+xZepwsY/qNRCLoTULjqczQCGo7QXWEIx1fB+13neRkDbL+UNo+tbF?=
 =?us-ascii?Q?gAKLXID1Q2+LdO1pZAawK+wLRNz7ndLduGOuYRCHB+SydvNLh77C38WX6IB4?=
 =?us-ascii?Q?kEhgIiqEkFr1Mj/o3eT0a9RIEd0VV7c7/e2m3MGTfmVXP+dpy6bPxsNCER4Q?=
 =?us-ascii?Q?csBaiLza4+aXrdXimxY6kVAVZ5A6V7C+NrDzbvaZhAST3vbzLet3ZjGRbfzJ?=
 =?us-ascii?Q?558CXwgimzibjFn2/E0hZm2H9jaYM3LdxCNj42Sz7v48PJ7szPwuHcYJrpaV?=
 =?us-ascii?Q?vE3F8ndRzZG4g+/2F/XFtM6m/0aO/V+msWI2u9MqwSeZayr+Tjg2tCTvh3u9?=
 =?us-ascii?Q?4h4as5UXoSC8ZTPbHNilyrGqi++ZWFsxVjlDALWPLVcw/lIu2PvPvGwYYW7c?=
 =?us-ascii?Q?N6k9lwODV8IYL7uGswtdqmlQzfJyQV8SvK5Qv2gtP3sK+h2k4GIw0BWR2/9U?=
 =?us-ascii?Q?SG6vtEhFFvZbBVhYVe11rlwESXK+il+JyG3oU1yFk+evoHg+pnEi0msigOiU?=
 =?us-ascii?Q?TKFcg/O7XRCAGdCQ8gVC8PLFYOgV+kzeXt3uYOd2h5H7TLua2ajuL/MOtyly?=
 =?us-ascii?Q?0aR3XQUg7c1sjSF6Or6v3SxTzgUw2tJuAsONjTyo7vkuZiSOkVJiDmJ84D6g?=
 =?us-ascii?Q?WfNkF5s2NhNImJ1oBNfF43PtWrDDdCMIw3HeEThM/hbqNw4TKB8vtFIuz6C/?=
 =?us-ascii?Q?RhLZ/zAKr5LxNvInvMJN6CugqJDKvPk7uZMFJ0HPMALU6mG5JjVcxM8MbuMu?=
 =?us-ascii?Q?ePIPkLeziGQqrA/H7I91NUvc5IPJafl/koBeHaVVeOo37hlcCt26gtH45OWh?=
 =?us-ascii?Q?z7wpy13rKNc1HQ6+dSQtZe0Vj69+Y3AFM4yAUVHpB4FiY+PxsBY0P5o5gSCH?=
 =?us-ascii?Q?r6OkEJFGVgtCfMEpisJ+mgvGwQOwDs0Y5c/NOfWGKOtr9/Negjaoc5aR/+lc?=
 =?us-ascii?Q?x6mabi0/3Yu4cFREKbuXyQ+ofGaQ4UDkav1YQ8/8M7u900fQghpj2B4PC09r?=
 =?us-ascii?Q?japU1qMhcSIBYx/41crNOUpvDgdIyNlX7xtflY7oINsUBzPaNbTa/MqWBh6F?=
 =?us-ascii?Q?g6G6cAlyqwfi5DNNhlNncb+MDCRgHsanz+WNAmZ1+hfMGJpZRiN7rU41JclL?=
 =?us-ascii?Q?nlp3AXbZvWTsgchr9AND7T1Kp9Z5LRoqC3HKPJn3gsdqAjaQGBk6xp2cABIP?=
 =?us-ascii?Q?Pal3WGGinIruwC/gEmQ2zNWHXEzlje5Ukzak?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?19bENYzlS0TZ7e8LndEhLw185OJUkf+0km6QxDXSsPFFdkZmdovFwczLnH+6?=
 =?us-ascii?Q?RRMMDRvf6a8xTJWRARaym7VRidRGlDsJ19mPkI3BMEBFAPeJ1UG3inno4Kt8?=
 =?us-ascii?Q?ay8oS57PAPbBkAtbK9s5YrpTXyEgOJ2gsAQgW92pDDH5c7u+0c2bgoB8R4LL?=
 =?us-ascii?Q?FG3Lm2boaQ6TNpJtIqLfHEB1hsCO/3nYB/lTaxUTnkBYDjZi2ZnSEhAY8SJb?=
 =?us-ascii?Q?kk+U9Zcc7vBR/o+B8+9NxpQTuXL3n3s1CzMMkXVFOhBuE15IU8xaLJeFFhRQ?=
 =?us-ascii?Q?tVRm3jjaKGrQmA3mgyNtnYvH7r0KzGkEUmtdtszWRdVc1eQ0Ez5PwLksbC4M?=
 =?us-ascii?Q?3LD2Lm+hmibahxvNfzCMcOgoEpHi/eJpoAiiFxck0pPyNCVcJIZc32NlsWXL?=
 =?us-ascii?Q?onW9qMz4ywp81plWr6mIgluue3ER718Fx0kpiDrCY0ZSNxK9gWYuMHt4gTdy?=
 =?us-ascii?Q?nBCVMdm5ULUMty2Way3eCrr62u94q35JKbohgRAUQLoE9kwIfPPKQdwG/sRM?=
 =?us-ascii?Q?Q+co4bBpUxWJsWGJJKijba2aQQGdUBdvZuBUkqRCOz8jEGxtZUuXc4y44Hfm?=
 =?us-ascii?Q?adk+HtJB4AxgXs8UFMTxwro0E0LLoO34vH21rJ1N3e9ZS4U8WFaClKC8urVl?=
 =?us-ascii?Q?d1hnfqr+M068Ui8xnaDR4NyHXzrxzI75AC6oiOrRYTWmvsbVa4RMhWZ5qiqd?=
 =?us-ascii?Q?au3pqrlX1ireXUCaXDPmbPju3vOYTIcXHrRzIWfqt1b/LCAiqFGV+mJKWwlh?=
 =?us-ascii?Q?Dgn41wSzbUHJ/SYRFjZTfsu/Qq6cdUmDNstGOze0eJSFW9RXZtc0+AbJC/ts?=
 =?us-ascii?Q?NsS6vGtnCmExJ17J6I10tgXIxuFduLFNkcuo+0pPFF2Zy2jxrzZUQgT2S95N?=
 =?us-ascii?Q?elyMjuJqotbkzI+Yx689HlPHuI7QsYgm/hzbkttyzdYdVB3KTZbMqiBfkNLv?=
 =?us-ascii?Q?EGHJ+4bhgADFBYSbpoxFH3/d7IouUvPbAf/Vhw8ZHmrz6hOWmPc9lLCRgk60?=
 =?us-ascii?Q?jNt3d9k86BskugNgHR82IfRjBfzf/+Lij/ee0E24TEHt0vKYQS/o2wrQjulV?=
 =?us-ascii?Q?oN3Y8u4ciWYVD0gML1HxyUakPb8pwWsI3grhZG00n/4FzlXkTz8m8pYSm/9q?=
 =?us-ascii?Q?6Vwv0B80ycRwHbcBkEialICqJRtoFnL6xb3bOPaOsCkyUcKnZoiZ9QpIBklT?=
 =?us-ascii?Q?Ax7MPZ2JmEEd9zkyBEbyNTaL5SgUdsySqwlqvCq+55WqcA/marRq7nmnLs6V?=
 =?us-ascii?Q?cGlJjNKDSxQ/3AeF1tA6zWPa64hvX63IZY7wyNMnxz659+UzAsZKkASXLDIs?=
 =?us-ascii?Q?sv4M5T76YELfEwR12BUvBbMj+KPdVGlPqaVFEBODvyCw/NCeSU/w77OEO/Gx?=
 =?us-ascii?Q?k0pViQcEpuWePNQaZ53soapJcwF/sTYnDi6Ll0fwZ75BhykOB88WlPCbZX9/?=
 =?us-ascii?Q?7DA3pU8Pn+e0d8vS8Pyotk3/lkUf4IV63zQy57BYihqVx7iBNst+U+sLyAeK?=
 =?us-ascii?Q?HG0J+wr7ist7Tj082SCENrzWT7jOtg63r4kbr102mxqN3t81dbSanRFFlt/h?=
 =?us-ascii?Q?tX0BZtxFGZjEKc0yUcQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1070066b-ef48-472b-5193-08de07c17c1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2025 05:54:32.4896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +xe6+CNJsH6SXtKxwobivdpl+e/lg2K/EvJQ8XSnkFI1qXmQCu2iySc2MerdE4lL+1hoSpKkdNaw5s+ozjklDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8697
X-OriginatorOrg: intel.com

Hi, Jiri,

This patch was in review list for 3 weeks without any review comments, woul=
d you help merge it?
Thanks!

Best Regards,
Even Xu

> -----Original Message-----
> From: Xu, Even <even.xu@intel.com>
> Sent: Friday, September 19, 2025 3:10 PM
> To: jikos@kernel.org; bentiss@kernel.org; srinivas.pandruvada@linux.intel=
.com
> Cc: linux-input@vger.kernel.org; linux-kernel@vger.kernel.org; Xu, Even
> <even.xu@intel.com>; Zhang, Rui1 <rui1.zhang@intel.com>
> Subject: [PATCH] Hid: Intel-thc-hid: Intel-quickspi: switch first interru=
pt from level
> to edge detection
>=20
> The original implementation used level detection for the first interrupt =
after
> device reset to avoid potential interrupt line noise and missed interrupt=
s during
> the initialization phase. However, this approach introduced unintended si=
de
> effects when tested with certain touch panels,
> including:
>  - Delayed hardware interrupt response
>  - Multiple spurious interrupt triggers
>=20
> Switching back to edge detection for the first interrupt resolves these i=
ssues while
> maintaining reliable interrupt handling.
>=20
> Extensive testing across multiple platforms with touch panels from variou=
s
> vendors confirms this change introduces no regressions.
>=20
> Fixes: 9d8d51735a3a ("HID: intel-thc-hid: intel-quickspi: Add HIDSPI prot=
ocol
> implementation")
> Tested-by: Rui Zhang <rui1.zhang@intel.com>
> Signed-off-by: Even Xu <even.xu@intel.com>
> ---
>  drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> index e6ba2ddcc9cb..16f780bc879b 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c
> @@ -280,8 +280,7 @@ int reset_tic(struct quickspi_device *qsdev)
>=20
>  	qsdev->reset_ack =3D false;
>=20
> -	/* First interrupt uses level trigger to avoid missing interrupt */
> -	thc_int_trigger_type_select(qsdev->thc_hw, false);
> +	thc_int_trigger_type_select(qsdev->thc_hw, true);
>=20
>  	ret =3D acpi_tic_reset(qsdev);
>  	if (ret)
> --
> 2.40.1


