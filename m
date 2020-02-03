Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEFE151050
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 20:33:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgBCTds (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 14:33:48 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35692 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgBCTdr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 3 Feb 2020 14:33:47 -0500
Received: by mail-pg1-f194.google.com with SMTP id l24so8341666pgk.2;
        Mon, 03 Feb 2020 11:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=9m2gQqR3TG+zayD2lUAz+sGUfkAioxIkGFXPiCFj/Wo=;
        b=r2ea2VEQUvn8Yaal56k/qFIT5mNGwtfTB1eJNLyPrb7qyo0ZzOXvf6nA2DcNFKXqQ7
         UJczPVP7PVM9AhpqIvxuxA31pdj5jrKdlc6Czkfzd/bacqloXxsi1S8GAv9OmdoQU+Q0
         eJ+hp07lZgARzt5wsBx5Gc7IsYkGbBXRsfpKtHZXe8cAvVlm71edK/n3mkPeyUZ2RjEe
         OovP9qQJ0YyQ/pFdEfn641pd2JrnT3ruuUIV0sS/xeQGBYYLuogmoe/lA6540fDRaRmj
         VqOMkWfeQuQfEOTkESaJsr6YdL6YC62f2jexnuFl8gxFUI9s6cxZHOAOZb92t2JlExyp
         jL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=9m2gQqR3TG+zayD2lUAz+sGUfkAioxIkGFXPiCFj/Wo=;
        b=LaB9c+WNfg7xSA+6dtq0kJqdI45L9hS2RwvDn21Nsq3rebM16nyRbK6L9irt9aVAfW
         /evpRm257lui30n+rna1HYA0TDJJRxhWAdIcp7xTY1+Kra+VO+TMKH4aTeLdq2uJWUGr
         TSgGKF7cC9C2EVGBdKgrp6DvHu3yF9IhjLx2749GKi/hUNORNeeTXGiFRig3aNrnPJbv
         k9njuz3e1EDDeGWSLabXhWfpgMUHG/w4QVyAyyUPE1ZFZfD8loJbvAZ80lkYRl7sIMHt
         EPaNsolhYD+eHAAVmpYfruK7Y5SNnhD4zZ026m18qjHD3kPO3COd+k1bpJebyEoatNtE
         KT/Q==
X-Gm-Message-State: APjAAAWXigd+ABLwLsaD9yudNiM9TaUO3F9r/2XR7L5/3bhjqReCHMTz
        XZJ+4orZxF0Mlmbwh2PwEv6+x3zK
X-Google-Smtp-Source: APXvYqxvlzY6Z7i+iGZf0PVupY54FCrrWmjgA+K+fhJUjT70WUBX2TI4jmOHGYkVRR18KW4SiV0s8A==
X-Received: by 2002:aa7:9f90:: with SMTP id z16mr26799136pfr.161.1580758427119;
        Mon, 03 Feb 2020 11:33:47 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id k63sm249290pjb.10.2020.02.03.11.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 11:33:46 -0800 (PST)
Date:   Mon, 3 Feb 2020 11:33:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.6-rc0
Message-ID: <20200203193344.GA202502@dtor-ws>
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

- a driver for SGI IOC3 PS/2 controller
- updates to driver for FocalTech FT5x06 series touch screen controllers
- other assorted fixes.

Changelog:
---------

Alexandru Ardelean (1):
      Input: ads7846 - use new `delay` structure for SPI transfer delays

Ben Dooks (Codethink) (2):
      Input: axp20x-pek - make device attributes static
      Input: apbps2 - add __iomem to register struct

Benjamin Gaignard (2):
      dt-bindings: touchscreen: Add touchscreen schema
      dt-bindings: touchscreen: Convert Goodix touchscreen to json-schema

Johnny.Chuang (1):
      Input: elants_i2c - check Remark ID when attempting firmware update

Lucas Stach (1):
      Input: synaptics-rmi4 - switch to reduced reporting mode

Marco Felsch (4):
      Input: edt-ft5x06 - alphabetical include reorder
      Input: edt-ft5x06 - document wakeup-source capability
      Input: edt-ft5x06 - make wakeup-source switchable
      Input: edt-ft5x06 - use pm core to enable/disable the wake irq

Philipp Zabel (1):
      Input: edt-ft5x06 - work around first register access error

Samuel Holland (2):
      Input: axp20x-pek - respect userspace wakeup configuration
      Input: axp20x-pek - enable wakeup for all AXP variants

Thomas Bogendoerfer (1):
      Input: add IOC3 serio driver

Diffstat:
--------

 .../bindings/input/touchscreen/edt-ft5x06.txt      |   2 +
 .../bindings/input/touchscreen/goodix.txt          |  50 -----
 .../bindings/input/touchscreen/goodix.yaml         |  78 ++++++++
 .../bindings/input/touchscreen/touchscreen.txt     |  40 +---
 .../bindings/input/touchscreen/touchscreen.yaml    |  83 ++++++++
 drivers/input/misc/axp20x-pek.c                    |  45 ++++-
 drivers/input/rmi4/rmi_f11.c                       |  14 ++
 drivers/input/serio/Kconfig                        |  10 +
 drivers/input/serio/Makefile                       |   1 +
 drivers/input/serio/apbps2.c                       |   2 +-
 drivers/input/serio/ioc3kbd.c                      | 216 +++++++++++++++++++++
 drivers/input/touchscreen/ads7846.c                |  15 +-
 drivers/input/touchscreen/edt-ft5x06.c             |  55 ++----
 drivers/input/touchscreen/elants_i2c.c             |  77 +++++++-
 14 files changed, 544 insertions(+), 144 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml
 create mode 100644 drivers/input/serio/ioc3kbd.c

Thanks.


-- 
Dmitry
