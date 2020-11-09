Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A1F2AB121
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:16:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729358AbgKIGQj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbgKIGQj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:16:39 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F892C0613CF;
        Sun,  8 Nov 2020 22:16:39 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w6so1619485pfu.1;
        Sun, 08 Nov 2020 22:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=niiGsXpoZF6ynrCvv9mZ/pqnLT+BcVeXFRaGSuCBYiY=;
        b=oU3l5rtfYO4dz4+dZfyytrZGhvDuqpPa7AY967RNhxWgmRjMcqJJstKHPDmq7H23Lx
         ghy7Ecq0poVWC6kpEAmolemktPmJqMU1d4PDqFqz6UPW5i1RWXLv+R2LoSiXkNXN+xe1
         bC/0H/h+ONLUW5K+fly/KHVILr2sNsQfekUFIruOWGv6fC8POWA7hfeos4ZLu+XvVes+
         jNFE928pkFts5HDjGDQQJS7qNJT59ohCkC8vDY0JHI+tqGjLGVwVtAZKZG43HABhjjvn
         m8oZ3Kwtpid4k+enW2CLQn3J+R2DFnD884UVCiPnasPXp2q9L0MCemhV5ltY11Rp2BA/
         FEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=niiGsXpoZF6ynrCvv9mZ/pqnLT+BcVeXFRaGSuCBYiY=;
        b=AyLT3UW1f5qGfXVSZUX/q7YBRWX7og88OkKcG3MaqgXB3qLPRgDQWnZAMGb2UVm5+i
         VmXStZOlduHA9oGe9YW+2/ngZ0Z4kvU58tF2NqJRXxco+MKwmJ928kkmjHEosQmIsMoF
         wr5JRkOUZKPYi/x7umTeCaZJVx6Ibc3QRCpp/1czqmjh2CNmk2G/MzlhAOFIceecr/u4
         V1ZIi9CG5ZGXnbN+ycDWxwT9kMVbGz+LhaKRLKiWBEBFIgNJ5ss0A9Nq0nE1rSYLGuGa
         E3AjBv+0ARE9siwDMV9KU38DYBEXINE+fXa05KfjK95NNdrwYpynQsK7armWC32e104U
         Igkw==
X-Gm-Message-State: AOAM531cts2uPm8fgDDwx+CCXB0obMoamrfjtzFQ5xhLQWYKdcmPEAUL
        TE4pwsbOw3nyBrKmkKxhjsw=
X-Google-Smtp-Source: ABdhPJwytFJ/1/DZaM3G07BdzX6clBbvK2S5KczzuZQTLXW7O4qCBJ/2p4KnidbLQkYxt3orBzLY4w==
X-Received: by 2002:aa7:82d8:0:b029:160:947:a852 with SMTP id f24-20020aa782d80000b02901600947a852mr12395569pfn.67.1604902599185;
        Sun, 08 Nov 2020 22:16:39 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id j13sm9677612pfd.97.2020.11.08.22.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:16:38 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:16:36 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 17/20] input: misc: drv2665: Fix formatting expected by
 kernel-doc
Message-ID: <20201109061636.GJ1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-18-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-18-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:24PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'input_dev' not described in 'drv2665_data'
>  drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'client' not described in 'drv2665_data'
>  drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'regmap' not described in 'drv2665_data'
>  drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'work' not described in 'drv2665_data'
>  drivers/input/misc/drv2665.c:59: warning: Function parameter or member 'regulator' not described in 'drv2665_data'
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Dan Murphy <dmurphy@ti.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
