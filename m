Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 278E32324B
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2019 13:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731529AbfETL02 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 May 2019 07:26:28 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:39566 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730431AbfETL02 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 May 2019 07:26:28 -0400
Received: by mail-vs1-f67.google.com with SMTP id m1so8647991vsr.6;
        Mon, 20 May 2019 04:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eYh3p3HOpcT4lqNgMmCyvjbW7kHHw9/gDlHs2k58eGw=;
        b=TReJRrOBIrjYzIgLhpEvlRRuL2kGPQ66n47k8mK3e7Jb0HJzfC/DoPb/tFPUPJBl1r
         3yQneYCiGLsMtED0F8c8iQnaMtanV7f2JB8wYP6Di9noZ1g15MV6IdpWUmgso3iCp+sR
         jWs/hd7cjMIgym2wuoNfsbZowfny5snrw/EQlzO9IGnHrp02FAP8KxdkdlS2/UeAbU34
         2PwNUw8e2lZQODjD2obCQycQdwURkujP3FLVWS8ntByELmKy4fdKPzeV7yYSeQkC/ccU
         d+io7Bg3AfGiy76mFj1xYaINEnCP1sR/ZGuGGDcn9ExQPn+l3k9jVOXR/nUzxEatcpI0
         cxbg==
X-Gm-Message-State: APjAAAWUq86GrFhfG3WI8MYXiBUgwuaL+3YmcWFqw1dWwD122slcALfP
        e4lQiQHN5QhS7IOlpF2qkaqtcD3211A95cjvJBQ=
X-Google-Smtp-Source: APXvYqx2/1lpRKgbhti/JX9ovB4TCThYW3GOJfDwqfHbDDKQrIgtEUROBuRz9N303BnNhhdNUvfE+7TC7XDQ0wuG1Cc=
X-Received: by 2002:a67:f589:: with SMTP id i9mr3259018vso.152.1558351587535;
 Mon, 20 May 2019 04:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190520092711.30662-1-wsa+renesas@sang-engineering.com> <20190520092711.30662-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190520092711.30662-2-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 20 May 2019 13:26:15 +0200
Message-ID: <CAMuHMdXAgvW4aZc7LmjNSrK3F2RCSC=QtOtDGS_xAu7SFAjFBw@mail.gmail.com>
Subject: Re: [PATCH RESEND 1/2] input: da9063_onkey: remove platform_data support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-input@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, May 20, 2019 at 12:40 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> There are no in-kernel users anymore, so remove this outdated interface.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>
> Tested-by: Steve Twiss <stwiss.opensource@diasemi.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
