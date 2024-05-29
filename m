Return-Path: <linux-input+bounces-3933-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 181848D2DC3
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 09:05:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32B771C21060
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 07:05:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C0715FD1A;
	Wed, 29 May 2024 07:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYrr48ES"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318BA15B14B;
	Wed, 29 May 2024 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716966334; cv=fail; b=CXADFMLg65hccjZj3JQcNKIH3xKubT53VOS+D4bu/fopiKnHVm+50AYdAqj2rwUfRfJtks3rIU9gKiNlSuqaJzUfhZRTtZA0x1eDhNUoyU3/rbkjp+thp/v/dlqJvKmsA2aPaKxj7rWAh6yqAAtVYD12qQlk7hvZDl5FbJHc7LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716966334; c=relaxed/simple;
	bh=dUlUXv/hGrAQLXeOAaUUh0hERCMZuI1wcbDyd/0RSSg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GyQbdLCXoUl3rW+9HXa3okbc2jxO1w0aDJAuavat7JddLUWx828VwJ46nD3AUza/yEWlU+Mp4Z4XUyxkAf14YZVrtoFnkHcQNFClyvelb90K53W1asDsFm0QIjJfYkMcd2BJ14nFHxaBD2Xc3JPNCwMf/W4saQUiKIrUB6U8pIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYrr48ES; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716966332; x=1748502332;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dUlUXv/hGrAQLXeOAaUUh0hERCMZuI1wcbDyd/0RSSg=;
  b=LYrr48ESNDtMPCDe0FwqOJ5VQ7cyfIVLXOJhDHWpoY3XabHfMCWZjWTs
   miioXdqP6dbz1h7HBPb0QSKfk18f4Af91F30ulq/Du6QWR91yzfzjxPu/
   ocLSPTzuhc3ebrV+QpZe0T0Jd+iXKZEFHkbg0EPfgtkgzUaUgJBs1yc+w
   CYVfkDzdF9hkX1uJJooSw/vgBa5Oq33RMDPlKbVJimXvPj2co4mp0QAJ3
   iRqCMT2gwPlLg8sHfJr8p2KHONHJby+I+AX5DaQgc8VJi9uMMMA6NuE7q
   oc15lG31eeMZSjWxYcYJhxi9fS7aEVRRBK1UBgAgn//bUvQrEmGnq4e/5
   A==;
X-CSE-ConnectionGUID: MLS0dwQ5SE6K3DPAaluizQ==
X-CSE-MsgGUID: a2e3RFjkRu6z983sJFt/aA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24765013"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="24765013"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 00:05:31 -0700
X-CSE-ConnectionGUID: OqNPNng+Sq2N+U/d9ded3w==
X-CSE-MsgGUID: lAhiBaM6SOSY0TE537XAPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="39860361"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 May 2024 00:05:31 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 29 May 2024 00:05:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 29 May 2024 00:05:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 May 2024 00:05:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bpjxig9S8MGcvCsYm5Y5cmQxrrb60CEgk2nCP5rrIO0+3E5c70KjeQs6nGDDsx8q4oXYFKdg8PNc6BueUL1Om046JGfXVag+PtM2EqFUEKNlUihB+QHludULOOwQ0d+fuTuaxf3ArQgyr/GiF+Qx2aN4MOAaZjBN5qJ7BBcZDtXlkg1vtirEtTRlUc/j9AQrjxH8bt0dznK4KQ5syD2NrtxKRCFCOWJyxpYAcZOpkqYFJFbc4tTOFWpYIf/TkUURpeiKUxHaLqcSiuY6z59YuqKuW4qSogVmvVDvpxyIc7PSgRffTtrzrD80rUwiRvEu2h/FywCRJlLhlQ9fh5JBUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8B7DcqwJBPTom+wt/Dz7Bv8SNbWSZJTaN0HPLCgRNzQ=;
 b=lX4F2jmodDgH1Z1+dWCYB0RaAnUqwvSAYHYmaEt15vEqWUN31Z6bpZPL7rqZwT6+moKrARgQ/nt0Aksn0pmXqEAwgjQUpHgeJJtuVZ35ywzqMuX8Ztmy42RRtyqd3hCzc+kYzKY6Om+k8M27M+gjr8O9labDM6C1VATzXV2vFt8pwfmBBeSo2gKRtnEatjQRtLCmb/Ndijse1ynw0SS0QulVHwAcBpH6wgUzzQV1BYVKl3URdLjimzwCTKrZgiJ9ddA1Dvs9AfySq2LkOlF77YsPz5AP2bX3n7douc+Py5XCAC3ljZfXHEsKaOJb8FHGXh98QjZ/jQIbpd41bXmNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 PH0PR11MB5127.namprd11.prod.outlook.com (2603:10b6:510:3c::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Wed, 29 May 2024 07:05:28 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 07:05:28 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Thread-Topic: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
Thread-Index: AQHasPZdLbKTLNL+i0Gcu6hPPaUAiLGtyQNA
Date: Wed, 29 May 2024 07:05:28 +0000
Message-ID: <DM4PR11MB59959F1AE3E9BDA36642000B93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
 <20240528115802.3122955-2-arnd@kernel.org>
In-Reply-To: <20240528115802.3122955-2-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|PH0PR11MB5127:EE_
x-ms-office365-filtering-correlation-id: f331904e-3b9e-41d7-b6b9-08dc7fadb897
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?zgzyZZso0f+ewHIL5d9btrV+wzQjS+MFDb3wcbEZiarh5M1+XNWcQ4C1fAqB?=
 =?us-ascii?Q?kkmXYdfL4hlVHuW+zjjcn5gGr9vvEwLA8aE9mhgrQnD7CMYzArEGS5K8o99X?=
 =?us-ascii?Q?R0wJ3ghPZXli/M7ckpP4Oh+W6zTW96Drz3w3iFVt7ATBI3ECe9yRF27By8LK?=
 =?us-ascii?Q?+Mmy+u3ri7FFj58y5XOh9MiyBum601fi6X7GTSASLKLzbfjUjyvsqXLAiqpc?=
 =?us-ascii?Q?jMOdackmZMzjqBQxdiyOAO+tyRwfpP9VVMk9c94VJXXgyOvZ1SWLHH5hh52r?=
 =?us-ascii?Q?gfKhGY7OF1KaTTY2YxMkvU8l8wsM337OlrVz3HPu66uw0EjgglbL3vSo20BI?=
 =?us-ascii?Q?Usimuxd8lCuHbd6BPoO4w6rZFu7Pb0hzC82rzzC/TipgMM30bF5rv1J+yLbG?=
 =?us-ascii?Q?GTBeOMA1p+sYuByCh5H9dPtaNN5w1izL6iG3iNxBOyDICSCeKe6Yp+YxJStu?=
 =?us-ascii?Q?Qws9Wate5ZM71QMV7zyYrHODAkRlQw5zTkyNuuWI6cEv2V/MNHaBNUqaYx/X?=
 =?us-ascii?Q?FvjjkA+x4utGB7EZxbBJo98WRRnxiCfi2YfjQcCtO74r4/j5IVstZZRv5dCe?=
 =?us-ascii?Q?UgHxSf7DFHwWq/uY5Kb5CwUyF3WR6dy8ktzyTV3GdwQpRfJ+O7ngf4QkQ+mn?=
 =?us-ascii?Q?z5Ujn8H3iem3HhttWRlCz+YbzsqK+RVPVG6ChC2DQoJEAJmG9IPhFMtEHp/h?=
 =?us-ascii?Q?CX3as7DRsf6PxivW+73quzr//ToydI4LEY70UzD8kWCcrb4ibgOWGN5oZmOi?=
 =?us-ascii?Q?HiPcjsBJ2dlIttKnvUSpbRoPjdpocbmNQLeLfRd7TqqS6LFGVVcw5oeYVkW/?=
 =?us-ascii?Q?cM5+hKOKhQENHopU7iKy2ZBS/XVTwmFGvAniWZOdBEP/A3XIYCMEQrqIP/Br?=
 =?us-ascii?Q?KJuIOe7O1hsL/89rF0FycClulSSpA/tnXV7J2wuoyF/Wor7ohh3b8gEGsHqg?=
 =?us-ascii?Q?Zr3IB/0mCi2RwVMDqaeLWopOvqmi1i3bGqPlNybu/2h9MGW0SMcV79z5lpCv?=
 =?us-ascii?Q?9uher1gwlk6Ue+d4DOLdYGrt8Dp8wC/dI19tlOezArKzy45A6zEA3KDmH42m?=
 =?us-ascii?Q?JEqQ9vk03hUidenknF8TRQ2DEKT6iGFzScyU9OWaS1297v5EAhfMXGmUhEga?=
 =?us-ascii?Q?4oUypXAvwgsNHE7JdPWdJC98Hh34ja9ndYCX9Ub4YTdT9vQjTCM8RT0u5QhO?=
 =?us-ascii?Q?LYclEQtGL/IPPurw83HM2S3m5hEWYSXNC04hOmP4+dyGpyJTo0B9sJBsKqYI?=
 =?us-ascii?Q?j5d+MpBsWvUH1F/0Y+EYqbYnIgvNxwq2Vne3VvSTmACQNEZ8eQapkveR8Ioe?=
 =?us-ascii?Q?jwucDokggQU4zY8UM7spjdQw5BHpeisrMI4tgpwZYhzA0w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ibisiAygxKMp3qTS2W4ecSaX8HRkq4tbx+JwUFUl4uAm5TxCTERMV0LsoG0a?=
 =?us-ascii?Q?YDEIfDC9CNe6xE0Pnk2rsFElndDWiwokwnyCc3PdGmujNfZx4LnWA5mOS/Q5?=
 =?us-ascii?Q?vcdJnTeB+ez43qJJl2/iDV2rFEnJr7cpHUWlAq02E2PNhVjJNoQoZTrdG503?=
 =?us-ascii?Q?WDb+o9dUWua6za642Xy/LcS5ZCuNjAR+c3aEcjdI+v5TlcJVF/Epi3wKlEXN?=
 =?us-ascii?Q?1XYUqPdD9oiVONkxmE8VyvzJxrtuKMweWqdY1Wmb+26k7sLHejiTZWZB9n5k?=
 =?us-ascii?Q?RVm8TfLWMIENFesXEieJNZTVaKu1u4jhkhg4ulPKj/2wJLAyfRPezgV6HW2V?=
 =?us-ascii?Q?JaMCN9+3D5D8Gfmp5HpSnmlAXeuLfqufa+liSHG0o8tKvlgHM2fMV/tg9vkm?=
 =?us-ascii?Q?i69N3xszxOmJjW2AqrbgyLRxiuvM6lJBloprH6qbkmfGgAE7TuU3YwB1ZI98?=
 =?us-ascii?Q?k7K7UrktDqhA6NM1YPoJEs21jgl02OcR4gX0takzR88TuukvX68ih4Kfc+Mt?=
 =?us-ascii?Q?jS+D9Vqqdn4VwN+9oX4Kk1GNBvSPpHpKwW9ft8nNNLteyIFrmeqCElF589kz?=
 =?us-ascii?Q?56gr9DVrYiuF4q5s+qgwo3Hy7sJSsBgYryEMtL8L3TKlH3f11UaxhU8X4FZU?=
 =?us-ascii?Q?FZrcaQVHi/11op5/GsOZ4kH0doivb7rPt6HodIm0p74Y5tSE/2BQsbrtXSp+?=
 =?us-ascii?Q?srkDQEqYJ9juK6uhtkGb3OJMTO/tQzQGCidnqAx45FXQW2HU3W9NXswYALv7?=
 =?us-ascii?Q?Hi13m7OU8vXtkhMaCfIny5GGqccOt3GdS1SjvMzKGx9IGk0ooXydSbmZxMdz?=
 =?us-ascii?Q?dVARBcVszAlqN4mxoIUN9JZa5xYDF9UVWcHQEh7jpzBCZ+DzbGzmIZJK5ked?=
 =?us-ascii?Q?EpO3Uivymt+BBalIhnZ8iP/j4WCtPvzmZ9mUaR3Zn73kTfgKTZc+0l0D77Jr?=
 =?us-ascii?Q?aY8Tu1eRNuYrDrF0f7zGlReRoxJBfcVUr5hMTs/2ALF6ScsonNIrvYd9I9LN?=
 =?us-ascii?Q?xyAL8j5Mg60bwCkFAHZRwOTzQYM7RNbYJQ0Zr+hEqS5cPE8f7a91rF9ZfPaE?=
 =?us-ascii?Q?2pUFeFqcU/dVFLrfSU2hvJ4wWS8f1WfMtTCqaLxH9uYzYAieFjdTFZegAI/0?=
 =?us-ascii?Q?rdsTRr2GJgfUdT1fPjlH1jEi8um3DG085tNvhtqn3hyiWAbKzaMQu3n54erf?=
 =?us-ascii?Q?2qW6Ae8gAwuLToQys1vIknmabVJD15tAW/fQAMiMwwp0wvXhVVYPL9I09vhk?=
 =?us-ascii?Q?hXpeVxL5y0HnmNPy7RNVqdHrnWDSydaf98F+9vN/eCE/lRzrRMkwCsVGhmhj?=
 =?us-ascii?Q?BKwhZG+vzZ5zhqKRWX8eqzakxNOsa9ASFMRvT6Bm9+A23f5csGUWvYWFLGi6?=
 =?us-ascii?Q?juPxtue9yGuLXgHx99JDCf/st1vniRFcNdPE8da5YHwXj5/LBP3g6hmGyeE6?=
 =?us-ascii?Q?q4xNnlZqHms5md/2TSkpvmx4d6EFSgq3THkU3Wbji8tsNITuk668zwmSZfni?=
 =?us-ascii?Q?R7jKBU4HFzWo7breif2Mew2upFpx0ZEiYWkwDkqcaIjdGkW62LMm+T3typXz?=
 =?us-ascii?Q?t3zqIiVwsr1Y+CzNKwd2treA1sVq2qx8ka0VAPN7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f331904e-3b9e-41d7-b6b9-08dc7fadb897
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 07:05:28.2690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2H6JauasEHk5KrGRUc94xyvsGaGn+1Xedxyd5S18NQ2MiGY6p8VPoq4/UbLmjo5/JeHdj23fanZp9eWougxzqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5127
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Arnd Bergmann <arnd@kernel.org>
>Sent: Tuesday, May 28, 2024 7:58 PM
>To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Jiri Kosina
><jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Zhang, Lixu
><lixu.zhang@intel.com>
>Cc: Arnd Bergmann <arnd@arndb.de>; linux-input@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: [PATCH 2/2] HID: intel-ish-hid: fix endian-conversion
>
>From: Arnd Bergmann <arnd@arndb.de>
>
>The newly added file causes a ton of sparse warnings about the incorrect u=
se of
>__le32 and similar types:
>
>drivers/hid/intel-ish-hid/ishtp/loader.c:179:17: warning: cast from restri=
cted
>__le32
>drivers/hid/intel-ish-hid/ishtp/loader.c:182:50: warning: incorrect type i=
n
>assignment (different base types)
>drivers/hid/intel-ish-hid/ishtp/loader.c:182:50:    expected restricted __=
le32
>[usertype] length
>drivers/hid/intel-ish-hid/ishtp/loader.c:182:50:    got restricted __le16
>[usertype]
>drivers/hid/intel-ish-hid/ishtp/loader.c:183:50: warning: incorrect type i=
n
>assignment (different base types)
>drivers/hid/intel-ish-hid/ishtp/loader.c:183:50:    expected restricted __=
le32
>[usertype] fw_off
>drivers/hid/intel-ish-hid/ishtp/loader.c:183:50:    got restricted __le16
>[usertype]
>
>Add the necessary conversions and use temporary variables where appropriat=
e
>to avoid converting back.
>
>Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from
>host feature")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
>I noticed this one while looking at the bug that was fixed in
>236049723826 ("HID: intel-ish-hid: Fix build error for COMPILE_TEST")
>---
> drivers/hid/intel-ish-hid/ishtp/loader.c | 69 +++++++++++++-----------
>drivers/hid/intel-ish-hid/ishtp/loader.h | 33 +++++++-----
> 2 files changed, 58 insertions(+), 44 deletions(-)
>
>diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-=
ish-
>hid/ishtp/loader.c
>index 062d1b25eaa7..1d4cb99d2130 100644
>--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
>+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
...

>@@ -162,25 +165,30 @@ static void release_dma_bufs(struct ishtp_device
>*dev,  static int prepare_dma_bufs(struct ishtp_device *dev,
> 			    const struct firmware *ish_fw,
> 			    struct loader_xfer_dma_fragment *fragment,
>-			    void **dma_bufs, u32 fragment_size)
>+			    void **dma_bufs, u32 fragment_size, u32
>fragment_count)
See below.

> {
> 	dma_addr_t dma_addr;
> 	u32 offset =3D 0;
>+	u32 length;
> 	int i;
>
> 	for (i =3D 0; i < fragment->fragment_cnt && offset < ish_fw->size; i++) =
{
You added a parameter fragment_count, but you didn't use it. Did you intend=
 to use it here?

Thanks,
Lixu
> 		dma_bufs[i] =3D dma_alloc_coherent(dev->devc, fragment_size,
>&dma_addr, GFP_KERNEL);
>+		dma_bufs[i] =3D dma_alloc_coherent(dev->devc, fragment_size,
>+						 &dma, GFP_KERNEL);
> 		if (!dma_bufs[i])
> 			return -ENOMEM;

