Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C5FD1BC428
	for <lists+linux-input@lfdr.de>; Tue, 28 Apr 2020 17:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbgD1Px4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Apr 2020 11:53:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728083AbgD1Pxz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Apr 2020 11:53:55 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C12EC03C1AD
        for <linux-input@vger.kernel.org>; Tue, 28 Apr 2020 08:53:55 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g10so17231669lfj.13
        for <linux-input@vger.kernel.org>; Tue, 28 Apr 2020 08:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q096cfWzKfhRoQY6yVeooYdgz5eJpNiXcAOLwCb6KyU=;
        b=Yzx06nnuUmM+GAk8GeeXeouPCL1sKYw7yWl0m9ix8MeW/DAQk5QAxJcrFdPYvhNNJk
         JP7NUXrtNV4ES4rhsEUYPBzKTwX+0hr+GlHPsvLa2HdpK8y6zH60c8lB+yzg5Pjyv9uq
         /bQD3sV6hCA4ZIyegnMj/vADCwCM3KxYGReYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q096cfWzKfhRoQY6yVeooYdgz5eJpNiXcAOLwCb6KyU=;
        b=eG7d89coqV52VIGGd8qu4kTXCXtLEKXNARtcXiyNPjCNW0HiQQcR/QqkegzNMzEUEY
         lBEqFbShwJfLdBB6C4BJ9z3pF+U4hryObSw7UOg7+ayewEX3YCGI9CQ+f97xSXHtZiZ0
         8JJkxRvWhk+qutMvbd4NmcoE4HLXqYabNluPDAuYM6UPLfisqp+AJXuCDYl7fyL7y5qd
         bHYBwPbjbj+Y7VQjJ3wAiJ/HNGgWR1bWt8gcAFltoKCH5zDIvzEbGC657uLP7hJktwPx
         cLQMDMDp/zIYLUVIvhKe8YH+vl8BT1sryhhOaDPwS/2FsqP7ISSLadN0RwTMvhAOOWnD
         If3A==
X-Gm-Message-State: AGi0PuYoZL/Us09L/7KaonYJm7UgCKpCGBGulUbJjKahT4FsI9lLorFO
        GJnT26+bB4/zodqCQCyi7u0v6c2Lbsw=
X-Google-Smtp-Source: APiQypIo1//pCH2p9MDVnjrsKuwUUPRan2qcw/BVQcWVsZcB1/RxsjQWCeFXMX1SiJ8Moc2xS50Vzg==
X-Received: by 2002:a19:cb41:: with SMTP id b62mr19841516lfg.21.1588089232923;
        Tue, 28 Apr 2020 08:53:52 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id t16sm13102478ljg.41.2020.04.28.08.53.51
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 08:53:51 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id f11so17433265ljp.1
        for <linux-input@vger.kernel.org>; Tue, 28 Apr 2020 08:53:51 -0700 (PDT)
X-Received: by 2002:a2e:b0f5:: with SMTP id h21mr18195660ljl.3.1588089230946;
 Tue, 28 Apr 2020 08:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200427145537.1.Ic8f898e0147beeee2c005ee7b20f1aebdef1e7eb@changeid>
 <20200428011134.GV125362@dtor-ws>
In-Reply-To: <20200428011134.GV125362@dtor-ws>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 28 Apr 2020 08:53:14 -0700
X-Gmail-Original-Message-ID: <CAE=gft7k4Ps=UXONw=usOmN8anfcvNgpkNmeKwVc1Uh6bDR-YQ@mail.gmail.com>
Message-ID: <CAE=gft7k4Ps=UXONw=usOmN8anfcvNgpkNmeKwVc1Uh6bDR-YQ@mail.gmail.com>
Subject: Re: [PATCH] Input: synaptics-rmi4 - Really fix attn_data use-after-free
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     stable@vger.kernel.org,
        Nick Desaulniers <nick.desaulniers@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Andrew Duggan <aduggan@synaptics.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Apr 27, 2020 at 6:11 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Mon, Apr 27, 2020 at 02:55:48PM -0700, Evan Green wrote:
> > Fix a use-after-free noticed by running with KASAN enabled. If
> > rmi_irq_fn() is run twice in a row, then rmi_f11_attention() (among
> > others) will end up reading from drvdata->attn_data.data, which was
> > freed and left dangling in rmi_irq_fn().
> >
> > Commit 55edde9fff1a ("Input: synaptics-rmi4 - prevent UAF reported by
> > KASAN") correctly identified and analyzed this bug. However the attempted
> > fix only NULLed out a local variable, missing the fact that
> > drvdata->attn_data is a struct, not a pointer.
> >
> > NULL out the correct pointer in the driver data to prevent the attention
> > functions from copying from it.
> >
> > Fixes: 55edde9fff1a ("Input: synaptics-rmi4 - prevent UAF reported by KASAN")
> > Fixes: b908d3cd812a ("Input: synaptics-rmi4 - allow to add attention data")
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> >
> > Cc: stable@vger.kernel.org
> > Cc: Nick Desaulniers <nick.desaulniers@gmail.com>
>
> Ugh, this is all kind of ugly, but I guess that's what we have now.
> Applied, thank you.

Thanks Dmitry. There are other bits that sketch me out in here as
well, but I didn't get a chance to really figure out if they're a
problem. We call rmi_process_interrupt_requests(), which results in
reads from that same attn_data.data pointer, in a few different
places. Some of those calls are outside the irq handling path, like
the in rmi_enable_irq() and rmi_enable_sensor(). Can they race with
the irq handling path? (Meaning they'd be doing those attn_data.data
reads as rmi_irq_fn() is kfreeing the data?) There are a smattering of
mutexes around, but I'm not sure if they're trying to protect this.

If I can find some time I'll try to submit a patch. Anyone is welcome
to beat me to it though.
-Evan
