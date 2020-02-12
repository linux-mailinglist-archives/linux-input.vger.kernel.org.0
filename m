Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14B5615A9F0
	for <lists+linux-input@lfdr.de>; Wed, 12 Feb 2020 14:21:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgBLNUy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 Feb 2020 08:20:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:47286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727951AbgBLNUy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Feb 2020 08:20:54 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8B7C32086A;
        Wed, 12 Feb 2020 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581513654;
        bh=YMRWMQzXOXTCyCiGt8nKCezzfxDOQN19fCrb8zbS+DI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=kCBnFM9tfXt3zQ+xBtY6mX2mwepK/g3QVWhM4BZJzF6/MzrnnL5X1qalVgKA35cEI
         2CfwoHf2lI+Ed6nQ35S27/4MhmlA7LKRzPqUffGBhYZO76kDtv7TbI3PeEe99ovfsx
         m7gfYGSQnpZrOfZEfLBdWHG0Hc6iO+PpCuR1OKoI=
Date:   Wed, 12 Feb 2020 14:20:51 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Remove ITE 8595 entry from
 hid_have_special_driver
In-Reply-To: <20200131124625.27895-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2002121420440.3144@cbobk.fhfr.pm>
References: <20200131124625.27895-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 31 Jan 2020, Hans de Goede wrote:

> The ITE 8595 chip used in various 2-in-1 keyboard docks works fine with
> the hid-generic driver (minus the RF_KILL key) and also keeps working fine
> when swapping drivers, so there is no need to have it in the
> hid_have_special_driver list.
> 
> Note the other 2 USB ids in hid-ite.c were never added to
> hid_have_special_driver.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-quirks.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0e7b2d998395..503cfbe207ab 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -397,9 +397,6 @@ static const struct hid_device_id hid_have_special_driver[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT, USB_DEVICE_ID_HOLTEK_ALT_MOUSE_A081) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_HOLTEK_ALT, USB_DEVICE_ID_HOLTEK_ALT_MOUSE_A0C2) },
>  #endif
> -#if IS_ENABLED(CONFIG_HID_ITE)
> -	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
> -#endif
>  #if IS_ENABLED(CONFIG_HID_ICADE)
>  	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_ION, USB_DEVICE_ID_ICADE) },
>  #endif

Applied, thank you Hans.

-- 
Jiri Kosina
SUSE Labs

