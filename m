Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF7873A74D9
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 05:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbhFODSX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 23:18:23 -0400
Received: from mga04.intel.com ([192.55.52.120]:24732 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhFODSU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 23:18:20 -0400
IronPort-SDR: 12c6YO3Xv45EVfJ+28yYU4e59doU3EPEnCoveBxsEydkbdIqJ12vNvOoHIb+DCAxrNeCsNaI9C
 DWfnaGATRIsA==
X-IronPort-AV: E=McAfee;i="6200,9189,10015"; a="204074410"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="204074410"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2021 18:22:01 -0700
IronPort-SDR: 8AIcktzXJOtAXjas+Ku0etzCqVUdSGEhLyVPa4KehbyGddKeaa699Bq02ZbKOSK+F+9/4EWB4Z
 N7oAzPCvW+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; 
   d="scan'208";a="553531003"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga004.jf.intel.com with ESMTP; 14 Jun 2021 18:22:00 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 14 Jun 2021 18:22:00 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 14 Jun 2021 18:22:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Mon, 14 Jun 2021 18:22:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Mon, 14 Jun 2021 18:21:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWPQoqXgsaAwDTbAFhOLthq5AMqeLxquYGCCMGjcevZ0/5eP0LRkvfoGhGQCIfJgfuJX21MwfCZI9EBzFGbHPRZk2ya39WJiTI9xWdZnGPab5Ff2GWSH4gJq5AX/yMlFU5j5pSIDub1A6e65GIfdwgUa1yggSaWssjiV/X5ahrg/WcC4/Iwajc90rB+SndPG4JQUcRGLjkcUSKeTwBcqKssHCZrtpBxMHWN0cn/DwFIJPphzJn39uxvDOtIWJhp8Kod7pu+Kk7i4hen9LZJq0QgiX0/pedVB4ja+BbeHSBgQgn2tguqJvkZHwaJoa1+WGjBytLvtzwqrHg5ax9eIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFW3y5wrHHa/Dm21o+vr9yHRspdfgThWO0ZH8nYlSJE=;
 b=OGZ0Wz9uycxdz9mNn+5IWOyn5wnLqRTw1dRYxZ+iU0gJtpt/ZBWy9w2O3i1X5DiYMbF+TPMdc40+3OIRbY2BP6vYbUDPihlPqgXdgqWGGnkkyNFxmSVAE/XuNqUA7bv4ErRd+7OzOgguOhlc1VIAU0+yUwhrBRjZ5cfQJlGDR6u1NXC4xLxXe7Lz+xfBmNrxtWGRnOIMx0supwtzsC/Jcx1Mm+E4bojm+l5tOK4gsuET24aReoqPVzNDU4lyb97Q2Jfw8ACOyJvcnud3BuLVHb2hxaetk6I0iI8ZcO9lbtJpUaq9rtSiFZr2oj91zLgThFyhx9IBd5NkcmZv0QIHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oFW3y5wrHHa/Dm21o+vr9yHRspdfgThWO0ZH8nYlSJE=;
 b=At7fJuulNR9EywFbOcMOoxo17ZKqPHCVaYQ8WLRcFygdDkiY4t/YCQ/9NjhUT0deokEdSIzknrFM7ZqyvLXSdVmkICSIEQ2uzwNUX94Q9U2/hC8+yN1VO+nJD5HXYItJcIFUp3W59Gg/oac3Ptl/xb3gdC6p8LpVQSJFF739YaE=
Received: from CO6PR11MB5601.namprd11.prod.outlook.com (2603:10b6:303:13d::7)
 by CO6PR11MB5668.namprd11.prod.outlook.com (2603:10b6:5:355::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Tue, 15 Jun
 2021 01:21:57 +0000
Received: from CO6PR11MB5601.namprd11.prod.outlook.com
 ([fe80::cc1b:b997:93:6616]) by CO6PR11MB5601.namprd11.prod.outlook.com
 ([fe80::cc1b:b997:93:6616%8]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 01:21:57 +0000
From:   "Xu, Even" <even.xu@intel.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH 0/3] enable ISH DMA on EHL platform
Thread-Topic: [PATCH 0/3] enable ISH DMA on EHL platform
Thread-Index: AQHXXcDwEYinpxe1nEG94xx7NthWgqsTjm2AgAC/hVA=
Date:   Tue, 15 Jun 2021 01:21:56 +0000
Message-ID: <CO6PR11MB56015263E483EA550B816FDEF4309@CO6PR11MB5601.namprd11.prod.outlook.com>
References: <1623306114-19208-1-git-send-email-even.xu@intel.com>
 <nycvar.YFH.7.76.2106141555350.28378@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2106141555350.28378@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.143.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3443023-b772-4cab-b49a-08d92f9bf79a
x-ms-traffictypediagnostic: CO6PR11MB5668:
x-microsoft-antispam-prvs: <CO6PR11MB566833703C9665A674B88DD7F4309@CO6PR11MB5668.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wbFAwW+ngrdjYKkydiUgwtDkW972R9Yg94DvwD5Bt7d6erNcKNmAcSjLe97YgAdZol+abayvZNABNa74Vsnftf00VGSh7zd16gVp65KKwwVokMAyWP0VnoqbYgFXIV29X4NiYEjfKs+vYipugMoqCzZwhCGWwodS+hfd2p7LrIhKjRTxt+lUfe7sQnJakyXLkGfy06IlN8+/JN0Aj8R5lBy5OqN+56n3QsfJtNAEriYWLHXplvt0crA4RdSiwzmvxH5Vqbu0rfJd78oAqrO4eQCry2G+XsPZwfGdWV2y4VRG196AkT7bwymRCaEX8c6rbQlXx5Rjn2WKVoJJfZGkskXjNzijz/R4IhNUS2EGdRp8NLl4+wycXTR/FcFL9O7bphAThcTbuQlKgfx3o104npMal+wbtPywkPdl5ydhoEE7m1Ml4ewEIDYGskjtchhjuORuYtuuHmF320dm0Vc+lf8qm4L1h3PDZh/u9dkcl7Pgds6m3FkoGWpncuh3HYOw/57iL6As6qGdzOdB8wNkFincsIqmXtRfxruOe2lqRiSCJu3j05gU7wUoqZBXhxQcFpaDC7dwzNTFG6g2SLJU30pcfrNya3e/rTueoFCXUsk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5601.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39860400002)(376002)(396003)(38100700002)(186003)(122000001)(76116006)(8936002)(53546011)(6506007)(4326008)(5660300002)(26005)(8676002)(55016002)(54906003)(7696005)(6916009)(52536014)(86362001)(2906002)(33656002)(66476007)(66446008)(66556008)(83380400001)(64756008)(316002)(9686003)(71200400001)(66946007)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CPqtlNEDYnnRt5TxCp4ZkvGZuK+cpPP5JWQcf9gATvccv+REi71uAEVA3S6i?=
 =?us-ascii?Q?GFG1XMXZjYg29UHs6WogV/f0VgXxR9mDS/SoRg69/nw8nt766GHo5DSb5ged?=
 =?us-ascii?Q?szyeR9yiHEzWj7ApkQECUYrvWlnX5sfvtV05iDMudMuAm/qvfKzDM6ekEQBC?=
 =?us-ascii?Q?Gu9/hhvw4B92GrwSZvSdacurK+o6SZv64hoFwzoOclDRTnxlOBmbLZKT6EBL?=
 =?us-ascii?Q?yG87cJ5L7XtolCz8W/aFZLopkU+e1VQ3Wyp4JERtToG0yPy6xx02jDpYmt0l?=
 =?us-ascii?Q?5wLvG+D5WcucsdqnRlRm9rv+TPTD8XtptUy1QODu/pCAH8MBSpQDQIWs10Rh?=
 =?us-ascii?Q?ygAlQiXgS3Q9rMOGNlqRZ9yL6yVWKq5FPEzeO3LQHtmFvCS4LgGdU0HNvJOQ?=
 =?us-ascii?Q?Ob48mk4N49tr7e8EyxmK/F+QwzI8ymma/GjEdSXKakx9ODscdbQQ2tPcqK+T?=
 =?us-ascii?Q?uEVDNDPcboZlqFn60BCYhPMGmhJeBAFnodLJEhFIjHtdKyJkn+fshExh05Qd?=
 =?us-ascii?Q?fSYNBd74jwO8hrkvY9XV5nrhQWUFVjkUk73ZxcIne0kAUs98VixXmsj3Y59Q?=
 =?us-ascii?Q?4pmqBd5uBJ2yuk8DYwp9Goum1WSiMPLnoc40mKJFroHz1n5sn36u/BMllqsK?=
 =?us-ascii?Q?mAV5/8xAPHUZJxeo/be5Nxy0NRhy0T8AkyAevhOSA6D1rEYSpNj5ot/O0vow?=
 =?us-ascii?Q?ZW701BhPFDY9ph8ArslO5EhwvfDp0MK1MWt1+dCeXNP3LdfToIMDa8x1AWiB?=
 =?us-ascii?Q?3w2xbWA3163sLMDh4oweNhPwB5+m+EF0lFPU+fs1qICSuYN9qrNd4c8mA9i1?=
 =?us-ascii?Q?BK5wkbmvIwUs5FUcfFkO5ozYuXfhBoHT1WiltwyfjvHk+5MNiI9TzNkejFu9?=
 =?us-ascii?Q?b5OrrJNTiVefnHJp7uec1NBKO8Ve4Bl2a5bDbiBRwjsF0ts7hB12phr6KRUu?=
 =?us-ascii?Q?SxW01ELggJlTN5aUpI8Mzkcqh/layCIZaGPAG742DjELwLVWY79H+hrcRSdZ?=
 =?us-ascii?Q?Q5oxAnp+zthMHgLTf0GUNmppOzPY3+guXGDI0AVJIfh89+Xqh7LIKa8dBfur?=
 =?us-ascii?Q?2dGGN/aq9+l2oEEXB8Nijg2aK1WBRkS0nf5Ly7QW/tEqZOjpQgw1gj2fSPsc?=
 =?us-ascii?Q?hT55JGjnYQ8ZcxjQv1CC4gPUqFAAvsUzxpl0VWIagq0o0JXns0d9eySo++rN?=
 =?us-ascii?Q?zcIP5UT7USlLpVRhFinWpIMpFLLpcZMEl42bzEglsxC26AfWRUyovodzCto1?=
 =?us-ascii?Q?BCDHNB3RaGTv4rHq8d+vYYteQ3x8+7HWWp9MB8TQDQS6BF5TUYAtxs6gOgJs?=
 =?us-ascii?Q?66O4GgmXiEPXTaT2qJHODw67?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5601.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3443023-b772-4cab-b49a-08d92f9bf79a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 01:21:56.9267
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnzWE3rIGT4Gd0vbEzgOdzMpZH40/f/iVoAGKcspMh7FJZWgnhxOaabbjg42BE0KisEvaSOWGocQjfCTGcTOUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5668
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Got it, Thanks Jiri!

Best Regards,
Even Xu

-----Original Message-----
From: Jiri Kosina <jikos@kernel.org>=20
Sent: Monday, June 14, 2021 9:56 PM
To: Xu, Even <even.xu@intel.com>
Cc: srinivas.pandruvada@linux.intel.com; benjamin.tissoires@redhat.com; lin=
ux-input@vger.kernel.org
Subject: Re: [PATCH 0/3] enable ISH DMA on EHL platform

On Thu, 10 Jun 2021, Even Xu wrote:

> These patch set are used for enabling ISH DMA on EHL platform.
>=20
> During ISH DMA enabling, some platforms (such as EHL) don't support=20
> cache snooping, bus driver (ishtp) has to involve a new callback,=20
> dma_no_cache_snooping(), in hardware layer (ipc) to get hardware DMA=20
> capability.
>=20
> When do cache flush, clflush_cache_range() API is used on X86 which=20
> isn't supported by all other archs (such as ARM).
> Considering ISH only exists on Intel platforms, adding ISH depending=20
> on X86 in Kconfig to avoid build warnings or errors on other archs.
>=20
> Even Xu (3):
>   hid: intel-ish-hid: Set ISH driver depends on x86
>   hid: intel-ish-hid: ishtp: Add dma_no_cache_snooping() callback
>   hid: intel-ish-hid: ipc: Specify that EHL no cache snooping
>=20
>  drivers/hid/intel-ish-hid/Kconfig           |  1 +
>  drivers/hid/intel-ish-hid/ipc/ipc.c         | 26 +++++++++++++++++++++++=
++-
>  drivers/hid/intel-ish-hid/ishtp/client.c    | 18 ++++++++++++++++++
>  drivers/hid/intel-ish-hid/ishtp/ishtp-dev.h |  1 +
>  4 files changed, 45 insertions(+), 1 deletion(-)

Now queued in for-5.14/intel-ish, thanks.

--
Jiri Kosina
SUSE Labs

