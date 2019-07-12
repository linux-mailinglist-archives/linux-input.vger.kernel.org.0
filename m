Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7CB166682
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 07:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbfGLFmC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 01:42:02 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37330 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfGLFmC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 01:42:02 -0400
Received: by mail-pg1-f194.google.com with SMTP id g15so4021498pgi.4;
        Thu, 11 Jul 2019 22:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=k8kXXqEUeontmH32jxhFa7j9uFZa9yhZzdE08uh6b8I=;
        b=eBggFk3faNJcyYcxxwYJiS8NKST3j86xRB0LAxZrxkruACA6hGQwKMyETNe8Buu6cV
         1TYKxDk7ZOW+hq6q7RIIzq1gGukgu/tFYRIkF2Uv37foUL/5nnV4r6kN2/Z7+b02IkJt
         +sttay0nDRo8VbLg9hsYbK0132kGc5qnODVwPeRwU8NgzxiiyoJyK2GL+9D8pkoLKG7f
         WaAfTWWT3FQhGOxLfnLVuNSki8LiHMQPEgqPkzwE20DZSFdbBPvkzuxMSECk4l8827kz
         xF+iSaogQaYwQoeq7hqs9w+PAeYe72QAEyvwZoOC34Ue5GElw3zVRUCo9lmoARZwAmQb
         +Hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=k8kXXqEUeontmH32jxhFa7j9uFZa9yhZzdE08uh6b8I=;
        b=OwmtVjroTQsQ9WURbo2GpWNQ+CALVGRPwCVltT1yIcH+ojDJRoldsURQGMpHEQemXh
         VdrKgd7YIuT8XCXyp49cB9U7HPvXbiTVgeGu5Miy4X2grG0b6Kd6+cSuGrOqrvKxrH7v
         AWz8OBnFAolnq7smN0AgyHYZ2uJXlikI1aMEsMjIofYHUp876vRnHKitFviAVGG0XPxA
         E1idZYn3pkzhTWXa/pW8FjZuhH4ksIW3p5ufAk3Tzxfdi/wOnIBJvQ/O+KCRbAcmC13n
         TAtIwyWwdc2PnpP0mGwPzQe9sWYA3eG8MO58PNZmTgEFMG/irkdKRQRnGmCoFZHxNWIo
         rYJQ==
X-Gm-Message-State: APjAAAX4sRDkQsP03Ltt1XXcSzoaQsLvxUtL6SxskIud3RRX4wn7eyzs
        7wE+2rnDF6Wokdym2272vTw=
X-Google-Smtp-Source: APXvYqxSfMr0l/mOBclf58hl6ZTWqt6FlE2mVP5EZZgGtCDkUJyQXB7YBalnh5v00QsEOCC6VUzV2A==
X-Received: by 2002:a63:755e:: with SMTP id f30mr8744416pgn.246.1562910120797;
        Thu, 11 Jul 2019 22:42:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id u16sm8539111pjb.2.2019.07.11.22.42.00
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 22:42:00 -0700 (PDT)
Date:   Thu, 11 Jul 2019 22:41:58 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.3-rc0
Message-ID: <20190712052744.GA138448@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get:

- an update to Elan touchpad SMBus driver to fetch device parameters
  (size, resolution) while it is still in PS/2 mode, before switching
  over to SMBus, as in that mode some devices return garbage dimensions
- update to iforce joystick driver
- miscellaneous driver fixes

Note that there will be a conflict in drivers/input/misc/da9063_onkey.c
regarding SPDX header, please keep SPDX annotation that is already in
your tree.

Also, I am still hoping to merge applespi keyboard and trackpad driver
in the 2nd pass for this merge window.

Changelog:
---------

Alexander Tsoy (1):
      Input: joydev - extend absolute mouse detection

Anson Huang (2):
      Input: imx_keypad - use devm_platform_ioremap_resource() to simplify code
      Input: imx6ul_tsc - use devm_platform_ioremap_resource() to simplify code

Axel Lin (1):
      Input: iqs5xx - remove redundant dev_set_drvdata call

Bartosz Golaszewski (1):
      Input: max77650-onkey - add MODULE_ALIAS()

Benjamin Tissoires (8):
      Input: elantech - query the min/max information beforehand too
      Input: elantech - add helper function elantech_is_buttonpad()
      Input: elantech - detect middle button based on firmware version
      dt-bindings: add more optional properties for elan_i2c touchpads
      Input: elan_i2c - do not query the info if they are provided
      Input: elantech/SMBus - export all capabilities from the PS/2 node
      Input: elan_i2c - handle physical middle button
      Input: elantech - remove P52 and P72 from SMBus blacklist

Cole Rogers (1):
      Input: synaptics - enable SMBUS on T480 thinkpad trackpad

Daniel Mack (1):
      Input: eeti_ts -  read hardware state once after wakeup

Dmitry Torokhov (21):
      Input: iforce - remove "being used" silliness
      Input: iforce - introduce transport ops
      Input: iforce - move get_id to the transport operations
      Input: iforce - move command completion handling to serio code
      Input: iforce - introduce start and stop io transport ops
      Input: iforce - add bus type and parent arguments to iforce_init_device()
      Input: iforce - move transport data into transport modules
      Input: iforce - split into core and transport modules
      Input: iforce - use DMA-safe buffer when getting IDs from USB
      Input: iforce - update formatting of switch statements
      Input: iforce - factor out hat handling when parsing packets
      Input: iforce - do not combine arguments for iforce_process_packet()
      Input: iforce - signal command completion from transport code
      Input: iforce - only call iforce_process_packet() if initialized
      Input: iforce - allow callers supply data buffer when fetching device IDs
      Input: iforce - use DMA-safe buffores for USB transfers
      Input: iforce - drop bus type from iforce structure
      Input: iforce - drop couple of temps from transport code
      Input: iforce - use unaligned accessors, where appropriate
      Input: edt-ft5x06 - use get_unaligned_be16()
      Input: edt-ft5x06 - simplify event reporting code

Enrico Weigelt, metux IT consult (1):
      Input: gpio_keys_polled - allow specifying name of input device

Gustavo A. R. Silva (2):
      Input: gpio_keys_polled - use struct_size() in devm_kzalloc()
      Input: gpio_keys - use struct_size() in devm_kzalloc()

Ian Ray (1):
      Input: atmel_mxt_ts - fix leak in mxt_update_cfg()

Jeffrey Hugo (2):
      Input: elan_i2c - export the device id whitelist
      HID: quirks: Refactor ELAN 400 and 401 handling

Nathan Huckleberry (1):
      Input: atmel_mxt_ts - fix -Wunused-const-variable

Tim Schumacher (1):
      Input: iforce - add the Saitek R440 Force Wheel

Wolfram Sang (2):
      Input: da9063_onkey - remove platform_data support
      Input: da9063_onkey - convert header to SPDX

YueHaibing (2):
      Input: synaptics-rmi4 - remove set but not used variable 'sensor_flags'
      Input: tca8418 - remove set but not used variable 'max_keys'

Diffstat:
--------

 .../devicetree/bindings/input/elan_i2c.txt         |  11 +
 drivers/hid/hid-quirks.c                           |  22 +-
 drivers/input/joydev.c                             |  24 +-
 drivers/input/joystick/iforce/Kconfig              |   8 +-
 drivers/input/joystick/iforce/Makefile             |   7 +-
 drivers/input/joystick/iforce/iforce-ff.c          |  18 +-
 drivers/input/joystick/iforce/iforce-main.c        | 178 ++++--------
 drivers/input/joystick/iforce/iforce-packets.c     | 215 +++++---------
 drivers/input/joystick/iforce/iforce-serio.c       | 161 ++++++++---
 drivers/input/joystick/iforce/iforce-usb.c         | 192 ++++++++----
 drivers/input/joystick/iforce/iforce.h             |  55 ++--
 drivers/input/keyboard/gpio_keys.c                 |   6 +-
 drivers/input/keyboard/gpio_keys_polled.c          |  10 +-
 drivers/input/keyboard/imx_keypad.c                |   4 +-
 drivers/input/keyboard/tca8418_keypad.c            |   3 +-
 drivers/input/misc/da9063_onkey.c                  |  11 +-
 drivers/input/misc/max77650-onkey.c                |   1 +
 drivers/input/mouse/elan_i2c_core.c                | 122 ++++----
 drivers/input/mouse/elantech.c                     | 322 +++++++++++----------
 drivers/input/mouse/elantech.h                     |   8 +
 drivers/input/mouse/synaptics.c                    |   1 +
 drivers/input/rmi4/rmi_f12.c                       |   6 +-
 drivers/input/touchscreen/atmel_mxt_ts.c           |  23 +-
 drivers/input/touchscreen/edt-ft5x06.c             |  18 +-
 drivers/input/touchscreen/eeti_ts.c                |  71 ++++-
 drivers/input/touchscreen/imx6ul_tsc.c             |   8 +-
 drivers/input/touchscreen/iqs5xx.c                 |   2 -
 include/linux/input/elan-i2c-ids.h                 |  76 +++++
 28 files changed, 872 insertions(+), 711 deletions(-)
 create mode 100644 include/linux/input/elan-i2c-ids.h

Thanks.


-- 
Dmitry
