Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16F31AF424
	for <lists+linux-input@lfdr.de>; Sat, 18 Apr 2020 21:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgDRTQS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 18 Apr 2020 15:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726086AbgDRTQR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 18 Apr 2020 15:16:17 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD08C061A0F
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 12:16:17 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id t11so4598014lfe.4
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 12:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M5L2K70fxOQxP+uWdRM/yMA+3xinlowUvRSVTNSTLNw=;
        b=VUI+VnT1NDQO7RfejypC/A0x1WOF6JlDgQOx4uVj0o8myo36afYqYoAB1bDh9hMclE
         y2579x/RBIr7L8eyYz+tWMdcXNGl1k4dVtK8zltRzr1OvNlhqXGfw7OPYoGf+9sgrfJ0
         nPVwr3eWFbVskZYoGSYtK1N/R40NufLSxc2Ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M5L2K70fxOQxP+uWdRM/yMA+3xinlowUvRSVTNSTLNw=;
        b=rA22GHiHqPW0+LMz99D9avU1LZUf9ok0msTIpl3h3lGiM1nQGC7TA0JsqyF5key8H3
         7gGNqa07xy+brDk5F6TsmBYIFBnJDpjUpttVk+Te12EGpv18rVWUfbzQKRdPC92we0wk
         bRhVIMIZhkba+7kG2LpXECDIU/3zh8SqIttc9ofe1MdEFw2Butp1//Hz455XdhCzLtzC
         +QFCd4d0UavHZXiy6J9gJWiupfECjT+uCfs4xuvezqspMgECWhh6uo2i3bMYxY7qbBPv
         3OXO4yjRrkDfOh1rMs3zE67c9E6JUR3NNrVOlbuN7CXOFlRNRlogEJf4ABCNDHkgoCmy
         90lg==
X-Gm-Message-State: AGi0PuZO/NNeoF9WAfhGaYPc8uQ3L7theMqgt1VFtLUmKyz2ZeHBJ5u7
        c+NWL8B/9z9Kjhp71z6APtmavx9uR6s=
X-Google-Smtp-Source: APiQypJyrUX2JcDkm0bB7Ov/7FV4T9sFO+MimqT5Ic0cDvJqAGiOcFRmuQQ6yJ18nXkp4c0UC6rlhQ==
X-Received: by 2002:a19:7706:: with SMTP id s6mr5613850lfc.31.1587237374794;
        Sat, 18 Apr 2020 12:16:14 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id f4sm15098191lfa.24.2020.04.18.12.16.13
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Apr 2020 12:16:14 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id b2so128703ljp.4
        for <linux-input@vger.kernel.org>; Sat, 18 Apr 2020 12:16:13 -0700 (PDT)
X-Received: by 2002:a2e:1418:: with SMTP id u24mr5613429ljd.265.1587237373258;
 Sat, 18 Apr 2020 12:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200418184111.13401-1-rdunlap@infradead.org> <20200418184111.13401-8-rdunlap@infradead.org>
 <20200418185033.GQ5820@bombadil.infradead.org> <b88d6f8b-e6af-7071-cefa-dc12e79116b6@infradead.org>
 <d018321b0f281ff29efb04dd1496c8e6499812fb.camel@perches.com>
In-Reply-To: <d018321b0f281ff29efb04dd1496c8e6499812fb.camel@perches.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 18 Apr 2020 12:15:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4QU90W1j1VVUrqdrkrq-0XPA06sjGUm-g1VHRB-35YA@mail.gmail.com>
Message-ID: <CAHk-=wi4QU90W1j1VVUrqdrkrq-0XPA06sjGUm-g1VHRB-35YA@mail.gmail.com>
Subject: Re: [PATCH 7/9] drivers/base: fix empty-body warnings in devcoredump.c
To:     Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rafael Wysocki <rafael@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-usb@vger.kernel.org,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Chuck Lever <chuck.lever@oracle.com>,
        "open list:NFS, SUNRPC, AND..." <linux-nfs@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        target-devel <target-devel@vger.kernel.org>,
        Zzy Wysm <zzy@zzywysm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 18, 2020 at 11:57 AM Joe Perches <joe@perches.com> wrote:
>
> sysfs_create_link is __must_check

The way to handle __must_check if you really really don't want to test
and have good reasons is

 (a) add a big comment about why this case ostensibly doesn't need the check

 (b) cast a test of it to '(void)' or something (I guess we could add
a helper for this). So something like

        /* We will always clean up, we don't care whether this fails
or succeeds */
        (void)!!sysfs_create_link(...)

There are other alternatives (like using WARN_ON_ONCE() instead, for
example). So it depends on the code. Which is why that comment is
important to show why the code chose that option.

However, I wonder if in this case we should just remove the
__must_check. Greg? It goes back a long long time.

Particularly for the "nowarn" version of that function. I'm not seeing
why you'd have to care, particularly if you don't even care about the
link already existing..

            Linus
