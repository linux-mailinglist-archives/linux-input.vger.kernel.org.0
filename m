Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE37333D4EF
	for <lists+linux-input@lfdr.de>; Tue, 16 Mar 2021 14:36:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235154AbhCPNfc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Mar 2021 09:35:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235184AbhCPNf1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Mar 2021 09:35:27 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DF9C06174A
        for <linux-input@vger.kernel.org>; Tue, 16 Mar 2021 06:35:26 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id q25so62472203lfc.8
        for <linux-input@vger.kernel.org>; Tue, 16 Mar 2021 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a2v6jk+yPLMrCROJzyRY2GjJA9XYRDi7YBTqABG6xhY=;
        b=Rw0PPmr2A9alE7wckzwdlNM7YdkUoVzcV+Y3ySMG1hDXFsiFcr9krsFgO8lJ0hkrCa
         pdxCJZmoPkZP85RFkD2L/kx0wMG92bqjWjJ/Zp4qe6PoaDCiCIlLyMihxAwSNFalYoXY
         Pt+nTN6IrAGRJ8YnpgkSamOu/yh46SkBEU0rd0qNy4iyGIwKHENNX6s9mh2fKbzjOS/l
         ieFnEfxL/KEt8E716THQpOTKNYtv1PSCyLtu/sgfOOcBph3Ml5G9/zO1DmtA/d45xH16
         B7JcH0YarC+Xu0xaQ26f2x9Km64OnM2AL8kKcSeMCRGbM5eqgfz5C0NFS2Hxu48z/z1/
         qpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a2v6jk+yPLMrCROJzyRY2GjJA9XYRDi7YBTqABG6xhY=;
        b=ksSq1tow/5exVoKCZwFkekkvuL/4vRLgPMxv4sD2NtqdiejGpnk/meDBG8DknKU0k6
         3o+iD86jTDFS8mIMfIsmY1h3TkatvOw/TiNNyBicPf+fTroztsRhJsC9AXS/rGWFLB6D
         QAxltwRV0es4PNKY7nC+jDsNyVnwBfDIXTCO0G8+PPmKEWhW2BCgSoEt4jRihwUmJXeM
         R9Gtu5Z/9ubfhj0GZObaRQw23Vnw5e8wqMFloQufF5vVaIIuzHvrlo302pUkNw/HuRks
         ORpomXyUzGxmDQamWCefB2Hn5obGFN6EHL91+N5g5J2Vz66Kf0URYC5Bg2yipRGCdbSF
         twkg==
X-Gm-Message-State: AOAM5312jS1rogSWNdfZVRJWAs1c1g5+EZLgJn7aC/TpWJvMNMDr08Vc
        SpTk92Cl0XER4StCl1m+JF3xnbxWbdLgADw5uUA=
X-Google-Smtp-Source: ABdhPJxEToRzI94oa4DGeuicZYU1b7mW/JrgzXE4YBGMz7Q2JuqP4mV+2jVr/o7GfcdxG+GDhyGHlq6B7W+E2qWve9E=
X-Received: by 2002:a19:4147:: with SMTP id o68mr12206947lfa.295.1615901724915;
 Tue, 16 Mar 2021 06:35:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210315171037.171120-1-festevam@gmail.com> <YFAOYaPkLjCLBIWy@google.com>
In-Reply-To: <YFAOYaPkLjCLBIWy@google.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 16 Mar 2021 10:35:13 -0300
Message-ID: <CAOMZO5AKRmA4Qi_YJiE9mPSGZK4KQToO3u5-z271KWR9CUh+GA@mail.gmail.com>
Subject: Re: [PATCH] Input: imx_keypad - convert to a DT-only driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, Mar 15, 2021 at 10:48 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> > @@ -458,6 +458,7 @@ config KEYBOARD_SNVS_PWRKEY
> >  config KEYBOARD_IMX
> >       tristate "IMX keypad support"
> >       depends on ARCH_MXC || COMPILE_TEST
> > +     depends on OF
>
> ARCH_MXC is a stronger constraint than OF, so I wonder if we really need
> this.

ARCH_MXC does not depend on OF yet, but I agree this is a good
suggestion and will submit a patch to do so.

For the time being, I will keep the OF dependency in the driver.

> If we truly converting this driver then we should also remove references
> to dev_get_platdata() and checks for pdev->dev.of_node from
> imx_keypad_probe.

Good point. I removed them in v2.

Thanks
