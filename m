Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 367E72F6561
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 17:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbhANQFN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 11:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbhANQFM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 11:05:12 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09096C061574;
        Thu, 14 Jan 2021 08:04:45 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id c1so3843958qtc.1;
        Thu, 14 Jan 2021 08:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wj4RY/1mLJ+M8kkBzK7aF9kbRs3YK/jGXD5u+dQ8ZGg=;
        b=mkN77poB4ZHPZ78ff/OSW1T3/WeSf4lT4Z+NUv7KjHrSvjWWtOeOxSybPEKuTYScRi
         SiM3XZc2qkY/DhcpvwyrqbsbRD/q7+gsGJ7Z7UMV+NhT+Pu3cLAXOsNI10IofSutA+TM
         IvcyN/3ahrTf02m+KGPHXe6TAiz5zYaZXDGC42BFbr9cRZbPx27RfAfcnHtJaWU64GkF
         o3KDk1dkgF763+uXSSfT9T31U5ZEkwqkYM/SXb3dyH6sW24WjkXJCzVQZtffCcHNMykv
         VXHKiXqDg99Cg42by7pRA5OGtiX1XAv44eVvA991owy77nxPtN4hkpAW87DtfWNcg4E6
         kaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wj4RY/1mLJ+M8kkBzK7aF9kbRs3YK/jGXD5u+dQ8ZGg=;
        b=UCv1PfLOfwspwBT9d1Hj66z0xd2kA9kv2uQJPXAAMyFI5jP2NOqE9vjfCsE5jPlWP2
         t0/7Xu4pCUUiiGAX0M8A6YhI3USDjdm1BVnWQQdpXs84bILCunVqWmiYrB/FWP2Oa/wZ
         WVgl/lxzHNB66PWxIBztrvgQEwFsNidFriHLd8TlR/KYl/mx5e+6GlNdfkKHVw/rl2bS
         51uWa56ijbqib5nkxCYv0gNS/px0ypew9/pggRXFeUjhxoL+e6NEkDV4ggZHx2nWzWDT
         xFplP1bBbKEXk/TE45uGYbUyeyoxT8rFt1MpX8hAlf0ftnx2FB/SUL3pEDIaw7GBc6aX
         g8LQ==
X-Gm-Message-State: AOAM531GCI4T6iMU2H21W1oh7FCbbNwE8nfn/XyZqpNWGz1YDM9uglRy
        EfmLgi1ojU8jEgnzXeHiZg3Sn5SluNlYNX9A3y1sO4NLCII=
X-Google-Smtp-Source: ABdhPJwr//q6MoLwZatAFUEuXngz5CLGluUXGrRCjMyqGBHJPPSBrqN0YtGFe/TKcoseXHds8s4hvYLQNyPhNNmQoZk=
X-Received: by 2002:ac8:44a4:: with SMTP id a4mr7488902qto.219.1610640283988;
 Thu, 14 Jan 2021 08:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20210114152323.2382283-1-lee.jones@linaro.org> <20210114152323.2382283-5-lee.jones@linaro.org>
In-Reply-To: <20210114152323.2382283-5-lee.jones@linaro.org>
From:   Benjamin Tissoires <benjamin.tissoires@gmail.com>
Date:   Thu, 14 Jan 2021 17:04:32 +0100
Message-ID: <CAN+gG=HEVi+Hnpj2gywBPR3WCvLwed6CLV7cTFWTn+CZsqRP=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] input: touchscreen: surface3_spi: Remove set but
 unused variable 'timestamp'
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 14, 2021 at 4:23 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=3D1 kernel build warning(s):
>
>  drivers/input/touchscreen/surface3_spi.c: In function =E2=80=98surface3_=
spi_process_touch=E2=80=99:
>  drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable =E2=80=
=98timestamp=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Henrik Rydberg <rydberg@bitmath.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks for the cleanup :)

Cheers,
Benjamin

> ---
>  drivers/input/touchscreen/surface3_spi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/tou=
chscreen/surface3_spi.c
> index 731454599fcee..1da23e5585a0d 100644
> --- a/drivers/input/touchscreen/surface3_spi.c
> +++ b/drivers/input/touchscreen/surface3_spi.c
> @@ -94,9 +94,7 @@ static void surface3_spi_report_touch(struct surface3_t=
s_data *ts_data,
>
>  static void surface3_spi_process_touch(struct surface3_ts_data *ts_data,=
 u8 *data)
>  {
> -       u16 timestamp;
>         unsigned int i;
> -       timestamp =3D get_unaligned_le16(&data[15]);
>
>         for (i =3D 0; i < 13; i++) {
>                 struct surface3_ts_data_finger *finger;
> --
> 2.25.1
>
