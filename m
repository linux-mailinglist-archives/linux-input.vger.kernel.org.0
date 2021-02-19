Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0C1831FF37
	for <lists+linux-input@lfdr.de>; Fri, 19 Feb 2021 20:10:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbhBSTK3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Feb 2021 14:10:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhBSTK3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Feb 2021 14:10:29 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C387C061574
        for <linux-input@vger.kernel.org>; Fri, 19 Feb 2021 11:09:49 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id a4so5368696pgc.11
        for <linux-input@vger.kernel.org>; Fri, 19 Feb 2021 11:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=T1RopRrOVDk0z4KBiOVu6xnfw1jfcH/EqqPxxFLyPkw=;
        b=DrJ2faqR3iCTg6IDo+YJ8nmAB7T/0/g+6mufUyvG3PZQyCikCvyQlRO8+mrkM+/Bwh
         6ILC4rD5JqxEAIYIchvnB2N1LeCD6PjHj28EBkwUWIcojnrEsdW53/GReIDNaw1Q+MsY
         iCeB0yZ0VTdlU7Mk935rRa1cF1VVfY7iHNwpru7uaoynZ6YDYZFMjOECU8w6hutN0fOK
         Q5i3JhF0aLhZ017pDuS9KaBH89CXX0JDouu5hdbPt2ejgpQR+mI25MHjHrueYk31txWa
         N59p6jAUjVcu9hLSh+Bx65HxRGgDdJ7WsYlIH9Knz+EXmoj+qfhFeQ/kpnmp7Go7ELyF
         uhOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T1RopRrOVDk0z4KBiOVu6xnfw1jfcH/EqqPxxFLyPkw=;
        b=DtunEAVT9c7uGm3gscSwu/5QiEsoo98ploJu+EcgvEjAAAcX36z6aPJAuv/weQLFLK
         Y1GKsImFSWvBMbWWFQJyAWOpMbsqU916yiATJUepDsIpEfd6gRc0iNb9bejau88NIJnX
         8ftHUhNEPxpjQ3Xrb1gnSCb7+nw/wf5u25WQwzQUpy2mFNeb16FM5pPIaRwuiSwQftfn
         A/fUNMJYaURdzT78Cy0m/wrjICDTOyI7vKT5V3M/+Tvayn5aQiv5lkVLH9XTRh+1tZAL
         Pc43Ep9DeahGS5XqQbA0bHEg+quggfvCb+L2pJo4hR3waFVzvHwaxe+Dud+U85TZtefd
         B3Sw==
X-Gm-Message-State: AOAM533VwNigdVfjnR60gCwjGaVDKIC3bOaQpWDRasBZEkqX506uMFUm
        vEiZq8NYkBfXD8ogF1pFIiY=
X-Google-Smtp-Source: ABdhPJx4XKImwABWAnGrPUbC0W0uAzNy08Eiq2hPsDW3/FmOF8+vkSqJgIcOhdFWCsm/eCOUPdRAIg==
X-Received: by 2002:a63:f74f:: with SMTP id f15mr9761704pgk.413.1613761788552;
        Fri, 19 Feb 2021 11:09:48 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7d43:dae1:3b24:51b7])
        by smtp.gmail.com with ESMTPSA id u7sm10186679pfh.150.2021.02.19.11.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 11:09:47 -0800 (PST)
Date:   Fri, 19 Feb 2021 11:09:45 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     linux-input@vger.kernel.org, geert+renesas@glider.be,
        andrej.valek@siemens.com
Subject: Re: [PATCH] Input: st1232 - add IDLE state as ready condition
Message-ID: <YDAM+bsp5n/UfZW1@google.com>
References: <20210219110556.1858969-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210219110556.1858969-1-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 19, 2021 at 12:05:56PM +0100, Michael Tretter wrote:
> The st1232 can switch from NORMAL to IDLE state after the configured
> idle time (by default 8 s). If the st1232 is not reset during probe, it
> might already be ready but in IDLE state. Since it does not enter NORMAL
> state in this case, probe fails.
> 
> Fix the wait function to report the IDLE state as ready, too.
> 
> Fixes: f605be6a57b4 ("Input: st1232 - wait until device is ready before reading resolution")
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Applied, thank you.

-- 
Dmitry
