Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 884D26A0B37
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 14:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234470AbjBWNwC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 08:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbjBWNwB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 08:52:01 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD9CA7ECD;
        Thu, 23 Feb 2023 05:51:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7D8F7B8190E;
        Thu, 23 Feb 2023 13:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D16C8C433D2;
        Thu, 23 Feb 2023 13:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677160317;
        bh=0EqSluo3udgHP1OklqLyemRAm+l3c4+PHY/AKAhEEhA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X63EqUzxqSEu6Q2/iP2EyfOERCyg6ny+RvFs1araa78hbJuBcjRBrF9ayeLtQNRae
         0HuZVlePUHnmFEajDgIfTsaLaJEcLW/EejEscb4oyG0SKiNfqf2Gu6OQBNSqJ7yrEW
         a/V4lVnVIM7NdWQC1U1g7xyfyKfI8NtakJhW94jk=
Date:   Thu, 23 Feb 2023 14:51:54 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH 3/5] USB: core: Add wireless_status sysfs attribute
Message-ID: <Y/dvesNrHivGV6JK@kroah.com>
References: <20230223132452.37958-1-hadess@hadess.net>
 <20230223132452.37958-3-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223132452.37958-3-hadess@hadess.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 23, 2023 at 02:24:50PM +0100, Bastien Nocera wrote:
> Add a wireless_status sysfs attribute to USB devices to keep track of
> whether a USB device that uses a receiver/emitter combo has its
> emitter connected or disconnected.

That's going to be very vague, and is starting to get very
interface-specific as an attibute here.

Why can't it just be an input device attribute?  Why is "wireless"
suddenly a special case for USB devices (we thought we got rid of the
old wireless usb code...)

> By default, the USB device will declare not to use a receiver/emitter.

I do not understand this statement, what do you mean by this?

> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  Documentation/ABI/testing/sysfs-bus-usb | 12 ++++++
>  drivers/usb/core/sysfs.c                | 50 +++++++++++++++++++++++++
>  drivers/usb/core/usb.h                  |  1 +
>  include/linux/usb.h                     | 10 +++++
>  4 files changed, 73 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-usb b/Documentation/ABI/testing/sysfs-bus-usb
> index 545c2dd97ed0..0bd22ece05cd 100644
> --- a/Documentation/ABI/testing/sysfs-bus-usb
> +++ b/Documentation/ABI/testing/sysfs-bus-usb
> @@ -166,6 +166,18 @@ Description:
>  		The file will be present for all speeds of USB devices, and will
>  		always read "no" for USB 1.1 and USB 2.0 devices.
>  
> +What:		/sys/bus/usb/devices/<INTERFACE>/wireless_status
> +Date:		January 2023

January was last month :(

> +Contact:	Bastien Nocera <hadess@hadess.net>
> +Description:
> +		Some USB devices use a small USB receiver coupled with a larger
> +		wireless device, usually communicating using proprietary
> +		wireless protocols. This attribute will read either "connected"
> +		or "disconnected" depending on whether the emitter is turned on,
> +		in range and connected, on the interface which is used to detect
> +		this state. If the device does not use a receiver/emitter combo,
> +		then this attribute will not exist.

So would you declare a wireless network device such a thing?

See, it gets tricky, I do not think this should be a generic USB
attribute at all.


> +
>  What:		/sys/bus/usb/devices/.../<hub_interface>/port<X>
>  Date:		August 2012
>  Contact:	Lan Tianyu <tianyu.lan@intel.com>
> diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
> index 8217032dfb85..da3c0f0dd633 100644
> --- a/drivers/usb/core/sysfs.c
> +++ b/drivers/usb/core/sysfs.c
> @@ -1232,9 +1232,59 @@ static const struct attribute_group intf_assoc_attr_grp = {
>  	.is_visible =	intf_assoc_attrs_are_visible,
>  };
>  
> +static ssize_t wireless_status_show(struct device *dev,
> +				    struct device_attribute *attr, char *buf)
> +{
> +	struct usb_interface *intf;
> +
> +	intf = to_usb_interface(dev);
> +	if (intf->wireless_status == USB_WIRELESS_STATUS_DISCONNECTED)
> +		return sysfs_emit(buf, "%s\n", "disconnected");
> +	return sysfs_emit(buf, "%s\n", "connected");
> +}
> +static DEVICE_ATTR_RO(wireless_status);
> +
> +static struct attribute *intf_wireless_status_attrs[] = {
> +	&dev_attr_wireless_status.attr,
> +	NULL
> +};
> +
> +static umode_t intf_wireless_status_attr_is_visible(struct kobject *kobj,
> +		struct attribute *a, int n)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct usb_interface *intf = to_usb_interface(dev);
> +
> +	if (a != &dev_attr_wireless_status.attr ||
> +	    intf->wireless_status != USB_WIRELESS_STATUS_NA)
> +		return a->mode;
> +	return 0;
> +}
> +
> +static const struct attribute_group intf_wireless_status_attr_grp = {
> +	.attrs =	intf_wireless_status_attrs,
> +	.is_visible =	intf_wireless_status_attr_is_visible,
> +};
> +
> +int usb_update_wireless_status_attr(struct usb_interface *intf)
> +{
> +	struct device *dev = &intf->dev;
> +	int ret;
> +
> +	ret = sysfs_update_group(&dev->kobj, &intf_wireless_status_attr_grp);
> +	if (ret < 0)
> +		return ret;
> +
> +	sysfs_notify(&dev->kobj, NULL, "wireless_status");
> +	kobject_uevent(&dev->kobj, KOBJ_CHANGE);

That could be very noisy, why does that deserve a KOBJ_CHANGE event?

thanks,

greg k-h
