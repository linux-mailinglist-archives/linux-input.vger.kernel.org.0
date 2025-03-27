Return-Path: <linux-input+bounces-11304-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC4A727F6
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 01:59:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6083B162D47
	for <lists+linux-input@lfdr.de>; Thu, 27 Mar 2025 00:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9285614A8B;
	Thu, 27 Mar 2025 00:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1xa+ED4"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6AC2E0;
	Thu, 27 Mar 2025 00:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743037133; cv=fail; b=jpJ8gtoWGEB9XBxU/IvSKGN7686GUwT4iPuzmJYllmrEyn3zpezP9tKzawgI1lfScefmsbERECma8ls7ktATtFXGz4TgX09apf1a/oySija3SZUWJJkCqFwXbt3JDHUT3pzpbwya1pClQEqLthkJHWCYLuOiT3BDU/M3OWI/NwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743037133; c=relaxed/simple;
	bh=i7nh6kXRLFSIIAIU/Ehw6rHEwzIsIz5XSFDGSmOc0Ig=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kM9Xf5jIR2ws0imHPW1y8AMd+e9VArkxF0KCpCV583FAsJ9Q9BPoJdqNAo5zTpFN0mwFyWtKOLh9GaD4lQ2ea8cbpSX584En1Vi7XaHEULME5ExE8XQ2N4677KXdwLQsNT8hrD4zonKcrh5s9r+NypeVdUBh68HK3vSQ44rFlIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1xa+ED4; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743037132; x=1774573132;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=i7nh6kXRLFSIIAIU/Ehw6rHEwzIsIz5XSFDGSmOc0Ig=;
  b=f1xa+ED4Nz/BObcHCxmQ3c5Ukpg4cnhhitISGCKFkVcILXZt9gEjbyIk
   35Qsg/ukHMcPzM4qy/X/WD3VI1EyfMtIBeurobPPeTDjfVE9CsihGJ2BQ
   hHrcfGC5/ZXQ2knA06edeX87SmqK9vs/1ZO0b5XrdsD23aN4CQ5qfoDoC
   jRERfXcr6Bfx4UZZHD+fqUygYtD9aLaPgipfQAZOjqvmwuDHmjhCbZ+hR
   XaAiXDmHXsFnVrVAoLaS2z1AcAyxBlFrKFs8J/AhceLerpMAlRXpNxG5K
   MN4SEdOWGqY0ZjPXXly+21y6fyOUVo3bByayr3w0cK2sgs6NZxKuCHOzb
   A==;
X-CSE-ConnectionGUID: UWg+jFVUSs2Xqo8caeA1ow==
X-CSE-MsgGUID: KH/DlReISIGijKrF39AgQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55351392"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55351392"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 17:58:33 -0700
X-CSE-ConnectionGUID: ewCOOd8cRBGoPZNE5pw+EA==
X-CSE-MsgGUID: 3rcB4zudRzCT0bVRY2+ldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="129662049"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 26 Mar 2025 17:58:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 26 Mar 2025 17:58:31 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Mar 2025 17:58:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 17:58:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwMisOnLMJVMxraE/+w4R+tly7yfH9++yOIkqkaCOKeEN2eblbUkQnMnaqm+e7K8+oaNpNT+/NX2y0PWIR/JkMaeXLtF3dqy9w2xb/Im1z9OiK3SdtUbil+kwfBwDRFX6xNmZjT9BXy+30luVZvU4+nzZANNwi3U6YVJwOidLPR870jLFG7bWEANKyaI6Cw+Zu9Rwj7fpu5CsEEIJwd5rt9BYTAKEm5fx9NLzr8bB0cHwNn9KXYxkZQmlxA68mQdKLQGb6Dd8ZPJt16tij6TVxN5Jrp9MbUdI8R0/fNnhHOrtWa+2mWDr1HRYsKdGn26s0wL2qY++761M4fwUkTLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dOU9kZYfEMAhTy6N1izZ3CZ52sl7LmLv10ZiWEMcoQs=;
 b=xfUDJx6opyOKTJ3EG7klcSVrdsvt8wPxTqCRbp/zJxXcni0zk/Eq459xMbM8EC9G3TwxQK7adX5oaVF52ZNHR4GGG/dAC6H25i6eTn5CLNmKanFhuuqXb1abK6mkXNHqioDj99C5cNr12YAEBPF7SQrzjKghL/6uDDDaGte91vW9JEDlgoUSEa8PE7jgA5qSfgWn2fbEl7qrBvE+Wjmdyj5RijwBq3jgy7TiVMxSB4sANclJ2sxMWAidVnh7D7O1ftSYy55n4qjjGbRDnl6OJDFSLnsm8Zy3X+ifuimQ6bjZs7iCuMlMHD+Io+sNNw7v5NywhP2QakVIq4fY3PG/+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by DS0PR11MB8184.namprd11.prod.outlook.com (2603:10b6:8:160::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 00:58:24 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 00:58:24 +0000
From: "Xu, Even" <even.xu@intel.com>
To: David Binderman <dcb314@hotmail.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
 bug report
Thread-Topic: linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
 bug report
Thread-Index: AQHbnoMyJSSxnBJen0yPctJzXXDeULOGJ/Tg
Date: Thu, 27 Mar 2025 00:58:24 +0000
Message-ID: <IA1PR11MB6098047C9EF4523F22119E45F4A12@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <AS8PR02MB10217E34D616B6F5213660E1E9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB10217E34D616B6F5213660E1E9CA62@AS8PR02MB10217.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|DS0PR11MB8184:EE_
x-ms-office365-filtering-correlation-id: 3dd6b1a2-efa3-49ee-b55e-08dd6cca7a51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?rVMMailvxezhd0uUmzobztcJCbUd3VtG9thtAgwJsbXoS76s3MhsxvA3Urqy?=
 =?us-ascii?Q?UT9O/DFzH9MtVL9Goum9XjMvPoTwNg0wETP3yC5p//doTFvu+1cCtoxPjk2K?=
 =?us-ascii?Q?bDuJ2CeN0jwfJL5Rowlt3YFrRX5PJACDJ3MPKsQib1nXdRt9R+gauGGeMhtt?=
 =?us-ascii?Q?X15xCLaOpfCdJFld2xN25Pp6yeDeAvsU2S+HEAertqRuPtpbKeiX12tYr/Jj?=
 =?us-ascii?Q?korsXFbnvjbXLRCx2nTwVSCPGZ5SRKKlJtM+1DZgdbwXHb35Dcdn7R2qqRgX?=
 =?us-ascii?Q?w6wDICa4+4WSqhAoR4fn18d1S62n3ERDv/Ivq+RVGjMP+06coeDdUJ2tWvEo?=
 =?us-ascii?Q?j0YmmLB1CIgpirFMC4E8dctG27W70sj5bK11ECVm7p7CgoRGLOqAhWukw6Ya?=
 =?us-ascii?Q?EQFS5oU9K0Bc4f4Ypnl3mWmOfjV8oQ7FEdfqnUNJHZGbzSU0OYm+qaCzlXRt?=
 =?us-ascii?Q?lYfE408X35Hk6yr/XOWrAQXzv0NlnNmjftIAk+dBdNZwS1T/W9PE4xAR/9Qt?=
 =?us-ascii?Q?8AnEm2UJkDexRDWDxmK6dXsx0UtbOQz4WjKEjVW0gh01PVpob0a12ltHwBcz?=
 =?us-ascii?Q?lFVdM5d70D1f5AY9IRCBetRsD+WyRuVA9b0glzgKiIOCYxudlAh5qBUhIJ0a?=
 =?us-ascii?Q?K7zJxweJwZyTrEfTKcnZZ5HuvRNQKGegnIK4FzO0OOctQXATLxLmIN8j69VA?=
 =?us-ascii?Q?cL2hgbPfADiKwR933VHQ2X8wFn0rvjGamMOWupYt9a8Fv4jpsZ7gQ3V9axur?=
 =?us-ascii?Q?vdFaeqSrlmHOSWMPjzhg1Qa0NEGYJGYmYmc9ym/4Kx/UKc2oLYIbMBmC8mwA?=
 =?us-ascii?Q?ypme9RZsmQ3qMkzalElE9ckBjiqPv2a2rsoDlDMufLfV3m2gfh/DSGsWCLxQ?=
 =?us-ascii?Q?nUUJHFTuUyoVBfzGlHwyTO2BfTmH18mbZPP+aJOKUfIiD3lxLK+gAD3LCtfw?=
 =?us-ascii?Q?QIhuPjA4S8i9prARALTQ0IicBzmTDfee0f8COeIwJFBXqXBu6qXTtXkDFu4W?=
 =?us-ascii?Q?4wykcuFAWnK+Qbl0edo5T+mCrAn9vqvYNSrrJMmmsEiqwKHuyfYxziZAp6ci?=
 =?us-ascii?Q?xYAzqm+Hkf64zJh7dfIGiBT6Md0zS4cdElkjQ6gI/oBS1FXBtUFPnM+Zzk4v?=
 =?us-ascii?Q?aNDFAfumdfxzjdbSSRpSaftdxeE3lxzpJGtRpuKvq5+PfNJvmvItTJhF4ymj?=
 =?us-ascii?Q?18O8TxnIwv2ZcygPCv1FQoPvUyTESSUU8Sr0pcQu9mAbfGNNhHcfovZPcity?=
 =?us-ascii?Q?NlcjYtEaxXK3a9EIPFokqRLp5u0fHv63Lu7slFfFgs3A74k9H7iNrvw7BfEy?=
 =?us-ascii?Q?RLn3+6kbVXZeKvMI/Gw6Hk0mTx1oqD63tHoY3Gp4Lhdw/TVPh3yqJO9gW57D?=
 =?us-ascii?Q?l6C779nmSX537hpXYmST46yXy13OeN10FKyKmwN4MFa1MKNxyPanUFhH/c4n?=
 =?us-ascii?Q?A2SgVDZbR1SIABSzC1m4sOewLWusPsPG?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0XumHNu7tUaVGlxwA7HQYYOdqCJYFoLpsUQjHG4GVCnAb2YoYhF5zmHTnRoq?=
 =?us-ascii?Q?0BvBzUARUM+Sd+TjEHir6P2NDeb3A0d3fvAcE5hHJAdGpm6D7L+uS7bF7JnA?=
 =?us-ascii?Q?Z7vioUEuSLW91GQhK1ZtLZflChdumtxLAXzKgn9DlLbdRG0mKZoEHaoA5EW3?=
 =?us-ascii?Q?6fYOGzJnz0SVHiWtR5gUxXtVAiafx06WwCOsz0uhRdykk43DgUCNSs70WYnF?=
 =?us-ascii?Q?BRItqkFAkWHK3uPZoMGKj+loQPxPcuiyZeind05uEmOJ5gd0Wb/WvrkHoUil?=
 =?us-ascii?Q?Ofd4RTOmy23gVWrty+QvDBfcCyeTcl20vu/Tq0f6NQT4xQThPCmSvhdDvAHM?=
 =?us-ascii?Q?hPW/UsX+8LmJlLqQqN8qybWconvuppnJFFQV2yzbo0a4IiO/K0wtlE6RwJuJ?=
 =?us-ascii?Q?HvYmKqAL6i2zkg8rRcdw7zT2fbucWLV3flOLKwXhlbhQrv2mXpJ+WF0WLV6a?=
 =?us-ascii?Q?EMfmBJC7ZcgLUYIGCOq00xFQ/gAlgWPhrlIcSEZfCaXd0N5+Zki+KHayv9gG?=
 =?us-ascii?Q?yCC3hklSOZ+vBQWtPWFUeJjIpbDXxfaLrpErIQO6ID81t4pOvsnOwdnyRNHZ?=
 =?us-ascii?Q?Kw6rz1bIPL9tP7Qg45dFNC64gk66Pmiy3oK7/c2mR8sKVAuJYMVpHDHyM4n4?=
 =?us-ascii?Q?BfGu1ScnXPEXJykHai8rt3WdC8ol0qXZu0jecaiOCTMdY7Ie/I+ov6HvqAHA?=
 =?us-ascii?Q?rbM3JpkG+O73lQvf8k0XCE0ekutck+MLppVlE3XB89xO3XW8q8MsBAy+TJgL?=
 =?us-ascii?Q?pYbAlLaBvg9T/NpOhw61a8SMshvk74gCUDewZrjMzSU6P8E5/IeQ+63gOz4J?=
 =?us-ascii?Q?fwtNFwm7LzgVWx4jjTdHeNSyNczKDkyK6Jw4D4UNDYNOrLlj2AqKbBqFwhOZ?=
 =?us-ascii?Q?4zG2P2qiFxRByCmsBxvrwrQKRNkc0QB9G/lGlSZu1hzNKjhtpqJwEU15Ug1t?=
 =?us-ascii?Q?agDiukNJdXlE7u1uzUeDxbmCJO3cChtSoEH8wtcDo8fb9UlXk5pT/rfuT/Eb?=
 =?us-ascii?Q?xhiHuVJ5AKgL/zuPeU43NivhLn6elRSfqRQgge6UViqf4Rj4ZrupSYN8bRj3?=
 =?us-ascii?Q?ajZkH5RLF4RTyTpvo3bKVDEwJAX2vzp+NkeId0+CFOIG7Y2KHmciB1tq0sGL?=
 =?us-ascii?Q?1dIiEEZzAF0VOgQnu+4IN+rOazakJeyJyExfaJiBqRHpwcfEiBD8fHpOAeje?=
 =?us-ascii?Q?KBBfMP8J1xL05ARTJceeEdcY4T3SgLJZeJNik8HUVg6Xy2WR43q24tdB/rzL?=
 =?us-ascii?Q?tlsSmF40scn//0K04bj7oepkfHJd7Mc6kXv/ygY+WmzGktb36aSsbXPbSdjq?=
 =?us-ascii?Q?102VlJeE+XBe5/YTiTccd465K75Qzh1OwHRIjnGcm42XbKSoigj3gEhzNgnB?=
 =?us-ascii?Q?yrhUf9CKSmFLyA2vatLHSsdQSlZPfhOQ9DFFdXNtinEYf1oGzrmjJXYzwyvJ?=
 =?us-ascii?Q?Eq4IyXZGNrQ8Xny2Mumtf8SHjo6sijVeHWdio1YMzflFUr9bUhVTd/9aVwIs?=
 =?us-ascii?Q?ZAwqmMAbtCcLzic8cAB7GYC49tiVwW039bCRxg4gTe1AtiSfAQq9BbinIiEE?=
 =?us-ascii?Q?NIIsJRs5hOSQfwRmb2o=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd6b1a2-efa3-49ee-b55e-08dd6cca7a51
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 00:58:24.7821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 78JZ8B9jaipILXKulOP88Gda7Aa7tlQtMtfebuKciAUVeO7KkznUqDT490V1IXNAgRtCkLpDmC6YebMC8Pmo+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8184
X-OriginatorOrg: intel.com

Hi, David,

Thanks for reminder!
This issue already had patch fix at 2/13:  https://lore.kernel.org/linux-in=
put/20250213024021.2477473-1-even.xu@intel.com/

Hi, Jiri,

I didn't find this patch in latest v6.14-rc7, would you mind help double ch=
eck which branch this patch got applied?
Thanks!

Best Regards,
Even Xu

> -----Original Message-----
> From: David Binderman <dcb314@hotmail.com>
> Sent: Thursday, March 27, 2025 3:16 AM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> jikos@kernel.org; bentiss@kernel.org; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c b=
ug report
>=20
> Hello there,
>=20
> Static analyser cppcheck says:
>=20
> linux-6.14/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:24: st=
yle:
> Boolean result is used in bitwise operation. Clarify expression with pare=
ntheses.
> [clarifyCondition]
>=20
> Source code is
>=20
>         if (!config->sgls[i] | !config->sgls_nent[i])
>=20
> Perhaps || was intended instead of | ?
>=20
> Regards
>=20
> David Binderman
>=20


