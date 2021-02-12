Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82CFF319BA9
	for <lists+linux-input@lfdr.de>; Fri, 12 Feb 2021 10:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBLJJ6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Feb 2021 04:09:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20697 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229959AbhBLJIm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Feb 2021 04:08:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613120823;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nUMtxNWdDYqqp5pLtgtHaEVtyMueew/lZOWdJCDaDYE=;
        b=iW4kzmfqHjoYm/UdZAbCEk+3SbCBYZv1l248zYGbIdvfwQrv92hiiWAzXYoGf15HdFPdtL
        c8E2jF85zrmtejG2RuZwyE/R48fr6TKZ0hMpII5GlIYWQ6sRcPhTa0V0JVnx9+2qu5LcQ4
        g+xkNtXYAeUYJumCj5N/dfaAyaC7s/4=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-ohpzZva1OtuHFGMotFDJLA-1; Fri, 12 Feb 2021 04:07:02 -0500
X-MC-Unique: ohpzZva1OtuHFGMotFDJLA-1
Received: by mail-pf1-f198.google.com with SMTP id c18so6918574pfd.8
        for <linux-input@vger.kernel.org>; Fri, 12 Feb 2021 01:07:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nUMtxNWdDYqqp5pLtgtHaEVtyMueew/lZOWdJCDaDYE=;
        b=pzDBzgwV0HTc8V/R8DTw92VgGOjEt4tPwIRp5s+i74gTrUJyUp+I/AT6J7kTJjO6rx
         lfuCwoSQNXVpWLhw8ro/5afKx5QxxMKC9r1uczkDd4bvCjf9sJVRQO3nzsj4nec4KRUZ
         XX3bf3odbafn868iguO7lWBe7RBFUq1jfy9N4SdYvyI7eocziV2D1rBm57IS7aXNAJuG
         ua38KactpIxUZ7mGF4fgLtgZrEXA3zQejblc8UGtuuPY2gGnbrZR1cjaRb2tckhpdeSt
         OfB8A9dWq6oFCzKuDVMHSDXweX1MqDj+b5syRhX9SCCh7nys4gPeW1N5O4G9COdpJVgn
         Kh5w==
X-Gm-Message-State: AOAM532YoUScze588wncSEhakG2KVIZFpOFbGCGt0RGjHCBBkMG7jZrO
        Wj07j/T9NbifE0eVXcq2Mzz65rhCtxRW/pOd3JQB8Zk5mIv9YZYHh9Pt6GPe/zUTpoFZ53vCMH+
        YihG3gHsJ/22yVlznZDNkAZYxRPv/W7Cv1PwMnJc=
X-Received: by 2002:aa7:824e:0:b029:1d2:a000:b0d8 with SMTP id e14-20020aa7824e0000b02901d2a000b0d8mr2067502pfn.35.1613120821149;
        Fri, 12 Feb 2021 01:07:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyxtB71z+LHdFhyaaINLVFY3BMoGIRl2W7gpKIFgyTOCBzMlZnVbMj25oo0+UH7eBzLc2Ss10ehtr310O9HweU=
X-Received: by 2002:aa7:824e:0:b029:1d2:a000:b0d8 with SMTP id
 e14-20020aa7824e0000b02901d2a000b0d8mr2067494pfn.35.1613120820912; Fri, 12
 Feb 2021 01:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20210212064100.27193-1-roderick@gaikai.com>
In-Reply-To: <20210212064100.27193-1-roderick@gaikai.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 12 Feb 2021 10:06:50 +0100
Message-ID: <CAO-hwJKfj027b2nYceg626DdU_dQ63GVMEqg4S3VvW372xuJ4A@mail.gmail.com>
Subject: Re: [PATCH] HID: playstation: fix unused variable in ps_battery_get_property.
To:     Roderick Colenbrander <roderick@gaikai.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Feb 12, 2021 at 7:41 AM Roderick Colenbrander
<roderick@gaikai.com> wrote:
>
> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> The ret variable in ps_battery_get_property is set in an error path,
> but never actually returned. Change the function to return ret.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> ---

Applied, thanks for the quick fix.

Cheers,
Benjamin

>  drivers/hid/hid-playstation.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index cc93c16cc822..408b651174cf 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -391,7 +391,7 @@ static int ps_battery_get_property(struct power_supply *psy,
>         uint8_t battery_capacity;
>         int battery_status;
>         unsigned long flags;
> -       int ret;
> +       int ret = 0;
>
>         spin_lock_irqsave(&dev->lock, flags);
>         battery_capacity = dev->battery_capacity;
> @@ -416,7 +416,7 @@ static int ps_battery_get_property(struct power_supply *psy,
>                 break;
>         }
>
> -       return 0;
> +       return ret;
>  }
>
>  static int ps_device_register_battery(struct ps_device *dev)
> --
> 2.26.2
>

