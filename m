Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33780E64CB
	for <lists+linux-input@lfdr.de>; Sun, 27 Oct 2019 19:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727762AbfJ0SQG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Oct 2019 14:16:06 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:40357 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbfJ0SQG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Oct 2019 14:16:06 -0400
Received: by mail-pg1-f195.google.com with SMTP id 15so4936984pgt.7
        for <linux-input@vger.kernel.org>; Sun, 27 Oct 2019 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1W2XoEVtGuc2XUNTJQlDvRVLQe73jWZqsSbUfxLeNr8=;
        b=OlSWBvCSBmUAo7FV77uZWdByUf6ytfhM4THD9accu6g129Ct/KVo0sRezHLkYbO7On
         xY7pyzmjmBE5WJVVRRjz+qfPwV6yjWZnQfgvoo1aTYa3/hpCyvQk+PbKZ16mHjrJ88r0
         wTpNL8eydwCxqIpM2iPUdQNFHg0UhM0wogn1ONM/VFOWfBNICi5N1zwwMS51usPkGWPn
         jGPa+Lv+li3qmqtk2q8c+bgEoPo2iYa+2lfceqj58Jf+REc1VdWeQSJin5abMwSjUhyQ
         h35Wu4uZQjk4HkTQyFRJMuJYOIwRAgs5zgyyYHKIK/v04BHJHUlgIknTMGAhVmaDT+5W
         DaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1W2XoEVtGuc2XUNTJQlDvRVLQe73jWZqsSbUfxLeNr8=;
        b=YcQGvvZfNIIWxtoHOpptnI/cnlQDkHKoTIbn6luegMZqhU1i9urOvOxlc4TfDgn25J
         raTJ9uEHAXixuLnFgBN5gPDvDTlSFEkv1IZ3ZihvVD1coWEDJ1na9SlCDPMkWTXvADj2
         K+iT611J/+CFHFP4U7JkasowmmI/ale0dHmMdK7/YVvrsPoN7DovudIUnJEH1a6xAvmV
         Wm4pmJp9uOdEP+Hfj9QuKr8e796HrIH7JDVSK2vmDSki11Y7jEMzYPbUYMFAZb2p2xTe
         BVWEICczgPREoJ1MdWPjmMdgc8MIRuDPbjVon6tlUjKQMTQE3oCswQ6YC7amcn3xY/D7
         Ti3g==
X-Gm-Message-State: APjAAAVdhQ7BDdFkcNzCqujdRlFPPY6bV25nz2Q+sxO/KwjlaoVUfxrG
        9jkrkR77jAZ7aP72KB0xk8lJu/Uj
X-Google-Smtp-Source: APXvYqysTFowgX8Ow2P9EAKwvVejXNYNsHt9RFmvImjSu1BxZ7/5eHflkHSQN0FzACynW4aUpfqlog==
X-Received: by 2002:a17:90a:b118:: with SMTP id z24mr1994546pjq.120.1572200164304;
        Sun, 27 Oct 2019 11:16:04 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x12sm8429774pfm.130.2019.10.27.11.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2019 11:16:02 -0700 (PDT)
Date:   Sun, 27 Oct 2019 11:16:00 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: wacom_i2c - remove unneeded gpio.h header file
Message-ID: <20191027181600.GF163068@dtor-ws>
References: <20191026185958.24158-1-festevam@gmail.com>
 <20191026185958.24158-3-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191026185958.24158-3-festevam@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Oct 26, 2019 at 03:59:58PM -0300, Fabio Estevam wrote:
> There is no gpio functions used in the driver that is exported
> by the gpio.h header, so remove this unneeded header.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Applied, thank you.

> ---
>  drivers/input/touchscreen/wacom_i2c.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index f017af8c2aa3..1afc6bde2891 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -12,7 +12,6 @@
>  #include <linux/slab.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> -#include <linux/gpio.h>
>  #include <asm/unaligned.h>
>  
>  #define WACOM_CMD_QUERY0	0x04
> -- 
> 2.17.1
> 

-- 
Dmitry
