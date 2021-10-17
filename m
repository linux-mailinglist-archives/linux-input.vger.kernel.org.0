Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092034306A6
	for <lists+linux-input@lfdr.de>; Sun, 17 Oct 2021 06:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241409AbhJQEf5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 Oct 2021 00:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhJQEf4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 Oct 2021 00:35:56 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE706C061765;
        Sat, 16 Oct 2021 21:33:46 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id ls18-20020a17090b351200b001a00250584aso12182254pjb.4;
        Sat, 16 Oct 2021 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=7GoBCSjsX6VMfVH9Vxws0sHOzgydjGRFSMwZv302oE4=;
        b=CyW8axXYBesh/69ixW0wmyOvVe95khhOteRFfWKRiMk4NwRUY7ZD+DmTkG8jPPYBuO
         3JK5YyjPF6xlSBEvv/UwVUtMKongeH1BZR2qTY7+F8zr5hsN/dTXY7PxFET7WihzluKp
         HKJhAo13+LvdvToh2vnQN4pExLphnlMW5Ib/284KkQ8KlMctJhhl6PUJ9eg2DoRslteu
         2CiN0b96ZIzdxjHSf88jSE5RrdltZm7LDq7zIxefDSps3g99d/t4L/pTFezbMgIhbNUf
         0rwrN6JOnB7xr0UwljJLWq91yzbKKe9yG6tppqRJHmbdXEpJC8Hjs30JWwd0b2OllWIT
         ZLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=7GoBCSjsX6VMfVH9Vxws0sHOzgydjGRFSMwZv302oE4=;
        b=36gIMp2ylwyy2TEKjI8QAH7zGubxUxBnVzFbjwlaim/xixTxwy48PafWZdkCJyh/YL
         hSC1BHml2BQTyOlHSmkNwTG7hGGqglWrat9ZwLq875GgwYSU5TDLCphuCtSOGe1OKWb8
         Sfpi5AbJHE+r94lLMiOPDVDCGfvAujkdNqq0OVFWDLzCqjAqrxVAypH4ErS9wnxt0jhQ
         mw+SzuvgVvFhRO/zwyd+8dXVyk9X8TYM0/EPkS4LTIJwVeO8l+17V8Lfk3pUYRzvN1gG
         zIqxbzLxZSq0UChz8p7cSvR54/B8vccVW8mQBwEZUrrz4OGe02GawwpmiQVMqd7VpV6b
         D/Ng==
X-Gm-Message-State: AOAM531VE4w61sFy3TxqAytfdvPpzthnOoGwjqkMCXax+D0Z3ahj86vD
        TDnC1wrqb5pxAXwQ2VzH0so=
X-Google-Smtp-Source: ABdhPJxHiAGCsHfH57u7IbWjzW64JlYhCdOkkcQ442wmP7eoIx5cagikPuXUWeDEFvLOuNhZQgVy6Q==
X-Received: by 2002:a17:90a:7148:: with SMTP id g8mr37778313pjs.221.1634445226225;
        Sat, 16 Oct 2021 21:33:46 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:e49a:151f:b7d7:af9a])
        by smtp.gmail.com with ESMTPSA id s2sm8677117pfe.215.2021.10.16.21.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 21:33:45 -0700 (PDT)
Date:   Sat, 16 Oct 2021 21:33:42 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.15-rc5
Message-ID: <YWunpuIgc3ODHhVE@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- a new product ID was added to xpad joystick driver
- fixes to resistive-adc-touch and snvs_pwrkey drivers
- a change to touchscreen helpers to make clang happier

Changelog:
---------

Michael Cullen (1):
      Input: xpad - add support for another USB ID of Nacon GC-100

Nathan Chancellor (1):
      Input: touchscreen - avoid bitwise vs logical OR warning

Oleksij Rempel (1):
      Input: resistive-adc-touch - fix division by zero error on z1 == 0

Uwe Kleine-König (1):
      Input: snvs_pwrkey - add clk handling

Diffstat:
--------

 drivers/input/joystick/xpad.c                   |  2 ++
 drivers/input/keyboard/snvs_pwrkey.c            | 29 +++++++++++++++++
 drivers/input/touchscreen.c                     | 42 ++++++++++++-------------
 drivers/input/touchscreen/resistive-adc-touch.c | 29 +++++++++--------
 4 files changed, 68 insertions(+), 34 deletions(-)

Thanks.


-- 
Dmitry
