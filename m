Return-Path: <linux-input+bounces-14956-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6872B8EA5A
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 03:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6745E3BDB43
	for <lists+linux-input@lfdr.de>; Mon, 22 Sep 2025 01:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3D472629;
	Mon, 22 Sep 2025 01:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8/fUJYE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C0CA920;
	Mon, 22 Sep 2025 01:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758503021; cv=fail; b=CmBBEySq6wPGbk2iT6J+A/jREekMdTXzyd/VbvbO/5woE2mP0nMf6ekWPVUvrnlnL+kX1qdNmIUKRFMSkk+KxZbYT4Q9ghKXQxSE+WMR0RHuyLVTlgmv9yFz5hTz4Nos5DE4gneQDBZx9TStzlOJyBaKgoIN5WILu7BovQ0sS6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758503021; c=relaxed/simple;
	bh=KirQelIE5idpj07AUyBeTh6jP2XDiXTtBrM4Te87oL0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HfuRdybXzb5rYGsWYT2/5nNarcjMJG8JOvyNXojTRaObqgARczCX08/akNKFmmxlPy7LxMNw0oWqi8b09iuXboFX5K4JcGfs5GSlvWWUJx4hPM3obe7MEAmIh0Jh316l1KqVDER0BEXB9+Uv8dk+b3dAhB1k/Dlii506zE7zn70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8/fUJYE; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758503019; x=1790039019;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KirQelIE5idpj07AUyBeTh6jP2XDiXTtBrM4Te87oL0=;
  b=e8/fUJYEgt2uqGsM4D4lqHSmHLo7Tc/Q7owt/RZau1MMZphw83BNW5f5
   LTdgioT/Gd3CrW8WaZm+Q34GYCkURQNuYGqSFjVlGLeGwbc/5uymyd83L
   BtxM1wfCE8c6wx3KuoWMja/NiuuJHt65COy9r0BvRx/IlbiqbjUUNSHiq
   PNCQMHI6pfik+5i/3OoXrrqqExVWnkz0G4V8I/vtRyFCwoDPqKKlR2bnW
   85YTejOb8d1i5OLg1O9P+yaVyyj5Y7ziCZz3IfepXedd4YnQsk/jIDKPz
   BLvD8xxdO39fQNJK4zKRu39YyV/KM4fQlGZKKVQtMfcKDvokbtUKfdxcW
   A==;
X-CSE-ConnectionGUID: L5hkvBgDQzSGUrv8lg5YXQ==
X-CSE-MsgGUID: lZ4d34WoSH2O505rHIzKDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="71866135"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="71866135"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 18:03:38 -0700
X-CSE-ConnectionGUID: dpjNqmM9S7yI52dZVKbeqg==
X-CSE-MsgGUID: 9gcAZQpGQO6oSh7+ht8WQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="175624395"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 18:03:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 18:01:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 21 Sep 2025 18:01:39 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 21 Sep 2025 18:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3XurcMc29peoaMGW+fJiF4QUMtNc0LgEQYwcnbjEpxI9Miab7mQW+t9n9W0Qy4sw9cF49o+BWiUw50uqjPn/60D4Np6fO7avmgxdYp6p9Yf6bor1NZes6yYzhfXln3WHVWa38csZgYv7fP7ae4Dnf39/6UgOgmG0nOyGQ1/1nW4kzJ8E3a/BkFtCoJouaGSYB4Sw/SqoGyJA3azjN6ZrbJ6yPz32bWs/nD5lQnM2ePgfKtFKh12kVU9j9BuCxNMJVqdORZH3ECBsru+dZW8GidprqxP5LIbHxDwxdMFlw37arYlHIQSut6bPoXGxKcpCD05E+0NLrAWHEGy9ZCWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KirQelIE5idpj07AUyBeTh6jP2XDiXTtBrM4Te87oL0=;
 b=TnRLgb26TXtw9oXm0Hoxb9D9aygt4uHyXDbZMHZtSvQGr6+fKqBYgCmusaDwYG9dc8S1fWg/uTO5v6o4DRLKr5aICCMe02TaKWMniCH/ppVbWyrr3DntclgE/YIiQ2o59aFozN+XlYyOwqefkwtB7XAkhaaggYK6cRCV36SU+Kzu+00HZWaDg2o5W4XXGO+SnOAEIzhcy88+GOsBzoAXy/jTEb3n2Mod2Nxyw5QE4lZ3HcCzpTiN5Da4WNUFXtD6ugMn6fTzlZKzcmG+dh+UXyOSIrK2QO+Fct324UjXWqkmoC2+AhBy+LBo+1skKNDy1c21d0QaM5HMygQjhI12lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 01:00:57 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 01:00:57 +0000
From: "Xu, Even" <even.xu@intel.com>
To: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "Zhang, Rui1"
	<rui1.zhang@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Topic: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Index: AQHcJ3XpyA576vGuO0i8lk9jkUfq0LSaJI0AgABthQCAA9dSwA==
Date: Mon, 22 Sep 2025 01:00:57 +0000
Message-ID: <IA1PR11MB60982E0C58F941A9DEF4AA0FF412A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250917015344.1169412-1-xinpeng.sun@intel.com>
	 <IA1PR11MB6098555DA1279BFFCC9CDD89F411A@IA1PR11MB6098.namprd11.prod.outlook.com>
 <395082002847970ff3234b5b12175280d9117275.camel@intel.com>
In-Reply-To: <395082002847970ff3234b5b12175280d9117275.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB8035:EE_
x-ms-office365-filtering-correlation-id: 3cbfc937-0cac-4670-0da4-08ddf9737d41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?VSttZkEvclZ2MmV3L1BwaTFaTmc0bGxqOUg3aUJ6TWI0amNFMDNoeUx1VEhm?=
 =?utf-8?B?ZFY5eThpWWEzZ1h1NzRHVnUxK2ZtYXVBakMwbTRuSFN6enNwU0kxQ3NGdm5B?=
 =?utf-8?B?YjFGcG1tS2pLRlJENWVDV3NPZUNpZVQrNEg5SE8zbGRmSTF4K2syZkk5RXlC?=
 =?utf-8?B?YXd6ODlLb3hGQ0lLZEJ3UDNPRlR2SFlnU041Y0N4ZDlPTW0yVkhMZzlad01m?=
 =?utf-8?B?WWgwckp3cS9xelVkQUNyMHcxaDgrTlpuWitsOXNvRkpJc3BXTXVLbmdCL3Z1?=
 =?utf-8?B?MWFmNzIyZHR3Rld3RFJuTldMZGsrUjhwdUdBeUtYNW5xUS9LWnFGS01CaGNu?=
 =?utf-8?B?V2FHbGdYSWx6dmJ6S0pTMVAyb1BxdFNmZlhDL2xjSTdiN2ppRzNlbHVUMDQx?=
 =?utf-8?B?ajk0TktyTzZKNnBmQm1hQjVYZTVZQ25aYXQxQlNQNmNNd0JuSTRDS2Ira2Vi?=
 =?utf-8?B?Q1NneERBUVJFVnpzVm1OTy9BR0JrbEEwek9MbmFlVkhMblJhVGk3cGpOakMy?=
 =?utf-8?B?NSs5UzRUL3lIZ2p6WVBZNFIreHEyblF2WG5KQ0R3TEh5ZFl4VXUrcHBFV0dT?=
 =?utf-8?B?S0tWcmt0VThEWC9xMzJIYWFBUXEybmhaQWRDZUtPQ3BzOHd4MGM1dFM1cm1W?=
 =?utf-8?B?Q0tDU28yZHJYbkVOdldkNkNHNFppZkh1cUlrKy9lOGpBVlUwS3FpYW5uYzlK?=
 =?utf-8?B?cDgxQ3lLSkN4L3ljTlBWV1FITVJUMWtFYnlNazUyRG5XQ1B5Zjc4TThGejZn?=
 =?utf-8?B?SHFBM1Q3LzVIKy9aTWlvQUsxQnFyeUxVNXJGR0RIalFvNi9SUFoyclZTUys1?=
 =?utf-8?B?dmgyTWl2cktnRjgwdXB2QnQ5SXVOODJNYXQ1ZHpNTFdzTnUyM3ZBbncrbEJ5?=
 =?utf-8?B?MVF4TEF6eHczalFSQUM5MlVDb0UxRUNSR2pWbkhrcDI4OERCWUI2bG1NMG1x?=
 =?utf-8?B?WXkwSDlVMXpnbWhnYVFVRkJiaVRBb3k2dysvU2luWHkza0RPWEtsS0ptRXlD?=
 =?utf-8?B?WlVxVVZoSEJmWnpmbytnVWpPd0tJUzlBWVVTTHVRQ0xmRUYvVlVDV2hVME5Y?=
 =?utf-8?B?d1UvTmhMVXFsRXBBMnZTNXhVWG9rcjdUcldMbnJUVmd1UmhhL2pMSURNS3ZG?=
 =?utf-8?B?SnRaTmNJYzdLb1JJYzA0bHhReHJoZGV2SUpiU1BOWWY2SGllRklhNytJK1Zx?=
 =?utf-8?B?QnViY216MnRLMU9jdVZFLzk4bzVHODI2RkVzZDJ5T2hoN2JIU1pyUFFRSHJh?=
 =?utf-8?B?VGh6Rk5tVythN0ZFOHVwVHU4SkRFcWdDUDNFcndzZU5CSVZQMHR5N0tGc3hl?=
 =?utf-8?B?dG9zOXdzcVM5R0xyQnU3ZnNUNmdEbTJjNThJUXJVc3dDUUc3aWowKzh6dHlw?=
 =?utf-8?B?L3dPYzNML056N3d1d254SWJ0ckhNWnRuN2lZcFZPWWpwZWxub1BZbEhkTlFH?=
 =?utf-8?B?Vzg5S2JPK05oNWViRGVLUElZZkdqQ3JuTXdsNWQ2ZnZpZnVoTEdsaFkwb0hI?=
 =?utf-8?B?M1hrUnd4ZTF2aDFPcE95NnIvb3ArTm5iNU9IZWVNQmJnN3E3b0lyb0c3ZHQ3?=
 =?utf-8?B?cEVNdVJqamJhcWpYbWhHM0RFZmxsWEhZaTFDU1hrTndUaG1MY2NaOHRRUDVh?=
 =?utf-8?B?RnE0bjlIU0ZkNmNWVXBhaDNkWnVQREVPZzFWZzR1SDNBVEhDck5xRDhDRm1w?=
 =?utf-8?B?akx2Vy96Tkx0S1laMzZxdnFvQ1p2UnU0WWlPWXB5M2J2NzNCN2JiREt6YWlm?=
 =?utf-8?B?bU5lRkJ0Y2Vja2dhV0p0RmxJaFlYVjdicDAxN2k3SE44eWNIVnBXS2RuMnRp?=
 =?utf-8?B?T3JaWjlYVEROeTRpLzE5b2NLTmsyTy9qcWMvRU53a1czcXlsWXhHOXNWeXBs?=
 =?utf-8?B?eUlxZ0k1Znhpc1VITlh0eEY1OEN3NFl4UTlFTEQrZTBQamg1akNrMVdIemlZ?=
 =?utf-8?B?ZGI0OW5RZy83dm5FTHA3WWVDcEY3eWlqZXlhdmlsaXBmK29KdUNMclFRY0xT?=
 =?utf-8?Q?YarnA6+pxCwIOBBKlYkVN7SOUGOYkI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YS9icjR6MG9Za0dzUnVITFcxS3hjemJCczdaa2JPWndtV0srMFhQeVBVVDM1?=
 =?utf-8?B?RGpxZ1lwakZSSzl3ZldpWExiSlVuZnNPb2xtLzMwNURSQWNwMFFSRk1EeWNn?=
 =?utf-8?B?WFlqaU02dUVTS3V2b3AvbjJwRWx6emdBRHpWUXNsVlVMS1p2aHJNTUpScG5Y?=
 =?utf-8?B?UFdjdml2YkZmbXUwSGJneFJFYWovK3RuNy9IZDM3VzFmNFNIVWFJbDVrdHJx?=
 =?utf-8?B?TWpDcFhRUnFvbjQ2UmRPM2V6T3VTSEx6Q1ZoZnhjcFR2MEVhTGhIeHFrV3ly?=
 =?utf-8?B?ZmlZU05kS0pDa01GQmtYcGdIcEkrQno0N3RNWXV3Yi9GbG5TRUtpRnZaNmxW?=
 =?utf-8?B?bVdqK0VOQm85OWZlY0J3aTNneml5d2FMT0srR1FhbGRPQWYxZ0pTZkJieEhS?=
 =?utf-8?B?Wkltc3ZQWFRoYjhvd0FDWkpJOWdFSWl4ZUNVU3FwbjNrWEJpZnp6c2FaelFr?=
 =?utf-8?B?NEFtTVYvbXZqK3NqSEFIWHVGVXVablVnTXNVbGVacE5MbkwreGsxNkNMTzZW?=
 =?utf-8?B?OGZiclREd1pqOUFINEM4NU5McWs4L2pVK2dwdURna296TDNYMngyNHBFNDR3?=
 =?utf-8?B?YUoyandyODdaaDdFdENqTEI1MCtKMzFLd0ZCZ25FVUJGa1JRODFwYWJ1VG54?=
 =?utf-8?B?cktPNnk1Qjl4Ri9HWThiU2piaDF5SjRaeExlOHFEZEY3YWduTW5WQTY5Y3Np?=
 =?utf-8?B?MTdxaUQ4VHh4bnBNRFo5SnZKQXZBWXEyYVhuN1FsYkJCU1QxTmxJTXdnTStE?=
 =?utf-8?B?ZWFmdmdadlJxTnZ4dkVSWXlCTlpXaVlrelZXT3dIWVZqUkY2VG8rOTJNL21C?=
 =?utf-8?B?cXNYVHVtTXg5eVp0TjZwNEd0eVZpMFFyS29OYlVWUmorWmdsUFNxRFJscUxU?=
 =?utf-8?B?aUVPM09neWYyZGVFWEVGWGNNNVJGQncway9xTndiQ2NjallKYXlhYlR2bThM?=
 =?utf-8?B?SVBjUGhsNEpmenlLaDJ0RWU0S3VTWlZQb3dDdHVhSStlQ0tCZTdFZDc1alNq?=
 =?utf-8?B?Sk1ZcEVkNktncm9wazFkWXRzYlg3R0xJenowMzQ2MWNCR21NRGY4NkJZd0Uv?=
 =?utf-8?B?dkVSQ3BSQlQ2NG9nZnBjZW8xNms4UW1QN28wc0dOZFVjcTFCZ2MwVTA1SCsx?=
 =?utf-8?B?Y2ptQkd3MmJVakN5SUg3b3pRcnVVNWFWSzhXRnljb0NrcExpVXkwVlV3SWIv?=
 =?utf-8?B?bnJEeHRYZlMvaUNnVkJsZW5zdGNzU0NKSER5WFJPWVYxZ001SzZyMWZLRlZW?=
 =?utf-8?B?SVdsZ2o2VDhRME5DU3ExS20yL1JoZXBVOGhuY1J3ci9yL2hQWUZZd2RLNGtL?=
 =?utf-8?B?YXR0eXFFY3N6b3NjWjBERHF1OHNLYUY2SGZPeXQ4ejZXS3RHQzhRa1NONURS?=
 =?utf-8?B?M0g4aTFJWStPUWg0R3RXOTgzTHV2cXF5MjJVenhPbFVrL2lRdXpYb1ZpMHNj?=
 =?utf-8?B?czBXM1M4Tk5LakNWd0lmQURIZkpmaWtESzR1bGFIRUthSGtxTjhCOEhNYmpK?=
 =?utf-8?B?UGxOeHhYSlQ3RXgxS1dtcXFlQ1E5TXBGMHVQUzhtNDF0alRGK2pZb1pzdWpv?=
 =?utf-8?B?cGxwaERqOXYreGpmeDBUNU13Z3BLN3VBbDFGejBabnQ5ci9mUEwxNkpyelVF?=
 =?utf-8?B?eUl3b0FOblU0aE1GM25JOTFQYklDMjFKaFA2a0ZPVWZSMzRhZGpWMENMWnZY?=
 =?utf-8?B?dzUya29SaU5hYUxLSnNZSTNaMGFRVHlzaUVsMCtjbllzdDh1M1dLYkZZODhv?=
 =?utf-8?B?d3VSNFBka296TWxwNndTajB0Um83ZkZiSVhwTEo4WCtXTFNmWk44NGk2aFpm?=
 =?utf-8?B?d3lheS8zYlpQdXpnODRIMExTMnJlSjkzYkNaN0RYWTNySm5lNUpWdTdCa0tt?=
 =?utf-8?B?YndmcGx2REtOWEYrREYwSHlWNDhyL3RxMElHVUUyZTJuN2RvamxsUzBmRUhn?=
 =?utf-8?B?aFB1d0ExY1dGeDJ6OE4zTFduMzRqa3ZQMDNYM1BhSE1JWVZyR3dTTHZJbnFh?=
 =?utf-8?B?TlF2Q1E0ekc3azh5REljRWNiQzZGTTg1ZWdZa01hM0NicE5KY2pxMXhZV2ZD?=
 =?utf-8?B?aXdCWXJoVTNrY3pCb1JkZHFwUXJ1VjBSRmYwaUNwNnZhSFlhRVorV0c3MzdL?=
 =?utf-8?Q?FsXI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbfc937-0cac-4670-0da4-08ddf9737d41
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 01:00:57.4373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2gXqRmq7rLdU6g9WYUQTaGLAeaVDcgPdz7RPQZdf6G+arUZ9qRw06EkAqW93qQLfhbnpFAX19fd6CjIxJASmBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGFuZHJ1dmFkYSwgU3Jp
bml2YXMgPHNyaW5pdmFzLnBhbmRydXZhZGFAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlkYXksIFNl
cHRlbWJlciAxOSwgMjAyNSAxMDoyMCBQTQ0KPiBUbzogU3VuLCBYaW5wZW5nIDx4aW5wZW5nLnN1
bkBpbnRlbC5jb20+OyBqaWtvc0BrZXJuZWwub3JnOyBYdSwgRXZlbg0KPiA8ZXZlbi54dUBpbnRl
bC5jb20+OyBiZW50aXNzQGtlcm5lbC5vcmcNCj4gQ2M6IGxpbnV4LWlucHV0QHZnZXIua2VybmVs
Lm9yZzsgWmhhbmcsIFJ1aTEgPHJ1aTEuemhhbmdAaW50ZWwuY29tPjsgbGludXgtDQo+IGtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyBSRVNFTkRdIGhpZDog
aW50ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tpMmM6IHN1cHBvcnQgQUNQSQ0KPiBjb25maWcgZm9y
IGFkdmFuY2VkIGZlYXR1cmVzDQo+IA0KPiBPbiBGcmksIDIwMjUtMDktMTkgYXQgMDc6NTYgKzAw
MDAsIFh1LCBFdmVuIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiBGcm9tOiBTdW4sIFhpbnBlbmcgPHhpbnBlbmcuc3VuQGludGVsLmNvbT4N
Cj4gPiA+IFNlbnQ6IFdlZG5lc2RheSwgU2VwdGVtYmVyIDE3LCAyMDI1IDk6NTQgQU0NCj4gPiA+
IFRvOiBqaWtvc0BrZXJuZWwub3JnOyBiZW50aXNzQGtlcm5lbC5vcmcNCj4gPiA+IENjOiBzcmlu
aXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbTsNCj4gPiA+IGxpbnV4LWlucHV0QHZnZXIu
a2VybmVsLm9yZzsgbGludXgtDQo+ID4gPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBYdSwgRXZl
biA8ZXZlbi54dUBpbnRlbC5jb20+OyBTdW4sIFhpbnBlbmcNCj4gPiA+IDx4aW5wZW5nLnN1bkBp
bnRlbC5jb20+OyBaaGFuZywgUnVpMSA8cnVpMS56aGFuZ0BpbnRlbC5jb20+DQo+ID4gPiBTdWJq
ZWN0OiBbUEFUQ0ggdjMgUkVTRU5EXSBoaWQ6IGludGVsLXRoYy1oaWQ6IGludGVsLXF1aWNraTJj
Og0KPiA+ID4gc3VwcG9ydCBBQ1BJIGNvbmZpZw0KPiA+ID4gZm9yIGFkdmFuY2VkIGZlYXR1cmVz
DQo+ID4gPg0KPiA+ID4gVGhlcmUgaXMgYSBuZXcgQklPUyBlbmhhbmNlbWVudCB0aGF0IGFkZHMg
dGhlIGNhcGFiaWxpdHkgdG8NCj4gPiA+IGNvbmZpZ3VyZSB0aGUgZm9sbG93aW5nIHR3byBmZWF0
dXJlcyBvZiBJMkMgc3Vic3lzdGVtIGludHJvZHVjZWQgaW4NCj4gPiA+IGNvbW1pdA0KPiA+ID4g
MWVkMGI0OA0KPiA+ID4gKCJJbnRlbC10aGM6IEludHJvZHVjZSBtYXggaW5wdXQgc2l6ZSBjb250
cm9sIikgYW5kIGNvbW1pdCAzZjJhOTIxDQo+ID4gPiAoIkludGVsLXRoYzogSW50cm9kdWNlIGlu
dGVycnVwdCBkZWxheSBjb250cm9sIik6DQo+ID4gPiAtIE1heCBpbnB1dCBzaXplIGNvbnRyb2wN
Cj4gPiA+IC0gSW50ZXJydXB0IGRlbGF5IGNvbnRyb2wNCj4gPiA+DQo+ID4gPiBBcyBCSU9TIGlz
IHVzZWQgZm9yIHRoZSBjb25maWd1cmF0aW9uIG9mIHRoZXNlIHR3byBmZWF0dXJlcywgY2hhbmdl
DQo+ID4gPiBkcml2ZXIgZGF0YSB1c2FnZSB0byBpbmRpY2F0ZSBoYXJkd2FyZSBjYXBhYmlsaXR5
LCBhbmQgYWRkDQo+ID4gPiBjb3JyZXNwb25kaW5nIEFDUEkgY29uZmlndXJhdGlvbiBzdXBwb3J0
IGluIFF1aWNrSTJDIGRyaXZlci4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYaW5wZW5n
IFN1biA8eGlucGVuZy5zdW5AaW50ZWwuY29tPg0KPiA+ID4gVGVzdGVkLWJ5OiBSdWkgWmhhbmcg
PHJ1aTEuemhhbmdAaW50ZWwuY29tPg0KPiANCj4gQWRkIHlvdXIgcmV2aWV3ZWQtYnkgaGVyZS4u
DQoNClRoYW5rcyBTcmluaXZhcyENCldpbGwgYWRkIHJldmlldy1ieSB0aGlzIHBsYWNlIG5leHQg
dGltZS4NCg0KQmVzdCBSZWdhcmRzLA0KRXZlbiBYdQ0KDQo+IA0KPiA+ID4NCj4gPiA+IC0tLQ0K
PiA+ID4gQ2hhbmdlcyBpbiB2MzoNCj4gPiA+IMKgLSByZW1vdmUgdW5uZWNlc3NhcnkgaW5pdGlh
bGl6YXRpb24gb2YgbG9jYWwgdmFyaWFibGVzIENoYW5nZXMgaW4NCj4gPiA+IHYyOg0KPiA+ID4g
wqAtIHJlZmluZSB0aGUgY29tbWl0IG1lc3NhZ2UNCj4gPiA+IC0tLQ0KPiA+ID4gwqAuLi4vaW50
ZWwtcXVpY2tpMmMvcGNpLXF1aWNraTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzOQ0K
PiA+ID4gKysrKysrKysrKysrKysrLS0tLQ0KPiA+ID4gwqAuLi4vaW50ZWwtcXVpY2tpMmMvcXVp
Y2tpMmMtZGV2LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyNCArKysrKysrKysrKy0NCj4g
PiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkN
Cj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRl
bC1xdWlja2kyYy9wY2ktDQo+ID4gPiBxdWlja2kyYy5jDQo+ID4gPiBiL2RyaXZlcnMvaGlkL2lu
dGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcGNpLXF1aWNraTJjLmMNCj4gPiA+IGluZGV4IDg1
NDkyNmIzY2ZkNC4uM2NlNWE2OTJiOTJiIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9oaWQv
aW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYw0KPiA+ID4gKysrIGIv
ZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMuYw0K
PiA+ID4gQEAgLTIzLDYgKzIzLDcgQEANCj4gPiA+DQo+ID4gPiDCoHN0YXRpYyBzdHJ1Y3QgcXVp
Y2tpMmNfZGRhdGEgcHRsX2RkYXRhID0gew0KPiA+ID4gwqAJLm1heF9kZXRlY3Rfc2l6ZSA9IE1B
WF9SWF9ERVRFQ1RfU0laRV9QVEwsDQo+ID4gPiArCS5tYXhfaW50ZXJydXB0X2RlbGF5ID0gTUFY
X1JYX0lOVEVSUlVQVF9ERUxBWSwNCj4gPiA+IMKgfTsNCj4gPiA+DQo+ID4gPiDCoC8qIFRIQyBR
dWlja0kyQyBBQ1BJIG1ldGhvZCB0byBnZXQgZGV2aWNlIHByb3BlcnRpZXMgKi8gQEAgLTIwMCw2
DQo+ID4gPiArMjAxLDIxDQo+ID4gPiBAQCBzdGF0aWMgaW50IHF1aWNraTJjX2dldF9hY3BpX3Jl
c291cmNlcyhzdHJ1Y3QgcXVpY2tpMmNfZGV2aWNlDQo+ID4gPiAqcWNkZXYpDQo+ID4gPiDCoAkJ
cmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+ID4gwqAJfQ0KPiA+ID4NCj4gPiA+ICsJaWYgKHFjZGV2
LT5kZGF0YSkgew0KPiA+ID4gKwkJcWNkZXYtPmkyY19tYXhfZnJhbWVfc2l6ZV9lbmFibGUgPQ0K
PiA+ID4gaTJjX2NvbmZpZy5GU0VOOw0KPiA+ID4gKwkJcWNkZXYtPmkyY19pbnRfZGVsYXlfZW5h
YmxlID0gaTJjX2NvbmZpZy5JTkRFOw0KPiA+ID4gKw0KPiA+ID4gKwkJaWYgKGkyY19jb25maWcu
RlNWTCA8PSBxY2Rldi0+ZGRhdGEtDQo+ID4gPiA+bWF4X2RldGVjdF9zaXplKQ0KPiA+ID4gKwkJ
CXFjZGV2LT5pMmNfbWF4X2ZyYW1lX3NpemUgPQ0KPiA+ID4gaTJjX2NvbmZpZy5GU1ZMOw0KPiA+
ID4gKwkJZWxzZQ0KPiA+ID4gKwkJCXFjZGV2LT5pMmNfbWF4X2ZyYW1lX3NpemUgPSBxY2Rldi0+
ZGRhdGEtDQo+ID4gPiA+IG1heF9kZXRlY3Rfc2l6ZTsNCj4gPiA+ICsNCj4gPiA+ICsJCWlmIChp
MmNfY29uZmlnLklORFYgPD0gcWNkZXYtPmRkYXRhLQ0KPiA+ID4gPm1heF9pbnRlcnJ1cHRfZGVs
YXkpDQo+ID4gPiArCQkJcWNkZXYtPmkyY19pbnRfZGVsYXkgPSBpMmNfY29uZmlnLklORFY7DQo+
ID4gPiArCQllbHNlDQo+ID4gPiArCQkJcWNkZXYtPmkyY19pbnRfZGVsYXkgPSBxY2Rldi0+ZGRh
dGEtDQo+ID4gPiA+IG1heF9pbnRlcnJ1cHRfZGVsYXk7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4g
PiA+IMKgCXJldHVybiAwOw0KPiA+ID4gwqB9DQo+ID4gPg0KPiA+ID4gQEAgLTQ0MSwxNyArNDU3
LDI0IEBAIHN0YXRpYyB2b2lkIHF1aWNraTJjX2RtYV9hZHZfZW5hYmxlKHN0cnVjdA0KPiA+ID4g
cXVpY2tpMmNfZGV2aWNlICpxY2RldikNCj4gPiA+IMKgCSAqIG1heCBpbnB1dCBsZW5ndGggPD0g
VEhDIGRldGVjdCBjYXBhYmlsaXR5LCBlbmFibGUgdGhlIGZlYXR1cmUNCj4gPiA+IHdpdGggZGV2
aWNlDQo+ID4gPiDCoAkgKiBtYXggaW5wdXQgbGVuZ3RoLg0KPiA+ID4gwqAJICovDQo+ID4gPiAt
CWlmIChxY2Rldi0+ZGRhdGEtPm1heF9kZXRlY3Rfc2l6ZSA+PQ0KPiA+ID4gLQnCoMKgwqAgbGUx
Nl90b19jcHUocWNkZXYtPmRldl9kZXNjLm1heF9pbnB1dF9sZW4pKSB7DQo+ID4gPiAtCQl0aGNf
aTJjX3NldF9yeF9tYXhfc2l6ZShxY2Rldi0+dGhjX2h3LA0KPiA+ID4gLQkJCQkJbGUxNl90b19j
cHUocWNkZXYtDQo+ID4gPiA+IGRldl9kZXNjLm1heF9pbnB1dF9sZW4pKTsNCj4gPiA+ICsJaWYg
KHFjZGV2LT5pMmNfbWF4X2ZyYW1lX3NpemVfZW5hYmxlKSB7DQo+ID4gPiArCQlpZiAocWNkZXYt
PmkyY19tYXhfZnJhbWVfc2l6ZSA+PQ0KPiA+ID4gKwkJwqDCoMKgIGxlMTZfdG9fY3B1KHFjZGV2
LT5kZXZfZGVzYy5tYXhfaW5wdXRfbGVuKSkgew0KPiA+ID4gKwkJCXRoY19pMmNfc2V0X3J4X21h
eF9zaXplKHFjZGV2LT50aGNfaHcsDQo+ID4gPiArCQkJCQkJbGUxNl90b19jcHUocWNkZXYtDQo+
ID4gPiA+IGRldl9kZXNjLm1heF9pbnB1dF9sZW4pKTsNCj4gPiA+ICsJCX0gZWxzZSB7DQo+ID4g
PiArCQkJZGV2X3dhcm4ocWNkZXYtPmRldiwNCj4gPiA+ICsJCQkJICJNYXggZnJhbWUgc2l6ZSBp
cyBzbWFsbGVyIHRoYW4NCj4gPiA+IGhpZCBtYXggaW5wdXQNCj4gPiA+IGxlbmd0aCEiKTsNCj4g
PiA+ICsJCQl0aGNfaTJjX3NldF9yeF9tYXhfc2l6ZShxY2Rldi0+dGhjX2h3LA0KPiA+ID4gKwkJ
CQkJCWxlMTZfdG9fY3B1KHFjZGV2LQ0KPiA+ID4gPiBpMmNfbWF4X2ZyYW1lX3NpemUpKTsNCj4g
PiA+ICsJCX0NCj4gPiA+IMKgCQl0aGNfaTJjX3J4X21heF9zaXplX2VuYWJsZShxY2Rldi0+dGhj
X2h3LCB0cnVlKTsNCj4gPiA+IMKgCX0NCj4gPiA+DQo+ID4gPiDCoAkvKiBJZiBwbGF0Zm9ybSBz
dXBwb3J0cyBpbnRlcnJ1cHQgZGVsYXkgZmVhdHVyZSwgZW5hYmxlIGl0IHdpdGgNCj4gPiA+IGdp
dmVuIGRlbGF5ICovDQo+ID4gPiAtCWlmIChxY2Rldi0+ZGRhdGEtPmludGVycnVwdF9kZWxheSkg
ew0KPiA+ID4gKwlpZiAocWNkZXYtPmkyY19pbnRfZGVsYXlfZW5hYmxlKSB7DQo+ID4gPiDCoAkJ
dGhjX2kyY19zZXRfcnhfaW50X2RlbGF5KHFjZGV2LT50aGNfaHcsDQo+ID4gPiAtCQkJCQkgcWNk
ZXYtPmRkYXRhLQ0KPiA+ID4gPmludGVycnVwdF9kZWxheSk7DQo+ID4gPiArCQkJCQkgcWNkZXYt
PmkyY19pbnRfZGVsYXkgKg0KPiA+ID4gMTApOw0KPiA+ID4gwqAJCXRoY19pMmNfcnhfaW50X2Rl
bGF5X2VuYWJsZShxY2Rldi0+dGhjX2h3LCB0cnVlKTsNCj4gPiA+IMKgCX0NCj4gPiA+IMKgfQ0K
PiA+ID4gQEAgLTQ2NCwxMCArNDg3LDEwIEBAIHN0YXRpYyB2b2lkIHF1aWNraTJjX2RtYV9hZHZf
ZW5hYmxlKHN0cnVjdA0KPiA+ID4gcXVpY2tpMmNfZGV2aWNlICpxY2RldikNCj4gPiA+IMKgICov
DQo+ID4gPiDCoHN0YXRpYyB2b2lkIHF1aWNraTJjX2RtYV9hZHZfZGlzYWJsZShzdHJ1Y3QgcXVp
Y2tpMmNfZGV2aWNlDQo+ID4gPiAqcWNkZXYpwqAgew0KPiA+ID4gLQlpZiAocWNkZXYtPmRkYXRh
LT5tYXhfZGV0ZWN0X3NpemUpDQo+ID4gPiArCWlmIChxY2Rldi0+aTJjX21heF9mcmFtZV9zaXpl
X2VuYWJsZSkNCj4gPiA+IMKgCQl0aGNfaTJjX3J4X21heF9zaXplX2VuYWJsZShxY2Rldi0+dGhj
X2h3LCBmYWxzZSk7DQo+ID4gPg0KPiA+ID4gLQlpZiAocWNkZXYtPmRkYXRhLT5pbnRlcnJ1cHRf
ZGVsYXkpDQo+ID4gPiArCWlmIChxY2Rldi0+aTJjX2ludF9kZWxheV9lbmFibGUpDQo+ID4gPiDC
oAkJdGhjX2kyY19yeF9pbnRfZGVsYXlfZW5hYmxlKHFjZGV2LT50aGNfaHcsDQo+ID4gPiBmYWxz
ZSk7wqAgfQ0KPiA+ID4NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9pbnRlbC10aGMt
aGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLQ0KPiA+ID4gZGV2LmgNCj4gPiA+IGIvZHJpdmVy
cy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaA0KPiA+ID4g
aW5kZXggZDQxMmVhZmNmOWVhLi4wZDQyM2Q1ZGQ3YTcgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2
ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oDQo+ID4g
PiArKysgYi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJj
LWRldi5oDQo+ID4gPiBAQCAtMzgsNiArMzgsOCBAQA0KPiA+ID4NCj4gPiA+IMKgLyogUFRMIE1h
eCBwYWNrZXQgc2l6ZSBkZXRlY3Rpb24gY2FwYWJpbGl0eSBpcyAyNTUgQnl0ZXMgKi8NCj4gPiA+
IMKgI2RlZmluZSBNQVhfUlhfREVURUNUX1NJWkVfUFRMCQkJMjU1DQo+ID4gPiArLyogTWF4IGlu
dGVycnVwdCBkZWxheSBjYXBhYmlsaXR5IGlzIDIuNTZtcyAqLw0KPiA+ID4gKyNkZWZpbmUgTUFY
X1JYX0lOVEVSUlVQVF9ERUxBWQkJCTI1Ng0KPiA+ID4NCj4gPiA+IMKgLyogRGVmYXVsdCBpbnRl
cnJ1cHQgZGVsYXkgaXMgMW1zLCBzdWl0YWJsZSBmb3IgbW9zdCBkZXZpY2VzICovDQo+ID4gPiDC
oCNkZWZpbmUgREVGQVVMVF9JTlRFUlJVUFRfREVMQVlfVVMJCSgxICoNCj4gPiA+IFVTRUNfUEVS
X01TRUMpDQo+ID4gPiBAQCAtMTAxLDYgKzEwMywxMCBAQCBzdHJ1Y3QgcXVpY2tpMmNfc3ViaXBf
YWNwaV9wYXJhbWV0ZXIgew0KPiA+ID4gwqAgKiBASE1URDogSGlnaCBTcGVlZCBNb2RlIFBsdXMg
KDMuNE1iaXRzL3NlYykgU2VyaWFsIERhdGEgTGluZQ0KPiA+ID4gVHJhbnNtaXQgSE9MRCBQZXJp
b2QNCj4gPiA+IMKgICogQEhNUkQ6IEhpZ2ggU3BlZWQgTW9kZSBQbHVzICgzLjRNYml0cy9zZWMp
IFNlcmlhbCBEYXRhIExpbmUNCj4gPiA+IFJlY2VpdmUgSE9MRCBQZXJpb2QNCj4gPiA+IMKgICog
QEhNU0w6IE1heGltdW0gbGVuZ3RoIChpbiBpY19jbGtfY3ljbGVzKSBvZiBzdXBwcmVzc2VkIHNw
aWtlcyBpbg0KPiA+ID4gSGlnaCBTcGVlZCBNb2RlDQo+ID4gPiArICogQEZTRU46IE1heGltdW0g
RnJhbWUgU2l6ZSBGZWF0dXJlIEVuYWJsZSBDb250cm9sDQo+ID4gPiArICogQEZTVkw6IE1heGlt
dW0gRnJhbWUgU2l6ZSBWYWx1ZSAodW5pdCBpbiBCeXRlcykNCj4gPiA+ICsgKiBASU5ERTogSW50
ZXJydXB0IERlbGF5IEZlYXR1cmUgRW5hYmxlIENvbnRyb2wNCj4gPiA+ICsgKiBASU5EVjogSW50
ZXJydXB0IERlbGF5IFZhbHVlICh1bml0IGluIDEwIHVzKQ0KPiA+ID4gwqAgKg0KPiA+ID4gwqAg
KiBUaG9zZSBwcm9wZXJ0aWVzIGdldCBmcm9tIFFVSUNLSTJDX0FDUElfTUVUSE9EX05BTUVfSVNV
Qg0KPiBtZXRob2QsDQo+ID4gPiB1c2VkIGZvcg0KPiA+ID4gwqAgKiBJMkMgdGltaW5nIGNvbmZp
Z3VyZS4NCj4gPiA+IEBAIC0xMjcsMTcgKzEzMywyMiBAQCBzdHJ1Y3QgcXVpY2tpMmNfc3ViaXBf
YWNwaV9jb25maWcgew0KPiA+ID4gwqAJdTY0IEhNVEQ7DQo+ID4gPiDCoAl1NjQgSE1SRDsNCj4g
PiA+IMKgCXU2NCBITVNMOw0KPiA+ID4gKw0KPiA+ID4gKwl1NjQgRlNFTjsNCj4gPiA+ICsJdTY0
IEZTVkw7DQo+ID4gPiArCXU2NCBJTkRFOw0KPiA+ID4gKwl1NjQgSU5EVjsNCj4gPiA+IMKgCXU4
IHJlc2VydmVkOw0KPiA+ID4gwqB9Ow0KPiA+ID4NCj4gPiA+IMKgLyoqDQo+ID4gPiDCoCAqIHN0
cnVjdCBxdWlja2kyY19kZGF0YSAtIERyaXZlciBzcGVjaWZpYyBkYXRhIGZvciBxdWlja2kyYyBk
ZXZpY2UNCj4gPiA+IMKgICogQG1heF9kZXRlY3Rfc2l6ZTogSWRlbnRpZnkgbWF4IHBhY2tldCBz
aXplIGRldGVjdCBmb3IgcngNCj4gPiA+IC0gKiBAaW50ZXJydXB0X2RlbGF5OiBJZGVudGlmeSBp
bnRlcnJ1cHQgZGV0ZWN0IGRlbGF5IGZvciByeA0KPiA+ID4gKyAqIEBpbnRlcnJ1cHRfZGVsYXk6
IElkZW50aWZ5IG1heCBpbnRlcnJ1cHQgZGV0ZWN0IGRlbGF5IGZvciByeA0KPiA+ID4gwqAgKi8N
Cj4gPiA+IMKgc3RydWN0IHF1aWNraTJjX2RkYXRhIHsNCj4gPiA+IMKgCXUzMiBtYXhfZGV0ZWN0
X3NpemU7DQo+ID4gPiAtCXUzMiBpbnRlcnJ1cHRfZGVsYXk7DQo+ID4gPiArCXUzMiBtYXhfaW50
ZXJydXB0X2RlbGF5Ow0KPiA+ID4gwqB9Ow0KPiA+ID4NCj4gPiA+IMKgc3RydWN0IGRldmljZTsN
Cj4gPiA+IEBAIC0xNzAsNiArMTgxLDEwIEBAIHN0cnVjdCBhY3BpX2RldmljZTsNCj4gPiA+IMKg
ICogQHJlcG9ydF9sZW46IFRoZSBsZW5ndGggb2YgaW5wdXQvb3V0cHV0IHJlcG9ydCBwYWNrZXQN
Cj4gPiA+IMKgICogQHJlc2V0X2Fja193cTogV29ya3F1ZXVlIGZvciB3YWl0aW5nIHJlc2V0IHJl
c3BvbnNlIGZyb20gZGV2aWNlDQo+ID4gPiDCoCAqIEByZXNldF9hY2s6IEluZGljYXRlIHJlc2V0
IHJlc3BvbnNlIHJlY2VpdmVkIG9yIG5vdA0KPiA+ID4gKyAqIEBpMmNfbWF4X2ZyYW1lX3NpemVf
ZW5hYmxlOiBJbmRpY2F0ZSBtYXggZnJhbWUgc2l6ZSBmZWF0dXJlDQo+ID4gPiBlbmFibGVkDQo+
ID4gPiArIG9yIG5vdA0KPiA+ID4gKyAqIEBpMmNfbWF4X2ZyYW1lX3NpemU6IE1heCBSWCBmcmFt
ZSBzaXplICh1bml0IGluIEJ5dGVzKQ0KPiA+ID4gKyAqIEBpMmNfaW50X2RlbGF5X2VuYWJsZTog
SW5kaWNhdGUgaW50ZXJydXB0IGRlbGF5IGZlYXR1cmUgZW5hYmxlZA0KPiA+ID4gb3INCj4gPiA+
ICsgbm90DQo+ID4gPiArICogQGkyY19pbnRfZGVsYXk6IEludGVycnVwdCBkZXRlY3Rpb24gZGVs
YXkgdmFsdWUgKHVuaXQgaW4gMTAgdXMpDQo+ID4gPiDCoCAqLw0KPiA+ID4gwqBzdHJ1Y3QgcXVp
Y2tpMmNfZGV2aWNlIHsNCj4gPiA+IMKgCXN0cnVjdCBkZXZpY2UgKmRldjsNCj4gPiA+IEBAIC0y
MDAsNiArMjE1LDExIEBAIHN0cnVjdCBxdWlja2kyY19kZXZpY2Ugew0KPiA+ID4NCj4gPiA+IMKg
CXdhaXRfcXVldWVfaGVhZF90IHJlc2V0X2Fja193cTsNCj4gPiA+IMKgCWJvb2wgcmVzZXRfYWNr
Ow0KPiA+ID4gKw0KPiA+ID4gKwl1MzIgaTJjX21heF9mcmFtZV9zaXplX2VuYWJsZTsNCj4gPiA+
ICsJdTMyIGkyY19tYXhfZnJhbWVfc2l6ZTsNCj4gPiA+ICsJdTMyIGkyY19pbnRfZGVsYXlfZW5h
YmxlOw0KPiA+ID4gKwl1MzIgaTJjX2ludF9kZWxheTsNCj4gPiA+IMKgfTsNCj4gPiA+DQo+ID4N
Cj4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaCENCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBFdmVuIFh1
IDxldmVuLnh1QGludGVsLmNvbT4NCj4gPg0KPiA+ID4gwqAjZW5kaWYgLyogX1FVSUNLSTJDX0RF
Vl9IXyAqLw0KPiA+ID4gLS0NCj4gPiA+IDIuNDAuMQ0KPiA+DQoNCg==

