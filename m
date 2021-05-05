Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA563746FA
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 19:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhEERgO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 13:36:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239487AbhEERbV (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 May 2021 13:31:21 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFCFC07E5F7
        for <linux-input@vger.kernel.org>; Wed,  5 May 2021 09:57:34 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id n138so3571305lfa.3
        for <linux-input@vger.kernel.org>; Wed, 05 May 2021 09:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2Rkiic1Qu5JUyXDgw7mY1fOZmJcCWfsiNziLqg7Wlo=;
        b=JYizrWyK02sThSbFQwjDEqxWacSLOX+HiHOuavlPwv6otO/1VqE5O2XtC2jOK/aUOD
         /3IVSoq+eY1SVvZjM5I1nc6nROOaI6uju5rHaA6hQ4tgzq+BVC6z1oIx5qcpiKLNZaLy
         LkO94YggpCRpXgV/5/2WaF85cNFw2TEiPqnA+XoHN2aurBzp+c4HZv5ZA6P/D3/NaOnr
         cqT4fMLGNmfP1PDwovqz52zuKZwTsibd1WdiLBM1gf7uirktx0n8xksElqggqYEwQtue
         ITYEXXjU0I3TkbQ3yZ1tSaCbck4+4PqBxYucEMraROfPjbzh5H8Z6FuFxEZ0p/qRgWgf
         oh8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2Rkiic1Qu5JUyXDgw7mY1fOZmJcCWfsiNziLqg7Wlo=;
        b=NUY+SuadxqAUR1YRBXZ0b5du+ehLr+LD2kJMvVXCxDJfavCw2KkHy65mpJsMSIxbb9
         UAASKHDHFTGTHrsa0sUBx92kq24vHDdHDmuOXsFR+nKG4D8RA8mnYbobRun+UUJaQbGX
         H8bUy1gvhUPBCejjmtR384bgYMrJa2FGflH3tUg5LB6h5pQslOKpVYYm/QN2oANZqoCB
         SzQYyIKHXck9ZLALHBJ3ZsK/o6x1lEe20LI0UvB9inkbNnlTDAXwhuRtd0X7usxIYI2n
         0mDVs3D67nDErESrtoomBXF3jPrqKvd4tUJ6X8APU8xJQOW3AwKIrzeYbwTfNFFBw7iN
         GFfQ==
X-Gm-Message-State: AOAM533MciMf/C8Zju83UFWe8QNP9F0iK2Sv2be6fsvpoRpq0ZJdujQk
        k1WB3BsZQFkhv+XHyj+CjI4vPjPgoSaf6Pid62EVoQ==
X-Google-Smtp-Source: ABdhPJzzaK7bU9VxXE56biKtUu0R+rle9JF1mX286hoB/BX/R3ldbxHgVdl4uAmbva9abcBivR0Luuh0xiiAv9sJLis=
X-Received: by 2002:a19:4082:: with SMTP id n124mr21510445lfa.154.1620233852801;
 Wed, 05 May 2021 09:57:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210414021201.2462114-1-lzye@google.com>
In-Reply-To: <20210414021201.2462114-1-lzye@google.com>
From:   Chris Ye <lzye@google.com>
Date:   Wed, 5 May 2021 09:57:21 -0700
Message-ID: <CAFFuddLDgidkqDsihCU0VpXC_qEXVww67DmoFOvRdgrrPgOj_A@mail.gmail.com>
Subject: Re: [PATCH] [v5] Input: Add "Select" button to Microsoft Xbox One controller.
To:     =?UTF-8?Q?=C5=81ukasz_Patron?= <priv.luk@gmail.com>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Chris Ye <lzye@google.com>, Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?Q?Olivier_Cr=C3=AAte?= <olivier.crete@ocrete.ca>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Bastien,
      Can you please take a look at the patch v5, which has restored
the same tab formatting?
Thanks! Regards,
Chris

On Tue, Apr 13, 2021 at 7:12 PM Chris Ye <lzye@google.com> wrote:
>
> Add "Select" button input capability and input event mapping for
> Microsoft Xbox One controller. From product site this is also referred as
> "Share" button.
> Fixed Microsoft Xbox One controller select button not working under USB
> connection.
>
> Signed-off-by: Chris Ye <lzye@google.com>
> ---
>  drivers/input/joystick/xpad.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index 9f0d07dcbf06..cfbf1747b205 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -79,6 +79,7 @@
>  #define MAP_DPAD_TO_BUTTONS            (1 << 0)
>  #define MAP_TRIGGERS_TO_BUTTONS                (1 << 1)
>  #define MAP_STICKS_TO_NULL             (1 << 2)
> +#define MAP_SELECT_BUTTON              (1 << 3)
>  #define DANCEPAD_MAP_CONFIG    (MAP_DPAD_TO_BUTTONS |                  \
>                                 MAP_TRIGGERS_TO_BUTTONS | MAP_STICKS_TO_NULL)
>
> @@ -130,6 +131,7 @@ static const struct xpad_device {
>         { 0x045e, 0x02e3, "Microsoft X-Box One Elite pad", 0, XTYPE_XBOXONE },
>         { 0x045e, 0x02ea, "Microsoft X-Box One S pad", 0, XTYPE_XBOXONE },
>         { 0x045e, 0x0719, "Xbox 360 Wireless Receiver", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360W },
> +       { 0x045e, 0x0b12, "Microsoft Xbox One X pad", MAP_SELECT_BUTTON, XTYPE_XBOXONE },
>         { 0x046d, 0xc21d, "Logitech Gamepad F310", 0, XTYPE_XBOX360 },
>         { 0x046d, 0xc21e, "Logitech Gamepad F510", 0, XTYPE_XBOX360 },
>         { 0x046d, 0xc21f, "Logitech Gamepad F710", 0, XTYPE_XBOX360 },
> @@ -862,6 +864,8 @@ static void xpadone_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char
>         /* menu/view buttons */
>         input_report_key(dev, BTN_START,  data[4] & 0x04);
>         input_report_key(dev, BTN_SELECT, data[4] & 0x08);
> +       if (xpad->mapping & MAP_SELECT_BUTTON)
> +               input_report_key(dev, KEY_RECORD, data[22] & 0x01);
>
>         /* buttons A,B,X,Y */
>         input_report_key(dev, BTN_A,    data[4] & 0x10);
> @@ -1672,6 +1676,8 @@ static int xpad_init_input(struct usb_xpad *xpad)
>             xpad->xtype == XTYPE_XBOXONE) {
>                 for (i = 0; xpad360_btn[i] >= 0; i++)
>                         input_set_capability(input_dev, EV_KEY, xpad360_btn[i]);
> +               if (xpad->mapping & MAP_SELECT_BUTTON)
> +                       input_set_capability(input_dev, EV_KEY, KEY_RECORD);
>         } else {
>                 for (i = 0; xpad_btn[i] >= 0; i++)
>                         input_set_capability(input_dev, EV_KEY, xpad_btn[i]);
> --
> 2.31.1.295.g9ea45b61b8-goog
>
