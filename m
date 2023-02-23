Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6DD06A0C56
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 15:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbjBWO62 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Thu, 23 Feb 2023 09:58:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232900AbjBWO62 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 09:58:28 -0500
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0030E18150;
        Thu, 23 Feb 2023 06:58:25 -0800 (PST)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id BD6E140010;
        Thu, 23 Feb 2023 14:58:22 +0000 (UTC)
Message-ID: <6456c0e4949f8e982ec83198181f1db6a27adb76.camel@hadess.net>
Subject: Re: [PATCH 3/5] USB: core: Add wireless_status sysfs attribute
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Date:   Thu, 23 Feb 2023 15:58:22 +0100
In-Reply-To: <Y/dvesNrHivGV6JK@kroah.com>
References: <20230223132452.37958-1-hadess@hadess.net>
         <20230223132452.37958-3-hadess@hadess.net> <Y/dvesNrHivGV6JK@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 2023-02-23 at 14:51 +0100, Greg Kroah-Hartman wrote:
> On Thu, Feb 23, 2023 at 02:24:50PM +0100, Bastien Nocera wrote:
> > Add a wireless_status sysfs attribute to USB devices to keep track
> > of
> > whether a USB device that uses a receiver/emitter combo has its
> > emitter connected or disconnected.
> 
> That's going to be very vague, and is starting to get very
> interface-specific as an attibute here.
> 
> Why can't it just be an input device attribute?  Why is "wireless"
> suddenly a special case for USB devices (we thought we got rid of the
> old wireless usb code...)

We already had that discussion in December:
https://patchwork.kernel.org/project/linux-usb/patch/d9f8b9413c10fcf067658979d16a4f5c7abe69e7.camel@hadess.net/

Do you want me to reference this discussion somewhere?

It's not an input device attribute because, in the rest of this
patchset, the fact that it uses HID is an implementation detail.

> > By default, the USB device will declare not to use a
> > receiver/emitter.
> 
> I do not understand this statement, what do you mean by this?

That the default is for the wireless_status sysfs attribute not to be
present, which means that the device isn't a receiver/emitter. I can
remove that if it's confusing.

> 
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> > ---
> >  Documentation/ABI/testing/sysfs-bus-usb | 12 ++++++
> >  drivers/usb/core/sysfs.c                | 50
> > +++++++++++++++++++++++++
> >  drivers/usb/core/usb.h                  |  1 +
> >  include/linux/usb.h                     | 10 +++++
> >  4 files changed, 73 insertions(+)
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-bus-usb
> > b/Documentation/ABI/testing/sysfs-bus-usb
> > index 545c2dd97ed0..0bd22ece05cd 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-usb
> > +++ b/Documentation/ABI/testing/sysfs-bus-usb
> > @@ -166,6 +166,18 @@ Description:
> >                 The file will be present for all speeds of USB
> > devices, and will
> >                 always read "no" for USB 1.1 and USB 2.0 devices.
> >  
> > +What:          /sys/bus/usb/devices/<INTERFACE>/wireless_status
> > +Date:          January 2023
> 
> January was last month :(

Sure.

> > +Contact:       Bastien Nocera <hadess@hadess.net>
> > +Description:
> > +               Some USB devices use a small USB receiver coupled
> > with a larger
> > +               wireless device, usually communicating using
> > proprietary
> > +               wireless protocols. This attribute will read either
> > "connected"
> > +               or "disconnected" depending on whether the emitter
> > is turned on,
> > +               in range and connected, on the interface which is
> > used to detect
> > +               this state. If the device does not use a
> > receiver/emitter combo,
> > +               then this attribute will not exist.
> 
> So would you declare a wireless network device such a thing?

No, because the emitter and receiver together aren't considered a
single device.

> See, it gets tricky, I do not think this should be a generic USB
> attribute at all.

See above, it was already discussed.

> > +
> >  What:          /sys/bus/usb/devices/.../<hub_interface>/port<X>
> >  Date:          August 2012
> >  Contact:       Lan Tianyu <tianyu.lan@intel.com>
> > diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> > index 8217032dfb85..da3c0f0dd633 100644
> > --- a/drivers/usb/core/sysfs.c
> > +++ b/drivers/usb/core/sysfs.c
> > @@ -1232,9 +1232,59 @@ static const struct attribute_group
> > intf_assoc_attr_grp = {
> >         .is_visible =   intf_assoc_attrs_are_visible,
> >  };
> >  
> > +static ssize_t wireless_status_show(struct device *dev,
> > +                                   struct device_attribute *attr,
> > char *buf)
> > +{
> > +       struct usb_interface *intf;
> > +
> > +       intf = to_usb_interface(dev);
> > +       if (intf->wireless_status ==
> > USB_WIRELESS_STATUS_DISCONNECTED)
> > +               return sysfs_emit(buf, "%s\n", "disconnected");
> > +       return sysfs_emit(buf, "%s\n", "connected");
> > +}
> > +static DEVICE_ATTR_RO(wireless_status);
> > +
> > +static struct attribute *intf_wireless_status_attrs[] = {
> > +       &dev_attr_wireless_status.attr,
> > +       NULL
> > +};
> > +
> > +static umode_t intf_wireless_status_attr_is_visible(struct kobject
> > *kobj,
> > +               struct attribute *a, int n)
> > +{
> > +       struct device *dev = kobj_to_dev(kobj);
> > +       struct usb_interface *intf = to_usb_interface(dev);
> > +
> > +       if (a != &dev_attr_wireless_status.attr ||
> > +           intf->wireless_status != USB_WIRELESS_STATUS_NA)
> > +               return a->mode;
> > +       return 0;
> > +}
> > +
> > +static const struct attribute_group intf_wireless_status_attr_grp
> > = {
> > +       .attrs =        intf_wireless_status_attrs,
> > +       .is_visible =   intf_wireless_status_attr_is_visible,
> > +};
> > +
> > +int usb_update_wireless_status_attr(struct usb_interface *intf)
> > +{
> > +       struct device *dev = &intf->dev;
> > +       int ret;
> > +
> > +       ret = sysfs_update_group(&dev->kobj,
> > &intf_wireless_status_attr_grp);
> > +       if (ret < 0)
> > +               return ret;
> > +
> > +       sysfs_notify(&dev->kobj, NULL, "wireless_status");
> > +       kobject_uevent(&dev->kobj, KOBJ_CHANGE);
> 
> That could be very noisy, why does that deserve a KOBJ_CHANGE event?

Because otherwise user-space can't know that the property either
appeared or changed. This change only happens when the device is
powered on or off while the receiver is plugged in, so this shouldn't
happen at any excessive rate.
