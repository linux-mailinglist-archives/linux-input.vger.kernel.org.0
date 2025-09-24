Return-Path: <linux-input+bounces-15022-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FFBB9823D
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 05:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E666D189F504
	for <lists+linux-input@lfdr.de>; Wed, 24 Sep 2025 03:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959227262D;
	Wed, 24 Sep 2025 03:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aXqrUvp8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B632F56;
	Wed, 24 Sep 2025 03:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758684707; cv=fail; b=OOBKjFoscfJG5OertYvH20Cn6gmhtBtcEtAHlAus7ndVW5UyuYbNg79a11aXWZoSA2IQRF+2DAyjASA8MZT1Y1SsS4jLE0dO12yJK7ncMDxHeszZtg6Md76RBYTX50onRVPlyhgueimzaFI4W1LPu/fz/LT6Lg/pV5a8sW+xe5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758684707; c=relaxed/simple;
	bh=ZBtbLu3Q1STtygtv1QARANYpK4lfRomFBq4aVncnQuY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gHHO4r4reIOmoEDx7lmHBZzePnGAsh23ifVHAuDCtqWsmhjEgbFazxOQM+2HqCUIGI5hGLDHW0Leyjt6cahadSbZcbw9rmyyOVsncwsNnv0mb1yYaaAGYDY+6uy/A3YGxVYtWx08E/aIME+J9Yu+4lgagM/OYjyGTMUa8v7UXYQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aXqrUvp8; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758684706; x=1790220706;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZBtbLu3Q1STtygtv1QARANYpK4lfRomFBq4aVncnQuY=;
  b=aXqrUvp8giOGvScJYHlmlACqAGZRCTxZO8athIGxJ704/8skR+6CYz0+
   CvxIdKI8ai6CNKh67RdLtrhkxvxPze40+7OyywOQi9TB+aYmb3Nr4TfF9
   y6Qj8T7iRBviZyPwaPmyEUsg4UzcD9HjFsiSReTNYyDdAI8F97QPhyzpN
   ZLuItG8R3tOBA72OT7H0OqJfF9NnXho/o0xHAVOXnroCWIpgnVX9tXns7
   rovGlXhA7V2lKFH95JBqxduBKRZmEooEofSC01N7ehzzkQ84xDG09d8yc
   WviPHvT32U34u5N30RUS+1hH3W8Yz09H71a7skLRQFaLoKQZHyBuwgLCc
   g==;
X-CSE-ConnectionGUID: a7YhOMFHR1OxaDvrC0bT3A==
X-CSE-MsgGUID: 8t0uIgghS52F5htanniIsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="63601431"
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="63601431"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:31:45 -0700
X-CSE-ConnectionGUID: K5qj0lqNRA6na+1S4dAHgQ==
X-CSE-MsgGUID: wq0TozvCQh2vVu4aeraejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,289,1751266800"; 
   d="scan'208";a="176214671"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 20:31:45 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 20:31:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 23 Sep 2025 20:31:43 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 23 Sep 2025 20:31:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QyYdkuK487MuvRc9aRae0K/QA0zlo2Aqsu98pSWRfnd8CrspDyhateqJr5AIGY/p5bU4JlFbF3mylUL3DvdKLdksfZG3nenZ9xyYxG3Ex09r5tvuNFuRz/G1FmUmExq0/gluxCaMnwrG+edm0H94g6S8a+9zHCalRPJmKwmZ8g6wfD01AEWQk5IvqqlxJAtiSxRSg2n9T2zyWAYtdX46Ubyn7EbiAr3UKZsyBsSUNz1fMvZaJLLAnRrl8u3ZPnUqlB+jp/QaCHMns5xFeXI8OK81FIun1jFFxiZ8sF7WLxXfwb3GsEaWNATaJBcJ79o4efMtUQlB6o/VBR9EbChncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ8DThgwDjW+Us1Bt25LFKDTiHx93E4hXqWChAo5cCA=;
 b=E84ohvl7bNrAXQMMNxBGPhG9Gj+oFF2zfRHJJ0JzGTQWSQdOnVymqo4HZ79eo8rcMuHaDUF8vNXqsD7D/vRrYpUczISCDe6iOneK8z9eLoJZ1+3JPo/InmI/SIrA/G0Y2j6o+VfXic+/cVL2uyIkrd7tGyaE8l3+rDWNwdfqIfkE/7cR5/5VF/uLy1wI1dZ4VjFK95VIrWxO0S9pNWfiR6P8ohcb+JkCf7gXYVV/uu4t7LD8hbGHMLRjp5iBJtwTqyNvOcimbTVkySjD71PxnkfXD1Ivy3isLxl+175Cp9YusooWVcN6kSOvlPIM57uLLQtXiQlchFklamYHSRul+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by BL1PR11MB5954.namprd11.prod.outlook.com (2603:10b6:208:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Wed, 24 Sep
 2025 03:31:34 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 03:31:34 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>, "Sun, Xinpeng"
	<xinpeng.sun@intel.com>, "jikos@kernel.org" <jikos@kernel.org>,
	"bentiss@kernel.org" <bentiss@kernel.org>
CC: "mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device
 Id's
Thread-Topic: [PATCH] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device
 Id's
Thread-Index: AQHcLD8QgB9sFbMsR0aENO/OvQwsbLShrigA
Date: Wed, 24 Sep 2025 03:31:33 +0000
Message-ID: <IA1PR11MB609835ED0230AC6D60C54906F41CA@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250923040254.7547-1-abhishektamboli9@gmail.com>
In-Reply-To: <20250923040254.7547-1-abhishektamboli9@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|BL1PR11MB5954:EE_
x-ms-office365-filtering-correlation-id: 24016344-d6d9-4ca3-c699-08ddfb1adc52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?jTwFY1IIgcISWEvdmnIddYJr0KZ8LVA2VY2F/mWNdWx/yjE81SYTEIsemXfC?=
 =?us-ascii?Q?X0+SjRW0MadZRpEto8QbVwAAda8JdxbVjcTRv2Xc0j+7psr7NgecvZGHLwQ6?=
 =?us-ascii?Q?BtvvHBixs6K8DFRkc/RnsLHC26trxQsFz4jKXYHv0hnyeCyFcj5H9Q3yUHBQ?=
 =?us-ascii?Q?0YLd1Hi4o8K2x0ydpltZq0sVKSMeUZIIubWAvDQzTHXAx/pmESgRR9C4HOD0?=
 =?us-ascii?Q?sOXmqBYOWRRvXtT8MpzY2sQAZcyHx/mVtwb+OjWW+uPNIb9/Mg4ckzOKBaba?=
 =?us-ascii?Q?kDqftZekSC8NfODx/2NGOjqra8VwpButDhQ6o6tm6ZHKXmU4mpMGLrAeTuH4?=
 =?us-ascii?Q?76dIjPw0V8Nfq5RhwKt+HgQNlS2wiZlLx0TVcf3pWoUX1k/bE7xTzYQj/qvB?=
 =?us-ascii?Q?bQSr3zrZQ88Ozvxq162fVSQneDuiIu6EUUi0as2c8OsYVAaRBQRypyFvjmO5?=
 =?us-ascii?Q?p9MSsc64LWUdsjEM6hjF7Iijbigs4HdOKUolYS5HjQ2o/tvPnXiSqMGizON/?=
 =?us-ascii?Q?rwfqxq/WuIhsvqn9i+Y0kOpXfgbeJPo6Xc2jhSqMMhunb9a/bFzChxqT3IS/?=
 =?us-ascii?Q?7Yifbq7M6AJ03sM2Tw7oJNMubF1qBbzHiPIGzRCqwiDkR3HqHKiZO9o96Q0w?=
 =?us-ascii?Q?xcyduwd8b/UFPYYxYojtItEFk28w3YlZ3SKM8axHi+MlHYo6cJDwV10TP67B?=
 =?us-ascii?Q?fKRwyemxCCZCcMkioMlk9Wg9IjXIN8wVdxa3xwJOe+qYLW0u+wHY8G0nYoed?=
 =?us-ascii?Q?GoH29R7kjuP3yZ6TE/gQ+VzCzDSq3QNoAxgEzcoG6i2381eiBsYuuLRc5Ca4?=
 =?us-ascii?Q?uKQQK8EmgJwRhoavra9QzJVFDfG0nPMCC3nCMaURIUGe/tAkP35dzn6ucHct?=
 =?us-ascii?Q?sbJ4KNIUi5uSy6x9rWjld95q04jZGdx0ovmcqCAe6+aOmjLeMwyPp0vX6zUE?=
 =?us-ascii?Q?evyFbC3dG7QdbpGeCRufTMBS9AOcm80sKXtetSJLDN0L9kFivwpLkjY/9HzK?=
 =?us-ascii?Q?o15K8L53usLx40WdIisdbjhpQKM2cqpB5PHx1TEev+cI/qFeLv2m0vXF8oRX?=
 =?us-ascii?Q?Ck2bCHwIDri0qdjao66ggnNDoM88+vis/HZv8OpYjmm2HuUX8DVUa9oI7d4y?=
 =?us-ascii?Q?lq1lpqFP1esB/63zehKjptPaY0maHUQ/Tnyfd1rHMxIy++KQeuTx+Ani9A26?=
 =?us-ascii?Q?3vgEgrO6ibJ+cGZ7948PwQ57+qzMETXWheovQwmEffiLC0wRoYUoeAaGkjS4?=
 =?us-ascii?Q?uuCY6Io89evVa4zD/N9ZqNKFfTZM85ZKui6q+FlcQVyCd2Owuvc0pGZkhDIE?=
 =?us-ascii?Q?F8PCzDuA/3ja7mHzOklU7wiXibq8v/MeQOJMPuOLUUSt7bggR4w7aerr5Qmh?=
 =?us-ascii?Q?TFRPYIxptiUmWRfVET6Ux3jci3biTAMTt4sP49CjwnJwY1RgiEayLZx7anpT?=
 =?us-ascii?Q?94BUp+Mh60OYFmhRxRO6DOBzuY23UpKyS2tHUMhu1gtEm4kT2eSvnUX96Z9l?=
 =?us-ascii?Q?SvSNGSU1sOsVaB0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?njj/L/3qU98KeewCBETondDae+GUE6yskxeDVndJYm878h17O7zaHPgnmiS+?=
 =?us-ascii?Q?XvBnG7a7p3WrSxtf1/Tqgwv0y//6c6ZYlJeumIUUps+EdDTlLnF+zVpCKiTo?=
 =?us-ascii?Q?QnFvrLz55PQoWUur6rrFHCVO5LutQOVv94njwI++Ud1ZliuALvQnbpfNpAjM?=
 =?us-ascii?Q?EKseLaGtDSH4M7mBHyO9VwbZ+NU7rwRi4mjuw13T9R7hGaXyVfXlQroF1w7l?=
 =?us-ascii?Q?JqopmL3NWSb/K+MFwtxk3EOhgOWE6HS+W8bOEwOJXk/zDCC2Lb9V7pV3Oh4E?=
 =?us-ascii?Q?cZ750x9JQ7Xrg+x3I5bHwTpCOw3SwI6RNbc2cm/zltU/Fx5+amicwcuNDsAG?=
 =?us-ascii?Q?4B75YGNtTJXk0CElt4Qz2ZVEr3hkp2TlwGYREGWfarPh6FF3+o/XHZ2XbQaX?=
 =?us-ascii?Q?FkoTG6tPjmnwngv8BlFluE2ewdcT5wptK0PGWma/l97agBpypfwdsI5ZnjpY?=
 =?us-ascii?Q?JYN0JVhNL1i2OZneWAhUq2WCMyYw/Cxi9/mpr66z4sPS3SkP2qUAQGT1V09R?=
 =?us-ascii?Q?Qs/Ix/D9joNL8DYIO2w6I08UJmzQ3aXJXY+CfQcqU/RNj6ZT4yVgkb46BEll?=
 =?us-ascii?Q?XxGtU9GZZ/hxI0vqRvZUEgzWW4TWbgAHbya6UArhzc9YH39afUbXEGEJicBy?=
 =?us-ascii?Q?TL69k8fDbHwzSWR+KaNSTYAs7LoI75KKqAYErgwkNIGHIXH3aqg8VU1jJ6WX?=
 =?us-ascii?Q?SMduiDxIi6NONsJQ9pIA5+R6Rrisxv+TRTADjW3tKYD5+4owFO8YS+/kbSCS?=
 =?us-ascii?Q?Heru4IZjt7Ewv5JQ/CzWDvJjGbBYtLhEutDgjaKIg4WTssIdUYWcZLbr+xGB?=
 =?us-ascii?Q?525bjRjjIKBddTSNYKJzRYxGnd5TtJpUkY9yScIeRrt0fukN/lOIB4Ekdj6g?=
 =?us-ascii?Q?/TkYqwmwBNWfs0dwGQXdNqXa2rvh4+YQaydJKKoE1Nq1ZXD8uOHq/osZil0s?=
 =?us-ascii?Q?/62FRF9mrhFVdG5MsIcMNP/y7jW3/uhRpqX0/PksvA04Es56aPsmRM+WtH3V?=
 =?us-ascii?Q?YJKMTj01CV279+xgFALBm4dyI8fFt75951xqELnq2rXIKT+TQZp0oCUXhemg?=
 =?us-ascii?Q?5cu34QNTA96PS5AVeL8zOxzzD7tGv+P1YWiSjXV9MCJDP5wYJPocUggN3yvw?=
 =?us-ascii?Q?x40lwdQkUBmHC198Pq1uVhkkI+vJ0vbssTaiFJpUFUkNWxCj2KEKA0gwgHti?=
 =?us-ascii?Q?4ODCZl5LHzPmHIy6w4hft3Upwt1m5JTYbaKrfQshEjl7Y7oIOjaBFssebOMj?=
 =?us-ascii?Q?RQJxGtsn3kuL+XJtDnZIa1jyQcQBY6Wsmv/Oi2q9ecp+gT2zQrvlR28ZVJtp?=
 =?us-ascii?Q?DyPCyRQPmo6xc/hcjHO7FHnsvPjJdlZN34I4t+p8fBelMVPVZEhLINclJstH?=
 =?us-ascii?Q?SlmaEusPTEZSF1pg9FPbMhL8GCfRDQ26uVHeaV5SzWdd2WeLxw+zIWR1PveK?=
 =?us-ascii?Q?XuxpyAyUAi7TDTpTHBNmkevWUQenWJNnqn4e1QzOkLDhTRKmwqbDmPKMqXwS?=
 =?us-ascii?Q?HFIgStB1jZOQqup07Pj3b5F95dmqdWb/AXD9fzrqSYwr8AVt5ged2CxW+wuR?=
 =?us-ascii?Q?+qXk/NAqRqBzF9Z2zgE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 24016344-d6d9-4ca3-c699-08ddfb1adc52
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 03:31:33.9884
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PXTAa4/cu1LjZJFb8HhsPo5sX8IE5YtxihJrJ1iU3CMCgwmWjE/f+IBiCbSEYDfmdliR/p4UbAjAqkH9tnZq0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5954
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: Abhishek Tamboli <abhishektamboli9@gmail.com>
> Sent: Tuesday, September 23, 2025 12:03 PM
> To: Xu, Even <even.xu@intel.com>; Sun, Xinpeng <xinpeng.sun@intel.com>;
> jikos@kernel.org; bentiss@kernel.org
> Cc: mpearson-lenovo@squebb.ca; srinivas.pandruvada@linux.intel.com; linux=
-
> input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH] HID: intel-thc-hid: intel-quickspi: Add ARL PCI Device I=
d's
>=20
> Add the missing PCI ID for the quickspi device used on the Lenovo Yoga Pr=
o 9i
> 16IAH10.
>=20
> Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=3D220567
>=20
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c | 6 ++++++
> drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h | 2 ++
>  2 files changed, 8 insertions(+)
>=20
> diff --git a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> index 84314989dc53..49c8458f0118 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/pci-quickspi.c
> @@ -33,6 +33,10 @@ struct quickspi_driver_data ptl =3D {
>  	.max_packet_size_value =3D MAX_PACKET_SIZE_VALUE_LNL,  };
>=20
> +struct quickspi_driver_data arl =3D {
> +	.max_packet_size_value =3D MAX_PACKET_SIZE_VALUE_LNL, };
> +

As I know the THC IP in ARL is the same with in MTL, can you change this ma=
x_packet_size_value to align with MAX_PACKET_SIZE_VALUE_MTL?
Thanks!

>  /* THC QuickSPI ACPI method to get device properties */
>  /* HIDSPI Method: {6e2ac436-0fcf-41af-a265-b32a220dcfab} */  static guid=
_t
> hidspi_guid =3D @@ -978,6 +982,8 @@ static const struct pci_device_id
> quickspi_pci_tbl[] =3D {
>  	{PCI_DEVICE_DATA(INTEL, THC_PTL_U_DEVICE_ID_SPI_PORT2, &ptl), },
>  	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT1, &ptl), },
>  	{PCI_DEVICE_DATA(INTEL, THC_WCL_DEVICE_ID_SPI_PORT2, &ptl), },
> +	{PCI_DEVICE_DATA(INTEL, THC_ARL_DEVICE_ID_SPI_PORT1, &arl), },
> +	{PCI_DEVICE_DATA(INTEL, THC_ARL_DEVICE_ID_SPI_PORT2, &arl), },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(pci, quickspi_pci_tbl); diff --git a/drivers/hid/int=
el-thc-
> hid/intel-quickspi/quickspi-dev.h b/drivers/hid/intel-thc-hid/intel-
> quickspi/quickspi-dev.h
> index f3532d866749..7f0fb0056244 100644
> --- a/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> +++ b/drivers/hid/intel-thc-hid/intel-quickspi/quickspi-dev.h
> @@ -21,6 +21,8 @@
>  #define PCI_DEVICE_ID_INTEL_THC_PTL_U_DEVICE_ID_SPI_PORT2
> 	0xE44B
>  #define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT1
> 	0x4D49
>  #define PCI_DEVICE_ID_INTEL_THC_WCL_DEVICE_ID_SPI_PORT2
> 	0x4D4B
> +#define PCI_DEVICE_ID_INTEL_THC_ARL_DEVICE_ID_SPI_PORT1
> 	0x7749
> +#define PCI_DEVICE_ID_INTEL_THC_ARL_DEVICE_ID_SPI_PORT2
> 	0x774B
>=20
>  /* HIDSPI special ACPI parameters DSM methods */
>  #define ACPI_QUICKSPI_REVISION_NUM			2
> --
> 2.34.1


