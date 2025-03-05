Return-Path: <linux-input+bounces-10559-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4251A4F913
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 09:45:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBD243A568B
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 08:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 236731EF0B7;
	Wed,  5 Mar 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imJtpU8p"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE8148314;
	Wed,  5 Mar 2025 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164329; cv=fail; b=m4nkfN2g4CUJ/RN4YFmBocPCn/SEpblFFMExUVej9UYK4RhNtGIHxkWDlV4b9SQVhphfGWpRJKdoPwfmL+sZb/BGBrzPIlz7Oxlt+JtCzUbDDbXSVkSA7VjXOevEJvgAI3uI1cZmkQoddocMtXkT9AN0YM81+cm55rnqiWnrqHk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164329; c=relaxed/simple;
	bh=RUVlYbMcD0S5I0TYM5QIj4SGb/mBKCXaTwEUvxRlQPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uvE1ad1YQ0n6ezHcgvFLQ4s5wtI39TtywdM+/VDsGZoxX+jIe5XQNhQ2IMJEqszzPI+zlv+eRbo+CtToHG+KFLdsjqaBdnzOyIAhDo/deQXBcsj7UeBHKMDocKvvH8CnMMiJ/PU8VJiKNi/VRMWQtMwr/OzaI6c8kZqOVqltyyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imJtpU8p; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741164328; x=1772700328;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RUVlYbMcD0S5I0TYM5QIj4SGb/mBKCXaTwEUvxRlQPM=;
  b=imJtpU8p9ZJ1Gmo+dGBMDK1Fe2qM/OaLteOzyDzDPPDaoPHfCtnfJ6ll
   HXGUW+QzDitV5NuoVm0WSmett5tvOvnBcc8t77KQda1VLbUGJw6VKebSr
   y0vtkXt/ru6Ryfr37eLS3pOUed/MyqhjfCyRxPxFVcDuBiSExwSvrPvrG
   1448EVyS74alqKoNBLOLEE24s+MjrJOgX1auhKPggB6E+QqkWIAx7eqsf
   YNpZlLEJq8YKBjsnCvFdsaL+V2wrNG5uHwAYrwcbouZPQeo9A2yrJoc7Q
   xvCYaiBJfIFIbJdcGkj6IILnIfYpW4QhG60/dorTWyull+aFulpcpyLEL
   g==;
X-CSE-ConnectionGUID: G8SktkC0QD+mxMxqX4HnxQ==
X-CSE-MsgGUID: OEAdbduaTGuuycVQanxH9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42137979"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="42137979"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 00:45:27 -0800
X-CSE-ConnectionGUID: 7ejK2QwDSN+5LA07jwZY4g==
X-CSE-MsgGUID: A4AJeespSdmgWBdPMoMKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149591894"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 00:45:27 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 5 Mar 2025 00:45:26 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 5 Mar 2025 00:45:26 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Mar 2025 00:45:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=We+xh2K2F1vSctlzlHJhauw0htv6ZOBzs5s+4qszO08QwvdaRlqOPzt9g10jbyAzsPGh1sB8KXKOKCVbawkSzX8muRVUKzhZlBr0FRyBCVCB1gY1vGseNPCoWjVbanwqSFomxtuzdmSWyL8OIBSc830HUde2R149PAUZoyNZkF1kL1FLwszBx/sw/WkOASKpRamjo0ZC0wULIuVcQON4O9sqAgv3rA8EhxS2AgavtFPp7uOAIqJOpB4Z/Q9gnuoGJBw6YcC1P3kkZW6i9iNHkyGPnSXEkFOJNyk/56g2JfS/Ozo6gUgNXx/OIoNCn6Wa+waBW0TAJsja7fAS6s9xxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RUVlYbMcD0S5I0TYM5QIj4SGb/mBKCXaTwEUvxRlQPM=;
 b=mClqCE/O4nlYJQcw8hpE1pv/xq67HO/S/PxbYGrt0gGNHLRSR3CyuPci2gCGAW6BQMRISDH0lgVDZo1mcGGSXejtKGe/WtpUj2nOtYULOyiHT3CqqzZU+FAUjgdgzn2q7lGWpwS7CcmgyxN7X+RgIPjlaDtIo9nkTYzH/YJAUsxg70oY659REM9PRI8iBVIOZtaSQ+e592ZrLxfzLxpeV62pBtvnyYXvtkeB5Fk5DKVKXqm69oQ3OZJitYx7Q8+eGVf4qtKYeGT/oppPNG56TL0Oar+Nw3Z+joKMUrTYnZBEcrDHdxr718S+E/KLxS9aH7AoO84wdOCO/mo1HhdnpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by IA1PR11MB8862.namprd11.prod.outlook.com (2603:10b6:208:59b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Wed, 5 Mar
 2025 08:45:23 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 08:45:23 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
Thread-Topic: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
Thread-Index: AQHbjLTcANInlVCQx0+6PVpmKEX957NjdcAAgABCBRCAAE/SgIAAAGLwgAA0LoCAAAApsA==
Date: Wed, 5 Mar 2025 08:45:23 +0000
Message-ID: <IA1PR11MB609838020E63E04EF338C57EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250304032255.1131067-1-even.xu@intel.com>
 <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet>
 <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
 <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
 <IA1PR11MB6098DDEBDF3B7A0160CEBBC2F4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
 <q70795qp-nq3p-r181-15qn-on41n588s770@xreary.bet>
In-Reply-To: <q70795qp-nq3p-r181-15qn-on41n588s770@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|IA1PR11MB8862:EE_
x-ms-office365-filtering-correlation-id: 1b4091fb-57de-4393-a484-08dd5bc211bc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?NJa7rd3uq33ZsDyc9VThKbt5ezRk0L0Xn7FoGKnFKVrmJpyrmyjYEjWuJH6U?=
 =?us-ascii?Q?9OwdjlL4UqHgXfC9nfirb1aJU2XDPzYjlimTHuk8AGWDtPP8b639o/vFX4ET?=
 =?us-ascii?Q?NEFYD0zh2fWx6/kXrsfmRxgsoZVJzTTJN+31TmLwoOpRJ7dLcM+6LeIDbHCf?=
 =?us-ascii?Q?SHirSVcS+QtKXV2O+1J3XqR2pM9iMg/Jy1EbaQ1fvl2LvzaJWPqCj9QH/WmL?=
 =?us-ascii?Q?/+R1YRPnIaaAHYINdx4RcEBio32TINOgAzwzBrfo1I+RpGPewHTiUxhGed+7?=
 =?us-ascii?Q?zSaHdL3XHFRr5Rbr+Sc7Oje+R5cwSQauynN0hZ6pOm9VCi+ERyF/7NNYcCHd?=
 =?us-ascii?Q?DghuWZbuuB6MfsTbv3FvlCv2k3QLQeB7hfyU3gbbJXPB78tNUKSZSHvz9BLp?=
 =?us-ascii?Q?E9H6KXDEiWjLIeeb0G5y8rvR186KhAQewaE2YMNSV7nUW95n3rNf+cffekrm?=
 =?us-ascii?Q?HTnagro57ROKVqbZQRTp9HF1zdN8F0+ErKZPqXAaLDT5tIp530LbXW3BqeDa?=
 =?us-ascii?Q?aYFspFpXSwn6/uWi7Og8LowshQu8bREG4HChYUS4tOymEk1gpXKWca50C8BV?=
 =?us-ascii?Q?G9n5yby8zZcPd/QptfVVNabrT0gIB/AnUWKyI1srVDVwCTbTqvpjHywxyC+E?=
 =?us-ascii?Q?1R5a1593SHni+ExZc95BjgDIsiRHj4DvdUBSxJoeGoK609aYj3owVbC/Ri6y?=
 =?us-ascii?Q?UBiLuJLtNVOf3uvQSimpwoBB40GYRkahHk+AObvwE4X+yjRYQyfuxsC1Bmcp?=
 =?us-ascii?Q?HsRraonU9SgL01qBYjXX4r+u2uHSIqYo/ir9J3GmDvQbNYOVtJSJvjjUsnJe?=
 =?us-ascii?Q?7t0f9IESMHMUXtqph7r9/Dh1lszt06Xqd3J/tQLqJfKPkF5W/63aZP1+18EV?=
 =?us-ascii?Q?Y18UZAyNdl2u1+A0mmrU1KqgTUfCuQ4L2+GzLHVHQ6B40aeyEaCHfZRVkAM6?=
 =?us-ascii?Q?OVBnrXupCIdmjeg8apRE/VQIaaEtmlkSUECVg7clps/IwsHKanpGO3oDM09v?=
 =?us-ascii?Q?cR3YU3hkx8Kx/BoLQbOqlhsuBomj0CiuKpvZSlr6Du26/tI5XsSiGR/53V5V?=
 =?us-ascii?Q?qYxQ9xw2PqTXJow71D9xxnjbHyIZNJAll21ySuRiLdwuCGVo2arsWRxMGtxG?=
 =?us-ascii?Q?TUWJjESWF1HuAuEcrqd0NUn+wA1jdHZDoVsbiAf+jZJxyriC/qnrxzjds/G5?=
 =?us-ascii?Q?XKYcbISQmXzfnLUHSminBkoFhMRsUGx6y3evfxRvLXW2zai9h94+Dt1DyEB1?=
 =?us-ascii?Q?WaSfJeWhAamq4N0peM8VvxrbXMWBHtoHTjLPCR1sVoxq9O8KAoQkvvlsFHP3?=
 =?us-ascii?Q?ul7PU0RAstJ9Be8+Dz/JcdlSyn/LtR2lO/kKY7ih+xYrXbUCbH2gI0P/yzaY?=
 =?us-ascii?Q?B7RnNda74Zj0lsXxHf2KjeHGQm6eRMaIhSRvnjUaGQwqtlSvnqXB4r5qVMzS?=
 =?us-ascii?Q?jilciRNwujd78b8rgNy5Wuq4YS6s6Ajg?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8hdAmWCSU1vrh86pL5ABG4TZFyoi5yXkDY3qAmdf3gLnZOo9UgTs/z6P3Ntf?=
 =?us-ascii?Q?4aNsNeeauwYFxirger4wjdEvsNqgsjmxmpUvdf7jFlX62n4R1O/p1ngkyeb1?=
 =?us-ascii?Q?c8VXo2+oZRqefe3HCRjqvXlSmmO4iPhQmewPMyO3YHcRsb8Pt3LTCH7vJp2v?=
 =?us-ascii?Q?gzElrEpdNrta19XIfkdW9wuwSiXm+wZvBpnLkZqZhjAwflqiE76N8MZa28SZ?=
 =?us-ascii?Q?TmNvOhfbbk7ILTHqRAF7+5oLsRUOd4C8WPqQ4CfcFE5kRMRXJ0YLopn2vvYU?=
 =?us-ascii?Q?d3cC5ESC1Hel5EJn7zxo2ZVjCbNaG1AhihEvzHJoeuXYmYXDEdFpbNwjxvDH?=
 =?us-ascii?Q?OIes05hlZavWxajmXNkmF+pbNQJgyhC3EQSG28uJFpHFEB6vPmQVP5RXaw0i?=
 =?us-ascii?Q?pYeWEiftZsQa1tq6czhMJHHFQbXuODolV93Z331xJpMURt8EwKxwfujtEZi3?=
 =?us-ascii?Q?qhY6rzieTpJlZxUMqSESCtWkbbKzyFOvRuLMUvitRe2YyU+n17TayPsInb4s?=
 =?us-ascii?Q?5uPndIUG9fgMr4Xri0lwnZprYD4Fg9IPhE7qe5GSTYsh7+yuGJ4hl307i4EE?=
 =?us-ascii?Q?wGoKpnJUUGwzrMH3kXuD3Ko+RuGyNTgIn0cyU/MgANFrZBlLl3vkadAqFvSR?=
 =?us-ascii?Q?h5oAJdXCj0ily3c1LW/abjmoc2RjJ+IBCOSpKnnGFFdAvgueTbMXeDDsBnjj?=
 =?us-ascii?Q?KqR31zMRzLaaChH8YxRwD3pkSyguYah9aYuptvEJRcWozXYhiIX6nPHg/M/l?=
 =?us-ascii?Q?Rk6mQ/SjXgX4lEPb08zjRjiCmpuv3wWCrYtnuvgpm4WewnWl/MRI9xqO4wmK?=
 =?us-ascii?Q?Zf/4F9aZDKlPamRaLnk7Bh/XJGlqvt6N3l+lqTlPoU64hpQcc7cQAbj8QrnX?=
 =?us-ascii?Q?dAf5/0sdTmaCgC7CU38Zj9e7CKJJZpbuMfisjZr+mMErgnBCVzjMnA/Z+1Lc?=
 =?us-ascii?Q?SRrgpjKDiiTvNH17AFnj5emQr2+FimoVikMpvaok5zLvU/BntQbr2+dxctFz?=
 =?us-ascii?Q?v9NqKNbbNMY/TOufYLcMI7lvTv0ibV1HJ0sNjlDs5xb3ygN/4pALZo8An9ND?=
 =?us-ascii?Q?b8aXiV0lILDPrusb6x7iGVPjh0k76Kihy6g1jouk+lIPLZlxzepTpgf91rXS?=
 =?us-ascii?Q?1urpkwJ0UNYtn8jGSAcdr83eoU/xXUzJkaxp5HSOFudhCnedS2vFN9ysakGn?=
 =?us-ascii?Q?NCDHbywzpaun8hSVwrUugKpayiUyXB9/j+Q/ifspw33I5+l5/tyX3l/3i9l0?=
 =?us-ascii?Q?jlZPygEnXzLmZggVtpjQGZ183nvXxQRvdtpXf4qgUNG1g6rFLp9gsQzmwibu?=
 =?us-ascii?Q?XL6AN2v2xtBS3JouYuTU6Yjw+vMHOkK1RI4F+xeNk8ofNyKRB6wX00G3ZqCx?=
 =?us-ascii?Q?5Lw/P/Z2KcspWlUgkAnIuN8+ZIeF2JNeHyCS8F0uFME2i211w2E9KzNToM2J?=
 =?us-ascii?Q?ZlQhAG5RzkuyDKAGMexDnXHqpW/84gqf1yfp7rJnrvAVMR0QtFZEP3eTp7ay?=
 =?us-ascii?Q?LvT+VkH4wBGNzgkAgkDlxuc+Dj9sq5Ajvm1W74m0xoPBz/1fmfo3cFD/sHM3?=
 =?us-ascii?Q?NKTWPCzbpareidyPmOU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4091fb-57de-4393-a484-08dd5bc211bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 08:45:23.5409
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jb905+kwVDmMruLkNaiACKfXSY+YOKWwJrNVJhvUaAV3a7M6Q3Tbw5Qf50AbAghq57nukZqL55UkGWoIeWzN/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8862
X-OriginatorOrg: intel.com

Thank you very much, Jiri!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Wednesday, March 5, 2025 4:44 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; mpearson-
> lenovo@squebb.ca; linux-input@vger.kernel.org; linux-kernel@vger.kernel.o=
rg
> Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correc=
t device
> state after S4
>=20
> On Wed, 5 Mar 2025, Xu, Even wrote:
>=20
> > I didn't realize v1 patch already got applied, just sent out v2 patch
> > this morning. If so, could you just pick " [PATCH v2 1/2] HID:
> > Intel-thc-hid: Intel-quickspi: Correct device state names gramatically"
> > from v2 patch set for the naming fix? Those two patches have no
> > confliction/dependence.
>=20
> 2/2 now in hid.git#for-6.15/intel-thc. Thanks,
>=20
> --
> Jiri Kosina
> SUSE Labs


