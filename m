Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784BD17594C
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 12:14:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgCBLOw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 06:14:52 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:58743 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgCBLOw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 2 Mar 2020 06:14:52 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 93324C000D;
        Mon,  2 Mar 2020 11:14:49 +0000 (UTC)
Message-ID: <52910cd86eb1e1b0caa54bc72025c7b008b2a2b7.camel@hadess.net>
Subject: Re: [PATCH resend 03/10] Input: goodix - Make resetting the
 controller at probe independent from the GPIO setup
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Dmitry Mastykin <mastichi@gmail.com>
Date:   Mon, 02 Mar 2020 12:14:48 +0100
In-Reply-To: <20200221164735.508324-3-hdegoede@redhat.com>
References: <20200221164735.508324-1-hdegoede@redhat.com>
         <20200221164735.508324-3-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-21 at 17:47 +0100, Hans de Goede wrote:
> Before this commit we would always reset the controller at probe when
> we
> have access to the GPIOs which are necessary to do a reset.
> 
> Doing the reset requires access to the GPIOs, but just because we
> have
> access to the GPIOs does not mean that we should always reset the
> controller at probe. On X86 ACPI platforms the BIOS / UEFI firmware
> will
> already have reset the controller and it will have loaded the device
> specific config into the controller. Doing the reset sometimes causes
> the
> controller to loose its configuration, so on X86 ACPI platforms this 

lose.

> is not
> a good idea.
> 
> This commit adds a new reset_controller_at_probe boolean to control
> the
> reset at probe behavior.
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

Looks good apart from the typo in the commit message

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index eccf07adfae1..dd5a8f9e8ada 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -56,6 +56,7 @@ struct goodix_ts_data {
>  	u16 id;
>  	u16 version;
>  	const char *cfg_name;
> +	bool reset_controller_at_probe;
>  	bool load_cfg_from_disk;
>  	struct completion firmware_loading_complete;
>  	unsigned long irq_flags;
> @@ -656,6 +657,7 @@ static int goodix_get_gpio_config(struct
> goodix_ts_data *ts)
>  	ts->gpiod_rst = gpiod;
>  
>  	if (ts->gpiod_int && ts->gpiod_rst) {
> +		ts->reset_controller_at_probe = true;
>  		ts->load_cfg_from_disk = true;
>  		ts->irq_pin_access_method = irq_pin_access_gpio;
>  	}
> @@ -932,7 +934,7 @@ static int goodix_ts_probe(struct i2c_client
> *client,
>  	if (error)
>  		return error;
>  
> -	if (ts->irq_pin_access_method == irq_pin_access_gpio) {
> +	if (ts->reset_controller_at_probe) {
>  		/* reset the controller */
>  		error = goodix_reset(ts);
>  		if (error) {

