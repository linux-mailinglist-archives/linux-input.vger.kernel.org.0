Return-Path: <linux-input+bounces-10186-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70202A3AE23
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 01:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 113027A5B64
	for <lists+linux-input@lfdr.de>; Wed, 19 Feb 2025 00:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC7A485260;
	Wed, 19 Feb 2025 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKObsqqT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECCA1EA80;
	Wed, 19 Feb 2025 00:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739926168; cv=fail; b=Upy/hd+bDuQztU5bGosMoTk+25dUs5ujQpuw1OUTqnxgSWq1LEONQNWnXsMbXfFFILTmM3Cs6F3uS2hdXn/Xi5m+3cJ483UfrJ4zps8OpPfqMmIhXJgOU1f8sdU1Y4IKHmV+nXBVGBGFi8aEyoQivdeDI5SLQXpvbfhBWTu7epU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739926168; c=relaxed/simple;
	bh=ac/XZ9NzRRBb/4SM8P91FlO9Qu0jdDJYV7MptIdEnw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XjQneRQLYut4PfgLB2yC31SN5dbzG2tllVwOxOEPMJWCQz2Ao1f1hmTplR5+Zg92+eBAITKIJuOwRxReowdOXGCGzHD9HdtbRQnm4C5wN2rzbILBC/ji/DIR/6195P3FkgUwD5Se2jaxl3R1/79ovBkodfCR5m6lXl3HN8YCSTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKObsqqT; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739926167; x=1771462167;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ac/XZ9NzRRBb/4SM8P91FlO9Qu0jdDJYV7MptIdEnw0=;
  b=XKObsqqTeihXKyzQn0FM0juDZbk42eaoaGzfsvQIPVJBrqchzn2o3Ofd
   5hQIhj73LPCnMlXTT8deGIei5gkxs+OCB1jl0YLquUqj2darh3w0ViqBW
   h/hEVmh5iLHL9/DwKpiyVehTfJCnnXPuVICbRKA+MmjNbdwSDd9BkdNHs
   B2Ak7RHCyfE5EFMRQe8UQq/gzOTp68ej0t/uOF/L6hEgiQT3epmHkfxoT
   sUXy7WBrut1+40tXerqKXXPMkDOoABRQ8pT6/TOCONJiNz3uxZCbAkhj3
   tlq/Zst6bAd3oNoyqORc+h3ZXF19a+guVc+kH8wkly+R1EM5/kn5sAmtN
   A==;
X-CSE-ConnectionGUID: wRWeO2bwQ9+pYwkbMS0TbA==
X-CSE-MsgGUID: 8JdFmbMXQ8W957NRNeqOOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40511790"
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="40511790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:49:26 -0800
X-CSE-ConnectionGUID: 31NY7UyvRNibDPEN00dJBA==
X-CSE-MsgGUID: 9rvDoX2AS5+7NXHpxFWaRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; 
   d="scan'208";a="114415899"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 16:49:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 18 Feb 2025 16:49:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 18 Feb 2025 16:49:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 18 Feb 2025 16:49:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeaRoZhk7xBzOG6uopgH0PeOSyKc+YvpkvE1tNrzkrCrOizfXw88YjNzxyko3QEuuUczwlseO15ef/dtMNrOtkHW12cTBay2DVeP+uAASPV1Wlk6unCfsLakx7PVaiuYV4VBoCvvT1PnTxr/9AX9fcNn709NN9EL3+0Ys+WytNCa4wHwLPSCWH6z74xa+/ERATE+01TteLp7rVS9Rf7ciZE4y5YXhlZiD5uu87Z4XKRwd0387AzLf0KgI1SOAf/WnWRrV/8nHavuaUY4PrEcwrwVXCrW1PWRqlKpxiwtp/q1NnEGzW8R3CSjyXmBpaixiG3lAocohgBHT+wPZdbC5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kILe2GNYYmso0uNmF0RkhZRbbSwpYcoe5wgsoRe86dk=;
 b=oQHlTD+2+UAcyNCpsr5X9LXSJCui5ihpn6vvu4R3TpmUdciSeAc9fwkeLbbchqRYTghER/l9njcxpUp8nRQWJB2BT2cv2fXtJ/CWvQZf5W8DkPHRrsUk9qselxE7wdY0W07cBrnaj43svTd90iFyyQU4m7xUg1RIR3z3XWDwijmNnWbqE4nMf0MXd+O9T2OlE0NrCMkRMA/YpKqvK9bJ8goC/FO/g4BkmgQV3lM0/euLbdyNKQliK1OuMx/I64Dr5i/bVunyZcDqtqGMxcqr3y+DKQzRJtficQvlgMd9CSXWsboiovrI/wyDcJ4YDl+EUB/FPlo2Uj+eyq8COO7w7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SA1PR11MB8595.namprd11.prod.outlook.com (2603:10b6:806:3a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 00:49:23 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 00:49:22 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "david.laight.linux@gmail.com" <david.laight.linux@gmail.com>,
	"bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lkp
	<lkp@intel.com>
Subject: RE: [PATCH] Hid: Intel-thc-hid: Intel-thc: Fix "dubious: !x | !y"
 issue
Thread-Topic: [PATCH] Hid: Intel-thc-hid: Intel-thc: Fix "dubious: !x | !y"
 issue
Thread-Index: AQHbfcCxQAvd/xFGzk65HxJbLEAy9bNNl4IAgAA9IwA=
Date: Wed, 19 Feb 2025 00:49:22 +0000
Message-ID: <IA1PR11MB609867E0BE78125CF48E99B8F4C52@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250213024021.2477473-1-even.xu@intel.com>
 <04553pqn-2s4r-593r-q8pq-4s18q5380p9n@xreary.bet>
In-Reply-To: <04553pqn-2s4r-593r-q8pq-4s18q5380p9n@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SA1PR11MB8595:EE_
x-ms-office365-filtering-correlation-id: 0571d8d8-9edc-49eb-b0b0-08dd507f406b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?0qYioTI12thwM35inLyDlo07cvzdInOunHmzXshFdJAxPlP3Qf2QtyE+P4RF?=
 =?us-ascii?Q?heYofYJQNppEWQyCG05mygZVXfsDbnLHuiWC6rrBFcocy2KSy6mEaT86C607?=
 =?us-ascii?Q?3OCytOkuRPXvRNz4ZuGE0vZZo98+NWkauOjoIceSvCaR9x7qWLOBV8d03JUV?=
 =?us-ascii?Q?+jcJ6LZnjLailjk21QvXZqOP6s5v+Wex7P67u21ljL8ULwMw+fPYA26JYGaE?=
 =?us-ascii?Q?u2+Gk0HzbZ7TKedN5yOJvU/PMPCYWf3O0KxSGW5S7WWNgk6vjKpdbu5/HT/+?=
 =?us-ascii?Q?RVDkTQ5imxJ/bTnvXs48zh+U6uQ9MZS2e6W5+pPVQ1G1YRFJ8ybDvUaWzmqy?=
 =?us-ascii?Q?5y/AD0w1bQVvDJ2imtQgSWuCP4rCJtZuTVmAegx7hCldinFOB+tEJQLa5PrL?=
 =?us-ascii?Q?r4kP1P2kNMh2sb4rXDydgNA4t/yP/1kcI4UVYVWf616HfNzsANn7pD2NTSwD?=
 =?us-ascii?Q?HZCzeld0FEtPmcbhbM8bfrILzes0672cBsonylNgBjTyYNE1fLkmP/xb1e2h?=
 =?us-ascii?Q?x9a/fYPrC4819rovWw67rcCe2ucJkGUsUV7WIZMW+yfGNMj4kWst1BkcJUM4?=
 =?us-ascii?Q?PaDjEkI9sB4zIDow3BNGpLbJfxYEkbWg3Vrzbal9aHEGmKnZrGNvPslEFS+A?=
 =?us-ascii?Q?cL890S01p/hy6vrbyiETnd0JbL5snzj80Ps+ESbLZ3U7KOJWzZfnvIBAtbcU?=
 =?us-ascii?Q?KK1zBAqSTjHs34XkOAGjn96kpjUTd1mdMoewbUO4XP9xLDtLVfR5/kF9ZRrc?=
 =?us-ascii?Q?sE9yrlTAlXUqEMN73TUrVZnyM4k1tRkkdUEsCnpolS6gmU/qOYIZiBZI+JPb?=
 =?us-ascii?Q?VfWadUO77+40/fcvxr/G3hLxrEtd0b/1pI8aWk/gHd6kU5n+THgzLXJ9La4K?=
 =?us-ascii?Q?yQhlJinzqBn7naWHOvQAk4wlFZI3H9I0waNwl40urGTVwQr2sgN2rReCgm12?=
 =?us-ascii?Q?r0AyzHpvpc8fh2BtL67S24MWtJXuFfGQuky09z2IESx2cb/tPhTuhuKVitIt?=
 =?us-ascii?Q?IPs8J7Uz+YbbtIHCBxWh1SOtzoXy/O3040Nlprv+IOu23aoOowqkY2uIUOcZ?=
 =?us-ascii?Q?i/gqGVbeo+URzqIXvECYlMm2Tab8LvIvzTY+3hKqswqYK82mKxfCouxcL+dB?=
 =?us-ascii?Q?+4dGG77mRH50s5k34WnnLQFokYnSHCafN1rzKOzAoH6tu1KBsGVANjON7Wy6?=
 =?us-ascii?Q?KtMcfBY6xKonPKTMQw3rUhT1jcy769pmQjYvXMYOfddfxILuXCVPJkO8ZPY7?=
 =?us-ascii?Q?ITD+VboSJmM2yGTg9va+WoZQwyJ2vh+ZtXWq09urC8DbkTsuELpkjtfvV5X3?=
 =?us-ascii?Q?SlGx09dvyaE0nEwC4c4CEuRl6HaP3IHkyHRPyp6ixQlhx8oRm6EbWNQO5Z7Y?=
 =?us-ascii?Q?Hhf+zsobeqRoUUsYY8omQqE9gwvwJPEbaLPzslG4pMFaer3oBupSH7IkPxgT?=
 =?us-ascii?Q?/vmaKS4E44zRgdn8URk3K6jOMs2axKEQ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9hyWlMC5CIEY7PkdQbnZ95VjsIcQgus8J3OxPR633sTjtXadr2ry5QMaVIoS?=
 =?us-ascii?Q?+oRC+8zUG2T9+bf8mEf7lQswIS9TpXwUL7w6iax6zoUYzLjKakk957hI/Qip?=
 =?us-ascii?Q?FsC+PQacIeBxzuV/RFhJ0bplZpjIU6qzE0XnMMAGFn49HG9DBe0aNghqpR0C?=
 =?us-ascii?Q?OYQCGWT8FqFouPT+jfvY+iSnC9LW/eYv2BWKD44conL86Kx7Kh/fonTQAucW?=
 =?us-ascii?Q?0lbAIJr/s7ll99aw8wLbUcn5zU5cpZYUWKZxpDECfKEE+/AENF8kRqQqfbzi?=
 =?us-ascii?Q?tYhTT2O8YvlYeEBGqWHJvWStwfUSO510iX8512XJNGoNbWB+NsuyKG32JbJa?=
 =?us-ascii?Q?YWlrsGkkxr09z2zylEO/GCZZRFP/x/pHFP2Ll9yKpv24rDn4dIgnyJy+AeP7?=
 =?us-ascii?Q?mL9cQBSso7T9vClZ5HPccaAwYSzMrpyQtDV6EXzUCvLQIPSUNEJev7r57edQ?=
 =?us-ascii?Q?CDBWbiZ9uMRqYS4XRNyyz/zjMzRvZYrB97gmgj9otHE4moRcCLRPXolDyG4Y?=
 =?us-ascii?Q?gR/MJTL9z54Z1LG7RVLNLEXWpmBwC2oBsdz2A2i6NZL394D+i3ceyYEf3wtK?=
 =?us-ascii?Q?/zGJnRBTABn1/hzJR0wqHiDlSzQ2NcE15tN7G88eGVdHXbmkeJos2vQu+k3I?=
 =?us-ascii?Q?myLN+p5/Vx3apI1+++w8C+tLfcuJzm5LdTf6lbhxZ/KuQ1s1mn8Kvtb+wCz+?=
 =?us-ascii?Q?Sr1d+FN9XLTX2lW6syoNMOOf+A4lg4sCAufcKzW97NeqHdpFAQQi/TlwQR29?=
 =?us-ascii?Q?QXh3lXtu86xuvMIU2JqHWookAKXFscQ5PcHjD4ZLgLx1RC/Xb0XFXh+bnytS?=
 =?us-ascii?Q?+c+c0anwlFiIFVP/NAzLalNygMm+pkmd5aSVTZVBbNE51teOeZmnZ9rNAtfT?=
 =?us-ascii?Q?inMAToL+W8UDpcxAFRNHpf+yVZ2ZkYtD0KqhMbgWibhWyjfJOtw94YBuvOW1?=
 =?us-ascii?Q?RO/3CozT77QWcy40POS3RfR3O/23QCToy9hA/TjgmoirAMzXgFdJ5Rt8WOna?=
 =?us-ascii?Q?ClJCRHHlnCh0rTnvuy34XldsltPnesMeImgyE7frCwoSDMo/4KnePGik1Ufu?=
 =?us-ascii?Q?X+Dijwqe4WJ9Zy34ePm1vz8HNhJ1apW5ZG7N3fesyZ8Fq6IT3xUSBe5J6c3w?=
 =?us-ascii?Q?MbX2o4zv9Ze5V1Pcf5pAw86H1MTXTGpbVivNbEoSOeIw90pVqKgpAlFhKyYL?=
 =?us-ascii?Q?WkfwPAtJKDw8BlMbABPZ2DExi45H6LboAHptiax9BH5rjRkbRKOmgD1P1CXt?=
 =?us-ascii?Q?6XXtafCqDIeVNqIgkxwfcGIB+KscOJbBHfF9p7cOMHnSwo7H6+AQCdAPWAJG?=
 =?us-ascii?Q?qWPZsba3l95gF67hkjrc5iUOMorgcgFbS4rXmYSEUrn87UuVr3mtOgdIyFNl?=
 =?us-ascii?Q?Z9ElEhFQbywRHPeQu0JH0aYiRuVwbUEkV4Gqkmmfe5Ft59Vf5yUfRGOLlziT?=
 =?us-ascii?Q?lLqMmjBkG+8wP4YfAs2Miwl13AgU4NytqHCSU5vfl9eGOSWZmmhd/RXu4pB+?=
 =?us-ascii?Q?NKMYVs60iaAJKK1SwwOwnsAsXB6V21F2dSUgaZCHXGUNBGr8oVrCGsRC3fta?=
 =?us-ascii?Q?W963Xia6gp24JrfeeR0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0571d8d8-9edc-49eb-b0b0-08dd507f406b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2025 00:49:22.8124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QmNK51aKg97CigfrX651osyCcjlYtebI44ju9u88UjByXoWkaijkb5Qzex39KIvCDDR4x2o351/xLI/bk0mkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8595
X-OriginatorOrg: intel.com

Thanks Jiri!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Wednesday, February 19, 2025 5:10 AM
> To: Xu, Even <even.xu@intel.com>
> Cc: david.laight.linux@gmail.com; bentiss@kernel.org;
> srinivas.pandruvada@linux.intel.com; mpearson-lenovo@squebb.ca; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org; lkp <lkp@intel.com>
> Subject: Re: [PATCH] Hid: Intel-thc-hid: Intel-thc: Fix "dubious: !x | !y=
" issue
>=20
> On Thu, 13 Feb 2025, Even Xu wrote:
>=20
> > Change to use "||" to make it more readable and avoid miss
> > understanding.
> >
> > Signed-off-by: Even Xu <even.xu@intel.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@intel.
> > com
> > ---
> >  drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> > b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> > index eb23bea77686..8f97e71df7f4 100644
> > --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> > +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> > @@ -295,7 +295,7 @@ static void release_dma_buffers(struct thc_device
> *dev,
> >  		return;
> >
> >  	for (i =3D 0; i < config->prd_tbl_num; i++) {
> > -		if (!config->sgls[i] | !config->sgls_nent[i])
> > +		if (!config->sgls[i] || !config->sgls_nent[i])
> >  			continue;
>=20
> Applied, thanks.
>=20
> --
> Jiri Kosina
> SUSE Labs


