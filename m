Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C934780B4
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbhLPXgA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:36:00 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36176 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229575AbhLPXgA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:36:00 -0500
X-Greylist: delayed 315 seconds by postgrey-1.27 at vger.kernel.org; Thu, 16 Dec 2021 18:36:00 EST
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0I3-0093bq-8d; Thu, 16 Dec 2021 23:35:59 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>
Subject: [RFC PATCH 0/3] input: add DFROBOT touchscreen controller
Date:   Thu, 16 Dec 2021 15:35:54 -0800
Message-Id: <20211216233557.9393-1-tharvey@gateworks.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The DFROBOT DFR0678 [1] and DFR0550 [2] touchscreen displays are meant
to be compatible with the official RaspberryPi 7in display. However
instead of directly conntecting the FT5x06 touch controller to the I2C
bus going to the host processor they route it through an MCU and emulate
a virtual FT5x06 controller but don't do a very good job at it. The
method the RaspberryPi firmware used to read the touch data is supported
(which consists of reading R2 to get the number of touch points, then
reading 4 bytes of data for each point in discrete I2C transactions. If
you try to use the FT5x06 driver which reads all registers starting at
R0 at once you will get invalid point data.

This controller lacks an interrupt and does not send UP events so
polling mode is used and event ID tracking is used to emulate UP events.

This series adds dt bindings and a standalone driver for this touch
controller as opposed to an RFC series I sent out that attempts to add
support to the existing edt-ft5x06 driver.

Tim
[1] - https://www.dfrobot.com/product-2193.html
[2] - https://www.dfrobot.com/product-1784.html

Tim Harvey (3):
  dt-bindings: Add vendor prefix for DFRobot
  dt-bindings: touchscreen: Add dfr0550 bindings
  input: touchscreen: add dfr0550 support

 .../bindings/input/touchscreen/dfr0550.yaml   |  53 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   5 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/dfr0550.c           | 208 ++++++++++++++++++
 6 files changed, 281 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/dfr0550.yaml
 create mode 100644 drivers/input/touchscreen/dfr0550.c

-- 
2.17.1

