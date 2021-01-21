Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 198A92FE337
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 07:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726042AbhAUGwe (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 01:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbhAUGwc (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 01:52:32 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E0FC061575;
        Wed, 20 Jan 2021 22:51:51 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id z22so1972683ioh.9;
        Wed, 20 Jan 2021 22:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmR5J8GicNZJLuhUFmP22EBtCzbCjmN4ktsEfPuUAvI=;
        b=BVIdcrIW4TMNNH77NUQtJS/OLJPOzEtNC1rGn5ZUr7j1YYmCBVCgI8I8pBRc2QPK8h
         KGCEvwn0P8NY2sKTxJUCm3YTS/t6Oz1OgyGP69kP/VqmIuh44HTpGySJH+UqLD+ZYJfb
         QMCrYKmBk5Mr+SXBTOM9kNE1VQwUbjaUiugQxDMc/4O3ALH/muNeRBr5UhFI9zUjVhmd
         097YqXPABQeut+0o9M4Ve0zDrYsD5QbLV5UmRR4xcjaUb1etpp37Pt7rk0Nm8evKqIDZ
         RYdqBQahBQePa8hNeHlNJIHDDVF2OovqIz9NpzCTYFFgBdW1XfmyuIArWZrQxvo/TWZu
         qxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmR5J8GicNZJLuhUFmP22EBtCzbCjmN4ktsEfPuUAvI=;
        b=J11Hy9DkKCjY5W56BvYGdc5nfWbVIpwQjG1UVu7CczB6H+XTHhwlNMWgJblUjQIRKw
         XNZaeMEEHpoQ0eFLvwkhVwAcR3gYBu9OVTSlnzznYMCgP+MQOEK+W3sj2/HHzuLkbaGO
         bS//fTEqXdD5YwtLAu1Ymiba9+k6L6oGe8sxh9NG7mMDqHCxKCUxrig9D/tISx0nvwnm
         SiqOP9t5BaZzVRtgWviqaYy75Yx1zhKQ8GtdOchw0bJMtIwIkVeucKsQvypE/IcgZ/zM
         IySm6U4DXJjCTS+xnajyf6W6135XF+O4yZgR1LtSiLQ2n3doa8m3b5SM1aWeuCncFQIx
         GxBg==
X-Gm-Message-State: AOAM530TPdHmA+4JuXclu6pkK5ndT6txI5ga/IJeuhrLBkaoJaeQxzbW
        JWschGvcP6pRLbypxTIx1b0IGbij+f4J0HkzQZ8=
X-Google-Smtp-Source: ABdhPJzZypTHMl5wMUilCwobB+qETmo15/kKxbdZRtGuuWn0dgPCe3PfFNxAIAp+fBjASBT1+5X2Hc2flnjf1pYjgfU=
X-Received: by 2002:a02:2544:: with SMTP id g65mr10543131jag.91.1611211910995;
 Wed, 20 Jan 2021 22:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20210117042428.1497-1-alistair@alistair23.me> <20210117042428.1497-2-alistair@alistair23.me>
 <YAeSpUIzV/3dWPC+@google.com>
In-Reply-To: <YAeSpUIzV/3dWPC+@google.com>
From:   Alistair Francis <alistair23@gmail.com>
Date:   Wed, 20 Jan 2021 22:51:24 -0800
Message-ID: <CAKmqyKOFe0_JgFA1_9vemW40g-daBt5RY=S9CAXU5Yj-FftGGw@mail.gmail.com>
Subject: Re: [PATCH 2/3] input/touchscreen: Add device tree support to wacom_i2c
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alistair Francis <alistair@alistair23.me>,
        linux-input@vger.kernel.org, dl-linux-imx <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 19, 2021 at 6:17 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Sat, Jan 16, 2021 at 08:24:27PM -0800, Alistair Francis wrote:
> > Allow the wacom-i2c device to be exposed via device tree.
>
> The patch seems incomplete. I see we are reading and storing properties,
> but we are not using them whatsoever, so I do not see the reason to have
> this in this form.

Good point. I am trying to split up the work, but I guess here I split
it up a little too much. I'm sending a v2 that should fix this.

Alistair

>
> Thanks.
>
> --
> Dmitry
