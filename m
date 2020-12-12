Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A862D8420
	for <lists+linux-input@lfdr.de>; Sat, 12 Dec 2020 04:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407031AbgLLDOH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Dec 2020 22:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405302AbgLLDOE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Dec 2020 22:14:04 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992C6C0613CF;
        Fri, 11 Dec 2020 19:13:24 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id b26so8243129pfi.3;
        Fri, 11 Dec 2020 19:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yzbn+ceSTyDWxCtbtIIDZPwv75t98dQTzClhMUBMGp8=;
        b=sRBZKJeYQD9TqhRLE9isK77waygxp6QUJo2sysIfF1857NYJfYHFyxx4ZcgOfkLDLx
         kK9uTFP1DxoGF215XuqMzu9GiV1CSe5kKzbU9BYDi2bW90AT2q0zQ61zf8KSb+0YuveA
         Yr4QYeg6ilCc3z2NMWvfLedDZ9PzSLl7+KHUxtZUr6wRnMWXWNw2OK1J2WJkOjAa/6Rs
         McMD3ZCXQzHhnCoEVtRKrsDXqA6PD1bSESrXpwJTOriEX4sGpq4R4aMdLbPeb+0S8HRY
         WOyEZVBJKfqOo7ovpUfXt2OynercB50wHyUdCB4PWAai7qAkOsXioWnQlsbpYHpJAiiq
         WklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yzbn+ceSTyDWxCtbtIIDZPwv75t98dQTzClhMUBMGp8=;
        b=pf7VRTHGnu2M3a7D6cDxWQacNEbsgZDja7Pk/qhK8sJUmMbE2MSSvmPjK/qnxqxZKf
         MnIWPBmyNJ9hvyLFjKRLzrI9uHiD5HtY4VB5pHTOW37LQTmj0IAt7BQAqNBibJzxjMjT
         5g3utzQnckjBakO0mylz0QNa+qIYGSFOQR944opEUHe0qL/sQsxbylxb8lmcVhdzMNPm
         PTMb5fzpQ38HpSE2oaMJElpcDPt2oHoJTFVtmQxqfATnycgHxNEEFyPw2xoNSbPBa2yd
         zUkE2vFo8IjmWBbxluGJc8GG82LUmAKhttyzyFyUM/rR8B3pbVYVyj/iW4BKI+1aHtMN
         YNuQ==
X-Gm-Message-State: AOAM53308khiYwIt5k1pxh0QVHIcArlPP6sagOA3hLI7N0FadqF3aOnh
        Jx0kXS0wvUP2UkcJnYHyzAOtOtmyNW4=
X-Google-Smtp-Source: ABdhPJzcDbN9Stw3oWCHO7j7kl+/4ETqBMCAd+vI2caCx1GzTRpPD4V+diSaY4ZN3KWgNS9t7X7XaQ==
X-Received: by 2002:a63:6e87:: with SMTP id j129mr15026688pgc.304.1607742804019;
        Fri, 11 Dec 2020 19:13:24 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id gz2sm11500146pjb.2.2020.12.11.19.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 19:13:23 -0800 (PST)
Date:   Fri, 11 Dec 2020 19:13:21 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.10-rc7
Message-ID: <X9Q1UXLZ812+YO2p@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- a fix for cm109 stomping on its own control URB if it tries to toggle
  buzzer immediately after userspace opens input device (found by
  syzcaller)
- another fix for Raydium touchscreens that do not like splitting
  command transfers
- quirks for i8042, soc_button_array, and goodix drivers to make them
  work better with certain hardware.

Changelog:
---------

Chris Chiu (1):
      Input: i8042 - add Acer laptops to the i8042 reset list

Dmitry Torokhov (2):
      Input: cros_ec_keyb - send 'scancodes' in addition to key events
      Input: cm109 - do not stomp on control URB

Furquan Shaikh (1):
      Input: raydium_ts_i2c - do not split tx transactions

Hans de Goede (1):
      Input: soc_button_array - add Lenovo Yoga Tablet2 1051L to the dmi_use_low_level_irq list

Simon Beginn (1):
      Input: goodix - add upside-down quirk for Teclast X98 Pro tablet

Diffstat:
--------

 drivers/input/keyboard/cros_ec_keyb.c      |   1 +
 drivers/input/misc/cm109.c                 |   7 +-
 drivers/input/misc/soc_button_array.c      |  11 +++
 drivers/input/serio/i8042-x86ia64io.h      |  42 ++++++++++
 drivers/input/touchscreen/goodix.c         |  12 +++
 drivers/input/touchscreen/raydium_i2c_ts.c | 126 ++++++++++++++++++++---------
 6 files changed, 159 insertions(+), 40 deletions(-)

Thanks.


-- 
Dmitry
