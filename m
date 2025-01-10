Return-Path: <linux-input+bounces-9124-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FDAFA083FC
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 01:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D44169944
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 00:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D244C16419;
	Fri, 10 Jan 2025 00:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGrD6u97"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1832746A;
	Fri, 10 Jan 2025 00:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736468810; cv=fail; b=fpOk5fypeJ4TKi955GfZUZA7As2jsZBGaAzt95YpONCIQNPBky6W95/2lW1Fy3H4Z3e7WnwTOIn7NBe7bBdWNQC1hoDDQgboYUlHI7jClDNfG/LlgdPE9iHeqHLvqMsftv6F39kdKt6zCPklETAj2mgOUJ1HhLdsGGb8M5WkoyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736468810; c=relaxed/simple;
	bh=OwAd+EM0f4y/uLSPEIpqtKTQJ7jj3M8vmGImonQb/rQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MPJ9x8ZID6btctybvvpOj6HrRmbH7p4h6aj8xpl2Qgte4k101Qk4c33qY1CmgJcBJ+Qp5mDkBEOSXXSCjfMYgVB3IM4kvteZwObzo2cMxKHazuuJOPBc0+pB6zEgW5sIRP2/YqFy3naPPn/aTgzcnMxiNflEQKw0lTImzMaaZ3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGrD6u97; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736468808; x=1768004808;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OwAd+EM0f4y/uLSPEIpqtKTQJ7jj3M8vmGImonQb/rQ=;
  b=eGrD6u97CXH+zH18LFv/YCI4QLxI7AqBFpM6N+lv/Pp6AR7j2nvjtExU
   touKPfb/qVIeo8c9d9UzV0JUr/umSkSIMNwMYPpGgZoJqWSZJBq2C7GBQ
   O1Jc7XDHuZGUijjM4XPRO1yylHtybIOHt6F0jCF8ufEKhs2wNM+0mtYPc
   xAjNlQGP3di7y3w2vwRP9Q86gpJPz1XQZoyU3tJ/ZrrAsCifl8fuAEp3e
   m8mPsbkjxdFXbiUV5K/E4iWRbRuQcdnMDigyhRUnip3KTkaIOpG2QA1JG
   pCU4DMR9/XEUJ3BUu2J3ho170hx20WVYobvZOfYw/UIlFxJs/ckhB7viR
   A==;
X-CSE-ConnectionGUID: 1JY0ZwvaS0CowcCCjBv8hQ==
X-CSE-MsgGUID: vKePlCeRQvKKf4Il4MT7DA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="59228445"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="59228445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 16:26:47 -0800
X-CSE-ConnectionGUID: z5948yUxSzeSpDCOtcvsgA==
X-CSE-MsgGUID: qsSEekWETPGPMJe7QRT28A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108616502"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 09 Jan 2025 16:26:47 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 16:26:46 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 16:26:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 16:26:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeCaSAw9i2Vp8iw0XQJRPZEbRHfYakbKnK3TaNvJDDZ+D86rweQXQYfPlUpjX7RrGBBaarTPw/XFYQTgpqj18LQfq//u/I7PY1waf2JcAdo5gRtuwP+jgGvM8R9Lv+3nltysiCNTHY2C9B+RkiQ35LQtRklKQwsPrjN8pRfDfjWg8Q1vTs27cLUsk/JDklhE4oRt3ONU7RUpJ5LxZn8InsFkz4zdq1qD3l7tWjX+iCIiDsj4SRN5V06A54IHClvm/qi80vbgbNx8djOOdlpt5gWUbC1CZSFY6mZxzXOLmxnatnP4HzgF/ahXFmvOkf5CY7QA5Z9ib4WhG+cmVz6c7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1/oqeVLhkBK/GwOOYCSANvW0bDRNyFhDo8kqjNbVqs=;
 b=ehnPlRqoYatFVYsOnghO2Nkz2tama7VSgeuYf00+vy9ILFiNJe92osPsor1I+7/RzbFI2hsbTr/1SqqYnhlwy7ozn+OGw9ZwRgDEE9l4KJjieYbxMYYmsTRxerTgbpSil5TLYWjm4letHBrLSgqiYCXAElY6yKdLkTR6AONdEW7On9e7wWxvbQOv8AGG3o+3ml+E2zA6Y0A+W1BLwxk2Ba9lQNWYZ51VHjLJBvIFvsB+dDMMKJ0tjehDBblfQM8BW8UlNp8qwZLPeTOqtKvOv+PrZJjWkzzMvBh/1bvb/Ys1cR8HhAPl7ndBsRZ6aQ0oH2Vni1kRcRLIRmNc9Qbi5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Fri, 10 Jan
 2025 00:26:25 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 00:26:24 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>, "corbet@lwn.net"
	<corbet@lwn.net>, "bagasdotme@gmail.com" <bagasdotme@gmail.com>, "Aaron, Ma"
	<aaron.ma@canonical.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
Thread-Topic: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
Thread-Index: AQHbX+Mv8McLFtrq8UOfwwq5qyE1ubMOLgaAgAD+oZA=
Date: Fri, 10 Jan 2025 00:26:24 +0000
Message-ID: <IA1PR11MB6098EE04A6B2210D90770C15F41C2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250106023151.3011329-1-even.xu@intel.com>
 <830920o1-p118-5oq5-po4o-905n04949ro7@xreary.bet>
In-Reply-To: <830920o1-p118-5oq5-po4o-905n04949ro7@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|PH7PR11MB6932:EE_
x-ms-office365-filtering-correlation-id: 2ee816cc-65a1-44ba-5805-08dd310d6a93
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?fVgVXjUNfoFyGIqSGgA+nMiN4DQ4qK+e5AjVS+YtMhsJgkOD+PRTee/3ZHTv?=
 =?us-ascii?Q?tLu01qb5Rt1fme5gr4V4BuYWI0dbSk30nmL68BThEeEnlevx2Fuzh4D6ECjU?=
 =?us-ascii?Q?noH89mmL8K7QMlRNAlkOE9dYdlzOGkEHzimTEtshhy+G/4pUPBINQPAuYQLP?=
 =?us-ascii?Q?95HgcHPt0v8h5fPOUleQVdkQUJLZPSFCuH9FIgPoBQWCLPNkpYM5Jd9ri30J?=
 =?us-ascii?Q?/OM6badU7XRu+6eVpLOa1gt7flqqv67BnObxr4/p8KJ9FhsZ0y7qxiyXbequ?=
 =?us-ascii?Q?jfnmcrnL5eWHjupVOqoxj0w9yzC/wcMznksOIkqjn6Q5P6oMzYYgoUAWhzhs?=
 =?us-ascii?Q?VlrxzhqStEEU02Lfm9LphSzGbX1KTgnOCWb+EgpRddTCoi6bnDM2P0kmzGow?=
 =?us-ascii?Q?jI2TJ1WYB+banHN0UHO3cNoERvhXH5xGGyE2gvZWP29Ii8jtryqRzfRQ7XXC?=
 =?us-ascii?Q?RbMoS3mLDFjWjQMTAiPQ7SAZJvLI/RfkMqAdkzwqOrzDtwTGbA7MuVtXwyey?=
 =?us-ascii?Q?Gdb8wqj/cnoiyYYpfpNQtX9eZkTnuZ8GuObcmElNkAqHCamwiK1r5YZHVcJ7?=
 =?us-ascii?Q?16z3DMu7bgW+J75I4xF6b4pw1Tka0JpzeaGOwIG0eCh6syYyAbhh7ak7lEWi?=
 =?us-ascii?Q?iZqPZ7xHoIyI63mZSzivPqITNKMDHM0WBVi+1YTWTQploUtNmBbeBSY+fw9C?=
 =?us-ascii?Q?8OwVeBsXVqLVeE2BzC309Mc8t6Tx2PACvd0HslovdHgpc45rS20VdUwyA9h2?=
 =?us-ascii?Q?XOsTq2vZUW6K5Yij424oYueaW33a+ox9eWy/t58IxWrRwkmWmdnjXKq4LHwC?=
 =?us-ascii?Q?modP5drsGFS0uctrjvKgh5XnZBozOAExAfbVg0EOp7JjxutB91OFAfqKvt0N?=
 =?us-ascii?Q?E7YRQGGxwJy14jqoNZGynLPN15GCleAT+R2qp1M4pEb/paNXgSaNOx41Fzfv?=
 =?us-ascii?Q?GTknYqbYgxx7aclx7Yz9l90UQSAQtTo/xUrYrjr0MlUxZ3GA6H0dwsPgbvWO?=
 =?us-ascii?Q?cctg9MZG5X1P+tUd0HdVHc5IuFt4PXv8TkrdyAjwx1agdRAZ9G8p+tKMsxOh?=
 =?us-ascii?Q?3mXahMA5lp4KVBYlUkRSmKk3VPWXyLys6/NNHThmOp6XNVRLswtcqjarA8Hj?=
 =?us-ascii?Q?H62l6de5o0NfeodMO137uwMSY8yckNR2zMy0mWkqkrSgjQEZcvpN2KPGRFp8?=
 =?us-ascii?Q?2VQRod1DWnvWFjxH21+JPxfzDNldQnAmPtnI7qazntsETg8MZGcu3EN4ewnb?=
 =?us-ascii?Q?PjAHrlInm2IexZ8kGkc4xOYd22u+zUUP3NT2BRDgeXpoXBdIrETeMYT67j1w?=
 =?us-ascii?Q?cYjM94Y2vQLXeB/ccHl/yFZgEShDvum6LWxxgWcsGbCMDxcdMOXHDDReJWx0?=
 =?us-ascii?Q?M9eQFBF6dW15qJbXITB88Qh5teJ1IUY029WfjhEmG0gBx2ZFiA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VMilvbP6iifCu8hr0ehcnlE/V6w4EodBuhqvPiaizRFbM21anWCUwX/W3ax8?=
 =?us-ascii?Q?WEQy6gSvLH+zeK2FY1a83Nw8uTNlPGxjtIqS3X5V/xweMX0rltqd4Xjm/wsn?=
 =?us-ascii?Q?UAo66XmUdehILIuYFY58OQ66Rac5w8wVxYWSzjxwU4dJtL0sIwgnqD1ccVUy?=
 =?us-ascii?Q?Vc/4SGLDLsZIpGgK6oX93DPxlyV9ouYQj4eYMIuLJX5FVeQ/mgCFicsYlTWD?=
 =?us-ascii?Q?kc7Y9KNyF3OpHs6HkT8Qc7tk9ef1bTYKJ5V2xfGiXhZnwpHXoZXCfA8LfQ10?=
 =?us-ascii?Q?pmoV1gc28VOwsZr/gMpZe/HHmL1ghTJM5qkwJ4WF61mbEW0GmxXpaySU0EAS?=
 =?us-ascii?Q?jUznx3h696RLattJDqfpa2wCyNOI867tpAWewc7iCFR8X84gREWFp4LzWhzw?=
 =?us-ascii?Q?2b3ShdHCf89tkbf3/N6A839xLNE9l8rcnlWhH4sL5sdTD6mGetoVRw0JwF+X?=
 =?us-ascii?Q?kBGO1RLM1fkKcwP4ZZMJcJ5SeUoxz4tbFdbSAGsP1rZPA2wlykAYmH4t8u5t?=
 =?us-ascii?Q?N0HehEB3pynsL5ZdhTHbUo4BQ6gzB0KpiAlOKSLZhkV5ImQO3yKe28mFutdC?=
 =?us-ascii?Q?/pGh8wiAbcSJAITbnvT3GR+P+CBaOM917DGO/4rigf8IW2wSswEhoQUB4h2t?=
 =?us-ascii?Q?LWNjin5vSIB2TxY3bu1fAMkNxACRLiwPWS1bO1N3niAm327eLOTv3W9jtm0c?=
 =?us-ascii?Q?HFtUb2r0+eYMGcLhzX+Agg3YKxeU7/yJ6E1qQZxWwtNQ1RIOSfpJN8J8aOwA?=
 =?us-ascii?Q?8wpv4xXRXgLoKWW4eZJCMsZBpqMhCCOR3NLg3ymJXwTqaS8DEWqM5H7QwqeY?=
 =?us-ascii?Q?uVGQ+UG3O8aYzJn4KdsQrjYWJKnd0X003hDGl8Lq+t3XePjseFAFx0Vzt2mf?=
 =?us-ascii?Q?pBK9sopJ0s2uP8WVV9HJBgkYKz2TGBaD82PbWWHtYw94jfFF3c3R2QGMQ2DC?=
 =?us-ascii?Q?gJ6A5iCImpgII0WxsI1aQsiwcZ6CbGsOfB6XrH/HOeDwCacZCSngyq2/6gQR?=
 =?us-ascii?Q?HXTiQYsAs/Q308VyfSAi20+Or6BiyzOMcMXZxwZpXnrZ0JyvdDefKZ+llgT6?=
 =?us-ascii?Q?5bGPwW4DBNsxBe9fbkSYsHBsP7fK/2ZFHItxvIGwtyp7JMlJ1TBwbjnKh367?=
 =?us-ascii?Q?5UDPPqmC2x8p4RWu3Wz3SXYMr5qBw1ohsIDhLtJWGraBfadkhVPZj1DL6lDI?=
 =?us-ascii?Q?n46MowHyw4K+wgTLH2kl3Gd2keLX5Vx+3aGpCUJmd1YNtDuF8XwSnKP5pDHH?=
 =?us-ascii?Q?yFW6c67U3+gvP42tDg1yMGlMzj6miNzm12M347vO6QwAvd4mAKjoXslZp5qR?=
 =?us-ascii?Q?XU0tfzf9S3baZBPUUraicGfQvCy3GATlBxg8LkD5hKSZGE9dxUvPqTzGNgpv?=
 =?us-ascii?Q?cgWoWTQiGHuWMQDZEGsJtmkYa0knsZnQ1z4hmRCoAZ7CeYkt18/SLeFtl64Z?=
 =?us-ascii?Q?hQR5jHZ5il0rK2RspRiwXAc6DKPZrr5Jq2djQmb4iqqC0G7J9OuDKLBTIAka?=
 =?us-ascii?Q?1KUSk/4p5WmUXQNutHzWRHqTX/HDFQRRwD2EzRfqcuwyw91y23ERzJZbo7FN?=
 =?us-ascii?Q?VPsfOfsStkK+Zd6FMEQOkY1528itSuBLEW0zAIsc?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee816cc-65a1-44ba-5805-08dd310d6a93
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jan 2025 00:26:24.8513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BgaOuVQkP18+ATphChED73ij8Twa1LzUdIUp1+bTHMBxVahO/cjLMZMMcjIVn2EeRAAmvNQAtIYRgLYyZr/c1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
X-OriginatorOrg: intel.com

Thanks Jiri!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Thursday, January 9, 2025 5:15 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; corbet@lwn.net; bagasdotme@gmail.com; Aaron, Ma
> <aaron.ma@canonical.com>; rdunlap@infradead.org; mpearson-
> lenovo@squebb.ca; linux-input@vger.kernel.org; linux-kernel@vger.kernel.o=
rg;
> linux-doc@vger.kernel.org
> Subject: Re: [PATCH v4 00/22] Add Intel Touch Host Controller drivers
>=20
> On Mon, 6 Jan 2025, Even Xu wrote:
>=20
> > Intel Touch Host Controller (THC) is a new high performance input IP
> > which can benefit HID device's data transaction, such as touch screen,
> > touch pad, stylus.
> >
> > THC IP now evoluates to V4, it can support 3 different modes: IPTS,
> > HIDSPI and HIDI2C. Here are upgrade history:
> > - THC v1, for TGL/LKF, supports intel private IPTS (Intel Precise Touch
> >   and Stylus) protocol ( IPTS mode)
> > - THC v2, for ADL, adds industrial standard HID over SPI protocol
> >   support (HIDSPI mode)
> > - THC v3, for MTL, enhances HID over SPI mode
> > - THC v4, for LNL, adds inudstrial standard HID over I2C protocol
> >   support (HIDI2C mode)
> >
> > Linux Surface community (https://github.com/linux-surface) already
> > implemented IPTS mode. These patch series provides THC HIDSPI mode and
> > THC HIDI2C mode support on Linux.
> >
> > These patch series includes:
> > 1. Document for THC hardware and software introduction.
> > 2. Intel THC Hardware layer driver which provides control interfaces
> >    for protocol layer.
> > 3. Intel QuickSPI (R) driver working as a HIDSPI device driver which
> >    implements HID over SPI protocol and flow.
> > 4. Intel QuickI2C (R) driver working as a HIDI2C device driver which
> >    implements HID over I2C protocol and flow.
> >
> > Change logs:
> > v4:
> > - Minor fix in documents
> > - Typo fixes in patch 6 & patch 7 commit descriptions
> >
> > v3:
> > - Change tables in documents from literal block to table format
> > - Change symbol namespace to string literal according to patch:
> >   commit cdd30ebb1b9f ("module: Convert symbol namespace to string
> > literal")
> > - Refine Kconfig description
> > - Enhance Quickspi and Quicki2c driver by clearing THC hardware interna=
l
> >   state before doing initialization to avoid BIOS impacts.
> > - A fix in Quicki2c driver when does set_report
> >
> > v2:
> > - Fix document format issues
> > - Add THC device IDs for Intel Panther Lake (PTL) platform
> >
> > Even Xu (13):
> >   HID: THC: Add documentation
> >   HID: intel-thc-hid: intel-thc: Add THC DMA interfaces
> >   HID: intel-thc-hid: intel-thc: Add THC I2C config interfaces
> >   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver hid layer
> >   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI ACPI interfaces
> >   HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementatio=
n
> >   HID: intel-thc-hid: intel-quickspi: Add PM implementation
> >   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver skeleton
> >   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C driver hid layer
> >   HID: intel-thc-hid: intel-quicki2c: Add THC QuickI2C ACPI interfaces
> >   HID: intel-thc-hid: intel-quicki2c: Add HIDI2C protocol implementatio=
n
> >   HID: intel-thc-hid: intel-quicki2c: Complete THC QuickI2C driver
> >   HID: intel-thc-hid: intel-quicki2c: Add PM implementation
> >
> > Xinpeng Sun (9):
> >   HID: intel-thc-hid: Add basic THC driver skeleton
> >   HID: intel-thc-hid: intel-thc: Add THC registers definition
> >   HID: intel-thc-hid: intel-thc: Add THC PIO operation APIs
> >   HID: intel-thc-hid: intel-thc: Add APIs for interrupt
> >   HID: intel-thc-hid: intel-thc: Add THC LTR interfaces
> >   HID: intel-thc-hid: intel-thc: Add THC interrupt handler
> >   HID: intel-thc-hid: intel-thc: Add THC SPI config interfaces
> >   HID: intel-thc-hid: intel-quickspi: Add THC QuickSPI driver skeleton
> >   HID: intel-thc-hid: intel-quickspi: Complete THC QuickSPI driver
>=20
> Now queued in hid.git#for-6.14/intel-thc.
>=20
> Thanks,
>=20
> --
> Jiri Kosina
> SUSE Labs


