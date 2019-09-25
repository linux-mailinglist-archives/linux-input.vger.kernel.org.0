Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35E0FBDB50
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2019 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727887AbfIYJnd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Sep 2019 05:43:33 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33804 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfIYJnd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Sep 2019 05:43:33 -0400
Received: by mail-pf1-f193.google.com with SMTP id b128so3084024pfa.1;
        Wed, 25 Sep 2019 02:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kv0cvgSdA99gShmptEdLbgqySuF+naT7zjGqvTLUXTU=;
        b=VmKZ3jDmX5siwcjXu660t0cFTLsvgItnuqqTEPW0vTcQNQtWD5zcXRxhJOzl1qwj4D
         OMN/SiXJ1duYc+eiJr6sYPzWyRfW5UCIWHCSADX3YBBJm12Kx9MTYkHTB8bUoR1569nE
         3skhjprSBM+8sDeyzrHw9VVFWPObOi2dL6ckIhTprz3UruzU+0MKjTcnpLY2dj0wygIC
         4LvL/vGsl/0gQuuH6HSBOhC6GGi+sOvHzuoJO26Ah9DUlL8wLfpHZmKptoadw877yC5P
         HeZwBF+IcxKKO5wjRAiFc6SP2bC6V056xwA/oOBKiV0f+lIqUgLxy+sFc2BDb6T+mNu9
         Wjfg==
X-Gm-Message-State: APjAAAX7DE4pzkeWAimFpeM1CbB1onkurmvaPDORp4l845nw1RkqESE0
        wvDIJLSDfLgSJ02ppGjmbZs=
X-Google-Smtp-Source: APXvYqxiNxUNsNlwr32j3YPB8BNJot6J85FBKJnEfTeR1IiV2BQH1R5yiDWJNcA4B4AgLkNECnWqSQ==
X-Received: by 2002:a17:90a:8986:: with SMTP id v6mr5498496pjn.115.1569404611960;
        Wed, 25 Sep 2019 02:43:31 -0700 (PDT)
Received: from localhost.localdomain (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id s24sm3819715pgm.3.2019.09.25.02.43.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Sep 2019 02:43:31 -0700 (PDT)
From:   You-Sheng Yang <vicamo.yang@canonical.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Hui Wang <hui.wang@canonical.com>, Julian Sax <jsbc@gmx.de>,
        HungNien Chen <hn.chen@weidahitech.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] HID: i2c-hid: add 60ms SET_POWER delay for Goodix touchpad
Date:   Wed, 25 Sep 2019 17:43:24 +0800
Message-Id: <20190925094326.41693-1-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I2C traffic after resumed from s2idle:

  [ 275.312190] i2c_hid i2c-DELL096E:00: i2c_hid_set_power
  [ 275.312191] i2c_hid i2c-DELL096E:00: __i2c_hid_command: cmd=05 00 01 08
  [ 283.926905] i2c_hid i2c-DELL096E:00: i2c_hid_set_power
  [ 283.926910] i2c_hid i2c-DELL096E:00: __i2c_hid_command: cmd=05 00 00 08
  [ 283.927146] i2c_hid i2c-DELL096E:00: i2c_hid_set_or_send_report
  [ 283.927149] i2c_hid i2c-DELL096E:00: __i2c_hid_command: cmd=05 00 37 03 06 00 05 00 07 00 00
  [ 283.927872] i2c_hid i2c-DELL096E:00: i2c_hid_set_or_send_report
  [ 283.927874] i2c_hid i2c-DELL096E:00: __i2c_hid_command: cmd=05 00 33 03 06 00 05 00 03 03 00
  [ 283.929148] i2c_hid i2c-DELL096E:00: i2c_hid_set_or_send_report
  [ 283.929151] i2c_hid i2c-DELL096E:00: __i2c_hid_command: cmd=05 00 35 03 06 00 05 00 05 03 00
  # when touching touchpad:
  [ 289.262675] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 00 00 00 00 00 00 00
  [ 289.270314] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 fe 00 00 00 00 00 00
  [ 289.276806] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 fd 00 00 00 00 00 00
  [ 289.283863] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 fb 01 00 00 00 00 00
  [ 289.291213] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 fa 02 00 00 00 00 00
  [ 289.297932] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 f9 03 00 00 00 00 00
  [ 289.304775] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 f9 03 00 00 00 00 00

On this device (Goodix touchpad 27C6:01F0), both Precision Touchpad
mode and a legacy Mouse mode are supported. When I2C SET_POWER ON is
issued, it would take as long as 60ms to complete state transition and
is then able to receive and execute further commands. On boot the
device is running under Mouse mode for legacy platform support, and
will be put to PTP mode with a SET_OR_SEND_REPORT command. If somehow
the time gap between the first SET_POWER ON and further
SET_OR_SEND_REPORT commands is less than 60ms, the device will still
operating under Mouse mode and gives reports like
"0b 00 01 00 fe 00 00 00 00 00 00".

On Linux system boot, it may take 500ms from i2c probe (SET_POWER ON)
to hid initialization (SET_OR_SEND_REPORT), so it will always be put
to PTP mode successfully. But when the device is put under s2idle
suspend and resumed, the hid reset resume process will be right after
i2c resume, so the device won't have enough time to complete its
state transition, which fails following SET_OR_SEND_REPORT executing
and therefore it operates under Mouse mode instead.

Currently Linux has a at most 5ms sleep in i2c_hid_hwreset(), but
according to HID over I2C Specification[1] section 7.2.8 "SET_POWER":

> The DEVICE must ensure that it transitions to the HOST
> specified Power State in under 1 second.

it can take as long as 1 second.

This changeset add a device property post-setpower-delay-ms and use it
to specify the delay after a SET_POWER command is issued for this
device.

References: https://bugzilla.kernel.org/show_bug.cgi?id=204991

You-Sheng Yang (2):
  HID: i2c-hid: allow delay after SET_POWER
  HID: i2c-hid: add 60ms SET_POWER delay for Goodix touchpad

 .../bindings/input/hid-over-i2c.txt           |  2 +
 drivers/hid/i2c-hid/i2c-hid-core.c            | 48 +++++++++++--------
 include/linux/platform_data/i2c-hid.h         |  3 ++
 3 files changed, 33 insertions(+), 20 deletions(-)

-- 
2.23.0

