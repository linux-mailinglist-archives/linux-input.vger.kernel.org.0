Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDF41A1383
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 20:26:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726744AbgDGS03 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 14:26:29 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35225 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726332AbgDGS02 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Apr 2020 14:26:28 -0400
Received: by mail-pl1-f195.google.com with SMTP id c12so1562561plz.2;
        Tue, 07 Apr 2020 11:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QYIL30Y4lbaKfN8N+l8AxNYOEP0WbdeSFWqM4jX1lok=;
        b=mxHXxTGRl3NQIgP6rWcoMhsY6HyE0rG3wlkwE7jpIjN6tDrpy3niF7BPolTzE8bQjr
         IQEvbqk18gIQA+HXQxRY1E/K951ezmtJEDVqQTatABZqg/UsladnMSVqQOHJF1fSXzAX
         JkYk/zAoyiOWIMgl4+hbEYSi1oY/hpHkTiBpInCAgYpkuhyF9WuyK9EWeuRADOT4Xd+Q
         70DPWmnYATwpbwORIXdMAGbVeqVhQmEJl5ObgV2vUx1A1op3bQkLdEGGdZyuk2Vt69Fe
         p61Ne6M2DYMZBYEhVRJQ9HO0MIVqRRPQgKyYym0DjBt+a3W6mLnmXEffOnZ/Ml6yoAlp
         hB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QYIL30Y4lbaKfN8N+l8AxNYOEP0WbdeSFWqM4jX1lok=;
        b=lP4GC1Thu/x/NaW8CK0PX6csQL90ETvrQMsNwPgK6K7D8fTtBR2vlWojEHJYIkLMzM
         tB1a7ZYOiBuIKJ1bfPcRbREyfjtetgAEm1YDa6Hg5K+Z2SmMz3/xmcoLvAuUo4ZJvdxe
         zPEsiEZW+a0Tl3rGMqO4eG4TdFoBUGwvw1IXRg1v0TxTZ8ZoleKkqIkdMaBIHb3Ealnl
         X0egVV4xXV1XR12k3FE5T91jrZyJYBxiIfkwp/6J66lcqcx28ZCVLnEb5V4oh6qPYht9
         +cPD9/jaQ0wqDNpAiTX91vcYYHvCb5ktuLZBF47wh3xH/YsEQrReNLpDhYUnH3d+AfZT
         JfEw==
X-Gm-Message-State: AGi0PuaiIck/pvXNncOLE6xLspja8RfvWpJLSn335OPzIdeW7KhYjfGN
        uQ9a5M38LpnqLlXy5akz4ac=
X-Google-Smtp-Source: APiQypLb43XLaFbNxFhG+GiABGvTv6XTEtcbAOzcaSzrn5J22qswf4W9Su1wRVnFdBIYrvGNGj3zig==
X-Received: by 2002:a17:902:5a0b:: with SMTP id q11mr470011pli.23.1586283987222;
        Tue, 07 Apr 2020 11:26:27 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id z63sm14548184pfb.20.2020.04.07.11.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2020 11:26:26 -0700 (PDT)
Date:   Tue, 7 Apr 2020 11:26:24 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.7-rc0
Message-ID: <20200407182624.GA222411@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get update to
Goodix touchscreen driver to enable it work properly on various Bay
Trail and Cherry Trail devices, and a few other assorted changes.

Changelog:
---------

Andy Shevchenko (1):
      Input: of_touchscreen - explicitly choose axis

Benjamin Gaignard (1):
      dt-bindings: touchscreen: Convert edt-ft5x06 to json-schema

Dmitry Mastykin (2):
      Input: goodix - fix spurious key release events
      Input: goodix - add support for more then one touch-key

Hans de Goede (14):
      Input: goodix - refactor IRQ pin GPIO accesses
      Input: goodix - make loading the config from disk independent from the GPIO setup
      Input: goodix - make resetting the controller at probe independent from the GPIO setup
      Input: goodix - add support for getting IRQ + reset GPIOs on Cherry Trail devices
      Input: goodix - add support for getting IRQ + reset GPIOs on Bay Trail devices
      Input: goodix - add support for controlling the IRQ pin through ACPI methods
      Input: goodix - move defines to above struct goodix_ts_data declaration
      Input: goodix - save a copy of the config from goodix_read_config()
      Input: goodix - add minimum firmware size check
      Input: goodix - make goodix_send_cfg() take a raw buffer as argument
      Input: goodix - restore config on resume if necessary
      Input: goodix - try to reset the controller if the i2c-test fails
      Input: goodix - fix compilation when ACPI support is disabled
      Input: i8042 - add Acer Aspire 5738z to nomux list

Icenowy Zheng (3):
      dt-bindings: input: touchscreen: add compatible string for Goodix GT917S
      Input: goodix - use string-based chip ID
      Input: goodix - add support for Goodix GT917S

Johnny Chuang (1):
      Input: elants_i2c - report resolution information for touch major

Rajat Jain (1):
      Input: update SPDX tag for input-event-codes.h

Sergei A. Trusov (1):
      Input: goodix - fix touch coordinates on Cube I15-TC

Yannick Fertre (2):
      dt-bindings: touchscreen: goodix: support of gt9147
      Input: goodix - support gt9147 touchpanel

Diffstat:
--------

 .../bindings/input/touchscreen/edt-ft5x06.txt      |  77 ---
 .../bindings/input/touchscreen/edt-ft5x06.yaml     | 125 +++++
 .../bindings/input/touchscreen/goodix.yaml         |   2 +
 drivers/input/serio/i8042-x86ia64io.h              |  11 +
 drivers/input/touchscreen/elants_i2c.c             |   1 +
 drivers/input/touchscreen/goodix.c                 | 608 +++++++++++++++++----
 drivers/input/touchscreen/of_touchscreen.c         |  35 +-
 include/uapi/linux/input-event-codes.h             |   2 +-
 8 files changed, 651 insertions(+), 210 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml

Thanks.


-- 
Dmitry
