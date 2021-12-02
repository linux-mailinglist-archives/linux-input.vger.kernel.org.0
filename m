Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922F1465E2A
	for <lists+linux-input@lfdr.de>; Thu,  2 Dec 2021 07:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236851AbhLBGWC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 2 Dec 2021 01:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbhLBGV5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 2 Dec 2021 01:21:57 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC4EC061574
        for <linux-input@vger.kernel.org>; Wed,  1 Dec 2021 22:18:34 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id z7so34612855lfi.11
        for <linux-input@vger.kernel.org>; Wed, 01 Dec 2021 22:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sKL82US97i/zDLFZH4Kh6g2wAAwhPkal0h5fYufEX0A=;
        b=VmDGmrZN653WIvcDNfwJjet4ImWFPI85YEOiybeiaIDaMH2a4MIOr9SzbwWpRh4vkK
         gWWyKykUvsYDOkbeKdnqVv0Fxothb7lJkwn+ML18cM7CVfreH94RpH22VbAmWAtkPTsM
         urgCI9ekQzvHESgFPJt5GeROIwbNApu+37hKcdT5gzeIqeYcJJf6EfrPediZd9sjuQYX
         In3IOTb8BLwuhMW6LKv1ZY1TZQH8SAexRlM69mP9haidLTEvhNBfcHiIfCiOFrdi5tGt
         Ak24UU2G8vWIT8OBjVxxYHcauCE/aNQEwhCPcD5zXMwrtEsN/JRZ/3zSQ0J0KlLS/gXQ
         b4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sKL82US97i/zDLFZH4Kh6g2wAAwhPkal0h5fYufEX0A=;
        b=KFWNe1qtLSVhqRNaMJ1QuxIE/EEiH2qUFAnY1TW3fttqjS2PLZqRsVSMBNDr18DJQy
         vbQUTg4HaU/zwDx8I1ySgJphj7K6pd/lT5Pfj42gX5/ZP13LanBAoC90pt+MwhpQFGma
         2EnrIMI9cDms5ugL0X5l5WzIcLnjt+OTol18IXlfv+JRfZapXxuCCbKMXni0jG0Kb1uM
         ZnAMuOgLL5aOqQos6HbdE51gLtDNODu5XJiVThy/XRZvFyvGQg79I6nZfUWz/7rJZ9Hx
         CjWO1a0aVRMMtB2QG0cw4OgNZChlD7AlCqJyxaXyZNDmPNKRlbRsNc+tg5tk7+rm9f1g
         s/fQ==
X-Gm-Message-State: AOAM5322mH01rsRyUWehqgg+jho6McVUyRv/vPcnR9Eyt4GcrTBGFHth
        KmnQehWSW317Bsrjd2t0Oa+2vsR2OGEXV127io4=
X-Google-Smtp-Source: ABdhPJwdxrNTz3crJyokpgaiQRzbox7d4lvoGsthUE6Q9J86R4MbUicNNqNpzlqhg8UO+6ZQxZewQX9SBWZBpyqx1a8=
X-Received: by 2002:a05:6512:3192:: with SMTP id i18mr10334094lfe.205.1638425912737;
 Wed, 01 Dec 2021 22:18:32 -0800 (PST)
MIME-Version: 1.0
References: <20211108125038.125579-1-benjamin@sipsolutions.net>
In-Reply-To: <20211108125038.125579-1-benjamin@sipsolutions.net>
From:   Alex Henrie <alexhenrie24@gmail.com>
Date:   Wed, 1 Dec 2021 23:18:21 -0700
Message-ID: <CAMMLpeSdmc1Ti4EZ9Tm7eq3a3+u46TEMWSaqD=USSnSRnZMYTg@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Add 2021 magic keyboard FN key mapping
To:     Benjamin Berg <benjamin@sipsolutions.net>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 8, 2021 at 5:50 AM Benjamin Berg <benjamin@sipsolutions.net> wrote:
>
> +               if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021)
> +                       table = apple2021_fn_keys;

This will have to be updated to cover
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 and
USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021 too.

Other than that, the patch looks good, thanks!

Tested-by: Alex Henrie <alexhenrie24@gmail.com>
