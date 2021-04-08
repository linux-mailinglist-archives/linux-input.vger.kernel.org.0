Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8D5358FBC
	for <lists+linux-input@lfdr.de>; Fri,  9 Apr 2021 00:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232692AbhDHWTe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 18:19:34 -0400
Received: from mail-eopbgr10062.outbound.protection.outlook.com ([40.107.1.62]:3972
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232265AbhDHWTe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Apr 2021 18:19:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RmJYzPmPXwxm24yvExz1GLjhBUalk6grHHuBcwWk+rgA+FqqZPDe5d/LL8876DwQvEyvN2QTHH0Y/YUmve0+ffsvSFmKUCd4d+KEdgoSiYta6iTscZRyaq0e1vmcGoDoPX+q03Sw/aAVa98v2qOoaE6pewGtoNqG+rOFMSzf/LuLnRc/MNQCRUIxnCvxzgIiVIDAXp2LwZoOqijr9fM2yPYIpUA3jdpcqge3Jv3H1Hyq6JNpsqV+rVFyWz7HIb53hQfgWo7qWKq4+YkLAzr788jTT7j0KYCX1mJXOSkDZwC4mw6RNGwjlNjaeZ7YQj01E6GNmHV8plScBVEIwIlvdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7szXiSSO9hR1aJNoh9b9kPnXm0cBO4YSxaqPoiBZ+g=;
 b=J6IzpOFk/7+mL9I1Xy6xV2/zVbGKX4MHBO4stSVYfQ6eT5fvrEuANRmssugmttZJtsr4BWrFndwBYYgYVmHsv+2EVariB+2K2i+FOgTjdcyyUuAKn08JtzpQ+u1uc1p0Hodks2eEPp1DIx1dsBNAp2917jIWCWbprlCUHD2isNOBPksVp5O5ZXPTxA+cEaLLA5xFmsXleGKo8wra9+CglJv3NxF41oCYvQeAcu1c0UqqZtd39hI38Ss2/ayRbvysDqJpE3sQUQYD+RSN45G+oaZqiHGXM8/rNJdTCS+01ulgywK14AhKnLZLZf/2gk2UnFspgWosbLAK3+zugjG33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wacom.com; dmarc=pass action=none header.from=wacom.com;
 dkim=pass header.d=wacom.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wacomaad.onmicrosoft.com; s=selector2-wacomaad-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7szXiSSO9hR1aJNoh9b9kPnXm0cBO4YSxaqPoiBZ+g=;
 b=PViut2JZuLHxJ/d60KIbPFfFrkPA4QXjhKs8LNwFoZ+rQHzfaOx3ZmxrVSngE9w9eRiK2voMCtPMEXkTzXKDxalwgmk5vBcmfvkkovXFxIUh2bwVrFQVhXqYfOXZWfIMl5P8ht+6ZPQzfm/jSL53gMkIaYqxDcy1tJfdlDDqfIk=
Received: from VI1PR07MB5821.eurprd07.prod.outlook.com (2603:10a6:803:ce::20)
 by VI1PR07MB3357.eurprd07.prod.outlook.com (2603:10a6:802:23::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Thu, 8 Apr
 2021 22:19:18 +0000
Received: from VI1PR07MB5821.eurprd07.prod.outlook.com
 ([fe80::54d:5fae:a366:34ac]) by VI1PR07MB5821.eurprd07.prod.outlook.com
 ([fe80::54d:5fae:a366:34ac%6]) with mapi id 15.20.4020.017; Thu, 8 Apr 2021
 22:19:18 +0000
From:   "Gerecke, Jason" <Jason.Gerecke@wacom.com>
To:     Kenneth Albanowski <kenalba@google.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "Cheng, Ping" <Ping.Cheng@wacom.com>
Subject: Re: Supporting 64-bit Digitizer Serial Numbers?
Thread-Topic: Supporting 64-bit Digitizer Serial Numbers?
Thread-Index: AQHXIVHgOjpalsSxpkShDOwk5EV3NaqejiwAgAy4zHg=
Date:   Thu, 8 Apr 2021 22:19:18 +0000
Message-ID: <VI1PR07MB5821FB3E0E4B570C9B18FEC9ED749@VI1PR07MB5821.eurprd07.prod.outlook.com>
References: <CALvoSf7L2tkrdg_rF0ZqbUv-H2TXnEudjSDUrts+MUs=Lvhpeg@mail.gmail.com>
 <CAO-hwJ+6g9ADRpShG_HbQi5PGv6PLp-1wxJP7CSLT+1uJLB9OA@mail.gmail.com>,<CALvoSf63YbXdK8-yEUnnJqaGeZ4VF2A+8u4M9tpoSB7OHOxHXQ@mail.gmail.com>
In-Reply-To: <CALvoSf63YbXdK8-yEUnnJqaGeZ4VF2A+8u4M9tpoSB7OHOxHXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=wacom.com;
x-originating-ip: [71.34.74.195]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d257e906-c56d-4e65-ef5b-08d8fadc5a62
x-ms-traffictypediagnostic: VI1PR07MB3357:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR07MB33572D4E1BB8F7E42258C664ED749@VI1PR07MB3357.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: I5dJyCmHq9zMPmtw11QU9Rqi3iR1pEgvIfhwlXw0Ruse/zTLhQsJ3gSODwN/BEO8a75wX4B9LdmvNV6rW9K8bRT/Bdy1OhpyFFRZqlOQfU+JsLpSUqNbkphxeZcDQdScoxOWCYzWKyaX9lkfev5DhPujooYxV3+G/0fSbohGFQQBjGAJyEg+0/6JM0bzp+ymetg65H7KaB8CndWUwY9kdhTuukOGS6aZEXdZ6Khv4Z6CWl4H9Xuhm0hfwiN/7vco/J52xNT4ERiW20UV6KU8nHNzpUg+DJH8FSqvef3RfO7RMBdeZkF3yw2M+YKajcJmLOLpfQYrIpbdaHSGSq/KXtkNdB5FIV1+tVsd/MEWdJUl6+NKWBPsNcK0OxFCSNhjxMyhgzdkuCWsj1vLzABOtXnK/fTAQEOo+YOmsa5VRzugwUrsb+d5TwshK0moN2zK/KnfYoDPlAE4LaRq9CLwqrDPh6xRucU6SOvrsAmZeCxt+R0XM7SUHFlQ+0r3StWfBUy2AzEOoVeKLlQ9nl1zj1d9aszapcWTYQltnLKm/knkBGyCUu4+NpRJcF6yJpkUO31IoQWtn1Sg0sadPIT1M4R+MUHh5jNzb0OkKwmzi/OXY3Oug1LSB4fkTWJ7qUPWJbwEbAWKAssCsgs8gPCkG8OTBvSqW7eVItAoMbKVXa0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR07MB5821.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(498600001)(45080400002)(66476007)(186003)(71200400001)(91956017)(54906003)(26005)(76116006)(66556008)(64756008)(66946007)(4326008)(86362001)(110136005)(107886003)(66446008)(52536014)(55016002)(9686003)(7696005)(83380400001)(8936002)(33656002)(5660300002)(38100700001)(8676002)(2906002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?+SWCDpC9m+s5e9HsBPlL2Hvaq4YQsbBKyRKJb7UWfBsQl1tkUsLxt9y+zf?=
 =?iso-8859-1?Q?af1ZxDPxzDJoNu0PZZs5G1BMwY8rUyXsGkAv/Te4b+Wq0n57utyT2PEjc9?=
 =?iso-8859-1?Q?Q0MR+w3eTP13wHQT8uyKse8D5E14JKQwffAuM0Cr7OfG7ue/NVzZHqX//E?=
 =?iso-8859-1?Q?mbheb9AEu6rJJYFw3gJdSbAm3XPMh/D+8VPANvU8jJcZx55mV3mWCPg7Fh?=
 =?iso-8859-1?Q?TcZo1k/eP6dI32XBmBkStplUaLBDvPjE5zAUzLvioU9+8QGv1N910Er4o+?=
 =?iso-8859-1?Q?V++dwKYpILzjEMVpAEMweZzJart+gsUn257kUEK20cD3lJFoKgitgosB8O?=
 =?iso-8859-1?Q?vQHJ50KVtotHJrBONkXsxCiV7dicDoCksr8spmgpKRYN2lff1CmW2Vhbn7?=
 =?iso-8859-1?Q?4MFf9NPePqQk/iHSGhobh27e4o6mZE4jKx9ZJxr4Sx6j4aH4KMNJni+4t1?=
 =?iso-8859-1?Q?3S7kq8UA4otQFOoBzF2akzBKKlTOMTocRhiVWjYE/d2k5Y8i2Dws6KXSCJ?=
 =?iso-8859-1?Q?F/tye/hAWUrLGgqGNWz8F49vyhNtPVjEPFG81R6UDu02PiZenUAoX2nlYI?=
 =?iso-8859-1?Q?6s3rbfZ98Ud2bkhKPDSkKmFTyEIse96siu0UzEXpr+EapSK7hrOLhIaybs?=
 =?iso-8859-1?Q?HffCAhkj0hulGeS68mLHiAyhEetQoQ6PYj6VvYl8CMWhES8EOpAUYaKbsr?=
 =?iso-8859-1?Q?4I0d2x0oVonqTuGt3D2V1p9f4eOCLzVXvxnjZk+TIc1BBlfr8EnqKlMF+L?=
 =?iso-8859-1?Q?DoQapLiTSA0cESgnVd+SucE3AYZSQQR5TgLgZpK+kxo+5IzPpJYQDjAHIM?=
 =?iso-8859-1?Q?6wiFHfKzVLVhMADMOeKI9XqdJnVYST28ierXPcZVJ00gBKFZEh5NzzaK21?=
 =?iso-8859-1?Q?aaXiWFQ/IA1GEaKQkPyxuFpNd3EmhhDTIuMwbBioyp7ptqRiRti1NNOCkJ?=
 =?iso-8859-1?Q?TaSn+4FFRrpXHs/CXELICy74ALrSyKvo/ALJqnzMubYrq02HX49dog8poJ?=
 =?iso-8859-1?Q?nZ9cxKeoCrezRamN3onRFocL16dxhUxaeKTuzzxBjerU7Ds7elVZMwtjD7?=
 =?iso-8859-1?Q?1a9sPsWfMjl/qoV0kayPhgrWxEWTs0Nj6QvtHmve6bgOCGH41R8ZbXfWaU?=
 =?iso-8859-1?Q?7/sAKsHeEIhuyp6uPSaaf/fikqTlnUOWatuzTnvlwxXuM5E1RKga2nuxYM?=
 =?iso-8859-1?Q?43btJc0nInBddUwTb+5Lxgfp2G7L6uXbA9GaoSeGnDdP8QnsAHHoMEhYzt?=
 =?iso-8859-1?Q?E2Eb1cbBAwWYvWkc1pYVD3GFzFp+OzX+9QdMTrq8qnQalGXNMqlNg/WHT6?=
 =?iso-8859-1?Q?o76YhMyIobpBHFt9UE2gP4WY/LrX2zOcLVa/dEfq+6gX1oI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wacom.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR07MB5821.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d257e906-c56d-4e65-ef5b-08d8fadc5a62
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 22:19:18.7668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9655a91b-107e-4537-834e-d15e84872626
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W1w232sXc9vkZRAaipDUq9e6OEQbZe/Inbg4gzObd9wr/rmwJTIZhABUqwUOEIbKzrqr3+/DPHPYEBShXFDOGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB3357
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

First of all, my apologies for the likely-wonky email formatting. For some =
reason I'm missing messages from linux-input in my Gmail so I'm forced to r=
eply from Outlook (which doesn't exactly make inline plain-text replies eas=
y).=0A=
=0A=
> > > My thought is to perform minimal modifications to allow hid-core to=
=0A=
> > > transfer reports up to 64-bits in size to hid-input, so that it can=
=0A=
> > > process this field and emit it to the power_supply integration, as we=
ll=0A=
> > > as through classic MSC_SERIAL (for the low 32 bits) and a new=0A=
> > > MSC_SERIAL2 (the upper bits) for applications which want it inline wi=
th=0A=
> > > stylus event data.=0A=
> >=0A=
> > The wacom driver already has this problem and handles it in a creative=
=0A=
> > way (as usual ;-P)=0A=
> > If I am not mistaken, it splits the 64 bits serial on 2 events as=0A=
> > well: MSC_SERIAL and ABS_MISC (Jason might correct me here).=0A=
> >=0A=
> > I am not saying this is what needs to be done, but just what some=0A=
> userspace tools already expect.=0A=
> =0A=
> As Peter mentions, this seems separate, ABS_MISC being a sort of tool=0A=
> type identifier, quite different from the serial number. (They apparently=
=0A=
> get extracted from the same data report in the wacom formats, but the=0A=
> intention seems distinct.)=0A=
> =0A=
> As far as I can see, the Wacom S/N (stuffed into MSC_SERIAL) is indeed=0A=
> always truncated to 32 bits; introducing MSC_SERIAL2 should be suitable=
=0A=
> for the wacom driver as well if they want to publish the high bits.=0A=
=0A=
ABS_MISC and MSC_SERIAL are nominally the tool type and serial number field=
s. A given serial number may be re-used across tool types, however, and so =
the two fields must be combined to get a globally unique ID. It's not *quit=
e* that simple though:=0A=
=0A=
    * The ABS_MISC field is sometimes intentionally mangled for compatibili=
ty with an ancient wacom.ko bug=0A=
    * A 32-bit MSC_SERIAL is sometimes not quite large enough to store the =
nominal serial number=0A=
    * The way the values are assembled varies between devices (i.e. on some=
 devices ABS_MISC is the high "n"-bits, on others it is the low "n"-bits, a=
nd "n" may vary).=0A=
=0A=
I'd love to have a way for our driver to report an unmangled 64-bit unique =
ID which matches what you'd get on Windows and OSX, but I don't think MSC_S=
ERIAL2 quite solves that problem for us. We could use it with devices which=
 have MSC_SERIAL as the low 32 bits of the unique ID, but not those that ha=
ve ABS_MISC as the low "n"-bits).=0A=
=0A=
> > If changing MSC_SERIAL is deemed too risky for compatibility, then it's=
=0A=
> > easy to just leave MSC_SERIAL as-is, and put in a separate MSC_SERIAL1=
=0A=
> > (MSC_SERIAL0?) that has the pristine low bits -- just at a cost of yet=
=0A=
> > one more MSC_ field per report, and using up the last MSC_ bit before=
=0A=
> > we need to bump MSC_MAX.=0A=
> >=0A=
> > This approach doesn't affect Wacom evdev events at all, all of that=0A=
> > logic is separate from hid-input.=0A=
>=0A=
> There is a whole ecosystem for wacom, but we are pretty much in=0A=
> control of all the pieces. So I would prefer involving wacom from the=0A=
> beginning, and have a common representation to the user space.=0A=
=0A=
Providing a separate MSC_SERIAL1 (or zero) in addition to MSC_SERIAL2 could=
 be the solution to the problems above. Our driver can be taught how to ass=
emble the 64-bit IDs and then split them into events for the high- and low-=
order bytes. We might want to consider using a different prefix than MSC_SE=
RIAL if we go this route, however. It could be very confusing to understand=
 how all three events do (and don't) relate to each other if their names ar=
e too similar.=0A=
=0A=
Of course, it'd also be great if the input structs could fit 64-bit integer=
s, but that's probably not possible (and also doesn't help with devices tha=
t want to report e.g. 128-bit numbers).=
