Return-Path: <linux-input+bounces-9262-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5402A130AE
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 02:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1D2E164110
	for <lists+linux-input@lfdr.de>; Thu, 16 Jan 2025 01:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0158C282ED;
	Thu, 16 Jan 2025 01:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LOzJjeH8"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BC1137932;
	Thu, 16 Jan 2025 01:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990461; cv=fail; b=ust/I2bMTSzY9TXOetJ8/jngrPK0CFS5FcaTE+kvUqhK52baRW9dD6YJ/V94wKjFaKnFyPdV/tJk3nq0uFT4WnQqMCpOc5WjuG/1rBlU+OEZv325D0lAcgxYxMoIMGp7n+SRraKUvrwJZyHc9zL+ftbgIFyDRFnpQWqr69MvuHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990461; c=relaxed/simple;
	bh=woqfP2xpE6Mn06q7QGJez7X21Df+axyb7NV1wRblWT0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ph4dlp36+dxMB7W/K3Z4lVqleUGWPsQ/7q6hUUUNGASEX4vC8H9Lp+wOhCi2wy0vvkFgFeGxmqHYZCNfTURkXJuRy2muxmv3k/IQDwV5qbRs5skpkCkxCTvkebFyXk50egRpi4h1ms8XZriawfLXXXyxVVtgPzYJSjC0dVQLMcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LOzJjeH8; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736990460; x=1768526460;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=woqfP2xpE6Mn06q7QGJez7X21Df+axyb7NV1wRblWT0=;
  b=LOzJjeH8Y9jQLh09uYh9Z+fK9dUjYSrPvD96vybS0a+KtPMMy24gTT/Z
   yMIbQNiddhBbID3Pq2vq5nRIMzhLAgCcd+YmyOFd+56Oq7ZgEZ5QHWeqF
   Pu6gXGcDiJa9eqRvABz2+k8y9zdb9opTaa4kVM1MHsgJXwbntsC+QS4Pd
   3PDoYNiPj8Por8/afKjB9Cib+t5rp8j712XSYRKK7KiGyOagYsm0J8Pgz
   cxRWI7bl0qHA3TnmZgcE1WGXvO6YomL0AEFnWvD7kGR/3hopshw8JBoxl
   Qz/Ngp2mz3mhzrOy2rAnLlW2/bJy7xqAZgvlaNeX+7KblUnGAKIH7NRw5
   w==;
X-CSE-ConnectionGUID: IlZqgPPDSd6wM86s3j5OIw==
X-CSE-MsgGUID: 7eUKhew7RGi3DZe1vIuLag==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37379136"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="37379136"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 17:20:59 -0800
X-CSE-ConnectionGUID: M4qHI2sWTm6KLCxc8No3lw==
X-CSE-MsgGUID: Hm8g2COSQWu5lV1cpdv/Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106184823"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 15 Jan 2025 17:21:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 17:20:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 17:20:58 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 17:20:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uT2k4zc5fIW6llh5sPu4fy5hftbjOF8ErkkgTpOLysxXKeJpMCKQXLT4mL/b49lZuXA8kav2KmjDFJV/76x5hCbvKbRYOI71uFVC9ISDaF5vWq28fGxyMXzduB5gVqGIZIw4gQRqi2DlsLoKXez412yCSON7xj/Mn3fy3jV94PRxAiLDdENiKuniZlBgIND/Axdn5mICI2ghlEJ7kBtG+Df/ydMbVmVFYtdRKZcVnrXC67VvfXa/0oAro+owxGj9IMD/oFm7otRYr1RqHYmKiyPv48otnwWhq2FnYi3WN3MTMo5rZUrW60ywPbb4c6fS3FF32zUu4BC18X6kafYHlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=woqfP2xpE6Mn06q7QGJez7X21Df+axyb7NV1wRblWT0=;
 b=TqwjSW97eTBYlcac+MkXT4ZfBfSon8KXsQEtRDgWn8o4o+FfholqJOy5hhwhpvrmW2b3wVyzHSDajBxUnQhlv6nM4Kq2E+iwKYaeDhjidrIVP/9jQvElcUPKeITCKTbJLvAB2e4KE1Gzod4W5m/0Qv2qnD3hA9OOGe9YNYo347MtKhq4OVRiRC8I+3GAYt8ujt2BN0/bHqvEa7v5LtwONnvgtNSWf+F+WcJMGi7V/E/vygHAlBhCmpZfPbgeLfzYtGRIC3bOscWGt6iWrAeHjxFtYlSJvFT1S3EmWNp7lVQAgmPBPtbMbesrDNy+ojsoxWR6PW4sDQVwkrCwV/xHxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 01:20:43 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 01:20:42 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jikos@kernel.org>
CC: "bentiss@kernel.org" <bentiss@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"mpearson-lenovo@squebb.ca" <mpearson-lenovo@squebb.ca>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lkp
	<lkp@intel.com>
Subject: RE: [PATCH next] HID: intel-thc-hid: fix build errors in um mode
Thread-Topic: [PATCH next] HID: intel-thc-hid: fix build errors in um mode
Thread-Index: AQHbZhyJrfxDF+v6OkC/5fP8l2CTBbMV70wAgAKuD6A=
Date: Thu, 16 Jan 2025 01:20:42 +0000
Message-ID: <IA1PR11MB6098AA77BC2A8B26906BF69AF41A2@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <20250114003712.3042688-1-even.xu@intel.com>
 <08992rqn-5r94-ns0s-3641-46p927445op1@xreary.bet>
In-Reply-To: <08992rqn-5r94-ns0s-3641-46p927445op1@xreary.bet>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SJ0PR11MB5088:EE_
x-ms-office365-filtering-correlation-id: 2619e95b-5014-4a34-c49f-08dd35cbfeff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?jH9YOsbMZTwlC4aRYmvOZuR6C/f2If918QcylvBbMYMHhBoE0PiH3dgfyM6q?=
 =?us-ascii?Q?TGMZG8459Uh9IMuX7CBJGzZIjPiKhbRZDEfhjBm49Ca6d7QpDPScn6+19d3F?=
 =?us-ascii?Q?qhoLY4j9JA+Nl1osi5zZnu+7B+0PEMOuuwQpPDiT8sq/zbXCpLbiSIRlcg+z?=
 =?us-ascii?Q?kZKB1EpUqFKplETBY0Xb/A3Xdeg/ceXmKnmHFSX2RoTAOe86u0JbwFhAQzyY?=
 =?us-ascii?Q?ARTL2BOdqLeB7fGFStvk0IhcQTLKgi9v54vPg4KrG/MKaWkxjTZJmj7jZMYT?=
 =?us-ascii?Q?UzlnqBhdXgvemdvQXaYWOlZmG5z4BHBeITJPknL+DJT8kmVIf9TSgN+3pEzr?=
 =?us-ascii?Q?Sv9AfzwDnCQxQqRlXUNDADRT/Et/O0So1NVCeXIqCnFi+qnEkF+pATDY8/vk?=
 =?us-ascii?Q?x3WGWebaLtiX706fhujq6KO/r0ViOXBJT+dvCUanQfi+WUlRVENEe8ko6Zm3?=
 =?us-ascii?Q?X4NIGW8POMDK3r2okcUw4FihsJnLAeK0++cYU5jBit25yVCPjmCtL+Ur/lWD?=
 =?us-ascii?Q?DAjhenlI7dmN4O5qeOIZDAxdnOEShLgn2JFAnVSpryQtKrDmOY9HAqpJMcmE?=
 =?us-ascii?Q?LKHXFMQkwEIoV/7CKwbARbuqGmVG7B473zClgZmC571WG9drk/kskMcuiCXX?=
 =?us-ascii?Q?RyxARWTrRywRzYHVSk2KCw7mzX9p9W+hVEr+mVenF8Zljm7HNE2749XvCrsC?=
 =?us-ascii?Q?kRO8nZ+QoC8VKzkcoK2E+G0MEPlUXfUDNwbYWdDUPNXmijrYQ4ilmJhrYUnv?=
 =?us-ascii?Q?EfnX2zm+aElmNO0jv955YcDlZwC7qbhnfdi94fAjGiOlbNnUPAg4gQnITQq/?=
 =?us-ascii?Q?Ow+tw35xFM5sS5qzl1hLedWPhzuSdi0J1pfPumUqpdZ6Rw/LeIvVwExzkRqO?=
 =?us-ascii?Q?F68A6tgaxZrXr0ZwJvaycQPTMtuqu1g4Ie2OFgh1lRBD4EO0qgUKTt+V8UVn?=
 =?us-ascii?Q?OKDfNdeblZ8pjxvG3bdK/Hc0eNHihG8S85QWRiYBlw20beC3qInAxKxDp93K?=
 =?us-ascii?Q?t3rV41siSb7t06StQshQLN/YznEk70ke/k35ckj9JQOTWVkayFZcrrVwDPvU?=
 =?us-ascii?Q?hrAcC1ds9Vt42BItoG8Fm4YeXCVbBXNTIKuPqy7CkahazbWH7/XiYl8re9bY?=
 =?us-ascii?Q?vGfjQhA414LodA5YNmG8Pp0VLDwDpPcHDwbRMl6Rq7PZp4YLGVuEfe+FAvwL?=
 =?us-ascii?Q?J4SddqEdG7oh/naSTIAVQDh5SozR+k+whKf40+wQurw3HI3TzloB3mzC4Z9f?=
 =?us-ascii?Q?BSXkG8wD3BfsFv5Fd0PHKfrO20OBS64lNRBTMH33jEfYDCByKiEOj2kF5lCt?=
 =?us-ascii?Q?56swJgU4JLdO7nfoxDQOMEXkhbbx3ClS2dYiGOjjG80LBj+vn9LobnLkScpS?=
 =?us-ascii?Q?8byG+Wv4GKbcLO2zL0BW+yvEiKq04jKenQZctmNxxY8KdBmkXmr7Sn7TbPyX?=
 =?us-ascii?Q?fAqSKv5uj09CzAWXPUaZb4Vwm5H57Rnc?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1ExK9E7P0/QYX0b7H19AXFJ4UfLj862eR0SNO1yRh5mDm82/d/l5OCnNC+lo?=
 =?us-ascii?Q?amNibWEAF5fE4cQ3n3yrKjjNawbprLUIhrcYkFYecQ+OrOas1H6wGuXg2+37?=
 =?us-ascii?Q?5ftuxsKmIbN22xhe+jX/5PcsY55hZebtGu3NlwXd/KhDoSb6K94v5e3uWvRP?=
 =?us-ascii?Q?3spKknlckqmhcQLG7akUYq1rUxEfVupwVyEqNZmgSIVVV7RyofQlNL4gY/Td?=
 =?us-ascii?Q?lkGdTLAVbRFxrLgnUPU1MGrw/xl0RaC8WSRRK4Clzzz2Wi1bLstmytveFNB/?=
 =?us-ascii?Q?3OmHX32OREaRg+7BHVF30KwBG8USJRVe3YgpAULn+ufz58cAbx+VLm7GUHbm?=
 =?us-ascii?Q?Ol6lB70zskVMvFjlPZbpvSFPq/MgZpYFLD3qxfKIAfMFWDxjCcCTr3crSRT5?=
 =?us-ascii?Q?kRmtel29OdUOwyk7Loo/B+23kAjcWfgG7MpZK8KQVppJokax59cq67HaYliB?=
 =?us-ascii?Q?6Kmy/7LQk/c6QS0tHKuSQGM52KQsWLU8Vg+IDYe13uFa77pIg/s77Ne6hxB7?=
 =?us-ascii?Q?+vjyraS/wXahBqnA5EVSA/3537PsO3+PAAI6vkA8ItDc1x8kF9gu0XTbtVHm?=
 =?us-ascii?Q?XLDeR73khUTFX7921PylZUQovF91zsfxaMeqjH3SCAsBbFjFl8OsV/jVEtzk?=
 =?us-ascii?Q?tC3ZpCrh9RVyxCGBpGNE4HmgqmM2t6hXDLHFpExPO6hHFHRtCZ7fYYj20DNj?=
 =?us-ascii?Q?dTbjmAtrasMjUYRW9NW8/qIhyyAnmot8yXCU/Fu+vyZiKZdvwfw/pgjgEP43?=
 =?us-ascii?Q?e6ILM88r4d5AYwnkTsgss+/XEHZw5TeRmUVGDbBDTcz4IGSLexPCT8koZRv/?=
 =?us-ascii?Q?e+WaMH56j/1QRA5s+M6kTsxqcF7cQDX74byzjU2iwIlE0Atku6FqPA9i6aE6?=
 =?us-ascii?Q?JdiuWoth1SNtZ7C/CgXdEKp71zP0I8DKv6QjPgJEzHIJMbJF4MLbsOK0DVnw?=
 =?us-ascii?Q?7MmtMIiZUfLaD4cvz0QyAlS9RctQka5oDLc3g11jqarMAYSmGwhooq8Y4snK?=
 =?us-ascii?Q?CIfDaBaBrxyGrcVnyM1bjgnCcbTLQBIB6MyVF9v23zeDV8HjEXXN+y0wQSjJ?=
 =?us-ascii?Q?csJz9FUCJyuu8ofYTEDxkzYrjXcreZAuGjBR1WktxOv3lkZjgvkH8QR3wHgH?=
 =?us-ascii?Q?XmYAt99uYapw7IdPHTY/mkNFQm7B7cQ4XLVb246Hfj46wqzM+KFxjgTepLCu?=
 =?us-ascii?Q?w3/DWm1/4EJ15zcmChXQ5DBE2RPER21WVDa/xhhzoFm1Cd50/kfl7ndjDytD?=
 =?us-ascii?Q?n+UD33s+zaNLhWDdn9EGqIFBD0bXRK8iv8To5JXdLbuEXgK9WMumLhx5RWns?=
 =?us-ascii?Q?ikx6FYpRJJv3ahtWygIJ9kKum1ughyXGBH+OLhPjsPUqSpwMQ4z471MHH5NA?=
 =?us-ascii?Q?V/z5TdgJyASGdyUTZKifjp0W3YplJrcmhjNjn+Q6rB9F5YrQGM9dCKl40Sha?=
 =?us-ascii?Q?ibZFYe+QyHpGJAEmo7JbB6V4fd2zWCQxu5PkYd1gjW7OEd1CGVaZ5u64mugX?=
 =?us-ascii?Q?xESQc/uhxMN80AqoGgAe4ZcM/7ydsVfnhnKJY14k/3MMHRS+WiCrSPKGDfux?=
 =?us-ascii?Q?iIESieqPFMH8KbyXPc0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2619e95b-5014-4a34-c49f-08dd35cbfeff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2025 01:20:42.8787
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYpe5tviopU7IhrCUt+TdF+LecM30AZNbkLTFg6QlKDOcTu2ZFy8SmkD3mJJufmbn3vROF7SqDUaB+MGI5PIMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
X-OriginatorOrg: intel.com

Thanks Jiri!

Best Regards,
Even Xu

> -----Original Message-----
> From: Jiri Kosina <jikos@kernel.org>
> Sent: Tuesday, January 14, 2025 4:25 PM
> To: Xu, Even <even.xu@intel.com>
> Cc: bentiss@kernel.org; srinivas.pandruvada@linux.intel.com; mpearson-
> lenovo@squebb.ca; linux-input@vger.kernel.org; linux-kernel@vger.kernel.o=
rg;
> lkp <lkp@intel.com>
> Subject: Re: [PATCH next] HID: intel-thc-hid: fix build errors in um mode
>=20
> On Tue, 14 Jan 2025, Even Xu wrote:
>=20
> > Add dependency to ACPI to avoid acpi APIs missing in um mode.
> >
> > Signed-off-by: Even Xu <even.xu@intel.com>
> > Suggested-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202501131826.sX2DubPG-
> lkp@intel.com
>=20
> Applied, thanks.
>=20
> --
> Jiri Kosina
> SUSE Labs


