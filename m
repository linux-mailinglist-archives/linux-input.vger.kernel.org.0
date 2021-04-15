Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44640360197
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 07:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhDOF2a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Apr 2021 01:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhDOF2a (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Apr 2021 01:28:30 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1125BC061574;
        Wed, 14 Apr 2021 22:28:08 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d8so11405703plh.11;
        Wed, 14 Apr 2021 22:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=k2yUYeG+28QcibceenXGfoVohHfUzQs5aF8cgYnWup4=;
        b=EL/H67VV9jDnI5FeYT1sUW657hXMUtzvs3reiqj1yJB2UFYtXRC+yc/pOQd8xAE61W
         HR8OBvIYM8W+w8OwP79rMMulc+TKqJ+vGMqg7SakSZg8sfYBJjUZHHkRqAUjoUYlunIO
         fkLV+iJisCX/N+xUYsw/c2mX09VNmPR4o4WDbkYVT1oZQMSjOf2zLPEJAGAgsVSLNlBX
         QqLpUIGcGcQFyDhO55Ux9GtplMnRPOtYKSj32xof2imnccyJincL7ECQHqmmNLpQCgdb
         7J/X5bToQSXzhDskiE6MDKP5WfXljWVYKV24XeKgQkcKy2rm6h3FZbyWNOgOwdpZojwr
         fIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=k2yUYeG+28QcibceenXGfoVohHfUzQs5aF8cgYnWup4=;
        b=L6u0g2fezOQiiMU2VFGeGP5KfGFid7W6x8dn0MABv8sJkrbIbhcuXOX5j6kOmXZ51e
         acwB8H9ru7gQrV3BjqGoPCK4F45mkKRdAWmVCxt9kc6zQEvxae+2GZk2iVcOhojnvBj/
         1ZsM78VndSsoLcXEoKMPYsdUpifAiTHs6jxyS/9OGpI5Xgoq9mlioauF6oJRJQlODjUK
         5HVyZBburLlYkUE0MxmBZJ7+kOOIiQk5L/GeZvs85YJWcV2grpQxTxy6JA2gdJDpv04R
         uGypoO/UPYo9r6b4Qn0jK+aP7yybMHoJTjqGRPOVJowqSQPEZZZaWfal5O6AEdoL1qL9
         y/2Q==
X-Gm-Message-State: AOAM530C/PNY3int7zY20hNd6YXMdb1pMx3RuC5JoOG9LUCeh+cwPTuT
        Ikm6uiDzfPhdxPGx1LvJFb4=
X-Google-Smtp-Source: ABdhPJyX9F9dW8Q96gP6m1OtMEnURJdz1eajEDbujbqiZnqe2AL+L6xJS8NB6P8B+NDpw+s6Vqi+4w==
X-Received: by 2002:a17:902:e98a:b029:eb:65ee:ddc9 with SMTP id f10-20020a170902e98ab02900eb65eeddc9mr1994430plb.73.1618464487535;
        Wed, 14 Apr 2021 22:28:07 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:4d7e:4d10:d9a7:9fa4])
        by smtp.gmail.com with ESMTPSA id d4sm992012pjs.1.2021.04.14.22.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 22:28:06 -0700 (PDT)
Date:   Wed, 14 Apr 2021 22:28:04 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.12-rc7
Message-ID: <YHfO5AMF3PwmEBhR@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Just a few driver fixes
here.

Changelog:
---------

Arnd Bergmann (1):
      Input: i8042 - fix Pegatron C15B ID entry

Caleb Connolly (1):
      Input: s6sy761 - fix coordinate read bit shift

Dmitry Osipenko (2):
      Input: elants_i2c - fix division by zero if firmware reports zero phys size
      Input: elants_i2c - drop zero-checking of ABS_MT_TOUCH_MAJOR resolution

Fabian Vogt (1):
      Input: nspire-keypad - enable interrupts only when opened

Wei Yongjun (1):
      Input: n64joy - fix return value check in n64joy_probe()

Diffstat:
--------

 drivers/input/joystick/n64joy.c        |  4 +--
 drivers/input/keyboard/nspire-keypad.c | 56 +++++++++++++++++++---------------
 drivers/input/serio/i8042-x86ia64io.h  |  1 +
 drivers/input/touchscreen/elants_i2c.c |  5 ++-
 drivers/input/touchscreen/s6sy761.c    |  4 +--
 5 files changed, 38 insertions(+), 32 deletions(-)

Thanks.


-- 
Dmitry
