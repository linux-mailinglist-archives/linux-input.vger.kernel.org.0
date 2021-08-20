Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7604F3F305F
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 17:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241338AbhHTP6G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 11:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241301AbhHTP6G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 11:58:06 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB71C061575
        for <linux-input@vger.kernel.org>; Fri, 20 Aug 2021 08:57:28 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mq3so7570244pjb.5
        for <linux-input@vger.kernel.org>; Fri, 20 Aug 2021 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AJeoq+Z5WucmTQVKUtIcwcvIvzIMIDi7YIzeoCuQoP0=;
        b=oIxFw+GWAwZs8paucH0s/In4m5BgJDLq+dmzX+m7YKc4gCfgmo4JI2M4BsORRDjuci
         qAYG9G5n+7RQUkylKMqlb1PMW/ybYfuvOAKQsZeE3AgNOJAe0FYCQwED3j3ea2q1qoXd
         5B7pTsEFDxH8oJwSmaEr+SvpFW0GYanuTjebY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AJeoq+Z5WucmTQVKUtIcwcvIvzIMIDi7YIzeoCuQoP0=;
        b=N/243unXrh9MgHuC+gflI3WXeVeh0DGDjb4MaooCRA7XJwmKDFNnnXRCSwloKxyVrZ
         zvVnX7B6c3xiNqFmjXMpecy5fyombrm+y7OZgXEHrKrpCKSxeMafBx8/wyCh4oUjprpO
         3TIPh5x+WlX3CwCXdnxEdwXCeSPDUGGPQ7jn/SbdJ9zNQeKwAu0IDz8A0yWFqLaxf8aK
         LFFB3h60St5XKQxoX1uYrKKlpl3A1RhN/RyHPtlI9eR+/JMe+l+XuNMRMdNxdWjQ8+bU
         x8rzjRX7DZ3EFcCFa7cY+5F8LtisgYBLET+D6WhlmRTQSwiH63eClZZMnBtptUTFTa8v
         xCyw==
X-Gm-Message-State: AOAM533cjJ/WNv9H0KczjOpGwRugo9ntE+Y82qQFOr4t4XFV4EMgr05r
        blaDmcTTVOPOu7Z9OhhKwNljaA==
X-Google-Smtp-Source: ABdhPJzw8iPuALjJ/8kpXHMg33VLmYMXrF5AQDF992t6FjpOqQ1z2rFQNZkt6dgaqjw8sRY3eqQNTg==
X-Received: by 2002:a17:902:c215:b0:12f:b1b6:9f07 with SMTP id 21-20020a170902c21500b0012fb1b69f07mr7880820pll.82.1629475048022;
        Fri, 20 Aug 2021 08:57:28 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z20sm7604377pfr.121.2021.08.20.08.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 08:57:27 -0700 (PDT)
Date:   Fri, 20 Aug 2021 08:57:26 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-wireless <linux-wireless@vger.kernel.org>,
        Network Development <netdev@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev,
        linux-block <linux-block@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 55/63] HID: roccat: Use struct_group() to zero
 kone_mouse_event
Message-ID: <202108200857.FA4AA13@keescook>
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-56-keescook@chromium.org>
 <nycvar.YFH.7.76.2108201501510.15313@cbobk.fhfr.pm>
 <CAJr-aD=6-g7VRw2Hw0dhs+RrtA=Tago5r6Dukfw_gGPB0YYKOQ@mail.gmail.com>
 <nycvar.YFH.7.76.2108201725360.15313@cbobk.fhfr.pm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nycvar.YFH.7.76.2108201725360.15313@cbobk.fhfr.pm>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 20, 2021 at 05:27:35PM +0200, Jiri Kosina wrote:
> On Fri, 20 Aug 2021, Kees Cook wrote:
> 
> > > > In preparation for FORTIFY_SOURCE performing compile-time and run-time
> > > > field bounds checking for memset(), avoid intentionally writing across
> > > > neighboring fields.
> > > >
> > > > Add struct_group() to mark region of struct kone_mouse_event that should
> > > > be initialized to zero.
> > > >
> > > > Cc: Stefan Achatz <erazor_de@users.sourceforge.net>
> > > > Cc: Jiri Kosina <jikos@kernel.org>
> > > > Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > Cc: linux-input@vger.kernel.org
> > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > >
> > > Applied, thank you Kees.
> > >
> > 
> > Eek! No, this will break the build: struct_group() is not yet in the tree.
> > I can carry this with an Ack, etc.
> 
> I was pretty sure I saw struct_group() already in linux-next, but that was 
> apparently a vacation-induced brainfart, sorry. Dropping.

Oh, for these two patches, can I add your Acked-by while I carry them?

Thanks!

-- 
Kees Cook
