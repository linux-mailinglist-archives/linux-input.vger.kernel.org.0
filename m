Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAEC322FA9
	for <lists+linux-input@lfdr.de>; Tue, 23 Feb 2021 18:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbhBWRbc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Feb 2021 12:31:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhBWRbc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Feb 2021 12:31:32 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1161C06174A;
        Tue, 23 Feb 2021 09:30:51 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id l2so2747385pgb.1;
        Tue, 23 Feb 2021 09:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ijxpW2DfFdumChRgWUkTrxf7LLo5YSmp/Ds+GmDX32Y=;
        b=LisSXAp23t1M5d+ce++duF5lbFrorV/pS3+pcFH1y0g6H3VTdEyIGjYJqx5SyNiF/k
         kFISxxKE70c7wnt4KRlOG06H8343QPKy4p0KZGGLI/mpzgPMjuCZL5ES+WGg8Nmo9N6J
         MWP3nG+obXoH7Kif5IumP7rEj7kcEKOM3vfNiR3dtX6WCTpDJR0cyyoJb6oCvYl80yYN
         2dfD3ShbUBJlALA7uLz9DmpXPG4MJtzswCzWW52SZ2IEcMQE4F4b2ZEbTekK36gFy9Py
         fmxyR/6qN5217Q7PlKvhHPBdWRZrh4FWG6+TOzNccAKd0B6LqzNbkfimcAA4ZtUhCjed
         8VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ijxpW2DfFdumChRgWUkTrxf7LLo5YSmp/Ds+GmDX32Y=;
        b=iwharimmAzUDkTDFFnEnlkwNxO3uK/8LuWW3jaYUssWpwNQGxY8JYzlx0QAJTp10hV
         pGfUlgwj29PUNZf8XYzC+KxEAt9rTqQMNrzMUOpUDeifugSydwxCcDxLrv9WjORXe5M0
         MzBVApQj2dwNbdPyVWteajksYIm61z62we0CQBqpPy8MPNufiiWBF9KmqvpZos3pj6o7
         MffjwulouaBx+XsULvEr06eu4feHBvOdiqIjagwWQTIFDAdAobj4D0fXblfUdlqAxOwE
         e9JBrCtSsnoJotARnjLwvUtYLu1wVIiHqgefM2F8O5208A8h6KZQArWU8Yv+VMBvKLA0
         Ut6g==
X-Gm-Message-State: AOAM533wYPKD1mJR0oi5apJwrpJa5AVui+++hkhSMVsKQk1uAMEEiAPB
        HMcRx4ZGI8YvuajROnHkphU=
X-Google-Smtp-Source: ABdhPJyTlHF94TnxDS7Ft4GRk/BhOchJi+FoQyH1pL8kj9EXMk7iJcPcj6WpN3h3/hf0jR4cyOPMoQ==
X-Received: by 2002:a63:e614:: with SMTP id g20mr13691663pgh.275.1614101451386;
        Tue, 23 Feb 2021 09:30:51 -0800 (PST)
Received: from google.com ([2620:15c:202:201:703e:f61b:7159:b96b])
        by smtp.gmail.com with ESMTPSA id 190sm844005pfv.155.2021.02.23.09.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 09:30:50 -0800 (PST)
Date:   Tue, 23 Feb 2021 09:30:47 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Andrej Valek <andrej.valek@siemens.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: st1232 - Fix NORMAL vs. IDLE state handling
Message-ID: <YDU7x/f4ez5nuFn5@google.com>
References: <20210223090201.1430542-1-geert+renesas@glider.be>
 <20210223102900.GA8833@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210223102900.GA8833@pengutronix.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Feb 23, 2021 at 11:29:00AM +0100, Michael Tretter wrote:
> On Tue, 23 Feb 2021 10:02:01 +0100, Geert Uytterhoeven wrote:
> > NORMAL (0x0) and IDLE (0x4) are really two different states.  Hence you
> > cannot check for both using a bitmask, as that checks for IDLE only,
> > breaking operation for devices that are in NORMAL state.
> 
> Thanks. I missed that the state is actually a value and not a bitfield.
> 
> > 
> > Fix the wait function to report either state as ready.
> > 
> > Fixes: 6524d8eac258452e ("Input: st1232 - add IDLE state as ready condition")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Michael Tretter <m.tretter@pengutronix.de>

Applied, thank you.

-- 
Dmitry
