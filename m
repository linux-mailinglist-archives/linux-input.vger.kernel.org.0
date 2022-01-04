Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C3C483977
	for <lists+linux-input@lfdr.de>; Tue,  4 Jan 2022 01:30:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbiADAaB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Jan 2022 19:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiADAaB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Jan 2022 19:30:01 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8948CC061761
        for <linux-input@vger.kernel.org>; Mon,  3 Jan 2022 16:30:01 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id l16so13819041plg.10
        for <linux-input@vger.kernel.org>; Mon, 03 Jan 2022 16:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jk0BVWWLmrwMOQ9ilHa1h4ZcHM0mgBidFFsnt5UyFv8=;
        b=UxMdGkqGBR7dJB9H5QPTMhuFxMsw1gU9Tncw3KUOGUipvSHY0azuygJ9Qp+qvCZfwh
         quicRDTfR/75AytI9Dnt8LlGHVuUedsmjmZrE/1arGR6bzekIJ3MenEQBTpTp3/kXJKA
         F1eoqwbFDg16hE47NVYxXkp61lx+7ivCunDq4tzIApiW4E5WVvCjD7qOYa48UYo5p3p1
         o7wap5uehPkT40jCSMOmiCVIWZg+1agHP2l4cs+kLk2h+EhSxezmYVG3Mx00E7gpIZvm
         /+RQ41+/RxATgKMhvb3H1GPFralflsP+EeEP65FFEyn4veepn+hfHiEBhsapHcC7j4Ww
         eSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jk0BVWWLmrwMOQ9ilHa1h4ZcHM0mgBidFFsnt5UyFv8=;
        b=XwDtRjyZ9c8ex5wNRczfrAnEN+cao2nwFfn3D8+0G7ThNJ7xkTLbIjXNxdzB2cIgcG
         ZDcqxI+AucWFfAsNYGrAT1tUZkJqohA3zKG9OMqUYBbNXGMrSRMorC7/BL8IimOwrdrQ
         DqzhNslXe7tMZjDjiIlcLiyio8boV1HdiZXhl7Z5ioSboKKjE8+OQ4kexOnMP0MbbeyU
         KNvIo6+wQhYAG7mtPKl3+ZYpsrFpWKGaaEaT4HSqpJpqXKpCmv+xjxgi12fiF1FroOBN
         Y+yHKqmwzod+KnOVJsN0lOXjcGEFKkuRZ42qI2dOCqke3oc91nJF/SbQkRCgn7O80WVN
         xvug==
X-Gm-Message-State: AOAM5329t1u/bH9vQFsb+2/4o4mRfvrqnGxc+JwudRPWsYWi0TTqjrCd
        4brkWd8XVZDsFjbY0V6FOwI=
X-Google-Smtp-Source: ABdhPJxAu56m1fx/bDBOaJu5lo8NZzm6fUVC0BckxnQPkMOxuNsCub15Hshi4HCnTKZPFQCnnmIvTg==
X-Received: by 2002:a17:90a:cf93:: with SMTP id i19mr57449058pju.168.1641256200875;
        Mon, 03 Jan 2022 16:30:00 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a7d6:43d7:bbe3:3573])
        by smtp.gmail.com with ESMTPSA id t8sm17775151pfj.114.2022.01.03.16.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 16:29:59 -0800 (PST)
Date:   Mon, 3 Jan 2022 16:29:57 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jingle Wu <jingle.wu@emc.com.tw>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: elan_i2c - Fix regulator enable count imbalance
 after suspend/resume
Message-ID: <YdOVBVUVWnVkaLTZ@google.com>
References: <20211222220641.439863-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211222220641.439863-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Wed, Dec 22, 2021 at 11:06:41PM +0100, Hans de Goede wrote:
> Before these changes elan_suspend() would only call elan_disable_power()
> when device_may_wakeup() returns false; whereas elan_resume() would
> unconditionally call elan_enable_power(), leading to an enable count
> imbalance when device_may_wakeup() returns true.
> 
> This triggers the "WARN_ON(regulator->enable_count)" in regulator_put()
> when the elan_i2c driver gets unbound, this happens e.g. with the
> hot-plugable dock with Elan I2C touchpad for the Asus TF103C 2-in-1.
> 
> Fix this by making the elan_enable_power() call also be conditional
> on device_may_wakeup() returning false.

elan_enable_power() not only tries to toggle the regulator, but also
tries to issue command to the controller to power/wake it up. I need
confirmation from Jingle Wu that skipping this is OK for all Elan
touchpad controllers, or if we need to add call to either power control
or sleep control method to make sure the controller it fully resumed.

Jingle, what can you tell us here?

> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 47af62c12267..cdb36d35ffa4 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -1412,17 +1412,17 @@ static int __maybe_unused elan_resume(struct device *dev)
>  	struct elan_tp_data *data = i2c_get_clientdata(client);
>  	int error;
>  
> -	if (device_may_wakeup(dev) && data->irq_wake) {
> +	if (!device_may_wakeup(dev)) {
> +		error = elan_enable_power(data);
> +		if (error) {
> +			dev_err(dev, "power up when resuming failed: %d\n", error);
> +			goto err;
> +		}
> +	} else if (data->irq_wake) {
>  		disable_irq_wake(client->irq);
>  		data->irq_wake = false;
>  	}
>  
> -	error = elan_enable_power(data);
> -	if (error) {
> -		dev_err(dev, "power up when resuming failed: %d\n", error);
> -		goto err;
> -	}
> -
>  	error = elan_initialize(data, data->quirks & ETP_QUIRK_QUICK_WAKEUP);
>  	if (error)
>  		dev_err(dev, "initialize when resuming failed: %d\n", error);
> -- 
> 2.33.1
> 

Thanks.

-- 
Dmitry
