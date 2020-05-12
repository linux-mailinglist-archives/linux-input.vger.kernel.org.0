Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1282E1CEAE0
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 04:36:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbgELCfv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 22:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgELCfu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 22:35:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79A79C061A0C;
        Mon, 11 May 2020 19:35:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id z15so55086pjb.0;
        Mon, 11 May 2020 19:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Mq5BCcNHz+4JpATzAlkQBtpRpfK9pvQTMzyI2YGjOaA=;
        b=pNMra6vHSZ3ml0v4a7bJEjiG0CkFRgYUd5A0sg6pMDxjfnB1Lha0ACr1nQxHnFyWxS
         D+avMOOecgH71cyXQH36ip/J4G3GFcXuOi1V3wVYKUlMmUeA97xQ3+iZXStq4lbSiBf1
         lgd4qJWuAv7wsDA1kwoXQjXxiTF42oLNqsBEfiXUiOvAHrTlYAFui/pamVZEowPQlVMb
         T4q2kOPUwdDtu9V906clW+evHh75ELvXSlypxf53+1LqoMZ1E91XICPgi9FkeA1jt1JD
         vg7Wfa74Y3KtK6InYkKGNzc3zRz2s2yUFwErH5Nf7uQwHztCdPzFwC22jwg1Rb9rH33P
         6Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Mq5BCcNHz+4JpATzAlkQBtpRpfK9pvQTMzyI2YGjOaA=;
        b=UvZOwgBCsDV/LZu/joiBTYzY/JlZOnOKV4u1gBnklrFPAMSPWDTbXy7Y8dKHwYFJih
         b9FS2HL4xk0D/+cNUGoCd9zSalEkjAh3AflYLY6Cc6PjqYBxlrXlH8UfQ4PyF3IOVmmE
         2HeUtJ2wD6xxlOXRaggfs5tk2WVZdCpal/nVGLmMigOYbF4oZGyEEgN3Y/Vjw2i4dLAy
         RiIl43TTa0zih3SgeZ6i6iCQmcwF6WyJyA2Pp0+uLUwchO9Za72CJqGOUZOK5+Zs43a4
         Yg3nu/SRwpSem1Ca8OZDMNXJNeRXH5UAJo8Ro/xauCE8Zoz8ZOg9iguVRZvz3Yz/Ddfa
         lk+Q==
X-Gm-Message-State: AGi0PuY2oE+33AJGEfn61rA5UblVAy42Ed+cTgiCx8tVhPab7GhHqCP6
        ZG6zXVf86xcUdCehirAtNQ4=
X-Google-Smtp-Source: APiQypKJx9AqUdmeWVXWsVcrK8qmz2rx+mYY5lPTPdXRLvySTDrT6CwPMNe+LpUqY7dXyIHmWoms6w==
X-Received: by 2002:a17:902:8a8d:: with SMTP id p13mr17655891plo.32.1589250949315;
        Mon, 11 May 2020 19:35:49 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id nu10sm12132633pjb.9.2020.05.11.19.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 19:35:48 -0700 (PDT)
Date:   Mon, 11 May 2020 19:35:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jiada Wang <jiada_wang@mentor.com>
Cc:     nick@shmanahar.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, bsz@semihalf.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        erosca@de.adit-jv.com, Andrew_Gabbasov@mentor.com
Subject: Re: [PATCH v11 08/56] Input: atmel_mxt_ts - implement T15 Key Array
 support
Message-ID: <20200512023546.GB89269@dtor-ws>
References: <20200508055656.96389-1-jiada_wang@mentor.com>
 <20200508055656.96389-9-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508055656.96389-9-jiada_wang@mentor.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 07, 2020 at 10:56:08PM -0700, Jiada Wang wrote:
> From: Nick Dyer <nick.dyer@itdev.co.uk>
> 
> There is a key array object in many maXTouch chips which allows some X/Y
> lines to be used as a key array. This patch maps them to a series of keys
> which may be configured in a platform data array.
> 
> Signed-off-by: Nick Dyer <nick.dyer@itdev.co.uk>
> Acked-by: Benson Leung <bleung@chromium.org>
> Acked-by: Yufeng Shen <miletus@chromium.org>
> (cherry picked from ndyer/linux/for-upstream commit 15bb074b5abf3a101f7b79544213f1c110ea4cab)
> [gdavis: Resolve forward port conflicts due to applying upstream
> 	 commit 96a938aa214e ("Input: atmel_mxt_ts - remove platform
> 	 data support").]
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> [jiada: Fix compilation warning]
> Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
> ---
>  drivers/input/touchscreen/atmel_mxt_ts.c | 85 ++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index df2e0ba76e63..d05249b02781 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -314,6 +314,9 @@ struct mxt_data {
>  	struct mxt_dbg dbg;
>  	struct gpio_desc *reset_gpio;
>  	bool use_retrigen_workaround;
> +	unsigned long t15_keystatus;
> +	int t15_num_keys;
> +	const unsigned int *t15_keymap;
>  
>  	/* Cached parameters from object table */
>  	u16 T5_address;
> @@ -324,6 +327,8 @@ struct mxt_data {
>  	u16 T71_address;
>  	u8 T9_reportid_min;
>  	u8 T9_reportid_max;
> +	u8 T15_reportid_min;
> +	u8 T15_reportid_max;
>  	u16 T18_address;
>  	u8 T19_reportid;
>  	u8 T42_reportid_min;
> @@ -987,6 +992,38 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
>  	data->update_input = true;
>  }
>  
> +static void mxt_proc_t15_messages(struct mxt_data *data, u8 *msg)
> +{
> +	struct input_dev *input_dev = data->input_dev;
> +	struct device *dev = &data->client->dev;
> +	int key;
> +	bool curr_state, new_state;
> +	bool sync = false;
> +	unsigned long keystates = le32_to_cpu((__force __le32)msg[2]);

?

It is a byte. Just say

	unsigned long keystates = msg[2];

> +
> +	for (key = 0; key < data->t15_num_keys; key++) {
> +		curr_state = test_bit(key, &data->t15_keystatus);
> +		new_state = test_bit(key, &keystates);
> +
> +		if (!curr_state && new_state) {
> +			dev_dbg(dev, "T15 key press: %u\n", key);
> +			__set_bit(key, &data->t15_keystatus);
> +			input_event(input_dev, EV_KEY,
> +				    data->t15_keymap[key], 1);
> +			sync = true;
> +		} else if (curr_state && !new_state) {
> +			dev_dbg(dev, "T15 key release: %u\n", key);
> +			__clear_bit(key, &data->t15_keystatus);
> +			input_event(input_dev, EV_KEY,
> +				    data->t15_keymap[key], 0);
> +			sync = true;
> +		}
> +	}
> +
> +	if (sync)
> +		input_sync(input_dev);

I wonder if the following is not simpler:

	unsigned long changed_keys;
	...

	changed_keys = keystates ^ data->t15_keystatus;
	for_each_set_bit(key, &changed_keys, data->t15_num_keys) {
		pressed = test_bit(key, &keystates);
		input_event(input_dev, EV_KEY,
			    data->t15_keymap[key], pressed);
		dev_dbg(dev, "T15 key %s: %u\n",
			pressed ? "press" : "release", key);
	}

	if (changed_keys)
		input_sync(input_dev);

	 data->t15_keystatus = keystates;

...

> +	if (device_property_present(dev, buttons_property)) {
> +		n_keys = device_property_read_u32_array(dev, buttons_property,
> +							NULL, 0);
> +		if (n_keys <= 0) {
> +			error = n_keys < 0 ? n_keys : -EINVAL;
> +			dev_err(dev, "invalid/malformed '%s' property: %d\n",
> +				buttons_property, error);
> +			return error;
> +		}
> +
> +		buttonmap = devm_kmalloc_array(dev, n_keys, sizeof(*buttonmap),
> +					       GFP_KERNEL);
> +		if (!buttonmap)
> +			return -ENOMEM;

So it is 8 keys max, I'd simply embed this into data. On 64 bit arch it
will occupy the same space as the pointer you use to reference it.

Can you also validate that we do not get too many keys in DT?

Also, set keycode/keycodemax/keycodesize in input device so userspace
can adjust keymap if needed?

Thanks.

-- 
Dmitry
