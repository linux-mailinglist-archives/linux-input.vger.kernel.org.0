Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A92961C33C9
	for <lists+linux-input@lfdr.de>; Mon,  4 May 2020 09:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbgEDHj4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 4 May 2020 03:39:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46149 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727088AbgEDHj4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 4 May 2020 03:39:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588577994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=JZqf9xMzP5l1pH5YZgb25W0f3NHl2CNkxAelY+0jylc=;
        b=BzgH7SMgFBiTy1xOa0JZfywKMqXQVbYYeASdbX5fgFJMvO72ezo3fq01GMZ4RO+BhVdKdj
        qYt9bhmBdtS6or6F3y415s1BCTfmfZWV8/pToRWftTGA6CMAMQhZlAcD76SuWpFsbu4E92
        y7js+hKSJpwM0Y+nBpJe1Jql4kWWu9I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-376-QQfr51SBM9CQ7Mt1N1PmUg-1; Mon, 04 May 2020 03:39:49 -0400
X-MC-Unique: QQfr51SBM9CQ7Mt1N1PmUg-1
Received: by mail-qv1-f72.google.com with SMTP id 65so17576910qva.17
        for <linux-input@vger.kernel.org>; Mon, 04 May 2020 00:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JZqf9xMzP5l1pH5YZgb25W0f3NHl2CNkxAelY+0jylc=;
        b=mJahZElOq4tn6re/b9yqbibHXsfGbgEUg1aXS1PRitXVeqXCKIXwDBYqEYr9uOVfVv
         //47Ki/QhjzrLaMgT0XAPwXhlhbpk+FSS8dtcnZE8Xg+XSoyWPuzIpgIMx5y7/TAaIsO
         ngPYW9JIyHCrgVO6us1gZROvVdLxk20YKApOzfFwnadM2+IdxMQ5YwSQy0WXzrm4aI2u
         8JKljS3ey7KGL0qaEKKRa5W+fCUDypkDKkHEAuhrvx35k3hSDUAp0Xd75j91IQ8DEvfk
         HgXs9To+JnkajwAt7X4Xs/N3nL6NI4S5IoG+dZ2EabS6MrIIdt7qVra9xGmdGBfXaqA3
         zm1w==
X-Gm-Message-State: AGi0PuY5iyKrKKE1dF9YTVEfQBMhj6yk6u72WtIIZvC7oTOYxUspWZu2
        GfRoSAT5adaBPMKrmILZ+rGit6sUpaEFIlQXnyT1Tvm9pb/idJEDQtlvV2vUJ6lCkhoPyJyf1ro
        KyRhbFXx7GD7+inno42HDAH9EKB/3RgT7r9+Fr+I=
X-Received: by 2002:aed:2144:: with SMTP id 62mr2902817qtc.260.1588577989143;
        Mon, 04 May 2020 00:39:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypJe09VOAUZz/dG5E/frI0MNkjUfSw5bhYQaiZDIdK2tTVl3xD9HFStTCZEYMgprOWVekJDhVg8tlwAp/g1/mYE=
X-Received: by 2002:aed:2144:: with SMTP id 62mr2902798qtc.260.1588577988810;
 Mon, 04 May 2020 00:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200501095624.121744-1-hdegoede@redhat.com> <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
 <2b014a28-630b-aab6-df91-320d0b3447b7@redhat.com>
In-Reply-To: <2b014a28-630b-aab6-df91-320d0b3447b7@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 4 May 2020 09:39:37 +0200
Message-ID: <CAO-hwJKnG2gxz62psgzhq3MFUAqd=rrzQEU9KbawY7GXs4We=w@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to
 MT_CLS_WIN_8 quirks
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Sat, May 2, 2020 at 2:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/1/20 8:20 PM, Hans de Goede wrote:
> > Hi,
> >
> > On 5/1/20 11:56 AM, Hans de Goede wrote:
> >> The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
> >> capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
> >> correctly binds to it.
> >>
> >> But instead of getting multi-touch HID input reports we still get mouse
> >> input reports and corresponding linux input (evdev) node events.
> >>
> >> Unloading and reloading the hid-multitouch driver works around this.
> >>
> >> Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
> >> makes the driver work correctly the first time it is loaded.
> >>
> >> I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
> >> because it seems unlikely that this quirk will causes problems for
> >> other MT_CLS_WIN_8 devices and if this device needs it other Win 8
> >> compatible devices might need it too.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > Self nack for now, there are more issues with this detachable keyboard,
> > it sometimes does not work after being unplugged and replugged again
> > USB_QUIRK_DELAY_INIT seems to help a bit, but is not a total solution...
> >
> > Dell has some firmware updates for the kbd. So I'll install Windows and
> > then update the firmware and we'll see from there.
>
> So after installing Windows it turns out that the kbd-dock firmware was
> already fully up2date, what fun.
>
> So it took me quite a long time to get to the bottom of this.
>
> The problem is that the Dell K12A kbd-dock needs a HID_QUIRK_NO_INIT_REPORTS
> quirk; or maybe both of HID_QUIRK_NO_INIT_REPORTS|HID_QUIRK_NOGET I've tested

I think this is a regression introduced by the high res scrolling
patch. I have been notified that the new code actually does fetch all
features on connect, which many devices do not support.

I don't think I received the patch related to that, but basically the
problematic code is at
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-input.c#n1558

The issue is that we should only fetch the current report if the
HID_GD_RESOLUTION_MULTIPLIER is present. Or we break things.

Cheers,
Benjamin

> with the later version and that fixes both the touchpad initially being
> stuck in mouse emulation and the dock misbehaving after a hot unplug + replug.
>
> I suspect I really only need HID_QUIRK_NO_INIT_REPORTS, I will retest with
> that and submit a new patch replacing this one.
>
> Somewhat related: to make space for the Windows install I nuked the old
> Fedora 27 install which was on the machine and after installing Windows
> I did a fresh Fedora 32 install in the space which I left free when
> installing Windows.
>
> This causes an interesting new problem. The touchpad worked fine
> (with the quirk) in gdm, but it would stop working when I logged into
> a user GNOME-session.  It took me a while to get to the bottom of
> this. The problem is that the usersession ends up dbus activating
> fwupd (probably through gnome-software) and fwupd does some probe
> of the touchpad which puts it in a mode where it no longer generates
> any events.
>
> sudo rpm -e fwupd gnome-software
>
> Works around this, so not a HID bug, but definitely something to keep
> an eye out for if we get similar bug reports on other devices.
>
> I will mail the fwupd maintainer about this with you in the Cc.
> Note this is an unrelated issue really, but I thought you
> should be aware of this.
>
> Regards,
>
> Hans
>
>
>
> >> ---
> >>   drivers/hid/hid-multitouch.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> >> index 362805ddf377..f9c0429e7348 100644
> >> --- a/drivers/hid/hid-multitouch.c
> >> +++ b/drivers/hid/hid-multitouch.c
> >> @@ -265,6 +265,7 @@ static const struct mt_class mt_classes[] = {
> >>               MT_QUIRK_IGNORE_DUPLICATES |
> >>               MT_QUIRK_HOVERING |
> >>               MT_QUIRK_CONTACT_CNT_ACCURATE |
> >> +            MT_QUIRK_FORCE_GET_FEATURE |
> >>               MT_QUIRK_STICKY_FINGERS |
> >>               MT_QUIRK_WIN8_PTP_BUTTONS,
> >>           .export_all_inputs = true },
> >>
>

