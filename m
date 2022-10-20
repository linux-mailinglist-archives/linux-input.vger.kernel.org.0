Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 843FA6059DE
	for <lists+linux-input@lfdr.de>; Thu, 20 Oct 2022 10:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbiJTIdd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Oct 2022 04:33:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiJTIdZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Oct 2022 04:33:25 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDC318DD42
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 01:33:20 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1667142wmb.0
        for <linux-input@vger.kernel.org>; Thu, 20 Oct 2022 01:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8No91Jlr62TzzqqG4EX/7FEyIOABJR/Luu7N+fsFjr8=;
        b=kMV7arw3FQxfaczzkgEp3/SYzecH/x101eVMQHcCw4jW1if+tUYJ2cI+Vo9kz3g+8L
         vkzqIFVyteWNVErEGTBAkz6qmhPRbW9YphziunO///SmA2vTnR/6uK1cmvvdUveS4y7a
         2S3MEaVtKXnx2ZGYB1CYfEdjUS8j5GapXYCB0j+aHq9On0IoQj4H+cfo2sOCn5HS9phg
         5yHKRAYoZvFNBAZmlfTNHOu8eLY6GUP29tYWImu1pY8Y2vUwyXr5edSq09IisTT+oNZa
         Pkm5jcvV13Nk66NNvz4Zk5lyNcjsny/NEWlDGV0A9qqQCzX7SzQKYgDrtX+Ga/q53StG
         1sWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8No91Jlr62TzzqqG4EX/7FEyIOABJR/Luu7N+fsFjr8=;
        b=msBsjZC7Rz2/8HWaGY7FXbogjQcAA03/O7/5zNtVQyCUX/7pxGvwcU8MueR8gjxooh
         ZMfsd6SD9p3yDe0NdWi1D/wHu+lj6h1t5D46JUqWX2uzt/9u8SyBnI0sJbGdMp++Bhny
         8NteBe9xQqGmfdOw3YeSX7chBqJ+pc+ryHhNk7KtFIHCEGZ5/L8xhkwV2hKrOpBKFlUI
         8jJ+aLVabMzU62uveh+RJTZ2uLHMU52XjXSAfapMqhxereBHxOaHvX+foReJxtLdYI4W
         GlI5Gk1ygL9nh1c2Z+6qC7cndMqmA76pjvJWuM9wo+mWybN0WVGtjzd/zlJWfciXqDH9
         ALWA==
X-Gm-Message-State: ACrzQf0sv9aEOMGQCu95DzdpT89lgXhZleB4J5wr4d5bqFH+wqzQdviE
        8G4blvu8+twZlX2VXVtJSqXCNA==
X-Google-Smtp-Source: AMsMyM7xtCUDicS9AVRBxr/kOxnNo2jMiXOXtCv0qEiWNiYI4Stm+Ybr63U8IdF3BiFuBmhqGs5E6w==
X-Received: by 2002:a05:600c:314f:b0:3c6:f3fa:cfec with SMTP id h15-20020a05600c314f00b003c6f3facfecmr14834261wmo.68.1666254799058;
        Thu, 20 Oct 2022 01:33:19 -0700 (PDT)
Received: from localhost ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id p10-20020a05600c358a00b003bdd2add8fcsm2253725wmq.24.2022.10.20.01.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 01:33:18 -0700 (PDT)
From:   Mattijs Korpershoek <mkorpershoek@baylibre.com>
To:     wangjianli <wangjianli@cdjrlc.com>, dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        wangjianli <wangjianli@cdjrlc.com>
Subject: Re: [PATCH] input/serio: fix typo in comments
In-Reply-To: <20221019123049.26196-1-wangjianli@cdjrlc.com>
References: <20221019123049.26196-1-wangjianli@cdjrlc.com>
Date:   Thu, 20 Oct 2022 10:33:17 +0200
Message-ID: <87wn8u99o2.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 19, 2022 at 20:30, wangjianli <wangjianli@cdjrlc.com> wrote:

> Delete the redundant word 'in', and add a word it.
>
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
>  drivers/input/serio/q40kbd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/serio/q40kbd.c b/drivers/input/serio/q40kbd.c
> index bd248398556a..ebc9f9941be0 100644
> --- a/drivers/input/serio/q40kbd.c
> +++ b/drivers/input/serio/q40kbd.c
> @@ -81,7 +81,7 @@ static void q40kbd_stop(void)
>  
>  /*
>   * q40kbd_open() is called when a port is open by the higher layer.
> - * It allocates the interrupt and enables in in the chip.
> + * It allocates the interrupt and enables it in the chip.
>   */
>  
>  static int q40kbd_open(struct serio *port)
> -- 
> 2.36.1
