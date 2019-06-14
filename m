Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD364678D
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 20:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfFNS1Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 14:27:16 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:39182 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfFNS1P (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 14:27:15 -0400
Received: by mail-io1-f66.google.com with SMTP id r185so1891524iod.6
        for <linux-input@vger.kernel.org>; Fri, 14 Jun 2019 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZb2REwkbeVZNXHI5fD+3eiWIkNOiT6DsVe5Q+EGgfg=;
        b=pleZuKHPpcSGTua34WVC3ejtokF/dddBNXBFlhnTlorTPZW9amP6aXAw5vwqXsxSYO
         Bjg6XWscFzvXr22osb9EwPAhLuYqRREhw1AiceBqkK/MjhQAguNauLQ4dSuwCNoMR4KX
         0mbEkr9nyLUp1jvlva+zycg8gtJGLdrjNWcPYa8Z+Mz4pPF/3pqnH3q103rFbQE6u/Gn
         hgyYTeWa3DoTPs8Jbm36m/PneEe0xVpoj3ZzHKHBZh5stBRSLlp5t8DP4BvX8zF24Ii1
         j0Pnf3FGW8bF20iMY9JyDxKwwf8JqJ4Pni6kh2hu9kOuGZAyCiJz9OT8VzQoqWe6jvV1
         fbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZb2REwkbeVZNXHI5fD+3eiWIkNOiT6DsVe5Q+EGgfg=;
        b=CjxfD05B1OJEF9uDSvrBWQQteiizboFJdvZF7/P8u/8CO9/wbMn/brwLbnwLxSq6T7
         qMAoNm5h4fCipGixCk8HAVwxI+cKc+vjgTM15xxcDJUAArT8/e1aJJ78PJdFy6FBe61/
         S8/6QCmjNk3j/DEo74iLRKxgl0Xy8wnr7bVY+eOXjYU6xjZHhXkk5qTSFgjpdW744Pef
         8yQR8n/Md8Ta9/sb1lhoYAvleUdp9J0ZA7i5kjRczw4YQPYo/8M30t4mQHesLkSl4D4A
         VFOFR0QQB7RFtoUQOYUTDz75iyplf5t+DjjsClU4yjvHQ2ZwzzfzJqScwAuAwejvElVz
         Q0AQ==
X-Gm-Message-State: APjAAAUjFtJwdAyYs9q+V76RWZ552uxrXNSzA3A0dxaCIzXUwt5sZrtZ
        0NpHT6cPRACPrFSLs0DFPM+TmrKLWZEb2j9WXd7hmQ==
X-Google-Smtp-Source: APXvYqzSjJjFKhhfDcZckLiQ5FFkrM2TpYF1hRv9WSd3h7HTHAOZ7F2c+oKGJXp+eVZEF6KwqOAmCXvnjCIsAK7ORCA=
X-Received: by 2002:a6b:901:: with SMTP id t1mr16642472ioi.42.1560536834818;
 Fri, 14 Jun 2019 11:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190614065438.142867-1-phoenixshen@chromium.org>
In-Reply-To: <20190614065438.142867-1-phoenixshen@chromium.org>
From:   Enrico Granata <egranata@google.com>
Date:   Fri, 14 Jun 2019 11:27:03 -0700
Message-ID: <CAPR809sASD=MrQkJULVBgc_iqiPKE2xr8eUR0d4qymQkLUYRaw@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: mask out extra flags in event_type
To:     Ting Shen <phoenixshen@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Enrico Granata <egranata@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 13, 2019 at 11:54 PM Ting Shen <phoenixshen@chromium.org> wrote:
>
> http://crosreview.com/1341159 added a EC_MKBP_HAS_MORE_EVENTS flag to
> the event_type field, the receiver side should mask out this extra bit when
> processing the event.
>
> Signed-off-by: Ting Shen <phoenixshen@chromium.org>

Reviewed-by: Enrico Granata <egranata@google.com>

>
> ---
>
>  drivers/input/keyboard/cros_ec_keyb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index d5600118159835..38cb6d82d8fe67 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -237,7 +237,7 @@ static int cros_ec_keyb_work(struct notifier_block *nb,
>         if (queued_during_suspend && !device_may_wakeup(ckdev->dev))
>                 return NOTIFY_OK;
>
> -       switch (ckdev->ec->event_data.event_type) {
> +       switch (ckdev->ec->event_data.event_type & EC_MKBP_EVENT_TYPE_MASK) {
>         case EC_MKBP_EVENT_KEY_MATRIX:
>                 pm_wakeup_event(ckdev->dev, 0);
>
> --
> 2.22.0.rc2.383.gf4fbbf30c2-goog
>
