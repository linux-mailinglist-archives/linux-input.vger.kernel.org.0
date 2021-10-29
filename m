Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45FF843FC09
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 14:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhJ2MKk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 08:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230475AbhJ2MKj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 08:10:39 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7206EC061570;
        Fri, 29 Oct 2021 05:08:11 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id r194so12231693iod.7;
        Fri, 29 Oct 2021 05:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e4Rv3/mcjOVlhXZ7TMouyTudSZ29ks7Rlhn+yTPvGj4=;
        b=cnRLlVxGc0w2CjWlVdoVYrL82r+CNqdMLV1kIB2zTXO/7WBhM6BQK2unrQenxjJA1e
         sRtHidsvVDDv4F6XJt8ORJIN+A7eiP8DlCzn6wWF9DtpX0f867D9jRqC1EH6S9FwmkF+
         t+wUTM0hRvefFj3dB4s8IPzhwRNqn7ap+3DseJ/iFH0cmQPd/z+UxECh4LMxMatFB2YQ
         W3CAyPvnAszgruaMWXHVsHCVU0eEg/iy6SWCq7HQNWSfxGKjiJmQ3ZtRoGTsi/KfX0kJ
         /v3p+arJKBaysHWsdFZmeJAiak66yphonHgztMa4KoHjb2h9Ug3yYfP/wy2YE/oYdpKK
         llrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e4Rv3/mcjOVlhXZ7TMouyTudSZ29ks7Rlhn+yTPvGj4=;
        b=aG+yo7oWQizvGUEIGGbcRVm2uLfA1wI2H0BkOFijEI2vDpVhh9u6h+wbEDfukLOItz
         8jD1pdJqnuHf8zRja84ZcuaacqzWxz1v90lmQkU6+pZQ5wFBWBU2k0ljtqH8c3DM9ljI
         19x8PT24VOirOl4YJ8p3C52i0BlzFtVufHvqZ8u+DFrSgPKFzB34M7oz9aVmN95/a07Q
         KR7S1oDxPZLgsVFHppmgp3NmubXnhi3qWdyTJmFynfU+dRUrl+O7oZEgMOmQYcV8Re3q
         +f2+CY20T03KTHjpymk/DBj5JcBSkMhWS1Rc8J+es4VDHUD2Md/aQYooG/VBLJAQy9Qa
         5ACQ==
X-Gm-Message-State: AOAM532zNqm0WMxjO5ohk3QruWj3fhrWCPqFIKHAkAJIwBOx5+3P0Dj6
        T3pLi0Ge6UXx83PvoKwG+6t3+LfSOVk1Ess7nq0=
X-Google-Smtp-Source: ABdhPJykA962TYrQxEgtI3k4wI5dCWJ+jbT+TnorF8GWerD6n4D33xZdDnVFxMbAWCesv6V8oH+AmzCHYIcoSnATpAg=
X-Received: by 2002:a05:6638:12cd:: with SMTP id v13mr8115427jas.84.1635509290870;
 Fri, 29 Oct 2021 05:08:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211029031043.3330240-1-yangyingliang@huawei.com>
In-Reply-To: <20211029031043.3330240-1-yangyingliang@huawei.com>
From:   Silvan Jegen <s.jegen@gmail.com>
Date:   Fri, 29 Oct 2021 14:07:59 +0200
Message-ID: <CAKvUva8WWhXXOjaDvssKTkQMq17pxDUHNQKjwfKvT1GQyvktgA@mail.gmail.com>
Subject: Re: [PATCH -next] HID: nintendo: fix missing unlock on error in joycon_leds_create()
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     lkml <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 29, 2021 at 5:04 AM Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Add the missing unlock before return from function joycon_leds_create()
> in the error handling case.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: c5e626769563 ("HID: nintendo: add player led support")
> Fixes: 697e5c7a34b0 ("HID: nintendo: add home led support")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/hid/hid-nintendo.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

LGTM!

For what it's worth:

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>


Cheers,
Silvan
