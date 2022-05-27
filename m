Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA1A25358E2
	for <lists+linux-input@lfdr.de>; Fri, 27 May 2022 07:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243509AbiE0FtE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 01:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235470AbiE0FtE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 01:49:04 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C18D4B481
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:49:03 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id c14so3514478pfn.2
        for <linux-input@vger.kernel.org>; Thu, 26 May 2022 22:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bQd/n+1o8B3UHTSm1plWmKDkQYRF32fvn9NiUWpmwCg=;
        b=Ss73XLbSXQeyy1e3gKfMdhUsALA+G6uqlwyhKOj6Aq29yZSzUzLLgGx3/6BSDPu+yJ
         kQQwGgwSgsaC774FM7Wj+DEoIcn/33FIlGCKuj/Zi1qoP154ZbZbxfsaLAi4ZLiIDWgj
         C0EtJqSnkaJ8euwdop3iIlT01BuMRORvKm0eXpHgs+PfVVm9kmYqdS4YoOIiyudspsGR
         dRbyzZr4zhvJO3uYmP9+BEb/9JTyVS6bOgmQwGiNSG5qP+vckIhx8XHUtbmg2d9Hp5z8
         CysvBL9gS+bStq0zArlmpd65bV1zGGv2Hj6Zqp+l65vUAiXtjAaxVEpH0e+usb7reHVz
         W2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bQd/n+1o8B3UHTSm1plWmKDkQYRF32fvn9NiUWpmwCg=;
        b=dzFYiHCPflYICrLQ3vkxeMzvuNnlCjK0ZDBteybyEQvYrFxkyy926Ncnq2tzJFlB1n
         Au54SfItnSrlC8BPWJNO72OHgrOWbBR9ThtePPKbuxMQcdU8Il2qQ0lt5b2RX7Pw/s7N
         1Ivwn16lz9le+31ReiZYfmWJL5I3IswhMZGbi9b1ZhUjb27hrAszLUEBimi0erA6VrlR
         yHlLQvSOHpIU/m9ZISUMOXfBYmcke5bnN6+43mrzNPwNwk9ksaMy738BKRt9dR6UFJrz
         KyNa8bLfo4vxg8gRegMz9h5KSk6iXqKucU6WgGvnS2WV/VWuJlQ582GDqCmj37oyuQCA
         aUIg==
X-Gm-Message-State: AOAM531Dp1b+5oER8NZ2uRA4hmaI46cb4MawY3EYub8As15BFed7p69h
        ipXJeXJJyOc5V78Gx2iwDraRHrzleK8=
X-Google-Smtp-Source: ABdhPJy2Sc18ZN0Zab7Ntxrla306BLl+C5bil0RTlEjodvQQDykKwc5hAzIVt9JdWH/wGxwl4Y/AlQ==
X-Received: by 2002:a63:e74b:0:b0:3f2:8892:b1f4 with SMTP id j11-20020a63e74b000000b003f28892b1f4mr36847151pgk.104.1653630543235;
        Thu, 26 May 2022 22:49:03 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:3206:ea0b:ce53:ea86])
        by smtp.gmail.com with ESMTPSA id s22-20020a056a001c5600b0050dc7628140sm2496013pfw.26.2022.05.26.22.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 22:49:01 -0700 (PDT)
Date:   Thu, 26 May 2022 22:48:59 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>,
        Michael Srba <Michael.Srba@seznam.cz>
Subject: Re: [PATCH 3/5] Input: zinitix - Rename defines ZINITIX_*
Message-ID: <YpBmS/JkYZinMSN+@google.com>
References: <20220410120059.2583849-1-linus.walleij@linaro.org>
 <20220410120059.2583849-3-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220410120059.2583849-3-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 10, 2022 at 02:00:57PM +0200, Linus Walleij wrote:
> The defines are sometimes named BT541_* and sometimes
> ZINITIX_*, name them all ZINITIX_* because they certainly
> apply to a lot more touchscreens than the BT541.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I'll apply this, thank you.

-- 
Dmitry
