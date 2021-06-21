Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB06E3AECB8
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 17:45:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhFUPsA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 11:48:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbhFUPr7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 11:47:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EF38C061574
        for <linux-input@vger.kernel.org>; Mon, 21 Jun 2021 08:45:43 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x24so30944539lfr.10
        for <linux-input@vger.kernel.org>; Mon, 21 Jun 2021 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EtM0J/nVeGslRIOyE/pPRoPEZFf4Pf55KJfZnOMBln4=;
        b=UYr8k45WsWjOXGMl6cB0u74KMHNtEAZRwf7aPPdDJcw80nMZpcCpk6ZHa5Ybhk1UjT
         0ocxLCQindUGSxtEy7Xcwd18WfLFcc7lpK1L5XymcFQVD3G+hfwvKdsN7lAHetaIDKEH
         h5nREYRlZgunLsZ92CFfshVFrVOjvUUQTnR1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EtM0J/nVeGslRIOyE/pPRoPEZFf4Pf55KJfZnOMBln4=;
        b=YEZ+wMQ5lMMAoA+utfLtGuy+1tfRSjPmoghfxL5G5eqZs9oJ/Br14FnSwg1p4XSiII
         pIHsxYiQFvVTeYBVBCTGtJbtbQj2PwTIbRmfrYu2DPVclgCed3Az394CZotbaHZade8T
         d48CziFcFzBNfjuw2K/EIS7ECNhJGAfLEAQhvyuHcNTecP/0ie4dYChIHbqZ876nyMXR
         nQOeXZQ3ErHcGUAr0c8v1w4+FkQTPARnCZQ4Bpa+QbmQ05ePaJF1v51JsPhPl/rbK9wE
         cmmgMWcGRFebHeCUB+k88lFidp6sCJkktglfD1tHiJhS3SwuD1rN9AvUxTtQupmAyosR
         Jrdw==
X-Gm-Message-State: AOAM530+Xn0f7bkP94uyMriWVmmngKVojOUTZ5sb1gVB9/fQhMaV7aEW
        MnEvLf9Z5eqSmcMZiK5PyUPSMPRCbCDxF634
X-Google-Smtp-Source: ABdhPJyPbYNIgA4w78JXG9FuqiSedQn9qsMc5tygA62S9OnVeUWqITkA26QQqXHzdKuzW9DcqUxykQ==
X-Received: by 2002:ac2:5de5:: with SMTP id z5mr9084333lfq.94.1624290340762;
        Mon, 21 Jun 2021 08:45:40 -0700 (PDT)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com. [209.85.208.172])
        by smtp.gmail.com with ESMTPSA id q8sm2208035ljc.84.2021.06.21.08.45.39
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Jun 2021 08:45:40 -0700 (PDT)
Received: by mail-lj1-f172.google.com with SMTP id d2so25905019ljj.11
        for <linux-input@vger.kernel.org>; Mon, 21 Jun 2021 08:45:39 -0700 (PDT)
X-Received: by 2002:a2e:2ac6:: with SMTP id q189mr21891424ljq.61.1624290339582;
 Mon, 21 Jun 2021 08:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210620120030.1513655-1-avlarkin82@gmail.com>
 <CAADWXX-fpcPh+jGX7=Hbkqr7yhwzbUT915NBBzqHGecFVbxmzw@mail.gmail.com> <YNAitJfOpoBkFitU@google.com>
In-Reply-To: <YNAitJfOpoBkFitU@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 21 Jun 2021 08:45:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
Message-ID: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in ioctl
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alexander Larkin <avlarkin82@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Security Officers <security@kernel.org>,
        Murray McAllister <murray.mcallister@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 20, 2021 at 10:25 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Yes, this makes sense to me and it is safe as joydev->keypam is
> guaranteed to be the right size.
>
> Are you going to reformat this and resend or should I?

I don't have any hardware to test, so please consider that patch of
mine more of a "I think something like this" rather than a real patch
submission.

(I often find it easier to make a patch as a way to just make it very
explicit what I think might be the solution, rather than just
explaining it in English).

So please consider that patch throw-away - it's already gone from my tree.

And I don't need authorship for it: finding the problem - like
Alexander did - or even just writing a good commit message is worth
more than the patch itself, I think. The fix is a one-liner thing, the
real work was finding the bug.

So if you do want to set me as author, you can add my sign-off, but
you can just give credit to Alexander where it really belongs.

           Linus
