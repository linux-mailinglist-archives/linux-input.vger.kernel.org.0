Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A631472B76
	for <lists+linux-input@lfdr.de>; Mon, 13 Dec 2021 12:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232673AbhLMLdI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Dec 2021 06:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbhLMLdH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Dec 2021 06:33:07 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87629C061574
        for <linux-input@vger.kernel.org>; Mon, 13 Dec 2021 03:33:07 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id d21so6254957qkl.3
        for <linux-input@vger.kernel.org>; Mon, 13 Dec 2021 03:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TQXJztY8oqvTFgPuG2hsiXVSvzBdv0hhl/dvwVF0OnA=;
        b=r8u6RbSPvDTQbi9AJTB2x3hFmaf0xoHiEPAZqLneg/4jcqXdY7nxlZy0c5zRl12eZy
         ngxVLsgF6gcdPfAlLSIcVvM0HqPpk9GJAdzst1/FDmnSspfRPnjPPFp/7DECxJFBXTlq
         dtoSMTfhbqJF+cpg2/ehHUFpUteNKeI+6iDGdAMO1w/N8TyffJjVTisdQ4e0uuS5MpJ8
         Sde5lafUuOOGcVnscl8DJdjcVP60AQgci6yqW5QwxnpgaYcaknu9uyp+gKIz5DYAHbCv
         IVDdXs0jFJ8vLZmppXNQiAjmcmzc2StO6qDp89MYznBAL5utNWwyE+Myqnmth0Sy4jEz
         oFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TQXJztY8oqvTFgPuG2hsiXVSvzBdv0hhl/dvwVF0OnA=;
        b=su1tgKc1wLNEj6x5SNeqCEBjzHJq1IghFCPLT/kWCmMHGSO8IxRDFR6IyZJlys+FdM
         xpiF4g/+J9W0sc/6LujLJJCw2KRMcdsBPHqq2U33UyrCdUMFq/XxY83hwp1/xpEeLV34
         5BaIsg91O5cuH0Mc5rBZE61q5CXAbpQZbueqTOy8RpgQJR8pl4fZVrHdHCo5rTZ08vdO
         JWhib6DHn5LlzEpq0GK4B6p8MLMEXWC4jyAUw15kadlJx2jt4c2MrcwArzk2Q2cL+ysV
         t/tpbIF0PwgXQiq6id/9fy5X9No8Ll0W95L+F0GriYIjBX/jfO0p+SJIOEAqfMebmOrc
         hksQ==
X-Gm-Message-State: AOAM532BS0QnXH2DlhCLPU18xobvEJvryT7dipDqbm8ZjIj48f8O1gqf
        nFJgkUBeOkmi/cyBqcaHrbibuuaNg9l1P1GWgg8h6iWhSjM=
X-Google-Smtp-Source: ABdhPJzq4ZR9N54jll8sAWn9JdMe97r61rRSdsq3a4Qo3BT2XsByg+sSN4YUjl6x81M65jqxj7i/+phKCSH2QC3dzWc=
X-Received: by 2002:a05:620a:2848:: with SMTP id h8mr32780087qkp.610.1639395186461;
 Mon, 13 Dec 2021 03:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20211129143845.1472453-1-glider@google.com> <YbQTA9NWoDAknJKB@google.com>
 <CAG_fn=V=vykKUHxa2dTxehgdifP4-8R2LKcOXrEmRbfO1DRnng@mail.gmail.com>
In-Reply-To: <CAG_fn=V=vykKUHxa2dTxehgdifP4-8R2LKcOXrEmRbfO1DRnng@mail.gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 13 Dec 2021 12:32:30 +0100
Message-ID: <CAG_fn=UwADkNqzinHS=DmfYbHBvWm-oQfmr5pHq82ZAKyFyzxQ@mail.gmail.com>
Subject: Re: [PATCH] Input: psmouse: check the result of PSMOUSE_CMD_GET* commands
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     dvyukov@google.com, elver@google.com, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> I think it makes sense to bail out if one of the ps2_command()
> preceding PSMOUSE_CMD_GET* returned an error, but am not sure
Sorry, please disregard this part.

> The bugs caused by incorrect uses of PSMOUSE_CMD_GET are blocking
> KMSAN builds on syzbot, so we can immediately test the effect of the
> proposed change.
This was meant to give some context, but I failed to finish my thought prop=
erly.
Syzbot doesn't cover anything past mouse detection, so changing
anything besides that couldn't be tested anyway.

> If there were
Disregard this as well.

>
> > Thanks.
> >
> > --
> > Dmitry
>
>
>
> --
> Alexander Potapenko
> Software Engineer
>
> Google Germany GmbH
> Erika-Mann-Stra=C3=9Fe, 33
> 80636 M=C3=BCnchen
>
> Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
> Registergericht und -nummer: Hamburg, HRB 86891
> Sitz der Gesellschaft: Hamburg



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
