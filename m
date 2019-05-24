Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660A2294EE
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2019 11:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390400AbfEXJhl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 May 2019 05:37:41 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:41771 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390141AbfEXJhl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 May 2019 05:37:41 -0400
Received: by mail-qk1-f196.google.com with SMTP id m18so6472346qki.8
        for <linux-input@vger.kernel.org>; Fri, 24 May 2019 02:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qxgWthsSczjYm5g7wCu6D6tqthzuV0FTUO3+NeUn/Bo=;
        b=IeEpTr3ROQU7fP1LImfiS321RSEKYImhFMvymsdATGYO0GPk3FG23uC33Xo8pZ7c5C
         8d6bmbUIq6WVfrz0RRLzX7plxPxkWEYU4AREhWWl10WdY34L4pt5JdMRDs6mIv8okQnR
         9xa3b8YIdiDq+CGgOOVJ/xO3DgZB+LHSaDCcmpmavZ3b9OYWflDjuKwbmoAhhtbuueNb
         BNKu4jEcllnNrOvR4PgGSuaTxuKa2WXc8Zc6Z1XnuisG7vzNJfdCCZpxh6YNwJ4JNeJj
         Ml8QTzBHcDxDj/t5s3LoDpVjytIDkdYbYdePzQw4mBa/VbWMT9me6XxuXpXoTA/DzG7J
         QRIg==
X-Gm-Message-State: APjAAAVUpEqALAu5lRTLgYMRChdZ874ZhDtZZ+d/f8rfJq/qwFbLFyIk
        eSZGIGuOJ6LcITuHMsWjpHirRK//hEshI9NiT36t7w==
X-Google-Smtp-Source: APXvYqz8zZEEohpGrz5iBPjP3Q9w7mIF5v77zQN6fgvT0NjqYILavDv+oKvWzlDMEP0atNrkrsXiM+Jm68wn3bvJ68w=
X-Received: by 2002:ac8:2998:: with SMTP id 24mr61772494qts.31.1558690660552;
 Fri, 24 May 2019 02:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190521132712.2818-1-benjamin.tissoires@redhat.com> <20190521132712.2818-9-benjamin.tissoires@redhat.com>
In-Reply-To: <20190521132712.2818-9-benjamin.tissoires@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 24 May 2019 11:37:29 +0200
Message-ID: <CAO-hwJJXGTZq7zRVhcFNwh-kOo0rUhZOsNtFX1yA93Km=L+ynA@mail.gmail.com>
Subject: Re: [PATCH v2 08/10] Input: elan_i2c - export true width/height
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        KT Liao <kt.liao@emc.com.tw>, Rob Herring <robh+dt@kernel.org>,
        Aaron Ma <aaron.ma@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 21, 2019 at 3:28 PM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> The width/height is actually in the same unit than X and Y. So we should
> not tamper the data, but just set the proper resolution, so that userspace
> can correctly detect which touch is a palm or a finger.
>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
>
> --
>
> new in v2
> ---
>  drivers/input/mouse/elan_i2c_core.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index 7ff044c6cd11..6f4feedb7765 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -45,7 +45,6 @@
>  #define DRIVER_NAME            "elan_i2c"
>  #define ELAN_VENDOR_ID         0x04f3
>  #define ETP_MAX_PRESSURE       255
> -#define ETP_FWIDTH_REDUCE      90
>  #define ETP_FINGER_WIDTH       15
>  #define ETP_RETRY_COUNT                3
>
> @@ -915,12 +914,8 @@ static void elan_report_contact(struct elan_tp_data *data,
>                         return;
>                 }
>
> -               /*
> -                * To avoid treating large finger as palm, let's reduce the
> -                * width x and y per trace.
> -                */
> -               area_x = mk_x * (data->width_x - ETP_FWIDTH_REDUCE);
> -               area_y = mk_y * (data->width_y - ETP_FWIDTH_REDUCE);
> +               area_x = mk_x * data->width_x;
> +               area_y = mk_y * data->width_y;
>
>                 major = max(area_x, area_y);
>                 minor = min(area_x, area_y);
> @@ -1123,8 +1118,10 @@ static int elan_setup_input_device(struct elan_tp_data *data)
>                              ETP_MAX_PRESSURE, 0, 0);
>         input_set_abs_params(input, ABS_MT_TOUCH_MAJOR, 0,
>                              ETP_FINGER_WIDTH * max_width, 0, 0);
> +       input_abs_set_res(input, ABS_MT_TOUCH_MAJOR, data->x_res);
>         input_set_abs_params(input, ABS_MT_TOUCH_MINOR, 0,
>                              ETP_FINGER_WIDTH * min_width, 0, 0);
> +       input_abs_set_res(input, ABS_MT_TOUCH_MINOR, data->y_res);

I had a chat with Peter on Wednesday, and he mentioned that this is
dangerous as Major/Minor are max/min of the width and height. And
given that we might have 2 different resolutions, we would need to do
some computation in the kernel to ensure the data is correct with
respect to the resolution.

TL;DR: I don't think we should export the resolution there :(

KT, should I drop the patch entirely, or is there a strong argument
for keeping the ETP_FWIDTH_REDUCE around?

Cheers,
Benjamin


>
>         data->input = input;
>
> --
> 2.21.0
>
