Return-Path: <linux-input+bounces-14601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 429B5B525B5
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 03:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0001C27E67
	for <lists+linux-input@lfdr.de>; Thu, 11 Sep 2025 01:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31C5A8634A;
	Thu, 11 Sep 2025 01:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNevjMu2"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F23191F92;
	Thu, 11 Sep 2025 01:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757553687; cv=fail; b=JsYB8oHHwL0uY42L3M+yWiAy0i9ijosVWVBcnnZT2v7x63lox0Z5rEf9BVBeEkRLWZehTH6Pu8fPx4832SDo7Ysas71VmxopoZwo3FyegywWO9RmqCEKFBHxQdFWmja2nttcRr8I70ts5nhy9vtSIfElZhmKloMRWZTsqfdCUOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757553687; c=relaxed/simple;
	bh=o2v5O7ZMX/f6FAIK2ioUluT/TIaK9lb0TJaDELWdPhc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IeKt5umg46gIFPQYZeNiI3o8fSZFvPt8SUtDcSRh50FuYTCR4A3lnA56mcLQM3XRIhX2DxV1bkWzur+oTaSCM/EVsTY0VUU5vWWHhtqAB+X31P+cElhvMMFU997wkAoIWEZ8Wb3kLhPRReUg8Px1kbeIH3HGFCIBn8G/Ag5SauU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNevjMu2; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757553685; x=1789089685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=o2v5O7ZMX/f6FAIK2ioUluT/TIaK9lb0TJaDELWdPhc=;
  b=GNevjMu21tQvsx2kAf7I1gRexpLVswu31/X4mksBY5XEQQDe8FwCM9mR
   9V/KzM78+tyB09Kvx6CJEAP6noPRwV3w4MMnSxJ5Uss2+1UKIhm6gyUdQ
   InsMxVDQ1SrVOMLVq1XFQOB6A0FY/VmkTHQcS+WuQSfiZWLyMLldk+hs3
   49vF7Gb8WkjURRj14e6LwPxvZF9dKRqA7atW4IsBsFFCZYHgCRTqACZ4O
   AgYtVMEb+rC2xnAyt/+MLOedN/CfycbX+C6Hbmmz1MuCLR56dSsVw+fC0
   XCrTOvEVyR6o0B65ITuo7ES5LJ295qX+F/sqyKb3ekjhxld8QZVvCSo3T
   w==;
X-CSE-ConnectionGUID: tC7V3IXaSAKXtZ6EYZ9/KA==
X-CSE-MsgGUID: 5cNCHqLIT4Ogbxj/tJWo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="62509182"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="62509182"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:21:24 -0700
X-CSE-ConnectionGUID: diJf3csnR0CWq0lflTElLQ==
X-CSE-MsgGUID: g8EGoEQGRziuUpcVZXX11Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="173119913"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 18:21:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 18:21:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 18:21:23 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 18:21:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k/th6IpbgZdZQZI6VzmYGgN9+WzQQbl619vMDw632BTmUk8Lcqc4fTKmruiPaQqokMgiK58QNX+mASSNic5lbXXmGaA91q0wifH+LN5s7rP6xqaS6oYt4IGI5K8tEDw/nI5rsQ2yVlbVmpAn4wC6QDxTZEZYs4luUOmDFGDwdb8iCwV4Nlxr1lkxixcoucHNDfMYvSubqGk2IqxSBfomNRA8X/FSvRpOKvHRf3ZE/7BWGgpSXH9KNjjOHDtDOl9RLrGHb7p8IHQ7qUSuZHnhKWGc8dZlR/qBTmOZeed8TY+Ps251bhMpd6r2ej5r175AYSehoR5B7pPB7ZKEmEMAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2v5O7ZMX/f6FAIK2ioUluT/TIaK9lb0TJaDELWdPhc=;
 b=TYn7izuARZgDqQ62zgD7hcYfr2nkEZE8NjPg9PmxCC1QkAR8EKcLSjRGb58rvYRjkOVYTYr1/DmTlsVmP2d6mNRjnGcBIoUWyZmwmx3uYgERJ1TnRWo9MuhU6untRxqvRUTTeDxeqNi0D0W2tU8KI2fseL92aD1/YJW/x9HqFt+G1me6Vn9Q3RflyLSsbMu6IFCgV0vVADuR8sx1vR/+meVhVZZm/VgIPVu/xZMaJoYSb3E8Oz46v41S9XsAIy5TbSe96+GiRk/jbTkvYyJkjcYW6KcV+Mhq06gmhmJnXq8xDukXjQf+ZJIZKEpzxH/euI6El4wwRB0VajXxQT+okQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7820.namprd11.prod.outlook.com (2603:10b6:610:120::6)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 01:21:20 +0000
Received: from CH3PR11MB7820.namprd11.prod.outlook.com
 ([fe80::de61:c7fa:e4f4:54ab]) by CH3PR11MB7820.namprd11.prod.outlook.com
 ([fe80::de61:c7fa:e4f4:54ab%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 01:21:20 +0000
From: "Sun, Xinpeng" <xinpeng.sun@intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	"jikos@kernel.org" <jikos@kernel.org>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui1"
	<rui1.zhang@intel.com>
Subject: RE: [PATCH RESEND v2] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Topic: [PATCH RESEND v2] hid: intel-thc-hid: intel-quicki2c: support
 ACPI config for advanced features
Thread-Index: AQHcHgX2m9SRBchSz0G2f61coavjHbSEz3kAgAhoN7A=
Date: Thu, 11 Sep 2025 01:21:19 +0000
Message-ID: <CH3PR11MB782092E522528A17A9195C35EA09A@CH3PR11MB7820.namprd11.prod.outlook.com>
References: <20250905013935.1356008-1-xinpeng.sun@intel.com>
 <5c83a18128bbc0b8cfd6900439e7349250732659.camel@linux.intel.com>
In-Reply-To: <5c83a18128bbc0b8cfd6900439e7349250732659.camel@linux.intel.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7820:EE_|PH0PR11MB7614:EE_
x-ms-office365-filtering-correlation-id: 7d53e130-f5e3-4079-ad7e-08ddf0d18376
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?c3pTNXplRHdtWHM5QTRla29pNnYraHJQNTVLeW1SVnM0K01UMWdRbG43aFNq?=
 =?utf-8?B?dGlvZTRFaHIycTRYbzc3RWZnVG14Qk04Y1BFcENYQ1VDYTRPMUl1ZkNwa2dr?=
 =?utf-8?B?dnJHY3JLQUdMTFAxUGtjWUsyTzc2V0dQVldybytxdHBPTG5wdS9QdzJwS2NR?=
 =?utf-8?B?UjJ3SmR2WHdFM3IvWXBCY01JUmlBbHp2a2tkVGxJUStoU3VIMmpYVXlLSEsw?=
 =?utf-8?B?SGRtRUZSRWpER1hnMktLOTc0NzVMbjl2aGd2UElJclBVaXBqOFVJRUFnTXU4?=
 =?utf-8?B?eWFHU2xiYll2cWVwRVhycy9yam5hU1ZYQlFuUmxDSUpSbXV0VWg4STNENnZn?=
 =?utf-8?B?UnphdzdjczJTSHVvVjNxNmpaNkNOeXhnNjhWRldLQ0Z4U2RYd2NlQklWUnYx?=
 =?utf-8?B?VVQ0SVRIQjFtNitkSE5rNFdUQjRpVWNyNlJYV1h1alNSK2JJQjJWYjNncENG?=
 =?utf-8?B?eFJuZjd4Sm14Uk1VNzR3TEVYYWp6TmFjNDIxR0JQeVo2bHFLRWxYcGM3S2FS?=
 =?utf-8?B?aHdJSS9nUkpNN2d5Y05FdlhLY3ByalZXT2V6K3dLK3QyRm5WRlQ0OHpNckVj?=
 =?utf-8?B?Tk5PZVNtV0lpTjhpVENvaHNRbTV0YUdJMWFYek1vQmVaYkplZHdhdm9YNnZn?=
 =?utf-8?B?K0hxU3V5a2l4SENMK1RUN0IyZkVKMk1GdGx6ajFCdmNvK1UwVW9pdDZ0eFc4?=
 =?utf-8?B?OEx0Q0NsR1JoL3Ezb1MvQjZXNHdKc1d5SVIybWlpNkFiSkhGKzN4WjJSY0xV?=
 =?utf-8?B?UXRxb0NkMktUdlhsUjNJVy9sZzNNMnhveGVTaGZmSGU0WTR6YTc1TjFqeWZV?=
 =?utf-8?B?VlRZOVZ3eGxoNHNyajFhTjV6MHQ5TWZPTjQ1eGF2UFFrYm15cEk0RHZsNzNH?=
 =?utf-8?B?QTl0Q2FCTHRvdlh6Smk1aWprTlZUcTR2NXlSelphK0w1QjFqeFlVUnRIbFBP?=
 =?utf-8?B?K3Y4K1VmbG85Z0NDcXhaTG1lbzFKOTc0QzVFYzhyR1F5VVdnTENTV0RiN0Fr?=
 =?utf-8?B?aHJxcFJ6QlJ5YjlMOFFhWlcwODFEWnV1Z3NLS1ZzVnBUL2NkUE1BMWxNVG9B?=
 =?utf-8?B?RUtyY1dEUExuVDJFeFNWYUJoR1FXbWFoQVdwOXJyV2VHelJIczBFSmpQcFo4?=
 =?utf-8?B?N1NNTCtzTFM1YmVyL1FlbURMR2gxZG52a1RoU1Bnd3Ixc0JjTlRXa2ZIbzlx?=
 =?utf-8?B?Vm5zdDYyVEc3TWI2VERqd2ltNmhoSWFtVXFBMEZWZUQyZGJNSUNmeGhDQ0Np?=
 =?utf-8?B?ZTlTeUxPY3Rqc0laSkF3N0pzcEoxekNWelJ6amI3Z3c5TVp2RnlUNkRsR0dq?=
 =?utf-8?B?SDRtbWV3VmRqdUZFcUl3NE9zY29PTXc4SUpZTzcrdEVRR0E0Y3NUSW1RVk8y?=
 =?utf-8?B?ZGxWY2N2dE1tY1BzRWdycXFLVWdNTVNsTGdHSW5QMDc4RkJCTGlvU0I1ZUlN?=
 =?utf-8?B?TlQ1WjhaN1N2VEUvdXZFVHU5emlJc1g5UnNUbzdCU1YyZlRPSXBjWnI4MEpu?=
 =?utf-8?B?VlpjeUZyckp0M2praExwL0JFZzdpVm4rWmsyTEdXZmh6dSt3SEpNWUhFZkx0?=
 =?utf-8?B?VmxXcG1BUzVYbEYrMmRUa2xaOWd0NzJscG5HOVI1UUJHcjFIUEZkYWkxTjk2?=
 =?utf-8?B?Y0h2R0JYeURMZjJtV1diay9XdE5FUWUzNFZJZTNWeUFrR096VWxHMUJzN3hY?=
 =?utf-8?B?cGVwbGJTV2U1bnF0UWloZENIa2xwOWZ2T2lTNkU2RjBxMkJXN2FjbE5CMkY1?=
 =?utf-8?B?SmtOY29PcmY3YkhwVkQ3ci9LWnd4T0FxQWJtSlNmVmEyTGF5QS9KdmhleU1Q?=
 =?utf-8?B?WDRQNmd5eUJIU0V2NCtXSHkwQVlNRk1JUXdaQTBMNzJRVVlKR3FZa0t2dytR?=
 =?utf-8?B?c0pmNjZrMUlML0xkMEI3NUVNcU9Pa29TcUwrNGorKzBVQmkzT1AyMGdDSzRP?=
 =?utf-8?B?TGNpVkFzYWdFUUtESlVqaEtGb3NsRzh1QVlWVGVSTHAxNDBEd2lrZVlzMUxx?=
 =?utf-8?Q?QftKiMHMTET5NHQilNNeia4U8djfSM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB7820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MmsvU2VkcGZNQ3ZUemVYSjNZMEt6enpCQWl2MmJEU0x2TW9WNTMzbHVKY3JZ?=
 =?utf-8?B?VDNFc2J6dTBXWGZhb3pIeDhCM3o3R3E0RjBwdG1mbEZnL3plWUhhb3ZsZ3FP?=
 =?utf-8?B?cEM2Ti9LWm9YZi94TkdPTFl4MWpBRkprVmtDTVBKSXhBVVdDV1JSVEdKNUJz?=
 =?utf-8?B?SXgzM0NJd0s3em03VVZnM0IzR0JMMXBQMno1OUZhMW9Peko2MlZMaW53enRt?=
 =?utf-8?B?dE92QUpidjBxRVU3MmFaZjJWRmNQV3hzaUVGYkhLeVgyWllWZlloVUVZMlNZ?=
 =?utf-8?B?WWRoSnhXTzNKYmdoLzQ3M0ZpR1ltTmpqMzByR1NrSEdkTjJ0eU1nbzhaYWNF?=
 =?utf-8?B?TzJVL1Rrd2wwUHZqYkFFZTJyVW0xMEhCZjhiVGVnaVNZOXVwVWhsVDk3bXB1?=
 =?utf-8?B?cjZpRVQzc0hET2VYUVFlZWlmei9jVnhEYlhQb21kblUwWWpLbkZ4c21BQ0pa?=
 =?utf-8?B?WHN1a2ZBS3RDUzkveDF0bWRmV3Z2dEx0c1RWL1k0ckF5NXdXNHJsWTFRVVgv?=
 =?utf-8?B?bzlmSUxLT3ZNZ0hhdWU2b21JUTREZ2ViMnJXUjNrSE0xSEtMVUd0ZzBXS2xC?=
 =?utf-8?B?S3NmL282REdFcWdJYmR1ejNxdzFHekphM3ZBdklBTXp5RXdLbEZCOFNSOENy?=
 =?utf-8?B?Yi9sRG4vVmhOellBVHNFV0MxbHlFNW81TDBVQXJLVk91N1VOWXFNaVZhNlo4?=
 =?utf-8?B?WVk3aDlkbFR6ZmxLZFN3Y2ZLenNZOG4vOTFZNi9YZElPdm9hd1NXaE5PWTJ4?=
 =?utf-8?B?NHNEcnZFT3JWR0tmbU52SE5qUFdtZmdUeFpwWkZUSFU5ekl5UXNwbEs3YnRE?=
 =?utf-8?B?cHhYaFNocUxNMkFpc1kwNVFNaVR1aWMzME13a0xHb2l4YnV5NmFxc0JZOUJE?=
 =?utf-8?B?a2lBalBremY4Wm1EdGQzcGoreGg5cytVTnFwSU1QUmJJWkJsdjdnMFZGU3ly?=
 =?utf-8?B?T1FsQkF4ejhFWllLem5QMUhZS2ZWMFNUamtEMzRSV0xuSG1aZUlCbElJSTBk?=
 =?utf-8?B?bUNVd3ZHNElzY0lGTmJDMUNiUmRtM2pOYlpqdlJIN2VlenpENmVkaXRUc2J1?=
 =?utf-8?B?amZ3MWltNWtmZ2xHYWJKR1BacVk3YVpSY0ZYekNuVnBYWks4eFFqVlh6NGVX?=
 =?utf-8?B?SnlpcnlETCthMDNSeFlqMkMyc2hhOUZQNThUVXpKTVUvUldGRDZsNys0M2Z4?=
 =?utf-8?B?NFBreHBVSXowZU5idjNteU1ZMHpwd1ZremwwT1c4dklGZmppdUowYnIrYU5T?=
 =?utf-8?B?NmNFTWNZWHZGY2hrNFJ6R3BSWWxqZnFQOWliUGYzUmdSZ0ZSaFp0UjlvYXJh?=
 =?utf-8?B?S0RpelNKdHZGOW9KM21JZjcwcjFkUElBWmNjQktoVkJpU0JidmdJbVhZbTRn?=
 =?utf-8?B?c2ZYRE5WL3ZpWTN2ekh1eVVaeHQ5ZUROUWNCd3JRQ0NwRWdDUnc0d0x6TEd3?=
 =?utf-8?B?MTNnSlhtU2VUREdrUEZ2Q0hORW9EbHBnaS9VWm9UODdGazcrckZ1Rkd6dmhk?=
 =?utf-8?B?b0QwV2EweE9jbnNkQk1iWFRiRGs2MTZJbGM4UVR3WFA4WUhZN001MnZISlBY?=
 =?utf-8?B?K1R0dDRsOGUzUDNQMExIclNwbU9COFUza1hoNlpOMzlwMVB0UGtPeitZcHJ6?=
 =?utf-8?B?NlF4SEQ1dFNhR1BpbjVEdGhBMTRXdm5OSkNGY2QxT1JvWkJId1dJSmIxTEJx?=
 =?utf-8?B?bDllRjhlRmV5OU04NkVvb0dXaWVteTRkdWdoM2tFWkZQN2NvY3BIY0ZGNUp1?=
 =?utf-8?B?c2VnNlJsKzN1dVpYWXpCMVQwcGx3bXJyU1hhcW0rNHFyZUp4WUVtb2UwamVu?=
 =?utf-8?B?cFZneXN5ZVpsblZTb0hYLzkvVmE4eHkyZlkwTkQ3U3lZMVpvU0NtbXVZQkZP?=
 =?utf-8?B?emMrMEFueUlHRjJPaWg4Qld1V1NwQVVlQ0xOOGxtcnNqQXB1M0x6bE40TlJF?=
 =?utf-8?B?cnJ4ZHFVWDEydXh6ZjlTOUlvYWxpU3dCZ2xldkZpOEVwRmZhTU1SUElza2hX?=
 =?utf-8?B?Y09VcHBRSHE1UGc5eFlzRmVEVHo1bFdidWszQVhYYWdhZitBWG13MWZFRk1t?=
 =?utf-8?B?VU5CcUV3RmhncE1lVE8vV1IxUlcrdHcvYmlTYjlUQXN3b0hxUE9DNEpEMzJL?=
 =?utf-8?Q?zWcUJJlTBcRuMp+vd4sB1+9xg?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d53e130-f5e3-4079-ad7e-08ddf0d18376
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 01:21:20.0509
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6aJKeFZdnTfOWfjFbTUeXSc3UkYsLzDC1nDuiJEdx0alriZGNWYyHfCGrjGBCkCW0BiI8nM8InZofQsWRJjWpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
X-OriginatorOrg: intel.com

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IHNyaW5pdmFzIHBhbmRydXZh
ZGEgPHNyaW5pdmFzLnBhbmRydXZhZGFAbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBTYXR1cmRh
eSwgU2VwdGVtYmVyIDYsIDIwMjUgMTI6NTUgQU0NCj4gVG86IFN1biwgWGlucGVuZyA8eGlucGVu
Zy5zdW5AaW50ZWwuY29tPjsgamlrb3NAa2VybmVsLm9yZzsgYmVudGlzc0BrZXJuZWwub3JnDQo+
IENjOiBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IFpoYW5nLCBSdWkxDQo+IDxydWkxLnpoYW5nQGludGVsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCBSRVNFTkQgdjJdIGhpZDogaW50ZWwtdGhjLWhpZDogaW50ZWwtcXVpY2tpMmM6
IHN1cHBvcnQgQUNQSQ0KPiBjb25maWcgZm9yIGFkdmFuY2VkIGZlYXR1cmVzDQo+IA0KPiBPbiBG
cmksIDIwMjUtMDktMDUgYXQgMDk6MzkgKzA4MDAsIFhpbnBlbmcgU3VuIHdyb3RlOg0KPiA+IFRo
ZXJlIGlzIGEgbmV3IEJJT1MgZW5oYW5jZW1lbnQgdGhhdCBhZGRzIHRoZSBjYXBhYmlsaXR5IHRv
IGNvbmZpZ3VyZQ0KPiA+IHRoZSBmb2xsb3dpbmcgdHdvIGZlYXR1cmVzIG9mIEkyQyBzdWJzeXN0
ZW0gaW50cm9kdWNlZCBpbiBjb21taXQNCj4gPiAxZWQwYjQ4DQo+ID4gKCJJbnRlbC10aGM6IElu
dHJvZHVjZSBtYXggaW5wdXQgc2l6ZSBjb250cm9sIikgYW5kIGNvbW1pdCAzZjJhOTIxDQo+ID4g
KCJJbnRlbC10aGM6IEludHJvZHVjZSBpbnRlcnJ1cHQgZGVsYXkgY29udHJvbCIpOg0KPiA+IC0g
TWF4IGlucHV0IHNpemUgY29udHJvbA0KPiA+IC0gSW50ZXJydXB0IGRlbGF5IGNvbnRyb2wNCj4g
Pg0KPiA+IEFzIEJJT1MgaXMgdXNlZCBmb3IgdGhlIGNvbmZpZ3VyYXRpb24gb2YgdGhlc2UgdHdv
IGZlYXR1cmVzLCBjaGFuZ2UNCj4gPiBkcml2ZXIgZGF0YSB1c2FnZSB0byBpbmRpY2F0ZSBoYXJk
d2FyZSBjYXBhYmlsaXR5LCBhbmQgYWRkDQo+ID4gY29ycmVzcG9uZGluZyBBQ1BJIGNvbmZpZ3Vy
YXRpb24gc3VwcG9ydCBpbiBRdWlja0kyQyBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBYaW5wZW5nIFN1biA8eGlucGVuZy5zdW5AaW50ZWwuY29tPg0KPiA+IFRlc3RlZC1ieTogUnVp
IFpoYW5nIDxydWkxLnpoYW5nQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPg0KPiBXaHkgdGhlIHBh
dGNoIHdhcyByZXNlbnQ/DQo+IA0KPiBJZiBtYWludGFpbmVyIGRpZG4ndCByZXZpZXcsIGp1c3Qg
cmVtaW5kIHRoZW0gYWZ0ZXIgYXRsZWFzdCAyIHdlZWtzIGluc3RlYWQgb2YNCj4gc2VuZGluZyBh
Z2Fpbi4NCj4gDQo+IEZvciBhbnkgb3RoZXIgcmVhc29uIGFkZCBzb21lIGNoYW5nZSBsb2cgaGVy
ZS4NCg0KSnVzdCByZWJhc2UgdGhpcyBwYXRjaCBiZWNhdXNlIHRoZXJlIGlzIGEgY29uZmxpY3Qg
d2l0aCBsYXRlc3QgbWFpbiBicmFuY2guDQoNClRoYW5rcywNClhpbnBlbmcNCg0KPiANCj4gVGhh
bmtzLA0KPiBTcmluaXZhcw0KPiANCj4gDQo+IA0KPiA+IMKgLi4uL2ludGVsLXF1aWNraTJjL3Bj
aS1xdWlja2kyYy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNDMgKysrKysrKysrKysrKyst
LS0NCj4gPiAtLQ0KPiA+IMKgLi4uL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5owqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgMjQgKysrKysrKysrKy0NCj4gPiDCoDIgZmlsZXMgY2hhbmdl
ZCwgNTUgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVpY2tpMmMu
Yw0KPiA+IGIvZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9wY2ktcXVp
Y2tpMmMuYw0KPiA+IGluZGV4IDg1NDkyNmIzY2ZkNC4uNzg3YzMyNTU3ZDI0IDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvaGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcGNpLXF1aWNr
aTJjLmMNCj4gPiArKysgYi9kcml2ZXJzL2hpZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJj
L3BjaS1xdWlja2kyYy5jDQo+ID4gQEAgLTIzLDYgKzIzLDcgQEANCj4gPg0KPiA+IMKgc3RhdGlj
IHN0cnVjdCBxdWlja2kyY19kZGF0YSBwdGxfZGRhdGEgPSB7DQo+ID4gwqAJLm1heF9kZXRlY3Rf
c2l6ZSA9IE1BWF9SWF9ERVRFQ1RfU0laRV9QVEwsDQo+ID4gKwkubWF4X2ludGVycnVwdF9kZWxh
eSA9IE1BWF9SWF9JTlRFUlJVUFRfREVMQVksDQo+ID4gwqB9Ow0KPiA+DQo+ID4gwqAvKiBUSEMg
UXVpY2tJMkMgQUNQSSBtZXRob2QgdG8gZ2V0IGRldmljZSBwcm9wZXJ0aWVzICovIEBAIC0xMjMs
OA0KPiA+ICsxMjQsOCBAQCBzdGF0aWMgaW50IHF1aWNraTJjX2FjcGlfZ2V0X2RzZF9wcm9wZXJ0
eShzdHJ1Y3QNCj4gPiBhY3BpX2RldmljZSAqYWRldiwgYWNwaV9zdHJpbmcNCj4gPiDCoHN0YXRp
YyBpbnQgcXVpY2tpMmNfZ2V0X2FjcGlfcmVzb3VyY2VzKHN0cnVjdCBxdWlja2kyY19kZXZpY2UN
Cj4gPiAqcWNkZXYpDQo+ID4gwqB7DQo+ID4gwqAJc3RydWN0IGFjcGlfZGV2aWNlICphZGV2ID0g
QUNQSV9DT01QQU5JT04ocWNkZXYtPmRldik7DQo+ID4gLQlzdHJ1Y3QgcXVpY2tpMmNfc3ViaXBf
YWNwaV9wYXJhbWV0ZXIgaTJjX3BhcmFtOw0KPiA+IC0Jc3RydWN0IHF1aWNraTJjX3N1YmlwX2Fj
cGlfY29uZmlnIGkyY19jb25maWc7DQo+ID4gKwlzdHJ1Y3QgcXVpY2tpMmNfc3ViaXBfYWNwaV9w
YXJhbWV0ZXIgaTJjX3BhcmFtID0gezB9Ow0KPiA+ICsJc3RydWN0IHF1aWNraTJjX3N1YmlwX2Fj
cGlfY29uZmlnIGkyY19jb25maWcgPSB7MH07DQo+ID4gwqAJdTMyIGhpZF9kZXNjX2FkZHI7DQo+
ID4gwqAJaW50IHJldCA9IC1FSU5WQUw7DQo+ID4NCj4gPiBAQCAtMjAwLDYgKzIwMSwyMSBAQCBz
dGF0aWMgaW50IHF1aWNraTJjX2dldF9hY3BpX3Jlc291cmNlcyhzdHJ1Y3QNCj4gPiBxdWlja2ky
Y19kZXZpY2UgKnFjZGV2KQ0KPiA+IMKgCQlyZXR1cm4gLUVPUE5PVFNVUFA7DQo+ID4gwqAJfQ0K
PiA+DQo+ID4gKwlpZiAocWNkZXYtPmRkYXRhKSB7DQo+ID4gKwkJcWNkZXYtPmkyY19tYXhfZnJh
bWVfc2l6ZV9lbmFibGUgPSBpMmNfY29uZmlnLkZTRU47DQo+ID4gKwkJcWNkZXYtPmkyY19pbnRf
ZGVsYXlfZW5hYmxlID0gaTJjX2NvbmZpZy5JTkRFOw0KPiA+ICsNCj4gPiArCQlpZiAoaTJjX2Nv
bmZpZy5GU1ZMIDw9IHFjZGV2LT5kZGF0YS0NCj4gPiA+bWF4X2RldGVjdF9zaXplKQ0KPiA+ICsJ
CQlxY2Rldi0+aTJjX21heF9mcmFtZV9zaXplID0gaTJjX2NvbmZpZy5GU1ZMOw0KPiA+ICsJCWVs
c2UNCj4gPiArCQkJcWNkZXYtPmkyY19tYXhfZnJhbWVfc2l6ZSA9IHFjZGV2LT5kZGF0YS0NCj4g
PiA+bWF4X2RldGVjdF9zaXplOw0KPiA+ICsNCj4gPiArCQlpZiAoaTJjX2NvbmZpZy5JTkRWIDw9
IHFjZGV2LT5kZGF0YS0NCj4gPiA+bWF4X2ludGVycnVwdF9kZWxheSkNCj4gPiArCQkJcWNkZXYt
PmkyY19pbnRfZGVsYXkgPSBpMmNfY29uZmlnLklORFY7DQo+ID4gKwkJZWxzZQ0KPiA+ICsJCQlx
Y2Rldi0+aTJjX2ludF9kZWxheSA9IHFjZGV2LT5kZGF0YS0NCj4gPiA+bWF4X2ludGVycnVwdF9k
ZWxheTsNCj4gPiArCX0NCj4gPiArDQo+ID4gwqAJcmV0dXJuIDA7DQo+ID4gwqB9DQo+ID4NCj4g
PiBAQCAtNDQxLDE3ICs0NTcsMjQgQEAgc3RhdGljIHZvaWQgcXVpY2tpMmNfZG1hX2Fkdl9lbmFi
bGUoc3RydWN0DQo+ID4gcXVpY2tpMmNfZGV2aWNlICpxY2RldikNCj4gPiDCoAkgKiBtYXggaW5w
dXQgbGVuZ3RoIDw9IFRIQyBkZXRlY3QgY2FwYWJpbGl0eSwgZW5hYmxlIHRoZSBmZWF0dXJlDQo+
ID4gd2l0aCBkZXZpY2UNCj4gPiDCoAkgKiBtYXggaW5wdXQgbGVuZ3RoLg0KPiA+IMKgCSAqLw0K
PiA+IC0JaWYgKHFjZGV2LT5kZGF0YS0+bWF4X2RldGVjdF9zaXplID49DQo+ID4gLQnCoMKgwqAg
bGUxNl90b19jcHUocWNkZXYtPmRldl9kZXNjLm1heF9pbnB1dF9sZW4pKSB7DQo+ID4gLQkJdGhj
X2kyY19zZXRfcnhfbWF4X3NpemUocWNkZXYtPnRoY19odywNCj4gPiAtCQkJCQlsZTE2X3RvX2Nw
dShxY2Rldi0NCj4gPiA+ZGV2X2Rlc2MubWF4X2lucHV0X2xlbikpOw0KPiA+ICsJaWYgKHFjZGV2
LT5pMmNfbWF4X2ZyYW1lX3NpemVfZW5hYmxlKSB7DQo+ID4gKwkJaWYgKHFjZGV2LT5pMmNfbWF4
X2ZyYW1lX3NpemUgPj0NCj4gPiArCQnCoMKgwqAgbGUxNl90b19jcHUocWNkZXYtPmRldl9kZXNj
Lm1heF9pbnB1dF9sZW4pKSB7DQo+ID4gKwkJCXRoY19pMmNfc2V0X3J4X21heF9zaXplKHFjZGV2
LT50aGNfaHcsDQo+ID4gKwkJCQkJCWxlMTZfdG9fY3B1KHFjZGV2LQ0KPiA+ID5kZXZfZGVzYy5t
YXhfaW5wdXRfbGVuKSk7DQo+ID4gKwkJfSBlbHNlIHsNCj4gPiArCQkJZGV2X3dhcm4ocWNkZXYt
PmRldiwNCj4gPiArCQkJCSAiTWF4IGZyYW1lIHNpemUgaXMgc21hbGxlciB0aGFuIGhpZA0KPiA+
IG1heCBpbnB1dCBsZW5ndGghIik7DQo+ID4gKwkJCXRoY19pMmNfc2V0X3J4X21heF9zaXplKHFj
ZGV2LT50aGNfaHcsDQo+ID4gKwkJCQkJCWxlMTZfdG9fY3B1KHFjZGV2LQ0KPiA+ID5pMmNfbWF4
X2ZyYW1lX3NpemUpKTsNCj4gPiArCQl9DQo+ID4gwqAJCXRoY19pMmNfcnhfbWF4X3NpemVfZW5h
YmxlKHFjZGV2LT50aGNfaHcsIHRydWUpOw0KPiA+IMKgCX0NCj4gPg0KPiA+IMKgCS8qIElmIHBs
YXRmb3JtIHN1cHBvcnRzIGludGVycnVwdCBkZWxheSBmZWF0dXJlLCBlbmFibGUgaXQgd2l0aA0K
PiA+IGdpdmVuIGRlbGF5ICovDQo+ID4gLQlpZiAocWNkZXYtPmRkYXRhLT5pbnRlcnJ1cHRfZGVs
YXkpIHsNCj4gPiArCWlmIChxY2Rldi0+aTJjX2ludF9kZWxheV9lbmFibGUpIHsNCj4gPiDCoAkJ
dGhjX2kyY19zZXRfcnhfaW50X2RlbGF5KHFjZGV2LT50aGNfaHcsDQo+ID4gLQkJCQkJIHFjZGV2
LT5kZGF0YS0NCj4gPiA+aW50ZXJydXB0X2RlbGF5KTsNCj4gPiArCQkJCQkgcWNkZXYtPmkyY19p
bnRfZGVsYXkgKiAxMCk7DQo+ID4gwqAJCXRoY19pMmNfcnhfaW50X2RlbGF5X2VuYWJsZShxY2Rl
di0+dGhjX2h3LCB0cnVlKTsNCj4gPiDCoAl9DQo+ID4gwqB9DQo+ID4gQEAgLTQ2NCwxMCArNDg3
LDEwIEBAIHN0YXRpYyB2b2lkIHF1aWNraTJjX2RtYV9hZHZfZW5hYmxlKHN0cnVjdA0KPiA+IHF1
aWNraTJjX2RldmljZSAqcWNkZXYpDQo+ID4gwqAgKi8NCj4gPiDCoHN0YXRpYyB2b2lkIHF1aWNr
aTJjX2RtYV9hZHZfZGlzYWJsZShzdHJ1Y3QgcXVpY2tpMmNfZGV2aWNlICpxY2RldikNCj4gPiDC
oHsNCj4gPiAtCWlmIChxY2Rldi0+ZGRhdGEtPm1heF9kZXRlY3Rfc2l6ZSkNCj4gPiArCWlmIChx
Y2Rldi0+aTJjX21heF9mcmFtZV9zaXplX2VuYWJsZSkNCj4gPiDCoAkJdGhjX2kyY19yeF9tYXhf
c2l6ZV9lbmFibGUocWNkZXYtPnRoY19odywgZmFsc2UpOw0KPiA+DQo+ID4gLQlpZiAocWNkZXYt
PmRkYXRhLT5pbnRlcnJ1cHRfZGVsYXkpDQo+ID4gKwlpZiAocWNkZXYtPmkyY19pbnRfZGVsYXlf
ZW5hYmxlKQ0KPiA+IMKgCQl0aGNfaTJjX3J4X2ludF9kZWxheV9lbmFibGUocWNkZXYtPnRoY19o
dywgZmFsc2UpOw0KPiA+IMKgfQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaGlkL2lu
dGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtZGV2LmgNCj4gPiBiL2RyaXZlcnMv
aGlkL2ludGVsLXRoYy1oaWQvaW50ZWwtcXVpY2tpMmMvcXVpY2tpMmMtZGV2LmgNCj4gPiBpbmRl
eCBkNDEyZWFmY2Y5ZWEuLjBkNDIzZDVkZDdhNyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2hp
ZC9pbnRlbC10aGMtaGlkL2ludGVsLXF1aWNraTJjL3F1aWNraTJjLWRldi5oDQo+ID4gKysrIGIv
ZHJpdmVycy9oaWQvaW50ZWwtdGhjLWhpZC9pbnRlbC1xdWlja2kyYy9xdWlja2kyYy1kZXYuaA0K
PiA+IEBAIC0zOCw2ICszOCw4IEBADQo+ID4NCj4gPiDCoC8qIFBUTCBNYXggcGFja2V0IHNpemUg
ZGV0ZWN0aW9uIGNhcGFiaWxpdHkgaXMgMjU1IEJ5dGVzICovDQo+ID4gwqAjZGVmaW5lIE1BWF9S
WF9ERVRFQ1RfU0laRV9QVEwJCQkyNTUNCj4gPiArLyogTWF4IGludGVycnVwdCBkZWxheSBjYXBh
YmlsaXR5IGlzIDIuNTZtcyAqLw0KPiA+ICsjZGVmaW5lIE1BWF9SWF9JTlRFUlJVUFRfREVMQVkJ
CQkyNTYNCj4gPg0KPiA+IMKgLyogRGVmYXVsdCBpbnRlcnJ1cHQgZGVsYXkgaXMgMW1zLCBzdWl0
YWJsZSBmb3IgbW9zdCBkZXZpY2VzICovDQo+ID4gwqAjZGVmaW5lIERFRkFVTFRfSU5URVJSVVBU
X0RFTEFZX1VTCQkoMSAqIFVTRUNfUEVSX01TRUMpDQo+ID4gQEAgLTEwMSw2ICsxMDMsMTAgQEAg
c3RydWN0IHF1aWNraTJjX3N1YmlwX2FjcGlfcGFyYW1ldGVyIHsNCj4gPiDCoCAqIEBITVREOiBI
aWdoIFNwZWVkIE1vZGUgUGx1cyAoMy40TWJpdHMvc2VjKSBTZXJpYWwgRGF0YSBMaW5lDQo+ID4g
VHJhbnNtaXQgSE9MRCBQZXJpb2QNCj4gPiDCoCAqIEBITVJEOiBIaWdoIFNwZWVkIE1vZGUgUGx1
cyAoMy40TWJpdHMvc2VjKSBTZXJpYWwgRGF0YSBMaW5lDQo+ID4gUmVjZWl2ZSBIT0xEIFBlcmlv
ZA0KPiA+IMKgICogQEhNU0w6IE1heGltdW0gbGVuZ3RoIChpbiBpY19jbGtfY3ljbGVzKSBvZiBz
dXBwcmVzc2VkIHNwaWtlcyBpbg0KPiA+IEhpZ2ggU3BlZWQgTW9kZQ0KPiA+ICsgKiBARlNFTjog
TWF4aW11bSBGcmFtZSBTaXplIEZlYXR1cmUgRW5hYmxlIENvbnRyb2wNCj4gPiArICogQEZTVkw6
IE1heGltdW0gRnJhbWUgU2l6ZSBWYWx1ZSAodW5pdCBpbiBCeXRlcykNCj4gPiArICogQElOREU6
IEludGVycnVwdCBEZWxheSBGZWF0dXJlIEVuYWJsZSBDb250cm9sDQo+ID4gKyAqIEBJTkRWOiBJ
bnRlcnJ1cHQgRGVsYXkgVmFsdWUgKHVuaXQgaW4gMTAgdXMpDQo+ID4gwqAgKg0KPiA+IMKgICog
VGhvc2UgcHJvcGVydGllcyBnZXQgZnJvbSBRVUlDS0kyQ19BQ1BJX01FVEhPRF9OQU1FX0lTVUIg
bWV0aG9kLA0KPiA+IHVzZWQgZm9yDQo+ID4gwqAgKiBJMkMgdGltaW5nIGNvbmZpZ3VyZS4NCj4g
PiBAQCAtMTI3LDE3ICsxMzMsMjIgQEAgc3RydWN0IHF1aWNraTJjX3N1YmlwX2FjcGlfY29uZmln
IHsNCj4gPiDCoAl1NjQgSE1URDsNCj4gPiDCoAl1NjQgSE1SRDsNCj4gPiDCoAl1NjQgSE1TTDsN
Cj4gPiArDQo+ID4gKwl1NjQgRlNFTjsNCj4gPiArCXU2NCBGU1ZMOw0KPiA+ICsJdTY0IElOREU7
DQo+ID4gKwl1NjQgSU5EVjsNCj4gPiDCoAl1OCByZXNlcnZlZDsNCj4gPiDCoH07DQo+ID4NCj4g
PiDCoC8qKg0KPiA+IMKgICogc3RydWN0IHF1aWNraTJjX2RkYXRhIC0gRHJpdmVyIHNwZWNpZmlj
IGRhdGEgZm9yIHF1aWNraTJjIGRldmljZQ0KPiA+IMKgICogQG1heF9kZXRlY3Rfc2l6ZTogSWRl
bnRpZnkgbWF4IHBhY2tldCBzaXplIGRldGVjdCBmb3IgcngNCj4gPiAtICogQGludGVycnVwdF9k
ZWxheTogSWRlbnRpZnkgaW50ZXJydXB0IGRldGVjdCBkZWxheSBmb3IgcngNCj4gPiArICogQGlu
dGVycnVwdF9kZWxheTogSWRlbnRpZnkgbWF4IGludGVycnVwdCBkZXRlY3QgZGVsYXkgZm9yIHJ4
DQo+ID4gwqAgKi8NCj4gPiDCoHN0cnVjdCBxdWlja2kyY19kZGF0YSB7DQo+ID4gwqAJdTMyIG1h
eF9kZXRlY3Rfc2l6ZTsNCj4gPiAtCXUzMiBpbnRlcnJ1cHRfZGVsYXk7DQo+ID4gKwl1MzIgbWF4
X2ludGVycnVwdF9kZWxheTsNCj4gPiDCoH07DQo+ID4NCj4gPiDCoHN0cnVjdCBkZXZpY2U7DQo+
ID4gQEAgLTE3MCw2ICsxODEsMTAgQEAgc3RydWN0IGFjcGlfZGV2aWNlOw0KPiA+IMKgICogQHJl
cG9ydF9sZW46IFRoZSBsZW5ndGggb2YgaW5wdXQvb3V0cHV0IHJlcG9ydCBwYWNrZXQNCj4gPiDC
oCAqIEByZXNldF9hY2tfd3E6IFdvcmtxdWV1ZSBmb3Igd2FpdGluZyByZXNldCByZXNwb25zZSBm
cm9tIGRldmljZQ0KPiA+IMKgICogQHJlc2V0X2FjazogSW5kaWNhdGUgcmVzZXQgcmVzcG9uc2Ug
cmVjZWl2ZWQgb3Igbm90DQo+ID4gKyAqIEBpMmNfbWF4X2ZyYW1lX3NpemVfZW5hYmxlOiBJbmRp
Y2F0ZSBtYXggZnJhbWUgc2l6ZSBmZWF0dXJlDQo+ID4gZW5hYmxlZCBvciBub3QNCj4gPiArICog
QGkyY19tYXhfZnJhbWVfc2l6ZTogTWF4IFJYIGZyYW1lIHNpemUgKHVuaXQgaW4gQnl0ZXMpDQo+
ID4gKyAqIEBpMmNfaW50X2RlbGF5X2VuYWJsZTogSW5kaWNhdGUgaW50ZXJydXB0IGRlbGF5IGZl
YXR1cmUgZW5hYmxlZA0KPiA+IG9yIG5vdA0KPiA+ICsgKiBAaTJjX2ludF9kZWxheTogSW50ZXJy
dXB0IGRldGVjdGlvbiBkZWxheSB2YWx1ZSAodW5pdCBpbiAxMCB1cykNCj4gPiDCoCAqLw0KPiA+
IMKgc3RydWN0IHF1aWNraTJjX2RldmljZSB7DQo+ID4gwqAJc3RydWN0IGRldmljZSAqZGV2Ow0K
PiA+IEBAIC0yMDAsNiArMjE1LDExIEBAIHN0cnVjdCBxdWlja2kyY19kZXZpY2Ugew0KPiA+DQo+
ID4gwqAJd2FpdF9xdWV1ZV9oZWFkX3QgcmVzZXRfYWNrX3dxOw0KPiA+IMKgCWJvb2wgcmVzZXRf
YWNrOw0KPiA+ICsNCj4gPiArCXUzMiBpMmNfbWF4X2ZyYW1lX3NpemVfZW5hYmxlOw0KPiA+ICsJ
dTMyIGkyY19tYXhfZnJhbWVfc2l6ZTsNCj4gPiArCXUzMiBpMmNfaW50X2RlbGF5X2VuYWJsZTsN
Cj4gPiArCXUzMiBpMmNfaW50X2RlbGF5Ow0KPiA+IMKgfTsNCj4gPg0KPiA+IMKgI2VuZGlmIC8q
IF9RVUlDS0kyQ19ERVZfSF8gKi8NCg==

