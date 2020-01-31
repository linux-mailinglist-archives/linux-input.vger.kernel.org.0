Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBB014EE1A
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 15:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728500AbgAaOA2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 09:00:28 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:50085 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728686AbgAaOA2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 09:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580479226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pbXB7kcOgI6kMZx0rwQl5+oz2Bb3il5EtPqK+akoYiQ=;
        b=SGzXnt6iVK647fIMmBjGH6Ur4yXmGlnGM3whp9I/OOSuLw1JI2ZP7bH65/KIR68QbwFOff
        z5MTkVVZfTOE253JBGzTLsftCtjXPoPtSMTW31GNlG4HQGdSLIS5CUuTERt3zv/OBDboBp
        7AGPwicELDjVxtIlnbAYJFBBUXi24kQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-aDQ0tYgeNa2UIgP0WcJmcA-1; Fri, 31 Jan 2020 09:00:24 -0500
X-MC-Unique: aDQ0tYgeNa2UIgP0WcJmcA-1
Received: by mail-qv1-f72.google.com with SMTP id k2so4408841qvu.22
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 06:00:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbXB7kcOgI6kMZx0rwQl5+oz2Bb3il5EtPqK+akoYiQ=;
        b=EP8psF0je7dgHdG7K96C7Hypx90Kr64gsXhKRylUV5IrmKl+zQL0Gq9q90agJQ2AG1
         bgvEWdPtOe2MTmS/7uBvNC5RV3UIAf5ylw5jrpLaRzMI0212VXxHTaXQkiaVUk1p2y1W
         G8VLX6qhsbf62l9EP7HFMUK02H9ERD8Oisjdgcnl0y3dn/kMKCXRHN46XeNSz7j4s4JT
         VQ16e14LjP03oaoYbNjpMRwkUPAgCR0feZ93xFlRSr7tVNxOrLkbnksEPGNcz3IyTMR0
         wQwh6JrVhsgLF1Sw/e3UPjwPgeDDjOozyx8hFqHE/XpLYp7PuUKL6e2jx9yMJq73HruL
         Kofg==
X-Gm-Message-State: APjAAAV33vrPYPFgh7vXJUzgRrxYKYHoeHyez3cKoxYULIAxhSgmhG3k
        4RIqv5DlN2fjJKjVkoHQNdABC3ku3TUONJhq573V6CUp+GX0GOZQ94d7jCMwtX1Kynbdm4TV66b
        9geGqBWMSw2tcprmBX5DLG3NEdOl4oi1LOJhaIkU=
X-Received: by 2002:ac8:6713:: with SMTP id e19mr10545060qtp.154.1580479223685;
        Fri, 31 Jan 2020 06:00:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwhNyFhoD1LrA26dhVVYLj7shQClty9xJkNgfl9NuURk9Vem1/iDLscuSeX//6DGdgspLP9MdscZ0Owm8kd6As=
X-Received: by 2002:ac8:6713:: with SMTP id e19mr10545035qtp.154.1580479223413;
 Fri, 31 Jan 2020 06:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20200131124615.27849-1-hdegoede@redhat.com> <CAO-hwJL_5JKGjoKFyybfpA=89eK4C3nJtZMb5_8oxnzf9EJGaQ@mail.gmail.com>
 <d90a5b8f-08fa-b358-900c-b579f64e8782@redhat.com>
In-Reply-To: <d90a5b8f-08fa-b358-900c-b579f64e8782@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 31 Jan 2020 15:00:12 +0100
Message-ID: <CAO-hwJLW=40M0SvehBxYS=M-w2CAB8Ypco3bphQnqGnbk5F-wQ@mail.gmail.com>
Subject: Re: [PATCH] HID: generic: Check other drivers match callback from __check_hid_generic
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 31, 2020 at 2:49 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/31/20 2:39 PM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> __check_hid_generic is used to check if there is a driver, other then
> >> the hid-generic driver, which wants to handle the hid-device, in which
> >> case hid_generic_match() will return false so that the other driver can
> >> bind.
> >>
> >> But what if the other driver also has a match callback and that indicates
> >> it does not want to handle the device? Then hid-generic should bind to it
> >> and thus hid_generic_match() should NOT return false in that case.
> >>
> >> This commit makes __check_hid_generic check if a matching driver has
> >> a match callback and if it does makes its check this, so that
> >> hid-generic will bind to devices which have a matching other driver,
> >> but that other driver's match callback rejects the device.
> >
> > I get that part, but I am not sure I'll remember this in 2 months time
> > when/if we need to extend the .match() in another driver.
> > I am especially worried about the potential circular calls where an
> > other driver decides to check on all the other drivers having a match
> > callback...
> >
> > Could you add a little blurb either in hid-generic.c explaining the
> > logic, or (and) in hid.h where .match is defined?
> >
> > Because now, we have 2 callers for .match(): hid-core and hid-generic
> > (and 2 is usually one too many :-/).
>
> Ok, how about the following:
>
> static int __check_hid_generic(struct device_driver *drv, void *data)
> {
>         struct hid_driver *hdrv = to_hid_driver(drv);
>         struct hid_device *hdev = data;
>
>         if (hdrv == &hid_generic)
>                 return 0;
>
>         if (!hid_match_device(hdev, hdrv))
>                 return 0;
>
>         /*
>          * The purpose of looping over all drivers to see if one is a match
>          * for the hdev, is for hid-generic to NOT bind to any devices which
>          * have another, specialized, driver registerd. But in some cases that
>          * specialized driver might have a match callback itself, e.g. because
>          * it only wants to bind to a single USB interface of a device with
>          * multiple HID interfaces.
>          * So if another driver defines a match callback and that match
>          * callback returns false then hid-generic should still bind to the
>          * device and we should thus keep looping over the registered drivers.
>          */
>         if (!hdrv->match)
>                 return 1;
>
>         return hdrv->match(hdev, false);
> }
>
> ?
>
> Let me know if you like this then I'll send a v2 with this.

Yep, sounds good.

Could you also add a blurb in the docs of struct hid_driver in
include/linux/hid.h?

Something along the lines of:

match should return true if the driver wants the device, false
otherwise. Note that hid-generic has a special handling of this in
which it will also iterate over other .match() callbacks in other
drivers. Please refrain from duplicating this behaviour in other
drivers or dragons will come due to circular calls.

Cheers,
Benjamin


>
> Regards,
>
> Hans
>

