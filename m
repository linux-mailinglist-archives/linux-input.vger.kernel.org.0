Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD81E6F06D
	for <lists+linux-input@lfdr.de>; Sat, 20 Jul 2019 21:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbfGTTKo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Jul 2019 15:10:44 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38017 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfGTTKo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Jul 2019 15:10:44 -0400
Received: by mail-lj1-f196.google.com with SMTP id r9so33783577ljg.5;
        Sat, 20 Jul 2019 12:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding:user-agent;
        bh=sAW07qyjhEVIxodnCZdBKnM0U4RmWV2j0NCWegzpIwA=;
        b=ptenvZR0nKtvw5lG1xsrfwOHMtWgvQCqPW3Gx2yHOcOu83Y82gr+P91VFopRAzMctT
         jQjLCUH7VEJUtZW/zXo3hscgTnCuFCFWfT1Lfud5mWOuaENwUOdHWeQuVZ2B6QFsGYJr
         CtDLrDFZJVHU5rr2eekIQdRL2rVsxnqqsAUyt2I7zM0GwrkjjpOyDhT24Qu4WfVhddN1
         cIZVCwWoTgXk5vYsmFabHCIRfm2lR//E43sOZ47XvzDV4xwRShaeDME0yugb38J/iic6
         Ez9/P2xzRM9DQGqkXznjaQRYYmIlgCgdRZ0xcBbCE+ksGqArwIOTFR0oTAPux7j94ZeN
         4AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding:user-agent;
        bh=sAW07qyjhEVIxodnCZdBKnM0U4RmWV2j0NCWegzpIwA=;
        b=m691m3f8UN4uT1Xxt3vRK6BWa71zS1j4saojQ+1JeYS6EybuxTIpQ0Tst3o0soU39Q
         yR94yGLjBtwCeXJpKDI1IE58NpGa3RqnLJ8+JEJ8LqK6YvSBtjUhM1OQgOlHoyk9LGLj
         6gJFZTIrBtUeandC8rzR/jyox6gTX6f7I3lCb9lLRi9AEhhcjK2B9fTlCPK8q5k9kl3R
         Q/P40hso4FJZ72CQNptT6WXhUfI+2SrXqoKPLD7J2qec80P1hVaDnlQ9pizyk25TvVUj
         95ieuK9oVXTlqe+leAznY/A/rugedgiIRbOpzRxJ/nH4DlJbnE+DZxU/nUtW5dG06+yH
         EYIg==
X-Gm-Message-State: APjAAAV2bB1z3h+BJWWMjsIZhRB/Sk6SNaEr8PnXT8KJPVYtPEXRpkqS
        7ixQGHBGyifwI3J56T9J07g=
X-Google-Smtp-Source: APXvYqyBxBIh1mHcyW6bK8HC8+kmcDdLgU3RNrA61cC4T3vle+Jt3SMjdWQIqYAM8mIcM01jfVXFJw==
X-Received: by 2002:a2e:9a13:: with SMTP id o19mr31709293lji.102.1563649841588;
        Sat, 20 Jul 2019 12:10:41 -0700 (PDT)
Received: from localhost ([188.170.223.67])
        by smtp.gmail.com with ESMTPSA id y25sm7302408lja.45.2019.07.20.12.10.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Jul 2019 12:10:40 -0700 (PDT)
Date:   Sat, 20 Jul 2019 22:10:36 +0300
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.3-rc0
Message-ID: <20190720191036.GA873@penguin>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- Apple SPI keyboard and trackpad driver for newer Macs
- ALPS driver will ignore trackpoint-only devices to give chance
  trackpoint driver handle them properly
- another Lenovo is switched over to SMbus from PS/2
- assorted driver fixups.

Changelog:
---------

Fuqian Huang (1):
      Input: auo-pixcir-ts - switch to using  devm_add_action_or_reset()

Grant Hernandez (1):
      Input: gtco - bounds check collection indent level

Hui Wang (2):
      Input: alps - don't handle ALPS cs19 trackpoint-only device
      Input: alps - fix a mismatch between a condition check and its comment

Joe Perches (1):
      Input: synaptics - fix misuse of strlcpy

Lars-Peter Clausen (1):
      Input: adp5589 - initialize GPIO controller parent device

Mao Wenan (1):
      Input: applespi - remove set but not used variables 'sts'

Maya Nakamura (1):
      Input: hyperv-keyboard - remove dependencies on PAGE_SIZE for ring buffer

Nick Black (1):
      Input: synaptics - whitelist Lenovo T580 SMBus intertouch

Nishka Dasgupta (2):
      Input: sun4i-lradc-keys - add of_node_put() before return
      Input: mtk-pmic-keys - add of_node_put() before return

Ronald Tschalär (1):
      Input: add Apple SPI keyboard and trackpad driver

Tim Schumacher (1):
      Input: iforce - remove empty multiline comments

YueHaibing (1):
      Input: psmouse - fix build error of multiple definition

Diffstat:
--------

 drivers/input/joystick/iforce/iforce-ff.c      |    3 -
 drivers/input/joystick/iforce/iforce-main.c    |    3 -
 drivers/input/joystick/iforce/iforce-packets.c |    3 -
 drivers/input/joystick/iforce/iforce-serio.c   |    3 -
 drivers/input/joystick/iforce/iforce-usb.c     |    3 -
 drivers/input/joystick/iforce/iforce.h         |    3 -
 drivers/input/keyboard/Kconfig                 |   16 +
 drivers/input/keyboard/Makefile                |    1 +
 drivers/input/keyboard/adp5589-keys.c          |    1 +
 drivers/input/keyboard/applespi.c              | 1977 ++++++++++++++++++++++++
 drivers/input/keyboard/applespi.h              |   29 +
 drivers/input/keyboard/applespi_trace.h        |   93 ++
 drivers/input/keyboard/mtk-pmic-keys.c         |    9 +-
 drivers/input/keyboard/sun4i-lradc-keys.c      |    3 +
 drivers/input/mouse/alps.c                     |   32 +
 drivers/input/mouse/synaptics.c                |    3 +-
 drivers/input/mouse/trackpoint.h               |    3 +-
 drivers/input/serio/hyperv-keyboard.c          |    4 +-
 drivers/input/tablet/gtco.c                    |   20 +-
 drivers/input/touchscreen/auo-pixcir-ts.c      |    3 +-
 20 files changed, 2183 insertions(+), 29 deletions(-)
 create mode 100644 drivers/input/keyboard/applespi.c
 create mode 100644 drivers/input/keyboard/applespi.h
 create mode 100644 drivers/input/keyboard/applespi_trace.h

Thanks.

-- 
Dmitry
