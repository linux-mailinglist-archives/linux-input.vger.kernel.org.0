Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE243466A8
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 18:48:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhCWRsA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 13:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbhCWRr7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 13:47:59 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4734EC061574
        for <linux-input@vger.kernel.org>; Tue, 23 Mar 2021 10:47:59 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id b184so15082289pfa.11
        for <linux-input@vger.kernel.org>; Tue, 23 Mar 2021 10:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=k+6C31H+I8laRMyWDIvM/wQogAMpRcHp2+VDp70CH9w=;
        b=KGcMJcseXGbnCt3W2tYD8ph3w1EUZ+Q/PYcmb2SUjEJIwjh8b1acQiMgb8F2DJJucD
         V834Ljzx4SVQ7J3EDxf1BnW0xyznhfJ4GMW/2HNiRg1H5paE2KvDWM6fpi8E9eW6iswo
         ImvBV/jf3h31ePm9yGoW3Z97BPP9xrIN5V83UCZREUX3VaY0o7XPJMXhV4R+ygpsjSvb
         md/HpqBr+B2U+9saIDXVqEzD5TMrr0MDdz3JbNhWa+qViwNh1kjWcIqY0FV5P1PnjiGt
         DXBMGLE486P5MZvef4EIxlhOJD1ZeVtcEECZl672hu3eYV72L3vQ7uaBI5ZQh4ejNe0t
         yIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=k+6C31H+I8laRMyWDIvM/wQogAMpRcHp2+VDp70CH9w=;
        b=txVhwlYMk3xGici2kulNp45/8mrU5hMJ6vcak0luSrku6MBmToTYVmJfdhMO8O1hAl
         GS89aNjlMK7mPlxdkJH+1D/bxw+nJ2p75jT0c6DczluWa3xjqOhO1DzftWuRs4730RqB
         u0ezYKwMjyy1c0+7n6MClWuNOHnGa6CYQEjjlimDVpOT3C0TMUytM9F82PB47aWB0UWI
         j2QCb3KOr9c+4e4r6LuHQ2kQqFKurQtIyVdZafQ4SRxqJYv+7tOUrAHFZKRR82SPc+N5
         loDc7VGJJ1AyHlhDFuNGbPR768Wy/6cQD0tKC1vbypwoc8FLthzv3Isz8v6VUuOOAeET
         iw2g==
X-Gm-Message-State: AOAM533IUq9DZEL7R/2e3F+6VNLoFfoPwSXSUSNIpVfnEhZmvCmvssum
        4K4+Hp0gDiFWBg3kqD2/Eod0VXI30/E=
X-Google-Smtp-Source: ABdhPJxKTH60MGBlxhi/zaOTRCA+MnQOfRdcOj1c9YKLJI6onoLgiWjN8+4s4y1hHdi13A4S+6babQ==
X-Received: by 2002:a17:902:ac89:b029:e6:d199:29ac with SMTP id h9-20020a170902ac89b02900e6d19929acmr7000229plr.46.1616521678688;
        Tue, 23 Mar 2021 10:47:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d6b:ca5a:c720:f5c9])
        by smtp.gmail.com with ESMTPSA id gz12sm3185142pjb.33.2021.03.23.10.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 10:47:57 -0700 (PDT)
Date:   Tue, 23 Mar 2021 10:47:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fabian Vogt <fabian@ritter-vogt.de>
Cc:     linux-input@vger.kernel.org, dt.tangr@gmail.com
Subject: Re: [PATCH] input: nspire-keypad: enable interrupts only when opened
Message-ID: <YFopy9Ts4MGPZ+wj@google.com>
References: <3383725.iizBOSrK1V@linux-e202.suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3383725.iizBOSrK1V@linux-e202.suse.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 23, 2021 at 10:39:05AM +0100, Fabian Vogt wrote:
> The driver registers an interrupt handler in _probe, but didn't configure
> them until later when the _open function is called. In between, the keypad
> can fire an IRQ due to touchpad activity, which the handler ignores. This
> causes the kernel to disable the interrupt, blocking the keypad from
> working.
> 
> Fix this by disabling interrupts before registering the handler.
> Additionally, disable them in _close, so that they're only enabled while
> open.
> 
> Fixes: fc4f31461892 ("Input: add TI-Nspire keypad support")
> Signed-off-by: Fabian Vogt <fabian@ritter-vogt.de>

Applied, thank you.

-- 
Dmitry
