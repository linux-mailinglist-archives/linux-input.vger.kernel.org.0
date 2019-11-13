Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20451FABFE
	for <lists+linux-input@lfdr.de>; Wed, 13 Nov 2019 09:23:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfKMIXU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Nov 2019 03:23:20 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:35301 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727412AbfKMIXT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Nov 2019 03:23:19 -0500
Received: by mail-pf1-f195.google.com with SMTP id q13so1147941pff.2;
        Wed, 13 Nov 2019 00:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=2Dr4DtssgxrhEWsTdOORMh6MSvL94CfbPjLQDiXX5z8=;
        b=EMfPDGRWhFSD7qSuLI608VmxMoUqaFuxMujKCLx8kmpxOWcr4cSSxmJ6EqaaHAyZml
         wTFZ3ix7annFmdDY+6uX2dcXHQpRCF494ol73mlx00a6gMtKHNeO4Xe6C5wkjn4EAwvw
         LM4y9sy+BGdr0p5/20q/7HYjMA72hoAizGWu0B/wRFSuEAn2IAddHpDcu0ATDU+hN8Ge
         aLuVsw08gkdWCWSeBtughBpmN3+BLxIeR4esrk7uwRwEse+CHUl9SNTm9zKFp0WG+M/l
         yWO5WMtxKHEU4h/H6HhKm8GZPDXvDniTT7Tq6ZpUXz/ehVwJNRxbw5RlBOFSIzZfDjad
         9L7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2Dr4DtssgxrhEWsTdOORMh6MSvL94CfbPjLQDiXX5z8=;
        b=T1iyIozWw3IDxdkC6mGIcbMNOZkvNdKBqafq7w+g+Rl40/Qx+IF0U0P8z5BTYMX3+t
         Xmt3+5US0bgyojHyNVsfOnZYC0xjxHtYeA8sZeS961FJ4Dc4zwkvS+aDJ07uR0eoRxHf
         3QXgOU8hrzkv8K/zoN5Op5uvQ1cM3k6oGjy+ww0DR7uca6lkpZnF8k+s6iUiJnqAIcDY
         hMyB46okR/2E5VIKQuDdjH2NtOcmlZ9QnOzfIZuUtGQsvo2er6X+QVQJrTT3SfeH7FBe
         26YCQgBcqCuJc8OGPjhX++OsWf3Vjajd8A1LNHfIJxw+gvFMiMYeRJ8vY8rzxVtFbWV6
         fBzw==
X-Gm-Message-State: APjAAAWml0tolKYFxPTQOc0iElUNZZ6vDQgduFP/jD4Tq+r6ZO3b3uIq
        eUgAahMUYM9zu1oDCJ9f6+RkLR1u
X-Google-Smtp-Source: APXvYqxrn8/DJ5ZA90g5FPai40sgjjI8v/ovW0vcSZOpBwKg2SWl3NlXGSQDc5kNDWH700dgNh63IA==
X-Received: by 2002:aa7:96e2:: with SMTP id i2mr569783pfq.256.1573633398428;
        Wed, 13 Nov 2019 00:23:18 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t12sm1615211pgv.45.2019.11.13.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2019 00:23:17 -0800 (PST)
Date:   Wed, 13 Nov 2019 00:23:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: synaptics-rmi4 - add missed operations in remove
Message-ID: <20191113082315.GP13374@dtor-ws>
References: <20191113063656.8713-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113063656.8713-1-hslester96@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 13, 2019 at 02:36:56PM +0800, Chuhong Yuan wrote:
> The driver forgets to deal with work and workqueue in remove like what
> is done when probe fails.
> Add the missed operations to fix it.

Is it really possible for the work to still be pending when fully
registered device is properly unregistered? I thought we'd wait for
successful data acquisition in rmi_f54_buffer_queue() before unregister
can complete.

> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/input/rmi4/rmi_f54.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/rmi4/rmi_f54.c b/drivers/input/rmi4/rmi_f54.c
> index 710b02595486..2c0cde5c775c 100644
> --- a/drivers/input/rmi4/rmi_f54.c
> +++ b/drivers/input/rmi4/rmi_f54.c
> @@ -730,6 +730,9 @@ static void rmi_f54_remove(struct rmi_function *fn)
>  
>  	video_unregister_device(&f54->vdev);
>  	v4l2_device_unregister(&f54->v4l2);
> +	cancel_delayed_work_sync(&f54->work);
> +	flush_workqueue(f54->workqueue);
> +	destroy_workqueue(f54->workqueue);
>  }
>  
>  struct rmi_function_handler rmi_f54_handler = {
> -- 
> 2.23.0
> 

Thanks.

-- 
Dmitry
