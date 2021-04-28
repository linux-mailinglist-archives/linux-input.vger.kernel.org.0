Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDAD036D6B8
	for <lists+linux-input@lfdr.de>; Wed, 28 Apr 2021 13:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhD1Lq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 28 Apr 2021 07:46:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38220 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229600AbhD1Lq6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 28 Apr 2021 07:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619610373;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cwNTvSc+pBkg6w9DYp4axICXbFdhKy/1MK/mcvuwnkw=;
        b=dgP8/Ka3bSHWRTD8Vq+PLiFy54TmgJtDPM84HaJyVq64NV30LKrCcOzdjOExU/JmkX+V29
        utw/Loyq8Wi9vmlrrvEM41BGmbMAMhp3MKyrYCTZI3O1gq0Zit3eRTJtIeT2ZH7m0MnSZf
        MbkI2V8g2peQbrP/YnT5w41uB1x0k0o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-4a81TPEdOvqT7Fhjwn41CA-1; Wed, 28 Apr 2021 07:46:11 -0400
X-MC-Unique: 4a81TPEdOvqT7Fhjwn41CA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07656107AFA6;
        Wed, 28 Apr 2021 11:46:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 07AFB2C6FB;
        Wed, 28 Apr 2021 11:46:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH 0/7] Input: goodix - Add support for controllers without flash
Date:   Wed, 28 Apr 2021 13:46:01 +0200
Message-Id: <20210428114608.101795-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

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

Note patch 7/7 is included to get an overview of the entire set.
I'll merge that one myself through the pdx86 tree. Patches 1-6 are
intended for merging through the input tree.

Regards,

Hans


Hans de Goede (7):
  Input: goodix - Change goodix_i2c_write() len parameter type to int
  Input: goodix - Add a goodix.h header file
  Input: goodix - Refactor reset handling
  Input: goodix - Push error logging up into i2c_read and i2c_write
    helpers
  Input: goodix - Allow specifying the config filename through a
    "goodix,config-name" device-property
  Input: goodix - Add support for controllers without flash
  platform/x86: touchscreen_dmi: Add info for the Goodix GT912 panel of
    TM800A550L tablets

 MAINTAINERS                                 |   3 +-
 drivers/input/touchscreen/Makefile          |   3 +-
 drivers/input/touchscreen/goodix.c          | 239 +++++------
 drivers/input/touchscreen/goodix.h          | 118 ++++++
 drivers/input/touchscreen/goodix_fwupload.c | 437 ++++++++++++++++++++
 drivers/platform/x86/touchscreen_dmi.c      |  21 +
 6 files changed, 684 insertions(+), 137 deletions(-)
 create mode 100644 drivers/input/touchscreen/goodix.h
 create mode 100644 drivers/input/touchscreen/goodix_fwupload.c

-- 
2.31.1

