Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06A631012D
	for <lists+linux-input@lfdr.de>; Fri,  5 Feb 2021 01:00:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhBDX7O (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 18:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbhBDX7M (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Feb 2021 18:59:12 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF86C061786
        for <linux-input@vger.kernel.org>; Thu,  4 Feb 2021 15:58:32 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id e132so4981205ybh.8
        for <linux-input@vger.kernel.org>; Thu, 04 Feb 2021 15:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sRxGWIrKp1PiiNE2aPyYhP5zdwwk1cSyu8KOryvKUPQ=;
        b=TKhPWTpaTvOnyBD60RbbXGIuBDnICpBM3/EqjgWfwHUrtPaAwFXI3SXOs7YcFPlDzB
         NNw0aRN6rONGv8sh2gKKkG1zpL92q+rnRftsR090uroS7lQV/YubBZwRBrvXLWbZ0rnR
         +PYkx85pLnShq7Wyw0PX/ex1J8RIkuaoiF7RE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sRxGWIrKp1PiiNE2aPyYhP5zdwwk1cSyu8KOryvKUPQ=;
        b=Xhe6+L+fdt/eWiUnUCBgxiwm4FVxUvxrdxdsgJy7hrtdtZ696vo5iEzHq1/yi2HL9T
         ITPgvJqc5MvHlU/to1TgAbCKIs6hR/sJqwrWGLzeUY4Nw2gtAxwS41VT7Qwe9ph9YQwj
         wnF3Uz1zlBJdmCwWNF+aBwZ/Nb4wQP+lkcQuw9mVOdHf+HxwDHb+qiZv4/UyMP3WQjUu
         1gb5X2m10FKpphLjAiCXkhinjY7+PBdhxfmOWg5t8QRWxm8VfMo7ejKjBe/cyd1j1SLt
         zM1ENWU6OBmURGgyg6XehW2hrsj1fNiIeIP9eNvWk5RHozr79DhwQNOwhon8x4Hxez02
         ACEg==
X-Gm-Message-State: AOAM532vfz7J+MPFUExsX5x3XTEbqplYIyQ6L4cSOdtY3wuDL7vEBP2I
        8bC215+tEy+sxhz0y9yldAnXBGihm6SCZbmPq7W/Mw==
X-Google-Smtp-Source: ABdhPJxA8G+Jp/J8sLPkFItRU/SaTbOw4R4Xf0TkBK2sxeWDbZjfoWLY37hr5T5WsR/wYJo9r10AeoRKmDyrlKhkbcQ=
X-Received: by 2002:a25:da47:: with SMTP id n68mr2333879ybf.75.1612483111393;
 Thu, 04 Feb 2021 15:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20210115122412.v7.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid>
 <20210115122412.v7.2.I6542d7d9d0b246e7079bb16b41e697b2ac4b4e39@changeid> <161074288129.3661239.8671522224671695448@swboyd.mtv.corp.google.com>
In-Reply-To: <161074288129.3661239.8671522224671695448@swboyd.mtv.corp.google.com>
From:   Philip Chen <philipchen@chromium.org>
Date:   Thu, 4 Feb 2021 15:58:20 -0800
Message-ID: <CA+cxXhnTLxCH+z=-2GL_w1WY9t81dpQtkQM73e29_gbiwU3AKA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] Input: cros-ec-keyb - Expose function row physical
 map to userspace
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi maintainers,

Friendly ping - can we actually land patch series v7?
Or do you expect any update from me?

On Fri, Jan 15, 2021 at 12:34 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Philip Chen (2021-01-15 12:24:30)
> > The top-row keys in a keyboard usually have dual functionalities.
> > E.g. A function key "F1" is also an action key "Browser back".
> >
> > Therefore, when an application receives an action key code from
> > a top-row key press, the application needs to know how to correlate
> > the action key code with the function key code and do the conversion
> > whenever necessary.
> >
> > Since the userpace already knows the key scanlines (row/column)
> > associated with a received key code. Essentially, the userspace only
> > needs a mapping between the key row/column and the matching physical
> > location in the top row.
> >
> > So, enhance the cros-ec-keyb driver to create such a mapping
> > and expose it to userspace in the form of a function_row_physmap
> > attribute. The attribute would be a space separated ordered list of
> > row/column codes for the keys in the function row, in a left-to-right
> > order.
> >
> > The attribute will only be present when the device has a custom design
> > for the top-row keys.
> >
> > Signed-off-by: Philip Chen <philipchen@chromium.org>
> > ---
>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
