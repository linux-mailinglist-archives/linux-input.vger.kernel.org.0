Return-Path: <linux-input+bounces-4039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 874638D7D84
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 10:38:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 13E2D1F23608
	for <lists+linux-input@lfdr.de>; Mon,  3 Jun 2024 08:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27FBC59B71;
	Mon,  3 Jun 2024 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SIhXth8i"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317A957CBA;
	Mon,  3 Jun 2024 08:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717403905; cv=fail; b=NdUd6e5onC2le8HVxSzxBrBWeyk8F15QVsg7h8cGYPBJv9Hajzam1Gjql/bgr5RhMIY4ib0ZAER9A/yAsrJ2kfJrXsKJ9dQOAsF3cU9ZZzDuV+14/pAY5mWsJvojN4ttQBfZHpgGu6+LGOuDcD5eOYrV9k2efahxpJP1q36dSms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717403905; c=relaxed/simple;
	bh=V8IS0InUoq+P7a9G5WXUrkORANrIe8Zb+ZlAy1MpoyE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MyoEz5BMEJkHvMoqEJT/06gIIU573l0IPZlcO9q5Us/1xQbjbbWIWGPENgygXwkrTXDJYINYBBjnF0xg/ybv6lNGMntYeR8EfdVvdV6NBN5yx/1hgftokKXrOxR9Cqpuv7JE02Unv/pac9QqhsEtes3tSixYwaiCVCWJFHgU2Oo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SIhXth8i; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717403903; x=1748939903;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=V8IS0InUoq+P7a9G5WXUrkORANrIe8Zb+ZlAy1MpoyE=;
  b=SIhXth8iblzKtqmB3RzyzegA40aH+3YRyQZU6u2Mfulm6jO1Mjr0gTLE
   0bbohLyJ82HzCeg7sfJRJKkuI2/mbnQqRvTQchE1/nshybyKmBRNZDIWo
   XSTpqYIRJOpBfs+er1RxZNDn+bPoqHDT+k3Ponq/MWWC0wxz+cfhmIfup
   FbcNKnWefVjeJPvJggJKeDkNgSz6Dil6BrFnNa0uAk3TY1xkeFZQBJVR9
   Rafio/JZFY6+4coPqsRn2xm+POG4nxh2etAcE23E95oqVQwuqW120xCmr
   ELMMeAyrElbSIftBEieCyK/RXJ97SCo1XBooEXmHwrnluPHh/Yb3jQV8Q
   A==;
X-CSE-ConnectionGUID: krU4pX0OSqKfzFiv8w4jsA==
X-CSE-MsgGUID: HYDLXJzYRF6DulrzbAfohg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="14111040"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="14111040"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 01:38:23 -0700
X-CSE-ConnectionGUID: VAlUSIFiThOblrxlvhkHrg==
X-CSE-MsgGUID: XW4Lz0DZTIuyxEm7jfc9ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; 
   d="scan'208";a="36896639"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 03 Jun 2024 01:38:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 01:38:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 01:38:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 01:38:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSrBZQy0z/Wm7MDJKUbgoTK9PJtmtW7dHcU2nNLB14xkLvilkupZyFcaRIwWvVWsUUJhOsUTVqQ4YUfWeGWlE4DwSSMa0PglFe/OmOrZlSbiU5tBAKRjEqUp/8DuSJLRr0ByJbuEJ+bcBdCXA/zP0dszLy6G79QtyVReRPH/X1jqAfTb8ef0oUZ2y08Lbwn8YokKidNHXqvaJS9Qxu+LioP+yZI068lv2U2BUFaeT+7M4R9ndHv5D1CFHRnC6H/RBoDyFDaZAWBxLVH1Bpvk/IhAp6O9oMsLpfWOdYARbrCq2AMngE/v3wFJFrm0HmuzmrL2TfcwMX5SGGQvA/sbxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8IS0InUoq+P7a9G5WXUrkORANrIe8Zb+ZlAy1MpoyE=;
 b=IEuxnthLlcB5Jbtwz9dU+p48qZRNMCd2bPNJuLjNVhv2NKuDnF5JUD+bdLCVqLnJiHeIcIbkc5sme1LewNNXwcAn3hbN+G/9ru1AfarTeHH62uRkxAOTZvKhWN0zKxqC2hgGQVp66mnXaXdalFH1gX1rIrtsM3Lm9pOtF+q+mHDCTLDgBIodLJ5cArH6dToXW/Bg9T6tT+R7+1qsIRZ/sxNGf6pjuWnF0teSExhK1gJQGC0NS/249ZxhQYLTJIqJgypNi/Y2+HFzD6w5KPB3/r0tqU4PmtXVOSccvZ+sxRND2OJHCJA2je81/SNtW4/+bE1AoZJvuRWQaKEJx33D/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 CY5PR11MB6164.namprd11.prod.outlook.com (2603:10b6:930:27::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.21; Mon, 3 Jun 2024 08:38:20 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7633.021; Mon, 3 Jun 2024
 08:38:20 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, Benjamin Tissoires <bentiss@kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] [v3] HID: intel-ish-hid: fix endian-conversion
Thread-Topic: [PATCH] [v3] HID: intel-ish-hid: fix endian-conversion
Thread-Index: AQHatYl7RtJNneznDEuYtnprih+qnrG1t0zQ
Date: Mon, 3 Jun 2024 08:38:20 +0000
Message-ID: <DM4PR11MB599501461E04F76B9F32374093FF2@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240603074125.2963801-1-arnd@kernel.org>
In-Reply-To: <20240603074125.2963801-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|CY5PR11MB6164:EE_
x-ms-office365-filtering-correlation-id: 75b3ce92-848a-4b3a-65f3-08dc83a885ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?ug9+tk5MSMi+eC9vFszVnGTRd4r9b1/lyHB4mhDK/zdnWvLH3tPgUvSuBLf4?=
 =?us-ascii?Q?zlmm1uGZ9pxa4xAgRIx7hM8gMPKcyi4VbBBsLdIIm4s5MLSHpcKOJt/D7tDr?=
 =?us-ascii?Q?kKrN7v8wP4iMngBPASxuyAb3bNyunCrWnBi6A0N9m68TN1NCmHRlpB6j+As1?=
 =?us-ascii?Q?14+9T9FTQ3AXndCpFHCbZj4vaiXItzYilORmF7lxJ6KBd4j/qIxBRT3dZecb?=
 =?us-ascii?Q?AT3tNSBopyoyCTydTX6tlSb68kaClq3jQgqUVsVi1FCmv8HpB4+nbi2NVkcI?=
 =?us-ascii?Q?dOWVnkgDRVE22/VoVAr3v6KEGs5drnIcE7mpevP58VddSa4kbPukGQZU/kyy?=
 =?us-ascii?Q?wGCAiuc9JftJUdDQoO8q183H/bDRriBz7exG69Ph12gnhi1nDx86mJhFFpCU?=
 =?us-ascii?Q?kU2gGyJQeRMeNYdBr+wuWqZ/WfjX27TBTv0IwfaCfX+yz3RztPSOhCtOvi8q?=
 =?us-ascii?Q?a/tE6WenQjpYAH9n3Q9jeRu2kcJuTsvmNiNynENKMFbLCFkk6q+t+3PZX8K3?=
 =?us-ascii?Q?2QTXXnilSgHPe+sR75e6jPpdO0QZkTJV7Ny1CDO3m2sZ9HxD+LoR5A8JFkeB?=
 =?us-ascii?Q?imhLSQ5vLb/tkNm4vOyh6LtJW37w96LrnjzsuM3+K4BEK59A61NjjCZd3ArY?=
 =?us-ascii?Q?SX7Fn6LqpHPGBaVA7ccRQ2fAUZB3mNLUNwSNFQdMzcA/ljSQerWq1cfwqQQa?=
 =?us-ascii?Q?K2yJS4PYyZnuHYwL9vYVjlzNmv9FOaHofMMvHCai7XcovpYqwxnqpT1EfgWN?=
 =?us-ascii?Q?ERm5LyhSMn4bsH+gPNHh5vGyOOxudR2QRaC8lcmfyI76p+Vd4jes/+k/gj1u?=
 =?us-ascii?Q?XIBPaO1vju7iHVe2CTl61f9P37fHq+QvC0xOSy3oL5y1qcWui/51/CFyAU3T?=
 =?us-ascii?Q?Q/WX1zK/elvXFj3QI5I5xgFqgopRvEfFBv4+Dwa0Bze2a6xa1qVGo9TN4puz?=
 =?us-ascii?Q?VCI/me1Dj8iTysBTiUL6cwxlQFxkk36LKr0gaxpcWrkpXVMqVl/IFgLLDCOh?=
 =?us-ascii?Q?IY+VjfW5YF2IIozpmZXg27i/3JLSnb2bmx6uIVuzbYAdwUTAb4FNq5BLjQF+?=
 =?us-ascii?Q?3TGe6d2MNWnN5sD9s07KwVqkNCCLgAp+anOYSFBQFO3fMw353WC/HZpGzzJ9?=
 =?us-ascii?Q?tVVJeAxUibCj6UbL8sJO8OyLhScsQucvm2ClAmF4wo3JjkeKmtmq5RqDFTDp?=
 =?us-ascii?Q?K+PrlBIyfZLKkA2UI2P0FaW99dnvQ+xmwYlTSInDPzUD286P0TH/vjk14ost?=
 =?us-ascii?Q?CYf2bKS9uyjITU5+Ka5CnF+GIBPKq6RlXgYTa+D8ElrQ76UbLPgj841xUyhj?=
 =?us-ascii?Q?Wyi94/iW192r6mzk+zQw5jqW+xFbBuEJG7eZ58CbBn8Yew=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?B2HwEoELU67G0s1Axeil1vHnpshY/WPF8s/eTenJ4Ppn3eEDRkbvnwhtvLID?=
 =?us-ascii?Q?0wYJG71Cqv6hFNwhPEdfrMv/hH/bLYCJ5JB8vArBxC84Dfi+1J0Ywsbc4H70?=
 =?us-ascii?Q?HlTHFC7O8k3jvXrXVq+NOobRIzAZ0QB1KWjXs5G/fqLxwf1wOjiVbmctDiJs?=
 =?us-ascii?Q?tfzIf1/PzI2pAf1/NYnpxekhvg/4CPNll9pwisKeRWqTVqhtdTwJP/R/kXXx?=
 =?us-ascii?Q?OxwcHr/vCfBZA2hfhBYYJPtRjB/OfR5mTkX8O9HNi5qi18ljfEF6hmCB1WG4?=
 =?us-ascii?Q?98tQ6QrFKYllZFHzuwBlvl7yI+KlwasFnhqMw0dfVyXrvVo75wOgf5uOJPDo?=
 =?us-ascii?Q?azCzEFdqQjWRKthwG0aPy8EkVbGr1Rl4PE1SgcMAjGxUhEAg7ohppM9K0qDt?=
 =?us-ascii?Q?kPtnK9s5uBVixI7I7JM3JFGzkDVC1xPkhoL860NQSHDHZmyIIqeOBPmlh2LP?=
 =?us-ascii?Q?xh6sMRxwOwgFXiDmfTE6FjxtlJ+0qurj4Uz5AZgZui1YZ7kw3c30PRN+zhtV?=
 =?us-ascii?Q?0Q+WEhudjgDvSPTH+Bqg59BGZ0plK11VjK6RbnHH6+huAzmLDnI0UbSC5zze?=
 =?us-ascii?Q?1EivFV6K8g5KD0RAf8zBsvhMwH2T6B7Pte2bhfcr3UPBP2uR8O7pcfKz5gjj?=
 =?us-ascii?Q?WoSm3s3aBQReJjhHce4Ae1hblvJ80gbrdtkAS37O4YA2PjlWofA9ojVMgSLJ?=
 =?us-ascii?Q?fLzbL6HO29xJv2KX/6gHPOMaEXJpprg67ZZGcL180tYLi/8CWFH0V9sMREY+?=
 =?us-ascii?Q?aO/DNhce83AXug6c8N44rBarJLJpGQ2zrjk1V7XzpUT8KKvHSVXY5Yfg7KC8?=
 =?us-ascii?Q?9yE0M74Ht292IFsKG4cTUxpUuGbMNBP6ypibjCB/Tes+OSyLzxFw07aGiz+p?=
 =?us-ascii?Q?3v11USCgCAbjwjCEGDUYWwvylzi80lQ3j2m3f88taBg5Wfmjuuiv33K/rV+r?=
 =?us-ascii?Q?lLL0HgjQ4honNOpObVcL/ClZcfe8o0gji7xAxuBl9MC68ByF8dY7SLq8K1at?=
 =?us-ascii?Q?4/AezreI7sPdcoWBJ7StaLGWWg008t8Fp6+iqPnckrKQ2cyNfFuuO/7aN0uD?=
 =?us-ascii?Q?yXqrBvXTR2sI+dqFkZsVghifgiQPAyOyamFQZ+rE0AYKVkXwe9NSZoYJhD7h?=
 =?us-ascii?Q?sGewXnHy7St/FmxGvMzoUxj/J6DiPemuHfbSxRPKeSTupgEGMVHaGgv58yJz?=
 =?us-ascii?Q?cSj1iQufcjiknAL4ZK2uPGEwQWS3Ih3slR6I+zBuW6wqzr8Er9ZLoiBxUICx?=
 =?us-ascii?Q?tTQKXhhC+enY0f9nBMKmO/7zTKwL2InVrvDoB+jjv3cPJWUs33jAkEy8cgfm?=
 =?us-ascii?Q?mq7WJ/b7LOw1A5aqyMbKo02fBFE3kW2uTC6FLmQpZF7/xpngwOmAXU37js7m?=
 =?us-ascii?Q?AvqINRWteqkhUOx2K+aK2s//bFDNi8i+tvSG7vff8AuEgUVf+Fw3dWymgTE/?=
 =?us-ascii?Q?WLm1uf+Wam0skr97zcuCoaQkYKsl/6BUzMwG4Bn1iQNrNQfqLh60v60ubY7/?=
 =?us-ascii?Q?P86ahFu+EUrTwheGEphqveji59fFnspVV3Pgdj2VMprf3t75LATemqAhX1c4?=
 =?us-ascii?Q?NEtOvizuH9fpPkh/lwi73n8uV2LeEGnvw7P2Nbvg?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b3ce92-848a-4b3a-65f3-08dc83a885ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2024 08:38:20.4216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4pkpN2umg+etOzg9QPMbD6ZiN6fZtM0l1Vw/NmW88JBhgcJb/zRmbzSq91aGRdmhl7Paqb7KghaC7guLpi4sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6164
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Arnd Bergmann <arnd@kernel.org>
>Sent: Monday, June 3, 2024 3:41 PM
>To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Jiri Kosina
><jikos@kernel.org>; Zhang, Lixu <lixu.zhang@intel.com>
>Cc: Arnd Bergmann <arnd@arndb.de>; Benjamin Tissoires
><bentiss@kernel.org>; linux-input@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: [PATCH] [v3] HID: intel-ish-hid: fix endian-conversion
>
>From: Arnd Bergmann <arnd@arndb.de>
>
>The newly added file causes a ton of sparse warnings about the incorrect u=
se of
>__le32 and similar types:
>
>Add the necessary conversions and use temporary variables where appropriat=
e
>to avoid converting back.
>
>Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from
>host feature")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Zhang Lixu <lixu.zhang@intel.com>
Tested-by: Zhang Lixu <lixu.zhang@intel.com>

Thanks,
Lixu
>---

