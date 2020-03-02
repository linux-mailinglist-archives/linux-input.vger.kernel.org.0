Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D60175939
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbgCBLKT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:10:19 -0500
Received: from relay10.mail.gandi.net ([217.70.178.230]:42819 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgCBLKT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:10:19 -0500
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id C46D124001C;
        Mon,  2 Mar 2020 11:09:56 +0000 (UTC)
Message-ID: <1c57e9d567af8041fb8aff94d4095af0ff8b4484.camel@hadess.net>
Subject: Re: [PATCH resend 01/10] Input: goodix - Refactor IRQ pin GPIO
 accesses
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:09:55 +0100
In-Reply-To: <20200221164735.508324-1-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Suspending Goodix touchscreens requires changing the interrupt pin to
> output before sending them a power-down command. Followed by wiggling
> the interrupt pin to wake the device up, after which it is put back
> in input mode.
> 
> So far we have only effectively supported this on devices which use
> devicetree. On X86 ACPI platforms both looking up the pins; and using
> a
> pin as both IRQ and GPIO is a bit more complicated. E.g. on some
> devices
> we cannot directly access the IRQ pin as GPIO and we need to call
> ACPI
> methods to control it instead.
> 
> This commit adds a new irq_pin_access_method field to the
> goodix_chip_data
> struct and adds goodix_irq_direction_output and
> goodix_irq_direction_input
> helpers which together abstract the GPIO accesses to the IRQ pin.
> 
> This is a preparation patch for adding support for properly
> suspending the
> touchscreen on X86 ACPI platforms.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 62 ++++++++++++++++++++++++--
> ----
>  1 file changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 0403102e807e..08806a00a9b9 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -31,6 +31,11 @@
>  
>  struct goodix_ts_data;
>  
> +enum goodix_irq_pin_access_method {
> +	irq_pin_access_none,
> +	irq_pin_access_gpio,

I don't know if that matches the kernel coding style, but I'd rather
the enum member names were upper-case, and typedef'ed.

> +};
> +
>  struct goodix_chip_data {
>  	u16 config_addr;
>  	int config_len;
> @@ -53,6 +58,7 @@ struct goodix_ts_data {
>  	const char *cfg_name;
>  	struct completion firmware_loading_complete;
>  	unsigned long irq_flags;
> +	enum goodix_irq_pin_access_method irq_pin_access_method;
>  	unsigned int contact_size;
>  };
>  
> @@ -502,17 +508,48 @@ static int goodix_send_cfg(struct
> goodix_ts_data *ts,
>  	return 0;
>  }
>  
> +static int goodix_irq_direction_output(struct goodix_ts_data *ts,
> +				       int value)
> +{
> +	switch (ts->irq_pin_access_method) {
> +	case irq_pin_access_none:
> +		dev_err(&ts->client->dev,
> +			"%s called without an irq_pin_access_method
> set\n",
> +			__func__);
> +		return -EINVAL;
> +	case irq_pin_access_gpio:
> +		return gpiod_direction_output(ts->gpiod_int, value);

Is that going to complain about default not being handled? If so, an if
conditional might be enough.

> +	}
> +
> +	return -EINVAL; /* Never reached */
> +}
> +
> +static int goodix_irq_direction_input(struct goodix_ts_data *ts)
> +{
> +	switch (ts->irq_pin_access_method) {
> +	case irq_pin_access_none:
> +		dev_err(&ts->client->dev,
> +			"%s called without an irq_pin_access_method
> set\n",
> +			__func__);
> +		return -EINVAL;
> +	case irq_pin_access_gpio:
> +		return gpiod_direction_input(ts->gpiod_int);

Ditto.

Looks fine otherwise.


> +	}
> +
> +	return -EINVAL; /* Never reached */
> +}
> +
>  static int goodix_int_sync(struct goodix_ts_data *ts)
>  {
>  	int error;
>  
> -	error = gpiod_direction_output(ts->gpiod_int, 0);
> +	error = goodix_irq_direction_output(ts, 0);
>  	if (error)
>  		return error;
>  
>  	msleep(50);				/* T5: 50ms */
>  
> -	error = gpiod_direction_input(ts->gpiod_int);
> +	error = goodix_irq_direction_input(ts);
>  	if (error)
>  		return error;
>  
> @@ -536,7 +573,7 @@ static int goodix_reset(struct goodix_ts_data
> *ts)
>  	msleep(20);				/* T2: > 10ms */
>  
>  	/* HIGH: 0x28/0x29, LOW: 0xBA/0xBB */
> -	error = gpiod_direction_output(ts->gpiod_int, ts->client->addr
> == 0x14);
> +	error = goodix_irq_direction_output(ts, ts->client->addr ==
> 0x14);
>  	if (error)
>  		return error;
>  
> @@ -617,6 +654,9 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  
>  	ts->gpiod_rst = gpiod;
>  
> +	if (ts->gpiod_int && ts->gpiod_rst)
> +		ts->irq_pin_access_method = irq_pin_access_gpio;
> +
>  	return 0;
>  }
>  
> @@ -889,7 +929,7 @@ static int goodix_ts_probe(struct i2c_client
> *client,
>  	if (error)
>  		return error;
>  
> -	if (ts->gpiod_int && ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
>  		/* reset the controller */
>  		error = goodix_reset(ts);
>  		if (error) {
> @@ -912,7 +952,7 @@ static int goodix_ts_probe(struct i2c_client
> *client,
>  
>  	ts->chip = goodix_get_chip_data(ts->id);
>  
> -	if (ts->gpiod_int && ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
>  		/* update device config */
>  		ts->cfg_name = devm_kasprintf(&client->dev, GFP_KERNEL,
>  					      "goodix_%d_cfg.bin", ts-
> >id);
> @@ -943,7 +983,7 @@ static int goodix_ts_remove(struct i2c_client
> *client)
>  {
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  
> -	if (ts->gpiod_int && ts->gpiod_rst)
> +	if (ts->irq_pin_access_method == irq_pin_access_gpio)
>  		wait_for_completion(&ts->firmware_loading_complete);
>  
>  	return 0;
> @@ -956,7 +996,7 @@ static int __maybe_unused goodix_suspend(struct
> device *dev)
>  	int error;
>  
>  	/* We need gpio pins to suspend/resume */
> -	if (!ts->gpiod_int || !ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_none) {
>  		disable_irq(client->irq);
>  		return 0;
>  	}
> @@ -967,7 +1007,7 @@ static int __maybe_unused goodix_suspend(struct
> device *dev)
>  	goodix_free_irq(ts);
>  
>  	/* Output LOW on the INT pin for 5 ms */
> -	error = gpiod_direction_output(ts->gpiod_int, 0);
> +	error = goodix_irq_direction_output(ts, 0);
>  	if (error) {
>  		goodix_request_irq(ts);
>  		return error;
> @@ -979,7 +1019,7 @@ static int __maybe_unused goodix_suspend(struct
> device *dev)
>  				    GOODIX_CMD_SCREEN_OFF);
>  	if (error) {
>  		dev_err(&ts->client->dev, "Screen off command
> failed\n");
> -		gpiod_direction_input(ts->gpiod_int);
> +		goodix_irq_direction_input(ts);
>  		goodix_request_irq(ts);
>  		return -EAGAIN;
>  	}
> @@ -999,7 +1039,7 @@ static int __maybe_unused goodix_resume(struct
> device *dev)
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  	int error;
>  
> -	if (!ts->gpiod_int || !ts->gpiod_rst) {
> +	if (ts->irq_pin_access_method == irq_pin_access_none) {
>  		enable_irq(client->irq);
>  		return 0;
>  	}
> @@ -1008,7 +1048,7 @@ static int __maybe_unused goodix_resume(struct
> device *dev)
>  	 * Exit sleep mode by outputting HIGH level to INT pin
>  	 * for 2ms~5ms.
>  	 */
> -	error = gpiod_direction_output(ts->gpiod_int, 1);
> +	error = goodix_irq_direction_output(ts, 1);
>  	if (error)
>  		return error;
>  

