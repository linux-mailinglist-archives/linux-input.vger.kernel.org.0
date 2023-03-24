Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 695516C7503
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 02:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjCXB3X (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Mar 2023 21:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjCXB3W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Mar 2023 21:29:22 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76EE40C0
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:29:21 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id d10so244990pgt.12
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 18:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679621361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NG/G5rA1JHlJ8JxzACtySVd83fIvuA/cxUIW4RbIEqg=;
        b=LTTnAuhfN7MIyQtdhwPUJP2e4te07swAZCuUjKPaYYD1N844i13v9c4w1i4KLsnXXA
         bDH1KWD9Rwj0+WcCdffpMSDioiFpVbUtr/RHk4oVFYL1SDBrOiD0DoHjFzEPsq10K7Vw
         wEzka4z7ETMUoIwZmPKrQFDoKmjQA9ovsIJmFbUQk6bMrSog7IoK41VSXAyAtsbeS1ZO
         8qUURitXAb95TejzYzRYF0FxmzQZdFBgfuUHIJS7cyiYloUAwP/dDP+LWLoXx0jN/NOO
         XVhu5BnqM8vqrtYPflK744havHRdJQUvNAU1At/BOzenXIAb8EAs4L/YeoYikhHKC1LB
         VROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679621361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG/G5rA1JHlJ8JxzACtySVd83fIvuA/cxUIW4RbIEqg=;
        b=IZkFhtszZNPNwLJc/1D2vndv1etaBpR7hr1y48TQZs/Q3B7WwS6nfeP3SkGEm87f5F
         NfFeMD1I9Tm9G5nuRWlqFlpwFVd6O+33Pf/cjur3KkT20DVr1HvvFkcGiXbYzQxIfnpC
         /klDGvdMpXCGZ2zJPbdAxkqD0XAo2GMqFiX5b10tbLOLaDDIwMEZbYwsN5JQ9/qe1Uk9
         fRtdPbRG3a4wmrYpVVjwUBjL0wr2kYowQxJ7DcJCAaES7hAXLmfT0P3CRoZp9dz6Y/Wp
         UdyoyQfStG/YU0fKNo/8GNgrW+5edRD8c/iJLpdEkXaISczwjGCGOtq3TuS5hrE6yyk8
         YWXA==
X-Gm-Message-State: AAQBX9f8llhdAKsvxZg2irgGqT/+ILCzsCwukXTk7XBjEw7pCEHXzskD
        5zcaPxksoWx6Sw0Yzfsqx08=
X-Google-Smtp-Source: AKy350aWsUTn3/ACeDUrIdqS2tERKfE7PefGH3eL7DgPGCEE9zdFgj2lNvq/6paXz6OM0wj7GMBFAA==
X-Received: by 2002:a62:8401:0:b0:628:1852:8431 with SMTP id k1-20020a628401000000b0062818528431mr1249878pfd.30.1679621361230;
        Thu, 23 Mar 2023 18:29:21 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:f5e9:5a97:54ee:6f66])
        by smtp.gmail.com with ESMTPSA id v22-20020a62a516000000b0058bc7453285sm12518601pfm.217.2023.03.23.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 18:29:20 -0700 (PDT)
Date:   Thu, 23 Mar 2023 18:29:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 2/3] Input: xpad - fix PowerA EnWired Controller guide
 button
Message-ID: <ZBz87SvlSKWyVEUZ@google.com>
References: <20230203022758.3982393-1-vi@endrift.com>
 <20230203022758.3982393-2-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230203022758.3982393-2-vi@endrift.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Feb 02, 2023 at 06:27:57PM -0800, Vicki Pfau wrote:
> This commit explicitly disables the audio interface the same way the official
> driver does. This is needed for some controllers, such as the PowerA Enhanced
> Wired Controller for Series X|S (0x20d6:0x200e) to report the guide button.
> 
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index bb65c8268963..16bc3cd4c2b7 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -1390,6 +1390,13 @@ static int xpad_start_xbox_one(struct usb_xpad *xpad)
>  	unsigned long flags;
>  	int retval;
>  
> +	/* Explicitly disable the audio interface. This is needed for some
> +	 * controllers, such as the PowerA Enhanced Wired Controller
> +	 * for Series X|S (0x20d6:0x200e) to report the guide button */

Is it guaranteed that there is 2nd interface? Is it always the audio
interface?

> +	retval = usb_set_interface(xpad->udev, 1, 0);
> +	if (retval)
> +		return retval;
> +
>  	spin_lock_irqsave(&xpad->odata_lock, flags);
>  
>  	/*
> -- 
> 2.39.1
> 

Thanks.

-- 
Dmitry
