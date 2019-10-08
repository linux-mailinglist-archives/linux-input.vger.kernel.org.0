Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0566D0375
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 00:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725908AbfJHWj7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Oct 2019 18:39:59 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:43010 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJHWj7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Oct 2019 18:39:59 -0400
Received: by mail-lf1-f65.google.com with SMTP id u3so101264lfl.10
        for <linux-input@vger.kernel.org>; Tue, 08 Oct 2019 15:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eFtcK5RJiRW9XRK6rIUlEehQYaPynkLCG47fb5YYSAs=;
        b=bgMLDhRIpXp1GcmxOwpJ8G+kFhBB9aSp5/o0BndGXpCcFjs3ZB8SvinE6oiZOdG+TV
         qHYqdJXPddgRiFXWWDPIH92GlNVd26nuYDjfJ7Uq4croVg+gne6F9TB2yNdZ3kTuqF6g
         62qHmKnTn6tppGUeWZ7QpOF0/PydD5RKRvJfTPyPCgIn1UFZat2Rf8qzOtEtx3QvEU8T
         fs+GQ+A3Y+YdUDbag87pg13nvqwOfcTgvEeBhayd279BkDNwI5StS18mR5ixhH7a41Ew
         msMz+tTe8s0/w7ukChcz1hwd53ZzFXhR2xF18CqzZQd6XkPKfOASI2vttd4fGuM76sSv
         uc4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eFtcK5RJiRW9XRK6rIUlEehQYaPynkLCG47fb5YYSAs=;
        b=fbho3v4AhfBno+Haux4bN9tGomJRGmKm5CyY0QlUGT4Qm40hgxmGTZTrd5cE4JDU4z
         FA23URb0RMhI4HW4dHL6S5O+1NZm5lOAVpsJDKUpFqrOt1wLoK7FBGzhoN4RYba27FYg
         e840PJO7ygqtZxbCPnzpBbzkjVsD6ZJp29Zbqmb64rUWBWiPaXSgKsN/wT6zr31tB4wY
         X0HtaVtZyuMNL5rXuRMrus4WmYAUL7IzhD66zC6aVG1KJMG19woEPhbLLOl9OP8tFEbz
         i+Y1vk+Uab0oPZZHr54ykmoczJhdYXC57kdHEa2JspwNBp4eM38341LtF0H4z6+D6sZx
         NdKQ==
X-Gm-Message-State: APjAAAW7V7YE3PPDsPZR0Ajb1EBTQgRkbZz3LKTQtzYXouromNA3Zxrb
        jo9HWpUu3cTH0UCDyHSWxC0l4S01K9nlt99yWWVXE5+V
X-Google-Smtp-Source: APXvYqyp7UKzOjvHV6Yl5bke+XsAu98Ks5WxXCBpXgY6VIeu6LJWED/5K1P6dEI7KLh+gas6W35WmqAXWF1iFT1W+fs=
X-Received: by 2002:a19:c38c:: with SMTP id t134mr51620lff.44.1570574397238;
 Tue, 08 Oct 2019 15:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191007121607.12545-1-festevam@gmail.com> <ce6d29b1-1a7c-9fa4-da07-1b1d8c2a0efa@ti.com>
 <20191008184408.GG22365@dtor-ws>
In-Reply-To: <20191008184408.GG22365@dtor-ws>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 8 Oct 2019 19:39:46 -0300
Message-ID: <CAOMZO5DWL=Dd-kVpevzAWdB-0TBWJyHwe9-MwBRCPomrwX=euA@mail.gmail.com>
Subject: Re: [PATCH 1/5] Input: pixcir_i2c_ts - Remove unneeded gpio.h header file
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Roger Quadros <rogerq@ti.com>, linux-input@vger.kernel.org,
        jcbian@pixcir.com.cn
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Oct 8, 2019 at 3:44 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> I guess we can also do this:
>
> Input: pixcir_i2c_ts - remove platform data
>
> From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> Previous change moved platform data definition into the driver, making it
> unusable for users. Given that we want to move away from custom platform
> data structures, and always use device properties (DT, ACPI or static) to
> configure devices, let's complete the removal.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/touchscreen/pixcir_i2c_ts.c |  100 +++++++----------------------
>  1 file changed, 25 insertions(+), 75 deletions(-)

Yes, this simplifies the code a lot:

Tested-by: Fabio Estevam <festevam@gmail.com>
