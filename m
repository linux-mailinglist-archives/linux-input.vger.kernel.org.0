Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31F6BDB866
	for <lists+linux-input@lfdr.de>; Thu, 17 Oct 2019 22:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbfJQUmZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Oct 2019 16:42:25 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37901 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727269AbfJQUmY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Oct 2019 16:42:24 -0400
Received: by mail-pl1-f195.google.com with SMTP id w8so1701678plq.5;
        Thu, 17 Oct 2019 13:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nPDOMJGsHH0zWzPAXm/wI3oxwPr0hf8L0/bKy7cCfl0=;
        b=JY5V0+zsgcHQRg+zIlfgYCnfvpm4+2xS++Wrh5CZKpfPmBH97fjeKguHx2KGQ7JcU4
         B1RXuRi2+tSbaAqaGOzzASRHJj++kOC+LCAmQDJSPeyZb8DnL2mMRwlPiCwzdPiCWlUs
         Xh6p7h9kKxZsBiq/NA6sEtIH65uq9Hafzf+lUVMfb8ijpYSuTXaNoiTNqv9sFEtuUwOt
         TbRUWF7kiHt5lcy828hYBACk5tIrtJaTrhPuN5uMVq25g5F/5h3tPmTd5qmwS88pYnAg
         2zZJVCktgXrf3VCPK9oywT03Y57xan/2a7SgrdB9dfI6+pIu3+CRznM3ZR/GkKdN2cf/
         aCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nPDOMJGsHH0zWzPAXm/wI3oxwPr0hf8L0/bKy7cCfl0=;
        b=d99OnXNMe+/LGtum3nRgFdkixdmA+faJFHvCTZnusgQlrDtMU67myLjDiCa/HDadQ+
         W8UCtEP68NVmwb4FAJ8OwETTMeCm5UE71B/eWmK2n0+shGYGGlO3Ra4oOCFVTHCoKaDF
         UlVXPac0JgcV/B485ZJ3O7EGGytVKnrGVP+D1jdAu/vyoXDQ9+UjjbBQfhDcRQ9zczYM
         xCeAu1XTRkZ6JpctbYNI6aUervrw2VqQibEsEBtF+1UJEZvkEeMEt80d8Y1EKToSIHmq
         h66gFjUdEb8/0gdiUjimy6XfbafS+Auq4h0luCUGEFUKkIsb5NRfmzBr9x8v3GX+3/+F
         XAZw==
X-Gm-Message-State: APjAAAXq8HHBsXk071uCqMaPqPmyblmniWwFaWVVT+jWYpPTcycj2YDJ
        KyN/9HFDDO21/0NLJP9PNS8bFo2t
X-Google-Smtp-Source: APXvYqzB6sY5K36yP5ikWTXLkI1rfufnmBl38JrsxdSekitFu0TG7m6r9+16waKtOEprzS9jLoRCDw==
X-Received: by 2002:a17:902:2e:: with SMTP id 43mr6159836pla.55.1571344941448;
        Thu, 17 Oct 2019 13:42:21 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b3sm4626365pfd.125.2019.10.17.13.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 13:42:20 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Alexander Shiyan <shc_work@mail.ru>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Anders Roxell <anders.roxell@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Brian Masney <masneyb@onstation.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Enrico Weigelt <info@metux.net>, Eric Anholt <eric@anholt.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacky Bai <ping.bai@nxp.com>, Jeff LaBundy <jeff@labundy.com>,
        Jilayne Lovejoy <opensource@jilayne.com>,
        Jonathan Bakker <xc-racer2@live.ca>,
        Luca Weiss <luca@z3ntu.xyz>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Martin Kepplinger <martink@posteo.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Miloslav Trmac <mitr@volny.cz>,
        Mukesh Ojha <mojha@codeaurora.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Richard Fontana <rfontana@redhat.com>,
        =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
        Stefan Agner <stefan@agner.ch>,
        Steve Winslow <swinslow@gmail.com>,
        Sven Van Asbroeck <TheSven73@gmail.com>,
        YueHaibing <yuehaibing@huawei.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/22] Stop using input_polled_dev in polling drivers
Date:   Thu, 17 Oct 2019 13:41:54 -0700
Message-Id: <20191017204217.106453-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Input devices now support polling mode natively (via input_setup_polling
API), and input_polled_dev implementation is going away. This series
switches drivers found in drivers/input to the new scheme.


Dmitry Torokhov (21):
  Input: raspberrypi-ts - switch to using polled mode of input devices
  Input: sur40 - switch to using polled mode of input devices
  Input: ts4800-ts - switch to using polled mode of input devices
  Input: tsc6507x-ts - switch to using polled mode of input devices
  Input: adc-keys - switch to using polled mode of input devices
  Input: clps711x-keypad - switch to using polled mode of input devices
  Input: jornada680_kbd - switch to using polled mode of input devices
  Input: gpio_keys_polled - switch to using polled mode of input devices
  Input: apanel - switch to using polled mode of input devices
  Input: wistron_btns - switch to using polled mode of input devices
  Input: cobalt_btns - convert to use managed resources
  Input: cobalt_btns - switch to using polled mode of input devices
  Input: sgi_btns - switch to using managed resources
  Input: sgi_btns - switch to using polled mode of input devices
  Input: rb532_button - switch to using managed resources
  Input: rb532_button - switch to using polled mode of input devices
  Input: gpio_decoder - switch to using polled mode of input devices
  Input: mma8450 - switch to using polled mode of input devices
  Input: bma150 - switch to using polled mode of input devices
  Input: kxtj9 - switch to using managed resources
  Input: kxtj9 - switch to using polled mode of input devices

Jonathan Bakker (1):
  Input: bma150 - use managed resources helpers

 drivers/input/keyboard/Kconfig             |   4 -
 drivers/input/keyboard/adc-keys.c          |  36 ++--
 drivers/input/keyboard/clps711x-keypad.c   |  70 +++----
 drivers/input/keyboard/gpio_keys_polled.c  |  65 +++---
 drivers/input/keyboard/jornada680_kbd.c    |  37 ++--
 drivers/input/misc/Kconfig                 |  15 --
 drivers/input/misc/apanel.c                | 153 ++++++--------
 drivers/input/misc/bma150.c                | 190 +++++------------
 drivers/input/misc/cobalt_btns.c           |  73 +++----
 drivers/input/misc/gpio_decoder.c          |  42 ++--
 drivers/input/misc/kxtj9.c                 | 224 ++++++---------------
 drivers/input/misc/mma8450.c               | 101 +++++-----
 drivers/input/misc/rb532_button.c          |  48 ++---
 drivers/input/misc/sgi_btns.c              |  54 ++---
 drivers/input/misc/wistron_btns.c          |  51 ++---
 drivers/input/touchscreen/Kconfig          |   4 -
 drivers/input/touchscreen/raspberrypi-ts.c |  38 ++--
 drivers/input/touchscreen/sur40.c          |  92 +++++----
 drivers/input/touchscreen/tps6507x-ts.c    |  36 ++--
 drivers/input/touchscreen/ts4800-ts.c      |  68 ++++---
 20 files changed, 557 insertions(+), 844 deletions(-)

-- 
2.23.0.866.gb869b98d4c-goog

