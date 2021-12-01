Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC1046535F
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 17:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350378AbhLAQyN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 11:54:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243126AbhLAQyK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Dec 2021 11:54:10 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABC57C061574
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 08:50:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 744B9B8201C
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 16:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCFDC53FCC;
        Wed,  1 Dec 2021 16:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1638377447;
        bh=3AF64ioZQo7x6QGUn126rMx+Ywq4/OomMRa7kM04zYg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xMTD2tTXBs85a9o59q1J+LaqGfU0NY49rVh1hcSwNuyr5ycy7nPjmdAzobD7JvUQi
         NeCkQoKAu+iVAr70wdM2uwhRvzsnqOe+eAwoIqdNZmZOa/7cOkcKrAETxdKQqMFOLl
         kKxUa//QrCDrb0eZRSf/h3+iI5zW05ZrH68TsmVE=
Date:   Wed, 1 Dec 2021 17:50:44 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH 2/2] HID: check for valid USB device for many HID drivers
Message-ID: <Yaen5LIhfYQBdHac@kroah.com>
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
 <20211201141513.2107815-2-gregkh@linuxfoundation.org>
 <CAO-hwJJHrpUkbqCr2psqF62v0rR6E6zSUryee=S6SSwGfHCNhQ@mail.gmail.com>
 <YaeKH4E/cPfDkerc@kroah.com>
 <CAO-hwJ+HQxdVWA_Q3O+i7-Ur3RfeZ6VDZPJepb2Bx87Yhj1Ymw@mail.gmail.com>
 <4c57c020-a708-aa61-8d68-23f691dffa4c@redhat.com>
 <YaenGMpE8Atsfiyc@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YaenGMpE8Atsfiyc@kroah.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 01, 2021 at 05:47:20PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Dec 01, 2021 at 05:38:49PM +0100, Benjamin Tissoires wrote:
> > 
> > 
> > On Wed, Dec 1, 2021 at 4:05 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > > > > FWIW, I am also working on a test that generates all registered USB
> > > > > vid/pids from the currently running kernel and will try to inject them
> > > > > in the testsuite. This should validate this patch and prevent future
> > > > > mishaps.
> > > >
> > > > That would be great to see.  Let me know if you want these broken up
> > > > smaller, and I will go fix the above issues.
> > > 
> > > https://gitlab.freedesktop.org/bentiss/hid-tools/-/commit/2b04c6cf46c7405c8a916f324988660cb54dadea
> > > 
> > > This seems sufficient to make an unpatched kernel scream :)
> > 
> > I have now opened https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/122
> > with a quicker solution.
> > 
> > This leads apparently to 2 extra crashes:
> > - one in hid-holtek-kbd -> hid_is_usb() is called *after* hid_parse(), so
> >   report_fixup is actually called for uhid devices.
> 
> Fixed that one in my v2 patch submission.
> 
> > - another in bigbenff which is fixed by the following patch:
> > 
> > ---
> > diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
> > index db6da21ade06..74ad8bf98bfd 100644
> > --- a/drivers/hid/hid-bigbenff.c
> > +++ b/drivers/hid/hid-bigbenff.c
> > @@ -191,7 +191,7 @@ static void bigben_worker(struct work_struct *work)
> >  		struct bigben_device, worker);
> >  	struct hid_field *report_field = bigben->report->field[0];
> > -	if (bigben->removed)
> > +	if (bigben->removed || !report_field)
> 
> I don't see how this is a "USB device" issue.  It's a good "fuzz the
> driver with invalid data" fix though :)

And to be fair, you are going to find a _LOT_ of these types of issues
in most of the HID drivers once you start fuzzing like this.  Which is
good, but independent of the USB problem.

I have seen people starting to use syzbot to create USB HID devices
(works as a loopback, so they are real), and start to fuzz the drivers.
You've had some reports already, I imagine once they realize they should
use the ids in the list from your test above, lots more issues can be
found...

thanks,

greg k-h
