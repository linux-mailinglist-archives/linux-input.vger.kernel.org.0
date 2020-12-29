Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAFC92E6EC9
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 08:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbgL2Hp7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 02:45:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgL2Hp7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 02:45:59 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 447D1C0613D6;
        Mon, 28 Dec 2020 23:45:19 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id r24so6677867vsg.10;
        Mon, 28 Dec 2020 23:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pl7zzNNk/Gasi7nSNXE8jp0qMjWJ/yIz+1lsie+VKd4=;
        b=HL4bC8cPeuMd/jPBkjLg8XqdmghsvEOGiCzWw3BILnGRAOxnm+y8mzVIJnr4V8JWfS
         /5G/4CVc4bBiahEb6+MV8cBi9xerZSW8ZqyzcMCPjNiYFIafqirZf9WWgoUDb5N246DU
         5ZPeI1NPZKktjUcSqQWjQcZ636Pl/AeYTrqVYy0cJtRnQmBvSxOKmgX7RXvsO1E5TRJd
         StdmW/5O5qyX3wiAntgQCaF9lVjQFZrcTG+eJDoH1HHFtVK2XL6gHWELJvPba0vBqg+C
         YUNLCmz7a+fJXECY0Y8K+JZ/1uXXvCDd4W1oirgU5cXbhglSNYutXxEzix6DF+5Vxggc
         abCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pl7zzNNk/Gasi7nSNXE8jp0qMjWJ/yIz+1lsie+VKd4=;
        b=sfbNc7kZkhvMAMIjIr+Ak4RMMVGLDp+Du/5fUis0ERDUDwJWczJkfprYkKlXiZJkeq
         sakR3gwjS5KH0K/jCFd4caFxO61Ldd6pFGd8lw0O8zoaTr7hdy+0TN7mYf/K9aODeaSz
         ndDGjwZTI4TrE2xbiwkZE/QpaVOHZjmsloe+WjjILe+czwNg9lXBYFZheYpTZSrxYzwP
         8+YEywq05pnGdGIStQ7x9qwinXa+IhJ9MQPkuWkyeUZ+T0D6sILJsk4B8QloT3get/zf
         qH3m77MlaKQTULP9nI3eiySDyxRRW9sQDic87WcsfRKcFC8Cq9Fnt29SnrRD8g7wTFhL
         X0sA==
X-Gm-Message-State: AOAM530LHtJTX4NzLCfmxLvcMYkNiasq8YKwiDKBE9FPNfQ0zno0j694
        tbJ7TawHGmHfpVJDCf8Jobuh5rp0zOSni6/1z0I3SYv5cIw=
X-Google-Smtp-Source: ABdhPJzkY44MUqVWv/BlxZ66uXP0WIiEr7g5klQ5erjnkiFd/g3OZnnKMQN1umQa5CuI24iZkbBN4b//mi40YLaRBWE=
X-Received: by 2002:a05:6102:a07:: with SMTP id t7mr29246633vsa.30.1609227918043;
 Mon, 28 Dec 2020 23:45:18 -0800 (PST)
MIME-Version: 1.0
References: <1608581041-4354-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1608581041-4354-1-git-send-email-jrdr.linux@gmail.com>
From:   Souptick Joarder <jrdr.linux@gmail.com>
Date:   Tue, 29 Dec 2020 13:15:10 +0530
Message-ID: <CAFqt6zb2O3SFx6xDtwdSgHYH-zeGXwuf1=Hr5yYXnCDqAza9KQ@mail.gmail.com>
Subject: Re: [PATCH] input: ariel-pwrbutton.c: Remove unused variable ariel_pwrbutton_id_table[]
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 22, 2020 at 1:34 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> Kernel test robot throws below warning ->
>
> >> drivers/input/misc/ariel-pwrbutton.c:152:35: warning: unused variable
> >> 'ariel_pwrbutton_id_table' [-Wunused-const-variable]
>    static const struct spi_device_id ariel_pwrbutton_id_table[] = {
>                                      ^
>    1 warning generated.
>
> Remove unused variable ariel_pwrbutton_id_table[] if no plan to use
> it further.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>

Any comment on this patch ?

> ---
>  drivers/input/misc/ariel-pwrbutton.c | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/drivers/input/misc/ariel-pwrbutton.c b/drivers/input/misc/ariel-pwrbutton.c
> index eda86ab..17bbaac 100644
> --- a/drivers/input/misc/ariel-pwrbutton.c
> +++ b/drivers/input/misc/ariel-pwrbutton.c
> @@ -149,12 +149,6 @@ static int ariel_pwrbutton_probe(struct spi_device *spi)
>  };
>  MODULE_DEVICE_TABLE(of, ariel_pwrbutton_of_match);
>
> -static const struct spi_device_id ariel_pwrbutton_id_table[] = {
> -       { "wyse-ariel-ec-input", 0 },
> -       {}
> -};
> -MODULE_DEVICE_TABLE(spi, ariel_pwrbutton_id_table);
> -
>  static struct spi_driver ariel_pwrbutton_driver = {
>         .driver = {
>                 .name = "dell-wyse-ariel-ec-input",
> --
> 1.9.1
>
