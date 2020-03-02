Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CFC991759A4
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726915AbgCBLff (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:35:35 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34235 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgCBLff (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:35:35 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E0789C0009;
        Mon,  2 Mar 2020 11:35:31 +0000 (UTC)
Message-ID: <30842bb43aa29e8f1edeadc335e3f792a7a76092.camel@hadess.net>
Subject: Re: [PATCH resend 10/10] Input: goodix - Restore config on resume
 if necessary
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:35:31 +0100
In-Reply-To: <20200221164735.508324-10-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-10-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Some devices, e.g the Trekstor Primetab S11B, loose there config over

"lose".

> a suspend/resume cycle (likely the controller looses power during 

"loses".

> suspend).
> 
> This commit reads back the config version on resume and if matches
> the
> expected config version it resets the controller and resends the
> config
> we read back and saved at probe time.
> 
> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1786317
> BugLink: https://github.com/nexus511/gpd-ubuntu-packages/issues/10
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=199207
> Cc: Dmitry Mastykin <mastichi@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Looks fine apart from the nitpicks.

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 0f39c499e3a9..389d3e044f97 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -1232,6 +1232,7 @@ static int __maybe_unused goodix_resume(struct
> device *dev)
>  {
>  	struct i2c_client *client = to_i2c_client(dev);
>  	struct goodix_ts_data *ts = i2c_get_clientdata(client);
> +	u8 config_ver;
>  	int error;
>  
>  	if (ts->irq_pin_access_method == irq_pin_access_none) {
> @@ -1253,6 +1254,27 @@ static int __maybe_unused goodix_resume(struct
> device *dev)
>  	if (error)
>  		return error;
>  
> +	error = goodix_i2c_read(ts->client, ts->chip->config_addr,
> +				&config_ver, 1);
> +	if (error)
> +		dev_warn(dev, "Error reading config version: %d,
> resetting controller\n",
> +			 error);
> +	else if (config_ver != ts->config[0])
> +		dev_warn(dev, "Config version mismatch %d != %d,
> resetting controller\n",
> +			 config_ver, ts->config[0]);

Should it really be a warning if it happens regularly?

> +
> +	if (error != 0 || config_ver != ts->config[0]) {
> +		error = goodix_reset(ts);
> +		if (error) {
> +			dev_err(dev, "Controller reset failed.\n");
> +			return error;
> +		}
> +
> +		error = goodix_send_cfg(ts, ts->config, ts->chip-
> >config_len);
> +		if (error)
> +			return error;
> +	}
> +
>  	error = goodix_request_irq(ts);
>  	if (error)
>  		return error;

