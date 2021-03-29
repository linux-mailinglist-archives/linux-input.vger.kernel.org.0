Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBEA34D7C9
	for <lists+linux-input@lfdr.de>; Mon, 29 Mar 2021 21:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhC2TJH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Mar 2021 15:09:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbhC2TIg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Mar 2021 15:08:36 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD1FC061574;
        Mon, 29 Mar 2021 12:08:36 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id q5so10470297pfh.10;
        Mon, 29 Mar 2021 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=A1aSVQ8Nbla/MB0w7R8S6KttISqOIat+NhW/HJUeyVI=;
        b=kDUcdMl7lx9WyPlIQtpfVX26FPaRgsdULjFNf2y3uRlptPKdlmr113tFoGnfe1FBha
         8FXzDQvJdS4uidnag+vN447OWGuhKoEna/HwkbHQwSN3Z6g7D/BGLHvE+TRCUIQYOnYq
         z5iKsyheHZfMuPVfd0NY+f5YXOEMkqB4AoTGJ7iDU3UWbquUBgnHtMMz1MTzy2lYvcL7
         P2BQYmjc1bxXYTC/rt1ay/xFdI/fYDMABjaPZLaoN6XFeisf1+XSzPkUmXDnPMRzxHb0
         u+nYTP3QN2pp4NWodJGSD1e7hc47IXuEMfNRP4BB6hvnECuLy01/O7wGTi/ferb47Qzs
         92zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=A1aSVQ8Nbla/MB0w7R8S6KttISqOIat+NhW/HJUeyVI=;
        b=UTtp1fP/6ZN54aga2dfjgOhKIiYHhbMW7yEp69CxHet3q6wBEBUgPEeFEElGgVrxZF
         +m1e2gksK7770UjcYRWIvh5tj8OaCl2N5bNV5WfF54Sby5D7nkDg09sgbbSmzASLyx/+
         ZjpuP8frtbYEjHqGSH/fSCu1BmOlJgTrAHSvJAdQl522HOR5np9WCqzCq2s9iBQ83n7o
         qRQG17Q9tEbqcmqmYPN5XtYNwCwT6GWXF8X7ggg8ttNwQbG1NLCvmxypNJ/Qfy0fcP17
         2KZNHQ49zhWeJ6OHdXfUjZk4v1DiebbfrT/vcEmDEsTWYmxbzFgB4LttNnErntypiBZp
         hHAw==
X-Gm-Message-State: AOAM531DDcpKvKAc5obatStIM44uBn/l+4NDtGem2Y6pD1fFpJ3mK2Sp
        wJ4/p0d5uEvDOplYMZgdrhCsSFYHw20=
X-Google-Smtp-Source: ABdhPJxf1L2ikucUGbFtfXdEwpOaJDv74guHEWbUh3SlyOjrqt5rlHQxd9qgDJxiX3KHnDukIzBaNA==
X-Received: by 2002:a63:ea53:: with SMTP id l19mr24554459pgk.176.1617044916075;
        Mon, 29 Mar 2021 12:08:36 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a82a:a913:988c:7480])
        by smtp.gmail.com with ESMTPSA id y23sm17862356pfo.50.2021.03.29.12.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:08:34 -0700 (PDT)
Date:   Mon, 29 Mar 2021 12:08:32 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v4 04/10] Input: wacom_i2c - Add touchscren properties
Message-ID: <YGIlsLgvE9y/jiGk@google.com>
References: <20210326015229.141-1-alistair@alistair23.me>
 <20210326015229.141-4-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326015229.141-4-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 25, 2021 at 09:52:24PM -0400, Alistair Francis wrote:
> Connect touchscreen properties to the wacom_i2c.
> 
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
> v4:
>  - Add touchscreen_report_pos() as well
> 
>  drivers/input/touchscreen/wacom_i2c.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index eada68770671..ee1829dd35f4 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -11,6 +11,7 @@
>  #include <linux/i2c.h>
>  #include <linux/slab.h>
>  #include <linux/irq.h>
> +#include <linux/input/touchscreen.h>
>  #include <linux/interrupt.h>
>  #include <linux/of.h>
>  #include <asm/unaligned.h>
> @@ -33,6 +34,7 @@ struct wacom_features {
>  struct wacom_i2c {
>  	struct i2c_client *client;
>  	struct input_dev *input;
> +	struct touchscreen_properties props;
>  	u8 data[WACOM_QUERY_SIZE];
>  	bool prox;
>  	int tool;
> @@ -188,6 +190,9 @@ static int wacom_i2c_probe(struct i2c_client *client,
>  	__set_bit(BTN_STYLUS2, input->keybit);
>  	__set_bit(BTN_TOUCH, input->keybit);
>  
> +	touchscreen_parse_properties(input, true, &wac_i2c->props);
> +	touchscreen_report_pos(input, &wac_i2c->props, features.x_max,
> +			       features.y_max, true);

??? This goes into wacom_i2c_irq() where it previously used
input_report_abs() for X and Y so that transformations (swap, mirrot)
requested via device properties are applied to the coordinates.

Thanks.

-- 
Dmitry
