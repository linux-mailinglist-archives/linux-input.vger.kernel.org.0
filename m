Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3C0F361C35
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 11:00:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241079AbhDPIsD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 04:48:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:38840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240918AbhDPIrs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 04:47:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 129B561152;
        Fri, 16 Apr 2021 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618562844;
        bh=tMfZZI7wDgcErE81PEljNtPPfVUB8rsBAM0RyZ9q+ec=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VudZc+IcuueMcbLQgEmtpuyLGVpG/rpz/LFmBBuWJNAhoFNaeYPNYtHU3fM9Ls5iE
         eM2X62QivRqxwAjSDj/vXNEwAETmvdI+6eyJJS/NCtqQm1VP7fHTHrl98z0rcVD28T
         MeAmq+/z6dL0QPYaxoBYsWRYTRogN3c2rbX9FVkcY4LpSSTVsM7FgQXQi9N3ZUrhLd
         44luQfzWmrqPGk6y8tCMGPZTDrBBIMn9MnZVUM93MJKyDKr2NrIJ2U6KnkIufawQ+b
         6x2ZuE6nawq7G2QlPAjitQ4Z+vcpqLyPTjNMhMDiKxwqrjUAcC8Gy/rZXg4rRWA3jZ
         3AsTNWiF+7CJA==
Received: by mail-ed1-f49.google.com with SMTP id bx20so30165782edb.12;
        Fri, 16 Apr 2021 01:47:23 -0700 (PDT)
X-Gm-Message-State: AOAM533NP/yBSi3ed0eN0YFJaAOTanHvwzDzsCi/lD7h/Jerq5D+Fgme
        TRjRCeeJbOjbXR6qh2v3A8fcO86pUyjpdAz5FRI=
X-Google-Smtp-Source: ABdhPJwBH137n6LlWEJeuS6vyGz1Okcc2OVHIcOTnZrZMbDjFkUEQKuzi/EZXh72wQfZQ3mH2/MZ/dOJcnklG8DHSV4=
X-Received: by 2002:a05:6402:35d3:: with SMTP id z19mr8641928edc.143.1618562842732;
 Fri, 16 Apr 2021 01:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210416031747.28504-1-zhuguangqing83@gmail.com>
In-Reply-To: <20210416031747.28504-1-zhuguangqing83@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 16 Apr 2021 10:47:11 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeEHRZboCJs+eScjsLDybDzXSaP3jBLkAYiQt_7Ft2nog@mail.gmail.com>
Message-ID: <CAJKOXPeEHRZboCJs+eScjsLDybDzXSaP3jBLkAYiQt_7Ft2nog@mail.gmail.com>
Subject: Re: [PATCH] Input: goodix - Fix missing IRQF_ONESHOT as only threaded handler
To:     zhuguangqing83@gmail.com
Cc:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 16 Apr 2021 at 05:18, <zhuguangqing83@gmail.com> wrote:
>
> From: Guangqing Zhu <zhuguangqing83@gmail.com>
>
> Coccinelle noticed:
> drivers/input/touchscreen/goodix.c:497:8-33: ERROR: Threaded IRQ with no
> primary handler requested without IRQF_ONESHOT
>
> Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
> ---
>  drivers/input/touchscreen/goodix.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)


Did you test it? There are several patches like this all over the tree
so it looks like "let's fix everything from Coccinelle" because you
ignored at least in some of the cases that the handler is not the
default primary one. I am not saying that the change is bad, but
rather it looks automated and needs more consideration.

Best regards,
Krzysztof
Best regards,
Krzysztof
