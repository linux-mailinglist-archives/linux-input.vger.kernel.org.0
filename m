Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC2A2D8238
	for <lists+linux-input@lfdr.de>; Fri, 11 Dec 2020 23:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406989AbgLKWhm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 17:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406968AbgLKWhT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 17:37:19 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35D59C0613CF
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:36:39 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id b5so3098481pjl.0
        for <linux-input@vger.kernel.org>; Fri, 11 Dec 2020 14:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UenWPmgP3OEJ5MEmP4s2EAgbV/XlKPTNOHtkoBWscYk=;
        b=W6D8vgYX/WpHo39DpKHcyy+Rl3DN+MmDi+H1ZnVMbF4PPLH11Ul2pmZaEHQpp0CHF7
         WHu9OGSWHkgfh+kAaI5KkVICF8IAc8CHSPtiHi3ZsnVpdJvfwLqHp/cpDqCghvCjVvDO
         UfaElk8Bj0qXpIDD5DQjsd9lwvRGYMADKYkpv9ArRxbNV1Cv6frFqJHr7Ec2zPT+0ZH5
         uGqmzz78v40ugaFzSFowaBsQ7FXAPLnbKhtRfjkYiXlmb5nZM4mqbjO8628lNRSojiq6
         ph9gHnooXP7N0vP7kApPKBzHDuA+jiAvv9Q43fvL6139SMRG7m9IC5sHES5aV7AtzvvD
         DMuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UenWPmgP3OEJ5MEmP4s2EAgbV/XlKPTNOHtkoBWscYk=;
        b=QJwTQf/PFeZMLhN+GTe4r0372BqHWp8dYWJd3gli+kxT2YUmy4PXNMTelDc9P748yZ
         8b4rGLLCOYxx4v89SyOgfw4tgQdwYXgfLPWlhzCtc7dg92SEqaaSyPY+gErSs/aU15/0
         yuyfzE3pJvQXUdZ3G3F9oeGXuqQQJGtpSPdc0ACGOd6HyoeciGlAmvLR9T82o9iLBzNQ
         2ZGZlud6rn/6jg5r+2hDATxu1k91YY3sEyD8ioLCq3uXR3UL9/GIQlw3Eb23mtgq7uKo
         2Mh2JJfSK7H8VQeVdE9a1VQ3VaTRe5LGAef8cQoM2lsdZCS5a2MfokVIFGgfbjNf3CJO
         gj1w==
X-Gm-Message-State: AOAM530U+/xoUV9EDoqIfLth+nmNTU5EbKQNEXKytqF3a2LmbcTLyO1v
        Go4RMoi9HynnthaTznN0j0E=
X-Google-Smtp-Source: ABdhPJzOIZ/KCRtV/r9m6Kr2X0VBVlteaK1FxojQPbhJw5FnCSkBLwDt5b8gGG0S9OgBLcndcxgVCg==
X-Received: by 2002:a17:90a:4892:: with SMTP id b18mr4390687pjh.64.1607726198622;
        Fri, 11 Dec 2020 14:36:38 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id o62sm11911315pjo.17.2020.12.11.14.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 14:36:37 -0800 (PST)
Date:   Fri, 11 Dec 2020 14:36:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Simon Beginn <linux@simonmicro.de>
Cc:     linux-input@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
Subject: Re: Fwd: [PATCH] Input: goodix - Add upside-down quirk for Teclast
 X98 Pro tablet
Message-ID: <X9P0c0kUKN+gxraZ@google.com>
References: <672ddee0a276be7d34e01c665df20d1c8ad2b7d0.camel@hadess.net>
 <434f5579-5ca7-5f54-c853-af720769e1cc@simonmicro.de>
 <5f9a868c166e13062a2109ab868f9e806aafc563.camel@hadess.net>
 <111d63473070310b1576c633e4e5debac0a4b22f.camel@hadess.net>
 <422df127-449f-247f-bb7e-005575dc23cd@simonmicro.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <422df127-449f-247f-bb7e-005575dc23cd@simonmicro.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Simon,

On Fri, Dec 11, 2020 at 11:08:58PM +0100, Simon Beginn wrote:
> Hi,
> 
> all right - try #3
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Simon Beginn <linux@simonmicro.de>

Could you please send your Signed-off-by _with the patch_ so that I do
not have try to reassemble this from separate emails. Also, I see that
in the original patch either your editor or mailer converted all tabs
into spaces so that the patch does not apply.

Thanks.

-- 
Dmitry
