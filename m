Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41D014AA861
	for <lists+linux-input@lfdr.de>; Sat,  5 Feb 2022 12:38:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349151AbiBELiD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Feb 2022 06:38:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23257 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1350839AbiBELiB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 5 Feb 2022 06:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644061081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I03UYyBR4DDR6soPAszfzrWM+t2I/Ka8QbsXH4Pkbno=;
        b=fJNXywuvBUeGaaqlftCTFjGaOlIlTXUfacMTcoSkwde0SdbG8x+nJYlYdj2byc3rOSbynC
        JrMIcP7jm6UhPdI41TxizkvcyqKY8meB1axTisaGCGemyz2W0l74xqcfKp51ON41DPRlvE
        CRc+agdz2HgZ+4/LnoNV0F9XWHsVacM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-cpeKgYl1O9qQa6rjGfK7vA-1; Sat, 05 Feb 2022 06:37:59 -0500
X-MC-Unique: cpeKgYl1O9qQa6rjGfK7vA-1
Received: by mail-pf1-f199.google.com with SMTP id u80-20020a627953000000b004c82105f20dso4547132pfc.11
        for <linux-input@vger.kernel.org>; Sat, 05 Feb 2022 03:37:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I03UYyBR4DDR6soPAszfzrWM+t2I/Ka8QbsXH4Pkbno=;
        b=71TCYuzS39nLFuv5SsGzSAA4O1codQySNtqGku7RNbP5kYT7R//Rah2CZ4FZewYl9z
         ZBrfEpKWLTOQb5Qx+MMU1Q8l571gSctK6jUxTbr5CCCXy4hxVzulhCAH0F0cBGp6HKHo
         AJxorejw8aeZ8Z9j4Gg8nwIeBLDTPckurG/qX5ZlCvLyeNe3Y0wl7Kj56wjDsyZcnti5
         MX+6fz409tOC8k1c5n0EWNk6sYskA0cilaFiX97Uxzg5lhDWEYidJoZhONBZXvchsPDD
         hMAAttJj5xmY47dn1Gq9sTlO+I9oLCKikufCxbmyvvHLmBiWzEd3Y+hiJetmfsucpaUg
         NQTA==
X-Gm-Message-State: AOAM531qSGMv5MN308HsPGHxt/JL9NRkgxZMKinrYZlFtPaYpWRRdtN6
        WdnTYniCH8QoVPCV8KpNemawGOKqwfw8ea1d72AYMj80c3CERIHH3TG32GUEqMnVcbLAwO8S85H
        5quc0TvUWIYpnEzniBcIQZvn2WlPLr276slgUDDQ=
X-Received: by 2002:a05:6a00:15d0:: with SMTP id o16mr7464184pfu.13.1644061077999;
        Sat, 05 Feb 2022 03:37:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/SFm9EqJ01dnJkvBMsYkeUTidoOvPaZRH00H5+cDCppyBkHqQrY1jaU5Fojyeu62KeJ4xN25u57Xz8CIKIHk=
X-Received: by 2002:a05:6a00:15d0:: with SMTP id o16mr7464157pfu.13.1644061077630;
 Sat, 05 Feb 2022 03:37:57 -0800 (PST)
MIME-Version: 1.0
References: <6e8bd24e-3fad-b0c3-971b-cfd9152bf349@gmail.com>
 <CAO-hwJLB2EvMecPrvk+_BaC7zKChh8efaiF_YAqeaoO4jJXWyQ@mail.gmail.com>
 <7a47c92b-85f2-1fca-4cff-5024d43d2cd2@gmail.com> <CAO-hwJKwW-ymA9tR68BNu6gwpUE1YgfaPjvPEGQ8gGwgcvX37g@mail.gmail.com>
 <63dece1d-91ca-1b1b-d90d-335be66896be@gmail.com>
In-Reply-To: <63dece1d-91ca-1b1b-d90d-335be66896be@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Sat, 5 Feb 2022 12:37:46 +0100
Message-ID: <CAO-hwJ+imwiV1AA=KQaPwBBJBon65ncmiHhghTaFBB9ZE+bJ1A@mail.gmail.com>
Subject: Re: [PATCH] HID:Add support for UGTABLET WP5540 with new quirk
To:     Sergio Costas <rastersoft@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sergio,

On Fri, Feb 4, 2022 at 11:09 AM Sergio Costas <rastersoft@gmail.com> wrote:
>
> Hi Benjamin:
>
> Ops! My fault (I'm still a newcomer to the kernel). Here it is.

Ok, thanks. A few notes for your next submission:
- never ever use the gmail web UI to send your patches. It completely
mangled the lines and I had to manually apply it, change the commit
author/date to look like it was yours
- only use git send-email to send a patch (like the first version I think)
- if you need to add some blurb to your patch, after your
Signed-off-by, add on the next line '---' (without the quotes), then a
new line and put whatever you want there. This will be ignored by git
am when applying the patch. FYI, I often add those on my local tree so
I keep the changes in the versions in the tree, git format-patch will
keep those annotations, but they will be stripped out when applied :)

Anyway, I have now pushed your change to for-5.17/upstream-fixes and
added the stable@vger.kernel.org marker, meaning that when the patch
lands into Linus' tree, it will be automatically backported to older
kernels.

Cheers,
Benjamin

>
>
> From 7caa5076eb61a667a3ccc1ecae377b270760c464 Mon Sep 17 00:00:00 2001
> From: Sergio Costas <rastersoft@gmail.com>
> Date: Fri, 4 Feb 2022 10:01:17 +0100
> Subject: [PATCH] HID:Add support for UGTABLET WP5540
>
> This patch adds support for the UGTABLET WP5540 digitizer tablet
> devices. Without it, the pen moves the cursor, but neither the
> buttons nor the tap sensor in the tip do work.
>
> Signed-off-by: Sergio Costas <rastersoft@gmail.com>
> ---
>   drivers/hid/hid-ids.h    | 1 +
>   drivers/hid/hid-quirks.c | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 85975031389b..78bd3ddda442 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1370,6 +1370,7 @@
>   #define USB_VENDOR_ID_UGTIZER            0x2179
>   #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610    0x0053
>   #define USB_DEVICE_ID_UGTIZER_TABLET_GT5040    0x0077
> +#define USB_DEVICE_ID_UGTIZER_TABLET_WP5540    0x0004
>
>   #define USB_VENDOR_ID_VIEWSONIC            0x0543
>   #define USB_DEVICE_ID_VIEWSONIC_PD1011        0xe621
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 9af1dc8ae3a2..c066ba901867 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -187,6 +187,7 @@ static const struct hid_device_id hid_quirks[] =3D {
>       { HID_USB_DEVICE(USB_VENDOR_ID_TURBOX,
> USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
>       { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
> USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
>       { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
> USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
> +    { HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
> USB_DEVICE_ID_UGTIZER_TABLET_WP5540), HID_QUIRK_MULTI_INPUT },
>       { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT },
>       { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT },
>       { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPUT }=
,
> --
> 2.34.1
>
>
>
> El 4/2/22 a las 10:45, Benjamin Tissoires escribi=C3=B3:
> > On Fri, Feb 4, 2022 at 10:08 AM Sergio Costas <rastersoft@gmail.com> wr=
ote:
> >> Hi Benjamin:
> >>
> >> You are absolutely right. Here is the new patch. It works perfectly to=
o,
> >> and is much simpler.
> > Great, thanks.
> >
> > Can you please resubmit it with your Signed-of-by line?
> >
> > I should be able to apply it to the for-5.17 tree and add the stable@
> > tag but I can not do that without this tiny line :)
> >
> > Cheers,
> > Benjamin
> >
> >>   From 139638a264bdbc47e4f55c484c58867e2dbd4ddc Mon Sep 17 00:00:00 20=
01
> >> From: Sergio Costas <rastersoft@gmail.com>
> >> Date: Fri, 4 Feb 2022 10:01:17 +0100
> >> Subject: [PATCH] HID:Add support for UGTABLET WP5540
> >>
> >> This patch adds support for the UGTABLET WP5540 digitizer tablet
> >> devices. Without it, the pen moves the cursor, but neither the
> >> buttons nor the tap sensor in the tip do work.
> >> ---
> >>    drivers/hid/hid-ids.h    | 1 +
> >>    drivers/hid/hid-quirks.c | 1 +
> >>    2 files changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> >> index 85975031389b..78bd3ddda442 100644
> >> --- a/drivers/hid/hid-ids.h
> >> +++ b/drivers/hid/hid-ids.h
> >> @@ -1370,6 +1370,7 @@
> >>    #define USB_VENDOR_ID_UGTIZER            0x2179
> >>    #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610    0x0053
> >>    #define USB_DEVICE_ID_UGTIZER_TABLET_GT5040    0x0077
> >> +#define USB_DEVICE_ID_UGTIZER_TABLET_WP5540    0x0004
> >>
> >>    #define USB_VENDOR_ID_VIEWSONIC            0x0543
> >>    #define USB_DEVICE_ID_VIEWSONIC_PD1011        0xe621
> >> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> >> index 9af1dc8ae3a2..c066ba901867 100644
> >> --- a/drivers/hid/hid-quirks.c
> >> +++ b/drivers/hid/hid-quirks.c
> >> @@ -187,6 +187,7 @@ static const struct hid_device_id hid_quirks[] =3D=
 {
> >>        { HID_USB_DEVICE(USB_VENDOR_ID_TURBOX,
> >> USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
> >>        { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
> >> USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
> >>        { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
> >> USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
> >> +    { HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
> >> USB_DEVICE_ID_UGTIZER_TABLET_WP5540), HID_QUIRK_MULTI_INPUT },
> >>        { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> >> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT },
> >>        { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> >> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT },
> >>        { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> >> USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_INPU=
T },
> >> --
> >> 2.34.1
> >>
> >> El 4/2/22 a las 9:03, Benjamin Tissoires escribi=C3=B3:
> >>> Hi Sergio,
> >>>
> >>> On Thu, Feb 3, 2022 at 7:40 PM Sergio Costas <rastersoft@gmail.com> w=
rote:
> >>>>    From 82e513c85f4bdc027e5b907000a3bbaf74314bcb Mon Sep 17 00:00:00=
 2001
> >>>> From: Sergio Costas <rastersoft@gmail.com>
> >>>> Date: Thu, 3 Feb 2022 14:15:07 +0100
> >>>> Subject: [PATCH] HID:Add support for UGTABLET WP5540 with new quirk
> >>>>
> >>>> This patch adds a new quirk to HID, allowing to configure the
> >>>> usage rules in reverse order. This is needed to enable the use
> >>>> of the UGTABLET WP5540 USB digitizer tablet.
> >>>>
> >>>> This tablet defines three HID collections: one for a digitizer
> >>>> device and two for mouse devices, the first one with relative
> >>>> coordinates, and the second one with absolute coordinates.
> >>>> The problem is that both mouse devices share the "button 1",
> >>>> "button 2" and "button 3" usages, but the Linux HID driver
> >>>> doesn't support that, so those usages remain unassigned for
> >>>> the second mouse because they are considered "duplicated".
> >>>> Unfortunately, the second mouse is, really, the pencil,
> >>>> which means that the movements are detected and managed,
> >>>> but not the pencil touch or any button press, because those
> >>>> usages are already assigned to the first mouse (I suspect
> >>>> that the chip used in this tablet is designed to work both
> >>>> with pencils and with uncorded mouses, allowing dual devices
> >>>> where both a pencil and a mouse can be used over the same
> >>>> rug).
> >>>>
> >>>> The result is that the user can move the cursor with the pencil,
> >>>> but can't "paint" things because the "touch" action doesn't
> >>>> work.
> >>>>
> >>>> Currently there is already a quirk that, at first glance, could
> >>>> seem as the solution to this problem. That quirk is
> >>>> HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE. Unfortunately, the
> >>>> result is that the "pencil touch" and "press button" actions
> >>>> are translated into "previous page", "next page"... and so on,
> >>>> which is not a desirable option. Although those events could
> >>>> be reasigned in user space using xmodmap, it requires actions
> >>>> from the user, and also could interfere with other devices,
> >>>> like multibutton mouses.
> >>>>
> >>>> I also tried to remove the duplicate test, but the system
> >>>> hangs as soon as it receives an event from the tablet.
> >>>>
> >>>> This patch aims to fix this by configuring the entries in
> >>>> reverse order, thus giving priority to the pencil over the
> >>>> mouse. This makes sense today, because it is more common to
> >>>> use optical mouses instead of tablet-based ones, and also
> >>>> ensures that devices marketed only with the pencil but
> >>>> using this chip do work out-of-the-box.
> >>>>
> >>>> To do this, the patch adds a new quirk:
> >>>> HID_QUIRK_REVERSE_CONFIGURE_USAGES, which can be enabled for
> >>>> an specific device, and it does assign the actions in reverse
> >>>> order, thus reversing the priority. This quirk can still be
> >>>> combined with HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE, so the
> >>>> events from the physical mouse could still be received, but
> >>>> giving priority to the digitizer, which makes more sense.
> >>> This seems extremely over-engineered. Have you tried the quirk
> >>> HID_QUIRK_MULTI_INPUT?
> >>> This quirk should create one independent input node per input report,
> >>> and I suspect your tablet is using different report IDs for the 2
> >>> mices.
> >>>
> >>> Cheers,
> >>> Benjamin
> >>>
> >>>> With this new quirk enabled for it, the UGTABLET WP5540
> >>>> digitizer tablet works like a charm.
> >>>>
> >>>> Signed-off-by: Sergio Costas <rastersoft@gmail.com>
> >>>> ---
> >>>>     drivers/hid/hid-ids.h    |   1 +
> >>>>     drivers/hid/hid-input.c  | 101 +++++++++++++++++++++++++++------=
------
> >>>>     drivers/hid/hid-quirks.c |   1 +
> >>>>     include/linux/hid.h      |   1 +
> >>>>     4 files changed, 73 insertions(+), 31 deletions(-)
> >>>>
> >>>> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> >>>> index 85975031389b..78bd3ddda442 100644
> >>>> --- a/drivers/hid/hid-ids.h
> >>>> +++ b/drivers/hid/hid-ids.h
> >>>> @@ -1370,6 +1370,7 @@
> >>>>     #define USB_VENDOR_ID_UGTIZER            0x2179
> >>>>     #define USB_DEVICE_ID_UGTIZER_TABLET_GP0610    0x0053
> >>>>     #define USB_DEVICE_ID_UGTIZER_TABLET_GT5040    0x0077
> >>>> +#define USB_DEVICE_ID_UGTIZER_TABLET_WP5540    0x0004
> >>>>
> >>>>     #define USB_VENDOR_ID_VIEWSONIC            0x0543
> >>>>     #define USB_DEVICE_ID_VIEWSONIC_PD1011        0xe621
> >>>> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> >>>> index 112901d2d8d2..8cf4f63581cf 100644
> >>>> --- a/drivers/hid/hid-input.c
> >>>> +++ b/drivers/hid/hid-input.c
> >>>> @@ -1938,6 +1938,56 @@ static inline void
> >>>> hidinput_configure_usages(struct hid_input *hidinput,
> >>>>                              report->field[i]->usage + j);
> >>>>     }
> >>>>
> >>>> +static inline void hidinput_configure_usages_reversed(struct hid_in=
put
> >>>> *hidinput,
> >>>> +                              struct hid_report *report)
> >>>> +{
> >>>> +    int i, j;
> >>>> +
> >>>> +    for (i =3D report->maxfield; i > 0 ; i--)
> >>>> +        for (j =3D report->field[i-1]->maxusage; j > 0 ; j--)
> >>>> +            hidinput_configure_usage(hidinput, report->field[i-1],
> >>>> +                         report->field[i-1]->usage + j - 1);
> >>>> +}
> >>>> +
> >>>> +static bool hidinput_configure_usage_list(struct hid_device *hid,
> >>>> +                      struct hid_report *report,
> >>>> +                      bool reverse)
> >>>> +{
> >>>> +
> >>>> +    unsigned int application;
> >>>> +    struct hid_input *hidinput =3D NULL;
> >>>> +
> >>>> +    application =3D report->application;
> >>>> +
> >>>> +    /*
> >>>> +     * Find the previous hidinput report attached
> >>>> +     * to this report id.
> >>>> +     */
> >>>> +    if (hid->quirks & HID_QUIRK_MULTI_INPUT)
> >>>> +        hidinput =3D hidinput_match(report);
> >>>> +    else if (hid->maxapplication > 1 &&
> >>>> +            (hid->quirks & HID_QUIRK_INPUT_PER_APP))
> >>>> +        hidinput =3D hidinput_match_application(report);
> >>>> +
> >>>> +    if (!hidinput) {
> >>>> +        hidinput =3D hidinput_allocate(hid, application);
> >>>> +        if (!hidinput)
> >>>> +            return true;
> >>>> +    }
> >>>> +
> >>>> +    if (reverse)
> >>>> +        hidinput_configure_usages_reversed(hidinput, report);
> >>>> +    else
> >>>> +        hidinput_configure_usages(hidinput, report);
> >>>> +
> >>>> +    if (hid->quirks & HID_QUIRK_MULTI_INPUT)
> >>>> +        hidinput->report =3D report;
> >>>> +
> >>>> +    list_add_tail(&report->hidinput_list,
> >>>> +              &hidinput->reports);
> >>>> +    return false;
> >>>> +}
> >>>> +
> >>>>     /*
> >>>>      * Register the input device; print a message.
> >>>>      * Configure the input layer interface
> >>>> @@ -1949,8 +1999,7 @@ int hidinput_connect(struct hid_device *hid,
> >>>> unsigned int force)
> >>>>         struct hid_driver *drv =3D hid->driver;
> >>>>         struct hid_report *report;
> >>>>         struct hid_input *next, *hidinput =3D NULL;
> >>>> -    unsigned int application;
> >>>> -    int i, k;
> >>>> +    int i, k, l;
> >>>>
> >>>>         INIT_LIST_HEAD(&hid->inputs);
> >>>>         INIT_WORK(&hid->led_work, hidinput_led_worker);
> >>>> @@ -1972,41 +2021,31 @@ int hidinput_connect(struct hid_device *hid,
> >>>> unsigned int force)
> >>>>
> >>>>         report_features(hid);
> >>>>
> >>>> -    for (k =3D HID_INPUT_REPORT; k <=3D HID_OUTPUT_REPORT; k++) {
> >>>> +    for (l =3D HID_INPUT_REPORT; l <=3D HID_OUTPUT_REPORT; l++) {
> >>>> +        if (hid->quirks & HID_QUIRK_REVERSE_CONFIGURE_USAGES)
> >>>> +            k =3D HID_OUTPUT_REPORT - l + HID_INPUT_REPORT;
> >>>> +        else
> >>>> +            k =3D l;
> >>>>             if (k =3D=3D HID_OUTPUT_REPORT &&
> >>>>                 hid->quirks & HID_QUIRK_SKIP_OUTPUT_REPORTS)
> >>>>                 continue;
> >>>>
> >>>> -        list_for_each_entry(report, &hid->report_enum[k].report_lis=
t,
> >>>> list) {
> >>>> -
> >>>> -            if (!report->maxfield)
> >>>> -                continue;
> >>>> -
> >>>> -            application =3D report->application;
> >>>> -
> >>>> -            /*
> >>>> -             * Find the previous hidinput report attached
> >>>> -             * to this report id.
> >>>> -             */
> >>>> -            if (hid->quirks & HID_QUIRK_MULTI_INPUT)
> >>>> -                hidinput =3D hidinput_match(report);
> >>>> -            else if (hid->maxapplication > 1 &&
> >>>> -                 (hid->quirks & HID_QUIRK_INPUT_PER_APP))
> >>>> -                hidinput =3D hidinput_match_application(report);
> >>>> -
> >>>> -            if (!hidinput) {
> >>>> -                hidinput =3D hidinput_allocate(hid, application);
> >>>> -                if (!hidinput)
> >>>> +        if (hid->quirks & HID_QUIRK_REVERSE_CONFIGURE_USAGES) {
> >>>> +            list_for_each_entry_reverse(report,
> >>>> + &hid->report_enum[k].report_list,
> >>>> +                            list) {
> >>>> +                if (!report->maxfield)
> >>>> +                    continue;
> >>>> +                if (hidinput_configure_usage_list(hid, report, true=
))
> >>>> +                    goto out_unwind;
> >>>> +            }
> >>>> +        } else {
> >>>> +            list_for_each_entry(report,
> >>>> &hid->report_enum[k].report_list, list) {
> >>>> +                if (!report->maxfield)
> >>>> +                    continue;
> >>>> +                if (hidinput_configure_usage_list(hid, report, fals=
e))
> >>>>                         goto out_unwind;
> >>>>                 }
> >>>> -
> >>>> -            hidinput_configure_usages(hidinput, report);
> >>>> -
> >>>> -            if (hid->quirks & HID_QUIRK_MULTI_INPUT)
> >>>> -                hidinput->report =3D report;
> >>>> -
> >>>> -            list_add_tail(&report->hidinput_list,
> >>>> -                      &hidinput->reports);
> >>>>             }
> >>>>         }
> >>>>
> >>>> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> >>>> index 9af1dc8ae3a2..a59510bc76a1 100644
> >>>> --- a/drivers/hid/hid-quirks.c
> >>>> +++ b/drivers/hid/hid-quirks.c
> >>>> @@ -187,6 +187,7 @@ static const struct hid_device_id hid_quirks[] =
=3D {
> >>>>         { HID_USB_DEVICE(USB_VENDOR_ID_TURBOX,
> >>>> USB_DEVICE_ID_TURBOX_KEYBOARD), HID_QUIRK_NOGET },
> >>>>         { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
> >>>> USB_DEVICE_ID_UCLOGIC_TABLET_KNA5), HID_QUIRK_MULTI_INPUT },
> >>>>         { HID_USB_DEVICE(USB_VENDOR_ID_UCLOGIC,
> >>>> USB_DEVICE_ID_UCLOGIC_TABLET_TWA60), HID_QUIRK_MULTI_INPUT },
> >>>> +    { HID_USB_DEVICE(USB_VENDOR_ID_UGTIZER,
> >>>> USB_DEVICE_ID_UGTIZER_TABLET_WP5540), HID_QUIRK_REVERSE_CONFIGURE_US=
AGES },
> >>>>         { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> >>>> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_10_6_INCH), HID_QUIRK_MULTI_INPUT =
},
> >>>>         { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> >>>> USB_DEVICE_ID_WALTOP_MEDIA_TABLET_14_1_INCH), HID_QUIRK_MULTI_INPUT =
},
> >>>>         { HID_USB_DEVICE(USB_VENDOR_ID_WALTOP,
> >>>> USB_DEVICE_ID_WALTOP_SIRIUS_BATTERY_FREE_TABLET), HID_QUIRK_MULTI_IN=
PUT },
> >>>> diff --git a/include/linux/hid.h b/include/linux/hid.h
> >>>> index 7487b0586fe6..61bf462ca658 100644
> >>>> --- a/include/linux/hid.h
> >>>> +++ b/include/linux/hid.h
> >>>> @@ -361,6 +361,7 @@ struct hid_item {
> >>>>     #define HID_QUIRK_INPUT_PER_APP            BIT(11)
> >>>>     #define HID_QUIRK_X_INVERT            BIT(12)
> >>>>     #define HID_QUIRK_Y_INVERT            BIT(13)
> >>>> +#define HID_QUIRK_REVERSE_CONFIGURE_USAGES    BIT(14)
> >>>>     #define HID_QUIRK_SKIP_OUTPUT_REPORTS        BIT(16)
> >>>>     #define HID_QUIRK_SKIP_OUTPUT_REPORT_ID        BIT(17)
> >>>>     #define HID_QUIRK_NO_OUTPUT_REPORTS_ON_INTR_EP    BIT(18)
> >>>> --
> >>>> 2.34.1
> >>>>
> >>>>
> >>>>
> >> --
> >> Nos leemos
> >>                           RASTER    (Linux user #228804)
> >> rastersoft@gmail.com                https://www.rastersoft.com
> >>
> --
> Nos leemos
>                          RASTER    (Linux user #228804)
> rastersoft@gmail.com                https://www.rastersoft.com
>

