Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEA46346B1D
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 22:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233572AbhCWVdm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 17:33:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233464AbhCWVdU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 17:33:20 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64259C061574;
        Tue, 23 Mar 2021 14:33:20 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id ot17-20020a17090b3b51b0290109c9ac3c34so69153pjb.4;
        Tue, 23 Mar 2021 14:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rvofdCHxCvwcpYzvV4ThQ9tW1dE3FsuCFAAVo7LtDxM=;
        b=CYE5Y74+IrbPB/cTc6+L56Vy+Ekl+fDZFsbbZoRzAnOlZqrEN0yKSPBOPvyXkbDAe0
         +8us0jjucSN47EYClPH/uiUv30T3a5Cyl0Tc6UeJonPQ3H2mPIux6xKgXtqA2OxV6uYp
         2lR7wAL7c5EL3vBSTPMstroVDDNgoGHdi8ciieUwUyAip3Vvm8xKGHaYEaUXjJtVrx1M
         eiPDns+Lq0xEP2Auub0CDI/2o2+VhRNT3ZGdYfjuqCeZiZe1y+2XQz9eyeHItj8UWYIv
         LIMu4LzMasinFqedjA4YeelKIOUCKrQYElu2+v9nstxHSGxkVlPE5htLNvwpkbVWWt1o
         tTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rvofdCHxCvwcpYzvV4ThQ9tW1dE3FsuCFAAVo7LtDxM=;
        b=iUfB+D2wch70lDRaqhpMHW06/tuWzrgxTBMyEtRB/OR5/sooyJrsu4ixSNOi/G3Ich
         EvPGlvkqa/VxhcjOckXQUMROGPOTpkf8IYYs391OXQNK2JQcsIwDNGcF2BNIbbGCGTPe
         sQ8HxToj59ER70CrV7hM7mVaZBk1XMdFJx16wB7LpMwLjqASgQz5ZVGFFqg/a7EQCV4w
         j0y6trAILM35eP/1wdkhul+lhiTStLRTjNLmW1XMAz9oFul8gfpBQKaqav1ayAmZPfzt
         ZmrToyjS/6WNOWIvd/GFQNpSrMFz6ppqvMEt1RG0EOo+FpRM59D5h2birBkzIE0ZHoWA
         GFLg==
X-Gm-Message-State: AOAM532jyUGpMfZHUlb2mZa2ZC08hVoiSkwhhbSLWfC4hrAx/5YZvWuC
        cldcqaZ4NVzU1TV00QFK6p0=
X-Google-Smtp-Source: ABdhPJzC8MdPuZyVJWBSBwuBn2QuI4/2SVsbk5rJ/eD1SB43Lj2syZ/pGEWCNfAsqc9W/P5EzuWVww==
X-Received: by 2002:a17:90a:7045:: with SMTP id f63mr122836pjk.35.1616535199921;
        Tue, 23 Mar 2021 14:33:19 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id w18sm137046pjh.19.2021.03.23.14.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 14:33:18 -0700 (PDT)
Date:   Tue, 23 Mar 2021 14:33:16 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] input: gpio-keys: Remove extra call to input_sync
Message-ID: <YFpenIFWHQXy8+Cd@google.com>
References: <20210307222240.380583-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307222240.380583-1-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 07, 2021 at 10:22:38PM +0000, Paul Cercueil wrote:
> The input_sync() function is already called after the loop in
> gpio_keys_report_state(), so it does not need to be called after each
> iteration within gpio_keys_gpio_report_event().
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied, thank you.

-- 
Dmitry
