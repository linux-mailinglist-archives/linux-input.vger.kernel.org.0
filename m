Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D48314EE3A
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 15:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgAaON1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 09:13:27 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22445 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728719AbgAaON1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 09:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580480006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ep1fgLo3mWnzjFpUttM7RDr2YM/HmwPwsQwqmm0+drc=;
        b=iSDjE/cwoGZlGlIA0XUsLt2g4MlCyMxqlxF4aBIb4D+ZoDkgxFiYy/ZKB8mGATM8sy3okh
        k3CBMAwNAiHAElWWlS/w5lCF1mAJnkVCbH1o5p/hS5kVwaggBawfaf0jGVz69xWWZ3o2rc
        DTgXvzC7zsXL67g/igrHkx9wb6kUfeo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-LNn3EAetNQmDQt2p6UJb9w-1; Fri, 31 Jan 2020 09:13:19 -0500
X-MC-Unique: LNn3EAetNQmDQt2p6UJb9w-1
Received: by mail-qv1-f69.google.com with SMTP id r9so4449183qvs.19
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 06:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ep1fgLo3mWnzjFpUttM7RDr2YM/HmwPwsQwqmm0+drc=;
        b=LzlkzpkXHHt9HTsuzxMi3urGhX/4HidGfewSUf+kC8n5LgM3HowZUXtuYCixFnEwHN
         kqdISzHjtiMdI1Unrx9tarx0AGn2BYo9WODakhINZ2qXCv7GF/rlgD8DX41LPOZpzju7
         O40COr1rpNOce51C/1C3Z6QOyCvOx1ub0/IvEpgbhofpewdwgDV9NrJzgoD82GgiIm/E
         +BDxV5o7vNV+RMZ6gXxb0sFUNItxf1NhUFT2HPuW3o6yNqpHfKIhvbe0W++ZPRWGdc89
         hVhf2Tps8jgWfsBwLxt3mdX6ibw392o5BV+cFSeLBaysLZCRlzg9MlTS9LC/ScOORNmE
         ovJg==
X-Gm-Message-State: APjAAAW+I5WD+c0wa4n94G9NgfvVKNMLis7idbPI0l0G9ivWd2lGsOuM
        EVYRXOo+W8YlwjQ7BqM/yYNQCGuIO1T4UJpLRPvdnMtr5S77lVl191jGwS5gQQJahFzNv+oc8wy
        cDz4AT8e7RtAX7a6V9tcEJjb3XDG3eodE5AhA750=
X-Received: by 2002:a37:64d5:: with SMTP id y204mr10586616qkb.459.1580479998351;
        Fri, 31 Jan 2020 06:13:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvNPjnoTbaZ8+Lf+B5srqzAKeFYDHsz7gYPylcL8SfS6cDh1GJ0DszV8hnerUb91cPaBtzsExnBKUkn284Pic=
X-Received: by 2002:a37:64d5:: with SMTP id y204mr10586581qkb.459.1580479997994;
 Fri, 31 Jan 2020 06:13:17 -0800 (PST)
MIME-Version: 1.0
References: <20200131124615.27849-1-hdegoede@redhat.com> <CAO-hwJL_5JKGjoKFyybfpA=89eK4C3nJtZMb5_8oxnzf9EJGaQ@mail.gmail.com>
 <d90a5b8f-08fa-b358-900c-b579f64e8782@redhat.com> <CAO-hwJLW=40M0SvehBxYS=M-w2CAB8Ypco3bphQnqGnbk5F-wQ@mail.gmail.com>
 <f75a44af-6192-26a1-f0b3-8beead36dda4@redhat.com>
In-Reply-To: <f75a44af-6192-26a1-f0b3-8beead36dda4@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 31 Jan 2020 15:13:07 +0100
Message-ID: <CAO-hwJLNLWCemxC+xNAusA1pGkp5vOW3B+3+8+DqoFJz1q6A0w@mail.gmail.com>
Subject: Re: [PATCH] HID: generic: Check other drivers match callback from __check_hid_generic
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 31, 2020 at 3:07 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> HI,
>
> On 1/31/20 3:00 PM, Benjamin Tissoires wrote:
> > On Fri, Jan 31, 2020 at 2:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 1/31/20 2:39 PM, Benjamin Tissoires wrote:
> >>> Hi Hans,
> >>>
> >>> On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> __check_hid_generic is used to check if there is a driver, other then
> >>>> the hid-generic driver, which wants to handle the hid-device, in which
> >>>> case hid_generic_match() will return false so that the other driver can
> >>>> bind.
> >>>>
> >>>> But what if the other driver also has a match callback and that indicates
> >>>> it does not want to handle the device? Then hid-generic should bind to it
> >>>> and thus hid_generic_match() should NOT return false in that case.
> >>>>
> >>>> This commit makes __check_hid_generic check if a matching driver has
> >>>> a match callback and if it does makes its check this, so that
> >>>> hid-generic will bind to devices which have a matching other driver,
> >>>> but that other driver's match callback rejects the device.
> >>>
> >>> I get that part, but I am not sure I'll remember this in 2 months time
> >>> when/if we need to extend the .match() in another driver.
> >>> I am especially worried about the potential circular calls where an
> >>> other driver decides to check on all the other drivers having a match
> >>> callback...
> >>>
> >>> Could you add a little blurb either in hid-generic.c explaining the
> >>> logic, or (and) in hid.h where .match is defined?
> >>>
> >>> Because now, we have 2 callers for .match(): hid-core and hid-generic
> >>> (and 2 is usually one too many :-/).
> >>
> >> Ok, how about the following:
> >>
> >> static int __check_hid_generic(struct device_driver *drv, void *data)
> >> {
> >>          struct hid_driver *hdrv = to_hid_driver(drv);
> >>          struct hid_device *hdev = data;
> >>
> >>          if (hdrv == &hid_generic)
> >>                  return 0;
> >>
> >>          if (!hid_match_device(hdev, hdrv))
> >>                  return 0;
> >>
> >>          /*
> >>           * The purpose of looping over all drivers to see if one is a match
> >>           * for the hdev, is for hid-generic to NOT bind to any devices which
> >>           * have another, specialized, driver registerd. But in some cases that
> >>           * specialized driver might have a match callback itself, e.g. because
> >>           * it only wants to bind to a single USB interface of a device with
> >>           * multiple HID interfaces.
> >>           * So if another driver defines a match callback and that match
> >>           * callback returns false then hid-generic should still bind to the
> >>           * device and we should thus keep looping over the registered drivers.
> >>           */
> >>          if (!hdrv->match)
> >>                  return 1;
> >>
> >>          return hdrv->match(hdev, false);
> >> }
> >>
> >> ?
> >>
> >> Let me know if you like this then I'll send a v2 with this.
> >
> > Yep, sounds good.
> >
> > Could you also add a blurb in the docs of struct hid_driver in
> > include/linux/hid.h?
> >
> > Something along the lines of:
> >
> > match should return true if the driver wants the device, false
> > otherwise. Note that hid-generic has a special handling of this in
> > which it will also iterate over other .match() callbacks in other
> > drivers. Please refrain from duplicating this behaviour in other
> > drivers or dragons will come due to circular calls.
>
> Ack, now that we are  likely not going to add a match callback to
> the hid-ite driver (see its thread) do we still want to move ahead
> with this patch? On one hand it still makes sense, OTOH if we never
> add a match callback to another driver ...
>

Yep, we better keep the status quo now: only hid-generic is allowed to
have a .match, and we are safer now.
If we need it in the future, we can always rely on this thread for a v2.

Cheers,
Benjamin

