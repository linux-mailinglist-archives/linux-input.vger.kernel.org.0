Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D68A429E38
	for <lists+linux-input@lfdr.de>; Tue, 12 Oct 2021 08:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232667AbhJLHAk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Oct 2021 03:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232499AbhJLHAj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Oct 2021 03:00:39 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A85BC061570;
        Mon, 11 Oct 2021 23:58:38 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id o20so63439052wro.3;
        Mon, 11 Oct 2021 23:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bg6lNHmeKOpJXeIiSb+VjW+H8cWSnozAwzSA/SSRX50=;
        b=ImJxeCkowEk8w2VTqnpcKXGXpnwB8DN1ba9G+xkEfTcgraL8E8ndoqrGOq4lkB6VcJ
         WY8QHEDJqbwxc/HI1/D8CxMADsOZqpgcW7zC7RRaVn6PAj0jKo6V6J2/pvWdY+jgtcpy
         fiXfsl//+M0Dw3qlFoczXz89jVTImyqFm7Xgqlei2Se2E1ScRLri/pEZbDbgCw9ov4Jz
         YYbdgqyx65eNNFQcz2ZKzkvshk4zPpnJxCEHntko6gbT6Yl2vUrvg1+9Q0CneX6JclUC
         8PqcMcApUKSP5+eeVsmtQx+3WP7bJOCBAGj4zE5T4vqpRYUfXhrL1mH3yKKsTBoFPWs8
         kgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bg6lNHmeKOpJXeIiSb+VjW+H8cWSnozAwzSA/SSRX50=;
        b=nrvbY1i8IbjsNKA235FxrTsXR87nOq5VjXI0oUuFuT8KnrAj5fHpdo7oajxCTYdmpy
         8YHYWstobQ6nRX0NHh0Ry1dRSp6nGAz3QqQocrofxnNazxEDaGSBoFWdSLXve3dEiiwB
         tSlM+x7pOjFxUIfsr4NvIJdmL3FCVAHHhy8EnXwni9Jk4V2dszSWzMUD+8NxD6z1eblU
         Dk2kL/7g/vbmrjlKUkW/DCHvhScyGou1Aq1afuVlKCcyxHQoPQ0VxfVnRGQe1N4jorU+
         hOHaEXOVlvdSrT70a1LHVYstlEWKgrbUC7/xTw0I6qrV3CsJ1DzfHouNR9Y0VEEqlgLo
         InbA==
X-Gm-Message-State: AOAM531t0Yb42akYsli1uqjTSxqc88OKxlEUK+CnRED50XJfRhF89K7Z
        aaFPtCIgZ21s08KIQaxxfBhr19wErLE=
X-Google-Smtp-Source: ABdhPJwQ8QnSmiV97Fj1Sy0gQc2+UrX2b1ojpaDeJCUwcm+BdW35CcKojXk8x1EL1Xc4I89Q+W6FRw==
X-Received: by 2002:adf:d1c3:: with SMTP id b3mr13284433wrd.237.1634021916906;
        Mon, 11 Oct 2021 23:58:36 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id l21sm1620499wmh.31.2021.10.11.23.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 23:58:36 -0700 (PDT)
Message-ID: <6b0d2338e7b8a1e1f86bd4565182377255f27729.camel@gmail.com>
Subject: Re: [PATCH 2/4] Input: ep93xx_keypad - use BIT() and GENMASK()
 macros
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Date:   Tue, 12 Oct 2021 08:58:35 +0200
In-Reply-To: <20211012013735.3523140-2-dmitry.torokhov@gmail.com>
References: <20211012013735.3523140-1-dmitry.torokhov@gmail.com>
         <20211012013735.3523140-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi!

On Mon, 2021-10-11 at 18:37 -0700, Dmitry Torokhov wrote:
> Also drop parenthesis around macros that do not use expressions as they are
> not needed.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
>  drivers/input/keyboard/ep93xx_keypad.c | 37 +++++++++++++-------------
>  1 file changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/input/keyboard/ep93xx_keypad.c b/drivers/input/keyboard/ep93xx_keypad.c
> index a0c6cdf8e0d3..6be5474ba2f2 100644
> --- a/drivers/input/keyboard/ep93xx_keypad.c
> +++ b/drivers/input/keyboard/ep93xx_keypad.c
> @@ -17,6 +17,7 @@
>   * flag.
>   */
>  
> +#include <linux/bits.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/interrupt.h>
> @@ -35,28 +36,28 @@
>  #define KEY_REG                        0x08    /* Key Value Capture register */
>  
>  /* Key Scan Initialization Register bit defines */
> -#define KEY_INIT_DBNC_MASK     (0x00ff0000)
> -#define KEY_INIT_DBNC_SHIFT    (16)
> -#define KEY_INIT_DIS3KY                (1<<15)
> -#define KEY_INIT_DIAG          (1<<14)
> -#define KEY_INIT_BACK          (1<<13)
> -#define KEY_INIT_T2            (1<<12)
> -#define KEY_INIT_PRSCL_MASK    (0x000003ff)
> -#define KEY_INIT_PRSCL_SHIFT   (0)
> +#define KEY_INIT_DBNC_MASK     GENMASK(23, 16)
> +#define KEY_INIT_DBNC_SHIFT    16
> +#define KEY_INIT_DIS3KY                BIT(15)
> +#define KEY_INIT_DIAG          BIT(14)
> +#define KEY_INIT_BACK          BIT(13)
> +#define KEY_INIT_T2            BIT(12)
> +#define KEY_INIT_PRSCL_MASK    GENMASK(9, 0)
> +#define KEY_INIT_PRSCL_SHIFT   0
>  
>  /* Key Scan Diagnostic Register bit defines */
> -#define KEY_DIAG_MASK          (0x0000003f)
> -#define KEY_DIAG_SHIFT         (0)
> +#define KEY_DIAG_MASK          GENMASK(5, 0)
> +#define KEY_DIAG_SHIFT         0
>  
>  /* Key Value Capture Register bit defines */
> -#define KEY_REG_K              (1<<15)
> -#define KEY_REG_INT            (1<<14)
> -#define KEY_REG_2KEYS          (1<<13)
> -#define KEY_REG_1KEY           (1<<12)
> -#define KEY_REG_KEY2_MASK      (0x00000fc0)
> -#define KEY_REG_KEY2_SHIFT     (6)
> -#define KEY_REG_KEY1_MASK      (0x0000003f)
> -#define KEY_REG_KEY1_SHIFT     (0)
> +#define KEY_REG_K              BIT(15)
> +#define KEY_REG_INT            BIT(14)
> +#define KEY_REG_2KEYS          BIT(13)
> +#define KEY_REG_1KEY           BIT(12)
> +#define KEY_REG_KEY2_MASK      GENMASK(11, 6)
> +#define KEY_REG_KEY2_SHIFT     6
> +#define KEY_REG_KEY1_MASK      GENMASK(5, 0)
> +#define KEY_REG_KEY1_SHIFT     0
>  
>  #define EP93XX_MATRIX_SIZE     (EP93XX_MATRIX_ROWS * EP93XX_MATRIX_COLS)
>  

-- 
Alexander Sverdlin.


