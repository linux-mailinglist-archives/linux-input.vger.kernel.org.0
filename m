Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86CAE40F6C7
	for <lists+linux-input@lfdr.de>; Fri, 17 Sep 2021 13:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbhIQLiL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Sep 2021 07:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241845AbhIQLiB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Sep 2021 07:38:01 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00405C061574
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 04:36:31 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so31729420lfu.5
        for <linux-input@vger.kernel.org>; Fri, 17 Sep 2021 04:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x/iHvJpF8DSvWKWu14a6PJLOTAusf6ZIM5uvfyqHLZQ=;
        b=a4agVbLSHI0S0ovj8GhkCi6DgFpUTDH5fWmL9H1l8Xt7GpECAwwT7z10ugUyy5OP93
         i5xsdapkCKWJovHAydjXTj5jSpvbjoZCJSuve6PU7ZsKVa+Cs0uarH2VNK+kLH1nAwpJ
         XCU5XYaL3Cp3Ng9jB+07y98xV1hMhB6yNtKnXEdYcv1TOUOvn6cZ/iBMqPl01/Z8RZjl
         O5dJZq7Abo3e94vtuOOUetwgzn66NJ96/l8ybx9zqIpBtC5sVJl5BIuvaP66sshwqF9Y
         oYEcIfMwHbpoulj51kTKco0Ay0JAV6kcPbisZ55cWmGAb1jQt3I/pxe2ZTmRlE0+iqMU
         AIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x/iHvJpF8DSvWKWu14a6PJLOTAusf6ZIM5uvfyqHLZQ=;
        b=ByB31jTjQM5H6f+ym2MBfc7k4kf1bh/MUa3z0JM/jCNCisEU3d5Xg85OUZmNAqE7ai
         UdR8Axcre4F9jkZeRa8jhQMQmve0tWqyjL0Yt/ekESiSUWewT1YvCC3eWRFnfZggjiWx
         lNpUKb8GSTDB1yIhAUKNktAtwG45FEm6awGbRGhTkKEMZirBKrLP88mcIO6mfsTsjvQj
         5T67ehWZtWTemJBXpXRezN+Y+DVQE+eq+Z4iSvwv13Pv7XaMkc2dLz8TTWBy9lBvset+
         KAmYpqf8qFQO4zxCVAzOLpgCMGjdpMhOrGCLFi17Fo8v5cdvl8tMUm479G8ao3EjZvIy
         O0ag==
X-Gm-Message-State: AOAM5319LGg4iqVFYVFxsuLhsWkiHKjcE+ymMUc84r/rxtFFeRkREgDs
        AXG/tC30rEGGmrpUceaffpYmLD82VtjhJriW1uQ=
X-Google-Smtp-Source: ABdhPJwvHPfGhnA3GcMm/jJfohGpdOyWRyn4Fm7Bk2XDrfsT9/TzXMfDL+ukZpEwM+jU/tm+C12olccizQat35mqXhw=
X-Received: by 2002:ac2:514e:: with SMTP id q14mr7873110lfd.154.1631878590260;
 Fri, 17 Sep 2021 04:36:30 -0700 (PDT)
MIME-Version: 1.0
References: <s5ho890n1rh.wl-tiwai@suse.de> <CAOMZO5C-wFv0LmbHfZQUMMchJAwvxMxTs=eT6oby8O8k4QyoFQ@mail.gmail.com>
 <s5hee9wmy6e.wl-tiwai@suse.de> <CAOMZO5CACdcxGWn++f0+zhQaKevH7b5c-Xkv3QLBpwxc2GxizQ@mail.gmail.com>
 <s5hee9vlg8i.wl-tiwai@suse.de> <CAOMZO5C+gki7HT-n5D6qj06NbMxo2su2d6X+8AvM9PSmLUZ0jg@mail.gmail.com>
 <CAOMZO5DepuVScmDU7yZGVOVUs1JzHOd4bmu1z3erE2GNpcjZ+w@mail.gmail.com> <s5hilz0c23i.wl-tiwai@suse.de>
In-Reply-To: <s5hilz0c23i.wl-tiwai@suse.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 17 Sep 2021 08:36:19 -0300
Message-ID: <CAOMZO5DHHb3XJS2XDY=b1ALt3nQR0tOMWvv_GQQYTnEYN6Em0w@mail.gmail.com>
Subject: Re: Delaying i8042 probe?
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Takashi,

On Thu, Sep 16, 2021 at 6:16 AM Takashi Iwai <tiwai@suse.de> wrote:

> The patch was confirmed to work.

That's good news.

>   https://bugzilla.suse.com/show_bug.cgi?id=3D1190256#c19
>
> | That one worked despite the CTR error:
> |
> | [    0.000000] Linux version 5.14.2-3.g9458b22-default (geeko@buildhost=
) (gcc (SUSE Linux) 11.2.1 20210816 [revision 056e324ce46a7924b5cf10f61010c=
f9dd2ca10e9], GNU ld (GNU Binutils; openSUSE Tumbleweed) 2.36.1.20210326-4)=
 #1 SMP Sun Sep 12 20:15:58 UTC 2021 (9458b22)
> | [    0.484315] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 =
irq 1
> | [    0.484318] i8042: PNP: PS/2 appears to have AUX port disabled, if t=
his is incorrect please boot with i8042.nopnp
> | [    1.005361] i8042: Can't read CTR while initializing i8042
> | [    1.477053] serio: i8042 KBD port at 0x60,0x64 irq 1
> | [    1.503700] input: AT Translated Set 2 keyboard as /devices/platform=
/i8042/serio0/input/input2
> |
> | Seems it takes more than a secod to initialize, ugh
>
> I'm not sure what's done during this 0.5 second period after CTR read
> failure.  At least only shuffling the driver init order for built-in
> drivers didn't suffice.

This extra 0.5 seconds is the time it takes to re-probe the driver at
a later stage after deferral.

I am not familiar with this driver and its BIOS dependencies, so let's
see what Dmitry suggests as a proper fix.

Thanks
