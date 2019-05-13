Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D33701BFD3
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2019 01:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbfEMX3g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 May 2019 19:29:36 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:35937 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfEMX3g (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 May 2019 19:29:36 -0400
Received: by mail-it1-f195.google.com with SMTP id e184so1876090ite.1;
        Mon, 13 May 2019 16:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rtdS0CPt+KXs3fztvztze0GdhDynP5SWZdqJdsS7jhw=;
        b=e6RfnoI3GvtRryuu49WvItVvfO2IBbxKR3quyPAmjt5/P9W19bXXmR+kJw7ggAdmY3
         qv+AtbIdlc/vUkP+dZlc8e4Oxafq8S4ZfWQfzF2zo8/riGy79EbJO4CTaAcH7QfwU+oH
         KNq5afDMwv1Gt4j5dldmh24HjJpsTX8xmTaFotkO30nYdg87ZaeOqpa1qYjnq8X//jXp
         eCpVY5tnVFVKbga14dOa4PHMDZFnUfCnM1L4mYS9hCQIPjr1z3AfSdmHeg0d6/9FcjGu
         UEmEHQcbaHfbaNHNQMXp/khFKUBMWdI0RNaUpM6SwToP74UDU5GIpPJpYY9MI+eyraFv
         gqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rtdS0CPt+KXs3fztvztze0GdhDynP5SWZdqJdsS7jhw=;
        b=j+kimHFylmwsQHo/Pu8FVIGnLoEbl7weilqjmbt+bbfMI8yAc8mRt8ZPxnzAO1ayx8
         xQintYU+QUeIyYXFSPSEJbzWu1KdLuj9GKNXfNGJna8fm+2EET5fKdN0twdbSkkZcbGi
         1QjyqWoVgq1w+ouC430Or6FF2D0BLAf6AiOd2QjQFEpsCOU2qYF8zUp8nXsEy6TLCYjU
         2okjodiKjb2TUK8bRzOnD1YDaRVKOYkUn5i3XVVGmfC2FE5Yna9v3VeAtvOkA1aGGnAj
         thj84mMUB0Agd9SWQlM9c3e/umY477Mh/xKaGypTZuLwYDKFuX6M06AZtrIaQXpxLhyr
         ZDbw==
X-Gm-Message-State: APjAAAV/z4Lu91APOGJbW8VZcuAFM5C6XFsIqUTNmUQ7jr7ECrnkmh9u
        HS7McXnC6L3ogbMgUXKEVQRMaCEt3Gf19BUwiY0=
X-Google-Smtp-Source: APXvYqwnZy0aPOhfxku+EZ3um3xxIXTiHzBDOghwwtE68RixOb6imSYi2wsYfJVc6aPDDe0pb10rVzg/JlbM8NRwGm8=
X-Received: by 2002:a02:52c9:: with SMTP id d192mr21476496jab.53.1557790175103;
 Mon, 13 May 2019 16:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190513220610.177489-1-ravisadineni@chromium.org>
In-Reply-To: <20190513220610.177489-1-ravisadineni@chromium.org>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Mon, 13 May 2019 16:29:23 -0700
Message-ID: <CAKdAkRQ_J6QWxtWpoRQnNWKcJpXox6xVDZWcWYOXkBhPSn99Rw@mail.gmail.com>
Subject: Re: [PATCH V1] elan_i2c: Increment wakeup count if wake source.
To:     Ravi Chandra Sadineni <ravisadineni@chromium.org>
Cc:     =?UTF-8?B?5buW5bSH5qau?= <kt.liao@emc.com.tw>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Abhishek Bhardwaj <abhishekbh@google.com>,
        Todd Broch <tbroch@google.com>,
        lkml <linux-kernel@vger.kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ravi,

On Mon, May 13, 2019 at 3:06 PM Ravi Chandra Sadineni
<ravisadineni@chromium.org> wrote:
>
> Notify the PM core that this dev is the wake source. This helps
> userspace daemon tracking the wake source to identify the origin of the
> wake.

I wonder if we could do that form the i2c core instead of individual drivers?

>
> Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> ---
>  drivers/input/mouse/elan_i2c_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
> index f9525d6f0bfe..2c0561e20b7f 100644
> --- a/drivers/input/mouse/elan_i2c_core.c
> +++ b/drivers/input/mouse/elan_i2c_core.c
> @@ -981,6 +981,8 @@ static irqreturn_t elan_isr(int irq, void *dev_id)
>         if (error)
>                 goto out;
>
> +       pm_wakeup_event(dev, 0);
> +
>         switch (report[ETP_REPORT_ID_OFFSET]) {
>         case ETP_REPORT_ID:
>                 elan_report_absolute(data, report);
> --
> 2.20.1
>

Thanks.

-- 
Dmitry
