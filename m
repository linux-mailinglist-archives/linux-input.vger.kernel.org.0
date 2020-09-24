Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6804A277259
	for <lists+linux-input@lfdr.de>; Thu, 24 Sep 2020 15:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgIXNa2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Sep 2020 09:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbgIXNaW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Sep 2020 09:30:22 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5A6C0613CE
        for <linux-input@vger.kernel.org>; Thu, 24 Sep 2020 06:30:22 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id 7so2118289vsp.6
        for <linux-input@vger.kernel.org>; Thu, 24 Sep 2020 06:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=06cUnwKiqnoj1ZIwBY8rpJgq+GZHHxjARS6TeUzdpbI=;
        b=IZhQQ+Lhrmwru9WBcG7qCA9sHlDtolmO7o85XOkxz5Z8FZzfp7Xz9NcxwAu33JMPl+
         DEwdhYvbzOB7oLUh0GDYf2177GMyvSQSgQs4oVMIIvC+ULmO1myqI1jkCndf2jy0k2RF
         g5f+yXnyDq7CEoqUTVj6Hz7uEAMmcLRp/eWqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=06cUnwKiqnoj1ZIwBY8rpJgq+GZHHxjARS6TeUzdpbI=;
        b=J6xV2HrXG3b1swFXEfxBP9lr6rqb7fG9RhjBactcdpMwXNZrF1noibDZLK0/7lReqQ
         rSETi0veAKwP+9jS51q/WHW432XsA/5TgNbA2ef1j89BuEHCgYAZu5/wQBnzsNPlu9g7
         MSrTyCV5WGLSLNQKwKQJch2nSiAflz1gv1uCKVjSbV2bcRdxYknWZ79Fnk4u0cEoNsmn
         XBRF8JL2zVnLHDDFYafRvc+iPL+2SaX/kFt8y4v02B6TNQNIerlrNv2ZW9npOfUyxf7P
         dcZi/6WMsnckcjE9luO+GK0A2CLwFeGyTZUXpafdQ3YdWhaYHv8gQFkhOgTa/lYVmSAc
         GiXQ==
X-Gm-Message-State: AOAM531K9jRS2PDwfCzTsyM/py9OEf1Rwaq0T7Nn5YyfvkU8JmEGgPV4
        CVvs635pi2h5Enf3qgSptYu+PWsgIQudlGsK
X-Google-Smtp-Source: ABdhPJxMQd1/o9M7QiEUDNb9BjOsma/DeyUGbvRYyHLqqzoKMVBLpO50HqE4Pv/uoZE6WNKeMhh/NA==
X-Received: by 2002:a67:e951:: with SMTP id p17mr3723062vso.21.1600954220848;
        Thu, 24 Sep 2020 06:30:20 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id v135sm368745vsv.22.2020.09.24.06.30.19
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2020 06:30:19 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id z193so1131938vsz.10
        for <linux-input@vger.kernel.org>; Thu, 24 Sep 2020 06:30:19 -0700 (PDT)
X-Received: by 2002:a67:8d8a:: with SMTP id p132mr4036859vsd.16.1600954219023;
 Thu, 24 Sep 2020 06:30:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200924053013.1056953-1-vincent.huang@tw.synaptics.com>
In-Reply-To: <20200924053013.1056953-1-vincent.huang@tw.synaptics.com>
From:   Harry Cutts <hcutts@chromium.org>
Date:   Thu, 24 Sep 2020 14:30:07 +0100
X-Gmail-Original-Message-ID: <CA+jURcshGWHWJ3sxhDspOHiYboPrMS+7bURkpdwaY-ez17fxSA@mail.gmail.com>
Message-ID: <CA+jURcshGWHWJ3sxhDspOHiYboPrMS+7bURkpdwaY-ez17fxSA@mail.gmail.com>
Subject: Re: [PATCH] Input: trackpoint - enable Synaptics trackpoints
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrew Duggan <aduggan@synaptics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 24 Sep 2020 at 06:30, Vincent Huang
<vincent.huang@tw.synaptics.com> wrote:
>
> Add Synaptics IDs in trackpoint_start_protocol() to mark them as valid.
>
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>

Reviewed-by: Harry Cutts <hcutts@chromium.org>
Tested-by: Harry Cutts <hcutts@chromium.org>

Harry Cutts
Chrome OS Touch/Input team

> ---
>  drivers/input/mouse/trackpoint.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
> index 854d5e758724..ef2fa0905208 100644
> --- a/drivers/input/mouse/trackpoint.c
> +++ b/drivers/input/mouse/trackpoint.c
> @@ -282,6 +282,8 @@ static int trackpoint_start_protocol(struct psmouse *psmouse,
>         case TP_VARIANT_ALPS:
>         case TP_VARIANT_ELAN:
>         case TP_VARIANT_NXP:
> +       case TP_VARIANT_JYT_SYNAPTICS:
> +       case TP_VARIANT_SYNAPTICS:
>                 if (variant_id)
>                         *variant_id = param[0];
>                 if (firmware_id)
> --
> 2.25.1
>
