Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81D30194688
	for <lists+linux-input@lfdr.de>; Thu, 26 Mar 2020 19:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728188AbgCZSaw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Mar 2020 14:30:52 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37758 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727719AbgCZSaw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Mar 2020 14:30:52 -0400
Received: by mail-lf1-f66.google.com with SMTP id j11so5744645lfg.4
        for <linux-input@vger.kernel.org>; Thu, 26 Mar 2020 11:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pIQY80CcKCDC3qRnY+AaR+wS0zqUA7KeXPWypUhGHDE=;
        b=XBkVCy8We+AKYseqlkrr21Ibqj/IfUy2wuLSQeroi23v4tPuAUD+3Gv9xtJMJpqd0l
         4O+Mw9H2G8Y5MVneLGCajAeQd1MiaH3WFyf+szDYrjdUQADKYNaqRys1fh3U/n397cvi
         AFHy8hiFv7esBWxgFuj97lvLSMQGzHkdc04WlDdJ5i+72IgQi0z+EOQ825yrJyoTVsKk
         rxCru8ToqUiRiGWgOUvkaNGRuSH9f8eNpV5QeDMMHp5RdVUQIeaQQjzG5u7NNSCqY2EE
         sfu5IgMGQDCF7cj8LIQS2H4ZvBuwE13T6cYcOfNklGbcfVYtZzeMzIrmq4m9B61VCx7J
         0P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pIQY80CcKCDC3qRnY+AaR+wS0zqUA7KeXPWypUhGHDE=;
        b=NBj8oJlqtxXacCEk+vee4zsuAZIWSBj1eiEme+r0yuLvpVzBDwPiBNH2j3+oEHR64S
         jcM4kBSuIip52BMFwTgtWX7su7pJch4FpasuGEf2604Qc69wnUHZGqIP9Nlgbiu5VGcO
         NUouNmvp8c0Wih+c/lyLO/sphehW+jDgDD/zNbIxhDo/qM3yj9LI+HrVyd9dORIbnIhn
         b8UDDwoztXNqyaUXz5uyIv2FHjefZZrOAOwHjv2HGwSCq4d4kzGnE+DFmPkAXnvuTY/0
         9WvC0w0QYoXgJ9dgCxKjdav0z45ulkW0rgufK9RXOC8toiUyxj6qhMybhsHWEBDOTLUJ
         AjZQ==
X-Gm-Message-State: ANhLgQ0StawD/ff4Ij7pLCGdtjiXSvDREtdsdzH384hXBBJ3adq9aSfZ
        9cHWonTSp77zeZOA8nQW7LH9e+Jog+xCMC1j3hdQHw==
X-Google-Smtp-Source: ADFU+vsTjZUwJLwCaEuqZzOswezGYScmCpb7CmKaYg0z3xeuGkLSIiTc8eppPs16VC3O+SqUNd3p8oHycD9QonG8Bew=
X-Received: by 2002:a19:953:: with SMTP id 80mr6660980lfj.15.1585247449691;
 Thu, 26 Mar 2020 11:30:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200326182711.GA259753@dtor-ws>
In-Reply-To: <20200326182711.GA259753@dtor-ws>
From:   Rajat Jain <rajatja@google.com>
Date:   Thu, 26 Mar 2020 11:30:12 -0700
Message-ID: <CACK8Z6FgXJZsNNHJ_2K9TTKzAv6Hu=jmSLbf3e41ohbcZe5Chw@mail.gmail.com>
Subject: Re: [PATCH] Input: move the new KEY_SELECTIVE_SCREENSHOT keycode
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Harry Cutts <hcutts@chromium.org>,
        Mathew King <mathewk@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Mar 26, 2020 at 11:27 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> We should try to keep keycodes sequential unless there is a reason to leave
> a gap in numbering, so let's move it from 0x280 to 0x27a while we still
> can.
>
> Fixes: 3b059da9835c ("Input: allocate keycode for Selective Screenshot key")
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rajat Jain <rajatja@google.com>

Thanks! My apologies for overlooking.

> ---
>  include/uapi/linux/input-event-codes.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 008be2609ce1..6923dc7e0298 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -653,7 +653,7 @@
>  #define KEY_PRIVACY_SCREEN_TOGGLE      0x279
>
>  /* Select an area of screen to be copied */
> -#define KEY_SELECTIVE_SCREENSHOT       0x280
> +#define KEY_SELECTIVE_SCREENSHOT       0x27a
>
>  /*
>   * Some keyboards have keys which do not have a defined meaning, these keys
> --
> 2.26.0.rc2.310.g2932bb562d-goog
>
>
> --
> Dmitry
