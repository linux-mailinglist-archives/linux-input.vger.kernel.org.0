Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CF0B409F18
	for <lists+linux-input@lfdr.de>; Mon, 13 Sep 2021 23:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243235AbhIMVaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Sep 2021 17:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbhIMVae (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Sep 2021 17:30:34 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC24C061574;
        Mon, 13 Sep 2021 14:29:17 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id t8so11760326wrq.4;
        Mon, 13 Sep 2021 14:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Yrsaonh+fwfWkOFuk4W3hgRjDE4kKeMZ2nofn8EWuSk=;
        b=SPGV9nVcIjEcTcr8v7qcpAvmEAiBFUPKnWxxFaMRIYkr0kub9plmt6BO6OkWC8pOBa
         dojnryqUBfk9bUKqoALqoBJqQFLL9L+OLfsaD16DBTlQrARpZI/O926EaobYOffFo4P0
         EEf0giGkJBDI5g/eGzq/fgTb3oR3CRFRBrCFVYJEOBmSQ2CCD/w4K1pa87FT7SBQ4IuG
         x8uOPi32YWicYR18NNTfXTjp+V3jorUuA3G7g2g022u32dUQm4gLaURw0WEb6Uan6WoI
         D7+QVEmijL/SSYVM8OiQdgyaHSC8Ntpz2jAojKPtYnJ59BahdFPA+w3p5nzVIBHuJzXl
         pR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Yrsaonh+fwfWkOFuk4W3hgRjDE4kKeMZ2nofn8EWuSk=;
        b=Vht3pNOgIuuWodgNmC+Hwey/bk2C2K/ekAMfaCu3aRw/LALUs7zwiHU4tEx7c1TWCb
         qSA8tkcOwJoT+HNzNIGSQGHfh5E8Bw1zn9Khi437VvhOJpzUxKM+Jb9v/AdnxyvggtMh
         6EXPqsjcpKDd009bIjx3o/29i0zyx/slgc/NwVDGkG/UagyvKOC8Bm28pzW/GoT0cuRQ
         hC4qQbBn8MJcBKfry9aha5SzR/CiIJongg2NEQKqqY8Md6eGJdPoIJkO5lSL8q4p/yGE
         ms4xYJ37OSiXVWYU8RDo8DM9IHfrbtipxzEshuLjvubU3SBftmrId5N5M4hEfUifo/V6
         2/6Q==
X-Gm-Message-State: AOAM531fs507gZV/zTAE5NNGCvcYXkElT4CtzJE/dkUOb0Ok+9TQsmjV
        XJ7yrrffVD2tZdFkk5R9hjY=
X-Google-Smtp-Source: ABdhPJxj1AOOH9kEnMpO0hupTfBuOX9H7isKcF0BtPmJh/z4MmxTBDyiBWspaTNgPrON6MBXyKHnhw==
X-Received: by 2002:adf:fb8d:: with SMTP id a13mr14877270wrr.164.1631568555840;
        Mon, 13 Sep 2021 14:29:15 -0700 (PDT)
Received: from [192.168.1.21] ([195.245.16.219])
        by smtp.gmail.com with ESMTPSA id v20sm5736wmh.22.2021.09.13.14.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 14:29:15 -0700 (PDT)
Message-ID: <2cd73e19fde5a9dee6a962f9994b4dd5ea4d21be.camel@gmail.com>
Subject: Re: [PATCH 3/7] Input: ep93xx_keypad: Prepare clock before using it
From:   Alexander Sverdlin <alexander.sverdlin@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Nikita Shubin <nikita.shubin@maquefel.me>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 13 Sep 2021 23:29:14 +0200
In-Reply-To: <YM60mjew2mqMAMRO@google.com>
References: <20210613233041.128961-1-alexander.sverdlin@gmail.com>
         <20210613233041.128961-4-alexander.sverdlin@gmail.com>
         <YMfQR8iM9be5Qg8+@google.com>
         <9bf87ee0e1c2a97b0a1b98734e34e456f84ea3d7.camel@gmail.com>
         <YM60mjew2mqMAMRO@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

On Sat, 2021-06-19 at 20:23 -0700, Dmitry Torokhov wrote:
> > On Mon, 2021-06-14 at 14:55 -0700, Dmitry Torokhov wrote:
> > > > Use clk_prepare_enable()/clk_disable_unprepare() in preparation for switch
> > > > to Common Clock Framework.
> > > 
> > > Can this be merged standalone?
> > 
> > In principle, yes, but I thought it would be easier if the patches
> > would go via the same path as CCF conversion.
> 
> OK, in this case:
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

our initial attempt to find a maintainer for the whole series
didn't work out. Would you take this single patch, please?
Three others were already taken into respective subsystems
and I'll ping the rest of maintainers individually...

-- 
Alexander Sverdlin.


