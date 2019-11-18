Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB7B5100203
	for <lists+linux-input@lfdr.de>; Mon, 18 Nov 2019 11:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbfKRKEa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Nov 2019 05:04:30 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:24087 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726490AbfKRKEa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Nov 2019 05:04:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574071468;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rIf/Elci/1PK0huoWDjxcN09AY9Hw5H1mVv9fFN249U=;
        b=JzjdIoy87rzmGY2NN/aua9ALqoyN/rVQr5+w/9dH2phIbt50Bl0wCiGZjJFuis467bVOYB
        Cwj7dw3N48HeiD9oCrOyQW9aEME2AWDJSM3t7k3TMQyWcQDOilXcvrS14cBAAKHqV/5CDX
        EPszPRzeMiISBIc8L/qj35mVfE2CStc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-7jU_bas3N1Gp29ogw-Jaug-1; Mon, 18 Nov 2019 05:04:25 -0500
Received: by mail-qt1-f197.google.com with SMTP id o13so11949237qtr.3
        for <linux-input@vger.kernel.org>; Mon, 18 Nov 2019 02:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rIf/Elci/1PK0huoWDjxcN09AY9Hw5H1mVv9fFN249U=;
        b=JiKjiOcO4O8a52jvLvNQf1sKYn5EvU34LVTc64jxF4YAjZAZ8Qx1c8bWtL1510SIuS
         FZBrZrRCeVi4oxCEetFPDYYCxPdt8z2yagShlPC+ZDgTO6qzuq8tOPgMKjo+uvRmzY7m
         0FTId9T9vzZdcwLC4CwhvJRopZb42e8nPwhBNDsnBhUA/0zAMp3vP7O+8LPrNIWqPPX1
         k5k1m6qFN0vxKHiq3MAJTSHh6Y/gAWT387c/M7ypmm93ElVHUY/ixgkwxSkrqg1SXMNW
         9vTuX89/a78ZgV0e5W3bl45JRXxmIeWZq2/MfjN7idgJ1ez4+QrIAYZHKlZpDnmEqCn0
         +/xA==
X-Gm-Message-State: APjAAAUnGwNzOrp2xR/IOT9teqrvPflVQmmxlk0lBfXhOqbdSNgawsUH
        YcSIBNr2a1pj+rXa/uRduALS9YFWIthOYoI9xriFHqZOcHCr2wIKsCk4zy1QebY2DBr/Q2ZXb1K
        1zDJyrhJEhS1spVCPaSp2LQ+eudk4hEeIUbreGxw=
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr26210142qtk.31.1574071465159;
        Mon, 18 Nov 2019 02:04:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqxsgkkz8U8+oY5+uVRbEVc93nkjpCuZ7HAjhItwcXa/waH3/AbWciwFV17NEuELPUBGZ9f4PmADEh6f8dVT7bk=
X-Received: by 2002:ac8:1c03:: with SMTP id a3mr26210122qtk.31.1574071464941;
 Mon, 18 Nov 2019 02:04:24 -0800 (PST)
MIME-Version: 1.0
References: <20191106110246.70937-1-blaz@mxxn.io> <CAO-hwJKJvkW2_Dif4+P7ebBXwb-tLk+PHqks7yqevVZ-CHyTCQ@mail.gmail.com>
 <fe67c7d0-1671-4bc4-af9f-7207d1f1a18e@www.fastmail.com>
In-Reply-To: <fe67c7d0-1671-4bc4-af9f-7207d1f1a18e@www.fastmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 18 Nov 2019 11:04:13 +0100
Message-ID: <CAO-hwJ+8hUGkKDiNoZtGYPD9vdPA3a64esHi1cN1E5odrOemsA@mail.gmail.com>
Subject: Re: [PATCH] HID: Improve Windows Precision Touchpad detection.
To:     =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: 7jU_bas3N1Gp29ogw-Jaug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 7, 2019 at 10:07 AM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrote:
>
> I've submitted a test containing the Surface Book 2 descriptor.
>
> https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/59

Thanks.

Patch is now queued in branch for-5.5/core.

Cheers,
Benjamin

>
> Bla=C5=BE
>
> On Thu, 7 Nov 2019, at 17:48, Benjamin Tissoires wrote:
> > Hi Bla=C5=BE,
> >
> > On Wed, Nov 6, 2019 at 12:03 PM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrote=
:
> > >
> > > Per Microsoft spec, usage 0xC5 (page 0xFF) returns a blob containing
> > > data used to verify the touchpad as a Windows Precision Touchpad.
> > >
> > >    0x85, REPORTID_PTPHQA,    //    REPORT_ID (PTPHQA)
> > >     0x09, 0xC5,              //    USAGE (Vendor Usage 0xC5)
> > >     0x15, 0x00,              //    LOGICAL_MINIMUM (0)
> > >     0x26, 0xff, 0x00,        //    LOGICAL_MAXIMUM (0xff)
> > >     0x75, 0x08,              //    REPORT_SIZE (8)
> > >     0x96, 0x00, 0x01,        //    REPORT_COUNT (0x100 (256))
> > >     0xb1, 0x02,              //    FEATURE (Data,Var,Abs)
> > >
> > > However, some devices, namely Microsoft's Surface line of products
> > > instead implement a "segmented device certification report" (usage 0x=
C6)
> > > which returns the same report, but in smaller chunks.
> > >
> > >     0x06, 0x00, 0xff,        //     USAGE_PAGE (Vendor Defined)
> > >     0x85, REPORTID_PTPHQA,   //     REPORT_ID (PTPHQA)
> > >     0x09, 0xC6,              //     USAGE (Vendor usage for segment #=
)
> > >     0x25, 0x08,              //     LOGICAL_MAXIMUM (8)
> > >     0x75, 0x08,              //     REPORT_SIZE (8)
> > >     0x95, 0x01,              //     REPORT_COUNT (1)
> > >     0xb1, 0x02,              //     FEATURE (Data,Var,Abs)
> > >     0x09, 0xC7,              //     USAGE (Vendor Usage)
> > >     0x26, 0xff, 0x00,        //     LOGICAL_MAXIMUM (0xff)
> > >     0x95, 0x20,              //     REPORT_COUNT (32)
> > >     0xb1, 0x02,              //     FEATURE (Data,Var,Abs)
> > >
> > > By expanding Win8 touchpad detection to also look for the segmented
> > > report, all Surface touchpads are now properly recognized by
> > > hid-multitouch.
> > >
> > > Signed-off-by: Bla=C5=BE Hrastnik <blaz@mxxn.io>
> > > ---
> >
> > This looks good to me.
> > We *could* shorten the ifs and make only one conditional, but I find
> > it this way more readable and future proof.
> >
> > There is just one last step required before we merge this: add a
> > regression test so we ensure we do not break it in the future.
> >
> > It should be merely a matter of sending a MR to
> > https://gitlab.freedesktop.org/libevdev/hid-tools.
> > It should consist in adding the report descriptor in the same way we
> > have
> > https://gitlab.freedesktop.org/libevdev/hid-tools/blob/master/tests/tes=
t_multitouch.py#L1656-1658.
> > Then, make sure an unpatched kernel breaks the multitouch test (sudo
> > pytest-3 -k 'multitouch and TestPTP') and that a patched kernel is
> > fixed.
> >
> > Cheers,
> > Benjamin
> >
> > >  drivers/hid/hid-core.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > > index 63fdbf09b044..2af597cd5d65 100644
> > > --- a/drivers/hid/hid-core.c
> > > +++ b/drivers/hid/hid-core.c
> > > @@ -742,6 +742,10 @@ static void hid_scan_feature_usage(struct hid_pa=
rser *parser, u32 usage)
> > >         if (usage =3D=3D 0xff0000c5 && parser->global.report_count =
=3D=3D 256 &&
> > >             parser->global.report_size =3D=3D 8)
> > >                 parser->scan_flags |=3D HID_SCAN_FLAG_MT_WIN_8;
> > > +
> > > +       if (usage =3D=3D 0xff0000c6 && parser->global.report_count =
=3D=3D 1 &&
> > > +           parser->global.report_size =3D=3D 8)
> > > +               parser->scan_flags |=3D HID_SCAN_FLAG_MT_WIN_8;
> > >  }
> > >
> > >  static void hid_scan_collection(struct hid_parser *parser, unsigned =
type)
> > > --
> > > 2.23.0
> > >
> >
> >

