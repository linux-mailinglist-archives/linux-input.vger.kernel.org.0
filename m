Return-Path: <linux-input+bounces-14927-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2117B89DC4
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 16:20:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 768F05A0265
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 14:20:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B34A258ECF;
	Fri, 19 Sep 2025 14:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ld0Leen2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13ABF20E005;
	Fri, 19 Sep 2025 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291612; cv=fail; b=AXS+s2RorVfcEeDNALdeg6FfwWF1cSIiXZx/Tsr1VQSUpKMOLriZnQvvNNXdZG4EWwxdT9ES5zxLYf6HrQRQ5hY2OQWXzDkPRwa0NmV3A2EgvBOLqCMB2pb3iAI+rBv/8W9/UHskhrEA2HZR/OXvZ4v8L/jTLnijOroygtVYoSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291612; c=relaxed/simple;
	bh=W7wV0138yO02kz9gpRZSMDBRz5gTPvz7SMh1usc4Ioc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qSX6Fo+evslAoKO5jfygsIqI4zHlAylC+tFy3R/eLxTrqHZQCr/FUWWI/DyZaG2fupB51PnkL8t/Xa+uivZu8XqrfDp9epKEETciZZO6ippWL7A+zMjxRmiybPJFFcdDOAnmpczOMtFsTOhaZDdoYHBLVwLecLPg/hcqb105G4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ld0Leen2; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758291610; x=1789827610;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=W7wV0138yO02kz9gpRZSMDBRz5gTPvz7SMh1usc4Ioc=;
  b=Ld0Leen2nnqu6c4ATIGpbBOp3e4fE6QLDpKiMOa3FDWF1uUUViNaNwqo
   /MvDi86qzBaFJAQHgDt0ty13fDL9YHMy1ebNLk0+DkDYbKLifF9idljOi
   8uhmWO5wzqR1Nc8HXwOwqNoCShWAq4vqA1Of/84ZMcTO+cZKV4aKFFSIL
   SRyS0TtaKxJt05zXaZ1qRXdJuMtKRZfhUp1CcQkD9GHsx4erX7/CpSJAA
   71N2biOpipVwvyXXS7SSRg88OmCRrsume1HQIwTJjMdnBQFCA2wGmjbX6
   zVL157qmVsSISlXintxWIidK1Wq/cN4Vjxpp8/ysLamY2ck3vp2K62bi5
   w==;
X-CSE-ConnectionGUID: 4V91wx7hRbGAbslEfCRwSA==
X-CSE-MsgGUID: pHBJ1I8KTKOYnVphJfVOLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60332626"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60332626"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:20:10 -0700
X-CSE-ConnectionGUID: Nk/HXpf4TkqRE395nwSD+Q==
X-CSE-MsgGUID: eoeRw37WToKqlKjnvJLZWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175660960"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 07:20:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 07:20:08 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 19 Sep 2025 07:20:08 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 19 Sep 2025 07:20:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPZ9nT0Z3KGujdkLx7CTNKU3p+d6hihtSZBUuujnV7uPzsPQjM6cGqCRQxT1rjz/VUOpqVjZbq8sFJkWQxn89U4v+BcC2F4v+0mFUIIBKX95u2a+tmg0WCPJSJYceA9KlbviNdgVp9+lEGD7sH4SsQ4BQIgvntGZbR2uiAHDdsy+0YSX41m4b7fRiToBq7pJnGSWZ6iiJDp2zyrVWe/MXZraMkqhu3+Jdq7ILvKIxQF62Ntebj6gN8XYWD577ZLvjbuHghDtv0ycwivQqIQkNt7gpYE6t/EBHa45ezMTUPaMlh22hDX7sDbqzVOoOmlc7CS6qifOyX67+fpYvA9opw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7wV0138yO02kz9gpRZSMDBRz5gTPvz7SMh1usc4Ioc=;
 b=DMY7E6gsrL0gFz/aUB30mf7KwW/yUzK+A7IwtBOLFBKLHlxA39LkgTlcTHZJKywx4kaxzb2bmpf8OroQuF+RJQuOKmiGYOWKy2MwTLVtcIVVprdTnMI7xpitEvLF1lHToRQCVzxAbq/Ad4lXqykY4oGglR/k9a5ccdq4ULT8UlJujL9diIImOhLWELwnBa9K/ZEuVEFOFdILmYqXK3gKTZp4pnV4fEGdthQkuqexuGURaC8emdrDLjy/GGin4uofw7WaxGgZc1ZWJ9Ct20hygWAWs4w3W4FpWkSn05CmxG8WSWpUpqIcfVQ90atnqXcol13XeudwgloxOu6//jqNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 DM4PR11MB6240.namprd11.prod.outlook.com (2603:10b6:8:a6::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.13; Fri, 19 Sep 2025 14:20:06 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::eaaf:292e:8706:bdfe%6]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 14:20:06 +0000
From: "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To: "Sun, Xinpeng" <xinpeng.sun@intel.com>, "jikos@kernel.org"
	<jikos@kernel.org>, "Xu, Even" <even.xu@intel.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "Zhang, Rui1"
	<rui1.zhang@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Topic: [PATCH v3 RESEND] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Index: AQHcKXB/Tml+qJueW0idH2yoH967Yw==
Date: Fri, 19 Sep 2025 14:20:06 +0000
Message-ID: <395082002847970ff3234b5b12175280d9117275.camel@intel.com>
References: <20250917015344.1169412-1-xinpeng.sun@intel.com>
	 <IA1PR11MB6098555DA1279BFFCC9CDD89F411A@IA1PR11MB6098.namprd11.prod.outlook.com>
In-Reply-To: <IA1PR11MB6098555DA1279BFFCC9CDD89F411A@IA1PR11MB6098.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|DM4PR11MB6240:EE_
x-ms-office365-filtering-correlation-id: a9406e5a-18e6-4d1f-a2dd-08ddf787a1e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info: =?utf-8?B?L05YemtWVERUWWNNQTZhNW1JTEgxKzhEUjBTSnplY2FnazNMZGJiWWpOc3d3?=
 =?utf-8?B?QWxoeE1nalJFZFdDNzdwaDNTWnBYY2ZHdXZtc2N6ZE8zaWlQRkRGT0p3R1px?=
 =?utf-8?B?QkhBckxrRzNoZWdQOXFrem4rbnUwcTlxano5RDF0YURqTWJVWERxM1p0WC9K?=
 =?utf-8?B?VjNSeDJmUGJ3M2U5cmgwcDFPcFVqdVdLS3ViSGpyUUF1WmNXRkw2bnh3Vlky?=
 =?utf-8?B?VVY3bnpZTDhWNnFJbWNOM1pSY1pvcmQzRlNSb3VURTBjb0RnWVlOOElTb0Ju?=
 =?utf-8?B?bzFhZmQyVzRLNzBlaW84emZkV3NWTTRSRHpVaGVCR1NmY0VOYmNsT3I1amxM?=
 =?utf-8?B?cFBwWkZRWVMweUcreDZxekFRZDNIbTF4OTN1SzdDUU56ZjVIb2lUNG00OEh1?=
 =?utf-8?B?bGVYTmpMQTEvaGJOV0c4YncvMlFZaTl1bnp5WEo2c3NrZDhieWZCa0dUcUY4?=
 =?utf-8?B?QXpjU0h0UEQ4MjltbWlZMk9qUzR3WWswUlFGYXBnZ1hYWXpSZm05VStzbC9Z?=
 =?utf-8?B?Q1hCbEtLejU0azZzN21RbnlzVjBQUXdObENKK0V3RVRUNVVubWFGQ0lvUS9u?=
 =?utf-8?B?RCtJNDhmM1htREh3WTA3MkhLbk92NzVJYk1xczY1K0ZOQXE3cnNHUmR3OHFS?=
 =?utf-8?B?c0lIV3lSR2ZTRGF0SWJlbndDbHF4eWZycmlSaVljVWU0NXhrZDk5VlkrQzJj?=
 =?utf-8?B?dkJGd1h5ekh0ZWRyZ2x5Y21YeTF4bm4wRTMrWkt6UWJjcGxwSHIvcTF1alpE?=
 =?utf-8?B?VzNIUW5ibWlxVmRaZ3BSSkpSMExLZmdLU0dyMVdFcnNzR0hHWmE5cFp4QUox?=
 =?utf-8?B?dUxUSWFnaDJ4SmlNL3luVHFmRm1SNjdwYmQyR2JOU3FFL01nM0swejNKWnR0?=
 =?utf-8?B?ZUIxU0JWTCtwdS9FdjVLYjFubXVuY3RFSmZhM0llSTIzbDE1SnkwM25WVWVs?=
 =?utf-8?B?Vmw3WGRZUUxXY094YVdjSzZyL2xGcnREQjRNN0t6UkVQWlhQRUhneTh1V2lx?=
 =?utf-8?B?dEJCR3dDUndoR1JXZVNqdFJMdkE0TEFnTkxvcndZZCsrbkdkeUx3dEZGQllS?=
 =?utf-8?B?ei9NcUFKa3EvUFZGaktNTnlQeFdsZkNYM05vVjVLVEU1Mi84cHZTT2FEcnpL?=
 =?utf-8?B?S2QrbEFndlVLdVdqazdIUTdrbXg5ektNNitMaGJSNDNVNkx6Y0JTZDhtWFBN?=
 =?utf-8?B?MlRIU04wYTFrQ0g5SWdiQXVPNW5Lak4wZXNNZzFQZXBlZmxjeVROemdUZHJY?=
 =?utf-8?B?eG84VE1zM0gyWThIVi9vbk1YSTZSWlFteVJJbFMxUDhnME1ETWdMNzNraWdT?=
 =?utf-8?B?a3lYWWI2ZE44ZUl5TTZSMEM5dGZYVUk1OHhpb1RDZHdCTFBNQUZHQjdUT0pa?=
 =?utf-8?B?YTYzdWlXam84UmdiNzBsdi9TYnFNMlIrN0pNdmNCcDlJbE9tMk1LMklTOU9h?=
 =?utf-8?B?SFFsdXlaZDg3MndXNHFzTDM3a1UxcmZhYnQ2YjQ1WlNrQ3Z0UExqQ2dpWk1F?=
 =?utf-8?B?TWdZUTA1WTE3UWFoSm1jMEJDa1B2aUkvZnN4U3EvNGdpcXJ3SS9LR2tTR05B?=
 =?utf-8?B?WUY3aWR0K0VoL3hMVEJtQk4vOTFLaGFXRnIxNVM2RFJWek5jaDJqUE9sMzFl?=
 =?utf-8?B?M3hHMVVZd3pteWN1RzBYcDQrRUUxejhaajVaL3NLZGdUemRKdFdzSUNmeHMw?=
 =?utf-8?B?TEs4aHlsQUl1NE9YOUh4U25PZFkzRS9CU1dUUEtIQm1rck1sampNdU9obFRx?=
 =?utf-8?B?ckY1V1RoMEl0Q0QzOUVFUUpuN1NJKzVxUWFJMTNFMUlUNnFzdHAzUzF4UExD?=
 =?utf-8?B?MlEzZGNRV3VaVVltVU51N0hHQ2s3MGM4Q3l3cmExVVVyWXpnTkVVeFR3d3ZH?=
 =?utf-8?B?VUxQREhiM0dWMkpwL3RXenZPaEYrbWREaHVRTW9CNGJtc0hhU1BGSmhlekxx?=
 =?utf-8?B?ZTVYNC9MTTE3bHkyeVZvZStvZURuODkwNVY2elVSakVEUDRsV2tPeEpTN2lB?=
 =?utf-8?Q?fm0svbecTwctSvAOuQZApopDno022o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czlYKzdrTEo3aHdzdU95UjNPY0tSUTc2VnorL1MrbEpreW1pMURleUo3R3Z5?=
 =?utf-8?B?RzZtQ0pQU2N5Y0JEVUNocU9HM0hkQWxqOVNsNFN2LzdQWVZiZGx5NVBKbHRs?=
 =?utf-8?B?K2FCRS9HakYrVy84UXRMNi8zR3l4RVdnRVVKMnFNSCsyZk5MbGdlOWtJUkFC?=
 =?utf-8?B?VDEvWTRmUXR4K0J6QnB0TWNaT0UrVXVrMGphdWxWTHlTRkdQNTJ1VDJIUUFr?=
 =?utf-8?B?eWphVis3aGJaeVl3eGZUZ081blp6a3JIS09NNEhGVlpaZWNzSFVxcHRBNGJa?=
 =?utf-8?B?Zkh6cVNFKzZ5c3d4SW1VZFNGa0lad1hFZlVVTDVjcHAyT3Q2cTdxaS92WXpO?=
 =?utf-8?B?bXU3OElnMmJMZU40RnpNV2tqbldiYTVtS1I4QUxTRmZMbkQwRnp4aHY4WEx4?=
 =?utf-8?B?SGk2dVhVRkdMMUZGR3NhYTZDUHU1OHF0THNRYTN3a3cvRjZxS3lBUVVKL2tL?=
 =?utf-8?B?NzlsOVpFYk1ka21KSG5qMWc3WVc0MGVQRlgvQlB1ZVZCbFIybHVpS21tQVk0?=
 =?utf-8?B?OGdoNFlmNy9DWWxBQ3VySWZtdVRvbmpNZU5XQVQ2YStZTmMwQXRsTGNnL3Y4?=
 =?utf-8?B?RkpVdjdyNE9KQU1QTCtuRFRrT2Q0M0tPd3U0cHdkLzB3YlJvQm9jVVAvYmNK?=
 =?utf-8?B?Yk9raER0OURwQm96ZFlGVFBsUWZmNStEYVRpeTJyM3BhT21yV2EwVE1EUUNB?=
 =?utf-8?B?Zlo2cUE2UlhGcGF6UGxJZVhiVkV4b3J4NUdGQkxDdnhmYWNZUkY1ZEI4Nllx?=
 =?utf-8?B?Y1pYdnd4M3FHR3pmTzZMNVVia0JoVXVkN1ZxNjlSRU5wOFhpSTVFRzBHblhK?=
 =?utf-8?B?NVRqUTlCWlhzT2hDV255VjZhRmtVcTR1N2hMZkluVzAwd0JSWEVzWmp1Z1hY?=
 =?utf-8?B?NEtlZVpvVTFQQnhSS0dtTWhWQUdvNFdxK09RbVhSazR1cDRVZkFmZjVkOUlv?=
 =?utf-8?B?enRmZUh4Z3MzUWt0L0hZNkNFQXcrMDV2MVF6cHgxY3p4QWFCUDRDWTNJV0py?=
 =?utf-8?B?TUNqOUJXK0lMcEJWQk5Dcyt3ZUowUktyWXZ1ZzFwYmNCYmlrOGYyMTJScDZs?=
 =?utf-8?B?bXFtUTcwczdTeTM1TWViNjl4RXpHby9rZ1NUc3o1akJVUlA0OXkvR1JDUWdT?=
 =?utf-8?B?Ni9QRHJLOFMvdzdVNnBpeDRKMFVwcFc3UVYxZ2lDeWlQR2pRTkI4dkt2b1NS?=
 =?utf-8?B?ZGNUeVBaRU9oWDFDRldaL0hlRDhORW1COHR0TjVBbllXK2srVmhmaTBoamo5?=
 =?utf-8?B?M0JYSlA3bnZDSGZ2MVZ6Z0sxS0xaaG44STJ6UFBIa20zaXBzaU1SLzNYL2Ju?=
 =?utf-8?B?MENiVDYyNFZCako1dVF2RHhGQU90ekR0U1R3ODA2WjF3MHVQL0VoLzZKcTc0?=
 =?utf-8?B?NW0zb2hCMndjbkY2b25YSzF0NUxKODdUa2c1QU1BSTIzbGVIekVnem5DVldU?=
 =?utf-8?B?TTQ1YWtHMGRucVZPVk5KY3JPdS9xMW1QdG5IcG94dzYzbEJ3M3kzK29CWlQ5?=
 =?utf-8?B?ZkFMMVN4MnVabTFidlM4V2pEQVl6NFM5Z2FZTytlM2dnQ05DSlB3cmloUkxR?=
 =?utf-8?B?d3JUbFd3bEthNUMyYS9vK3h6S3BtMmVOSndvVHEwN1hHZzVlSXFSMkErQmFp?=
 =?utf-8?B?bXJkNmovSGhtQXhkQUNpYUZLQk84SzgxazlNQ0s2R3huQ1NNaXJYUGtWSHNF?=
 =?utf-8?B?S2tVL0g1OExpWjhWTXFZZjRVTVpTWCtvZkYrSktIY3EzZHIxY01Td0hNK2sr?=
 =?utf-8?B?ZFh1Rk1uTUZHcTk0VW5TWGQxL2JJWk04dDlCcXpqa0VIZUtiMXRBK1lmNVZO?=
 =?utf-8?B?OFM1UnR0ZTJtTzFFTHFDQnpyOHB6WVQwSWREOWtlOVlKR0tXWlR4TnkycnZQ?=
 =?utf-8?B?eklra3R3ZWpBZkJmNmtFdzVNMFNGYS8xNmJHbWJtS2tlZWpucW1pSnZxYk5U?=
 =?utf-8?B?b2lKQytUSGE1ZFBPamd1bUJHUzhMbXRpNEpYZXYzTFl1cG80Q0VGZXRmZ3Nt?=
 =?utf-8?B?WXIzSldRc3J4SHVIWGcrdlhVbHhRYmZTUE40c0FYQmI1MWt3M3JITmpkVm9M?=
 =?utf-8?B?UFpiNEgxZHQ4M0ZEWU1nUVYyOFJwWlJrK0x6aTNyS29kejVadEdoeFRnYlN2?=
 =?utf-8?B?WWYwY2tSdy9DTEdpOUlOWVYvSkVMd2R1OG5LODJNQTNjdnhRSm4wd3ZhZkRv?=
 =?utf-8?Q?4GMgOi7Z1rnOif91DPSVyxc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BEDD3AA0504D442B233AD84D9199682@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9406e5a-18e6-4d1f-a2dd-08ddf787a1e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 14:20:06.4646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+qrTz6IYhML5R+sotWVI4glWTGJnlVICPH2Q62WmOhDTVnKptUGL40zEVF0kCJHGO+G7l6CQPiBopCDEX5uf+bom6wAlMVOKFG2GU6657Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6240
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA5LTE5IGF0IDA3OjU2ICswMDAwLCBYdSwgRXZlbiB3cm90ZToNCj4gDQo+
IA0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogU3VuLCBYaW5wZW5n
IDx4aW5wZW5nLnN1bkBpbnRlbC5jb20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBTZXB0ZW1iZXIg
MTcsIDIwMjUgOTo1NCBBTQ0KPiA+IFRvOiBqaWtvc0BrZXJuZWwub3JnOyBiZW50aXNzQGtlcm5l
bC5vcmcNCj4gPiBDYzogc3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb207DQo+ID4g
bGludXgtaW5wdXRAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gPiBrZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBTdW4sIFhpbnBlbmcNCj4gPiA8
eGlucGVuZy5zdW5AaW50ZWwuY29tPjsgWmhhbmcsIFJ1aTEgPHJ1aTEuemhhbmdAaW50ZWwuY29t
Pg0KPiA+IFN1YmplY3Q6IFtQQVRDSCB2MyBSRVNFTkRdIGhpZDogaW50ZWwtdGhjLWhpZDogaW50
ZWwtcXVpY2tpMmM6DQo+ID4gc3VwcG9ydCBBQ1BJIGNvbmZpZw0KPiA+IGZvciBhZHZhbmNlZCBm
ZWF0dXJlcw0KPiA+IA0KPiA+IFRoZXJlIGlzIGEgbmV3IEJJT1MgZW5oYW5jZW1lbnQgdGhhdCBh
ZGRzIHRoZSBjYXBhYmlsaXR5IHRvDQo+ID4gY29uZmlndXJlIHRoZQ0KPiA+IGZvbGxvd2luZyB0
d28gZmVhdHVyZXMgb2YgSTJDIHN1YnN5c3RlbSBpbnRyb2R1Y2VkIGluIGNvbW1pdA0KPiA+IDFl
ZDBiNDgNCj4gPiAoIkludGVsLXRoYzogSW50cm9kdWNlIG1heCBpbnB1dCBzaXplIGNvbnRyb2wi
KSBhbmQgY29tbWl0IDNmMmE5MjENCj4gPiAoIkludGVsLXRoYzogSW50cm9kdWNlIGludGVycnVw
dCBkZWxheSBjb250cm9sIik6DQo+ID4gLSBNYXggaW5wdXQgc2l6ZSBjb250cm9sDQo+ID4gLSBJ
bnRlcnJ1cHQgZGVsYXkgY29udHJvbA0KPiA+IA0KPiA+IEFzIEJJT1MgaXMgdXNlZCBmb3IgdGhl
IGNvbmZpZ3VyYXRpb24gb2YgdGhlc2UgdHdvIGZlYXR1cmVzLCBjaGFuZ2UNCj4gPiBkcml2ZXIg
ZGF0YQ0KPiA+IHVzYWdlIHRvIGluZGljYXRlIGhhcmR3YXJlIGNhcGFiaWxpdHksIGFuZCBhZGQg
Y29ycmVzcG9uZGluZyBBQ1BJDQo+ID4gY29uZmlndXJhdGlvbg0KPiA+IHN1cHBvcnQgaW4gUXVp
Y2tJMkMgZHJpdmVyLg0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpbnBlbmcgU3VuIDx4aW5w
ZW5nLnN1bkBpbnRlbC5jb20+DQo+ID4gVGVzdGVkLWJ5OiBSdWkgWmhhbmcgPHJ1aTEuemhhbmdA
aW50ZWwuY29tPg0KDQpBZGQgeW91ciByZXZpZXdlZC1ieSBoZXJlLi4NCg0KPiA+IA0KPiA+IC0t
LQ0KPiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gwqAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBpbml0aWFs
aXphdGlvbiBvZiBsb2NhbCB2YXJpYWJsZXMgQ2hhbmdlcyBpbg0KPiA+IHYyOg0KPiA+IMKgLSBy
ZWZpbmUgdGhlIGNvbW1pdCBtZXNzYWdlDQo+ID4gLS0tDQo+ID4gwqAuLi4vaW50ZWwtcXVpY2tp
MmMvcGNpLXF1aWNraTJjLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAzOQ0KPiA+ICsrKysr
KysrKysrKysrKy0tLS0NCj4gPiDCoC4uLi9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDI0ICsrKysrKysrKysrLQ0KPiA+IMKgMiBmaWxlcyBj
aGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktDQo+
ID4gcXVpY2tpMmMuYw0KPiA+IGIvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlj
a2kyYy9wY2ktcXVpY2tpMmMuYw0KPiA+IGluZGV4IDg1NDkyNmIzY2ZkNC4uM2NlNWE2OTJiOTJi
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tp
MmMvcGNpLXF1aWNraTJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2lu
dGVsLXF1aWNraTJjL3BjaS1xdWlja2kyYy5jDQo+ID4gQEAgLTIzLDYgKzIzLDcgQEANCj4gPiAN
Cj4gPiDCoHN0YXRpYyBzdHJ1Y3QgcXVpY2tpMmNfZGRhdGEgcHRsX2RkYXRhID0gew0KPiA+IMKg
CS5tYXhfZGV0ZWN0X3NpemUgPSBNQVhfUlhfREVURUNUX1NJWkVfUFRMLA0KPiA+ICsJLm1heF9p
bnRlcnJ1cHRfZGVsYXkgPSBNQVhfUlhfSU5URVJSVVBUX0RFTEFZLA0KPiA+IMKgfTsNCj4gPiAN
Cj4gPiDCoC8qIFRIQyBRdWlja0kyQyBBQ1BJIG1ldGhvZCB0byBnZXQgZGV2aWNlIHByb3BlcnRp
ZXMgKi8gQEAgLTIwMCw2DQo+ID4gKzIwMSwyMQ0KPiA+IEBAIHN0YXRpYyBpbnQgcXVpY2tpMmNf
Z2V0X2FjcGlfcmVzb3VyY2VzKHN0cnVjdCBxdWlja2kyY19kZXZpY2UNCj4gPiAqcWNkZXYpDQo+
ID4gwqAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gPiDCoAl9DQo+ID4gDQo+ID4gKwlpZiAocWNk
ZXYtPmRkYXRhKSB7DQo+ID4gKwkJcWNkZXYtPmkyY19tYXhfZnJhbWVfc2l6ZV9lbmFibGUgPQ0K
PiA+IGkyY19jb25maWcuRlNFTjsNCj4gPiArCQlxY2Rldi0+aTJjX2ludF9kZWxheV9lbmFibGUg
PSBpMmNfY29uZmlnLklOREU7DQo+ID4gKw0KPiA+ICsJCWlmIChpMmNfY29uZmlnLkZTVkwgPD0g
cWNkZXYtPmRkYXRhLQ0KPiA+ID5tYXhfZGV0ZWN0X3NpemUpDQo+ID4gKwkJCXFjZGV2LT5pMmNf
bWF4X2ZyYW1lX3NpemUgPQ0KPiA+IGkyY19jb25maWcuRlNWTDsNCj4gPiArCQllbHNlDQo+ID4g
KwkJCXFjZGV2LT5pMmNfbWF4X2ZyYW1lX3NpemUgPSBxY2Rldi0+ZGRhdGEtDQo+ID4gPiBtYXhf
ZGV0ZWN0X3NpemU7DQo+ID4gKw0KPiA+ICsJCWlmIChpMmNfY29uZmlnLklORFYgPD0gcWNkZXYt
PmRkYXRhLQ0KPiA+ID5tYXhfaW50ZXJydXB0X2RlbGF5KQ0KPiA+ICsJCQlxY2Rldi0+aTJjX2lu
dF9kZWxheSA9IGkyY19jb25maWcuSU5EVjsNCj4gPiArCQllbHNlDQo+ID4gKwkJCXFjZGV2LT5p
MmNfaW50X2RlbGF5ID0gcWNkZXYtPmRkYXRhLQ0KPiA+ID4gbWF4X2ludGVycnVwdF9kZWxheTsN
Cj4gPiArCX0NCj4gPiArDQo+ID4gwqAJcmV0dXJuIDA7DQo+ID4gwqB9DQo+ID4gDQo+ID4gQEAg
LTQ0MSwxNyArNDU3LDI0IEBAIHN0YXRpYyB2b2lkIHF1aWNraTJjX2RtYV9hZHZfZW5hYmxlKHN0
cnVjdA0KPiA+IHF1aWNraTJjX2RldmljZSAqcWNkZXYpDQo+ID4gwqAJICogbWF4IGlucHV0IGxl
bmd0aCA8PSBUSEMgZGV0ZWN0IGNhcGFiaWxpdHksIGVuYWJsZSB0aGUNCj4gPiBmZWF0dXJlIHdp
dGgNCj4gPiBkZXZpY2UNCj4gPiDCoAkgKiBtYXggaW5wdXQgbGVuZ3RoLg0KPiA+IMKgCSAqLw0K
PiA+IC0JaWYgKHFjZGV2LT5kZGF0YS0+bWF4X2RldGVjdF9zaXplID49DQo+ID4gLQnCoMKgwqAg
bGUxNl90b19jcHUocWNkZXYtPmRldl9kZXNjLm1heF9pbnB1dF9sZW4pKSB7DQo+ID4gLQkJdGhj
X2kyY19zZXRfcnhfbWF4X3NpemUocWNkZXYtPnRoY19odywNCj4gPiAtCQkJCQlsZTE2X3RvX2Nw
dShxY2Rldi0NCj4gPiA+IGRldl9kZXNjLm1heF9pbnB1dF9sZW4pKTsNCj4gPiArCWlmIChxY2Rl
di0+aTJjX21heF9mcmFtZV9zaXplX2VuYWJsZSkgew0KPiA+ICsJCWlmIChxY2Rldi0+aTJjX21h
eF9mcmFtZV9zaXplID49DQo+ID4gKwkJwqDCoMKgIGxlMTZfdG9fY3B1KHFjZGV2LT5kZXZfZGVz
Yy5tYXhfaW5wdXRfbGVuKSkgew0KPiA+ICsJCQl0aGNfaTJjX3NldF9yeF9tYXhfc2l6ZShxY2Rl
di0+dGhjX2h3LA0KPiA+ICsJCQkJCQlsZTE2X3RvX2NwdShxY2Rldi0NCj4gPiA+IGRldl9kZXNj
Lm1heF9pbnB1dF9sZW4pKTsNCj4gPiArCQl9IGVsc2Ugew0KPiA+ICsJCQlkZXZfd2FybihxY2Rl
di0+ZGV2LA0KPiA+ICsJCQkJICJNYXggZnJhbWUgc2l6ZSBpcyBzbWFsbGVyIHRoYW4NCj4gPiBo
aWQgbWF4IGlucHV0DQo+ID4gbGVuZ3RoISIpOw0KPiA+ICsJCQl0aGNfaTJjX3NldF9yeF9tYXhf
c2l6ZShxY2Rldi0+dGhjX2h3LA0KPiA+ICsJCQkJCQlsZTE2X3RvX2NwdShxY2Rldi0NCj4gPiA+
IGkyY19tYXhfZnJhbWVfc2l6ZSkpOw0KPiA+ICsJCX0NCj4gPiDCoAkJdGhjX2kyY19yeF9tYXhf
c2l6ZV9lbmFibGUocWNkZXYtPnRoY19odywgdHJ1ZSk7DQo+ID4gwqAJfQ0KPiA+IA0KPiA+IMKg
CS8qIElmIHBsYXRmb3JtIHN1cHBvcnRzIGludGVycnVwdCBkZWxheSBmZWF0dXJlLCBlbmFibGUg
aXQNCj4gPiB3aXRoIGdpdmVuIGRlbGF5DQo+ID4gKi8NCj4gPiAtCWlmIChxY2Rldi0+ZGRhdGEt
PmludGVycnVwdF9kZWxheSkgew0KPiA+ICsJaWYgKHFjZGV2LT5pMmNfaW50X2RlbGF5X2VuYWJs
ZSkgew0KPiA+IMKgCQl0aGNfaTJjX3NldF9yeF9pbnRfZGVsYXkocWNkZXYtPnRoY19odywNCj4g
PiAtCQkJCQkgcWNkZXYtPmRkYXRhLQ0KPiA+ID5pbnRlcnJ1cHRfZGVsYXkpOw0KPiA+ICsJCQkJ
CSBxY2Rldi0+aTJjX2ludF9kZWxheSAqDQo+ID4gMTApOw0KPiA+IMKgCQl0aGNfaTJjX3J4X2lu
dF9kZWxheV9lbmFibGUocWNkZXYtPnRoY19odywgdHJ1ZSk7DQo+ID4gwqAJfQ0KPiA+IMKgfQ0K
PiA+IEBAIC00NjQsMTAgKzQ4NywxMCBAQCBzdGF0aWMgdm9pZCBxdWlja2kyY19kbWFfYWR2X2Vu
YWJsZShzdHJ1Y3QNCj4gPiBxdWlja2kyY19kZXZpY2UgKnFjZGV2KQ0KPiA+IMKgICovDQo+ID4g
wqBzdGF0aWMgdm9pZCBxdWlja2kyY19kbWFfYWR2X2Rpc2FibGUoc3RydWN0IHF1aWNraTJjX2Rl
dmljZQ0KPiA+ICpxY2RldinCoCB7DQo+ID4gLQlpZiAocWNkZXYtPmRkYXRhLT5tYXhfZGV0ZWN0
X3NpemUpDQo+ID4gKwlpZiAocWNkZXYtPmkyY19tYXhfZnJhbWVfc2l6ZV9lbmFibGUpDQo+ID4g
wqAJCXRoY19pMmNfcnhfbWF4X3NpemVfZW5hYmxlKHFjZGV2LT50aGNfaHcsIGZhbHNlKTsNCj4g
PiANCj4gPiAtCWlmIChxY2Rldi0+ZGRhdGEtPmludGVycnVwdF9kZWxheSkNCj4gPiArCWlmIChx
Y2Rldi0+aTJjX2ludF9kZWxheV9lbmFibGUpDQo+ID4gwqAJCXRoY19pMmNfcnhfaW50X2RlbGF5
X2VuYWJsZShxY2Rldi0+dGhjX2h3LA0KPiA+IGZhbHNlKTvCoCB9DQo+ID4gDQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMt
DQo+ID4gZGV2LmgNCj4gPiBiL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tp
MmMvcXVpY2tpMmMtZGV2LmgNCj4gPiBpbmRleCBkNDEyZWFmY2Y5ZWEuLjBkNDIzZDVkZDdhNyAx
MDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJj
L3F1aWNraTJjLWRldi5oDQo+ID4gKysrIGIvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRl
bC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaA0KPiA+IEBAIC0zOCw2ICszOCw4IEBADQo+ID4gDQo+
ID4gwqAvKiBQVEwgTWF4IHBhY2tldCBzaXplIGRldGVjdGlvbiBjYXBhYmlsaXR5IGlzIDI1NSBC
eXRlcyAqLw0KPiA+IMKgI2RlZmluZSBNQVhfUlhfREVURUNUX1NJWkVfUFRMCQkJMjU1DQo+ID4g
Ky8qIE1heCBpbnRlcnJ1cHQgZGVsYXkgY2FwYWJpbGl0eSBpcyAyLjU2bXMgKi8NCj4gPiArI2Rl
ZmluZSBNQVhfUlhfSU5URVJSVVBUX0RFTEFZCQkJMjU2DQo+ID4gDQo+ID4gwqAvKiBEZWZhdWx0
IGludGVycnVwdCBkZWxheSBpcyAxbXMsIHN1aXRhYmxlIGZvciBtb3N0IGRldmljZXMgKi8NCj4g
PiDCoCNkZWZpbmUgREVGQVVMVF9JTlRFUlJVUFRfREVMQVlfVVMJCSgxICoNCj4gPiBVU0VDX1BF
Ul9NU0VDKQ0KPiA+IEBAIC0xMDEsNiArMTAzLDEwIEBAIHN0cnVjdCBxdWlja2kyY19zdWJpcF9h
Y3BpX3BhcmFtZXRlciB7DQo+ID4gwqAgKiBASE1URDogSGlnaCBTcGVlZCBNb2RlIFBsdXMgKDMu
NE1iaXRzL3NlYykgU2VyaWFsIERhdGEgTGluZQ0KPiA+IFRyYW5zbWl0DQo+ID4gSE9MRCBQZXJp
b2QNCj4gPiDCoCAqIEBITVJEOiBIaWdoIFNwZWVkIE1vZGUgUGx1cyAoMy40TWJpdHMvc2VjKSBT
ZXJpYWwgRGF0YSBMaW5lDQo+ID4gUmVjZWl2ZSBIT0xEDQo+ID4gUGVyaW9kDQo+ID4gwqAgKiBA
SE1TTDogTWF4aW11bSBsZW5ndGggKGluIGljX2Nsa19jeWNsZXMpIG9mIHN1cHByZXNzZWQgc3Bp
a2VzDQo+ID4gaW4gSGlnaCBTcGVlZA0KPiA+IE1vZGUNCj4gPiArICogQEZTRU46IE1heGltdW0g
RnJhbWUgU2l6ZSBGZWF0dXJlIEVuYWJsZSBDb250cm9sDQo+ID4gKyAqIEBGU1ZMOiBNYXhpbXVt
IEZyYW1lIFNpemUgVmFsdWUgKHVuaXQgaW4gQnl0ZXMpDQo+ID4gKyAqIEBJTkRFOiBJbnRlcnJ1
cHQgRGVsYXkgRmVhdHVyZSBFbmFibGUgQ29udHJvbA0KPiA+ICsgKiBASU5EVjogSW50ZXJydXB0
IERlbGF5IFZhbHVlICh1bml0IGluIDEwIHVzKQ0KPiA+IMKgICoNCj4gPiDCoCAqIFRob3NlIHBy
b3BlcnRpZXMgZ2V0IGZyb20gUVVJQ0tJMkNfQUNQSV9NRVRIT0RfTkFNRV9JU1VCDQo+ID4gbWV0
aG9kLA0KPiA+IHVzZWQgZm9yDQo+ID4gwqAgKiBJMkMgdGltaW5nIGNvbmZpZ3VyZS4NCj4gPiBA
QCAtMTI3LDE3ICsxMzMsMjIgQEAgc3RydWN0IHF1aWNraTJjX3N1YmlwX2FjcGlfY29uZmlnIHsN
Cj4gPiDCoAl1NjQgSE1URDsNCj4gPiDCoAl1NjQgSE1SRDsNCj4gPiDCoAl1NjQgSE1TTDsNCj4g
PiArDQo+ID4gKwl1NjQgRlNFTjsNCj4gPiArCXU2NCBGU1ZMOw0KPiA+ICsJdTY0IElOREU7DQo+
ID4gKwl1NjQgSU5EVjsNCj4gPiDCoAl1OCByZXNlcnZlZDsNCj4gPiDCoH07DQo+ID4gDQo+ID4g
wqAvKioNCj4gPiDCoCAqIHN0cnVjdCBxdWlja2kyY19kZGF0YSAtIERyaXZlciBzcGVjaWZpYyBk
YXRhIGZvciBxdWlja2kyYw0KPiA+IGRldmljZQ0KPiA+IMKgICogQG1heF9kZXRlY3Rfc2l6ZTog
SWRlbnRpZnkgbWF4IHBhY2tldCBzaXplIGRldGVjdCBmb3IgcngNCj4gPiAtICogQGludGVycnVw
dF9kZWxheTogSWRlbnRpZnkgaW50ZXJydXB0IGRldGVjdCBkZWxheSBmb3IgcngNCj4gPiArICog
QGludGVycnVwdF9kZWxheTogSWRlbnRpZnkgbWF4IGludGVycnVwdCBkZXRlY3QgZGVsYXkgZm9y
IHJ4DQo+ID4gwqAgKi8NCj4gPiDCoHN0cnVjdCBxdWlja2kyY19kZGF0YSB7DQo+ID4gwqAJdTMy
IG1heF9kZXRlY3Rfc2l6ZTsNCj4gPiAtCXUzMiBpbnRlcnJ1cHRfZGVsYXk7DQo+ID4gKwl1MzIg
bWF4X2ludGVycnVwdF9kZWxheTsNCj4gPiDCoH07DQo+ID4gDQo+ID4gwqBzdHJ1Y3QgZGV2aWNl
Ow0KPiA+IEBAIC0xNzAsNiArMTgxLDEwIEBAIHN0cnVjdCBhY3BpX2RldmljZTsNCj4gPiDCoCAq
IEByZXBvcnRfbGVuOiBUaGUgbGVuZ3RoIG9mIGlucHV0L291dHB1dCByZXBvcnQgcGFja2V0DQo+
ID4gwqAgKiBAcmVzZXRfYWNrX3dxOiBXb3JrcXVldWUgZm9yIHdhaXRpbmcgcmVzZXQgcmVzcG9u
c2UgZnJvbSBkZXZpY2UNCj4gPiDCoCAqIEByZXNldF9hY2s6IEluZGljYXRlIHJlc2V0IHJlc3Bv
bnNlIHJlY2VpdmVkIG9yIG5vdA0KPiA+ICsgKiBAaTJjX21heF9mcmFtZV9zaXplX2VuYWJsZTog
SW5kaWNhdGUgbWF4IGZyYW1lIHNpemUgZmVhdHVyZQ0KPiA+IGVuYWJsZWQNCj4gPiArIG9yIG5v
dA0KPiA+ICsgKiBAaTJjX21heF9mcmFtZV9zaXplOiBNYXggUlggZnJhbWUgc2l6ZSAodW5pdCBp
biBCeXRlcykNCj4gPiArICogQGkyY19pbnRfZGVsYXlfZW5hYmxlOiBJbmRpY2F0ZSBpbnRlcnJ1
cHQgZGVsYXkgZmVhdHVyZSBlbmFibGVkDQo+ID4gb3INCj4gPiArIG5vdA0KPiA+ICsgKiBAaTJj
X2ludF9kZWxheTogSW50ZXJydXB0IGRldGVjdGlvbiBkZWxheSB2YWx1ZSAodW5pdCBpbiAxMCB1
cykNCj4gPiDCoCAqLw0KPiA+IMKgc3RydWN0IHF1aWNraTJjX2RldmljZSB7DQo+ID4gwqAJc3Ry
dWN0IGRldmljZSAqZGV2Ow0KPiA+IEBAIC0yMDAsNiArMjE1LDExIEBAIHN0cnVjdCBxdWlja2ky
Y19kZXZpY2Ugew0KPiA+IA0KPiA+IMKgCXdhaXRfcXVldWVfaGVhZF90IHJlc2V0X2Fja193cTsN
Cj4gPiDCoAlib29sIHJlc2V0X2FjazsNCj4gPiArDQo+ID4gKwl1MzIgaTJjX21heF9mcmFtZV9z
aXplX2VuYWJsZTsNCj4gPiArCXUzMiBpMmNfbWF4X2ZyYW1lX3NpemU7DQo+ID4gKwl1MzIgaTJj
X2ludF9kZWxheV9lbmFibGU7DQo+ID4gKwl1MzIgaTJjX2ludF9kZWxheTsNCj4gPiDCoH07DQo+
ID4gDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaCENCj4gDQo+IFJldmlld2VkLWJ5OiBFdmVu
IFh1IDxldmVuLnh1QGludGVsLmNvbT4NCj4gDQo+ID4gwqAjZW5kaWYgLyogX1FVSUNLSTJDX0RF
Vl9IXyAqLw0KPiA+IC0tDQo+ID4gMi40MC4xDQo+IA0KDQo=

