Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A13A34D7E1
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 21:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhC2TMx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 15:12:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbhC2TMo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 15:12:44 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B1DC061574;
        Mon, 29 Mar 2021 12:12:44 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id kr3-20020a17090b4903b02900c096fc01deso6403976pjb.4;
        Mon, 29 Mar 2021 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VqmrqS9bYW6O07iO29RrCfsxL/rVo6MfLhKLYM4/bmY=;
        b=i/36GcN3FAqyybntN9xWr3tHD9Iuv6FH9B/gzTXdLAIMbNLUUyTj4iO4Q2JUyfXPEc
         7piSsBemwv2OGyCxH3nylU3UG+39Cx/UqiWi2WElTBoT5YnrIsUjhv6CJNd7ix1RG7GA
         7PHATlIsYl0XXJ3DwhyxMcol4kXe1KdZa6UmwyVdDB0uTvAWs3jMEpBxomGDW2/ERwb3
         0DLSQzyT2hsAGsUg3MrZRmiZiKayrb/BZtuuxU+HmsJZGAf5rYwaY6xUh41jqAftfXol
         ygCms8jRCO3xulhs5ddauB8Zi7+Ebh22ZV9CmgcJvrHu9khpqVYXxzhDwk4TgHlZesdF
         sFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VqmrqS9bYW6O07iO29RrCfsxL/rVo6MfLhKLYM4/bmY=;
        b=Ue+r2wn7+guaOEZhWpc2ozLB5F1wB40sTssADMv+S381AKxKZcRlO9R9XP6ZORVMT4
         nVsdA6tSUjKJeBrW84eVDyWS2fHP6dMIhSD7jKeEFJXD/CtnoFu+hkQecctZBMw7dN24
         xZvpUHdp+09Q+Ha+jHhcCQCZCKL2NDAG5+k937Ht0SXBfPLcIwMk21ZN1NdJNdJIMHRB
         Opq8OrSGEuDbP1JOwn2ElPGbtvVXG92aPfO/BmLOlkV1+cEhGIGsaaP2B6UxZN6ae6v+
         knuSZ9CEw5GoO4jat9vbHsOhRpFgkHiMgpJxt8gxlMoTTAUKLZQwZd4y7nkB4K8/ALhp
         QjdA==
X-Gm-Message-State: AOAM533dT3y7ZG1oqkvh9k7rXZ3TpjqfIRzPrC1ud4XRE0UAoI/SeBAt
        jVEZv3PnWocVkzWqLbRSyj8=
X-Google-Smtp-Source: ABdhPJy3xqP0sm/creOp7ptgS0yO06WmtQUwQYJGixr+JkDVNSEYSHQNvF1rsDcrddbX2Vffrc16iA==
X-Received: by 2002:a17:90b:ecd:: with SMTP id gz13mr563826pjb.219.1617045163851;
        Mon, 29 Mar 2021 12:12:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a82a:a913:988c:7480])
        by smtp.gmail.com with ESMTPSA id x2sm17624845pgb.89.2021.03.29.12.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:12:42 -0700 (PDT)
Date:   Mon, 29 Mar 2021 12:12:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v4 05/10] Input: wacom_i2c - Add support for distance and
 tilt x/y
Message-ID: <YGImp7Fc/hjG4PFV@google.com>
References: <20210326015229.141-1-alistair@alistair23.me>
 <20210326015229.141-5-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326015229.141-5-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 25, 2021 at 09:52:25PM -0400, Alistair Francis wrote:
> This is based on the out of tree rM2 driver.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  drivers/input/touchscreen/wacom_i2c.c | 25 +++++++++++++++++++++++--
>  1 file changed, 23 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index ee1829dd35f4..3b4bc514dc3f 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -22,12 +22,16 @@
>  #define WACOM_CMD_QUERY3	0x02
>  #define WACOM_CMD_THROW0	0x05
>  #define WACOM_CMD_THROW1	0x00
> -#define WACOM_QUERY_SIZE	19
> +#define WACOM_QUERY_SIZE	22
>  
>  struct wacom_features {
>  	int x_max;
>  	int y_max;
>  	int pressure_max;
> +	int distance_max;
> +	int distance_physical_max;
> +	int tilt_x_max;
> +	int tilt_y_max;
>  	char fw_version;
>  };
>  
> @@ -79,6 +83,10 @@ static int wacom_query_device(struct i2c_client *client,
>  	features->y_max = get_unaligned_le16(&data[5]);
>  	features->pressure_max = get_unaligned_le16(&data[11]);
>  	features->fw_version = get_unaligned_le16(&data[13]);
> +	features->distance_max = data[15];
> +	features->distance_physical_max = data[16];
> +	features->tilt_x_max = get_unaligned_le16(&data[17]);
> +	features->tilt_y_max = get_unaligned_le16(&data[19]);

Do other models also support distance and tilt? If not, this needs to be
made conditional.

Thanks.


-- 
Dmitry
