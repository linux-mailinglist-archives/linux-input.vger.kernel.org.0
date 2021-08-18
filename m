Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 498733F023F
	for <lists+linux-input@lfdr.de>; Wed, 18 Aug 2021 13:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234824AbhHRLIX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Aug 2021 07:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234645AbhHRLIV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Aug 2021 07:08:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD14C061764;
        Wed, 18 Aug 2021 04:07:47 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q21so4374094ljj.6;
        Wed, 18 Aug 2021 04:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CeegBrrNVi7dbUMewAnT7F1thuHVU6mNRz6VrAUpjZU=;
        b=lM9em+I5HYJDd8vuyehL5JRbWhntUxjmoweF/BXPC/5avEo/WgeBGv8YRVccqmwOfL
         9tK1WWSzQy96kKhAzXUitpwVthJkhvtkmBMG0RO5vsoJseHntbZ4OhckSO7HT/CrpSYk
         T+/VAbc7Nt7F9y9zxm37hJse9FRYeUgA7nSMjcUua+X3p8pYzkctBdaLC9k9y7/f8ywm
         NlQg69+Sqv2NnZVEXFlorXWbr0eYl3HwRGtjKjoZ9Z1WYjka5Bi+0R4Om08AFPNNWBGc
         nLB0MIdjWdAS4HhvU/uWh5HIEgTghgj7Yl5cFGbO1Bi5H52A6Vyx7Vk4wRuHbX9pz5T5
         hySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CeegBrrNVi7dbUMewAnT7F1thuHVU6mNRz6VrAUpjZU=;
        b=rmmp0LjO3CXv0slg62OM60JV7triJ+bqdayPC7NChuJ0KC9n15xQgvYCjEX5++JAXG
         gGlEJLyKTs3ykOfurpAHFSooM2vg0kHoZYhtEz8nquseF0DcnV4C4NNMPWHez65V321D
         ImpWr2qMQpZMV4NYgJvYI3GsglUrAVy32fRqiKvL0rALgV2t1+raB4RhDu0mR4PDgAwu
         hiOcHwosAZ4cejV9365vjOQNQzeUY/ncOPZn1YyayoYAZvDfp9oIW7sHEWG75rSIGIjP
         72ANqS5nQLlFYlDGaudDvn2/vN3thl7vx8sN1Cigb1uR9LtRtHuJAq5mbxtP5l1HPYEg
         fd/w==
X-Gm-Message-State: AOAM532igdWOwzTlLWWiUQgEukJee7z+oNOgtFFsI2l8flNNpmAUxWE3
        Kc8KXDsmvcd7YGRC+lnpGik=
X-Google-Smtp-Source: ABdhPJyYcmaipXkdcnDgqt6R/cluDi6GkgLom4VVwbBqONex/z+chuo244wTpF06GvH+XC4gVCyqfw==
X-Received: by 2002:a2e:a288:: with SMTP id k8mr7242997lja.107.1629284865530;
        Wed, 18 Aug 2021 04:07:45 -0700 (PDT)
Received: from localhost.localdomain ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id y41sm464017lfa.113.2021.08.18.04.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 04:07:45 -0700 (PDT)
Subject: Re: [PATCH] input: cm109: fix URB submitted while active
To:     dmitry.torokhov@gmail.com, aeh@db.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com
References: <20210804145801.2762-1-paskripkin@gmail.com>
From:   Pavel Skripkin <paskripkin@gmail.com>
Message-ID: <19948c76-fa3c-26bb-7604-6de392ad9d49@gmail.com>
Date:   Wed, 18 Aug 2021 14:07:44 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804145801.2762-1-paskripkin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 8/4/21 5:58 PM, Pavel Skripkin wrote:
> Syzbot reported, that dev->urb_ctl was submitted while active. The
> problem was in missing validation check. We should check, that dev->urb_ctl
> is not pending before sumbitting it again.
> 
> Fail log:
> 
> URB 00000000cfeee59c submitted while active
> WARNING: CPU: 1 PID: 8459 at drivers/usb/core/urb.c:378 usb_submit_urb+0x1271/0x1540 drivers/usb/core/urb.c:378
> ...
> Call Trace:
>   <IRQ>
>   cm109_urb_irq_callback+0x44f/0xaa0 drivers/input/misc/cm109.c:422
>   __usb_hcd_giveback_urb+0x2b0/0x5c0 drivers/usb/core/hcd.c:1656
>   usb_hcd_giveback_urb+0x367/0x410 drivers/usb/core/hcd.c:1726
> 
> Reported-and-tested-by: syzbot+2d6d691af5ab4b7e66df@syzkaller.appspotmail.com
> Fixes: c04148f915e5 ("Input: add driver for USB VoIP phones with CM109 chipset")
> Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
> ---


Gentle ping :)



With regards,
Pavel Skripkin

>   drivers/input/misc/cm109.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/input/misc/cm109.c b/drivers/input/misc/cm109.c
> index f515fae465c3..60bddadbbe3a 100644
> --- a/drivers/input/misc/cm109.c
> +++ b/drivers/input/misc/cm109.c
> @@ -406,7 +406,7 @@ static void cm109_urb_irq_callback(struct urb *urb)
>   
>   	dev->irq_urb_pending = 0;
>   
> -	if (likely(!dev->shutdown)) {
> +	if (likely(!dev->shutdown) && likely(!dev->ctl_urb_pending)) {
>   
>   		if (dev->buzzer_state)
>   			dev->ctl_data->byte[HID_OR0] |= BUZZER_ON;
> 


