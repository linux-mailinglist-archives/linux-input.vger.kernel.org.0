Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACDBED67F
	for <lists+linux-input@lfdr.de>; Mon,  4 Nov 2019 00:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728344AbfKCX4K (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Nov 2019 18:56:10 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:45125 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbfKCX4K (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Nov 2019 18:56:10 -0500
Received: by mail-io1-f67.google.com with SMTP id s17so16460922iol.12;
        Sun, 03 Nov 2019 15:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tJ6SImAE5bBoHYBCW+S1n9LSWyT51AlKJPtj4WQ4frM=;
        b=Sst1iyXCX97oratlkRhsLlha9WX8ofivjl1jgu5UOsVM6CK8InNY2yRxCUEb0FauIR
         U9IR9pEuTzjsMnZFNDKEArjK4TbpMrgeHke9ILCcgWQmg6o4M/fus1L57FP7rZ8Lq91k
         nUvl83HLP01tDCJtKz7OwvErumRZx8OICbEsf3NqrA84Q5KT6Uys2y8DRSrSA7xQNba/
         pKcy5aWXckP9cAMBR+6gNk44YQvukSjx6CQeS2VefsdFMuYv2twDAkVp4a9TyW/9ZMgd
         QWZLZHQnPrZiMqbResl6DyILpg/GsdjciQ5eZE6Y/Cjv8kYdwN0OchhBi1qt5VzfwJsx
         6tMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tJ6SImAE5bBoHYBCW+S1n9LSWyT51AlKJPtj4WQ4frM=;
        b=eDiMQGZiHzQCRIwR39rLCIsIWeUDFaxyui8oaq5ax0TJqSpozOwunzVqjMFHErWe1T
         2CL7za3ZYAp03vbDuPIyNZf/tKD7SQaQYah92qtBxYIgAR7zrqTLt3F/Yuyo3zK61Mx6
         YC8+oOgpubMGYTmrM/nYE09BbncNvKyyzvy+HDtQNBXCEnplvyfZs88rSmVbKHcXce3p
         +jhcbuxpi3kFA30qwqc+9sb/Xz2haAkvjjsVe8U4KFX3sK4v29rhjxFPpoNh+8hMhKEW
         ulxH3F1yTLXBQEpslo1i/LxWy7SIHIZamgq7EJmexCQaXMXXSyzVfH1Nw92SU9veEln2
         zwrA==
X-Gm-Message-State: APjAAAVqIZqeZc+vgamC8pufIhVuv0AuD22La9SK/4ky+yIiFQRO82WZ
        psrKjCORGHJzfhOoRLIILpsZ/45m9w2/BfEk2Oo=
X-Google-Smtp-Source: APXvYqzJ3138JUvEx/iZsyEk2rzt/M/4z0RDxd0AvebVuASHN0b6ISXY+iVwBbphQehbILaLdnFb7/cZo4+ACSg41AM=
X-Received: by 2002:a02:3309:: with SMTP id c9mr1010109jae.52.1572825369041;
 Sun, 03 Nov 2019 15:56:09 -0800 (PST)
MIME-Version: 1.0
References: <20190302141704.32547-1-marex@denx.de> <20191101204801.16328-1-TheSven73@gmail.com>
In-Reply-To: <20191101204801.16328-1-TheSven73@gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Sun, 3 Nov 2019 17:55:57 -0600
Message-ID: <CAHCN7xL4aNDf+4TiStSp4PMiA_FKj9VOmCpe-o42WBhMdoj_Ew@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: ili210x - add ILI2117 support
To:     Sven Van Asbroeck <thesven73@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 1, 2019 at 3:48 PM Sven Van Asbroeck <thesven73@gmail.com> wrote:
>
> Dmitry / Marek,
>
> There have been two attempts to add ILI2117 touch controller support.
> I was about to add a third, but luckily I checked the mailing list
> before writing any code :)
>
> Adding this support would clearly be beneficial for the common good.
> What can we do to get this in motion again?
>
> Last time I checked, Marek posted a patch which added the 2117, but Dmitry
> objected, because the code became too unwieldy. Dmitry then posted a cleanup
> patch, which did not work for Marek. So everything came to a halt.
> See:
> https://patchwork.kernel.org/patch/10836651/
> https://www.spinics.net/lists/linux-input/msg62670.html
>
> Dmitry, would you perhaps be willing to accept Marek's patch, and perform the
> cleanup later?
>
> Marek, would you perhaps be willing to invest some time to debug Dmitry's
> cleanup patch?
>
> On my end, I've reviewed Dmitry's patch and it looks mostly ok. I saw one
> difference with ILI210X which could explain Marek's results, but I can't be
> sure - because I could not locate the 210X's register layout on the web.
>
> In Dmitry's patch, we see:
>
>         touch = ili210x_report_events(priv, touchdata);
>         if (touch || chip->continue_polling(touchdata))
>                 schedule_delayed_work(&priv->dwork,
>                                       msecs_to_jiffies(priv->poll_period));
>
> but this is not exactly equivalent to the original. Because in the original,
> the 210X's decision to kick off delayed work is completely independent of
> the value of touch.
>

If anyone is interested, I posted a patch to add ili2117A.
https://patchwork.kernel.org/patch/10849877/

I am not sure if it's compatible with the non-A version.


> Suggested replacement:
>
>         touch = ili210x_report_events(priv, touchdata);
>         if (chip->continue_polling)
>                 touch = chip->continue_polling(touchdata);
>
> Sven
