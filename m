Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A897DB288
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 18:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408431AbfJQQiF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 12:38:05 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34715 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729529AbfJQQiE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 12:38:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id k20so1679155pgi.1;
        Thu, 17 Oct 2019 09:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=88QrclS2PFOwVeOOMbkwV6zSODwwtRGUvBm1chNxLs8=;
        b=TwaisgwZAaA4qkGE53nYwB1lSxKA+G5+veH52439X8jBXHvU42UWL5rNHWFiqAHhcW
         5BnGuQpqNzbzSTXog9ToPGmAltHejjl9p2RoOG0Is4nQ/7Ijo7Ekcu5TPpPfATf7dIf9
         DlYDqBktz3hadccNsJV63v0y2sz7fYa7vVqzwr0DeWTriK0gj51qx6QZ7dFkbyYpfpNN
         CeHe46ypx+1EIJLtSFCWsFXFW4H467EQir5Cq2WCAlhjP1ljavEl7raRci4m0lMwrk7d
         hQ4OsDZH7x+9qJP2LVxuTinRLYQMqT7psF4ZtU0UMqBwCUX/T2Yh6lCXC6B9VhfEk0jA
         lllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=88QrclS2PFOwVeOOMbkwV6zSODwwtRGUvBm1chNxLs8=;
        b=tBxfqhiBHQ+jzYYBe78QYw+bBT1C68/esAXD+m7wiebhaFHdq5j9p/ijR7i3+pOldS
         PYzi5Rl82x6cC5XqKdKOyi+KzjMNE4SAEOC24e7IB1o/9BY6YBzGLYPgZ755nPJyo0L6
         zja0GEZev6YWHykETY0bKZoQEypdWUG7w+ALDUx4o37rgB75W3+B4dFtzjWTs1lZ7/01
         CMuW5BwN12kpmZRo0yCwUMnhkC3HPZipN267uacGQF1FVHI98/8ogxgxNadi3UvMvHkZ
         JwHSqo9Ohbg+hukvbBVYiUG2Ku1DswhSP0NvMaI3vff0Sl1hHtWaRY9aDOOMyuBuqGMv
         LEGA==
X-Gm-Message-State: APjAAAUCrM/yh0yJnz0+DrE1psPQ4FdUOBgQpX5MJ4t4uQyn8eEYT1sN
        gf24h1odBw1ixrMOa8AYapo=
X-Google-Smtp-Source: APXvYqwrSECf3n+OBbr/yGcHjAeSPsYpzfrGqnuKQdER8z/UtqkIihfEt0cGDtSbbSQ5BoRtG8M/rw==
X-Received: by 2002:a63:383:: with SMTP id 125mr5181681pgd.41.1571330282234;
        Thu, 17 Oct 2019 09:38:02 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y144sm3713581pfb.188.2019.10.17.09.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 09:38:01 -0700 (PDT)
Date:   Thu, 17 Oct 2019 09:37:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Mathew King <mathewk@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Rajat Jain <rajatja@google.com>,
        Sean Paul <seanpaul@chromium.org>,
        Jesse Barnes <jsbarnes@google.com>,
        Duncan Laurie <dlaurie@google.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH] input: Add privacy screen toggle keycode
Message-ID: <20191017163759.GI35946@dtor-ws>
References: <20191017163208.235518-1-mathewk@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017163208.235518-1-mathewk@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mathew,

On Thu, Oct 17, 2019 at 10:32:08AM -0600, Mathew King wrote:
> Add keycode for toggling electronic privacy screen to the keycodes
> definition. Some new laptops have a privacy screen which can be toggled
> with a key on the keyboard.

Has it made into HID spec yet?

> 
> Signed-off-by: Mathew King <mathewk@chromium.org>
> ---
>  include/uapi/linux/input-event-codes.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 85387c76c24f..05d8b4f4f82f 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -649,6 +649,8 @@
>   */
>  #define KEY_DATA			0x277
>  #define KEY_ONSCREEN_KEYBOARD		0x278
> +/* Electronic privacy screen control */
> +#define KEY_PRIVACY_SCREEN_TOGGLE	0x279
>  
>  #define BTN_TRIGGER_HAPPY		0x2c0
>  #define BTN_TRIGGER_HAPPY1		0x2c0
> -- 
> 2.23.0.700.g56cf767bdb-goog
> 

Thanks.

-- 
Dmitry
