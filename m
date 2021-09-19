Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57623410B2E
	for <lists+linux-input@lfdr.de>; Sun, 19 Sep 2021 12:43:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhISKod (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Sep 2021 06:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbhISKoc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Sep 2021 06:44:32 -0400
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B66EC061574
        for <linux-input@vger.kernel.org>; Sun, 19 Sep 2021 03:43:07 -0700 (PDT)
Received: by mail-qt1-x830.google.com with SMTP id x9so324187qtv.0
        for <linux-input@vger.kernel.org>; Sun, 19 Sep 2021 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QQVLCs3feXOdpWC9oaFbBIs1Ixi74ppCKg3crPU4wdE=;
        b=A3Z4OihD8r2hAaS01qGDXwMGNgi7fA+0rYbA+7UFp2CKsgOJa8O0gPJpFVJ+maTrv+
         86xnfn/Y0Gzyeddu4kYH8RMmV0BJRFnwH4tVJXBP2Ckzx38hTGH0guEZB99TgO8jLwpe
         JKkiviEvQk/sOXIGtaDuIlLCC7fEo5LmKnB0EAyk4wkNEJR8E99U8pYlo7hN2H6i3Mhx
         r0bTW4ZwP++djOMcUwjIBZXC0UnokAkzEnjjU1HlkAqLxWMeTe1k0WmckuVYESdoRgRL
         AC9YcOHmBICgxH941aJPe5Kc/Ws/zxpR20kVhbcgj4+a4AqwSEfM6P3ZsQPERiBCYi8K
         6xPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QQVLCs3feXOdpWC9oaFbBIs1Ixi74ppCKg3crPU4wdE=;
        b=axA02egM/v6yq1vQewTYcDLZPZKvhTEbAyEFw8SdSH2p7JGZIEnCA5QFUTUGCaNbQw
         iuAKheb9+INp+YCHMATlQsaKEmWmdvYzTqgCUYwzNMXiQ7KFU7sZpq/Kkdhw53Y1zlEg
         rqBn6wvsUycFEadr3EXnptk+voj8UPJfyR6bOb/GhrWjb6uQLEWvsFD+powfudNRk9fS
         uHtbn3ogXeNpLW/3da1A2tdQjvrZjLZ3zl/rCpmHGzdE1e36V/jqyd6gt/HWOHxiPNeS
         yWLpBsNDGuksWwEzfD4L17t4iIRe/0rrJxQICGonmYRH6xv3F4SJW5nEJF7tPC/WSR1r
         o82A==
X-Gm-Message-State: AOAM530PTxn8FnWZN9tNoFQaKaBk5YOeXBswxSeSfTQa54pIrtXHt2p0
        6pL79tUROWp6qSB87cTwMPcQWj4t/oxk4kphC7s=
X-Google-Smtp-Source: ABdhPJwlAQ5nrYTiW02hDdQfebU51XmGshXEX98GqFcXPqxBNBMAIp3sChaXOYF1CUGRwHnj+72cQ8o4wQOSh6rFS88=
X-Received: by 2002:ac8:5a8d:: with SMTP id c13mr1707438qtc.345.1632048186622;
 Sun, 19 Sep 2021 03:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210818152743.163929-1-tobias.junghans@inhub.de>
 <20210818152743.163929-2-tobias.junghans@inhub.de> <CACRpkdZSmiVPOY8==pAhnUnYUn5xv6Wf5-tKEEJrpcqPF47++w@mail.gmail.com>
In-Reply-To: <CACRpkdZSmiVPOY8==pAhnUnYUn5xv6Wf5-tKEEJrpcqPF47++w@mail.gmail.com>
From:   rishi gupta <gupt21@gmail.com>
Date:   Sun, 19 Sep 2021 16:12:55 +0530
Message-ID: <CALUj-gvpwhYW8FuTaEjSmgNUhMTizYKvXDxAu6c6SNPbHNdOyg@mail.gmail.com>
Subject: Re: [PATCH 2/2] HID: mcp2221: configure GP pins for GPIO function
To:     Linus Walleij <linus.walleij@linaro.org>,
        Tobias Junghans <tobias.junghans@inhub.de>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thanks Linus.

Hi Tobias, few observations on code:
1. Copy-paste error; please change set to get in comments for struct
mcp_get_sram_settings.
2. If mcp_configure_gp() fails, we have invalid copy of
mcp->gp_runtime_settings (new value is not set actually but we have
updated this array with new value)..

Regards,
Rishi

On Fri, Sep 17, 2021 at 4:44 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Wed, Aug 18, 2021 at 5:28 PM Tobias Junghans
> <tobias.junghans@inhub.de> wrote:
>
> > Per default the GP pins of an MCP2221 are designated to a certain
> > dedicated or alternate function. While it's possible to change these
> > defaults by manually updating the internal flash, it's much more
> > convenient and safe to configure the GP pins as GPIOs automatically
> > at runtime whenever the corresponding GPIO line is requested. The
> > previous setting is restored as soon as the GPIO line is freed again.
> >
> > Signed-off-by: Tobias Junghans <tobias.junghans@inhub.de>
>
> My sympathies are usually on the side of users trying to make
> use of their hardware and they should be able to.
>
> For other wrong configured GPIO expanders such as FTDI
> a publicly available firmware reflash tool exists, and if that does
> not exist for this hardware, I think this approach is legitimate.
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij
