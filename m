Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AEA31432A8
	for <lists+linux-input@lfdr.de>; Mon, 20 Jan 2020 20:54:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgATTye (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Jan 2020 14:54:34 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:40620 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbgATTye (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Jan 2020 14:54:34 -0500
Received: by mail-pj1-f66.google.com with SMTP id bg7so241223pjb.5
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2020 11:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=71Gmy4dWHwL/lp3j1S99f+7m22+6mCCiYOkFnTLTB90=;
        b=Thq3cBTUqgAj/OYV/is1n9tGQ9OKcfd8wDws0d0S+NAJUhp9SlXroR9evGaF4ArfNY
         cplDNR4jYwZjjSdhWOziyS18fwCY0PPvzY77rPq77ktaJYApdNBcHKSknsYC3BpvzdPa
         OYAgB7uTGPHazOeI0pKK1gsebqJw23D6pkq/4hbS68sZcdgD7Kpz30Z6uyL6kZJd2auS
         6Gg+rN6+zVpsDzufjJvSs1yYQTXWM9Y60Lj3WiT1kHDWy3kjzyRoriHF/R7l7QRyOoWh
         S+lIq84BcZs1r5oNW45fEaFqbbtSgwyeF/NOelmtUeiUHMADcyclgyiWCMUWwpiOObAP
         4Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=71Gmy4dWHwL/lp3j1S99f+7m22+6mCCiYOkFnTLTB90=;
        b=UoNb8dZ3x4ZKYZD/xLdgiUebs3xboBnBzd5eejsDVD7rsZS1prEgI6kysGJXkmAuMF
         MWjSOn8vyIr3G3CLlXFHCMFxGaSBsqRClpavfe5KqlTkq1lUzC+FjykiejskkeFZSW/u
         3xJvCFgzDz3/Npp5NVmclyk5xdGJjM1o+Qa9VBw9e7Xj5IDSNl+c+VyP4vtyx0UnHvsz
         W22SUlHmgMU2gw1qCNzuT87s9F03gqEtBJB31cZQproZ5jhpQJAiYsFKA4V868tfAzlm
         A763PP/VHHMt2g87aYjrzGpEb2BYW+bfWKp49CMT5bA/HkNqcUDfjj1/ZvBwMRxOXiL5
         fTAQ==
X-Gm-Message-State: APjAAAWj8SZUfeW6+BGMyKEt7W+WgiI6fORhJ+Kqo55pcbF6n5ZUcWO+
        yhwzImx1VKiGtoxKpMtZOPk=
X-Google-Smtp-Source: APXvYqxCynaJq4C/ArpF0tpccM535jntpOm+WwtxORGaND6JzRRmyI3nd0PIO3zYFtU4e6P38YdDaQ==
X-Received: by 2002:a17:90a:b78d:: with SMTP id m13mr751935pjr.100.1579550073500;
        Mon, 20 Jan 2020 11:54:33 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id fa21sm282170pjb.17.2020.01.20.11.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2020 11:54:32 -0800 (PST)
Date:   Mon, 20 Jan 2020 11:54:30 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     linux-input@vger.kernel.org, patchwork-lst@pengutronix.de,
        kernel@pengutronix.de, Chris Healy <cphealy@gmail.com>
Subject: Re: [PATCH 4/4] Input: exc3000: add firmware update support
Message-ID: <20200120195430.GK47797@dtor-ws>
References: <20200107171741.10856-1-l.stach@pengutronix.de>
 <20200107171741.10856-4-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107171741.10856-4-l.stach@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 07, 2020 at 06:17:40PM +0100, Lucas Stach wrote:
> This change allows the device firmware to be updated by putting a firmware
> file in /lib/firmware and providing the name of the file via the update_fw
> sysfs property. The driver will then flash the firmware image into the
> controller internal storage and restart the controller to activate the new
> firmware.
> 
> The implementation was done by looking at the the messages passed between
> the controller and proprietary vendor update tool. Not every detail of the
> protocol is totally well understood, so the implementation still has some
> "monkey see, monkey do" parts, as far as they have been found to be required
> for the update to succeed.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  drivers/input/touchscreen/exc3000.c | 248 +++++++++++++++++++++++++++-
>  1 file changed, 246 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/exc3000.c b/drivers/input/touchscreen/exc3000.c
> index ce83914d65ff..f9a9820dc232 100644
> --- a/drivers/input/touchscreen/exc3000.c
> +++ b/drivers/input/touchscreen/exc3000.c
> @@ -3,8 +3,8 @@
>   * Driver for I2C connected EETI EXC3000 multiple touch controller
>   *
>   * Copyright (C) 2017 Ahmet Inan <inan@distec.de>
> - *
> - * minimal implementation based on egalax_ts.c and egalax_i2c.c
> + * Copyright (C) 2019 Pengutronix <kernel@pengutronix.de>
> + * Copyright (C) 2019 Zodiac Inflight Innovations
>   */
>  
>  #include <linux/bitops.h>
> @@ -18,6 +18,8 @@
>  #include <linux/of.h>
>  #include <linux/timer.h>
>  #include <asm/unaligned.h>
> +#include <linux/firmware.h>
> +#include <linux/delay.h>
>  
>  #define EXC3000_NUM_SLOTS		10
>  #define EXC3000_SLOTS_PER_FRAME		5
> @@ -37,6 +39,7 @@ struct exc3000_data {
>  	struct mutex vendor_data_lock;
>  	struct completion vendor_data_done;
>  	char *type, *model, *fw_rev;
> +	int update_status;
>  };
>  
>  static void exc3000_report_slots(struct input_dev *input,
> @@ -215,6 +218,8 @@ static int exc3000_populate_device_info(struct exc3000_data *data)
>  	if (ret < 0)
>  		return -ENODEV;
>  
> +	if (data->type)
> +		devm_kfree(dev, data->type);
>  	data->type = devm_kmemdup(dev, &response[1], ret - 1, GFP_KERNEL);

This makes me uncomfortable, as this changes the release order of the
resources (newly re-allocated memory will be freed first). Please
reassure me that it will work fine WRT device removal (or,
alternatively, we will need devm_realloc() that would preserve devm
release ordering.

Thanks.

-- 
Dmitry
