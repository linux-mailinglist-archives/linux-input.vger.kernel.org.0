Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F20D2C004A
	for <lists+linux-input@lfdr.de>; Mon, 23 Nov 2020 07:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgKWGs6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 Nov 2020 01:48:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgKWGs6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 Nov 2020 01:48:58 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8425CC0613CF
        for <linux-input@vger.kernel.org>; Sun, 22 Nov 2020 22:48:58 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id v21so7111713plo.12
        for <linux-input@vger.kernel.org>; Sun, 22 Nov 2020 22:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7va8iOKrlnt3K7b//Fm5ZLYQuZjDYYlsazxFh2lHQkc=;
        b=prfzHTtkzkaqq5JrH7NWdGIssXxWxDNaL1igOQLW2Pd6zsacTiXlLL91oyO4UXCApz
         8+ldCF6sHCfLmg8Vntvp/Upx7Q4eHAESyFNQZSUKNaN1unUU59JY8XtsQX3MW3vYIOaX
         OrvIsPPL5PIFK61rUl/r83ZixVi+Qevxf/FImipJ1VTa6OjkzyktjY6S4PMiRA4MxxuI
         y8fKpY5QQv8Sr1R2KJI04+h10wHMub2FPb+zPItcTh6KRWr4sizaxpBlPHPp59UHKERR
         rCBdOQRwFlRTK+0CG7K5T+1Q7Giq9PG3neUe1WfvPwC5t8ZtrTPFyu9CImpZalj3XUWH
         5rcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7va8iOKrlnt3K7b//Fm5ZLYQuZjDYYlsazxFh2lHQkc=;
        b=Co5F5oh7IjzE9VASDfRnTMUXD6/pCBd1Q9KEL+ONCJVDIKJat8MUipLx04rhf2yOYJ
         S6CaTFI/J8AKyOIrEtBnNgbLl+i9KQY/hveELlnNTF1UBA5Lk7dN0taYPIquY1YZ+5wh
         Q5k0c3OI9rBvOJXZ0jGgNY4Q4JXdV4Gzu8R4or8IW+/EVmJSUPFBlTVQE+HdPkTUGKzz
         Q9kYss8HQ4rmYvvM3AQx8a7cPfEWOJqrRls1jcT965BeDxPfFjWnFhHZorHOVXVZxwwn
         JX4ljLeFmdb8hvlfhX1x12NQOIyQ6kMiPKVKUVb2YQShAmfrfy9woihe2dCWKd6LRw9a
         diKw==
X-Gm-Message-State: AOAM531RXoW+tqjjtny+yL1aZWBpn4b13wFPiGH/Lru/FiZy5u3zHqKb
        2RK/qJBNXxYo4J4pd70u0uk=
X-Google-Smtp-Source: ABdhPJzKN3czuoPjNgmyylnme3mqlmujynvvEZk73Hrag3XP0VHjo5Ay80+W1DJ9lAVG1yISuDthtA==
X-Received: by 2002:a17:902:b717:b029:d9:e816:fd0b with SMTP id d23-20020a170902b717b02900d9e816fd0bmr11551347pls.50.1606114138068;
        Sun, 22 Nov 2020 22:48:58 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id v1sm12569997pjs.16.2020.11.22.22.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2020 22:48:57 -0800 (PST)
Date:   Sun, 22 Nov 2020 22:48:55 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nick Dyer <nick@shmanahar.org>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH 3/3 v2] Input: atmel_mxt_ts - Support regulator supplies
Message-ID: <20201123064855.GB2034289@dtor-ws>
References: <20201104153032.1387747-1-linus.walleij@linaro.org>
 <20201104153032.1387747-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104153032.1387747-3-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:30:32PM +0100, Linus Walleij wrote:
> This adds the code for the Atmel touchscreens such as
> mXT224 to obtain power regulators for the supply voltages
> AVDD and VDD. On mobile phones such as Samsung GT-I8190
> (Golden) this is needed to explicitly bring power online.
> 
> We just enable the regulators at probe() and disable
> them at remove() or in the errorpath for now.
> 
> As regulators are naturally stubbed if not available,
> this should have no impact on existing systems.
> 
> Cc: Nick Dyer <nick@shmanahar.org>
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
