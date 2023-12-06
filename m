Return-Path: <linux-input+bounces-518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6598065E2
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 04:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621B61C21138
	for <lists+linux-input@lfdr.de>; Wed,  6 Dec 2023 03:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DE2DDAD;
	Wed,  6 Dec 2023 03:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PHR0yYWT"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18565D42
	for <linux-input@vger.kernel.org>; Tue,  5 Dec 2023 19:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701834817; x=1733370817;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WIWKonfZJFAuxILhx5W1SX+SNgv+bMLxW389qnRGY1o=;
  b=PHR0yYWTci/U6UmcMycCuUD8bNt7ezrG4u/6ZaQt7o2xtIECL7VubM58
   2zvgJYiMHKmaNdivd2hFXwVdf9qIH4681S4FDPhPniiYtDsCU9ZGORpuo
   WwrXJl+6yOJegHLXsp4UjEs9p2tKcdhoxY1GO6SxENoHJf5H6kH5YoSfL
   mPT9eKQWFNtv45h8SCB1kKvu3wPKWJYbnBoJo3pparJczdyKI8+si5/0D
   dFBNuozFsuexo5hIWaIWr0BuPgvWukHK4NnRfL0sPnGPu59PHMLQvRjt0
   aCXzrq2z9s3scpRKRPYFcozx+Dfa1K7iPt0BndM6Ct3DZA45TGJRgTTJa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="480198351"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="480198351"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 19:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="774857313"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="774857313"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Dec 2023 19:53:24 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:53:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Dec 2023 19:53:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 5 Dec 2023 19:53:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 5 Dec 2023 19:53:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAaZZ9+FvGqztwA30uOhajJFPCXi5gwrKCrtIJTVQ/7P1CiSqvn3cjaBVtcX7NGxdXaOEtD7sK14Oi5Dj+Vbt7ZG7CkJu0c9io+uB17/pBoJ5NdQco3UVM4r5nfOEGzCmPUeiCFPlBf0L5Mpvtx8GyMWOl94q7p12AvqZ9CatS6H3VLaOvBzGbV6kPWx+kuKMHmnt5M7lzuSWRZ4RNEdVAb9Tbp/HZtEZV4LSzQ8DziWBc5Q2Coh+gFPLRd+MXTUMozUTqkFjrm627AGWSc/GKSh3YuwpmhtQIq4pnuIOrH3SHjNyPb5uaPgxVePqbXp0+NF48fmG5Tg+brzO5SxEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIWKonfZJFAuxILhx5W1SX+SNgv+bMLxW389qnRGY1o=;
 b=bz4BfyrsPArz46s41/z65B4+zWlLsWnxZ5caC7OxWvDnU+2wPbAO2dpNbdv+fWVMTC0dqY2/9+obKRwC7FfuYxNcRvsJ8rUD/qpSeKcDuqFBR1ZBow7sNTIFNRNktu4t0hqW5Sxunubl12VUs4RaNRWIRbzz4+MHzmIql5/1qmrqFGaYjERDQBXZoOFquf/GSILDf5KMwYF6rImfwPQFd3UGMDxNbXcHwtvev1ryqOugPBRtTQgTJn/opP8N29OX8epStVtvWaV7QuvMdzDRuuMWXeHmzON/bZNWUL6LK1Pc79l9i2/nL2cS5l15rQIQwkzPljivNdWkjQBDBCKY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2618.namprd11.prod.outlook.com (2603:10b6:5:c0::30) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Wed, 6 Dec
 2023 03:53:21 +0000
Received: from DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::72c9:baf5:4298:34d9]) by DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::72c9:baf5:4298:34d9%5]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 03:53:21 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
CC: "jikos@kernel.org" <jikos@kernel.org>,
	"srinivas.pandruvada@linux.intel.com" <srinivas.pandruvada@linux.intel.com>,
	"bleung@chromium.org" <bleung@chromium.org>, "groeck@chromium.org"
	<groeck@chromium.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, "chrome-platform@lists.linux.dev"
	<chrome-platform@lists.linux.dev>
Subject: RE: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functions
 for connection
Thread-Topic: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper
 functions for connection
Thread-Index: AQHaJx2uw/KO/zzP6U+uHdhDNt8IrbCbm6AAgAAFY6A=
Date: Wed, 6 Dec 2023 03:53:21 +0000
Message-ID: <DM6PR11MB2618FC85A0DF5EC0016F86C2F484A@DM6PR11MB2618.namprd11.prod.outlook.com>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com>
 <1701741033-26222-5-git-send-email-even.xu@intel.com>
 <ZW_rdCJ7EdtmJYFz@google.com>
In-Reply-To: <ZW_rdCJ7EdtmJYFz@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2618:EE_|SA1PR11MB5876:EE_
x-ms-office365-filtering-correlation-id: 30916182-77cb-4f13-30b0-08dbf60ee3da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DUo51oo2p8zgiAKyktYh3PjxL2s6kyW8FUbUpcWi9LA4qcBNVGqT+GHw0c9CooR7zbktbMv1tanoMN5CWoopdqsgOzdbjh9LJGNdC/Y7jzGsqOS0Eu6CVef/FpHnGEeLFddL0mZcgMVS43wn7jaCa9PTJfNUmMyTHyC7lvSXjf4K8YgugFoCn+gpU1kkXZ4PounT4iNUIWe8NNRiCCXUsvUTmYzWID6FachxSfbJxR85Q0hp07TWm4r846DyZ4cOH8YDVK3OTsHFM1dLLn3fMT3YRx6dEZQc1GfgfJ4TiI44RDRKv2EOMBLKXNTHUC70cLynR/kVzTcICq57LK8kY4d6nRwF1NlmHXddFtLXZBhsWatG9mhzj/gt3t0ObKvEA0Md6OQX9syn3bIaF45tGCoEyotNdlt2Vn+rcOUixw09oyCuftf7E61fWHYeAJ6pI4IrH0LjmhwsfPPSp1v14XzoXP0XqDs2yTV++NQTjmVIcGUYs/+IjIrac/6q5PfvCk8TzUwViNCmSKPNPATkkSOzEHBFaS9jZJBsnlzsWr4kyrsFu4uPAQyhCfTYbd0F+DIvF/G5XkmJMOMAJ6KLA+Sw/PqqRzHNNg6a+IjBDVFUUHImLOtFqQK0YY+f5ItK
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2618.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(76116006)(66556008)(316002)(66946007)(66446008)(64756008)(54906003)(66476007)(38100700002)(2906002)(5660300002)(86362001)(33656002)(4744005)(41300700001)(38070700009)(4326008)(122000001)(8936002)(8676002)(82960400001)(52536014)(9686003)(53546011)(6506007)(7696005)(6916009)(26005)(83380400001)(55016003)(71200400001)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OfX/9UJG0iOjBMgFGi/y6LKyj7/6IBS51kqN+oyLWr+8qnrkx07mGZyUUzkX?=
 =?us-ascii?Q?BNBRllUStd8i/SYAYcijvaVqdglIwpxQRPaCStMbFx0fQqDeSGLu9CAQwkRu?=
 =?us-ascii?Q?NYv5eZAlBw6OSVVTf1vctWJrlyrES8HMe8NaYIgcyNy1hlf2zG90A70Nhjoh?=
 =?us-ascii?Q?0aE1aiex+zOEuTNxhaF3rHZ2Zq8tMmi0820KfK7GLVUjezY2no3WDoJ0P0+c?=
 =?us-ascii?Q?Wi9f7aFh+aanXXpSK6EsvsyFs+hNOHFNXlVXK1m0UNPrjPbO3CqBm5ptHYq0?=
 =?us-ascii?Q?LgGeKHSZLH7XreCZQV7YJ7ZEErRWx3f1c5jmiF4myZoMB7TGF8QrjKnGlkPW?=
 =?us-ascii?Q?c4qjwpEyUMXq/QO/3N4TSkxu7M3VfrAy19KTQCaBbgYP8XJ+2XfpeG8/ww9g?=
 =?us-ascii?Q?H7aasIAGSQXOouUUj8ix9VL64SAJXbIP728EguxAK5sNqh12NtznHZ9eGAkD?=
 =?us-ascii?Q?ney/XZmvcJgXVfb7+ZcCs9WZdNd+PZWs2Jzro7mDvrPcP/9jPuzBrDgXYXi5?=
 =?us-ascii?Q?kRY4DrL3PXprkXPVmgjgA2mHNBe2kIMpwGs8U7zia7DpES9kGdUBdB7BDkYE?=
 =?us-ascii?Q?oSXyOLAHe7EgP5p3ZV6FpI4B6CawttQzvyGbS6bQ7lru9Usf4cuBFLqx5opN?=
 =?us-ascii?Q?8Xx8ULl+aIlhkZZdY3Fws852qFm+8unok+klZVDMq9HNL/ic/lKD/vqeSGxV?=
 =?us-ascii?Q?qblEP2gnU/pTCUQxto5sTqgu4+fmTr6el0XlxTC9TneKQUAYDgWZsd3wGD0j?=
 =?us-ascii?Q?NhOz+3bZXHqM+wv/ZSJ8Gr/E1YkVSjZf6t7jh/skO0m0p81csOiFOFxylSrR?=
 =?us-ascii?Q?7P19puzizPZYxBNZp1TkyJtbBj0fdY1CCuF1GxmvUXSvpIIiYEQoR2ggFZRr?=
 =?us-ascii?Q?FtWARbWgj57zU4qksi4JN46dCkbnJtQvO3+qvZ1ZYWCgV0vxYcVtRPS8LH3m?=
 =?us-ascii?Q?8WXdAOJOBH2IrhjH9BrR8fhBmXP+GerrgjLU3BxHZlb+4Cfd/dGFNOwLWozb?=
 =?us-ascii?Q?l9Z9tchXZxnvvb2nmTJLd8goW1jgqpnJXAN7iwquUFf9tII2ujQIVTt3Q/tE?=
 =?us-ascii?Q?TpoMgQluA69Gn8SWLgpCPIhC/Tz2WFZSeHi4r1qM1u79h6iFPDtwhJ+PMf85?=
 =?us-ascii?Q?flcjb1Wy9+fULl49Nu0bjgf3oS/75yPohS8h9JT9ReD4uplV26Vr/G3JGBcd?=
 =?us-ascii?Q?O8hg8nrr/Q7OIzzAPM/EJkXg4LOsAIvwG4oj/8dvNHxZ79aPj+6LaIsHnC8z?=
 =?us-ascii?Q?oxpfWpomd0Gpv6ngeYsFKH8PLQP57TENOTNGkh4cbxW/HdoKRe2iiq5eLNJM?=
 =?us-ascii?Q?cKYnafP3q2JJhIgh+kfE4ynez/J/OaFJWHBG/tsTCdBLQRvi24Yi/AFHJ0Sx?=
 =?us-ascii?Q?mpyMT/ywaRRz4gETAClKfzMQNg3CNuxBw39+0YOg5zJfjn4UrkPrQgxui+P+?=
 =?us-ascii?Q?VhPDHJeiE5DMRkOi3ucpZJAPc8fwCa5QsFt8N3EGv/pnqBaibkiisfrl1LSh?=
 =?us-ascii?Q?I8Ykyh77a8OQwUxr9HXM7/LQhddcVA2wL0AWhnYi8Ts2NX698fGk+wCHnQnc?=
 =?us-ascii?Q?H9qFj1c+6kGTn3zZNns=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2618.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30916182-77cb-4f13-30b0-08dbf60ee3da
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2023 03:53:21.5333
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W/+H72mS50LS6oUx6z+Nm3g+11qIzQ6WB/SCe3TN8/X5vT6oTz//fT+aOt47V8jXWTx+Y5AGo09W1dvdV/pN6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-OriginatorOrg: intel.com

Thanks Tzung-Bi!

Best Regards,
Even Xu

-----Original Message-----
From: Tzung-Bi Shih <tzungbi@kernel.org>=20
Sent: Wednesday, December 6, 2023 11:33 AM
To: Xu, Even <even.xu@intel.com>
Cc: jikos@kernel.org; srinivas.pandruvada@linux.intel.com; bleung@chromium.=
org; groeck@chromium.org; linux-input@vger.kernel.org; chrome-platform@list=
s.linux.dev
Subject: Re: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functi=
ons for connection

On Tue, Dec 05, 2023 at 09:50:33AM +0800, Even Xu wrote:
> Use helper functions ishtp_cl_establish_connection() and
> ishtp_cl_destroy_connection() to establish and destroy connection=20
> respectively. These functions are used during initialization, reset=20
> and deinitialization flows.
>=20
> No functional changes are expected.
>=20
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

One minor suggestion: we usually use "platform/chrome:" instead of
"platform: chrome:" for the title prefix.

