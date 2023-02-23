Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C58C86A0B3A
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbjBWNxB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 08:53:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234474AbjBWNw5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 08:52:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D711212D;
        Thu, 23 Feb 2023 05:52:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3519B81A31;
        Thu, 23 Feb 2023 13:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19EE4C433EF;
        Thu, 23 Feb 2023 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677160371;
        bh=br9jGzwYB6IOy5kfy02ldZQx4ca7vJpINHa4lOrb/qQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AgruiNeo2r2cv6TYLc3fllDpqlfMODobCKPFFNx4KUn73go7oBhxVy4ULgP0Fhnlf
         hMLsbN65Li4/5h9yVz9cQiV5pmvyUj5dhsxwIA8PtxmD5bo9NwpklF+bWLzkAPFdRd
         f0X57uJAQEbcBdLpZBgMe4AaPLzfQenwMaMVJ+N0=
Date:   Thu, 23 Feb 2023 14:52:48 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Filipe =?iso-8859-1?Q?La=EDns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
Subject: Re: [PATCH 4/5] USB: core: Add API to change the wireless_status
Message-ID: <Y/dvsH0IXhdOKh3L@kroah.com>
References: <20230223132452.37958-1-hadess@hadess.net>
 <20230223132452.37958-4-hadess@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223132452.37958-4-hadess@hadess.net>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 23, 2023 at 02:24:51PM +0100, Bastien Nocera wrote:
> Allow device specific drivers to change the wireless status of a device.
> This will allow user-space to know whether the device is available,
> whether or not specific USB interfaces can detect it.
> 
> This can be used by wireless headsets with USB receivers to propagate to
> user-space whether or not the headset is turned on, so as to consider it
> as unavailable, and not switch to it just because the receiver is
> plugged in.
> 
> Signed-off-by: Bastien Nocera <hadess@hadess.net>
> ---
>  drivers/usb/core/message.c | 13 +++++++++++++
>  drivers/usb/core/usb.c     | 24 ++++++++++++++++++++++++
>  include/linux/usb.h        |  4 ++++
>  3 files changed, 41 insertions(+)
> 
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 127fac1af676..d5c7749d515e 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -1908,6 +1908,18 @@ static void __usb_queue_reset_device(struct work_struct *ws)
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
> +	usb_update_wireless_status_attr(iface);
> +	usb_put_intf(iface);	/* Undo _get_ in usb_set_wireless_status() */
> +}

Why is this in a workqueue?  Why can't it just happen when asked?

I do not see any justification for that in your changelog or code :(

thanks,

greg k-h
