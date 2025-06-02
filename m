Return-Path: <linux-input+bounces-12684-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72756ACB2BA
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 16:34:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D4CE7A5752
	for <lists+linux-input@lfdr.de>; Mon,  2 Jun 2025 14:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E7B22F39B;
	Mon,  2 Jun 2025 14:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITqwW5eH"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC6E22330F;
	Mon,  2 Jun 2025 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874527; cv=fail; b=mj/ZO+I9C3s9uQts3SdntGEGdWKVJo/ma4K+8cgjJGPAIdMvHhFD61PHkDLNKJbhPI7MPUgtTgdAH4NhlE0i4Ixr0AVboPB1JhK8edhY+q1RIgCaxs/t3n02Cd3ViBaEGGzs3Q4AqY6E6rPYA1n1j9TzHg7HriJTlRZh/Mmr45Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874527; c=relaxed/simple;
	bh=J/d7MyFOtn0wUjdWAvTbaMYsCN8q3Z0VI49mYbbpncc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NjDxzvZosKb51+DrA2GvmiWwsy0gHqr7D5rYV6Syy/Rq2fdpQMFcct+1mX0/mqNvj4UyL+/onN6unvju+vaPlIppHDXWCqXPWkK24ntb4dZmiLzJmX/L4t2KWc8GyKCBQvTczMiOA+MMnFFEeiVRxeiXdaMYYkufGC+E2dJs8HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITqwW5eH; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748874526; x=1780410526;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=J/d7MyFOtn0wUjdWAvTbaMYsCN8q3Z0VI49mYbbpncc=;
  b=ITqwW5eHV+VtEyfbLD8YX3+F+UTBdsfhy4zQeSjHCStOIgCPdyk3FP7F
   pzsM89D2aarCZ6QagSV2T8HYT4XAE2dO1hgFYrwholJKSe9EzTqHNQI6M
   2ofqBi9si+s48z7IOCwhHM6UhlGkG1Dj3BEuMeLVgvQwOKZqBiTbNvuDf
   aTYQOinT1kHoSdeEj6KGomTRwXH7KmtVTzDxexTCVLcrQzN0wA0ldSOJs
   ZRgzhmUUIYDSe8SN08ZA4sfllGYIz/5qYkcazTz+Eaz6gVAlw+JnO7itT
   4ETIzHC2NLdE4oMa3qRHLkcviQKzy85/jNyH5f1qgutneX+6h16zMXwjR
   w==;
X-CSE-ConnectionGUID: mDl961ZATmOaGxdaBslGZg==
X-CSE-MsgGUID: h4EyM77pS0aTZX2tRGBZMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50982836"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="50982836"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:28:45 -0700
X-CSE-ConnectionGUID: a8JKZblhQ++7/bkwOHk2EA==
X-CSE-MsgGUID: 3/ZHKn1lT2mGuKiYQFHY+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; 
   d="scan'208";a="175524002"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2025 07:28:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 07:28:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 07:28:43 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.47)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 07:28:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=puixz/an44QW5kNK4G6e3DSC4FRFrhb3XhiiChAEA5qXGLlPhODVJuoToJzU6h84jl+qRL94UsYkaatc67YQYWaRUXrdsSe42KTF/VMbt18b/9r7I4XVelGq3yzclOsSt6IXDgdubaQjd5Y85o+yp26+10HkEAql4DenA2VEMV4Q9tqAeQcI/j5u6BLbXqSbsggovtNu3puRYC3BtVYe59zfLPmn8NelI8gWHnuqPqGfR2pbdJD8o9Ge7tiFw78HBdT1ui2ezaojNlcD2P4LKYFh/Nuy+1DifLwL3wMr6jWXCbhqXmdnqWIkv4WM5FTtJZM/5s1TNIjuMrY3hOGZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J/d7MyFOtn0wUjdWAvTbaMYsCN8q3Z0VI49mYbbpncc=;
 b=NPFGyZRSnS8SqTbHdnAfI57+22QmkpzcPGD3ORbk37eJD4UMZ04l6i3TrJidmpBUbuB0xO6cXRi1CWEQTSCS0kG8EdzIEIadd0oxEKokGYAuEThV5tWxO5Y8lodXhcaPZis1NwhtwgHCW+j8HkaEfS2PPCVkP5HbS5SKBdukXwKFxxVgQ9v3sHEO5Sv8d+4hCJqxpz9IbYn+AW727IFBhUqvzeWpLO4/EXhmE+o+na139KVhDZYQA0SVEB0a7Ju3KiBPtf8VYEgr3F9J2sqOUSId3W9j652OLvXatyTqW1mrAGBnTPz3sMjqkjEgZmE9UwrLrqQbZZDlkgCRRNbqyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 14:28:13 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 14:28:13 +0000
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
To: Luke Jones <luke@ljones.dev>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
	<suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
	<lucas.demarchi@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [REGRESSSION] on linux-next (next-20250509)
Thread-Topic: [REGRESSSION] on linux-next (next-20250509)
Thread-Index: AdvPttzrVyB72AhVShepIdcaeKHEtAAGqc+AAP3ecoA=
Date: Mon, 2 Jun 2025 14:28:13 +0000
Message-ID: <SJ1PR11MB61292676297EF5474644D2CFB962A@SJ1PR11MB6129.namprd11.prod.outlook.com>
References: <SJ1PR11MB6129F730EEDCD051DAD8A5DCB967A@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
In-Reply-To: <0325a50d-8499-4602-aa8c-67445b626587@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6129:EE_|LV3PR11MB8601:EE_
x-ms-office365-filtering-correlation-id: 3bfdfefa-459f-44c1-9af1-08dda1e1b50b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aVBweElMVHE2by90aWsrK1UrMGtsa0pVVGhJWHQyUVpzTHdjVTMyU0ppVUtZ?=
 =?utf-8?B?TlJRaXpHcmUxa1hMdlpMa3hKSlErcVIraXh6Qk5QZVYwZlZlNXI3N2xyTXF3?=
 =?utf-8?B?NERCME90K0tmQTFDdGJRc2VtQUxha0JhbmwwRklZQjhON0s5VnRCbXVDSktw?=
 =?utf-8?B?dGJCV2dPVnFvcUkxSmcrOGs2eW5sUkxWa0hjbXZtSDVTdHU3UERGRyt5ZEpo?=
 =?utf-8?B?Y2IzbWRNT2E4SUszQmIxUFNvcE5tVFZjWmpEZWcwd3EvSWRSdDA1bkpYTUw1?=
 =?utf-8?B?MFEvdEN0ZENDUXZzdmVOcWNWUng5V0pjUTdKazZvR0Exa0RHaHYyb1VLdSsr?=
 =?utf-8?B?ZzNOT1MvNGxYTEF4aytrT200eDh4ZjQrcWJZWTJENWsvLytsSE1pcnhDYk4r?=
 =?utf-8?B?V014RGNnS0xhSVBxdDBWUW1RMlFvQktmOXpSSE9FekZFVkhkQitzSENNQTYy?=
 =?utf-8?B?cVJqV25pRHNhN3VmQ2VOV05tMWR1bG9mbVFEN1dkU3hBemxYQjIrQU16K1hm?=
 =?utf-8?B?Mis4aGN0TnZRSlFpNVlHdUFETm1US3RFeEhObjhybXdZV2J2MXI2OU1yUW1V?=
 =?utf-8?B?N0cyK0ZnR2FVeXQvV3NkNmF6OGNIOXJjaHBzak9HbG8wMW9uNStiK1NqdmJy?=
 =?utf-8?B?cmtoQ2hZOUNlNFkwQXBQcFVvdUtBa0NObnE3YkRIditsK0U4Tm9YU2xqZzFG?=
 =?utf-8?B?OVczakljNnVUczVLMnJuTUdYcGwyWWJNajk1RlZ3YWx5NmI2RkpmY1ljZTBF?=
 =?utf-8?B?V1FTRE9TT3V6RzF2UG5YRlk1ajZpakxkNXZDVDlQKzFFaWtncXVzQjNaeUcx?=
 =?utf-8?B?Y3VxNTJxZ1p1NFRjaWRjU096b2xUeENCUmxpb3h1RnMzeE5MSmxrT0NqTFdj?=
 =?utf-8?B?WjdBenF1YWl4NHZpSExWV0cxNG1QS0QxMmNkUmJjQlJtS2NjcmcxYjF1bUpO?=
 =?utf-8?B?bURGOFlCZ1F4aEpmeTg5MHc0Wll4dXJraTE1b2h1Z0xrSlFLVW5YWmVkZWMz?=
 =?utf-8?B?R01MWFQzeG1oMGt3WlJ6UUZ1WGpsVUYzTEVtQkVFZjRCOGdkanFmaHFWQi8w?=
 =?utf-8?B?Q081bWZZUFYxRUhvbFl4YWx6N2pudjJuSXp5dldGQzMvbXJBTnpuWmgreGpl?=
 =?utf-8?B?VW90VjlaQ2RCZVpTeVA4Q1hzRVBBZWx4elNBRUhiM3FkZUxrNElBOWZoQzZQ?=
 =?utf-8?B?em9JcjRNR0MwRXBBWFo5ZU40djJLeXAzTW1QWWIwWVVWd1MrbzRpck54K0g1?=
 =?utf-8?B?S0dCRW1OOG5ueFlhNlRRTjZaQm5kS3lQUVI3MFdhQndxaWh1OEJQNzFsUTYz?=
 =?utf-8?B?bHh4MFlkaHZNdTNSd0ZOTmJhdVlrc3FpWXpycTZDNXNzY0Z3K1pqSlBsNVdN?=
 =?utf-8?B?VUNBbUVaVzZvM1B3Tm1CYS85UmNWWnNpQnJReGNnN2dtOGNjMXE3T1FLUGJC?=
 =?utf-8?B?eFc2NXM2ZlpRSFpFL2lxeWxhOTJ1ektWelJ5cTdFQnRWTnNCNXl6L0w1Z0hB?=
 =?utf-8?B?MW9hVlpHc3ozbGh3c2gwbGFIRXBFa2ZvVDBRaHdpMTZQaktQR1ZZQ2g5OTBI?=
 =?utf-8?B?TGV3UDhPR0VMTHduTVZTV0Q5WVUvVy9LVFN2Y2EwOExmc0M3Tm5neDhzeFBu?=
 =?utf-8?B?T0dRdzhaMm5zaVdLQ3Y0RXNCVnRKQko1cTBxa3dCVWR4alZ3N3V0Z2YvY01C?=
 =?utf-8?B?YWV2cFVkdE5kUUxvS3BmbzlTdUpuOW9qeXFQelpuVUwvUUlGSklwaHZaMFBQ?=
 =?utf-8?B?Z2h5ZjVkSnpkZWpoUTh1dVNITFRSclV2WU5Fb2NHcTJUMEhTRFd6WkwwQ29J?=
 =?utf-8?B?UGZZVHpWTmc1SlRRREpLWTRqenEvUFRTUTFtazA3eUxvQ3dUU3EzSHlIN3NH?=
 =?utf-8?B?US9FTGRUaVNOT29lcGVtTDVoTEQ1bnNxNHYyWUoxYzRnTUVCZDF2NUJhUEJM?=
 =?utf-8?Q?BudB/6ikpD8zMqAm5r1P+tc1OUdCI3To?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eE9ZOW9kZVk0b2QrRW5YSVpMbEZsemdJMURYSEM3a0lvZk5rY1JvWmt4OWdF?=
 =?utf-8?B?OGpwQmphazFHb2VoTFpXYURHbDhqN2JFWi9PSEJCbHJpNU5oZnVkaGlHaVlr?=
 =?utf-8?B?a0ZJWXUyTXh3TXA3VDFtQ3M3c0RLMnhpaEkzTmtIQ0YzL1k4Z2phdnlMSkQv?=
 =?utf-8?B?S3llc0xoM2pwUElLM1k1V25FbmRyTHhMN2MvR2xIQ01COHloMUFBdHFUN2Vn?=
 =?utf-8?B?cnBua0pZMW1ZMUk1bFg0emF4WTdvMHE3MkJVRzhXTXZWNVlOUmlPamFJZHFF?=
 =?utf-8?B?V3R3RGtUalJtUlA1dHlxc2JmaDVkWlFTNTVCbnZ5L0R6TnI0L3FyNU5kSHk5?=
 =?utf-8?B?cUZ5OEVXSEVyNzJDaVhhaUpFQm5HYW5lNjgzMVFuZVJpRUVDREJ2VzJzeEhK?=
 =?utf-8?B?UjQ3MVprd1p1VG85Q2RtVWRYOEpKeHAyN1pheHdHMjVleHhGTjVXbXNQVzI5?=
 =?utf-8?B?ZzltTVVIdXpKUWdMVFRWZ0JpaGVWQkxMeFB5KzRINGRlS2gxU3Y4VmZpMjBu?=
 =?utf-8?B?STNidi80TlprNTV3TFp0c2xuS1hJMXJuQlNWeUpvbHZxM3VIVDJRTDhOMXRu?=
 =?utf-8?B?ZDByY0FEeVlwRzNpQmxYN21HOHVFYUFmc3pmRmhvTjN4d2pJbzlWb0NZUVU4?=
 =?utf-8?B?M2VNWXBmNmEwR3dRTWVQM3VKMERnN0Z5cUF2QTFDNTFMdm53RDhJS2RaMmtz?=
 =?utf-8?B?NXV0ZlRIRk1JTFowM3F5V0poRVNBZTF2WUl3Tmt4dmNwMll6azZFVHl0cHdG?=
 =?utf-8?B?S1NSbkY3YnZXeXdQMEYzRWwzNWlCYkNxdS9YTXpjdC9FSnZXUWQ4d1pjb0lr?=
 =?utf-8?B?dUhIQ3FpWUdoTEI0bzFtUlhWSUttOGtFaHpBZ0hqNzdIQWFkc3lUK205c09U?=
 =?utf-8?B?U05GdVpLUzREZCtpejNnL080OTl3dU1WUGlBNEl0QVVMZGVLT3Rxak9qMHZT?=
 =?utf-8?B?d1hEYVpNUEIvQVp5VEtKR2JRL2JlcG9SUUN0MVlTRzJPZkcwNjdoVm9HYzI2?=
 =?utf-8?B?TGZJMy9DREhCbU9peXdZM1lweWxTaUg2VGhjMUZTaTVKYmlxeHBWZ3MwRENs?=
 =?utf-8?B?bWZoS3VscTdSeFRBemtERUl1RWJHNXJTMlJBWU9aVklSL2RZeCt1MS8xNmNK?=
 =?utf-8?B?SzU3TEQzNDhpbHBKTFg5R0RnOHVOOVBVZ1hEdlhGTFpYM0NjalB5SE8xc3Ey?=
 =?utf-8?B?SXlHcEdUV2N5MUp6L0EvS2dGYVhGU0VZeStTYm1PMEkvMHoyRFFWZ3B0c0JQ?=
 =?utf-8?B?eDdLeDVoWjRzRFE4aXd1VWh1dWhIbUtPUkNnRmU3a2dSMmRaUXlPYzlDNUNO?=
 =?utf-8?B?OUdxbjhQNEdoc2pQZ1lSNGVaWkVlaURwMGUyQVdWUmVpODdvUXF1aW05NmdZ?=
 =?utf-8?B?WUU3M3BobkJuTTZRMGQyRnU2bmNrYWE4Z2p2SjdnUXhTWGYySmF2YU1qTVI2?=
 =?utf-8?B?clFoR2YybE96anQ5bzJGSkRKK1hjYXJkQUh0b3dYTW1NMHh6VlJXSjVsTC9y?=
 =?utf-8?B?RzZtOExacDROWEU1cTBkVy9KRExKd0NxalkzMnVuOHU4QkJpY25WMGRZQXdu?=
 =?utf-8?B?ZGpmVVlyZGlNalNSSC9Xb3Y5ZHZTRXFlcXNMbFpYclRxQUlqdHgwQXJRcnFz?=
 =?utf-8?B?cG13OVhZVk9waFdIdWVjVWpyaVdya1JGMGpVenB2ZzlyOERlUGs1eFhHU1Fx?=
 =?utf-8?B?TXRta1RaaVYyMk5wdTFXOTBLeGFiRW5JQ2lKZ3dMdnBMUGtRYS9BeUt6dlZz?=
 =?utf-8?B?d0NKTEFOODV6dzJmMndFbFp4ZXpTc2ZHRDlKcTlSS2tSMDJVd1ZGZkxsU3c1?=
 =?utf-8?B?Rndlc0cvRWFnQUpJT1NUaVVmKytzdW5LNjFQOXdVcCtVNjVFSWhpKytYdTc1?=
 =?utf-8?B?b0RtdG01MHJFWVMxLzdleDcyV2hLMVVVSGQxQ2VPMnI1MGg1TjNSL3Z5NFF4?=
 =?utf-8?B?Sk9GczA3RWp5SEdSWGptbzZwalJVaVR3TG9UR3pXa2NSZGdZWk5ndTFYVE1X?=
 =?utf-8?B?Y2o4bmYwNVhQWnlsMi8zZUh0emZLeDJraWwwYUQwcDhHUWo2M0VKZjdRclNs?=
 =?utf-8?B?QXlYS29BWHZJbWlmVFJQYkJXMjhHNFM0T1N3czJlTHhFNkEwS0lxaFR6Mm5n?=
 =?utf-8?B?cHJaRTJjV3N1MDk1YjVCV2s5cUhhWnRVZlRraVFweUFOQnpGQ01yejgyei9Y?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfdfefa-459f-44c1-9af1-08dda1e1b50b
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2025 14:28:13.3080
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h/koMn0CZ/00oicECwete8+KitrLO9Kb0UcSAyD0pACOWnpbpGzQUn1MJRLbQYabLEVh7ANd0wZjyc+H5OHRCdyiO8uo5c/brylLKRmd4Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTHVrZSBKb25lcyA8bHVr
ZUBsam9uZXMuZGV2Pg0KPiBTZW50OiBXZWRuZXNkYXksIE1heSAyOCwgMjAyNSA2OjM4IFBNDQo+
IFRvOiBCb3JhaCwgQ2hhaXRhbnlhIEt1bWFyIDxjaGFpdGFueWEua3VtYXIuYm9yYWhAaW50ZWwu
Y29tPg0KPiBDYzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBTYWFyaW5lbiwNCj4gSmFuaSA8amFuaS5zYWFyaW5lbkBpbnRl
bC5jb20+OyBLdXJtaSwgU3VyZXNoIEt1bWFyDQo+IDxzdXJlc2gua3VtYXIua3VybWlAaW50ZWwu
Y29tPjsgRGUgTWFyY2hpLCBMdWNhcw0KPiA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPjsgTmlr
dWxhLCBKYW5pIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+OyBsaW51eC0NCj4gaW5wdXRAdmdlci5r
ZXJuZWwub3JnOyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0
OiBSZTogW1JFR1JFU1NTSU9OXSBvbiBsaW51eC1uZXh0IChuZXh0LTIwMjUwNTA5KQ0KPiANCj4g
T24gV2VkLCAyOCBNYXkgMjAyNSwgYXQgMTI6MDggUE0sIEJvcmFoLCBDaGFpdGFueWEgS3VtYXIg
d3JvdGU6DQo+ID4gSGVsbG8gTHVrZSwNCj4gPg0KPiA+IEhvcGUgeW91IGFyZSBkb2luZyB3ZWxs
LiBJIGFtIENoYWl0YW55YSBmcm9tIHRoZSBsaW51eCBncmFwaGljcyB0ZWFtIGluDQo+IEludGVs
Lg0KPiA+DQo+ID4gVGhpcyBtYWlsIGlzIHJlZ2FyZGluZyBhIHJlZ3Jlc3Npb24gd2UgYXJlIHNl
ZWluZyBpbiBvdXIgQ0kgcnVuc1sxXSBvbg0KPiA+IGxpbnV4LW5leHQgcmVwb3NpdG9yeS4NCj4g
DQo+IENhbiB5b3UgdGVsbCBtZSBpZiB0aGUgZml4IGhlcmUgd2FzIGluY2x1ZGVkPw0KPiBodHRw
czovL2xrbWwub3JnL2xrbWwvMjAyNS81LzI0LzE1Mg0KPiANCg0KV2UgYWxyZWFkeSBoYXZlIHRo
aXMgY2hhbmdlIGluIHRoZSAiYmFkIiB2ZXJzaW9uLg0KDQo+IEkgY291bGQgY2hhbmdlIHRvOg0K
PiBzdGF0aWMgdm9pZCBhc3VzX3MyaWRsZV9jaGVja19yZWdpc3Rlcih2b2lkKSB7DQo+ICAgICAv
LyBPbmx5IHJlZ2lzdGVyIGZvciBBbGx5IGRldmljZXMNCj4gICAgIGlmIChkbWlfY2hlY2tfc3lz
dGVtKGFzdXNfcm9nX2FsbHlfZGV2aWNlKSkgew0KPiAgICAgICAgIGlmIChhY3BpX3JlZ2lzdGVy
X2xwczBfZGV2KCZhc3VzX2FsbHlfczJpZGxlX2Rldl9vcHMpKQ0KPiAgICAgICAgICAgICBwcl93
YXJuKCJmYWlsZWQgdG8gcmVnaXN0ZXIgTFBTMCBzbGVlcCBoYW5kbGVyIGluIGFzdXMtd21pXG4i
KTsNCj4gICAgIH0NCj4gfQ0KPiANCg0KV2l0aCB0aGlzIGNoYW5nZSBpc3N1ZSBpcyBub3Qgc2Vl
bi4NCg0KUmVnYXJkcw0KDQpDaGFpdGFueWENCg0KPiBidXQgSSBkb24ndCByZWFsbHkgdW5kZXJz
dGFuZCB3aGF0IGlzIGhhcHBlbmluZyBoZXJlLiBUaGUgaW5uZXIgbHBzMCBmdW5jdGlvbnMNCj4g
d29uJ3QgcnVuIHVubGVzcyB1c2VfYWxseV9tY3VfaGFjayBpcyBzZXQuDQo+IA0KPiBJIHdpbGwg
ZG8gbXkgYmVzdCB0byBmaXggYnV0IEkgbmVlZCB0byB1bmRlcnN0YW5kIHdoYXQgaGFwcGVuZWQg
YSBiaXQgYmV0dGVyLg0KPiANCj4gcmVnYXJkcywNCj4gTHVrZS4NCj4gDQo+ID4gU2luY2UgdGhl
IHZlcnNpb24gbmV4dC0yMDI1MDUwOSBbMl0sIHdlIGFyZSBzZWVpbmcgdGhlIGZvbGxvd2luZw0K
PiA+IHJlZ3Jlc3Npb24NCj4gPg0KPiA+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYA0KPiA+IDw0
PlsgICAgNS40MDA4MjZdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiA+
IDw0PlsgICAgNS40MDA4MzJdIGxpc3RfYWRkIGRvdWJsZSBhZGQ6IG5ldz1mZmZmZmZmZmEwN2Mw
Y2EwLA0KPiA+IHByZXY9ZmZmZmZmZmY4MzdlOWE2MCwgbmV4dD1mZmZmZmZmZmEwN2MwY2EwLg0K
PiA+IDw0PlsgICAgNS40MDA4NDVdIFdBUk5JTkc6IENQVTogMCBQSUQ6IDM3OSBhdCBsaWIvbGlz
dF9kZWJ1Zy5jOjM1DQo+ID4gX19saXN0X2FkZF92YWxpZF9vcl9yZXBvcnQrMHhkYy8weGYwDQo+
ID4gPDQ+WyAgICA1LjQwMDg1MF0gTW9kdWxlcyBsaW5rZWQgaW46IGNtZGxpbmVwYXJ0KCspIGVl
ZXBjX3dtaSgrKQ0KPiA+IGFzdXNfbmJfd21pKCspIGFzdXNfd21pIHNwaV9ub3IoKykgc3BhcnNl
X2tleW1hcCBtZWlfcHhwIG10ZA0KPiA+IHBsYXRmb3JtX3Byb2ZpbGUga3ZtX2ludGVsKCspIG1l
aV9oZGNwIHdtaV9ibW9mIGt2bSBpcnFieXBhc3MNCj4gPiBwb2x5dmFsX2NsbXVsbmkgdXNiaGlk
IGdoYXNoX2NsbXVsbmlfaW50ZWwgc25kX2hkYV9pbnRlbCBoaWQNCj4gPiBzaGExX3Nzc2UzDQo+
ID4gcjgxNTIoKykgYmluZm10X21pc2MgYWVzbmlfaW50ZWwgc25kX2ludGVsX2RzcGNmZyBtaWkg
cjgxNjkNCj4gPiBzbmRfaGRhX2NvZGVjIHJhcGwgdmlkZW8gc25kX2hkYV9jb3JlIGludGVsX2Nz
dGF0ZSBzbmRfaHdkZXAgcmVhbHRlaw0KPiA+IHNuZF9wY20gc25kX3RpbWVyIG1laV9tZSBzbmQg
aTJjX2k4MDEgaTJjX211eCBzcGlfaW50ZWxfcGNpIGlkbWE2NA0KPiA+IHNvdW5kY29yZSBzcGlf
aW50ZWwgaTJjX3NtYnVzIG1laSBpbnRlbF9wbWNfY29yZSBubHNfaXNvODg1OV8xDQo+ID4gcG10
X3RlbGVtZXRyeSBwbXRfY2xhc3MgaW50ZWxfcG1jX3NzcmFtX3RlbGVtZXRyeSBwaW5jdHJsX2Fs
ZGVybGFrZQ0KPiA+IGludGVsX3ZzZWMgYWNwaV90YWQgd21pIGFjcGlfcGFkIGRtX211bHRpcGF0
aCBtc3IgbnZtZV9mYWJyaWNzIGZ1c2UNCj4gPiBlZmlfcHN0b3JlIG5mbmV0bGluayBpcF90YWJs
ZXMgeF90YWJsZXMgYXV0b2ZzNA0KPiA+IDw0PlsgICAgNS40MDA5MDRdIENQVTogMCBVSUQ6IDAg
UElEOiAzNzkgQ29tbTogKHVkZXYtd29ya2VyKSBUYWludGVkOiBHDQo+ID4gUw0KPiA+IDYuMTUu
MC1yYzctbmV4dC0yMDI1MDUyNi1uZXh0LTIwMjUwNTI2LWczYmUxYTdhMzFmYmQrICMxDQo+ID4g
UFJFRU1QVCh2b2x1bnRhcnkpDQo+ID4gPDQ+WyAgICA1LjQwMDkwN10gVGFpbnRlZDogW1NdPUNQ
VV9PVVRfT0ZfU1BFQw0KPiA+IDw0PlsgICAgNS40MDA5MDhdIEhhcmR3YXJlIG5hbWU6IEFTVVMg
U3lzdGVtIFByb2R1Y3QgTmFtZS9QUklNRQ0KPiBaNzkwLVANCj4gPiBXSUZJLCBCSU9TIDA4MTIg
MDIvMjQvMjAyMw0KPiA+IDw0PlsgICAgNS40MDA5MDldIFJJUDogMDAxMDpfX2xpc3RfYWRkX3Zh
bGlkX29yX3JlcG9ydCsweGRjLzB4ZjANCj4gPiA8ND5bICAgIDUuNDAwOTEyXSBDb2RlOiAxNiA0
OCA4OSBmMSA0YyA4OSBlNiBlOCBhMiBjNSA1ZiBmZiAwZiAwYiAzMSBjMA0KPiA+IGU5IDcyIGZm
IGZmIGZmIDQ4IDg5IGYyIDRjIDg5IGUxIDQ4IDg5IGZlIDQ4IGM3IGM3IDY4IGJhIDBmIDgzIGU4
IDg0DQo+ID4gYzUgNWYgZmYgPDBmPiAwYiAzMSBjMCBlOSA1NCBmZiBmZiBmZiA2NiA2NiAyZSAw
ZiAxZiA4NCAwMCAwMCAwMCAwMCAwMA0KPiA+IDkwDQo+ID4gOTANCj4gPiA8ND5bICAgIDUuNDAw
OTE0XSBSU1A6IDAwMTg6ZmZmZmM5MDAwMjc2MzU4OCBFRkxBR1M6IDAwMDEwMjQ2DQo+ID4gPDQ+
WyAgICA1LjQwMDkxNl0gUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZmZmZmZhMDdjMGNh
MCBSQ1g6DQo+ID4gMDAwMDAwMDAwMDAwMDAwMA0KPiA+IDw0PlsgICAgNS40MDA5MThdIFJEWDog
MDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDAwMDAwMDAwMDAwMDAgUkRJOg0KPiA+IDAwMDAwMDAw
MDAwMDAwMDANCj4gPiA8ND5bICAgIDUuNDAwOTE5XSBSQlA6IGZmZmZjOTAwMDI3NjM1OTggUjA4
OiAwMDAwMDAwMDAwMDAwMDAwIFIwOToNCj4gPiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gPDQ+WyAg
ICA1LjQwMDkyMF0gUjEwOiAwMDAwMDAwMDAwMDAwMDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBS
MTI6DQo+ID4gZmZmZmZmZmZhMDdjMGNhMA0KPiA+IDw0PlsgICAgNS40MDA5MjFdIFIxMzogZmZm
ZmZmZmZhMDdjMGNhMCBSMTQ6IDAwMDAwMDAwMDAwMDAwMDAgUjE1Og0KPiA+IGZmZmY4ODgxMjEy
ZDZkYTANCj4gPiA8ND5bICAgIDUuNDAwOTIzXSBGUzogIDAwMDA3Nzg2MzdiNDE4YzAoMDAwMCkN
Cj4gR1M6ZmZmZjg4ODhkYWQwYzAwMCgwMDAwKQ0KPiA+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAN
Cj4gPiA8ND5bICAgIDUuNDAwOTI2XSBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAw
MDAwMDAwMDgwMDUwMDMzDQo+ID4gPDQ+WyAgICA1LjQwMDkyOF0gQ1IyOiAwMDAwNzc4NjM3M2I4
MGIyIENSMzogMDAwMDAwMDExNmZhYTAwMCBDUjQ6DQo+ID4gMDAwMDAwMDAwMGY1MGVmMA0KPiA+
IDw0PlsgICAgNS40MDA5MzFdIFBLUlU6IDU1NTU1NTU0DQo+ID4gPDQ+WyAgICA1LjQwMDkzM10g
Q2FsbCBUcmFjZToNCj4gPiA8ND5bICAgIDUuNDAwOTM1XSAgPFRBU0s+DQo+ID4gPDQ+WyAgICA1
LjQwMDkzN10gID8gbG9ja19zeXN0ZW1fc2xlZXArMHgyYi8weDQwDQo+ID4gPDQ+WyAgICA1LjQw
MDk0Ml0gIGFjcGlfcmVnaXN0ZXJfbHBzMF9kZXYrMHg1OC8weGIwDQo+ID4gPDQ+WyAgICA1LjQw
MDk0OV0gIGFzdXNfd21pX3Byb2JlKzB4N2YvMHgxOTMwIFthc3VzX3dtaV0NCj4gPiA8ND5bICAg
IDUuNDAwOTU2XSAgPyBrZXJuZnNfY3JlYXRlX2xpbmsrMHg2OS8weGUwDQo+ID4gYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYA0KPiA+IGBgYGBgYGBgYGBgDQo+ID4gRGV0YWlsZWQgbG9nIGNhbiBiZSBmb3VuZCBpbiBb
M10uDQo+ID4NCj4gPiBBZnRlciBiaXNlY3RpbmcgdGhlIHRyZWUsIHRoZSBmb2xsb3dpbmcgcGF0
Y2ggWzRdIHNlZW1zIHRvIGJlIHRoZSBmaXJzdCAiYmFkIg0KPiA+IGNvbW1pdA0KPiA+DQo+ID4g
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYGBgYGBgYA0KPiA+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgDQo+
ID4gY29tbWl0IGZlZWE3YmQ2YjAyZDQzYTc5NGUzZjA2NTY1MGQ4OWNmOGQ4ZThlNTkNCj4gPiBB
dXRob3I6IEx1a2UgRC4gSm9uZXMgbWFpbHRvOmx1a2VAbGpvbmVzLmRldg0KPiA+IERhdGU6wqDC
oCBTdW4gTWFyIDIzIDE1OjM0OjIxIDIwMjUgKzEzMDANCj4gPg0KPiA+IMKgwqDCoCBwbGF0Zm9y
bS94ODY6IGFzdXMtd21pOiBSZWZhY3RvciBBbGx5IHN1c3BlbmQvcmVzdW1lDQo+ID4gYGBgYGBg
YGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBg
YGBgYGBgYA0KPiA+IGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgYGBgDQo+ID4NCj4g
PiBXZSBjb3VsZCBub3QgcmV2ZXJ0IHRoZSBwYXRjaCBiZWNhdXNlIG9mIG1lcmdlIGNvbmZsaWN0
IGJ1dCByZXNldHRpbmcNCj4gPiB0byB0aGUgcGFyZW50IG9mIHRoZSBjb21taXQgc2VlbXMgdG8g
Zml4IHRoZSBpc3N1ZQ0KPiA+DQo+ID4gQ291bGQgeW91IHBsZWFzZSBjaGVjayB3aHkgdGhlIHBh
dGNoIGNhdXNlcyB0aGlzIHJlZ3Jlc3Npb24gYW5kDQo+ID4gcHJvdmlkZSBhIGZpeCBpZiBuZWNl
c3Nhcnk/DQo+ID4NCj4gPiBUaGFuayB5b3UuDQo+ID4NCj4gPiBSZWdhcmRzDQo+ID4NCj4gPiBD
aGFpdGFueWENCj4gPg0KPiA+IFsxXSBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9s
aW51eC1uZXh0L2NvbWJpbmVkLWFsdC5odG1sPw0KPiA+IFsyXQ0KPiA+IGh0dHBzOi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L25leHQvbGludXgtbmV4dC5naXQvY28N
Cj4gPiBtbWl0Lz9oPW5leHQtMjAyNTA1MDkNCj4gPiBbM10NCj4gPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9saW51eC1uZXh0L25leHQtMjAyNTA1MjYvYmF0LXJwbHMtNC9iDQo+
ID4gb290MC50eHQNCj4gPiBbNF0NCj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20v
bGludXgva2VybmVsL2dpdC9uZXh0L2xpbnV4LQ0KPiBuZXh0LmdpdC9jb21taXQvP2g9bmV4dC0N
Cj4gMjAyNTA1MDkmaWQ9ZmVlYTdiZDZiMDJkNDNhNzk0ZTNmMDY1NjUwZDg5Y2Y4ZDhlOGU1OQ0K

