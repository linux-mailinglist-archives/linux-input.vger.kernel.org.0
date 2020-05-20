Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88B471DBA24
	for <lists+linux-input@lfdr.de>; Wed, 20 May 2020 18:50:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgETQuP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 May 2020 12:50:15 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39390 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbgETQuP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 May 2020 12:50:15 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: eballetbo)
        with ESMTPSA id EE5282A07CC
Subject: Re: [PATCHv3 2/5] Input: EXC3000: switch to i2c's probe_new API
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ahmet Inan <inan@distec.de>,
        Martin Fuzzey <martin.fuzzey@flowbird.group>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20200520153936.46869-1-sebastian.reichel@collabora.com>
 <20200520153936.46869-3-sebastian.reichel@collabora.com>
From:   Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <1d0d7e26-379f-5918-451f-b4445a652272@collabora.com>
Date:   Wed, 20 May 2020 18:50:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520153936.46869-3-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sebastian,

On 20/5/20 17:39, Sebastian Reichel wrote:
> Switch to the "new" I2C probe API.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
>  drivers/input/touchscreen/exc3000.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index e007e2e8f626..555a14305cd4 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -145,8 +145,7 @@ static irqreturn_t exc3000_interrupt(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> -static int exc3000_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int exc3000_probe(struct i2c_client *client)
>  {
>  	struct exc3000_data *data;
>  	struct input_dev *input;
> @@ -210,7 +209,7 @@ static struct i2c_driver exc3000_driver = {
>  		.of_match_table = of_match_ptr(exc3000_of_match),
>  	},
>  	.id_table	= exc3000_id,
> -	.probe		= exc3000_probe,
> +	.probe_new	= exc3000_probe,
>  };
>  
>  module_i2c_driver(exc3000_driver);
> 
