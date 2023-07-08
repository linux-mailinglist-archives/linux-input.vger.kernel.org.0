Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6440274BA49
	for <lists+linux-input@lfdr.de>; Sat,  8 Jul 2023 02:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbjGHAA2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 20:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbjGHAA1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 20:00:27 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98462114
        for <linux-input@vger.kernel.org>; Fri,  7 Jul 2023 17:00:26 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1b06777596cso2323753fac.2
        for <linux-input@vger.kernel.org>; Fri, 07 Jul 2023 17:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688774426; x=1691366426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRIHdP8w8Nj2icgfJPSzIhNwqszF2qCX7ToYBJdxSvE=;
        b=ZYRksr6Go6v0caaKWQNkHvCzSAVsu09TiZx+vS6uvFcooaW1j07vc//uQUCyUDzRaG
         SaiHkjfbXOeL5wy6EdVTh0EWf6mg5icJUk9k4MJshWHN+8Pqc65ynnZxU376gFGj5xxy
         a6C9abBuX5uKAOQdCuJXCQKsrNolT0aosGtYAl/zxgnlGqu0ciwjUi4kmygsLzL264nx
         Z0JojksDwq3kXr5E8ek2yoeJZALIJPT8mFpY86dzNYld4hJBB40AaMNq3/BR8NT3zBek
         P1/jlmVMpsOrQLX5J+nSFy2Jo3P4IyY8XnmBLvQ54F/hl0EiOirRgvmQuP9CqL7B/UK0
         eKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688774426; x=1691366426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRIHdP8w8Nj2icgfJPSzIhNwqszF2qCX7ToYBJdxSvE=;
        b=HXVs7LBJe3PlVnDW3M5PELJCD6NITkOI74shFe+Xe2xI9TiOWC0VcCxR/hhTnYLDJu
         0RdroUPX6gmeZHV2mbslPqmRkRu4jc60oeqhsZiA2ePKh60dW/jSq0k+CPc20QVCxd44
         fY/foxUkRjGlyaVPz4JtGQcScO/q76a0W/OLFG5HfetUzDojsA8q31ddHxSuChBcwB/r
         r3stncdcwvnr/psBcSqzXPUorZ+5AYQiAtlYzSemysvKcxwRbMcxDx9m4dk+Ub3RGcvg
         wA8tJkWY5NvNGxcH+Rcb+z70Q+d1G2EWZZfVQsabh+yC5LSeG4LV0e2BX0bjQAYtM3nT
         Hi8w==
X-Gm-Message-State: ABy/qLYyYd1R8VIukHVdmFzJJXSGsotY3CWZfPlJoqkY3LFUPhF96bs1
        84D72KZguy3iu14EGjZq5Y+eVkvlouk=
X-Google-Smtp-Source: APBJJlEOCgY0O8nptSTvO1kQGEf9pB9+3dLXhP1zJ4PBnOUHmiPLdGWLX9ZRvwdtCZnADC//i35qVQ==
X-Received: by 2002:a05:6870:c225:b0:1b3:e04e:b5c7 with SMTP id z37-20020a056870c22500b001b3e04eb5c7mr7993163oae.42.1688774426048;
        Fri, 07 Jul 2023 17:00:26 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:38de:2bd4:8f55:60cd])
        by smtp.gmail.com with ESMTPSA id t8-20020a17090aae0800b00263f40cf83esm1989277pjq.47.2023.07.07.17.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 17:00:25 -0700 (PDT)
Date:   Fri, 7 Jul 2023 17:00:23 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     linux-input@vger.kernel.org, Sam Lantinga <slouken@libsdl.org>,
        Pavel Rojtberg <rojtberg@gmail.com>
Subject: Re: [PATCH 2/2] Input: xpad - Add GameSir VID for Xbox One
 controllers
Message-ID: <ZKinF8BmWlMCW9Fk@google.com>
References: <20230607012812.379640-1-vi@endrift.com>
 <20230607012812.379640-3-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607012812.379640-3-vi@endrift.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 06, 2023 at 06:28:12PM -0700, Vicki Pfau wrote:
> From: Sam Lantinga <slouken@libsdl.org>
> 
> Signed-off-by: Sam Lantinga <slouken@libsdl.org>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/input/joystick/xpad.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 745047215e42..459b5c507399 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -499,6 +499,7 @@ static const struct usb_device_id xpad_table[] = {
>  	XPAD_XBOXONE_VENDOR(0x2dc8),		/* 8BitDo Pro 2 Wired Controller for Xbox */
>  	XPAD_XBOXONE_VENDOR(0x2e24),		/* Hyperkin Duke Xbox One pad */
>  	XPAD_XBOX360_VENDOR(0x2f24),		/* GameSir controllers */
> +	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */

We try to keep this list sorted by vendor ID, so I moved this down and
applied.

>  	XPAD_XBOX360_VENDOR(0x31e3),		/* Wooting Keyboards */
>  	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
>  	{ }
> -- 
> 2.40.1
> 

Thanks.

-- 
Dmitry
