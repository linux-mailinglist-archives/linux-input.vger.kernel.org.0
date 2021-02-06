Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C817311972
	for <lists+linux-input@lfdr.de>; Sat,  6 Feb 2021 04:07:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhBFDFY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Feb 2021 22:05:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232230AbhBFCzl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Feb 2021 21:55:41 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE99C03327D;
        Fri,  5 Feb 2021 18:13:35 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id z9so4826704pjl.5;
        Fri, 05 Feb 2021 18:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=0buCJiWiupf4M1cuZVH0zshahYh4cEwQbw2GM3MH8Fg=;
        b=G5on0SR7ld8bJ1VpW84vyIDXbUFHwiD6GzZ4cLMxlvWBuRe37PiM8Dj1+fyRArGO3r
         49GExPbTWtQksWApW0BpgfL/COONqJSE8VjdU0Q/zv8TpKtZIMlGEoxvcXk7YGrI4iYC
         ttAsD9u6Gq656++i666Qd7idYD9ruhjDmu2t/77I92rfDkL+OcBaw0i6Iw0W4x8cxEHU
         N3PPq4Or5LWoVpFjiVQnfsL3dlV2yYTJUWI44B3on+cgf6nE9FZ89rI4U7sZLhiORji5
         14xYZw6Wo7oCRW+U6feAJOGs3SmCPmBi0O8n+7a55CyC2imWixc6jEJHcRc976pJwpw8
         uvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=0buCJiWiupf4M1cuZVH0zshahYh4cEwQbw2GM3MH8Fg=;
        b=LjJK012zTh7iE6wjnPCRRA1KvGU381eJVzp+uNaGep4twtcgvrSq9y+YbfB7i7dDM4
         6uFmNe7pjW6TuSkjnMxQtbpmY6QeL93zcDZ66ErkkX24aR7fugQXuIBtMs+X/Y2R+DE9
         yetYmWuQ+u/X+R6a26F6vRWaRFYNyqxRcG9dhP4A4zbgnt2aGyUhYwzMudq/4VRYmxkb
         g3euzhBEHuFPKpIafMh2MC02brn/Fdcy38S764fkCcE9b8lL7fyb9eNI+luZPzbWccYu
         XSonP3XigXr6edHNBGowmU3ioOPvIeQAEIpkb0DhlmtdPagO7ZR6SEtLg+kMcJPQ/sYe
         exig==
X-Gm-Message-State: AOAM533oOClP1WCSqyzG+BfcR+IMsEIS0Zl+thj66GpViLwVqrDi6nGQ
        /YkuNvxZbjC/lcn6I3yMCIM=
X-Google-Smtp-Source: ABdhPJzGiU+isXfShZJyv0Mh7lT8WZvsuNYGRAma+nWrzY3qKbkHoMwJorx4GCrAGeXlYDfjWIlXfw==
X-Received: by 2002:a17:90a:b28b:: with SMTP id c11mr3499939pjr.62.1612577614945;
        Fri, 05 Feb 2021 18:13:34 -0800 (PST)
Received: from google.com ([2620:15c:202:201:518d:8fc4:6ccc:568c])
        by smtp.gmail.com with ESMTPSA id j4sm10789856pfa.131.2021.02.05.18.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 18:13:33 -0800 (PST)
Date:   Fri, 5 Feb 2021 18:13:31 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.11-rc6
Message-ID: <YB37S7x1mvSeERFT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. Nothing terribly
interesting, just a few fixups.

Changelog:
---------

Alexey Dobriyan (1):
      Input: i8042 - unbreak Pegatron C15B

AngeloGioacchino Del Regno (2):
      dt-bindings: input: touchscreen: goodix: Add binding for GT9286 IC
      Input: goodix - add support for Goodix GT9286 chip

Benjamin Valentin (1):
      Input: xpad - sync supported devices with fork on GitHub

Geert Uytterhoeven (3):
      Input: st1232 - fix off-by-one error in resolution handling
      Input: st1232 - do not read more bytes than needed
      Input: st1232 - wait until device is ready before reading resolution

Heinrich Schuchardt (1):
      dt-bindings: input: adc-keys: clarify description

Marek Vasut (1):
      Input: ili210x - implement pressure reporting for ILI251x

Souptick Joarder (1):
      Input: ariel-pwrbutton - remove unused variable ariel_pwrbutton_id_table

Diffstat:
--------

 .../devicetree/bindings/input/adc-keys.txt         | 22 +++++++++-
 .../bindings/input/touchscreen/goodix.yaml         |  1 +
 drivers/input/joystick/xpad.c                      | 17 +++++++-
 drivers/input/misc/ariel-pwrbutton.c               |  6 ---
 drivers/input/serio/i8042-x86ia64io.h              |  2 +
 drivers/input/touchscreen/goodix.c                 |  2 +
 drivers/input/touchscreen/ili210x.c                | 26 ++++++++----
 drivers/input/touchscreen/st1232.c                 | 48 +++++++++++++++++++---
 8 files changed, 102 insertions(+), 22 deletions(-)

Thanks.


-- 
Dmitry
