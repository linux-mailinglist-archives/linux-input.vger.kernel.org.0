Return-Path: <linux-input+bounces-10574-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B2BA548CA
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 12:10:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB4AE3ACBE9
	for <lists+linux-input@lfdr.de>; Thu,  6 Mar 2025 11:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39110204699;
	Thu,  6 Mar 2025 11:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxLMTK9d"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4038C1FDE37;
	Thu,  6 Mar 2025 11:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741259361; cv=fail; b=tAXrO2FxdZD1N6gNPZv7OTaDWHJUcGHX+zcdaqfAhSMelFb3WRLzPxdK3GmZdbwX3VQvlAImxGaguPbocAWs9dwY0HILyPoA044gkIGfe8/o/kATb/tcZa4kGl/qYk6UvcIRXrf2zeMdhJ/wZs+Ef4fr2FJf5yFXhfZMeP6D6zg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741259361; c=relaxed/simple;
	bh=KFaFHqY3sEW+F6oivy+Y6EAT2ZHmvWxv1pWk167WC84=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QOniQAJegBiTVRiphspa+uq0bd4ksupLLwegw4ERaNqZBQDjccLID4AsJpniPGLw0nlmBwwufR5OtGQbf3EFJq3hozxGwv++rugqBHC5XijdgXVwUDSpCUouklibzs89ZKCC9MVRRiMZZOaX+IcXhMMNV/drIXiXRhmHoXyunBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxLMTK9d; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741259360; x=1772795360;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KFaFHqY3sEW+F6oivy+Y6EAT2ZHmvWxv1pWk167WC84=;
  b=YxLMTK9dOE1Du6g1Bvi8IYRLTuhkNqaIkSxrgNS/Y4vihMM1x8qUL/FP
   BtvDTxcmwlld7RrsVoZf+T4jzUoEXHUcs/5Cd4VnkcDhuM69ZRf1BubAx
   194kjqBwFRgK+ss4HKM5Lkwsfo4MRS+K3pJYW+Ia2qano3qva7583usTV
   3BoZCspRiU4mDAf6WKmxu2/RJKLGS9U6Kz6LF9lkC7z4kzhuVfBB8y+Pb
   2dFTzfrJgBSlinlk8eiQuKbd+RjPU7fOtk/R8j5fVjbV1lzykH/8SWV4e
   mjPLRPQ3J+k1nRgsisFxqlDFYXGEmtwATet0r1f0bCaHV5wA4qgkmMpMk
   Q==;
X-CSE-ConnectionGUID: YfQqmt3DS6SaW7sBjT5okg==
X-CSE-MsgGUID: qQa0A7zUTYOlykRuAVP6VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="46186235"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; 
   d="scan'208";a="46186235"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 03:09:19 -0800
X-CSE-ConnectionGUID: ugcP6VyYRjmuVD2XJfLgVw==
X-CSE-MsgGUID: m6xwAjGhQn2r2P7gXrNDCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119000344"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Mar 2025 03:09:19 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 03:09:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Mar 2025 03:09:17 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 03:09:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcdo6zhsx0w6jwUeVzx1vleF6fShrTBbEfdAuPYCdsjUatfMAW5TlwSKo69o3PKy6nQRF48YsUkzYCU1Lp6OP39nNUBxVhQJdMtOatS6zPsNxxTTtwKmnAXR/pUHIH+oQrNeKUPbvwSnZCiijD2n/sJ7QzlEMojNWGKGWO7c6CU67VOo9GIST541lH1KFGZHDD1OAxZLxpvnVzp0nVDCfzp19Mku03oB7l5kpH2wM4+m363NpZ/MvuS+zBo5lPsDbDoVIoB15tnSS2LojoM4DJWiFLqt0l2tmZkXaMZgtcgoNZElvet9JqTizRL+PdKpjqZBxhLXWyAGZUCivOLSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFaFHqY3sEW+F6oivy+Y6EAT2ZHmvWxv1pWk167WC84=;
 b=lDQ88sde+MT2mArbjz8OGs6O1uEPJrXp/Qn1yWFU7G5EqFOOOrvlcwGAggeuLismE1tEfo90zvhXJHf1/ALDrhqQqCSCGOy4FczFkTflOSNkNJzcezB/FcojUT+ixS6C2qeYED5z9ihgTBiPa9Fh9VrZOQRfV9Fx7DeE30/5n4EOJkgCddE0+gsN/vqtuEFURj0HHwPGj550JLMNW53X+PXR9aU+cwBJcFuU9Cj3jWVPBlWEyu4dx5D34kDj5KGfLZBMwjfT1RvGDJ8Z+5EPb6t0NuD3HI7Wn0l15FgM2mQdM4C/IoWrcbLnCRjdFxK4HoFUtk2NVsEj7NdLZbGu0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 11:08:34 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 11:08:34 +0000
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
Thread-Index: AQHbjLTcANInlVCQx0+6PVpmKEX957NjdcAAgABCBRCAAE/SgIAAAGLwgAA0LoCAAboagA==
Date: Thu, 6 Mar 2025 11:08:33 +0000
Message-ID: <IA1PR11MB6098AD3A90B92EBAC95D2818F4CA2@IA1PR11MB6098.namprd11.prod.outlook.com>
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
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH0PR11MB7585:EE_
x-ms-office365-filtering-correlation-id: cea36c82-1f36-4ec8-c97c-08dd5c9f3c6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/f0uC+DP2IqPI4FN16SY+NgRzF1VjcYGCdXujTA5WHLleJqPdNDDvvFHw/sI?=
 =?us-ascii?Q?ouxF3dKg+yfxnC65VXJgmK74EeZk/kP6b/G68OSYSVDm4SnsOJ8nLZSJGIv6?=
 =?us-ascii?Q?oX26f7koGixgZCD5hKInljNEdiRtxlvKgE8ZUOpdCB89pmLwKyALiDqYf/Sm?=
 =?us-ascii?Q?moGYqddPHsQfpB9Ry80E5iGO05qvKTw/X48wbRl3H4lAK4eB2OY1e2Id82Pc?=
 =?us-ascii?Q?m96IThmVPte3/BIUR8vRxbfUUy5vw8ZXthBonNQzQ55cST+vUrYlQ0T9q/wt?=
 =?us-ascii?Q?ZYTpmIdqy5p5YmgJQqXy58ZsSlc8ccAquW+2cks6vdS7zKRdk6F5zgm4gLjb?=
 =?us-ascii?Q?O4ylnjlxiSPw5EmeoXEst1EXrp66aeqeUYVLUTkMYJDqLBqeUe915W4b3/Qn?=
 =?us-ascii?Q?mu9ULG57MyzqAYVjCMhCmEA5jbZhdfFYAI8y3lv6dKRFxcGzoCW/UPWCaUxC?=
 =?us-ascii?Q?zOvF1AIlGWlBJv24Bu0gUkebc2eYBWL1sHD33uK8bs5u+VIEKQUJDV3d3f/9?=
 =?us-ascii?Q?NH3Sv32pTNGXp02ZiPX7/2OuNfrsXs7TIH9OLJCb5w/kdTrmIlTuGuUedgI8?=
 =?us-ascii?Q?Mk5NLUZwB4+drX872X7OadPHdeMAwLytrhKxKifSIiHS/DdMpTEd0p83Dy9C?=
 =?us-ascii?Q?Vdasc92ttdI3TuUUysYT5kB3ybx9m9LMcSz3sbiNdHrm/T0jQ5ZWoEzTyliP?=
 =?us-ascii?Q?uusKC6Pu1ZCVWK6FYIx+9ZbjAmevEEyMv061sOj55eTFKnVpqRCRueiwF4aI?=
 =?us-ascii?Q?LSZ9qS0Xg9kLxLfn+K8bs+F2gdJgCg/GQTZZcgkdRPJqfxBnryNuGlcLBNoR?=
 =?us-ascii?Q?XeLq6g6B8dc12hWwbrz7UHMzDTa+VjozywMltVVI8/aL/wa8/RqVmXM/12wY?=
 =?us-ascii?Q?t0GNHLbRDPrsEmmQWvjBKc6u+Cvb8iDgDzOVV8iuTdoWycUkB/LwZ8UHUyIp?=
 =?us-ascii?Q?FxLXiUMV8K2EEQw1qtVG+XJhCWXMgrFPUEtwe9nP+xf5nmeK/4+SFU5y8ehr?=
 =?us-ascii?Q?usLa439Ug6lFyc0jKkKyX7nFlDm3UnYefKrRj6VkBw1sX60MCaLPjGHupLuJ?=
 =?us-ascii?Q?tNOv/XKKG3KqiYv5Tp4ny2qg0S4+N3LJGyj9n1e91ZFii/aNqZgXFsu9M5f8?=
 =?us-ascii?Q?COFiY7aRbcauw/IIX0LqFjMP0D3DyCKtaLmfa8bz88OUwf1W6QfvNnLhjQea?=
 =?us-ascii?Q?86I4LF8W9b9a3w4opVDIbf8qUxsW81pDhRgiyLRxAVMtokdPUC+Kd5MaSssq?=
 =?us-ascii?Q?BtLFDS84ZkxSeFgz0UbLiS6g+61Pn16K/uAXpJ0cNElnZxC1wFhA6XhkQiKW?=
 =?us-ascii?Q?XY3Ld8fMjlPj9Svq7i94O83738s+7nEPLymMk4nAjFhG+g+Lmnekr5oTkaRR?=
 =?us-ascii?Q?OGFWQRyW3+V0LcJcyaoxRQ5/gKl4zUWJRiuuIU6wsaa0RnRQhQC9cPp0rXoC?=
 =?us-ascii?Q?ZIxaiP6uRQ9+6FpPjLMzReCUgxRAm0uv?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/t9/YNrOqveIbtVYP3pgqHYG0tVxvp59YpV0wO04bdIVCwlCAPOv0pSgyTkm?=
 =?us-ascii?Q?IC7Z7PPO3UVsYgNlOSyOSApbWRR0yeIzjSCZNAlvfBoj+B8vZDHF/1Pw4ksX?=
 =?us-ascii?Q?z1JfTJI6NPK2gpueVE5U7+6xECyJgf5sVV2EOzl6cocNLYEM3IawnIDf2EE8?=
 =?us-ascii?Q?I/aiMrKTGwIhpRpKi9NJn4TlDblxOuuw5nEdJLH30tOBqF5crg8duntyZOOy?=
 =?us-ascii?Q?0ZQx8Gs5oe/+0d7KdvwpoyFaO162X7A7JERg3wq8khKCoCq637rRsFMDjAjG?=
 =?us-ascii?Q?uV8WyDarIb9xzo4BPXLMtTRJCGvdutGWf4Qrd76yrQx7fMwkB3+pBMqoGTdP?=
 =?us-ascii?Q?7LBVsBtgD5z8Lk9JZIlKudDsvF/3zBPXFaIvAsNNl1JIBTN1jNl3WW2KWX9r?=
 =?us-ascii?Q?RdJbx0sahTgffpyrS1u1ZLF4cGuFnxR4aYVqK47AH1SONiYuoIXdP7iCi5S7?=
 =?us-ascii?Q?A5ovnvH/nVgoyBEYDHibkDBl94KM9hRo1qNfb9WwoMuPANs9fB1pLiOmeQhB?=
 =?us-ascii?Q?NrSpLpX0LUsmFk35g9IMnf95PjdS5dOKD9Z/7RO9arHU4I5Te9XYD9c8rNKO?=
 =?us-ascii?Q?op3tA7FYHjPaOY3SK0nCMMXnw2MBH1+dSLN4j8c/lcn1AqwNPMy2amhlhSpD?=
 =?us-ascii?Q?AH4+indz9SbRSdaPRLGPLD1BtUk5bRWiDQhd5vrmb9EFZZ4rcq+DlMAns0OV?=
 =?us-ascii?Q?GZsMXk8BJexvvfAYA8Vd9Phs5cJ/9XaVMOaY49D1+1zMyaoKTfRaFnKwAJra?=
 =?us-ascii?Q?mi7qMHQ5Ya8FbgsCnEBlWFd3tPlLXYh30G4bwm6T35nuPdDJK52lz0B0M0tP?=
 =?us-ascii?Q?CH+Z/uiYdIKmjvPDIP7skEgIFC4v5UIMyO8opymCIVEHllFtsiKFOWoNygz0?=
 =?us-ascii?Q?sYdvwYR2HQhDwnZtfSmZeEa3C7FH643u4QBIPyX0LcpngCUmhNMkkkx48ZVa?=
 =?us-ascii?Q?4cNJN1639snPFnug4ga2L25/OwXCQ1jk9XrWmp/v+pUvzvJwqErIcPXnHFDM?=
 =?us-ascii?Q?2ScOkQMmQFyFDxUimx45jxLIbaYery3anYTL3/ykIuIBwPLedhetgnMAgWZl?=
 =?us-ascii?Q?jq6eYx2UTGoJxQdbjy5dMsGvrdTIeLgh+WhYgdSC1YS8KrpRuatc4UGKS52w?=
 =?us-ascii?Q?ifVKcgYq9DOZoj4sXPcpNRqv1a06G43iPTOwPOH0YavmNiLXUTGmrI/YHDb6?=
 =?us-ascii?Q?95b3pzGjJNSj7NqDj3VITnL23DTie+RHT7T9DB/pqOnryWTZ6ryShrIALGnW?=
 =?us-ascii?Q?x3qjZFGj1c2goRSGMfMC8Z9DCkM0/YDHcqHFmZ+QSx03wzwfFyBBvJo4tBpP?=
 =?us-ascii?Q?LAlmhFm+CmC4se06vgzXL0kIZ/boNLVQcUSn5mmjF2Hpg8NRffduqXKiGC0i?=
 =?us-ascii?Q?F0krleE+utk8Nz6pyXQQQkZxp9ugH9I40xDuwH4avMdFcIVuQk3dAhL7YhLn?=
 =?us-ascii?Q?dlzE8JaKaqNdkf94uIorlm6VZ15T7vNxesYtOW97lhxQALnP1OjqbZ+2qApL?=
 =?us-ascii?Q?NwkSa9o+Z7bvr3esN8jGmyRCzIHkKw16UddzcSMeMyuqw7y46pUKgsp8fLq2?=
 =?us-ascii?Q?V8nKgtP2yCQooNOuzBc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cea36c82-1f36-4ec8-c97c-08dd5c9f3c6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 11:08:33.9314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kx6/KiT7EOXwGy7zoN9IFtqUq2GettCOyZvUkuSNJvK18zLifjLq6Kmp7T71N+Tf0YVA6yHItxbkx9QRawXmlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
X-OriginatorOrg: intel.com

Hi, Jiri,

Just recognized you applied [2/2], could you also pick [1/2] for name fixin=
g?

Thanks!

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


