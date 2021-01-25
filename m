Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E74302149
	for <lists+linux-input@lfdr.de>; Mon, 25 Jan 2021 05:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727113AbhAYEmC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Jan 2021 23:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727059AbhAYEmC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Jan 2021 23:42:02 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D093BC061573
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:41:21 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id p18so8067386pgm.11
        for <linux-input@vger.kernel.org>; Sun, 24 Jan 2021 20:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1F6lNyuUxA+re5wnfR6IiTVZ1hHr5JhNAC4IZyn08TY=;
        b=WQp9ux838QKFQoZAz4Ng8OO5a3xLhuiwsXTJNW0o36ySvpJqYPljwcjloyz3ynUbWx
         yK0gclTnolO+hAO5cWsKuF8QOdcgdWC05l+HjL8QkWBTu+/DOpQ2DMSVqLZu7TCtq4x1
         g7S22KGEqowh+UcNztU+lIXDTjxz/ZBUWMhgJkJfED8WloB1xiBBWSGYtEFjzIW0C5Ua
         fjX0SGm4OJX2yAGQE8vpTOQ2ABflUHWCAyRFkT3mpFHCf37ZdKUGkM7Ws5Ev+4MUke79
         mo6dEfH+Y4vdesW2e1rpzaoLo7i4G6YkCTzM/MZdFyG0acv+o5rrj5WOAxNwBiADG6JB
         Vp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1F6lNyuUxA+re5wnfR6IiTVZ1hHr5JhNAC4IZyn08TY=;
        b=F1u0NKRlnqK5tjUd5SUrY75flC1kPdwcw9rn52f5RyRdIqryFZL61X8J5f6fFyUWp2
         dUgZZirqx3lWLmpabWkHpnBgEHSq39orb7qt2RPvZBbYjWv4vERgxt19oZBk/AAn+01e
         s+6Vmtl4sz/vvjnXyrLaWej9WrPhp3rn/LdNs9KmN+P10wBUKSnEGCdnjzyF2WPKUntd
         WFwpCseqG0tkI5dBjp9GrCmdgd13nB51U5yPAY5dWYgQBRgZzbMSxPCFky7QBMplKn3d
         +9OGyoBbsJK/bVZP5nxtpk5H5Ljl/bWTdAQJ6UByC/G+tNcWKFrxwC44RQoa7fmFG1Uf
         jviw==
X-Gm-Message-State: AOAM533u2wzWpwcYfK3RvMzd9WAsnUjj6NMKMb3kg3GDD7p1c/HPLpkV
        QFZevsabuI6IGArJAiTOshw=
X-Google-Smtp-Source: ABdhPJxe9MIFMTR9S2iKy+5/r9t1qwahOEAqZA/ZkD3S+7pfNWqMlr4/xziQtumhlV9OQKZml4txIw==
X-Received: by 2002:aa7:8602:0:b029:1bb:4dfd:92fc with SMTP id p2-20020aa786020000b02901bb4dfd92fcmr2826222pfn.63.1611549681398;
        Sun, 24 Jan 2021 20:41:21 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 72sm15116080pfw.170.2021.01.24.20.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jan 2021 20:41:20 -0800 (PST)
Date:   Sun, 24 Jan 2021 20:41:18 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 07/10] input: iqs5xx: Eliminate unnecessary register read
Message-ID: <YA5L7jGmqiVzJxKw@google.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-8-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611002626-5889-8-git-send-email-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jan 18, 2021 at 02:43:43PM -0600, Jeff LaBundy wrote:
> Instead of relying on firmware to enable important register fields
> and performing read-modify-write operations to additionally enable
> the fields the driver cares about, it's much simpler just to write
> all of the pertinent fields explicitly.
> 
> This avoids an unnecessary register read operation at start-up and
> makes way for the iqs5xx_read_byte() helper to be dropped.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
