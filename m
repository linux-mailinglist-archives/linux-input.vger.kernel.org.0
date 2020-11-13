Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC332B168D
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 08:37:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbgKMHhK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 Nov 2020 02:37:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgKMHhK (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 Nov 2020 02:37:10 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74434C0613D1;
        Thu, 12 Nov 2020 23:37:10 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r186so6447821pgr.0;
        Thu, 12 Nov 2020 23:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=aTIjvq+NpQ/OwR3CubBlRwxJK7UaVaAYUnhWk8stckI=;
        b=QV6HzlfvpT93ga6OOJSOfCDyXi9JwP/4Gz/MESEby+UYVEGEtct1YiEFg3qpvdNIH+
         xYWAfci+xH1jPLP8uAmRLeBguBLFc7u0XFnpPUAH/Isvm7LC2YTk5LtVUN6Y+gbnfwp+
         JFTK6UXDTEp3aN7BTiD9hDGjiDDumSz0ni8U+piEagCbvdvreNOnqNGLseoTmXaAUitz
         ot5IVYGH9y8x07FqBdeCT1q4e+VWHeP1YbR1Bz6qj7NGoM0WRMUn5l8+DKCVkFB2go2l
         25sXGaqnYWvXmzFLpQWL38GYuRpildTHCaMFTmsHqAUjSrEisdaUsGS3xe6fVTnf5l8q
         SJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=aTIjvq+NpQ/OwR3CubBlRwxJK7UaVaAYUnhWk8stckI=;
        b=FiqD8/zTh3Ptpadxj/+JDsm54zKW5aXV04fovOYccLSeJC8yqTxdvecUb2jYpzenxQ
         HnJvlW5bagZQyh+nhm7KHq/EfmB7rPAjHaOc0bzpmo9RW9a0yOBHSKI5IW/ZI4ted72j
         7a9p87GhEYZtzjVaX3rgMXl/8df1FwB6coeQg9FwrY7stMe0GesiQEBP2zr/WdZwvCDd
         m8fL7ThqCu6/eWcnUcLhzJBQDPkEtImCeFCTFE414dyC3SkWu/Ae4R4YNsCOSWPGAlxm
         NbVvkJX5394VKL0/zzs0XtGM6rjh71vFwgMPHbGkxd0yOqjiorrGxjzBsIF545AeamgG
         SbQQ==
X-Gm-Message-State: AOAM5330p8gWbvH7km5MCgBuAq6LGRgj03vNXRDltxHP1nhl+mgFIh6q
        Q4fPOFiyuRQhenMus0AnEh8=
X-Google-Smtp-Source: ABdhPJx6G6cfwXcMZccNXeSnBdwzf2TIX/uRLwmtgctOjlS4DLz7A9+XdmHId70+tnmjhYu64zVeMw==
X-Received: by 2002:a62:256:0:b029:18c:6905:d18d with SMTP id 83-20020a6202560000b029018c6905d18dmr918394pfc.67.1605253030004;
        Thu, 12 Nov 2020 23:37:10 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id ce19sm11048544pjb.53.2020.11.12.23.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 23:37:09 -0800 (PST)
Date:   Thu, 12 Nov 2020 23:37:07 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Donghwa Lee <dh09.lee@samsung.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 02/15] input: keyboard: samsung-keypad: Remove set but
 unused variable 'var'
Message-ID: <20201113073707.GG356503@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-3-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201112110204.2083435-3-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:51AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/keyboard/samsung-keypad.c: In function ‘samsung_keypad_irq’:
>  drivers/input/keyboard/samsung-keypad.c:149:15: warning: variable ‘val’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Donghwa Lee <dh09.lee@samsung.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
