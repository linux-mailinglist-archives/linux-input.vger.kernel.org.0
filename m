Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C133219C5
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 16:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729095AbfEQO1a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 10:27:30 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44267 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728791AbfEQO13 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 10:27:29 -0400
Received: by mail-qk1-f196.google.com with SMTP id w25so4519534qkj.11
        for <linux-input@vger.kernel.org>; Fri, 17 May 2019 07:27:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=muqFwpDFSwzMFLDwS9ez5JT3+HE/sz1pnq9lfS7Gu4A=;
        b=UragCW2MbIEGZ9R1QQADHyMztUjGam5P0Iol7yzdRdzUMLuyfz1+hJ6MAbKH6g+F5g
         T2m1eAk4NXp81JMkhcdQk5yMPKAlkNVRQ62g+EhW0JEtuKs1a1+0fkK27ebyWJI3pCqG
         kFBcM2M/L1cIuNHY2OghNFYVsbZQVvixV8w6IzgD9UXS6Cq4qSbAtVzT7fH/gFlT9BS5
         c1T0YMLEUUo2AFHleCoUIevnHzZrlqP6CkRP/3NMV3fI1GZkMgRYjLyn68vUs48xl8lj
         2ysnEBs+btwulFmaYPv/22UxeqP0eqqnc12ZFiUTh+RFHTjkZIphgcbNBkzIN2pI7EIA
         aGjQ==
X-Gm-Message-State: APjAAAVIMnrlZgXzBBpf1C329HyYZwPCDfV1ZpDPOcVq6Z7LQXPk9Rc4
        LpddSZFotqkGRLvdToZ2xNkYlaWGx3tYecZMY9zofw==
X-Google-Smtp-Source: APXvYqydFBoByxrOTLh/8yVHQY1KP7vSYHmSUuC4hzNYd2TmmtB93ivOvlF/hpt+09K/Y9U7cdIzp5hEJfF50huCpm0=
X-Received: by 2002:a37:9fcf:: with SMTP id i198mr45022704qke.49.1558103249134;
 Fri, 17 May 2019 07:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190424221258.19992-1-jason.gerecke@wacom.com>
In-Reply-To: <20190424221258.19992-1-jason.gerecke@wacom.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 17 May 2019 16:27:17 +0200
Message-ID: <CAO-hwJJY=uzATrHic2F+LHOB7TMvzLJyCw2jxYcEVK1_m74B_A@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: wacom: Don't set tool type until we're in range
To:     "Gerecke, Jason" <killertofu@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        "3.8+" <stable@vger.kernel.org>,
        Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 25, 2019 at 12:13 AM Gerecke, Jason <killertofu@gmail.com> wrote:
>
> From: Jason Gerecke <jason.gerecke@wacom.com>
>
> The serial number and tool type information that is reported by the tablet
> while a pen is merely "in prox" instead of fully "in range" can be stale
> and cause us to report incorrect tool information. Serial number, tool
> type, and other information is only valid once the pen comes fully in range
> so we should be careful to not use this information until that point.
>
> In particular, this issue may cause the driver to incorectly report
> BTN_TOOL_RUBBER after switching from the eraser tool back to the pen.
>
> Fixes: a48324de6d ("HID: wacom: Bluetooth IRQ for Intuos Pro should handle prox/range")
> Cc: <stable@vger.kernel.org> # 4.11+
> Signed-off-by: Jason Gerecke <jason.gerecke@wacom.com>
> Reviewed-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
> ---

Series applied to for-5.2/fixes

Sorry for the delay

Cheers,
Benjamin

>  drivers/hid/wacom_wac.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index 747730d32ab6..4c1bc239207e 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -1236,13 +1236,13 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
>                 /* Add back in missing bits of ID for non-USI pens */
>                 wacom->id[0] |= (wacom->serial[0] >> 32) & 0xFFFFF;
>         }
> -       wacom->tool[0]   = wacom_intuos_get_tool_type(wacom_intuos_id_mangle(wacom->id[0]));
>
>         for (i = 0; i < pen_frames; i++) {
>                 unsigned char *frame = &data[i*pen_frame_len + 1];
>                 bool valid = frame[0] & 0x80;
>                 bool prox = frame[0] & 0x40;
>                 bool range = frame[0] & 0x20;
> +               bool invert = frame[0] & 0x10;
>
>                 if (!valid)
>                         continue;
> @@ -1251,9 +1251,24 @@ static void wacom_intuos_pro2_bt_pen(struct wacom_wac *wacom)
>                         wacom->shared->stylus_in_proximity = false;
>                         wacom_exit_report(wacom);
>                         input_sync(pen_input);
> +
> +                       wacom->tool[0] = 0;
> +                       wacom->id[0] = 0;
> +                       wacom->serial[0] = 0;
>                         return;
>                 }
> +
>                 if (range) {
> +                       if (!wacom->tool[0]) { /* first in range */
> +                               /* Going into range select tool */
> +                               if (invert)
> +                                       wacom->tool[0] = BTN_TOOL_RUBBER;
> +                               else if (wacom->id[0])
> +                                       wacom->tool[0] = wacom_intuos_get_tool_type(wacom->id[0]);
> +                               else
> +                                       wacom->tool[0] = BTN_TOOL_PEN;
> +                       }
> +
>                         input_report_abs(pen_input, ABS_X, get_unaligned_le16(&frame[1]));
>                         input_report_abs(pen_input, ABS_Y, get_unaligned_le16(&frame[3]));
>
> --
> 2.21.0
>
