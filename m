Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F94C137A93
	for <lists+linux-input@lfdr.de>; Sat, 11 Jan 2020 01:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbgAKA04 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Jan 2020 19:26:56 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33332 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbgAKA04 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Jan 2020 19:26:56 -0500
Received: by mail-pf1-f194.google.com with SMTP id z16so1930711pfk.0;
        Fri, 10 Jan 2020 16:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A71y9VQlReJTssS0IAmq8UbP15UPKQsywks0ru8PC8E=;
        b=PY0lhVhZ9ohJAD/bvWZ4lGHaXTozVoJpxIVRBm0ow69bH4fdjbnfJm/FWHLwUSGQ+9
         83MVLOZ7C0QC8eDZYlDDN1Hvt8+/4n7TpWjlPEGwEEOnQj+z45m+R1XmAjk5lCYq52bA
         eDDqFLiC+EjF9G5weRZvNdK+hX7P7zjr+d9iLNI1cz23AMBDWqkAeUovzeTmqho+4VNl
         r/qCGdBLkC0RszWPmrJzMmHx7joWbKENHG//yRr3wZkqDHW1bCz87p4qOhtFZso5R+Qv
         35DPcGhlka3NRkuEyrA3TL1KjWcitLUSNs3BLamyXraTdLRrCFnIbvsXM6tONQ6Z7ah7
         zKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A71y9VQlReJTssS0IAmq8UbP15UPKQsywks0ru8PC8E=;
        b=aQ2WrQUgQca13CLjWzoBNDD0yRqPESZwOzhJ5lxWmLsyp0Hay9htxFAHZ+Jlf52nMo
         Xm0iYEFFentaDGZ67oKMwBkD/JyILYwyBicHzd1odQSUCNII5FmRSip0QyRUe7Cxmu8H
         blNOgUtcxhcvj1EnmmZjgQT5qOkH7Q+WyXBax08nGXoeAWfOpIch/HJayaLkaqBcY/AX
         L7N+ouct0OWQ3k6qUYwsD6gjDB/OkwxW1glRT0UQACTs9scFEL/lka2caBNXeT8YbZzj
         GGIoo2XDxbWtyEV5Cdui4Ms/C78lCM4bz3/YsmSbwcc1ANTQocV8OGUWVLAQjCawwT6F
         TrRg==
X-Gm-Message-State: APjAAAVNj8tHKVlxbCsdqUdNe1jlLeL5JBaoD8BNLarM3w+pSLIKQA/E
        Bx/m+Q+80GJoThv/MJbxMou8uvo6
X-Google-Smtp-Source: APXvYqyEjXiIU05eTkj8I71b9d6q+aHmeG8FtJRBYvS05lMvw0tO+mUUe9dRGlHz/HAQFQwiBdHeRQ==
X-Received: by 2002:a63:4702:: with SMTP id u2mr7689186pga.125.1578702415435;
        Fri, 10 Jan 2020 16:26:55 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x21sm4285178pfn.164.2020.01.10.16.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2020 16:26:54 -0800 (PST)
Date:   Fri, 10 Jan 2020 16:26:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bastien Nocera <hadess@hadess.net>,
        Jagan Teki <jagan@amarulasolutions.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: goodix - use string-based chip ID
Message-ID: <20200111002652.GX8314@dtor-ws>
References: <20200110162608.1066397-1-icenowy@aosc.io>
 <20200110162608.1066397-3-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110162608.1066397-3-icenowy@aosc.io>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Jan 11, 2020 at 12:26:07AM +0800, Icenowy Zheng wrote:
> For Goodix GT917S chip, the chip ID string is "917S", which contains not
> only numbers now.
> 
> Use string-based chip ID in the driver to support this chip and further
> chips with alphanumber ID.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/input/touchscreen/goodix.c | 39 ++++++++++++++----------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 0403102e807e..bfd067d7145e 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -48,7 +48,7 @@ struct goodix_ts_data {
>  	struct regulator *vddio;
>  	struct gpio_desc *gpiod_int;
>  	struct gpio_desc *gpiod_rst;
> -	u16 id;
> +	char id[5];
>  	u16 version;
>  	const char *cfg_name;
>  	struct completion firmware_loading_complete;
> @@ -235,28 +235,25 @@ static int goodix_i2c_write_u8(struct i2c_client *client, u16 reg, u8 value)
>  	return goodix_i2c_write(client, reg, &value, sizeof(value));
>  }
>  
> -static const struct goodix_chip_data *goodix_get_chip_data(u16 id)
> +static const struct goodix_chip_data *goodix_get_chip_data(const char *id)
>  {
> -	switch (id) {
> -	case 1151:
> -	case 5663:
> -	case 5688:
> +	if (!strcmp(id, "1151") ||
> +	    !strcmp(id, "5663") ||
> +	    !strcmp(id, "5688"))
>  		return &gt1x_chip_data;
>  
> -	case 911:
> -	case 9271:
> -	case 9110:
> -	case 927:
> -	case 928:
> +	if (!strcmp(id, "911") ||
> +	    !strcmp(id, "9271") ||
> +	    !strcmp(id, "9110") ||
> +	    !strcmp(id, "927") ||
> +	    !strcmp(id, "928"))
>  		return &gt911_chip_data;
>  
> -	case 912:
> -	case 967:
> +	if (!strcmp(id, "912") ||
> +	    !strcmp(id, "967"))
>  		return &gt967_chip_data;
>  
> -	default:
> -		return &gt9x_chip_data;
> -	}
> +	return &gt9x_chip_data;

I wonder if with strings it would not be simpler to have a id -> pointer
mapping table and loop over it.

Thanks.

-- 
Dmitry
