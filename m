Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A10817594B
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgCBLM7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:12:59 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:53301 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726831AbgCBLM6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:12:58 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id B0E11240016;
        Mon,  2 Mar 2020 11:12:03 +0000 (UTC)
Message-ID: <43ac062abc7eebd8d1bfa9d1f1ef6782a78e6142.camel@hadess.net>
Subject: Re: [PATCH resend 02/10] Input: goodix - Make loading the config
 from disk independent from the GPIO setup
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:12:02 +0100
In-Reply-To: <20200221164735.508324-2-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-2-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> At least on X86 ACPI platforms it is not necessary to load the
> touchscreen
> controller config from disk, if it needs to be loaded this has
> already been
> done by the BIOS / UEFI firmware.
> 
> Even on other (e.g. devicetree) platforms the config-loading as
> currently
> done has the issue that the loaded cfg file is based on the
> controller
> model, but the actual cfg is device specific, so the cfg files are
> not
> part of linux-firmware and this can only work with a device specific
> OS
> image which includes the cfg file.
> 
> And we do not need access to the GPIOs at all to load the config, if
> we
> do not have access we can still load the config.
> 
> So all in all tying the decision to try to load the config from disk
> to
> being able to access the GPIOs is not desirable. This commit adds a
> new
> load_cfg_from_disk boolean to control the firmware loading instead.
> 
> This commits sets the new bool to true when we set
> irq_pin_access_method
> to irq_pin_access_gpio, so there are no functional changes.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks good.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 08806a00a9b9..eccf07adfae1 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -56,6 +56,7 @@ struct goodix_ts_data {
>  	u16 id;
>  	u16 version;
>  	const char *cfg_name;
> +	bool load_cfg_from_disk;
>  	struct completion firmware_loading_complete;
>  	unsigned long irq_flags;
>  	enum goodix_irq_pin_access_method irq_pin_access_method;
> @@ -654,8 +655,10 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  
>  	ts->gpiod_rst = gpiod;
>  
> -	if (ts->gpiod_int && ts->gpiod_rst)
> +	if (ts->gpiod_int && ts->gpiod_rst) {
> +		ts->load_cfg_from_disk = true;
>  		ts->irq_pin_access_method = irq_pin_access_gpio;
> +	}
>  
>  	return 0;
>  }
> @@ -952,7 +955,7 @@ static int goodix_ts_probe(struct i2c_client
> *client,
>  
>  	ts->chip = goodix_get_chip_data(ts->id);
>  
> -	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
> +	if (ts->load_cfg_from_disk) {
>  		/* update device config */
>  		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
>  					      "goodix_%d_cfg.bin", ts-
> >id);
> @@ -983,7 +986,7 @@ static int goodix_ts_remove(struct i2c_client
> *client)
>  {
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  
> -	if (ts->irq_pin_access_method == irq_pin_access_gpio)
> +	if (ts->load_cfg_from_disk)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  
>  	return 0;
> @@ -1001,7 +1004,8 @@ static int __maybe_unused goodix_suspend(struct
> device *dev)
>  		return 0;
>  	}
>  
> -	wait_for_completion(&ts->firmware_loading_complete);
> +	if (ts->load_cfg_from_disk)
> +		wait_for_completion(&ts->firmware_loading_complete);
>  
>  	/* Free IRQ as IRQ pin is used as output in the suspend
> sequence */
>  	goodix_free_irq(ts);

