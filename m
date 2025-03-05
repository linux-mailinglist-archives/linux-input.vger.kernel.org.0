Return-Path: <linux-input+bounces-10553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C18A4F6B0
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 06:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7099816D751
	for <lists+linux-input@lfdr.de>; Wed,  5 Mar 2025 05:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2213B19408C;
	Wed,  5 Mar 2025 05:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CemJc9nE"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571B178F33;
	Wed,  5 Mar 2025 05:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741153741; cv=fail; b=n5X38+Kq6GXFVtWXeBlSULdkvgt7o3XoSIcpUOiKfESu3bXnkddhfMVZfvNfIew+FGUrdfM7dngEqC/NLewUzqS13mvxMFbukEgyLoiyV1whpliDjkrKIdlAl1cBQtn1mrvreL7SR7amO5ZSUb3pn29Wh+B0uFqPRV9y9EF8Ij8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741153741; c=relaxed/simple;
	bh=0kIxEHD86HXK+omkR8/iVnmcFwb/65DEfFsAHVNZCXc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZBmAAz/KfyxRMheeaG+wObGA+ys4a2JZ7Qpz/rR+sSsfxBxug6/6w4VXdJDdKuXPRS6mgmPTqKOQcUxvUbpqAFXucJf6qbpRExQm+Otsy+SzqoHtVYbedjBLkKNVCv/+BYVcawpRJbxiKGZrHqThZeSDzmhgCEwkt1coC4JN00c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CemJc9nE; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741153739; x=1772689739;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0kIxEHD86HXK+omkR8/iVnmcFwb/65DEfFsAHVNZCXc=;
  b=CemJc9nEAWfe+HvUBPUH1QYCV7v/nq1KU7CxqledsokIydL4ruMlR0aA
   G7j/yb/jYsIiN0GeuFXZAxZHBuN8PX2vPMMYPtLNUUzS9RjHsbVELOfvZ
   dq1hl3kA/rhK10EYCja0xUZqtg8IxYt5i9ev4DX6HiN0rJy0NKDvhgnM0
   cLddiAg3rR62rWy/v8kzA4OAhHxsLk7GoOEXauO8Zd0RqcrKqkCP4uJKg
   koZzv9uPRPln2leJ0V7Nw/kTTihbYQCtyMnW2yRcIcFkv3iEXA2hHdH7d
   afNtvhaoqcQybUPlCSksg5vHpi0TV2ScYY3QU/a/YxftJBtWd6GHFVieL
   Q==;
X-CSE-ConnectionGUID: CUJJ6+j8RUydrKFgVGCR+Q==
X-CSE-MsgGUID: +R/xrkO2RAafMmE3qeh7Xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41813743"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="41813743"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 21:48:58 -0800
X-CSE-ConnectionGUID: XEJVHqykRPyddET6DZCMmA==
X-CSE-MsgGUID: vjyrUT4kQzCyp40D/9TYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="123606150"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 21:48:58 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 4 Mar 2025 21:48:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 21:48:58 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 21:48:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JZjmw6y/47FGi+4TV5S7K3HsaGmGZPcYyCJhyAQUNaqYQhsW+41iTYbV72ROyCtKSkqX268fUu6HXj1/o3uZ5fa3ZRgRN+UbvHjARTH//BtqQX5TNPuQ+O9P1NYfBiXJw6b4fkHWoo/sW9z3AVaY+0N/5rRMCWNvYsq512R6rrXWyiiZpEEjc0DjPDiW/ILOSDfbntJVqi1fK5PCAooy2Ecol2VpMosZxVmLJsX/yzJ6TgHTFHxIE/XoZ3OJSPHnMJeVFMAYlYHWJrHB8LgQJdp5moHmeZovSCYNg+xjHZ/3w0IqdAeRFelL1A25GYIc3VsN/2GeVlZBUzWWX9+VtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kIxEHD86HXK+omkR8/iVnmcFwb/65DEfFsAHVNZCXc=;
 b=X6KcHwrpIHujxaFvDBFskaITmWKTRNw7y0PyCsEk6dAhVxr/SXiWKruYlzCENkGElV5xgZoeMc3BD16OWynZXf3z5z7HK9wyr5kCLU5GK6p/DI/zC/kI/kU7WT/R92N8GBgohyeAFzRtV82apX/7M5GJN3M+DcsvNE7VnzbCQHNhc09GFsfzsn9oqHywK3sfgEALKKKhL/EBJMvhXKM1WXmI0CQVxxfOLDW4LVHC8L5x8FSFADaAnDuigYR/NPnfZzDeEk2VKLzmC+UCkMvTH3on68bYU9A6O0ekRMXFxq2TAgPyPQ5dAmLXel/kG7rXrMuPX+rQBjLWMy4ocjTiuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by DS0PR11MB7357.namprd11.prod.outlook.com (2603:10b6:8:136::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 05:48:50 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 05:48:50 +0000
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
Thread-Index: AQHbjLTcANInlVCQx0+6PVpmKEX957NjdcAAgABCBRCAAE/SgIAAAGLw
Date: Wed, 5 Mar 2025 05:48:50 +0000
Message-ID: <IA1PR11MB6098DDEBDF3B7A0160CEBBC2F4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250304032255.1131067-1-even.xu@intel.com>
 <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet>
 <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
 <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
In-Reply-To: <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|DS0PR11MB7357:EE_
x-ms-office365-filtering-correlation-id: ad8cad5a-51f2-4922-48b3-08dd5ba96800
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?WVuqZ5IgLlQ75/Gto4S/RUwiYkUivYdNpc0+w+UFqvj2Mon0WoEkh2cRmkL/?=
 =?us-ascii?Q?Sntrc0+zWQnTkXSBWQcXaFFRad1/y9E6Z75gwHKyw6lzLEWM672yVuH9iuW5?=
 =?us-ascii?Q?EYptFOoqR7T1XdBkpG7juHLrlIjQyontk8OfVLtFIRp099zwQuhpVZe8w8yg?=
 =?us-ascii?Q?aaxMt6Ml75Hq0VUzGJEWhIi0YNxsigXvl0Ny/1KXQJUhSi0XO4L7lF4xVdkL?=
 =?us-ascii?Q?JYx1eGqqySnzxxo9xRp+rgD59cGhf3zqznsJAOQR3fqgxUcLKzY6FAJrMx7u?=
 =?us-ascii?Q?ken93zbJgVXaFGK8wK3vtdr3GxxTPyLf4sfcdHYUEsWTOSTToQgYm/G26TUn?=
 =?us-ascii?Q?ncr3fz54qGHzebN2tvHzfYGqyAuirsqI2hRPd3uYzWtypw/aNPGBviVT7Ev+?=
 =?us-ascii?Q?zCSEQzChSZChVtrM3wzbzHvg1ORus9Ji82xmNRXoyiz/8+XxMMvrkr/5ukdB?=
 =?us-ascii?Q?jyENbQrIID6fFBVwuk7T7UYekF8oF1uOHusLD5Yxan8nCLUtygEEeE0+/6wK?=
 =?us-ascii?Q?HmC2+/TtpC3o8ubSDqBfxsSjE7BhhuKIjgqN1WWPrxP3sLsJXW6Tp12lrmqx?=
 =?us-ascii?Q?q0MQfQBQLTND4jG1U7Nes01ilPdTXOAxeRxR8EdTgYowTl0SIP0n3hSDjqra?=
 =?us-ascii?Q?3mmx+cBL2957kZDVRefpjuHR19qANbIn/5lNy88uH6Bp6HOt/RRVvnloS+/0?=
 =?us-ascii?Q?IDdAMXK27LDJdeFofTva04BsxLv+SGgCmRO5mneJj4lqfXMD2TrEk3ehc+yL?=
 =?us-ascii?Q?bNB+CdWL2wq4g8wrFc4nxsCKDGdyPmH1IUVtimFSTBilpRm6Ocgg5lt6Um3y?=
 =?us-ascii?Q?X221d66/fEA/uc6DnQV9yZPU3iNQ1g2ru3+kMHiKzrqBxzPHxeUNSp5lusqY?=
 =?us-ascii?Q?uOg6d0e+Dr5r36Wr48jhIuzle/eaaX+J1mh/O4aJJIxB68q9DR7Alpnva1uQ?=
 =?us-ascii?Q?mmB9N1WrTmQd7E1mIMoHxXjuLDtCZz7jn3ZjGtFuB6wa14aJWHNy69gTT6Wa?=
 =?us-ascii?Q?NjWGh7l/pep5cEMXRTg9+JHi9Je1bH+mcJAjTlyEasEq+W4YLWxECXvd96Ot?=
 =?us-ascii?Q?0SDBYApE8xU9k5hTMDtcqGy+lxARb2tDnXnG7xNTzdzTjjK9ZugzMtOCNSCn?=
 =?us-ascii?Q?SZ/VS5yyKXjil3QWeboYNympQGq9YBR1wnUAadUMsgDAtR/kc4Ge/NAGNlYz?=
 =?us-ascii?Q?dZ2IA9E0u9PfZMpKbdYzOA1o2Jjo/AoL/6idhVgHdv/v1apxDQ+MpcXjiLbv?=
 =?us-ascii?Q?HvFrend30aAgTItrv9F0CX8XmgDpxtTZJXKz3BYPMPE3lC8zsL+UFi/lJPB0?=
 =?us-ascii?Q?Uf2Xdpkf4DJ+Pt8Nd3bXzgN6ut3Y8hKORdxrJKRAkqpIEqgE6lic399sJMIJ?=
 =?us-ascii?Q?3FNUAwijZjj5y/l9OTLcyStqVhI2BvHFUqv3Br/J6ooA/59aFWnBiDtj2UZs?=
 =?us-ascii?Q?pr1JNIDZGs4nCVaE0BFs1M6azKQSw44c?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yvhf03hC4xXQl3X0ig02zxsedo198Wq+7fWpwQACQYYYZBWmOEIDvahdurcr?=
 =?us-ascii?Q?aTopFlD32+lrdCp5NPhVogvmopRdV0/CBZSCjMloze9F97qEWCBVqYTxwEFc?=
 =?us-ascii?Q?0qxN6OL7j3N7ozt0WnWmIkhCJ9MKwfCafHjTFOrV+nvoUw9C1torb8hI1kju?=
 =?us-ascii?Q?EWBWjpNUrxSLH7gQWF8VKVF5rJfnX162zGt+aFZJqNYZJmmdXUQtJAwDAAph?=
 =?us-ascii?Q?46K1ls8G65qCF/Quyt8Kjn9iNXfxp9woDNaSeFV8Dr+nB8j63sBd2j8ABI1j?=
 =?us-ascii?Q?D68nRdr3H7NL4VCE8jSxvLfSE0HczOATYysZIwWa4IQpWbLdrsTEAGt/E5Mc?=
 =?us-ascii?Q?Nl+UB1Ezw1mD62d/7pVGNA7o5bUdFjFO4g/NnSXFmMNBicIo1+B6FIY6nr9X?=
 =?us-ascii?Q?O/Upa2V6NZNKbGbS8oiLGQfKJRCrramehBs0sfxjhZXik3w5pzaOj40adR9X?=
 =?us-ascii?Q?yKuLRLWDQoGjDoVP9g7IyGKsZtbr00Ls+ue2ejHuf7bPs2hcpq8xF7z0zdG/?=
 =?us-ascii?Q?B0wDXUq5QsgugQod82iroLXt8unW2RqGYFoDbREWb6Gk0DK86DrH/TyzP4Kw?=
 =?us-ascii?Q?gjNffD+o0iw399dlyX1UOUr2Xqarg3hsH4H9kHO72gNGXvGVNYN8S6lyKB7j?=
 =?us-ascii?Q?Fo8U/ULOhSC0Tg7SZbpz0se+Ai8356bSWByq9VYxV2dBY/GRXbsxj3ya2a29?=
 =?us-ascii?Q?lZFEUYCIz/LqGnMhNNYRCAQK0nuPTHVLDBcKslli9XhWWYLY0H/g5ErHeERz?=
 =?us-ascii?Q?tHh0iY+xd47d/CiDuR/ziqD6RY4/SFTaj8vGiIFB9IN76jg9hqfjsbLHeH+q?=
 =?us-ascii?Q?XBWUQZD5t9lXVaeFFZ6Cc371zt9r5/GLFmIRok3fjUB2ogz0xfBEBxJGfq4M?=
 =?us-ascii?Q?J7/5+B02kP9uVKlOHJ6yeGcr2fvKMgr9YvBWWn7VF4Bi9Mz4AMmgmqrxQiJ2?=
 =?us-ascii?Q?DHtSPHP0E3VDmpX8/5eszqL6/t1p7vYzFEkgmxDC4Pn83DL4QHurgYx9Ws9q?=
 =?us-ascii?Q?IS7AM52mfypmQk1+FK1EWBX2w1eTAaU1QT1ZuilN+MpFEFiPHjedDdo+FERi?=
 =?us-ascii?Q?rzz5Fq9TA6KUow4tvHq5RTjTLumyM37scZVn2yVpcHK1btfVMs815Q3eHD2V?=
 =?us-ascii?Q?1DDgp6SDvHABv8upZjLsS+TV3xA1G/jkxTa4ZQ7XsIHVFRXS4pvBodF8VXZi?=
 =?us-ascii?Q?t0fb5w517NUQLBS4JuoZfJXDRNugoCKzhGgw+dqwzJMUj23Zb8qJKKyOEQQV?=
 =?us-ascii?Q?xTOlYJicNrcLhdI3QeG4M37MaKAfy1F/7J1Ln54Yv9Vy59Lz37XaBUVtGRbs?=
 =?us-ascii?Q?WdW9lnk85JIhaX/RD9CFixU96fB2b1t131OLRuXXtTdYyQ0G6rxD9ke7FQK9?=
 =?us-ascii?Q?SVCf4wzUrQUS3siWamu+/oU1mMSGjqd84+NfUk7QLB+v3zauZhBP91ab6lRn?=
 =?us-ascii?Q?Bqw02LB4HxFCRBtto0dQ1LasI83dAXKsjF2ZvlJSXAyZvJVSeTclDdfK+SrA?=
 =?us-ascii?Q?GZmyr4zOMQtnGrC5HU9yaD2QhgEmhKGHVFls7MrayUmzd2EtY6dGy1+NhcUD?=
 =?us-ascii?Q?vkIcuogRh+1B21iCW18=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ad8cad5a-51f2-4922-48b3-08dd5ba96800
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2025 05:48:50.8479
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qX/LCIlXMfLkFjYQ+BLQZFFyN58llhREIzVGAcR7yr4Jy7hH23TA4ywEzSj5KaA+eizaRQejRqQZXIvLeMs/kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7357
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Wednesday, March 5, 2025 1:36 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; mpearson-
> lenovo@squebb.ca; linux-input@vger.kernel.org; linux-kernel@vger.kernel.o=
rg
> Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correc=
t device
> state after S4
>=20
> On Wed, 5 Mar 2025, Xu, Even wrote:
>=20
> > > I'll now apply this as-is because the code is already in, but
> > > perhaps renaming the flag to QUICKI2C_RESET would be in order.
> >
> > Current patch is still needed, quickspi device init flow is: init ->
> > resetting -> reset -> enabled. Exiting code in pm restore() callback
> > takes reset operation and puts device into reset state, but forgets
> > move to enabled state after init flow is done.
> >
> > Thanks for your suggestion! Let me refine the patch in V2.
>=20
> I have already applied your v1 patch to upstream-fixes queue so that it c=
ould go to
> Linus quickly, as an important functional fix.
>=20
> So please base the naming fixup on top of that.

Thanks Jiri!

I didn't realize v1 patch already got applied, just sent out v2 patch this =
morning.
If so, could you just pick " [PATCH v2 1/2] HID: Intel-thc-hid: Intel-quick=
spi: Correct device state names gramatically" from v2 patch set for the nam=
ing fix?
Those two patches have no confliction/dependence.

Thank you very much!

Best Regards,
Even Xu

>=20
> Thanks,
>=20
> --
> Jiri Kosina
> SUSE Labs


