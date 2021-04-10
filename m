Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA7635ABAF
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 09:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbhDJHdi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 03:33:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhDJHdh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 03:33:37 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB3AC061762
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:33:23 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v8so3819039plz.10
        for <linux-input@vger.kernel.org>; Sat, 10 Apr 2021 00:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7ATTqvR9RBTi/7EP3s4gX8c5JSyYsKWMKWI2OK3ftjg=;
        b=hY2nuhRwaIEq8km4ubcAJLcSs56Dss/dcacuyNLPMybzj1tIKI3T58sgK5hZhkympK
         VnubB5OyMK6NRgs9RA7eeESzQLJDJaNDo06U1r1pNs2eMNWL+stiXTXvFAjCshLJjLtQ
         X2yOIT0oY4EbDEgbfXaoDu8PUZqEW1S3jr5WEmbti4esycmg+ttasq/52ti+scUAUkC6
         VRdRKoxnpSINcPEev9GG/ISvROYlV3NfsM/4TyLhtqW3DHZkj82XK8qRltTNqysgU4l9
         q0ZFfnx8TaAKeEpK4kAxwKuLvoRnCQQ7hF/JbjoEzYSxxeisv/iIzfhZa5ywOUzRK0VL
         46FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ATTqvR9RBTi/7EP3s4gX8c5JSyYsKWMKWI2OK3ftjg=;
        b=gHOnH0EJwL+lLQ3oOFHnYQ5q04ZmP9Nxll4qqR73Sc+nmnVpeYs7Gy1V0TSQf6xjb3
         YrM85v7j9G4l2+nrz0G4nlyqY3J8bZ9nfFXk++63gva9Uur5xuBctzEHJX9mz+M5+Yjz
         xQBs7JKIAfev8ZfKQcnA7cDvVFwjdctwjon2pxdRfV+h0YDMXPQpMoBXLjmdc4moQxOd
         DcK5eu48XkPLJFhKMJ9UHD7CVPSzZ7aDpePCpyp5kyIQbF3lPPito99m58C+s8XnI1sG
         L11wC2U8dOPAQQOVw4nVeGZLqVmCL2on+kPc+WNI9c0UQYOrywaMbmHURCgL9fV01HtC
         0aSA==
X-Gm-Message-State: AOAM530Fvc3SS0N9SkoQp6pz8u484k8pAUHt3KXVuLNp+zs1pwkqb09+
        MI4XFJ/vHXuY8x/R8rFYcUQ=
X-Google-Smtp-Source: ABdhPJyP5I0VjbX4gkyKcCoWOaiAavLsN3NRXNWr/7vcNMBZu8rNkbMC3KBRzH4/gGTCMw556GwGwQ==
X-Received: by 2002:a17:90a:1d4b:: with SMTP id u11mr17353643pju.74.1618040003383;
        Sat, 10 Apr 2021 00:33:23 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id g6sm2992047pfj.139.2021.04.10.00.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Apr 2021 00:33:22 -0700 (PDT)
Date:   Sat, 10 Apr 2021 00:33:20 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Javier Martinez Canillas <javier@dowhile0.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 6/8 v3] Input: cyttsp - Drop the phys path
Message-ID: <YHFUwHyYS3ZWxDgd@google.com>
References: <20210408131153.3446138-1-linus.walleij@linaro.org>
 <20210408131153.3446138-7-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408131153.3446138-7-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 08, 2021 at 03:11:51PM +0200, Linus Walleij wrote:
> When I test to use the CY8CTMA340 with PostmarketOS I don't
> have any problem whatsoever in dropping this phys path,
> it finds and uses the touchscreen just as well. I suppose
> it is because userspace is using modern input libraries.
> 
> I challenge the maintainers to point out a valid and still
> used userspace that actually need this. I say we drop it.
> 
> Reviewed-by: Javier Martinez Canillas <javier@dowhile0.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
