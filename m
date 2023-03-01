Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 066766A6FCF
	for <lists+linux-input@lfdr.de>; Wed,  1 Mar 2023 16:33:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjCAPdK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Mar 2023 10:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjCAPdJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Mar 2023 10:33:09 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6C153DBE3
        for <linux-input@vger.kernel.org>; Wed,  1 Mar 2023 07:33:08 -0800 (PST)
Received: (qmail 209526 invoked by uid 1000); 1 Mar 2023 10:33:06 -0500
Date:   Wed, 1 Mar 2023 10:33:06 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH v2 5/6] USB: core: Add API to change the wireless_status
Message-ID: <Y/9wMsqKMKJUugl4@rowland.harvard.edu>
References: <20230301122310.3579-1-hadess@hadess.net>
 <20230301122310.3579-5-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230301122310.3579-5-hadess@hadess.net>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Mar 01, 2023 at 01:23:09PM +0100, Bastien Nocera wrote:
> This adds the API that allows device specific drivers to tell user-space
> about whether the wireless device is connected to its receiver dongle.
> 
> See "USB: core: Add wireless_status sysfs attribute" for a detailed
> explanation of what this attribute should be used for.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
> Fixed locking/use-after-free in v2, thanks to Alan Stern
> 
>  drivers/usb/core/message.c | 40 ++++++++++++++++++++++++++++++++++++++
>  include/linux/usb.h        |  5 +++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 127fac1af676..3867d9a85145 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1908,6 +1908,45 @@ static void __usb_queue_reset_device(struct work_struct *ws)
>  	usb_put_intf(iface);	/* Undo _get_ in usb_queue_reset_device() */
>  }
>  
> +/*
> + * Internal function to set the wireless_status sysfs attribute
> + * See usb_set_wireless_status() for more details
> + */
> +static void __usb_wireless_status_intf(struct work_struct *ws)
> +{
> +	struct usb_interface *iface =
> +		container_of(ws, struct usb_interface, wireless_status_work);
> +
> +	device_lock(iface->dev.parent);
> +	if (iface->sysfs_files_created)
> +		usb_update_wireless_status_attr(iface);
> +	usb_put_intf(iface);	/* Undo _get_ in usb_set_wireless_status() */
> +	device_unlock(iface->dev.parent);

Whoops!  Calling usb_put_intf() means the iface pointer is no longer 
valid.  The device_unlock() call should come before it, not after.

Alan

PS: You might also want to edit the sysfs documentation in the preceding 
patch, to make sure the text doesn't extend beyond the 80-column limit. 
I know people don't pay too much attention to that restriction in code 
any more, but in documentation it helps to keep the lines fairly short.  
People have trouble reading text when the lines get too long.
