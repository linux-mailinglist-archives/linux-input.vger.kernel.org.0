Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC24F5B171
	for <lists+linux-input@lfdr.de>; Sun, 30 Jun 2019 22:15:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfF3UPq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Jun 2019 16:15:46 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46713 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbfF3UPq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Jun 2019 16:15:46 -0400
Received: by mail-wr1-f66.google.com with SMTP id n4so11446700wrw.13
        for <linux-input@vger.kernel.org>; Sun, 30 Jun 2019 13:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joaomoreno-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
        bh=9rYVKL0/pSn/eewxhzuux6rx0RJc+uzCB/js30GKxtg=;
        b=2Ku9MTvHqt3rtESZS0nDj8fXN6pqoQYXKXuStjE/8g2T9GeCR4TwoILM5q+IglapSy
         3GKfmOGX4x8mqa1csdJ41pgisBMCYBZmYfiZNMY5ZySlIcnm+NdovpsB+Fe0/AfA4hnQ
         gXSy+z61trUpZ54AsGns7Ad5uo2Gr/zI4Z0v1oq5iWK/vLAIEqxIZOtuZe+zgR/3nO/G
         syFKgnUIkcn5mR7d/Pekj7Ze8gmBOf7Hq0kwJOzuDhOEeEgjkl+y0SRF0tQVngftsa6W
         GOmN0pZmP69yQpFefaluvk9h1UQfX7ZGy/oLc7Q8YcAN1A63joFyEqoj7ofTzKEFQl7+
         yJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:cc;
        bh=9rYVKL0/pSn/eewxhzuux6rx0RJc+uzCB/js30GKxtg=;
        b=oPQ7KWYbWr2x97EekB1DOPxqttF/asZ+x7C1d5gafT4KCDwH8sNA1mnQ4hEDHUd121
         wEbEL1/3RBsTtxYw/h6zI/rwmDfpitYPL4yHcAsjwiRchhy1l8BNHBrUh7BLqUNEEgpM
         v0aDcUrrC+xYmJCIzak0rZK1ueI6B4/OHC41QFBGTfrC+5mt2G6Jp9SlsxJhTO6ezMom
         OhB4rT1CpTezLNUqeQfbECpRptqyVa/kBMyzVijpfzSRmGbf5JDwR0oUUauEHdIba8ep
         KMFI6mG+5k2E/UJ05oXaloINmfPYyrq2qZor5VZ/FbBx4JaupvQPaz3v1efKc+rcZG3t
         +J5A==
X-Gm-Message-State: APjAAAUTciqOAQAo6lOmAuCaA9m9iLBA5VEibfydwUkKbXwAj+99V4t9
        K79IB1POOXBZYtpDI80hW54tfx+URzOntJMCda5wYw==
X-Received: by 2002:a5d:4609:: with SMTP id t9mt1021399wrq.85.1561925743879;
 Sun, 30 Jun 2019 13:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190610213106.19342-1-mail@joaomoreno.com>
In-Reply-To: <20190610213106.19342-1-mail@joaomoreno.com>
From:   =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Date:   Sun, 30 Jun 2019 22:15:33 +0200
Message-ID: <CAHxFc3QC147B6j4pBztjK7stLgCveeYhJWojai_SbKNbnpC9yw@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Fix stuck function keys when using FN
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri & Benjamin,

Let me know if you need something else to get this patch moving forward. This
fixes an issue I hit daily, it would be great to get it fixed.

Thanks.

On Mon, 10 Jun 2019 at 23:31, Joao Moreno <mail@joaomoreno.com> wrote:
>
> This fixes an issue in which key down events for function keys would be
> repeatedly emitted even after the user has raised the physical key. For
> example, the driver fails to emit the F5 key up event when going through
> the following steps:
> - fnmode=1: hold FN, hold F5, release FN, release F5
> - fnmode=2: hold F5, hold FN, release F5, release FN
>
> The repeated F5 key down events can be easily verified using xev.
>
> Signed-off-by: Joao Moreno <mail@joaomoreno.com>
> ---
>  drivers/hid/hid-apple.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index 1cb41992aaa1..81867a6fa047 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -205,20 +205,21 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
>                 trans = apple_find_translation (table, usage->code);
>
>                 if (trans) {
> -                       if (test_bit(usage->code, asc->pressed_fn))
> -                               do_translate = 1;
> -                       else if (trans->flags & APPLE_FLAG_FKEY)
> -                               do_translate = (fnmode == 2 && asc->fn_on) ||
> -                                       (fnmode == 1 && !asc->fn_on);
> +                       int fn_on = value ? asc->fn_on :
> +                               test_bit(usage->code, asc->pressed_fn);
> +
> +                       if (!value)
> +                               clear_bit(usage->code, asc->pressed_fn);
> +                       else if (asc->fn_on)
> +                               set_bit(usage->code, asc->pressed_fn);
> +
> +                       if (trans->flags & APPLE_FLAG_FKEY)
> +                               do_translate = (fnmode == 2 && fn_on) ||
> +                                       (fnmode == 1 && !fn_on);
>                         else
>                                 do_translate = asc->fn_on;
>
>                         if (do_translate) {
> -                               if (value)
> -                                       set_bit(usage->code, asc->pressed_fn);
> -                               else
> -                                       clear_bit(usage->code, asc->pressed_fn);
> -
>                                 input_event(input, usage->type, trans->to,
>                                                 value);
>
> --
> 2.19.1
>
