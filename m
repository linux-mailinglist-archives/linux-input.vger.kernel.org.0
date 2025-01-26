Return-Path: <linux-input+bounces-9554-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817DA1C605
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 02:10:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C78C16787E
	for <lists+linux-input@lfdr.de>; Sun, 26 Jan 2025 01:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D86F156C6F;
	Sun, 26 Jan 2025 01:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ch1PHbfR"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4678717BD6;
	Sun, 26 Jan 2025 01:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737853829; cv=fail; b=DCIsCLWaxWUWQkIf1X4tMcv2sRK8qqG7TXxnBTa04KZaj1i+yu1TYPLtUnTv0rVnCprzGhOIQrAxvAyOmImxZRZVlCS/VEuVtEC9GQNfX/cITUI1xU8cp5z8v8lwqZgVWLoYlwb0vU6uIvho/04A2n4bufpNO7bqsVOVdzActto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737853829; c=relaxed/simple;
	bh=wjuSEHviVPGP6oFyxtcnZ+5nwgvcGpnyn2FF6mLU3i8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rn6dRYdPUbRGIU0zF33jGsGWn+WUHNsJzxefNMjB/FHc0AjTl14N3b4AGM+vpljuzzj3dhk6KpgW1pkqMpK6O5z9dngjclirkrVRG0D09jJs3kYwMJ5gf8sx+Ah0+2oI6JfVT7W+0iEHuLJ07f9jOItgUO2bgHCzw3xrjqJzF2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ch1PHbfR; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737853828; x=1769389828;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wjuSEHviVPGP6oFyxtcnZ+5nwgvcGpnyn2FF6mLU3i8=;
  b=ch1PHbfR8Ren73bT8JMPcLjpj2SoOygN4r7DK1P1jrvnqsnnYWeAT0M4
   NUcOiwbTVnzJ0HpzaeR9tc1LbRqZmqxJcZoYGcHO2aCKmEUy0zchWnTtm
   9qhPtLlW+jhNU52glU82Nm4BW7Xt8vUcuyuiygCDhNZR/f9hYxVpR4ohF
   LsTe9jhxJ3LWsfk9zytS81q0d1EIKas3MOdYBKf0mF4FGJeM37dVRUekp
   SsyKRAi54Cm/tqs4exU/ajooJNl1GIRDwgVPIuA2WXf7XlnxNQ0bcH/u7
   Xk7tndLEeuHzwgqQ9qVa2YqcMoqXcx0AfYfrB/UAIAGac9QuXk4Fi24ic
   A==;
X-CSE-ConnectionGUID: LKMYmQJSS56UiYhMcz0pRA==
X-CSE-MsgGUID: d02cZ/5uQ4K9F2g4q1P1zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38452610"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38452610"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 17:10:27 -0800
X-CSE-ConnectionGUID: 4WFCvIzkSCuVLj2cNuaQJg==
X-CSE-MsgGUID: U3ET/uGQTfGPZGdQ8tMluA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; 
   d="scan'208";a="108086539"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 25 Jan 2025 17:10:27 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 25 Jan 2025 17:10:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 25 Jan 2025 17:10:26 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 25 Jan 2025 17:10:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=go5Wnv48aXegby+Eqj1jZxm/fTflv96a/q1oySv5douHdEP2aeokv980F9i3Mwl1V1cFJnonmbcuNmTSfOQKmoetfPNwhvQ/PLgtGDmoloaee2VSgEu3DRx3XL3jmGvgbmn8dBhNnUGttQpk4vHssoRx/oZsdzs8smhjNrQchAIxpZgWQjTJdACOe9EIUw4y7QRZuAVCIvo8EMlVBoJxa99KFB8rQtrfSfthrmShZgSw1CjS4kvVevXy1fvBZyOZmxT9oDHQRNCgWQjlavEQV2qTQwOaqKE60wwATuJ21Tz0agUd09GfHrG3ugzFgaYXbtFuRBTJwswJaiQjFDDVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7OBgFYsH6kdFJFJ70eV/AHsdzOfkTDCNWfr4Q2ol6A=;
 b=yhtMPiw+s1PmpG/PxI2wxENrNnRPeewuwdFG5jqkE1sTivi9x9x2QTROOedqLTgmGq/2PuBlcDqMmxn1usCvP8p7eVlTx/v51LcYAKF4ZRIJkma3RxXGp9JHXDr89UCTR/NgPb5rZSb+mo1tlFcznQXmm87coQP3nd5PtZfMnfUdNFQPSPXgT4/hjlU5ELnGCtQk/Wvu0lU8TnX+A1EdopVAcMxebXqk7r8kGxF3G+srlLs7Cto7d8bah4hzW1zIIiG17yRp6Lco6Y2HQNZEneLIOc3Vh3RuyG7sfit1bGnUZhcMUnjBHmtNrXswGlhNrrET6ssmm8wRo9NP7Lg0rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SA2PR11MB4889.namprd11.prod.outlook.com (2603:10b6:806:110::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Sun, 26 Jan
 2025 01:10:09 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8377.009; Sun, 26 Jan 2025
 01:10:09 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>
CC: Arnd Bergmann <arnd@arndb.de>, Basavaraj Natikar
	<basavaraj.natikar@amd.com>, "Sun, Xinpeng" <xinpeng.sun@intel.com>,
	Maximilian Luz <luzmaximilian@gmail.com>, Marcel Holtmann
	<marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, "Luiz Augusto
 von Dentz" <luiz.dentz@gmail.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-bluetooth@vger.kernel.org"
	<linux-bluetooth@vger.kernel.org>
Subject: RE: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
Thread-Topic: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
Thread-Index: AQHbbZ2g8vhnMaQepECjRQ+4ESR/HrMoQj6Q
Date: Sun, 26 Jan 2025 01:10:09 +0000
Message-ID: <IA1PR11MB6098B58B7944838A46F81AF2F4ED2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250123134908.805346-1-arnd@kernel.org>
In-Reply-To: <20250123134908.805346-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SA2PR11MB4889:EE_
x-ms-office365-filtering-correlation-id: cf547e8b-01e7-46c3-78da-08dd3da62d68
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rRSotSOpzX70mbRKAjgm8yzG14GL6LzNo0gHY+9Wt4Y/48tAjGQB4o60OXxK?=
 =?us-ascii?Q?w32DPNCo10uwI/JhpQWHfwe6JSW58H3fZMGiHWuI/gNsogsRihNedcLELXmK?=
 =?us-ascii?Q?sxJD+NPYz9nQ1jwSQo/zcep0xfmX9S+HlgJ7TlmSw405M11bY7jFTFEgGUrX?=
 =?us-ascii?Q?mSJTNbebAwxdQCcYv3OOfkUH15JTXicPMmvSVYAMUCUCC1FxV09x5icQRCP2?=
 =?us-ascii?Q?25V+KujwSUia5GUcS1IBcDy9wHnrl7VMLDLYQNdgLCUmgttjpWSjvycC6OqD?=
 =?us-ascii?Q?GFI+kP4k3wLulLU7xVsrUjNbcVP4rPANW24hp0DmoJorlexwTjEITIRK9TCx?=
 =?us-ascii?Q?xLq/orQPRF8zXlJjeOTDPJpH41/L+PYaIccfLzph97KzVM7HwlivzNoEzBKF?=
 =?us-ascii?Q?pJNbkNVuECIZeFXf+SHD6E6o0oImkQMmnaDj1FUMEXEjE3+IvQTGWOSYvxI0?=
 =?us-ascii?Q?MT2zL18vwZ9voHecxVfEiaTFxR6F/iKuAR7Jl+9lkMIha5iHmZ93JdkpW0nb?=
 =?us-ascii?Q?lz+zUrZoRn4Uhd+a9PdwEaLf7rTMfuTSXO9QB01RVsZKdPxLnNSg5J550PUp?=
 =?us-ascii?Q?9ygeNkhPoe+/0h4w+R1xxcqoE/46kWlt+J93VE+3ZktHyATPOVVxLfMBuLAw?=
 =?us-ascii?Q?OdB8bEUx21CX+0wGYyQfgTrqZbbmo782wvUkVCxM9HZ/QnKnJVjQlr60UpOU?=
 =?us-ascii?Q?27JXcDzkMB9nDqZSpYnq5liS3Hn9eU0rfsZCFpTlUKMvsR9tNUPDsaJstO1n?=
 =?us-ascii?Q?fmtgRJqkbL6YAR2Pou9Eit8y3b4shKlK/sp9P7cL2d4Y57enHvrsEUlsoEvr?=
 =?us-ascii?Q?57vii4OYpyCCeZZOvWmCo/qiEq1Ii79gKelREKCHpStsALoe/kaljUJC+KED?=
 =?us-ascii?Q?hEv92WoMnLs4Az3T599XpHLwQO9sY3YYiiKlaBY6hlqcPOaHBs3ShYkXvoL2?=
 =?us-ascii?Q?PikY1ZcoWkuwh6hEvChczt0WNiWSmJZfpSHK5wEt8PMUvCpk8YFcvjnb51Zu?=
 =?us-ascii?Q?0n8+AfMmH/XhAzHXYRzw3ZqORx5R7k5Bpui9qH8zQ1QfbKgrQZYIBzErvYAO?=
 =?us-ascii?Q?E877/mFC2iT75QhT7ndgn/V3X5uewO7P7jL2J1QOwkhjw1sDNPiiajcVFWsL?=
 =?us-ascii?Q?w3y3zZZgQj/AozB1bbT3D2DbLx9rxGpt84vdSpWHBbhxMiUc2xkCFxOYpGTu?=
 =?us-ascii?Q?xVxhyNBoOGwss4uWJVCqtQlnbMWRZTwZVDqDLl7KL3QZgxq8lpRc6kD2WpTb?=
 =?us-ascii?Q?vWtkgyp7xOyQW/wSutQFcJH715bce+Kje5TTFShvHneLxDQ0Wu1qa5HAN0Ko?=
 =?us-ascii?Q?v72fkNJ0yzy0AbFojn/MfCZAncvurAVQM74g+aKJ8D/o5At/ByEYJveZkAy9?=
 =?us-ascii?Q?keydTHbN4Xb6DtbQihb24UlqCk+2gCN6bOfxRPJe9eaIK+m33WhCiO2dQSww?=
 =?us-ascii?Q?Qo2Bll6m0K5bSxJMlWYfWvowajfu1LEJ?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4jflPlPtOCzVxX/yZi+fglBVSbQM6wOs3FrpXZGLjXT24EPtYmUSh+Nh4vZL?=
 =?us-ascii?Q?Uw6/D5WbAx2T4/crmP3QhI0UYF6tKv09kY8t2JO+gLIuz3Fb4nEnnl6ISoTl?=
 =?us-ascii?Q?NRyGKjZduSO3uDg3BTmEy4wyNnjpfES1uOYF3vaYpdnUteTCwuViyHLC8jmw?=
 =?us-ascii?Q?UFX3VF7EGaNdq63od10Q2uVKqmYMBYfgJd5Uyz+ep0oKBKLKyHppUyVFE/ja?=
 =?us-ascii?Q?ehETQ+BzwSssxV3E9e1p+ivptSwmugbECNEMEI3hyVGiIfxT0fzZntZfcvMl?=
 =?us-ascii?Q?sdYWstmE65YIFYivqA5nd3/Owjsa9lDKfAmOJGSSv8Ru5dEfHqRhrctxIy97?=
 =?us-ascii?Q?FGlPJgZJ5rkgiYc1W0SE7bzw+P20vyztrpyQ0zBPDrG/en0vBFcpyCvOAFcZ?=
 =?us-ascii?Q?YjCEFW10QDHzx1jViSU7a2FpERavDvSEef2AmEGEjK+xR5AnwfcnaC/XOMp3?=
 =?us-ascii?Q?CMckXm7RRF6dJE6X/RAXo40XwjmDsDnPcQk238xdJL6RXiLvNLV2SsVENv3H?=
 =?us-ascii?Q?vW1fTky0e9x1Zo2PjBLwUqPQe27WDEpB4ViPERrpP2dTVmkrcA0PENnyHqzV?=
 =?us-ascii?Q?4AjrjK4F8eulsKzAAdE9q34tQk4ydRyXkiS0zFRNbwzWUCsHaajBGHOjAaO9?=
 =?us-ascii?Q?q/HNKAUo1P9L/R/caND5aDEjPENwRryVO1GwqRETdvE1YjA9KwIeLJKMQPSl?=
 =?us-ascii?Q?c6szXZAA6fF28A/qmAowjRbiDt6kfu/dsAf5u45LGullp76D9dytcOo9U/O3?=
 =?us-ascii?Q?WF9jOcGkGhNs8/iwPmIsNSiS4zhPqc4qdPv5/zTzMi8c4OTGomnl2PDQZjSG?=
 =?us-ascii?Q?oqwZ9QBUbt1cA1hF+d6n7rM5P/boxMquv1NLCkA5gLAI72sBCxMtrjA26L3t?=
 =?us-ascii?Q?nGDtkA1dNjCuvoGADEE6WwcxbOAtFi0KVetuQAQoN2su1oi0Ewb8j60H2g4G?=
 =?us-ascii?Q?rWrLN4Z/9bu8Zbf8D9TKK1i3n1NPAsc6S+7lRZeJRG4DR1H+Sfd/mMO9bEWP?=
 =?us-ascii?Q?FYq9IkOE3ix6HeKm0tKZ3msyo8Buf9mw3/KuzhFoXQw2XrdWcjZRLv0ROy20?=
 =?us-ascii?Q?IcSOnixVf8XmHF8LCZZFD9kbCOPSdiWaN752rlq9BdWcPsSTtQHbg7v2BnR+?=
 =?us-ascii?Q?fHFnagq7I+VVkt5J+W9R1BxcK2X98OhlG9odUP+t4iwkX8Ym9tCfU1IJLjBH?=
 =?us-ascii?Q?oo9wjZ8X2weIYLkFVNq085e+BBydQrsbPuJePhGVYB1hJBJEfiEhrK3uVgy1?=
 =?us-ascii?Q?3y6XmiHkmdChZnTDUORtQjLdx+RZDX8GaColi5hLWSSG18bghxgANDVQzNWs?=
 =?us-ascii?Q?P7J9kb17ehsmnOFXpmeRgllLiVuBhyZeA/avYFJd0b1Y/9qRkiJriWWIZfBr?=
 =?us-ascii?Q?cOyjFDqdSLwDhPqe1p86NlSWKL1iIuk5PJvA82v5BGq71159pYeM+0KUZeXb?=
 =?us-ascii?Q?gm9zwMZ7EKdTWvyiwFowXZJKcmptUZ91BhwRVg3XXHSzLh8Ke+4mP6obxbGJ?=
 =?us-ascii?Q?hkhbXXYIkKSOAjFkclXco9JN5J5+TwJFWCE3aZ+UWY40Uy6NiGA+lZXMR1cv?=
 =?us-ascii?Q?kNRSiMkBkb/At2g0rQk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf547e8b-01e7-46c3-78da-08dd3da62d68
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2025 01:10:09.1940
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lBLx/Sgt86TudQSZvDDKhHiwmgKgcG9JRNHDn6JKe7L9J/n4WqddM3A4hyqOu4dnk3+5PR1CB2rWLsofan3zwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4889
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Arnd Bergmann <arnd@kernel.org>
> Sent: Thursday, January 23, 2025 9:48 PM
> To: Jiri Kosina <jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.or=
g>;
> Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Mark Pearson
> <mpearson-lenovo@squebb.ca>
> Cc: Arnd Bergmann <arnd@arndb.de>; Basavaraj Natikar
> <basavaraj.natikar@amd.com>; Xu, Even <even.xu@intel.com>; Sun, Xinpeng
> <xinpeng.sun@intel.com>; Maximilian Luz <luzmaximilian@gmail.com>; Marcel
> Holtmann <marcel@holtmann.org>; Johan Hedberg
> <johan.hedberg@gmail.com>; Luiz Augusto von Dentz <luiz.dentz@gmail.com>;
> Dmitry Torokhov <dmitry.torokhov@gmail.com>; linux-input@vger.kernel.org;
> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; linux-
> usb@vger.kernel.org; linux-bluetooth@vger.kernel.org
> Subject: [PATCH] hid: intel-thc: fix CONFIG_HID dependency
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> In drivers/hid/, most drivers depend on CONFIG_HID, while a couple of the=
 drivers
> in subdirectories instead depend on CONFIG_HID_SUPPORT and use 'select HI=
D'.
> With the newly added INTEL_THC_HID, this causes a build warning for a cir=
cular
> dependency:
>=20
> WARNING: unmet direct dependencies detected for HID
>   Depends on [m]: HID_SUPPORT [=3Dy] && INPUT [=3Dm]
>   Selected by [y]:
>   - INTEL_THC_HID [=3Dy] && HID_SUPPORT [=3Dy] && X86_64 [=3Dy] && PCI [=
=3Dy] &&
> ACPI [=3Dy]
>=20
> WARNING: unmet direct dependencies detected for INPUT_FF_MEMLESS
>   Depends on [m]: INPUT [=3Dm]
>   Selected by [y]:
>   - HID_MICROSOFT [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy]
>   - GREENASIA_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_GREENA=
SIA
> [=3Dy]
>   - HID_WIIMOTE [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && LEDS_CLASS =
[=3Dy]
>   - ZEROPLUS_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_ZEROPLU=
S
> [=3Dy]
>   Selected by [m]:
>   - HID_ACRUX_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] && HID_ACRUX =
[=3Dm]
>   - HID_EMS_FF [=3Dm] && HID_SUPPORT [=3Dy] && HID [=3Dy]
>   - HID_GOOGLE_STADIA_FF [=3Dm] && HID_SUPPORT [=3Dy] && HID [=3Dy]
>   - PANTHERLORD_FF [=3Dy] && HID_SUPPORT [=3Dy] && HID [=3Dy] &&
> HID_PANTHERLORD [=3Dm]
>=20
> It's better to be consistent and always use 'depends on HID' for HID driv=
ers. The
> notable exception here is USB_KBD/USB_MOUSE, which are alternative
> implementations that do not depend on the HID subsystem.
>=20
> Do this by extending the "if HID" section below, which means that a few o=
f the
> duplicate "depends on HID" and "depends on INPUT" statements can be remov=
ed
> in the process.
>=20
> Fixes: 1b2d05384c29 ("HID: intel-thc-hid: Add basic THC driver skeleton")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/hid/Kconfig               | 10 ++++++----
>  drivers/hid/amd-sfh-hid/Kconfig   |  1 -
>  drivers/hid/i2c-hid/Kconfig       |  2 +-
>  drivers/hid/intel-ish-hid/Kconfig |  1 -  drivers/hid/intel-thc-hid/Kcon=
fig |  1 -
>  drivers/hid/surface-hid/Kconfig   |  2 --
>  drivers/hid/usbhid/Kconfig        |  3 +--
>  net/bluetooth/hidp/Kconfig        |  3 +--
>  8 files changed, 9 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig index
> 8adb745c5b28..ed657ef7281c 100644
> --- a/drivers/hid/Kconfig
> +++ b/drivers/hid/Kconfig
> @@ -1376,10 +1376,6 @@ endmenu
>=20
>  source "drivers/hid/bpf/Kconfig"
>=20
> -endif # HID
> -
> -source "drivers/hid/usbhid/Kconfig"
> -
>  source "drivers/hid/i2c-hid/Kconfig"
>=20
>  source "drivers/hid/intel-ish-hid/Kconfig"
> @@ -1390,4 +1386,10 @@ source "drivers/hid/surface-hid/Kconfig"
>=20
>  source "drivers/hid/intel-thc-hid/Kconfig"
>=20
> +endif # HID
> +
> +# USB support may be used with HID disabled
> +
> +source "drivers/hid/usbhid/Kconfig"
> +
>  endif # HID_SUPPORT
> diff --git a/drivers/hid/amd-sfh-hid/Kconfig b/drivers/hid/amd-sfh-hid/Kc=
onfig
> index 329de5e12c1a..3291786a5ee6 100644
> --- a/drivers/hid/amd-sfh-hid/Kconfig
> +++ b/drivers/hid/amd-sfh-hid/Kconfig
> @@ -5,7 +5,6 @@ menu "AMD SFH HID Support"
>=20
>  config AMD_SFH_HID
>  	tristate "AMD Sensor Fusion Hub"
> -	depends on HID
>  	depends on X86
>  	help
>  	  If you say yes to this option, support will be included for the diff =
--git
> a/drivers/hid/i2c-hid/Kconfig b/drivers/hid/i2c-hid/Kconfig index
> ef7c595c9403..e8d51f410cc1 100644
> --- a/drivers/hid/i2c-hid/Kconfig
> +++ b/drivers/hid/i2c-hid/Kconfig
> @@ -2,7 +2,7 @@
>  menuconfig I2C_HID
>  	tristate "I2C HID support"
>  	default y
> -	depends on I2C && INPUT && HID
> +	depends on I2C
>=20
>  if I2C_HID
>=20
> diff --git a/drivers/hid/intel-ish-hid/Kconfig b/drivers/hid/intel-ish-hi=
d/Kconfig
> index 253dc10d35ef..568c8688784e 100644
> --- a/drivers/hid/intel-ish-hid/Kconfig
> +++ b/drivers/hid/intel-ish-hid/Kconfig
> @@ -6,7 +6,6 @@ config INTEL_ISH_HID
>  	tristate "Intel Integrated Sensor Hub"
>  	default n
>  	depends on X86
> -	depends on HID
>  	help
>  	  The Integrated Sensor Hub (ISH) enables the ability to offload
>  	  sensor polling and algorithm processing to a dedicated low power diff=
 --
> git a/drivers/hid/intel-thc-hid/Kconfig b/drivers/hid/intel-thc-hid/Kconf=
ig
> index 91ec84902db8..0351d1137607 100644
> --- a/drivers/hid/intel-thc-hid/Kconfig
> +++ b/drivers/hid/intel-thc-hid/Kconfig
> @@ -7,7 +7,6 @@ menu "Intel THC HID Support"
>  config INTEL_THC_HID
>  	tristate "Intel Touch Host Controller"
>  	depends on ACPI
> -	select HID
>  	help
>  	  THC (Touch Host Controller) is the name of the IP block in PCH that
>  	  interfaces with Touch Devices (ex: touchscreen, touchpad etc.). It di=
ff --
> git a/drivers/hid/surface-hid/Kconfig b/drivers/hid/surface-hid/Kconfig i=
ndex
> 7ce9b5d641eb..d0cfd0d29926 100644
> --- a/drivers/hid/surface-hid/Kconfig
> +++ b/drivers/hid/surface-hid/Kconfig
> @@ -1,7 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0+
>  menu "Surface System Aggregator Module HID support"
>  	depends on SURFACE_AGGREGATOR
> -	depends on INPUT
>=20
>  config SURFACE_HID
>  	tristate "HID transport driver for Surface System Aggregator Module"
> @@ -39,4 +38,3 @@ endmenu
>=20
>  config SURFACE_HID_CORE
>  	tristate
> -	select HID
> diff --git a/drivers/hid/usbhid/Kconfig b/drivers/hid/usbhid/Kconfig inde=
x
> 7c2032f7f44d..f3194767a45e 100644
> --- a/drivers/hid/usbhid/Kconfig
> +++ b/drivers/hid/usbhid/Kconfig
> @@ -5,8 +5,7 @@ menu "USB HID support"
>  config USB_HID
>  	tristate "USB HID transport layer"
>  	default y
> -	depends on USB && INPUT
> -	select HID
> +	depends on HID
>  	help
>  	  Say Y here if you want to connect USB keyboards,
>  	  mice, joysticks, graphic tablets, or any other HID based devices diff=
 --git
> a/net/bluetooth/hidp/Kconfig b/net/bluetooth/hidp/Kconfig index
> 6746be07e222..e08aae35351a 100644
> --- a/net/bluetooth/hidp/Kconfig
> +++ b/net/bluetooth/hidp/Kconfig
> @@ -1,8 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only  config BT_HIDP
>  	tristate "HIDP protocol support"
> -	depends on BT_BREDR && INPUT && HID_SUPPORT
> -	select HID
> +	depends on BT_BREDR && HID
>  	help
>  	  HIDP (Human Interface Device Protocol) is a transport layer
>  	  for HID reports.  HIDP is required for the Bluetooth Human
> --
> 2.39.5

For hid/intel-thc-hid:

Reviewed-by: Even Xu <even.xu@intel.com>

Best Regards,
Even Xu


