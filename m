Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B45A402918
	for <lists+linux-input@lfdr.de>; Tue,  7 Sep 2021 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245477AbhIGMnB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Sep 2021 08:43:01 -0400
Received: from mail-ua1-f45.google.com ([209.85.222.45]:41797 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234142AbhIGMnA (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Sep 2021 08:43:00 -0400
Received: by mail-ua1-f45.google.com with SMTP id 75so5477484uav.8;
        Tue, 07 Sep 2021 05:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8ez+F2PzifSpa6RnlnkxVNCWhWZwCuwikPm2gtf77/A=;
        b=FMWLUGIVKBF5QErbP6cR2OOS42xUQ0+5h3t5af3lNz7TaJN3NpPhl2gj+oDRXb+foT
         SV67OV6HfvHiCcF6UopgnZWnZMkx2sRhtuZsqZQu5opk1coeYbVUBA9FVQa1sZxpRuk3
         b7eadg9oT7XAR+yJYridRXUFsheIiNGyPnm9RR5C1FRpSIwvaR8+yEIdWcXypgx4TkDx
         8alzT05EpohFa5m5SCJVL+wkFyuNOEcEQXZt2eCq7qB7Yybwc58x9ZDzrN8To1SffWji
         qaIX1rw42xcCT3u1iB2zgEZX3mmxTZMEg+d5CAh+IgDZAqlv3HPtw4pjrikVnqS8iZVj
         60jQ==
X-Gm-Message-State: AOAM531TyZEVoQokpRw1JTImmTShxeSA/IX4eVc3fkRcXfswlcorGUWD
        4ckL8N6XgfbPjU5gNXuzv9Pn75D9GQ2i/k8VDa2AitvN
X-Google-Smtp-Source: ABdhPJyYGhd3Rl4aEfXoBBdPbYqviYjyQJ8NGtW6C3+1ndPp/9tZq2uLx4Yk1zKj/blY036D/gicj8RLJ2p/tjuh1uQ=
X-Received: by 2002:ab0:6887:: with SMTP id t7mr8378101uar.114.1631018513905;
 Tue, 07 Sep 2021 05:41:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210907123734.21520-1-linux@roeck-us.net>
In-Reply-To: <20210907123734.21520-1-linux@roeck-us.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Sep 2021 14:41:42 +0200
Message-ID: <CAMuHMdUUuhSEF2=EtkmWVFShxYaKsShdScCDuWCzazcoYDZc8A@mail.gmail.com>
Subject: Re: [PATCH v3] Input: analog: Always use ktime functions
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 7, 2021 at 2:37 PM Guenter Roeck <linux@roeck-us.net> wrote:
> m68k, mips, s390, and sparc allmodconfig images fail to build with the
> following error.
>
> drivers/input/joystick/analog.c:160:2: error:
>         #warning Precise timer not defined for this architecture.
>
> Remove architecture specific time handling code and always use ktime
> functions to determine time deltas. Also remove the now useless use_ktime
> kernel parameter.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
