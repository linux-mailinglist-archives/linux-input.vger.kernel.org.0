Return-Path: <linux-input+bounces-9125-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE17A083FF
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 01:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E3367A39C5
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 00:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F2216426;
	Fri, 10 Jan 2025 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gikGFeO8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5186E11187;
	Fri, 10 Jan 2025 00:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736468898; cv=fail; b=EzrSCxLlxBEhqBrJoJ7j+tb0UzX0aZ+jN/EmilFj5MJ3dlMu2lrwc0B1wv/+AVFVo95DQGYQuOUz032YCZaSuQ2z4dOxg3ko4bYiB9NgN873OgCSS8+fW4a2EVGaKETFMaUI++yYL0bsNB5E9kbz9DkTcFzBmPD4edkILx8jBOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736468898; c=relaxed/simple;
	bh=wfja0Z3qyA47QemRG4H/ep0wwOBA7i3/1BVhIoyn8Fw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=u2c7xGT6v7iTgFHbx+BMPZnrCqhHub3iVZYR5V4aM9gig5Rjqlbw1doqcBGRkbsWeicNVu+LDhPKuy9ah8WzqyLvwHpI8o9yHW2fFv5ypTbKl2Z87+0KVkpHVF4bCjEK+V6n2lBKcKGZVnYljFQuCUW4rVmEMXvwKPiz9+IPeSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gikGFeO8; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736468897; x=1768004897;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wfja0Z3qyA47QemRG4H/ep0wwOBA7i3/1BVhIoyn8Fw=;
  b=gikGFeO8nXBdNW38M830bXGCn2QMkqyD62n6qoOj47ux0dh+wpXJ0+JY
   Obgjeu/9NjlWovp2RMbe3eRCO3Q9s56CTm+Rvt0pfKVvpBMvu2ryEsNJn
   kIr8nslHSc+G6tbOFV0v8cWlW0bOuIe0ux3VBmo808eeH7rmmOYXSZ/2W
   t3Ti4yQncYvnI4viZ/OQhXfO4bkHEdkcQiCPyPRprXeqMKWP9q+VzHnwt
   Ki2Yr/XgzPh5BmjSoObvZ6ENsNQwZDnC4g0PHIKA1mIK78Z+9JVfXmLcL
   0I5M2nx7iIgZvkmYLuEyCkNjpaSsIceXkJy1CLxkBATFHJ2UMsEOHNOX1
   Q==;
X-CSE-ConnectionGUID: xarn/itySx2371AJMl7XCg==
X-CSE-MsgGUID: Au9sDskjTGiaF3P97mj8vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48120412"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="48120412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 16:28:16 -0800
X-CSE-ConnectionGUID: ih0YzFprQsewMSuXXg2aMw==
X-CSE-MsgGUID: xuhc2zU9SnSI/qV9Kd6Chw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107612017"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Jan 2025 16:28:15 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 16:28:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 16:28:15 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 16:28:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i986HoOwp/MsTQfw7jCdAukgCA6kDFm1B0jRK6UY0m435128KMV4ZAgC1fk8sQ4J50pBfn++wC9UANOF5xKMwz32DDzznQUelOjtTJFFcTSc53P95ioxcqIqjugiJeexaKIpj0jg53W2sPZL3mjibODXR5TGbEBD+8hTwTL7Ep/Bbsiuf3QVaMlXC4X//+iW7u51xTIMwZdGbhqCubIIZZSMAsD7N/Gt1OVcE16O3T/qTAOK+ZOoVkDlqxlmWQWKBsUF5BjS/Pjm3dRE306XF2PBRPYZxi5McPs77tns6QhTeLjFOPidrnlKpO4gVtYfkJ7tFh1fLwEE4nhocS/9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfja0Z3qyA47QemRG4H/ep0wwOBA7i3/1BVhIoyn8Fw=;
 b=QvyhRjtiYFXqgHhV4K5fzcpo2MN/Gdqkn2W6FF/5O5P8FbiPWKhm1AZBx4TvBoUgS0oyBgpxG5xd9gdB2qeZMM66bLAFpMbdsV7YP7Rn5HHZm3jEAa2/msZpaHUyzIhwltLMcLn+6m3a3ZWrKLRezorv8hh9/z78npTBlnjuFKY9Of1gWjf6pl37x1/LG8KQjo2QpJqwh/FlZjiGPHT0WlyPgne3mlfnqJjoHHDGjBgLF0QTk7RyxvgFycuFdHL9YTXYEAI94glHb6gEtc56sV2OrTW8/LrjGllIN8Ro4KJYGSYJNnR242A2Kcx78flZX6gX5xsr0iOUKBxkC9OrFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 00:27:46 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 00:27:45 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>, Ping Cheng <pinglinux@gmail.com>
CC: Benjamin Tissoires <benjamin.tissoires@gmail.com>, "Cheng, Ping"
	<ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, "Benjamin
 Tissoires" <bentiss@kernel.org>, linux-input <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] Hid: Wacom: Add PCI Wacom device support
Thread-Topic: [PATCH] Hid: Wacom: Add PCI Wacom device support
Thread-Index: AQHbVzaEgK+E7hOJOECWTTMSVcMRkLL37AiAgBZUGgCAAP4rcA==
Date: Fri, 10 Jan 2025 00:27:45 +0000
Message-ID: <IA1PR11MB60985E2FA60DB58E43A34EDEF41C2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20241226013527.3048277-1-even.xu@intel.com>
 <CAF8JNhK1GXxZpjQa4hK7rrgsyZQ64X2OYBkOQR9cpx4tfvgg2Q@mail.gmail.com>
 <87q15835-80q3-7s50-s380-p1p4043po539@xreary.bet>
In-Reply-To: <87q15835-80q3-7s50-s380-p1p4043po539@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: e6a900c8-045c-4b96-9532-08dd310d9ae4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mq6mk3pS9zyzX99xpl/SGa1speaEuvWjPBsigsCrtyW6G1xZL2ShXrg0b9uE?=
 =?us-ascii?Q?z6YFuG/M6c0p61GS0ZFZyLWq2X4IYjL1LttKpNYIqTYr0hH+KiUrXBtMAz8e?=
 =?us-ascii?Q?9WVtQp8S1d1ZDXUGmxW91Ix6mxEfTMsWQd4EXGN5nk8s42iCyb8w7jSL72gR?=
 =?us-ascii?Q?b8jIgroY0FFpe7RgbXpLTDzKvtgbnn7Y58s1rNEGIe00DhzSUXDdQinevaNR?=
 =?us-ascii?Q?7dpLdmOHmtR5PVLHrd4S/TkQhtJAj3LIbcHFBlFelOLsb5mmmO7YnfYpNZxE?=
 =?us-ascii?Q?0tt6FJk76KYQB9Im2Y0E/5E5Orkbilom25GJFS92Rerf/CIPEzRvLHYyA5QS?=
 =?us-ascii?Q?Qd1mP9V6wkw1k1x2fwB7nqGx+amSdyXWZbCPzQcv+OT5Efj50SFuLpWWO8q8?=
 =?us-ascii?Q?EwTlCV1/72Oh+GLfjHfr8BZ+Gs7RUBC04F3m/YIoRBypf4VFwCigApVMweEl?=
 =?us-ascii?Q?1uksRb6x1ImSUfTU8YY8sviVuh4nevpzCHO2Q3hpZv9hkWYJ6tnWRLB8UGR9?=
 =?us-ascii?Q?s5OKEoPEpf3ZXg6zmG9S3NbSQIYxzNwNjHXrqm/xvUFvaD0e5/96xMZ7hxWl?=
 =?us-ascii?Q?a1r6yk+IgF5+Z+7ovEvOgeTa8jpoTJW9C3fc22z2n/I88ly8npDrOB97S2un?=
 =?us-ascii?Q?ivr16BinC5bhgStvd0PSyJ8MC1Z9MNwEqC6WIKSdj5NcEBwetQ+unobAqdsq?=
 =?us-ascii?Q?FknXM0HfGBUbUWkQolrjByr7vLDDLR9cnmdvVN3OMHzZRS2IDbbXkbE3JXMs?=
 =?us-ascii?Q?Cfe2ULvPfOblVUKcIIwLdb9ySEGMyRHaad31xpBZx/m7xQ8B5hFVTxERsPo6?=
 =?us-ascii?Q?M8IdMTLctgf6lUvlY2FX0ezf+MXV4/0OeeHRljSPS5Nd2wuXvTT/COkjT3l8?=
 =?us-ascii?Q?JfXXNOTZN2Z1AQCcl3Q/AVu+G5PxfSXYvI7WKtvK7/S7Z+gVxcdrdhnWfw5A?=
 =?us-ascii?Q?z+YJSDZO/8wzdnKmg+HYSZ3AeQPzeeqdfxBITTfOadGbw2G1Aup8Yfbf5Dzc?=
 =?us-ascii?Q?p6dskC8jaH1SsPEiukIPIrh2LXZXQoZzhsdEjPNbzuw2c1GKvrwXPXheeglE?=
 =?us-ascii?Q?4hoT8cEtjE6CiECMEnovm7LGtH/S8/WPFyGx2eWFyzGeLnpJWDGvO5MXSiaJ?=
 =?us-ascii?Q?XIfu0v9mTFsICVu3p7agqZjJx46HljtOHFC7b+r7zfck36LTaU+k5UnhTuhQ?=
 =?us-ascii?Q?b+Sg4XrcFDTa4bYVLhOibGw4fzz11mH3RhqUMO8RIghJ8/OOCZMiOmnit/IV?=
 =?us-ascii?Q?7yWeTRAkaxK5PWVG2WU8kaDa1oPR2cXqknbZNJh58Xzpwka7LCnnxxE8oEsB?=
 =?us-ascii?Q?vwVo2DU5sWW1mDQoPqLQwWAhkgTufLH1pbtfXhCF72J/NI7gnMrzo8ScXmyD?=
 =?us-ascii?Q?TriDgfylxnLd7sF2U8WREBM5Ky8O?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?o7/rLX66mG8UNt7mh/syYqOl/sZKvoghRcFIvyLcHIfAcjH3hSJE11lU9/pb?=
 =?us-ascii?Q?ry2RP5trKi9RkKz1BXjkISRzv9CbyXd5x4yiPDlsQbIfhGDFcvjZAoPf1ZSo?=
 =?us-ascii?Q?sDD45IkWnkz2I8Q/RGcBu882zhUua5Ck0pDokXlNtu6TH3IQTMQho/ZOaZgG?=
 =?us-ascii?Q?RuqFQzIioJuhASD5kmU/Qz27OkUwmeZF97vzY7qN5cc4PHeU49xpkk1aJCKi?=
 =?us-ascii?Q?eGePtI66S/WBuOkc6MLwFtGcxIBt9CFf4mJ+m93Cg0OAVSKhrpGv6TCXHFD4?=
 =?us-ascii?Q?Fyb+Blh5dEGDDZ5L8dgBjdd5ou6vJOn5eW83fuWRc4EswhmGvuJgMBePll+d?=
 =?us-ascii?Q?79PGfbhBKMvd+aFFPXTTBnv7rVMr0o+nNu5VbCivvON1ryPjaOHguGTKh21X?=
 =?us-ascii?Q?PdR/yixvTinJa3MM8ll4C6GOnahJsCLNT3DuOUgx0b8atvD9a38x6LDdriFo?=
 =?us-ascii?Q?cI4fTFXKkNDnROvJ/81rFUc4vqrdAsVe/LtO4ssKKXq6Hwzuyza0aUzG2cDW?=
 =?us-ascii?Q?yCWSNRMoDI01XghSA3OxBacoiHv4BCP4HiP9nmkHcRxsSa6I4YXpmPm/gSjN?=
 =?us-ascii?Q?fijtdr5afRCC3qRDFwLA5+x56JF/6QUOmX+8NWXfu7KV8B1O1a44h4HwPrPu?=
 =?us-ascii?Q?pdOn4IkiKEIWJURjSsgTTEUkn6tjbGnzjD9eeHBWejIXpZDgz/TVlDnwJeUP?=
 =?us-ascii?Q?OtoRWVulMYtqgWB1lJ7b2GUJSfDMDJEG5gUei/vPSTqakKeLIHL9J3c6xyuM?=
 =?us-ascii?Q?TmhUZAKoqkexV3egfDQEs01W+hz86DOuo+Y/w7gCEgR/6zdEUPIS6PDWxxR2?=
 =?us-ascii?Q?mVYrSA8U/bYsHTS1D1D8PQYL8wnYi79iXm1Be/t0k4kRPNWRoZhaqJMLdw3E?=
 =?us-ascii?Q?AnBjW6mchhPFlJPA40GDcAQdbFOEkXAKJfN8F9YLARpyNEgK6hb+GwSLYdAF?=
 =?us-ascii?Q?NJAW++HA7CC5xj9qwuB77IxTbZUHHGbdcnWx/CJXjASEt4hOj99ZYwiy+roe?=
 =?us-ascii?Q?mF3rYOWEeEkxP7IYWLzYV8fo3OfMyXnfYAXm5olHBcDIgUKlmcM864LVMR/u?=
 =?us-ascii?Q?BB9x1yZAJ9hd7dy/Jxg+b2jG3uCltiIG8rJkNrpU0N7ST6NIenbtbsiOV8wQ?=
 =?us-ascii?Q?IHaGsmFUF99Kcdb9G6F3TzVU5Ik7wwRxHXYpaxEtWneYl/z5cZg++z6/tg2m?=
 =?us-ascii?Q?EzQ5edq/TB8Hf4LD+l+qWipgpMeAAWDzl9CgKbnO+gSg94ayX753+0qPFpzG?=
 =?us-ascii?Q?ZVmqSfk9Kd7MIBv0sisOM5+uKykPA51wzTT+nffc1YZZkjPlxeZwF9FbUWan?=
 =?us-ascii?Q?jcYSXdnEg2k+hfh2EcssJwaJ8BHZukXdhBl6Rc8sxhfSYrqSwKgromD53ZDg?=
 =?us-ascii?Q?P74Qa24BRthROCynTcGS6psALbkn+NEnAetR1dsGSD246RnF7Yty+WMQUS5s?=
 =?us-ascii?Q?DSVZytUS0U2EIOkQ7WBdCQTp4Xf+A62AmMVl3LhFQbRJD2KPdlY5DwaPME45?=
 =?us-ascii?Q?Vryq1PWmMgsyK4VeXanNZjYx/Ar3e9oVLnKBx4VV9rXAJNL5fMJMNAhEfFOz?=
 =?us-ascii?Q?fDEYjeaUtrem+/sHiPR1hjVLlvRB+3AlLD5RhXmk?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a900c8-045c-4b96-9532-08dd310d9ae4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 00:27:45.9112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EMB4ZwgpoOek9FW0xLtDA4YDHRF1owtRk9GGq9Q5sIun1NH13aKJGbFoOn2wJKtTGQN0uFedVUQXz0WJXomZhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

Thank you ^_^!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Thursday, January 9, 2025 5:17 PM
> To: Ping Cheng <pinglinux@gmail.com>
> Cc: Xu, Even <even.xu@intel.com>; Benjamin Tissoires
> <benjamin.tissoires@gmail.com>; Cheng, Ping <ping.cheng@wacom.com>; Jason
> Gerecke <jason.gerecke@wacom.com>; Benjamin Tissoires
> <bentiss@kernel.org>; linux-input <linux-input@vger.kernel.org>; LKML <li=
nux-
> kernel@vger.kernel.org>
> Subject: Re: [PATCH] Hid: Wacom: Add PCI Wacom device support
>=20
> On Wed, 25 Dec 2024, Ping Cheng wrote:
>=20
> > Hi Jiri, hi Benjamin,
> >
> > This patch enables wacom driver to pickup Wacom input devices under
> > Intel Framework. The patch has been tested by
> > tatsunosuke.tobita@wacom.com with patchset [*PATCH v3 00/22] Add Intel
> > Touch Host Controller drivers* (
> > https://lore.kernel.org/linux-input/20241216014127.3722172-1-even.xu@i
> > ntel.com/T/#t)
> > applied.
> >
> > Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> > Tested-by: Tatsunosuke Tobita <atsunosuke.tobita@wacom.com
> > <tatsunosuke.tobita@wacom.com>>
> >
> > Thank you for your support,
>=20
> Thanks. I've created hid.git#for-6.14/wacom-pci which is based on hid.git=
#for-
> 6.14/intel-thc and applied this one on top.
>=20
> --
> Jiri Kosina
> SUSE Labs


