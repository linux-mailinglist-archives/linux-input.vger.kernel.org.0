Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D76234117C9
	for <lists+linux-input@lfdr.de>; Mon, 20 Sep 2021 17:06:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241075AbhITPIP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 11:08:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44077 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241079AbhITPIP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 11:08:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632150407;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=4f/A+mbRi8RwOUM6MQwttdRds0osqAVZaeF9CEmEAy0=;
        b=JNZZ67EVopYG1ViAAXoaXiM+ENBLqkaUBA337s3pUoB036i640Tz7FoRShvw8sbcoc4B1t
        i9nw4pKh0L5WQrAwmy7kWHxpbefxc24RwA6EBzTtzYyiaowQhEL240spiQmqko4hy5Ih4C
        Oiscmu52pGPL4E3wkQk1MoZ8oSzuiOY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-0Vf72TrBOOG60dNJa0rzEA-1; Mon, 20 Sep 2021 11:06:46 -0400
X-MC-Unique: 0Vf72TrBOOG60dNJa0rzEA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AFED5074D;
        Mon, 20 Sep 2021 15:06:45 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.118])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2377D5C25D;
        Mon, 20 Sep 2021 15:06:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH v2 0/6] Input: goodix - Add support for controllers without flash
Date:   Mon, 20 Sep 2021 17:06:37 +0200
Message-Id: <20210920150643.155872-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is v2 of my patch-set to add support for Goodix controllers
without flash-memory.

Changes in v2:
- Decide if a controller does not have flash / needs firmware to be
  uploaded based on the presence of the "firmware-name" device-property,
  the autodetection code in v1 was causing false-positives on some
  devices

Original cover-letter:

A while ago I bought a Glavey TM800A550L tablet. This is a Bay Trail (x86)
tablet which comes with Android from the factory.

It is mostly just another Bay Trail tablet, but the way the Goodix
touchscreen on it works is interesting. The controller needs to have
firmware uploaded to it before it will work. After that it pretty much
works 100% the same as any other Goodix touchscreen controller.

I've described this patch-set in the Subject as "Add support for
controllers without flash", but I suspect that the Goodix controllers
used on Bay Trail devices which ship with Windows pre-installed may also
lack flash; and that the Windows version of the BIOS-es on these devices
does the upload for us. Anyways just something which I'm wondering about,
these patches are necessary to make things work regardless.

These patches should also be useful for supporting the Goodix controllers
on some ARM based devices, as some of those need the OS to upload the
firmware too AFAIK.

Regards,

Hans



Hans de Goede (6):
  Input: goodix - Change goodix_i2c_write() len parameter type to int
  Input: goodix - Add a goodix.h header file
  Input: goodix - Refactor reset handling
  Input: goodix - Push error logging up into i2c_read and i2c_write
    helpers
  Input: goodix - Allow specifying the config filename through a
    "goodix,config-name" device-property
  Input: goodix - Add support for controllers without flash

 MAINTAINERS                                 |   3 +-
 drivers/input/touchscreen/Makefile          |   3 +-
 drivers/input/touchscreen/goodix.c          | 240 +++++-------
 drivers/input/touchscreen/goodix.h          | 117 ++++++
 drivers/input/touchscreen/goodix_fwupload.c | 413 ++++++++++++++++++++
 5 files changed, 639 insertions(+), 137 deletions(-)
 create mode 100644 drivers/input/touchscreen/goodix.h
 create mode 100644 drivers/input/touchscreen/goodix_fwupload.c

-- 
2.31.1

