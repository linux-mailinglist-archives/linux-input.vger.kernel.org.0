Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D825BB33B8
	for <lists+linux-input@lfdr.de>; Mon, 16 Sep 2019 05:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728809AbfIPD0a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Sep 2019 23:26:30 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:46164 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728768AbfIPD03 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Sep 2019 23:26:29 -0400
Received: by mail-qt1-f196.google.com with SMTP id u22so3828563qtq.13
        for <linux-input@vger.kernel.org>; Sun, 15 Sep 2019 20:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHLN0YgFwIwYHZwb2pxqsYeg1mD8xv4r4aaeCn/rYDg=;
        b=giWqacrfQiVrlrnNCNX19zBLZpYkzv/d++9UCHt+m3d0xxFhBXFbrJvUf9PYWWGly9
         QwgCJhzTNtLQmfoHehdFE6KdHrmNsKx8VG6TI3VHmw54e8OGcYdzW9yfAbV0rgZ2wnu+
         0Gvll6Br3/x5sSMVkiy3N1y0nyInMPEA/3gog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHLN0YgFwIwYHZwb2pxqsYeg1mD8xv4r4aaeCn/rYDg=;
        b=VzHqouTGFmsKxAsuKuD4mkHpe7cwo6A8GpxDFAmCE+PQx2pymu0Y6pQZoxkFbzpykP
         zu8t6JHpBHXMeNApObJkFPWJcCNkf9US893xt9LoAZGqq1ZnvecIcIxNY1mdJ5TY6dee
         n1rKVpLeIHkoMNz95NLQ1u9cPtGu6KU44E/H8XmQ7DprmlfYevN+ywR9ElcFIXKagzvH
         Rf3pInRKM6MxujR3l5GgjveyEo6bEECWdq8bY0/P0VhOvio+0qB4wBJEtEYE99HU4ya9
         TiCJ9GCqxMgwTB253TQLSUE+uDbTJj9dmkUrpXJxE3xDsOIdAvO6vRB7uNrO835rZkVP
         4GkQ==
X-Gm-Message-State: APjAAAUlnhSeh6i/i4A33uHncMbIjBXfNM2q1KqWGZOD9xnu5ufR4Iag
        S4QUuuqf6ryX3G5boWbBI1beHBMY6tI99VkCeadfqA==
X-Google-Smtp-Source: APXvYqx4qQhOGqxA9L1RqOKMV0wdsrWpPIh1F9cp74vnCrQahZ7zJmqiFQZxyRi9xirkjPYk6Emlx9le5w5PNtjR/Ag=
X-Received: by 2002:ac8:3647:: with SMTP id n7mr15936531qtb.159.1568604387185;
 Sun, 15 Sep 2019 20:26:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190913220317.58289-1-dtor@chromium.org>
In-Reply-To: <20190913220317.58289-1-dtor@chromium.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 16 Sep 2019 11:26:16 +0800
Message-ID: <CANMq1KALGLdZmOgcrrOROU5BXjwnXWSfq6fr85jfRn079JympQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: google: whiskers: more robust tablet mode detection
To:     Dmitry Torokhov <dtor@chromium.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Sep 14, 2019 at 6:03 AM Dmitry Torokhov <dtor@chromium.org> wrote:
>
> The USB interface may get detected before the platform/EC one, so let's
> note the state of the base (if we receive event) and use it to correctly
> initialize the tablet mode switch state.
>
> Also let's start the HID interface immediately when probing, this will
> ensure that we correctly process "base folded" events that may be sent
> as we initialize the base. Note that this requires us to add a release()

s/release/remove/ ?

> function where we stop and close the hardware and switch the LED
> registration away from devm interface as we need to make sure that we
> destroy the LED instance before we stop the hardware.
>
> Signed-off-by: Dmitry Torokhov <dtor@chromium.org>
> ---
>  drivers/hid/hid-google-hammer.c | 71 ++++++++++++++++++++++++++-------
>  1 file changed, 56 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index 84f8c127ebdc..4f64f93ddfcb 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -208,7 +209,14 @@ static int __cbas_ec_probe(struct platform_device *pdev)
>                 return error;
>         }
>
> -       input_report_switch(input, SW_TABLET_MODE, !cbas_ec.base_present);
> +       if (!cbas_ec.base_present)
> +               cbas_ec.base_folded = false;

I'm not sure to see why this is necessary? The folded base state
should be in bss and false anyway, and even if it was true, it would
not change the result of the expression below (!cbas_ec.base_present
|| cbas_ec.base_folded).

> +
> +       dev_dbg(&pdev->dev, "%s: base: %d, folded: %d\n", __func__,
> +               cbas_ec.base_present, cbas_ec.base_folded);
> +
> +       input_report_switch(input, SW_TABLET_MODE,
> +                           !cbas_ec.base_present || cbas_ec.base_folded);
>
>         cbas_ec_set_input(input);
>
