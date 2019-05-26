Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A07852AB1A
	for <lists+linux-input@lfdr.de>; Sun, 26 May 2019 18:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727891AbfEZQTn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 May 2019 12:19:43 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41004 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727847AbfEZQTn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 May 2019 12:19:43 -0400
Received: by mail-pf1-f195.google.com with SMTP id q17so3277482pfq.8;
        Sun, 26 May 2019 09:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lJ3OpNMCdALqETy0qV5AcNhUPuYZT+J/DUPQVFJRLrg=;
        b=Yzj1MZMxRBURL4/0AbkPkUdnFTzelszWr8GQM+ybm1VxPKjvHkTwlQ3sj3osgf9jzp
         qr1J7/0u1N/fo+clTbcqoWLfTusD4q7Zn6uRZEfiLyyGpMpDFQIwAkLxHjbrBz2fnzdu
         HiHXRHubIGaQuonnipHj42EMFBtWYXAMDIYl3PTgT2BwqJDBJFGySd45V76liEBBcOai
         /7NFZb5Z55a+UR9PGHQ16pyp5df/QeB+W0QwtmvbPYnFDFJJ2Mb3rGIu70coSyu0Wk6H
         3r/5Swfuswrd2XU6O6dGaT7hdjkb/qcqz422h7mPxHeTX37i0mlnz8dbM22jB5xImJzE
         UYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lJ3OpNMCdALqETy0qV5AcNhUPuYZT+J/DUPQVFJRLrg=;
        b=KCZ4s3o7muq+Ql/jwpFuAwqR4g4gcyAQXvbGPJqYGRUySDpqQihzsHViJF4ZfecsNg
         etDF7UWUyaWiVgDivMgo143hUqsYSGzIkMEYC+eBjVb+Q9jjgPuhZluHhPvW7vAu2syL
         xhmuojWrkMsyO1us8hvZyBI9j1051Wn5rYqcChPSOvQXiELamBvfokcD5+Chx2/0d0Xg
         idvVIASVtNqxFzcCcb0TQcOrNU+Rmr1REqKXVWvu3GBh2Bq9Ou9ZLaaCCnXOfX1Ov7NH
         hXu6v/BjeaBziyG4afmlN213vSRoyH76UnXxwEMF0JTfTbeJDvKvl05T7uMlhYXsFs+t
         4OlA==
X-Gm-Message-State: APjAAAUOhXajK+CSpDhK4SfkbOG0Jy8p4Oc17qXyMU51rAf0U5BF/GUW
        N8uTh0rgSru2kOnwGCj2HAXrE60I
X-Google-Smtp-Source: APXvYqyYEON9Xr5P99XYoWbOI3hC46I2FaQxJzEmoSFufFpmE1Bkb1AymXxw3Q6LDrfc1BAZKUOZOw==
X-Received: by 2002:a63:d901:: with SMTP id r1mr36281064pgg.271.1558887581720;
        Sun, 26 May 2019 09:19:41 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q142sm11649009pfc.27.2019.05.26.09.19.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 May 2019 09:19:40 -0700 (PDT)
Date:   Sun, 26 May 2019 09:19:39 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     cheiny@synaptics.com, nick@shmanahar.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH -next] Input: synaptics-rmi4 - Remove set but not used
 variable 'sensor_flags'
Message-ID: <20190526161939.GA256861@dtor-ws>
References: <20190525141119.11852-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190525141119.11852-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, May 25, 2019 at 10:11:19PM +0800, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/input/rmi4/rmi_f12.c: In function rmi_f12_read_sensor_tuning:
> drivers/input/rmi4/rmi_f12.c:76:6: warning: variable sensor_flags set but not used [-Wunused-but-set-variable]
> 
> It's not used since introduction in
> commit b43d2c1e9353 ("Input: synaptics-rmi4 - add support for F12")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_f12.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
> index 5c7f48915779..72b5498e1a9f 100644
> --- a/drivers/input/rmi4/rmi_f12.c
> +++ b/drivers/input/rmi4/rmi_f12.c
> @@ -73,7 +73,6 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  	int pitch_y = 0;
>  	int rx_receivers = 0;
>  	int tx_receivers = 0;
> -	int sensor_flags = 0;
>  
>  	item = rmi_get_register_desc_item(&f12->control_reg_desc, 8);
>  	if (!item) {
> @@ -129,10 +128,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
>  		offset += 2;
>  	}
>  
> -	if (rmi_register_desc_has_subpacket(item, 4)) {
> -		sensor_flags = buf[offset];
> +	if (rmi_register_desc_has_subpacket(item, 4))
>  		offset += 1;
> -	}
>  
>  	sensor->x_mm = (pitch_x * rx_receivers) >> 12;
>  	sensor->y_mm = (pitch_y * tx_receivers) >> 12;
> -- 
> 2.17.1
> 
> 

-- 
Dmitry
