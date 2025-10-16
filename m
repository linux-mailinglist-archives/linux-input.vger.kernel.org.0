Return-Path: <linux-input+bounces-15508-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C6511BE1209
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 02:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 877224E1B8B
	for <lists+linux-input@lfdr.de>; Thu, 16 Oct 2025 00:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0CD15B54A;
	Thu, 16 Oct 2025 00:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcBQBAjh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B628BEC
	for <linux-input@vger.kernel.org>; Thu, 16 Oct 2025 00:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760575337; cv=fail; b=PaEXQNhfcig4Dj4xlQwYFW6fnnYqZ1ptFN1EkOkktaa3AG5pOvYpmo9Klk9/jslcJwkLISxXo2EcYUcyE8UHnpviCgDGhXbaGQyyZqJ5Ol+23n0fbagMZh97vGSK8qkGB1M20yGMVlfPMSa5PKumJ+GqpLc7NhHn+dWnz0SRppg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760575337; c=relaxed/simple;
	bh=gEfoGx1rapbvFawG3VW6kkD67arVirmurnKRGOoTJVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qLQaVW5Z29BVHICQz2egoLzdncgdb7KWR02EC5C/TWF/lDFMw4R5t0dYD6FlpIAc7Y1ZxXlcH/zsjPdy3UBafg1GxRqrMJEthb+z+/LDGR5ExSthaUuQP9QyKEgzKlz7BDO4bFxtcx5LrTV8KGFjBtR5duwgqsdM5dCLaGNWZ8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcBQBAjh; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760575336; x=1792111336;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gEfoGx1rapbvFawG3VW6kkD67arVirmurnKRGOoTJVM=;
  b=UcBQBAjhRWAiJm4jZlcwQXe2y8s3285gDCcpGJSRLxqaHZLZ+wkGgTMN
   nEWi34aNnZ2Nfp8CtSD0iqTsU2412oGo5EGShF8NXa3WtRjtLEMyjcVlA
   Unw5PYgO/s5cbYfjLdHOvJgfN++SvTTg3pCPCHrTy6yGt0GEJkeQrFwUE
   rTuI9xPTmMvgxQXIlZQVEaF1byqZzewW0VtuTz+Ta/twGt/U0YSAbIbpT
   ISDKIl2LYNI0N/XFUMKkAle+WrRKL/pP40a4CEssI6KKU0IPKCUCNeA/Q
   9gW0xOhf9UBymfw/r+UeepPcTg1uQwqe4AKVCxuJLW3droCMlxdE2xvSm
   g==;
X-CSE-ConnectionGUID: 7/j5o4J/RLuik4HwYQK46A==
X-CSE-MsgGUID: +X7V6wbaTLu7FQftoPdbag==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="73039289"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="73039289"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:42:15 -0700
X-CSE-ConnectionGUID: 8Y4VjYjxSMaz7fEP6iLfTg==
X-CSE-MsgGUID: QHToJpXBTtyzHvIbto4Pbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="181525787"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 17:42:15 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:42:14 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 17:42:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.40) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 17:42:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yll85Qb/1Mki7ELv5rjtBI2ab49mkULL3uoHQ4NbyPP+OjkQCf/9G03obELyhV0zX88o/yYZIVaCCG0ZL+/gTfFQ4GYt5Icb2b96y77WNwV5i9UdZzLZ1mJLR4CiG/i292wULtsmwgzCJQ+JmD9agFmAmM+QrtNSvLOtc8lh3l7pITAFje2p+kLLGgZeNl90ij7sXMDQKd4NqbWgMcbc9P9t34Ns//shZIxTX2LWW0UTT7dy5utnAcQB41iWR2rP6QQQIAeNPV6t7Lk3FDRupgeGrax9RiAj6KwlSiFFsJ8EHwfO1f/tmd8OhRWn1WulR0ZS2pTBza7++yTd4UKHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEfoGx1rapbvFawG3VW6kkD67arVirmurnKRGOoTJVM=;
 b=vvWSv0KGukWxW8JR66Rn9i4i4/2tuhNC4IuvQ9x4Nk1i1/2fPy/y2CzRkrQP8mGCdNyPTz7hQBoCJvaVn22uj0hkXF3YD3naz05c6Y7T5y4fMxbmVgMkFXSptpoJbITtMZI2fdosaVJ4lNgCUnKNWzclNcUz8IE2HRiDmcLhx+XsS/yeACChcwVQN9yxLmXTAHYSnMUlzq62EgLzISKLnI2z04NWmOt5/MroQ8tIumYQjRIhjxhhJWyG5VoPW2sgeq6T2ja/Vh68JtI9j588Z8Mat5cyyjpAd2bmrY/n2HydokyRxvSC+KGB2fmFZOsY76BkTqAJP/eCj976sa6Tlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 00:42:06 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.9228.005; Thu, 16 Oct 2025
 00:42:06 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, "Wang,
 Selina" <selina.wang@intel.com>
Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
Thread-Topic: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
Thread-Index: AQHcOam/jRZgMRgboEGE0l34h8RalLTBpwqAgAA0O4CAAI5w0IAA3TyAgACwrmA=
Date: Thu, 16 Oct 2025 00:42:06 +0000
Message-ID: <SJ0PR11MB561382CBA96A7591BABC6FB093E9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20251010055254.532925-1-lixu.zhang@intel.com>
 <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet>
 <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com>
 <SJ0PR11MB56134BF6170CD82795EC2F1B93E8A@SJ0PR11MB5613.namprd11.prod.outlook.com>
 <8nr40316-26r2-6893-qqpr-rq37p2nsn7r2@xreary.bet>
In-Reply-To: <8nr40316-26r2-6893-qqpr-rq37p2nsn7r2@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|LV8PR11MB8485:EE_
x-ms-office365-filtering-correlation-id: 71cc7aef-f30b-48e1-db75-08de0c4cd4ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?C0rVJ5xaruI//dmqKmn1MlOrigAKazPyRXO0D7PE6q4Okt4dcfnxXXTKG/Qz?=
 =?us-ascii?Q?vrwy3vsrdJJOYNC6piowhWeSJWRaYR1lvEXPtd5dxZcPXY7LforLB6WbbOwk?=
 =?us-ascii?Q?zI5KcM+jvsZN5nZENr5t5wShRUs+obybOjg7eZdIysXUJANflrc2HSBQoJqq?=
 =?us-ascii?Q?sO7w+MH5Z0uQl5FKHFPVzU2mfsdv6qfv0OTbXigIDOcHzD21v7Rbw3CGfJK5?=
 =?us-ascii?Q?zlYznQBtiWHZUcjIAntTC4sw2XzJ1iLzMjyrCvUp8bEJOnHqagPZxztIAecc?=
 =?us-ascii?Q?Nm/r8bFk64xDK1LtUY2q0ssWrrw5RPioeEJPkVcyCGdweNxisejut90PiwPL?=
 =?us-ascii?Q?Tqum8phVBVV/RJ/47O/Hj4sEX7X3wU52uv+dl1636h1slLK5Q1nwj0uzaNHF?=
 =?us-ascii?Q?Y5q2NqSgr6aD9Q7kpO0aYnvBfHwdefT46mi7ydLagdP10c7WgRrEVLn6PjnP?=
 =?us-ascii?Q?rhN1P3BFoNmQ+Ju8teOIvwDwamrQWGqnElDTvG+kxgSvBQJlAUvlEWitcoeF?=
 =?us-ascii?Q?ekbF0/7y2Wbqe955BH3XJW8jcwGuoOr4vfuh+WfogaBcAjklw4gHQtzrsOzI?=
 =?us-ascii?Q?5e7cNiMIEiJVk1ZRVNzTloNKIGsA80TQu/k8OvfIaEHUs2ieeraklVnOcZKs?=
 =?us-ascii?Q?yxWq/CldXGajk2A6z12hn+VdQAOIFf6ZebyxYS/ehEYCAQ2lUgbIMaXcitJa?=
 =?us-ascii?Q?Kmhxp9n+FMv+b6aop1kmax2bRnpxFVcywHXNg5BKul/kaK8FGWrBmKCgy+l0?=
 =?us-ascii?Q?t6rUO8VagI1Jja/oQYyJjIFFki5eTIyKBXsIy86Pr8zRNppVlElkt3e+T1uv?=
 =?us-ascii?Q?X7YX2gZNsw842UMuRgiO3uuvt8aO68ftd/qnqGFGXaIWAzbBnHR/LYVdde1P?=
 =?us-ascii?Q?908uibjdjEgCVkdcag3hkDSxu0Tcq2FeioY1kHNYWZmPP6mnsFkwSA+0/MWm?=
 =?us-ascii?Q?yUTwbFUgmH3jLazN1woATUj4ZSFS328cqHacEukTpT5kBBXrUWpGRa6P4DIb?=
 =?us-ascii?Q?bg9IIF0Usosi9w/YM/an2eLW9sHXEFGjd2Vqs3mItdPr1Zi4tXx/FDG9tcCP?=
 =?us-ascii?Q?tW3kgCfTXU5ij8t7UKrjn7hYwNG/DsZxb3BbNTXXsRJGR0Odw6Pkl5ZslKiZ?=
 =?us-ascii?Q?ldyJlikrRwHNxJh2yDU/g9o/qWeHKWM4h/VfUdlE0juHUggxNI8upceT8XsF?=
 =?us-ascii?Q?HCUaNnRtmCUJTYnzMieBzl6NqMevd/zoEYZe0BbT2BtAwLvWvH4N32AVKDqE?=
 =?us-ascii?Q?OiXzbh1E1uOZ5DFT4RzTVHVUdch+dBtt851ktSDp7LaF3OXkhENdf/OBR9um?=
 =?us-ascii?Q?zHR3nLYB4e5pOtdoBjzx8FG3ncKIHN/ID9ZPKbaJ3n8xnnnfZZJQl0fTbUVy?=
 =?us-ascii?Q?VoVrzNYeUrpxbqISTrqzNE130oTOhGGfMPjvRWsE01fQOQA8jq6JCbpTtiu0?=
 =?us-ascii?Q?p5KwwvhilUJizcpEyXM09WHwswKzWEYW3GAxDWirnduaE+maQHEijLN4Zdow?=
 =?us-ascii?Q?frRrR53977FIOKPq1fzW2N+KXoZ88NTUZo/8?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nDB89AV5mUIMyiTLs809Wq9M+jdQ3Uz5HmJtn7o9hd2w4/sQr6vFEb4jbCNF?=
 =?us-ascii?Q?n3eRSnyNEfi7a5p921XVTASOzUVQS8meMC0dxXdrgXV6W/XtN749VmYMOr8I?=
 =?us-ascii?Q?ZRp+24EamShpiDHA/4dvjdA2q1TQSrQWEoyKTr3Mfmm3yTTmknRKGUZvVMNk?=
 =?us-ascii?Q?CDG5YDI7BzMMOgAofL+GcCoOOxvyug1OqiqaR5PFl6YJBHK+0WNcYqcdkrzQ?=
 =?us-ascii?Q?BAHezBs0JbtmcFwdDypiJBmzQmRYsspHNqnQHMyXuzLGcy8yD7C2TqrV1Ypp?=
 =?us-ascii?Q?MscEAnGuX2iLqYDWoNakKNoVQYntMbNS1i6kACXlwsrsH06cHjdh2E0+Xn4z?=
 =?us-ascii?Q?Ek9afl75hcb6uUzX4eq4u0OEWHHvq3t62nfv9Cr2MYJ2YCnF4mt5jSg3C/dr?=
 =?us-ascii?Q?klIKrfgULwCi7n/31qRCNKHQKFhetOShuxcDD0o+0Bz4nqLpcgZx3N2hkICO?=
 =?us-ascii?Q?HHqWMhfAj83QODqZpg+PFKKx1eN2mnzORXBrUrfmepQa5JwMqbCyLvN/mlTj?=
 =?us-ascii?Q?mjXw/OXYMCsG2SVhOj0dBtvWAQluTd0n/oVcZlsHlcNZ2FeVF543rXjfRB+4?=
 =?us-ascii?Q?UHAdKMIfoVxvbSc9Gqb5GIZkjSAmFj/hQUJ6Hce1cfNs+xrJX3N2x5kaBjpB?=
 =?us-ascii?Q?+TY+CtgZJZgQpVueQ+HcdSW8v/RXK+xTLX7pD64TP01tD+nYi5D6CGC4sg8P?=
 =?us-ascii?Q?oPuR0nNyuNlet6Ud3KQsCg5AQDdo9um5XzuCD/59amgq9j7Cw9hMHVLjDJ1d?=
 =?us-ascii?Q?BNjaoEsvzeghGSeW1Sjn1W2x5RLLEd71qzotwg+zSWwCslecMQHyDF66kDDn?=
 =?us-ascii?Q?zLvrAF3rNV0fK1FBk+Up2CHvCSodcwT5zOaVEQy+gHFKEccJNlRGKjsEpNhQ?=
 =?us-ascii?Q?GOMQG+tsMFXDnj/PqXOU3bCqJyPEq5BcREeUdQY4iEQOQZ5PO/Ait+cLJBi7?=
 =?us-ascii?Q?2z0diMFFeMLRTNX856o47JWZSXLCJpboSLqrXtsV5E35zbK2LXpcTYXwJUy2?=
 =?us-ascii?Q?dKdmnNxkSVfwN9KWfGjvWTkuSGqnAcjIDzUZ05KaJ5HnD/JAPhFBeB2eRuCD?=
 =?us-ascii?Q?uUDhd2nPbRxT7qEALv7D8860bjaSoy7bgqH8vkVmZwt3SuDMJatJrZ4A1Imu?=
 =?us-ascii?Q?LA8V8SC3AYvJMDSok9FbezWAl7ErsGP2mvrEw4x1IQbYFxUzxMZMp5IRgiko?=
 =?us-ascii?Q?Z2LP8UZcDjKebF0189rL6sFjDt3HJpKFwcYq+wmK+E86RGWH8gYUUn1klbZ7?=
 =?us-ascii?Q?Br70mEHDfSpX/XMc8+9R/MLUmf13Rl7tu/8TJToP0svWbKGY/ofmkmuoZPlt?=
 =?us-ascii?Q?+DFg2TszLo9JOf8sWz7GiaDAnrMf8uHtOHfL10lX8815i5R64C4yNhS1qBeu?=
 =?us-ascii?Q?ppW/zDG8dzZwzmjusiKwqdnM18DLLbQjS3WU1yJKS/79JYwA0AtrAYtPJ6M7?=
 =?us-ascii?Q?W9GW/L0z0SIxCJlb3sfSbbiZPWvTnwj1C7aHl1C2XRyWX4UcaD9SmWsQk8vn?=
 =?us-ascii?Q?IR5YWC+p7Mhc0yYClaCf22SBlVSHIgftJTSC/JPzKTufB9AcxY8qXLWSm8jB?=
 =?us-ascii?Q?ZQkvtaU/Enan7PO+9/OFQbrGRztT0Y35C8SNeyHY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cc7aef-f30b-48e1-db75-08de0c4cd4ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2025 00:42:06.2498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 28CxV1PD576Fsf3aszUT2oCpDZ4OMWlIcsMqwDr9Ghr+FAHJhxlTNLaNvzHE6AnHPo1gRK9830ghepVAfrKnHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8485
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Jiri Kosina <jikos@kernel.org>
>Sent: Wednesday, October 15, 2025 10:08 PM
>To: Zhang, Lixu <lixu.zhang@intel.com>
>Cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>; linux-
>input@vger.kernel.org; benjamin.tissoires@redhat.com; Wang, Selina
><selina.wang@intel.com>
>Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues =
to
>prevent resume blocking
>
>On Wed, 15 Oct 2025, Zhang, Lixu wrote:
>
>> I personally prefer to have this patch merged before the patch series
>> [PATCH 0/6] HID: intel-ish-hid: Various power management, since a
>> merge conflict exists between this patch and that patch series. If
>> this patch is merged first, it would be more convenient for others to
>> backport this patch to other kernel versions. BTW, in this case, the
>> patch series [PATCH 0/6] HID: intel-ish-hid: Various power management
>> would need to be rebased. Do I need to send a v2 patch series for the
>rebase?
>
>We can definitely do that. The question is whether this one should go in r=
ight
>now for 6.18 still, or we queue both for 6.19.
You can queue both for 6.19. Thanks.

Best regards,
Lixu

>
>Thanks,
>
>--
>Jiri Kosina
>SUSE Labs


