Return-Path: <linux-input+bounces-15533-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B9BE5FDE
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 02:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66AE34E1E8E
	for <lists+linux-input@lfdr.de>; Fri, 17 Oct 2025 00:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA62433BC;
	Fri, 17 Oct 2025 00:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4T+TmH9"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA5168BD
	for <linux-input@vger.kernel.org>; Fri, 17 Oct 2025 00:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760662381; cv=fail; b=SqJZzyV4zoOioNrW7Gp1jO3BMeFuIhD3nI076kmrXwSaR5Dq9VgmDoAWBidwkQJgC1BhU1d6Ps9cWumQcCsweRuveyrLPzx+K1ghond+3NzcsY1qSjRzmN9yojiz+9NOaQ1AC0dX5gyDizW1HYs/+Gz7IlfF09XcKGqWOiLRylY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760662381; c=relaxed/simple;
	bh=mdGc+1zmXxq8JPkE2gzs761825Azf6GKg2b9K32e6BA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HDFoq9ikayOn3Fy+vcZ+3WnRBXFLA2CUQDg/LpUW7bH6T2Tje0Za3ripcgxudQRS1jHS6GTuNghG+RJnwKSH6AD0rukTEwopsaA4NFjFUjkVLUVH45DsRueEf7JuiQtzszZOy06GVg7bhGKZGMAlyc/PkPNEcyoRHCUCat3eLck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4T+TmH9; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760662377; x=1792198377;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mdGc+1zmXxq8JPkE2gzs761825Azf6GKg2b9K32e6BA=;
  b=G4T+TmH9lNXiFI2mYX6NJKRQ66ksak9xyDQld8+LJaCCrax3obkdB98F
   dEKsdajno5RcJsvNUGqxgP7y3y2Ya8yxGyNW1JBSmyCEN2E1jCfZU5y8P
   KJevEhqyCUXSFyI2AEPTU4NRLGLlRrVlpOnmus/kVpsTeCHqJ3x/GMjhY
   wNmqHyprUayVXgmk29HfTpcmmysdBjbSf649X58TX5JQ4qVnnakddWPQ9
   FEJoGUHEFQ2t7TKD+lae3dnDuXau0mTfGGKHvDxOS30VHsImrAzd5fKr8
   hriXgo9Y3IO+ySABLMRI7bjeoyUQVNUosXk8AlVKG1R25znjHrlTCJTUK
   w==;
X-CSE-ConnectionGUID: e0lyUKHTTjGVlA1MlCDn6w==
X-CSE-MsgGUID: TW+KxT9VRDyqgtZU0EJInA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="63015204"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="63015204"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 17:52:57 -0700
X-CSE-ConnectionGUID: mJLblEeJSjeYv4mjZxRZ9w==
X-CSE-MsgGUID: R4Zur0jeTp6lniqy/0WF/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="213573139"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 17:52:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 17:52:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 16 Oct 2025 17:52:58 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 16 Oct 2025 17:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQnGFDu3HW1u6lvzwpb/NBTkqrxp5IDDsDYPeYsPA5C0waA3UZSM+A+RwimGPFYdeppnl/hzQsjQ1jxwob6fw1h6byiKfAoR8rqomZoQzazymZXzur5nBZEbSHSMSXTvMVu/q0HRToJwuJIgfhTwtb3VPJ4FKfzP/I7dIZGm1vqmdoF3ZCmw3+FWUAcRdIyMjTM1qEL+H9b/F7wMm3EZryKw7t1dfK15f5oOhGQbJxc6ERmIlvTD8z4u+oSGmW6fFsJHDfee0V2oWp4qmGjXfgorZ0swWWwtG2zrvpg2SgVgoQHdzHYGuUUF4u/ljTHsoBZz5znSFRipgPUtx9xN7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdGc+1zmXxq8JPkE2gzs761825Azf6GKg2b9K32e6BA=;
 b=uPzZ9SALUwG9Qm1CfdD0De8JfasPO7ZC1amI0Vihc54GY7CpS6j+jHTaniVG/cKQ4VPthE8QCJ1agvGFZ141SNBKM8eE3Q5twkBFTU1oK+CE5q5K6WcuIwyhMKSOH+NV4D7U5qKF8R4XzR8HQ6j2b9gLEDQMc2PaAGuuKwUZxsur0zGy5hE+AXZIq5394RcR1Qv1+XWJgEWf1ph2OigXrqwKBjZ0kNbtlnk7K9l4ecFkZYGedVW9R/uLsZcSfKFUiO2aMo9qGGGvpX3LM1f77b4Uj7S/eq0INg49ALyeRs52Yoa06xJm4N3tKyhGxF2gJlBGZpH8RmFAC2uadHKrNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com (2603:10b6:a03:3ab::12)
 by SJ0PR11MB4989.namprd11.prod.outlook.com (2603:10b6:a03:2d9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 00:52:51 +0000
Received: from SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9]) by SJ0PR11MB5613.namprd11.prod.outlook.com
 ([fe80::615c:ca2f:d093:16a9%5]) with mapi id 15.20.9228.005; Fri, 17 Oct 2025
 00:52:51 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>, "Wang,
 Selina" <selina.wang@intel.com>
Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
Thread-Topic: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues to
 prevent resume blocking
Thread-Index: AQHcOam/jRZgMRgboEGE0l34h8RalLTBpwqAgAA0O4CAAI5w0IAA3TyAgACwrmCAAIKGAIAAA6DQ
Date: Fri, 17 Oct 2025 00:52:51 +0000
Message-ID: <SJ0PR11MB5613633FED22CF81D63208EC93F6A@SJ0PR11MB5613.namprd11.prod.outlook.com>
References: <20251010055254.532925-1-lixu.zhang@intel.com>
 <0r41p984-7qq4-4qp9-s175-1o8q6o7999o8@xreary.bet>
 <3396dd7eecd24a95d63f3ae6655c3efa553028cf.camel@linux.intel.com>
 <SJ0PR11MB56134BF6170CD82795EC2F1B93E8A@SJ0PR11MB5613.namprd11.prod.outlook.com>
 <8nr40316-26r2-6893-qqpr-rq37p2nsn7r2@xreary.bet>
 <SJ0PR11MB561382CBA96A7591BABC6FB093E9A@SJ0PR11MB5613.namprd11.prod.outlook.com>
 <46948s8n-10q4-44rp-qs7q-q0qn1oq2pss7@xreary.bet>
In-Reply-To: <46948s8n-10q4-44rp-qs7q-q0qn1oq2pss7@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5613:EE_|SJ0PR11MB4989:EE_
x-ms-office365-filtering-correlation-id: be458178-cbd2-4f88-80eb-08de0d177fc4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?mZZWPXrNTm7usuqQJyInUTWZngVVMxCy8nWGUhZe7sR7hmz6WkA91OrCMOXC?=
 =?us-ascii?Q?3ngmxuz/D0A0JzhKeM21chu7hHSbA4ApAgC/A//EVgDdV7CXFCPR2rSYNymX?=
 =?us-ascii?Q?UWLtWzUpG2k8/BjWglRKpF1zvPcVkMVBM46meqtV7CVaL6ayG6XBM+6jpGV+?=
 =?us-ascii?Q?aCpnKsmGWuc0XuNvT99/fd5Lqf88V6bZclTnrPLNycJ6ubgkNaFF1PZT8i8T?=
 =?us-ascii?Q?LJVD1fpzuBIE8Av2G4aMaYS9FsrP1KJgfDQexu4kUU5Yi11VeY0GCPHTz2Bk?=
 =?us-ascii?Q?vSEyhGn42t7fOejpa+L6ZcNgZlOA2EuSz1e7sDSKyFeb2P71MLIViBBIxfEU?=
 =?us-ascii?Q?mJF6iLa2cmNFYXQNCh6xr/s1wiTmjmGMNTHHZnSqbzvm1imhp0lbno9U36SZ?=
 =?us-ascii?Q?hFMIK0v+hyswBArZ9TyWT2qaeWC+h9B0x2tGBbJrUITLEwBksMdhrhRkqcMx?=
 =?us-ascii?Q?LtQlUOMD7u0uhsv23DOy9lk+2l7p27CCtehwrFyH/5Zp1gEiaDcb3aLOLboF?=
 =?us-ascii?Q?SsYXB0X+/clsnOOeSTSzSwcF3tVp8omf2UuDGE8mm6ZTkFbPoTARq1rOREld?=
 =?us-ascii?Q?qOucM1slCnW/W9pSocrIUzKmfUlczXnBuQa3Kz+s0CdCaj2reVUO7iGb+R7q?=
 =?us-ascii?Q?0ntobf0+GecoE4kNwNZ7prnkMEi8lCDbFm1osPkWelMQLL1NTVQujN+grIgU?=
 =?us-ascii?Q?B7yLC173gDTdqzMva/VJB3VUuaxwLVK21Jb+m+NWpAnv+WW02VuV+0oYdNBl?=
 =?us-ascii?Q?BGNl4DISoiBGyw9h5eSqra5O7Awiz3ZrnHigmFqLDJscRYnt2I4CPskPGN4T?=
 =?us-ascii?Q?MpJX2Z1nSIKs0cu1mMdT/xep973dtGoIPwNa4wlPPIS+f0BYB+PCJdc1sBTM?=
 =?us-ascii?Q?lD93E7k65+YbJv1xRkSV1/hdszTWqFLKYSuyZnj0SRCvG4luBLgfhK0iz1ct?=
 =?us-ascii?Q?6/R9eFLgPEkVkckRapgAMT1DGVM7dyVO3/PxqdWrgCaUu+dopru6ZFSgRs3s?=
 =?us-ascii?Q?J+6oQWpZgMXwomIQQpuPl98wwZ3FEjhWH4dj1lcfxSzHRbJMVLXawMZOBxmx?=
 =?us-ascii?Q?jBAfT1zzqg1DDprhvxbUrvXCBbh8sDxP7YIYS03ePdoaM/clfDlCXvELjIP0?=
 =?us-ascii?Q?aUyO/hNPSJs3xBuy2LI70blAyZKppHMYhSeShMP06M2YZerTair5sg0DIt5c?=
 =?us-ascii?Q?zeOLt0I9HdB0BrxVTZXW1ocULCtTEeHsmmKyQpnMiMiyqMX6RgzLwAs3el/Q?=
 =?us-ascii?Q?FedRftz6lXpDnDUrYQ3CkB/WDxsQyh97fVoq1zAQ2DoqODJXV1Ee26WuNwhw?=
 =?us-ascii?Q?+GudUwn3z17GaOKKhy77/DXNWa90PIZohomgyNS/HqTNFwdX6jz5A1e6+262?=
 =?us-ascii?Q?MZJzPK000tbZtRAG1VKx1v7DFM7JX9l1W5Q0i+zDYf9UJSM9hEO4KDwMMmqr?=
 =?us-ascii?Q?hW60H3Rmi8OC1UduZzh/4Kq+gRLWZbg754+srMiX/mTMhrOdAsjw2QpiOHb9?=
 =?us-ascii?Q?vwC+yE/YzE5KIAr6d0m+hGhmntxVnalIbHZO?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5613.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6k9BRtEbLgAtj3LYXat4YUadGSVLgX6eG5h0YMIoBueEU9QIuh1XOjh0hTnj?=
 =?us-ascii?Q?WModlkCPVS5LgsviMUUPw0l2/9mLxwC0BGYyE2ueEgZULTQ1N3HOiLISDKIs?=
 =?us-ascii?Q?lh/kn3AxMbha6sMYUF5jFtphVlzcQYHhCHY2JtEnFjc+dZA7KXf4ylXChTZx?=
 =?us-ascii?Q?G1YlJKpPZTwogSSwq7yuaYzfAvNskqElsEunnS43DnO3matC6idwTOHGlPKX?=
 =?us-ascii?Q?ftf860WtvB6ItCBnaqc39B66y+v/JJylpEU3MHgbl9l/2b8AW67tiKajG98L?=
 =?us-ascii?Q?LQEMJYbVTYlA5fUn3JyMd9rfBjUXSc/wg1AKln/VOmBNcBLGlorgrPq2lWOJ?=
 =?us-ascii?Q?mtivHTHuTM0mF+V0vI7s/jkWOxzzgdALZgfx0CdcaO7BoD1SHV71fndLmqFa?=
 =?us-ascii?Q?D2iFXpQQwDOkydkBAW98wQ9CcW1fcCxJGZg1Hl7oJ3sJxa1IKeoRXXArqJRx?=
 =?us-ascii?Q?XLG3hYVAFuwMR7+2GTOS8Ja6/sSx+vo7192VU+kSXulkoxqhTA3F6hjz+L+p?=
 =?us-ascii?Q?I5TSODWrWe4Pd9R4uRV0SYIoCefWBpgme49NsJPJmFQR7uZsDp1t3Sh6x8Ov?=
 =?us-ascii?Q?yloTUMWZrmSweXE+5WGD9Rm8VPl7au+zBw/DufzAz4x75hth+YuBY5O3Dlx5?=
 =?us-ascii?Q?oJgJjHi11dCJBRAeNHP2c7HwlJpjExdTaqy4IsuJ+b46XNlh7Uk/+hATsfm8?=
 =?us-ascii?Q?dCSKkFfjHXAFkDiESC1iGdRMUiL5RmuTqHLQgGTSsAInsSgOmbH69AO2fldZ?=
 =?us-ascii?Q?O7gXrFkyc5ikN2V+tClD1IXXltIJjgbQXi2VxSX5Nt5GyfNq/hBNzfbfNvdE?=
 =?us-ascii?Q?fgBnJ1hmcUyEJvOIIXmfqg0ffbGx9NYVkaWDLuAQfNGrExi/F6/u+G6N2nKX?=
 =?us-ascii?Q?tdrkUUNcH0U7P4tuZMDvbN8YM1zu1E0WS/gIqYPT/ZjR+hK+1f0QJXSsJ0bu?=
 =?us-ascii?Q?ecdNfMQJ6j0fYNRD62Y8WpB8T1ySuzr8OWM6QGZVjtxoIYygbvsnskfgPKD0?=
 =?us-ascii?Q?Eh85fXO5c293AJbVH7p+zp1oqOWwpzFpbp4LfiWGjecy2boIV5U7uAEKKcM3?=
 =?us-ascii?Q?HHkwn8+LVZuybXrPa/Ix0Afdg/g3m/CH1OCx0cdNx8t73K8POsNnU0+zaNid?=
 =?us-ascii?Q?btJPrWqlQYbwNB2afz0jlN34nCMtRQ9ZPfI3bNGd8JfWPw0ri5/Xg+zCMB1k?=
 =?us-ascii?Q?7a+LHcQSuEFwIZnpQLpaf7ru0XJSobWty0BZW46NVk1dG6PUamfRoMyumewo?=
 =?us-ascii?Q?9PcEINiIDehPsXHy/lKts+DIkle7litYqGETnDff54VKyhxHVaQA3Ep9gHrT?=
 =?us-ascii?Q?yL4O2GhU3hWzwbljgQDOCGv5a/ZEiNlVjfYhFKtT7oSyUwoh2/5JNdCxuexX?=
 =?us-ascii?Q?Fm2/+rBO37EoYl2JZ59KiUTqI0vkNTRSwf+3smax8H58xHdUkL29WcMqDzVU?=
 =?us-ascii?Q?6h9qUH8Dt5ok7ayouvXoxNXnDdXOoadCVj6Dj4/wE08XIeRZNP0z8gg2udYP?=
 =?us-ascii?Q?fKcQjSlGGNR9vzCrTrGZ8qBdC1bL5XHj8vXbQzydV3NwTqqSHREQKFiLntFA?=
 =?us-ascii?Q?pMRareH5TGlgD7by6emUTUXHdCgboPFfCQFzazxM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be458178-cbd2-4f88-80eb-08de0d177fc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2025 00:52:51.1947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a59h6hYzRFu/1u4Sev6veHby4smarx/Jp/sNCXemW+WaVZJtAe7FXeqlr2PdxiuVldUxYzSWebvVwihnkQi33A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4989
X-OriginatorOrg: intel.com

>-----Original Message-----
>From: Jiri Kosina <jikos@kernel.org>
>Sent: Thursday, October 16, 2025 4:28 PM
>To: Zhang, Lixu <lixu.zhang@intel.com>
>Cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>; linux-
>input@vger.kernel.org; benjamin.tissoires@redhat.com; Wang, Selina
><selina.wang@intel.com>
>Subject: RE: [PATCH] HID: intel-ish-hid: Use dedicated unbound workqueues =
to
>prevent resume blocking
>
>On Thu, 16 Oct 2025, Zhang, Lixu wrote:
>
>> >
>> >We can definitely do that. The question is whether this one should go
>> >in right now for 6.18 still, or we queue both for 6.19.
>> You can queue both for 6.19. Thanks.
>
>Could you then please send me the power management series rebased on top
>of it, and I'll create a -v2 topic branch with all of it together.

Sure. By the way, I have made a small fix change for power management serie=
s.
I'll squash it into v2.

Thanks,
Lixu

>
>Thanks,
>
>--
>Jiri Kosina
>SUSE Labs


