Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A37E8B483
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 11:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbfHMJrg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 05:47:36 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39115 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbfHMJrf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 05:47:35 -0400
Received: by mail-qk1-f193.google.com with SMTP id 125so6106982qkl.6
        for <linux-input@vger.kernel.org>; Tue, 13 Aug 2019 02:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kc38QbcHV7pkptm5fiPW3dVekfJJ+xCxwUWXKBIaN8U=;
        b=RWWrNVi9zhN6jA53rD5YyEnuQ3736IwlQbfyNGthICPxreJz/TAJi7/YoKrFormYA3
         xXViBLLAdVjnrUBe82FiPrJrV871oPvdim/1uM1KHWarwvpyontipCCoptsjCa6GSN3C
         JXL97YxRXUApdUZCHhynLD4frQIcK6FPX9pp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kc38QbcHV7pkptm5fiPW3dVekfJJ+xCxwUWXKBIaN8U=;
        b=CwTmxlp8zCWvE3pbm/DflTUpcLtLafyM8UIl0w9M2V/b6mIBo7i7IssJu2mjLF/K5A
         SDjS0ZlqBYgXi7qG6XVYiLJZLl2m9rxa0TEVfS/NGk3ZbfC3dSgKlQpFCFLKzbrthq4g
         YqjGiO/pmdKVRFlaAdEtb1KV59psNwaryfBzfrk482WGUN6jq1iBDLR6WbhbaNkfEXUw
         aP1BQqkOwFJIkR33a5/cVfwh3D1Ea/BEc21cBJPEEm/2K3oG/gN5FQQ223nRl15MXsyN
         PyN48B1rcP4WKLJNXI0tsuMs7SpYJJ6VgUh/khjZoiXKbqxQOoo5Ix/C4lATj7zOteTN
         ahVQ==
X-Gm-Message-State: APjAAAU3+Kn/HSfG/aX0ZbEIWfKhDfgdSp26vkLM5ADA4uErFqpYRkJF
        BIinEmDZ4AwB385IdH64BH/W48DvKzgjfHB2JLE2AA==
X-Google-Smtp-Source: APXvYqxXFONLv0MJfh+N2hROFpIG7VWcScq3DFuMkmvG7aRa+F5ZRj+wqMfPnVrfEPQp0iLTZ1ClWWx1CBcp6Ze1N0c=
X-Received: by 2002:a37:5ec7:: with SMTP id s190mr22499051qkb.299.1565689654858;
 Tue, 13 Aug 2019 02:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190813093821.74158-1-fshao@chromium.org>
In-Reply-To: <20190813093821.74158-1-fshao@chromium.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Tue, 13 Aug 2019 17:47:22 +0800
Message-ID: <CANMq1KCNFfWA=ApVUFoPctgTftHDSAvGjtk-Xu2hcKWBq9R1zw@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add back missing mask for event_type
To:     Fei Shao <fshao@chromium.org>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Ting Shen <phoenixshen@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 13, 2019 at 5:38 PM Fei Shao <fshao@chromium.org> wrote:
>
> In the previous patch we didn't mask out event_type in case statement,
> so switches are always picked instead of buttons, which results in
> ChromeOS devices misbehaving when power button is pressed.
> This patch adds back the missing mask.
>
> Fixes: d096aa3eb604 ("Input: cros_ec_keyb: mask out extra flags in event_type")
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 38cb6d82d8fe..bef7bee6f05e 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -226,6 +226,8 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>  {
>         struct cros_ec_keyb *ckdev = container_of(nb, struct cros_ec_keyb,
>                                                   notifier);
> +       uint8_t mkbp_event_type = ckdev->ec->event_data.event_type &
> +                                 EC_MKBP_EVENT_TYPE_MASK;
>         u32 val;
>         unsigned int ev_type;
>
> @@ -237,7 +239,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>         if (queued_during_suspend && !device_may_wakeup(ckdev->dev))
>                 return NOTIFY_OK;
>
> -       switch (ckdev->ec->event_data.event_type & EC_MKBP_EVENT_TYPE_MASK) {
> +       switch (mkbp_event_type) {
>         case EC_MKBP_EVENT_KEY_MATRIX:
>                 pm_wakeup_event(ckdev->dev, 0);
>
> @@ -264,7 +266,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>         case EC_MKBP_EVENT_SWITCH:
>                 pm_wakeup_event(ckdev->dev, 0);
>
> -               if (ckdev->ec->event_data.event_type == EC_MKBP_EVENT_BUTTON) {
> +               if (mkbp_event_type == EC_MKBP_EVENT_BUTTON) {
>                         val = get_unaligned_le32(
>                                         &ckdev->ec->event_data.data.buttons);
>                         ev_type = EV_KEY;
> --
> 2.23.0.rc1.153.gdeed80330f-goog
