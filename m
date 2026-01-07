Return-Path: <linux-input+bounces-16857-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46250D006F4
	for <lists+linux-input@lfdr.de>; Thu, 08 Jan 2026 01:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C3830443C3
	for <lists+linux-input@lfdr.de>; Wed,  7 Jan 2026 23:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B912FB616;
	Wed,  7 Jan 2026 23:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B62gCSlh"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541512571B0;
	Wed,  7 Jan 2026 23:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767830394; cv=fail; b=eRceuDIPJJiAqsiCrRMjyoLBAVpXtey2zCB+88JS+dfqPJIODoYcRNtJ9XDPBcVlR7Bn0uRWcSd/oIfXe8GExqIB93RKARnU2MR5PIHUZ78hZuUHwyDTHODsApdtMnKNaA9zsy96TnFvaQn/ouS4CAPr/MbeShYYyGgemSLzc5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767830394; c=relaxed/simple;
	bh=u0Z8/+KIaCJcOSkK2EaWMUssdoMeClfj3jhaSKh9Scs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=piXlZXaT49HYmeYnfOuvhALrKXVLQmgPX5WZmgWCG4RmSuzHMxkaUiUX+CWMPMLQdS9aRsxNbxuVw2i5h6Rys18imhFsGd659oOgeuxECQPzdVzu/du3J4S9xyUiXWSFosDYfJPnhUU2LihwaBhv9fjQSsKFwbqy/16GL1gASSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B62gCSlh; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767830393; x=1799366393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u0Z8/+KIaCJcOSkK2EaWMUssdoMeClfj3jhaSKh9Scs=;
  b=B62gCSlhn23jtDJuuXHWJ1yUQ1nl/4f1tdbzC4Qzm8DnWE/v/MCsC6Sv
   F+ORJm9KG8QTns9Vd/Bh1pY++EtfFTHe557xwuGgJNslxOPie+TFl86A8
   k/Z0YWTHQ+xUiZBadoi7FCsNedftyhF+BJfhiXvtxIEdgY77rlcEEIJ12
   6H6u31EVQweKKB8336TVJZ4a/sJXTiQSupxvlcEBbY82qo8hl050Le0Gn
   A6DsdyWNlQnSjwddIp247RjAUuwlZMer6jHAJmlD8j0BMjZfv+isAinHG
   xydJQW3ymZ2IMg7ecI38OpkjEY4wGbVxiurxdzC6pmyvNFth/U9B3tmRn
   g==;
X-CSE-ConnectionGUID: lSUeWaVCQAeOy0cQG3lLIQ==
X-CSE-MsgGUID: yazcxMXGSsGRd1kk5RIsdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69255486"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="69255486"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 15:59:53 -0800
X-CSE-ConnectionGUID: 9jH8SZRsS4SdQ0APHYUTQw==
X-CSE-MsgGUID: ZfRUSOoPTc6ZmVPhhE2ksg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="202262997"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 15:59:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 15:59:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 7 Jan 2026 15:59:51 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 7 Jan 2026 15:59:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEHYssbqB7LQTfqorsL+LsSN8gFja3M1Vu7Z/Oehut17RXnR++S8ZTEGlpfOYFKEB/A7rLN6evWeDZVUaCGsqBmZ0TnXk3ppFcp8/0AsqCmNJQYYqth4k17dbiH2ccxhDbgnQ32hgbJ8/xwUn/tMJ1SMmMFVvBEQXsjMIr/QA/ZSZuMTgAefpNuMY4ZKHObsEfYlY6tS9gEflqB641ma7SwmZZ2LjSUkI18zxEarJMaKDsy+GE2zDwQNr9E7EhqZLEutKYLzBGlp5/t4RkT2H2SDweFKrkPQ986oigI+eY0FUIlBIOzMNuEhRG945gVTeEWCXXA+6kkoHHCr0mlu5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0Z8/+KIaCJcOSkK2EaWMUssdoMeClfj3jhaSKh9Scs=;
 b=bUmJiBDmC8i0oDrxdXLuPCOCnxreCCLG9MY48aSonVyJbVi2g+zjv/4TE61uPv6u81aZXcwWAN4kq8lfLvVe+zr/M1U0QtUZjlxm1tz1TXuZcsn9AZAZPMCv3fScESJK0YQ+dRb/ebAfkvcdqLBzA4BsGz+PECchBoQy3+EYPX7ny/WG+/DCx1mOX82ph75/AO2aRXlvTrp7NGv+hy/ChDQjwo0hX5fJRwqyGBRsPPEKkOGzIF8OfV7s9IOU1wmWAlWCnkybXlgSWzsRfZc0Irdurohy+ugDFaZDAVp8pdBVO6rgFcY2E1mfo1Tq2+CxjAGE/MXboEaIxVUxOS99wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB8035.namprd11.prod.outlook.com (2603:10b6:510:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 23:59:49 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::b1d9:3282:7e31:3799%4]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 23:59:49 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Add power management
 for touch device
Thread-Topic: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Add power management
 for touch device
Thread-Index: AQHccuP5vuTo93yEHECxPQI/URHS/bVHTL0AgAAwx6A=
Date: Wed, 7 Jan 2026 23:59:48 +0000
Message-ID: <IA1PR11MB6098C429A84CB3DA480C6B7EF484A@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20251222014134.1810253-1-even.xu@intel.com>
 <o3q31414-28q1-2q70-41p0-or84391r0q54@xreary.bet>
In-Reply-To: <o3q31414-28q1-2q70-41p0-or84391r0q54@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB8035:EE_
x-ms-office365-filtering-correlation-id: f6bcf724-3c92-4220-0127-08de4e48d752
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?FK9Z4GgTV741SiW07Rq/4EfjP2eh942GcnUkL5KA2bHGMSCse2DKQU5Z+rnj?=
 =?us-ascii?Q?8K12+m62eNjpxSIwuJ2nsBN1qfc53Brk0ySpTL6FXk+Z6i2aegU3xHXX5H/E?=
 =?us-ascii?Q?VhsFbvJAkBZU1j4+ld0eNRokxQafdvGoOW3k9CGceM0STRDYWvWDC/ZIY8PP?=
 =?us-ascii?Q?YGVk76SWhg23kUsDztMssIJQzmucouM5XAoLyK6UZ0mB5asPeMg1jte9j35e?=
 =?us-ascii?Q?AISLUMr/BtGCJifvztmuhm9DaHmDKy0PrF+QJ3i+cGkQ1fgX4piPi0v4y/4I?=
 =?us-ascii?Q?+7NcME3oTSY5kSEUVB8q2JkUtTn/PYdi6m8JXEiuKKIgXnOJwynuLsJpJfiy?=
 =?us-ascii?Q?MZa0d8WGoAowdE0juPQHzrDEtoCVGbEIe+fRaRCaiD1ZG8TQ1Ox3KuWwWivs?=
 =?us-ascii?Q?rGLG2mfK/fc4vt+MQgW4zbkhngvF2uBWywho0LkmMVI7yiCzasuJYnyZQrBr?=
 =?us-ascii?Q?F7vZflw42alENdtjd5rU5vGVTFF/hJiNmAQtUzL8XqiOb2S95/6vIPg8+DMX?=
 =?us-ascii?Q?+++XA9yoGFVXDLTbMi+U0p9Ht42wmLi1yjMrgrwPGz7BW0zah8n8h1bc11F8?=
 =?us-ascii?Q?5QurzYnqHUonPdCZxEysExbrozJ1hHiSc9gh7fXuFOne0YVPed6oMRH7WfMe?=
 =?us-ascii?Q?J6DXqFvm3RJHALowuQahPrlRcUVlhB1JbsRXY8EqJmMxJJYjJlF4BayKf9qU?=
 =?us-ascii?Q?6Gv2v0wYZRd6qkV37i4fpSepb9TqlAYBqBkj+FBuS25fiLqZo4MGiFINPgFq?=
 =?us-ascii?Q?wh0myQOn8QTPQ1UaP6Cu5MPOOj32u/MgFTGOKV6ojRblyYZ1REiKXTnqgT84?=
 =?us-ascii?Q?Vhu9S4aAFWX6K165k0iwabpLAkAb//D7CXQeKVayB5mMzeQ/sfU95+u5v0Fn?=
 =?us-ascii?Q?Jqs+IM5KMX+VD2PKcBPxAvH4yTvN+yKRR9eG0qlFmb/YwI0RZ8ymIKsgS/xG?=
 =?us-ascii?Q?M+9Z/HWxpLAWs3m8bPgFjfYAXEEfGINrYXkTlUx3hmVCLTCSM1zGokHdzYPP?=
 =?us-ascii?Q?QVE+aWTdMZ89e9zi2vBQL982tjwCXYup65FkkcYc36clWsoR4mrr25uVeFIu?=
 =?us-ascii?Q?kTWSKS/0e98rapFJye9Vit8JAivZxyX1lblgg+7wsyoXH8EvCZBhJlwqOU5O?=
 =?us-ascii?Q?vPGQZYo8fsiFuL9dT13osHYORBpLkmwJmFKVLDLstSqQ4C0SxJxaL83vZ0Jg?=
 =?us-ascii?Q?Ijl86sirY2BJaA0G0Fsg5y3iO7qnVFpqsLXm01Ls57701QgrSpGVbcjP/2/w?=
 =?us-ascii?Q?hNJLCjzKmBK3ZCCXK9ZGo/U0xs91sgQwlRQ3li7a7bobFnpIMouLUDNJY23W?=
 =?us-ascii?Q?51nb+Iz2STYVp9IDa1amztsZHy0Mm2uMwAvQcRXPS/m1YCoEAOiXnKbbUZIW?=
 =?us-ascii?Q?vzShzFsDkFXShF/Jmp3nyfpFd0OxqLbJWQi0+vEnZmM1J9YZldLRejE4yGIr?=
 =?us-ascii?Q?jEETlkOH8r4G/QNqxT7qeAGL7sJGTkSL4CFUJqbTqtwdcVzItF2Rq6tgRrA9?=
 =?us-ascii?Q?TKRBk1wRfFnk6aytaYWvTBY5dkyrAAD43Udf?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hXHseFVZaayeiKj4LnCPBLsRXeU78QIfJklK/gHxtzEPs3KfrkGYy1zP2fhz?=
 =?us-ascii?Q?il4IviCzUVvhXZ0b/Ifsc0+t5nsDalnXClGHhccQklr1MP5FyAIgDd0KjbMD?=
 =?us-ascii?Q?e108VcYSw+2VSZRZZI4S9lUMc6zVYxGSIxXfLHY7b2plClbTXZbTDdg4JxR7?=
 =?us-ascii?Q?fZ0j/xMmX59idIz2J4ZljhimfqKgZvF5OPDBl2TOllNARHcPOpdLSQm4oEWT?=
 =?us-ascii?Q?iwK6W82x9YxhlGILF0HhLrC6dElypJla82xaXKsWJwuJtN4HYNYLCe7DIFCR?=
 =?us-ascii?Q?fkJYzt8iH/1heOUmNlwYwRL3hxV5UHZ7sBizowqRDAXY88vmUSfrYrR8TS1i?=
 =?us-ascii?Q?FtLVWxsjHZ0zEM96Bvo2UozBCrNwNCPY0BnKhrXdIHp0wAeu3SSpu6L69g7w?=
 =?us-ascii?Q?Bp8oRUEQEvJuNWTtdzQlQRO3mDQOHvEi9Co1/qXoqr2emg+z1DiarCJdwr90?=
 =?us-ascii?Q?2Gx1dauWkK7/f/cly0zlzWC9R7+WC1phVOA8140V7EikDJihlEQHR8gLWJmW?=
 =?us-ascii?Q?LhZVakQjOCgUF1aEaBBF86dgft3zgj8W2PRAoM2VBdOBjZ2u/e51Rr0lhIME?=
 =?us-ascii?Q?EUlFTBEp4kEeKlSiyH3nkQCW2h4ft3LrQdamK3rBcfPRoLDF7PHZxIGe6mN6?=
 =?us-ascii?Q?PNowZmPgniq8linU3b0CmUQwMYPvDupMhfSD49b9cvXfaZStQdWa7iaYLPXW?=
 =?us-ascii?Q?A5CzaPajEWHkO2pgS+27zLOPsMPh78SjjAG9AfLesijApDsVgKst5HjKdqaQ?=
 =?us-ascii?Q?sdhMunYw0hjKWVJML5CgS1T6fEeHqjuOu8qUTRIswHR95BtRptGfFZt7k7aA?=
 =?us-ascii?Q?QUSWcFjz3d1x6y8qmMDqQuomPlvXVt1k3eof9JuC9q9lsUXLx29b3MjqN2xw?=
 =?us-ascii?Q?5WIOjgn2DsL5Ctn9qw1hw6nKRBqtGw1eRRc0+gDuCHlcrpFFLeFVdpUU78dL?=
 =?us-ascii?Q?Z7/eFGLH4XNB28Sy9PZ7BeBG+EGOp79kkmJpHAxyJqcxp+Uo3EuhZtPcNAzA?=
 =?us-ascii?Q?u0a1qyrN76couxV7HnP29mjxc7EkdT2DeaTPaFhXU47YgbyqRlpj5IauRtns?=
 =?us-ascii?Q?80aXUdj7A5c/t0MLLZCCAHL00aNbFne9fyn4ZrRvQ189YcWAmoqay6H3Jqlx?=
 =?us-ascii?Q?1jpwQlOqEHOzKKCOUj0vAhZG/wanaHE5P5W2YcDwPxWR+P93BDaXcav4HKPI?=
 =?us-ascii?Q?qgDyj/3u+0Q9m4z/KDABUeJZ7DBfiX+YcYzP13k+nSf5eCTmMtt6gafe4a7D?=
 =?us-ascii?Q?0lutcSk13Qb2SQyXC2lJ3euq0WE6bbJg0IWB+yg9LKkBRvaGL4IISL9PH+Yu?=
 =?us-ascii?Q?aC4jB06j0wED/gNkbKS2+5g/CrIqPZqCft3KJLFl2P5l8DRoNtl0aWhv9OsU?=
 =?us-ascii?Q?Rd5JNxVXEeolMFWbWdpgqLBuMTmOc3BljDE1RcYTJibtC0peYiLWsJwX7jvO?=
 =?us-ascii?Q?xQ+7iS3AUZT7as+d8biaOHtPEgyY7s4tB35YY3utboCkq923SEkzwActl4vC?=
 =?us-ascii?Q?wTeF4CPJqwqO9em9NOI6k0civrBXyug3b9CCp45BdMc2QTu2jlAVuPA5weJM?=
 =?us-ascii?Q?vh+uCOyqx13lWJ22FkRSUaYdACHSUvu3xwb0aAbtEX6iPqEODrQ5kSmGzPUW?=
 =?us-ascii?Q?XVXvE4MOjb6y1PpG7KHbZ+x7RTaFIs7POcVpUasJ0kg2HHNzs/M4GD8QV0K2?=
 =?us-ascii?Q?bEDpr6CZ/KXmYNDimk5/RIc5ojoRhKsalki1QIRWePMm8Yyv?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bcf724-3c92-4220-0127-08de4e48d752
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2026 23:59:48.9411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nvcgn0fKl3s8VHTcpLRQajkFWYAAwOxjIpBiGlxhLFS6S+W8VaMJG/uO0KeVm9HPrRXMDpWk00r2VevEDP/BFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8035
X-OriginatorOrg: intel.com

Thanks Jiri and Happy New Year!!!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Thursday, January 8, 2026 5:05 AM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; linux-
> input@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-quicki2c: Add power manage=
ment
> for touch device
>=20
> On Mon, 22 Dec 2025, Even Xu wrote:
>=20
> > Send POWER_SLEEP command to touch device when system enters into sleep
> > mode or hibernate mode to save more power; and send POWER_ON command
> > to take device back when system exits sleep mode.
> >
> > Signed-off-by: Even Xu <even.xu@intel.com>
>=20
> Applied on top of hid.git#for-6.20/intel-thc, thank you.
>=20
> --
> Jiri Kosina
> SUSE Labs


