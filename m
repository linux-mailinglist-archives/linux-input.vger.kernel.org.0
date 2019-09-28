Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7A52C0EF4
	for <lists+linux-input@lfdr.de>; Sat, 28 Sep 2019 02:16:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbfI1AQc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 Sep 2019 20:16:32 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38265 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbfI1AQc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 Sep 2019 20:16:32 -0400
Received: by mail-pl1-f196.google.com with SMTP id w8so1217312plq.5;
        Fri, 27 Sep 2019 17:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x5OtQT6idH9LaA0kReytId/54o5wnDaqSP4igHTa5XY=;
        b=e7BPZjEFn4/KUlv5Ovicz7B8+NjJVVxKI1DAuSojbyeqBZ21yHH03kDleRv3QH0SpJ
         XyBRkOLoflo3fYMxMLbyy8FZiPclujibOSGgwfLB2blGbhvz4Dyv0iHGbphWKHjxCJTg
         EUCf9CUg+bcwy+nW+PXgsDr7d4Tcopz2SbD6Ttmz/3RVbvvB4qFvLpigqN+tOi2SVT6p
         wDZ+3bjprPDQBMYhOzBiXV/jVl/GEo3MiTbWeAmacmMe9Andi0ORV/14eFAkgRAiyrgW
         2dTXYk6KO4IwWGCwg3Liu+GLbqwiO7mSHsjPzGka4tZghhBgIGOdHXocxDQ00Cv4UtGz
         nW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x5OtQT6idH9LaA0kReytId/54o5wnDaqSP4igHTa5XY=;
        b=cxBUXTMN1E/LEBBJF7JjxUvbSAlhAPzuUGXKJUuuA7La9afWTT5O0lWqbVW5du/4vZ
         IZCvwzsMZ+opyub+jIBm3FdYNBQymKabeXyhcAMCjyczJE57Myl9s8IJEaA1EigyVt9r
         YScjAKFom0/YmurE9rm0S0rSxb28PbYIT8hD0daUE3CzzlyJWdKpqmzTh9t/c8uo166p
         1//HYt3200gjfIp6Td+JT7hqH03qd+1aBHh9q+6RqH7fIvPZh0SPjruUyKTlU5tn5wHU
         g7C0pcO0xdS2eOinC1Lg1W6flMu1S+IznKY3+9be76uh2Uqq+73LmTQGy1l2LWMfzLXN
         Yhmw==
X-Gm-Message-State: APjAAAUvcgCQM83uRgfTF1aqsSZ8oQlJ5zSYXHL5vxv17bVh+H50oWp5
        E+nTLqgP7zNDuB10PxKi85M=
X-Google-Smtp-Source: APXvYqxyc66WqiOrnzpM4pZlBN6HZjbsmJOX1+wJ7Uz+aku8RT8PgT4DhH5Fnm/Da1L+nlxkWo7ohg==
X-Received: by 2002:a17:902:b08b:: with SMTP id p11mr7886498plr.320.1569629789779;
        Fri, 27 Sep 2019 17:16:29 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k31sm6940665pjb.14.2019.09.27.17.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 17:16:29 -0700 (PDT)
Date:   Fri, 27 Sep 2019 17:16:26 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Evan Green <evgreen@chromium.org>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Jongpil Jung <jongpil19.jung@samsung.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: atmel_mxt_ts - Disable IRQ across suspend
Message-ID: <20190928001626.GT237523@dtor-ws>
References: <20190924215238.184750-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924215238.184750-1-evgreen@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Evan,

On Tue, Sep 24, 2019 at 02:52:38PM -0700, Evan Green wrote:
> Across suspend and resume, we are seeing error messages like the following:
> 
> atmel_mxt_ts i2c-PRP0001:00: __mxt_read_reg: i2c transfer failed (-121)
> atmel_mxt_ts i2c-PRP0001:00: Failed to read T44 and T5 (-121)
> 
> This occurs because the driver leaves its IRQ enabled. Upon resume, there
> is an IRQ pending, but the interrupt is serviced before both the driver and
> the underlying I2C bus have been resumed. This causes EREMOTEIO errors.
> 
> Disable the IRQ in suspend, and re-enable it on resume. If there are cases
> where the driver enters suspend with interrupts disabled, that's a bug we
> should fix separately.
> 
> Signed-off-by: Evan Green <evgreen@chromium.org>
> ---
> 
> Changes in v2:
>  - Enable and disable unconditionally (Dmitry)
> 
>  drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> index 24c4b691b1c9..a58092488679 100644
> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -3155,6 +3155,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
>  		mxt_stop(data);
>  
>  	mutex_unlock(&input_dev->mutex);
> +	disable_irq(data->irq);
>  
>  	return 0;
>  }
> @@ -3174,6 +3175,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
>  		mxt_start(data);
>  
>  	mutex_unlock(&input_dev->mutex);
> +	enable_irq(data->irq);

At least for older devices that do soft reset on resume we need
interrupts to already work when we call mxt_start().

In general, order of resume steps should mirror suspend.

Thanks.

-- 
Dmitry
