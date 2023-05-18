Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01CEF7086AE
	for <lists+linux-input@lfdr.de>; Thu, 18 May 2023 19:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjERRWX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 May 2023 13:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbjERRWV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 May 2023 13:22:21 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7377210C6
        for <linux-input@vger.kernel.org>; Thu, 18 May 2023 10:22:17 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-331430faba8so6134315ab.3
        for <linux-input@vger.kernel.org>; Thu, 18 May 2023 10:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684430537; x=1687022537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P5a2wI1V2krLoc2oF7CZW7cpXkFwJvYuHvRdWhIKbTc=;
        b=ipr7syLJwwQeUwFaCNusUM+A9CdYg0Fqil/Z3knRuyPSy84hWRYGy5PJODlUAGER+j
         77hx09aTZL7+OFSEsEj3l2UxH8f+vGoS3kJAX+MkpExqFcKPEF8jK9xlPsbYpdPyb0uA
         Hmq3k+oCifj/Pkbt/CDlxgKRngYnB1i6YP16w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684430537; x=1687022537;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5a2wI1V2krLoc2oF7CZW7cpXkFwJvYuHvRdWhIKbTc=;
        b=FkiVf8NifpcvE76JSBjiilQ35Qk4j8agqHUh13OUQ68kcQxRbRCt4fk0W1jxgUffBy
         8ESUTGvek0cYzCW9OXQY6mr+HLTGXymROgDSUNXOR2XC/FbkEg+nOVPOSrpYbRUiML1G
         5sJiVlLHWNv7Y1XjQDkbcYJgQRWnh+1A6TV7f94JYHh+/mWtAS3dJ6kR31jDdbw30u+y
         U9UwSaXsO7ylf6mcKDOCq0IuudYTGrfkrTS6pcoePNwerQke0kf9HZISJ6bHAuI+vEG4
         /4fbiW8AWPgfMq98Lirm7hsAwcjERBANlfKBQo6fHK+IotHiCJRDAoj6uUmmUcMVBu6o
         TFZw==
X-Gm-Message-State: AC+VfDyujZREj8ljYpV7kVu9CJrBWa2YMyrUp2fBohRpF92TbeRgT32S
        SN7XXgxn0+Ayocu8qFP1YbL/E8gEgKGknXGrys02rQ==
X-Google-Smtp-Source: ACHHUZ60P76B2UzzbBK193S6gb6OmCgSJ+O/0JW5zVfK+OxNhkR0td6SUVsLemXmPqSu1/WFqahGuQ==
X-Received: by 2002:a92:d5c1:0:b0:335:56cb:a3a with SMTP id d1-20020a92d5c1000000b0033556cb0a3amr4754220ilq.16.1684430536831;
        Thu, 18 May 2023 10:22:16 -0700 (PDT)
Received: from google.com (h24-56-189-219.arvdco.broadband.dynamic.tds.net. [24.56.189.219])
        by smtp.gmail.com with ESMTPSA id bp19-20020a056638441300b00411be337516sm605398jab.24.2023.05.18.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 10:22:16 -0700 (PDT)
Date:   Thu, 18 May 2023 11:22:14 -0600
From:   Raul E Rangel <rrangel@chromium.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] Input: libps2 - fix aborting PS/2 commands
Message-ID: <ZGZexnCoFLG6J8ob@google.com>
References: <20230511185252.386941-1-dmitry.torokhov@gmail.com>
 <20230511185252.386941-6-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230511185252.386941-6-dmitry.torokhov@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, May 11, 2023 at 11:52:45AM -0700, Dmitry Torokhov wrote:
> When aborting PS/2 command the kernel should [re]set all flags before
> waking up waiters, otherwise waiting thread may read obsolete values
> of flags.
> 
> Reported-by: Raul Rangel <rrangel@chromium.org>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/serio/libps2.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/serio/libps2.c b/drivers/input/serio/libps2.c
> index 14b70a78875d..09eb605364bb 100644
> --- a/drivers/input/serio/libps2.c
> +++ b/drivers/input/serio/libps2.c
> @@ -478,15 +478,22 @@ bool ps2_handle_response(struct ps2dev *ps2dev, u8 data)
>  }
>  EXPORT_SYMBOL(ps2_handle_response);
>  
> +/*
> + * Clears state of PS/2 device after communication error by resetting majority
> + * of flags and waking up waiters, if any.
> + */
>  void ps2_cmd_aborted(struct ps2dev *ps2dev)
>  {
> -	if (ps2dev->flags & PS2_FLAG_ACK)
> +	unsigned long old_flags = ps2dev->flags;
> +
> +	/* reset all flags except last nak */
> +	ps2dev->flags &= PS2_FLAG_NAK;
> +
> +	if (old_flags & PS2_FLAG_ACK)
>  		ps2dev->nak = 1;
>  
> -	if (ps2dev->flags & (PS2_FLAG_ACK | PS2_FLAG_CMD))
> +	if (old_flags & (PS2_FLAG_ACK | PS2_FLAG_CMD))
>  		wake_up(&ps2dev->wait);
>  
> -	/* reset all flags except last nack */
> -	ps2dev->flags &= PS2_FLAG_NAK;
>  }
>  EXPORT_SYMBOL(ps2_cmd_aborted);
Reviewed-by: Raul E Rangel <rrangel@chromium.org>
