Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB1046E3F2
	for <lists+linux-input@lfdr.de>; Thu,  9 Dec 2021 09:16:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhLIIUY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Dec 2021 03:20:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbhLIIUY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Dec 2021 03:20:24 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C23C061746
        for <linux-input@vger.kernel.org>; Thu,  9 Dec 2021 00:16:51 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id v19so3315893plo.7
        for <linux-input@vger.kernel.org>; Thu, 09 Dec 2021 00:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=khxYs32YY02IUv6WnCSrPfJtjc2caB9TY/BopqTRIY0=;
        b=WQBcxsb3Q1xHr4S6b+zcsgI9bFx/+uHNXq15bkAScx4kElnG17wZXhPyVP9afbLxoo
         3WRTQKpJZwexXmJcpaBztxACFhYznxQc4qcK+E6tQtsgLSgL2z6USxpfciFhuPG1ijA2
         Xi9/Xrt2kXNnoXpTvNsN5+x4cbVgybd2qySoes0JTUyyWnkIZ5WYx34WKGUbGk8bWzKh
         xrFOijGQdWkBKNPRbq/Xygal1QL44sERFilVIfO52ncPGDQzX8rNn7HdnGX6zmwglyVv
         kIn6FUnhAi1GG3EkuqSj0pM2MNTHYNgNigBPSIJ7BqNbOhMhkOq/lyQ3S6TyOEarZ1ec
         CD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=khxYs32YY02IUv6WnCSrPfJtjc2caB9TY/BopqTRIY0=;
        b=Vul9Gfhruon5X7M0xrmMAusOEOVAyRMn4asxYA5BrG4c8uBOyMwSk0mm4rzNN8Uh0u
         Pz8eWpwRfROytjMCXO2MPCWQSFWYgbma8a6hU4Zs83N7GPUWUgjecw5pAyHdYRhVGcir
         FPD/xrK1pEL5YSP9u2H0LYgCVIOpxhO4Ij3Qu9WibU76q6d8zPjS0OpfLY9piEc6uGDQ
         ojRV3ZwER9MqJrP7WiVGkx5iTkDW9NpNr9djcoyWM3ezXbQ1tcLR6O3FAOuc6CX3oYrp
         ZzNoGlcm4RFInLyIAVdyf+TsJcEMBcYWMrqVEo2DXQO/tCWQzmyUNXJcDyz8HwTlWx8d
         dCRg==
X-Gm-Message-State: AOAM53087WV7UZzKQ89dNPRHO8qvEdo2I2r8ICDW2x1Eh8n4p4RljZNI
        8z/uLN2ZhJP39VpDThYImug=
X-Google-Smtp-Source: ABdhPJwyCBAHU79JzJC0XJnOF9fXh3epo6XfbRaho7+zpOEqoUjohqRX9jxwqYSIxgZEAgEsnX67fw==
X-Received: by 2002:a17:90a:690d:: with SMTP id r13mr13872011pjj.40.1639037810925;
        Thu, 09 Dec 2021 00:16:50 -0800 (PST)
Received: from google.com ([2620:15c:202:201:6d46:aa95:8d47:21f4])
        by smtp.gmail.com with ESMTPSA id n6sm5762778pfa.28.2021.12.09.00.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 00:16:49 -0800 (PST)
Date:   Thu, 9 Dec 2021 00:16:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] Input: goodix - Use the new soc_intel_is_byt()
 helper
Message-ID: <YbG7b59UtF3IeHNv@google.com>
References: <20211207100754.31155-1-hdegoede@redhat.com>
 <20211207100754.31155-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211207100754.31155-2-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 07, 2021 at 11:07:53AM +0100, Hans de Goede wrote:
> Use the new soc_intel_is_byt() helper from
> linux/platform_data/x86/soc.h.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/goodix.c | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> index 828487d9ded5..6e71d5c732af 100644
> --- a/drivers/input/touchscreen/goodix.c
> +++ b/drivers/input/touchscreen/goodix.c
> @@ -18,6 +18,7 @@
>  #include <linux/delay.h>
>  #include <linux/irq.h>
>  #include <linux/interrupt.h>
> +#include <linux/platform_data/x86/soc.h>

This header is not in 5.15 so we need to either wait or you need to land
thought your tree, hopefully there are no conflicts.

Thanks.

-- 
Dmitry
