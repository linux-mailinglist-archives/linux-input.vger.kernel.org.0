Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74C1DCAE47
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 20:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729993AbfJCSfP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 14:35:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:49474 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388309AbfJCSfP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 14:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570127713;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RTMENbih6iijQ9dlDl/6i1xREO8UhrKYbrBbztUnU2o=;
        b=bgnatwRW7/mo+60RilcyF97tjfrDdWMNAdqDCvDHKU5ZPeqsqkOuRiTo/v7A3QalAR9jZf
        NM2RBed9S0PWO5ykySNkkWMDkmfhOppee757TQzNkR6R+dZQdNzFtUzU18O9N7G1l9Kzqz
        69SF3ooh0iSZBN9vNVoemPSOvUYN1CI=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-h0-A0HN1OB-B0zuoODfkxA-1; Thu, 03 Oct 2019 14:35:11 -0400
Received: by mail-qk1-f197.google.com with SMTP id k67so3661785qkc.3
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2019 11:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EyEBFcoclk0k8j6w3rMJI9yX9wb88qrPD3qqvau6GSE=;
        b=cAnt1dK6vJ4AuNNbJuIMfkkuNBLUpLrxE9B1LpdjhZed/zA8Tsdd1OeQBfBI3su1n+
         k0WKrxjGtpywuI/xQ3pPTybn7dM92ltXdTbZ/+GroJFA3Jt/Jal4mMynY/Fglcr4MSKK
         mXD/ah1fV4f6bpIXqIfJ7nCBdjOJefz8ZG+T+KvlumnxVS30Yz3XSVDIYwGBCLsPmzBj
         0SFPup6oql9HK3mZeHDBPke2ce02fVtIQnYbBrv9ps1YS4bLY9CicdoZe0SjOGDq2Upv
         YLDdROSFS7NftbCi0L0w4/IVTMhE3TTVRXlXjLjOHlPNzLmZjm2xMPcLZWmHgf9oY6WR
         CJ5Q==
X-Gm-Message-State: APjAAAWspjD4FvPzebdcUL40ReMeeHa8RWITGAsC3WKx2o13tuQ++NXl
        gNuQrpEyW5HTrTEMAbN2G/kmJ/lFW8/l5k/WfWvICqkEoYMx3bchenY3N2+NXB3uz2o31oskip6
        zCKo/2WiPHpOz22hZgHN9HoRAF7bNyV1LdZgBmQg=
X-Received: by 2002:a37:5887:: with SMTP id m129mr5700270qkb.27.1570127710763;
        Thu, 03 Oct 2019 11:35:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPabDzehR5qiqX01GyYVQ9AZvGW8yw2/ObOo/CM+TKkKRwFdBL9hhoAIlkf7yckrDXv+Uo+KS8XS17NN2bfFY=
X-Received: by 2002:a37:5887:: with SMTP id m129mr5700250qkb.27.1570127710450;
 Thu, 03 Oct 2019 11:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191002215812.GA135681@dtor-ws>
In-Reply-To: <20191002215812.GA135681@dtor-ws>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 3 Oct 2019 14:34:59 -0400
Message-ID: <CAO-hwJ+v1jJJ=APP__84SPrFdR+Te8nAxR6DirD8a9US_Bm4wQ@mail.gmail.com>
Subject: Re: [PATCH] Input: add input_get_poll_interval()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
X-MC-Unique: h0-A0HN1OB-B0zuoODfkxA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Wed, Oct 2, 2019 at 5:58 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Some drivers need to be able to know the current polling interval for
> devices working in polling mode, let's allow them fetching it.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Not sure if you really need my input on this one, but, sure, looks good to =
me:
Acked-By: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> ---
>  drivers/input/input-poller.c | 9 +++++++++
>  include/linux/input.h        | 1 +
>  2 files changed, 10 insertions(+)
>
> diff --git a/drivers/input/input-poller.c b/drivers/input/input-poller.c
> index 1b3d28964bb2..7d6b4e8879f1 100644
> --- a/drivers/input/input-poller.c
> +++ b/drivers/input/input-poller.c
> @@ -123,6 +123,15 @@ void input_set_max_poll_interval(struct input_dev *d=
ev, unsigned int interval)
>  }
>  EXPORT_SYMBOL(input_set_max_poll_interval);
>
> +int input_get_poll_interval(struct input_dev *dev)
> +{
> +       if (!dev->poller)
> +               return -EINVAL;
> +
> +       return dev->poller->poll_interval;
> +}
> +EXPORT_SYMBOL(input_get_poll_interval);
> +
>  /* SYSFS interface */
>
>  static ssize_t input_dev_get_poll_interval(struct device *dev,
> diff --git a/include/linux/input.h b/include/linux/input.h
> index 31da4feaa1d8..a420324b7882 100644
> --- a/include/linux/input.h
> +++ b/include/linux/input.h
> @@ -387,6 +387,7 @@ int input_setup_polling(struct input_dev *dev,
>  void input_set_poll_interval(struct input_dev *dev, unsigned int interva=
l);
>  void input_set_min_poll_interval(struct input_dev *dev, unsigned int int=
erval);
>  void input_set_max_poll_interval(struct input_dev *dev, unsigned int int=
erval);
> +int input_get_poll_interval(struct input_dev *dev);
>
>  int __must_check input_register_handler(struct input_handler *);
>  void input_unregister_handler(struct input_handler *);
> --
> 2.23.0.444.g18eeb5a265-goog
>
>
> --
> Dmitry

