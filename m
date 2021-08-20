Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447B53F32C9
	for <lists+linux-input@lfdr.de>; Fri, 20 Aug 2021 20:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhHTSJA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Aug 2021 14:09:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45549 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230007AbhHTSI7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Aug 2021 14:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629482901;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VXoUUvmHBcVRhJY5rRRNheTdgRQ1IG/QNgX7foOSjd8=;
        b=MNUzJWucdcUNYVPVNE6p/Rm6BeEguNIZhIdHedv9OShXCTMwoAvGnHjnj9UKxtBT6dUShH
        I/kGjjzh3Fout7XeM3oN7k/bDP8EZAbqpWV0XRFONRp4opDE2RdbrZOggHQ0zXO6XC3Cb0
        K02ZsXS0pUVXyEgdb/Znd2coHDZUB8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-A9IuaFUeP4ysxosMvfzblw-1; Fri, 20 Aug 2021 14:08:19 -0400
X-MC-Unique: A9IuaFUeP4ysxosMvfzblw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4067760C0;
        Fri, 20 Aug 2021 18:08:17 +0000 (UTC)
Received: from cmirabil.remote.csb (unknown [10.22.9.218])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 559A05D9D5;
        Fri, 20 Aug 2021 18:08:16 +0000 (UTC)
From:   Charles Mirabile <cmirabil@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Charles Mirabile <cmirabil@redhat.com>,
        Lee Jones <lee.jones@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Serge Schneider <serge@raspberrypi.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Nicolas Saenz Julienne <nsaenzju@redhat.com>,
        linux-rpi-kernel@lists.infradead.org, fedora-rpi@googlegroups.com,
        Mwesigwa Guma <mguma@redhat.com>,
        Joel Savitz <jsavitz@redhat.com>
Subject: [RFC PATCH v2 0/4] Raspberry Pi Sense HAT driver
Date:   Fri, 20 Aug 2021 14:07:57 -0400
Message-Id: <20210820180801.561119-1-cmirabil@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series adds a set of drivers for operating the Sense HAT
peripheral device. This board is an add on for the Raspberry Pi that is
designed to connect using the GPIO connector via I2C.

It features:
	- a joystick
	- an 8x8 RGB LED matrix display
	- a whole bunch of environmental sensors with their own drivers
	(those are already in upstream Linux)

This is a refactor of the work of Serge Schneider, the author of a
version of this driver that is currently in the Raspberry Pi downstream
kernel. We modified his code to make it suitable for upstream Linux.

A couple of tests are available for the driver in this repo:
https://github.com/underground-software/sensehat/tree/master/tests
	- color_test displays various solid colors on the LED panel
	- framebuffer_test diplays a single lit cell that is
	  controllable via the arrow keys or the joystick

Known issue:
	- We are not sure how to integrate the device tree overlay for the
	Sense HAT into mainline Linux, or if we even should at this time.

Fortunately, most Linux distrubtions that can run on the Raspberry Pi
already include an appropriate device tree overlay since they often import
all of the overlays from the downstream Raspberry Pi kernel.

We have included a hypothetical overlay that would work for the sensehat
as a fourth patch in this series but we just put it in the root of the
source tree for the time being so that patch should not be merged unless a
consensus is reached that the overlay should be in the tree, and a proper
location is found to put it.

Suggestions are welcome and appreciated.

For more information about the Sense HAT, visit:
https://www.raspberrypi.org/products/sense-hat/

Changes since v1:
	- We included a device tree overlay for the Sense HAT
	- Based on Feedback from v1 we:
		- Changed the style of a few lines
		- Adding more error logging
		- Changed the compatible strings to use the more common
		"raspberrypi" instead of just "rpi"
		- Renamed everything from rpisense to sensehat

Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Mwesigwa Guma <mguma@redhat.com>
Signed-off-by: Joel Savitz <jsavitz@redhat.com>

Charles Mirabile (4):
  Add core driver and config
  Add joystick driver and config
  Add display driver and config
  Add sensehat device tree overlay

 arch/arm/boot/dts/sensehat.dtbs            |  51 +++++
 drivers/auxdisplay/Kconfig                 |   7 +
 drivers/auxdisplay/Makefile                |   1 +
 drivers/auxdisplay/sensehat-display.c      | 234 +++++++++++++++++++++
 drivers/input/joystick/Kconfig             |   8 +
 drivers/input/joystick/Makefile            |   1 +
 drivers/input/joystick/sensehat-joystick.c | 124 +++++++++++
 drivers/mfd/Kconfig                        |   8 +
 drivers/mfd/Makefile                       |   1 +
 drivers/mfd/sensehat-core.c                | 168 +++++++++++++++
 include/linux/mfd/sensehat.h               |  55 +++++
 11 files changed, 658 insertions(+)
 create mode 100644 arch/arm/boot/dts/sensehat.dtbs
 create mode 100644 drivers/auxdisplay/sensehat-display.c
 create mode 100644 drivers/input/joystick/sensehat-joystick.c
 create mode 100644 drivers/mfd/sensehat-core.c
 create mode 100644 include/linux/mfd/sensehat.h

-- 
2.27.0

