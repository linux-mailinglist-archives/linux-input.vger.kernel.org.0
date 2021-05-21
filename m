Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B4238C46C
	for <lists+linux-input@lfdr.de>; Fri, 21 May 2021 12:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhEUKM2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 21 May 2021 06:12:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52243 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234068AbhEUKM0 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 21 May 2021 06:12:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621591863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=5DGucTpOSdNB3udh/jHOq//Wrt+SINHxa1SZsMWftOs=;
        b=cElqm1n7hkHpjsXz9zwR8A6/stQbnjKgcR+eJyTpFHG9k4srao8JZThFkFX3vsyHvagnZd
        4eNOYbNh14JDChcOLUntRpxpSTtsMa3OEsr04ym8f4N6qL/pXWK9Itorrl1fcMPmqbz5e3
        2LMejDazNpfTtFJY53iuBULFjMNTMIY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-YvGNgrOQO0a00dNcBp1qpQ-1; Fri, 21 May 2021 06:11:02 -0400
X-MC-Unique: YvGNgrOQO0a00dNcBp1qpQ-1
Received: by mail-ej1-f69.google.com with SMTP id z6-20020a17090665c6b02903700252d1ccso5973301ejn.10
        for <linux-input@vger.kernel.org>; Fri, 21 May 2021 03:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=5DGucTpOSdNB3udh/jHOq//Wrt+SINHxa1SZsMWftOs=;
        b=TvuvOpg+Jh9+mab4RLmNhRiOgaCLT2EVoD4szxuJ2z7AIML5vB1fcwCsG4ds58FShK
         cH4v/V5VSJu4Uyf2tIHFXjp7On6m5y8/aWBI4OUp89r086rrdAybvd2J9c02aQwuDkRj
         /lnH0QNCZddpCkZmrXfcG7wHmDxeqvLg5qIhOyZBvgFFATiSS3rRSEdB1hCqx4h4Yvzc
         0e2oeCee+mZ2vfK7cd6Jkz0yjKOQPQWP/+1NqC92xqJDgxePIZnbaiVdOn2xyT+TQmoD
         esgLI3sIwVkseEG3zTJvtaYFrwXscuwu/CYLAqORPaiGGjpxKXmbqckV5Ncd/h2V+avy
         omqQ==
X-Gm-Message-State: AOAM531fiR5LgTYpGYVkWgzJtUeNJAgb69kvoNDcRwu+tI3tPF/UA/Qf
        88mdoVoAdfDV9TbJmR1Rzq2UFG0Na/4R2n68bB+KkRp83gucoO1dKoeyG5DrpLFV1i3hV1mFiP9
        rH/20cQ5Hcja/EgzFCkP0Hgk=
X-Received: by 2002:a50:fe8c:: with SMTP id d12mr10387557edt.336.1621591860826;
        Fri, 21 May 2021 03:11:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqwBZgAHfKXprfcoCGvRBQD5yN2IfHv4HoLl9fzWMPRypgMwG/SUMK0ms4xynSGoqYQuGB4Q==
X-Received: by 2002:a50:fe8c:: with SMTP id d12mr10387547edt.336.1621591860707;
        Fri, 21 May 2021 03:11:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gz8sm3151526ejb.38.2021.05.21.03.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 03:11:00 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between drivers/platform/x86 and
 drivers/input due for the v5.14 merge window
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>
Message-ID: <eb032465-5d2c-35a4-73ed-866648c5936f@redhat.com>
Date:   Fri, 21 May 2021 12:10:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

As discussed before here is a pull-req from an immutable branch moving most
of the drivers/input/touchscreen/goodix.c DMI quirks to the generic
x86/DMI touchscreen database in drivers/platform/x86/touchscreen_dmi.c

Note I've dropped the patch moving the single invert_x quirk (leaving that
quirk in goodix.c) since the generic touchscreen quirk code needs the dev_name()
of the ACPI-device to which it should add the device-props and my requests to
provide that have not been answered.

Note I also have an outstanding (unrelated) patch-series for goodix touchscreens:
"[PATCH 0/7] Input: goodix - Add support for controllers without flash"
Please merge this pull-req first (there should be no conflicts, but still).

Regards,

Hans


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-goodix-v5.14-1

for you to fetch changes up to fcd8cf0e3e48f4c66af82c8e799c37cb0cccffe0:

  platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of TM800A550L tablets (2021-05-20 15:17:24 +0200)

----------------------------------------------------------------
Signed tag for the immutable platform-drivers-x86-goodix branch for merging into the input subsystem.

----------------------------------------------------------------
Hans de Goede (3):
      Input: goodix - platform/x86: touchscreen_dmi - Move upside down quirks to touchscreen_dmi.c
      platform/x86: touchscreen_dmi: Add an extra entry for the upside down Goodix touchscreen on Teclast X89 tablets
      platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of TM800A550L tablets

 drivers/input/touchscreen/goodix.c     | 52 ---------------------
 drivers/platform/x86/touchscreen_dmi.c | 85 ++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+), 52 deletions(-)

