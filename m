Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB5B6A5D04
	for <lists+linux-input@lfdr.de>; Tue, 28 Feb 2023 17:23:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjB1QXh convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Tue, 28 Feb 2023 11:23:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjB1QXg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Feb 2023 11:23:36 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [IPv6:2001:4b98:dc4:8::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 921EF1A5;
        Tue, 28 Feb 2023 08:23:34 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id F2E58240019;
        Tue, 28 Feb 2023 16:23:28 +0000 (UTC)
Message-ID: <cd0cabef9b434fdbf640a37c357878cdac80358b.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: core: Add API to change the wireless_status
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Tue, 28 Feb 2023 17:23:28 +0100
In-Reply-To: <Y/giLni7cwDGjLpr@rowland.harvard.edu>
References: <20230223132452.37958-1-hadess@hadess.net>
         <20230223132452.37958-4-hadess@hadess.net>
         <Y/eJDDPXJfYgfdfI@rowland.harvard.edu>
         <f94acf520e62676c741c0959f91c8d951d74a36c.camel@hadess.net>
         <Y/eTkXYlflDWllHZ@rowland.harvard.edu>
         <16aaaa1a6207e7da07faa932ecac0dcc9e5f10e3.camel@hadess.net>
         <Y/edOwVwfHVkoq9j@rowland.harvard.edu>
         <ba9eec1f2f0d41e3af8b1e73e4c804074e429cc4.camel@hadess.net>
         <Y/giLni7cwDGjLpr@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2023-02-23 at 21:34 -0500, Alan Stern wrote:
> On Fri, Feb 24, 2023 at 12:04:12AM +0100, Bastien Nocera wrote:
> > On Thu, 2023-02-23 at 12:07 -0500, Alan Stern wrote:
> > > The refcounting in your patch guarantees that when the work
> > > function 
> > > runs, the interface structure will still exist.  But refcounting
> > > does
> > > not guarantee that the interface will still be registered in
> > > sysfs,
> > > and 
> > > this can actually happen if the work is scheduled immediately
> > > before
> > > the 
> > > interface is unregistered.
> > > 
> > > So my question is: What will happen when sysfs_update_group(), 
> > > sysfs_notify(), and kobject_uevent() are called after the
> > > interface
> > > has 
> > > been unregistered from sysfs?  Maybe they will work okay -- I
> > > simply 
> > > don't know, and I wanted to find out whether you had considered
> > > the 
> > > issue.
> > 
> > A long week-end started for me a couple of hours ago, but I wanted
> > to
> > dump my thoughts before either I forgot, or it took over my whole
> > week-
> > end ;)
> > 
> > I had thought about the problem, and didn't think that sysfs files
> > would get removed before the interface got released/unref'ed and
> > usb_remove_sysfs_intf_files() got called.
> > 
> > If the device gets removed from the device bus before it's
> > released,
> > then this patch should fix it:
> > --- a/drivers/usb/core/message.c
> > +++ b/drivers/usb/core/message.c
> > @@ -1917,7 +1917,8 @@ static void __usb_wireless_status_intf(struct
> > work_struct *ws)
> >         struct usb_interface *iface =
> >                 container_of(ws, struct usb_interface,
> > wireless_status_work);
> >  
> > -       usb_update_wireless_status_attr(iface);
> > +       if (intf->sysfs_files_created)
> > +               usb_update_wireless_status_attr(iface);
> >         usb_put_intf(iface);    /* Undo _get_ in
> > usb_set_wireless_status() */
> > 
> > The callback would be a no-op if the device's sysfs is already
> > unregistered, just unref'ing the reference it held.
> > 
> > What do you think? I'll amend that into my patchset on Monday.
> 
> That's a good way to do it, but it does race with 
> usb_remove_sysfs_intf_files().  To prevent this race, you can protect
> the test and function call with device_lock(iface->dev.parent) (that
> is, 
> lock the interface's parent usb_device).

Perfect, I've done that locally.

I'll send an updated patchset once I've been able to test it against
the hardware I have.

Cheers
