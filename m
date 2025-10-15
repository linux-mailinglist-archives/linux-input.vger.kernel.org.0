Return-Path: <linux-input+bounces-15488-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D5966BDBF83
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 03:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 957384EFFD3
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 01:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF771487D1;
	Wed, 15 Oct 2025 01:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdWwbjrJ"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3171D1A256B
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 01:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760490922; cv=fail; b=YzghPB4uLR0JBZkmDy4DionTuHajbajb4QNGJFYGSUEzAS/oXqPVaxLh6VOJBgajgq6JHG7sQc5A81VzV0zQmskAakAffZO+nFNdF15eAN/uK5XMz615NRcCvQCLBYN+TvRD1RstQXkOvshLueV8DmuJkYOSPC9ko9L2f0O/PLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760490922; c=relaxed/simple;
	bh=QB+ynn6A61EMGZzEoaVg63UVyv5unJ2hdDoS7//UWqc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sE81JLGr9c5EdFHSlFUAVbZtd1v5iX/YTpcvMp3ouRDqC2ypeVCYNDMBThf+AclHF9EwPBU79URtD5z3DoN9XD3SkAajRC6VYdjO9i4bea1S3PWS9/HKOw4eLpOZ/XAdf2nEndy3EP8OXP6cZtYblqpTyQQitefiKJ/I18bGaqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdWwbjrJ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760490921; x=1792026921;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=QB+ynn6A61EMGZzEoaVg63UVyv5unJ2hdDoS7//UWqc=;
  b=BdWwbjrJGEDQLgDTqlhyaNw4C5oquQSDw3E8orofMBowiputC6HnMXmO
   gO1w4z3VxJsjgr7eDvIWidPti8rI6ANj6x3HsO83bLWPzaiiGIa7+Q2Nk
   2PzA+nDhPj3X2J9LVjJbad7ZLQ23sHEQ5Z+5VXC2ek6+5XUhMlow7o/AG
   6N+X8uxVkdK8pKD8TudpGRKBDeb1HB6kRbPKaZOf2jHfF171juaU+aPbV
   iJQvmUoNqnGLLTivEd5J17R/yXvLOl7CAXebLG+vm07JHxnVFED5taxcV
   fe3XjsxQajR2OJuH7rooAcAkWUMDc6hyYMLQ8uP6WcJ0tw0dnCnJiF1c0
   A==;
X-CSE-ConnectionGUID: Eaod0M51RPSFcVLkTnOC+w==
X-CSE-MsgGUID: qBTzHs27StSdOYIGUFYDOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="73336172"
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="73336172"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:15:20 -0700
X-CSE-ConnectionGUID: ODUtmU9ZQVimx2DLTtuiZw==
X-CSE-MsgGUID: kJBojWF/S6Kfs9KFrFBxBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,229,1754982000"; 
   d="scan'208";a="219170690"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:15:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 18:15:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 18:15:19 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 18:15:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AA+pyvB1XAUxs9ujicWq0NJKLa5WJ/Y+hMbxpRJM5Zu3nV9ar/up+XGIRYe0K5qEpQShupMvia6JiDfJ74czGvGjBVmbMTxrATA6RuNWNS7Hi8QIJNw/qthGTP7GsZ+4lPYdn9mhJpmHVeUcfIgE/AeX5lUugZE4FAR4JqzD3lBhpk8AHpSuJE8GMT7RP7ugDLqGETxYWLX0qOQnzNApHN5W8AtTRouesC1EHFpAizGy4ZKQVJa60gS+cWnDCZvT5EKwHhQLf7O9Tmj4fH7UsfzQwIVlZeAesHeIj92UdDnXY/92dBwcttPchfNSnui45bGiig+piIpnqOgQV4u86g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB+ynn6A61EMGZzEoaVg63UVyv5unJ2hdDoS7//UWqc=;
 b=N/mCh30N/fw/bZH1rmEQJPxkVIhaA7OXk9sPysqm7fx43mnTNtYZ1xKvzmA+dLXCiGFYnG7RbwW47TYFlerQyYDFQ02PzygI0dxJXje11V6r7XK3Hiq3OcSaC/68DrvreYrbU6sDB6pFGMKVUYCyYfg+Xm1wUT060OFh4R+Gy863rFSqSOUc1qQS3/MFhkX5yOKNz/KI69l9Qbtvb7Mz5PltlY+t0Gn25KkMyyP6XHSunhA9WrwC9RYK1kOmg2tnej3TSpLVE4orBkOt2s1Mj0lfsZeljrbdYNx8Ct9unqZbmbS4LUEtwAsSvWv+DYJD9mgOX2II2UPtl8hHuswR1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Wed, 15 Oct
 2025 01:15:17 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.9228.005; Wed, 15 Oct 2025
 01:15:17 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina
	<jikos@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, "Wang,
 Selina" <selina.wang@intel.com>
Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
Thread-Topic: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
Thread-Index: AQHcOam/jRZgMRgboEGE0l34h8RalLTBpwqAgAA0O4CAAI5w0A==
Date: Wed, 15 Oct 2025 01:15:17 +0000
Message-ID: <SJ0PR11MB56134BF6170CD82795EC2F1B93E8A@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20251010055254.532925-1-lixu.zhang@intel.com>
	 <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet>
 <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com>
In-Reply-To: <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|SN7PR11MB6750:EE_
x-ms-office365-filtering-correlation-id: f243c1e9-cfdc-45a4-1f52-08de0b884d25
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UTBGUmYweTJTQ2VJSEhmNkNRdWxIUENuQjdIWUQvMjdUdk9TOTF1RnAxcytI?=
 =?utf-8?B?eXBDWWltdnJ3ZTlrSzNGNlRPZXdXckI0M0pwZXZUOWJCQUNDNTZPZFZ0V0NT?=
 =?utf-8?B?V3F1NFpSdUJBbW9UWndZZzZySGc5UEJVMEtGdHh6aU1JRTdXMG1nQWN4SHlX?=
 =?utf-8?B?NHNTalJwMTduTGxYN1RZMUI1M2QvS0h0ZXNlZlJQRFgwYUxnWEcxemZZV3Mr?=
 =?utf-8?B?VjNOdEdLV25ZcXhwMEhkZG5jU29jUW52amNONHFEQlpTT241UEMwc1hIZ1hr?=
 =?utf-8?B?SngxSFlJQzhwdFVZRi9mN1hJWk16M2tFdnFKQUxyWGMzdVY4SU14ZnlFOXgx?=
 =?utf-8?B?RGRiN3JCMFgyOGlMNThEd2xRUzUxOHlGa2lQeGNNeUVXSERKQ2NWek94cmIz?=
 =?utf-8?B?eEdhUDNCL053c1ZlMyswb0NWMVowa2lPamwrZmdSV09RTnBtSDNKb0E3a2dn?=
 =?utf-8?B?RnhaTFBlUkpxZWZIMVhGVTNXc0JUTGozTTF4NVZ4dGNoQi9rajRvZ1JWMHVN?=
 =?utf-8?B?a2VWVTJvUC9Fc3V4aDJoV3htVFl5Z2VXZVBVdFUxOEtrUXpZSUwrcUtCL0ZQ?=
 =?utf-8?B?d2paL3dwdnR3dm9ueUU3Z2FtUjVROWk3cTZwS1NyWXNKQ2VJWDJlQzM4cGsw?=
 =?utf-8?B?MmdGNHpqWGlxSytybytBMXZBbnQ4aW42am5Ja2o0Y0kyZUN6TFJUYnQxTzFv?=
 =?utf-8?B?VGJtS2hHbDg1UkFURW91UkJsSncvVi9LU24rQmF6MmxtY0U3SmpHVEd0MHk0?=
 =?utf-8?B?ckZwQ21QOHZmSHNZL3ZkaW9LeFhJZmJNR3lta2xTdGpwODJnbU43bHlKWWQv?=
 =?utf-8?B?MHZRSHUzNE9VRVI3U2l0bUJwamVNT29CZDgzeHdxYmhvQWhQbGt6TjFGdFJJ?=
 =?utf-8?B?eGw2cVQyTXYwMnhlcnhNZzNUSzAwejV2SUhzQUpNbzNCaVZNc2ZaellCMGtC?=
 =?utf-8?B?RkpBMGFxbXVrNjZpajhJdXFMUHVtNmFOUDFnSFBCdDZyd3E2QUtveWxHSmdp?=
 =?utf-8?B?d3NWNDUvMEh2OVQweklEaHBJZlZJNU83YVlSS3R6Q2Ixd2srQ3Q5R1RIeDRQ?=
 =?utf-8?B?ZHBJcE45NVg4am5qZFRwR29EQ2gzdFM0RENQb21mSFl1RDdZWjdmNi90Yzdx?=
 =?utf-8?B?NkV0aXlhVktTaXVSdmthdlhvb2o4N0oyY05kOG01UjBXSEgwdTRYUG4yZmhF?=
 =?utf-8?B?Yk1HRkVZU2YvYXozOUVJVjZrN0tuMlBVbFZTNk5lS1c1WmlrbFdOaGxVbXNk?=
 =?utf-8?B?Y0N0alBhSDMvajNyazcxMGdmNjVlVTJab0VsT0szbUxBM2ZLSEZGYWxZbGRW?=
 =?utf-8?B?dkxFQmdoME4veVEya0JyckZiMTNDU1gvU3QxOHU3aE9lanV5Y2VCOXlkUnpW?=
 =?utf-8?B?bFFWeWc1YnlvVEFRRGhMWmxodlRWY2FXWjRSVTdpNDNBRGJCSno1RWdaTXdk?=
 =?utf-8?B?WEhQQU9TMzlSTW9UaEsveUZXR3haMnkvT3hRaDg5dWl6MzF4TFZMYllWRWh1?=
 =?utf-8?B?N0JRcGhpWFdESFpjc0RUQkI0TXh1Z3NTMFcyUmdwSm5SbnJ0TVc5Sjg4SGVW?=
 =?utf-8?B?cXZwa1JKcFIxZlNZSzE3VXdIZ1ptY0laK0dGVlNiRU53dWxkRFhQSXdkcFJj?=
 =?utf-8?B?YnhiVmtqSVVCT0JlUjROR2E3cE8zVnRiM3dlRW83bENDSG1Bd0p3eDBQVDdk?=
 =?utf-8?B?Y0UrNWVueEVCQk11QSs4dFNaM3dCdENBNnNSb2RiMWlIT3NyOFFVbWZqTThy?=
 =?utf-8?B?azJSb0tuV2hNRUtDMjhUWmg1dndrZjJwRjg2WDNNMVFHYU5IVzE2QjdISjhZ?=
 =?utf-8?B?RDMwZTdLcnR2dTAyTFFsMGtNaTloYWtJTnp2WHNKN0RmYlJKSXN1M2Uva0My?=
 =?utf-8?B?QzlFVE5ranpKdkNzRnk0UWM3TGQ3ajFqODNMcGVrNjM2WjQ2elE4NFpVKzg3?=
 =?utf-8?B?a0VoWkc1aURHR1FIenhwS1RNNXhpWTNUZHlFNysvN1M1UU1PM1lUbzdtYjdW?=
 =?utf-8?B?a3ZQcnJyZDJDb29INzVWQS9IenVCL0FRNnJuRmVOYmY3RzNtcXp6eVl4TzBQ?=
 =?utf-8?Q?7VATD7?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UlRQR2U0dm1FM0htVVVKSWNLdVZpbE84cWs1LzBQYjFuZnlqVlhIclQrNlVC?=
 =?utf-8?B?aml4b2tseUFya2ZVM1hyNWVxRUtwZ2o3VWN4M2VFWkcxdGpVcjFTQ01NL2F6?=
 =?utf-8?B?MVZBd0JObEdhV1Q3WkpTRkhvYk8yM2Vxakd6bWhJc1drQUVIclVacG1uWjI3?=
 =?utf-8?B?cVRLeFJ5Zng3ZzdMbjViNVdJRVNTOHpzYlBjL2JDaVJ5VjdhQ21PeEtJN3JL?=
 =?utf-8?B?Vkk2d25OU1pic1pIeDVoZmYrUmV6WlJlMnlha0FSZ1IrYTUyT2hVY2Zldy9E?=
 =?utf-8?B?YlU2cGtJWkdHZTJFai9SV1hDREtDR2k5TDdTcWRnREVMcnkxTmRLTENYWCtl?=
 =?utf-8?B?bWd2ckdjT1psYmR1MEJXSjVpajJRZER0L2U3SmhxMXFBV0ViZ3pmR0ZTM1Na?=
 =?utf-8?B?VWtMZ3pkNFVuTkpXMFkyck41L3pEY1AyclkxWjJreU5QRFJMTDcrcVdDd2lt?=
 =?utf-8?B?bVIrcXFNLzhJMWIzWFBqaEtIMVAweEU4UXJsVWI2cGpHSUNlUW5Yc2YwUXZr?=
 =?utf-8?B?M2IvMWhWOGZFcHJSVktyVVVlQTBFbGtuV2V2NjBTcitVSi85ajk5L2ZINEJp?=
 =?utf-8?B?eTk4b2h6ZlY2VDRUZDJ5VUk5T0hkOXBsWTRCTVpJQkZwcTRoNFloYzg1cjVz?=
 =?utf-8?B?ZlBEbkF1NnpWVjZyRUNXTnJMVjRFanY4Yi9CbnVxSmJyUWtjdzMwYnJHUUY5?=
 =?utf-8?B?YzcxekEyQ1RNWWZoYTZqRVhpN1BmOEszUzYzZ1hWRURvWkJaZThqaHlpKzVz?=
 =?utf-8?B?bmIwQXNEUXdKdThmWmdWOWJZMWRPcUtsekVtTEpUc1h6blpNcFF1RWk1amJs?=
 =?utf-8?B?aDBRSkxEOVZKS0RoemgxREVUeUFWZkViWW5BeEhjbDFBZFJuWDIrRmNsTHZs?=
 =?utf-8?B?Z3prSktsaEI3UVZ1WEV4eHRkWFVoNDlQRnM1cDJGQlRLbnJHVEVFNU8yeGxl?=
 =?utf-8?B?MEpBNXJxMUlsWVpqNE9wdWN5MDhQRVFtY3RwbUU0ME5sbHdPd053NDhVSzM4?=
 =?utf-8?B?L0pFbkthU2pFZEFFdnBQT1NQcy93Q3RwdGhUemVuZ2ltb2JNNW9iSS9hQ040?=
 =?utf-8?B?bnIzbXBZT2pNcnE3N0E5OFE1alkwR2pyMGlFcnJtVUlHY3NSenFRVzFTWENP?=
 =?utf-8?B?TGhIczlmNXNwaW9HZ1lLZ2x3Z0FZMDlzL0JzWk5jSjRkTDdvSlNaa2pMbXIx?=
 =?utf-8?B?cDAyNHZqNXk5WEpkS2h4UGQwMlJpT2FnQjVxeUJnZFVIckZtaE9qZzNQb0cw?=
 =?utf-8?B?M3Y2N2pjVEZIZUZVeWVaYWhjWmh2czNwTTI4aXBUNmlYR1d2SjhCNXhOaVN2?=
 =?utf-8?B?TXhpVmdWMjNPRzVjRU5UMHpkSHlJL3o5N1JnSml3THhnaFVrWlRlTGVMaUtx?=
 =?utf-8?B?aUNiR2hNaWRicXpCUUMzSUxGUHZYaVRkZ1JScTU4eDRNY0pzQldxY0NZV1pW?=
 =?utf-8?B?M1Fnd2d0RE1DVHdwWWNjU2htZHNyYzk5UmdtWFdYZE9YRlhyYktvbk1TaWdx?=
 =?utf-8?B?Qisvek9RaHQ3UXhLL3ZpaEs3YjV5V2J6b2I0TEZraE1SaEdPSXhuMmMxK0Vh?=
 =?utf-8?B?Q2Z2RnRaZ1VMd3B1bDU5RXI0RmVXUGhpQ1QyeFVGNlNrcld3RmhvVzh2eWdk?=
 =?utf-8?B?ZW1Od3BvZTZ5Y2xsakVYcElsdmtNdktDQTZHRnhRR0t4aDNicS9WWEx5WWdp?=
 =?utf-8?B?TjlSakVteDBJbHNkRC9RYkJ0b1JtcHMyanVTZlJyb2JiZEJPTWhmelN2RlFt?=
 =?utf-8?B?dUp6Njd1Z3lGUzVJOGtBSTJwRVpoNkMvZEcySzliVGlmd0xGYzB5cnd2WDBM?=
 =?utf-8?B?aDI2MCtVTFlGeGFqd1JmODZIOTJYS1gzOVhpZ1k2Z0EwOGNwazk4U3JmK1Uz?=
 =?utf-8?B?UmlsenNVTDVsL3p6aHZLRVdwWnRpVmdzLys1UU1LOEJCSGJ3Z3NuN1ZBb2k0?=
 =?utf-8?B?L0RqblBSbWVtNmpTbXJPMUFPZW94QWpsa1JnTlpMbHZvb0JucHRTd2QxcWtC?=
 =?utf-8?B?cC9LZnJ5Q1o5d1pxQXRZQlhVL2w0N3JkbHRKN0JQZ2h3ZHF0VWowQ0NwVFlJ?=
 =?utf-8?B?QnVyb2xJeCsxSjVJSW9hT3dmdGd3Ym84enJRMXZlOXcrMllhQTNQVlhoNW1I?=
 =?utf-8?Q?sg896XV/eAL6jKtW5oJ4dSyPk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f243c1e9-cfdc-45a4-1f52-08de0b884d25
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 01:15:17.0492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L3CVgZVJvma+Ji3a0phgziLn04BdTY2XDhsIVQ+PrAVQ/OwkI9a49dSHmnJ5InfiimJUxF0AFd/69SrmH5RU+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6750
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogc3Jpbml2YXMgcGFuZHJ1dmFkYSA8
c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+DQo+U2VudDogV2VkbmVzZGF5LCBP
Y3RvYmVyIDE1LCAyMDI1IDEyOjI3IEFNDQo+VG86IEppcmkgS29zaW5hIDxqaWtvc0BrZXJuZWwu
b3JnPjsgWmhhbmcsIExpeHUgPGxpeHUuemhhbmdAaW50ZWwuY29tPg0KPkNjOiBsaW51eC1pbnB1
dEB2Z2VyLmtlcm5lbC5vcmc7IGJlbmphbWluLnRpc3NvaXJlc0ByZWRoYXQuY29tOyBXYW5nLCBT
ZWxpbmENCj48c2VsaW5hLndhbmdAaW50ZWwuY29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0hdIEhJ
RDogaW50ZWwtaXNoLWhpZDogVXNlIGRlZGljYXRlZCB1bmJvdW5kIHdvcmtxdWV1ZXMgdG8NCj5w
cmV2ZW50IHJlc3VtZSBibG9ja2luZw0KPg0KPk9uIFR1ZSwgMjAyNS0xMC0xNCBhdCAxNToxOSAr
MDIwMCwgSmlyaSBLb3NpbmEgd3JvdGU6DQo+PiBPbiBGcmksIDEwIE9jdCAyMDI1LCBaaGFuZyBM
aXh1IHdyb3RlOg0KPj4NCj4+ID4gRHVyaW5nIHN1c3BlbmQvcmVzdW1lIHRlc3RzIHdpdGggUzJJ
RExFLCBzb21lIElTSCBmdW5jdGlvbmFsDQo+PiA+IGZhaWx1cmVzIHdlcmUgb2JzZXJ2ZWQgYmVj
YXVzZSBvZiBkZWxheSBpbiBleGVjdXRpbmcgSVNIIHJlc3VtZQ0KPj4gPiBoYW5kbGVyLiBIZXJl
DQo+PiA+IHNjaGVkdWxlX3dvcmsoKSBpcyB1c2VkIGZyb20gcmVzdW1lIGhhbmRsZXIgdG8gZG8g
YWN0dWFsIHdvcmsuDQo+PiA+IHNjaGVkdWxlX3dvcmsoKSB1c2VzIHN5c3RlbV93cSwgd2hpY2gg
aXMgYSBwZXIgQ1BVIHdvcmsgcXVldWUuDQo+PiA+IEFsdGhvdWdoDQo+PiA+IHRoZSBxdWV1aW5n
IGlzIG5vdCBib3VuZCB0byBhIENQVSwgYnV0IGl0IHByZWZlcnMgbG9jYWwgQ1BVIG9mIHRoZQ0K
Pj4gPiBjYWxsZXIsIHVubGVzcyBwcm9oaWJpdGVkLg0KPj4gPg0KPj4gPiBVc2VycyBvZiB0aGlz
IHdvcmsgcXVldWUgYXJlIG5vdCBzdXBwb3NlZCB0byBxdWV1ZSBsb25nIHJ1bm5pbmcNCj4+ID4g
d29yay4NCj4+ID4gQnV0IGluIHByYWN0aWNlLCB0aGVyZSBhcmUgc2NlbmFyaW9zIHdoZXJlIGxv
bmcgcnVubmluZyB3b3JrIGl0ZW1zDQo+PiA+IGFyZSBxdWV1ZWQgb24gb3RoZXIgdW5ib3VuZCB3
b3JrcXVldWVzLCBvY2N1cHlpbmcgdGhlIENQVS4gQXMgYQ0KPj4gPiByZXN1bHQsIHRoZSBJU0gg
cmVzdW1lIGhhbmRsZXIgbWF5IG5vdCBnZXQgYSBjaGFuY2UgdG8gZXhlY3V0ZSBpbiBhDQo+PiA+
IHRpbWVseSBtYW5uZXIuDQo+PiA+DQo+PiA+IEluIG9uZSBzY2VuYXJpbywgb25lIG9mIHRoZSBp
c2hfcmVzdW1lX2hhbmRsZXIoKSBleGVjdXRpb25zIHdhcw0KPj4gPiBkZWxheWVkIG5lYXJseSAx
IHNlY29uZCBiZWNhdXNlIGFub3RoZXIgd29yayBpdGVtIG9uIGFuIHVuYm91bmQNCj4+ID4gd29y
a3F1ZXVlIG9jY3VwaWVkIHRoZSBzYW1lIENQVS4gVGhpcyBkZWxheSBjYXVzZXMgSVNIIGZ1bmN0
aW9uYWxpdHkNCj4+ID4gZmFpbHVyZXMuDQo+PiA+DQo+PiA+IEEgc2ltaWxhciBpc3N1ZSB3YXMg
cHJldmlvdXNseSBvYnNlcnZlZCB3aGVyZSB0aGUgSVNIIEhJRCBkcml2ZXINCj4+ID4gdGltZWQg
b3V0IHdoaWxlIGdldHRpbmcgdGhlIEhJRCBkZXNjcmlwdG9yIGR1cmluZyBTNCByZXN1bWUgaW4g
dGhlDQo+PiA+IHJlY292ZXJ5IGtlcm5lbCwgbGlrZWx5IGNhdXNlZCBieSB0aGUgc2FtZSB3b3Jr
cXVldWUgY29udGVudGlvbg0KPj4gPiBwcm9ibGVtLg0KPj4gPg0KPj4gPiBDcmVhdGUgZGVkaWNh
dGVkIHVuYm91bmQgd29ya3F1ZXVlcyBmb3IgYWxsIElTSCBvcGVyYXRpb25zIHRvIGFsbG93DQo+
PiA+IHdvcmsgaXRlbXMgdG8gZXhlY3V0ZSBvbiBhbnkgYXZhaWxhYmxlIENQVSwgZWxpbWluYXRp
bmcgQ1BVLXNwZWNpZmljDQo+PiA+IGJvdHRsZW5lY2tzIGFuZCBpbXByb3ZpbmcgcmVzdW1lIHJl
bGlhYmlsaXR5IHVuZGVyIHZhcnlpbmcgc3lzdGVtDQo+PiA+IGxvYWRzLiBBbHNvIElTSCBoYXMg
dGhyZWUgZGlmZmVyZW50IGNvbXBvbmVudHMsIGEgYnVzIGRyaXZlciB3aGljaA0KPj4gPiBpbXBs
ZW1lbnRzIElTSCBwcm90b2NvbHMsIGEgUENJIGludGVyZmFjZSBsYXllciBhbmQgSElEIGludGVy
ZmFjZS4NCj4+ID4gVXNlIG9uZSBkZWRpY2F0ZWQgd29yayBxdWV1ZSBmb3IgYWxsIG9mIHRoZW0u
DQo+PiA+DQo+PiA+IFNpZ25lZC1vZmYtYnk6IFpoYW5nIExpeHUgPGxpeHUuemhhbmdAaW50ZWwu
Y29tPg0KPj4NCj4+IEhvdyBzZXJpb3VzIC8gd2lkZXNwcmVhZCAvIGVhc3kgdG8gdHJpZ2dlciBp
cyB0aGUgaXNzdWU/IE15IHJlYWRpbmcgb2YNCj4+IHRoaXMgaXMgdGhhdCBpdCBzaG91bGQgYmUg
bWVyZ2VkIHN0aWxsIGluIHRoaXMgY3ljbGUgKGkuZS4gZm9yIDYuMTgpLA0KPj4gYnV0IEknZCBs
aWtlIHRvIGhhdmUgdGhhdCBjb25maXJtZWQuDQo+DQo+SSBkb24ndCB0aGluayB3ZSBub3RpY2Ug
dGhpcyBpc3N1ZSBpbiBvdXIgcmVndWxhciBjeWNsaWMgdGVzdHMgb2YgMTAwcyBvZiBjeWNsZXMu
IFNvDQo+SSB0aGluayB0aGlzIGNhbiB3YWl0LiBMaXh1LCB3aGF0IGRvIHlvdSB0aGluaz8NCg0K
SSBwZXJzb25hbGx5IHByZWZlciB0byBoYXZlIHRoaXMgcGF0Y2ggbWVyZ2VkIGJlZm9yZSB0aGUg
cGF0Y2ggc2VyaWVzIFtQQVRDSCAwLzZdIEhJRDogaW50ZWwtaXNoLWhpZDogVmFyaW91cyBwb3dl
ciBtYW5hZ2VtZW50LCBzaW5jZSBhIG1lcmdlIGNvbmZsaWN0IGV4aXN0cyBiZXR3ZWVuIHRoaXMg
cGF0Y2ggYW5kIHRoYXQgcGF0Y2ggc2VyaWVzLiBJZiB0aGlzIHBhdGNoIGlzIG1lcmdlZCBmaXJz
dCwgaXQgd291bGQgYmUgbW9yZSBjb252ZW5pZW50IGZvciBvdGhlcnMgdG8gYmFja3BvcnQgdGhp
cyBwYXRjaCB0byBvdGhlciBrZXJuZWwgdmVyc2lvbnMuDQpCVFcsIGluIHRoaXMgY2FzZSwgdGhl
IHBhdGNoIHNlcmllcyBbUEFUQ0ggMC82XSBISUQ6IGludGVsLWlzaC1oaWQ6IFZhcmlvdXMgcG93
ZXIgbWFuYWdlbWVudCB3b3VsZCBuZWVkIHRvIGJlIHJlYmFzZWQuIERvIEkgbmVlZCB0byBzZW5k
IGEgdjIgcGF0Y2ggc2VyaWVzIGZvciB0aGUgcmViYXNlPw0KDQpUaGFua3MsDQpMaXh1DQoNCj4N
Cj5UaGFua3MsDQo+U3Jpbml2YXMNCj4NCj4NCj4+DQo+PiBUaGFua3MsDQo=

