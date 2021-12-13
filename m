Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C428472022
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 05:56:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231768AbhLME4m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 23:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhLME4m (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 23:56:42 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F3C7C06173F
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:56:42 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id d11so4858990pgl.1
        for <linux-input@vger.kernel.org>; Sun, 12 Dec 2021 20:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UfGKoE9+J+pgpwAHXTs0K/iGocKeOoGPwzeiHUPQ6QI=;
        b=YtNfHR4Ek6MHam+MNb26gvss0bZv0OW6JqFZ3vb52JlQpMwHLvFV8/Q/CxbY5SmRH3
         qzC1twO873GEsBT2Layz0LbQZocr2MjUvVy950xhifFvgujm1Fno/YWTw+8p4a4tb3Kn
         hp0sCGjrp15K7uJsnSXSN9biP/K2GGoRZDHjMdcoYzYweo65dbZkcFaFY9R4zEdxp4zA
         gU6sPBFHPQqzo1qIpH9v2YtFw484Xe2NaGFwEMTn7szYTAWas2vdoo+m5TqEHdhFmnKV
         Fw4nl5QPuHwbjDf3R5uW7Y+/SymDWgqY0YRCaW4U6jjwzmFtFf1lm4ulYC6l5ntsrVj1
         XJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UfGKoE9+J+pgpwAHXTs0K/iGocKeOoGPwzeiHUPQ6QI=;
        b=QlIpFfSNeTMxR6O6zYU/4zVQ8J+g8Ir3zmbSUkcg/glfgLJrcjvz1/5Z2OLKy2/JzW
         0ez2KbWzZP5Mrz/gAph3C5Xgg6SqyambuIZkE+SKW80uN/d7F2UYe6FBaarG75JvEIWm
         UJ9Ut0pfHEc6GwumWjV+OpnqooLf5TTosLpIeHa4amVRfsAV6//c1zzPRGfY/q1KtKXy
         KYIfB30sz8qmeFHX898q6IovQGA0AA1QNvL2xvXj0zBkBT0hBRBWwjLJ9lBlSjOe75hz
         P0DxvoP7F1juDzweUZcxXOp/i2wQU40KlRNWhQNUYuchlaVDIsF1i33YrDLwXpdNJeat
         fksg==
X-Gm-Message-State: AOAM531DM4jdO+Jbj1fc6BSKT3Ncy1brvRtjzNASg3JMvsYzDfMX27ss
        F6y/3hulnBhdDLUm6KkDZycx9lMiKhY=
X-Google-Smtp-Source: ABdhPJz1SPZ9wFCsD2i7KCUsvqAnEwTT9tCxX9HR/4HvvlYBtz6xnL5o6Y2g7h9XMKX9D58FT3bZ0A==
X-Received: by 2002:a63:6881:: with SMTP id d123mr49371012pgc.497.1639371401642;
        Sun, 12 Dec 2021 20:56:41 -0800 (PST)
Received: from google.com ([2620:15c:202:201:e537:8856:7d40:7c6])
        by smtp.gmail.com with ESMTPSA id h13sm10082434pfv.37.2021.12.12.20.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Dec 2021 20:56:40 -0800 (PST)
Date:   Sun, 12 Dec 2021 20:56:38 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: Re: [PATCH 3/5] Input: goodix - Improve gpiod_get() error logging
Message-ID: <YbbShrjk5KlcgxLB@google.com>
References: <20211212124242.81019-1-hdegoede@redhat.com>
 <20211212124242.81019-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211212124242.81019-4-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Dec 12, 2021 at 01:42:40PM +0100, Hans de Goede wrote:
> goodix_get_gpio_config() errors are fatal (abort probe()) so log them
> at KERN_ERR level rather then as debug messages.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thank you.

-- 
Dmitry
