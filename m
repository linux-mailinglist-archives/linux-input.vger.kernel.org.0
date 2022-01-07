Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42288487E69
	for <lists+linux-input@lfdr.de>; Fri,  7 Jan 2022 22:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiAGVnl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jan 2022 16:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiAGVnk (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jan 2022 16:43:40 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C86C061574
        for <linux-input@vger.kernel.org>; Fri,  7 Jan 2022 13:43:40 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id c14-20020a17090a674e00b001b31e16749cso11783171pjm.4
        for <linux-input@vger.kernel.org>; Fri, 07 Jan 2022 13:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zVNbHgyrk8+e5YMt+i6ZzmdZ1ETOEmlcpvTEMmmQOCE=;
        b=ntNbgyUfuRewpC5CALimyfnbTzlByohM9u1b2iAtUtGkQ6QxdtRGWcsiZolOqmuJqG
         XXLrfTsEMcnHNwOm2lub/vzCzNCofpL0Q6q6HxV2BOgyy+B5wAE90xLkk9VvTcRCPI39
         S4bSHOt4oY8cQ6Ghhw8BvzRkDfG2D8RRMLHxvJFzy2LzUhrtro2j7KqcWsj15NBYhjIu
         om34SvEeL//cP+fYJC3xePMMGAqksdjOmEgsFXeCq90j7599Q0/Q4v9/I55iOe5DathF
         hZ9mzHzsgLsrkELRIMut6g130A5lykjuz1N39HPXgFKxVdN4DDux9SI0NDEn1JbVUT0W
         p1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zVNbHgyrk8+e5YMt+i6ZzmdZ1ETOEmlcpvTEMmmQOCE=;
        b=Iw9zmIBMtNRNwk4mJs4/UVRC8fthB66cJRm14HltcUaaNF04Y2/jZ7Dl3KRETXkiK8
         8xG1wC309yOc6lQrQm8LV/9oGgPQkowZ8A9zPSxSlUJG4cwA2ZGbFlJLsZoi1wEodC7u
         FHUfhCYLdOWNlVhILM8hq+L1FbUaQegsc9Fhw9EzKLyGZcdWgtvZCs3ZXit+3dgPt2OQ
         7T61XxjfwRJuSOUGTp4OOpbwAC4grIqutmhWmNYIfG97YHPeRW/Qcu414OPZKy67yVL1
         pqjIxjY+Oppnx4OtnodoA2RaOnKe94ORG34RwFjbNYl0G2/5COIvToCFjKT0jcXjIeee
         K2Vg==
X-Gm-Message-State: AOAM533c9+Uwu230BoVvZET5XsivNx0ba6WG6DM9UPbc5hUBP6pxa6AT
        DdcBexFXuTX2xcKemwobCI8=
X-Google-Smtp-Source: ABdhPJzS7yygmIuDWss3qOVh4/NdrnbpaRebEpWcNEsN5mRWV1ngbiz7yKqdQUJ5tdxaS1I7el/oDw==
X-Received: by 2002:a17:902:be0e:b0:149:512a:c2b3 with SMTP id r14-20020a170902be0e00b00149512ac2b3mr64787980pls.71.1641591820329;
        Fri, 07 Jan 2022 13:43:40 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4a85:a3d:72a9:2009])
        by smtp.gmail.com with ESMTPSA id hk13sm7156389pjb.35.2022.01.07.13.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 13:43:39 -0800 (PST)
Date:   Fri, 7 Jan 2022 13:43:37 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Angela Czubak <acz@semihalf.com>
Cc:     linux-input@vger.kernel.org, upstream@semihalf.com
Subject: Re: [PATCH 03/18] Input: add INPUT_PROP_HAPTIC_TOUCHPAD
Message-ID: <Ydi0CW1n3IZdmArN@google.com>
References: <20211221191743.1893185-1-acz@semihalf.com>
 <20211221191743.1893185-4-acz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221191743.1893185-4-acz@semihalf.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Dec 21, 2021 at 07:17:28PM +0000, Angela Czubak wrote:
> INPUT_PROP_HAPTIC_TOUCHPAD property is to be set for a device with simple
> haptic capabilities.

This needs to have corresponding documentation in
Documentation/input/event-codes.rst explaning the exact meaning of this
property as it was discussed in the forcepad email thread started by
Sean.

Thanks.

> 
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>  include/uapi/linux/input-event-codes.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 225ec87d4f22..df2ba5da4eaa 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -27,6 +27,7 @@
>  #define INPUT_PROP_TOPBUTTONPAD		0x04	/* softbuttons at top of pad */
>  #define INPUT_PROP_POINTING_STICK	0x05	/* is a pointing stick */
>  #define INPUT_PROP_ACCELEROMETER	0x06	/* has accelerometer */
> +#define INPUT_PROP_HAPTIC_TOUCHPAD	0x07	/* is a haptic touchpad */
>  
>  #define INPUT_PROP_MAX			0x1f
>  #define INPUT_PROP_CNT			(INPUT_PROP_MAX + 1)
> -- 
> 2.34.1.307.g9b7440fafd-goog
> 

-- 
Dmitry
