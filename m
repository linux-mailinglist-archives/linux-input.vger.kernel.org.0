Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC6CC128F5
	for <lists+linux-input@lfdr.de>; Fri,  3 May 2019 09:36:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfECHgx convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 3 May 2019 03:36:53 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:38410 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfECHgx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 May 2019 03:36:53 -0400
Received: by mail-qk1-f196.google.com with SMTP id g141so3100830qke.5
        for <linux-input@vger.kernel.org>; Fri, 03 May 2019 00:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xzylViG06UDrl8qCxsp7ThbrDB00Pxpkx005XhyXahQ=;
        b=OA+vGe04zSovqQw6nQqZVcVK9YAee4VnTpXNFaahIwCT7yfLuekc7mgOWQ8eXQbbo3
         8nWBgbebBdBcZRboCzk/AdbpG6xXF9YedqMH40P/O3xezRZYPwt3qEsb52apgMDAUuzk
         O1YF3HZNcRyFKhdPMo2F+2EbkSbr/WtCYfbsIjk4++r5obN6ia9biQnAe3xToIzE+ySk
         DbUR7ArGDnvDkJ8HlYd2WkTNgHwBSgowppYcmY/HkuOpQDeza9yZflltByGnvSvhI4Hd
         UxFKtgDBscU0tyu5Od2ATYGswiQ6FvlaWBBRXmPLqMO8OacmbOqYQSXQDYgYeJSVtzEK
         B//w==
X-Gm-Message-State: APjAAAV94eDhjEQ4515y3UZgOhruPwb8XTWuMHNXHpxTDrWGqzvcmd/I
        /msSeVla6/vJPrhlBzAiPrcpLWYK73rdjjY+XrQItw==
X-Google-Smtp-Source: APXvYqyIsqGLjp75uF1SF/L0Djh/dTDa+d93umAo3X1oCbQ6EpMLa/5JAO+oVAUPYMf9Dqaev0XE4HgeM37VlKylQ0I=
X-Received: by 2002:a37:7b03:: with SMTP id w3mr6249139qkc.266.1556869012560;
 Fri, 03 May 2019 00:36:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190502213639.7632-1-spaz16@wp.pl>
In-Reply-To: <20190502213639.7632-1-spaz16@wp.pl>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 3 May 2019 09:36:41 +0200
Message-ID: <CAO-hwJLbFv3S9M5N+BKBuafj8H-vToy=2VQd=cvohmaTHLMC3A@mail.gmail.com>
Subject: Re: [PATCH] HID: fix A4Tech horizontal scrolling
To:     =?UTF-8?B?QsWCYcW8ZWogU3pjenlnaWXFgg==?= <spaz16@wp.pl>
Cc:     igorkuo@gmail.com, Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Thu, May 2, 2019 at 11:37 PM Błażej Szczygieł <spaz16@wp.pl> wrote:
>
> Since recent high resolution scrolling changes the A4Tech driver must
> check for the "REL_WHEEL_HI_RES" usage code.
>
> Fixes: 2dc702c991e3774af9d7ce410eef410ca9e2357e (HID: input: use the
> Resolution Multiplier for high-resolution scrolling)
>
> Signed-off-by: Błażej Szczygieł <spaz16@wp.pl>

Thanks for the patch. I do not doubt this fixes the issues, but I
still wonder if we should not export REL_HWHEEL_HI_RES instead of
REL_HWHEEL events.

Also, I can not figure out how the events are processed by the kernel.
Could you attach a hid-recorder dump of the mouse wheels with
hid-recorder from https://gitlab.freedesktop.org/libevdev/hid-tools ?

This should give me a better view of the mouse, and I could also add
it to the regression tests I am running for each commit.

Cheers,
Benjamin

> ---
>  drivers/hid/hid-a4tech.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-a4tech.c b/drivers/hid/hid-a4tech.c
> index 9428ea7cdf8a..fafb9fa558e7 100644
> --- a/drivers/hid/hid-a4tech.c
> +++ b/drivers/hid/hid-a4tech.c
> @@ -38,7 +38,7 @@ static int a4_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>  {
>         struct a4tech_sc *a4 = hid_get_drvdata(hdev);
>
> -       if (usage->type == EV_REL && usage->code == REL_WHEEL)
> +       if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES)
>                 set_bit(REL_HWHEEL, *bit);
>
>         if ((a4->quirks & A4_2WHEEL_MOUSE_HACK_7) && usage->hid == 0x00090007)
> @@ -60,7 +60,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>         input = field->hidinput->input;
>
>         if (a4->quirks & A4_2WHEEL_MOUSE_HACK_B8) {
> -               if (usage->type == EV_REL && usage->code == REL_WHEEL) {
> +               if (usage->type == EV_REL && usage->code == REL_WHEEL_HI_RES) {
>                         a4->delayed_value = value;
>                         return 1;
>                 }
> @@ -77,7 +77,7 @@ static int a4_event(struct hid_device *hdev, struct hid_field *field,
>                 return 1;
>         }
>
> -       if (usage->code == REL_WHEEL && a4->hw_wheel) {
> +       if (usage->code == REL_WHEEL_HI_RES && a4->hw_wheel) {
>                 input_event(input, usage->type, REL_HWHEEL, value);
>                 return 1;
>         }
> --
> 2.21.0
>
