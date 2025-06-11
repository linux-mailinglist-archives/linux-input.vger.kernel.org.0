Return-Path: <linux-input+bounces-12800-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F6AD4735
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 02:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD4EA7AAC70
	for <lists+linux-input@lfdr.de>; Wed, 11 Jun 2025 00:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463142576;
	Wed, 11 Jun 2025 00:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DcXEdoY3"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759A6184E;
	Wed, 11 Jun 2025 00:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749600562; cv=fail; b=lL7HgkEsrJPkKxG4DNpFukFVyRnCBaiL9/s8CSMYttFyezbmAGSQ59RT0NoB1xhFwbOsfGnMiu5iKDDXM1QVRoqAGOkwpYEVpBJ5Gb1uEj/vIoTaY8pMLtA/wLLj3JAriaPz7ZXUtLQPpn12WgDyM5M32yA5RfcE6wZlepOSKJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749600562; c=relaxed/simple;
	bh=9KV/8kX/Wrk6gkkkcpIRKwt55dpE1dhMMeAZgsSfPDs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vs8wwXFnOdgIY+4Azz/C476IkX1CQnRzSew7Z92EnwF4/ehTZVvSrdFgRh5GAsPIkqxo23Icu/I0JaT/byfWn2YYEbmtEzaIpVr8Ms95px4otTXac5RILO7+4lFvsN+MdZ4qoTsSTyGXPyNGOd2EMBB/im3QPsWl5Cim8cuj9ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DcXEdoY3; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749600560; x=1781136560;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9KV/8kX/Wrk6gkkkcpIRKwt55dpE1dhMMeAZgsSfPDs=;
  b=DcXEdoY3h3LuynMDlE+f+AGJp24BGUjx+6p6oXq/TeTrLkKAykkbJ2YJ
   zkhbZ+/phlkCtaQouXeSIMo2s8uWYz8pTB4qtokwRF8Ir5G4NwTPvOPOC
   lJy1BGCZ/1/pWlar4xs2j25UhRnckJDpI6axUc7ScbatXxxfy1O60r5HC
   pgNfKyfSSYdqbMu97TKiMT6ymCjwp56xgXkKHHvtIUthxN9O5gnN5T6bJ
   WUdSBDNxvY4M/2T1YRiaWg61wFlWS3DrWxlNmnsVeRO6O3Cu8NBrPlzAV
   LUB0Ke2PfEL3v+HzAi/T80xwvmwcp5ve9rmA2H/oS32FZxXyRvGY3oYrW
   g==;
X-CSE-ConnectionGUID: qQV7+X70QQKKwmzdHYxfaQ==
X-CSE-MsgGUID: rIYRW0WcToe/62VGus+tWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50839948"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="50839948"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 17:09:20 -0700
X-CSE-ConnectionGUID: +hbZa89SSYKmCIzw9G4lgQ==
X-CSE-MsgGUID: aL/t8wSORj20kVSPPbStcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="177904363"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 17:09:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 17:09:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 17:09:19 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.81)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 17:09:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbzsqzrKHDtIHtXWIwNNl6WieymcpxxRadGS/Yr5ha+IYtCzJpmgyrF6hehhFjjYHdQ/YvlF2KIkCW3OETkrxGlzqZri7OShZ+mp3QwY12qvsryaWWB96w2RvQJ1McpRFi7Ms1SZF7bhSrwNDAWId8a6P2WrLnDySxKejJA89ZOD2iWR/iSxHO/X8UTMmuEzCU65KnmrBnH/XR6aVjZwok5n3NJ2JXfLIScTOmbSwH5RZEwAydsfNcM6xEb4s712kPxYEeZbu15SmLe3iVPwSSCLXkU7943kOqRyIA+2nmb4dUdDVFI554ItEMouODCzOLeCSrfiLJ+vLncUZDqrJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MS1T7LH/nFyKqMiogoH/jNs7pQGQgSYuSpHeJdGc4bE=;
 b=SZ3Vq+xFMVcGAF0S/XbgKVbJA2GDDl48pAEcwxoIB2ybOrqV9Ufx0pWAgaD0drDrU99vIvsUppzSmLBaFrvC7CXggK8FGyvlPVuDexZ8+u4iGq+WEKE25mqCPGYm4MettB+Sl6BiuZ+L9JqyMMLtOKUuKmNcmNOKk1v9E3G4cNGWfrvSwKin59bDguPSAtWA4i1FeIpRkiB4diRbdzr+/HDe+WSIIoJIpRr7DvMN8HkhqbaUFHgWgK/Rxw3/ib00T0d04CXFt4vl7bHZ1kAIK1VDDOJjrRPCS4HON50hyNDwIfhUbsFSKJccJXfgF/UrrcycQZJV7sFEefyP6eRIUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SJ5PPF1611BC49E.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::812) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Wed, 11 Jun
 2025 00:09:16 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8813.022; Wed, 11 Jun 2025
 00:09:16 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v1 0/7] Add two new features for QuickI2C
Thread-Topic: [PATCH v1 0/7] Add two new features for QuickI2C
Thread-Index: AQHbxJhSkwPoYkmBbkWN7SpQBo+D/LP87xUAgABRtsA=
Date: Wed, 11 Jun 2025 00:09:16 +0000
Message-ID: <IA1PR11MB6098548288D1CFE8CC2A4B5AF475A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250514061944.125857-1-even.xu@intel.com>
 <39sr91o4-62ns-p7rn-4026-4o46q87878oq@xreary.bet>
In-Reply-To: <39sr91o4-62ns-p7rn-4026-4o46q87878oq@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SJ5PPF1611BC49E:EE_
x-ms-office365-filtering-correlation-id: c19b5f2e-7167-4ce9-9221-08dda87c3442
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?53Zf0fGrSkOLmKfSuskii4+WHftY8VaQn69vuAqKvrcFZhAQyT5TJ2iMYdIm?=
 =?us-ascii?Q?MBO1FLfTKUk8hzYYiq/Cr5da1RtwfNf+YXWNtqERC5L442c8e9YACr0b7kZb?=
 =?us-ascii?Q?/jElwiSxef8V2B+qm6go8OXSHxzbOYZULGJGvfvjNEfrfpWfIOxb74qCXYAd?=
 =?us-ascii?Q?nuVgTNdc7jicRLDsaV8zCEjMDPKrZUHywi0MCIOtZE70QNIgb9wEOu1a70hO?=
 =?us-ascii?Q?HoC7gwXqTOZ0xHDmdRY8hph5zjMzRTZNdwhV/Aw0L5510PbsYOrF5T624yFC?=
 =?us-ascii?Q?KUvXxVq270hPRWghvUHpZEsAM9LK/JpQhmbNP3HOeaArnKfkZxvfXATuleBo?=
 =?us-ascii?Q?3huevPZDjrmxOsmOVkTAtmQUslNIpnOHwokwaqjin5fc9nJd5TcP5wQDBAJV?=
 =?us-ascii?Q?gJGnM3FB4Vl7KQWdN3P+CIuinr0vFKjJgJwz2YYCL9ISyiY7gaj5t6qkywoQ?=
 =?us-ascii?Q?4KiGzDjOnxY/ZxQRwA02Yp3I9jXm0TigFJsuvubEG2pn0roZELOepN9AsE9w?=
 =?us-ascii?Q?1CINc6mUEvFYgiC/pR86sVu++Ok2yBn2vTSuiYyYXYJeud9agMZV2RkJbA1B?=
 =?us-ascii?Q?sEfzQ9KIkfj6kpi0QZNblHA2ZZO01F9F2kQZxAMDZWJ3D7D6NqRpbUHMpmMW?=
 =?us-ascii?Q?8V3l/MeJ7klL39LV1BGsrtMmPRPjcZ0gllrCh67XIxXuiUbet7Be2gHiwCXC?=
 =?us-ascii?Q?JmGGOJliTXbn2E9DmZVbA4X1mQsQ2tRC/L4ST2eqE7dDPUj7rG35P/iAnJlv?=
 =?us-ascii?Q?SsvIlHL7rd//G4uI/ezE6oFEvZBlpm2qhCCy1+4djHUWO/ZW81GaI39RrKTG?=
 =?us-ascii?Q?p3y3jphr2qu7RrhjMFmNCZN8zksdEHzugooCvRQky0aMa8wg0OfXV/Nz6Hmq?=
 =?us-ascii?Q?Lu9Bli4h6/s+iOPZT27w+mT3CYmgV6dGe+JaT+JRTTZF8kE2pS383epuC5v+?=
 =?us-ascii?Q?2QCvgwX7OWEXcjtlJ4jao07I5dyspqoZlIIDbXfAyb/Q/bolVqay2mf8EvCk?=
 =?us-ascii?Q?iQ42sH0ezKvkwp0WtI8ywA1acTLi5gchY/7VZSz+3CA/nm8NMj6p/C8KpY7I?=
 =?us-ascii?Q?wquDcmVUw1i1i+Aests+N/rRWdZkyXh3kpYQYBb9HBCLWbxJvHlPscw4f0UH?=
 =?us-ascii?Q?2VVIf4CYLiNmV9J5m4KUtC9nhQ/BbWPZ9YItaiuop8oNldqk1oLjxupy5KAB?=
 =?us-ascii?Q?QkcHfGWN+GNqRajc0rZE7KyYy8IaKA0YtM9cZhs08diKXCC7BKfnN3hykufz?=
 =?us-ascii?Q?nJhKaoDEot9Zi60cdP3zO913wOERwwIh2L96Bx4nfQn4hAg0x5FK8mw/5Stv?=
 =?us-ascii?Q?q8EhL3XZzr0eTupHx74qTFLwasycMTCbsMngYMj1BDM+Zy6b+VbauwGSm3xD?=
 =?us-ascii?Q?aPSt92qqj6MqbcnVdmPmsgGNxyvDlhbwcx21INVZnRpkhEvt9wpZO0+zjKs4?=
 =?us-ascii?Q?/oXyNUlwDH/Al9r6Upw5WdwQ+jxmedDhT3esJmEO0NWYrhbyuEMOFfSK5KdS?=
 =?us-ascii?Q?O0NGO0Gho1ugZxs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3Lb82dnKciEVtBqvMBqACu94QFLUkmVeP+XMnTaT0LGrmL5t9SxnqahY6jyH?=
 =?us-ascii?Q?2DiDBgg4zgVQIiZBMHMwfqfV4hwL1QXFWRgrYUcZCAOjX5DkC5j7n1b89wet?=
 =?us-ascii?Q?rgNRPmEGyptUMxRPSYe9tHZl6a2+SJ9Bf8lhg0gD5kpg9wQ5T9XRKwDJMk1o?=
 =?us-ascii?Q?rohd9L3Y04h7hb60lrPHxHO1Whi1pkT1P0bkQszW2EYP15x89s4UdGCqCTQd?=
 =?us-ascii?Q?jmRorw0unoq4WnU4gOqK+MLxun11hxyt+UHgiANFad9ShTZR8vCuAQuAnzC8?=
 =?us-ascii?Q?aDO4M15cDmKc/UnbdO7qqdG37E2XG0VGld161jzW/yXbK4whpMPCBkR6KQoS?=
 =?us-ascii?Q?EnO4TcPgHA7agtMy+PSJqosz6GZ7TOFcjM2mUvoVMUx6SjbK8subKSoBZy/9?=
 =?us-ascii?Q?/2Zrv53trcMTgRht2g49F+nO4+mICv6tDYpcQL0nJTuf3oqmExQRDTUKMYi/?=
 =?us-ascii?Q?AJREz5+mB0hTGijDJkH4g1R+04Ou90XaAs8E+x03lekIm13b+7hqek1li/Ys?=
 =?us-ascii?Q?3sGrtuVx4m2dGwwXNLeKBWwkfnSzj3V/IdwPfV+FIPkIZdNzmCXn2v8MJ2IL?=
 =?us-ascii?Q?jje/qI+7RzAuIy2CDsFQ/QqYPqsf5OkaeWcEEKuTSHM9tZ0X/aEAw05uFTx0?=
 =?us-ascii?Q?mJhusEVaX4OV27Zvcq3Giof3klJnxueZvxiRBrHPYTXCXKqVSuHtAS26lG1n?=
 =?us-ascii?Q?wmH7JB3Y55xyHkzU51PEwZ00sehZ/YjpWpOaVSZig15/7YyXEcJwOhUm+0W3?=
 =?us-ascii?Q?ypCnz5pKJkloyMfZyZYAP8IyRzWN+sH7H/vH0IsenlNU+k8/Lp+dGVGFf1Ni?=
 =?us-ascii?Q?DPi7daLZz4JEe8XS8EFnkohWAKnwoAV00DFAiK/mCQvNd8MJZXTKjBaO3bvR?=
 =?us-ascii?Q?ayNHSx0x99Y5UXKayUGHVnGc9FHt1jQfxHaCEDX/43Rcxu4VFqkpDD2o1XaD?=
 =?us-ascii?Q?TjZaH02i4sFSLNuzPvNwLkLhJdZZUyNvl/t8XzjyAzGYFruoVLGbejMmOVsZ?=
 =?us-ascii?Q?T996GZ0hrewhXYWMS0M1nwyaA0mG0HxcPhkmNclorqIArkG15i7XvfxsFFZx?=
 =?us-ascii?Q?GCJ6NNNsYVb8asoTvPXWbh2KOY0n8sajqFtyuhyHO00XbyeBf8YVI++D2MR/?=
 =?us-ascii?Q?rDKeyWE+7xm91AqzphzwWjgmPRKjoVynewT/reE8kEdWe87rbO5Hj7uQzmUT?=
 =?us-ascii?Q?HnoF7nZLQ+ODOtFKEsqQRtI15F/QiwM/8r3g0BBZnE0/DzBSRgO5CWTVoMtT?=
 =?us-ascii?Q?rrIVsYIq0OySekDcI/jErO7areyMPcmCq8D3A5MkQUqt+j4p3+u1XMxFe1s9?=
 =?us-ascii?Q?yEuM43WC9Fhc5gy3sYeDZ2izVek/5Gu37hfEA39iT+DJjKNIo0YjcFWq2ZZO?=
 =?us-ascii?Q?98STj2VEhUyjcA809vOAh4kVvMawB7pNw+kL9zZUPhX3Ykdj/VIqakxuhFRd?=
 =?us-ascii?Q?i8HPy+7XryMGfYlzzoiRQu+N3dldySWoeH9ELgmjszs/09BUZk44UbhHvpHL?=
 =?us-ascii?Q?oPBAf2nJnv5KzrFvgjIu3bhJYcIiwuLHJ8gy+Nj0S8uYvqDDlu+QJZQ2eUAn?=
 =?us-ascii?Q?owkkqIYCGSVAe3RmJmM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c19b5f2e-7167-4ce9-9221-08dda87c3442
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2025 00:09:16.2533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F3H2QpQgwMLAl9qPMwLht+oVdUbf8KhPS/ftehXjuW5NH3HUFxWopXSrP/dDrEr0zf2xfUriS1ALR41tduKjLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1611BC49E
X-OriginatorOrg: intel.com

Thank you very much!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Wednesday, June 11, 2025 3:16 AM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org; linux-doc@vger.kerne=
l.org
> Subject: Re: [PATCH v1 0/7] Add two new features for QuickI2C
>=20
> On Wed, 14 May 2025, Even Xu wrote:
>=20
> > In order to improve THC compatibility with lagacy HIDI2C touch device,
> > on Panther lake (PTL) platform, THC hardware introduces two new
> > features for I2C subsystem:
> > - Input max input size control
> > - Input interrupt delay
> >
> > This patch set adds APIs for above two features' setting and enabling
> > in THC hardware layer driver, and enable them in QuickI2C driver.
> >
> > Even Xu (7):
> >   HID: Intel-thc-hid: Intel-thc: Add thc_dma_content into kernel doc
> >   HID: Intel-thc-hid: Intel-thc: Refine code comments
> >   HID: Intel-thc-hid: Intel-thc: Introduce max input size control
> >   HID: Intel-thc-hid: Intel-thc: Introduce interrupt delay control
> >   HID: Intel-thc-hid: Intel-quicki2c: Refine code comments
> >   HID: Intel-thc-hid: Intel-quicki2c: Add driver data support
> >   HID: Intel-thc-hid: Intel-quicki2c: Add two new features to PTL
>=20
> Now queued in hid.git#for-6.17/intel-thc. Thanks,
>=20
> --
> Jiri Kosina
> SUSE Labs


