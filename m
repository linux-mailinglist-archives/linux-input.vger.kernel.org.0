Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF57B52C592
	for <lists+linux-input@lfdr.de>; Wed, 18 May 2022 23:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243191AbiERVcp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 May 2022 17:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243183AbiERVco (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 May 2022 17:32:44 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E2DFD35B
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 14:32:43 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o13-20020a17090a9f8d00b001df3fc52ea7so6845487pjp.3
        for <linux-input@vger.kernel.org>; Wed, 18 May 2022 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DT+tYPfYOUtrB8Y0L0z1BIge7j2ivbQ9PLEJwaW/Hs4=;
        b=gImrHxSbksqehv7brianuLb+siLYiValSbI0XnynjfB8cqNvMUFHg0wb/nf3FkAVbC
         JJ3OqO52oILIY7EyjnR+kTjYBWoMgMsvguCGXk5XCipBGt4AsNELrbc2CaAqS0xSjF/U
         jtrv63bxgX2oYnwIoDy9CbwgLEgAzR/6gwwj6vB6HtHGLC3ZNcOqQpo70meH8IKzNaNm
         w44aSJHAIBLzXtZ41FTtj1lWsf5QpD10wqL5r/+atUF6ej7v1k33Lnm6XUrF1DXsbow0
         UvaIspPpuTIaG204NxFTgbtcgCMw1Oo9Bc3o8hVPBh2xxnq43/vqOBK+VRKAokXPUN6U
         65Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DT+tYPfYOUtrB8Y0L0z1BIge7j2ivbQ9PLEJwaW/Hs4=;
        b=0Tc1pD6JtXp36mXkXU8YyPseIo/Rvxh9E8MNxL5RYPYH6oeY0p+Yd82JzJPvxqnkuV
         lkDmEXW/3xwVEO+yQXxnIX55uD5j1ZetPqG5eF35NETWUoZDZuN4775dLDi6Sg+ibiR/
         QLBX/lvaliN63VzkESgwfdiJxtO0+8U7v6NQe9fygFGc+Di7JDFyo6gi5tuyQLgE3Z2H
         kvZVMg82F73KMYsXBRDwKfFTMbM+iGm7N5h+LN6b8En8fKezpotOSw2m2NaFThBYkksm
         epOckd00z9nF3HeM+knzOkKsOm/K8l9gUD8CK1pD6EJeU6rg+5Te5EKs0u9OO3AdM6P1
         35VQ==
X-Gm-Message-State: AOAM531qwmwFvUfDBPMEEdE/CguvU2Y8moPYIDmz9cBnogLchglB26Y2
        e/8WXpNVV1/b0MutS3bGHVc=
X-Google-Smtp-Source: ABdhPJykFRkca5bEzbuW5H3PFfeB1TbN3oKDVF31zNB+hMgjBpAqCbmFBhO8+bRzexbLgjaQRReEsA==
X-Received: by 2002:a17:90a:1b6c:b0:1df:6940:e856 with SMTP id q99-20020a17090a1b6c00b001df6940e856mr2061218pjq.240.1652909563242;
        Wed, 18 May 2022 14:32:43 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:1a53:727c:6847:3659])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902684e00b0015f300ed0b7sm2192886pln.76.2022.05.18.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 14:32:42 -0700 (PDT)
Date:   Wed, 18 May 2022 14:32:40 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: ili210x - Use one common reset implementation
Message-ID: <YoVl+ItaXcnqZasS@google.com>
References: <20220518210423.106555-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220518210423.106555-1-marex@denx.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, May 18, 2022 at 11:04:23PM +0200, Marek Vasut wrote:
> Rename ili251x_hardware_reset() to ili210x_hardware_reset(), change its
> parameter from struct device * to struct gpio_desc *, and use it as one
> single consistent reset implementation all over the driver. Also increase
> the minimum reset duration to 12ms, to make sure the reset is really
> within the spec.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied, thank you.

-- 
Dmitry
