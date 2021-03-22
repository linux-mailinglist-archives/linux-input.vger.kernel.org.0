Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0B9343779
	for <lists+linux-input@lfdr.de>; Mon, 22 Mar 2021 04:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhCVDcW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Mar 2021 23:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbhCVDcQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Mar 2021 23:32:16 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96A7C061574;
        Sun, 21 Mar 2021 20:32:14 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id h25so7726064pgm.3;
        Sun, 21 Mar 2021 20:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G0S6I+wZVHttbgypjBTTF0KD1XSkQLNQ+OX8HCc5mYs=;
        b=EpjRBVIsNNDdZh7lEDsX325eaA1omJOeh0zGSAmpHKYE0Q4cEcIS/tr+q63ZHtvXs6
         HpQHFbV+pJN/7fR3Pd3HSih1bGLKHQvxphlabX3+OCzr02iLqbT3YsbWSnPwDcXyPM9n
         brozHxVS1dmcZCz15XecQy4fZcrNRwE5Sr9IZUEtyqYDt2T5qSjeJk1mHS0BM97Ra0l+
         pXxtydxcgTJHGayzmKI2umfwPxtgy1C8ih3XWMOTBUxVyVbb/GtTYEZB1n9sP/gcv9Wy
         XlrcBbKHrG5OFFbjmMnosCI9i8wDM1+8c4LHNrh0rlI7A7JMMb7ND/Vu3dHMJb2FeGsy
         +cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G0S6I+wZVHttbgypjBTTF0KD1XSkQLNQ+OX8HCc5mYs=;
        b=n71xMTGh/HbP5+Zhnv7z/jUoYNuK3ByAv32E8TszGp+TAR1YVg3E8IRTO3OlWC7shs
         V4qyt15MGesu6vD1mxpss+tZa52JxdQJYzT+GuFNTSkL2K4cw0yJmZPDoneZswSTppfx
         qurnvEfxuY6pUPnGAcqbMeUgYsyhEZu+MzIO1awGgjabso9vZaOAykCRUiCkEWF62h69
         5SWciqFcm+d9mv4k/dmdt+Sg4P5ifab6Jvteisheh5oVyC5hAL6yY45xnQEEBPWI1rKB
         07XyWbKsOLTHmD3cM+TN2EVb3dtVv6u9QQNu6eVswGhlILXLvfsUKtxSoCC8XmLNuggK
         ovvw==
X-Gm-Message-State: AOAM530yBuths45Z8zEyjL6ASw1Pv1oFoc5rhR/vPsa7TVwgJ76W7rbJ
        pHxhfl4feXwBc/IuyVnQ2/0=
X-Google-Smtp-Source: ABdhPJyJSu0dRtQKqoI+CFuPsSKDj+pwfBiW93J4i+STXYkh0WtUyXrI9GS4OaIJ4zcRARYJO8Bv8A==
X-Received: by 2002:aa7:8145:0:b029:20f:58e6:9c17 with SMTP id d5-20020aa781450000b029020f58e69c17mr19736108pfn.52.1616383934434;
        Sun, 21 Mar 2021 20:32:14 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:85c2:9df1:533a:87e9])
        by smtp.gmail.com with ESMTPSA id s17sm5129205pjn.44.2021.03.21.20.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 20:32:13 -0700 (PDT)
Date:   Sun, 21 Mar 2021 20:32:11 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     hdegoede@redhat.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, rdunlap@infradead.org
Subject: Re: [PATCH] Input: Fix a typo
Message-ID: <YFgPu7YZSv8j1Vuz@google.com>
References: <20210322022030.3857089-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210322022030.3857089-1-unixbhaskar@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 22, 2021 at 07:50:30AM +0530, Bhaskar Chowdhury wrote:
> 
> s/subsytem/subsystem/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Applied, thank you.

-- 
Dmitry
