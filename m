Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C45F1038C0
	for <lists+linux-input@lfdr.de>; Wed, 20 Nov 2019 12:32:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727880AbfKTLcJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Nov 2019 06:32:09 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36140 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727821AbfKTLcJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Nov 2019 06:32:09 -0500
Received: by mail-wm1-f66.google.com with SMTP id c22so7429459wmd.1
        for <linux-input@vger.kernel.org>; Wed, 20 Nov 2019 03:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flowbird.group; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Kd7NEUJnheTmaqYs2EA0DnTQEVPwxxrAK+7mAwuEhA4=;
        b=L7/mperNHBYUfM3NQpwdvitiyyGAIMXGgCGpYfmkIDu9MFUncpNu2GAb5D1vulsrNa
         jnv/xd3+AK2OOQAWY4H8RCbkIeYKk7RsjwbMcP0fIDc9ox73kwFiOsRwsWTHiUU6n4e1
         bumcT3sRFdaS18hSGkatImDK3Mz6nusTpc5Xv+YtcGVTEQnokWti57nOGVhObjYEfWuB
         scr+PqCvA/zSbUqp88gOX1re7qZNE3qBUOi7QXOJDWAE+3V/Gra6KWtgQC+D1Cjr4Qqc
         Hxfb0/TDI5UEXspIWj8NE1IiHlhgH1eNwMwBw13WDdrIgIL1wAajHqO1imClwzg+WQsi
         sTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Kd7NEUJnheTmaqYs2EA0DnTQEVPwxxrAK+7mAwuEhA4=;
        b=DxZme2taPrUzx+DF074fbgiYCgXm1pJmBul6zVw7t+F7EiPuYoutEzlgRaOqMOuRto
         YY7ryyd6ZWCr3Ebdkvl6CN/3k1vZncEqF4DsDs13NrYt05EqheXChIYs/BJmJiyR3F5P
         mcX/pt4i9+mNI4gWZ+v75jai6NYZ38yQQIqjwxRip/kMwFRllbI0H85EjDKPKUX38Sxc
         UYdh3khf2NHWE7hUAW4Ylu2s2CymekfiCicwiJGxEwfDuK3BA+5M11FbzgyThh6yEMVI
         9baCmtIGfAJExgN86Z54EdAvRCYrV5wH5zfLgRNayxLusWAzdNIYvb4MCSeyU899VCQX
         RyUw==
X-Gm-Message-State: APjAAAVgq2gwRvgz+y4jUAvzKLaMqsDFGeWio0eZ+j4i+oiDOwS96Vdv
        6b143XK9ul+ymSsV/GjhWskFtw==
X-Google-Smtp-Source: APXvYqw9WZtL9kXShc4I0L3RougDxsanXsm/guqBMyvT0D7GMngf7C3EbxE3qUlfwNjVkfZR8F8OYA==
X-Received: by 2002:a1c:650b:: with SMTP id z11mr2584094wmb.149.1574249525940;
        Wed, 20 Nov 2019 03:32:05 -0800 (PST)
Received: from [10.32.50.232] ([185.149.63.251])
        by smtp.gmail.com with ESMTPSA id x7sm35989468wrg.63.2019.11.20.03.32.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Nov 2019 03:32:05 -0800 (PST)
Subject: Re: [PATCHv1 1/2] Input: EXC3000: add EXC80Hxx support
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20191107181010.17211-1-sebastian.reichel@collabora.com>
From:   Martin Fuzzey <martin.fuzzey@flowbird.group>
Message-ID: <4e36a8fb-92e2-943e-f778-cf61e79ebbc4@flowbird.group>
Date:   Wed, 20 Nov 2019 12:32:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191107181010.17211-1-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: fr
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastien,

On 07/11/2019 19:10, Sebastian Reichel wrote:
> This adds support for EXC80Hxx controllers, which uses
> a different event type id and has two extra bits for the
> resolution (so the maximum is 16384 instead of 4096).
>
> The patch has been tested with EXC80H60 and EXC80H84.


Ah I'm doing the same thing :)


> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>   .../bindings/input/touchscreen/exc3000.txt    |  6 ++--
>   drivers/input/touchscreen/exc3000.c           | 34 ++++++++++++++-----
>   2 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> index 68291b94fec2..057b680f0420 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> +++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.txt
> @@ -1,7 +1,9 @@
> -* EETI EXC3000 Multiple Touch Controller
> +* EETI EXC3000 and EXC80Hxx Multiple Touch Controller
>   
>   Required properties:
> -- compatible: must be "eeti,exc3000"
> +- compatible: must be one of
> + * "eeti,exc3000"
> + * "eeti,exc80hxx"
>   - reg: i2c slave address
>   - interrupts: touch controller interrupt
>   - touchscreen-size-x: See touchscreen.txt
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index e007e2e8f626..7d695022082c 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -23,11 +23,20 @@
>   #define EXC3000_SLOTS_PER_FRAME		5
>   #define EXC3000_LEN_FRAME		66
>   #define EXC3000_LEN_POINT		10
> -#define EXC3000_MT_EVENT		6
> +
> +#define EXC3000_MT1_EVENT		0x06
> +#define EXC3000_MT2_EVENT		0x18
> +
>   #define EXC3000_TIMEOUT_MS		100
>   
> +enum exc3000_device_type {
> +	EETI_EXC3000,
> +	EETI_EXC80Hxx
> +};
> +
>   struct exc3000_data {
>   	struct i2c_client *client;
> +	enum exc3000_device_type type;
>   	struct input_dev *input;
>   	struct touchscreen_properties prop;
>   	struct timer_list timer;
> @@ -76,8 +85,10 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
>   	if (ret != EXC3000_LEN_FRAME)
>   		return -EIO;
>   
> -	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
> -			buf[2] != EXC3000_MT_EVENT)
> +	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
> +		return -EINVAL;
> +
> +	if (buf[2] != EXC3000_MT1_EVENT && buf[2] != EXC3000_MT2_EVENT)
>   		return -EINVAL;
>   


Are we sure the EXC80 will *always* use MT2_EVENT (and that there is not 
some configuration where it can send MT1_EVENTS).

Because, if this happens we will have declared a 14 bit resolution to 
the input core but  process a 12 bit value.

I think it is better to declare the resolution based on the device type 
(as you have done) but interpret the data based on the MT1 vs MT2 event 
code, shifting 2 bits if needed.



> @@ -168,8 +180,13 @@ static int exc3000_probe(struct i2c_client *client,
>   	input->name = "EETI EXC3000 Touch Screen";

Shouldn't the name change too?


>   	input->id.bustype = BUS_I2C;
>   
> -	input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
> -	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
> +	if (data->type == EETI_EXC80Hxx) {
> +		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 16383, 0, 0);
> +		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 16383, 0, 0);
> +	} else {
> +		input_set_abs_params(input, ABS_MT_POSITION_X, 0, 4095, 0, 0);
> +		input_set_abs_params(input, ABS_MT_POSITION_Y, 0, 4095, 0, 0);
> +	}
>   	touchscreen_parse_properties(input, true, &data->prop);
>   
>   	error = input_mt_init_slots(input, EXC3000_NUM_SLOTS,
> @@ -191,14 +208,15 @@ static int exc3000_probe(struct i2c_client *client,
>   }
>   
>   static const struct i2c_device_id exc3000_id[] = {
> -	{ "exc3000", 0 },
> -	{ }
> +	{ "exc3000", EETI_EXC3000 },
> +	{ "exc80hxx", EETI_EXC80Hxx }
>   };
>   MODULE_DEVICE_TABLE(i2c, exc3000_id);
>   
>   #ifdef CONFIG_OF
>   static const struct of_device_id exc3000_of_match[] = {
> -	{ .compatible = "eeti,exc3000" },
> +	{ .compatible = "eeti,exc3000", .data = (const void*) EETI_EXC3000 },
> +	{ .compatible = "eeti,exc80hxx", .data = (const void*) EETI_EXC80Hxx },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(of, exc3000_of_match);

If driver_data is defined in the I2C device table and the compatible 
string, minus the vendor prefix, matches the i2c device id it is not 
necessary to define the driver_data in the of_match table as well.


How about defining a "exc_device_info" structure, containing name, 
resolution etc and storing a pointer to a constant instance of that in 
the match tables rather than just a type code.

That way the "if (data->type)" tests could be removed and the info 
structure accessed directly.


Something like:

struct exc_dev_info {
     const char *name;
     u16 x_res;
     u16 y_res;
};

static int exc3000_probe(struct i2c_client *client,
              const struct i2c_device_id *id)
{
     const struct exc_dev_info *dev_info;
...

     dev_info = (const struct exc_dev_info *)id->driver_data;

...

     input->name = dev_info->name;
     input->id.bustype = BUS_I2C;

     input_set_abs_params(input, ABS_MT_POSITION_X, 0,
                  dev_info->x_res - 1, 0, 0);
     input_set_abs_params(input, ABS_MT_POSITION_Y, 0,
                  dev_info->y_res - 1, 0, 0);
     touchscreen_parse_properties(input, true, &data->prop);


static const struct exc_dev_info exc3000_dev_info = {
     .name = "EETI EXC3000 Touch Screen",
     .x_res = 4096,
     .y_res = 4096,
};

static const struct exc_dev_info exc80_dev_info = {
     .name = "EETI EXC80 Touch Screen",
     .x_res = 16384,
     .y_res = 16384,
};

static const struct i2c_device_id exc3000_id[] = {
     { "exc3000",    (kernel_ulong_t)&exc3000_dev_info },
     { "exc80",    (kernel_ulong_t)&exc80_dev_info },
     { }
};
MODULE_DEVICE_TABLE(i2c, exc3000_id);


One other thing I have noticed is that the exc80h does not appear to 
need the i2c_send before read that is done in exc3000_read_frame()

The vendor "egalax_i2c" driver doesn't do it either and I can't see 
anything in the "I2C programming guide" mentionning this.


Ahmet's original commit introducing the driver says

" To be able to work with the higher 400KHz I2C bus rate, one must
   successfully send a special package prior _each_ read or the controller
   will refuse to cooperate."


This doesn't seem to be an issue at 400KHz for the 80h at least, though 
keeping it doesn't seem to hurt either.

Maybe make this device dependant too?


Regards,

Martin


