Return-Path: <linux-input+bounces-13815-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DD0B1AC59
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 04:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91824189A32E
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 02:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1ADA1DA21;
	Tue,  5 Aug 2025 02:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZcyLXjN6"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A38919D092;
	Tue,  5 Aug 2025 02:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754360115; cv=fail; b=L92fy+9f+vUzlSAmzvbvBHEtqq4RkLY9fXSrtjpAXip1w5kc6M67wGuKKgbmAOIZgSTHKaEQPbGmlKMLd5ixRUVeqgQ30Fora4DtW2WyTA3iBfi9nDqE/ilFddqaj2C0E9lWLaP4AffCtilFYK7N9iNhpSKpqem4FNS8nRRSqII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754360115; c=relaxed/simple;
	bh=nLZQTmW51N7IovolIiMFvctbaOZMY3bqKCI1fGdALqg=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XthjDtzvV/odljVWFKHQmIHwoJIxyV1j8pGwq9RQqbYszveXmhPvf/PmBKpThy2oNeR9cs2gPOZMzV9gUxfKj6KJFKjtGLxU338vwaHa4oMsv+ILeFdbv9Ztnlkcj9f0BWlYzEQBIbtYl3tOegW0b1Woxhe2zT4COgB53S/ByZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZcyLXjN6; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754360114; x=1785896114;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=nLZQTmW51N7IovolIiMFvctbaOZMY3bqKCI1fGdALqg=;
  b=ZcyLXjN6QYv6NlT/cHBOUhYxar7dn2fS5j1Zllpj2xHMUPkJHUUPEC97
   3z6bAKKjUTMdvpHfKzwIMGyuE1HI6ZTdIZ62MgqsLw1hJ51kpCx4ig4Sh
   O6tgaLDaG1qljZdfoVE+MPjQTIKSKM3xZhPzKvejQuo/vig/fBfRR0hI6
   j52pNCm/alo52hBI84fAm6hsJg7AchPRZiH7i/cFY7P+mjsWViyG5yIf3
   CG0lZlnkRqPjAWXcgJLPlZ7cHd3PfsFNfOv6dx+p26vTRAl+85WAUKeCA
   777Sjvk7tFw7i2VcMPH7cvQyiyqHhQbAnEuJgK4FBi/2P+QuArhL+b8qV
   A==;
X-CSE-ConnectionGUID: FvU0gHoqTX2MhGzs4mwHZw==
X-CSE-MsgGUID: 3vI/B2OrTvy8bX+kkl65WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="74219064"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="74219064"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 19:15:13 -0700
X-CSE-ConnectionGUID: LcmdOINsTT2CnQZXz/Xy0A==
X-CSE-MsgGUID: QOiCdsDFReCyqi1o9aXbYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; 
   d="scan'208";a="195163350"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 19:15:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 19:15:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 19:15:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 19:15:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B7LedsFyqI3qeNz6JIOlsVzDQ1qdWMvE/ng8NKGlnezu2a19odIpPSOgawrZJojVQsA9ZH99LnqyA+UlhjYsNoi6IIySg6zcPLB4X2mhC+JCcjF5Pq7cswtksem28r0Boam5gPZ+hM0mgoVELPm5C9Okjh8zJEgTbJ70WdtfzFUc7hyPs/Av3QjLXTCTxrlEzysSYNGWY9n+vLES1r17+OgtRuZV/YsOB4nrjsKEtOsQ8GPIfFUnUKaAh6/OO/MzCyD49ojA8YC50q5v1E628UkhEijzDkB/prlxvFK2QqfSEX6Ug6gpW29lTyrefj3qW2/eya9LdEz5iTUuA3g1fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+wtaZ6Q/6JupSiF3Nz76saDQ/Mco+ci++NAemi2cVc=;
 b=qswGuPm9pEKhtCD8SUmKLWaGeIrNAJR4W02wQIs1a900GRF0xnFtlNuJf0UaN+s58qRwDiqoeNxp61VywE226jGxXJTP1WFyrIIk5hTQdR/2twh2SrCqU6NrfC7Mr/MaQFFatc1+epPEyfuF8DRt3EcFUdX52FJvdY9ycoJqjtrx4RArSV1euGTxH1fCxjUNGU8wP6agG+o+oGpzJSKGAFStqA6ZrsUWJKenf4XF6CebA7YkiikMEGz4epvJ8BSRAeSFScvjAftMY4WVsTV9VE6seseCqYUgtGhhNQeMgfEEdFo18gHFr1etQnP8zyots51GN82swwyF6xnmvgHvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Tue, 5 Aug
 2025 02:15:07 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 02:15:07 +0000
From: "Xu, Even" <even.xu@intel.com>
To: "Aaron, Ma" <aaron.ma@canonical.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Aaron, Ma" <aaron.ma@canonical.com>
Subject: RE: [PATCH 2/2] HID: intel-thc-hid: intel-thc: Fix incorrect pointer
 arithmetic in I2C regs save
Thread-Topic: [PATCH 2/2] HID: intel-thc-hid: intel-thc: Fix incorrect pointer
 arithmetic in I2C regs save
Thread-Index: AQHcBEP6/dmRoFhIJUmUT2myOWQNXLRTVOLg
Date: Tue, 5 Aug 2025 02:15:07 +0000
Message-ID: <IA1PR11MB60982E414B3B5226331C018BF422A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250803065726.2895470-1-aaron.ma@canonical.com>
 <20250803065726.2895470-2-aaron.ma@canonical.com>
In-Reply-To: <20250803065726.2895470-2-aaron.ma@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|IA1PR11MB8245:EE_
x-ms-office365-filtering-correlation-id: 89228245-eb84-4ef9-8b64-08ddd3c5e600
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|921020|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sAdPDCxa0styF6PFWeoB24ybQHOcYOgUZLq4RZICmZ0h/gAfqypU7Wb19D98?=
 =?us-ascii?Q?8l69ZYHBNYQhLXO3U9f3JqAQk5LeoX6rHDlwFmTINDF+IjCoKAdJVPKx9/sO?=
 =?us-ascii?Q?yLTqVrB1n5WlAdjw4RNL+wlYyTbGwKiXD7Y4TXUXUM9WdiBwgR0kCqJx3YwP?=
 =?us-ascii?Q?9uhgBttCDfNsf7N9xiO2L/6ni3E12hYq45I8SFR7cHJA7EHSN/o659pvHDY1?=
 =?us-ascii?Q?cs84lqzLUCsVAGqviqslZEJaRpWdijX1Ra6NtfHBf5XtAn2KT4+ut/c7OniS?=
 =?us-ascii?Q?1ocLfTgQhs5XWemEkUyU0Kksn01fvMjK98tfJb/fi8fXhqDA5A7MsN7GThQO?=
 =?us-ascii?Q?jUghdNM/gcn4F02pZzROyu0XDs/uNCxbdbBwAdhGNJ4m4U5hrapiCp6mVPiS?=
 =?us-ascii?Q?DBMrYI8cPq/C+NxBtHmna+XuVgctZ47wr55kQfIGKFe6ST8WpfT/y54S5peZ?=
 =?us-ascii?Q?yQDj1NcyLe59kzQjjxIwN7onwimBJwytS0heqPrpRQGE61DvwN+uc2XrXG2y?=
 =?us-ascii?Q?2fGZai0CrhUh2eAMEpIZYpHRsn0B3LZ35EhQx0A0xEWV2O6ygHVVlPWTAm3N?=
 =?us-ascii?Q?7CLWku3iS4gllV00VMww7YEYFdnqQWhLhklbGyHgV4Zry++i3MLRpZqXeaxN?=
 =?us-ascii?Q?3pOBerHxLK8MLImB6a6wpv7j4qj2UEneR2giAVAO0GhKjDluZSeG3wP1exYm?=
 =?us-ascii?Q?Pdn6SAOvMzDjpPed+iPw5ndZKEMiTnBgG6NyiE0zGWc66aI98IFqOoaJljiy?=
 =?us-ascii?Q?tH1K7AG35nNlSzEMlVMOxT2UCIiXuS80TfhWuZaQAWEn0y78uBDPttVFxsT+?=
 =?us-ascii?Q?gTmJxgRky5CTRBwnkZEnGWIQks9oKkUZR5uFnQ9iu9C0qdhQbYoqfdB0y3WF?=
 =?us-ascii?Q?9OGij/y2q5YY/tl7VkYpFkPj3ZqhdFGfEGBxpPSYONtSJhCbJlrr0ljU2k6J?=
 =?us-ascii?Q?tXphdTF36mThQBcZJOm8h38cjCGtS355vN3dpbnu7OnvAGdJUN3ktZqMHbRf?=
 =?us-ascii?Q?I2OPMqxeSg3eJMfw43wzI9Zsv+rIJLZspsSPW+dBSKvYbQI0jSBMdyDNkgkw?=
 =?us-ascii?Q?mezIcCz6AqGbHbsZQ4hjCHeOAkrtcMnids/flOtppl/E4edQOq0hV0hYrvSb?=
 =?us-ascii?Q?f/NEiPeFX+eN1fuP9tvg8QKlC9hw9hsunAjfuJVlj/YDmId/oMU9sh1P1voV?=
 =?us-ascii?Q?u+ZVT8BjisLh0mkjv6Xez7BrJoE7Y+VCYP7QXa3R1z01qRHhnW3ALdAxkyp9?=
 =?us-ascii?Q?2jeVXXe83T3CxEjytyUtTt7yMhF6Z1L/J6kuERHgLvUegEhmla9kWf44fBKG?=
 =?us-ascii?Q?3nt79dhpbyy7mcFXynEa7S6aH08rYiB+OC1i8OHAeUOj+r+TV8XgDxpTuEq4?=
 =?us-ascii?Q?0OVgvDekpbA7VPIMKrJH4OsErv+zqXLPqWUGjPjg39Bxt1C0BnWtGiR6IQ2a?=
 =?us-ascii?Q?LLTWKOlkF4xJ/oQslqoYeYRn4AAc6SiO9+exTxvH496lFxvXOZYVs8rLWXnu?=
 =?us-ascii?Q?BDrPGM0bnok/Rvc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iRcDdXuJ54+zIgQVag3eSsz7GlzoXhVFo6LSiQ2r7yJ6ZLhgv7m6P7Mz8g0l?=
 =?us-ascii?Q?TlxtIkhXFlOnDjNBwmHD+OUxrHqDETr1YoTtClJi6K2e7J3JjDwL8tkVClKK?=
 =?us-ascii?Q?DnPN0UJeBs7+/Z4JCvF8CTU8kzG6IrxnDgteK9ShD3raUfsnalXxlGOKmvPb?=
 =?us-ascii?Q?0YFelTR4+PHNmSkyn6Lan9UPvusFjYAMULcORG3tX4LniXTcyJUb3MtV3CA6?=
 =?us-ascii?Q?YE6+LISLGeZ9h3H/axgbv9f6+TEaRJpy1zvIQ9liOfvuY/0sJjS9uObRwYir?=
 =?us-ascii?Q?YTiYdOzASd2v6Cu85lacLj652e9aZ491s8CEZkK4CjSD0jLSTmwylgZf3sln?=
 =?us-ascii?Q?qEMT4YHg8Iz7HCL+/7oHYkq4zhGatNiQvv4oBS/5E5gtAlzjzqTM1lPCw71Q?=
 =?us-ascii?Q?MU/pn2VSJzx38CXw6gj+goRNUgcpa/bNox6VYVzCIglPJt2jhwdnNw2y7t6w?=
 =?us-ascii?Q?diObsXxeoGE2WRZQ71bkUVjeV712TsBsnX9AA4cFjrpOU7AGJ/p2cXN6bpqp?=
 =?us-ascii?Q?kproCAEdXsFJNXM9XJp6JNkRK20lG6mpktoxW89/hMhtoo5g/ErDZ3XBy94y?=
 =?us-ascii?Q?dw879z6wSRPBEz5F1Dy3FlJ7m7he9m2gMpJmSN582ASeCUCWnmXlWs2/yIb5?=
 =?us-ascii?Q?5AO0Exn6BUIl2PdCG+GVaO0cib2s2/te0rPHg7jC7/c4ewG9tcbdVINldg7G?=
 =?us-ascii?Q?PjiSv6LQM2wYkXEJRYpyccmu1v/NxajlU6C3WpNV/WBIRyPrjtB4R1wwPXYO?=
 =?us-ascii?Q?f0WOz7mWVilKdej/D+op708bJZEK5IHVNuZpY5XQfgowevQOalNcagrJr63d?=
 =?us-ascii?Q?V+X1D3XE9Jp0O9FCiNiXJqkuGJMxJfkmX5dqM5DWsqmEBFLNwnyu4kICP3XD?=
 =?us-ascii?Q?LqHM3E8ro5cZ7Hx7bcqnjCE2J0gBRjPWgufdLSC0oWcxAbxNfs327iEyls4F?=
 =?us-ascii?Q?/lEuFirgeBebAnkX8psZLo6CSOpTbKFoi9WPK92Z3fAUNjGjzMMnVf4hECOG?=
 =?us-ascii?Q?RtakCjkwwLbi1gRr755szRszqnzT4cWCXTRtqaIox82NgtDbjSlylUYJNanG?=
 =?us-ascii?Q?93ECwZ/BSCHaCdNerbgLLk6mgNWC+Jn0LDQn3ppaF60fC/VfUUpIHPaZc2xx?=
 =?us-ascii?Q?kY27tsK5tgvr0zizolS3MLFUZp9FPHAtQq3D6/9tEktN67h9ctttJqzdQikh?=
 =?us-ascii?Q?FHfriREpe83KF51eYDbKz236cDWli+gVK67/iGURdt8RnC5kIDMw/oFRHRPw?=
 =?us-ascii?Q?oFMdzspfap9M5b2EStzWLvfT+Zhecv6h6ccIiptdp4q72CVWT7095Am04fuB?=
 =?us-ascii?Q?6q3cAKxGjSpe1BOkypiR/lIZyIMZNdJoGhxuj++ijLz14Jllz79LI+5Qy9Z9?=
 =?us-ascii?Q?uQqgQCgdVMBX/38cWfIoBWWURWCGrD0yH/kdbeKWD3r2lxCiT+E0WXYtSzvg?=
 =?us-ascii?Q?52sJ7+u1eTuigMo3lQxM9FH5m+I1ZSW+FaGztVzbP1UfQNhMb380Igtkmz+3?=
 =?us-ascii?Q?/NNC3qh7+Kr7cjeUXJLqPFlMjbRXeB1+BFvQ0wnDmbiatqdJjPJihB2CbkQZ?=
 =?us-ascii?Q?J+2wKHaFAkpGtNWlKPQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 89228245-eb84-4ef9-8b64-08ddd3c5e600
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2025 02:15:07.7266
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uh+hWFW6EmstrsRkebzHmGxy7xQPkL2+k14tN0pje7ENZWR2+mWbvov+kdaslHWNbSycq/vZI468wkjFfQrjZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Aaron Ma <aaron.ma@canonical.com>
> Sent: Sunday, August 3, 2025 2:57 PM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org; Aaron, Ma <aaron.ma@canonical.com>
> Subject: [PATCH 2/2] HID: intel-thc-hid: intel-thc: Fix incorrect pointer=
 arithmetic
> in I2C regs save
>=20
> Improper use of secondary pointer (&dev->i2c_subip_regs) caused kernel cr=
ash
> and out-of-bounds error:
>=20
>  BUG: KASAN: slab-out-of-bounds in _regmap_bulk_read+0x449/0x510  Write o=
f
> size 4 at addr ffff888136005dc0 by task kworker/u33:5/5107
>=20
>  CPU: 3 UID: 0 PID: 5107 Comm: kworker/u33:5 Not tainted 6.16.0+ #3
> PREEMPT(voluntary)
>  Workqueue: async async_run_entry_fn
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x76/0xa0
>   print_report+0xd1/0x660
>   ? __pfx__raw_spin_lock_irqsave+0x10/0x10
>   ? kasan_complete_mode_report_info+0x26/0x200
>   kasan_report+0xe1/0x120
>   ? _regmap_bulk_read+0x449/0x510
>   ? _regmap_bulk_read+0x449/0x510
>   __asan_report_store4_noabort+0x17/0x30
>   _regmap_bulk_read+0x449/0x510
>   ? __pfx__regmap_bulk_read+0x10/0x10
>   regmap_bulk_read+0x270/0x3d0
>   pio_complete+0x1ee/0x2c0 [intel_thc]
>   ? __pfx_pio_complete+0x10/0x10 [intel_thc]
>   ? __pfx_pio_wait+0x10/0x10 [intel_thc]
>   ? regmap_update_bits_base+0x13b/0x1f0
>   thc_i2c_subip_pio_read+0x117/0x270 [intel_thc]
>   thc_i2c_subip_regs_save+0xc2/0x140 [intel_thc]
>   ? __pfx_thc_i2c_subip_regs_save+0x10/0x10 [intel_thc] [...]  The buggy =
address
> belongs to the object at ffff888136005d00
>   which belongs to the cache kmalloc-rnd-12-192 of size 192  The buggy ad=
dress is
> located 0 bytes to the right of
>   allocated 192-byte region [ffff888136005d00, ffff888136005dc0)
>=20
> Replaced with direct array indexing (&dev->i2c_subip_regs[i]) to ensure s=
afe
> memory access.
>=20
> Fixes: 4228966def884 ("HID: intel-thc-hid: intel-thc: Add THC I2C config
> interfaces")
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/driver=
s/hid/intel-
> thc-hid/intel-thc/intel-thc-dev.c
> index c105df7f6c873..4698722e0d0a6 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> @@ -1539,7 +1539,7 @@ int thc_i2c_subip_regs_save(struct thc_device *dev)
>=20
>  	for (int i =3D 0; i < ARRAY_SIZE(i2c_subip_regs); i++) {
>  		ret =3D thc_i2c_subip_pio_read(dev, i2c_subip_regs[i],
> -					     &read_size, (u32 *)&dev-
> >i2c_subip_regs + i);
> +					     &read_size, &dev-
> >i2c_subip_regs[i]);
>  		if (ret < 0)
>  			return ret;
>  	}
> @@ -1562,7 +1562,7 @@ int thc_i2c_subip_regs_restore(struct thc_device
> *dev)
>=20
>  	for (int i =3D 0; i < ARRAY_SIZE(i2c_subip_regs); i++) {
>  		ret =3D thc_i2c_subip_pio_write(dev, i2c_subip_regs[i],
> -					      write_size, (u32 *)&dev-
> >i2c_subip_regs + i);
> +					      write_size, &dev-
> >i2c_subip_regs[i]);
>  		if (ret < 0)
>  			return ret;
>  	}

Thanks for the fix!

Reviewed-by: Even Xu <even.xu@intel.com>
Tested-by: Even Xu <even.xu@intel.com>

> --
> 2.43.0


