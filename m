Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CC734B912
	for <lists+linux-input@lfdr.de>; Sat, 27 Mar 2021 20:16:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbhC0TPZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 27 Mar 2021 15:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbhC0TPA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 27 Mar 2021 15:15:00 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A6FC0613B1
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:14:59 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id s17so11242855ljc.5
        for <linux-input@vger.kernel.org>; Sat, 27 Mar 2021 12:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LMCwJ2rvZCQYurHCuKng4tLY7AkgfzxcnQAhS9UrfpA=;
        b=moghu06XUy5N2ZieSmBjYNGhIiELNWluFsZoKnJxtO5jVlubGCStJtdBR5/BqeVHwu
         vjENDNR/e2yBJfpLvy3elyDpo8jj9bdYDTjwapOFpcSyv8FfyYGrBRkixgqEr1XDY16C
         2E1ApsBupt5pnsZZkOAC7v77fR/6LVnrjM9smTY1dhViUDez2KY82xv8tcXMR1JlqCpd
         k2IAQnpwmYY0GKTOFktRMcJS/VKNsP5p5WHpVtkO3x5+zv/SZpAFveZCWZE8oYXNky7R
         w/NkyHq6oMi4pIJNjaAob6lx9RIeOH1Mbf5pTIFLLDAuC5lX9vKJgTt1fD8IEWGc9WcX
         x1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LMCwJ2rvZCQYurHCuKng4tLY7AkgfzxcnQAhS9UrfpA=;
        b=bGmLCJHm3g9Y1FQ4yFtKyo37nzbJSirdRz3ykGOvTmwIR/5rlWyNHUjYtx0rcXO2s2
         seFcq2uArSu3aEvYA2dnb/wr0VZ0uJE0/BWE+mv8QpvtF/GDPcKtYXq9tYEZuzG09YQr
         Gx+kgIqfwIpeNsKYPFgBEK4gN9SumKhRFLx5xjnSIu8YaGevRS2ngQwcC9WYVbFekASo
         Y/HvR04JJKWJV6dv9ax0XsZVpgJLMDao4BXtxXNnvQE0xYghsfU5JkMsRfDm+pvu7wHx
         80wdsyNbPbX0IJ0Xb4JyvkBuh14MbWhft9MG8ksQonH7mg2w5hu8d5kiwNAgvKyJ/fW/
         +O4w==
X-Gm-Message-State: AOAM531dxc5depepv+Tm1H7GfuXpJyKw2noHn0gCia5pFp1qlkB0i4A9
        F3whDw8KOHWsIImOPF9cz+FzvHs0XvCJIznHfoc=
X-Google-Smtp-Source: ABdhPJwqE0z6TYxL5TImHpV9pzvUnKh8cDPCcQW9ogTN5/YJhHSqi0HhgzsR+K/fYFxuaqpBYuCEQOCvPG7F2rqcT0Y=
X-Received: by 2002:a2e:575c:: with SMTP id r28mr12772983ljd.347.1616872497913;
 Sat, 27 Mar 2021 12:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210316133534.224105-1-festevam@gmail.com>
In-Reply-To: <20210316133534.224105-1-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Sat, 27 Mar 2021 16:14:46 -0300
Message-ID: <CAOMZO5A36YbA59v4NmEFjhkcXF5fTDRn1204_U3+X86qfbqB9g@mail.gmail.com>
Subject: Re: [PATCH v2] Input: imx_keypad - convert to a DT-only driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Tue, Mar 16, 2021 at 10:36 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> i.MX has been converted to a DT-only platform, so make the
> adjustments to the driver to convert it to a DT-only driver.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Remove dev_get_platdata() and the pdev->dev.of_node check (Dmitry).

Does v2 look good?

Thanks
