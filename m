Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7E9F39B3F2
	for <lists+linux-input@lfdr.de>; Fri,  4 Jun 2021 09:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhFDHeo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Jun 2021 03:34:44 -0400
Received: from mail-lj1-f176.google.com ([209.85.208.176]:44800 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhFDHeo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Jun 2021 03:34:44 -0400
Received: by mail-lj1-f176.google.com with SMTP id d2so6204668ljj.11
        for <linux-input@vger.kernel.org>; Fri, 04 Jun 2021 00:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FxKLe4sZ1K8JPJ2QdvPjxW9bu30Q1qHWxTs6jtOn7w4=;
        b=lnlCxzbNDn3bNsybUku+dXbbNMewlzXuXZ6ZqlsFOgdvG5M/4ZkoqrtAgYeh8zo5YR
         tADhKkUCVTwLEaXmvNbILhEJNE1x8wd/CO6NAc5E7jJib2mjzJvXHpMZslvNQ/6wTSvO
         8C1GjaQRS4l/ExdTWoQPGbN5dVyzFzz695NeT5qKbCBw45RUVVjj6/8OVGM6QOG5Z+l5
         fPFEBSXnoZ0jmVH+Y9RMIsWkzaKAwejCCdJzZosgYrj8m6tAC3v7n0qLFqVbaDffmIxP
         QKL1+GVcPTuLn6kBleXG1m1Y2EsyBh0f5cmxK1vypcRrL/fbJIC6cp9gTNNf9Zob3+Bl
         sPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FxKLe4sZ1K8JPJ2QdvPjxW9bu30Q1qHWxTs6jtOn7w4=;
        b=V8ca4mCLf033xyGHE9bJnr9IS/RYU6AnosKRmv8F0BZkHSN3iqasDj62S2JUoPJE6Y
         Oa/Tw8ijepgpIzOdb1UMcLcFjr1+8f9JdsW7AL4VRWajP3euaUotR0ETkYid7a0FanY0
         5Qftu85iFrGEtp7flHa+rTr/Ti8qj4tcncMYhlevuk35WeW8olVFSnrgdhfGZ80oit+K
         O8Z4MU5VRNSJKidElNLEyo21ZLZ5Glaw0mKm/FqTbw+QOxyJ2IJyyDS2I5RsLwRn9wCJ
         /Lhv/zERdBFlBBWaN2kAqeVlkn3tXj6a8Tpeht2zVa+f5TbH1oKJGw+U0Nr/Vg4om6fU
         /lhQ==
X-Gm-Message-State: AOAM532dg3tNbtg/oYMRc20IxamHLiOZH7v1RBwu0+8VU+ZE5tebypjD
        LyrqmUuAIi/HdlCI/F8tWCgBmacoMu5xuO6wKfyrcg==
X-Google-Smtp-Source: ABdhPJyPFI87XIWla6LvyUr8sk3VNsW6SKxfYSfodk2fzO/PZom/0csd9fJAcoNs4ZmcXBI2NG0twc3vJwXv4t6xSMo=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr2494985ljt.200.1622791917583;
 Fri, 04 Jun 2021 00:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210603043726.3793876-1-dmitry.torokhov@gmail.com> <20210603043726.3793876-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20210603043726.3793876-3-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 4 Jun 2021 09:31:46 +0200
Message-ID: <CACRpkdYGrhrronv0nXwcYiik7=r_6D-rf9dPZLx=FpghcBRn2g@mail.gmail.com>
Subject: Re: [PATCH 3/7] Input: cy8ctmg110_ts - do not hardcode as wakeup source
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 3, 2021 at 6:37 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Let platform specify whether the controller should be a wakeup source
> by registering as I2C_CLIENT_WAKE.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
