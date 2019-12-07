Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7A31115E7A
	for <lists+linux-input@lfdr.de>; Sat,  7 Dec 2019 21:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLGU1h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 7 Dec 2019 15:27:37 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38933 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726555AbfLGU1h (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 7 Dec 2019 15:27:37 -0500
Received: by mail-pf1-f195.google.com with SMTP id 2so5138004pfx.6;
        Sat, 07 Dec 2019 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=XabE5lQi0lfexRxjhjTFp9jh3B5J0P8LlZsENCaNuxI=;
        b=kAquxP+2auD8JHmId/kfArHpzAqeX/KOw2Ur7gLwRUpSKWw7w9p9miy4iHAqxqkSi2
         dij7UJ4qmWFlUG0ImqmT3kUuLu9z7+jYX5o9c/BXI+ts5eqd+MKYRO5AcR1zI6Z99OSz
         EXY5ECeE2vS55cEuCns2nV5J5qd3iDS5NQ84iySG6I6ONl5erWPy+jvq0jFBLar1DCZ3
         Te/FPYdb8PZaKVVbdIXxraIrupGIiGA68QAHYiQbaGXVHPhnzsmaHgSakNjGDFzA6XeD
         m4bahpLR9D02Ggapu7970gtTGFcrfgC4C28NRIZf+A1vxi2ihnCxLs/2AQwWJY+iW0w0
         wIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=XabE5lQi0lfexRxjhjTFp9jh3B5J0P8LlZsENCaNuxI=;
        b=dxaLBzJu1YOBENnIjBaGF8GPzYOyUOFJ5zbcKQ+KWVkASDoTmwjQaI7bnm/yuR/rRs
         e+60PgTt1eZLcbGtghzPhLsURBDNbinuDL2Gjh3E58dG3HVI0Qqz6qdaAKFfIvkNXGOc
         Cxkk6BmU4Z0scM1PEK5+Ql5OQE6uDweL4Ry+bXlDDKA2M6YlTaUf9VD+hZJrLCvow3qK
         y+BlOKh1bX+85pbwdfJiDKCdpZjq00WuE+EkLB1RWeiWoTUwgyf4tcRFPMvrSp6CUA5H
         25svoBjpXu/f9uObw93szunHIZWI0OtcRMeErgkmaGPfNtbUaMTyQsp70n+da90EkHWA
         h3pA==
X-Gm-Message-State: APjAAAWvJFKWMupcY/zesVKlFpbdWDEsyVMbBxmhtyRWlP4+Lr/gaf/K
        IJcmfHjn0efejcHZZQX2Pft9uXxG
X-Google-Smtp-Source: APXvYqwuDA2iMIw90trgnAiZ05U1e/FcVtXusIogfY6+jqZUhIVEfvTn51iRnEzHi9Ax9q3e9lQcWw==
X-Received: by 2002:aa7:989d:: with SMTP id r29mr22057352pfl.142.1575750456375;
        Sat, 07 Dec 2019 12:27:36 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p4sm20842782pfb.157.2019.12.07.12.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2019 12:27:35 -0800 (PST)
Date:   Sat, 7 Dec 2019 12:27:33 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.5-rc0
Message-ID: <20191207202733.GA153817@dtor-ws>
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

to receive second round of updates for the input subsystem. You will
get:

- fixups for Synaptics RMI4 driver
- a quirk for Goodinx touchscreen on Teclast tablet
- a new keycode definition for activating privacy screen feature found
  on a few "enterprise" laptops
- updates to snvs_pwrkey driver
- one can now poll uinput device for writing (which is always allowed)

Changelog:
---------

Dmitry Torokhov (1):
      Input: snvs_pwrkey - remove gratuitous NULL initializers

Hans Verkuil (1):
      Input: synaptics-rmi4 - don't increment rmiaddr for SMBus transfers

Hans de Goede (1):
      Input: goodix - add upside-down quirk for Teclast X89 tablet

Lucas Stach (1):
      Input: synaptics-rmi4 - re-enable IRQs in f34v7_do_reflash

Marcel Holtmann (1):
      Input: uinput - fix returning EPOLLOUT from uinput_poll

Mathew King (1):
      Input: add privacy screen toggle keycode

Robin van der Gracht (1):
      Input: snvs_pwrkey - send key events for i.MX6 S, DL and Q

Diffstat:
--------

 drivers/input/keyboard/Kconfig         |  2 +-
 drivers/input/keyboard/snvs_pwrkey.c   | 48 +++++++++++++++++++++++++---------
 drivers/input/misc/uinput.c            |  2 +-
 drivers/input/rmi4/rmi_f34v7.c         |  3 +++
 drivers/input/rmi4/rmi_smbus.c         |  2 --
 drivers/input/touchscreen/goodix.c     |  9 +++++++
 include/uapi/linux/input-event-codes.h |  2 ++
 7 files changed, 51 insertions(+), 17 deletions(-)

Thanks.

-- 
Dmitry
