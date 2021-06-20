Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C593ADF62
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 18:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhFTQkO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 12:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbhFTQkN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 12:40:13 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47365C061574
        for <linux-input@vger.kernel.org>; Sun, 20 Jun 2021 09:37:59 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ji1so18474487ejc.4
        for <linux-input@vger.kernel.org>; Sun, 20 Jun 2021 09:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H0Dn7I5hvajQQ2niyk0oP0bXg7KvCvI9nLYIwJSKNDQ=;
        b=ZUNjBTBK83tAlcsq8WpuQorrKRZ79MjOhnGmiXyHZ0lHXqX74uJrp0CtJpW0MQPm0V
         uO7q3X+MuiK8dIpaYIiuNHl4ed9FdHMCrG9zue7eRe0IXdpNlZ211dzqJlabxapxvgWI
         1j04HrCcgyJ8d7IFVGMA6jNNCj8/HWY408aQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H0Dn7I5hvajQQ2niyk0oP0bXg7KvCvI9nLYIwJSKNDQ=;
        b=Luz+hWoJnImqYRFn9DnoEfozq7gqK12Xc2FRg8zjSvVSlth8eRJclD7MZkUSsSdQTp
         cgjygLz9NE8u0p7iG4V3gdjVUYCEPg5kBUHDRo0j55xedph7XY48ar5p9R+2/byqbpPc
         /D4QaQMpdXjIGq3YVq1hHdL8BhNcmVjADSRgzsOeskCN6NSU2DRlR2wnVNMO4bIa9Xqf
         jjIj3TM/6BYfwfjOcappgBQ6uVLJpyzuAsupnTrThawRbkcCkq27I0Pc6fEaUlTZt2iG
         rwCuATL+df3RvLXuw2MULAHqy5twQpsGxlqSvqFbS2IxADPOChdP2lfrskNAYTFSYcSt
         WSUw==
X-Gm-Message-State: AOAM530sXa5+MkXEobj8JD3UkAJOuBNNnL3dvvfkqlg/hhXQRQY7Adcv
        Hkn+W8FAE+GjnxQtdvoeHERHWgCdmzNjRh+Txb99qg==
X-Google-Smtp-Source: ABdhPJybDVbXN6DMmvFh6LEbq1oyGke2WnaRtYDZRUvQMUtgy7JafAC/B8Ks4j5GMg5bBOpbWbU/NRtDj/mJE8aEC5s=
X-Received: by 2002:a17:906:d288:: with SMTP id ay8mr1808809ejb.230.1624207077901;
 Sun, 20 Jun 2021 09:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210620120030.1513655-1-avlarkin82@gmail.com>
In-Reply-To: <20210620120030.1513655-1-avlarkin82@gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 20 Jun 2021 09:37:47 -0700
Message-ID: <CAADWXX-fpcPh+jGX7=Hbkqr7yhwzbUT915NBBzqHGecFVbxmzw@mail.gmail.com>
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in ioctl
To:     Alexander Larkin <avlarkin82@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Security Officers <security@kernel.org>,
        Murray McAllister <murray.mcallister@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Jun 20, 2021 at 5:01 AM Alexander Larkin <avlarkin82@gmail.com> wrote:
>
>     The problem is that the check of user input values that is just
>     before the fixed line of code is for the part of first values
>     (before len or before len/2), but then the usage of all the values
>     including i >= len (or i >= len/2) could be.

No, I think the problem is simpler than that.

> -       for (i = 0; i < joydev->nabs; i++)
> +       for (i = 0; i < len && i < joydev->nabs; i++)
>                 joydev->absmap[joydev->abspam[i]] = i;

This part is unnecessary - all values of "joydev->abspam[i]" have been
validated (either they are the old ones, or the new ones that we just
validated).

>         memcpy(joydev->keypam, keypam, len);
>
> -       for (i = 0; i < joydev->nkey; i++)
> +       for (i = 0; i < (len / 2) && i < joydev->nkey; i++)
>                 joydev->keymap[keypam[i] - BTN_MISC] = i;

The problem here is not that we walk past "len/2", but that the code
*should* have used

        joydev->keymap[joydev->keypam[i] - BTN_MISC] = i;

(note the "keypam[1]" vs "joydev->keypam[i]").

And the reason it *should* walk the whole "joydev->nkey" is that if
there are later cases with the same keypam value, the later ones
should override the previous ones (well, that "should" is more a
"traditionally have").

So I think the right patch is this one-liner

  diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
  index da8963a9f044..947d440a3be6 100644
  --- a/drivers/input/joydev.c
  +++ b/drivers/input/joydev.c
  @@ -499,7 +499,7 @@ static int joydev_handle_JSIOCSBTNMAP(struct
joydev *joydev,
        memcpy(joydev->keypam, keypam, len);

        for (i = 0; i < joydev->nkey; i++)
  -             joydev->keymap[keypam[i] - BTN_MISC] = i;
  +             joydev->keymap[joydev->keypam[i] - BTN_MISC] = i;

    out:
        kfree(keypam);

(whitespace-damaged, I would like Dmitry to think about it rather than
apply this mindlessly.

Dmitry?

              Linus
