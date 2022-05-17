Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA60752AC98
	for <lists+linux-input@lfdr.de>; Tue, 17 May 2022 22:18:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243918AbiEQUSQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 May 2022 16:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbiEQUSQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 May 2022 16:18:16 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61A4C517FF
        for <linux-input@vger.kernel.org>; Tue, 17 May 2022 13:18:14 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id o190so4515iof.10
        for <linux-input@vger.kernel.org>; Tue, 17 May 2022 13:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QTSp12H1RtePJILWuPcGUZbUnQ819OXiFWrO/S9Rzp0=;
        b=H8yZa044h/82YdRxKOxoANFHRprfcg+4xwL+TQvpqPiCOfax/+bM1KTy5Um8ZnoJ52
         2aIQmKBJRkcaemkMn2A+lk0jmVD/ZA8VACTdkCVvw9qGQ+15uayUMPPHnOim2O0+WBO1
         qukJ2u/BSHYHC0S6fiR5IjM0CXYogYbYLA3Q2XduRtKdzpzRqQjyOJdsXMrRTG2upuic
         eU0ZMxq1+dRHk8Eu0onVU+Wnwvv6AyppXLZmsbr8UH2noCBPjhL/nWlSPEX/luJ/FrBZ
         Ekvbnavzh4oFUEhtVWmJhH9X/zE8cb00JLVADClj7N2gIPS7WWQSGA52B0/hhnd5Xpj/
         vQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QTSp12H1RtePJILWuPcGUZbUnQ819OXiFWrO/S9Rzp0=;
        b=gdm8woROJA41EgKtvhVnEzvzRNf1rEDGDpHpK5KNiDyq0Iu6xah511v+YUmDxrzNVx
         E+g2pDnZpV6tLCLPCIecag9vMGjJF95TESWQ7M0KhzBmknCw4LM3ut/cxYKeg1kDYSxk
         5zN7/HZqfyghfhqj9XEV6wYg9RBmm8YSk+ow8V8LsJTgvujIg3Hzuna6Tf+cPf3PAyhV
         qJRqQqDYgW/1Xnqs38oLEYi+LAK0QP3XycldnOARaW7sLfb59ItIHPOKht0y5U6nsCTA
         GZHpuJIdEhAEKUI/qcwhMxzOazxumxvvtl/cBjj806lYecIUjIQge2FsQDI6f6/ikDZY
         Zgsw==
X-Gm-Message-State: AOAM532oetiAeOpwAC1P7sGX59j588K45bw/gHMq6ZfSAxXLBRwVNCSH
        eL9OodnK6HOaD6fdnrSHpOpIeacbXmbl3qZn9Qh+GENp
X-Google-Smtp-Source: ABdhPJw4K+Odjxr8UNNeBiF3kDgGMqQFgE82zFJK8mUjnZLD+UtnWjwbXL4NgZQ5Vn95L1duU6wa+7FJk6ycjt3fG/8=
X-Received: by 2002:a05:6602:1815:b0:658:c186:c1cc with SMTP id
 t21-20020a056602181500b00658c186c1ccmr10996971ioh.25.1652818693811; Tue, 17
 May 2022 13:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220513215156.14914-1-ping.cheng@wacom.com>
In-Reply-To: <20220513215156.14914-1-ping.cheng@wacom.com>
From:   Ping Cheng <pinglinux@gmail.com>
Date:   Tue, 17 May 2022 12:10:32 -0700
Message-ID: <CAF8JNhKCNsk186mrQz7mVCsT4nFrby5povog1gKjnve7XPvp+w@mail.gmail.com>
Subject: Re: [PATCH 1/2] HID: wacom: Only report rotation for art pen
To:     jikos@kernel.org
Cc:     linux-input@vger.kernel.org, Aaron.Skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>,
        Jason Gerecke <jason.gerecke@wacom.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

Sorry for the noise. Both patches in this set are bug-fixing. I forgot
to add Cc: stable@vger.kernel.org in the patches. This patch (1/2) can
be backported to 4.9 or later; the other one (2/2) can be backported
to 4.14 or later.

Thanks a lot,
Ping




On Fri, May 13, 2022 at 2:52 PM Ping Cheng <pinglinux@gmail.com> wrote:
>
> The generic routine, wacom_wac_pen_event, turns rotation value 90
> degree anti-clockwise before posting the events. This non-zero
> event trggers a non-zero ABS_Z event for non art pen tools. However,
> HID_DG_TWIST is only supported by art pen.
>
> Signed-off-by: Ping Cheng <ping.cheng@wacom.com>
> Reviewed-by: Jason Gerecke <jason.gerecke@wacom.com>
> --
> Hi Jiri,
>
> This is kind of a version 2 of the last one I posted two days ago.
> I updated the logic so it has less changed lines: 29 vs 158! Hopefully,
> the logic is easier to follow now. Please ignore the last one.
>
> Thank you!
> ---
>  drivers/hid/wacom_wac.c | 29 +++++++++++++++++++++--------
>  1 file changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
> index a7176fc0635d..3bee4f46003d 100644
> --- a/drivers/hid/wacom_wac.c
> +++ b/drivers/hid/wacom_wac.c
> @@ -638,9 +638,26 @@ static int wacom_intuos_id_mangle(int tool_id)
>         return (tool_id & ~0xFFF) << 4 | (tool_id & 0xFFF);
>  }
>
> +static bool wacom_is_art_pen(int tool_id)
> +{
> +       bool is_art_pen = false;
> +
> +       switch (tool_id) {
> +       case 0x885:     /* Intuos3 Marker Pen */
> +       case 0x804:     /* Intuos4/5 13HD/24HD Marker Pen */
> +       case 0x10804:   /* Intuos4/5 13HD/24HD Art Pen */
> +               is_art_pen = true;
> +               break;
> +       }
> +       return is_art_pen;
> +}
> +
>  static int wacom_intuos_get_tool_type(int tool_id)
>  {
> -       int tool_type;
> +       int tool_type = BTN_TOOL_PEN;
> +
> +       if (wacom_is_art_pen(tool_id)
> +               return tool_type;
>
>         switch (tool_id) {
>         case 0x812: /* Inking pen */
> @@ -655,12 +672,9 @@ static int wacom_intuos_get_tool_type(int tool_id)
>         case 0x852:
>         case 0x823: /* Intuos3 Grip Pen */
>         case 0x813: /* Intuos3 Classic Pen */
> -       case 0x885: /* Intuos3 Marker Pen */
>         case 0x802: /* Intuos4/5 13HD/24HD General Pen */
> -       case 0x804: /* Intuos4/5 13HD/24HD Marker Pen */
>         case 0x8e2: /* IntuosHT2 pen */
>         case 0x022:
> -       case 0x10804: /* Intuos4/5 13HD/24HD Art Pen */
>         case 0x10842: /* MobileStudio Pro Pro Pen slim */
>         case 0x14802: /* Intuos4/5 13HD/24HD Classic Pen */
>         case 0x16802: /* Cintiq 13HD Pro Pen */
> @@ -718,10 +732,6 @@ static int wacom_intuos_get_tool_type(int tool_id)
>         case 0x10902: /* Intuos4/5 13HD/24HD Airbrush */
>                 tool_type = BTN_TOOL_AIRBRUSH;
>                 break;
> -
> -       default: /* Unknown tool */
> -               tool_type = BTN_TOOL_PEN;
> -               break;
>         }
>         return tool_type;
>  }
> @@ -2323,6 +2333,9 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
>                 }
>                 return;
>         case HID_DG_TWIST:
> +               /* don't modify the value if the pen doesn't support the feature */
> +               if (!wacom_is_art_pen(wacom_wac->id[0])) return;
> +
>                 /*
>                  * Userspace expects pen twist to have its zero point when
>                  * the buttons/finger is on the tablet's left. HID values
> --
> 2.25.1
>
