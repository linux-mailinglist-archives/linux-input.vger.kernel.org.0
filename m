Return-Path: <linux-input+bounces-9168-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA59A0AF6D
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 07:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 625CC1886C7D
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2025 06:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBDC231A50;
	Mon, 13 Jan 2025 06:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDkf36KD"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E9186A;
	Mon, 13 Jan 2025 06:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736750600; cv=fail; b=BWnEs9YckrVpB8PBr4KJFOKhvpExIN4DHrBtmfI3C5beTZfhnh2mh9oZFiqyBsc4X2EKtgKQzZwv1UCj6jg0JTqggXT469iACHRmos25wzesSrRzpcawAO24E6P3JpSfayOo9kRFLVT1aE9vQwHSMAgPWmYsHX8/4jxDZ8ygEnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736750600; c=relaxed/simple;
	bh=/IyJuj4SBcwAf9eKwLm9vj9yeHk/OEbR1ZgNb4kaXvY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qrTHeoyp3hpvMk/N9juia857qcWhTJjzWdtzYKq+r+wWRmMOZJgsmPjVaEzkA9p6V08R0JnkeN5C2whgAAbojS2+lMZIj+rkqngZCSyOm6ZaJE1pAZFq5Jmt5E5iQAB2BZA0ks64WK3l+HXAcOb/9stiCdOt6xgHDqEuJnCzsGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDkf36KD; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736750598; x=1768286598;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/IyJuj4SBcwAf9eKwLm9vj9yeHk/OEbR1ZgNb4kaXvY=;
  b=aDkf36KDTeiImDuU+zzhd1543Ci+LrMqjcDDGEwNUuRQrX2eWma6uwVX
   ZY44gX5G8Ltdt+5/i9l/dHTuHb92wXotvBTbvFpDCFnpcVhyOSVxMQBfF
   f5Z2bCIKuONeN7QOSbFOdB1G3uVHBZenQTn+2LSoe1wtsygvP2QQtEv2E
   4DttPRDbv+qb+ZnjZmwuioCf+Qkl505nuL7sDWuDSWlCRsGoYP+9eGt0W
   dfGmJGUTW9hQBGm2cwV/V8KSNPQrxf8Q9zUHttiwtCEzhQKRd6qqQg8/k
   Yyf+ThUzoFqvnskp53TYQ8GWDWjjYIM5Lai98sSHFaDCqnRX4bs4iPAIf
   g==;
X-CSE-ConnectionGUID: WeNpr/U3Sz+88bPXieExQQ==
X-CSE-MsgGUID: Vo1zxYGOQ/+XTL37tQItSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11313"; a="62370479"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="62370479"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2025 22:43:17 -0800
X-CSE-ConnectionGUID: 8RGXBGGuS4+l3UIk2633Aw==
X-CSE-MsgGUID: lbI4CRufRb2ZjDk14WJCBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104335626"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Jan 2025 22:43:17 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 12 Jan 2025 22:43:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 12 Jan 2025 22:43:16 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 12 Jan 2025 22:43:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH2vIKB54Ud322oMbC5/O2Oy/OPivVzoLQYVYDx1zMjC+L68R+dUxPBq3PisvRhVJHER6rTbxwiI1OfL9MJLNchHU/u8IHPRMY7JrRJjsop+kpAXQWbulvHhhGG14fRDPMuOw4+tPNJlHfHhFRVAc79/oNePNdIthNh45w0/NJkQL3dwHrLKZlbLvjT2BqUM2F/n6nYDIC69HnnHe4tqIg6E5e7tLVfef4siUqrneP8E4oR6gDEY7iYt2cpwitPQnfRkxADkj9MPEqZ1EgrdJSlHjC8wV7PFBFy22coTEhW3aqyvMXed7Yxov61mKa6gr2U9pHOXDbUXd3eUNOw+5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbXavOhJ0FjgpmFLuF6dKuvWUTDiNISBa3NTcjqnDCk=;
 b=uhW5NntAv+qTSAUTnN4c8e6UPjNmbFH0N2zN0zdcKomod9SPUeyQSfxvIdl+CTOJNYxPJbeEWLtLukYsZ1Ufvcr/vq9IYPNW3jX1aYJhHHWEa/jdPZHgHz2oLGiyd7xZQekz7Iox3SPwSsO2myu5nsVYTl+jzOu8GF8zHwN7OnfQ4Mgx45wwSH1DWwaK8JM+VSbnU73NJg150yfKVpTiF9qV6yuUoIoHBPClVwBCG3fITOiwp/7jqP5Df0Br0PpVIe0NYeHtzfv1MzAWgGeaxosCcM6z7B9EclnN65jNiB0sz/r9kSGLKisvckjfe8mpaWJVayjBpRdIuB1hzYSUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by LV8PR11MB8509.namprd11.prod.outlook.com (2603:10b6:408:1e6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Mon, 13 Jan
 2025 06:42:45 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 06:42:45 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: "Sun, Xinpeng" <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Thread-Topic: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Thread-Index: AQHbZYKeeJY730Mjh0Gneh9eWziaQ7MUPqAA
Date: Mon, 13 Jan 2025 06:42:45 +0000
Message-ID: <IA1PR11MB6098C9EB3E69BDEDA8889BE9F41F2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
In-Reply-To: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|LV8PR11MB8509:EE_
x-ms-office365-filtering-correlation-id: 2a6c131f-d6ac-45bc-b550-08dd339d7d1f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?sAiyEvoPu5kpNdAoqU0R6Be57O/zGtgcDx2GNbJbtZ4GNNW2Zh5GrwV/Ipqd?=
 =?us-ascii?Q?KwBYnLxX/y3aowXAR4M5LI52ajenZgYHhGAyxV9E5OsuUA+/Y5YrTf2qUfT4?=
 =?us-ascii?Q?LrAfe6SqXj3DAPJ4GdcY7DFc0f1NKuEwYyO/ElooNdgZlfL2WGZedEOK62/L?=
 =?us-ascii?Q?mZNVcGDlff6raxNTGjp25CoVRd9pt2bNnMxat+2ucTgPgfeG94i1i4CNJRj7?=
 =?us-ascii?Q?2z2PgUE/NxOOT/0i9ZUIUNBtE5Z2peXrLBwg9OqtQQVNFe8gXKwVLsENi4dI?=
 =?us-ascii?Q?oGF6182gyD940UBfcSxVA9U39HDVDOKs3OQXgCRR1/TNhu0YHj6VD8oHvKG9?=
 =?us-ascii?Q?S9Wx4kMw4C0njfP0SlLjIXcruFnwcXu8qkRIua9EUhzWXseReEsz1hnr0c9O?=
 =?us-ascii?Q?cts5KnXhdirqZkKw0LMKtP95YSeoqLEUf9RICVhPjOr2qM114MPNJEhNTFOs?=
 =?us-ascii?Q?qSokkVwhZESJD2rCxH20vgE7QK0zvhoUZhdsUGCq2HYB8D0Wag8lJUULmf8x?=
 =?us-ascii?Q?9rmKeS/D59ozCMWEYdFffM8IpZbPAyXvPfBGqtFFqpxEn1xOPtOGeaZ+Vf7J?=
 =?us-ascii?Q?PkeBwE0TdwVojx9c8sSB1MlcyMzDqId53fFnikPW1ZD2V/lR7zS/0ihuOFzy?=
 =?us-ascii?Q?laoeMC2uACgx9cZiXkPFml18EcKnZsM1tp5eiM3DR8rlZVh3HBYCjFJ674Bw?=
 =?us-ascii?Q?4aOy8gM1tXXwzwhZ9cHDd0MbXPc6OzUnckwCtvBh7oowdHJJj4QiYbYLXrL+?=
 =?us-ascii?Q?Ap94O7kwYmUrXzQqLdjCNIYCemJIsjbCY213PajqW6epzTX1Ex24Mtrt+sJu?=
 =?us-ascii?Q?DkroX4S6hWrOVRi/G1wi05s5EKxMEXOTrZdq+BQUyyqbpHcnWplHvn60xu8O?=
 =?us-ascii?Q?5bDuyqK/mkbhyGPLZ+JEC4OOtOGhyo5vjvYsaWkvZ9H/fUgC9OoDh5Toi3OE?=
 =?us-ascii?Q?0V16RobPWYCUx3PgPeN6GEBk/TKO7FeO0M4NAdqMmP1AE9/jgP9Km1yy/iqy?=
 =?us-ascii?Q?9PSGbI3FbvZLiuhFYC2/UKyL/KlmZxb+bGGhBfW+YKv5RrDNyWhu1HgLTw5D?=
 =?us-ascii?Q?mhyhHN9Wu5jnABFbMyy9KRtCHbAZ0b21B29QY6EMeMUYTsJkPiqwKECVHb7d?=
 =?us-ascii?Q?9GpSjfFPW9fAnbJEidph2ln0g0uVlAxQOXJs2NR2Wrp5MedeBujb9UqAcdSP?=
 =?us-ascii?Q?98mSNFTJ4Lmn8uSP/OhWzK3p0GdNM8V0ZM4RfWNmaAfnCHmzqc1tmMlZ+CJp?=
 =?us-ascii?Q?23ephEisGiJ6LV0qcV55kdzxvJUSbIha5yoIq7vR20FIwWUHzR4s4Qf7/lyw?=
 =?us-ascii?Q?UOvEj2REmFId5d+KO286DXuJY5UZU9GJIVa51BfeyS34vv5wb4qSJ8EWTEXO?=
 =?us-ascii?Q?5LMWTMTS9LkcAjWIM3zNO5bDdgou2lu0ZiJERjv5hFMAGdunqzjhtZE77vTZ?=
 =?us-ascii?Q?4nAcwieocpbdedlQGcHHm+bvDkgCVB2x?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hUjHd4K28yCgJLlh9V1ldITPicElVxc4QAW+TSa+cnXQPKS53INIKCrwOhaZ?=
 =?us-ascii?Q?+DRWqQyWlfLacgDGslnhWgUJaSx4w/i/7R9F9JK024y6eodZkyKatez5zgp4?=
 =?us-ascii?Q?66H38xnLFQ9HMU9gFOgsFPDe4Z/VLUpCw5qKlQBHzk9RSLjdAO70mUG+dIDI?=
 =?us-ascii?Q?45xnQB72/Drc48T+Qdmm4Dz+fbrxFiEnfHskoodhkWKHVey87Om3fEcJXh8W?=
 =?us-ascii?Q?MBBrHvhrk+5jMGuuNhJDtoRlU+L6otrcfkQKdBnBUwCcU7IoRoxEOGwbrPnl?=
 =?us-ascii?Q?AiJKJ0q6TBUJ8Z9D/pZTAKzTR8Ga5XPfa3q79BEtFJlVKU5hiihTniyWpNDO?=
 =?us-ascii?Q?FJ84XqMoLb138ZdczOh4gTKJal+pIEkKngX1YSMs6jaJVe/vvtRlsia1XMCJ?=
 =?us-ascii?Q?ombU1yjhF4+WUCUqOhUZpPNK8xnRyPalCacn7mYEMNAAlQ5dFxC/f2bELqao?=
 =?us-ascii?Q?zV7pJDr9DkrcA6QLK2urrfh3C6pNyNa9A4mXCNcxOOJ6K9uV6EHy2XSMxjZQ?=
 =?us-ascii?Q?A3nvVzc86IfAT8G/+STalpA5hbAXAWr/WCMwRy4Qvj+pz7NqlpigNzraFxFR?=
 =?us-ascii?Q?s0LHMORVxJeciKICmUHuY9cOZ5yI5UFnl49ccohM0SVUV2LknCHH7r70x710?=
 =?us-ascii?Q?TPsEck3vs+K5dFjTgKRGt4qLQ22MDGXuqIqeou3ey4kVHPBmQh4tWKTdcrSW?=
 =?us-ascii?Q?KMOmC36Mx7+L3hxCo6/1tO8lQqzX600ASrCVTaRJtetSixzxm5/cz/I6rJb9?=
 =?us-ascii?Q?KkfXkcvn0BgTFQxYe/Tjq1ok9RXqLWDzec0DViwYvu+bkYKt73UgqQNqD4cy?=
 =?us-ascii?Q?vIZVa8PeCRvu2uuA5P3W5zvG55ksnXAllTA6FN+7NoxNN2W03kBqRzg/5KAQ?=
 =?us-ascii?Q?ZbmvhxZM4J/O+x9VDLdScw2JLPOlLPeLJ0M3TmGylQ3P2GefUI7kcQBELtGm?=
 =?us-ascii?Q?wF28FYlhOQ0nRkzGbu1M/rBYMfmikzU9JXyroZjU//EXHgo9LZV0cNVBZ7uv?=
 =?us-ascii?Q?zN+JybnvnqZlClXoeuw8KspHTRAuzkZKVxhR5EdRrkJrNIqkXSgcO+31NN4S?=
 =?us-ascii?Q?M25iSwbGhlcISr44VXyT6fyCEtFjr5snw9iEkFPRoIiNwaHDXDcomCpRNywJ?=
 =?us-ascii?Q?VLjB6l4Z31t07+yslVSrjXnZowIeT1TUkTTlaCfUQ+eUtqxrtTzJXj9r9U28?=
 =?us-ascii?Q?SiAmVsIZxUjoF0hZACubd8mo2+i39XYTE+kDafD2b8mhkftVGkmcgflHYnMZ?=
 =?us-ascii?Q?r8OgAbEXors1cWC6ZP7Psz92bDM1PZ+vYROo2S+njavFiIceEJZRWvc2FNdb?=
 =?us-ascii?Q?Wh1cjdcgB2fS2+mIuOA2o5d+njnixKDPxnchFMN/ehkTdXZ4oqv4FM7hA/sJ?=
 =?us-ascii?Q?2wOOoqRIG48ll+VdD8SH+I/Qgpvu8h0+VQnjMWDM3s3mg1RaiZ4kicQkvK04?=
 =?us-ascii?Q?0Ab0MwcLIx8ZCzrNslDqM6zvSzpIAklG1L2KTaF4SduI69Vt0/kTEkqTOHt8?=
 =?us-ascii?Q?CiJg8Sb8V8Y/fzMsaH5wT31l8WTDc/8O7WYVUlE1yJOWNvQmsRxc2oOO6pVe?=
 =?us-ascii?Q?1pAIkLH+99QF9ePsE+E=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a6c131f-d6ac-45bc-b550-08dd339d7d1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2025 06:42:45.7983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LCuwxFRvfPlvuHePQooJtDmrxcYXAM6AilogtTC9X0Dg+FjhWhUg+nYjp7L7kuzHte/o/AfCzHjzKcG0a7xJYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8509
X-OriginatorOrg: intel.com


> -----Original Message-----
> From: Dan Carpenter <dan.carpenter@linaro.org>
> Sent: Monday, January 13, 2025 2:16 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: Sun, Xinpeng <xinpeng.sun@intel.com>; Jiri Kosina <jikos@kernel.org>;
> Benjamin Tissoires <bentiss@kernel.org>; Mark Pearson <mpearson-
> lenovo@squebb.ca>; Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com>; linux-input@vger.kernel.org; linux=
-
> kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
> thc_i2c_subip_init()
>=20
> Return -ENOMEM if the allocation fails.  Don't return success.
>=20
> Fixes: 4228966def88 ("HID: intel-thc-hid: intel-thc: Add THC I2C config
> interfaces")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c b/driver=
s/hid/intel-
> thc-hid/intel-thc/intel-thc-dev.c
> index 92a1dbe9a928..4fc78b5a04b5 100644
> --- a/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> +++ b/drivers/hid/intel-thc-hid/intel-thc/intel-thc-dev.c
> @@ -1519,7 +1519,7 @@ int thc_i2c_subip_init(struct thc_device *dev, cons=
t
> u32 target_address,
>=20
>  	dev->i2c_subip_regs =3D devm_kzalloc(dev->dev, sizeof(i2c_subip_regs),
> GFP_KERNEL);
>  	if (!dev->i2c_subip_regs)
> -		return PTR_ERR(dev->i2c_subip_regs);
> +		return -ENOMEM;
>=20

Looks reasonable.
Thanks Dan!

Best Regards,
Even Xu

>  	return 0;
>  }
> --
> 2.45.2


