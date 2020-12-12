Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F37C2D83FF
	for <lists+linux-input@lfdr.de>; Sat, 12 Dec 2020 03:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407013AbgLLCoP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 21:44:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395249AbgLLCoL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 21:44:11 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87387C0613CF;
        Fri, 11 Dec 2020 18:43:31 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id c12so8192600pfo.10;
        Fri, 11 Dec 2020 18:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qqgJjxt3GII5CzX9Vh7yLmiWsNOTpXIC0QugqQtXEy0=;
        b=Ubn4saS98YB1RqLCS6GYqq5RQyMwCW28RT5ZwixpRe13KSISeMsUf87OWJU8qNNate
         2LutrxrgoNdLI5OWIkV9CZarM2vZYtR2s/EDjBRMlgmzS1wXX8V2PpvmaYkB1MvJiUl7
         p4ppqq701jxaq6W5FP3z+gROOOUaYXHgkgW6HcH2Chz+Y3dUXBLmWXgebuElaY1YUjy0
         lUY/Y+H8S1+dKgX0Z3tPH0Fdnkqve2SD6RUdpD0cMl3Kpk/6+yyttV3jFfSDmqejAFmD
         BsZ6vtEXz+I6IXmtTj2acGVatkV96UrA4TMG7ze5PQ1c6yXBXIOah3Ya/e7/71zPKTKp
         qogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qqgJjxt3GII5CzX9Vh7yLmiWsNOTpXIC0QugqQtXEy0=;
        b=QmdtuQ0qckWGL8HTOKnQzNrsbeez20ES0LbLueBcgMN87VO/SLSKZg4bF+slMSjCKG
         un7oQUeZSjUJaZY7bsUn22syN7qu43KOeBkW19FQNKAGtX0P4ihR3o1rxZrFUR+mBPsJ
         Ei4zQnrQx9vjXKdsI2Lp2NqJmwSys5hPp8hVTLU7TUiJHpxhUCly0FODOQJIPE2Cxf5H
         Q84kBlbgc8NMqT7y2bKI4Rcf4SQiPhBFbdzzn1OIGf80bxbj7LklF6LK9clc3TlCd47/
         kBN+OANFa9LtVuer6l7W87Afy4/tOpBy0EZuAjAX+tkDKMSrSsF5xYSIr6+JrWniy13x
         feTQ==
X-Gm-Message-State: AOAM531yWKX8avplnzbfJDQ5XWpxf+4KP+Ns5HB/oWqT/BgZH3Ho6RWd
        MkWJZ1yTmpDtb/CWZBbelzjuCfun5nM=
X-Google-Smtp-Source: ABdhPJza2gHyYzQgtHaLFjLUl+8vz+Y7PzYlO1c2X641VfQqq2ahJE77hVLlOPs9VwwcC/EwcjiHSw==
X-Received: by 2002:aa7:9ec5:0:b029:19e:bfaf:1b24 with SMTP id r5-20020aa79ec50000b029019ebfaf1b24mr10660694pfq.51.1607741010753;
        Fri, 11 Dec 2020 18:43:30 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 77sm11380186pfx.156.2020.12.11.18.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 18:43:29 -0800 (PST)
Date:   Fri, 11 Dec 2020 18:43:26 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jiada Wang <jiada_wang@mentor.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] Support wakeup methods of Atmel maXTouch
 controllers
Message-ID: <X9QuTuGEicUnlaJp@google.com>
References: <20201206212217.6857-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201206212217.6857-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, Dec 07, 2020 at 12:22:14AM +0300, Dmitry Osipenko wrote:
> Some Atmel maXTouch controllers, like mXT1386 and mXT3432S1 for example,
> have a WAKE line that needs to be asserted in order to wake controller
> from a deep sleep, otherwise it will be unusable. This series implements
> support for the wakeup methods in accordance to the mXT1386 datasheet [1],
> see page 29 (chapter "5.8 WAKE Line").
> 
> The mXT1386 is a widely used controller found on many older Android tablet
> devices. Touchscreen on Acer A500 tablet now works properly after this
> series.

I am trying to understand how your controller is configured on that
system. Could you please enable all debug messages in the driver and
post the logs? I am a bit confused why the controller needs to be woken
up twice in mxt_start() given that according to the spec it is supposed
to stay up for 2 seconds after successful I2C transfer...

Thanks!

-- 
Dmitry
