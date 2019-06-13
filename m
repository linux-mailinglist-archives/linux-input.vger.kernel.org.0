Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0246D44A98
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 20:26:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbfFMS0x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 14:26:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35992 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727314AbfFMS0x (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 14:26:53 -0400
Received: by mail-pl1-f196.google.com with SMTP id d21so8498621plr.3
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 11:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DCSwLCAumFrPz4M+TgatLYzC2CNUxBHne1EyoUjckX4=;
        b=DRZH+bbs/PxFORs+fs8o/Z/vFJ9lOPYBCTz8KJ0ez2NGE93BleqM4m3xLsXk8uPKdn
         4fO2/l2PdlE2rWbY72e2SY0dHuZbwb0y8kL1OEwG4O9SJ0308kLRYYG22sLpePVXClqS
         DBxulwp11rR9In4MAt+LJuDAoqvgkgnpT6LtpC5EqwQbSK9m9fX9e1LLZ8lfDhr59KKD
         aTf3/txuFs3YgaSAzvBgVItKHmJPuVgrtGEj9+oMMLYqDldSeeAKIRHIqXC5CJ3yZMqE
         qdWlENTC25TGjbItWsM6aCPv6c2QCAu5KTCSIVHThiPyvsvLdo5M95fHyCxxn4YQUPUV
         v+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DCSwLCAumFrPz4M+TgatLYzC2CNUxBHne1EyoUjckX4=;
        b=SFzv/AG8kRkV/fv7G54o9SLjBGEzqVNeM/A+fL6sh8QWTZ0eNHb8vPmn+TsljDLy1s
         X2xTvHlNXyTedasgc8zC3LKePDiPPaLFlpb8hWz8RuuhYgjg+QKGqIkRIw7QAgKVU815
         smHTpKh373+kVVJmkNN+5utPgmCAQCqetjaSFPOSgE1mc+WqRKghln9tg9++/glTmU9T
         sPoQFF4WKbyCoCp0cKJdMzpZItFn/oBwFCB5CGZw7jzY7rjtmZ8LumZd5g6rqkNB6Srw
         LA5LG6fcbCJ8s2mIzuhgjYPBYT1HPQzTPkXC/t6nxZClEGglipOSgr63utBtUUmj+AF7
         KaIw==
X-Gm-Message-State: APjAAAUbaEIzqs50y5udcaM9ETiqQjBgVEt/oOQ5zoQUROFUIblyb87j
        eb7N+WohHk3Oer28K50mejYDahoPFSjd+LqJ9rje6c4k
X-Google-Smtp-Source: APXvYqyuIOy41PtVn3XCILRP3Kw2qLTEAWNAnwrQCLdwZu2+UKzrSEwu3zpW6r8J7vsVr7599DvMhNLa8VTiAsiRJ3g=
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr73666606plq.223.1560450412105;
 Thu, 13 Jun 2019 11:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnjTxzXgPHQcC7K8N5YkTvh66sy86oorPJZc07b7UBhGw@mail.gmail.com>
 <20190613182326.237391-1-nhuck@google.com>
In-Reply-To: <20190613182326.237391-1-nhuck@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 13 Jun 2019 11:26:41 -0700
Message-ID: <CAKwvOd=252Ak-VQ20XtsGaRXEfraxtNTNjhjYfdrsWv_7OHsoQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: atmel_mxt_ts - fix -Wunused-const-variable
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     nick@shmanahar.org, dmitry.torokhov@gmail.com,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 13, 2019 at 11:24 AM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> Changes from v1 -> v2
> * Moved definition of mxt_video_fops into existing ifdef

Thanks for the v2.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> @@ -256,16 +256,6 @@ enum v4l_dbg_inputs {
>         MXT_V4L_INPUT_MAX,
>  };
>
> -static const struct v4l2_file_operations mxt_video_fops = {
> -       .owner = THIS_MODULE,
> -       .open = v4l2_fh_open,
> -       .release = vb2_fop_release,
> -       .unlocked_ioctl = video_ioctl2,
> -       .read = vb2_fop_read,
> -       .mmap = vb2_fop_mmap,
> -       .poll = vb2_fop_poll,
> -};
> -
>  enum mxt_suspend_mode {
>         MXT_SUSPEND_DEEP_SLEEP  = 0,
>         MXT_SUSPEND_T9_CTRL     = 1,
> @@ -2218,6 +2208,16 @@ static int mxt_init_t7_power_cfg(struct mxt_data *data)
>  }
>
>  #ifdef CONFIG_TOUCHSCREEN_ATMEL_MXT_T37
> +static const struct v4l2_file_operations mxt_video_fops = {
> +       .owner = THIS_MODULE,
> +       .open = v4l2_fh_open,
> +       .release = vb2_fop_release,
> +       .unlocked_ioctl = video_ioctl2,
> +       .read = vb2_fop_read,
> +       .mmap = vb2_fop_mmap,
> +       .poll = vb2_fop_poll,
> +};
> +

-- 
Thanks,
~Nick Desaulniers
