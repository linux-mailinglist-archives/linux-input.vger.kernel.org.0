Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A33B06A137A
	for <lists+linux-input@lfdr.de>; Fri, 24 Feb 2023 00:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229497AbjBWXEW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 23 Feb 2023 18:04:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjBWXEV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 18:04:21 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5812F3BDA9;
        Thu, 23 Feb 2023 15:04:16 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id CEB8E100002;
        Thu, 23 Feb 2023 23:04:12 +0000 (UTC)
Message-ID: <ba9eec1f2f0d41e3af8b1e73e4c804074e429cc4.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: core: Add API to change the wireless_status
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Fri, 24 Feb 2023 00:04:12 +0100
In-Reply-To: <Y/edOwVwfHVkoq9j@rowland.harvard.edu>
References: <20230223132452.37958-1-hadess@hadess.net>
         <20230223132452.37958-4-hadess@hadess.net>
         <Y/eJDDPXJfYgfdfI@rowland.harvard.edu>
         <f94acf520e62676c741c0959f91c8d951d74a36c.camel@hadess.net>
         <Y/eTkXYlflDWllHZ@rowland.harvard.edu>
         <16aaaa1a6207e7da07faa932ecac0dcc9e5f10e3.camel@hadess.net>
         <Y/edOwVwfHVkoq9j@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2023-02-23 at 12:07 -0500, Alan Stern wrote:
> On Thu, Feb 23, 2023 at 05:51:48PM +0100, Bastien Nocera wrote:
> > On Thu, 2023-02-23 at 11:25 -0500, Alan Stern wrote:
> > > On Thu, Feb 23, 2023 at 05:17:13PM +0100, Bastien Nocera wrote:
> > > > On Thu, 2023-02-23 at 10:41 -0500, Alan Stern wrote:
> > > > > On Thu, Feb 23, 2023 at 02:24:51PM +0100, Bastien Nocera
> > > > > wrote:
> > > > > > Allow device specific drivers to change the wireless status
> > > > > > of
> > > > > > a
> > > > > > device.
> > > > > > This will allow user-space to know whether the device is
> > > > > > available,
> > > > > > whether or not specific USB interfaces can detect it.
> > > > > > 
> > > > > > This can be used by wireless headsets with USB receivers to
> > > > > > propagate to
> > > > > > user-space whether or not the headset is turned on, so as
> > > > > > to
> > > > > > consider it
> > > > > > as unavailable, and not switch to it just because the
> > > > > > receiver
> > > > > > is
> > > > > > plugged in.
> > > > > > 
> > > > > > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > > > > > ---
> > > > > >  drivers/usb/core/message.c | 13 +++++++++++++
> > > > > >  drivers/usb/core/usb.c     | 24 ++++++++++++++++++++++++
> > > > > >  include/linux/usb.h        |  4 ++++
> > > > > >  3 files changed, 41 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/usb/core/message.c
> > > > > > b/drivers/usb/core/message.c
> > > > > > index 127fac1af676..d5c7749d515e 100644
> > > > > > --- a/drivers/usb/core/message.c
> > > > > > +++ b/drivers/usb/core/message.c
> > > > > > @@ -1908,6 +1908,18 @@ static void
> > > > > > __usb_queue_reset_device(struct
> > > > > > work_struct *ws)
> > > > > >         usb_put_intf(iface);    /* Undo _get_ in
> > > > > > usb_queue_reset_device() */
> > > > > >  }
> > > > > >  
> > > > > > +/*
> > > > > > + * Internal function to set the wireless_status sysfs
> > > > > > attribute
> > > > > > + * See usb_set_wireless_status() for more details
> > > > > > + */
> > > > > > +static void __usb_wireless_status_intf(struct work_struct
> > > > > > *ws)
> > > > > > +{
> > > > > > +       struct usb_interface *iface =
> > > > > > +               container_of(ws, struct usb_interface,
> > > > > > wireless_status_work);
> > > > > > +
> > > > > > +       usb_update_wireless_status_attr(iface);
> > > > > > +       usb_put_intf(iface);    /* Undo _get_ in
> > > > > > usb_set_wireless_status() */
> > > > > > +}
> > > > > 
> > > > > Have you thought about what will happen if this routine ends
> > > > > up
> > > > > running 
> > > > > after the interface has been deleted?
> > > > 
> > > > I believe that usb_release_interface() will only be called once
> > > > the
> > > > last reference to the interface is dropped, so bar any
> > > > refcounting
> > > > bugs, the interface should always exist when this function is
> > > > called.
> > > 
> > > Yes, but what about the calls made by
> > > usb_update_wireless_status_attr(): 
> > > sysfs_update_group(), sysfs_notify(), and kobject_uevent()?  Will
> > > they 
> > > work properly when called for an object that has been
> > > unregistered
> > > from 
> > > sysfs?
> > 
> > Those calls are made before the last reference to the interface can
> > be
> > dropped by our own call to usb_put_intf(). So, in effect, the
> > interface
> > is kept alive until we're done with our work so we can't ever be
> > poking
> > at objects that disappeared.
> > 
> > Am I missing something about the object model, or the refcounting
> > here?
> 
> Yes, you are.
> 
> There's a difference between object _existence_ and object 
> _registration_.  An object (kobject, struct device, whatever) exists
> for 
> as long as its memory is still allocated and in use.  This is what 
> refcounting protects.
> 
> An object is registered in sysfs during the time between calls to
> device_add() and device_del().  During this time it shows up as a 
> directory under /sys, along with its various attribute files. 
> Calling 
> device_del() gets rid of all that -- James Bottomley calls it
> "removing 
> an object from visibility".  The object still exists, but it isn't
> part 
> of sysfs any more.
> 
> The refcounting in your patch guarantees that when the work function 
> runs, the interface structure will still exist.  But refcounting does
> not guarantee that the interface will still be registered in sysfs,
> and 
> this can actually happen if the work is scheduled immediately before
> the 
> interface is unregistered.
> 
> So my question is: What will happen when sysfs_update_group(), 
> sysfs_notify(), and kobject_uevent() are called after the interface
> has 
> been unregistered from sysfs?  Maybe they will work okay -- I simply 
> don't know, and I wanted to find out whether you had considered the 
> issue.

A long week-end started for me a couple of hours ago, but I wanted to
dump my thoughts before either I forgot, or it took over my whole week-
end ;)

I had thought about the problem, and didn't think that sysfs files
would get removed before the interface got released/unref'ed and
usb_remove_sysfs_intf_files() got called.

If the device gets removed from the device bus before it's released,
then this patch should fix it:
--- a/drivers/usb/core/message.c
+++ b/drivers/usb/core/message.c
@@ -1917,7 +1917,8 @@ static void __usb_wireless_status_intf(struct work_struct *ws)
        struct usb_interface *iface =
                container_of(ws, struct usb_interface, wireless_status_work);
 
-       usb_update_wireless_status_attr(iface);
+       if (intf->sysfs_files_created)
+               usb_update_wireless_status_attr(iface);
        usb_put_intf(iface);    /* Undo _get_ in usb_set_wireless_status() */

The callback would be a no-op if the device's sysfs is already
unregistered, just unref'ing the reference it held.

What do you think? I'll amend that into my patchset on Monday.

Cheers
