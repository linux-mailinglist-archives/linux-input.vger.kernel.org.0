Return-Path: <linux-input+bounces-9214-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0150A0FD3C
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 01:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 640673A6DB4
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2025 00:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D348C0B;
	Tue, 14 Jan 2025 00:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DjxU8R8L"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C436A1DA21;
	Tue, 14 Jan 2025 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736813699; cv=fail; b=hsvN78TboN6E+FY3eSwDLitdKz1W09nBRQ/lZLkhIds8FxlL46mIdS0ZIZ+YsJBcXpRL0uvTROsYlGmsILXV7ft56CRFX0OohmCLDsMrI9BztOuXqxD6cLjVK48EEpoUyAu8unRt19MyKW6OmtUwoSQ5zQ7lJoYzRGeYs0Q4NtM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736813699; c=relaxed/simple;
	bh=AY/PfEXTcBGo6Hl5mMRhmUhPTrzMLC4p81ZfYdrODd4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cBXzjvEYqRdJzLe4+0Y4FgU0xWrMw2JXTIPpVLi/lQLfLqMxjBPRjDuKznTVpQhwlEGo7fXoonNE294p/3rkq4DW6yIMD2TyM/IfQ2Oj8omIxXL5ibWEJfehcI036/3cu8+Y67WJiZQ1OXIoRIQxCTVQ6n0NRVhYJFZK9Mr8LGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DjxU8R8L; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736813698; x=1768349698;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AY/PfEXTcBGo6Hl5mMRhmUhPTrzMLC4p81ZfYdrODd4=;
  b=DjxU8R8LzsEGyl2er/O1b9PEdOUSUQ81na9/9jezSoz6rsVdDCsXWBDV
   r98zYNArnitUasyGfEGbp2joN642OOPdyEN8N4uH+5O+czHAGdZ0bld4/
   s02Psv3OE2TJmzfFC0ran1F7s0LcJSuW0vhiO6mThNqeyCxdObHLLXTHq
   rZICKrh9KCXrp8pG5Yb5m4YrCgBP038ehhYFmhIvNZX6L1yNEq2PJNKm1
   vTkcgbCZ8pc2Wh2foKFeBcj9xTOq3mW7I6gIqOyQUJchOC7ShOqU9wYG9
   mOu1zEH84dp4rW2hrMDYtT6KoFUPp2v8faU9deZ4x7UvhFS/38kVb6PbP
   w==;
X-CSE-ConnectionGUID: jZN1oBkYQDa/7lt6mlQt7w==
X-CSE-MsgGUID: ASMn9EZTRbSUEXxYEgCFyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36384473"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36384473"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 16:14:57 -0800
X-CSE-ConnectionGUID: YkPNwRpuQ12RUuHDmlXhaQ==
X-CSE-MsgGUID: AzuUa7FUQ1KA5rllAVP13Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104502560"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jan 2025 16:14:57 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 13 Jan 2025 16:14:56 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 13 Jan 2025 16:14:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 13 Jan 2025 16:14:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSLiCM0j1GFJ9ZPBlM3JvAYl8xZFc1EHIz0IwAP47Exe4vvmqGd1cwMKUiaQ4Ieo318LaC5xYpt0drBSsxK4FS2ykI4c/vWJZLdy67GZI9TRCKvqp6YXVx17nqHsY05l0/eXHy64X1wEZCZjVV3Ey6n7dGUsnS0iTwug52gUsJgQC9JHU0CvjXDVtSPgDzowWpkE70L8LozQSgSIv/Oa1EyocRRQsaGTN4LR2jg4jJaulYJrYKjBesukbWpJBLQuOD/9FLb9kQL2hry11IIV0eJXG1E+sEjb+mZrakB59FBpab3EYY1vzERG/zhyspqUqKmFdYcvVUDCyoUFe+66yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AY/PfEXTcBGo6Hl5mMRhmUhPTrzMLC4p81ZfYdrODd4=;
 b=EGCH+P0c/5SCHfOs5Vz/GB7C9GbCTpGHSsdThfmdVHq6wNUX/xwcRR/auR2LTSo5JNojBbWUH5QOsLNjUULrzMmpPlrhRYE1R6kDrXx0CkKWHPxBmKvXq4YJPy7Of4MRKbSAzQOm5FA9ppJP/w75oDSrUbazQC7vbeUkxgDVLuAROLYOOjDxeAcvNToEusw3c6Ek/mrJk/LX5EBG8fuRkBvXu61fqxHn1iBLphK1a4NmxujVnM1SQFh4TDqgHCacoBkmK3cw2F+Km4/q7KcznTg9XJc/nVuCgGoLH4fg7YXsexOFQWfUCGjBv5kwcPnIPMQcfNXAxaRI2/V1cRcvaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SA1PR11MB8573.namprd11.prod.outlook.com (2603:10b6:806:3ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 00:14:41 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 00:14:41 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Benjamin Tissoires <bentiss@kernel.org>, Dan Carpenter
	<dan.carpenter@linaro.org>
CC: "Sun, Xinpeng" <xinpeng.sun@intel.com>, Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
	<kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Thread-Topic: [PATCH next] HID: intel-thc-hid: intel-thc: Fix error code in
 thc_i2c_subip_init()
Thread-Index: AQHbZYKeeJY730Mjh0Gneh9eWziaQ7MUe0MAgADsMbA=
Date: Tue, 14 Jan 2025 00:14:40 +0000
Message-ID: <IA1PR11MB6098F4C6015BA0A8E72D238EF4182@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <eb4ea363-c3b7-4988-9ff5-5ed74bf47620@stanley.mountain>
 <173676293037.2279462.18017730380941074048.b4-ty@kernel.org>
In-Reply-To: <173676293037.2279462.18017730380941074048.b4-ty@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SA1PR11MB8573:EE_
x-ms-office365-filtering-correlation-id: 14623b41-a870-4592-f858-08dd343070af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?V0NQOUcrSXQ3cEM3UmNZaUFOUkdsSCtOMDdPeHBzNlNWZWZkZ2k1aEJGbWZi?=
 =?utf-8?B?dUVjd1JObWdVdkVsT3ZrRy9Ec1pJT01pd2FzeWJJMG5qbXVJdjZ1eUlzT1Zj?=
 =?utf-8?B?VFhFZFEwSzFUM3Q0MDdXbUJhc1FUYkJLMWhwUW5PWlpsT3QvNkh3RWppcTFH?=
 =?utf-8?B?cGNjZGZYUm5CRTF6Q2Z3TWxoWVJtUHRsaFVkR0l0U05RdXdScDBHYlA5MWJ3?=
 =?utf-8?B?cVlXQmo3N2ZxUEcxTExjNlF1dlc5aVV1bmJYRUhBbHFkbDhRYWZyNlRnM2k4?=
 =?utf-8?B?SDNLakNZMm1FaVM4SGFqSTk3NnNNSEV1ZTd6UzJoNkxPd2lWQ0tIczNBdEJX?=
 =?utf-8?B?a3FWMjNjc0dQZ0RJcmVtZ1RvQXAwQVpBNFJNcXh1dDd1M2FMUmVQK0RKNVph?=
 =?utf-8?B?NDdMVENCVkQwQzhBeDkwbU51UGNwVnJpWmc4ZzhsRWc5SzdhWU1aaGpHNDk1?=
 =?utf-8?B?NkhDUFByQVZpVW94WW5mdk5ZQU02b2ExRFQzWXZ2Ny9CcUVPcFd4SXMySUJv?=
 =?utf-8?B?L1FTME8xeVl3NnBkWExOUkQxMWpBZ1FZVnlSVUZLWGIvQmlXYVAzV1BpNllz?=
 =?utf-8?B?b0hyVm9RZHdveTJ2cTl4RTF2ZCsvTEN0dmhuNXBZbTJvMEVlQW51eGtDSXhY?=
 =?utf-8?B?ejFNSTRoQ1BWd1ZFNWt1WE96Tmpodm8wY0haT09DVC9kRy8zWWkyT2Jqd0ZB?=
 =?utf-8?B?NkdTaGpmMVc5NTJEeHlJeStZWGY5czRMd0NPUGZNVVBQeEVBaTNIdHpCYXZa?=
 =?utf-8?B?UnFwLzNUcElsY1N4UVpMa2RrSWxXaGJKZ0RyU0QwbkR5OEoxSzhELy9Nd1E4?=
 =?utf-8?B?YzM5Y1Z1amlqZ3NvajVLaGFiSkhlM2V6WUl2VzNMUDVOK3hpZ0NlR0puVEFm?=
 =?utf-8?B?NmYwQjREZmFFSlQrbEZNdU1XSm9NT2JWaWcwcnhFd2FadnZQeVkya3ZKYXpn?=
 =?utf-8?B?NGJSbVE0QTlMWVFVaWdiQmRVcG5CLys3WEkvVGNrZFRCb0ZRdHRDOTFmd240?=
 =?utf-8?B?TEU1bzZ6NDV2TmJ5QVQyK1lsbG5vTjJCUzV4MmhCTmE1bXR5UHBVb1FiMGdS?=
 =?utf-8?B?d2VNcVV6Yy9VLy8vWHhEVytoTUNadXpVYVMvQ0JNSjdwQ0dpQjNhaHdNcVZh?=
 =?utf-8?B?UlFnTW1SZjVabW9IQk53WXNaUUdPYkJQRmx6LytxT0N6RmFqSW9Ld3lNOE1K?=
 =?utf-8?B?RE10bTVhRjB4VDQrVTFEMW5tMEl6RkQvR08vN05iOTNTbWlFVDZRUHNIOEl3?=
 =?utf-8?B?bG5uL2xOdmxuV0pNcjBZUEptL2NJSUc5TTdFeXc2cVRnak4yLzF5WmM1am4y?=
 =?utf-8?B?YUZpWW84MVBFWGRlb093QzQydUZlNCtPYnk1cE5FZnlZQXJQNGZPSW9oMVFs?=
 =?utf-8?B?V0lEMWdOYUxSV1IzdjBkeVdaYzQxaFR6cytTYU5FR1VuWGRycThac1kzRVRB?=
 =?utf-8?B?cTZ0ZFZmWUNqazZKbmkweTlxcUZBbDZHMXFZZjJMQmdwUkp6bG9vRmZNUXo3?=
 =?utf-8?B?anJyTU1YZlU4QUJXdE9EUmVCWURXWVFibWdwYW5xR0Mwd3NtalF4TXZWc1o5?=
 =?utf-8?B?cEJMTGQ1YmwxK2lmcU9ZZ0hzZm9VaFE2OXdRL0ZzZlE4LzRtRXhWeUtWa3NK?=
 =?utf-8?B?WElNanFNWG9YTzhOTE0xdm1VaG50WDVnZ3BJekdPU09aZjhsUVNOQlhHWlJB?=
 =?utf-8?B?OXVTb1R5OHJBTi9yKzlvQ2xQdXpva0lHNU91Y1NVbFNFQkVIb1JsWWRrZmc4?=
 =?utf-8?B?ZWMwN0JML290T0hmcVFkTUZiaU9qbHVVNFgrcVltY0xDazU5UHF4OHVEVnJK?=
 =?utf-8?B?M0lSZHVjeHR5THExWTZTcDBYU1JlalpUZFNIMExZNFNnSjNseVM0NS94V3hQ?=
 =?utf-8?B?MDVrNnlGbjlNODZYVDRYc3UvSnd1cUpQbzl0T1lmd2ZTdGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTRXdTVwR1JZaVVGTEhuNkl3cHRpU2U2ZTlOVnpTRDZsTDNiS0libWJQc2NL?=
 =?utf-8?B?NXEyUnNxeUZpTElrSlFNU0l5enZ3dFpHbG9BVS91QmZtZ0tqV0ZJL2poZnZP?=
 =?utf-8?B?RXFYSXhSUmY4a1FMOHlFaHhmUUtyYUEzREpMbFJqc2Jra1RVTy9rQ2tkS1p4?=
 =?utf-8?B?dWh3T0NrVDZ6U2xHMFJuc2VDd2pSaFFkcnBTK2lDWE1FMFNDN1dRRGl4cHlG?=
 =?utf-8?B?N1lVVlJhQ3pUV3lMdnJ5ODgxREltTERNU3NpMW9QZkxmemlJVUJPRG52RHA5?=
 =?utf-8?B?SjFEL3JzZXp3bDVDYnBZRmY5K08zZEt6OHBlV1B3VGxWZnkzRElZK2dOaTRL?=
 =?utf-8?B?aVBiZXJBckJWL3gwbHZUTVhqRTFKaWlIWmdtbTNQRkVwU09iWjkxUUliNVVD?=
 =?utf-8?B?b0NGZnc0YXBTaE01SjgzVkw1dFFqWkdraXRRK3hmMXF1MTBGc1pQaTZsMkVD?=
 =?utf-8?B?TGtUVnBJUHVWMm1TS2NWQzgwajdlK0VQdTVqMzVaVlViZW9qVHNidjQxU256?=
 =?utf-8?B?MVdwaCttSDlTSWRJenZCS2VvRjlTVTIzempqVDVHZ3FxaklNUzhzTE42VHdJ?=
 =?utf-8?B?QUpidFd1YzdBdGpTWHpmM25obGFjczh4L2pqUXUzZ1FSTlpNbHNCQ0l2K093?=
 =?utf-8?B?ZG51VFIxb2x5QVBsbTdHM2E2VjFNc1hsclcrUWhMUnZDNWo3a1c1aTRtYUFG?=
 =?utf-8?B?czh4Q0hScnozTWVHYkt0YnNFWFlvbU5HTUNpM2tmTHJZbVVSSHRzN2szZEM3?=
 =?utf-8?B?dnZUaUZUSlhHSUFUSHF4UlJqR3VtWEZZeVZBS3pZNEVSN3pKQzFVUzJPK2dN?=
 =?utf-8?B?WjF5aExKNUhYQXFxYXZSVHZBK1RIVm5hNHBZMm0zeC93S0I3cWNUMDZNVjl4?=
 =?utf-8?B?VVJxSVR2UTRNRGNWRHo4L3g1cXE3dzZrcldiQkY5dmJuSkJEVXpLMVFmcndt?=
 =?utf-8?B?ZzdHa2FkdXdtM1pVOFJiRDRscy8wRWJqRjd1R0lCQ3UyQ1JPdXhHNmswZCtD?=
 =?utf-8?B?UXlKK05IMnBxRWh3eHluTERFN1greUkyOUxnMmc0NGZSYjlBaURFK2xidTdy?=
 =?utf-8?B?VisrTkI4cEpTSDExelI5WW91QWR0UmswWWJjcm5Da2lNZmRBc1dvcTB2aWpq?=
 =?utf-8?B?bm96NDI0UmdsWFNjK2JaSkJOOGRxb093azlXd3lxcUtQNW5NYlYvbDg3ZHRG?=
 =?utf-8?B?UWtGQnNiMEFwZ3dmcXhBL3BscktZRUNKNzUzK0Z4ZkJya3NxdjNZNUJDQ2hv?=
 =?utf-8?B?ZlJwTmpEZXJZb0tqMXF6dlVFVlhIeFY2QWdQTlp6SmJLMjZtTjg4ZWV4Tnd3?=
 =?utf-8?B?VkhFckU2M2pKSndQSzdEbFZzYnJRV0xiSGRSR1FxNkVOQUNIMmIyMEtSL2dI?=
 =?utf-8?B?RFM5ek5XcnhndDZ0ZDBWb1AzZGZJYjVrdTFPY2doN3gvaEFjRlk5aGVCUEdn?=
 =?utf-8?B?c01RM3oyZHBCOTZMRkRHWXdYTXVKaVJqbFlnUW1RTGdwVm1ueUMrMUNOc291?=
 =?utf-8?B?aFB6dFVoYkdqZGJ4MW1jb0x0cGpFMWdFQWFxK05kMHFrb2dTdThYZWUvOVdz?=
 =?utf-8?B?S2twYkZxNjMxTWhCQkZoRXBOWTVIU0s5K2NuNkxtUkNLemVIRUhrM0xYR084?=
 =?utf-8?B?cHd6QldIYXRiZWM1SFo5TGFGckVOL3Rwd3lWcWo1YnZJcW5xL0JEejlxRVBz?=
 =?utf-8?B?cFdwKzUrNDRtVWcxWFNNS3hCVUNjS29yTm5mSUg5VkFzdUR4VDRpNlBZM05F?=
 =?utf-8?B?U0NsT0RmOUI5amlvNVZ0OE1Wa01DTi9qZ242ejFOdXdzU2d2MDFmcm1jZjJ3?=
 =?utf-8?B?L0lIZWZZUmtlUmYzWUdXY3FQaW5RVGpXUmNvTnpNTElGMksxUTZmSXE1UDF1?=
 =?utf-8?B?blkxREpGUjMvZWZId3BVVUZtaHBuVnk3NllRdjdYejh6d3FuWEd3Ykdvdnp0?=
 =?utf-8?B?Z05jVk5CWUxBZm9VVVJTa0hQQ3BNQis4eFVSeXVwOG44TnRkOGpTTlhKcUgv?=
 =?utf-8?B?RGMzUlo5UUFrdDlYUTh0ZEVmaXR1ekZ0bFMyUFE5b3ZEUGUyWDRuWXpPU1Fy?=
 =?utf-8?B?SGNXQm1hL0l0UkxjdWZjd1FvY1NRaFhUWnA3M3JlWW5XZSs0M3RZcFc5QnVR?=
 =?utf-8?Q?oOE2t8UoF/JGss58fQ6gbWSYx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 14623b41-a870-4592-f858-08dd343070af
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2025 00:14:40.9771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JY95IcH4W19dCk+UlE2JfsF/TevgDTt8WSKeoGWNnwXicInkol6zhCdFDneounzOEatVWZt9nE25Z3z7Dm/RFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8573
X-OriginatorOrg: intel.com

VGhhbmtzIEJlbmphbWluIQ0KDQpCZXN0IFJlZ2FyZHMsDQpFdmVuIFh1DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmVuamFtaW4gVGlzc29pcmVzIDxiZW50aXNzQGtl
cm5lbC5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSmFudWFyeSAxMywgMjAyNSA2OjA5IFBNDQo+IFRv
OiBYdSwgRXZlbiA8ZXZlbi54dUBpbnRlbC5jb20+OyBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQGxpbmFyby5vcmc+DQo+IENjOiBTdW4sIFhpbnBlbmcgPHhpbnBlbmcuc3VuQGludGVsLmNv
bT47IEppcmkgS29zaW5hIDxqaWtvc0BrZXJuZWwub3JnPjsgTWFyaw0KPiBQZWFyc29uIDxtcGVh
cnNvbi1sZW5vdm9Ac3F1ZWJiLmNhPjsgU3Jpbml2YXMgUGFuZHJ1dmFkYQ0KPiA8c3Jpbml2YXMu
cGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5jb20+OyBsaW51eC1pbnB1dEB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LQ0KPiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBrZXJuZWwtamFuaXRvcnNAdmdlci5r
ZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV4dF0gSElEOiBpbnRlbC10aGMtaGlk
OiBpbnRlbC10aGM6IEZpeCBlcnJvciBjb2RlIGluDQo+IHRoY19pMmNfc3ViaXBfaW5pdCgpDQo+
IA0KPiBPbiBNb24sIDEzIEphbiAyMDI1IDA5OjE1OjQxICswMzAwLCBEYW4gQ2FycGVudGVyIHdy
b3RlOg0KPiA+IFJldHVybiAtRU5PTUVNIGlmIHRoZSBhbGxvY2F0aW9uIGZhaWxzLiAgRG9uJ3Qg
cmV0dXJuIHN1Y2Nlc3MuDQo+ID4NCj4gPg0KPiANCj4gQXBwbGllZCB0byBoaWQvaGlkLmdpdCAo
Zm9yLTYuMTQvaW50ZWwtdGhjKSwgdGhhbmtzIQ0KPiANCj4gWzEvMV0gSElEOiBpbnRlbC10aGMt
aGlkOiBpbnRlbC10aGM6IEZpeCBlcnJvciBjb2RlIGluIHRoY19pMmNfc3ViaXBfaW5pdCgpDQo+
ICAgICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvaGlkL2hpZC9jLzBiMGQ2MmZhNzNmMg0KPiAN
Cj4gQ2hlZXJzLA0KPiAtLQ0KPiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVsLm9y
Zz4NCg0K

