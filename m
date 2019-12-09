Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 294461177D5
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 21:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfLIUzo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 15:55:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33284 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726483AbfLIUzo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Dec 2019 15:55:44 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so7720225pgk.0
        for <linux-input@vger.kernel.org>; Mon, 09 Dec 2019 12:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cADxJVnUoV3/CYs6mlZcytBGrKUT6v8F+9De0N+ZbQ4=;
        b=G38QlEonTCbZ77UkBJ4yf5cvaMTZNNiAf9wfBifsurQ7ULbIYVa9Mq9MLXvlHQCTjt
         BL+cmITXf1bOz4unMnV/Pa9KxWEWfWbBPN6tlFbv5cZK6+xqAozesljsgEcqSJrJZwmr
         hDJFlRNmLFy8GxdagXVj5drkP9CnfaBgtPmgJ8s/fhBY+H3+TF5WfqbxYi88f+Gf1bUs
         8QYkCKfQJ+Nr61fu98LKA5r/KuS5ztGbWNXBHlD6LTsJGg8Stftkd3CTMlGjkJ4pnFkv
         NpUbLBJBgwfgvZJIBTmhwiG3ar1IZyAP6CeqRdxcwYksisyMyDaziMAc0f+ESm7btsTk
         VA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cADxJVnUoV3/CYs6mlZcytBGrKUT6v8F+9De0N+ZbQ4=;
        b=qdFeIgx4ITypxL5fLYdT8EPvuwyGrUIRn0y6puyG3tkFZMQZs6Ovb/1cri0OCBxiXm
         wm7HvvOhi5DSpbojSDkwLR34B1b66dq72XA+DPGrmVFH/MtPIxq3m9XWFy6hpxEGlvv6
         VWk0GUYTFs+uJHM3E/djBT4jcXalEzaRP4oUoAl6Y22ormuWH3kj6DePpWbu7SWJLVvj
         pWlnaI9v1fj/pmnjz3p/+wARkGLgzV8UHmW1RyTeJIfLcT7fY8DXT2qV1gbtt+fZwbXh
         wBLSbKFJnViSg09VzlubpYlSUt/xr2SrhMj0DhwUyQRMBRb7PmwcFb5Odzjpz8L6so3l
         koWg==
X-Gm-Message-State: APjAAAXdqpAyiMeDAQlKND/VdQioMrYu+blpHBf7+LG3CGvt2KPS6wc4
        Dam/CZ3qicbYuE9ui1gu0ExSGO3FWKk+5tED+gzYKA==
X-Google-Smtp-Source: APXvYqxhfCWhW/ylSziU+SAhjFBcrT9hZoKpHuKfFf9c+r14vZOL+ZmvdX3AR6YV9ukFakL3EJ76WXHGRuIa2uEbOi4=
X-Received: by 2002:a63:590e:: with SMTP id n14mr11564655pgb.10.1575924942967;
 Mon, 09 Dec 2019 12:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20191209203855.25500-1-natechancellor@gmail.com>
In-Reply-To: <20191209203855.25500-1-natechancellor@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 9 Dec 2019 12:55:32 -0800
Message-ID: <CAKwvOdkYrXehgFPFPeOLy5KKsS96d59DHE6JH+aEn57-avVA3Q@mail.gmail.com>
Subject: Re: [PATCH] HID: core: Adjust indentation in hid_add_device
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Dec 9, 2019 at 12:39 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang warns:
>
> ../drivers/hid/hid-core.c:2378:3: warning: misleading indentation;
> statement is not part of the previous 'if' [-Wmisleading-indentation]
>          if (!hdev->ll_driver->raw_request) {
>          ^
> ../drivers/hid/hid-core.c:2372:2: note: previous statement is here
>         if (hid_ignore(hdev))
>         ^
> 1 warning generated.
>
> This warning occurs because there is a space after the tab on this line.
> Remove it so that the indentation is consistent with the Linux kernel
> coding style and clang no longer warns.
>
> Fixes: 3c86726cfe38 ("HID: make .raw_request mandatory")
> Link: https://github.com/ClangBuiltLinux/linux/issues/793
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for taking the time to track down proper fixes tags.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  drivers/hid/hid-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> index e0b241bd3070..9c7f03f23eca 100644
> --- a/drivers/hid/hid-core.c
> +++ b/drivers/hid/hid-core.c
> @@ -2375,10 +2375,10 @@ int hid_add_device(struct hid_device *hdev)
>         /*
>          * Check for the mandatory transport channel.
>          */
> -        if (!hdev->ll_driver->raw_request) {
> +       if (!hdev->ll_driver->raw_request) {
>                 hid_err(hdev, "transport driver missing .raw_request()\n");
>                 return -EINVAL;
> -        }
> +       }
>
>         /*
>          * Read the device report descriptor once and use as template
> --
> 2.24.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20191209203855.25500-1-natechancellor%40gmail.com.



-- 
Thanks,
~Nick Desaulniers
