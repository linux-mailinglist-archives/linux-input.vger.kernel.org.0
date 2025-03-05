Return-Path: <linux-input+bounces-10545-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF2FA4F328
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 01:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B5E37A1B50
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 00:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D875D8F0;
	Wed,  5 Mar 2025 00:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrRzMqJp"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0D3B2A0;
	Wed,  5 Mar 2025 00:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741136354; cv=fail; b=QZzauhwCPNVbdkL2HiFr26Xb2LWyNV508qQxe68pJyEH8TfMqhF0xe45qbgm3KlVc+uaRIrx+yJaQ7Y51GVMgsEl8l2Cqgc0SE2lTyVMBLJQUSv7xqg7ylWqKPsVpRdnjI85Yov+34F0ht16/UHSfVgcX0SmsoFyHSjVQwO6/WI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741136354; c=relaxed/simple;
	bh=moM2Bv1EcMlVIL68uvuotNaU9u/tQT+RlQJmtZxLnI4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s6sFqs20+qhmzyGwX8JJpTdFcegP7HKUTun2LjokYTeMS8hDlFsQjafApKlqrlQjtaSKJbrM8cCmZ5QZ6RjKME1ahrw1hyRhPQDWn17ieooq4BTaQoboQ7eMX3FDHosr7y/seTqD2nnTEkJjkcaC5VHA/VGb//YN6GO7OGbluS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrRzMqJp; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741136352; x=1772672352;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=moM2Bv1EcMlVIL68uvuotNaU9u/tQT+RlQJmtZxLnI4=;
  b=LrRzMqJp9Hvb0o8S44ByfkD858IVdn+LYDCtEWPqCNd8qdo//gTT1/3E
   EBGXAtvGr6eUijdlvnZzjiXa/kDu91yovlgulRRrtCqc0/+IN3FmptgiU
   JJ/OJaLIWXeqztaSRuFyjAQFXh06t4qqYI+SnTEPMTw+pCEQgjInn43QY
   7VJpbApzT9R+hbVbmEY5rpNC3Ifojej1vPmijyBbhehX0poFBHy8+O8Jp
   pBTJcMn7ngMPEwe3xZww8CJd8iim6U70YPEQnOzJ8twVHUqN7VGU20/sm
   DmYEcTkIVsZd51noz2qrG3nlpx36nyUUWrHCl0J8sLU9Gr8xMH2bZ8ZYu
   A==;
X-CSE-ConnectionGUID: DEw0CPf8RhiivsBkNoGauQ==
X-CSE-MsgGUID: ulfQ2HWWQCOlqNLcuteXtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42213003"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="42213003"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 16:59:04 -0800
X-CSE-ConnectionGUID: hUimLYOwT3SNMfvrH9uBlQ==
X-CSE-MsgGUID: DnPaO0s0SnSPhg1yPN+Ydw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="118552787"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Mar 2025 16:59:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 16:59:03 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 16:59:03 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 16:59:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW/dccLfeOj8cUhFHjQeuc9KRWp3UFVfYWqDuV6qg76AC53CMM0FXCiN6ro7ohkoE4IVZkJSoWeGWgGCpl7jmyauD/uSOEeRVggWlSmmVFOJe4gBvSDF4xFn3R8s4jjYqXfFM/bswAb07P46DDAkDqWwo7qMgiN+NdKRxi5MJLgNZpmiEOCBQpqbJoFETpvKkyFvSdF0Pt5/drzZ4+8E+jSROEfsma9VtciKHxUm18B5ll54MgCu1wQNcYkeBu6q7fnZkkuOGX73L8+oQkUGYfib9c94yc7+IUDPcKmLMwfMpwcdDvaZ+f8X0XWuvKDLos6xeT7lm9QH0nbAgq/K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=moM2Bv1EcMlVIL68uvuotNaU9u/tQT+RlQJmtZxLnI4=;
 b=gOEvKDw6N+OW5C2u0HvMW6tfWUuU3H3CxnrA+WD44CSVRWLecZLGYHWVmDC48PD4oCfnGmSWz+DY4dMoAWQiuQPJgQgtFCXoZeuWHGzBm843rOJeO3FmspWLZW5U4Wwdka4hRd7HtIvnjkXuhbJfe5n032CN1zP4BBiLGU6d3e0x37m6QjCxjjmeKQ22RukIIuqYVUjtzgeraU+qa5Bjvlw/LpBTnoPymEpswrAAdRq4TLKj4k6DLhHj0zpeHVAseIgvIluCS+BzFVzePCjMuFnAY7MTbwEinZ+0g+z1GLGapQSkyEeFy6PkujYYehAo+psaStPCgCf0mBnYNh260A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Wed, 5 Mar
 2025 00:59:01 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 00:59:01 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
Thread-Topic: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correct
 device state after S4
Thread-Index: AQHbjLTcANInlVCQx0+6PVpmKEX957NjdcAAgABCBRA=
Date: Wed, 5 Mar 2025 00:59:01 +0000
Message-ID: <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250304032255.1131067-1-even.xu@intel.com>
 <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet>
In-Reply-To: <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|MW4PR11MB7151:EE_
x-ms-office365-filtering-correlation-id: 20534a49-c31f-496d-9c21-08dd5b80eade
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?GuvocPHMPOR6k3DhBCaohM2INRhiWH0FhG13li0pBccVoj+dLH5LvVLZ/s75?=
 =?us-ascii?Q?Ea6KjV3Fz6zoc4AQ0heRMMUj4KMqXUSJhrSXzinZ0nKAmETgZT7uVE0mpTeK?=
 =?us-ascii?Q?/kOjX+tW51WF+I6Fk4i+xSrzGsWRHjOWXsobMFw/KgVsWQV61UxISbs0todM?=
 =?us-ascii?Q?KDkiR84HRv4rEB0hiQoBiYsk7DJ7ShaVlalhd2LMx2ObmBHkvNLNjurilb01?=
 =?us-ascii?Q?zYWiLL3SwwOh5uwRI7W4iMNN1PyVqdZRcBQiEK0YgrlkOmS0ZVwl/Ke37wue?=
 =?us-ascii?Q?refORmUOe0nRLejc7ufGe9KFTbzHczLA1McVhZlnRXhVHHfcpncM5opccNyE?=
 =?us-ascii?Q?S+7FvLGL8Add7lggrWrJ1o4CMpvl8xltqN/ap3eQ7tfQTDmIGs0kLwIoyEcr?=
 =?us-ascii?Q?7bPyI4jgrN9x8kg4LCDoGcXzg3WZyoaEs1lKNqcFIMxk/YB8kcwnC/ox2Czz?=
 =?us-ascii?Q?lCB7qfbs+/2EVwcp722OlS7oZ7RTLyUMKmWQgcx6E41qlDX2jS36ydafezYp?=
 =?us-ascii?Q?lPK16UPQsJlljvqZ0oOn7QKSkR9H0fID2Qf+aIA+ItUJgQAxOnwQAN2Uwvpq?=
 =?us-ascii?Q?5wXt8cVukvyj1gAjmN80UQDeyqRRyhRZquy4SFleoNeNf7ZwtjET/iEvyj8g?=
 =?us-ascii?Q?YJQ071Ir6Ydb8wFkneCuXdfKiAo367DVu006Uy3W96rSTuAbAqOPG9Z7UNk1?=
 =?us-ascii?Q?dDCensBVeF1BoRw8w/IX/R+cdxgISkeLpZii1qdexj/s4ypCLNYyldmZ3Chb?=
 =?us-ascii?Q?2BFAxI/+8HPuJ3F2/eibIltLz65ZgZYDS+2b3Pd2za4S1Zsgr/1B2PVk3krR?=
 =?us-ascii?Q?uYIRMjqJSuZSm7dG9CGcpkPmPLFD3NVzeesSebaf7pEIA9hK5BP/KeC6XpMK?=
 =?us-ascii?Q?wDhGPFHsAfMPz0yT2tkyUPmNPjc0Wc2k0MsbyAcbFbZbdOPEzZJURrHYxi6V?=
 =?us-ascii?Q?7WWYc78sIJP5EGpO6M80a4HaO/iMKWVL51MD/11HUR8zqQP973U5tksTEffq?=
 =?us-ascii?Q?cqegHFmzh0d0wgKEu8+GJg289/olnRZVZvjoDRqf65YIp9+WGNHg88ipqmbm?=
 =?us-ascii?Q?8slNONbn0edSy5/C412+jHZvc8X3pZvsXUM0w6SbaMi+hTN5ybhrDBujETUM?=
 =?us-ascii?Q?IWa7RapVXXAta09qzoONTsmFk5ZUJ+QyG62qL+UR4W4YnXD9amb91jnIV/oo?=
 =?us-ascii?Q?3cDJfhoyUbb46Xg+hJYX93v8TFYolviqh1DLe/SR+Z35DTwDXGN/X5aJE2RA?=
 =?us-ascii?Q?nx6QqogkHSLiZTFLO2cmaSAcCNx9WvQZj/aTzruri69fnof8SCP+73rtWR17?=
 =?us-ascii?Q?d9iR6KQPEoPlTgXCBJS4ZMzqoHDmp3oZ2OZ/uTl041M/I3xm+OmOU6FVzt8V?=
 =?us-ascii?Q?SI7/X0CAF7iGOm0CgUzCJHKUcaxWwB0caJ7TJDdMoUQnqoK4auZy1GRaYW7H?=
 =?us-ascii?Q?1E+jd17mCTcArIeRpRIzFBZ8SQ3XxznD?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?77F0U93hrSNVbho7AhPximbKv7jKtKluhF3HH+z1xdkSzb4Cei4Rb95u+aOV?=
 =?us-ascii?Q?zMKJHrnD273eG5fEZ1FYxaxzZkFBcHPPheFb8oxOMSmDhOcJX9gxrTIWOJaK?=
 =?us-ascii?Q?V56kjqOh8N44d/5rbdsYA8FAolVxrVBAJ8FeT64yvspIuvC5Pm9AaGmjbcef?=
 =?us-ascii?Q?r3diVT7Q1D6un5ibnukS7nRNMMHwZaxJj7/R+Tx4p6KA9tnU1PT9zhRqOVC1?=
 =?us-ascii?Q?PgMA4bSvp1YGA+1JaZLyet+CKqPfkR620MxtOvEgHxkdu0wgZBysHWfTvVoW?=
 =?us-ascii?Q?jOKJkgPZsOvUSIZs9JCJ/qRGYo68VfmZJGQRQ6xguqbuF697TjsNitp3YCnZ?=
 =?us-ascii?Q?uTwYpy1rTzpaXYn7LS95O5VYGStsx7BCH/Utw7/SNyM0IZOYVfpnpoJfHaa7?=
 =?us-ascii?Q?4b/mBuw9rb4v8PIykuqAtCUaCzKUASJ4QEuiWUrLBeBDZz324AfVhEDeXxqx?=
 =?us-ascii?Q?RUP0rBXBarPqNBwxK6sRhrqwBoKFBDGG5A0BC43CuyTG+QzXg7j+5RiBuwsY?=
 =?us-ascii?Q?bZBhi/Ygqrnz37zVq+MS3WJLZQZdv0hpwGADY6o4KZv/pn56mZoahQj4Q1mt?=
 =?us-ascii?Q?ixr1pkOZNxo00L1yxMrGv94P8bFiei78R+PdChK0y713ijyGcNc/AxfNOHZH?=
 =?us-ascii?Q?KqM/huQLnfaZq/vm8o8GPgjsGrUu36KtILMcIQRo+BUGQclRIz55c2GMu1tU?=
 =?us-ascii?Q?2BLFCGQs9HdbRkUGKU85Nwr5U6qby345uS81MsZDBmdH8nQ+jIOvMxRA6L7N?=
 =?us-ascii?Q?mv5xS0Fk3O5ovXeT5XYHk6PsiE+5mthITVTRRJvx8sZHmPcJx3K8Xu9AKMJc?=
 =?us-ascii?Q?ZQDtuBq3/UvrdrI95jIKOUisgTKTQWT2LvQDKPK4mIUKjo7Ay9VG8lIrpnVg?=
 =?us-ascii?Q?Esb7B6z8pEuaTlKYABZ3mpNY5uoxnDbSvw9IDmJixY4BMfMfBs2g2RwWDK6o?=
 =?us-ascii?Q?pcLrgW4hD49FnrPkdDVW9bRoy18EY9MIk5yqNkEFnvGiq7wYYDkqHhGCHOoG?=
 =?us-ascii?Q?lDpYqb9sM20YaMKjRZfRCGnwB+HhmH0OEVdxRWllw0Sm2iLdX9tuGE2oiY2V?=
 =?us-ascii?Q?LDEQfdOoS7fwtmUpg9J+gklr98P8S8V68eF8xEISMqj/5MZ7AWd4DVthy8Ft?=
 =?us-ascii?Q?PX6i6DVcXGpQx3Vgs2bpOi8yak7bgs6slszb8OIUkCERWNfz8cvETtiYZfJx?=
 =?us-ascii?Q?vJaTHTZN9qIy/vaeryqa3nwjcFT+j3I0c4SJ2do25BehIq2qm7yH5FUVjxWc?=
 =?us-ascii?Q?aGTrHnHE/ehM7yHhDVeirjqLRUPatCKhQVnhOrtemWuvv0JO5NYyZgf4GWLn?=
 =?us-ascii?Q?ZZ7kVoTV8scLkJZpXTcJZnAUerO9wR8O4dvQt+xZH+hGI5pf8E4DruQO7qdq?=
 =?us-ascii?Q?eB8/sCcJhfT0JIqVmBTatZuoAmuldjwIz6cUaNIdBCtOkb/qwxPxCJWVfZsV?=
 =?us-ascii?Q?XUacEMVeIFE/SLdy98V3SfPU2hAWYBBkj/sdmtDEJBi3SzdMiMbsy3AKQZtD?=
 =?us-ascii?Q?bpZ7iNegEwf+xdT50CnD16A1XHR8Gk0hvFoM/GenTxS5eqVk99RoYOxFv6UJ?=
 =?us-ascii?Q?q511UclGOII/EZqsUHM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 20534a49-c31f-496d-9c21-08dd5b80eade
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 00:59:01.0685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UrtD4U0jjFtl3FuxEwr8N+SMPY9l/6rHf0NaSugw8tglgvtmyXJLiAeJk/99D2HXXPWAB8zpRgs4KD8WrKRMEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7151
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Wednesday, March 5, 2025 4:54 AM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; mpearson-
> lenovo@squebb.ca; linux-input@vger.kernel.org; linux-kernel@vger.kernel.o=
rg
> Subject: Re: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correc=
t device
> state after S4
>=20
> On Tue, 4 Mar 2025, Even Xu wrote:
>=20
> > During S4 retore flow, quickspi device was resetted by driver and
> > state was changed to RESETTED. It is needed to be change to ENABLED
> > state after S4 re-initialization finished, otherwise, device will run
> > in wrong state and HID input data will be dropped.
>=20
> Um, RESETTED, really?

Sorry, it's my bad, it should be RESET.

>=20
> In the code the flag is called QUICKI2C_RESETED, but that seems to be
> gramatically incorrect as well, right?

Yes, you are right, let me create a patch to correct it.

>=20
> I'll now apply this as-is because the code is already in, but perhaps ren=
aming the
> flag to QUICKI2C_RESET would be in order.

Current patch is still needed, quickspi device init flow is: init -> resett=
ing -> reset -> enabled.
Exiting code in pm restore() callback takes reset operation and puts device=
 into reset state, but forgets
move to enabled state after init flow is done.

Thanks for your suggestion! Let me refine the patch in V2.

Best Regards,
Even Xu=20

>=20
> Thanks,
>=20
> --
> Jiri Kosina
> SUSE Labs


