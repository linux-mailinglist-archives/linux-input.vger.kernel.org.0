Return-Path: <linux-input+bounces-604-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E77FD809755
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 01:38:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23E0F1C20C0F
	for <lists+linux-input@lfdr.de>; Fri,  8 Dec 2023 00:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD81366;
	Fri,  8 Dec 2023 00:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JM3La8We"
X-Original-To: linux-input@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139A6D5B
	for <linux-input@vger.kernel.org>; Thu,  7 Dec 2023 16:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701995903; x=1733531903;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G7bGzHjUVYwhx64MKWEGfxk1JCnjMsLXtoAFCpIeXuo=;
  b=JM3La8Weivk5p+bLvUby8CUsQEHC1hbl87ORl9vX/+j00mvpgvTRNHSf
   r6GgkK0br4GWf/vglOLyctLdiWSvR0Jq3NJuTk7SnwEnpybJmZz9BgLMX
   gvGdMZLP/y1Aj9Sqz85txifTMSoSry7rrfuH2WfV4RASVI8jIbVZcBNCO
   N/Zuvhv2ASk1FJYT3sTvfHEMQH888nsIYYHGrwLXCClXGdrFtSXSteZmG
   JPucEcKptNlVp+qBd51dR7/wnl2MPWmNqV+Ef8bmB9bEuysEMRxOKO7DB
   G2wucVSXm4c4+Zd+Nr0kIUhDfIKz7hEulsSV/1G2POKYNvajdV4+tA830
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397121499"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="397121499"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 16:38:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="775630134"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="775630134"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Dec 2023 16:38:21 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 16:38:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 16:38:21 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 16:38:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=caIKKRYtqUYe9/1+bCMVzk16TnE1SlOjIwx7tEsFz3Mt09SL15q0nrPLA3DbissLGIGl42blRsRGKe0aGx5m876Ve92pfi/rJD+nrWYODEd9uN5Q7rCzzGlU283cEid1DyQlSqGeOSTzZg5oIy08p5C7RiSwIdJutrlldp5VnkhglN0I+J0PfDWku7B9ObsnLGOyIYnPf5VxZzfTZ9sLksQxTi/uSqvQGSeTS8AQHik1rzA1S3juK/mgXnpTkjREwGdwyzOSHb+D7euyejM1wXUJdA0aV9CtEzspddQOaWja39/91wmf63kh0fqOzAxoDazladoUyhWZ/zcMZ61awQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7bGzHjUVYwhx64MKWEGfxk1JCnjMsLXtoAFCpIeXuo=;
 b=OLFd1+hEu8DsLU7d6fSlhyKWElCTsUcDYE9dD9itWqDPYprbVWU0ZTi0f6AJI82Ib8aJd9lFkXgO9pc0yADJfKMFWHIMTf8Ik2UFx4Q6wzLudJmzSE8QPasCXPGPoJgA3SACbUshB3B9NSjW3M9wjkVq+TWk+BKfq3kknjgBg3zlPJlchgowYsBqYwb6le1GGE93Nh+ouFEmOVzXDq+XhqDUTca9n7jrQVGl5aW7Sq5HuUdN/auin2itoPvv5Y2fb+l3qiWICFPazOaKIjq2wSPKw/jUDRjp6OXlFK9MNhqYsKMbPfUjxt1LIG6ksdA8F1Hwsk/8fBWFdigq216Z/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2618.namprd11.prod.outlook.com (2603:10b6:5:c0::30) by
 PH8PR11MB6612.namprd11.prod.outlook.com (2603:10b6:510:1cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Fri, 8 Dec
 2023 00:38:11 +0000
Received: from DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::72c9:baf5:4298:34d9]) by DM6PR11MB2618.namprd11.prod.outlook.com
 ([fe80::72c9:baf5:4298:34d9%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 00:38:11 +0000
From: "Xu, Even" <even.xu@intel.com>
To: Jiri Kosina <jkosina@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>
CC: "srinivas.pandruvada@linux.intel.com"
	<srinivas.pandruvada@linux.intel.com>, "bleung@chromium.org"
	<bleung@chromium.org>, "groeck@chromium.org" <groeck@chromium.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>
Subject: RE: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functions
 for connection
Thread-Topic: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper
 functions for connection
Thread-Index: AQHaJx2uw/KO/zzP6U+uHdhDNt8IrbCbm6AAgAB1rACAAn4CgA==
Date: Fri, 8 Dec 2023 00:38:11 +0000
Message-ID: <DM6PR11MB2618C7784CF94041F1EF0B00F48AA@DM6PR11MB2618.namprd11.prod.outlook.com>
References: <1701741033-26222-1-git-send-email-even.xu@intel.com>
 <1701741033-26222-5-git-send-email-even.xu@intel.com>
 <ZW_rdCJ7EdtmJYFz@google.com>
 <nycvar.YFH.7.76.2312061133470.29220@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2312061133470.29220@cbobk.fhfr.pm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2618:EE_|PH8PR11MB6612:EE_
x-ms-office365-filtering-correlation-id: bc5e030d-e5e3-4855-2767-08dbf785f527
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J3OZ8lr9JfFZaLx93U/jooTYAHW5EhG7cXfH7jA4Qh2U664gboKg/MT47AF/h8QwHomp9Sx/BLaN3CX9UAAPozDH06A7olrSPGDnQlXOz56XdqjMuNXIEvcJlsKb7566Eo0wMTrxYre0Vn/kzEuu28HPjgeAlZ7a3J/5sbHMjG6a6fa2+vfCIvYKTsEf9KaUey/WOoyxzc/y4CY4KN5Mge9bAGs80ZZ/FznPt6UZ/3DjnJ1CLtZAfrROKruqE3sVuiIQ7zUKojn3sMplk66X0NoBUTKKTmiJw6xONA5CyW3cCtndMg420sz5LMKpADlvqo8zxaXSLr7jqPZQabkBzfU5X/uQnwl2pybZ0S5L4LmOCSYh5jBD5MvKAWbfc6YCTQ+8mFuzbuVonz3Xi3UR4pyGFSqReZFErv6Hkk5Z5CMn198EPLUyROMvwG5o6EuPZvqS9Ae8PViAWMSpyOMSmAiJdpVWjNxSMtItyFj/IgiPY3z9GZloibUtEBk1DQ4VxPvqjn9qt6w5KU9oKVOEHD9nL7+B/sUNiiCJvYqMmfwhLn6hjXE+cKQ2rsa3/RsxawlOylpiF0PVBlEW0Yhl5YPAwYJrC/lk7JNuI6peqNsJu2PQabxnxID1Tz2pFIAD
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2618.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(366004)(136003)(346002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(83380400001)(66946007)(76116006)(38070700009)(26005)(7696005)(52536014)(66556008)(5660300002)(66446008)(110136005)(53546011)(66476007)(54906003)(86362001)(4326008)(2906002)(8936002)(41300700001)(33656002)(316002)(6506007)(9686003)(71200400001)(478600001)(64756008)(8676002)(82960400001)(122000001)(38100700002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZFARH2KhrMN9Thx1ZNvKSbLsr70jurhMf2oXIFMwOImJc79s0t7rEysv9gAA?=
 =?us-ascii?Q?DJrjTLqAqb3M9CUusDvffHOdv1/UkWTKXnRmKUwUp7zE6nboQTu6NRbys/pt?=
 =?us-ascii?Q?QK4nWIR4xh8CPr15ucyY4VvtKcjmMibt2IfSqPbkC7uhf9eZqrSDRaU/utBS?=
 =?us-ascii?Q?OovqAKKhMkw91vK7XL+ngStE4EMlXlx1/xQg4ilv9LuX2kZcXjO0zBPBFzNG?=
 =?us-ascii?Q?FG+6MvkD5x93WAqRLMXen02A1IvQ8c6+NBPzeQTQsrpbgcT2YkM/Hu79iFo8?=
 =?us-ascii?Q?CLqyNiIk7SQdeLe2pI90phlTZCF/Tl1GDbRIPT0s/XtqfX1iMrWNlmSDFac6?=
 =?us-ascii?Q?CV8o0in9iRQ45WPtxFrn1N3qt/v4+rr+XN7mBNrHbSO6b3WfIqZuPDOabUgg?=
 =?us-ascii?Q?E6e6LIBd/c46XpMic5vuu1vALaR9W40TaJw62Rdj06AqTs0r225Y1NR9hNa8?=
 =?us-ascii?Q?lr259o4GDULwDE8A8+TqEWUI1uD1z4UYN0IS92T/6Y+NvtQC9X+RDo/uX1YD?=
 =?us-ascii?Q?gEb8FBbFu1+5yjrFbw/7PBxLLKbonHm/Sy2KqH+5yMAMV4XL2oqo2TOKz8YD?=
 =?us-ascii?Q?0P5u2766hroH+I1FwyYDFNWBh4ecqAu0+NrUcMTKAecQ8Mc4lFRzt94u6dwm?=
 =?us-ascii?Q?C4Ehn0DbdtSPWHqjzyvTxaZmFzmEYTB3JDUg+8vaxnQUqV8zP7GZZX00dOky?=
 =?us-ascii?Q?huYt+2kN6f8cv1lT9PWXss3qPg5rXQ9sYfDKFkaEwspsijdMi7H5WbrD1vxS?=
 =?us-ascii?Q?PONRhPczb/4ABqOOmlP3XXf01DX0qJJ5+Hxs867dOUEQmko2JuFMtSqGFLtY?=
 =?us-ascii?Q?Za0anpTf2XUPrE+nHH+6YrxMCCdIqopoXanZGwdMuX5JceQzw+R9ib8wPRuT?=
 =?us-ascii?Q?0iivYeGBOI3raYQ6HaObnoIh0T1LO/bZ0qoaOr9koZSngdr5ex3s3rnyi2JT?=
 =?us-ascii?Q?784KnJZGWOsrFlzqmFd4ADSUwZ6GFgPg3hQAw6mE/pQJ4kc1OzDYgT+ewqe9?=
 =?us-ascii?Q?HQZIeEKDcPRT3DEK6qGiwHEbuI2F1f1Rns/uCzsWXFmV/SgMN5U2ImH4C1+o?=
 =?us-ascii?Q?DpjtgaIessxwu1y9aQKhnZWeuA+U2ujN86NjHUFHLyyB8xO38ZeXzgXq8Vtb?=
 =?us-ascii?Q?2oL+Sqzd20VgKLl6DGUKzKKrmbFYa2isBqSeCO/E6iPmRPb1S8BQVhWcC6gk?=
 =?us-ascii?Q?nC0QtIpJ2Na2S6xQNuJXZWi98ZrZn0vDvoY5lAnF0TBEqcIy96Ta9HvgE7vF?=
 =?us-ascii?Q?u3Puv5qxAiP9EPHVJ6fla48hxUUuTkK1SYPvmR+e0DEyvUdMGTNyCcex6Wfd?=
 =?us-ascii?Q?iy+NmRQs2vVp9brQ+2HnDeg+XPuH8rxl7sjNanIfZC0Y32Egsb8u0EnfUtDw?=
 =?us-ascii?Q?q7bLkkdbmDwTOVRIzXTq46p0m5ala10wQHUG5AmVqIGWM9drC5pX7mRBW82M?=
 =?us-ascii?Q?c5SM7FlhqLtsNHI5Ta6ERhkD/K3ZbbGagOkryB3OPa2WHFCXfll9cRZT2oLN?=
 =?us-ascii?Q?pxpHfI0DoR8oKlI+2c9/fgKuTk3FtYh65eWf92jWEdrnPCXabv4zqUedclen?=
 =?us-ascii?Q?iVv9HzHkXyGgrkt0nJg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5e030d-e5e3-4855-2767-08dbf785f527
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2023 00:38:11.8230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zb0XcVjMzJEBrkncmBkP6XOhRVcDjaHGzYDhtxhJ3XtoDs92Tj7RJKiQP24h+P9StP0CLTEK5WaGgv+zF5hN+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6612
X-OriginatorOrg: intel.com

Thanks Jiri!

Best Regards,
Even Xu

-----Original Message-----
From: Jiri Kosina <jkosina@suse.com>=20
Sent: Wednesday, December 6, 2023 6:34 PM
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Xu, Even <even.xu@intel.com>; srinivas.pandruvada@linux.intel.com; bleu=
ng@chromium.org; groeck@chromium.org; linux-input@vger.kernel.org; chrome-p=
latform@lists.linux.dev
Subject: Re: [PATCH 4/4] platform: chrome: cros_ec_ishtp: use helper functi=
ons for connection

On Wed, 6 Dec 2023, Tzung-Bi Shih wrote:

> On Tue, Dec 05, 2023 at 09:50:33AM +0800, Even Xu wrote:
> > Use helper functions ishtp_cl_establish_connection() and
> > ishtp_cl_destroy_connection() to establish and destroy connection=20
> > respectively. These functions are used during initialization, reset=20
> > and deinitialization flows.
> >=20
> > No functional changes are expected.
> >=20
> > Signed-off-by: Even Xu <even.xu@intel.com>
> > Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>=20
> Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks.

> One minor suggestion: we usually use "platform/chrome:" instead of
> "platform: chrome:" for the title prefix.

I have changed that, and am taking it together with the rest of the series =
through hid.git#for-6.8/intel-ish.

--
Jiri Kosina
SUSE Labs


