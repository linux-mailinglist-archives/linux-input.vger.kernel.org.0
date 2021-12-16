Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5705F4780BC
	for <lists+linux-input@lfdr.de>; Fri, 17 Dec 2021 00:37:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbhLPXhY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 18:37:24 -0500
Received: from finn.gateworks.com ([108.161.129.64]:36214 "EHLO
        finn.localdomain" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229755AbhLPXhY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 18:37:24 -0500
Received: from 068-189-091-139.biz.spectrum.com ([68.189.91.139] helo=tharvey.pdc.gateworks.com)
        by finn.localdomain with esmtp (Exim 4.93)
        (envelope-from <tharvey@gateworks.com>)
        id 1my0Cy-0093am-6x; Thu, 16 Dec 2021 23:30:44 +0000
From:   Tim Harvey <tharvey@gateworks.com>
To:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Tim Harvey <tharvey@gateworks.com>
Subject: [RFC PATCH 0/4] input: edt-ft5x06: add support for DFROBOT touch controller to
Date:   Thu, 16 Dec 2021 15:30:37 -0800
Message-Id: <20211216233041.1220-1-tharvey@gateworks.com>
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

Additionally the RaspberryPi displays like these do not have a touch
controller IRQ so polling mode has to be added.

Also additionally these controllers do not appear to send UP events so
an additional patch slightly modified from the raspberry-pi kernel is used
to  track ID's and report up events.

I'm sending this series as an RFC as I'm not really clear if this is the
best approach vs just adding a new touchscreen driver (which I have
prepared and will probably send in another RFC).

Tim
[1] - https://www.dfrobot.com/product-2193.html
[2] - https://www.dfrobot.com/product-1784.html

Tim Harvey (4):
  dt-bindings: input: touchscreen: edt-ft5x06: add poll-interval
  input: edt-ft5x06 - add polled input support
  input: edt-ft5x06 - add support for DFROBOT touch controllers
  input: edt-ft5x06 - Handle unreliable TOUCH_UP events

 .../input/touchscreen/edt-ft5x06.yaml         |   7 +-
 drivers/input/touchscreen/edt-ft5x06.c        | 144 ++++++++++++++----
 2 files changed, 123 insertions(+), 28 deletions(-)

-- 
2.17.1

