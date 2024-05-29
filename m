Return-Path: <linux-input+bounces-3932-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D63248D2D92
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 08:46:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 614E21F271DC
	for <lists+linux-input@lfdr.de>; Wed, 29 May 2024 06:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6723C160797;
	Wed, 29 May 2024 06:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7OlfYgV"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D2115CD71;
	Wed, 29 May 2024 06:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716965215; cv=fail; b=CZn7GFSKM/ebunkzcSGlx8C3v03k7LP17dCbNZUHHLRJtpVQZNVLoOmu9X/dh1phn0Rax1U/8A5anduEGC4K3VNFCO72agcEJS4T/5K7l19CpLUWmcMHa+pKJHyLuSCKNKjLh8Qys4zgdbKc7v4J1XUg1PEUq76WB9RwZgwv9gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716965215; c=relaxed/simple;
	bh=g0qQeiUCQUBGXPzIRnaTNCeHTbwWOptXByeFnVkosDw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q0anR9OKkWfVWjizcrQX2kMX2//ptRkOXDjsx0nThb9fCdEcSZ72LZLrcGWUyV9hoUhUaIGSC7dUc+iSKFxLLptmspF8jXuj5AO6xUbuZ6QlSX5Kpb+Cx5SxsiAbed+o8aBbD/vN66RbfXt4D8L6DNTEJzhP0AOxgp1NUMpiKNI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7OlfYgV; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716965214; x=1748501214;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=g0qQeiUCQUBGXPzIRnaTNCeHTbwWOptXByeFnVkosDw=;
  b=O7OlfYgVz8Q8BeWjlDisV2WZVVM+sNvGs8XY/95Vaw54UgvCmske26hm
   4moWN+DqZBViD050jKdJNApdhh6TKFXpq3aWmxpMeeeeaV/Uxxdhfu62z
   fWsYlhRbwO96Gw203yMLbdY2ZqrlqtLPZZfz3FhJJuKa76mEnMNEWPgQy
   OL2fNEBFRigEr3D4lKtOckompEPcpGk40lpVy+LCwb4hddscPYXedkjTp
   xShUn2jgqtm80Uytvjihc49c3ZTisZLGMd6qryAepjqc1qDdrvcI7/fqj
   lzw7PNYchKoLg2et0P6kOk5GKUMVM6uw2OnTVJZiMFwH8XAO5PjnwpJNS
   Q==;
X-CSE-ConnectionGUID: eZ2nfUZVSKquZXG7DSlOSg==
X-CSE-MsgGUID: aGKWJOWkRtau+bkr1zAjTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13297044"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="13297044"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 23:46:53 -0700
X-CSE-ConnectionGUID: NGfkhWS4TFaYFxO102AG9g==
X-CSE-MsgGUID: q22f4iMHTEy04iFEoc4rlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; 
   d="scan'208";a="35387684"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 May 2024 23:46:53 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:46:52 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:46:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 23:46:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 23:46:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtT+1TlfFfPIf6q/nnyjH6jEVg/s53yjLJ0+vuRB9k2piy2k01YqC4JtspL6Rj+pzxcE/HDb9/YCZ0JGpSLeHPvbwjLNlc56RITzZimZPhqr4P2dQP5xrHZE9aQJyYr8F4YYfBJLCgZmEB/OWIFOkS5MLX3f6EvxVEN0jq6lEhqB1V/JuKz8iYoCf22p7xF08RQgxryMzYKsqUcZIaa/xfuJBfSsQPfh1ypfjS26978wFHG1CRAIwDF7Gi8NrvBZti+hXqPsqVd9QmFHdeZjID8bvkUDZZ/EvUIDHZfklDk7xmovRcnR6BsL7RXvx7staeVI/bngYVq1lBekY1objA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HE5I9SODvYgsx3nuj2aVbHwn0T2MnzoSXrjqgsNpqis=;
 b=kdaEDD8jr1WaL1LnoAtYzMcr45c/42ShdEFjM9G6HZlhyLY4b4LmIMzxE1pFeS8E3tM7hBWSLIauiNmFizyad9MC0t3EcTWWiV3uu7ZwRMhhAQ1oQZioZVRORBQuXxGSdYiYwt3YeDPy4XCHmD7i2jeRZtLW4XUggKNW0RWlj1o00lR8BNr8QQZyeOa9zELj1pTErCOLJnHlMtnZ+FcRdlBpdrmSuP247idbiR41ii38lFfbZXHa8/dhSidqOAXDX1l7e6YtdjSc1dpvZnmmQVE92uYKVoHOIOucp2/poUovfABdNpW9rwE+dtce4OaJ8rjiIS0nXdd9ZJnP7u4ySQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5995.namprd11.prod.outlook.com (2603:10b6:8:5e::11) by
 PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 06:46:50 +0000
Received: from DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908]) by DM4PR11MB5995.namprd11.prod.outlook.com
 ([fe80::654c:a738:ac8:7908%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 06:46:50 +0000
From: "Zhang, Lixu" <lixu.zhang@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Thread-Topic: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
Thread-Index: AQHasPZUv9c8QpESZEiMh4a/JLYAj7GtvJ2w
Date: Wed, 29 May 2024 06:46:49 +0000
Message-ID: <DM4PR11MB5995875EEC9ACCFC43D8B86A93F22@DM4PR11MB5995.namprd11.prod.outlook.com>
References: <20240528115802.3122955-1-arnd@kernel.org>
In-Reply-To: <20240528115802.3122955-1-arnd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5995:EE_|PH7PR11MB5818:EE_
x-ms-office365-filtering-correlation-id: 35b88b9b-4b3f-4cdc-1d3a-08dc7fab1e0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?2WlGP9NgIlUh2L4TYXYboozPUgfdcb6CfpAV8fvW+loajo7his1iBtwIZbv2?=
 =?us-ascii?Q?tZHJMO4BwWP7DO6fEbXeZpwAZ8ZdffUbtg7utf82wQnJooUVGOWz46IHXGg/?=
 =?us-ascii?Q?K6C5um3yy/nyVBaTJHugzaGP9LJV+HxH5BaMEmw7oPktrvoVV4XNcZUAFEU/?=
 =?us-ascii?Q?KT6SvHItD54lBLfBRWdi6rCGjFieiM/L3ue9JMERZiuzOc2RI+dCmKHoDjsv?=
 =?us-ascii?Q?c5z44ghKBvA0PM1i0aYVUkFYrEbCJ33BpkegOzBwPyjnMPriJIe3LBJN0Bil?=
 =?us-ascii?Q?sm6VJxbcJA8O1DXP+OvHk2UiNC304zSViw0mF4PKzVBqDRdXKoEXSexfAlYS?=
 =?us-ascii?Q?vCk1x6u1LpEMtHuZFtC0MWbc+huZZJzJjBrMO1JXacHUKzhhuyOxMO94Zz15?=
 =?us-ascii?Q?Tqq1VgnYeXb5I421+M52TWwmcuPoGr2Wf6TARcrGZ+dJvNXX1SOvUhVBzSmH?=
 =?us-ascii?Q?0ZxlrQbktmpbUhEsOvuz+JnN4uh922LAuQ/y/NiSuK53F5pxVmGsNIIm1tiT?=
 =?us-ascii?Q?83Pmy4Qck/54ghi/RJqEWM1jKH75kAJRmThu9wJt3MsQH4GHZ3pmmYqy4T7s?=
 =?us-ascii?Q?xX73IkoIeLDS3BhmOg/yUqbPksTw/wIIDwhhxtGTXuBf63x9EJsphPLApEtc?=
 =?us-ascii?Q?bSpBUBnMmfmn11wPQxR8kRgRY5d4fUKOyXwtnTvAGXOkM7/UU5OjRS2fnZhQ?=
 =?us-ascii?Q?FWy85k4BkUmxiXySvYnutjUH1H+HrvvwaNjBOyU6TxoDrp5i+oCsRTyxaqFb?=
 =?us-ascii?Q?j9LC2DNgkDkdifxJ+P727Vsk5EIaD0V5yFBIbABcalVjoijpoVarUBhFrKi4?=
 =?us-ascii?Q?Vgx6HTaxSEX3zBTod3K98v4Po4QpZX3pAeZ5ZXHvQ5y34bMif7IAO1AuyNsq?=
 =?us-ascii?Q?tnY+Wf29OtNqjsay7jG1H47rmXA9nQ6rRID5rIyYTtc4ODWTC1jb5HrJZsV5?=
 =?us-ascii?Q?qzENGcIJMCsij3zDADfE1NJ/GmGeTnKdGAcuxqs716LHgfsCfx96KqUP55r/?=
 =?us-ascii?Q?zMJq8E2l6rBBNEOfZ1R2/z9nJZIfUn27zz/6kOU57FJaZc1b9QseqAOalrUg?=
 =?us-ascii?Q?BBA+LkMjorfy4zMLWb2JTQ7jIPeJ20eSIxOJLK25C2VNT/MzAL/vG1LcPwrS?=
 =?us-ascii?Q?aiHbQOCh147u8AQWF5NBqYWb8aYw0Tw+TgoDqFWcl8iByCGxyrhAAN4HrpCT?=
 =?us-ascii?Q?WG3qUH1MIPO/fGIXELpuFJDhUW/xHKKhLhUz/dm/OEqhSj2SdUyPVHFcUm9v?=
 =?us-ascii?Q?TSaHsoIenBLnbcfsI8c4cxvsE66GE/UDkTp8Kq3X/WvNZR9brEEzV36+Sk78?=
 =?us-ascii?Q?hQaiuJS615PCfAsGL1zZcEx+IOU/c3GiKLDBMclNPpdlkw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3hutsPL6J9NHP4ldcHRHFlW1CyrNTIoB2gNhmNIfJiRsmFRQUBB7dZ2fSc5b?=
 =?us-ascii?Q?I/vdk9HIleBa4R7IeSV5BKkl30hN+ISFOuJR4XKxiI6e50gLae6dJl5ZsDxM?=
 =?us-ascii?Q?xiPFvPs9yR9SSY4yKBg9bq3cXu/U7AtBUKwVPeL7mmO3IhDf0R7C6xOdM+oW?=
 =?us-ascii?Q?3z0YaMxooq2anVTFG7pvKoUQaypzpLrUMl9L2xssAj9tVr57Dv9Bqy9ucn1V?=
 =?us-ascii?Q?xMCL6AI5bgS/TQDU0EBQHrzS2zqn43Q+uyotGOviKPmvYmpGspXfejZKR49P?=
 =?us-ascii?Q?ZpSsXYQdbs6YLsNdps5jf4NT6h1Ghsng6kuw18AMEwrFqdji6sAaxZDKEQ0f?=
 =?us-ascii?Q?CIhGdka43G30Yq0Q5FeANiyP4waCqZqDfTGL8E3dbRlrfsQI1/t/7vwQFKHh?=
 =?us-ascii?Q?XprATnlAkxkv+tYk8koZ8tZ/1xU0eXjKD/xcj9tqcm49fSM3w//sBuPyrd1f?=
 =?us-ascii?Q?0IEofrfy3CQ1xtefGduOR0OSGlDb+FBIhV/l0Oyzlg5FpMy6WjScrGsuJJB1?=
 =?us-ascii?Q?9BRKY/LckEYOZkv6g88x0OiESi+ecOWx5UMqNeKPsWy7C8og5/4K6gbyk84K?=
 =?us-ascii?Q?P7o15AGReVL1mZgaln7ujZN7qoEIfNkN7EG29XGBh93RX4awO+yJBWq3TNDM?=
 =?us-ascii?Q?wAeI0rMBu6YZEf77HGXjQnWk1PCYNC4dcY6t/010zXN2EDsuGLzD2PJpkzzZ?=
 =?us-ascii?Q?dBf4MBeomMtBIvZCScaR6nZCmMUFfywOJWpaAZ2ob5HuptI2tU9lBUwlsvQ2?=
 =?us-ascii?Q?mgjC4CdAsbhSbdkHiuSPswFEnQC+NcUtzwiFTiEU54gmdYy23GVhXEslN0vh?=
 =?us-ascii?Q?XFo0GARmYpngPKZT8h9Ch90pVwchhFyhxulxmdyXaUaZSbFYuvbND9Ted3fZ?=
 =?us-ascii?Q?vxTVn/nuycAXshkpGpqNUVdfwZx2RjAWZ056uX/Vr8jdh/iya8MTqJXRm+5t?=
 =?us-ascii?Q?XjYfXF21jPA1VMaG2gULuxgmyfOHyfOogeOKMprmXGT1nIW9Yug9MLkCbepC?=
 =?us-ascii?Q?TN1NWAB4tN3uidmy6cmRNBsITzzN1kgIHRX0zeqK4WMMLXBzd8lNGns0LLFN?=
 =?us-ascii?Q?RFm5tGLXyD0PALPSi+GUeNYbW46+5cMLrVCOnxGzHk5vXJkxHhKIhf4YtR5o?=
 =?us-ascii?Q?Ue9d64d5vHwQQrJ9R60uzg5A/os3NzMfoTj0k3vMz9Zc/niB/thH1w9J6UsK?=
 =?us-ascii?Q?aXebazHs8dCaSBL/iaQOcQ0xkI8pe7ckw7X5nBOp03annj5e3cCPJ4xx9wLB?=
 =?us-ascii?Q?+UtEbkQE5bgdYYA1xVGZyybS0SzVGG1FVMIBGm805I8HmzxLndQEsSnlCeq5?=
 =?us-ascii?Q?rZ9CPp1vFG1TWrxC8P5u5DUcV7qgc8xd2TZQJlCv5/c8LryxnlcD+/1pZ/rf?=
 =?us-ascii?Q?qUgoi5RzrcYvXHXKEbxDJmg5gpud2PAQ4xLKHjZxszKOoliA8pgMszbXBU4L?=
 =?us-ascii?Q?FDaIwsd4OCWIXKKsA2Q988cvDHBrsF9OTApaB2j6OjH0pmMU2h2gV0O8BlLY?=
 =?us-ascii?Q?Rxm8elMjiB0nVhpGFtItkez9agrIj9Ve6awPzMoGyHUDCs4HjBJooxPcyosx?=
 =?us-ascii?Q?hO0m+aWWBXJVvMNo0uQb7PvPjrqfVk0SYehkzt4R?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b88b9b-4b3f-4cdc-1d3a-08dc7fab1e0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 06:46:49.9745
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nq8ZS+WsJZ2VF1zIlkALfEtUnG0Og4a/DmgGifTHmaUNPgTE/q2klEUDm6Ubmttm3XoG1lg66Ltly3hLxxrLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5818
X-OriginatorOrg: intel.com


>-----Original Message-----
>From: Arnd Bergmann <arnd@kernel.org>
>Sent: Tuesday, May 28, 2024 7:58 PM
>To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>; Jiri Kosina
><jikos@kernel.org>; Benjamin Tissoires <bentiss@kernel.org>; Zhang, Lixu
><lixu.zhang@intel.com>
>Cc: Arnd Bergmann <arnd@arndb.de>; linux-input@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: [PATCH 1/2] HID: intel-ish-hid: fix cache management mistake
>
>From: Arnd Bergmann <arnd@arndb.de>
>
>The low-level cache operation on a coherent buffer is incorrect, as cohere=
nt
>DMA memory may not actually be cached. Instead, use a DMA barrier that
>ensures that the data is visible to the DMA master before the address is a=
nd
>move the memcpy() before the reference.
>
>Fixes: 579a267e4617 ("HID: intel-ish-hid: Implement loading firmware from
>host feature")
>Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>---
>I noticed this one while looking at the bug that was fixed in
>236049723826 ("HID: intel-ish-hid: Fix build error for COMPILE_TEST")
>---
> drivers/hid/intel-ish-hid/ishtp/loader.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/hid/intel-ish-hid/ishtp/loader.c b/drivers/hid/intel-=
ish-
>hid/ishtp/loader.c
>index 2785b04a2f5a..062d1b25eaa7 100644
>--- a/drivers/hid/intel-ish-hid/ishtp/loader.c
>+++ b/drivers/hid/intel-ish-hid/ishtp/loader.c
>@@ -33,7 +33,6 @@
>
> #define dev_fmt(fmt) "ISH loader: " fmt
>
>-#include <linux/cacheflush.h>
> #include <linux/container_of.h>
> #include <linux/dev_printk.h>
> #include <linux/dma-mapping.h>
>@@ -175,10 +174,11 @@ static int prepare_dma_bufs(struct ishtp_device
>*dev,
> 			return -ENOMEM;
>
> 		fragment->fragment_tbl[i].ddr_adrs =3D
>cpu_to_le64(dma_addr);
>+
>+		memcpy(dma_bufs[i], ish_fw->data + offset, fragment-
>>fragment_tbl[i].length);
fragment->fragment_tbl[i].length was used before assignment.
=20
>+		dma_wmb();
I tested it on the platform, but it didn't wok.

Thanks,
Lixu

> 		fragment->fragment_tbl[i].length =3D clamp(ish_fw->size -
>offset, 0, fragment_size);
> 		fragment->fragment_tbl[i].fw_off =3D offset;
>-		memcpy(dma_bufs[i], ish_fw->data + offset, fragment-
>>fragment_tbl[i].length);
>-		clflush_cache_range(dma_bufs[i], fragment_size);
>
> 		offset +=3D fragment->fragment_tbl[i].length;
> 	}
>--
>2.39.2


