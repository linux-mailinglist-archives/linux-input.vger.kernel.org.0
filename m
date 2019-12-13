Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4520A11E085
	for <lists+linux-input@lfdr.de>; Fri, 13 Dec 2019 10:25:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbfLMJZc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Dec 2019 04:25:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:33858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725793AbfLMJZc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Dec 2019 04:25:32 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EC7162077B;
        Fri, 13 Dec 2019 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576229131;
        bh=jnAVSDie+3sKmgTHxxmc22U802fkkwPoaDp98ROoV0k=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=r+G0H1aNpgK/beSTLDTwh+dGwtbLxhrCSHAZO922Q9z+ZehPrC48GtNBrGocGOKMY
         PxZsPfOGd9gPNsMXXfQad8d08p8CgbtE8prbrsdvDTk1VjK6ZHGK9eCxRhHXJD67RN
         B/jMLqwWoJaFif7aSLntF6ZYM3bfuJTon8VfOhsg=
Date:   Fri, 13 Dec 2019 10:25:28 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: ite: Add USB id match for Acer SW5-012 keyboard
 dock
In-Reply-To: <20191119145711.59399-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.1912131025190.4603@cbobk.fhfr.pm>
References: <20191119145711.59399-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 19 Nov 2019, Hans de Goede wrote:

> The Acer SW5-012 2-in-1 keyboard dock uses a Synaptics S91028 touchpad
> which is connected to an ITE 8595 USB keyboard controller chip.
> 
> This keyboard has the same quirk for its rfkill / airplane mode hotkey as
> other keyboards with the ITE 8595 chip, it only sends a single release
> event when pressed and released, it never sends a press event.
> 
> This commit adds this keyboards USB id to the hid-ite id-table, fixing
> the rfkill key not working on this keyboard.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-ids.h | 1 +
>  drivers/hid/hid-ite.c | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index c2e60c727697..50985e321b4f 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -1100,6 +1100,7 @@
>  #define USB_DEVICE_ID_SYNAPTICS_LTS2	0x1d10
>  #define USB_DEVICE_ID_SYNAPTICS_HD	0x0ac3
>  #define USB_DEVICE_ID_SYNAPTICS_QUAD_HD	0x1ac3
> +#define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012	0x2968
>  #define USB_DEVICE_ID_SYNAPTICS_TP_V103	0x5710
>  #define USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5	0x81a7
>  
> diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
> index a45f2352618d..c436e12feb23 100644
> --- a/drivers/hid/hid-ite.c
> +++ b/drivers/hid/hid-ite.c
> @@ -40,6 +40,9 @@ static int ite_event(struct hid_device *hdev, struct hid_field *field,
>  static const struct hid_device_id ite_devices[] = {
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_258A, USB_DEVICE_ID_258A_6A88) },
> +	/* ITE8595 USB kbd ctlr, with Synaptics touchpad connected to it. */
> +	{ HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS,
> +			 USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
>  	{ }

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

