Return-Path: <linux-input+bounces-15647-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD02FBF98C5
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 02:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 44351355A2A
	for <lists+linux-input@lfdr.de>; Wed, 22 Oct 2025 00:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B4F2222B4;
	Wed, 22 Oct 2025 00:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TlhXH7Ta"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B2C21B9C1
	for <linux-input@vger.kernel.org>; Wed, 22 Oct 2025 00:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761094653; cv=fail; b=rjwWU066fwyjFRDMHSCqhS4lEz6d3GAh4dQW6SNSeKEl2fjfm7MCF1oz3CiH6PVpTVJb/4c8+kN/f8ew6wtPWldh6w+F4PZm5Hy6rFBQRHGFF/yDNZyIuI9+DPBO/Oyh+9Ayv+TLsaq2h17BzorKkpdlYAI3f6MrFiZLsPPzqUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761094653; c=relaxed/simple;
	bh=d4aE2w6rjK2o/DqGMro8kdD4sZNBOxlYQ9HE4AIXTM0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Iw+nLo55A+i6e7N4GAcZNGgq0ZYmbeGeAqcHTyfboshWO5ab2+NuaqkVCPFnhFWYdzVZ/dSuiD9Spw3ZRR36jk6Eg2Ap6oKqLDihlhfXMoF8g1S3Msu9qGg1yUfSwnhB8xEqRSF+cSW7C2f+w1yyjwG2hyEVhLoeaGJ0g59CG+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TlhXH7Ta; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761094652; x=1792630652;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d4aE2w6rjK2o/DqGMro8kdD4sZNBOxlYQ9HE4AIXTM0=;
  b=TlhXH7Tay1Ld2KmjoFoyYUdZZf45sE52SZpXaA/jlLWduRtXzo9unGRw
   9mEgrqX1kPGkW696fvFIOmtrIrC+R9xigls+D9Ec+9UK+7uSUXWt8Q9Xu
   GMnsMD+PSbrk4EflEP9kNSO6iPSh7MRFzkVVtUY/KroxPTYLX4X7gjKu4
   ldSPPgUuMluFZhDJGsaVCS6lrIyQvS83Rbo2OK+Af/KPcgVRlU+BlwMLX
   3JAcscUWqg3xHqSL0vQ70ij7c+A0dIKmoEHCWGbZFZ6C2VvPs4JBeGkCy
   +LyGv4XxFD+WdydP9hWQ/p+7CUWIa6CbwcSI25Vk2bdao2l2zNT3pbzTq
   Q==;
X-CSE-ConnectionGUID: mA0P3DvkQImSyAwalfjbog==
X-CSE-MsgGUID: kY2R/JNSSoCli132sgKLqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="85857167"
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="85857167"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:57:31 -0700
X-CSE-ConnectionGUID: OuZES+oJQd20+13I7xufWQ==
X-CSE-MsgGUID: zJD9cnvnRgOuIqmDLN9AiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,246,1754982000"; 
   d="scan'208";a="220913729"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 17:57:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 17:57:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 21 Oct 2025 17:57:30 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 21 Oct 2025 17:57:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fixua8XEakzxDK2/zBx40ZRRRJZa28ObvNBOzEXmFfxGB5N+tRIrQAIFTh63XwzR2TDl5FkWlYfM/IMSfXtczfqa5zMGvW6tewfSzU1W6EK7jgEcvXqFmTK+lcLtCZwRT2rFIbQWRwBD3vkz+zXDmLckbEQq92HS/OT10xJ05SjKWXZ8APGmy6L54R7uQYOA6moALSC9wVMHlwC7da1LWA2AKtDAQAskacRjzc/ZxsFEyOGMDdwPgwZ2IAho25YflaRsr5/LV4n4vojJv4cq7Q/8bT7UZYgR8MY6EcVKnJZ6AVdlqniO3r8No6Kj/6jm7sPYLLBPTdU+FusBoPh6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4aE2w6rjK2o/DqGMro8kdD4sZNBOxlYQ9HE4AIXTM0=;
 b=haxCGO8BQYx8hdZf/3DgM2Apa4PMLqqzpEOkUsL3gu8Dt+F/lep/e4VX41vA6NotFFYvsQdG8xNuIOqXDnt3Za40zkPnTANM8mDmCM3cmOCE9cbKzQ0m8s+9u8iGR2L7mwuPEb6OEN4pb7LPTC3mx0N/HZXrXqei7glU0dcjob5UW65SZ4TIETr+pqK06eXz8c575Yeu49P3/R4/Cn2ql2Aepp6VriowX03jWllDQpSAHfOfYPa1V+sHpcOxHHRs9wVcoroqZ+JlJOyhZ/HD0YVtyTQFUW8rrybdznNwl6eeO1UAGp1+QcSiRumo4JiQwH/3lSk4NDG4ceqAh9Vg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by SA1PR11MB8317.namprd11.prod.outlook.com (2603:10b6:806:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 00:57:26 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.9228.014; Wed, 22 Oct 2025
 00:57:25 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, "Nathan
 Chancellor" <nathan@kernel.org>, Jiri Kosina <jikos@kernel.org>, "Benjamin
 Tissoires" <bentiss@kernel.org>
CC: Kees Cook <kees@kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
	"patches@lists.linux.dev" <patches@lists.linux.dev>
Subject: RE: [PATCH] HID: intel-ish-hid: Fix -Wcast-function-type-strict in
 devm_ishtp_alloc_workqueue()
Thread-Topic: [PATCH] HID: intel-ish-hid: Fix -Wcast-function-type-strict in
 devm_ishtp_alloc_workqueue()
Thread-Index: AQHcQtz38/w37NHzOke8aE+Ny4Ndu7TNQQAAgAAWMQA=
Date: Wed, 22 Oct 2025 00:57:25 +0000
Message-ID: <SJ0PR11MB56134AFC15C0076796FB777B93F3A@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20251022-ishtp-fix-function-cast-warn-v1-1-bfb06464f8ca@kernel.org>
 <939f507b8e8d6768d42ed1d380500f3cd22aee88.camel@linux.intel.com>
In-Reply-To: <939f507b8e8d6768d42ed1d380500f3cd22aee88.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|SA1PR11MB8317:EE_
x-ms-office365-filtering-correlation-id: ddc83b0d-acdc-44d5-4222-08de1105f792
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NHkrV1pkOWhlNGMzY1Bpam1vSFhjMWRIaEFPa1ltdXhadTRpR3hBeitmU3NY?=
 =?utf-8?B?Y0pkS3liYnlkaklGL3BBQ3k0Tnc2cWJuaFVDUFNIS0o1RUpXczZMSHlzMHRT?=
 =?utf-8?B?MW9Wdzd5QVBPeXNCeHVjazExenZMRFNLNGg0bjd2NHBwWXYzbXlRWnV0UUdV?=
 =?utf-8?B?Z1lUaHNFdlVmcVR2dzFJakMyTVE1OStmMWF5QXEwaE81bEtnSmtzaUMxQUVh?=
 =?utf-8?B?N25yc0EybmJhRlNFeXZnMEZST1ZUa0t0YUFNNkVEZm1LNUh3Skg5TlFRMGgx?=
 =?utf-8?B?MUhNb3p2T1Q2NzViVUIvenB6dHVwZnhGM2drMkVzVy9sSndVdHU0MFZQdERX?=
 =?utf-8?B?bEhib3NPK0tNZHllUGs1L3VCbEEvZktieHBvVGxFRlNsK3R2Vmkrd05xRVZv?=
 =?utf-8?B?dDk1VEYwc0p0YmpZSzJEUTVBaGxVZ0xEeHlxWHU3QTVyL0Y1MHJNY01WWnZ4?=
 =?utf-8?B?UENIVnVPVVBuTThRQWFBaU1zekdKdnFKdEVNb0Q5blhyWlYrVDJqSlVPNTVU?=
 =?utf-8?B?c21Xc2ZVL2VYKzJac2hROHorUG1NUnRuUXRuREtuMmlWWEZDKzNMOHE5anM3?=
 =?utf-8?B?MUs4cFFzNUlJQ3JEZmRKRkRicUE2UTkrakFBTGZERGZvS2xqaEJ6emZVMEhM?=
 =?utf-8?B?TWh4MW9hMFRLZFl1c3VqMU9vN3RKdnozbU4vM25NNUtzUEZta0dVY2V1RU5k?=
 =?utf-8?B?T1FxejVCSGUwMUdEbVVRck9mYWhOcGFDaW5MR0NDUEV5WE55Y0hXTHVOZjU4?=
 =?utf-8?B?S0ZIZ0gwWTVyRklqOEdlcXVpamp0bU5uT3dGTStOcnhqNTNLQXlFUkNrVytp?=
 =?utf-8?B?bCtlM3BkUVhKOUNBeUQrcTN2MWxXOHMrYy95aE9nUUlzOW1lUmczbEVNbjho?=
 =?utf-8?B?bXdkSXh3RUFMUWNLSzhMR0gxNHJTSnM5V2pSa3F1ak1lYUtXamp0dkx6ei9s?=
 =?utf-8?B?bDlJOVl5TFIyWFpYSUNwTyt2dFIremNKdVNWZlpIcVJPK09ES0RyQXFyWjUv?=
 =?utf-8?B?Z2lxZzdyNkhXRmdqM0FIRGE4NUdJdDM2cnFUb2lQdlYyRTAybkhMYlVhd1VQ?=
 =?utf-8?B?cUVGQXZXeEI1ZEcycUJtTVNsbnFSNmNxUk1PcE1KYlpsaUtLeHp0ZWhTL1hK?=
 =?utf-8?B?MFVrS290eEJqVmZVZ0xnNUxPS3FEVGxZeUNKcWtwWkVvaHpGMDZGKzRyR2Vz?=
 =?utf-8?B?OXNKYU9sdnRrZmFXQlJJVXNPTm0rUnlhck9LYlZndWdsSmNIWk53alRaby9j?=
 =?utf-8?B?TWY3cU1taVdpeWwzVHo0NkZoMWg1THIwc05YZWxod1VNdGJhNTUxWUpMYjVk?=
 =?utf-8?B?MDRvdExGZ2xMSmtkVktnZU9WMzRJcWdqLzUrK1BaNllCcVBVemNIenE0REtM?=
 =?utf-8?B?YVBmUWx6aGR5a1lTQUFQV1lwNStiWmxIakxubStiSEVKYnpiMnd6cnpTK3Ux?=
 =?utf-8?B?Z3EzdXdUOENMY2V3Q2QveTR5azJ3c3BkbUloeExhR1UyUEw0dExtWjAxaVJX?=
 =?utf-8?B?RlNkMWMzVThtLzdlcmxKL1hDZEdVdXNEb0tadEZwMUs5NzdvSnRpeldiMmdw?=
 =?utf-8?B?SDJSVVg1R2puZEtwWFdZd0p2NHl2UkNQbGhsRzVmdm1CakhGcVdpNUNoS0Qr?=
 =?utf-8?B?ZVY3VS80bGhVdmlzWmdXa0NCS1FER09RL1ZLK0xvRzNWRmV5bytjYTl3YnFu?=
 =?utf-8?B?bDFOQmlFRjFvVHNiNExGdnp4Q1M4OXNoSzZLaVl6dVlIWVU5TDcrUlhpRGk5?=
 =?utf-8?B?QmJ5d0I4cHNPVlhSOEY2S2RRYzJyN25iTmI4Z25vbU1wVWpEUzFNckloRXZK?=
 =?utf-8?B?ZEsrRDUrS013cnd6SGI0L2ZGR3VNeUlXTFpnM3hnVTNYY1lTTDlONkxPSThC?=
 =?utf-8?B?ODN1UzlLZU94Wm9ZNEc0Z2NjWjFISHZFOXhGV05GQThWTkZ3MWpwcm5ZUDlH?=
 =?utf-8?B?YlZUczhVTXpXNmpiam4zMW41M2RreVB5V0w3Ull6dGtNdVEydEJrRGVkNlBl?=
 =?utf-8?B?SVhUMFhSci9aQmZCaUNuaEV5ZURLTk9jdzd6RUVKdDk2OUhvMXJ1b29LOWEr?=
 =?utf-8?Q?eKA2Mu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bnNGUXhWME9kL0NiRW1oa0pORXJJUGlENURZb2dqNnpybjNKZG0zRWM2NC9X?=
 =?utf-8?B?NjJHNTdYU3c1ck4raWV0MEFEWEpVdUl6OHA4eEJPcFRHWnFMQkFJRmszZGNC?=
 =?utf-8?B?NnpVcW5PZWpYV3ZzeEdvTXhlQ3E3c09BLzJCZ2d4ZjNQSlE4c1hJUERwTGVE?=
 =?utf-8?B?dnNVSUtQcDRLNXFMRXR3enM2OTRvenQ1Um9tODl5TDczWEtKU0xHcVBNbzFN?=
 =?utf-8?B?dlpVQmowRHJjMUNSVjM1RE9qK0hHci94WnM1QksyTS9LbVNjTnlKbmNMM1VU?=
 =?utf-8?B?QnVuV29BamRZOGxXRnlCZ3VFajQ3MGplRW12eG1LSDdrNlc0dlQ1Sk5vZkJI?=
 =?utf-8?B?QmprQnYwbW8vOUFPZlBGdlorMmZzZDBuWStZVkVWL1N1b2lveDBsQi9jZDRm?=
 =?utf-8?B?SXYzdWVTTTZsQTNzUDVVSUpGWEpXbEdUSU1obkk0RDlxUkY2Ky9SdE03N0x2?=
 =?utf-8?B?Zitsa0d6ZXBsdW9WSG92Vlo2eDN1b1NjREZLNXQwTVFvU0xvOExsUnVtc2Vk?=
 =?utf-8?B?bnhmb1BmUzZjcHdLYjZNR2xNRWdmUk9MRmJvMDdvQjg5WTdOcElub1JaT0V1?=
 =?utf-8?B?N3F5Tk1mR1YwVFM0bVMzcndiY0FXTmxFM2Rsb0NUcldhTXBvQjlQcDBFOVZk?=
 =?utf-8?B?Wk1tOEdkR3BKYkdkTTVJS0NoMmU5aVdML3YwdkR3dURoN3NOZmtHcUU1REFQ?=
 =?utf-8?B?Y3JzZk1rQi9XZ0pVYk9HR2dXUWRYZEhLSVdzWnJpd3NNL3VDU2RDaTJCOWIx?=
 =?utf-8?B?dldTTC9Rem1MYnhqQnNIbG1tVHlBM2lyS0tuMkJqNXEyZzRoMUk1U1Y1YWFw?=
 =?utf-8?B?THJkZVdxeklGMWRVeGx6ME5UellVT1dta1FHSWlCcUNqcDNXeFhZSUY2Kyt3?=
 =?utf-8?B?RUZMLzk3ZE1IMnJVT3V2Ujh3aVR3bHFuMjNEM1VhSlZkdXUrMnY1VDRFcFFV?=
 =?utf-8?B?UDVMSGo1U2hPMW8yci9WZnlzUEdzUTJaOFAyaDNLWlV3dlQ2U1FKY1JkZFJN?=
 =?utf-8?B?OHJwckFoYXZxV09BNWtSaUE2OHhnU0xOOUE2ZnQxVE02Q3hKVTdiZWhqUjls?=
 =?utf-8?B?QTk1T2tyR1NxTDJ5TlFlYVRaSkhoSEk3MWhJaTh4Unc5cTNVd2ZzQmV5MzFz?=
 =?utf-8?B?MzVyVTBXbnI0TGwwTnpsbEhQQWxwMXVwRk9ZY28xbmMvUWlQMGo1VXQwZHJk?=
 =?utf-8?B?RjBOcDVDNk03bTlySlVUR3dHT1VzMDlvWmNWNnpwVHRPQ01XSjMvNkN1a3lX?=
 =?utf-8?B?ZGlMbGczazRqU2lOTWJXMXBqbWd1TXFuR1d2cUs2ZjJZRWdDTHNocXJhd2dJ?=
 =?utf-8?B?eFVienhSWCtpSnEwcGkvUUtYQ0pZUDE1WWdPVDJwQkpXNUxiYnQzWmVwTGhM?=
 =?utf-8?B?UEZoUVBFa1hncWQycmovRTBGN1JVT1ZMcVhxOENWYnpjU25IWlQ5YTM3Tk01?=
 =?utf-8?B?bWdZYU4yWW5pdTk0QUJZRXEvcy9xVCtJY2NrMFNWK1RqUFhZVTJlTkNubjdk?=
 =?utf-8?B?Q2ZQZFBsSnlWTUpxdHNDMWp1elNmaEYzbU1TMXBiUXNpSXJjb0FRVXpBaVVJ?=
 =?utf-8?B?ZWxtMW0zdXNISy9qcGZkdEZxc2hqbXJCNm5nWWlsRGw5WTFsN0N5djdHRU82?=
 =?utf-8?B?WmhDbWIwSXRlQlZFRXQ5c2puSkZWMFVmYTVOaGtuci8rT1VWR1NxSmYzMzY3?=
 =?utf-8?B?RU9FTGpobjZrQ2xSS0U0QU80SXNBbmdpalhpNjJqd1F1ZUg1aHNaYjZBRzEv?=
 =?utf-8?B?S0tKWSs1OEdKT29LYmF5a2NXTW1OM3VYU0FuaWNEQ2dDUEJleERUaDFsT2NN?=
 =?utf-8?B?VW56ckwzVG52WUpBM1FiaXRrNlQwRjNmaXF0cERGTnJYUlJlakxXREdvOWJi?=
 =?utf-8?B?YUFRdHNzbythVWRRLzZsNW93YlZWVHF3c1VKWGxmelh5clltY0FRWFJVYkNE?=
 =?utf-8?B?NVN3VFpsV21wSEVCMmtqdXE1dnVtV2ZKMWFzbzlYQlVkWmM2bWlPcjNqdE9o?=
 =?utf-8?B?R0JDYVlGdDFiVFpEWDVkdXBCRUVCUkFaTkFESWhsb0RUa24yaDMrVmgxWmRK?=
 =?utf-8?B?MHhjOXRvbFh6SDVwYW5MRDVwTzhmUVVEQzJ6R0EvZU9XTGhCRFVXUDlrcnI5?=
 =?utf-8?Q?jDpgW+3E1R7l0hVjVv3hrfoHt?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc83b0d-acdc-44d5-4222-08de1105f792
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2025 00:57:25.8735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U2i/3/gP9u34fkfdeR5qwpJsDkGj00gqhb/vtKxoe3595XYpM2RlY/WiBV3ykFHpK7hC3MEZQi+FpAvluswpTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8317
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc3Jpbml2YXMgcGFuZHJ1dmFkYSA8
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBP
Y3RvYmVyIDIyLCAyMDI1IDc6MzUgQU0NCj5UbzogTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBr
ZXJuZWwub3JnPjsgSmlyaSBLb3NpbmEgPGppa29zQGtlcm5lbC5vcmc+Ow0KPkJlbmphbWluIFRp
c3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3JnPjsgWmhhbmcsIExpeHUgPGxpeHUuemhhbmdAaW50
ZWwuY29tPg0KPkNjOiBLZWVzIENvb2sgPGtlZXNAa2VybmVsLm9yZz47IGxpbnV4LWlucHV0QHZn
ZXIua2VybmVsLm9yZzsNCj5sbHZtQGxpc3RzLmxpbnV4LmRldjsgcGF0Y2hlc0BsaXN0cy5saW51
eC5kZXYNCj5TdWJqZWN0OiBSZTogW1BBVENIXSBISUQ6IGludGVsLWlzaC1oaWQ6IEZpeCAtV2Nh
c3QtZnVuY3Rpb24tdHlwZS1zdHJpY3QgaW4NCj5kZXZtX2lzaHRwX2FsbG9jX3dvcmtxdWV1ZSgp
DQo+DQo+T24gV2VkLCAyMDI1LTEwLTIyIGF0IDAwOjQ5ICswMjAwLCBOYXRoYW4gQ2hhbmNlbGxv
ciB3cm90ZToNCj4+IENsYW5nIHdhcm5zIChvciBlcnJvcnMgd2l0aCBDT05GSUdfV0VSUk9SPXkg
LyBXPWUpOg0KPj4NCj4+IMKgIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXBjL2lwYy5jOjkz
NTozNjogZXJyb3I6IGNhc3QgZnJvbSAndm9pZA0KPj4gKCopKHN0cnVjdCB3b3JrcXVldWVfc3Ry
dWN0ICopJyB0byAndm9pZCAoKikodm9pZCAqKScgY29udmVydHMgdG8NCj4+IGluY29tcGF0aWJs
ZSBmdW5jdGlvbiB0eXBlIFstV2Vycm9yLC1XY2FzdC1mdW5jdGlvbi10eXBlLXN0cmljdF0NCj4+
IMKgwqDCoCA5MzUgfMKgwqDCoMKgwqDCoMKgwqAgaWYgKGRldm1fYWRkX2FjdGlvbl9vcl9yZXNl
dChkZXYsICh2b2lkICgqKSh2b2lkDQo+PiAqKSlkZXN0cm95X3dvcmtxdWV1ZSwNCj4+IMKgwqDC
oMKgwqDCoMKgIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4+IMKgIGlu
Y2x1ZGUvbGludXgvZGV2aWNlL2RldnJlcy5oOjE2ODozNDogbm90ZTogZXhwYW5kZWQgZnJvbSBt
YWNybw0KPj4gJ2Rldm1fYWRkX2FjdGlvbl9vcl9yZXNldCcNCj4+IMKgwqDCoCAxNjggfMKgwqDC
oMKgwqDCoMKgwqAgX19kZXZtX2FkZF9hY3Rpb25fb3JfaXJlc2V0KGRldiwgYWN0aW9uLCBkYXRh
LA0KPj4gI2FjdGlvbikNCj4+IMKgwqDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBefn5+fn4NCj4+DQo+PiBUaGlzIHdhcm5pbmcgaXMgcG9pbnRpbmcgb3V0IGEga2VybmVsIGNv
bnRyb2wgZmxvdyBpbnRlZ3JpdHkgKGtDRkkgLw0KPj4gQ09ORklHX0NGST15KSB2aW9sYXRpb24g
d2lsbCBvY2N1ciBkdWUgdG8gdGhpcyBmdW5jdGlvbiBjYXN0IHdoZW4gdGhlDQo+PiBkZXN0cm95
X3dvcmtxdWV1ZSgpIGlzIGluZGlyZWN0bHkgY2FsbGVkIHZpYSBkZXZtX2FjdGlvbl9yZWxlYXNl
KCkNCj4+IGJlY2F1c2UgdGhlIHByb3RvdHlwZSBvZiBkZXN0cm95X3dvcmtxdWV1ZSgpIGRvZXMg
bm90IG1hdGNoIHRoZQ0KPj4gcHJvdG90eXBlIG9mICgqYWN0aW9uKSgpLg0KPj4NCj4+IFVzZSBh
IGxvY2FsIGZ1bmN0aW9uIHdpdGggdGhlIGNvcnJlY3QgcHJvdG90eXBlIHRvIHdyYXANCj4+IGRl
c3Ryb3lfd29ya3F1ZXVlKCkgdG8gcmVzb2x2ZSB0aGUgd2FybmluZyBhbmQgQ0ZJIHZpb2xhdGlv
bi4NCj4+DQo+PiBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1aWx0TGludXgvbGlu
dXgvaXNzdWVzLzIxMzkNCj4+IEZpeGVzOiAwZDMwZGFlMzhmZTAgKCJISUQ6IGludGVsLWlzaC1o
aWQ6IFVzZSBkZWRpY2F0ZWQgdW5ib3VuZA0KPj4gd29ya3F1ZXVlcyB0byBwcmV2ZW50IHJlc3Vt
ZSBibG9ja2luZyIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFu
QGtlcm5lbC5vcmc+DQo+DQo+QWNrZWQtYnk6IFNyaW5pdmFzIFBhbmRydXZhZGEgPHNyaW5pdmFz
LnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPg0KPg0KDQpSZXZpZXdlZC1ieTogWmhhbmcgTGl4
dSA8bGl4dS56aGFuZ0BpbnRlbC5jb20+DQoNCj4+IC0tLQ0KPj4gwqBkcml2ZXJzL2hpZC9pbnRl
bC1pc2gtaGlkL2lwYy9pcGMuYyB8IDggKysrKysrLS0NCg0K

