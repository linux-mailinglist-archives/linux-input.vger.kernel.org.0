Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA16B1432A3
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2020 20:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgATTts (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 14:49:48 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42639 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbgATTtr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 14:49:47 -0500
Received: by mail-pg1-f193.google.com with SMTP id s64so173163pgb.9
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2020 11:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p2qHt5HmHYG4XGnadQMe8R9gUYdGy3TwxRKGun/HSsw=;
        b=LhikxGUnQvbUXRxXlNJiQEy+MY6ELoH5KyELP6I2/4LIlaqn5gN83S1y54XLZi2GDO
         /g89LLrXVRI2DdX+ZI9yXQy0zhl7l3ox59zyqel5Qq02dqIFF6yOfbYn+sxPiZQ7ovYq
         zdY2ywrEWtB1Kin0qQG5yYhn38cqUVVF/YFlNBt1LmiY9ZQBhebTcVGJw/Am8Y79mZKx
         rmDbERtN9OdLKoMQXlWZGY1XcqpSwD5jn4FVeIN65F/LQcCYe2FjFXu5MfQF+84U4RY2
         Ey/8hX1Pr8upN0G+om7bYVqLWnqVsg4TTNLlgDrEfeJ6C3VLiLmQrFwYRsyAU0AvPb0z
         zl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p2qHt5HmHYG4XGnadQMe8R9gUYdGy3TwxRKGun/HSsw=;
        b=FsHVU5Lao+YrW/WWA5+d2ucohTsgKUByavDxhreVpaJ9XhPXX/bZapya80hhUB+4LY
         aHHfcZOnDv1yUv4QgvE8+1QOU1WmltIYJh+KFK5Tk2wQvoYux98w3dXGgjid+SCJBXqj
         s1fGUteTsWs3T4NisUAs6y4V0wMMIhqskVsb2c62J+vl7uWFOuevynYEaDUvIVJNiCHn
         BZ98NgEXH2QVY3Ly4CWWjLNIx9SEEGRXWD/m/aNBZ1bJ2mucUVek7Ha2hFenM9/lZsdv
         o6lRLbnQQC5KGuoLdpE95xVFhLF1L/7m7NkNbAMpx2S/cuFYaENDPz5TQ8bjDKyYYIBo
         LeZg==
X-Gm-Message-State: APjAAAWAiKSn91zTOOPeYTNVtNDZwnhrpPlYDrpATo5YTWhSqBxxKUDv
        u207Cqyrh4ItyTgptWYzDuk=
X-Google-Smtp-Source: APXvYqzUdLdxT+qHsfdlmHreaVRiF3B3JFleObDLfMoT91WeUhATyn/f4bXnAZGXh1zclIOEESQu9w==
X-Received: by 2002:a62:ed19:: with SMTP id u25mr756489pfh.173.1579549786968;
        Mon, 20 Jan 2020 11:49:46 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y7sm41292409pfb.139.2020.01.20.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 11:49:46 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:49:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH 2/4] Input: exc3000: query and show type, model and
 firmware revision info
Message-ID: <20200120194944.GI47797@dtor-ws>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
 <20200107171741.10856-2-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107171741.10856-2-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Lucas,

On Tue, Jan 07, 2020 at 06:17:38PM +0100, Lucas Stach wrote:
> It's very useful to have this information in the log, as differences in
> behavior can be tied to the controller firmware.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/input/touchscreen/exc3000.c | 116 ++++++++++++++++++++++++++--
>  1 file changed, 110 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index 3458d02310dd..accee4fd1b97 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -22,7 +22,9 @@
>  #define EXC3000_NUM_SLOTS		10
>  #define EXC3000_SLOTS_PER_FRAME		5
>  #define EXC3000_LEN_FRAME		66
> +#define EXC3000_LEN_VENDOR_REQUEST	68
>  #define EXC3000_LEN_POINT		10
> +#define EXC3000_VENDOR_EVENT		3
>  #define EXC3000_MT_EVENT		6
>  #define EXC3000_TIMEOUT_MS		100
>  
> @@ -32,6 +34,9 @@ struct exc3000_data {
>  	struct touchscreen_properties prop;
>  	struct timer_list timer;
>  	u8 buf[2 * EXC3000_LEN_FRAME];
> +	struct mutex vendor_data_lock;
> +	struct completion vendor_data_done;
> +	char *type, *model, *fw_rev;
>  };
>  
>  static void exc3000_report_slots(struct input_dev *input,
> @@ -136,6 +141,13 @@ static int exc3000_handle_mt_event(struct exc3000_data *data)
>  	return ret;
>  }
>  
> +static int exc3000_handle_vendor_event(struct exc3000_data *data)
> +{
> +	complete(&data->vendor_data_done);
> +
> +	return 0;
> +}
> +
>  static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  {
>  	struct exc3000_data *data = dev_id;
> @@ -153,6 +165,9 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  		case EXC3000_MT_EVENT:
>  			exc3000_handle_mt_event(data);
>  			break;
> +		case EXC3000_VENDOR_EVENT:
> +			exc3000_handle_vendor_event(data);
> +			break;
>  		default:
>  			break;
>  	}
> @@ -161,6 +176,89 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int exc3000_vendor_data_request(struct exc3000_data *data, u8 *request,
> +				       u8 request_len, u8 *response)
> +{
> +	u8 buf[EXC3000_LEN_VENDOR_REQUEST] = { 0x67, 0x00, 0x42, 0x00, 0x03 };
> +	int ret;
> +
> +	mutex_lock(&data->vendor_data_lock);
> +
> +	reinit_completion(&data->vendor_data_done);
> +
> +	buf[5] = request_len;
> +	memcpy(&buf[6], request, request_len);
> +
> +	ret = i2c_master_send(data->client, buf, EXC3000_LEN_VENDOR_REQUEST);
> +	if (ret < 0)
> +		goto out_unlock;
> +
> +	if (response) {
> +		wait_for_completion(&data->vendor_data_done);

You want some kind of timeout here to avoid hanging forever if device
does not respond properly.

> +		memcpy(response, &data->buf[4], data->buf[3]);
> +		ret = data->buf[3];
> +	}
> +
> +out_unlock:
> +	mutex_unlock(&data->vendor_data_lock);
> +
> +	return ret;
> +}
> +static int exc3000_populate_device_info(struct exc3000_data *data)
> +{
> +	struct device *dev = &data->client->dev;
> +	u8 response[EXC3000_LEN_FRAME];
> +	int ret;
> +
> +	/* query type info */
> +	ret = exc3000_vendor_data_request(data, (u8[]){0x46}, 1, response);
> +	if (ret < 0)
> +		return -ENODEV;
> +
> +	data->type = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
> +
> +	/* query model info */
> +	ret = exc3000_vendor_data_request(data, (u8[]){0x45}, 1, response);
> +	if (ret < 0)
> +		return -ENODEV;
> +
> +	data->model = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);
> +
> +	/* query bootloader info */
> +	ret = exc3000_vendor_data_request(data,
> +					  (u8[]){0x39, 0x02}, 2, response);
> +	if (ret < 0)
> +		return -ENODEV;
> +
> +	/*
> +	 * If the bootloader version is non-zero then the device is in
> +	 * bootloader mode and won't answer a query for the application FW
> +	 * version, so we just use the bootloader version info.
> +	 */
> +	if (response[2] || response[3]) {
> +		char bl_version[8];
> +
> +		snprintf(bl_version, 8, "%d.%d", response[2], response[3]);
> +		data->fw_rev = devm_kmemdup(dev, bl_version,
> +					    strlen(bl_version), GFP_KERNEL);

Error handing?

> +	} else {
> +		/* query application firmware version */
> +		ret = exc3000_vendor_data_request(data,
> +						  (u8[]){0x44}, 1, response);
> +		if (ret < 0)
> +			return -ENODEV;
> +
> +		data->fw_rev = devm_kmemdup(dev, &response[1],
> +					    ret - 1, GFP_KERNEL);

Error handling?

> +	}
> +
> +	dev_info(&data->client->dev,
> +		 "found type %s, model %s, firmware revision %s",
> +		 data->type, data->model, data->fw_rev);

dev_dbg()

> +
> +	return 0;
> +}
> +
>  static int exc3000_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> @@ -174,6 +272,18 @@ static int exc3000_probe(struct i2c_client *client,
>  
>  	data->client = client;
>  	timer_setup(&data->timer, exc3000_timer, 0);
> +	mutex_init(&data->vendor_data_lock);
> +	init_completion(&data->vendor_data_done);
> +
> +	error = devm_request_threaded_irq(&client->dev, client->irq,
> +					  NULL, exc3000_interrupt, IRQF_ONESHOT,
> +					  client->name, data);
> +	if (error)
> +		return error;

Since you moved it to be earlier than input device allocation I think it
will bomb if you boot when your finger touches the screen as it will try
to dereference NULL pointer.

It is usually OK to send events through allocated
but not yet registered input device, but I'd double-checked that
touchscreen_report_pos() API is also safe, and then moved input device
allocation to happen before you request interrupt.

> +
> +	error = exc3000_populate_device_info(data);
> +	if (error)
> +		return error;
>  
>  	input = devm_input_allocate_device(&client->dev);
>  	if (!input)
> @@ -197,12 +307,6 @@ static int exc3000_probe(struct i2c_client *client,
>  	if (error)
>  		return error;
>  
> -	error = devm_request_threaded_irq(&client->dev, client->irq,
> -					  NULL, exc3000_interrupt, IRQF_ONESHOT,
> -					  client->name, data);
> -	if (error)
> -		return error;
> -
>  	return 0;
>  }
>  
> -- 
> 2.20.1
> 

Thanks.

-- 
Dmitry
