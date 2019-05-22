Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F56E262E9
	for <lists+linux-input@lfdr.de>; Wed, 22 May 2019 13:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfEVLUv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 22 May 2019 07:20:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:35348 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728438AbfEVLUv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 22 May 2019 07:20:51 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7BB50217F9;
        Wed, 22 May 2019 11:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558524051;
        bh=C85QBBMJDaCDUPYRbmc1+YR5erEjaqlU1xapkNSoz3A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=SvwusVEPGjmuFHV0mqhLuj+Pvwnmaa+TVqpKvMhv/TctG65uCZih7aulSeLn4lpEG
         5T6fakOhf8XN002AbruZYMJMWMWVK41m0D0UqtgbpjjOdVndsKjknAyxXh+rVXz62K
         5fB9VR+m1+CeKFHg9osAyUHxJljiSrOaXI5RHnwI=
Date:   Wed, 22 May 2019 13:20:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: Add support for the S510 remote
 control
In-Reply-To: <20190512103602.4754-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1905221320310.1962@cbobk.fhfr.pm>
References: <20190512103602.4754-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 12 May 2019, Hans de Goede wrote:

> The S510 remote-control shows up as a second keyboard (keypad) on the
> receiver. It has a scroll-wheel, which normally sends wheel event
> originating from the mouse's evdev node.
> 
> Add a HIDPP_QUIRK_KBD_SCROLL_WHEEL quirk for it, so that the wheel events
> properly originate from the evdev node of the remote control itself.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index b99619d64080..14c84e1189a4 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -3747,6 +3747,9 @@ static const struct hid_device_id hidpp_devices[] = {
>  	{ /* Keyboard MX3200 (Y-RAV80) */
>  	  L27MHZ_DEVICE(0x005c),
>  	  .driver_data = HIDPP_QUIRK_KBD_ZOOM_WHEEL },
> +	{ /* S510 Media Remote */
> +	  L27MHZ_DEVICE(0x00fe),
> +	  .driver_data = HIDPP_QUIRK_KBD_SCROLL_WHEEL },

Queued in for-5.2/fixes, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

