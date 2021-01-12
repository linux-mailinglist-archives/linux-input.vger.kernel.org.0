Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FDF2F27DE
	for <lists+linux-input@lfdr.de>; Tue, 12 Jan 2021 06:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732296AbhALF3Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jan 2021 00:29:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732299AbhALF3Q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jan 2021 00:29:16 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D5FC061575
        for <linux-input@vger.kernel.org>; Mon, 11 Jan 2021 21:28:35 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id v19so670378pgj.12
        for <linux-input@vger.kernel.org>; Mon, 11 Jan 2021 21:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nfwuBJi9yRt8b6f0yc8AFyUbEEA4Vt8x2oA24HIlmT8=;
        b=ZTyoIVhlSbRXSMqUItLFdmVKOpgjYLAj/KWIz3V+CVd/6dLwq7rb/iyMlKfFozIK3B
         wZtarpdiJHKDk8LyBFv+MctX+DmALoHQlL6zc6N35qJvL7X+8tjKdqoPAHyderzwfl8q
         wls8Xe/UiLPeTLF8C71zv4A3v2olAclaYGlllsa7BWhaWxOZ20LSe/K1rixk3dYnOimr
         e1kXlTZsRKmbkim5Ro+SgIUWxnAKtHOTlAlHeftDHo9+hXakWBSBioO4gSImdzlw0aXv
         yxQlwujaThqsLTPrEwWnIswmWK6O/tcVKUG1/xxaiX7s4+KK+K8QruUMI6hHng2eFP8J
         MfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nfwuBJi9yRt8b6f0yc8AFyUbEEA4Vt8x2oA24HIlmT8=;
        b=nVeM64ZUVRmFTUyUhCEtFcE4+o+CKGC4gTVDgrVL8xwA0Aglsln7EOC189dqPd8gQe
         Xv4RZdoIdDiKgHQMAHqPWvmnrEB+npaa6oTHIokTF8jd1hJ+lL7pdziXfG9KGKUNlqAe
         Svd2KwN0rTCFyZgX9D1djaAQldZZgWktr2LOY16ySMHQCqfj9r2+xlwns8mqj5Z1i1W5
         Cz8d1+4zWQPIqwA2OogPYXbiqEc4S5ycDIBFBfiw/sTfR8Se0Ci1snV3sFo3yvkDMdLb
         NvWH+ckimPqqsjCFRh/sOIm0lUBBNUXkrfWnixuKmMP9QlebseJo4TX1ccl5bhkSFqYK
         Qgqw==
X-Gm-Message-State: AOAM533KlsFgFXxavbrbTafzq6mkpVp86qlbN4nnLOFgk6QvS0FAiHSM
        4CbYlISH2fkbZpYIbpW6vcye4lFe8TM=
X-Google-Smtp-Source: ABdhPJzGL79coEhI8wJrsw0J2Wa5SweNsTriTdvpMOul+rboafUbKmeAtT4/p0dfUi22SO6RNQv7Kw==
X-Received: by 2002:a63:3049:: with SMTP id w70mr3025884pgw.224.1610429315192;
        Mon, 11 Jan 2021 21:28:35 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id z13sm1305476pjt.45.2021.01.11.21.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 21:28:34 -0800 (PST)
Date:   Mon, 11 Jan 2021 21:28:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     linux-input@vger.kernel.org, linuxarm@openeuler.org
Subject: Re: [PATCH] input - mk712: fix the kernel crash while mk712 is
 selected
Message-ID: <X/0zf+n85sbXbKu+@google.com>
References: <20210108003527.25800-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210108003527.25800-1-song.bao.hua@hisilicon.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 08, 2021 at 01:35:27PM +1300, Barry Song wrote:
> While debugging other issues, I enabled mk712 then I got the below crash
> during arm64 linux boot:
> [    1.150412] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [    1.150541] pc : logic_outb+0x3c/0xa8
> [    1.150657] lr : mk712_init+0x74/0x1ec
> [    1.150745] sp : ffff800011efbd40
> [    1.150950] x29: ffff800011efbd40 x28: 0000000000000000
> [    1.151098] x27: ffff800011681078 x26: ffff8000115d04b8
> [    1.151192] x25: ffff8000116ff6b4 x24: ffff8000115bac10
> [    1.151287] x23: ffff800011dfa000 x22: ffff800011b8dbe0
> [    1.151421] x21: ffff800011eac000 x20: 0000000000000000
> [    1.151527] x19: fffffbfffe800266 x18: 0000000000000000
> [    1.151674] x17: ffff800010a7bc38 x16: ffff800010a7b0e0
> [    1.151944] x15: 0000a0d665e7ee58 x14: 000000000000011a
> [    1.152060] x13: 0000000000000001 x12: 0000000000000000
> [    1.152149] x11: 0000000000000000 x10: 0000000000000a60
> [    1.152291] x9 : 0000000000000000 x8 : ffff0000c0a2a480
> [    1.152429] x7 : 0000000000000000 x6 : ffff0000c0b0c9b8
> [    1.152522] x5 : 0000000000001000 x4 : ffff0000c03613b0
> [    1.152614] x3 : 0000000000000267 x2 : 0000000000000260
> [    1.152731] x1 : fffffbfffe800000 x0 : 0000000000ffbffe
> [    1.153135] Call trace:
> [    1.153342]  logic_outb+0x3c/0xa8
> [    1.153434]  mk712_init+0x74/0x1ec
> [    1.153571]  do_one_initcall+0x54/0x1b8
> [    1.153705]  kernel_init_freeable+0x1d0/0x238
> [    1.153860]  kernel_init+0x14/0x118
> [    1.153960]  ret_from_fork+0x10/0x30
> [    1.154304] Code: d2bfd001 f2df7fe1 f2ffffe1 8b010273 (39000274)
> [    1.155013] ---[ end trace f9b157c311d20edd ]---
> [    1.155854] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [    1.156236] SMP: stopping secondary CPUs
> 
> The driver is very old and resources are totally hardcoded, no bus model.
> It seems the simplest way to fix this issue is disabling it by parameter.
> If someone really needs the old driver, it should enable the parameter
> by cmdline.

I wonder if we are not better off simply removing the driver. I doubt
there are any "Gateway AOL Connected Touchpad computers left, especially
ones that run 5.x kernels.

Thanks.

-- 
Dmitry
