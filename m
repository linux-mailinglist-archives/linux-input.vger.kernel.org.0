Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D124B7BF5
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 01:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244976AbiBPA3k (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Feb 2022 19:29:40 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244210AbiBPA3e (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Feb 2022 19:29:34 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC4EEF70E3
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 16:29:23 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id i10so718611plr.2
        for <linux-input@vger.kernel.org>; Tue, 15 Feb 2022 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8gRG2PlukAtl591DosSPjksGKZJdRAMUOJMz0R7ofH4=;
        b=AZJzykJRc/B/wQwGDOF8+10p8onYZhNGlfqmATgJJnazn1Vxoez1wVU/KgLgoFfi2V
         q7/VLxvFO6B6nCl8f1OM1P1dWN9X5cdLZgujn/6nexKn/tGn87b6hNl91POWWXhuXEc/
         ZyLFbRK6mvVztHEGH8GSi8k0VCde2r2MXPGaY/3oWRzQZlnXpp2FJlygnGQeM8m9If9D
         mQ0PlZvfRseKdx0V1DcPSaRgPyrrsTaxsrfZ2H7LIVJ22E2QF9hcwi0+vHFRieE0MCu5
         gAXTjXGh+KP6GR24lToDi3WCHXR/2bqfDoSgFMCmHzs0+EAx5G2Ig4bT/bRqXEgI1LTs
         xPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8gRG2PlukAtl591DosSPjksGKZJdRAMUOJMz0R7ofH4=;
        b=zcCy7//867YAFb/H2kQcP/rWf5poZEGlHV7wbxWKpMuH/qxZJERbTGyAQM2Nd17dPY
         r8eb0q14z3Ufks0XQz/SD7A4Ds6X5AxE7CoLrIo/6gGqHMarQ2dFZF/tENpotbMO7QiK
         A6MkAdg70bxmTi6yf6bPj0QoO1+tslp7CaX9JwsJjWzrVfy1lkSQVAphkEe/UcpgQ2Ep
         95YVnaGagU0TQ/n/d9ENfnjCRLLCGi5uAlReI9C346kW/5qyGNmNMWiU0YJP7Cs3Q3nW
         MmcbgGIHGsLlxUJDfhlbmJS6HfpROLVPMoh97/hcEyzhR/vi017Jsrq4WRRXEse6//Z3
         yiuQ==
X-Gm-Message-State: AOAM533pxTn3YuhHr4iOzzJoYzhEIHqx97L123xaevb24z6+VkE0G/qm
        tPDxyWaFQHtm4f71Bv/sMrg=
X-Google-Smtp-Source: ABdhPJyzzAdrg/5m5YzZ8G8Pn3CK4p9U3m1llaKhLpBm8ksoWwGCM6lJ+yXhqbvEirBkNeuDu1IEJg==
X-Received: by 2002:a17:902:f54d:: with SMTP id h13mr1624667plf.94.1644971363125;
        Tue, 15 Feb 2022 16:29:23 -0800 (PST)
Received: from google.com ([2620:15c:202:201:4e4a:b0ff:e926:40e2])
        by smtp.gmail.com with ESMTPSA id o125sm6874774pfb.116.2022.02.15.16.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 16:29:21 -0800 (PST)
Date:   Tue, 15 Feb 2022 16:29:19 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Nikita Travkin <nikita@trvn.ru>
Subject: Re: [PATCH v2] Input: zinitix - Add new compatible strings
Message-ID: <YgxFX5VvMFkCjTqk@google.com>
References: <20220214234033.1052681-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220214234033.1052681-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 15, 2022 at 12:40:33AM +0100, Linus Walleij wrote:
> This driver works just fine with the BT404 version of the touchscreen
> as well. Tested on the Samsung GT-I8160 (Codina) mobile phone.
> 
> Add all the new variants from the binding document so people can
> easily test them, we believe most of them work more or less.
> 
> Cc: Nikita Travkin <nikita@trvn.ru>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
