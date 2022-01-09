Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44A84887A2
	for <lists+linux-input@lfdr.de>; Sun,  9 Jan 2022 05:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235047AbiAIEak (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 8 Jan 2022 23:30:40 -0500
Received: from mail-vk1-f170.google.com ([209.85.221.170]:45568 "EHLO
        mail-vk1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232666AbiAIEad (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 8 Jan 2022 23:30:33 -0500
Received: by mail-vk1-f170.google.com with SMTP id j4so6166402vkr.12
        for <linux-input@vger.kernel.org>; Sat, 08 Jan 2022 20:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=yx/72WiAbuoeSreyxRoe2V1RSPa9LTLLDi3kbugYeLg=;
        b=rnaKIfkzkxpy3c+jkp74tJyM2Fbqr/RVp3HY6nQaVSVj58/TQZInuDeXC/oBMq30pC
         IdsGPxOrzCRb+kO3NhdAnTAvkvC9ipHFxtU5fLwVbLVd340LFh0+ex6SXKE/e/RwS3Uh
         vbTp/pcfdgGGjKQcxCqsBWrz7cF0q1p2mApczsQxevNxLentug7z26C73vv13RunJPwh
         e5NYdAQM/qRB/yRIDPl3R/3HJ4b5ACuRXgVM028gRy79LvVfiQOgVWE+b/6FVPBtRUxA
         50pAG9O4wY0sl7hn66wt4oFZPO/ac2/R8i3W8wB9xf14hVH7ZHKDhDe9rh0GfwBjskNU
         GHCA==
X-Gm-Message-State: AOAM5313Bk0b3hCv6xsj7wfSXE6YffdiflsiNkmCsMY7yXkrzDPe+l7E
        r8PuJaig5m91drRzWxPE9i6RFuAZNKZMxw==
X-Google-Smtp-Source: ABdhPJwTzCPiJEASXmqbEVTEbGiHAPvpcuXde3ORNGj0MIJhXb/m0mLzNEugZ4bgI+UV752VHWaNcQ==
X-Received: by 2002:a05:6122:998:: with SMTP id g24mr1061483vkd.22.1641702632620;
        Sat, 08 Jan 2022 20:30:32 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id o96sm1913967uao.15.2022.01.08.20.30.32
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Jan 2022 20:30:32 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id v12so17721258uar.7
        for <linux-input@vger.kernel.org>; Sat, 08 Jan 2022 20:30:32 -0800 (PST)
X-Received: by 2002:a67:b142:: with SMTP id z2mr23784779vsl.39.1641702632177;
 Sat, 08 Jan 2022 20:30:32 -0800 (PST)
MIME-Version: 1.0
References: <20220106111647.66520-1-hdegoede@redhat.com>
In-Reply-To: <20220106111647.66520-1-hdegoede@redhat.com>
Reply-To: wens@csie.org
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 9 Jan 2022 12:30:21 +0800
X-Gmail-Original-Message-ID: <CAGb2v64o_4g=skt01yB5ZBQq7gTM8yd6RNWaSWfDw3ry=O-hig@mail.gmail.com>
Message-ID: <CAGb2v64o_4g=skt01yB5ZBQq7gTM8yd6RNWaSWfDw3ry=O-hig@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - Revert "always register interrupt
 handlers" change
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 6, 2022 at 7:18 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The power button on Cherry Trail systems with an AXP288 PMIC is connected
> to both the power button pin of the PMIC as well as to a power button GPIO
> on the Cherry Trail SoC itself. This leads to double power button event
> reporting which is a problem.
>
> Since reporting power button presses through the PMIC is not supported on
> all PMICs used on Cherry Trail systems, we want to keep the GPIO
> power button events, so the axp20x-pek code checks for the presence of
> a GPIO power button and in that case does not register its input-device.
>
> On most systems the GPIO power button also can wake-up the system from
> suspend, so the axp20x-pek driver would also not register its interrupt
> handler. But on some systems there was a bug causing wakeup by the GPIO
> power button handler to not work.
>
> Commit 9747070c11d6 ("Input: axp20x-pek - always register interrupt
> handlers") was added as a work around for this registering the axp20x-pek
> interrupts, but not the input-device on Cherry Trail systems.
>
> In the mean time the root-cause of the GPIO power button wakeup events
> not working has been found and fixed by the "pinctrl: cherryview: Do not
> allow the same interrupt line to be used by 2 pins" patch,
> so this is no longer necessary.
>
> This reverts the workaround going back to only registering the
> interrupt handlers on systems where we also register the input-device.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
