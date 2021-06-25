Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A653B4680
	for <lists+linux-input@lfdr.de>; Fri, 25 Jun 2021 17:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbhFYPX1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Jun 2021 11:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbhFYPX0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Jun 2021 11:23:26 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 131E3C061574
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 08:21:06 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id c22so7747526qtn.1
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=05GhKfUklw88eBVFa6MEiT/ogdLuQW31yv5j325coYY=;
        b=IHtfVzUfyPA3vcXhJneiXUve8V5ujng2PW55UOFy+Uj4Xz2YwS0tSnFBLXVgbBvW9s
         8gtCMaqpfcNVXXBSyP0kCUHEVcAeErzZxAv5F39iGSQdVT81T7+qW64dUxqS8XRG+scG
         IfQe/tLY/p6au/sdVsBEAeUcGBY8WRuPWEh6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=05GhKfUklw88eBVFa6MEiT/ogdLuQW31yv5j325coYY=;
        b=kdyFVb4h7pXKHD0j9WCtBKlWpq5rWSY+iK85+wafJNVPesZ81dUDrHBImVCGgSB2Bc
         zn6LyxcKkvyqAAQgvQr3dSMezm4zdVupwA4w9XX5ved4HhUb3lrzaK2NwvuvkbppZxbK
         THdxmq/6/jP6wFEVuCqjhUqIp7XEyqm+3e+aBAHtZVxFpYrWmJFItgoXKswtpbpm3WoW
         IhqSiStk0Vzdrfd9M1v2Om31ljxjHjLiNWO75V6+h0TsdP8Tx6oBKUvpGmjT5xscYwoi
         K7pfKXTimcMq1Tutmg/+VM/YFjXznWRfjpisWJSdeMDBZ5YUyE7793EuIaK1FhjXMXKV
         QaRg==
X-Gm-Message-State: AOAM533GQMPXe57R2iMUAzmfPU/65IFKGHAKFH5EF7pnEsI2XW7pxXqA
        8ERzvx9PB23knZdKVVVC8mn4TReqw5b8Cw==
X-Google-Smtp-Source: ABdhPJz9ROe+ebjthl0nX1E0yOmwABVc4OL3DDKJ2Yi7JknNjapWbegNzfSKT44QMQ6pWTSa1pHzZg==
X-Received: by 2002:ac8:5755:: with SMTP id 21mr10233279qtx.267.1624634465077;
        Fri, 25 Jun 2021 08:21:05 -0700 (PDT)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id h17sm3779507qtk.23.2021.06.25.08.21.04
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 08:21:04 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 8so5162472ybn.9
        for <linux-input@vger.kernel.org>; Fri, 25 Jun 2021 08:21:04 -0700 (PDT)
X-Received: by 2002:a25:bcb:: with SMTP id 194mr13806221ybl.32.1624634463798;
 Fri, 25 Jun 2021 08:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210611092847.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid>
 <202106221609.teM1w2T0-lkp@intel.com>
In-Reply-To: <202106221609.teM1w2T0-lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 25 Jun 2021 08:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XKzQ0GjifpvQgde3XmiBHaU3hXz3eLa_eoTngFhfBBkQ@mail.gmail.com>
Message-ID: <CAD=FV=XKzQ0GjifpvQgde3XmiBHaU3hXz3eLa_eoTngFhfBBkQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: goodix: Tie the reset line to true state of
 the regulator
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     kbuild@lists.01.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        kbuild test robot <lkp@intel.com>, kbuild-all@lists.01.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Jun 22, 2021 at 1:49 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> 2b87ff72c696bc Douglas Anderson 2021-06-11  133         mutex_lock(&ihid_goodix->regulator_mutex);
>                                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 2b87ff72c696bc Douglas Anderson 2021-06-11  134         ihid_goodix->nb.notifier_call = ihid_goodix_vdd_notify;
> 2b87ff72c696bc Douglas Anderson 2021-06-11  135         ret = regulator_register_notifier(ihid_goodix->vdd, &ihid_goodix->nb);
> 2b87ff72c696bc Douglas Anderson 2021-06-11  136         if (ret)
> 2b87ff72c696bc Douglas Anderson 2021-06-11  137                 return dev_err_probe(&client->dev, ret,
> 2b87ff72c696bc Douglas Anderson 2021-06-11  138                         "regulator notifier request failed\n");
>                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Drop the lock before returning?

Thank you for catching that. Fixed in v2:

https://lore.kernel.org/r/20210625081818.v2.1.I358cae5e33f742765fd38485d6ddf1a4a978644d@changeid/

-Doug
