Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F35F1E3DFB
	for <lists+linux-input@lfdr.de>; Wed, 27 May 2020 11:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbgE0JuS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 May 2020 05:50:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:54031 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727895AbgE0JuS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 May 2020 05:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590573015;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Wk7PTccOiB2D0BUxUJvJJDnS6DcmS8jIQiV2uW81594=;
        b=hPsi0KEGTvt6KYe8B6sXlYUexZOnDlruIwXidx79nDaf9PnmJQEdUhpxlPl/RyuugFInuz
        CTbRf4ZrH3ibUDx7XZH1Ax35BUzXLfnzslCq285vkuGi2Lld9NJVAJNp83jC6/5KF6VbhM
        OSE/USt7SE98D1IYG/c7Qtp99MBhUu0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-IU2g2K80OoOB9qsjbxuiPw-1; Wed, 27 May 2020 05:50:14 -0400
X-MC-Unique: IU2g2K80OoOB9qsjbxuiPw-1
Received: by mail-qt1-f200.google.com with SMTP id n8so8594495qtk.11
        for <linux-input@vger.kernel.org>; Wed, 27 May 2020 02:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wk7PTccOiB2D0BUxUJvJJDnS6DcmS8jIQiV2uW81594=;
        b=oz5OQD+C5PoYg7a8VbDSgd5raz15dyt+EERExy5O4KuMAoVTH5eM0Jk6XiLfuoW4lw
         SyS6jQmq0yD0y+gUfl9wuYbPDsp9of+M2kMiP8RIH7HWlMlpazwl8ZvmGAR27P2cvQI7
         fH+CB+GSoJvaautImcE2hJn6/aeDc1K0pZAfq7gXOgFS7YJhIf08VvCyEH0aRQbO/Ndb
         /GrdAMVHDspz/a2bKrvyN8UzReIB9Bx+dcRXeCQAQaPSWjC7KbqG3QBVLRUtvjGfFOAj
         HAg+pFDYmblRaOfzWIhkHHRzxD0ghUpWlouL6KNBlCYyryF1bs7l3qKeRadEoSCrnh98
         k+2A==
X-Gm-Message-State: AOAM5328SjkP/ruELsihgw6FlLitVQEPfrOAeEn3bioyxBYy7ddXsfYe
        JffKN16TYKyxZK8JVTbhbxZpQxobvfFRQzvCVBgr3yLq6C9gUKD3yG6TjzrDA7kSbGnh8WsYO9E
        wyJp2xYXkS+p/iky+3f9a/NwWSo9yfWefG753VJY=
X-Received: by 2002:a37:8a42:: with SMTP id m63mr3071570qkd.230.1590573013547;
        Wed, 27 May 2020 02:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx7RDV50fdD8q6d1cy2L1E3dJt81qR6UeDwFqEdUTY1cgMNDSGkK/Va8uOGegZ5bIh+cOKagjKwATfo9WDQI8g=
X-Received: by 2002:a37:8a42:: with SMTP id m63mr3071544qkd.230.1590573013164;
 Wed, 27 May 2020 02:50:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200526150717.324783-1-benjamin.tissoires@redhat.com>
 <27B6F419-A68E-459D-AB6B-7BF2D935C6E0@canonical.com> <CAO-hwJLPF4pSHQqFp-ogZAxKu15nbuKULTRbudhD8L4RFv4w4g@mail.gmail.com>
In-Reply-To: <CAO-hwJLPF4pSHQqFp-ogZAxKu15nbuKULTRbudhD8L4RFv4w4g@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 27 May 2020 11:50:02 +0200
Message-ID: <CAO-hwJJE6_8j-XVjVskJwmHW=DM9i5aSZZ=35jLDfjf4E1spZQ@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: enable multi-input as a quirk for some devices
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:INTEL INTEGRATED SENSOR HUB DRIVER" 
        <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 27, 2020 at 11:22 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Wed, May 27, 2020 at 8:18 AM Kai-Heng Feng
> <kai.heng.feng@canonical.com> wrote:
> >
> >
> >
> > > On May 26, 2020, at 23:07, Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > >
> > > Two touchpad/trackstick combos are currently not behaving properly.
> > > They define a mouse emulation collection, as per Win8 requirements,
> > > but also define a separate mouse collection for the trackstick.
> > >
> > > The way the kernel currently treat the collections is that it
> > > merges both in one device. However, given that the first mouse
> > > collection already defines X,Y and left, right buttons, when
> > > mapping the events from the second mouse collection, hid-multitouch
> > > sees that these events are already mapped, and simply ignores them.
> > >
> > > To be able to report events from the tracktick, add a new quirked
> > > class for it, and manually add the 2 devices we know about.
> > >
> > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=207235
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>
> Thanks for the very fast testing :)
>
> Pushed to for-5.8/multitouch given that we already are at 5.7-rc7, we
> might as well postpone it for one week.
>

Apologies for the inconvenience, I hadn't noticed my master branch was
not up to date with origin. I forced push the branch to have a better
history.

Cheers,
Benjamin

> Cheers,
> Benjamin
>
> >
> > > ---
> > > drivers/hid/hid-multitouch.c | 26 ++++++++++++++++++++++++++
> > > 1 file changed, 26 insertions(+)
> > >
> > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > index 03c720b47306..39e4da7468e1 100644
> > > --- a/drivers/hid/hid-multitouch.c
> > > +++ b/drivers/hid/hid-multitouch.c
> > > @@ -69,6 +69,7 @@ MODULE_LICENSE("GPL");
> > > #define MT_QUIRK_ASUS_CUSTOM_UP               BIT(17)
> > > #define MT_QUIRK_WIN8_PTP_BUTTONS     BIT(18)
> > > #define MT_QUIRK_SEPARATE_APP_REPORT  BIT(19)
> > > +#define MT_QUIRK_FORCE_MULTI_INPUT   BIT(20)
> > >
> > > #define MT_INPUTMODE_TOUCHSCREEN      0x02
> > > #define MT_INPUTMODE_TOUCHPAD         0x03
> > > @@ -189,6 +190,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> > > #define MT_CLS_WIN_8                          0x0012
> > > #define MT_CLS_EXPORT_ALL_INPUTS              0x0013
> > > #define MT_CLS_WIN_8_DUAL                     0x0014
> > > +#define MT_CLS_WIN_8_FORCE_MULTI_INPUT               0x0015
> > >
> > > /* vendor specific classes */
> > > #define MT_CLS_3M                             0x0101
> > > @@ -279,6 +281,15 @@ static const struct mt_class mt_classes[] = {
> > >                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> > >                       MT_QUIRK_WIN8_PTP_BUTTONS,
> > >               .export_all_inputs = true },
> > > +     { .name = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
> > > +             .quirks = MT_QUIRK_ALWAYS_VALID |
> > > +                     MT_QUIRK_IGNORE_DUPLICATES |
> > > +                     MT_QUIRK_HOVERING |
> > > +                     MT_QUIRK_CONTACT_CNT_ACCURATE |
> > > +                     MT_QUIRK_STICKY_FINGERS |
> > > +                     MT_QUIRK_WIN8_PTP_BUTTONS |
> > > +                     MT_QUIRK_FORCE_MULTI_INPUT,
> > > +             .export_all_inputs = true },
> > >
> > >       /*
> > >        * vendor specific classes
> > > @@ -1714,6 +1725,11 @@ static int mt_probe(struct hid_device *hdev, const struct hid_device_id *id)
> > >       if (id->group != HID_GROUP_MULTITOUCH_WIN_8)
> > >               hdev->quirks |= HID_QUIRK_MULTI_INPUT;
> > >
> > > +     if (mtclass->quirks & MT_QUIRK_FORCE_MULTI_INPUT) {
> > > +             hdev->quirks &= ~HID_QUIRK_INPUT_PER_APP;
> > > +             hdev->quirks |= HID_QUIRK_MULTI_INPUT;
> > > +     }
> > > +
> > >       timer_setup(&td->release_timer, mt_expired_timeout, 0);
> > >
> > >       ret = hid_parse(hdev);
> > > @@ -1926,6 +1942,11 @@ static const struct hid_device_id mt_devices[] = {
> > >               MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > >                       USB_DEVICE_ID_DWAV_EGALAX_MULTITOUCH_C002) },
> > >
> > > +     /* Elan devices */
> > > +     { .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
> > > +             HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> > > +                     USB_VENDOR_ID_ELAN, 0x313a) },
> > > +
> > >       /* Elitegroup panel */
> > >       { .driver_data = MT_CLS_SERIAL,
> > >               MT_USB_DEVICE(USB_VENDOR_ID_ELITEGROUP,
> > > @@ -2056,6 +2077,11 @@ static const struct hid_device_id mt_devices[] = {
> > >               MT_USB_DEVICE(USB_VENDOR_ID_STANTUM_STM,
> > >                       USB_DEVICE_ID_MTP_STM)},
> > >
> > > +     /* Synaptics devices */
> > > +     { .driver_data = MT_CLS_WIN_8_FORCE_MULTI_INPUT,
> > > +             HID_DEVICE(BUS_I2C, HID_GROUP_MULTITOUCH_WIN_8,
> > > +                     USB_VENDOR_ID_SYNAPTICS, 0xce08) },
> > > +
> > >       /* TopSeed panels */
> > >       { .driver_data = MT_CLS_TOPSEED,
> > >               MT_USB_DEVICE(USB_VENDOR_ID_TOPSEED2,
> > > --
> > > 2.25.1
> > >
> >

