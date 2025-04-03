Return-Path: <linux-input+bounces-11487-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E91BEA79A28
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 04:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB6213A48B0
	for <lists+linux-input@lfdr.de>; Thu,  3 Apr 2025 02:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B22391624F4;
	Thu,  3 Apr 2025 02:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SF3xggp0"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50C11862;
	Thu,  3 Apr 2025 02:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648719; cv=fail; b=iSzqgQ31biQlJIy1TGSLblF6sEoZ/nGUIPBPkU8bFakvitMhTLPLFbGgaN8sE9Z9/TY85lbEcojKAYWxuh6MEmXfCvRk6U573tdub1YMQVtaOsQ1EGNZ7koUi3Wcc++q4mvcIXbJHclpY7QSzncORRaXHsIf/dKnDM9WqQlRpYQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648719; c=relaxed/simple;
	bh=y4KTl+7zpkyitc0F9rKoSoS5Mbg1/mVai1BbH4ZRiYw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VVhAk9iITRjv7Wxlq87QEBapts3uCN7qLwpdNrAdVraSCA10Eyl6+sZkDpNPdpAeDoC/1F6/765riApg9Lj3j2w+T3kuU1eruKQN4J2UyNJPpgNftiz/qwt90oSHwUCtBsGVCUqedL5F2devs/XKfwkT/XIsVVyxPb/Imgev004=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SF3xggp0; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743648717; x=1775184717;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=y4KTl+7zpkyitc0F9rKoSoS5Mbg1/mVai1BbH4ZRiYw=;
  b=SF3xggp03WBaO4x//cQz/lOYY18S3h+RbyKQ3hz/Pn7QS/ojovh5nWHs
   PDoIyy1UnztW19JISnF4Ar1W6MJIanxxkvT8AGnUAlM5Rm6km4QGWMF79
   X1g02XQIfomVnNPjCIuPT4hAO2JYC2SUVyaTxxY+tRNYp4CLCIDVRQ3yx
   w7rTUZMA0DCxH1K7+p/asrJHCGXKEKGS/ZWAogwxVoBE6+t0Jrwx63BiS
   4thEtK5dUGN84uAORnVad6MsObOvrOImqzHijygTu6C2J1A+wRiMEXgzx
   p9X7KY9rko+v7Vw2llombYHoVhShNqUi7yNNrUEHRLf1o24iTUfISKm69
   w==;
X-CSE-ConnectionGUID: A0KZRWJ5SnmuwnJyuYE8QA==
X-CSE-MsgGUID: RwE4XlNcSb62k3f3xllmTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="70405981"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="70405981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:49:18 -0700
X-CSE-ConnectionGUID: GGZJpEzeR72saPVELElpJw==
X-CSE-MsgGUID: tNoCwYkSTdG6UDFM6KqEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="157872362"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:49:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 19:49:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 19:49:17 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 19:49:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOyUchqJlhe4O4B0Em9arWBR+YM19CX7aP+E1DGqXhZNifwrwYk4RDM9tdtzrJCBEQKHPdaLFRXOA4rtL/2TvqZ1z5p2x0e2ZNUQ/MwStIDQhDERjbhsWBmnfRYUhWdtHXxGvOinLQWxbFSvqBxyEh5GCX0QTCiIVGd/Y0NhoBVNPwENIN27ZmDFeVVCzOdSIdMT9W3wGqKtyZg3ewyTt3XVvr2lHzgRlet4RUoNff2bVNWzn+KpMj3rlCv2uuG9ho7DBy8xtg2lU9G6rUud3Uxks1Y3kPiUOqOeAUzPsecblGOzJM8Z1RzoCyIvfxymqBYZ8plfrr1RJ5P/J/E9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4KTl+7zpkyitc0F9rKoSoS5Mbg1/mVai1BbH4ZRiYw=;
 b=sjy/crZoX1fcgBuREWfrMAZVJYkyclelFo4OXgayIhtIQ+ERTK00BePDnpqvuJomPpXNwUcpSEPHq7Cz/7vRT9n1gXFZz2INwirxa/8qYdbTJEQYYJeUaVOHbsHToHKXJCcM6yGiVGv5hJlEd5/7dhlunyRRb2CbHlK0NaRRKw5IXGLzU9sfd/KgSi2PAyZamNFHIH273Xh/dPH1ylMvm9Et97arFbDEb462NYA8/RnFEVznvzfLwEt/AHGEQjuOpRKOm46LcWvOEhkLr+jHPxdX8c0mZbQ7hhlkCdve8fAU6ZMgk3t5Vg91HuOsogLtPyBw/4KSUnehKD/doLJMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by LV8PR11MB8464.namprd11.prod.outlook.com (2603:10b6:408:1e7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Thu, 3 Apr
 2025 01:12:35 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8534.048; Thu, 3 Apr 2025
 01:12:35 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires
	<bentiss@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
CC: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: intel-thc-hid: intel-thc: make read-only arrays
 static const
Thread-Topic: [PATCH] HID: intel-thc-hid: intel-thc: make read-only arrays
 static const
Thread-Index: AQHbo8Fw5pAtncaQ7k64qNtbpm0v1bORIxag
Date: Thu, 3 Apr 2025 01:12:35 +0000
Message-ID: <IA1PR11MB60980AFB37E42D8EB7085D27F4AE2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250402112129.410320-1-colin.i.king@gmail.com>
In-Reply-To: <20250402112129.410320-1-colin.i.king@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|LV8PR11MB8464:EE_
x-ms-office365-filtering-correlation-id: ac0c87c0-794e-4c7d-765d-08dd724c9e1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dm1za3FQZ2xEK1luVHVPazhkcWtkRDN5d1JYVThBOXNtOHpsZG81eDMrNkkz?=
 =?utf-8?B?UE5Jc0pDWTJodml3ZmJXbG9zb2UvWWVORU83b3ZUY1ZyQlFkZGYySks0ZWg2?=
 =?utf-8?B?dXN4MnU2L0hDMUFEMitGdTlKeERJWHJ3SDVSaWpDTkp3VjY1NVZ0SjlCRWNL?=
 =?utf-8?B?dU5TZ2xMUmJGTVF6VWN5cjdrcnpIRGpYby9oMkJHN282c0xHTTNIS2xyOVlw?=
 =?utf-8?B?bTJ1aUFsZXJnMGs0ZTVCUi9MUGJZS3plMGw4cVh0S0s4dTZBakJuMmhkQXM3?=
 =?utf-8?B?d1FVUzhSS1hIc3lPaExWUGpYMlJOS2tlWndHUWdNYjlsUU5LUTgvMkkyYVpu?=
 =?utf-8?B?OFcxMkFqYnQvdVhiU0J6WjY4bnpPM0RneHpTa2lXUTdqakE3UUNiWEpibGNw?=
 =?utf-8?B?Zk5MVExZc2NiTkRJb3Z1Uy9saGdDTUJVQkJTbG5MZnhZZUp6MXVWeW4rVmhF?=
 =?utf-8?B?SFpGRlgxWmltNnBxM0JkM0tVZDN2c1U2VXNreks5WFhYWWlzUE81NHJJSzNj?=
 =?utf-8?B?QmZ3VXBaSHRjY2VwNFVxQ3NOQnFncmhVMUUwNGhEU1lQeXhRMDM2Vlo5bHNW?=
 =?utf-8?B?bzBlN3VJUXhlZjErUHkxQnpTb1ZEM1V1OW1ZTGtUd21CZUY4cC9tOTV6Q1NS?=
 =?utf-8?B?TmdveXNpNDAwbmtiNFc0YVJkdzA0UzBSYWJEeTMrVHp4a25MZnNsc2pWaGEy?=
 =?utf-8?B?RlJ5cDFsdHdvNWNFYzZ0WG5VVGhJV0FlRjZRdGlLbEltRTA0bEt0U2NEL1Jw?=
 =?utf-8?B?UmlaenVBeXZINmRjTkpSeFZxZ3BXRXpETFpLYnpsTFE4aElranVkeGVSMVZw?=
 =?utf-8?B?K1VMcVljdzVjL0RPVFN3V1UwMjl4ZW5XU3NkT3pXclBRUHk0ZmxEdG93Z3pI?=
 =?utf-8?B?dlpIajkxOTdPLzNBbm45eVdVbWxuOVN3T2pyR2t2ZkJwQkJkTDVjQTdGV25n?=
 =?utf-8?B?dHRCMWVXcHVDUzRXZUFMWEhia1NkSG5rT2hCcmtZMTFWTjdCeFF3WmRKMGg3?=
 =?utf-8?B?eFVDdkk1Y1RzazFsL1hBMHBxS2wxNC90Z2p0M2JxSW5WOUN3Q1RhRkIrRENN?=
 =?utf-8?B?bDM3K3RPenovSTNXaWZManpEa2FOd1dIL0MySStPZmorbnk4S1ZmMDBEZFF3?=
 =?utf-8?B?eVl0YjhEYUtWQXBUMTRFb0orN3BPd1dzaDFyM2Q4djU4T2hIbWpCSm42K25q?=
 =?utf-8?B?YmMrSnBvNDU1TDdwSVhuL1hhL3lDZ0hGdUR3ZjcyTE9yeU44d2JwYWFzVmg3?=
 =?utf-8?B?ckpHVnNJWmN1SlViQjllK1BUcG9PZDByUkJpRzE3OWlTbWVXWGgrSHpHUFFx?=
 =?utf-8?B?UHBubFBVVUJLaFVveFEzNG1GRzVXdG9TRWl5cVZqcGFDeTdMSjl6N1RRTGcy?=
 =?utf-8?B?SFZHMG16MExZRjVtUzZBOXdveWJFamtyN2dxQ01xam9kK1AxcXdVMXFiVm02?=
 =?utf-8?B?cjd4bDkrbU93WEdCbjJtbEFsdzJ6L090U3ZuMFMveVlsWTBHV3ZnNHNJUG5X?=
 =?utf-8?B?NzA1MXFJejRrb05GRGUzVjIxQ3kzc1BXNmRqcEpBNU1CWmEzV0RnaTN4RWdo?=
 =?utf-8?B?aTlrZUVLTlpwU3djLzhMRlFnSXNiNnhKVitudDFBWGlkL0Qrc3phNWJ2cFFi?=
 =?utf-8?B?T3lmTTdYMWpWMng4c2UxY1RSSFEzNGNydGFVbHR1bldJbU9jRjFtWThHVjVJ?=
 =?utf-8?B?b0RkVTI2eUZ6dU5YejBISHMvVkJIWmRQMDE1djNXZXA5ZE1LTDJNSTJZZU5W?=
 =?utf-8?B?cFcxNm1tOWR6NGs5RlpGei81dkg4TkVZTUxPWWo1V0RxZkVTWXhpbDRTcEkv?=
 =?utf-8?B?Q3Q1SVpKU2h0WEQveEwzYTV1eVFadzRtR0VhSnNlQVM2ZDFrUUJxRURCOGdk?=
 =?utf-8?B?MTV4a2J6d3NURUxYNWNIL09RMXE3TTRiWTlSbmJwY1NHOU90MWlWUmFjSlgy?=
 =?utf-8?B?UkNNWk1mRzBvRlR6M1ZtbmFGNHJ4NDNnbEhYbEFKTlZnb2VGN3N1WXhvZFhk?=
 =?utf-8?B?dnNaZkxUWFlnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UHkzUFoyclNuZ243SnM0d3lPTzI0dmFZTU90ckExeHQ0Rkwra2dpUHJwaThL?=
 =?utf-8?B?WVNxUm9jNXZ1cU50NUJJaENxUVRIMGlKc2JYZkJNZ0puQkw3YTgwMFhTZzRZ?=
 =?utf-8?B?aDEwWGVIRzc4cnFwR3BSYlFXRFhkUVNkdlZLenkveW8vWlJpb2NKRVM2emR1?=
 =?utf-8?B?VE1QRlR5U2h6SHR0OHFwa0poNi9zeDV3MGlNWWxOUUZDanBiaElFQ3RzZ0dx?=
 =?utf-8?B?QW5SSHgyMFlaWUhyZjVvWUVOVWh3LzJZUDVxQVRqTEtzY0N6REloVytaTVhP?=
 =?utf-8?B?aG9ic3dLbjhsNnQ2WEgvTUNSMU1NKzZhUytnK3ljQWZodEFCdEZIUDFhUHpF?=
 =?utf-8?B?ckVHYVNScjhJT3VNeTYvTnF6aWxjTXdocFEyZkZrd1dEVi9rRG9zbzJnanJm?=
 =?utf-8?B?YVVheFo2Qm40eVJtV2tIN0hJaCtaaW1iT0QxMkdINnJ0dXZYVmdtVXlDZDhK?=
 =?utf-8?B?TkZ3cXFUSlJ5cmpTY1ppNHZaTWp5bVkrK1dqMnFRV0h6TW9mR0Y4dXBNOWZs?=
 =?utf-8?B?RDFodTJkNzJmbWRDaHZaUGtCN3hBblJSYnZESW5BaTRmeU1ycE92UXJrNTJU?=
 =?utf-8?B?T1JNMndlQUZKOXA4RXYxOGVaKzdGRlJ4R1QwSUJmZ1NLU3BsMmY4TDhMdHg4?=
 =?utf-8?B?TEVHTzZyMUx6QVZvUTJvdUJpTmlWRm44YTBsTUVVSGRSd2ljYW5HYy9yd2ZO?=
 =?utf-8?B?TFNOazdidjk3QytxYjRpWTdsUS82Yno2U3A4dWxZdFpycDVQMm90bGJ5OXg1?=
 =?utf-8?B?aGVnY3pwM05vb1c3R3RVQnVPREF6OElrMXBGVk1jb2p5N0FNb3I3c1VZQmdR?=
 =?utf-8?B?VTlwUk04OWdjMitvb1JQVCtXRlQxM1FROW5iWExsVldZd2pCaGNJM0lScXho?=
 =?utf-8?B?RTYxS0pQTnZpS3E1cndVQ0poUXJsdEpoNTNmOFZxWXRhT1lpUXlaZXFZcXBo?=
 =?utf-8?B?V2hlVWd4clRyMDlwZkdNQ2RDOGtGRnhPS0dYRE9uZnc1OFlkVWJQY2JTeW1V?=
 =?utf-8?B?RzBDemI2bnZlY0hIazYyZ0hrNmgycTZmMW1OR2s2cXYzZ3dFWG5tQ2RFbEVj?=
 =?utf-8?B?MnJFMDNVMzE0L1JzaDduaEFLd1J2SkpER3kyN0lLaXE5L3lKbSt1THJlL2JF?=
 =?utf-8?B?V0NoNGlYb09UY1BFSytTMXZIQkdQUTh3NWgyWUI5S1AvdjZRWi8vR2plb1cz?=
 =?utf-8?B?WGIrUEQ2NldWSEJRU2dvV1ZPWWNNdlRmWU04TmcvbkZMd3ZPUjZuUnQvSEE1?=
 =?utf-8?B?eHloUzJ0S1NhcEk4di95alI5K3NqdlU5YWpwcVNlWWpweGJzYlRvUlVsYjFC?=
 =?utf-8?B?Q093Zmd2VHhoOStLSDBzUnd2d0pjdjVBWDNtWnErZjlpaTRnVjUrT2lGczRl?=
 =?utf-8?B?TStYUWcyelQ5eEhnZElsL3h6anZQcUh0QzZ5QlE3NGxQTFRob09PQU9jOFR0?=
 =?utf-8?B?dHhtamtyUERabFprMDd0dFR3V3BkNVQ3TFI1YmRuckhaa3ZNeDRaMjc2VXF5?=
 =?utf-8?B?RXh2VkpSQ0Qyam1YZGw1ZmlQQVRYK0ZBeERPZ1F0b2tWMGlRLzFLZ2dtOWc5?=
 =?utf-8?B?MWpMNnhneFE0YUJBWDQ0SlBoc1U2S2loVXpBazNEQ0dRWHVrWFd5Q3lzV0dZ?=
 =?utf-8?B?bml1SFloQThkWWVzcWEvblhxUWhzeUJMcnQzWEprUThEQVY5d3AyTzV0d0k0?=
 =?utf-8?B?L01yOFdGQk9BOU1nQTVsZUQwd0tKQ1h0KzlhdjZLOThHdDlHWnJ3MWJCajNu?=
 =?utf-8?B?WFYzcitndC90bEVsenpUekl6Z0laMEljTnpKYlRWVVhLbE5jV1p1cmRNT3hT?=
 =?utf-8?B?STFTOVdDUUdPbDdkWWd6RHRQUGR6V2c4SDNkY0t0QVAyTTNscDR2bzlxZW4w?=
 =?utf-8?B?UHpjQWpxNGU2eVBXVGlwVEtoeWp6NDRjT0VwSHU3cGZBZ3JLUnduNGRDV0JE?=
 =?utf-8?B?MXlPcjZQZnlQcjcwOFNqamxlNy9SandRaS9DMTNQYms4cGUyVVNReDNvdVNS?=
 =?utf-8?B?ZkVJT2l3eTNIakpDUTNUWm1IS0RDdi92Uk9FdjJhY0hzc3ZRZTlGN09aTXcr?=
 =?utf-8?B?TWtiZkNlaGd4SkFuaHFVTEhHUlZYSTh4SXN5SE9nbzhDcnlBVWFCY0Eza0Z5?=
 =?utf-8?Q?Uu0A=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ac0c87c0-794e-4c7d-765d-08dd724c9e1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 01:12:35.1852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fFY3BaQWYa6rNENL1pNsXAkN17Swigr8TvmQiQqR1Gztv5K92G498pIzSLmd8vJYgxDEI+3M/nmmQ8sRDCAJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8464
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ29saW4gSWFuIEtpbmcg
PGNvbGluLmkua2luZ0BnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgQXByaWwgMiwgMjAy
NSA3OjIxIFBNDQo+IFRvOiBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBTdW4sIFhpbnBl
bmcgPHhpbnBlbmcuc3VuQGludGVsLmNvbT47IEppcmkNCj4gS29zaW5hIDxqaWtvc0BrZXJuZWwu
b3JnPjsgQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtlcm5lbC5vcmc+OyBTcmluaXZhcw0K
PiBQYW5kcnV2YWRhIDxzcmluaXZhcy5wYW5kcnV2YWRhQGxpbnV4LmludGVsLmNvbT47IE1hcmsg
UGVhcnNvbiA8bXBlYXJzb24tDQo+IGxlbm92b0BzcXVlYmIuY2E+OyBsaW51eC1pbnB1dEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gQ2M6IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogW1BBVENIXSBISUQ6IGludGVsLXRo
Yy1oaWQ6IGludGVsLXRoYzogbWFrZSByZWFkLW9ubHkgYXJyYXlzIHN0YXRpYyBjb25zdA0KPiAN
Cj4gRG9uJ3QgcG9wdWxhdGUgdGhlIHJlYWQtb25seSBhcnJheXMgZnJlcXVlbmN5IGFuZCBmcmVx
dWVuY3lfZGl2IG9uIHRoZSBzdGFjayBhdA0KPiBydW4gdGltZSwgaW5zdGVhZCBtYWtlIHRoZW0g
c3RhdGljIGNvbnN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGlu
Lmkua2luZ0BnbWFpbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9p
bnRlbC10aGMvaW50ZWwtdGhjLWRldi5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuYyBiL2RyaXZlcnMvaGlk
L2ludGVsLQ0KPiB0aGMtaGlkL2ludGVsLXRoYy9pbnRlbC10aGMtZGV2LmMNCj4gaW5kZXggNGZj
NzhiNWEwNGI1Li5jMTA1ZGY3ZjZjODcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaGlkL2ludGVs
LXRoYy1oaWQvaW50ZWwtdGhjL2ludGVsLXRoYy1kZXYuYw0KPiArKysgYi9kcml2ZXJzL2hpZC9p
bnRlbC10aGMtaGlkL2ludGVsLXRoYy9pbnRlbC10aGMtZGV2LmMNCj4gQEAgLTExMjEsNyArMTEy
MSw3IEBAIEVYUE9SVF9TWU1CT0xfTlNfR1BMKHRoY19wb3J0X3NlbGVjdCwNCj4gIklOVEVMX1RI
QyIpOw0KPiANCj4gIHN0YXRpYyB1OCB0aGNfZ2V0X3NwaV9mcmVxX2Rpdl92YWwoc3RydWN0IHRo
Y19kZXZpY2UgKmRldiwgdTMyIHNwaV9mcmVxX3ZhbCkgIHsNCj4gLQlpbnQgZnJlcXVlbmN5W10g
PSB7DQo+ICsJc3RhdGljIGNvbnN0IGludCBmcmVxdWVuY3lbXSA9IHsNCj4gIAkJVEhDX1NQSV9G
UkVRVUVOQ1lfN00sDQo+ICAJCVRIQ19TUElfRlJFUVVFTkNZXzE1TSwNCj4gIAkJVEhDX1NQSV9G
UkVRVUVOQ1lfMTdNLA0KPiBAQCAtMTEzMCw3ICsxMTMwLDcgQEAgc3RhdGljIHU4IHRoY19nZXRf
c3BpX2ZyZXFfZGl2X3ZhbChzdHJ1Y3QgdGhjX2RldmljZQ0KPiAqZGV2LCB1MzIgc3BpX2ZyZXFf
dmFsKQ0KPiAgCQlUSENfU1BJX0ZSRVFVRU5DWV8zMU0sDQo+ICAJCVRIQ19TUElfRlJFUVVFTkNZ
XzQxTSwNCj4gIAl9Ow0KPiAtCXU4IGZyZXF1ZW5jeV9kaXZbXSA9IHsNCj4gKwlzdGF0aWMgY29u
c3QgdTggZnJlcXVlbmN5X2RpdltdID0gew0KPiAgCQlUSENfU1BJX0ZSUV9ESVZfMiwNCj4gIAkJ
VEhDX1NQSV9GUlFfRElWXzEsDQo+ICAJCVRIQ19TUElfRlJRX0RJVl83LA0KDQpUaGFua3MgZm9y
IHRoZSBpbXByb3ZlbWVudCENCkxHVE0uDQpSZXZpZXdlZC1ieTogRXZlbiBYdSA8ZXZlbi54dUBp
bnRlbC5jb20+DQoNCj4gLS0NCj4gMi40OS4wDQoNCg==

