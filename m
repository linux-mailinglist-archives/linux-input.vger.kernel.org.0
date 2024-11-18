Return-Path: <linux-input+bounces-8129-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FB69D075F
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 02:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89E7A1F21894
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2024 01:04:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9327A79CF;
	Mon, 18 Nov 2024 01:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQpVAiWG"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0C84A35
	for <linux-input@vger.kernel.org>; Mon, 18 Nov 2024 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731891866; cv=fail; b=i6K+a1cvaimfvI9xxNizp0N99O4vKZgPx8PSauizNgY1GTPl6je4UXLWz5TO2wrAm7Jq0Awp6/H1/lFTo7SJWNBoHOMUqK0MaavbndAjwbXStRy77q678+Zt80ZXx2adJG7ob9eUQ4bJrKXF/WtmTmO3vp/AooqH6H0CzLv9Vpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731891866; c=relaxed/simple;
	bh=r/r2zQ8SFlO8qlxTyxanQBNm8LLBqH1IvZWqBivNBwo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=s4Zv+Zj3t2U0Jd+qWDMdeUS/T5Y1tPJDYReZdz1bvoEWlj+tA/uNdvEb5/2kcBJ96XkePvfG6uFNrwfGubx3DJ8by4F7npGBzCBa19RxC4v8F30lzxv15Kei0WWLzKoDVbdHwKliv8/C+VeRvnhaiCM5fsy+UZHC3Yu3RWxh3nA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DQpVAiWG; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731891864; x=1763427864;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r/r2zQ8SFlO8qlxTyxanQBNm8LLBqH1IvZWqBivNBwo=;
  b=DQpVAiWGwamfJuXxVwnRFflz8yOUj9SexV2H57SLcNFaJ4uNjT3O+sE6
   T6Z+fHiApJ/bg92obF77xBqmc5eFvgox1MOYQaJsxXwJV1TuG4tFgY66h
   wPVgapsoN11mHJJ5jTN2PNq6/m8X40+J6HUrH96xeSxF3kNVsZbiAZ7Gb
   /9f+iXgXq2i212cfI0eMdKHdDOH7VnNKA4YxxMwEHGHmZc3xSUwnmruUF
   pCkiaD6o8zv8g+z5EGozsRTt1TcCJG6a4zWp8plU/VXzgujTiHpG3Yz+B
   Zq3UH1tqKmrTqDU7BhIAwjuSxRUtDus2kpylugXK498wKag7G5HkND2a9
   A==;
X-CSE-ConnectionGUID: j8jmby8vSoS/Y9ZHx+5QCg==
X-CSE-MsgGUID: gvnOSzLDS5mARucUKGsTig==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="42353441"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="42353441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 17:04:24 -0800
X-CSE-ConnectionGUID: Cwz4KbaERrm5XIO96X+20w==
X-CSE-MsgGUID: uMwPXmBjQ5eakr0Z9U9b4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="88839918"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Nov 2024 17:04:23 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 17 Nov 2024 17:04:22 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 17 Nov 2024 17:04:22 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 17 Nov 2024 17:04:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FENQeRTytOrtnKrYrNWn59JpEJ/4NbwwcVuy1OPyiHKd2mqLAwT3niE4YzZmfgVk+NVnWiEGUrwNXZPCBSv/9yuau5f1gmHhEQaxkGy5RprKGR2srA2QLLA+3lQCRpz6QvjE0GoredBRViUuIbz4uC6jyDNlGexXrj4PDBEfV35k19vsLXl42+H/4cGKw8h4Rzx8fqxcpWnRi6/P9bKE3+aWnB2s9ll4iIo8/4oI+SBbcjBPG7pSNh3G+HBEQyGF/UYQPHBLyrN7nBbOQb5yS5X60AsZSaEdlv8BonB4tFkBkJwi6QB0XsW35k2xQ6blYdrtxUaMXwFwmaI3bjLKSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/r2zQ8SFlO8qlxTyxanQBNm8LLBqH1IvZWqBivNBwo=;
 b=LemQkZ6gJRAA+2L0q6HrBEWk9//QaMF4NrPoe39LjDpEwab+nJL0Fwal526A6XDoNYy2IT9PBoPunHJxZiBbwt+iBnBYMc9+FHeZeC1CIxepybuO6p0iQhWuwfWBG2/FdtRuwb1gEWdutQgR3D0YzHD9W2DXsf0SceA2CXE/YABMWaR8LWXPHngDVxcNAx6Aky6XIXTU33d9JGEEfU5mvdrhMlhQWrGYPwoGLJ/rQ5bDKAMgxnf9p9f/Mu1k4yNaSGwohuhauKWvEpd7rVWPurh+2gTbfov9sxTFSP/hnu18D6K3aGo5UDL3zvN4t2SL68ItumZARCIVycCxF90WwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 SN7PR11MB7065.namprd11.prod.outlook.com (2603:10b6:806:298::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Mon, 18 Nov
 2024 01:04:19 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%4]) with mapi id 15.20.8158.019; Mon, 18 Nov 2024
 01:04:19 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: melvyn <melvyn2@dnsense.pub>, srinivas pandruvada
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>
Subject: RE: intel_ish_ipc: loader failure on Lunar Lake
Thread-Topic: intel_ish_ipc: loader failure on Lunar Lake
Thread-Index: AQHbODY1WY+rsDMNeUWwEtKPLBQbcLK6KngAgAIM1mA=
Date: Mon, 18 Nov 2024 01:04:19 +0000
Message-ID: <DM4PR11MB59955005127639046324F2D793272@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <b74f8422-a7fb-4475-a1c8-383734449f91@dnsense.pub>
 <2d08e47f-ea9b-4d28-b345-36818eadf366@dnsense.pub>
 <88a8d5f06fdf181c320240d8439a5d5c2762a8a4.camel@linux.intel.com>
 <9564a26c-37ec-4b5b-82ec-2b5153e1fe61@dnsense.pub>
In-Reply-To: <9564a26c-37ec-4b5b-82ec-2b5153e1fe61@dnsense.pub>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|SN7PR11MB7065:EE_
x-ms-office365-filtering-correlation-id: 5b03b63d-064b-4099-bcf0-08dd076cee52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MTVKa3k5OXYxMkozK1F3Q2hZdjNvR0F2RkZWUlpzdnBEaFV1OTFVL3BQMk9r?=
 =?utf-8?B?cVBwTjJXV1ZWMHlwQklzNXduQjcxMlRoRDBZTHY4NzdLR1hyYUovZTdEVDhC?=
 =?utf-8?B?MHBhV0VySnNsc2ZjdGx4UFBjcFRYSVl3S3lnak11M1RGaHNnc1psMk5pRFRY?=
 =?utf-8?B?MmdFQU8yTGw2eXRwbVQvTk1QaEVZeVZtY3p0VVhVU1F4UjFPVndUOVZOa2Nz?=
 =?utf-8?B?U1JFdDlrOFFQV3NuQkVDWEJyT2ZNcGx3bFdBWndJdXM3WHVHcUFhL0tUdW05?=
 =?utf-8?B?dVBpcjlsdkFnc0NXR2w3ODBicXpjbjhTSHdTNER4R0EzOUpLaEk5aVFhOEh1?=
 =?utf-8?B?UnV5ZWlFNDByVVRjandsU3g3bkEzR0ZtamRTVnlzTGk2eDUydzlRMGVGK0JD?=
 =?utf-8?B?dHFCKzc0Rm5KYlQyTDBpMkRwR2ZnYW1xVDN0QWU2a1lWdjh4eTNxWUxGOVhh?=
 =?utf-8?B?ZEhwaEorVi93dDlFdGZ2ZEt3QXZWaldIMXJ5TmlnNzQ1bDJ5OVc4RTlycnRC?=
 =?utf-8?B?UU9xQlRlejBlL2Fua2lYdkpmK0xrcGVRVTBLTHZseGtSUDFYUWMvSWV6MDB2?=
 =?utf-8?B?K2YvZzlySTdwVU5USS9wOE1wUi91NkFlb0NIZEo1eExkcnoxZk1zUmVFRlkx?=
 =?utf-8?B?MTEyYmtna1F2Ui9tcDg4RXQwa2Y0M0xYbGsyeGZWV3lWZVB1WXRZUzhMbEFR?=
 =?utf-8?B?YWtoczE3ZktDN1BESzJab2JiNTdzb0dPM2E5Q3VEa3RtS3RBR2xFOU9Fa2V2?=
 =?utf-8?B?U3k2bHdsYnFXcmJhMmZFaGc1VkEzN01zU1JnaDBraVplRjh2TkpFWU1Rc3dT?=
 =?utf-8?B?RDRIYkluWWdvMXZUcVphckZnZnhvNExhNjc1VUF2UEhodVU2RFlUajc5Tm5B?=
 =?utf-8?B?NWpVWVVqZnNEM0dQWjQwWnM3azRjYjNJYkZLenFlNlZ3Wm9HdnhaM0c5WjZI?=
 =?utf-8?B?QmMrZ2o1aEt2Y1E2UU1qMG5TUkdIMkRvaHZmcU5Fd0VWcUdZZkp3bzdUOWNn?=
 =?utf-8?B?L3NESVVEYlZIYm8zcDlFRmU1M2VZd2hvMnRVMWREcWNyazUxdHhjbFQybE1o?=
 =?utf-8?B?cG0xODJmdXoxWmY4aTZPMmdoV3llakJUaDkrdlZ3SjRYT0hJZ1IxRW5kcStY?=
 =?utf-8?B?MU0wd0F2L25iVGVJRHdmQXNiaGtpcXpacnhGbkZaWHl2UEhWL1RZcnA4TFVW?=
 =?utf-8?B?YitjdVl1ak5lSHNka0o4eXdibHNzb2VuVmtyQ1o5dkV3WGQvVm1wY0xjRDNG?=
 =?utf-8?B?cEVtK21qeVlLeGgwbkw2ZFBKR0wrNVJ6REdrU3JVSjV6RzNKWDNLNU1TRnp6?=
 =?utf-8?B?MFBNN3NhZEJSOWpvdksxUTlPZldXVFhyTlR1RnpUOENkSkpNSkhFVFBIQ3ls?=
 =?utf-8?B?cGlIMHNpMjNzeDJiOTVqbFRDSkIwU2l5Njg4YWdSdmxxTzRaU3g0TnpVeEVl?=
 =?utf-8?B?WnU2ZlpFU2g4UmV2WVpJL2dtcGw4NkRPVlRxY2Q5bkFDejZaMmJ6a0FnVnhS?=
 =?utf-8?B?ZmdZT0Q0NWxUdW1hc2ROWXM2OTVDcmQwbVIvVW0waDRnQW9hQjMzWXdIamFv?=
 =?utf-8?B?YXl1R08yKzhZcmswT0Q0eHhuQ2JUMXQyQTlJSmFlclluaGRKa3o5QWd1TGxn?=
 =?utf-8?B?dkp5US9wWHRVczZ2c1QvMVV6dlRteDRKOXBidHJPOFBvWFdaaDJyYjBDa1RK?=
 =?utf-8?B?MmE5bC9oeEpkeGxNMjF6RDJ1MDBvOFhJRzlCRGFIOGZtblowWHcyc2N5cEJP?=
 =?utf-8?B?MG8xTlNnZktPbVFaRkhxWVRacFNJV21lZC9PRHZuUWx4QzU0d2FOekFNc1hu?=
 =?utf-8?B?Ukdhd04wZUhwMlBBNFh2N2hlaDc5NTA3N0p6TlM2d1VrQUI5cm9BV1pxdVM1?=
 =?utf-8?Q?CJTplsOofleq9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aHU5UFcwS3NEV21JSmwyKzdDT3UwTmVaaUVmTUxpZTFzTWxaT215ZlU1M3NX?=
 =?utf-8?B?U0ZQRFhwUnBPTXZlZHVoZUUzTDBuOEVuOHBoTlVESUVPNTR5ZXlDS3FxN2cz?=
 =?utf-8?B?NnA5YlBMUXd4M0daTnE0aG51ekJNemxiWUFsM01pbjNLUkxZamNMVnlZdWxD?=
 =?utf-8?B?MUIxZllqL050Y0o3T0tqVFErek42NkQvdTZCVFlJbkRhRVZONHJkcFZaZldE?=
 =?utf-8?B?TnZEaVhvWnVYRnVBb0NoM2VjdnZXYTNWZ2I2QmdlSEVEeVpTSURNakxXVkVp?=
 =?utf-8?B?QkFYbWRMRmgwNG9keTlhR2FBdXBtaEFLR24xT2Q1ODY5RmhkYVpHSEo3OUNr?=
 =?utf-8?B?b2wveUJNcm4zdWhvTG1CaGpFYldqQWlKek1EUUZ5Q1Bwc05wNkZBVEFzcFRz?=
 =?utf-8?B?ZnM0MFdLOHhBM0RHdUFvelllTGd4cGVwRU5XSGl0emxBekRNOWZIMURxT3pi?=
 =?utf-8?B?Z2gzOU0weU9kbzZVdFNheVJDK1FhVEZIb0pNYUQxbkxFQzF6KzBvbkdxdzJU?=
 =?utf-8?B?S2dra0x3SFlHa2RqUmhqNEpEV2NwMkNkcTFWYVVvUlN6dXFGL2RjQ2RzeUpn?=
 =?utf-8?B?SUdwQmg2dUpDZmdJOEN0N2dUTWJmd1gybWNjKzVNRzhhWUpFcVNPdlZqWUdx?=
 =?utf-8?B?VTVSaUtjV3dzNUJxNlVRYUtVN3dYSkh5TTR3VGtwOWhvME5NV09TSjdsS3VB?=
 =?utf-8?B?MnhkWGluQTI2VVViRmFBK1poSlNidlRwMVlnYmZxZG9YVWlad0FSbkxXaFhL?=
 =?utf-8?B?b3ZNNVAwK2JMeDFBWTg5R0NXYmlkOEU4NVpjZ3lFSjdxWE9XOU9CbEhyYmFH?=
 =?utf-8?B?dGtJQTR6aEl0NGlSeDJ2NnNiSTJCTE1pZmVzaGtNRTJGSnBEKzIyNElFNU9D?=
 =?utf-8?B?VjNra25mOUhMS0pwUmtyNjMzWGxtYXZDSUhWRlVjRDlSbXdTNTF5b2NWZEZJ?=
 =?utf-8?B?djluTmVsRnkvSGlUUWRsSnEyNDJuQzByMng0Vi96WUg4eDdZNS9UdVc1VnJ4?=
 =?utf-8?B?OTFQd3Q2RFVWWHQzOGl6RzlSNFBhUUdoUStIUFdhR1ppVE1wTGJTU2s2Sk0y?=
 =?utf-8?B?ZkVkemlIUStzdDQvMFp4ZXVhbDdIUWNUbEw1WFpncXpnN21GMTk5Qkl1TFkw?=
 =?utf-8?B?QUxiYlIzRWxrVFFFYWFsRzI4TTZuUFkxb0J2b2pHbEt4Rm43UWpNLytLKytG?=
 =?utf-8?B?c1RPWHhvamJONXZBUlFybXJicytIbUI2N2p5c0xoNmJpUlhuQndhM1ZUK1NS?=
 =?utf-8?B?cGZxcTd5ZCtibng5TGgyOTFNNjVjakg1bFFFV1orR3VabVBDTndBWjlQMVNN?=
 =?utf-8?B?c2JNQXlwMVdEbElockZyR1ppUHFtclV4ek9vV3pVQmExd2ZQYmJyVUtmT2FU?=
 =?utf-8?B?RFRMUTdlSFpBZ1J6QkU4UVBXaTI1ZEtBOVVyeG9Ya0ozNWRkQmZEeWJUSHJ6?=
 =?utf-8?B?MlJVZkZIdlJXWGZrQWRhZ3FRQWZwL2V3NHNIMGFwbi9UQW1keXREdytxd0NN?=
 =?utf-8?B?T240dnl6VWl0Qjlodkd5WUdvNHB2WThMeUJxVnJHVmd2LzltSVBZMGNjTGhS?=
 =?utf-8?B?TUNPQ3QrMHEwdk1pczUrU3RZeUg1WTdGWHg1dVJGZENSRFVzVXhUYWxSc3hh?=
 =?utf-8?B?K0RtckNWZ0d3eHpCSHR6QXVGRkdIQm45WnFiL2dTMzF2VFMwY2ZyWEZDTnB3?=
 =?utf-8?B?ZW9oNHlJTEJLOUQ1aURvb0RnZkdNaTlmbDdaNmRIZjE3M2dHNUpTOHZHQ1Vq?=
 =?utf-8?B?M3IwbVFpaHRtQ3FmdWx0MG1zV1ZsK2xUN0xtbFJwQ2tFVE85ZWZiVENYSjN3?=
 =?utf-8?B?c1Z1TFVSdFFXOGVOV3ZFM2F5NUFFV0tYTmhrQ3JleG1EWi9qMHp5L2lSY0VO?=
 =?utf-8?B?azJTaDhac3NwVThHSUs5YlA0TU11c1RzL0pOSW92cmZlWGxwNERTcmN4NmFo?=
 =?utf-8?B?ZjdhNkRyWWQ5V2pRcGIrR2RXd1NTTk5BL1g1OWxpVG5Ja3VhVHVKdU15ZVpz?=
 =?utf-8?B?UGJ1R0NLQkR5cXlQcHplcXhmbzh6MkEyZmNKQnhaOFdtZTRGR1RhSGxPK1hS?=
 =?utf-8?B?cVFtVG90R2lwa0JhU1NNQnZaNjllSjZuSjNUeFNuZkpOT2FjQTBPTHp6Q0RB?=
 =?utf-8?Q?0FqDME2BSyzNMoF3r9LUk5Iq5?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b03b63d-064b-4099-bcf0-08dd076cee52
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2024 01:04:19.2515
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vPfoVXr1eEPpzJlT5qN6ntKFZICqKIRYkI12glm/YJsN81YzpfOhygLl8zujAJ9nIfTFvzCqhkoja3K+WCD7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7065
X-OriginatorOrg: intel.com

SGksDQoNClllcywgU2Ftc3VuZyBsaWtlbHkgZGV2ZWxvcGVkIGN1c3RvbSBmaXJtd2FyZSBiYXNl
ZCBvbiB0aGUgRmlybXdhcmUgRGV2ZWxvcG1lbnQgS2l0IChGREspDQpwcm92aWRlZCBieSBJbnRl
bGFuZCBzaWduZWQgaXQuIFdoZW4gdGhlIGZpcm13YXJlIGlzIGxvYWRlZCBhbmQgdGhlIGZpbGUg
aXMgZGV0ZWN0ZWQgdG8gYmUgaW5jb3JyZWN0LA0KaXQgd2lsbCBwcmludCB0aGUgbG9nIOKAnFsg
NC40MzA2NzVdIGludGVsX2lzaF9pcGMgMDAwMDowMDoxMi4wOiBJU0ggbG9hZGVyOiBjbWQgMiBm
YWlsZWQgMTDigJ0uDQoNClRoZSB2ZW5kb3IgY2FuIHVwc3RyZWFtIHRoZWlyIGZpcm13YXJlIGJp
bmFyeSB0byBsaW51eC1maXJtd2FyZS5naXQgYWNjb3JkaW5nIHRvIHRoZSBuYW1pbmcgcnVsZXMN
Cm1lbnRpb25lZCBpbiBodHRwczovL2RvY3Mua2VybmVsLm9yZy9oaWQvaW50ZWwtaXNoLWhpZC5o
dG1sI3ZlbmRvci1jdXN0b20tZmlybXdhcmUtbG9hZGluZy4NCg0KVGhhbmtzLA0KTGl4dQ0KDQo+
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBtZWx2eW4gPG1lbHZ5bjJAZG5zZW5z
ZS5wdWI+DQo+U2VudDogU3VuZGF5LCBOb3ZlbWJlciAxNywgMjAyNCAxOjMyIEFNDQo+VG86IHNy
aW5pdmFzIHBhbmRydXZhZGEgPHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPjsg
bGludXgtDQo+aW5wdXRAdmdlci5rZXJuZWwub3JnDQo+Q2M6IGppa29zQGtlcm5lbC5vcmc7IFpo
YW5nLCBMaXh1IDxsaXh1LnpoYW5nQGludGVsLmNvbT4NCj5TdWJqZWN0OiBSZTogaW50ZWxfaXNo
X2lwYzogbG9hZGVyIGZhaWx1cmUgb24gTHVuYXIgTGFrZQ0KPg0KPlRoaXMgd2FzIGNvcnJlY3Qs
IEkgbWlzc2VkIHRoZSAiSVNIIGV4dGVuc2lvbiIgZHJpdmVyIG9uIHdpbmRvd3Mgd2hpY2gNCj5w
cm92aWRlZCBhIGRpZmZlcmVudCBJU0ggZmlybXdhcmUuIExvYWRpbmcgaXQgb24gbGludXggcmVu
ZGVycyB0aGVzZSBzZW5zb3JzDQo+ZnVsbHkgd29ya2luZy4NCj4NCj5VbmZvcnR1bmF0ZWx5LCBJ
IGNvdWxkbid0IGZpbmQgYW55IGxpY2Vuc2UgaW5mb3JtYXRpb24gYXBhcnQgZnJvbSB0aGUgIklO
VEVMDQo+UFJPUFJJRVRBUlkiIGhlYWRlciBpbiB0aGUgSU5GIGZpbGUsIHdoaWNoIFNhbXN1bmcg
cHJvYmFibHkganVzdCBsZWZ0IGZyb20NCj50aGUgSW50ZWwtcHJvdmlkZWQgZXh0ZW5zaW9uIHRl
bXBsYXRlOyB0aGUgZmlybXdhcmUgcHJvYmFibHkgY2FuJ3QgYmUNCj51cHN0cmVhbWVkIHdpdGhv
dXQgdmVuZG9yIGNvb3BlcmF0aW9uICh1bmxpa2VseSBoZXJlKS4NCj4NCj5UaGFuayB5b3UgZm9y
IHRoZSBhc3Npc3RhbmNlIQ0KPg0KPi1tZWx2eW4yDQo+DQo+T24gMTEvMTYvMjQgMDk6NDUsIHNy
aW5pdmFzIHBhbmRydXZhZGEgd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiArIExpeHUNCj4+DQo+PiBJ
dCBpcyBsaWtlbHkgdGhhdCBTYW1zdW5nIG5lZWRzIHRoZWlyIG93biBmaXJtd2FyZS4NCj4+DQo+
PiBUaGFua3MsDQo+PiBTcmluaXZhcw0KPj4NCj4+IE9uIEZyaSwgMjAyNC0xMS0xNSBhdCAxNTox
OCAtMDUwMCwgbWVsdnluIHdyb3RlOg0KPj4+IFRvdGFsbHkgbWlzc2VkIHRvIENDIHRoZSBtYWlu
dGFpbmVycywgc29ycnkhDQo+Pj4NCj4+PiAtbWVsdnluMg0KPj4+DQo+Pj4gT24gMTEvNy8yNCAy
MTo0MiwgbWVsdnluIHdyb3RlOg0KPj4+PiBIZWxsbywNCj4+Pj4NCj4+Pj4gVGhlIGludGVsX2lz
aF9pcGMgZHJpdmVyIHNlZW1zIHRvIGZhaWwgb24gbXkgbWFjaGluZS4gSXQncyBhDQo+Pj4+IGx1
bmFyLWxha2UgYmFzZWQgY29udmVydGlibGUgKHNhbXN1bmcgZ2FsYXh5IGJvb2s1IC4uLikgd2hp
Y2ggc2hvdWxkDQo+Pj4+IHByb3ZpZGUgYWNjZWxlcm9tZXRlci9neXJvc2NvcGUvbGlkIHRpbGQg
SElEIGlucHV0cy4gVGhlc2Ugd29yayBvbg0KPj4+PiBXaW5kb3dzIGZ1bGx5LCBidXQgZG8gbm90
IGFwcGVhciB0byB3b3JrIG9uIDYuMTJyYzUuIEFsbCBJIGhhdmUgdG8NCj4+Pj4gZ28gb24gYXJl
IHRoZSBmb2xsb3dpbmcga2VybmVsIGxvZyBsaW5lczoNCj4+Pj4NCj4+Pj4gLi4uDQo+Pj4+IFvC
oMKgwqAgNC40MTY3MThdIGludGVsX2lzaF9pcGMgMDAwMDowMDoxMi4wOiBJU0ggbG9hZGVyOiBs
b2FkDQo+Pj4+IGZpcm13YXJlOg0KPj4+PiBpbnRlbC9pc2gvaXNoX2xubG0uYmluDQo+Pj4+IFvC
oMKgwqAgNC40MzA2NzVdIGludGVsX2lzaF9pcGMgMDAwMDowMDoxMi4wOiBJU0ggbG9hZGVyOiBj
bWQgMiBmYWlsZWQNCj4+Pj4gMTANCj4+Pj4gW8KgwqDCoCA0LjQ0ODI2M10gaW50ZWxfaXNoX2lw
YyAwMDAwOjAwOjEyLjA6IElTSCBsb2FkZXI6IGNtZCAyIGZhaWxlZA0KPj4+PiAxMA0KPj4+PiBb
wqDCoMKgIDQuNDY3ODQ0XSBpbnRlbF9pc2hfaXBjIDAwMDA6MDA6MTIuMDogSVNIIGxvYWRlcjog
Y21kIDIgZmFpbGVkDQo+Pj4+IDEwDQo+Pj4+IC4uLg0KPj4+Pg0KPj4+PiBUaGUga2VybmVsIGlz
IHZlcnkgY2xvc2UgdG8gbWFpbmxpbmUgKE5peE9TJ3MgbGludXgtdGVzdGluZykgYW5kDQo+Pj4+
IGRvZXNuJ3Qgc2VlbSB0byBoYXZlIGFueSBwYXRjaGVzIHdoaWNoIHdvdWxkIGFmZmVjdCB0aGlz
IGRyaXZlcg0KPj4+PiBzcGVjaWZpY2FsbHkuDQo+Pj4+DQo+Pj4+IElmIHRoZXJlJ3MgYW55IGZ1
cnRoZXIgaW5mb3JtYXRpb24gSSBjYW4gY29sbGVjdCBwbGVhc2UgbGV0IG1lIGtub3cuDQo+Pj4+
IEl0J3MgbXkgZmlyc3QgdGltZSB0cnlpbmcgdG8gdXNlIGEga2VybmVsIG1haWxpbmcgbGlzdCwg
c28gYXBvbG9naWVzDQo+Pj4+IGlmIHRoaXMgaXMgdGhlIHdyb25nIHBsYWNlIG9yIEknbSBtaXNz
aW5nIHNvbWV0aGluZyBlbHNlLg0KPj4+Pg0KPj4+PiBUaGFuayB5b3UsDQo+Pj4+DQo+Pj4+IG1l
bHZ5bjINCg==

