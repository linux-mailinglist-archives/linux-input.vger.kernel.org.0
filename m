Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEA7F1D0A5F
	for <lists+linux-input@lfdr.de>; Wed, 13 May 2020 10:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729487AbgEMIAi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 May 2020 04:00:38 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37777 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728101AbgEMIAi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 May 2020 04:00:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589356835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qJJeg4MtPdhbSJgTMkX4cNu4rnmNl0oJ5HuOjA8G5gA=;
        b=d1xfhrXD6KQqlgTibeOInZSJlos+41snb0vKDF4ZRdz8w2usZsCM1zAqBnvPh/4UoQOVHY
        Sw+e1DtAtNRFtCrlsgUINhPcpnwChP2jeoni6hQBAQ3VbNipwO/nTWTkMmf9aw56Z2oNZt
        OS33vIpuiZ41HlWViCebnWlN7dF9SlE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-tw8FHhy9NeqxgVvm5bDfMw-1; Wed, 13 May 2020 04:00:34 -0400
X-MC-Unique: tw8FHhy9NeqxgVvm5bDfMw-1
Received: by mail-wm1-f71.google.com with SMTP id m123so4517906wmm.5
        for <linux-input@vger.kernel.org>; Wed, 13 May 2020 01:00:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qJJeg4MtPdhbSJgTMkX4cNu4rnmNl0oJ5HuOjA8G5gA=;
        b=BvkjiM7TDKg0yOsIcUxTOlmhoxHVtC0PqMzzTOz1TrOFwy47//bJWsesO2clPLnKsi
         OJiU6jjesQiE0iYmJ4t+j44bnn0yN9NSOBbI+HKDrg0z1xpTqBPPYVOo8f+MJZUskEqf
         8oqyF27QXerYhWrwzCvIINjggSwOgVHA7cXXXaPkiEBZPzSY5JMVQntqFfJwmiDUKgWa
         fiOvdZzlYlSqGdui9p2/EadO6J0Q0dilCKkhouI6m57g2wgb6IgymIQTka3zTh45RdlJ
         wQKQz8jMVqbrNSL8hXsIkyzW3rikacCG+18GIH880msvU83icevJ7byx/6X1gC2O2z/Y
         DbNw==
X-Gm-Message-State: AOAM5319rf/Nza8+cBblDqHPgoI3IF17kEH6lpMi4PkToDq0zYtc6yaV
        NOBLe825vnTRdpeVZWcfbmlgTndvIGDRVSzucoKQuTMNP+v+CuN9YcPFLFr6u4mHqlAPkcOX1GE
        iMWFjpEKCsXl2ErtGv2hUOHU=
X-Received: by 2002:a1c:740e:: with SMTP id p14mr9868395wmc.137.1589356832268;
        Wed, 13 May 2020 01:00:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw36ceheDEnFuuQKBw5DgaHmwYjgG+xufEIDntEfln+k8YfxDHx0saRpP63FuwoEv1huIH/QQ==
X-Received: by 2002:a1c:740e:: with SMTP id p14mr9868366wmc.137.1589356831926;
        Wed, 13 May 2020 01:00:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:8d:b181::e71? ([2a01:e0a:8d:b181::e71])
        by smtp.gmail.com with ESMTPSA id p10sm1609788wra.78.2020.05.13.01.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2020 01:00:31 -0700 (PDT)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: multitouch: Add MT_QUIRK_FORCE_GET_FEATURE to
 MT_CLS_WIN_8 quirks
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>
References: <20200501095624.121744-1-hdegoede@redhat.com>
 <d9d0bc3f-1975-ee05-f41f-a0d4480f667a@redhat.com>
 <2b014a28-630b-aab6-df91-320d0b3447b7@redhat.com>
 <CAO-hwJKnG2gxz62psgzhq3MFUAqd=rrzQEU9KbawY7GXs4We=w@mail.gmail.com>
 <cfc5669b-cf0c-0bb7-6762-def84dedb11f@redhat.com>
Message-ID: <ad3830a6-56e3-9b3e-17b4-e1905c35e266@redhat.com>
Date:   Wed, 13 May 2020 10:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cfc5669b-cf0c-0bb7-6762-def84dedb11f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

[sorry for the delay, I am knee deep in fdo admin stuffs]

On Mon, May 4, 2020 at 11:31 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/4/20 9:39 AM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > On Sat, May 2, 2020 at 2:59 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 5/1/20 8:20 PM, Hans de Goede wrote:
> >>> Hi,
> >>>
> >>> On 5/1/20 11:56 AM, Hans de Goede wrote:
> >>>> The touchpad on the Dell Venue 11 Pro 7130's keyboard-dock is multi-touch
> >>>> capable, using HID_GROUP_MULTITOUCH_WIN_8 and the hid-multitouch driver
> >>>> correctly binds to it.
> >>>>
> >>>> But instead of getting multi-touch HID input reports we still get mouse
> >>>> input reports and corresponding linux input (evdev) node events.
> >>>>
> >>>> Unloading and reloading the hid-multitouch driver works around this.
> >>>>
> >>>> Adding the MT_QUIRK_FORCE_GET_FEATURE quirk to the MT_CLS_WIN_8 quirks
> >>>> makes the driver work correctly the first time it is loaded.
> >>>>
> >>>> I've chosen to add this quirk to the generic MT_CLS_WIN_8 quirks
> >>>> because it seems unlikely that this quirk will causes problems for
> >>>> other MT_CLS_WIN_8 devices and if this device needs it other Win 8
> >>>> compatible devices might need it too.
> >>>>
> >>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >>>
> >>> Self nack for now, there are more issues with this detachable keyboard,
> >>> it sometimes does not work after being unplugged and replugged again
> >>> USB_QUIRK_DELAY_INIT seems to help a bit, but is not a total solution...
> >>>
> >>> Dell has some firmware updates for the kbd. So I'll install Windows and
> >>> then update the firmware and we'll see from there.
> >>
> >> So after installing Windows it turns out that the kbd-dock firmware was
> >> already fully up2date, what fun.
> >>
> >> So it took me quite a long time to get to the bottom of this.
> >>
> >> The problem is that the Dell K12A kbd-dock needs a HID_QUIRK_NO_INIT_REPORTS
> >> quirk; or maybe both of HID_QUIRK_NO_INIT_REPORTS|HID_QUIRK_NOGET I've tested
> >
> > I think this is a regression introduced by the high res scrolling
> > patch. I have been notified that the new code actually does fetch all
> > features on connect, which many devices do not support.
> >
> > I don't think I received the patch related to that, but basically the
> > problematic code is at
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/hid/hid-input.c#n1558
> >
> > The issue is that we should only fetch the current report if the
> > HID_GD_RESOLUTION_MULTIPLIER is present. Or we break things.
>
> I don't think that this is related to the high-res scrolling stuff.

Well, it is in the way that the high-res scrolling changed the way we talked to HID device. Before that, I carefully ensured that hid-generic would never issue a get_feature or get_input, and after, it does.

>
> The errors I'm seeing on a bad hotplug are coming from
> drivers/hid/hid-multitouch.c: mt_get_feature()

It might be that the device doesn't like to be polled too often on one feature and gets in a stuck mode.

>
> Also quite a few other multi-touch devices have a HID_QUIRK_NO_INIT_REPORTS
> quirk, at least a bunch of surface keyboards do; and if I'm reading the
> git log correctly then at one point in time we used to have a
> HID_QUIRK_NO_INIT_REPORTS for at least some of the multi-touch classes
> inside hid-multitouch.c. At least there is a commit titled:
>
> "HID: multitouch: do not set HID_QUIRK_NO_INIT_REPORTS"
>
> Which suggests that one point we did set it inside the multi-touch
> driver; and I'm wondering since a bunch of surface keyboards need this
> if setting this inside the multi-touch driver would not get us closer
> to windows behavior.

This quirk is legacy, and should have stayed that way (well, it doesn't
hurt anyway). As mentioned, in the past, the hid core stack used to fetch
all input and feature reports on plug in. This was known to break many
devices, and we had to use the no-init-report quirk for them. Then, we
realized that it was not correct to do that way, and I removed this
behavior. However, I couldn't remove the quirk entirely because of hiddev
IIRC. In the hiddev case, userspace expects the device to have known values
for the features, but that is not 100% working. So to not break userspace,
I had to keep that quirk around for this use case.

>
> Anyways if you have an alternative fix you want me to test, let me know.

Peter has a patch, we were waiting for the reporter to test it, but it's
been crickets since last week.

Here it is:

---
Subject: [DRAFT PATCH] HID: input: do not run GET_REPORT unless there's a Resolution Multiplier

From: Peter Hutterer <peter.hutterer@who-t.net>

Some devices take GET_REPORT as an instruction to change the mode, or
toggle some other value, or possibly do unspeakable things to kittens.
So we must not execute GET_REPORT against a device unless we're sure
that there's a Resolution Multiplier in that report that makes it all
worth it.

Signed-off-by: Peter Hutterer <peter.hutterer@who-t.net>
---
 drivers/hid/hid-input.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git drivers/hid/hid-input.c drivers/hid/hid-input.c
index dea9cc65bf80..a54824d451bf 100644
--- drivers/hid/hid-input.c
+++ drivers/hid/hid-input.c
@@ -1560,21 +1560,12 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
 {
 	struct hid_usage *usage;
 	bool update_needed = false;
+	bool get_report_completed = false;
 	int i, j;
 
 	if (report->maxfield == 0)
 		return false;
 
-	/*
-	 * If we have more than one feature within this report we
-	 * need to fill in the bits from the others before we can
-	 * overwrite the ones for the Resolution Multiplier.
-	 */
-	if (report->maxfield > 1) {
-		hid_hw_request(hid, report, HID_REQ_GET_REPORT);
-		hid_hw_wait(hid);
-	}
-
 	for (i = 0; i < report->maxfield; i++) {
 		__s32 value = use_logical_max ?
 			      report->field[i]->logical_maximum :
@@ -1593,6 +1584,17 @@ static bool __hidinput_change_resolution_multipliers(struct hid_device *hid,
 			if (usage->hid != HID_GD_RESOLUTION_MULTIPLIER)
 				continue;
 
+			/*
+			 * If we have more than one feature within this report we
+			 * need to fill in the bits from the others before we can
+			 * overwrite the ones for the Resolution Multiplier.
+			 */
+			if (!get_report_completed && report->maxfield > 1) {
+				hid_hw_request(hid, report, HID_REQ_GET_REPORT);
+				hid_hw_wait(hid);
+				get_report_completed = true;
+			}
+
 			report->field[i]->value[j] = value;
 			update_needed = true;
 		}
-- 
2.26.0

Cheers,
Benjamin

>
> Regards,
>
> Hans
>
>
>
>
> >
> > Cheers,
> > Benjamin
> >
> >> with the later version and that fixes both the touchpad initially being
> >> stuck in mouse emulation and the dock misbehaving after a hot unplug + replug.
> >>
> >> I suspect I really only need HID_QUIRK_NO_INIT_REPORTS, I will retest with
> >> that and submit a new patch replacing this one.
> >>
> >> Somewhat related: to make space for the Windows install I nuked the old
> >> Fedora 27 install which was on the machine and after installing Windows
> >> I did a fresh Fedora 32 install in the space which I left free when
> >> installing Windows.
> >>
> >> This causes an interesting new problem. The touchpad worked fine
> >> (with the quirk) in gdm, but it would stop working when I logged into
> >> a user GNOME-session.  It took me a while to get to the bottom of
> >> this. The problem is that the usersession ends up dbus activating
> >> fwupd (probably through gnome-software) and fwupd does some probe
> >> of the touchpad which puts it in a mode where it no longer generates
> >> any events.
> >>
> >> sudo rpm -e fwupd gnome-software
> >>
> >> Works around this, so not a HID bug, but definitely something to keep
> >> an eye out for if we get similar bug reports on other devices.
> >>
> >> I will mail the fwupd maintainer about this with you in the Cc.
> >> Note this is an unrelated issue really, but I thought you
> >> should be aware of this.
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>>> ---
> >>>>    drivers/hid/hid-multitouch.c | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> >>>> index 362805ddf377..f9c0429e7348 100644
> >>>> --- a/drivers/hid/hid-multitouch.c
> >>>> +++ b/drivers/hid/hid-multitouch.c
> >>>> @@ -265,6 +265,7 @@ static const struct mt_class mt_classes[] = {
> >>>>                MT_QUIRK_IGNORE_DUPLICATES |
> >>>>                MT_QUIRK_HOVERING |
> >>>>                MT_QUIRK_CONTACT_CNT_ACCURATE |
> >>>> +            MT_QUIRK_FORCE_GET_FEATURE |
> >>>>                MT_QUIRK_STICKY_FINGERS |
> >>>>                MT_QUIRK_WIN8_PTP_BUTTONS,
> >>>>            .export_all_inputs = true },
> >>>>
> >>
> >
>

