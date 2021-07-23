Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 356783D4086
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 21:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhGWS0z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Jul 2021 14:26:55 -0400
Received: from mail-eopbgr660090.outbound.protection.outlook.com ([40.107.66.90]:36207
        "EHLO CAN01-QB1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229808AbhGWS0y (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 14:26:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmuJ46u3FbX6H/Af68Y8j14qK5Ug1vTNoj5+Qlagf+ToGRQIGQbKgmFmTeVHRILei78YPJCNp9cPnzkiJ/HeiN+qnwu5/82aRaIF05HWV0d9KxURZWNYUF2BoxjR1hXZlzQnTx0/yFvmRDLROIHdzTJ8vz/EM5lgUMeJ+9DYTZwCCiNofVQ/CVE+GwsneZVJofRyyfyevTH1s1G3uPhxjumf6IQisXah3C1pKDiIJy16MdED7uHiR2mdekSnbteAE0k9+vKbk0uWlvZG3dN5p7b2i67h+mL20wmJqvIWpA+scGvS/vmyoaDBKaP8BwK08uG/rTXu6/CAWAYInr6PEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aurjns4Y2DJQ1AnrvrhwZyD5Cbudyt8dq8oBOVCcYBY=;
 b=AcioQvVn/ESdER5bz3x6EDplBaqqSHEkPjCWX31qO2he4Sc+EdRCjAelyYUKdBwEAZEc0uDmcgRGtCNAFtcvIxKFpSntOwAgusfeTT+ojafyKmvrqnmnzqROs1hwsuDnZ7QujisSAPZntTvORsaVSb3jjtVX6IiFbmI1UwiKdVJGzahF2oGiF5mCiAGHhU9cw7vtsZAhhiOdw6lXbHPupdC55oOmltRcqBuh+t1FwMFrRRykLa+CmWXQVbPCy6M7P0skkXkY5kncOedNVxkWgm4ooYaN0WiE4U+hOt8vRZJwG9lxV3OaKroybeNuLadmg9fxQsvnkPsoC0vBh/bG2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ens.etsmtl.ca; dmarc=pass action=none
 header.from=ens.etsmtl.ca; dkim=pass header.d=ens.etsmtl.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ens.etsmtl.ca;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aurjns4Y2DJQ1AnrvrhwZyD5Cbudyt8dq8oBOVCcYBY=;
 b=F4nEQh46C939JG5l0yjr5YnqMQLhFEwwTFkyhzaNXYOXcP0ADsy181WMa98sB8ikQ1vOPV1i0FEmHjiVcTHssUg/aZopsYUfEnEJ2ORSk2UrRNzHf+os4mpVkcOrIys7AEyha+C/dLxjPKvepiaYlpRTn/h2gb4DFIh3mVGiKCBjOf+k8HFkTnKHsrgigfHY/MbB9A1H4XXvObYTfmVi/41BBGJE1FjWPU+KUI2XpJJt2xBHOavdhT7RLpAKpmV4xdwEpqRoVvWwdDin3683h8jpB3r3WRmh+K8jITo4tsCpq0ti9ucZMqejnKMeL1d72vQLXH8xCppSMyF3UMHgIw==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=ens.etsmtl.ca;
Received: from YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:a::30)
 by YQXPR01MB5478.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01:2c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Fri, 23 Jul
 2021 19:07:26 +0000
Received: from YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5dba:fe68:a937:a162]) by YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::5dba:fe68:a937:a162%4]) with mapi id 15.20.4352.029; Fri, 23 Jul 2021
 19:07:26 +0000
X-Gm-Message-State: AOAM530F4T7VKt1H+y/udDHE+3REC7lESnNNa4NiqfR7ae4ZqsCcuiVO
        VDoVUwjKWPPqm2ndauzBrTmYf36H5vAi/pC8r7A=
X-Google-Smtp-Source: ABdhPJyAXiy3kkwj7x4TWUQHMJ8eqt3oJAw3hbdG0rAJ7nhXYalW95r2MvJe/2vANWcyEljyiaV8c/vuZ7yk8KzcKIM=
X-Received: by 2002:a05:6e02:170c:: with SMTP id u12mr4553208ill.116.1627067242594;
 Fri, 23 Jul 2021 12:07:22 -0700 (PDT)
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
 <951c38d5-934e-eca7-a025-9cf074771764@redhat.com> <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
 <CAO-hwJLog04U6WHZq3qEKf_bbW5wU3bL+m7zbY6h=x2neK58AQ@mail.gmail.com>
 <CAEJV-FFyt_34ts2RF-dkc5Xdez_ZWzCKu9iRzHHom610XbHVDA@mail.gmail.com> <CAO-hwJKCFO2c2VR36zfmU34OfxbxRAfpkhdFTSD+V3WB7fv1Xw@mail.gmail.com>
In-Reply-To: <CAO-hwJKCFO2c2VR36zfmU34OfxbxRAfpkhdFTSD+V3WB7fv1Xw@mail.gmail.com>
From:   Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
Date:   Fri, 23 Jul 2021 15:07:11 -0400
X-Gmail-Original-Message-ID: <CAEJV-FEuxftWiDMjoqFniV1oRZLvcAVh-5bKOdHv_S5uDSeVoA@mail.gmail.com>
Message-ID: <CAEJV-FEuxftWiDMjoqFniV1oRZLvcAVh-5bKOdHv_S5uDSeVoA@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Pascal Giard <pascal.giard@etsmtl.ca>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: CH0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:610:b0::14) To YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-il1-f176.google.com (209.85.166.176) by CH0PR03CA0009.namprd03.prod.outlook.com (2603:10b6:610:b0::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28 via Frontend Transport; Fri, 23 Jul 2021 19:07:24 +0000
Received: by mail-il1-f176.google.com with SMTP id r5so2437708ilc.13        for <linux-input@vger.kernel.org>; Fri, 23 Jul 2021 12:07:24 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 396328ba-cd66-4893-009e-08d94e0d1b38
X-MS-TrafficTypeDiagnostic: YQXPR01MB5478:
X-Microsoft-Antispam-PRVS: <YQXPR01MB547850FF08F83090087C75C8A3E59@YQXPR01MB5478.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TuI1Mrqe2Idu3keMg5zRtjq4pWi9lyKCccIvv5c7wkmQOyhboJp97TMYQdn8mOgjZNcdzbyrh7c/aiNQKjduzG/SM/seW+8BWZRSoPWGw82Vuk+bMJfy08ThgKEhrgGazsjBNLYByOyIL6rk/GsuWI74M1k4exVCdJpnbYGp2WrVTw4KLirAHuKm1U8zczB529LClRhgdbKIPpcIlY3tNg4dHD7FL3VouaM4mupYx4Atok96NGeIrFiMPFjbtvmVZOPslXdWqNpt1p8fDcUnie/nD3PSiKu/ztZjAXKUCJtkcctJJWhJn8Aa11ic7/Opd6MenCtgj4zbOdBF/pfngv1ZxbfA39mE2CIfd2JVxMKFYuIO1nw4o9T26De2dEChma48hsg8BfKWhfCpkVt6LGhb0EO81nS2uewIJ7PvFrPTVQ3FSQnCrB93pDQfdi+LxOo4Y7cNycrhcEYnYTIp4DaKCAweqnD0U6/Bxs51o+FJ/kN+GfHP9CIqL6Dit4VrTQHGEyo/g2xutlbJaIBHSC7OVrETJD/12uVG7vah5hDXo7z4AKA9nxrBhbGtZpqfEjPETcXeT78Qcmq5Ia6gwlkaIWRrTmnsl90QfL+YDvw19ThV2ivRJn6Z7IEXChNCHm4ZsNMd9TtYv3C+T+rbsO3wJFESE8AoDWOQQ4WmNvMgHPytKBLgL8dRbsYOeo29J/5cOa9UL6wgZuy0I8Yts+Pfx8eyFV8V8WUxZZ0WkIOilTvAX0djWZR2mJFk5rrxxdKDaq0IS3x/ONqHzzheqe0KIHfoFsHxJL5I0s2SWsw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(4326008)(6666004)(186003)(8676002)(38350700002)(66476007)(26005)(508600001)(66556008)(6862004)(2906002)(66946007)(53546011)(8936002)(55446002)(83380400001)(5660300002)(54906003)(42186006)(316002)(786003)(966005)(30864003)(86362001)(9686003)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFVyZEVQbjlvZEpjcEFFMEU0MHFQOCtpTEJ0cWNHOE9EUjBmbjM0WmM4QUNL?=
 =?utf-8?B?VFpkdk9YaGhRL2xkZ2JqeXZQdHpoZjVjcUkzbE8rTVMyeUJoRHJIS0RkcGZR?=
 =?utf-8?B?T01HdkFwdmYxNFFnRllzNnpSYjNJWGN6cjF0dFJUTXorbEQvT1U5eklvL3dz?=
 =?utf-8?B?cEoxajJrL0FqU05nK2RBVElBM1lvU0Vtd1V0U3JONlNaRGRGY2kwaDA2Vzdk?=
 =?utf-8?B?NjcwNjF3cXJPVUgyOUFBU1NLb250ci9ubEE0SkdaanFnYXpneU1jTnEvUGJt?=
 =?utf-8?B?SnpIZWFvYUhORktYa09hakVVTjE3d21tUTdUSE5XVlE5bHErT2J5L0srR0c5?=
 =?utf-8?B?SktQZnQrLzBITlE5U1YwMWNMSzZxVTZORXRjay9xNytNNEVRVnQ2cGgyYjBV?=
 =?utf-8?B?Z3NDWXVEbFhRNDZjMExkdy9DekR6b0I5bHVTRmgrQ1pQS3NJZXJOQTY0d3ZU?=
 =?utf-8?B?R3RTTWN4YmN3R0JwMkQyOG9jajNoTDVGd1VYeEpWaDRoUTZIWmdwU1QwWGRB?=
 =?utf-8?B?Nm1lTUhpQ1kyczJSeVJMWVBiNFJBRFdGblpSRU1hdTBUTWJNVFlnR2FwOFA0?=
 =?utf-8?B?Ym1xb3dNTWJkZWwzWHVVM2NwMnFLM2NZMzBLUnE1MmV0RWVINElsQWI4eTJi?=
 =?utf-8?B?ckszV1J1ZnQ0NCtqck0xdW5vVnZ1TFVHUXJ4VjVoRENKYk44U2I0L3RFcnhH?=
 =?utf-8?B?VE5jQXVlUWJnOVNxN3BCbHNuTmRkSWNPanY4RHlHUGZkRmFrcEw3Q05ueWJX?=
 =?utf-8?B?ZjNqUTlQamZPdWF6L3V3ck5hTVVycElXd3VSbHorWXhnR1pqK2g4WFpBYzlv?=
 =?utf-8?B?ellwNzJlMitXMlp6NlNFc2VLS2JXTHVQbXBvUTMyTUVSbHNtaWNCQWFWaExP?=
 =?utf-8?B?WkJIMkJNNElhdS8reUZLOG1yRWpUT3F3aXJjWWtJVzlLV2tTdmdBRUV4ZUti?=
 =?utf-8?B?dkkwQjhFYTZtODR3R0ZoTjBPRitka0tmNEwrZlVRUFVJZ1BucitKNTNUL1h3?=
 =?utf-8?B?TXBVYk9FQkNmS2ttRDUwWFVpQXp6WUdzTUg1NFhpTkhiNGlTT3FWVEpGblhX?=
 =?utf-8?B?Sys5c3pjRnlSRVFrbjVhaWMvN21YWGY1RHpKVFA3Wk9mdUFLY3VHRVhNZGov?=
 =?utf-8?B?alBJdWgvL29NMU5sSDl0d2tGQ2xaRDNtQjF1UU1iODRRb0w5WkhsN2NGTEgw?=
 =?utf-8?B?dFBuc2V3aGZZeDVvc1Z5dW1BUkRBZjZnY3R0Z1JiSmxlRGlqSkJhU3JRN3NH?=
 =?utf-8?B?MzFwLzRHd1NvS1djMjZoUksxdWlKelZTbWtUN1ZxRGkxMTh1ZzhJaUFBSUli?=
 =?utf-8?B?SHVRdWFwZm5sa21oNWFhcEpMY3l3UDJlOC9WMGh3dW8zVlVnbDBONXA3YXgy?=
 =?utf-8?B?VEhGN1lhUER0WmRqYThJK05aRVlzSk9hYmJOMVg1TFlaNVdvRldLd3J1Y09V?=
 =?utf-8?B?WnYxaDF1WFRHemFkT1hjUFhwdTkxUjZydG9TdnJuVkJ1WDJLUlZTUVphTEZa?=
 =?utf-8?B?aGw3RWpqN3BCYWdtYTFFZE5icWZ6bjllLzFpT0dXaDdHUWxsWm9GOGZuN1B1?=
 =?utf-8?B?NWdWdG5DeGp0TWtXbldSWjhSTHlYLzkxNHh1TmY0M3E1eTBudFMrWllIQ3Vr?=
 =?utf-8?B?K2RRS1c3S1YySC85dS9uU05LQUMwNENTaENKb0ltaUt2TlpkSGxRV1l4Y2Ni?=
 =?utf-8?B?ZjArc1NzaVI3QkR5b3ZNaExZdnljZmRlM3NQUmJKUC85RGdYRFRxVmFRNkxy?=
 =?utf-8?Q?VU0inKqXJsYKuLmBdmMU18xyBY7PMiGiR6PvHFm?=
X-OriginatorOrg: ens.etsmtl.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: 396328ba-cd66-4893-009e-08d94e0d1b38
X-MS-Exchange-CrossTenant-AuthSource: YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2021 19:07:24.9341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70aae3b7-9f3b-484d-8f95-49e8fbb783c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N6z8F4HCVqEPfC8Zt9/2EKFtouTjvfugXbrZ6JMBfuUCqXTGkT9SxZfaiGfZo1OHSEyzD2ALE5dEwej/TDhePRSD0OtQaK3k10F7/xHhSWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQXPR01MB5478
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Good day Benjamin,

On Wed, Jul 21, 2021 at 2:44 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, Jul 21, 2021 at 8:15 PM Daniel Nguyen
> <daniel.nguyen.1@ens.etsmtl.ca> wrote:
> >
> > Hello Benjamin,
> >
> > On Wed, Jul 21, 2021 at 6:16 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > On Tue, Jul 20, 2021 at 4:33 PM Pascal Giard <pascal.giard@etsmtl.ca> wrote:
> > > >
> > > > Hi Benjamin,
> > > >
> > > > On Tue, Jul 20, 2021 at 7:39 AM Benjamin Tissoires
> > > > <benjamin.tissoires@redhat.com> wrote:
> > > > >
> > > > > Hi Daniel (and Pascal),
> > > > >
> > > > > [adding Roderick in Cc who is dealing with the Sony driver from Sony
> > > > > itself :) ]
> > > > >
> > > > >
> > > > > On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca> wrote:
> > > > > >
> > > > > > This commit adds support for the Guitar Hero Live PS4 dongles.
> > > > >
> > > > > I was about to ask you to add some regression tests to
> > > > > https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_sony.py
> > > > >
> > > > > This would likely have avoided the previous patch that was required and
> > > > > cc-ed to stable.
> > > > >
> > > > > But after looking slightly at the patch, I realized that the Guitar Hero
> > > > > code uses direct USB calls, which is not something we can emulate at the
> > > > > hid-tools level.
> > > > >
> > > > > However, after a second look at the code, I think that this part of the
> > > > > code just reimplements its own HID SET_OUTPUT code, and that is
> > > > > something we can easily emulate.
> > > > >
> > > > > Could you check if the following patch is still working properly on a
> > > > > PS3 dongle? and if so, add your PS4 support on top?
> > > > >
> > > > [...]
> > > >
> > > > I wasn't aware that this was possible. Of course we will check whether
> > > > that works or not.
> > > >
> > > > > ---
> > > > > commit 10e14f105553d2bd88bc7748e87154c5a8131e9e
> > > > > Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > > Date:   Tue Jul 20 11:44:10 2021 +0200
> > > > >
> > > > >      HID: sony: GHL: do not use raw USB calls
> > > > >
> > > > >      We can rely on HID to do the job for us.
> > > > >      This simplifies the code and also allows to implement regression tests.
> > > > >
> > > > >      Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > >
> > > > > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > > > > index b3722c51ec78..901f61d286e8 100644
> > > > > --- a/drivers/hid/hid-sony.c
> > > > > +++ b/drivers/hid/hid-sony.c
> > > > > @@ -37,7 +37,6 @@
> > > > >   #include <linux/idr.h>
> > > > >   #include <linux/input/mt.h>
> > > > >   #include <linux/crc32.h>
> > > > > -#include <linux/usb.h>
> > > > >   #include <linux/timer.h>
> > > > >   #include <asm/unaligned.h>
> > > > >
> > > > > @@ -92,7 +91,7 @@
> > > > >    * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
> > > > >    * Note: The Wii U and PS3 dongles happen to share the same!
> > > > >    */
> > > > > -static const u16 ghl_ps3wiiu_magic_value = 0x201;
> > > > > +static const u16 ghl_ps3wiiu_magic_report = 1;
> > > > >   static const char ghl_ps3wiiu_magic_data[] = {
> > > > >         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
> > > > >   };
> > > > > @@ -597,7 +596,6 @@ struct sony_sc {
> > > > >         /* DS4 calibration data */
> > > > >         struct ds4_calibration_data ds4_calib_data[6];
> > > > >         /* GH Live */
> > > > > -       struct urb *ghl_urb;
> > > > >         struct timer_list ghl_poke_timer;
> > > > >   };
> > > > >
> > > > > @@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_sc *sc,
> > > > >         }
> > > > >   }
> > > > >
> > > > > -static void ghl_magic_poke_cb(struct urb *urb)
> > > > > -{
> > > > > -       struct sony_sc *sc = urb->context;
> > > > > -
> > > > > -       if (urb->status < 0)
> > > > > -               hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
> > > > > -
> > > > > -       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > > > -}
> > > > > -
> > > > >   static void ghl_magic_poke(struct timer_list *t)
> > > > >   {
> > > > >         int ret;
> > > > >         struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
> > > > > +       const int buf_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > > > > +       u8 *buf;
> > > > >
> > > > > -       ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
> > > > > -       if (ret < 0)
> > > > > -               hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
> > > > > -}
> > > > > -
> > > > > -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
> > > > > -{
> > > > > -       struct usb_ctrlrequest *cr;
> > > > > -       u16 poke_size;
> > > > > -       u8 *databuf;
> > > > > -       unsigned int pipe;
> > > > > -
> > > > > -       poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > > > > -       pipe = usb_sndctrlpipe(usbdev, 0);
> > > > > +       buf = kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);
> > > > > +       if (!buf)
> > > > > +               return;
> > > > >
> > > > > -       cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
> > > > > -       if (cr == NULL)
> > > > > -               return -ENOMEM;
> > > > > +       ret = hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, buf,
> > > > > +                                buf_size,
> > > > > +                                HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> > > > > +       if (ret < 0) {
> > > > > +               hid_err(sc->hdev, "can't poke ghl magic\n");
> > > > > +               goto out;
> > > > > +       }
> > > > >
> > > > > -       databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
> > > > > -       if (databuf == NULL)
> > > > > -               return -ENOMEM;
> > > > > +       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > > >
> > > > > -       cr->bRequestType =
> > > > > -               USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
> > > > > -       cr->bRequest = USB_REQ_SET_CONFIGURATION;
> > > > > -       cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
> > > > > -       cr->wIndex = 0;
> > > > > -       cr->wLength = cpu_to_le16(poke_size);
> > > > > -       memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
> > > > > -       usb_fill_control_urb(
> > > > > -               sc->ghl_urb, usbdev, pipe,
> > > > > -               (unsigned char *) cr, databuf, poke_size,
> > > > > -               ghl_magic_poke_cb, sc);
> > > > > -       return 0;
> > > > > +out:
> > > > > +       kfree(buf);
> > > > >   }
> > > > >
> > > > >   static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
> > > > > @@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > > > >         int ret;
> > > > >         unsigned long quirks = id->driver_data;
> > > > >         struct sony_sc *sc;
> > > > > -       struct usb_device *usbdev;
> > > > >         unsigned int connect_mask = HID_CONNECT_DEFAULT;
> > > > >
> > > > >         if (!strcmp(hdev->name, "FutureMax Dance Mat"))
> > > > > @@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > > > >         sc->quirks = quirks;
> > > > >         hid_set_drvdata(hdev, sc);
> > > > >         sc->hdev = hdev;
> > > > > -       usbdev = to_usb_device(sc->hdev->dev.parent->parent);
> > > > >
> > > > >         ret = hid_parse(hdev);
> > > > >         if (ret) {
> > > > > @@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > > > >         }
> > > > >
> > > > >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > > > > -               sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
> > > > > -               if (!sc->ghl_urb)
> > > > > -                       return -ENOMEM;
> > > > > -               ret = ghl_init_urb(sc, usbdev);
> > > > > -               if (ret) {
> > > > > -                       hid_err(hdev, "error preparing URB\n");
> > > > > -                       return ret;
> > > > > -               }
> > > > > -
> > > > >                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
> > > > >                 mod_timer(&sc->ghl_poke_timer,
> > > > >                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > > > @@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)
> > > > >
> > > > >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > > > >                 del_timer_sync(&sc->ghl_poke_timer);
> > > > > -               usb_free_urb(sc->ghl_urb);
> > > > >         }
> > > > >
> > > > >         hid_hw_close(hdev);
> > > > > ---
> > > >
> > > > Was your patch against the master branch of hid/hid.git ?
> > >
> > > It was against the branch for-next of hid/hid.git, to account for the
> > > PS3 fix that was sent earlier.
> > >
> > > > I'm asking because it doesn't apply at all on my end, unless I use
> > > > --ignore-whitespace in which case, 3 out of 8 hunks fail.
> > > >
> > > > I assume I may be doing something wrong. I tried both downloading the
> > > > raw message from marc.info and from patchwork in case gmail would
> > > > mangle spaces/tabs, same result.
> > > >
> > > > Any idea?
> > >
> > > Usually opening the source of the email, and doing `git am -3`, hit
> > > enter, then paste the content of the patch, then Ctrl-D is the
> > > quickest you can do to apply such inlined patches (at least, that's
> > > what I do).
> > >
> > > But Daniel found out that the patch is buggy, so let's concentrate on
> > > the next iteration.
> >
> > I dove deeper into the proposed method and verified the functions in
> > order to better understand how they work. I noticed that the const that you
> > created (ghl_ps3wiiu_magic_report = 1) is modifying the first byte of the data
> > to 0x01. I also noticed that it is what creates the wValue = 0x201, which
> > explains why you set it to 1.
> >
> > After testing, I noticed that if we maintain the wValue = 0x201, and therefore
> > byte[0] = 0x01, the dongle does not function as it should. However, if we
> > change the const (ghl_ps3wiiu_magic_report = 2), although we have
> > wValue = 0x202, the dongle does function as expected. That's surprising
> > to us. Do you have any insights into the role of wValue in this context?
> > We came up with 0x201 as we were simply reproducing what
> > we had sniffed.
>
> The answer is in usbhid_set_raw_report()
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/usbhid/hid-core.c#n907)
>
> -> the wValue is used as `((rtype + 1) << 8) | reportnum`
>
> where rtype is the report type (declared in include/linux/hid.h)
> #define HID_INPUT_REPORT 0
> #define HID_OUTPUT_REPORT 1
> #define HID_FEATURE_REPORT 2
>
> And reportnum is the report number (the one matching the report ID if
> you look at the report descriptors.
>
> I am as much as puzzled as you regarding the fact that writing the urb
> directly works with '1' when it doesn't with the HID stack...
>
> Actually, the HID stack would overwrite the first byte with the report
> ID, which explains why the report gets changed.
>
> However, why was the initial call setting a HID report ID of 1 but
> then addressing the report 2??? That's probably a mystery we won't
> solve :)
>
> >
> > Despite the error message related to scheduling, I have not been able to
> > pinpoint the source of the hard freeze. Any hint there would be appreciated.
>
> I would have to think about this a little bit more, but I have been
> dragged all day with other internal work :(
>
> >
> > Lastly, I wanted to point out that for the PS4 dongle support, the
> > magic data is
> > not sent via control transfers, but through interrupt transfers. Does the HID
> > infrastructure have the necessary mechanisms to do that as well or will we
> > have to resort to the direct USB calls (like currently done in the patch
> > I submitted)?
>
> We have usbhid_output_report in this file, which can be genetically
> called via hid_hw_output_report()
>
> Also, IIRC it happens that sometimes a device would accept both
> interrupt or control transfers for these kind of methods. It might be
> interesting to see if you can not have a common path between the 2.
>

Following your insights, I tested whether the PS4 support could be performed
as a control transfer instead of interrupt. It can! However, the
inverse does not,
 i.e., I tried using interrupt transfers instead of control transfers
for the PS3
dongle and it didn't work. I found this very interesting. Thank you for
mentioning it.

Besides, I looked into hid_hw_raw_request() and noted that it uses
usb_control_msg().
The documentation mentions the following about usb_control_msg():
"Don't use this
function from within an interrupt context. If you need an asynchronous message,
or need to send a message from within interrupt context, use usb_submit_urb()."

Looking at how hid_hw_raw_request() is often used, it is performed
during probe(),
before HID reports begin polling. In our case, we are attempting to schedule a
control transfer while the device is constantly polling for HID
reports. Therefore,
if I understand correctly, the likelihood of using usb_submit_urb()
(via hid_hw_raw_request()) within interrupt context is high. Thus, we should
not use hid_hw_raw_request(). Does this sound plausible?

I tried to find a function from within HID that uses usb_submit_urb() to
send a control transfer, but failed. Any insight?

Lastly, based on the experiments mentioned above, I could change the
PS4-dongle support to use control transfers instead of interrupt transfers,
therefore sharing more codepaths with the PS3-dongle support. Is that
something that would be appreciated?

Thank you,

-Daniel
