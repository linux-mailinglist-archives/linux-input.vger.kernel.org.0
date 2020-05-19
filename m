Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ADC31DA325
	for <lists+linux-input@lfdr.de>; Tue, 19 May 2020 22:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgESU5z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 May 2020 16:57:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57452 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgESU5y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 May 2020 16:57:54 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id 190932A00E6
Subject: Re: [PATCHv2 5/5] Input: EXC3000: Add reset gpio support
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20200519182447.73405-1-sebastian.reichel@collabora.com>
 <20200519182447.73405-6-sebastian.reichel@collabora.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <80ff22aa-dd46-c035-a333-eca5dc7e6c2f@collabora.com>
Date:   Tue, 19 May 2020 22:57:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200519182447.73405-6-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

Again a minor thing

On 19/5/20 20:24, Sebastian Reichel wrote:
> Add basic support for an optional reset gpio.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/input/touchscreen/exc3000.yaml   |  2 ++
>  drivers/input/touchscreen/exc3000.c           | 29 +++++++++++++++----
>  2 files changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
> index d83b61e884df..8b70b918c7ca 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/exc3000.yaml
> @@ -22,6 +22,8 @@ properties:
>      const: 0x2a
>    interrupts:
>      maxItems: 1
> +  reset-gpios:
> +    maxItems: 1
>    touchscreen-size-x: true
>    touchscreen-size-y: true
>    touchscreen-inverted-x: true
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index 1ae758bbf627..9fed66ef1719 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -8,7 +8,9 @@
>   */
>  
>  #include <linux/bitops.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/input.h>
>  #include <linux/input/mt.h>
> @@ -32,6 +34,9 @@
>  
>  #define EXC3000_TIMEOUT_MS		100
>  
> +#define EXC3000_RESET_MS		10
> +#define EXC3000_READY_MS		100
> +
>  static const struct i2c_device_id exc3000_id[];
>  
>  struct eeti_dev_info {
> @@ -65,6 +70,7 @@ struct exc3000_data {
>  	const struct eeti_dev_info *info;
>  	struct input_dev *input;
>  	struct touchscreen_properties prop;
> +	struct gpio_desc *reset;
>  	struct timer_list timer;
>  	u8 buf[2 * EXC3000_LEN_FRAME];
>  	struct completion wait_event;
> @@ -305,16 +311,17 @@ static const struct attribute_group *exc3000_attribute_groups[] = {
>  
>  static int exc3000_probe(struct i2c_client *client)
>  {
> +	struct device *dev = &client->dev;

This introduces more changes to the patch than the required. Is not that I am
against of this change but since what you are doing here is introduce an
optional reset I think would be better just introduce that change.

>  	struct exc3000_data *data;
>  	struct input_dev *input;
>  	int error, max_xy, retry;
>  
> -	data = devm_kzalloc(&client->dev, sizeof(*data), GFP_KERNEL);
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
>  
>  	data->client = client;
> -	data->info = device_get_match_data(&client->dev);
> +	data->info = device_get_match_data(dev);
>  	if (!data->info) {
>  		enum eeti_dev_id eeti_dev_id =
>  			i2c_match_id(exc3000_id, client)->driver_data;
> @@ -324,7 +331,17 @@ static int exc3000_probe(struct i2c_client *client)
>  	init_completion(&data->wait_event);
>  	mutex_init(&data->query_lock);
>  
> -	input = devm_input_allocate_device(&client->dev);
> +	data->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);

nit: Just use &client->dev here ?

> +	if (IS_ERR(data->reset))
> +		return PTR_ERR(data->reset);
> +
> +	if (data->reset) {
> +		msleep(EXC3000_RESET_MS);
> +		gpiod_set_value_cansleep(data->reset, 0);
> +		msleep(EXC3000_READY_MS);
> +	}
> +
> +	input = devm_input_allocate_device(dev);
>  	if (!input)
>  		return -ENOMEM;
>  
> @@ -350,7 +367,7 @@ static int exc3000_probe(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> -	error = devm_request_threaded_irq(&client->dev, client->irq,
> +	error = devm_request_threaded_irq(dev, client->irq,
>  					  NULL, exc3000_interrupt, IRQF_ONESHOT,
>  					  client->name, data);
>  	if (error)
> @@ -360,14 +377,14 @@ static int exc3000_probe(struct i2c_client *client)
>  		error = exc3000_get_model(data);
>  		if (!error)
>  			break;
> -		dev_warn(&client->dev, "Retry %d get EETI EXC3000 model: %d\n",
> +		dev_warn(dev, "Retry %d get EETI EXC3000 model: %d\n",
>  			 retry + 1, error);
>  	}
>  
>  	if (error)
>  		return error;
>  
> -	dev_dbg(&client->dev, "TS Model: %s", data->model);
> +	dev_dbg(dev, "TS Model: %s", data->model);
>  
>  	return 0;
>  }
> 
