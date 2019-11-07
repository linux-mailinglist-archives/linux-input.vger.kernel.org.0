Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7EDFF2A27
	for <lists+linux-input@lfdr.de>; Thu,  7 Nov 2019 10:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387585AbfKGJHe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Nov 2019 04:07:34 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:43203 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1733139AbfKGJHe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Nov 2019 04:07:34 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 3A48F48B;
        Thu,  7 Nov 2019 04:07:33 -0500 (EST)
Received: from imap27 ([10.202.2.77])
  by compute3.internal (MEProxy); Thu, 07 Nov 2019 04:07:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mxxn.io; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=AQejw
        mKS2aKZE7g8GyM5M2En9zW3SmbfeBJsb9jeEmI=; b=ronHlYQbyPmQXAjmDwmI8
        TAj/kTPUMzHF4e/4uJT+k7tOO8kvUnHyzLd2eeHfxVIvoNn/K4zrYcBH2D8TfyYz
        IseIKiYqoP7mWLZdxTJctXiOzc+AC0ohZn96f5Pb3kGT8QZ+qLLXdMCr22M3sQKV
        keO0z9tV5Xm3MygZ9P1SpNJAProrXjCdr23Zpeys4/Xz1YsQHGQd1UPG/Tv35NnO
        vh2p2bFGgqJTcMf5HaJggo8MaAEJ3wfRV0onGjQgdzRdC/fPVRcQ0p3xLww0zL7K
        DVmnPNUg+Ynhn1BVBSem6SyAerAx63nWOUu3MU/CUcEuXPLtNBYjGvyHtrxAUaIA
        g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=AQejwmKS2aKZE7g8GyM5M2En9zW3SmbfeBJsb9jeE
        mI=; b=AvbBa09npWQrnLKBgLh0j/GVlkK9vUmGj540beZyNujOiWeyJFCpSQydY
        7wrDSOoN+jO0nDZ8oKpah3g46G53i7W/yoz423aRTrSCT1eyUuOic+a8nseiHFMv
        qF5KgO/t4qxDC/MolbxSbf3mevUAqJUqGl26cws3AoIafI9iuTgAGJTHOhuTnoO/
        ljMu7G5ha2c1O+oEzMu5p71g09+37uLOVzEXIk8klyznRJOJeEH33KK9h94jBC1v
        FEjHCADELyB89C4tk+lpeJD67zm+lTTIVSLPNDPdMaY58TPSPErCWDOjd3phY3Yx
        f598qjXtTY1OtKnJM7fiiutNgnJlw==
X-ME-Sender: <xms:1N7DXdyKEgDJSMqiKMM8oPDd6SZhg-Iaz0RJSyJANtF7Zkik2CeI6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddulecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepuehlrgkkpgfj
    rhgrshhtnhhikhcuoegslhgriiesmhiggihnrdhioheqnecuffhomhgrihhnpehfrhgvvg
    guvghskhhtohhprdhorhhgnecurfgrrhgrmhepmhgrihhlfhhrohhmpegslhgriiesmhig
    gihnrdhiohenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:1N7DXfhzu3gjcW43kOFM0cVP7jipjcP1PGSotwryb9r4pDlePLPMxw>
    <xmx:1N7DXXZP4Ogt5oU9m53BSaBtOG6iQm_Ma9Ein6BclnapjvrLAFPqsw>
    <xmx:1N7DXYffXnC6qg6_TQoHnFm5WE5se_1tiCLrsPCgVX_5Qnws2GTFbg>
    <xmx:1N7DXcbRco8PsHWydR5Dmi99T1P5fT2u75e8hp0IPJHfQwHxiqaYTQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 7CC4DD2009F; Thu,  7 Nov 2019 04:07:32 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-509-ge3ec61c-fmstable-20191030v1
Mime-Version: 1.0
Message-Id: <fe67c7d0-1671-4bc4-af9f-7207d1f1a18e@www.fastmail.com>
In-Reply-To: <CAO-hwJKJvkW2_Dif4+P7ebBXwb-tLk+PHqks7yqevVZ-CHyTCQ@mail.gmail.com>
References: <20191106110246.70937-1-blaz@mxxn.io>
 <CAO-hwJKJvkW2_Dif4+P7ebBXwb-tLk+PHqks7yqevVZ-CHyTCQ@mail.gmail.com>
Date:   Thu, 07 Nov 2019 18:06:21 +0900
From:   =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
To:     "Benjamin Tissoires" <benjamin.tissoires@redhat.com>
Cc:     "Jiri Kosina" <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] HID: Improve Windows Precision Touchpad detection.
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I've submitted a test containing the Surface Book 2 descriptor.

https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/59

Bla=C5=BE

On Thu, 7 Nov 2019, at 17:48, Benjamin Tissoires wrote:
> Hi Bla=C5=BE,
>=20
> On Wed, Nov 6, 2019 at 12:03 PM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrot=
e:
> >
> > Per Microsoft spec, usage 0xC5 (page 0xFF) returns a blob containing=

> > data used to verify the touchpad as a Windows Precision Touchpad.
> >
> >    0x85, REPORTID_PTPHQA,    //    REPORT_ID (PTPHQA)
> >     0x09, 0xC5,              //    USAGE (Vendor Usage 0xC5)
> >     0x15, 0x00,              //    LOGICAL_MINIMUM (0)
> >     0x26, 0xff, 0x00,        //    LOGICAL_MAXIMUM (0xff)
> >     0x75, 0x08,              //    REPORT_SIZE (8)
> >     0x96, 0x00, 0x01,        //    REPORT_COUNT (0x100 (256))
> >     0xb1, 0x02,              //    FEATURE (Data,Var,Abs)
> >
> > However, some devices, namely Microsoft's Surface line of products
> > instead implement a "segmented device certification report" (usage 0=
xC6)
> > which returns the same report, but in smaller chunks.
> >
> >     0x06, 0x00, 0xff,        //     USAGE_PAGE (Vendor Defined)
> >     0x85, REPORTID_PTPHQA,   //     REPORT_ID (PTPHQA)
> >     0x09, 0xC6,              //     USAGE (Vendor usage for segment =
#)
> >     0x25, 0x08,              //     LOGICAL_MAXIMUM (8)
> >     0x75, 0x08,              //     REPORT_SIZE (8)
> >     0x95, 0x01,              //     REPORT_COUNT (1)
> >     0xb1, 0x02,              //     FEATURE (Data,Var,Abs)
> >     0x09, 0xC7,              //     USAGE (Vendor Usage)
> >     0x26, 0xff, 0x00,        //     LOGICAL_MAXIMUM (0xff)
> >     0x95, 0x20,              //     REPORT_COUNT (32)
> >     0xb1, 0x02,              //     FEATURE (Data,Var,Abs)
> >
> > By expanding Win8 touchpad detection to also look for the segmented
> > report, all Surface touchpads are now properly recognized by
> > hid-multitouch.
> >
> > Signed-off-by: Bla=C5=BE Hrastnik <blaz@mxxn.io>
> > ---
>=20
> This looks good to me.
> We *could* shorten the ifs and make only one conditional, but I find
> it this way more readable and future proof.
>=20
> There is just one last step required before we merge this: add a
> regression test so we ensure we do not break it in the future.
>=20
> It should be merely a matter of sending a MR to
> https://gitlab.freedesktop.org/libevdev/hid-tools.
> It should consist in adding the report descriptor in the same way we
> have=20
> https://gitlab.freedesktop.org/libevdev/hid-tools/blob/master/tests/te=
st_multitouch.py#L1656-1658.
> Then, make sure an unpatched kernel breaks the multitouch test (sudo
> pytest-3 -k 'multitouch and TestPTP') and that a patched kernel is
> fixed.
>=20
> Cheers,
> Benjamin
>=20
> >  drivers/hid/hid-core.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 63fdbf09b044..2af597cd5d65 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -742,6 +742,10 @@ static void hid_scan_feature_usage(struct hid_p=
arser *parser, u32 usage)
> >         if (usage =3D=3D 0xff0000c5 && parser->global.report_count =3D=
=3D 256 &&
> >             parser->global.report_size =3D=3D 8)
> >                 parser->scan_flags |=3D HID_SCAN_FLAG_MT_WIN_8;
> > +
> > +       if (usage =3D=3D 0xff0000c6 && parser->global.report_count =3D=
=3D 1 &&
> > +           parser->global.report_size =3D=3D 8)
> > +               parser->scan_flags |=3D HID_SCAN_FLAG_MT_WIN_8;
> >  }
> >
> >  static void hid_scan_collection(struct hid_parser *parser, unsigned=
 type)
> > --
> > 2.23.0
> >
>=20
>
