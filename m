Return-Path: <linux-input+bounces-4756-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0431291DCE8
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 12:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 367AAB21036
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2024 10:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 565AC768FD;
	Mon,  1 Jul 2024 10:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="NoaVUCiP"
X-Original-To: linux-input@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B039FD0;
	Mon,  1 Jul 2024 10:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719830609; cv=fail; b=auzot5PNZiFrooPDxQddAT1TY4Ll86MMYT9ywVZEtu8zxCz38Gt2iBwIZHSX++r6cLO+jGhp5Ipjlj6uv2peXqBioChBQQ5R6Ou+tUuUt2iLQe15fSBVPeepi5l2eIn2MXf0+AcDpVig8bb/9OKrwBq6ppfU0KuouubSicMnw4o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719830609; c=relaxed/simple;
	bh=Wet3nZA00sqaSvlpDfupUEJjXwtamRs/novETKjuB0I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EPs0EqQt6Q3mzrIW5wt3ECcccMsiS4UKhsPZVGJcgJ7qsOAUzbKOaJl314FSgp1lPfkm8eV5Nl/kJ3BTCSS3tiUVWsxilrwhLmEBDGkFvsXvX5vzvj0K45OK1HGK555JOsvd3WIZnAEB1S8Mi2hJ2OFN9qSP1ZVersFYFarq7Xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=NoaVUCiP; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4619dFaC011980;
	Mon, 1 Jul 2024 06:43:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=NvOwL
	PswkqG5CsxxyspRThcUaqzKz/Yfz/M+dbMOM40=; b=NoaVUCiP/VdrUKPKbO2Ed
	m8fpApnaDy6IeL9lE28CNvwvj/S1OHCX1iY1r3jflOweAkN59CjDoRgza+hWwp/h
	ca65pyVzth9GZWSk+iyghGGeIouEF+ru8PuThYWijHGv/ESUY7N1gYjdTAIZwkVB
	oX086qkJhaaYGMk4JbGezeWEE2bovju7vPuAGm64r2agBZki4bV01ZRuPuEcboBQ
	jfhiEy/W+NvCt8LZkPlGxUMRechb0BxNUxRKMS8Mor53QDsEu+z0mX5KhjTB3GHu
	pQZAtjETx7W/d6AMNAXs3M3ItL+VBxgLEkEpV2551DEnP31woCSv1fgTN+9ilWUs
	g==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 402ew4w590-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 06:43:19 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dezAv02babe+oU6lUl5uSI1BSKggJ7rMJf3QCTaZ6Je0IUmfndwBqrIyYQ15hjqc0sG8NdK940+EtWnVpUNtEPQ8Vj/5+mCDd6TpRgBsiXqblos6UC/BKSSmzL58G+aQz8KFvFqKOM5ECxVU6IceyBvVbEJWGRg7pci//uF2cahT6Tsw8FOdsdWsUNuZoKutXew55OkC1JNRQu5sxknOrzb2LOSN/n7ut2vAvGtFCPvp1uxBYd5wyECFylKDGYDPdNuad5lpTCeqgxX/0vDtcuO0cb3TubIVYCJxIazaQ+wLzs2psC2rpHye6F+BvNmhxeWQqr1dnvSF/01xoQjxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvOwLPswkqG5CsxxyspRThcUaqzKz/Yfz/M+dbMOM40=;
 b=FCr1Kvf5AYtACHsV+2iEHy2MVFE39YygfT5EpujmXSbmw0MLS5dau2/7KX9QFkTc4xrGSRs9gw1b7Rk/Hpe3m7k+2MiUEmn2XHbxTCLByyvYlzFcUQ1t26fq9lyEqBu6EpkE9U9A1ecssIfETW54bltzhYdvVnpavc1d0MBQkX3vtB1ueCKyXTGryDtzqUIOB6CBNoajGk6spl88oxkZOiW3dmLkhr372bU/Ai5W1BRYIxDbuCKe5mMFaY8Kdm12gKpADV+uA28aDzxeq3NSprXydZO62Lc0jE0ijSsXYVAMTu21L+h0eY8umfQnSpIbK8wVMsOUP07b9mfAfWMdwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com (2603:10b6:a03:399::11)
 by DS7PR03MB5574.namprd03.prod.outlook.com (2603:10b6:5:2c1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 10:43:05 +0000
Received: from SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23]) by SJ0PR03MB6343.namprd03.prod.outlook.com
 ([fe80::6744:a83a:ab:7e23%2]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 10:43:04 +0000
From: "Agarwal, Utsav" <Utsav.Agarwal@analog.com>
To: "Hennerich, Michael" <Michael.Hennerich@analog.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Artamonovs, Arturs" <Arturs.Artamonovs@analog.com>,
        "Bimpikas, Vasileios"
	<Vasileios.Bimpikas@analog.com>,
        "Gaskell, Oliver"
	<Oliver.Gaskell@analog.com>,
        =?iso-8859-1?Q?Nuno_S=E1?=
	<noname.nuno@gmail.com>
Subject: RE: [PATCH v3] adp5588-keys: Support for dedicated gpio operation
Thread-Topic: [PATCH v3] adp5588-keys: Support for dedicated gpio operation
Thread-Index: AQHayWQenbd8QNwcmkaTlSgpfPBSyLHhsqNg
Date: Mon, 1 Jul 2024 10:43:04 +0000
Message-ID: 
 <SJ0PR03MB634333C6AE67823F421B08B59BD32@SJ0PR03MB6343.namprd03.prod.outlook.com>
References: 
 <SJ0PR03MB6343CAFA976656052DD10F5D9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
 <SJ0PR03MB634322A27945D27D047DCFFE9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
In-Reply-To: 
 <SJ0PR03MB634322A27945D27D047DCFFE9BD02@SJ0PR03MB6343.namprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-rorf: true
x-dg-ref: 
 =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcdWFnYXJ3YT?=
 =?iso-8859-1?Q?JcYXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZi?=
 =?iso-8859-1?Q?ODRiYTI5ZTM1Ylxtc2dzXG1zZy1iMDJkZGVkMy0zNzk2LTExZWYtODRmMi?=
 =?iso-8859-1?Q?02NDQ5N2RjZTVmODVcYW1lLXRlc3RcYjAyZGRlZDUtMzc5Ni0xMWVmLTg0?=
 =?iso-8859-1?Q?ZjItNjQ0OTdkY2U1Zjg1Ym9keS50eHQiIHN6PSI4MjM2IiB0PSIxMzM2ND?=
 =?iso-8859-1?Q?MwNDE4MjIzNDk2MzIiIGg9ImVWSGJCRHE4UW5OK2RuK3hJQlYxM1JWeTA4?=
 =?iso-8859-1?Q?VT0iIGlkPSIiIGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk?=
 =?iso-8859-1?Q?5DZ1VBQUVvQ0FBQkFHWVp5bzh2YUFjcW5kQnNMTDlvMXlxZDBHd3N2MmpV?=
 =?iso-8859-1?Q?REFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFFQUFRQUJBQUFBM0xoU2ZnQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBSjRBQUFCaEFHUUFhUUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QU?=
 =?iso-8859-1?Q?c4QWFnQmxBR01BZEFCekFGOEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFh?=
 =?iso-8859-1?Q?UUIwQUdrQWRnQmxBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQU?=
 =?iso-8859-1?Q?FBR0VBWkFCcEFGOEFjd0JsQUdNQWRRQnlBR1VBWHdCd0FISUFid0JxQUdV?=
 =?iso-8859-1?Q?QVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURFQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFBQUNlQUFBQVlRQmtB?=
 =?iso-8859-1?Q?R2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dCdkFHb0FaUUJqQUhRQW?=
 =?iso-8859-1?Q?N3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21ldGE+?=
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR03MB6343:EE_|DS7PR03MB5574:EE_
x-ms-office365-filtering-correlation-id: dc1d2d18-c4d5-4161-a87e-08dc99ba9674
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?pfX4VweE7zLXfuri2+orp1OzFZjDSDy2XiU1PNghOgRL8BA0RL7ukQ4qDe?=
 =?iso-8859-1?Q?m6fwefhqxoQ5KKErNzmx2syOW/MTVawNGuzccpKKJu/dIOz4qbnMfE4RMs?=
 =?iso-8859-1?Q?qckVQFyAVsnXKNGRR2c5vduttnArmi3s33hNJ2nG9WeJRo8CaS1OfI6iDG?=
 =?iso-8859-1?Q?7HNuhxBatt1Rga5dRkV2eQR756PRfN8lzIzaxWmwA/tA2EF4IGMDhm3Pfd?=
 =?iso-8859-1?Q?XgrRm3DvEv45ZJp7lA9l3AEJ7zkZ+ga0yEDvi1SWp/lXHPM6iBV8Eb3aSA?=
 =?iso-8859-1?Q?b2W6mUT7RmsoF3V6PWiJl6UX21wrtS/3CulVCQZg9q+zGhO2yrtMPBzMTH?=
 =?iso-8859-1?Q?IZl5obhPY58897KpT1qVxd7Re6x/y7euxdiJs/44cagG1VepW07hRW8GXl?=
 =?iso-8859-1?Q?UDQFfzm/dUsAqDZqCeje3vLYVxEXYvsYQDZjxKkDTwddAyALylj0cw3SvY?=
 =?iso-8859-1?Q?Pwxf0kl0oddlkAwqvpDHGMXLMHoEGddPIxiwJ+QAfmBMbV5p+ceK0V2MXd?=
 =?iso-8859-1?Q?Ca4cmDvZpdz408UGM96H6LMr4yP7+kwCCgGrj3FmxsS/FCjkKM9WsAUERt?=
 =?iso-8859-1?Q?1IRJHiF8F4hONuU+td6I+fObDftWlvmJEaAQTh0JFQCz70DI2+hy5Il2OC?=
 =?iso-8859-1?Q?l9XUy+eiqbc3qAOksXxsMxtxBDGtB6wJ+qKgwSkdmkDnU7D19u6F2doG4T?=
 =?iso-8859-1?Q?Xj4Lr9HEztJ3WkqlR029GUfSpqeS/6R8qtp3/alTNQO+4+kfnmu4YS8HMh?=
 =?iso-8859-1?Q?s4ITO+bHHIPkV3VAhm2XqW2HztIAyjgclu6yF6Gy9AnYsFc0EQyZGc1jTu?=
 =?iso-8859-1?Q?BU0F6Mn1vY+WwwWcwzAp2XdkqaaGbJKgAWp/HTK+PNkfjkkVMD1bUxjhZr?=
 =?iso-8859-1?Q?4x4Sc0PcSXRo8r0wucwnpSHhv3EHWb4Vpb1CmIUZc8slvAyOl98ug3NFEH?=
 =?iso-8859-1?Q?kjyp3kIizJCpvT9NBGirDyC7MyRCPkZArmRFro2rYzgMXsHoy7hniaI793?=
 =?iso-8859-1?Q?hBy2+C2/4o6D349PG1yUJ4NA+1G9aH5rkQaygvSpTECOjg3ZXCmzCu7drh?=
 =?iso-8859-1?Q?mMr8WyQqnwwIR7XkxJVBi2tAGwvgo/9Je4q8Jc63qkkZnerqeShEyrvdCG?=
 =?iso-8859-1?Q?742wHDAFR0lTQeA6YxVe+AGm81WoeOnlrJ9NVuJ+3o3lxmU7R3fumqYAAU?=
 =?iso-8859-1?Q?WVDyZYji6bt/WdWQYolCUDDGEVTZlcvnmACfu1RzbZTRBAGap4YmorNDoA?=
 =?iso-8859-1?Q?wzQzWDNsrUhoXD83uxD4cpUeYfNWGVi12a638caHzZhcpFjauUYKOaxp3M?=
 =?iso-8859-1?Q?p6QUJcyJelEwRQD7HvimZ9+fbD/AR2pKvIb4aXU1OfFPaAbxImm3IcneY6?=
 =?iso-8859-1?Q?RMoywC6SR2lWkEPlRMRQwbS512rW+vMiDpXjQhkpLQjG+zf1I+ImmEtm7Q?=
 =?iso-8859-1?Q?nvRayMaq9HRZGf0CNvOf8Fd0WnaRUjKOfkZ0PA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6343.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?goREmGT4Q8SVFg8gXXigK7RM3kJfu08cw2kja1q72ptZXaFHjVC4dCILAe?=
 =?iso-8859-1?Q?G1KBx7cZjcZSJm64Q6M5wOjle0/BjrMDhHHSUQAsO5NS6s3un6rboddtzL?=
 =?iso-8859-1?Q?yl4p1Bh2X5Pg6Aqmn0nvtl30WYCSgY0Fh6JNP1cbQx7xjsvLZBg/mKgRYV?=
 =?iso-8859-1?Q?jYfMkLS2iNVT32D8fGaeu7gTGalJL/t3gK/FVM3NVXQsgOEMoHMcmHnSNj?=
 =?iso-8859-1?Q?4zT7voW3UanYcIO6hYK3GNBeZp3ZxAzqhRWwYMtziz3ufUlwzNmzdetEc/?=
 =?iso-8859-1?Q?VN+otjgSdEH54O5VUvRPc53neHaEwG3ihITWN+rXxMJR2kNQ8dZHh6wsn5?=
 =?iso-8859-1?Q?jH0f+u3eYbTqQZ9Lq3ugJKVgrcxwyiiaElPqSsTRcF1OhaOvce9Aec257x?=
 =?iso-8859-1?Q?CqyGiLAolnafxuYFUMknmxipKs76N8FzLHmJMvJKLyu9tqbQY2u/OrrDk7?=
 =?iso-8859-1?Q?+RRHSK5C8hBBT3FQyVr0OWROTxwICjW/3NOXHK52oqjURbOfelL+tG4pCh?=
 =?iso-8859-1?Q?q1YIrycUQLW870zSslVaKVmI5XdcSBnsgDbSr8dDjw4vPVJ/bfNdhvyshC?=
 =?iso-8859-1?Q?JPwfQwWAwijR/R0B6xBJS0l33uaqH3noRkYSv6dp3vVjELBTPtvN13tP8u?=
 =?iso-8859-1?Q?bHb2o6OlY4mRa50PB4JyqakKKjFMm0gGJazG+DMHgvJAA3NL/dmlSutYHZ?=
 =?iso-8859-1?Q?afIgrbrXOjW4NW4QzUbQUeANn3zeZzwrcxwu+9VKqjmO/524fxB1q18M2+?=
 =?iso-8859-1?Q?8GvSi7Fh20Pz4SqQikIDc21p5y7z6iKMR8YLSG+4dMOCL3zZnKd8UHCfnB?=
 =?iso-8859-1?Q?qa5jWxU596qJlhqvW3BGMOq5QxWT5euvrLFTBHTJgSKEqZvBLjHvapOXS6?=
 =?iso-8859-1?Q?Y9QIx5LKPildVABaW9E6qKUVEF8Nj1MP5Icyo5ysuEimHSYtwsWqBRgqlK?=
 =?iso-8859-1?Q?qy6OpRYS7R8hSbmuCFh7gO7ezA5W8TIvFAfLjdLBlBUgztNOjLdn4Om50L?=
 =?iso-8859-1?Q?+wMCmxXY4dASRuV+dWe6HXnBvmyUQsR8J15FtLWwZPZkMbE2nOkFBmr5Ce?=
 =?iso-8859-1?Q?ITWgDxdLvvt6R0mRHYzaMDi8Rlxy8A9YZg2GF3ovC/Cxpt0oag/UyKEFeH?=
 =?iso-8859-1?Q?cMoOVid5hrNrh8omPNWmkn9TD2rQ3tFBPQ4CU9nre4T2wvMiDsEyJ106qh?=
 =?iso-8859-1?Q?7bOhBaEUe5Gl3GJkYvtiwKBJb5BTZ58gk8jr0ITlZ362qhIXla2M+xNAdq?=
 =?iso-8859-1?Q?T+SZ0KFcWQltQn73RpTSXRbNg2jOZFz0qH4RytYI3JI7Zftvt64mEHf75h?=
 =?iso-8859-1?Q?z/Y8af51wA55BY0f8QA+/IB3WsnlYZ0Vuo6wKvYSlxB3QRwwVpG858zGMA?=
 =?iso-8859-1?Q?UEZB0cBtz+o/g0sB2RbxRBY+JaJgvd1TkhbCE34/3ZOvCXJu3JcFmhIZsG?=
 =?iso-8859-1?Q?9pvzH/NDDmMi0PjVg2Rr7FoNL0XeKvTMv4p1ZmsIzMebNH2b/iCxo91/Qy?=
 =?iso-8859-1?Q?c94lgJXF+ebAWkzTnCHKMgSqq26Eh+drkOWPFeMknNFkDZg9zBsZU9PT88?=
 =?iso-8859-1?Q?VSkNbA1EFDE+YCqy7JcuSS4wkT+UEXWBNh4dYGd4NbsUtCWLjP9BjzrvTV?=
 =?iso-8859-1?Q?MdwmQ97/fWEOqwjhYKqrTc8x08UHf5eqav?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6343.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1d2d18-c4d5-4161-a87e-08dc99ba9674
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2024 10:43:04.6102
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cF8johf6BljSbyXT0b509twMPnUIHdQLD9TUI7OdSlDmAOBX6PYAHEM2B3GXtV5aqHluOlX+S+4BLX5GCB14R8vKjNKzgUxTh+F5BER14t8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5574
X-Proofpoint-ORIG-GUID: gMoQIyUvHHK9c65HXftNHz-_sqYQ2Nab
X-Proofpoint-GUID: gMoQIyUvHHK9c65HXftNHz-_sqYQ2Nab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_09,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010083

It seems like there's a typo in the patch from an earlier version of the fi=
le(dev_err is supplied struct device rather than a struct device pointer).=
=20

I will be resubmitting it, apologies for the same.

> -----Original Message-----
> From: Agarwal, Utsav
> Sent: Friday, June 28, 2024 3:05 PM
> To: Hennerich, Michael <Michael.Hennerich@analog.com>;
> dmitry.torokhov@gmail.com; linux-input@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Cc: Artamonovs, Arturs <Arturs.Artamonovs@analog.com>; Bimpikas,
> Vasileios <Vasileios.Bimpikas@analog.com>; Gaskell, Oliver
> <Oliver.Gaskell@analog.com>; Nuno S=E1 <noname.nuno@gmail.com>
> Subject: RE: [PATCH v3] adp5588-keys: Support for dedicated gpio operatio=
n
>=20
> From: Utsav Agarwal <utsav.agarwal@analog.com>
>=20
> Current state of the driver for the ADP5588/87 only allows partial
> I/O to be used as GPIO. This support was previously present as a
> separate gpio driver, which was dropped with the commit
> 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> functionality was deemed to have been merged with adp5588-keys.
>=20
> To restore this, keypad specific checks in the probe
> function are relaxed if the following conditions are met:
> 	1) "gpio-only" property has been specified for the node
> 	2) No keypad rows/columns are specified
>=20
> The "gpio-only" property is introduced to simplify usage since it
> serves as a clear indication of the user's intention as opposed to being
> inferred from the number of rows and columns specified. This
> adds simplicity for the accompanying dt binding update as well
> as interpretation of the same.
>=20
> In such a scenario, additional checks are also introduced to make sure
> that keypad and pure GPIO operation are mutually exclusive resulting
> in an error if unintentional/incompatible changes are present.
>=20
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
>  drivers/input/keyboard/adp5588-keys.c | 32
> +++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/input/keyboard/adp5588-keys.c
> b/drivers/input/keyboard/adp5588-keys.c
> index 1b0279393df4..c8c637046098 100644
> --- a/drivers/input/keyboard/adp5588-keys.c
> +++ b/drivers/input/keyboard/adp5588-keys.c
> @@ -188,6 +188,7 @@ struct adp5588_kpad {
>  	u32 cols;
>  	u32 unlock_keys[2];
>  	int nkeys_unlock;
> +	bool gpio_only;
>  	unsigned short keycode[ADP5588_KEYMAPSIZE];
>  	unsigned char gpiomap[ADP5588_MAXGPIO];
>  	struct gpio_chip gc;
> @@ -647,6 +648,32 @@ static int adp5588_fw_parse(struct adp5588_kpad
> *kpad)
>  	struct i2c_client *client =3D kpad->client;
>  	int ret, i;
>=20
> +	kpad->gpio_only =3D device_property_present(&client->dev, "gpio-
> only");
> +	/*
> +	 * Check if the device is to be operated purely in GPIO mode. If so,
> +	 * confirm that no keypad rows or columns have been specified,
> since
> +	 * all GPINS should be configured as GPIO.
> +	 */
> +	if (kpad->gpio_only) {
> +		ret =3D device_property_present(&client->dev,
> +				"keypad,num-rows");
> +		if (ret) {
> +			dev_err(client->dev,
> +				"Specified num-rows with mode gpio-
> only\n");
> +			return -EINVAL;
> +		}
> +
> +		ret =3D device_property_present(&client->dev,
> +				"keypad,num-columns");
> +		if (ret) {
> +			dev_err(client->dev,
> +				"Specified num-columns with mode gpio-
> only\n");
> +			return -EINVAL;
> +		}
> +
> +		return 0;
> +	}
> +
>  	ret =3D matrix_keypad_parse_properties(&client->dev, &kpad->rows,
>  					     &kpad->cols);
>  	if (ret)
> @@ -790,6 +817,11 @@ static int adp5588_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>=20
> +	if (kpad->gpio_only) {
> +		dev_info(&client->dev, "Rev.%d, started as GPIO only\n",
> revid);
> +		return 0;
> +	}
> +
>  	error =3D devm_request_threaded_irq(&client->dev, client->irq,
>  					  adp5588_hard_irq,
> adp5588_thread_irq,
>  					  IRQF_TRIGGER_FALLING |
> IRQF_ONESHOT,
> --
> 2.34.1


