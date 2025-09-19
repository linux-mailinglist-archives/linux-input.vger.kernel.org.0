Return-Path: <linux-input+bounces-14891-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 377BFB884AE
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 09:57:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94DA9B65EEF
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 529FF2FD7B8;
	Fri, 19 Sep 2025 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhrufOeJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726362FBDF7;
	Fri, 19 Sep 2025 07:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268581; cv=fail; b=dxGq9fXTb08xm6WXH/l2A0qDGt/v0prydZECtB4k+OXrHOGzbKoZRNkVxMFef1na79x/ptphzmh169v2yRMLzh//VpdkB6sHjhrz1ta0kPSTOsOmkHxulzm8HE1wNiDrm92R/3DLdx5LY1sIHly4iNymQl/orOnx+t74FC0LOvw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268581; c=relaxed/simple;
	bh=BCo8rsutCfHnMeFQ0epLsKCawFTXW4WA9Jmi+e6T5e4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YWMenghJ/Tebqci6F5arbpbbVKqJts9MYHtPVgWbICOnsTTbc934h3hf6Uob8P3CW97VMeBfm/CXd7+nk7rBtEKEJCdvusl2AJrc2IlY7Ymmx2ZvO+3FwV5ZU2X5SBGcR06O1nu3xy9zHXHZGMhzbk6n6XRsHCTNDYMryFSsUJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhrufOeJ; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758268579; x=1789804579;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BCo8rsutCfHnMeFQ0epLsKCawFTXW4WA9Jmi+e6T5e4=;
  b=hhrufOeJO9jEU9kLI7wsKtZIZIRnPCTxxEATyaGRyFZSCqQTxz87ZfpX
   1HJh7e9x8fiTTYc1fBCzHg7DgSlnEtHMawVGWxy2pI1n+Y1vvnfZnW7Hv
   C2wn2s5vpGprBLYFqDRwoaXtUx9hZCapECYKzQYze8v4IDartyC8vdAxO
   C4mokpDgqouoydgvWWIHweE470N1GLRlIpqsgQe182wWm5ix3SQJjr+aT
   +5YZWRzE/OluzImLZukgKJuJ89g0TXtasTy5tsdD0m1JBkCtLf+lsZl1Y
   bb0qaD6p2HbfzNUBUaHXzuwZ+2I3cfCyO19NNN68KjkvAzkDzfiqVRAxy
   w==;
X-CSE-ConnectionGUID: ohQOK9HRR3iAanJDeZnBSg==
X-CSE-MsgGUID: dCxyJIzPSe2alGmtSHyOTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71985508"
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="71985508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 00:56:19 -0700
X-CSE-ConnectionGUID: fa2UAqfCQSiyfQ5XJGQaMQ==
X-CSE-MsgGUID: ufCQGsBKTnuM6hgu0YxscA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,277,1751266800"; 
   d="scan'208";a="179783527"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 00:56:19 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 00:56:17 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 00:56:17 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 00:56:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEeTIvyHhgIDgE84vXAvFU/Nq79X6WW/Luo1CORFRt5VscuGdxRSx+CyUGkpwhNrDN3Y5d1Dcq0I2VJ84QUqeQ0BNONU5ooTgGlgiNwQMuTuvzttPslqHsLBekhVeXMV6ResWXvbX+83JQ358d4LfCtsVUe3EEvNQ4tkJRXjJCblZyFauGShzEcRW1DQm8P6Qd7X8a4jmViY/IiVbqORsa7xRsRWrU5/LXjAN1jHSFgADbO0NNmijyxQ6WBbfORdPPtUPUnhcTSPlT2/5zTxLWC3tA2LESxFvvyMThT4YAViuxMkItcPOeTSV9lQnwvBo08zPTFE4vNwhSBwBcjzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roY4fhJslPjZEJDxlSTd/Kmn59xQDFiRPeWPK1E69m0=;
 b=BQ/AbVTZA3G4e+OcgpY1h+CYO+oGAlHG/o4ZhC4CLXDsQ+lhfyC3o6Q+KXE+Mc1lSPLjSDP8o3to8BlbKuL5wYwAMIuMDRq1jngOJjEs3wXv8CeEmbrjC4AzwGQ9TEd78nmyZLxFyC4GB9IVlM2Y3Ql7dO/wE9gE+OcpTB0pE+AlAa3+xKn8IXm6NzbOPM80w7emuaXEBOj7hj+fQw8fLI7jqPW27goDntALs52RKQSoix6JAlTwcBMmnhKjIO1VIF5vPt1to8uGsnT9LqvccC8naCm58U7ThjW+crPUaHCOOyJoJ8HW9aJEEeR/qo1xG0GoDVMERicfd2ENB0WMig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by CO1PR11MB5137.namprd11.prod.outlook.com (2603:10b6:303:92::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 07:56:15 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 07:56:15 +0000
From: "Xu, Even" <even.xu@intel.com>
To: "Sun, Xinpeng" <xinpeng.sun@intel.com>, "jikos@kernel.org"
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Zhang, Rui1" <rui1.zhang@intel.com>
Subject: RE: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Topic: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Index: AQHcJ3XpyA576vGuO0i8lk9jkUfq0LSaJI0A
Date: Fri, 19 Sep 2025 07:56:15 +0000
Message-ID: <IA1PR11MB6098555DA1279BFFCC9CDD89F411A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250917015344.1169412-1-xinpeng.sun@intel.com>
In-Reply-To: <20250917015344.1169412-1-xinpeng.sun@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|CO1PR11MB5137:EE_
x-ms-office365-filtering-correlation-id: 26e9f92b-366e-4ed3-5230-08ddf752027b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?h9VIUSuaDUYcFULzeuKD8GOR+1rEbqFBDkAeyr2K5u+RdegUf2PsCObDIGZm?=
 =?us-ascii?Q?ZZ/bfRfAd0D1oppUu/Vo3RnQTtSq/YnRkCSl3si9recfdrrurf9E0qMRHqs4?=
 =?us-ascii?Q?9GxT8SEbgQ3CkRPmr1MgUwz0x/FyS1zdiZ9We82H2pVPjFwzhfz6RGPPj0nN?=
 =?us-ascii?Q?+kg8VRZP4+63dH5ZF/1PIgGcPyLXxJzPXXYGxB+qlS/tAr6rtbDoNhOh3V/p?=
 =?us-ascii?Q?kXumuVRD0rWDHzn7RCCvkOO3MFVOev1rOEOOJyQYZyswrVbmGgT1spKlvxfd?=
 =?us-ascii?Q?7yzOggfNU6bCid2KmOrrq+hNgyw/I+HOaw7SbwR6bZikxwjxmKyvIad3+QFz?=
 =?us-ascii?Q?q/4BybGv4OVQfcjAjiTlHrrO+96lAjAX9TqMOzj6UR8EqhlQ+rZz9J671ApG?=
 =?us-ascii?Q?Qn0rMQzosbx68HBm7qNfERDL6nBBuPW9NsGjROH+EEH9QJBHOHohgmr4i4L/?=
 =?us-ascii?Q?QwNL5F0EpdySKLKQOkrvIRJt1Fn9m294I/p6jC+oaP/eJ57nR8tSsKmIrfby?=
 =?us-ascii?Q?WYCpJZYiq38fmPl6XJPMSQC7blG3u+0ix+yk54ZpGovzohv8VaR+Ea0bEPY6?=
 =?us-ascii?Q?6/FyPhDehRMkdgzaEWpav7eMhJiMcQ7P6uu9rXr3UcP7pttunVD0qgLORZ6W?=
 =?us-ascii?Q?ytntYZXdP8jMkuDYrhxRRRWb5CVC3YSd0Icc7sZymAohFEWsiafU4aKiDbC+?=
 =?us-ascii?Q?9HtXH+s32B/isb3IcmOcy4F8lWvWEYNajr8QJe08VffYKFHFJuSI6V4vup6+?=
 =?us-ascii?Q?imdargpjhr0aeIkOq9TgyCLy55i5P55qVxEif5lqJ2vOKlTrPSNsVoOXg+ht?=
 =?us-ascii?Q?McBVl0AzQsabGYKlCChq2Vbssuooyn+cay80qf9MlYwlInogKsL8BTzCwHH/?=
 =?us-ascii?Q?ln2ciuaMFg1q2kCstAr1na/g3707vB4fgXvBBEtqYQ+R1F+XWt48S3kX0qbz?=
 =?us-ascii?Q?VYeyhDAS6TpOH8maMjdqtmZUH+vo+HE8BFHE8kqVf5dVRNfmijzkHnpyteg8?=
 =?us-ascii?Q?/Z5UY9Qtc66u/Eeg5/6KrVQjeusYsGTUNjZ77KgdoNRDPHm87Fj/hmbS+VKn?=
 =?us-ascii?Q?q9oOyZJX8+i7kK+TTR4nnrMw89S71cY1TVEzCGkOJ6rpLl/pb9o4WHKWTgYI?=
 =?us-ascii?Q?HteFVfPSAbJPYIbIhkMakirTiRDonW+rXy45KuUt5GDP6Gd+jTAIlSeudI8i?=
 =?us-ascii?Q?wve/sZJUSqz7sfozjYHHRgjGmQ6FmWlJG5gFJdCzGVJhWXLdmdxttCYRf60g?=
 =?us-ascii?Q?/RBl1B/bsUcpu2PpcDBHoY4wPSatGGa2Vq0Bq9z2U4Za3EpJowV0TfIBQ0DB?=
 =?us-ascii?Q?Plp7cW7Nn5eYZfStcDIGkniEqXEebanvKBsj56RgBu5RzyNuKXf6WGVMG15s?=
 =?us-ascii?Q?G9j/KRWVT7eaVf/au1RQ7a7XYQxNVg5o/OgnEdirERdEaDIBsvghUBct6ro/?=
 =?us-ascii?Q?SHaPtLTKzo2wWKLDU74uMS2PeBq8tNSU+LetBz09L/2o1V4Cs0AtAR2BRTzl?=
 =?us-ascii?Q?aEIbpjhhyLC9yso=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3YzIFapSikz4jGOF9Eju9pZly4d3PfwG7rJVqKRd9tHFz3q9ChuhZJMG1lM8?=
 =?us-ascii?Q?TBDeRQj0TxVRP4GMUYc8lqrUjs4wLyN/vdUsVTrK9E/t+15ZlpffOeERQKXv?=
 =?us-ascii?Q?4FxBUV1Cc3NT5yLGJC4LOMHO6R9YTfjPnzlO3e+nNnf5Q3sC03ANWYu3JL4G?=
 =?us-ascii?Q?5uAOyJvjNz3TRKcKhSQTt7y3vnfIo+Fbd2HB+ICFK2bLQ0DFBI6DnC3Qd0C0?=
 =?us-ascii?Q?D4aq8+b0TO9kf3DwKv2rPV9amyn965PAi3+C0GhyIEmX14z2L0VXWvdVAb0p?=
 =?us-ascii?Q?lPF+EwJgSzBrmaY3+F/Xs6K707/NA2HG+eClCieGv6Rn/V15zVw3WIQzLrkI?=
 =?us-ascii?Q?DekXbh2fQMfN7QWCvX4qg+20wscZXKSwEzAdqxWLWh/aDZC+Tu3nB2V/I/ZY?=
 =?us-ascii?Q?9uqwSTrXaQTSwL9khlGnHy+9+xTqwpW7DhDJG4+OzALkNP0T8FzafNRnC3SE?=
 =?us-ascii?Q?Sf5V6K8TxUHCEgYK/D3XudAbsnQYx3Okonc7g4pWL7qtPJ3M+TldyfMcU5bf?=
 =?us-ascii?Q?2celFJ9MOLiFsvCRP2UzkM/FGfaFaxgvusPmSH8lVM+Ng7fzCxhZ1Ait5zlk?=
 =?us-ascii?Q?VHfGEO/K6ZoN1yVSS/POkZb5UIp+1mF/t2d7yj4QikkfiTwDWffEYeTib8SZ?=
 =?us-ascii?Q?Y4j80I4PLuIHf5dRIJ1FyJu3yYiLb+2ANO+GQwBIOgcxJR3S3yt4RtO/gUAc?=
 =?us-ascii?Q?0JnJGyoEZhvolGz8Kn3KrJtqi4AchHdu8Sk4xTK5RPg4ocMG1WO9wAFLkghz?=
 =?us-ascii?Q?f+WFTHSd/N9n4vJII0kKBwU2f7rWG/eEdfqCOExVFS2KhZn4UWKrx39HMoyl?=
 =?us-ascii?Q?P3q3T4GFDkbXAOou+eJfAk0rOKuDIgLqhUTZgNkXEP51bFZxveTAG1+E36C1?=
 =?us-ascii?Q?pddQ2HMqtCgdPmAQm6f2FDuN2yVhDSaBgKCaKsxs5/4q+cD/83kTe+3idFyF?=
 =?us-ascii?Q?lZ2I+Jtzn1mjmMqCCI2D9jny+ZXxu0dUsyNYDYzNiuwXxeL8zBfzxiV9fpkk?=
 =?us-ascii?Q?Cm2KJyxgplVSd5go6gaio9+WPAZ871hU37uS8BvkPfqu+atCt1/i55TtZ4j/?=
 =?us-ascii?Q?2FAWc9GeBXI+NHCZF/NGWdAWie40mwx/n3p+9kEoPbA8KoU/T0jzcKvHZG5p?=
 =?us-ascii?Q?EE8xCxcfEJKY8w0JC+fn+Hbe9pk5X+itwtxj2goVtQd9acl6OXigRihAG8jQ?=
 =?us-ascii?Q?6b6BfrL5NRv1fJ6mReJstIR8PcfmXh9GrZvFEktbHF3bNZ/nJx5A+aoS9s4l?=
 =?us-ascii?Q?zLjU8bL7bg1kze2C70coAqy/ioLSjHqGLkQgJJ89CJh1cIAMiBVqoE/LYWkF?=
 =?us-ascii?Q?OJ53sFr82qll2Zy2pRV80KJzSmHO+HXWCM2BDCJPhZbIF8pi0Y2tAkeLJ5zZ?=
 =?us-ascii?Q?lA8AWCt6vPohR+HCV7E9rb2igriQFv558MCH8D2RxpDjTSbNfmYruTQHQKVB?=
 =?us-ascii?Q?mo8QrihSnWB7lB6VGP+e16gwdDck++rSaVQNKouq9Su8e4p/ppyIlzYd6xN3?=
 =?us-ascii?Q?hcwkcbLJv9EFVZv40exV/SNP1xmV/0B20OuYRSoiyAZMtbsvI1Issi/hE1lB?=
 =?us-ascii?Q?ns8UCMKUJBYjyaCu+Bo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e9f92b-366e-4ed3-5230-08ddf752027b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 07:56:15.7075
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TznxKT/sb5Hnf7W/ADmEM3S+1e6pd7LQcUGZQX0nx4HJs78dIYJokc53+sQSkjl+RQRjnzzoeZ5g+Mpmo0hXfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5137
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Sun, Xinpeng <xinpeng.sun@intel.com>
> Sent: Wednesday, September 17, 2025 9:54 AM
> To: jikos@kernel.org; bentiss@kernel.org
> Cc: srinivas.pandruvada@linux.intel.com; linux-input@vger.kernel.org; lin=
ux-
> kernel@vger.kernel.org; Xu, Even <even.xu@intel.com>; Sun, Xinpeng
> <xinpeng.sun@intel.com>; Zhang, Rui1 <rui1.zhang@intel.com>
> Subject: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support AC=
PI config
> for advanced features
>=20
> There is a new BIOS enhancement that adds the capability to configure the
> following two features of I2C subsystem introduced in commit 1ed0b48
> ("Intel-thc: Introduce max input size control") and commit 3f2a921
> ("Intel-thc: Introduce interrupt delay control"):
> - Max input size control
> - Interrupt delay control
>=20
> As BIOS is used for the configuration of these two features, change drive=
r data
> usage to indicate hardware capability, and add corresponding ACPI configu=
ration
> support in QuickI2C driver.
>=20
> Signed-off-by: Xinpeng Sun <xinpeng.sun@intel.com>
> Tested-by: Rui Zhang <rui1.zhang@intel.com>
>=20
> ---
> Changes in v3:
>  - remove unnecessary initialization of local variables Changes in v2:
>  - refine the commit message
> ---
>  .../intel-quicki2c/pci-quicki2c.c             | 39 +++++++++++++++----
>  .../intel-quicki2c/quicki2c-dev.h             | 24 +++++++++++-
>  2 files changed, 53 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> index 854926b3cfd4..3ce5a692b92b 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/pci-quicki2c.c
> @@ -23,6 +23,7 @@
>=20
>  static struct quicki2c_ddata ptl_ddata =3D {
>  	.max_detect_size =3D MAX_RX_DETECT_SIZE_PTL,
> +	.max_interrupt_delay =3D MAX_RX_INTERRUPT_DELAY,
>  };
>=20
>  /* THC QuickI2C ACPI method to get device properties */ @@ -200,6 +201,2=
1
> @@ static int quicki2c_get_acpi_resources(struct quicki2c_device *qcdev)
>  		return -EOPNOTSUPP;
>  	}
>=20
> +	if (qcdev->ddata) {
> +		qcdev->i2c_max_frame_size_enable =3D i2c_config.FSEN;
> +		qcdev->i2c_int_delay_enable =3D i2c_config.INDE;
> +
> +		if (i2c_config.FSVL <=3D qcdev->ddata->max_detect_size)
> +			qcdev->i2c_max_frame_size =3D i2c_config.FSVL;
> +		else
> +			qcdev->i2c_max_frame_size =3D qcdev->ddata-
> >max_detect_size;
> +
> +		if (i2c_config.INDV <=3D qcdev->ddata->max_interrupt_delay)
> +			qcdev->i2c_int_delay =3D i2c_config.INDV;
> +		else
> +			qcdev->i2c_int_delay =3D qcdev->ddata-
> >max_interrupt_delay;
> +	}
> +
>  	return 0;
>  }
>=20
> @@ -441,17 +457,24 @@ static void quicki2c_dma_adv_enable(struct
> quicki2c_device *qcdev)
>  	 * max input length <=3D THC detect capability, enable the feature with
> device
>  	 * max input length.
>  	 */
> -	if (qcdev->ddata->max_detect_size >=3D
> -	    le16_to_cpu(qcdev->dev_desc.max_input_len)) {
> -		thc_i2c_set_rx_max_size(qcdev->thc_hw,
> -					le16_to_cpu(qcdev-
> >dev_desc.max_input_len));
> +	if (qcdev->i2c_max_frame_size_enable) {
> +		if (qcdev->i2c_max_frame_size >=3D
> +		    le16_to_cpu(qcdev->dev_desc.max_input_len)) {
> +			thc_i2c_set_rx_max_size(qcdev->thc_hw,
> +						le16_to_cpu(qcdev-
> >dev_desc.max_input_len));
> +		} else {
> +			dev_warn(qcdev->dev,
> +				 "Max frame size is smaller than hid max input
> length!");
> +			thc_i2c_set_rx_max_size(qcdev->thc_hw,
> +						le16_to_cpu(qcdev-
> >i2c_max_frame_size));
> +		}
>  		thc_i2c_rx_max_size_enable(qcdev->thc_hw, true);
>  	}
>=20
>  	/* If platform supports interrupt delay feature, enable it with given d=
elay
> */
> -	if (qcdev->ddata->interrupt_delay) {
> +	if (qcdev->i2c_int_delay_enable) {
>  		thc_i2c_set_rx_int_delay(qcdev->thc_hw,
> -					 qcdev->ddata->interrupt_delay);
> +					 qcdev->i2c_int_delay * 10);
>  		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, true);
>  	}
>  }
> @@ -464,10 +487,10 @@ static void quicki2c_dma_adv_enable(struct
> quicki2c_device *qcdev)
>   */
>  static void quicki2c_dma_adv_disable(struct quicki2c_device *qcdev)  {
> -	if (qcdev->ddata->max_detect_size)
> +	if (qcdev->i2c_max_frame_size_enable)
>  		thc_i2c_rx_max_size_enable(qcdev->thc_hw, false);
>=20
> -	if (qcdev->ddata->interrupt_delay)
> +	if (qcdev->i2c_int_delay_enable)
>  		thc_i2c_rx_int_delay_enable(qcdev->thc_hw, false);  }
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> index d412eafcf9ea..0d423d5dd7a7 100644
> --- a/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quicki2c/quicki2c-dev.h
> @@ -38,6 +38,8 @@
>=20
>  /* PTL Max packet size detection capability is 255 Bytes */
>  #define MAX_RX_DETECT_SIZE_PTL			255
> +/* Max interrupt delay capability is 2.56ms */
> +#define MAX_RX_INTERRUPT_DELAY			256
>=20
>  /* Default interrupt delay is 1ms, suitable for most devices */
>  #define DEFAULT_INTERRUPT_DELAY_US		(1 * USEC_PER_MSEC)
> @@ -101,6 +103,10 @@ struct quicki2c_subip_acpi_parameter {
>   * @HMTD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line Transmit
> HOLD Period
>   * @HMRD: High Speed Mode Plus (3.4Mbits/sec) Serial Data Line Receive H=
OLD
> Period
>   * @HMSL: Maximum length (in ic_clk_cycles) of suppressed spikes in High=
 Speed
> Mode
> + * @FSEN: Maximum Frame Size Feature Enable Control
> + * @FSVL: Maximum Frame Size Value (unit in Bytes)
> + * @INDE: Interrupt Delay Feature Enable Control
> + * @INDV: Interrupt Delay Value (unit in 10 us)
>   *
>   * Those properties get from QUICKI2C_ACPI_METHOD_NAME_ISUB method,
> used for
>   * I2C timing configure.
> @@ -127,17 +133,22 @@ struct quicki2c_subip_acpi_config {
>  	u64 HMTD;
>  	u64 HMRD;
>  	u64 HMSL;
> +
> +	u64 FSEN;
> +	u64 FSVL;
> +	u64 INDE;
> +	u64 INDV;
>  	u8 reserved;
>  };
>=20
>  /**
>   * struct quicki2c_ddata - Driver specific data for quicki2c device
>   * @max_detect_size: Identify max packet size detect for rx
> - * @interrupt_delay: Identify interrupt detect delay for rx
> + * @interrupt_delay: Identify max interrupt detect delay for rx
>   */
>  struct quicki2c_ddata {
>  	u32 max_detect_size;
> -	u32 interrupt_delay;
> +	u32 max_interrupt_delay;
>  };
>=20
>  struct device;
> @@ -170,6 +181,10 @@ struct acpi_device;
>   * @report_len: The length of input/output report packet
>   * @reset_ack_wq: Workqueue for waiting reset response from device
>   * @reset_ack: Indicate reset response received or not
> + * @i2c_max_frame_size_enable: Indicate max frame size feature enabled
> + or not
> + * @i2c_max_frame_size: Max RX frame size (unit in Bytes)
> + * @i2c_int_delay_enable: Indicate interrupt delay feature enabled or
> + not
> + * @i2c_int_delay: Interrupt detection delay value (unit in 10 us)
>   */
>  struct quicki2c_device {
>  	struct device *dev;
> @@ -200,6 +215,11 @@ struct quicki2c_device {
>=20
>  	wait_queue_head_t reset_ack_wq;
>  	bool reset_ack;
> +
> +	u32 i2c_max_frame_size_enable;
> +	u32 i2c_max_frame_size;
> +	u32 i2c_int_delay_enable;
> +	u32 i2c_int_delay;
>  };
>=20

Thanks for the patch!

Reviewed-by: Even Xu <even.xu@intel.com>

>  #endif /* _QUICKI2C_DEV_H_ */
> --
> 2.40.1


