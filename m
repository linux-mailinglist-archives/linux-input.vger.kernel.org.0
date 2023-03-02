Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 788636A836F
	for <lists+linux-input@lfdr.de>; Thu,  2 Mar 2023 14:23:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjCBNXo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 2 Mar 2023 08:23:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjCBNXo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Mar 2023 08:23:44 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D50118A9B;
        Thu,  2 Mar 2023 05:23:40 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id C548DFF808;
        Thu,  2 Mar 2023 13:23:36 +0000 (UTC)
Message-ID: <b440c958fd071163a619f5c09d5b51242d8b8b45.camel@hadess.net>
Subject: Re: [PATCH v2 5/6] USB: core: Add API to change the wireless_status
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Thu, 02 Mar 2023 14:23:36 +0100
In-Reply-To: <Y/9wMsqKMKJUugl4@rowland.harvard.edu>
References: <20230301122310.3579-1-hadess@hadess.net>
         <20230301122310.3579-5-hadess@hadess.net>
         <Y/9wMsqKMKJUugl4@rowland.harvard.edu>
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

On Wed, 2023-03-01 at 10:33 -0500, Alan Stern wrote:
> On Wed, Mar 01, 2023 at 01:23:09PM +0100, Bastien Nocera wrote:
> > This adds the API that allows device specific drivers to tell user-
> > space
> > about whether the wireless device is connected to its receiver
> > dongle.
> > 
> > See "USB: core: Add wireless_status sysfs attribute" for a detailed
> > explanation of what this attribute should be used for.
> > 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> > Fixed locking/use-after-free in v2, thanks to Alan Stern
> > 
> >  drivers/usb/core/message.c | 40
> > ++++++++++++++++++++++++++++++++++++++
> >  include/linux/usb.h        |  5 +++++
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/drivers/usb/core/message.c
> > b/drivers/usb/core/message.c
> > index 127fac1af676..3867d9a85145 100644
> > --- a/drivers/usb/core/message.c
> > +++ b/drivers/usb/core/message.c
> > @@ -1908,6 +1908,45 @@ static void __usb_queue_reset_device(struct
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
> > +       device_lock(iface->dev.parent);
> > +       if (iface->sysfs_files_created)
> > +               usb_update_wireless_status_attr(iface);
> > +       usb_put_intf(iface);    /* Undo _get_ in
> > usb_set_wireless_status() */
> > +       device_unlock(iface->dev.parent);
> 
> Whoops!  Calling usb_put_intf() means the iface pointer is no longer 
> valid.  The device_unlock() call should come before it, not after.

Fixed this in v3.

> PS: You might also want to edit the sysfs documentation in the
> preceding 
> patch, to make sure the text doesn't extend beyond the 80-column
> limit. 
> I know people don't pay too much attention to that restriction in
> code 
> any more, but in documentation it helps to keep the lines fairly
> short.  
> People have trouble reading text when the lines get too long.

That's an easy fix, so done in v3 as well.
