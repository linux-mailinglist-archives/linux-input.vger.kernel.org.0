Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05A86386D17
	for <lists+linux-input@lfdr.de>; Tue, 18 May 2021 00:43:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239672AbhEQWoW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 18:44:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239399AbhEQWoV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 18:44:21 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89C7DC06175F
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 15:43:03 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso6972761ots.10
        for <linux-input@vger.kernel.org>; Mon, 17 May 2021 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=qIX+t1YKWWujAYO4RKswTYxIn2MPzDzLJIB7Mq7c8Zs=;
        b=b+W4cpgVKx3kWrlVef2M79/pgvOqXNvJl3FbrPV3bSuaY1bLFGkxN1+GcNoMVH+93w
         K7FowwMRI9xBrgzzz/+eZX/ezkLOspMSXjuh4YyY1vuXB9vKtmGVYeVTqVmyeL9vu8su
         qsJoEdef0PkAAbO7LQ1c6oX2FstQ+o6WWyMro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=qIX+t1YKWWujAYO4RKswTYxIn2MPzDzLJIB7Mq7c8Zs=;
        b=a+tN66BH4w0X3mVWU9Y3JXEL1iJSPDaSh0jdsm8zAaUxl89jfYUrgCL4JeAj/Ll4bM
         22f/Cdi2ycTGfLgpsdk0cS5o06qmrD7Z+idx1dK/q7//fO8x5suflMjciythP2Mp/8gQ
         0KUlvdqimyEKn3i3FtkZ+G9qW/DA6dgLu64bcNOCUSzLIcw0/XFduX+9aV8MujVh8GQJ
         DLLGMgUej6fsCUKLZcjb2P9oeuHfuk2F25U/ooGpmXEmO7TiWqYug+WRcfT1FU3z3Gt8
         R1G7X2nVH5OCNgJQrXQpzmthbHiAyfObV+GHnwxoHZKcK+HTHV8tFz4B5fZOiwmmAz13
         5H/A==
X-Gm-Message-State: AOAM531dIkAnoTS1l8YIiTgbcX5SpDZTJuUm/ttNX7kOUQVvetacvySk
        /GAANRgaEV8RdmlsMWHBPUT6CmCuqTZkNiuoQCPnyQ==
X-Google-Smtp-Source: ABdhPJxcjBpwmNvcCV5pFmHQfODx320xdu80rVlOUvrDwd+0Se/xR8dkiiavxISQU1Ht/wA9YwYeHRfkcR0QHJNanMI=
X-Received: by 2002:a05:6830:1556:: with SMTP id l22mr1576626otp.34.1621291383035;
 Mon, 17 May 2021 15:43:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 May 2021 15:43:02 -0700
MIME-Version: 1.0
In-Reply-To: <20210514122051.266169-3-ikjn@chromium.org>
References: <20210514122051.266169-1-ikjn@chromium.org> <20210514122051.266169-3-ikjn@chromium.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 17 May 2021 15:43:02 -0700
Message-ID: <CAE-0n521WWMmUs4oPxpc7kGC1pxZygdjHkU_ULa665-6kf469w@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 2/2] arm64: dts: mt8183: add cbas node under cros_ec
To:     Ikjoon Jang <ikjn@chromium.org>, Lee Jones <lee.jones@linaro.org>,
        devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Ikjoon Jang (2021-05-14 05:20:50)
> Add a 'cbas' device node for supporting tablet mode switch in
> kukui devices.
>
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
