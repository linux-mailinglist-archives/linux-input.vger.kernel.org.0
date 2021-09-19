Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6636A410D16
	for <lists+linux-input@lfdr.de>; Sun, 19 Sep 2021 21:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbhISTaT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Sep 2021 15:30:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhISTaT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Sep 2021 15:30:19 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C584C06175F
        for <linux-input@vger.kernel.org>; Sun, 19 Sep 2021 12:28:53 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m3so55580153lfu.2
        for <linux-input@vger.kernel.org>; Sun, 19 Sep 2021 12:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YUxoExa3Vl/56HsaDIt2/oCI+rjvSBChu/blLwgxZks=;
        b=QSa+P4wof1Hrj4vF53V525fNAc/Ogs08uD5wscbihPnyfZsUuFbEqExpuY0+QNv8Am
         Clnfw5cJWRwrkrfcAJycPUJ5qU6AbqzUapNrfoPp+bHtRyFCv9SCFG6xyYLGIko038F2
         ltCaEhfujIOL6NlJAYmqcSASiGAjVkntSxbWsQv4I4eC3X9rCkDimehX7ZzZ7/H5Snnp
         y2pv+wDyN/+HLwkNlji6pLDc0VlpOWnGrm3ETnbuHMsqB/573xrpguD8+B7SBTKDkROk
         cCSGO/bkwNAdeBCt8eU0U3HGNAXdCsv1EVYtpIiDWKVcbulcvMBFOUIUGwFPNch5RtN+
         mwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YUxoExa3Vl/56HsaDIt2/oCI+rjvSBChu/blLwgxZks=;
        b=MmmPWmotmJ1ANZEzddjJ7n1iEkRyrFf8Fu+F0IdYXpvPxhD9gI+E/V+/ddicVWAYgr
         u1+gO1SBD4oSD3avmZuuAz930a83KieNoAR9TNBqp+KfXahMJ2i+GYsBdhFQbxNmw6Gv
         l8ok15M8BfqwuNuzLP+Hqxk/398mj468abXTudhNpM4qGxNFI4tzkKil6+G3DVw06VGJ
         w6oB4/Xnd032gkRkqAm7sY6gMYbsoLkWnfAGtRdLiXYYi1wkkushSpX5fxpsMAmC00a1
         /8uWzYWAsY0BR2QqAuUW3iXqsz9f12Vwf69zSoGDILX4/5lbVYn9oACxUBWbcZ4tXP1l
         x43g==
X-Gm-Message-State: AOAM532ZyBZy6gOKO8aGCdBPdMnJ9NOv7IOWtIGt1rXDClBCrp07wRrU
        uD0fG/AcN50oeOh53omN7IW0eLT4uyqX6syG4D+n9g==
X-Google-Smtp-Source: ABdhPJySP1s5I02yVU0z+OVsOCndb6pnIAOk9ZmArvo0FYBcyHpd6gQEuqLGptLws72qC7Axz5zyVUrlcYDNiqORdnM=
X-Received: by 2002:ac2:4d03:: with SMTP id r3mr16775620lfi.339.1632079731461;
 Sun, 19 Sep 2021 12:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210916153156.14098-1-caihuoqing@baidu.com> <CACRpkdau6wCjmeQeFuadsyhi_XZQ6AATYw1okSBMOYbCoGkmCA@mail.gmail.com>
 <20210917013525.GA17348@LAPTOP-UKSR4ENP.internal.baidu.com>
In-Reply-To: <20210917013525.GA17348@LAPTOP-UKSR4ENP.internal.baidu.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Sep 2021 21:28:40 +0200
Message-ID: <CACRpkdbODGTv1i+KdPPnrwtPL2mFb4zw-acaLoTacjwHB9En_Q@mail.gmail.com>
Subject: Re: [PATCH] Input: cyttsp - Make use of the helper function dev_err_probe()
To:     Cai Huoqing <caihuoqing@baidu.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 17, 2021 at 3:35 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
> On 17 9=E6=9C=88 21 00:30:32, Linus Walleij wrote:
> > On Thu, Sep 16, 2021 at 5:32 PM Cai Huoqing <caihuoqing@baidu.com> wrot=
e:
> >
> > >         if (IS_ERR(ts->reset_gpio)) {
> > >                 error =3D PTR_ERR(ts->reset_gpio);
> > > -               dev_err(dev, "Failed to request reset gpio, error %d\=
n", error);
> > > +               dev_err_probe(dev, error, "Failed to request reset gp=
io\n");
> > >                 return ERR_PTR(error);
> >
> > In this case you're supposed to do
> >
> > return dev_err_probe(dev, error, "Failed to request reset gpio\n");
> the probe function is defined:
> "struct cyttsp *cyttsp_probe("
>
> so it is required to return a PTR:cyttsp *.

What about

return ERR_PTR(dev_err_probe(dev, error, "Failed to request reset gpio\n"))=
;

Yours,
Linus Walleij
