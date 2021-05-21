Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6DDE38C16E
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 10:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhEUIMT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 04:12:19 -0400
Received: from alln-iport-6.cisco.com ([173.37.142.93]:49160 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236502AbhEUILX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 04:11:23 -0400
X-Greylist: delayed 458 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 04:11:23 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4304; q=dns/txt; s=iport;
  t=1621584601; x=1622794201;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=Zw1UYU9pVOdL4NS+TxTOEuzGoUPtEZZ50ofLh69FfIg=;
  b=UG+2CqTRKYMpBluI4uJUhH3dbLR45FUO/TqAGy53dzzp2Bex136zO1g1
   aQ1rQpEG3HYEcDo0moQSG0cSKZoZ+PHR4+lObfLtWtFHxJ3nY/FeMjDhi
   3eaypiDzxuvd/qVnCljTJjhEA1fuxThFwDpPbToM7k2cufiYU+K9SmV1L
   c=;
X-IPAS-Result: =?us-ascii?q?A0AYAACfZ6dgl40NJK1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?UMHAQELAYFSUYFYNjELiAcDhFlgiHqZdYEugSUDVAsBAQENAQE/AgQBAYEXg?=
 =?us-ascii?q?zgCgX4CJTQJDgIEAQEBAQMCAwEBAQEFAQEFAQEBAgEGBBQBAQEBAQEBAWiFU?=
 =?us-ascii?q?A2GRAEBAQMBQAEBNwEPAgEIDgouMiUCBAENDYJpglYDDiEBnhoCih94gTSBA?=
 =?us-ascii?q?YIHAQEGBASFNBiCEwmBOgGCeoJxU4ckJxyBSUSBFUOBX4EAPoEEAYJ1SQIqg?=
 =?us-ascii?q?yGCLYIHQ4EFkQ6PCoEpnS8KgxedZxGDWpE9igaGK5U5nx+EdAIEAgQFAg4BA?=
 =?us-ascii?q?QaBVDmBW3AVgyRQFwIOjh8MDQmDTopdczgCBgoBAQMJfIc+AYEQAQE?=
IronPort-PHdr: A9a23:3NuIpB2p97fiCReBsmDPT1BlVkEcU/3cNBMJ9pc9gahJbuKk5Zuxd
 EDc5PA4iljPUM2b7v9fkOPZvujmXnBI+peOtn0OMfkuHx8IgMkbhUosVciCD0CoJuP2cyEgF
 t5FSBli5X7oeURQEdz1MlvVpHD65DUOGxL5YAxyIOm9GoPbg8mtke6o/JiGaARTjz37arR3f
 32L
IronPort-Data: A9a23:YkpCRa9zqj7Fe/ZXMc6jDrUD8X6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GpKXjqHPKmKYWWge48nbd+09EJQ6J/czd9lS1A5/ixEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFC23J5Pljk/F3oLJ9RGQ7onVAOqmYAL4EnopH1Y8FX5w0UwLd9MR2+aEv/DoW2thh
 vuqyyHvEAfNN+lcaz98Bwqr8XuDjdyq0N8qlgVWicNj4Dcyo0Io4Kc3fsldGZdXrr58RYZWT
 86bpF2wE/iwEx0FUrtJmZ6jGqEGryK70QWm0hJrt6aebhdqi3MAi58FC/Qmb3hSuzeVsspa0
 /J3usnlIespFvWkdOU1Wh1cFWR1OrdLve+BKnmkusvVxErDG5fu66wxVwdtY8tBoaAuXTgmG
 f8wcFjhajiDjuSt3r+hScFnh98oK4/gO4Z3VnRIkm2DVKh4EcmcK0nMzYJW5moevOweJvbPN
 uM1RSsyTy7PbxIabz/7D7pnzLv32RETaQZwqEyYv6kq4mz73Bct2bzpdtzREvSQTN1Vl0uc4
 H3H+mH0GDkHLpqTxFKt9nOqm/+KnCXjRZ46CrK17LhpjUeVy2hVDwcZPXO1pf60okSjR85SM
 UYO/TZoqrI9nHFHVfH0Wxm+5XWDpBNZC5xbEvYx70eGza+8Dxul6nYsY2FzMeUYi8EMQwMv5
 l2VssnCHhtVv+jAIZ6CzYt4vQ9eKABMczVbP35VHFJdizXwiNpo1kOVHr6PBIbw34OrRWysq
 9yfhHVm74j/m/LnwElSEbrvqjaoq56houUduViPBjjNAu+UmOeYi2GA4Fzf67NLK5yUCwnpU
 Jk4dyq2sbtm4XKlzXHlrAAx8FeBvKnt3Nr02gEHInXZ327xk0NPhKgJiN2EGKuMDiriUWG0C
 KM0kV0IjKK/wFPxBUOKS9vrUp9znfSI+SrNCKCIBjaxXnSBXFbXoH4xDaJh90vsi0Mr2ZouI
 ouWdN3EMJrpIfU6nGbnG48gPUsQ7n1vngv7GMGkpylLJJLDPRZ5v59eaAvQBg34hYvZyDjoH
 yF3Z5rSl0oHCLWgCsQVmKZKRW03wbEALcieg6RqmiSre2KKxElJ5yft/I4c
IronPort-HdrOrdr: A9a23:AwHZCKgFosp9c9X2J4Po/4WQIXBQXwV13DAbv31ZSRFFG/FwyP
 rOoB1L73HJYWgqN03IwerwRJVpQRvnhPlICPoqTMiftW7dySWVxeBZnMTfKljbexEWmdQtrp
 uIH5IObeEYbmIKzPoSgjPIaerIqePvmMvD6IuurAYOcegpUdAc0+4TMHf8LqQCfng/OXNPLu
 vk2iMonUvFRV0nKuCAQlUVVenKoNPG0Lj8ZwQdOhIh4A6SyRu19b/TCXGjr1cjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y+FEGNeHhqEuW3bRY0eTFcZcso+5zXQISdKUmREXeR
 730lEd1vFImjbsl6eO0ELQMkfboW4TAjTZuCGlaDPY0L3ErXQBepF8bUYzSGqF16Lm1+sMip
 6jlljpx6Z/HFfOmj/w6MPPUAwvnk2ooWA6mepWlHBHV5ACAYUh57D30XklWKvoJhiKo7zP0d
 Mee/0078wmPG9yr0qp91WH5ebcEkjbMi32N3Tqi/blpQS+xkoJvXfw7PZv6kvo2qhNOKV52w
 ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.82,313,1613433600"; 
   d="scan'208";a="742166817"
Received: from alln-core-8.cisco.com ([173.36.13.141])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 21 May 2021 08:02:16 +0000
Received: from mail.cisco.com (xbe-rcd-004.cisco.com [173.37.102.19])
        by alln-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 14L82FhU020584
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Fri, 21 May 2021 08:02:15 GMT
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xbe-rcd-004.cisco.com
 (173.37.102.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Fri, 21 May
 2021 03:02:15 -0500
Received: from xfe-rcd-004.cisco.com (173.37.227.252) by xfe-aln-003.cisco.com
 (173.37.135.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Fri, 21 May
 2021 03:02:14 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-004.cisco.com (173.37.227.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Fri, 21 May 2021 03:02:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBf1I/5mfx5ShU5Y9bGLjIZWVq2jLu3+EshzX6pN8t9YyZPcIBTzt7OaeOlX1ZTx35QMj2X2GnxnGCFclHs69cJBGaqH/y3EMRlFZlG5zWO2d8NtJuN03YK1dg0DfnnR88O7RhYJpc0/KUaNjLOqIsGwEA1WJ1OQBoZml+A09lUB+AolU00d1miDgQq0yiF0n8YgydqfzqN1xsYKYoUWW0I7SUGeQ5KoJuqIImK/E9oGzxjuF0xBHE3z3cOfDfUHhACv97H0DRi0Frst88UeWdm2O+6euq431X/Ezbml1DMX6sbC4xfTTIsOm0YDvN6ShzC0AQY8zN1lgkPlvyGKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWSi71I2fKHkBjLRn0bw0wcQAfD37twvFtUCZMFvS5g=;
 b=SJlOVWizctATYpwKpNkMkfRGa5lJ8fzK4YySlygQhbQnsNiETpWRj4j+aVFV/XuuYLbWvbLlRGGCYQn2GE+HgvDljY8F2eLINtJo0ct2tPK0ejAD5IB7I1SYxoONZ/IJugALYjhVBkP1UlYtE9XVYO4fAD0ePS+tKvLNn/BMbHOdTMhRgEIsNv6bWKRAmLSOLsK67+RAVyDDUYs1MTwDYoQDyc68uoLiDBvoPVo5Cb1M3qSECHuIq/j8Ur/+K+0icBXpuVlV3DN1ncYZxevGFHvICq+72xsHASb8qmUFoqRmgEYRkWpbU0rsoneB41Oj2qxXfgb4VutGh1Kfr5Ey4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWSi71I2fKHkBjLRn0bw0wcQAfD37twvFtUCZMFvS5g=;
 b=mzhn6u85XEJidD7IaFpHnKIEvAH9/+aIxAUKHp49lYBKrvXNRIkYKUW/qRPGSrl/dOJOOMDRhRevSnFJoiYOc2/M5oYa7ceNE4QDD8A7Xqg5zx7zjC8/kswaB629avy4FmrsMkgldjWFtAeUpEt/cV0j/+mXps7G3WnbpDdOl58=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM5PR1101MB2108.namprd11.prod.outlook.com (2603:10b6:4:53::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.29; Fri, 21 May
 2021 08:02:13 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::f066:210d:6520:634]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::f066:210d:6520:634%9]) with mapi id 15.20.4129.035; Fri, 21 May 2021
 08:02:13 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Florian Echtler <floe@butterbrot.org>,
        linux-input <linux-input@vger.kernel.org>
CC:     Raphael Wimmer <raphael.wimmer@ur.de>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: Regression in sur40 in v5.13
Thread-Topic: Regression in sur40 in v5.13
Thread-Index: AQHXThO28+/gyXoheE6Ea94BS4a6+w==
Date:   Fri, 21 May 2021 08:02:13 +0000
Message-ID: <DM6PR11MB46259D524C3E1C12A75E1E00DE299@DM6PR11MB4625.namprd11.prod.outlook.com>
References: <50a6066a-2111-33ab-cc89-2dae7883c6ca@butterbrot.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: butterbrot.org; dkim=none (message not signed)
 header.d=none;butterbrot.org; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.220.49]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 15409798-692d-41dd-0092-08d91c2ebe29
x-ms-traffictypediagnostic: DM5PR1101MB2108:
x-microsoft-antispam-prvs: <DM5PR1101MB210861FA36EC6251AEEA74C0DE299@DM5PR1101MB2108.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y/nOEvHoD25HtqPpPvp+Zb4ZY1734i4lP4YHb7Mb5mhu4xkiPTwtqMEevC9b0QLGXX+ZhZIp6I7UYd/tiEo1c9H7kbWsnLbpX6TIz8KGjuuS8PkiZqMFPKeaFwan8omMU7g1yFU7NsIL7uV8ivqHciqaSn/85R05BeOBS8PXJRtpcOURddpEe+3N1JzvqD8YQDaClySZqHPp4Flj3WnggDUHpgTZRlcn86FmP/OgraV4/neak/j7qFGQklTQt9+KNnQBGPtgVbZOVRdB7kl5SOx2/LnJyIKoZZ7am9gcIv+brGHrRJE+kWQSYFCuigWiahgScQfTo/W1P76FBXD6cokky1qiLdpeXrciyA4PtIfQ2Ct31Lsf5bl6va2mdTqSYa4c/Z5ILixEXpH2wZudkxXo5e5dHXVoBp4vhkcNo9If9nDLugAUOAEeTiUbEFkDmGhRiqAvdroELHCV2mpKny8tc0NrPAKfoO2TO+o3LdYG8OdS1bKnJn8WV8aXsF03t9L/Rr/WHynVWXuh2TrU3QQGSB3H7Lzh33WvymFyPXRWowrpGIky9H0506y5hZWHCKZwL093GczA9qG3ZvBibrXOq+9TH4sxyZ5YUfrq+9o=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(376002)(366004)(136003)(346002)(8936002)(8676002)(38100700002)(316002)(9686003)(55016002)(2906002)(122000001)(186003)(5660300002)(7696005)(4326008)(54906003)(110136005)(478600001)(52536014)(33656002)(64756008)(86362001)(76116006)(53546011)(6506007)(91956017)(83380400001)(66556008)(26005)(71200400001)(66946007)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?VG80mSPp2BmwUsq+0DTdasaF2xS7g4UafCtZwKtOAIYGNML/+nXgsoIfnP?=
 =?iso-8859-1?Q?szYFV4iueWAgMieKJkpDzn7YaqjdMy0BHHs8cPKClNr3gMsEWO0yBRdRCp?=
 =?iso-8859-1?Q?c+PIFc2vhv9v/5xoMrChY4HK6rCrEx0hrh3r5jpUvRK7n/3mcdpQ8PlUhY?=
 =?iso-8859-1?Q?yi92X+BEAG8Hia+CSwokzS4OTsB5LNiYi4e7Njm7yDafhtRQN8+Q74NCh9?=
 =?iso-8859-1?Q?MEgzwa8xuZeNRdHsrmFFxGRQUSHAxCCzFHjXWSljha083PaPfrVNXhSUpk?=
 =?iso-8859-1?Q?39wCczR3O69anWY95UdJGO+K/1vNTNvRCIuZkNG6A6feZG9ykktIxAkLJ3?=
 =?iso-8859-1?Q?P27/52kYLFphdr8+SGNkGSCXJlbFSm5KAgQngUAuYGc0v0nUj8bH33Hsmd?=
 =?iso-8859-1?Q?glMVNk6YX1Pdw8CGhlWH1GtxzUhIiFFLKknew9Z+rOZMWsysJQ2HuxuwhF?=
 =?iso-8859-1?Q?5Q83u1UHocellX4Tovpo4+qUQgXMGhXqhRBvBvevVGmfcf2YtnvlJQcWJC?=
 =?iso-8859-1?Q?fviG5AyItWv3jLxHjXOwRuxpVuk7PQhNOyAC5+rUJL+AGGPwe/pKvmRYPd?=
 =?iso-8859-1?Q?vxxud2QJPMUegq3a3T336Z6WgMcp/uxpVaO/seWWrz0N64BkWfqKvZS/dI?=
 =?iso-8859-1?Q?B1t5FBvjMy019nE1OngYnCx3l1HdONgOfePJUcm94XlZ0Kvc5/UoHMhER/?=
 =?iso-8859-1?Q?AF5l0mdu9ScLPT8eYvVgr+xbKKlvtiRcwtDOvZFPMJsRU3bo9H0tEzTr/L?=
 =?iso-8859-1?Q?aN1A239VmzFxaxZeu1OBZTo1l3TKO971XV6HVrFXSAK/mCXbyZOjl6SEIn?=
 =?iso-8859-1?Q?ftyBvaEooWUUAzHeC/D55ikLAf0MbY7sWsG1E7MVEejiRELE54gmZFNz3X?=
 =?iso-8859-1?Q?WDi4uWy9+uKqNS6EJR9UlWzZzSHLEYvI150V06YcyxJKPVav9jAMLVSRtM?=
 =?iso-8859-1?Q?8bOYiXIjQXdhPpDjn10J+Uo3y5jSvoeU6ddGppDOqJgiUvbR5YJ1C8gGFJ?=
 =?iso-8859-1?Q?s/TAgjrb775lIdmEdEqSTql6phttqmNjHz/GUYQioPrV47v15BtiRhnPDZ?=
 =?iso-8859-1?Q?2n7pfi5eh8gelZZPYsAzykXUqNUjICmXudiq2mQ/Nk1bnhAO4n4gtlaDP4?=
 =?iso-8859-1?Q?v+mdZXxXTvQw8bva2VANiFvEOGaoflL0LL5BI0J6zCFiijtJ43mAj1UTvD?=
 =?iso-8859-1?Q?y4Vxdujpe8IvPCPfuH3Ff6XIIuTKvF/OxlyqKOVbdlOeyNkeu3aXJdmnzx?=
 =?iso-8859-1?Q?HKUFsdTKyA8uF+Bsp/1AHCZuNj2hmJXN6MHC0Ore4K2t6CgyZmfsWLIib1?=
 =?iso-8859-1?Q?vpWQjtUcpZjL/XEgQ3cYpcvmVIXWH3x43F3JP80ADixQGmWH36fWptaLX7?=
 =?iso-8859-1?Q?UU6qOtdZF9?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15409798-692d-41dd-0092-08d91c2ebe29
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 08:02:13.3469
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aVyHECmkGRQ7QBsJUAOAmBalXgKai5TRAhQu0a7DwbiI+1V/TkUrXT+fS8PFTD1UBwBkOra2c1ag1v0onItymQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2108
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.19, xbe-rcd-004.cisco.com
X-Outbound-Node: alln-core-8.cisco.com
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Florian,=0A=
=0A=
On 5/21/21 9:34 AM, Florian Echtler wrote:=0A=
> Hello everyone,=0A=
> =0A=
> we came across a regression in the V4L2 part of the sur40 driver. I've =
=0A=
> been out of the loop with V4L2 development for some time, so I'd =0A=
> appreciate any bit of input for debugging this.=0A=
> =0A=
> When trying to read from the associated video device, the following =0A=
> stacktrace gets dumped by the kernel:=0A=
> =0A=
> [55921.426292] CPU: 1 PID: 304262 Comm: guvcview Tainted: G=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 E =0A=
> 5.13.0-rc2+ #1=0A=
> [55921.426296] Hardware name: Samsung SUR40/SDNE-R78BA2-20, BIOS =0A=
> SDNE-R78BA2-2000 02/23/2012=0A=
> [55921.426297] RIP: 0010:dma_map_sg_attrs+0x37/0x50=0A=
> [55921.426301] Code: 85 c0 48 0f 44 05 b9 e3 d9 01 83 f9 02 77 19 48 83 =
=0A=
> bf 40 02 00 00 00 74 11 48 85 c0 75 11 e8 50 18 00 00 85 c0 78 13 c3 0f =
=0A=
> 0b <0f> 0b 31 c0 c3 48 8b 40 50 e8 ab f6 ae 00 eb e9 0f 0b 0f 1f 80 00=0A=
> [55921.426303] RSP: 0018:ffffad8a81a4bc38 EFLAGS: 00010246=0A=
> [55921.426306] RAX: ffffffff8ee0a140 RBX: 0000000000002dc0 RCX: =0A=
> 0000000000000002=0A=
> [55921.426307] RDX: 0000000000000007 RSI: ffff88fd05ce8100 RDI: =0A=
> ffff88fe0c026830=0A=
> [55921.426309] RBP: 000000000000007f R08: 0000000000000020 R09: =0A=
> 0000000000000000=0A=
> [55921.426310] R10: 0000000000000000 R11: ffffd73b80000000 R12: =0A=
> ffff88fe04748880=0A=
> [55921.426311] R13: 000000000007f000 R14: 0000000000000000 R15: =0A=
> 0000000000000000=0A=
> [55921.426313] FS:=A0 00007fc2fb796440(0000) GS:ffff88fe33d00000(0000) =
=0A=
> knlGS:0000000000000000=0A=
> [55921.426315] CS:=A0 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=0A=
> [55921.426316] CR2: 00007fc2fa9d6000 CR3: 000000000cfee000 CR4: =0A=
> 00000000000006e0=0A=
> [55921.426318] Call Trace:=0A=
> [55921.426322]=A0 vb2_dma_sg_alloc+0x1a2/0x2a0 [videobuf2_dma_sg]=0A=
> [55921.426329]=A0 __vb2_queue_alloc+0x177/0x3c0 [videobuf2_common]=0A=
> [55921.426337]=A0 vb2_core_reqbufs+0x237/0x3b0 [videobuf2_common]=0A=
> [55921.426344]=A0 vb2_ioctl_reqbufs+0x77/0xb0 [videobuf2_v4l2]=0A=
> [55921.426351]=A0 __video_do_ioctl+0x39e/0x3d0 [videodev]=0A=
> [55921.426379]=A0 video_usercopy+0x177/0x750 [videodev]=0A=
> [55921.426393]=A0 ? v4l_print_control+0x20/0x20 [videodev]=0A=
> [55921.426408]=A0 v4l2_ioctl+0x48/0x50 [videodev]=0A=
> [55921.426422]=A0 __x64_sys_ioctl+0x83/0xb0=0A=
> [55921.426426]=A0 do_syscall_64+0x40/0xb0=0A=
> [55921.426429]=A0 entry_SYSCALL_64_after_hwframe+0x44/0xae=0A=
> [55921.426432] RIP: 0033:0x7fc3050a29b9=0A=
> [55921.426435] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 =
=0A=
> 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f =
=0A=
> 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48=0A=
> [55921.426437] RSP: 002b:00007ffcb50d6a28 EFLAGS: 00000246 ORIG_RAX: =0A=
> 0000000000000010=0A=
> [55921.426439] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: =0A=
> 00007fc3050a29b9=0A=
> [55921.426440] RDX: 0000563371288e90 RSI: 00000000c0145608 RDI: =0A=
> 0000000000000004=0A=
> [55921.426442] RBP: 00000000c0145608 R08: 0000000000000000 R09: =0A=
> 0000000000000000=0A=
> [55921.426443] R10: 00007fc304fa5020 R11: 0000000000000246 R12: =0A=
> 0000000000000004=0A=
> [55921.426444] R13: 0000000000000000 R14: 00007fc304fa5020 R15: =0A=
> 0000563371288e90=0A=
> [55921.426447] ---[ end trace fd6bcb1bcbdb4e65 ]---=0A=
> =0A=
> In addition, v4l2-compliance reports some failures regarding buffer =0A=
> ioctls (see attachment).=0A=
=0A=
It looks like the reqbufs call fails (probably in the same spot as in =0A=
the backtrace above), so the failures after that are the result of that =0A=
initial failure.=0A=
=0A=
> =0A=
> I can't pinpoint any recent commits to the driver itself that might have =
=0A=
> caused this, so I assume it's related to a change in the framework itself=
.=0A=
=0A=
I'm not aware of any relevant changes in the media framework either.=0A=
=0A=
If you can bisect, then that would be great. There isn't a lot of useful =
=0A=
information in the backtrace.=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
=0A=
> =0A=
> Any suggestions very much appreciated!=0A=
> =0A=
> Best, Florian=0A=
=0A=
