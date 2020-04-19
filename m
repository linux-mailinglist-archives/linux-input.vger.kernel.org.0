Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BF51AF916
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 11:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbgDSJrj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 05:47:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725832AbgDSJrj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 05:47:39 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF4E1C061A0C
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 02:47:38 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id q19so6621342ljp.9
        for <linux-input@vger.kernel.org>; Sun, 19 Apr 2020 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/gRzQjk7FJHl509bxscE1hykZLFyAAYlKz38so1O1fo=;
        b=aI5DSSotzl09S1MIVQpecSaW4A2irv2XxSb0uGVzd3MUTqbNzihFTpgeVF/+88HFAZ
         op82cUA1Ay5SWoixMHQmNvZNxlgMb5o6Yc8o5nTKG6iB/jKAEsH7FKXgiCIMfTKmNFnD
         PuD7gixzN/lRwx4CRpBWN27CJPLNmQPmSPE1CcV/awpJk4ekTjoSz5EfsIEIUm7XKING
         yGkO1bj/A/vNKeMFAr+Y+YdjIE0hYYTQFl2vad+ElrPz1LR0zAW54RedQSMCCfWS9Ehv
         UvU6LclqypLHbsl0d/8zpxEqYYXgU+n9l9S1mY/UjZijMcTzFd5ONSlvPwWhLPYvnYVE
         eCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/gRzQjk7FJHl509bxscE1hykZLFyAAYlKz38so1O1fo=;
        b=LMSfRSnrnhU1+nSLAmEicFti8lBth/DvI83WELhkVRFu26voTW9TbWJ4XY7/oXmNlm
         O2P3lFb5xdJTCrYEDaFjnZ4Qt320IqXxbBcTZ2996bAL8RNaU3awWOYXRj98uZ6nwyMo
         LZsxFTglU8+ivucqr49PIu537d8bJdzXZi0d3fG8oHBE7jrfOhEKkfhTbdBInqqUK8C2
         Nbxb7FS1I+Q7ocY80IqB/iP2v4CBa4L0xwVuqk2kHOHnfOXo7Z68ej6tabTJMDLS7kpG
         QwYVE4oG2IV2RlJi8YcDk3bsD11BMnxwnOkG72HUETw0psrh1Pcll+CY3oUh6IIvNb8H
         qeTA==
X-Gm-Message-State: AGi0PuYLQDX5lP84fYS44NcT4Sw5UcvbmG6HRFyQJkNqHj7JcmS8f7de
        W55yclFvhvV78cq7tW8PNXr5721/Uy1YCIRZb489hB6A
X-Google-Smtp-Source: APiQypIihoDovuMiGj2RFObbmNzV7Gh/xSl3TiTsMOB/5IUuhY7XSxVzrAMVuqab2WMByn+30K3tU+IyuT8CYonOvTY=
X-Received: by 2002:a2e:81d5:: with SMTP id s21mr1427011ljg.258.1587289657251;
 Sun, 19 Apr 2020 02:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200417203059.8151-1-linus.walleij@linaro.org> <20200418204221.GA166864@dtor-ws>
In-Reply-To: <20200418204221.GA166864@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Apr 2020 11:47:26 +0200
Message-ID: <CACRpkdZKuxGb8ESd=U=nFDwbywYGzFULbehU6w0NMCFmQbqPNQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] Input: Delete unused GP2AP002A00F driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 18, 2020 at 10:42 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Fri, Apr 17, 2020 at 10:30:59PM +0200, Linus Walleij wrote:
> > There is now an IIO driver for GP2AP002A00F and
> > GP2AP002S00F in drivers/iio/light/gp2ap002.c.
> >
> > Delete this driver, it is unused in the kernel tree
> > and new users can make use of the IIO driver.
> >
> > Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  drivers/input/misc/Kconfig        |  11 --
> >  drivers/input/misc/Makefile       |   1 -
> >  drivers/input/misc/gp2ap002a00f.c | 281 ------------------------------
>
> Don't we need to delete include/linux/input/gp2ap002a00f.h as well? (No
> need to resend if you agree, I can adjust it on my end).

Yep that should go too, thanks and sorry for missing it.

Yours,
Linus Walleij
