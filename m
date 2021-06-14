Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114E73A5E8E
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 10:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232658AbhFNIvD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 04:51:03 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42541 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhFNIvC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 04:51:02 -0400
Received: (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 190381C0002;
        Mon, 14 Jun 2021 08:48:57 +0000 (UTC)
Message-ID: <d9b4730933288604a9df64186b64be14af04e170.camel@hadess.net>
Subject: Re: [PATCH 3/3] Input: goodix - add a settings module-parameter
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Gregor Riepl <onitake@gmail.com>, linux-input@vger.kernel.org
Date:   Mon, 14 Jun 2021 10:48:57 +0200
In-Reply-To: <20210613102158.16886-4-hdegoede@redhat.com>
References: <20210613102158.16886-1-hdegoede@redhat.com>
         <20210613102158.16886-4-hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 2021-06-13 at 12:21 +0200, Hans de Goede wrote:
> Add a settings module-parameter which can be allowed to
> specify/override
> various device-properties.
> 
> Usuually Goodix touchscreens on x86 devices (where there is no
> devicetree
> to specify the properties) just work. But in some cases the
> touchscreen is
> mounted 90 or 180 degrees rotated vs the display, requiring setting
> the
> touchscreen-x/y-inverted or touchscreen-swapped-x-y properties.
> 
> Being able to specify the necessary properties through a module
> parameter,
> allows users of new device-models to help us with bringing up support
> for
> new devices without them needing to do a local kernel-build just to
> modify
> these settings.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Bastien Nocera <hadess@hadess.net>

> ---
>  drivers/input/touchscreen/goodix.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 2efb82977115..1bc94c5597ca 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -52,6 +52,10 @@
>  #define ACPI_GPIO_SUPPORT
>  #endif
>  
> +static char *settings;
> +module_param(settings, charp, 0444);
> +MODULE_PARM_DESC(settings, "Override touchscreen settings using a ;
> separated key=value list, e.g. \"touchscreen-fuzz-x=5;touchscreen-
> fuzz-y=5;touchscreen-swapped-x-y\"");
> +
>  struct goodix_chip_id {
>         const char *id;
>         const struct goodix_chip_data *data;
> @@ -1026,7 +1030,7 @@ static int goodix_configure_dev(struct
> goodix_ts_data *ts)
>         goodix_read_config(ts);
>  
>         /* Try overriding touchscreen parameters via device
> properties */
> -       touchscreen_parse_properties(ts->input_dev, true, &ts->prop,
> NULL);
> +       touchscreen_parse_properties(ts->input_dev, true, &ts->prop,
> settings);
>  
>         if (!ts->prop.max_x || !ts->prop.max_y || !ts->max_touch_num)
> {
>                 dev_err(&ts->client->dev,


