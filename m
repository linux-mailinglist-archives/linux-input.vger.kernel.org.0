Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B833207AB
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 00:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBTX1Z (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 18:27:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229994AbhBTXYg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 18:24:36 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56896C061786;
        Sat, 20 Feb 2021 15:23:55 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 75so7752157pgf.13;
        Sat, 20 Feb 2021 15:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZEjysgVVbHEsGME6Wv90Jk09wITPyZdk9nBnNUCyClw=;
        b=k1ki9cicCDJbkJsuoubsAMk6X89zc99oPuxySFSs7YnVYkXY6mPh3DgrjBaWJcm0aV
         KDWlhH2s9mhQ0voHYm9qe3FVw3IUQ4Z2VDjr7tqQ+yBquM8GPVcKbqOdzPa8v2dM0TcR
         Mikk9OyQQw/IPpL31mhZ337Nnuuyd1EoxRfup3Yuuz6RCbPMo1MrXUCFYWY9DYvjA9IO
         Tdt/b+B4gUeDCZF7Y1ePXK8haclcwrNM+sOkP+KGC9lN/yuTHCpYtuPUZXUFqWQannoS
         bePO7K0zoDf1s1000eUBTuVic14Q0kICes5WnVpcL+hnmtu47AzbljsHUC8VNUqEJLLh
         A4hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZEjysgVVbHEsGME6Wv90Jk09wITPyZdk9nBnNUCyClw=;
        b=rE+SuX/QAtYhewnP8/JwuKgkRb6780piQ+acM5Q8S/QIvbXw0akSLsWOfQcznoMV1g
         8zKRdB93K4HQCGLMd6KsaIwHa/WeMixmrO0t9KCqt81z2snvP+PQh7NVx+L4U7HOoaXZ
         pm/K033ZmfIWIlIUJwXNm6KPT2eXFeEQCXiOVYTrxDOXhS4+HsCu3nR1IBWhojkfUlyz
         lxy19fH/bRZw7+JxUhBDNNkunYSP3fiSyEklLnAet8yk8xP5pOHpm3FRpDKlKdXnP9ca
         dnb5b9jfdH6i+hg+wp9Crhmqy28eR/jrx6dP7yuwLwtsfmbo8jIpj5xUHvtj5XfKkdB2
         36hQ==
X-Gm-Message-State: AOAM530+mfZYPgxcZLLx3XWkT3tiIkGuUTDGl4Yp5NkQRjVM/rEMAY4C
        JyZAwP/mOjZVUqQRzq9xhvw18Jqls9o=
X-Google-Smtp-Source: ABdhPJxwQ/HdqHGgznC2A0+kbznawdO8hKohZl/5eYYUnmQpitptf6/ZRXT2Sk+7pXcxar4p7WYbyA==
X-Received: by 2002:a63:d355:: with SMTP id u21mr14475962pgi.133.1613863434826;
        Sat, 20 Feb 2021 15:23:54 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b993:3e9c:7cd5:5a8e])
        by smtp.gmail.com with ESMTPSA id w3sm9454041pjn.12.2021.02.20.15.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Feb 2021 15:23:53 -0800 (PST)
Date:   Sat, 20 Feb 2021 15:23:51 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v4 2/2] Input: add MStar MSG2638 touchscreen driver
Message-ID: <YDGaB6L5+Aa2snUM@google.com>
References: <20210210173403.667482-1-vincent.knecht@mailoo.org>
 <20210210173403.667482-2-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210173403.667482-2-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vincent,

On Wed, Feb 10, 2021 at 06:33:52PM +0100, Vincent Knecht wrote:
> +
> +	for (i = 0; i < MAX_SUPPORTED_FINGER_NUM; i++) {
> +		p = &touch_event.pkt[i];
> +		/* Ignore non-pressed finger data */
> +		if (p->xy_hi == 0xFF && p->x_low == 0xFF && p->y_low == 0xFF)
> +			continue;
> +
> +		coord.x = (((p->xy_hi & 0xF0) << 4) | p->x_low) * msg2638->prop.max_x / TPD_WIDTH;
> +		coord.y = (((p->xy_hi & 0x0F) << 8) | p->y_low) * msg2638->prop.max_y / TPD_HEIGHT;
> +		msg2638_report_finger(msg2638, i, &coord);

We do not scale the coordinates in the kernel. Rather we provide
resolution, if known, and min/max coordinates reported by the hardware,
and let userspace handle the rest.

> +static int __maybe_unused msg2638_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct msg2638_ts_data *msg2638 = i2c_get_clientdata(client);
> +
> +	mutex_lock(&msg2638->input_dev->mutex);
> +
> +	if (input_device_enabled(msg2638->input_dev))
> +		msg2638_stop(msg2638);

I believe that you should power down the device only if it is not
configures as wakeup source. In fact (and I think most drivers are
wrong in this), you may want to power up the device if it is a wakeup
source and it does not have any users.

Thanks.

-- 
Dmitry
