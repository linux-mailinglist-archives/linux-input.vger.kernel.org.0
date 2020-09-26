Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6903D2795B5
	for <lists+linux-input@lfdr.de>; Sat, 26 Sep 2020 02:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgIZA4U (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 25 Sep 2020 20:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729842AbgIZA4T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 25 Sep 2020 20:56:19 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4AAEC0613D3
        for <linux-input@vger.kernel.org>; Fri, 25 Sep 2020 17:56:17 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so4823772pfg.13
        for <linux-input@vger.kernel.org>; Fri, 25 Sep 2020 17:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CkABhTM4+gjBXbsGX0LKRrzMtJbpdlgplZ12ZAe2qrc=;
        b=DVs4M+SVZf3NvmzPd0twXi8GkXf0+XVQGkPJ2D5CbIsOtbNbqrwJ2VVhFgG/rPZSqB
         I+Yp6uBnQrGo21fG/nSKSViim0KzpxCSnQF25GAa8WkdW6DOraFnT+6SH6rf1QgQOg1b
         lNbBhEa3rddjvkKJGLOR3cSiWpXS5bMM1B7Qn36rQOZuirHL1lPJmHPvS9sV2/3PDIGO
         xxMU2vUq2REiFopho9DeLWl6VIsO+4XVfHVBLC6rQDQLqhd7F826uPNDL0Z9BPU64kON
         PYLczhyUVg1pXKKiZmTR+nuNLFXfvFNg5GCEXZ6l2Dki04r93ZghdDNepAn5tuAriGLI
         B0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CkABhTM4+gjBXbsGX0LKRrzMtJbpdlgplZ12ZAe2qrc=;
        b=QfJDnI2vxg8p2YJvw2tV0cqHM8VWjepCXNVyQJpv4TmmSszhKK9B231IG8WRl4oyt4
         Yb8/7u6Uja6edgLoUak2L3GzrkRvlGkVQN+prItG5npOjFirz4Jy5nwME/FA30XzO3HP
         2VaxxesadUmpMbgA80AVQZQ5BGvvIhVsuaQyyvg65+4Y3k25asleQ9eB/haXDSXxthhp
         WWeU5kSWyKMQM+Gl1JK/E0o5SYQZv+88sevtQrd0QLOV9d0QWaj/k/kh0K0eaFJvodR6
         QOzWgeOjq5pKyaw5OnuraW119YN28pprU4M+G5sqMkAnaUft5XyLPZk1fYKNfW0ZYP7u
         Wz5Q==
X-Gm-Message-State: AOAM5310t5e/bqPUghFOVLGpLcyPAZaZ8cwSRm1uvDa8Bqh4phis0RFR
        kgBUgvk/EuK6PEKUx8xJ8DR87pPU3Qzifp9k/gdHdZ5Bmq90wQ==
X-Google-Smtp-Source: ABdhPJx8y4D99gbo4fzAmw2sgsfjzir8Myjf2rJn647+B5G232Sfyky5gCDStSbt/YC5fFqEgZfvaAxvInPmtYPnvWc=
X-Received: by 2002:a63:36cc:: with SMTP id d195mr1221093pga.426.1601081777097;
 Fri, 25 Sep 2020 17:56:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200925233552.GA4022480@dtor-ws>
In-Reply-To: <20200925233552.GA4022480@dtor-ws>
From:   Kenneth Albanowski <kenalba@google.com>
Date:   Fri, 25 Sep 2020 17:56:06 -0700
Message-ID: <CALvoSf7mjHwUhfnW_nHbsJk5=ZFVCNR5Ae1fXmhDf8PM68Oe2Q@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-input: fix stylus battery reporting
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

[Re-send to appease the mail daemons]

Confirmed, I've validated this on a 4.19 derivative, this fixes the
problem and battery strength gets reported again.

- Kenneth Albanowski


On Fri, Sep 25, 2020 at 4:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> With commit 4f3882177240 hid-input started clearing of "ignored" usages
> to avoid using garbage that might have been left in them. However
> "battery strength" usages should not be ignored, as we do want to
> use them.
>
> Fixes: 4f3882177240 ("HID: hid-input: clear unmapped usages")
> Reported-by: Kenneth Albanowski <kenalba@google.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>
> Kenneth, can you please try this one and see if it fixes your issue?
>
>  drivers/hid/hid-input.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index dea9cc65bf80..5da631d2ec9b 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -797,7 +797,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 case 0x3b: /* Battery Strength */
>                         hidinput_setup_battery(device, HID_INPUT_REPORT, field);
>                         usage->type = EV_PWR;
> -                       goto ignore;
> +                       return;
>
>                 case 0x3c: /* Invert */
>                         map_key_clear(BTN_TOOL_RUBBER);
> @@ -1059,7 +1059,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>                 case HID_DC_BATTERYSTRENGTH:
>                         hidinput_setup_battery(device, HID_INPUT_REPORT, field);
>                         usage->type = EV_PWR;
> -                       goto ignore;
> +                       return;
>                 }
>                 goto unknown;
>
> --
> 2.28.0.681.g6f77f65b4e-goog
>
>
> --
> Dmitry
