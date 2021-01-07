Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92F542EC79F
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 02:18:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725822AbhAGBRM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 20:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbhAGBRF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 20:17:05 -0500
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FA3C0612F0
        for <linux-input@vger.kernel.org>; Wed,  6 Jan 2021 17:16:24 -0800 (PST)
Received: by mail-vk1-xa2d.google.com with SMTP id o195so1249303vka.9
        for <linux-input@vger.kernel.org>; Wed, 06 Jan 2021 17:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ys5x3Hi0zH7+JlDh7fjI+nX5FQdopXUEBUJ1iI++p8U=;
        b=Zve0Z+9a2dNXkVsqaPlsZDG2KQC7hmJDVi5edVEQ2QC8q4SFs/ePqltyig2+Ql5XNe
         cxUxol26N09c3cpPW+C+/UNZOIc0kSK0eQzRTZetIhT7RY4zLBEqDh/zmFiFLAIJE4Tm
         ayBdsW8WSsmDV88kVuLdl4lEeCMkx3NRgf12w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ys5x3Hi0zH7+JlDh7fjI+nX5FQdopXUEBUJ1iI++p8U=;
        b=h0Y/w/LUzk7xi/Qg0rN5SYqu9zakbuWwl4OxMyYQi/uJojpVjsgQgKxqxglRo5JiRA
         eZ1C9ocZDtDNFlplxo6bJJRHTZtFXe/DhTnx38cM5zmaz0IrMp/caNvcKvD9eFooSZRI
         RPsuxY2028y7+grtNjJ+o1G7IP9gTRIeHg58XM+KQrf8Dtb1KZHItlgJZ6tSF/0xGVLB
         aIaw95pvu0pyYplVeDja6j259Z/pSWwVmITEylNjd525NzaowU1SZTWNjHJZuhBycODZ
         OeBMo+ou6A1UREbpPI4k3KSef3QWUrxxYU61r2V4bd0pPz46pW02Zwe1MWWN1me90xP/
         Z1Hw==
X-Gm-Message-State: AOAM533uqTdB7fD+poDzrASS7zBodkxdCP43RuhX1Wu/pDna2L0PyrZy
        HQHSYN5laENaHYNSxckU/uaFlc/q/bD/Nw==
X-Google-Smtp-Source: ABdhPJxUqqUbPoIk+6b3igMwoGqLD6UP4Q376Q08w/qyqnMK+z9dAYQ5ZNtSeUkfFI4Jlb9db64egA==
X-Received: by 2002:a1f:dac7:: with SMTP id r190mr6148541vkg.22.1609982183625;
        Wed, 06 Jan 2021 17:16:23 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id h79sm653700vkh.30.2021.01.06.17.16.22
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 17:16:22 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id e27so1256039vkn.2
        for <linux-input@vger.kernel.org>; Wed, 06 Jan 2021 17:16:22 -0800 (PST)
X-Received: by 2002:ac5:cde4:: with SMTP id v4mr6061479vkn.21.1609982181965;
 Wed, 06 Jan 2021 17:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20201205004709.3126266-1-swboyd@chromium.org>
In-Reply-To: <20201205004709.3126266-1-swboyd@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Jan 2021 17:16:10 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
Message-ID: <CAD=FV=XjzBLTPMqOf1NK0pjXiZWrLT227nksxhMqaFG6GxAqjQ@mail.gmail.com>
Subject: Re: [PATCH] Input: cros_ec_keyb: Add support for a front proximity switch
To:     Stephen Boyd <swboyd@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Dec 4, 2020 at 4:48 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Some cros ECs support a front proximity MKBP event via
> 'EC_MKBP_FRONT_PROXIMITY'. Map this to the 'SW_FRONT_PROXIMITY' input
> event code so it can be reported up to userspace.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/input/keyboard/cros_ec_keyb.c          | 5 +++++
>  include/linux/platform_data/cros_ec_commands.h | 1 +
>  2 files changed, 6 insertions(+)

This seems really straightforward.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Given that it touches a header file owned by the Chrome OS maintainers
and a driver owned by input, how should it land?  One maintainer Acks
and the other lands?

-Doug
