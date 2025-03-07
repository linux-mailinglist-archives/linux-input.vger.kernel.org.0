Return-Path: <linux-input+bounces-10605-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CD7A56275
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 09:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A62318976A8
	for <lists+linux-input@lfdr.de>; Fri,  7 Mar 2025 08:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C649318DB1C;
	Fri,  7 Mar 2025 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIVlQ7xg"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD504186607;
	Fri,  7 Mar 2025 08:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335456; cv=fail; b=L8FNBi7LoMBpHdvoGmGX6bJRWHCl4vlsy3SONy37Nrwr0xf3b9QihGc/VQU6E+105rPNjgcXj5pr3ApeiT+Bbvs7zSksmor403VJC3cEb8XxhaSd96PrGSO6ZtCpDu6DvQb9sQC0kriRSiycVXUXKeoeo6hem1B2XMj7dzp81d8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335456; c=relaxed/simple;
	bh=KPb9M9qkO0ZfxLS/gZLKc0f/5DItAVjbbnxZWf8zDQY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gNR2x5omSAkmHgJbtavXGl1iIyQcX8/STI0nkLM3QQNXU8mKTR4FZKEQ5yqpDCxszOWJ7Y8STFPXHO63AEmwjYwltJlhB9fcjsLpoIgXIFqGrPHt1DyKOpmUhbJ8ASPvcTtVNFtF5lGT2AumTfAvMB+lnNtrkpvVkLvFG15if2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIVlQ7xg; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741335455; x=1772871455;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KPb9M9qkO0ZfxLS/gZLKc0f/5DItAVjbbnxZWf8zDQY=;
  b=ZIVlQ7xgO0mFnhNROPDCZH9QJxG+X+dBZGEU3bwODGFxuYHJVhmw1p0/
   znGepB7t5jun7KJrdCNhnvwGJTyoFcJiS5Wg3NcSmJaF4d4ObS0RDIla0
   UCwRidaypsc2vCYLgOG1GejnXbdngvvgsJ2BMyWgG4AWxFtpDKPt2fmhL
   h5ToGS1lZOFEZyrsoyprfx+Ygu0fvdjf5lkV4WR8Yt4FVYEbSGR8opO0b
   fy8TCOOYhChzEZRn6M3ZUvJAS3gumOid141p0t4swGnX4tLU4aL3GDqK7
   jY0bzcnrdtgVNi0BRR+IAk0V8gnBHD0pyxdsEzG5F3vEPvTnD+3fsb8OT
   g==;
X-CSE-ConnectionGUID: oYtYc09nTW2XMaERrySI/g==
X-CSE-MsgGUID: kb6RJqD1SYugBbcOxA+CeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="41544194"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="41544194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 00:17:34 -0800
X-CSE-ConnectionGUID: wCkm2++iSCCwcouHf3Qv2w==
X-CSE-MsgGUID: 8uIDFecKRim1COZtwyGuTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="150057715"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 00:17:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 00:17:33 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 00:17:33 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 00:17:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWkPfLTOOwepVaAGarv5q790slOJXBJ5X/U70jYFmLq5Va/YcI37x9zIBSHIo+bo4tWTbCE+dP0rpaRZmJAWz7HQqsyakX7sr+JOVMKkRCvTTLhOgYsWTNy1sFqPAOBbXO/x+KSOXotWQoT6sUzCm/YMo88I+cToXLFec5PAjBNMhdp6d7pNyX4fcPf1MWh/DNJExR1FkjUJ8CylVFVKQs4GX726IEWRlUW0HcmqfYp9Zj4Mnoxph/z70TDPsrDxNRhGyuiHG58u5kMes9Rg9IDr/mqz6cNTYHYso/sl6eFxXKBCbbwJtZcQR+7HiCgS+WdUYzQ00GFaCqRWyA978g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPb9M9qkO0ZfxLS/gZLKc0f/5DItAVjbbnxZWf8zDQY=;
 b=K/LOl6becPeBbyX0i0k0YFmdE4STvjt/YwUAVtzPxZceTXK9SLzov7BR4spRBzUZLBzFmjWMwbchMJTezDg+7RFk0PS8WbGe0N0zFNcECwsSOZ5OAy6EdKr+O06NANpcqfvhXsFpu2LQFDBJXleavZETkTRhlWQxz3Pp+wyRnT7WdXTAsoX94M+YYJJDuox9u1A4IAVt032Vtee9bm+SiwUte1c9g+u/NhuRA3FaQ/SxSsVowjDbC2/fJTjFfg7se4wnxgL6uhCgwH7td74n/1pGBpxjfBOCNx9F12EzlRkH/Umc9lt8V5YHafCBPjn1azbQt4vHgqySfBP9WBiIXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB6377.namprd11.prod.outlook.com (2603:10b6:510:1fb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Fri, 7 Mar
 2025 08:17:31 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8511.020; Fri, 7 Mar 2025
 08:17:30 +0000
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
Thread-Index: AQHbjLTcANInlVCQx0+6PVpmKEX957NjdcAAgABCBRCAAE/SgIAAAGLwgAA0LoCAAboagIABYSAAgAABwmA=
Date: Fri, 7 Mar 2025 08:17:30 +0000
Message-ID: <IA1PR11MB6098165BFC1F90C529C009B5F4D52@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250304032255.1131067-1-even.xu@intel.com>
 <96qpo784-8r1o-sor7-p42q-q06n1p389913@xreary.bet>
 <IA1PR11MB6098ECF413F5F4E8FD120B4EF4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
 <68roqo71-3887-ro16-0qss-52q455sqoo1s@xreary.bet>
 <IA1PR11MB6098DDEBDF3B7A0160CEBBC2F4CB2@IA1PR11MB6098.namprd11.prod.outlook.com>
 <q70795qp-nq3p-r181-15qn-on41n588s770@xreary.bet>
 <IA1PR11MB6098AD3A90B92EBAC95D2818F4CA2@IA1PR11MB6098.namprd11.prod.outlook.com>
 <4or3qpn8-rqon-7qpp-s98s-o141n0n577p7@xreary.bet>
In-Reply-To: <4or3qpn8-rqon-7qpp-s98s-o141n0n577p7@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB6377:EE_
x-ms-office365-filtering-correlation-id: 1835da3b-5e16-4151-52bc-08dd5d508161
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?LSNX7XgnYSBILyBUFSEyj/lKytyhZeC/y+p0Sg8zv6b6Cz2RBdLcqMU/HVHc?=
 =?us-ascii?Q?7RMvBujy3UtOtn4+/zxMmaCSsN8t/ZpevetMqgntO6JfdBc16l9rOPBGGZ8L?=
 =?us-ascii?Q?Eoltd95LDnQ1ZhOR7vSDuy2QuAD3RfJw9TfMxVJVEeME3M5mrb1xWHXxm3Ow?=
 =?us-ascii?Q?WGDrhUgO9JP/lGYiBhZCXd3k8eO93R6Y98yeK0wsV5sENaJIjwjOZ6mIyfGE?=
 =?us-ascii?Q?J4RAFJ2OqMhm67y8w0vWr6HT29rIaY31NElrgparyTYG9VmQhNk7sO1bl9Sc?=
 =?us-ascii?Q?VJSw7YtOz0QCvdzcXcMjj+Z3aJrotra6RD3NF03kUXBR/0EPqpAgZg7/U/bL?=
 =?us-ascii?Q?vvbu5FxkExmvi+EATba7dmoPRRCRYGtetxDDvh9PSbwlYp0/h/Uy51wP5mfo?=
 =?us-ascii?Q?STTwTsiaawkggCHl/lYHLbb6htx/I2mGzttA25KeTuUJ7ab4nzulpj20xu3G?=
 =?us-ascii?Q?/NSDa9VFGv//mzYpu2/C8UTIvZtqfD2CjwIh6mn4357TVwhHKVb5LvEoeKsN?=
 =?us-ascii?Q?lmDznl2CCo89kmU+QCLCKjq/oka0cBa3VyH19j7AUvT5DnwbMs1tTXexbyGu?=
 =?us-ascii?Q?xVIYPaK5KYfEKzWWcdzQXl8FTA2FnezztA3YbMj25VjWaQFr6XLNmfOZbxo/?=
 =?us-ascii?Q?9MYU4vk1nGmjqI7Fn+NE5KaYU9P1G+L7LvuJ7gob3LKEbiQ7rw8ef7fpYulN?=
 =?us-ascii?Q?+kuwCOFFdRbTCmfpW2lWoBjSvQaqkrFjL/9m0EeQp/gOvQfdnlcy+CPcZodm?=
 =?us-ascii?Q?EWxe9K4RYvHDts14bm8JI7B41f0ixXAiK1tpsAYmEUYrdL8aNBug+96MFTrh?=
 =?us-ascii?Q?lac7ID/ffvWMzXGoyDZlBI6CL61xGZpRNDH7Za9MP9gIC/60y3OlHIwXRHcE?=
 =?us-ascii?Q?V91r9kul4QzYwi6W9ZKta3itI9RTExLgUd3DFPl9Z+3LYoiTgG9eFD7Wf40r?=
 =?us-ascii?Q?g0ZG8Os0g1bMDK4ybp3UhQtHZiyfDkilAo8RSVdZ3/DxZ2NKJqI+SfvhgAaI?=
 =?us-ascii?Q?YrAzzeZ/N8KJOoRjK2N2gW6WfnZyJvEhxcLcs5quC1kfqyRHqKx1cmPSX/3O?=
 =?us-ascii?Q?yhb1fOp6ModbnO+hOOynRSGmee2IPhCVbPe4Qzwe76mOZ0gS5tylHoaFEjTz?=
 =?us-ascii?Q?K0BBoGl79hLYWyeEdidNzNJa5anW7Si4KBuPNvk3EM04ROs1OBAwdhGewto2?=
 =?us-ascii?Q?RkrDdlKOulJRDj5c8HqQUe/p4fKPSHxT1ZNOi393F/il1Sl4klvtIWnO3ZME?=
 =?us-ascii?Q?/7F0a9MkLraCnVF3LpSVvPZZmsLe1HI8c5erWn4Ouk09GJv2UZY1+OuPe5Ly?=
 =?us-ascii?Q?vR1R8+JE6fSFgHB78uTGpeGqcdl8seKovTE01ybwk4NXYTF8KzG6A4n2gAO/?=
 =?us-ascii?Q?JjQnYff8rCJLoiraN9YjacIdXiWWD6imwxbZ45lL3VXNtXjusA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eMyUFf+/8O1pkdAF1eJSQBmzhR9/lR7g/vYTEK8iuQ6254wxbx7zp2Fp/n8+?=
 =?us-ascii?Q?drtqWlI6Kw/zXJZbtdzVbLV1+5/2JmfraR6NfSViOP79l/S5AtzfqZBqLlgp?=
 =?us-ascii?Q?8wggS+3eJ7hGlHCYXFSsgJwxYTJSxikJDqtOUh/BSi56ITkVchTQ2TWiYvRx?=
 =?us-ascii?Q?Z0t46yIjNrOZIE4hMTiZtmysNhlf3Y//Ox6etjTejfqc0aZSo3xzaYdZkmFE?=
 =?us-ascii?Q?ZDZw/qs8gz180BkCH/JCTEE9EV8unJ2llF8Q6K3XO5mqgyJ1Xf3d+sXwDTOZ?=
 =?us-ascii?Q?lRWdUBQX2+Gnpe8gcLEqAt/wJJIt9/d9d3eJEkKJubKRDX/7QXb0AOtfweIv?=
 =?us-ascii?Q?aRqT4jd3WEzVnfAPg0q2t/OCdq6Q+Ss5SAzr6ac7dMqq1ADott9ZWc/vAkw/?=
 =?us-ascii?Q?ISdeqJxDPvV5RcsazY7cEnMmdmGlko0zPH9SIDK+DAx+MUWicKREi/5HhYx6?=
 =?us-ascii?Q?t9r4GQo7r7Il7o8rFDzxNy6lejAKCWi2VW11H2ksnG8AUiBN03N8cpFaf3/2?=
 =?us-ascii?Q?iMxJovDSAbHaxsQZYv2S/lx0ktWZ+TdwPgnL3mCwTeER0usdI2G/v0ji3IKr?=
 =?us-ascii?Q?I8Rm32ftJAWCb6SzL5rpGycdkKxm8AjGgXoLqZHUFQExceD8KgWtLCL6Z1uL?=
 =?us-ascii?Q?4FQQZ3CVleUx2lV9E0ttfImM8oYfCE0gMOeQSWErUPlHa5fYRbBWBqnBCDxL?=
 =?us-ascii?Q?UUdMh9LYl1hhzJFNufCQkm5SlHksfBvl8RyLhEaSj9zgU/HVaKObaXXVrhsx?=
 =?us-ascii?Q?3GYrtujdi+jh8zWIIhbRFEXjfBVlOE2pWPK3lyDcPuiU4yOy3xSGa+F2d71E?=
 =?us-ascii?Q?pcbpJIdz/LSSGcqxbpKRDlM9N9gLvtxCtSVXlwxBDMSts9UObsFYxSZrUrDM?=
 =?us-ascii?Q?k9X5Js9EMR4lygBGtTDxduPIArSmQns/E3dd3uWgL2nZtUlfeNckAnAPu00U?=
 =?us-ascii?Q?SgmJTAQy2vpbHsuS26ywH7G2qMHYHD2Q/WXwZi3yMQ716vGX2uK8pfAu0RCw?=
 =?us-ascii?Q?UIP8TH/N7s3LgfrsmYMQEgGchMYAREc1gUWQA/0AoEy5S6dxl/xYhh1pMqvg?=
 =?us-ascii?Q?6Pi4azVN+Kxp/GzPuPNo9ijqT+6E/2lvoJc5HrHu+UW9IpLx8a/ZuUMehryF?=
 =?us-ascii?Q?4+1Cao6pm0Yidr1EfdeXNtH6OePJNIFDQVv+bSBHdDukh6slKl3t7oQAWhYt?=
 =?us-ascii?Q?+Sti+1qm4pb1405SVvWdj6h36DVGZQKJQ80MoVtcpJrHtYFChPIV1ZlnwOxX?=
 =?us-ascii?Q?B62V64ulYNGmSg1brCLtUlOAN/d3JYTDSw0qj0I8fYXf22yYP3Qo7MMZNuk8?=
 =?us-ascii?Q?Wx3Buxx5G/+7RGe3xra0zgIsD58781+V6M/bdRxNHsRLJELsaN/v6nLqiQ8W?=
 =?us-ascii?Q?t4g60yEzZjtmTp8+VKr24Dh4kIgwTVR6FVmytgSZNA6auOU/NQbc8CFhtTU1?=
 =?us-ascii?Q?1cuIhQ1NCXB9zJB+f3fygqQ4vj3Yi/BlWj/QiivqNAf7MIU2MWBQhVUJLIIu?=
 =?us-ascii?Q?h8VYtEHGCXuTYOxzfiVLE+Q+X1+kgZkNtnvbI9ynJQ4xIwXy7f/NWbe54Mkk?=
 =?us-ascii?Q?zD7MjI8ny9xI6l7nCCg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1835da3b-5e16-4151-52bc-08dd5d508161
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2025 08:17:30.5280
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YuQ4aDCJRDazPyRpiUFrNRjcoaJGJkmTSrMXXwpuG7wAXXcBVnmS30790KchDw8rab5ovMEOSrr36TGLgCLIGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6377
X-OriginatorOrg: intel.com

Got it, Thank you very much, Jiri!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Friday, March 7, 2025 4:11 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; mpearson-
> lenovo@squebb.ca; linux-input@vger.kernel.org; linux-kernel@vger.kernel.o=
rg
> Subject: RE: [PATCH RESEND v1] HID: Intel-thc-hid: Intel-quickspi: Correc=
t device
> state after S4
>=20
> On Thu, 6 Mar 2025, Xu, Even wrote:
>=20
> > Just recognized you applied [2/2], could you also pick [1/2] for name f=
ixing?
>=20
> The functional one is in Linus' tree already [1], the one fixing grammar =
of the
> enum naming is queued for 6.15 [2].
>=20
> [1] https://git.kernel.org/linus/db52926fb0be40e1d588a346df73f5ea3a34a4c6
> [2]
> https://web.git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git/commit/?h=
=3Dfor-
> 6.15/intel-thc
>=20
> --
> Jiri Kosina
> SUSE Labs


