Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 869E1680AE
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 20:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbfGNS1A (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jul 2019 14:27:00 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41806 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728125AbfGNS1A (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jul 2019 14:27:00 -0400
Received: by mail-pg1-f193.google.com with SMTP id q4so6646094pgj.8;
        Sun, 14 Jul 2019 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C3+LwTMz7oRAHjpSsg0OU3tmsBSXvB5eSt3fNBDbPHU=;
        b=H498b6T99tmRG/s9bNt8+Mtkc1Tp/SqcbExgxg9mcm64eQWYL8+sllqCYJJ4LhPGli
         EzK5YxvCfItR2iA9RFWgrBoBa/4DBfsv8FIJEjPuSovp5hDZOAKWGuFvusZU1YchczNd
         6gCS8JknM49uTyGU/ieEURvOefl+ZOYRjyVyFGAQDctsJJekbO80XwD1hitvEYUuY3Vp
         tRU5xO+wlRX2oZLAJasxlvEIp3owbL+xIP47cCMBE03s6Xu84hUDYSUZAavyqeCVmcGt
         EN/AFuzvkBLu3WLsSiRtJHbsthraWWuMxSQUUzF6LJyXNGy+kuqUdu04x/QtapbAvMzN
         JVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C3+LwTMz7oRAHjpSsg0OU3tmsBSXvB5eSt3fNBDbPHU=;
        b=QXKFNLdolToq+aQVmxAEvYTWXkKFr8qgzRw2dD/7aCTbfJXOL02vRqyjRIHF77IApF
         VUxlfdCWEwzHWSsW0yV8/CxIyffaOhOvatXelzZXtXwjjgx5+KREApqeJvVBgpmqQfzh
         TvJkWrwIBGv6l+To1eoDMXliH9EyH6pr2NQosGv6RDcgiluo/xQnGHZUtWndyrkhb4Yh
         xpJdAPZBIUq3/eQaCYqzgTX3POugA9MLKVvDe7w+cih1M85IfpDH1yUf8moJo6rKwrfF
         Vq/qEAkdKp1g7bn2wEo14aIWrOEGGhBc93ICD96/YwGad8ywLgXAOGxhkGeu3CSDp68b
         VXUA==
X-Gm-Message-State: APjAAAXy1VNM+LMcKk56yz+lJSdv8FHu5ZpX8uyinncRTwjOyjhGf4yM
        tcQQMqDlVj5qgGyxpC8vaLJRRT/k8GQ=
X-Google-Smtp-Source: APXvYqyM4FJtvmuldolJ6Bq3z0fLBN+6PBCV5bNMxjEhCYAjPhAcXu0gMY4+Tc8XjcmYwteSeHdngg==
X-Received: by 2002:a63:6a81:: with SMTP id f123mr23279561pgc.348.1563128818940;
        Sun, 14 Jul 2019 11:26:58 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x128sm28447229pfd.17.2019.07.14.11.26.58
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 11:26:58 -0700 (PDT)
Date:   Sun, 14 Jul 2019 11:26:56 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Denis Efremov <efremov@linux.com>
Cc:     Andrew Duggan <aduggan@synaptics.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4 - remove the exporting of
 rmi_2d_sensor_set_input_params
Message-ID: <20190714182656.GA190835@dtor-ws>
References: <20190708172138.31009-1-efremov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190708172138.31009-1-efremov@linux.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 08, 2019 at 08:21:38PM +0300, Denis Efremov wrote:
> The function rmi_2d_sensor_set_input_params is declared static and marked
> EXPORT_SYMBOL_GPL, which is at best an odd combination. Because the
> function is not used outside of the drivers/input/rmi4/rmi_2d_sensor.c
> file it is defined in, this commit removes the EXPORT_SYMBOL_GPL() marking.
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>

Applied, thank you.

> ---
>  drivers/input/rmi4/rmi_2d_sensor.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/rmi4/rmi_2d_sensor.c b/drivers/input/rmi4/rmi_2d_sensor.c
> index ea549efe4bc4..b7fe6eb35a4e 100644
> --- a/drivers/input/rmi4/rmi_2d_sensor.c
> +++ b/drivers/input/rmi4/rmi_2d_sensor.c
> @@ -204,7 +204,6 @@ static void rmi_2d_sensor_set_input_params(struct rmi_2d_sensor *sensor)
>  	if (sensor->topbuttonpad)
>  		set_bit(INPUT_PROP_TOPBUTTONPAD, input->propbit);
>  }
> -EXPORT_SYMBOL_GPL(rmi_2d_sensor_set_input_params);
>  
>  int rmi_2d_sensor_configure_input(struct rmi_function *fn,
>  					struct rmi_2d_sensor *sensor)
> -- 
> 2.21.0
> 

-- 
Dmitry
