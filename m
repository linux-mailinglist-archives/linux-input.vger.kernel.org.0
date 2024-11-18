Return-Path: <linux-input+bounces-8128-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C10419D0747
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 01:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08FC9B21790
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 00:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CC74C62;
	Mon, 18 Nov 2024 00:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HsWpkiXv"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407538B;
	Mon, 18 Nov 2024 00:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731890100; cv=fail; b=OddR843QaMHYTFH0iNGFov1wpUvwV9JTx5EqdDKRiiKjo0VJBi2TZd4SX3uCMoaYJefH78rAeT29yfkRZ0M2GxQnoDivFhM+nz3rAxQOCpuKv0kjZot5GJfBpIaJqpH5GzeGf3pnKWlDy90ghjSRaKjd7SnwUgytnPDIe/1m+iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731890100; c=relaxed/simple;
	bh=QlOyZpsUFOpf1z117vF3mQhWXszwSqZmPpQZ0HgvUc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FrVUY3PCxZ+fv0+0YfTsQxHZDrO7qHYd7nvgDAYPZ1k0qYQGrSEN+GLEuhnTka5V4bFMXjExyAw0tGLNDROj5ZS4MHmxNmKW4OYHchLSx6Q8v0L5jyCnQjXpD8ju1bnlQlIghhtoLWZnpivZoDi8GnyoWzfqCuwFnu04CmFMZIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HsWpkiXv; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731890099; x=1763426099;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QlOyZpsUFOpf1z117vF3mQhWXszwSqZmPpQZ0HgvUc8=;
  b=HsWpkiXvr211BaJBdjn3pqMHvieEaHTeaaa/YJ8cNBnlO8KIY84fDzdL
   z5ZZTPybM4PVgJES0ApiJZKANxwZgi6xp/SjNwCt0z8BgGydt+zY4QO/l
   4qeQu8ZG+8GkgFGT40AkxZkONaGcd04aXSGKr3BdcFpmofYsG48uJyDg9
   8gTZwYXwgjPjafM1BrVyI1c+j0UVL7fXBmST16fSJC7GDS/9sAQBnmbXa
   +WTpah6LNYBJtjG4NZSZll5cq6dvoh/h3TUaVx3ZqoREW0s04DEULr34T
   cGf76fNJrf/+Ja+IdN2bhw2F+8/NvvHWs1l3Fp61sxQosJ53sJYzUSAxA
   g==;
X-CSE-ConnectionGUID: u9GdsQI0T5aMKJwh7ZfXBg==
X-CSE-MsgGUID: wtML6U9MSMa0ucy3tnV5zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31961748"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="31961748"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 16:34:58 -0800
X-CSE-ConnectionGUID: eCinnDCURA+80sy09yqbPg==
X-CSE-MsgGUID: 2saC3AzOR62raH3ta5Ufzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="112365086"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2024 16:34:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 16:34:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 16:34:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 16:34:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F//XkFaSWWR/v74nQP9dBkJ9wiZtF292VVEPX3IeEkDe4Vk71UYTg+1BYNZKPCbeFgOTfxPBvwLrKn2L412izKZRqY28216w/yBDwbmN9ceSgiVNWEWRd/T5rPJPMtBsnT+oN0dTaCJhcLPQ4s920e88qySIiVnamx9B9SirRPDB/su9DPK6B/gpwehd5ocD0kVJyTKJu/7x2fpMADUilPSIkMq7VOOhHaLhWf06ocHazI6+y0lE6Up03/CnTwacK9naYXwcfoI8qMiGcUQTzpY/tVV04o6JqxU8RYkdXy1++dfv6qL5WkZbM3B/GSUcp5+rvEhzqxdoO1+JBQGtSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlOyZpsUFOpf1z117vF3mQhWXszwSqZmPpQZ0HgvUc8=;
 b=H+z5j0Ng7Wd1HhKGNBezHxLB5i52wixIqNX8HpvW64+67P2PStnUvx45TxXDYzhS4YukFvYyrqypseTm25pJbj8mCJ8WgGuyOUi57+611GlQ2w12YLnAnI/P0ihOEHUAXmZWqG9Y+FievlmsbG/5Zp2m/KNnS6vle/TGkWlWbbpfu9bxZ7O15LIuEZQF0wn+Mc/cEW0iRmnUMCqWy3wS6mnEOSj5xJzkehIGkMX3k9n3IX/96x5G60Pp5RPySQqQ2edKJCXQ6EVMpgmPN1kHpsJ8ZFcWNsbVzy9QT9g22/DBmmwx9nSlQ3CYWA288wJ8Xl1O+UUZLiJgMqJrl6HGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by DS0PR11MB6445.namprd11.prod.outlook.com (2603:10b6:8:c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 00:34:55 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%5]) with mapi id 15.20.8158.023; Mon, 18 Nov 2024
 00:34:55 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, "jikos@kernel.org"
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>, "Aaron, Ma" <aaron.ma@canonical.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>
Subject: RE: [PATCH v2 01/22] HID: THC: Add documentation
Thread-Topic: [PATCH v2 01/22] HID: THC: Add documentation
Thread-Index: AQHbNlbmu9jwsJUh506r8H8XRm+D8bK3ujCAgAASHmCAAGzUAIAD/SZA
Date: Mon, 18 Nov 2024 00:34:54 +0000
Message-ID: <IA1PR11MB6098DC3CDFE27E4E23105950F4272@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241114053416.4085715-1-even.xu@intel.com>
 <20241114053416.4085715-2-even.xu@intel.com> <ZzbIP7tOEns0Fy-U@archie.me>
 <IA1PR11MB6098EC67DEAA5336F4F47B19F4242@IA1PR11MB6098.namprd11.prod.outlook.com>
 <ZzcyvPjkhCutD9ER@archie.me>
In-Reply-To: <ZzcyvPjkhCutD9ER@archie.me>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|DS0PR11MB6445:EE_
x-ms-office365-filtering-correlation-id: 74ec9dcd-962a-420e-8367-08dd0768d2bf
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QkFHUExseDJXdjFLWnZXc3QweDd5MjRFT2RLUjBmWEcyRWE4cnlXdlVrSDJX?=
 =?utf-8?B?Z0YyOUl3dGRzOGk3NU85dUFLMVBtMTYrdVpKazJKU245ZnQzRkJzenhRd1dM?=
 =?utf-8?B?dU0zMkJKRmx4MTkxYzVqZ0tDeDF3VmdwcDU5NmlRMURMWWVZeklSSUVBSXln?=
 =?utf-8?B?YlZsOGtRQXdwNXArcGUzQzltUi9XZFJUZW1EeXFrVVY5UHA4enl5NlVvNE0r?=
 =?utf-8?B?eGdpWVB6czFTeG1hSklDMk93bHJINllOK2pzb2ZoVSsvMlZjRmhmSWtCaG9k?=
 =?utf-8?B?S1NYWTU4SmJlcUZxTmxSbFRXUk1XRUxmVkoyY2haMWNQdVZKZHFtTUVSeVJ1?=
 =?utf-8?B?LzZzbzJ0KzlmSTkyNzcreW5NNWFOb2QrU0YwNWlYQnBDbnFZVk9kTnkwdlZa?=
 =?utf-8?B?Y2FlSUJ4Q3VESEFMNGozTmhXdklpeGRCMXFiemp5bmE0R2R2aThzeUNiTTJH?=
 =?utf-8?B?UVZXQVlpZnFiSG9jU3pvZDJoK0crRjh5ZEJMZE5reFVYNUpLUXJVb2ZnSm1R?=
 =?utf-8?B?QXhlaHQxWmlWbU83cHQ1N01zYWNGdDZoUlBzT0lMYUprT0hXcVFEOVdDL2ZJ?=
 =?utf-8?B?V2dIUTZHWndLZTJCR2R4OVRhQ1RTVlVQVFhuR3h6ZVQyM014YUVMaGxLVmoy?=
 =?utf-8?B?akNMa2ZzZmloRXBseXJzYlBiY2JobUFWRFlnU1ZoaWRVdm1SUm02djdKZkZO?=
 =?utf-8?B?bmRwWnQyQys2bWVaMnBiSUUrb3hDcUpPcnRtL1dqS0RWUTJqTVhRSXd2MkYy?=
 =?utf-8?B?UHR5SW5FTll1dTVVMHRxeTBXN05tUktvZHkzd2JDM3Z0TWkvcUcwRHpTWHgz?=
 =?utf-8?B?bTBRa2hUV0NkSkxTQkxCVVBMckp6Q2trRlY4MXhMNXhodVQ5M2ZXS0wxZWd5?=
 =?utf-8?B?UWFMUXpWa3NYM3NDOFBUR2NDR2FRWkZHMzNFN3I1M01rZ1Iwci8xdzB3T0lK?=
 =?utf-8?B?V3VYTVY5M3U1RG1UYU15ZzZUaFNWVFdjNy9NMXRINEh1Zm5BU2lhbDZxekx2?=
 =?utf-8?B?MS9UbktXSEU3b2trbTVSakZocTFob2RWbTBJZ09PeVVWUEtQRjQ1VFl2MlhG?=
 =?utf-8?B?UTZsRmQ4MG5yR1VBa24va04zWjNuL3BXR3dhMm1WNkMweUVHajdhNUhhVEhE?=
 =?utf-8?B?WkwvZjRhYVNQOFBFL0NNbCtvSDQ0SmdXSGc4aENhNlN4OWkwdDNnc3RlS2lG?=
 =?utf-8?B?cXU5TVVRQVBFMTF3QVlmUURWazNrcGgwRlNBYkpNRkdxRjlsaE51Z0ZiRUU0?=
 =?utf-8?B?Q01GMVlhVERBRE5EaUJLbzRCVVB1Z0pxdHJPYUllb1lPM3Rka3dEK1lEUnV0?=
 =?utf-8?B?eVVCNDhZN09QMmw5NkttQW9sS0NOc0lhYVhTUHZZRWtQdEYzNUg3WldKZWU2?=
 =?utf-8?B?Z3RTWnRxSUw0UmZNZ3ZWRHVlWm1VS0M2RTF4S0FUclcyR2cvRU50eE5zckhV?=
 =?utf-8?B?Q3IrVjNIVEVTZ3NGQlZ6ZXF5YThvdEZnMk14VW0xVjAwZmRVWlB4L0Q2Ly9V?=
 =?utf-8?B?QU1XYzRDeWNtTWV6enYxSDVTbXdYUjZsbjZTd2tjVlpicTR5czAvNTl1a3pU?=
 =?utf-8?B?MEhjRVpaV2J3MkFZU05yUmVQWVpnNUQyNWNRZVF4SEVvZy9zNStobEV1RDY2?=
 =?utf-8?B?YzZJSmtlaEFvNHIreDY1Ykd2b0tUWVFVbGJ5VEZJRTVhTzNUM1ZFbExmaWh4?=
 =?utf-8?B?WTVhRTZWMDFkMm1tTTU4NkxqU21DbXd6bzlBalN1RktweTFDRjN5NmZ1cXFL?=
 =?utf-8?B?RU9OUldBVjZsd2hpWHVmL2drN0VZUzBuQlhxTmZTcGtLcVR1bW1BREdZNXhU?=
 =?utf-8?Q?lNZRoG3Deyyn29GXY/7mNRIcc2I0a6d6GmSqY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YURiYWtDTUhMbGdGSFIweGVPalZFcWRTQVRsU1FKSzU0ODlPZWZ3R2ZuKzJH?=
 =?utf-8?B?ZGZSTVlRWExtc1l4SS9GQURDUUtZbnMvYVZwcnYxOEprOGdGVEFzVFp4ZXBw?=
 =?utf-8?B?OVRYZE5IclFrQUxwRkVnUVo1YWErMkwvK0ZRUVRXZVZIaDNickxXTnFmd25O?=
 =?utf-8?B?dXovTXZjU25PZHY1M3puQXNiUEdFRkpWM0d0NytHWTZHc3N1UStvWFhsTmNZ?=
 =?utf-8?B?cTlZSnZJaWpDdkoyaHZuaERDUW1tNERGbkYzVVJaQi9sWEF5bVZlNFJxcVVT?=
 =?utf-8?B?ZDdQanQzNW5BWDdoaUpyODhkeDRGMWxLOXZaSm93S0NDTlppbmhjNjI5NzJj?=
 =?utf-8?B?eHhIdDR2MURzVWdKbUhhS2pSWjJMMVN3bVdlZGVXWi81Ly9oM3JrM2NKUmc3?=
 =?utf-8?B?M0poY0VKVzJ5SDRxOTVWRjArR2FHN0FrejIvNmVVWDRGMnlVcHFZSXZOTnM2?=
 =?utf-8?B?QTdWcEw5cC9ZNksrbjI5c0xyeFdOVjJsTGN3Vm53NXpZR2lUdDBWNzdIS0ZM?=
 =?utf-8?B?OGNNN2FhdFJCODRBSytuT3gwUE9BUy9FOWtlNlIyaDJTSW1oMkE3UW5vYVFO?=
 =?utf-8?B?b1dEdXVJTUZpNGFscDZWQWR1SkRkK1pMVlErcUljRTZ3RUZ3dTdKN0J2TVhO?=
 =?utf-8?B?M0tZYW5ZamI2RE1zblF5LzN6SDNjZURTaGJtVlN6RTRCbE5vTzlkRUZhZXph?=
 =?utf-8?B?Y1BNc0ZmeWFTV1VPWDIwKzJKbWR2WnNKTzRDLzgvamt1eXBaTnNmL2dVM09T?=
 =?utf-8?B?TVRiVlZ6WCs0Z0N2UmRQMWErVzlEbTEvVXUrWmJGSWxJazJqQU5lcDBOTUFT?=
 =?utf-8?B?VDZ2MTIrMkRSZFltWUFNL2NaY1JBTlJiSXMzb0FqZHFwK1dWR0ZiY1hBN2ZD?=
 =?utf-8?B?b3krUSthdURuWG9aeUNFOG16OTJqMktWR2loZWR6d3o1WHVFcmE2U1ZlSGNF?=
 =?utf-8?B?MFhRblV0NGJzREZmT2FIWk4xc1BXR0l0UWFESWdJc1pLOWFXcG1VSFhSZS82?=
 =?utf-8?B?c3N1ZnhmYzZTUDMxblVCaDZPZzEvOHFnRjV2bUJpLzJ1NFJ1ajhPUGJWc25E?=
 =?utf-8?B?WUorRm1ra3d4M0RpR1BpNnRMc3JraUZIVVZFanU4QURRRlRjZ3Qzdm1QTGRh?=
 =?utf-8?B?bWo2WmRCeWx1WGZ3M21mczdqSDJTdXNSaVFjTWlqMElVdktRazNXTGRNemtT?=
 =?utf-8?B?QnZIdE9wSzU4bWo1eWE2Y0dXMFVFYjQ1Zlg2ekNUUjlqeDVRd1RQYXZYMysv?=
 =?utf-8?B?QmRkSmpKM0cxd3pTYS9MTEJpdjhPYkYvWW5TMWtIMHViaHB6eFFiSnRQYmhn?=
 =?utf-8?B?SDRLN05JbEljeGF2c1JlL2tCcHArdHFDZFFIb3FmZU1YdkFDbjNWSy9yb3dJ?=
 =?utf-8?B?QlhWR25GNDY1d0RlVUJBWFFERndseW96dTJZeU5OZjlDUUljbGJndVZ3RGFI?=
 =?utf-8?B?YkZkNWZaRVBmWnB1bjZyNGFlR29MNVVEMzlsV2R4OWVhd2lTM0RjODc1U3dB?=
 =?utf-8?B?dldIUTBOQVczTVhHUUdPb3dzQVlxNHBTMHVJWmRhRWJlOTcyUDhKMlNxZFIx?=
 =?utf-8?B?cVRmWm81UENyeUl4VkdNZ2NLWWZuK0ZtT0VZT0ZJb000c2VNL2VxWDFCWHFp?=
 =?utf-8?B?QThIeDFyalkzMjdxemY0YkpiTldpcytlTjhUUEpodnB2M1M2VEZpRkxKaUhq?=
 =?utf-8?B?YVBBWVNGWkphdWFIb0Iza2FMajM0MFdZWWRHM0dlanBPRXRGZENjdit4MUZ6?=
 =?utf-8?B?emN2cTF0V3I1M2ZiUkNDYlE3QU9WUE5USVYwdWxXTjdmZ0FSNUsvZUhJVGlB?=
 =?utf-8?B?bkdUZ3dyM2xmMmViT2pBSitCWE1heEZsTStDbWg1SzFnVDNNZy9iUWRTclU1?=
 =?utf-8?B?M09nWXl1SXgxUWNuQlBJZStQUjhSdEJIVVdQWnMwL05tbU1LZWhvN0RBbmVo?=
 =?utf-8?B?MmVLUWVLcW1aWVpJdEZjZTI0RG5IWjR0N0xIcXdTeGxZYXQzWlRIT29MNWl1?=
 =?utf-8?B?WUVLdkRuMmdEaUJyQjJuaGRuZ0hYYXRnRnZUTXdYM21GU1JadU43ZEZnd1hx?=
 =?utf-8?B?UHRONGhCZnhhd2JsQUNzWlRBN3dFWUZnR3hmTlBvYTErakRzZzl0dUFHUnNo?=
 =?utf-8?Q?afbU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ec9dcd-962a-420e-8367-08dd0768d2bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 00:34:54.9952
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Ta/1npdrDC7fKB62XkRxjxMZk6RtKovQz9Cxk5+/JqH/a35kRPYukDUC1xpGn5LXbdWksl6Eg7v8d6qpYFqMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6445
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFnYXMgU2FuamF5YSA8
YmFnYXNkb3RtZUBnbWFpbC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMTUsIDIwMjQg
NzozOSBQTQ0KPiBUbzogWHUsIEV2ZW4gPGV2ZW4ueHVAaW50ZWwuY29tPjsgamlrb3NAa2VybmVs
Lm9yZzsgYmVudGlzc0BrZXJuZWwub3JnOw0KPiBjb3JiZXRAbHduLm5ldDsgQWFyb24sIE1hIDxh
YXJvbi5tYUBjYW5vbmljYWwuY29tPg0KPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3Jn
OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9jQHZnZXIua2VybmVs
Lm9yZzsgU3VuLCBYaW5wZW5nIDx4aW5wZW5nLnN1bkBpbnRlbC5jb20+OyBTcmluaXZhcw0KPiBQ
YW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwMS8yMl0gSElEOiBUSEM6IEFkZCBkb2N1bWVudGF0aW9uDQo+IA0K
PiBPbiBGcmksIE5vdiAxNSwgMjAyNCBhdCAwNToxMDo1NUFNICswMDAwLCBYdSwgRXZlbiB3cm90
ZToNCj4gPg0KPiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJv
bTogQmFnYXMgU2FuamF5YSA8YmFnYXNkb3RtZUBnbWFpbC5jb20+DQo+ID4gPiBTZW50OiBGcmlk
YXksIE5vdmVtYmVyIDE1LCAyMDI0IDEyOjA0IFBNDQo+ID4gPiBUbzogWHUsIEV2ZW4gPGV2ZW4u
eHVAaW50ZWwuY29tPjsgamlrb3NAa2VybmVsLm9yZzsNCj4gPiA+IGJlbnRpc3NAa2VybmVsLm9y
ZzsgY29yYmV0QGx3bi5uZXQ7IEFhcm9uLCBNYQ0KPiA+ID4gPGFhcm9uLm1hQGNhbm9uaWNhbC5j
b20+DQo+ID4gPiBDYzogbGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnOw0KPiA+ID4gbGludXgtIGRvY0B2Z2VyLmtlcm5lbC5vcmc7IFN1biwg
WGlucGVuZyA8eGlucGVuZy5zdW5AaW50ZWwuY29tPjsNCj4gPiA+IFNyaW5pdmFzIFBhbmRydXZh
ZGEgPHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MiAwMS8yMl0gSElEOiBUSEM6IEFkZCBkb2N1bWVudGF0aW9uDQo+ID4gPg0K
PiA+ID4gT24gVGh1LCBOb3YgMTQsIDIwMjQgYXQgMDE6MzM6NTVQTSArMDgwMCwgRXZlbiBYdSB3
cm90ZToNCj4gPiA+ID4gK1RvdWNoIEhvc3QgQ29udHJvbGxlciBpcyB0aGUgbmFtZSBvZiB0aGUg
SVAgYmxvY2sgaW4gUENIIHRoYXQNCj4gPiA+ID4gK2ludGVyZmFjZSB3aXRoDQo+ID4gPiBUb3Vj
aCBEZXZpY2VzIChleDoNCj4gPiA+ID4gK3RvdWNoc2NyZWVuLCB0b3VjaHBhZCBldGMuKS4gSXQg
aXMgY29tcHJpc2VkIG9mIDMga2V5IGZ1bmN0aW9uYWwgYmxvY2tzOg0KPiA+ID4gPiArLSBBIG5h
dGl2ZWx5IGhhbGYtZHVwbGV4IFF1YWQgSS9PIGNhcGFibGUgU1BJIG1hc3Rlcg0KPiA+ID4gPiAr
LSBMb3cgbGF0ZW5jeSBJMkMgaW50ZXJmYWNlIHRvIHN1cHBvcnQgSElESTJDIGNvbXBsaWFudCBk
ZXZpY2VzDQo+ID4gPiA+ICstIEEgSFcgc2VxdWVuY2VyIHdpdGggUlcgRE1BIGNhcGFiaWxpdHkg
dG8gc3lzdGVtIG1lbW9yeQ0KPiA+ID4NCj4gPiA+IEkgc2VlIGluIG15IGh0bWxkb2NzIG91dHB1
dCB0aGF0IHRoZSBsaXN0IGFib3ZlIGlzIGxvbmcgcnVubmluZyBwYXJhZ3JhcGgNCj4gaW5zdGVh
ZC4NCj4gPg0KPiA+IFlvdSBhcmUgcmlnaHQsIGxldCBtZSBmaXggaXQgaW4gbmV4dCB2ZXJzaW9u
Lg0KPiANCj4gT0suDQo+IA0KPiA+DQo+ID4gPg0KPiA+ID4gPiArV2hlbiBUSEMgaXMgY29uZmln
dXJlZCB0byBTUEkgbW9kZSwgb3Bjb2RlcyBhcmUgdXNlZCBmb3INCj4gPiA+ID4gK2RldGVybWlu
aW5nIHRoZQ0KPiA+ID4gcmVhZC93cml0ZSBJTyBtb2RlLg0KPiA+ID4gPiArVGhlcmUgYXJlIHNv
bWUgT1BDb2RlIGV4YW1wbGVzIGZvciBTUEkgSU8gbW9kZTo6DQo+ID4gPiA+ICsNCj4gPiA+ID4g
KyArLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ID4gPiAr
IHwgb3Bjb2RlIHwgIENvcnJlc3BvbmRpbmcgU1BJIGNvbW1hbmQgICAgICB8DQo+ID4gPiA+ICsg
Kz09PT09PT09Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PSsNCj4gPiA+ID4gKyB8
ICAweDBCICB8IFJlYWQgU2luZ2xlIEkvTyAgICAgICAgICAgICAgICAgfA0KPiA+ID4gPiArICst
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gPiA+ICsgfCAg
MHgwMiAgfCBXcml0ZSBTaW5nbGUgSS9PICAgICAgICAgICAgICAgIHwNCj4gPiA+ID4gKyArLS0t
LS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ID4gPiArIHwgIDB4
QkIgIHwgUmVhZCBEdWFsIEkvTyAgICAgICAgICAgICAgICAgICB8DQo+ID4gPiA+ICsgKy0tLS0t
LS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiA+ID4gKyB8ICAweEIy
ICB8IFdyaXRlIER1YWwgSS9PICAgICAgICAgICAgICAgICAgfA0KPiA+ID4gPiArICstLS0tLS0t
LSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gPiA+ICsgfCAgMHhFQiAg
fCBSZWFkIFF1YWQgSS9PICAgICAgICAgICAgICAgICAgIHwNCj4gPiA+ID4gKyArLS0tLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ID4gPiArIHwgIDB4RTIgIHwg
V3JpdGUgUXVhZCBJL08gICAgICAgICAgICAgICAgICB8DQo+ID4gPiA+ICsgKy0tLS0tLS0tKy0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiA+ID4gKw0KPiA+ID4gPiA8c25p
cHBlZD4uLi4NCj4gPiA+ID4gK1doZW4gVEhDIGlzIHdvcmtpbmcgaW4gSTJDIG1vZGUsIG9wY29k
ZXMgYXJlIHVzZWQgdG8gdGVsbCBUSEMNCj4gPiA+ID4gK3doYXQncyB0aGUNCj4gPiA+IG5leHQg
UElPIHR5cGU6DQo+ID4gPiA+ICtJMkMgU3ViSVAgQVBCIHJlZ2lzdGVyIHJlYWQsIEkyQyBTdWJJ
UCBBUEIgcmVnaXN0ZXIgd3JpdGUsIEkyQw0KPiA+ID4gPiArdG91Y2ggSUMgZGV2aWNlIHJlYWQs
IEkyQyB0b3VjaCBJQyBkZXZpY2Ugd3JpdGUsIEkyQyB0b3VjaCBJQw0KPiA+ID4gPiArZGV2aWNl
IHdyaXRlIGZvbGxvd2VkDQo+ID4gPiBieSByZWFkLg0KPiA+ID4gPiArDQo+ID4gPiA+ICtIZXJl
IGFyZSB0aGUgVEhDIHByZS1kZWZpbmVkIG9wY29kZXMgZm9yIEkyQyBtb2RlOjoNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArICstLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLS0rDQo+ID4gPiA+ICsgfCBvcGNvZGUgfCAgICAgICBDb3JyZXNw
b25kaW5nIEkyQyBjb21tYW5kICAgICAgICAgICB8IEFkZHJlc3MgIHwNCj4gPiA+ID4gKw0KPiA+
ID4NCj4gKz09PT09PT09Kz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT0rPT09PT09PT09PSsNCj4gPiA+ID4gKyB8ICAweDEyICB8IFJlYWQgSTJDIFN1YklQIEFQQiBp
bnRlcm5hbCByZWdpc3RlcnMgICAgIHwgMGggLSBGRmggfA0KPiA+ID4gPiArICstLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0rDQo+
ID4gPiA+ICsgfCAgMHgxMyAgfCBXcml0ZSBJMkMgU3ViSVAgQVBCIGludGVybmFsIHJlZ2lzdGVy
cyAgICB8IDBoIC0gRkZoIHwNCj4gPiA+ID4gKyArLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tKw0KPiA+ID4gPiArIHwgIDB4MTQg
IHwgUmVhZCBleHRlcm5hbCBUb3VjaCBJQyB0aHJvdWdoIEkyQyBidXMgICAgfCBOL0EgICAgICB8
DQo+ID4gPiA+ICsgKy0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0rLS0tLS0tLS0tLSsNCj4gPiA+ID4gKyB8ICAweDE4ICB8IFdyaXRlIGV4dGVybmFs
IFRvdWNoIElDIHRocm91Z2ggSTJDIGJ1cyAgIHwgTi9BICAgICAgfA0KPiA+ID4gPiArICstLS0t
LS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0t
LS0rDQo+ID4gPiA+ICsgfCAgMHgxQyAgfCBXcml0ZSB0aGVuIHJlYWQgZXh0ZXJuYWwgVG91Y2gg
SUMgdGhyb3VnaCB8IE4vQSAgICAgIHwNCj4gPiA+ID4gKyB8ICAgICAgICB8IEkyQyBidXMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICAgfA0KPiA+ID4gPiArICst
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0rDQo+ID4gPiA+ICsNCj4gPiA+ID4gPHNuaXBwZWQ+Li4uDQo+ID4gPiA+ICtJbnRlbCBU
SEMgdXNlcyBQUkQgZW50cnkgZGVzY3JpcHRvciBmb3IgZXZlcnkgUFJEIGVudHJ5LiBFdmVyeQ0K
PiA+ID4gPiArUFJEIGVudHJ5IGRlc2NyaXB0b3Igb2NjdXBpZXMNCj4gPiA+ID4gKzEyOCBiaXRz
IG1lbW9yaWVzOjoNCj4gPiA+ID4gKw0KPiA+ID4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0tKy0t
LS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0r
DQo+ID4gPiA+ICsgfCBzdHJ1Y3QgZmllbGQgICAgICB8IGJpdChzKSAgfCBkZXNjcmlwdGlvbiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiA+ID4gKw0KPiA+ID4NCj4g
Kz09PT09PT09PT09PT09PT09PT0rPT09PT09PT09Kz09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT0NCj4gPiA+ID09PQ0KPiA+ID4gPiArICs9PT09PT09PT09PSsNCj4gPiA+ID4gKyB8
IGRlc3RfYWRkciAgICAgICAgIHwgNTMuLjAgICB8IGRlc3RpbmF0aW9uIG1lbW9yeSBhZGRyZXNz
LCBhcyBldmVyeSBlbnRyeSAgICAgfA0KPiA+ID4gPiArIHwgICAgICAgICAgICAgICAgICAgfCAg
ICAgICAgIHwgaXMgNEtCLCBpZ25vcmUgbG93ZXN0IDEwIGJpdHMgb2YgYWRkcmVzcy4gICAgICB8
DQo+ID4gPiA+ICsgKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsNCj4gPiA+ID4gKyB8IHJlc2VydmVk
MSAgICAgICAgIHwgNTQuLjYyICB8IHJlc2VydmVkICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfA0KPiA+ID4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSst
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gPiA+
ICsgfCBpbnRfb25fY29tcGxldGlvbiB8IDYzICAgICAgfCBjb21wbGV0aW9uIGludGVycnVwdCBl
bmFibGUgYml0LCBpZiB0aGlzIGJpdCAgIHwNCj4gPiA+ID4gKyB8ICAgICAgICAgICAgICAgICAg
IHwgICAgICAgICB8IHNldCBpdCBtZWFucyBUSEMgd2lsbCB0cmlnZ2VyIGEgY29tcGxldGlvbiAg
ICAgfA0KPiA+ID4gPiArIHwgICAgICAgICAgICAgICAgICAgfCAgICAgICAgIHwgaW50ZXJydXB0
LiBUaGlzIGJpdCBpcyBzZXQgYnkgU1cgZHJpdmVyLiAgICAgICB8DQo+ID4gPiA+ICsgKy0tLS0t
LS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSsNCj4gPiA+ID4gKyB8IGxlbiAgICAgICAgICAgICAgIHwgODcuLjY0
ICB8IGhvdyBtYW55IGJ5dGVzIG9mIGRhdGEgaW4gdGhpcyBlbnRyeS4gICAgICAgICAgfA0KPiA+
ID4gPiArICstLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rDQo+ID4gPiA+ICsgfCBlbmRfb2ZfcHJkICAg
ICAgICB8IDg4ICAgICAgfCBlbmQgb2YgUFJEIHRhYmxlIGJpdCwgaWYgdGhpcyBiaXQgaXMgc2V0
LCAgICAgIHwNCj4gPiA+ID4gKyB8ICAgICAgICAgICAgICAgICAgIHwgICAgICAgICB8IGl0IG1l
YW5zIHRoaXMgZW50cnkgaXMgbGFzdCBlbnRyeSBpbiB0aGlzIFBSRCAgfA0KPiA+ID4gPiArIHwg
ICAgICAgICAgICAgICAgICAgfCAgICAgICAgIHwgdGFibGUuIFRoaXMgYml0IGlzIHNldCBieSBT
VyBkcml2ZXIuICAgICAgICAgICB8DQo+ID4gPiA+ICsgKy0tLS0tLS0tLS0tLS0tLS0tLS0rLS0t
LS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSsN
Cj4gPiA+ID4gKyB8IGh3X3N0YXR1cyAgICAgICAgIHwgOTAuLjg5ICB8IEhXIHN0YXR1cyBiaXRz
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfA0KPiA+ID4gPiArICstLS0tLS0tLS0t
LS0tLS0tLS0tKy0tLS0tLS0tLSstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0rDQo+ID4gPiA+ICsgfCByZXNlcnZlZDIgICAgICAgICB8IDEyNy4uOTEgfCBy
ZXNlcnZlZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwNCj4gPiA+ID4g
KyArLS0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKw0KPiA+ID4NCj4gPiA+IFNob3VsZG4ndCB0aGVzZSB0
YWJsZXMgYmUgZm9ybWF0dGVkIGFzIHRhYmxlcz8NCj4gPg0KPiA+IEdvb2QgaWRlYSENCj4gPiBM
ZXQncyBmb3JtYXQgdGhlbS4NCj4gDQo+IEp1c3QgZHJvcCB0aGUgbGl0ZXJhbCBibG9jayBmb3Jt
YXR0aW5nLCBrZWVwaW5nIHRoZSB0YWJsZSBhcy1pcy4NCj4gDQoNClRoYW5rcywgYWxyZWFkeSB1
cGRhdGVkIG9uIG15IGxvY2FsLCB3aWxsIHNlbmQgdGhlIG1vZGlmaWVkIHBhdGNoIGluIG5leHQg
dmVyc2lvbi4NCg0KQmVzdCBSZWdhcmRzLA0KRXZlbiBYdQ0KDQo+IC0tDQo+IEFuIG9sZCBtYW4g
ZG9sbC4uLiBqdXN0IHdoYXQgSSBhbHdheXMgd2FudGVkISAtIENsYXJhDQo=

