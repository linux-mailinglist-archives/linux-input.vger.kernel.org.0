Return-Path: <linux-input+bounces-3967-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D64308D463C
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 09:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C0F21F220B6
	for <lists+linux-input@lfdr.de>; Thu, 30 May 2024 07:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9C84D8CA;
	Thu, 30 May 2024 07:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxpMM/Z1"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03644D8B6;
	Thu, 30 May 2024 07:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717054899; cv=fail; b=MYofNhFCNtmux/zBuPTAZHd+AOATWUZqU5eB+6NPb0na2OB5w397eVgkb/P6Xf6VgfhcoV7qNiueUl4ndEV/YwXUibF4VfrBdzb2y4xcfM+PEiHGe7P41QkJJ4lbIrfbx/Yz/wZcY1qLAiPPjT1RKUQWvG9DylhUsjosCRcLx6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717054899; c=relaxed/simple;
	bh=beStKylOhgYO7e5cNRx4+2njbBwAxhuFaWy/1axXunI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eFTaYj8nB3jlYc0LZZ2XzGHTrCIK3w2IZsm4i+PfvgFwFe2VEOgy9u5HqHdIm43L2IYUfl/CwOrRJgRWpKinWP1jlNBnETs5u/9BbocYwBPeOns/6sUR5PtcwixVO9FwwrqyUD5U3WqtFaU7uESf2Bv4w0qYDEnGC5Da4J0IqNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxpMM/Z1; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717054897; x=1748590897;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=beStKylOhgYO7e5cNRx4+2njbBwAxhuFaWy/1axXunI=;
  b=hxpMM/Z1ffQwBY3mcyD/52Hvmoax29Ua2hunV//RCk73kKrd4yqNELgZ
   tujFKtNzGyC8j6uXbIk1ZhQgGMwoRq+31ilGjvt13yYU6vbd43NSgZufV
   q0YbmOxzNTlGAq5uQbETh2WEI9GxedkRbRD3aSeOYIn45DkQ1WY7FaYPO
   TDJHl/q/EpXRzigEjlTYQXIyenJWlQJ2jvzGzIHL5p4ykXDdmhVwT22Cs
   6Tg/yW2m1XwASUuW39aHNqz24LGb+1T7Xad+deN1KtzL+OzrIzqUJ4uG3
   F8PlP/AddkFemHb64WNuUSM2XmluI1R8fzfEZu6qtNEJdt5/aDpLz5ZIS
   g==;
X-CSE-ConnectionGUID: Ii/sUJBrTD6C0b5SepOwcA==
X-CSE-MsgGUID: /98xGvRxQmudiK9xz4A7qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="31039624"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="31039624"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 00:41:36 -0700
X-CSE-ConnectionGUID: zFuMDbBDQ2qvEWrI/Guf/Q==
X-CSE-MsgGUID: rbjA1Jb4TiutWYoRKonsMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40634547"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 May 2024 00:41:36 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 00:41:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 00:41:35 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 00:41:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 00:41:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mco4lPVxiDGK5md4MAMxsRVGTAaKdrhtHJt5GUrHQXldCQ5ZbAgP3b4pts5GTjaEVV+v2E5pqMCn3GLQxjQ/xGMVhpKfKsNgQApULQS/8nCMSbNtE7ph0wHfBVnXV/P/VWtGs0mcSkNSPhtK+lgNPyuNgda2Qa/zAHifhIBJvQHB3ZZ1mey2ArV0wN9WTlDLDrVcX3xQ4t1RzKjCFXUIgs0w1SSI6rSflgbXHKUWrnMNrNW8UTadpzXBwcr3BDTFGgyrCNujoovRqNf8UG5XQQAsU+GuQfPH+r02EuAV+wCbfWDb5VBofSb0W0bdYvY1S6M1KMn7MuA5M3GKlXF0BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beStKylOhgYO7e5cNRx4+2njbBwAxhuFaWy/1axXunI=;
 b=lUrPRcTxxRsdAJqNckrzdfXxupgs31sAuotscqOu3RkIy2uYrYMdL9ZGoWL13AO/JEjWOZ/JbSb9qaSABzUbUYGHaoge21LdK20yp1iKwLvzVsj9qwANT4IDgOft6tVYXnsgp03+ajAPdojW39pMUc8u4rnmfiSfz20NMmRWFqES8kYIvWpdVkH6KxdClSKQJYGHnC5aRpUhm8WwNV1aHUAgSlv2tWsqXeLHsQ53/ONShxJs3IbbqzOPyVEG7FX19o8ntcfmwDW00cpW6fOyNLKu7NTjAp+vJkxOzbKKYCoNOs5W+LO3Z09UPZaQuwVTbImX/zU9Ejg3WzyP40Mvnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 PH0PR11MB5143.namprd11.prod.outlook.com (2603:10b6:510:3f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.17; Thu, 30 May 2024 07:41:33 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7611.034; Thu, 30 May 2024
 07:41:33 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, Arnd Bergmann
	<arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, Jiri Kosina
	<jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, "Xu, Even"
	<even.xu@intel.com>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Thread-Topic: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Thread-Index: AQHasPZUv9c8QpESZEiMh4a/JLYAj7GtvJ2wgAAO3ICAAQDKAIAAmITg
Date: Thu, 30 May 2024 07:41:33 +0000
Message-ID: <DM4PR11MB599551F9BED555916102EB7693F32@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
	 <DM4PR11MB5995875EEC9ACCFC43D8B86A93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
	 <fcbdc4a5-abee-4de8-9fe8-c8486195b96d@app.fastmail.com>
 <ed3236173ff6fdb1cb6962f388b41e6b90586335.camel@linux.intel.com>
In-Reply-To: <ed3236173ff6fdb1cb6962f388b41e6b90586335.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|PH0PR11MB5143:EE_
x-ms-office365-filtering-correlation-id: 1290477a-92f5-4247-a28e-08dc807bed6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?dFhzczJ3eVpJcjhvTURvcUtlZmQ3TWIzZWE5cGtPQXJuOHZZUWROSC9nVk5x?=
 =?utf-8?B?MzV1MDlleC9WTjAvZUxSVzgydjE1emdhMlNiWG9KY3BUT1JKUHJURUxFaWhS?=
 =?utf-8?B?MjBEeVZzLzMzWWlNWlBNYXNjYk1UOG9JY1RDZXpsWDVZeWh3TVNIRktUd2p3?=
 =?utf-8?B?VTBONlh4UmNpUlJHOWFzMmwrYXNFc2g0Q1FpVzg5U3ZmYWFkYWZteFdNcDlG?=
 =?utf-8?B?WDRpTHBocDFMZWhEQ1pqSXY1d0oydDdwQW81enk1aU9Ja0ljSTBneUxZRm1H?=
 =?utf-8?B?ZUtKMXJoeG11YWpBYU5Xc3FkMFFWcElCVmV0bnpLYjlJZjN4MkYrMHo2ZTVY?=
 =?utf-8?B?emg0Z0g5aE9oMWhyQXBmVzhRajJ5ZVRCZUc4bTRXSUtSaEVaTzdkWjRFQ2VH?=
 =?utf-8?B?Y29sdzkyam56QXY3R0MyaFFpV0FQbzdnQ3JrVDA2aUg0b0VBRHNNR202L1JP?=
 =?utf-8?B?ZDZYMDBCUHdLWk5TMmgwQmE1ckZMTG11TFpJYXBqd0c3blQ3QWk0VWdUbVR3?=
 =?utf-8?B?c25tYXYyTUYxM3BBR1IrdllodXJ1UFR5S2NKcUViUnhFK0NhUlRYMGplOS9m?=
 =?utf-8?B?Qm5VMUIwdHpNRUQxL0NLT011TmlRSElXWmpaV29Qcnl3cEhxbklmaXBlSWZq?=
 =?utf-8?B?M0Q2bDQ0RGovYUJVR1kveWc4alVBcFhEY0FzcTVKUUt2R3ZYMWh4TWQwa0kw?=
 =?utf-8?B?Zkp6Z1pRTmYrZE83Q2hLT3hlTXdWTnNaczVvRkh0dHlwbE1ibVB1TFFSb3Bo?=
 =?utf-8?B?TlNPelpweGovbEJxVlE4ZWtLRkxRVnQ5K0dGWG9VVndpd3BFOVZISjdnLzZx?=
 =?utf-8?B?YVBRZGN4NTlEYStHQ2dCR2lCa00zcExmWktHdVM1WXlHaWRldXZtK0ZVZFVp?=
 =?utf-8?B?KzNoWGhQSVdoSE9qLzRlamptbVM5NVpFMmJ0bCtwVkxjQ0hBYUxHeEE3UFBp?=
 =?utf-8?B?bElSeHd4aklHc25KTDZjNHhPalJQU29qNG11NFZsZjVabldncUdycEQwQzl2?=
 =?utf-8?B?dkRRclRKUW5RSythTEJ2NEgrV0txb20wTWJZR3JQanFMdnBYWUNpcG4zK2NM?=
 =?utf-8?B?ZFJjVVpMUXl5RXZBZ0p1ajdJcHIxLzVKVXZMaG5QcURVYkRKRXVGL2laZm43?=
 =?utf-8?B?eGNtMGFocTNoTDhTcnV2bStOektURVN3bWQ3cExWL2VHOEdIaklxenBNZ28v?=
 =?utf-8?B?cVRsL2R6Ym16dFZIYjQ5dC92RkFseElkSXRuVElYVmlvcDkxSklPYkNKVTlr?=
 =?utf-8?B?MW10OTlwcCtxUFZTN3g0K3hpU3Rid1l6VGVjbkdEMFR1UHNUaWVnYkV3YWxK?=
 =?utf-8?B?TTFlQ3VMS3VZajl0MGt6d29scG81RGJnamFCbktLa0Nock9xdVF4OUpNQm8z?=
 =?utf-8?B?aTRXK2llcVhnUTR5aGQwL0MrWStZTGp0RlljWG5KVWlJMTI2SU9zWjJ4eG9Q?=
 =?utf-8?B?ck9sVlBIVml1UlZDUXlHVFpUNnRyVkxLZnJibnptNTJUYStxdk94Q1poVTh5?=
 =?utf-8?B?ZmdTS09KaUVid3hmK1JoM2dGSGZHVG8yMjZRckY4bTNHZDlXaSs5TlM5RE84?=
 =?utf-8?B?RnpOdVgrblc4eVZXb25saldmZ2NqNFhkTk9LbzFoMTF5dHUyUmNLSGV1ZWt2?=
 =?utf-8?B?TjRSUG4xNjgxVEFrcXFibUR3TzJ4K1BDSHUxejE4S3pBUGpLdnIwYUJnNWRQ?=
 =?utf-8?B?VEt0Wmo1MU1EYWlMdG5VS3hSTE1jcE8vVW5sbkNIcWpmYktvY0JnT25iMWM5?=
 =?utf-8?B?L2dnNU9aaHBSRTFTenMvVlVOYWo5cFJDdWVZeGVZNnBiaVNvS1BSS1VzOHJq?=
 =?utf-8?B?OGxNNzY1NDh2Y3ZhM3JmZz09?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aC9kUWEzV3JpTzV2T204cUZaQVA1VWIweEFJcGVmWU9ZTVV6NVhvcXg0ZFZG?=
 =?utf-8?B?SnloUnBPendwSE5XVml0a3hQZG91OHRDZmdzOEx4aW00WWx1RlpudWZQeXp4?=
 =?utf-8?B?TVNVZ1p2ek5nTG0zUFdraXdsV1ZQUVlENzJNa2xRcVVuWExyMlJOTkRBNUwv?=
 =?utf-8?B?MUVHS0h3bG1leWd3TFhsajVSeXo0b083ajBsTmZVVUhwL2NLRk13eDYvbFI5?=
 =?utf-8?B?UEJpTXBGNXp2NHczZkQxWU9GU2ZlZEQ3L2E5cWowbjZPLzZ1Z3Z1clRHZ0NR?=
 =?utf-8?B?cmZMaHJDL2lrc2hFbTh4N3RJRTJhRjMwUjFabW1Ha3ZEbHBpMyttbUFIRDYw?=
 =?utf-8?B?eW9YMVFoRmtSVXNEeDV4Rjhrem02M1M2VDZVREdOcmVNVjNocEd1T2ErUzBF?=
 =?utf-8?B?QzBlNkQ3RzlUdFk5c2M0SDAzYkJjSUZMSnFPdG5uM2crNGdGcFc2N1QwUWtu?=
 =?utf-8?B?MUZvUzYwdVFYVU5Qak9EZU5mN3ZYRnpVc0lBRk1QVWY5NDZXTEs5dzNGcVRn?=
 =?utf-8?B?UlZ6bTF5bHZWQW1KaUJMeUNRL0daSC9FSkphNG41NXpKd1l5ZXR4SmhqZ3RR?=
 =?utf-8?B?QlhsTGRkUlM1RHVVLzB4MVpmWStvYWRnWjArTEw5UER0QkJtazVncEpkZGhH?=
 =?utf-8?B?aFNsZjJ6R3R4eDRlenMxY01oZ2lOcTBOa0g3aHVIZFRvcVhtK0laYkJXc1Fy?=
 =?utf-8?B?eGcxM0ZTR3k1dGZOTXJIQnEza1hJNXZEazFJVXJNSktIaTJmMlgrSWVPZktI?=
 =?utf-8?B?OFBtb1U4M3BsNi9qRS9RcFdzMkkwSjZMM3RFQXlzRWhDd05KeU9wc2FMaEZF?=
 =?utf-8?B?R2FROUlubXZHMkdXeFUzY3hhaGxqMm1mR0N3TXpzelkzTjRENlB3Rjl4cGpx?=
 =?utf-8?B?ajM5ZjZQYUlheXhkeDhCdzQ1NkdweFNQME1UeStQOVFHeE5FQXZpUHI2alVp?=
 =?utf-8?B?UEk4d1RIYmpSeGlPa1dWN3gxRThkaVZ4Z3R4d3J4SUhhdHFDSHVVdVNNTEVz?=
 =?utf-8?B?bkF2V2d3c1Z2eU5UbThzQXhuSE44cTgxWlV3Z2tNazhPN3k3bXlCR0I4dlVH?=
 =?utf-8?B?Zmh1UU9jQ09YbHhIZFBFSldjMDM1b3kzWEhFY2VuTUpCQzgzdWp4blFmYUg0?=
 =?utf-8?B?cW9mUlhBS3JuYnVzY3ZtZWlnZDA5dnkwWHlJWjlmZEp4RDBjY0VTbEFrSW5R?=
 =?utf-8?B?S2IzU09LcHV1bjR6dUQ3TVV1cnRBZWpsR2kvZEduSXNWeFNmN1Ewb0hUWkU5?=
 =?utf-8?B?bWxVS1JFcllBYzYvb1FmV0pQeVdJU1hxUVBvdUtFREVRYy9QRmxuUmNkTE9H?=
 =?utf-8?B?K1M0VlROTkdBSS95NzEvVm9aK0R1cGUrUkg4NHJMWkpYWmprVGduVmNOMkhs?=
 =?utf-8?B?dE9xR3RNUnV2U3NFamtCd042NmllY0JlWUxGcjNicDh6VmpJWnFKcE5MQWRj?=
 =?utf-8?B?Q0NCelk5K0llM3hnZHRlMjU5Wmp3YkVoWFJGVStvYTRhZXhZa3pjaUlrMTNp?=
 =?utf-8?B?RGRQQ1NWUWZUVzVBZVlXL1dWY0NWcWtrQjNvc092U2k4RlBaRFBreEJVR082?=
 =?utf-8?B?ZEpNYjNDRXZrc041RWZOL0tjVFlRcU9NOXBvejhuMjVSOE1JVnliZE9YSUt2?=
 =?utf-8?B?M0RwQWgrUDIzUENSREVlbGk0SjRKK2ZUSnFOZlJ3cXV4QlJpdEs3Q0Z2Z213?=
 =?utf-8?B?MHQ0RFMrVzJnQ09VMUI0NldaZk9SNVg0U0UvYVhzeWxjNUZ1R2tOaUdxRXRy?=
 =?utf-8?B?WmY5NWpOQWc5N3VwQmpyQVo1Q2c3YTJtTkRuSFdBcDdwNU1tODcvdk8rZTJ6?=
 =?utf-8?B?dTkxcnN4UkpFVlpZaTJySk92NERuNXVqMmgwNXYyZDZXUkQxcVN1Q084M0Fi?=
 =?utf-8?B?b2M2RlEvUUFFOS9pUHdKVDIwc2JKVW5BdDltWFZJQmRwOGVFYTVjbm1aSGRu?=
 =?utf-8?B?cTNyZjBKTGR4SmdCTnZIenl0VmZrV3ZjTWpGdGsraHAwSURBT1JBN1RSTEZt?=
 =?utf-8?B?Tysxb0ZZNTJNOGlYcVo1Zkp6SDhPS1FPZW1IK21JQ1ZtTnJwWGtNLzliVHlj?=
 =?utf-8?B?VWZFS292VVdzQ1M4Y0I3SnMzOTZmQWtkMUpWSTROaHg1REM1YlY4UUhTSkE1?=
 =?utf-8?Q?HWZKXYqk8kFxLzi9sFsHrz6YK?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1290477a-92f5-4247-a28e-08dc807bed6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2024 07:41:33.1857
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DdXigPXTo+tf+pDs/Ed9neQLKM8qLAzhETQoaYUACOhOa6eKEUO+b+oHAmrfjt8Hc6dJDjYJ/3v4nvNDesftTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5143
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc3Jpbml2YXMgcGFuZHJ1dmFkYSA8
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogVGh1cnNkYXksIE1h
eSAzMCwgMjAyNCA2OjI1IEFNDQo+VG86IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+OyBa
aGFuZywgTGl4dSA8bGl4dS56aGFuZ0BpbnRlbC5jb20+Ow0KPkFybmQgQmVyZ21hbm4gPGFybmRA
a2VybmVsLm9yZz47IEppcmkgS29zaW5hIDxqaWtvc0BrZXJuZWwub3JnPjsgQmVuamFtaW4NCj5U
aXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9yZz4NCj5DYzogbGludXgtaW5wdXRAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRD
SCAxLzJdIEhJRDogaW50ZWwtaXNoLWhpZDogZml4IGNhY2hlIG1hbmFnZW1lbnQgbWlzdGFrZQ0K
Pg0KPk9uIFdlZCwgMjAyNC0wNS0yOSBhdCAwOTowNiArMDIwMCwgQXJuZCBCZXJnbWFubiB3cm90
ZToNCj4+IE9uIFdlZCwgTWF5IDI5LCAyMDI0LCBhdCAwODo0NiwgWmhhbmcsIExpeHUgd3JvdGU6
DQo+PiA+ID4NCj4+ID4NCj4+ID4gPiArCQlkbWFfd21iKCk7DQo+PiA+IEkgdGVzdGVkIGl0IG9u
IHRoZSBwbGF0Zm9ybSwgYnV0IGl0IGRpZG4ndCB3b2suDQo+PiA+DQo+Pg0KPj4gV2hhdCBiZWhh
dmlvciBkbyB5b3Ugc2VlIGluc3RlYWQ/IA0KSGkgQXJuZCwgcGxlYXNlIHJlZmVyIHRvIHRoZSBp
bmZvcm1hdGlvbiBiZWxvdy4NCg0KPj4gSWYgdGhlIG1hbnVhbCBjYWNoZSBmbHVzaCB3b3Jrcw0K
Pj4gYXJvdW5kIGEgYnVnLCB0aGF0IHdvdWxkIGluZGljYXRlIHRoYXQgdGhlIGRldmljZSBpdHNl
bGYgaXMgbm90DQo+PiBjb2hlcmVudCBhbmQgdGhlIGRtYV9hbGxvY19jb2hlcmVudCgpIGluIHRo
ZSBhcmNoaXRlY3R1cmUgaXMgYnJva2VuLg0KPg0KPkxpeHUsDQo+DQo+V2hhdCBoYXBwZW5zIGlm
IHlvdSByZW1vdmUgbWFudWFsIGNhY2hlIGZsdXNoIGluIHlvdXIgY29kZT8NCldoZW4gdGhlIGRy
aXZlciBzaWRlIHNlbmRzIHRoZSBuZXh0IHN0YXJ0IGNvbW1hbmQsIGl0IHJlY2VpdmVzIGFuIGVy
cm9yIHJlc3BvbnNlLCB3aGljaCBpcyBsaWtlbHkgYmVjYXVzZSB0aGUgYm9vdGxvYWRlciBmYWls
ZWQgdG8gdmVyaWZ5IHRoZSBmaXJtd2FyZSBpbWFnZS4NCg0KVGhhbmtzLA0KTGl4dQ0KDQo+SXQg
aXMgcG9zc2libGUgdGhhdCBib290IGxvYWRlciBhdCB0aGlzIHRpbWUgbm90IHJlYWR5IHRvIGRv
IGZ1bGx5IGNvaGVyZW50IG9wcy4NCj4NCj5UaGFua3MsDQo+U3Jpbml2YXMNCj4NCj4+IMKgwqDC
oMKgIEFybmQNCg0K

