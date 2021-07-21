Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB813D15FD
	for <lists+linux-input@lfdr.de>; Wed, 21 Jul 2021 20:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238125AbhGUReu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Jul 2021 13:34:50 -0400
Received: from mail-eopbgr670133.outbound.protection.outlook.com ([40.107.67.133]:9263
        "EHLO CAN01-TO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238061AbhGURer (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Jul 2021 13:34:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hvUSGCjxFgl/KjcEQgQybNVYJHma5J5pKmh5x4JBZPw/fyPlrCBn1eiqntew6tWUMAF0MU/pqPOWfR7BKT5lGfwPHlUYVytfJLfCUzTLEliHv9FozY6pJ51HvPnfdFR1/BoLBvZq2TVP3M/rtslI535dggfv/uJt5Qpa7NIP1Mg4JzejqvcU9wcGjFKnb7/AjokVrGXDzEQ1nmRru3eaODzXxGiEmd8j+k2wDZpzjs9bb/pui3FKQj+saIF3QBvCY9EjZCzrzefvGOoQRlUVWK0cq0BN6IPAuoBY3WIpMEHRw7ajD2L5iuAr8s2zC4pOPnxRkRW4li9nexQRr1vYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KixvZftyQ0o7Dvf59fVu+KKQ5hwUvxBInSJlAfBvP1A=;
 b=DmspZAELbiXgE+aMMojSMcglB3lgs2cAQvx+4AWstfvsI4gEr58/TC/COUd3/juNaKDUxYluQiWMihfzYPUilcWm59f7CJ2KM8QNW3w4aqP/wUhIP5AkJP4rk5PJn2To6CkVD8jUckEScrM/y22Elr9DkyUDWU9O3AdOwCJo/koBwPl/bPW0FEKDxn3+q+4xhgSQP6jW9U2wOyQ8tbexQacO9U8ljpMGW9bFZFwjSbKx+/Us0L9LADDive7U+R8C4ZDweGiDe2LBLyl2kp6P4VF/HRD5BoGzufC12+F84VBZ68KAl8PuWn6OMCiMBJCC3spL+iM/8yTQyL/UCJm0RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ens.etsmtl.ca; dmarc=pass action=none
 header.from=ens.etsmtl.ca; dkim=pass header.d=ens.etsmtl.ca; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ens.etsmtl.ca;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KixvZftyQ0o7Dvf59fVu+KKQ5hwUvxBInSJlAfBvP1A=;
 b=DjJsD31pz1WhnOIQH6Gb0txk6Fc98Rgx9qvWVx1Lrup8QWKwUOitEXL6JkEmR6lhTi448Ya14zDGSaTUtpRHS8lscsP+gFRjKZNwYSCei8phUJGyCDCFljcACvMPbdeUfFi29NrmZ1+60NYP3SkgETugC4e2OaM/Uc7voAyhbmZ4uXlIquOMKIkQhmWXgIlrOSRls2xV92T3DXHXKm4yqz5SNy26DEFYDh/+4Em77vsVr+o+tlwkKyJ6rJtXtGCUSZoglD9Kx+bP6u8fEgNtZGJNfTQlpCv18UkuL8f0e0JYPMq1i8NMAgT/2mXwbzfdDIQMgIqu4pUzbKq2XWdTmA==
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=ens.etsmtl.ca;
Received: from YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:a::30)
 by YQBPR0101MB1460.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c00:a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23; Wed, 21 Jul
 2021 18:15:20 +0000
Received: from YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::f106:755:f2bd:df99]) by YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::f106:755:f2bd:df99%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 18:15:20 +0000
X-Gm-Message-State: AOAM533D6BNEakmVPlYJAWUqN0mMgIZoPSi7mY/H7c2eIsvKIoXfltOG
        N0cU+Smd4yNBg5JeauERimQJIjozDSHdMvea39g=
X-Google-Smtp-Source: ABdhPJwxxO4Z6ZJTSaTs+QF8yOlHU7hb52eBK5Yk2UE6GbhVKGvbC72MLraTdA69lgE9teN+XTN9g06Cv1NHM0KaPXw=
X-Received: by 2002:a02:a913:: with SMTP id n19mr32579351jam.7.1626891316931;
 Wed, 21 Jul 2021 11:15:16 -0700 (PDT)
References: <20210715195720.169385-1-daniel.nguyen.1@ens.etsmtl.ca>
 <951c38d5-934e-eca7-a025-9cf074771764@redhat.com> <CAJNNDmn5V94mb0G9ZfxWDadxe17tEDKqWtfJErSjQxiRFd0ycA@mail.gmail.com>
 <CAO-hwJLog04U6WHZq3qEKf_bbW5wU3bL+m7zbY6h=x2neK58AQ@mail.gmail.com>
In-Reply-To: <CAO-hwJLog04U6WHZq3qEKf_bbW5wU3bL+m7zbY6h=x2neK58AQ@mail.gmail.com>
From:   Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca>
Date:   Wed, 21 Jul 2021 14:15:05 -0400
X-Gmail-Original-Message-ID: <CAEJV-FFyt_34ts2RF-dkc5Xdez_ZWzCKu9iRzHHom610XbHVDA@mail.gmail.com>
Message-ID: <CAEJV-FFyt_34ts2RF-dkc5Xdez_ZWzCKu9iRzHHom610XbHVDA@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: support for the ghlive ps4 dongles
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Pascal Giard <pascal.giard@etsmtl.ca>,
        "Colenbrander, Roelof" <Roderick.Colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-ClientProxiedBy: BLAPR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:208:329::27) To YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:a::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-io1-f51.google.com (209.85.166.51) by BLAPR03CA0082.namprd03.prod.outlook.com (2603:10b6:208:329::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Wed, 21 Jul 2021 18:15:19 +0000
Received: by mail-io1-f51.google.com with SMTP id r18so3386922iot.4        for <linux-input@vger.kernel.org>; Wed, 21 Jul 2021 11:15:19 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e722184c-994e-48c8-1327-08d94c737fb3
X-MS-TrafficTypeDiagnostic: YQBPR0101MB1460:
X-Microsoft-Antispam-PRVS: <YQBPR0101MB1460EF9C97A0795794913596A3E39@YQBPR0101MB1460.CANPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fYHMoTbB1giqEdbEhD8xwx3ujyVoc0g8r1tLZq9IeLPifzNFLe3ET57eTwjopmfWd5ci+KEO6Ct9P0O+gnuGm8e6sufafjyWtdOGUXBFizXxFJWQX9s3rvxtnvXcBu1LX/MPvKdedT8U+KGUQbNjrv3v2O3hiI4etri3FgQJBpH1aKa+V5xT/n8tPk9Gq5YpGRM7lfLb/uO+yvYBARZJXDt42dJLCv3tyNy6vgZV0c35qei3LoTYW3JDjIGIkuBL/R4EbGUIXaLrfpgvf3/IMEfWFvLqRv/RcUlWhfGr9ZMZXT65Gi/bATfR4mTj/GaTQgj8yzlZITGjO/1cCpuXbEUAeamCDlYo88M8DsWrIpbhNVAGyuAn0g5KnuK3oNN3WL4kq1wCU5yRAkD3K/m4Vdqfr8ndyFOXmGWQry5XtW8jV+PPo2Hh2dZvMemMooJmN93QEVJTwkvW76m3vAXkRp2xPanE6R3uINd5fWO8T3avIazy5ES8W2HIeRoclhypaepLXgBRPd118NrbfaNr8HE83CDA8MlzcDIm7QEMNKVCRCxhIfNLS5RzdY/jrb6hWN96XhtrANtEQa0LkPjaAQwuA+pjUBwtxR492hNB1IlRWiJNFPiorvM3T05hziWGKVckXb3cpi+8K/0dkOQzxm8i7Bh3OxqPKEP30fR8S2eK38d8UUDrfd2PKxw2ST0lINXO4Cc6MIASNczjPaWRTuZByG8xwxQNJX2Dl15p3HwVdwQEEYY51Jivn9HtkLx/6m5R/H9j/QT0SdkOxuFWVtsxo8orhC4pH6j60g1aJCg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(366004)(346002)(6862004)(786003)(478600001)(316002)(6666004)(2906002)(66946007)(66556008)(66476007)(9686003)(8676002)(55446002)(42186006)(5660300002)(38350700002)(52116002)(26005)(38100700002)(4326008)(8936002)(186003)(966005)(83380400001)(86362001)(53546011)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHRKNlMwd3pRZjJteHRaL1J5WHN0STc0NFZvNDJuTG13ZzFzbnMwZE9ZRnRw?=
 =?utf-8?B?TWVBS2h2TXdXMERhY0FHbHU2WW1uNzY4N1psR2NiekU1aEFsMk92bTR3akcr?=
 =?utf-8?B?VW1HdjZtMkNIL1NCcHVLZXR0QWMrSWhVQjhqa2FnOVl5a3A2dmkrSEI0NnFS?=
 =?utf-8?B?STQweGpETUZMZ293WjhqRkFIcGRWMEpUVEw3NzF1RG9ObkQyUEE4MUZhREZN?=
 =?utf-8?B?UVVjam10Q21rU2VPWWd6VW8vbmdCY3hub0ZVdnQ4NnF0LzNzSG1yaldQUFRE?=
 =?utf-8?B?Z0duYmdaNXF5OWREWExEeWpBenJLOEVvbXVOVzRRRnRvSTkzTUowOHhEeCtU?=
 =?utf-8?B?Y2VzTm1Tak5KajdFT1U0WkY2bzNyTnh6anpLT1kwbkpsY1V4TjFwZ0p3VU4w?=
 =?utf-8?B?UmowUnlWeFk0V3BuSUVDK2U2c2Fid3RQaW05N1NJY1ZybzJXM1dKVGhMTHpz?=
 =?utf-8?B?VXFKNTFkeis0MHV0S2JxNU1sRlBTdnlUQlQ4VTJFMnl2ZllEbW4zYTFnb1Q3?=
 =?utf-8?B?dHNvdG8ySlUwOFFPQXd2RHpXam5xQVpkVkkxZ3p4cGpPQ08wcDNSZkhJKy84?=
 =?utf-8?B?cE0xNE8rSDBQMmdDWFZQN2YyczltVmFqZythWFhFL09ra0t0ckZRd2xFT1hn?=
 =?utf-8?B?RVZmWTB5NkhjZCtzMWZJYTVJejNKaFd1aVlPTlV4LzFHYm0zVWNXNkJnOXB3?=
 =?utf-8?B?RlZxTDhDblJjYitrYWhSTGJvQ004aU4xRHppeGFieGwvTWwyVWFhaGJleWxk?=
 =?utf-8?B?MmQxL3hzT2IyT0QyT1pQNmhRcndSSVFzMUVBWHJRNnBRbmdmVVNvVXZEeTl0?=
 =?utf-8?B?NjdRemJoR3laQzZIbk51c3JLRXNUUCs5R1JYTFBrb2ptRkJjMW9odXduVFR5?=
 =?utf-8?B?ZW9FakNVWTF0ZzlmQVJiVmo4YWFCYjFlRTAxWkIvY3pYaGJPY3BrdG9QQmta?=
 =?utf-8?B?WEVvVURlQ3VPYXRNeGpUd0Z4U3d5TGlBRUJ6RTQrWTJBdlFZUENxQmloTXFu?=
 =?utf-8?B?enZlT3JQbHc3dXVvNUtZMnNHUldVcGVDQjNrbGtrL3Q4TkdGNHY0cXgyYkZC?=
 =?utf-8?B?VGpSZkszeWU2V1JNS0p2WHRicG5vc3pSRWFvU3VPU2QxR0FtL3NlUTF6SFB3?=
 =?utf-8?B?M1FCa01OZjhZRzcyVWdOM3EzNlV0ZGxteFp4blZIN3hlalkwTFVwK0RHbkY5?=
 =?utf-8?B?bE51NW9KUXhiNlFZWEdPeVF6cnRUaGdIMHRGWEpxNXl1VEVkNW8vdjlOclpk?=
 =?utf-8?B?ZG1lRXFTMk1uSlRTbGQxYmR0TXBYZWg3YU1mNmlmMWtJU3pNdERpOXpYc3Ro?=
 =?utf-8?B?b3VMc3JUY2ZNbEltWnN6d3Bld0tsNUhZQ2k4Q2hzcVFMaTZPSDJ6QjN5dXZB?=
 =?utf-8?B?MmJJaFNjTm9walVWeUI0cnp3VDVMWDUxRWdGNXdsTEhkQUtnUW10Q1dQNmNs?=
 =?utf-8?B?WURzckU0djFmZVNydGh1YU1SNS9qUGczODUySnVIUllLTC82VUJnSVowVHpO?=
 =?utf-8?B?Q0FOUUt5Q3QxaURuaFE0YzdyaWdiK2lKdllpNTRNaE5RdEw4dklFRWFlUGdB?=
 =?utf-8?B?MzJHYUdhaFZlTTFFd0Q0akdyU09rU2RIK1UvbXJEcmduOGJIMjB1YnFzcWNy?=
 =?utf-8?B?Wjd1dWZxemNuWXNpeCtWZk5GTUpXWDlXQlM3Sk5HY0RhYUhkeHQrY2tVYlg2?=
 =?utf-8?B?UWZpdkVielpMNXRkQnQ0VUZEdkROcXpteGliR2lCS2JwbitLZk8vSkY3T25q?=
 =?utf-8?Q?3AYFw4nfdnOiHmedwdE5GwgCcwG3htM2p0G3JxF?=
X-OriginatorOrg: ens.etsmtl.ca
X-MS-Exchange-CrossTenant-Network-Message-Id: e722184c-994e-48c8-1327-08d94c737fb3
X-MS-Exchange-CrossTenant-AuthSource: YQBPR0101MB1331.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2021 18:15:19.9847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 70aae3b7-9f3b-484d-8f95-49e8fbb783c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GK6+xqXlrglTe2ylXBYC3rGWa6aA8HAVxkN6QcmEZ6J2T7a6zAH0oitcNzip78PxGvLHNyDyhyO0hBdQ0KdRlQdf9t0EuBV2ddrBRN++4yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YQBPR0101MB1460
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Benjamin,

On Wed, Jul 21, 2021 at 6:16 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Tue, Jul 20, 2021 at 4:33 PM Pascal Giard <pascal.giard@etsmtl.ca> wrote:
> >
> > Hi Benjamin,
> >
> > On Tue, Jul 20, 2021 at 7:39 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > Hi Daniel (and Pascal),
> > >
> > > [adding Roderick in Cc who is dealing with the Sony driver from Sony
> > > itself :) ]
> > >
> > >
> > > On Thu, Jul 15, 2021 at 9:58 PM Daniel Nguyen <daniel.nguyen.1@ens.etsmtl.ca> wrote:
> > > >
> > > > This commit adds support for the Guitar Hero Live PS4 dongles.
> > >
> > > I was about to ask you to add some regression tests to
> > > https://gitlab.freedesktop.org/libevdev/hid-tools/-/blob/master/tests/test_sony.py
> > >
> > > This would likely have avoided the previous patch that was required and
> > > cc-ed to stable.
> > >
> > > But after looking slightly at the patch, I realized that the Guitar Hero
> > > code uses direct USB calls, which is not something we can emulate at the
> > > hid-tools level.
> > >
> > > However, after a second look at the code, I think that this part of the
> > > code just reimplements its own HID SET_OUTPUT code, and that is
> > > something we can easily emulate.
> > >
> > > Could you check if the following patch is still working properly on a
> > > PS3 dongle? and if so, add your PS4 support on top?
> > >
> > [...]
> >
> > I wasn't aware that this was possible. Of course we will check whether
> > that works or not.
> >
> > > ---
> > > commit 10e14f105553d2bd88bc7748e87154c5a8131e9e
> > > Author: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > Date:   Tue Jul 20 11:44:10 2021 +0200
> > >
> > >      HID: sony: GHL: do not use raw USB calls
> > >
> > >      We can rely on HID to do the job for us.
> > >      This simplifies the code and also allows to implement regression tests.
> > >
> > >      Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > >
> > > diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> > > index b3722c51ec78..901f61d286e8 100644
> > > --- a/drivers/hid/hid-sony.c
> > > +++ b/drivers/hid/hid-sony.c
> > > @@ -37,7 +37,6 @@
> > >   #include <linux/idr.h>
> > >   #include <linux/input/mt.h>
> > >   #include <linux/crc32.h>
> > > -#include <linux/usb.h>
> > >   #include <linux/timer.h>
> > >   #include <asm/unaligned.h>
> > >
> > > @@ -92,7 +91,7 @@
> > >    * https://github.com/ghlre/GHLtarUtility/blob/master/PS3Guitar.cs
> > >    * Note: The Wii U and PS3 dongles happen to share the same!
> > >    */
> > > -static const u16 ghl_ps3wiiu_magic_value = 0x201;
> > > +static const u16 ghl_ps3wiiu_magic_report = 1;
> > >   static const char ghl_ps3wiiu_magic_data[] = {
> > >         0x02, 0x08, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00
> > >   };
> > > @@ -597,7 +596,6 @@ struct sony_sc {
> > >         /* DS4 calibration data */
> > >         struct ds4_calibration_data ds4_calib_data[6];
> > >         /* GH Live */
> > > -       struct urb *ghl_urb;
> > >         struct timer_list ghl_poke_timer;
> > >   };
> > >
> > > @@ -622,56 +620,29 @@ static inline void sony_schedule_work(struct sony_sc *sc,
> > >         }
> > >   }
> > >
> > > -static void ghl_magic_poke_cb(struct urb *urb)
> > > -{
> > > -       struct sony_sc *sc = urb->context;
> > > -
> > > -       if (urb->status < 0)
> > > -               hid_err(sc->hdev, "URB transfer failed : %d", urb->status);
> > > -
> > > -       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > -}
> > > -
> > >   static void ghl_magic_poke(struct timer_list *t)
> > >   {
> > >         int ret;
> > >         struct sony_sc *sc = from_timer(sc, t, ghl_poke_timer);
> > > +       const int buf_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > > +       u8 *buf;
> > >
> > > -       ret = usb_submit_urb(sc->ghl_urb, GFP_ATOMIC);
> > > -       if (ret < 0)
> > > -               hid_err(sc->hdev, "usb_submit_urb failed: %d", ret);
> > > -}
> > > -
> > > -static int ghl_init_urb(struct sony_sc *sc, struct usb_device *usbdev)
> > > -{
> > > -       struct usb_ctrlrequest *cr;
> > > -       u16 poke_size;
> > > -       u8 *databuf;
> > > -       unsigned int pipe;
> > > -
> > > -       poke_size = ARRAY_SIZE(ghl_ps3wiiu_magic_data);
> > > -       pipe = usb_sndctrlpipe(usbdev, 0);
> > > +       buf = kmemdup(ghl_ps3wiiu_magic_data, buf_size, GFP_KERNEL);
> > > +       if (!buf)
> > > +               return;
> > >
> > > -       cr = devm_kzalloc(&sc->hdev->dev, sizeof(*cr), GFP_ATOMIC);
> > > -       if (cr == NULL)
> > > -               return -ENOMEM;
> > > +       ret = hid_hw_raw_request(sc->hdev, ghl_ps3wiiu_magic_report, buf,
> > > +                                buf_size,
> > > +                                HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
> > > +       if (ret < 0) {
> > > +               hid_err(sc->hdev, "can't poke ghl magic\n");
> > > +               goto out;
> > > +       }
> > >
> > > -       databuf = devm_kzalloc(&sc->hdev->dev, poke_size, GFP_ATOMIC);
> > > -       if (databuf == NULL)
> > > -               return -ENOMEM;
> > > +       mod_timer(&sc->ghl_poke_timer, jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > >
> > > -       cr->bRequestType =
> > > -               USB_RECIP_INTERFACE | USB_TYPE_CLASS | USB_DIR_OUT;
> > > -       cr->bRequest = USB_REQ_SET_CONFIGURATION;
> > > -       cr->wValue = cpu_to_le16(ghl_ps3wiiu_magic_value);
> > > -       cr->wIndex = 0;
> > > -       cr->wLength = cpu_to_le16(poke_size);
> > > -       memcpy(databuf, ghl_ps3wiiu_magic_data, poke_size);
> > > -       usb_fill_control_urb(
> > > -               sc->ghl_urb, usbdev, pipe,
> > > -               (unsigned char *) cr, databuf, poke_size,
> > > -               ghl_magic_poke_cb, sc);
> > > -       return 0;
> > > +out:
> > > +       kfree(buf);
> > >   }
> > >
> > >   static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
> > > @@ -2968,7 +2939,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > >         int ret;
> > >         unsigned long quirks = id->driver_data;
> > >         struct sony_sc *sc;
> > > -       struct usb_device *usbdev;
> > >         unsigned int connect_mask = HID_CONNECT_DEFAULT;
> > >
> > >         if (!strcmp(hdev->name, "FutureMax Dance Mat"))
> > > @@ -2988,7 +2958,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > >         sc->quirks = quirks;
> > >         hid_set_drvdata(hdev, sc);
> > >         sc->hdev = hdev;
> > > -       usbdev = to_usb_device(sc->hdev->dev.parent->parent);
> > >
> > >         ret = hid_parse(hdev);
> > >         if (ret) {
> > > @@ -3031,15 +3000,6 @@ static int sony_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > >         }
> > >
> > >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > > -               sc->ghl_urb = usb_alloc_urb(0, GFP_ATOMIC);
> > > -               if (!sc->ghl_urb)
> > > -                       return -ENOMEM;
> > > -               ret = ghl_init_urb(sc, usbdev);
> > > -               if (ret) {
> > > -                       hid_err(hdev, "error preparing URB\n");
> > > -                       return ret;
> > > -               }
> > > -
> > >                 timer_setup(&sc->ghl_poke_timer, ghl_magic_poke, 0);
> > >                 mod_timer(&sc->ghl_poke_timer,
> > >                           jiffies + GHL_GUITAR_POKE_INTERVAL*HZ);
> > > @@ -3054,7 +3014,6 @@ static void sony_remove(struct hid_device *hdev)
> > >
> > >         if (sc->quirks & GHL_GUITAR_PS3WIIU) {
> > >                 del_timer_sync(&sc->ghl_poke_timer);
> > > -               usb_free_urb(sc->ghl_urb);
> > >         }
> > >
> > >         hid_hw_close(hdev);
> > > ---
> >
> > Was your patch against the master branch of hid/hid.git ?
>
> It was against the branch for-next of hid/hid.git, to account for the
> PS3 fix that was sent earlier.
>
> > I'm asking because it doesn't apply at all on my end, unless I use
> > --ignore-whitespace in which case, 3 out of 8 hunks fail.
> >
> > I assume I may be doing something wrong. I tried both downloading the
> > raw message from marc.info and from patchwork in case gmail would
> > mangle spaces/tabs, same result.
> >
> > Any idea?
>
> Usually opening the source of the email, and doing `git am -3`, hit
> enter, then paste the content of the patch, then Ctrl-D is the
> quickest you can do to apply such inlined patches (at least, that's
> what I do).
>
> But Daniel found out that the patch is buggy, so let's concentrate on
> the next iteration.

I dove deeper into the proposed method and verified the functions in
order to better understand how they work. I noticed that the const that you
created (ghl_ps3wiiu_magic_report = 1) is modifying the first byte of the data
to 0x01. I also noticed that it is what creates the wValue = 0x201, which
explains why you set it to 1.

After testing, I noticed that if we maintain the wValue = 0x201, and therefore
byte[0] = 0x01, the dongle does not function as it should. However, if we
change the const (ghl_ps3wiiu_magic_report = 2), although we have
wValue = 0x202, the dongle does function as expected. That's surprising
to us. Do you have any insights into the role of wValue in this context?
We came up with 0x201 as we were simply reproducing what
we had sniffed.

Despite the error message related to scheduling, I have not been able to
pinpoint the source of the hard freeze. Any hint there would be appreciated.

Lastly, I wanted to point out that for the PS4 dongle support, the
magic data is
not sent via control transfers, but through interrupt transfers. Does the HID
infrastructure have the necessary mechanisms to do that as well or will we
have to resort to the direct USB calls (like currently done in the patch
I submitted)?

Thank you for your patience.
-Daniel
