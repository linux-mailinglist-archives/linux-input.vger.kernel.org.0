Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF454231FB
	for <lists+linux-input@lfdr.de>; Tue,  5 Oct 2021 22:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhJEUaF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Oct 2021 16:30:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229805AbhJEUaF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Oct 2021 16:30:05 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84ED7C061749;
        Tue,  5 Oct 2021 13:28:14 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id g14so531994pfm.1;
        Tue, 05 Oct 2021 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/GmU+skl6R6cWDd9uqFr0fshz0di0rgcxbz7AsCSLTk=;
        b=czmtJZ6AjGKE/aKnwK871ypbVk81tVEwXYQESjXId7b3xjJisjnMKLf5CILbKIyojg
         pxyYau4aogA6pIMtjCVO69sKo6LDn+kJ9dDMykX4wfd3mk6MDLJn8RvkqW9SmNtszMFz
         cozoVLDN0uDeAhtju0p85b5CU0oYRgiuZa78yI2DFeXEx7f9l/Spx1k8AORKZaP6o9J+
         PTqeBA99CIP1M0HQIY4RvSZVHCDdZA2g9FQL8HHxFKLC0C/c2FWBjDak6CJ5rdgeOFQq
         dO1HEeIUfn4FIsnzTFfatiHGcEfYrNEcIBFPFv1eRE3yg/sZwGGqUKPqX6yG5UQCGEGQ
         mGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/GmU+skl6R6cWDd9uqFr0fshz0di0rgcxbz7AsCSLTk=;
        b=H0HiBtDhWpO1mQ3wMv0VGaiY06sYBRQuSKBvzchm/7CTWSIo6wOj54AC0/+ScdiIU+
         KmbYV3oKfDNx6PYc9YPbqfBsn5PCIN4DuVTOMNz5QAMfN5VM1snIzvtEtGnEGYZrkbca
         M4TdR6claklUXath7XETTpnekGVnqTqAbflp1FoTHe4BLlgCrHwOcv/QdcOfTZet3+0o
         zgeeZ5OnvRbcoqK1mep9t5bB/X5OUeEfLd4Ar5tyxlANId5jaVg+G6XZyfdla5zHmZXL
         1edlUjNWjrfSgEMujhuJU6hjLZ6khTVQ/JJFQpA7fKtQF7E9S2YL2Ga5PCqHe9Ui0LCl
         BISA==
X-Gm-Message-State: AOAM530+PgHU2KLEbpJKWnFxKYkdZ/XvQbfFn42dsA4vr6Njf+P0OiNL
        1c+3IEVyG71S/8mPDzsnROQ=
X-Google-Smtp-Source: ABdhPJwwFVcPszFAH4eP+4kaSUQ5NJONF42DosSniwkCJyf3WCWUV2uJWqoQvN17GfuhBmzm0dAzWw==
X-Received: by 2002:a05:6a00:1481:b0:43d:275b:7ba4 with SMTP id v1-20020a056a00148100b0043d275b7ba4mr32600810pfu.63.1633465693770;
        Tue, 05 Oct 2021 13:28:13 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:d0a7:4716:8e1b:a15d])
        by smtp.gmail.com with ESMTPSA id e9sm3160784pjl.41.2021.10.05.13.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 13:28:12 -0700 (PDT)
Date:   Tue, 5 Oct 2021 13:28:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Zhang Qilong <zhangqilong3@huawei.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [RESEND] [v2] Input: analog - fix invalid snprintf() call
Message-ID: <YVy1WkSwfUPyZ2S4@google.com>
References: <20210927101416.1569609-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210927101416.1569609-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 27, 2021 at 12:14:06PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Overlapping input and output arguments to snprintf() are
> undefined behavior in C99:
> 
> drivers/input/joystick/analog.c: In function 'analog_name':
> drivers/input/joystick/analog.c:428:3: error: 'snprintf' argument 4 overlaps destination object 'analog' [-Werror=restrict]
>   428 |   snprintf(analog->name, sizeof(analog->name), "%s %d-hat",
>       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   429 |     analog->name, hweight16(analog->mask & ANALOG_HATS_ALL));
>       |     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/input/joystick/analog.c:420:40: note: destination object referenced by 'restrict'-qualified argument 1 was declared here
>   420 | static void analog_name(struct analog *analog)
>       |                         ~~~~~~~~~~~~~~~^~~~~~
> 
> Change this function to use the simpler seq_buf interface instead.
> 
> Cc: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> Link: https://lore.kernel.org/all/20210323131456.2600132-1-arnd@kernel.org/
> Link: https://lore.kernel.org/all/20210324131959.2089129-1-arnd@kernel.org/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied, thank you.

-- 
Dmitry
