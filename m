Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3502B406A7A
	for <lists+linux-input@lfdr.de>; Fri, 10 Sep 2021 13:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232442AbhIJLIl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Sep 2021 07:08:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232415AbhIJLIl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Sep 2021 07:08:41 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E55CC061574
        for <linux-input@vger.kernel.org>; Fri, 10 Sep 2021 04:07:30 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id q21so2576302ljj.6
        for <linux-input@vger.kernel.org>; Fri, 10 Sep 2021 04:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a4n76sf+sJv7GmUwFz1dNtdWbHDEovUwkJ4mzUsqc38=;
        b=XoAl9xvfq/FVloF+V9FmMOBitJzpI+owOXl8g+4QKyJF1BUMV0fVlD/CsiMLvo8/mG
         0rc6CtVg9VVxbwRWdOCeX95fp7m7BYdGLSQj1k4odsA6pooodQl+WczzYaDEhy9ky7m2
         Be/tcL8uwWdBf0ryC3KNG62qn4M/+RKBDJUdxYu0qifeOCpvSKdupKDMJTNofbKnPQQn
         ILmi74ouYAiinJYAIonM3puUc/2u2/S7F2Ejg3zmSRKxplJpSkuZjuHn9scQPXxbaebA
         Uc0vyKBAN1Z2zwjgbepO0eZPQMeyLNKic5v4KN15N3HrBp5ekHlp5Ry2oFmeeAlxWWnx
         bxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a4n76sf+sJv7GmUwFz1dNtdWbHDEovUwkJ4mzUsqc38=;
        b=ylwLbPxMj5DTN8HJKn0SkGiTU1PdJO6czvlxjdkQB+A83eoRQvY2pCLft0DDOs+nS4
         IxY/ohXlOh90cAkyiMdCJJpTwfJS0yEzUI+nIlaSQzOvxAe5DyL50XAwrSmnlkdUKdWq
         fQ308Oz+ZPBHMGapy74U2TO87cn5ZT8+Rr9WrzyV9TyHiNDB2l/PPUXUGigij+a5wcHH
         zBi1VurUlX8P0+rdNUPeiUg/77HuJT5OWI/VRMv1xO0hVd9df4lw3q+O5rR/eJT36ev0
         B0Krc9EJ5rLcEOcbCo8EEwby4eIufjApFN8ChM+2P0wBxj0CypRNXQE0bISV/gY+D0M0
         SeMw==
X-Gm-Message-State: AOAM530wNMdNb87u8u4JSyFIkjnRVVIYVaSlkDImyRaUyjSX6l1EoN0U
        miavAI1CXoLXSF8d5S9PkBdsOODVZfI+G6SPtZbM5dU3daw=
X-Google-Smtp-Source: ABdhPJxi/lZXWjHm5THuTBnI8dFdzvD0A/YCAsqU//azXhM1PSSnmz8SRFniE52PtCuz/NZfv12PwgYFFF2k0MeGeHs=
X-Received: by 2002:a05:651c:4d4:: with SMTP id e20mr3698273lji.402.1631272048582;
 Fri, 10 Sep 2021 04:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <s5ho890n1rh.wl-tiwai@suse.de>
In-Reply-To: <s5ho890n1rh.wl-tiwai@suse.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 10 Sep 2021 08:07:17 -0300
Message-ID: <CAOMZO5C-wFv0LmbHfZQUMMchJAwvxMxTs=eT6oby8O8k4QyoFQ@mail.gmail.com>
Subject: Re: Delaying i8042 probe?
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Takashi,

On Fri, Sep 10, 2021 at 7:50 AM Takashi Iwai <tiwai@suse.de> wrote:
>
> Hi,
>
> we've received a bug report about the missing keyboard on ASUS Zenbook
> 14 with AMD Ryzen:
>   https://bugzilla.suse.com/show_bug.cgi?id=1190256
>
> In short, PS2 keyboard couldn't be probed at the cold boot, while it
> could be detected fine at the warm boot.  The failure appears like:
>
> [    0.512668] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq 1
> [    0.512672] i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
> [    1.033609] i8042: Can't read CTR while initializing i8042
> [    1.033632] i8042: probe of i8042 failed with error -5
>
> As openSUSE kernel builds PS2 drivers as built-in, and the probe at
> the early boot failed.  Meanwhile, when we rebuilt the kernel with
> those drivers as modules, it starts working magically.  So, this is
> likely a timing problem.
>
> A possibly workaround I can think of would be to allow re-probing the
> device at a later point.  Do we have a good way for that, or a better
> alternative solution?

Would probe defer help here?

Something like this:

--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1549,7 +1549,7 @@ static int __init i8042_probe(struct platform_device *dev)

        error = i8042_controller_init();
        if (error)
-               return error;
+               return -EPROBE_DEFER;

 #ifdef CONFIG_X86
