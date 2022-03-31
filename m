Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D14C4ED0C7
	for <lists+linux-input@lfdr.de>; Thu, 31 Mar 2022 02:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352074AbiCaASj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Mar 2022 20:18:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352076AbiCaASi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Mar 2022 20:18:38 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91E7A58E47
        for <linux-input@vger.kernel.org>; Wed, 30 Mar 2022 17:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648685811; x=1680221811;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ew947qZNvPc2yQZj+mqNMg6X1myIrQrWQg8HR2HUl9Q=;
  b=DX9tygjAqHtV0+IPhK8zAgLV45PNbZE/x+3SMY44iiZIyOrvTD3a0M50
   yp5rfm/0Thc/zovZ2Vd8+AL46dSGOshrmBiqCa5772o6Q+isiTvRnF2+2
   nrMOK8zOgmYSJ/R0cpXIyNCGqMLoZ48JAsrJb7y/qkUIZBoFTv7nkzRRP
   Ml1Fm4cz5tvQM2UFjWr9Sk4gCFi4sjS5/kNkvKAwvb4IlKXRVGIRuu6CQ
   teRBfKz9Nx9GrgRswE62JdOpfkUojJNn0jkvn3TFL+8axRWSai+7kB3Z8
   hdE0DOHR9368zljyCmjJdT1USCGu1RBrbbuSshwIdolVaEbHXmTyY5t0P
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="258507408"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="258507408"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 17:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="547064123"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2022 17:16:50 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 30 Mar 2022 17:16:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 30 Mar 2022 17:16:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 30 Mar 2022 17:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUPcReBwYJNguS+i6ooKp8u1+EoV4BUUSIogVzWUlFj2kH28odnwteQZH6Hjdm/8YXwAPzezrxRWptL71wPkjp2Glv1WOfew6itDsGn/8M2OlvwM+f5mbpMc1H7EjJJpSdi9PTVglt86Z8IEVcmQRfgiMyWBtDI7JVl/4ejoiRx/mUijw5ZRymRkq098Bq3NAZUs3/7oAuVdOi11jr9FeyPrBj4BiTdHR1LrAO+Xds0YvfMzGqMpeNw3t3SXuj2souZrzvKrvtZQ4DsuPRnIijTEfmMP2YhsY/JQfafa6Vvn0nfWyC9nWwTYIeuSfhDtmsQZU5Md6mxSvxDuV0N+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ew947qZNvPc2yQZj+mqNMg6X1myIrQrWQg8HR2HUl9Q=;
 b=WCsiXqsFUNT3c0pPXIlc7BFoG8NihcouJr9/1viY3yMmo5Pt9zyC5b8+XIZi2OJgDl/JkkahESwEkkICiHgzdbb86QTmGhmVpZTrDSdP/7zR0DN9b7IU1SiyeSZcIuPQyWD+8poxPY7qWd9c4kwPKduMatFwbdbvniXJAssyM7MqbO4XCj+S+xwC6N/HpTsMJV7aEIvYZzGYY8beWidVnqR9c5XoGnEgZs+337aaO0pCLqC7rWr7ZEY+srQEETEGDsIFZ7GVC6LXIBL6gHTtmKQL+PlBlJCR0ohe81lXvMZ/dHbZLcvbjCzGEK731QvTnMOKTxll02Vr3cDaIHOMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2618.namprd11.prod.outlook.com (2603:10b6:5:c0::30) by
 DM6PR11MB3529.namprd11.prod.outlook.com (2603:10b6:5:63::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.19; Thu, 31 Mar 2022 00:16:46 +0000
Received: from DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::3421:4910:7285:57c9]) by DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::3421:4910:7285:57c9%4]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 00:16:46 +0000
From:   "Xu, Even" <even.xu@intel.com>
To:     Jiri Kosina <jikos@kernel.org>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH] HID: intel-ish-hid: ipc: add ADL and RPL device id
Thread-Topic: [PATCH] HID: intel-ish-hid: ipc: add ADL and RPL device id
Thread-Index: AQHYREJkcBWAcT+Bj0qeU38GeSsiVqzYCvAAgACVmnA=
Date:   Thu, 31 Mar 2022 00:16:46 +0000
Message-ID: <DM6PR11MB2618E0803AE022882B662060F4E19@DM6PR11MB2618.namprd11.prod.outlook.com>
References: <1648650465-32730-1-git-send-email-even.xu@intel.com>
 <nycvar.YFH.7.76.2203301720300.24795@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2203301720300.24795@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.401.20
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e5fd1b1d-0279-4b5b-56b6-08da12abbe12
x-ms-traffictypediagnostic: DM6PR11MB3529:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3529474601790B813EF2DE7AF4E19@DM6PR11MB3529.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hHNwnOmZtvXkgNDEiXZHuMZykw2USRpCQStctBXAgjdpiOVAq66aVRW6JjjPigRDlQWnLj9yvnpXMSiN3TBbRgoV3rpgez54XxXkwfWFs2YEW/8RPX5WLQbOI2SzXJv0jWrMUKgDzwBc2g9Lg3p1pA68PBCilWnHu/4uRh+XwvBrnFbeagv12GRcmffoqTSuEMnnqJRRMOqgPVcjUsBxMIA4p1eEhC4BYcXLiaZ+Cayk99eDT39pzEaXmVgLtT1WIItl1JiF/Odnm1bbtq0l1KdC/8D+lZSK0lEf22fXFEtkJZ8D8ji4ZtBiTdssqzDyPevgkNB6MWZpJoxZk+kh3CMohpPiqGrbpCcWvh0abkf/a/AqYGxr4RZt48lTCAeeffcfaw1AadtWuEzzzJzcvGpOpituiNQ0snBQ2YrMO6I6BuZ0jX1edsWkHfxTR/ic9MYdlP++EiH5WoD8cPhN0J5npdYX+iNZc6rx93xTEtVnABimhKYGDH3HvZxbCArxl7732VCKadOLPCs8XYnEIWnxubs4smvOpUpku8dRtikuXAS9USByhQ6nX1haG9VPrNObJ8Br4MLrw+20y38iw6cFnfs8oOrJefkNDNW0MShPlaprLiZ8D4OlPeQS9TI6WJrXfXmFyjKfEJdYr9JtvcHHRRyWDF4zxcc30sAkbVyy/LrBfnw5Mkhk4V9NPoD1ORDLgHGPZLVqBP5mjaC04w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2618.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(54906003)(316002)(38070700005)(82960400001)(6916009)(33656002)(122000001)(55016003)(38100700002)(66476007)(52536014)(6506007)(8676002)(7696005)(8936002)(186003)(9686003)(5660300002)(4744005)(76116006)(66946007)(64756008)(66556008)(26005)(86362001)(4326008)(508600001)(71200400001)(83380400001)(66446008)(2906002)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cfMrsoA4EeGjaNQoHkEGRnbixem1KcoCO1VbxPsnZ5cnw1KLJUhW89HHDdkw?=
 =?us-ascii?Q?5989svXKOcE6jVTlyzGEdR6kH34x/N5SNzBpItYcoxV9Ef7/URG57fomq6p7?=
 =?us-ascii?Q?8ssoWvYMqPLjLG20Bse0eh27dk2pgz+ZDds9kqtJz7fTFfWwITi5n1YTeRP+?=
 =?us-ascii?Q?ILwwQsbbIxQDeQqwg1ydMuv+GsW9W1hiyfheNKCCj9422gY5Fc4dSYRb8Mm0?=
 =?us-ascii?Q?98E3eMRWcmBnixF0r+ctMMjBLWMPZXV6s0rSaFzI0VUaPsMyZO3pLPdCxbdz?=
 =?us-ascii?Q?gzh1PAOxz1nSXzwO5aQ36VPiOL1gUIJ8gMOReIE+dLdEVcKCy5hjnIx5inhG?=
 =?us-ascii?Q?KOPm14Y5MAvGGGZP8IHgMXjxIrykB4Z5MxIjQCAIkSo7Mz+QvTmWXdXN5ItC?=
 =?us-ascii?Q?5hGaTOTx1ssaU8soGa4N7qiQrMdylBgXdKSpL40tJjvKokVnugzbXdIkm+7P?=
 =?us-ascii?Q?DCayLcL+xn+QGg15r9PEQuvklh38HNTxdb72xYFR1mrcSObIPs6xCAAgj4YL?=
 =?us-ascii?Q?EMZaiqazVZVBFOknGnMH5p4dCTR07wgrMMDDT6oQoiI2ZchoxpCSGeSCrU3I?=
 =?us-ascii?Q?Zv3uTnOm90K6I0/E+8xCfbR66xiiJrFoIcjqqOFkSEj45nou9qU54znnrNJb?=
 =?us-ascii?Q?Qx9hMlbTEw5cZGMO9MheCbL0qRQuUdx9+5MCXn9+kNXOKvMfF1mUbJc4XOiu?=
 =?us-ascii?Q?1BC8hCUq85fIYenzQ1YpxinIFRwEBrfqUaDLB868MgZUOkO0UaqnrYbuXnoO?=
 =?us-ascii?Q?qMdru+wYw1BKBESLbxwESW3ZM408pMEFjefv1sETEggsFlwxX+atSJOOEXZ4?=
 =?us-ascii?Q?/7eslsp+EmuTrNuexFI9YaMu8pN+CHCOYICngnHA+sMQZt7nTAV8qSyt0sGz?=
 =?us-ascii?Q?x8adc7D8z6A2kpGBle/h+Pi7es+XYWJu68JkVezkM9anudRTiz9O+HIF68KB?=
 =?us-ascii?Q?GTsnRA2DuBLltxpPBU6JPheTdnBmLDlRHR1aAZjzeA4b3kXoJpBfy8dGvnw7?=
 =?us-ascii?Q?MmVQIluGIuy7qD2axxOCuQxzrwwGeD/uj2O168Epcwl4WHAu/QRBH8mVpttf?=
 =?us-ascii?Q?hN/p3po+LwyMp0ArERtD4KzkwgHmTTLgLUv7aSf4PpPVxgfRBjz1ekRzSmFm?=
 =?us-ascii?Q?kIo+M5djJnz8912CM53XrtEnrWoNy/O8cAt73yoLsig3KXal3RGZ9S7JrK/V?=
 =?us-ascii?Q?ke3HbeLgyMf8yBPUAHcPTe464vI9sSpUzxY6LewKcYACDVojnVis16iLmOzw?=
 =?us-ascii?Q?Y/cwGY4AD2dXqh7BdNlbylFP14t8ibeNGpRu7eXtiWEoL34Ip8wUd1MXGtlc?=
 =?us-ascii?Q?17CrOTSVLkFYoUA7igaMLKlUzqWbvyiOPnSGoUhz46bKbMkseu6lAfQCnnQn?=
 =?us-ascii?Q?87OHs4jDZEUr29nbeAa70IJfhFdz9Y/vZBZE8fAve7yNxGlvhcffSpmz1Dcx?=
 =?us-ascii?Q?TtMlYPfGT9GbjuscZ9fAfTENWyyuKcDAqyhRN0bND1TpUInF0QUfAjtuHVAY?=
 =?us-ascii?Q?WpkAQ8lMGcBN5Hpx52vBM7FEdK8GyAbUCwacmGeoYQC3JXC0SjyfmoQmyBHa?=
 =?us-ascii?Q?oPCrR9G19kOYfWQAbfQfhT9vXLlgEHJn3lPLVIwQ4eACmvxqpT8bBFQA8ly7?=
 =?us-ascii?Q?5iic4TlvJ91kgs3aGVeCkucJDBO6DxWatxgtdSZXgxYjDLzdpelpQtx/wzUO?=
 =?us-ascii?Q?b0+AZXZlAS6KHjyVuOTL+5NUNeSWsFseO9NPVKAGec7MeYFLJ0vHw5omwGiW?=
 =?us-ascii?Q?va8aZn40jw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2618.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5fd1b1d-0279-4b5b-56b6-08da12abbe12
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2022 00:16:46.2989
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGlT4t4QkHXHvKu4O7A3dsspHYiEjWCu6Vjw4O0tezTmQ3jFud1Msv3Z/K9ZsWMzebSARJhC/8uYcKZCG9hxyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3529
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Jiri!

Best Regards,
Even Xu

-----Original Message-----
From: Jiri Kosina <jikos@kernel.org>=20
Sent: Wednesday, March 30, 2022 11:21 PM
To: Xu, Even <even.xu@intel.com>
Cc: srinivas.pandruvada@linux.intel.com; benjamin.tissoires@redhat.com; lin=
ux-input@vger.kernel.org
Subject: Re: [PATCH] HID: intel-ish-hid: ipc: add ADL and RPL device id

On Wed, 30 Mar 2022, Even Xu wrote:

> Add device IDs of Alder Lake N and Raptor Lake S into ishtp support list.
>=20
> Signed-off-by: Even Xu <even.xu@intel.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Applied to hid.git#for-5.18/upstream-fixes

Thanks,

--=20
Jiri Kosina
SUSE Labs

