Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42653A5EFC
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 11:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbhFNJSY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 05:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232528AbhFNJSX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 05:18:23 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209EAC061574
        for <linux-input@vger.kernel.org>; Mon, 14 Jun 2021 02:16:21 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id q5so13735995wrm.1
        for <linux-input@vger.kernel.org>; Mon, 14 Jun 2021 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uyuGvo1EA6nXKWDFsMOry02WgCb6GfTuXyP3xreK66A=;
        b=f6cBvH+nXOFPYMwwvRix2YwX6xt6DR7YtplKSf3CJx2kOdCrw6cItZz4GFsLDK3S46
         n9ZC54SvpqKb/JZ+yDqoMEUJbkqITviFS8xMjVeljjtJeM3Y4mQvmsfYxfR2hJYsqYO/
         E2RA+xj3oT9bDXn0ys9W626tWnbXaHPpz/u7PJ68DdpzKzA7pqX44JmMgNuXm6h+YFMc
         HrhHtL8MGXsdSdzJoWKOm7G76Oq0oZ9ufVFEUkx6szRc9pD1mdPaIv2M+N4jP85+z/kt
         G5E2N3vsevpHoZ9UxniBZEBANZy3aY9V8j65AdUq7RL89Fv0tpI3OEcCcvm0u7NXNeGQ
         QexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uyuGvo1EA6nXKWDFsMOry02WgCb6GfTuXyP3xreK66A=;
        b=EyFAoEFBnw8wswzncXbDeHfiAipZsjVz9OBLYssih2y3Z9huwVqihhOKcgF83cA7By
         u/Z09oF5VxOsWAkKZCUdwEKGDKRI7yOfoKrGGRZehk5pC4Hjb3ouh7WuGi9AQ/t0s90F
         TI7spXk1Yv5f8zCYEmtjxfcdR9l4Qscp3/GcafE/HM0/nu/vuokCYYQV0+Uu3bIHdHLK
         exANKtJZXg8f+q4AViTQhk8IuWOA3rrMvm4LJgqhRYPFpu23I2Lx1owV3jd5HEU3hRdh
         0o7SwAdxvYzz2xGDQa2+L2XqEdc3SBcOQn1b5rCAndBI2rlvsIpfvKUnYXAeTtb18jfv
         cPlQ==
X-Gm-Message-State: AOAM533fv+s4ojyi/joO0ci/c0xxWMLUPf780phHjapOr7+/WOd9/au5
        QlZsWOWg/1eVcLSAGkJLblYFkD/2fFs=
X-Google-Smtp-Source: ABdhPJxUSxpNSl1LvS4WECg/kNrrVsqtTZP+cbliPmjlsDaytv4gcS7nvVTvBtUtTd4R+BkB8KBO6w==
X-Received: by 2002:adf:9084:: with SMTP id i4mr17471633wri.23.1623662179744;
        Mon, 14 Jun 2021 02:16:19 -0700 (PDT)
Received: from ?IPv6:2a02:168:575a:b00b:bdbc:c867:2267:5ad0? ([2a02:168:575a:b00b:bdbc:c867:2267:5ad0])
        by smtp.googlemail.com with ESMTPSA id p6sm16180710wrf.51.2021.06.14.02.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 02:16:19 -0700 (PDT)
To:     Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
References: <20210613102158.16886-1-hdegoede@redhat.com>
 <20210613102158.16886-2-hdegoede@redhat.com>
 <be664f7551029705030188f446799e1ff9ad9e03.camel@hadess.net>
From:   Gregor Riepl <onitake@gmail.com>
Subject: Re: [PATCH 1/3] Input: touchscreen - Extend
 touchscreen_parse_properties() to allow overriding settings with a module
 option
Message-ID: <278c2a63-2f7a-3fc4-24cb-fea8cb0d7e21@gmail.com>
Date:   Mon, 14 Jun 2021 11:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <be664f7551029705030188f446799e1ff9ad9e03.camel@hadess.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

>> Add a new, optional, settings_override string argument to
>> touchscreen_parse_properties(), which takes a list of ; separated
>> property-name=value pairs, e.g. :
>> "touchscreen-size-x=1665;touchscreen-size-y=1140;touchscreen-swapped-
>> x-y".

> I haven't reviewed the argument parsing code, but eep. If this were
> user-space code, we'd have exported it and tried to feed it all kind of
> garbage to see whether it parsed things properly, even if it's only run
> on the author's machine. Can't say that I like it.

I'm slightly surprised there isn't already something in the kernel that
can be used for such module argument parsing.

Would it be possible to decouple the settings parsing code from applying
them to the device completely? I.e.:

1. parse the settings string
2. store all detected settings in a static (struct) or dynamic
(dictionary) data strucure
3. apply device settings from DSDT/DT/etc., overriding the values that
were passed through module options

This is probably less efficient, but looks more robust to me.

Or how about simply adding all supported overrides as regular,
individual module options, maybe with a prefix? That way, there doesn't
need to be any additional parsing code.

The downside is that only a fixed set of options will be supported, but
I don't think this is a huge disadvantage. The main purpose of this
patch is to allow users to dynamically test touchscreen hardware that is
not properly factory-calibrated, so only a limited set of
hardware/drivers will be affected (I hope).
