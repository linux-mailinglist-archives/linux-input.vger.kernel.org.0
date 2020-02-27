Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 724B01725A1
	for <lists+linux-input@lfdr.de>; Thu, 27 Feb 2020 18:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729407AbgB0Rud (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Feb 2020 12:50:33 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:60931 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729310AbgB0Rud (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Feb 2020 12:50:33 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 75F97E0006;
        Thu, 27 Feb 2020 17:50:28 +0000 (UTC)
Message-ID: <0a15738e38ef9fa0444d1f224657859deb2ed9d1.camel@hadess.net>
Subject: Re: [PATCH v2 2/3] Input: goodix - use string-based chip ID
From:   Bastien Nocera <hadess@hadess.net>
To:     Icenowy Zheng <icenowy@aosc.io>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ondrej Jirman <megous@megous.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Thu, 27 Feb 2020 18:50:27 +0100
In-Reply-To: <20200227160802.7043-3-icenowy@aosc.io>
References: <20200227160802.7043-1-icenowy@aosc.io>
         <20200227160802.7043-3-icenowy@aosc.io>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.35.91 (3.35.91-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2020-02-28 at 00:08 +0800, Icenowy Zheng wrote:
> For Goodix GT917S chip, the chip ID string is "917S", which contains
> not
> only numbers now.
> 
> Use string-based chip ID in the driver to support this chip and
> further
> chips with alphanumber ID.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Used a table to save ID and chip data info.
> - Use strscpy().
> 
>  drivers/input/touchscreen/goodix.c | 61 +++++++++++++++++-----------
> --
>  1 file changed, 35 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c
> b/drivers/input/touchscreen/goodix.c
> index 0403102e807e..dde85b894ca4 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -37,6 +37,11 @@ struct goodix_chip_data {
>  	int (*check_config)(struct goodix_ts_data *, const struct
> firmware *);
>  };
>  
> +struct goodix_chip_id {
> +	const char *id;
> +	const struct goodix_chip_data *data;
> +};
> +
>  struct goodix_ts_data {
>  	struct i2c_client *client;
>  	struct input_dev *input_dev;
> @@ -48,7 +53,7 @@ struct goodix_ts_data {
>  	struct regulator *vddio;
>  	struct gpio_desc *gpiod_int;
>  	struct gpio_desc *gpiod_rst;
> -	u16 id;
> +	char id[5];

Could you please change this "5" into a constant (#define) to make sure
that...
<snip>
> +	strscpy(ts->id, id_str, 5);

...we copy the same length here. Otherwise you can be certain it's
going to cause problems in the future.

