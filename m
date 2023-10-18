Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AE0A7CE0F5
	for <lists+linux-input@lfdr.de>; Wed, 18 Oct 2023 17:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232334AbjJRPRS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Oct 2023 11:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235349AbjJRPRQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Oct 2023 11:17:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF231139
        for <linux-input@vger.kernel.org>; Wed, 18 Oct 2023 08:17:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29F7C433C7;
        Wed, 18 Oct 2023 15:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697642232;
        bh=Y3tABglE4dX7g1Ma8NDjRRxdQdTS8qdtGR0RU8rygnI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N6Qx72JGgUoMhQpe6jDD/X9/VcgL34fC44DlM7bqXJG52GM2LVnv40q7mgNhEs+KA
         DA8GfPPjbWpi6aAc63RyxJPU2PaE8N2offZsgX4qTEbK/8MHdXF1M7sD8c6vHItyWk
         HRcYb4YTri6XvLOgQe9uLKw6HB/12FoQ1Qq3p7UWPxou4ELqjvgQaCKM/7ctj9LO5R
         j1l+NfMP4c3BmGA79aE/+0nTQy7xPLhoR+wWUENXwQGj9mji9BmnmNWOrOEq9+xNU0
         0hmc4XJb0vTUm86Lkgvu+giYxuzMPQymD3uFI3tv0CeNNP6dmsuCydKgNQXfjM3GV9
         sKPEPzUHfQzOA==
Date:   Wed, 18 Oct 2023 17:17:08 +0200
From:   Benjamin Tissoires <bentiss@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 01/12] HID: logitech-hidpp: Don't restart IO, instead
 defer hid_connect() only
Message-ID: <ha4irm6pz34zepdfpvs3vuo6ffvalkvfp4ase3githdtn4qlrz@tgl4lwzcpdee>
References: <20231010102029.111003-1-hdegoede@redhat.com>
 <20231010102029.111003-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010102029.111003-2-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

FWIW, your series looks good, but I came accross a small nitpick here:

On Oct 10 2023, Hans de Goede wrote:
> Restarting IO causes 2 problems:
> 
> 1. Some devices do not like IO being restarted this was addressed in
>    commit 498ba2069035 ("HID: logitech-hidpp: Don't restart communication
>    if not necessary"), but that change has issues of its own and needs to
>    be reverted.
> 
> 2. Restarting IO and specifically calling hid_device_io_stop() causes
>    received packets to be missed, which may cause connect-events to
>    get missed.
> 
> Restarting IO was introduced in commit 91cf9a98ae41 ("HID: logitech-hidpp:
> make .probe usbhid capable") to allow to retrieve the device's name and
> serial number and store these in hdev->name and hdev->uniq before
> connecting any hid subdrivers (hid-input, hidraw) exporting this info
> to userspace.
> 
> But this does not require restarting IO, this merely requires deferring
> calling hid_connect(). Calling hid_hw_start() with a connect-mask of
> 0 makes it skip calling hid_connect(), so hidpp_probe() can simply call
> hid_connect() later without needing to restart IO.
> 
> Remove the stop + restart of IO and instead just call hid_connect() later
> to avoid the issues caused by restarting IO.
> 
> Now that IO is no longer stopped, hid_hw_close() must be called at the end
> of probe() to balance the hid_hw_open() done at the beginning probe().
> 
> This series has been tested on the following devices:
> Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
> Logitech M720 Triathlon (bluetooth, HID++ 4.5)
> Logitech M720 Triathlon (unifying, HID++ 4.5)
> Logitech K400 Pro (unifying, HID++ 4.1)
> Logitech K270 (eQUAD nano Lite, HID++ 2.0)
> Logitech M185 (eQUAD nano Lite, HID++ 4.5)
> Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
> Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)
> 
> Fixes: 498ba2069035 ("HID: logitech-hidpp: Don't restart communication if not necessary")
> Suggested-by: Benjamin Tissoires <bentiss@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/hid/hid-logitech-hidpp.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index a209d51bd247..aa4f232c4518 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4460,8 +4460,10 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  			 hdev->name);
>  
>  	/*
> -	 * Plain USB connections need to actually call start and open
> -	 * on the transport driver to allow incoming data.
> +	 * First call hid_hw_start(hdev, 0) to allow IO without connecting any
> +	 * hid subdrivers (hid-input, hidraw). This allows retrieving the dev's
> +	 * name and serial number and store these in hdev->name and hdev->uniq,
> +	 * before the hid-input and hidraw drivers expose these to userspace.
>  	 */
>  	ret = hid_hw_start(hdev, will_restart ? 0 : connect_mask);
>  	if (ret) {
> @@ -4519,19 +4521,14 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	flush_work(&hidpp->work);
>  
>  	if (will_restart) {
> -		/* Reset the HID node state */
> -		hid_device_io_stop(hdev);
> -		hid_hw_close(hdev);
> -		hid_hw_stop(hdev);
> -
>  		if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
>  			connect_mask &= ~HID_CONNECT_HIDINPUT;
>  
>  		/* Now export the actual inputs and hidraw nodes to the world */
> -		ret = hid_hw_start(hdev, connect_mask);
> +		ret = hid_connect(hdev, connect_mask);

On plain USB devices, we get a new warning here "io already started".

This is because hid_connect() will call hid_pidff_init() from
drivers/hid/usbhid/hid-pidff.c if connect_mask has the `HID_CONNECT_FF`
bit set.

And hid_pidff_init() blindly calls hid_device_io_start() then
hid_device_io_stop().

It's not a big issue, but still it's a new warning we have to tackly on.

I see 3 possible solutions:
- teach hid_pidff_init() to only start/stop the IOs if it's not already
  done so
- if a device is actually connected through USB, call
  hid_device_io_stop() before hid_connect()
- unconditionally call hid_device_io_stop() before hid_connect()

The latter has my current preference as we won't get biten in the future
if something else decides to change the io state.

However, do you thing it'll be an issue to disable IOs there?
And maybe we should re-enable them after?

If it's fine to simply disable the IOs, we can add an extra patch on top
of this series to fix that warning in the USB case.

As mentioned above, I have tested with the T650, T651 that were likely to
be a problem, and they are working just fine :)

So with that minor fix, we should be able to stage this series.

Thanks again for your hard work

Cheers,
Benjamin

>  		if (ret) {
> -			hid_err(hdev, "%s:hid_hw_start returned error\n", __func__);
> -			goto hid_hw_start_fail;
> +			hid_err(hdev, "%s:hid_connect returned error %d\n", __func__, ret);
> +			goto hid_hw_init_fail;
>  		}
>  	}
>  
> @@ -4543,6 +4540,11 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  				 ret);
>  	}
>  
> +	/*
> +	 * This relies on logi_dj_ll_close() being a no-op so that DJ connection
> +	 * events will still be received.
> +	 */
> +	hid_hw_close(hdev);
>  	return ret;
>  
>  hid_hw_init_fail:
> -- 
> 2.41.0
> 
