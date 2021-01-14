Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B848E2F5771
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 04:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729438AbhANB77 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 13 Jan 2021 20:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727383AbhANB76 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 13 Jan 2021 20:59:58 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7F8CC0617A9
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:36:47 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id g3so2107904plp.2
        for <linux-input@vger.kernel.org>; Wed, 13 Jan 2021 17:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=vga+wd3Nu9yrCvWtrwJ+7XS8La99u1RixLre7Gn5LkE=;
        b=b9aAhe38hfmS6Q8Ys2/kESKGyf+1JqmiKscnWbOQNSkNC/UMGevpErTP2h6bExA9sq
         czZioshGrro5Gyui6STk+DqW8bTvmC46zT69EJX3XGbBgCfF4qmn/430/+D2WzpVRTiT
         mVu9Bla9RncdgvN8tQ6xtt5rJyLhWMBYkbpeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=vga+wd3Nu9yrCvWtrwJ+7XS8La99u1RixLre7Gn5LkE=;
        b=BcIzAhbMBg915tCeDvvkHE2suzM6nBny+nI0osuoP/1G3td+QkejJSjZNFw77y1n7j
         pP+ejyCJAGxmb/AjZHE6X18a8e5d/+edze6AkuOBphLS3ImFcBT/di184zUxbWT1FKYG
         1EwVGWtWkSru/eOJOzycKmiCq3P3wsEVRvD2OLE854WXewlbFfKoPVY16slhefnE9cff
         DYAIhSK4Qz8L+Lof/qkPhve7wEsnbVNTPOj4syaaKKxvYLbhFIQuE3fGs2TO7cZWgxGj
         nRUgtmCXtMaHoGHUV2EGCYLZ/YdhAjaJAK+NKeLanFd00BucZzjpr/E/khqmKg2QEzMv
         fSwg==
X-Gm-Message-State: AOAM533Liij7I9DETAjBmUg6AyD5UIovMQZEBPwkTsjv8WXPFS1bRREg
        QdjOhji1GRrH6enqd2LsYEW+OQ==
X-Google-Smtp-Source: ABdhPJyrm4UlHPLatH/x3TAEuOrxXyqF/T8AT69S1E0/EKaPbu5WTZ9HwPhrBNJUqDlf7Y4IdSU0QA==
X-Received: by 2002:a17:90a:8985:: with SMTP id v5mr2206883pjn.27.1610588207284;
        Wed, 13 Jan 2021 17:36:47 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
        by smtp.gmail.com with ESMTPSA id x16sm3821817pfp.62.2021.01.13.17.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jan 2021 17:36:46 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210113172450.v5.2.I38e90f114f0311b8aa3bcfff750ba381c09dd3b6@changeid>
References: <20210113172450.v5.1.I025fb861cd5fa0ef5286b7dce514728e9df7ae74@changeid> <20210113172450.v5.2.I38e90f114f0311b8aa3bcfff750ba381c09dd3b6@changeid>
Subject: Re: [PATCH v5 2/2] Input: cros-ec-keyb - Expose function row physical map to userspace
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     dianders@chromium.org, Philip Chen <philipchen@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rajat Jain <rajatja@google.com>, linux-input@vger.kernel.org
To:     LKML <linux-kernel@vger.kernel.org>,
        Philip Chen <philipchen@chromium.org>,
        dmitry.torokhov@gmail.com
Date:   Wed, 13 Jan 2021 17:36:45 -0800
Message-ID: <161058820506.3661239.14441197324080899810@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Quoting Philip Chen (2021-01-13 17:25:13)
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboa=
rd/cros_ec_keyb.c
> index b379ed7628781..273e3c9ba0b03 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -578,6 +590,19 @@ static int cros_ec_keyb_register_matrix(struct cros_=
ec_keyb *ckdev)
>         ckdev->idev =3D idev;
>         cros_ec_keyb_compute_valid_keys(ckdev);
> =20
> +       of_property_for_each_u32(dev->of_node, "function-row-physmap",
> +                                prop, p, key_pos) {
> +               if (i >=3D MAX_NUM_TOP_ROW_KEYS) {
> +                       dev_err(dev, "Only support up to %d top row keys.=
\n",

dev_warn? And drop the period please as we don't add them in the kernel
usually.

> +                               MAX_NUM_TOP_ROW_KEYS);
> +                       break;
> +               }
> +               ckdev->function_row_physmap[i] =3D MATRIX_SCAN_CODE(

Maybe grow some more local variables, like for function_row_physmap so
this can fit on one line?

		row =3D KEY_ROW(key_pos);
		col =3D KEY_COL(key_pos);
		map[i] =3D MATRIX_SCAN_CODE(row, col, ckdev->row_shift);

> +                       KEY_ROW(key_pos), KEY_COL(key_pos), ckdev->row_sh=
ift);
> +               i++;

We could remove this and just increment num_function_row_keys instead.
Then that condition check may be a little longer but probably still ok.


> +       }
> +       ckdev->num_function_row_keys =3D i;
> +
>         err =3D input_register_device(ckdev->idev);
>         if (err) {
>                 dev_err(dev, "cannot register input device\n");
