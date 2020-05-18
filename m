Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C566F1D79BC
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 15:24:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgERNYH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 May 2020 09:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726999AbgERNYH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 May 2020 09:24:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3275C061A0C
        for <linux-input@vger.kernel.org>; Mon, 18 May 2020 06:24:06 -0700 (PDT)
Received: from gallifrey.ext.pengutronix.de ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <l.stach@pengutronix.de>)
        id 1jafkS-0001QZ-6J; Mon, 18 May 2020 15:24:04 +0200
Message-ID: <c0bc260d70b5506da2c4e2dc64176d45e1888a25.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/4] Input: exc3000: split MT event handling from IRQ
 handler
From:   Lucas Stach <l.stach@pengutronix.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     patchwork-lst@pengutronix.de, kernel@pengutronix.de,
        linux-input@vger.kernel.org
Date:   Mon, 18 May 2020 15:24:03 +0200
In-Reply-To: <20200313143345.28565-1-l.stach@pengutronix.de>
References: <20200313143345.28565-1-l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-input@vger.kernel.org
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

any chance you could take a look at this series?

Regards,
Lucas

Am Freitag, den 13.03.2020, 15:33 +0100 schrieb Lucas Stach:
> Split out the multitouch event handling into it's own function to allow other
> events to be handled in the IRQ handler without disturbing the MT handling.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/input/touchscreen/exc3000.c | 92 +++++++++++++++++------------
>  1 file changed, 54 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index e007e2e8f626..3458d02310dd 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -58,6 +58,11 @@ static void exc3000_timer(struct timer_list *t)
>  	input_sync(data->input);
>  }
>  
> +static inline void exc3000_schedule_timer(struct exc3000_data *data)
> +{
> +	mod_timer(&data->timer, jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
> +}
> +
>  static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
>  {
>  	int ret;
> @@ -76,54 +81,35 @@ static int exc3000_read_frame(struct i2c_client *client, u8 *buf)
>  	if (ret != EXC3000_LEN_FRAME)
>  		return -EIO;
>  
> -	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME ||
> -			buf[2] != EXC3000_MT_EVENT)
> +	if (get_unaligned_le16(buf) != EXC3000_LEN_FRAME)
>  		return -EINVAL;
>  
>  	return 0;
>  }
>  
> -static int exc3000_read_data(struct i2c_client *client,
> -			     u8 *buf, int *n_slots)
> +static int exc3000_handle_mt_event(struct exc3000_data *data)
>  {
> -	int error;
> -
> -	error = exc3000_read_frame(client, buf);
> -	if (error)
> -		return error;
> +	struct input_dev *input = data->input;
> +	int ret, total_slots;
> +	u8 *buf = data->buf;
>  
> -	*n_slots = buf[3];
> -	if (!*n_slots || *n_slots > EXC3000_NUM_SLOTS)
> -		return -EINVAL;
> +	total_slots = buf[3];
> +	if (!total_slots || total_slots > EXC3000_NUM_SLOTS) {
> +		ret = -EINVAL;
> +		goto out_fail;
> +	}
>  
> -	if (*n_slots > EXC3000_SLOTS_PER_FRAME) {
> +	if (total_slots > EXC3000_SLOTS_PER_FRAME) {
>  		/* Read 2nd frame to get the rest of the contacts. */
> -		error = exc3000_read_frame(client, buf + EXC3000_LEN_FRAME);
> -		if (error)
> -			return error;
> +		ret = exc3000_read_frame(data->client, buf + EXC3000_LEN_FRAME);
> +		if (ret)
> +			goto out_fail;
>  
>  		/* 2nd chunk must have number of contacts set to 0. */
> -		if (buf[EXC3000_LEN_FRAME + 3] != 0)
> -			return -EINVAL;
> -	}
> -
> -	return 0;
> -}
> -
> -static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> -{
> -	struct exc3000_data *data = dev_id;
> -	struct input_dev *input = data->input;
> -	u8 *buf = data->buf;
> -	int slots, total_slots;
> -	int error;
> -
> -	error = exc3000_read_data(data->client, buf, &total_slots);
> -	if (error) {
> -		/* Schedule a timer to release "stuck" contacts */
> -		mod_timer(&data->timer,
> -			  jiffies + msecs_to_jiffies(EXC3000_TIMEOUT_MS));
> -		goto out;
> +		if (buf[EXC3000_LEN_FRAME + 3] != 0) {
> +			ret = -EINVAL;
> +			goto out_fail;
> +		}
>  	}
>  
>  	/*
> @@ -132,7 +118,7 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  	del_timer_sync(&data->timer);
>  
>  	while (total_slots > 0) {
> -		slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
> +		int slots = min(total_slots, EXC3000_SLOTS_PER_FRAME);
>  		exc3000_report_slots(input, &data->prop, buf + 4, slots);
>  		total_slots -= slots;
>  		buf += EXC3000_LEN_FRAME;
> @@ -141,6 +127,36 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  	input_mt_sync_frame(input);
>  	input_sync(input);
>  
> +	return 0;
> +
> +out_fail:
> +	/* Schedule a timer to release "stuck" contacts */
> +	exc3000_schedule_timer(data);
> +
> +	return ret;
> +}
> +
> +static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
> +{
> +	struct exc3000_data *data = dev_id;
> +	u8 *buf = data->buf;
> +	int ret;
> +
> +	ret = exc3000_read_frame(data->client, buf);
> +	if (ret) {
> +		/* Schedule a timer to release "stuck" contacts */
> +		exc3000_schedule_timer(data);
> +		goto out;
> +	}
> +
> +	switch (buf[2]) {
> +		case EXC3000_MT_EVENT:
> +			exc3000_handle_mt_event(data);
> +			break;
> +		default:
> +			break;
> +	}
> +
>  out:
>  	return IRQ_HANDLED;
>  }

