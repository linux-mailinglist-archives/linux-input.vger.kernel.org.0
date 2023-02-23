Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8E66A0DB1
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 17:17:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233420AbjBWQRT convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 23 Feb 2023 11:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjBWQRT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 11:17:19 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5804A1D5;
        Thu, 23 Feb 2023 08:17:17 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 34B081BF210;
        Thu, 23 Feb 2023 16:17:13 +0000 (UTC)
Message-ID: <f94acf520e62676c741c0959f91c8d951d74a36c.camel@hadess.net>
Subject: Re: [PATCH 4/5] USB: core: Add API to change the wireless_status
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Thu, 23 Feb 2023 17:17:13 +0100
In-Reply-To: <Y/eJDDPXJfYgfdfI@rowland.harvard.edu>
References: <20230223132452.37958-1-hadess@hadess.net>
         <20230223132452.37958-4-hadess@hadess.net>
         <Y/eJDDPXJfYgfdfI@rowland.harvard.edu>
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

On Thu, 2023-02-23 at 10:41 -0500, Alan Stern wrote:
> On Thu, Feb 23, 2023 at 02:24:51PM +0100, Bastien Nocera wrote:
> > Allow device specific drivers to change the wireless status of a
> > device.
> > This will allow user-space to know whether the device is available,
> > whether or not specific USB interfaces can detect it.
> > 
> > This can be used by wireless headsets with USB receivers to
> > propagate to
> > user-space whether or not the headset is turned on, so as to
> > consider it
> > as unavailable, and not switch to it just because the receiver is
> > plugged in.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  drivers/usb/core/message.c | 13 +++++++++++++
> >  drivers/usb/core/usb.c     | 24 ++++++++++++++++++++++++
> >  include/linux/usb.h        |  4 ++++
> >  3 files changed, 41 insertions(+)
> > 
> > diff --git a/drivers/usb/core/message.c
> > b/drivers/usb/core/message.c
> > index 127fac1af676..d5c7749d515e 100644
> > --- a/drivers/usb/core/message.c
> > +++ b/drivers/usb/core/message.c
> > @@ -1908,6 +1908,18 @@ static void __usb_queue_reset_device(struct
> > work_struct *ws)
> >         usb_put_intf(iface);    /* Undo _get_ in
> > usb_queue_reset_device() */
> >  }
> >  
> > +/*
> > + * Internal function to set the wireless_status sysfs attribute
> > + * See usb_set_wireless_status() for more details
> > + */
> > +static void __usb_wireless_status_intf(struct work_struct *ws)
> > +{
> > +       struct usb_interface *iface =
> > +               container_of(ws, struct usb_interface,
> > wireless_status_work);
> > +
> > +       usb_update_wireless_status_attr(iface);
> > +       usb_put_intf(iface);    /* Undo _get_ in
> > usb_set_wireless_status() */
> > +}
> 
> Have you thought about what will happen if this routine ends up
> running 
> after the interface has been deleted?

I believe that usb_release_interface() will only be called once the
last reference to the interface is dropped, so bar any refcounting
bugs, the interface should always exist when this function is called.

> >  /*
> >   * usb_set_configuration - Makes a particular device setting be
> > current
> > @@ -2100,6 +2112,7 @@ int usb_set_configuration(struct usb_device
> > *dev, int configuration)
> >                 intf->dev.type = &usb_if_device_type;
> >                 intf->dev.groups = usb_interface_groups;
> >                 INIT_WORK(&intf->reset_ws,
> > __usb_queue_reset_device);
> > +               INIT_WORK(&intf->wireless_status_work,
> > __usb_wireless_status_intf);
> >                 intf->minor = -1;
> >                 device_initialize(&intf->dev);
> >                 pm_runtime_no_callbacks(&intf->dev);
> > diff --git a/drivers/usb/core/usb.c b/drivers/usb/core/usb.c
> > index 11b15d7b357a..5f42c5b9d209 100644
> > --- a/drivers/usb/core/usb.c
> > +++ b/drivers/usb/core/usb.c
> > @@ -871,6 +871,30 @@ int usb_get_current_frame_number(struct
> > usb_device *dev)
> >  }
> >  EXPORT_SYMBOL_GPL(usb_get_current_frame_number);
> >  
> > +/**
> > + * usb_set_wireless_status - sets the wireless_status struct
> > member
> > + * @dev: the device to modify
> > + * @status: the new wireless status
> > + *
> > + * Set the wireless_status struct member to the new value, and
> > emit
> > + * sysfs changes as necessary.
> > + *
> > + * Returns: 0 on success, -EALREADY if already set.
> > + */
> > +int usb_set_wireless_status(struct usb_interface *iface,
> > +               enum usb_wireless_status status)
> > +{
> > +       if (iface->wireless_status == status)
> > +               return -EALREADY;
> > +
> > +       usb_get_intf(iface);
> > +       iface->wireless_status = status;
> > +       schedule_work(&iface->wireless_status_work);
> > +
> > +       return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(usb_set_wireless_status);
> 
> This routine belongs in message.c, next to
> __usb_wireless_status_intf().

Sure, done locally.
