Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171023913E4
	for <lists+linux-input@lfdr.de>; Wed, 26 May 2021 11:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233288AbhEZJmI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 May 2021 05:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233117AbhEZJmH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 May 2021 05:42:07 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB1EC061574
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 02:40:35 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id j75so881026oih.10
        for <linux-input@vger.kernel.org>; Wed, 26 May 2021 02:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=j157uAdH+Dt8bO1dH9QROoJp127aqvEjds9YChOAzaU=;
        b=Iiv+ZZubwfSMsz7wmOyF68F0D/Vwo6KbTohBU8Cce+6nMEi0MvGQ8nyv3fLS1Hf2gE
         k2Mwj51QnvdQtHOPnLjIvx6zu2aeBeSkMMiyHBbMmonqUhdHurvnCyDjQJIHSMAcF5z4
         SaVyn6TWGlCvbP9XyNy4ks1J2FrwDqp+gXPSRuXZuKi9giTB2naV2QDrVL6rnIp7Of6p
         qOQss8sxKAHp/O9PObuQFJeFMz2bWUy6EsD1Mb3t9DoKLnA9+q8mV4NlsHiUYaeYfYH4
         Uj2MzPpkwftH1uHMsrWf3L12N8Q+LYkp3QrzE2OGphC3USohx2+815z5EEJimjF4D0x+
         oaWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=j157uAdH+Dt8bO1dH9QROoJp127aqvEjds9YChOAzaU=;
        b=fMFw/eqFz+jgu8lQA7/SP4deJESrbESr1menAkxIJsvqdEB+H28W7ss2KvrZFLiwh6
         SVz0l7R9LRCUtCB4l/j11HpaxOCp65hKTHckqM2kAARlcnekL1D8F5JlptpgfPbzIRgd
         7GkkrxUV+DT3vdGEAp0F5wBvTPo+2+Ve9aeuqv8Oi2+1jB6UTSz+GIQ+uHZI90gWMiBU
         hFfkT+HG+9lkIClWeU4effRI8Eoq5hCrW+5eguR59bl/kKjN4RSPiZ3yoqjuwCQgMOJO
         CUXpZgo5NDJcKudRqdX+JnrCd59KUZyp7Kl9PKc/54kly/HQEzOf+nJdtqWmHeiUpDuR
         EJ4g==
X-Gm-Message-State: AOAM531U23+yV8hY3rrhb/GuD7KWzqN3GWj7jTXURWMx7PH4mjV5K3d+
        ozEuB4WNuQSG6v/jdBjkxifUFVSyy2IlFYT0E0tQREH7RsVjNQ==
X-Google-Smtp-Source: ABdhPJxSOKqc8yAtwdC3qV659y2lKcSM9gys6PzXC1iQrBmtY5+zezC2W+ZmSU9v1A+M15XnQ7yhLQuKFfNKp1w3WMo=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr1137134oig.105.1622022035038;
 Wed, 26 May 2021 02:40:35 -0700 (PDT)
MIME-Version: 1.0
From:   Max Witte <maxdwit@googlemail.com>
Date:   Wed, 26 May 2021 11:40:22 +0200
Message-ID: <CADG_wDYbo9AftRUF1vMpmcOAeC56Y5E-dsAaC3RQF2Z+ey1yoQ@mail.gmail.com>
Subject: i2c-hid touchpad synopsys designware
To:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i2c-hid touchpad synopsys designware
I've got the hold on a Fujitsu Ultrabook U7411/U7x11 which has some
glitches/quirks with the touchpad that can be fixed with modprobe
i2c-hid. ( Ubuntu 20.04 / 5.8.0-53-generic )

In dmesg I can see this when I modprobe it:
i2c_hid i2c-0X53 0X59 0X4E 0X50 0X31 0X46 0X31 0X35 0X00:00: supply
vdd not found, using dummy regulator

After this it appears in xinput and works:
    0X53 0X59 0X4E 0X50 06CB:CE2B Touchpad    id=19

Any clues / suggestions to make this work "out of the box" are appreciated.
