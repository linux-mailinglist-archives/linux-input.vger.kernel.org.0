Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6EBBDB53
	for <lists+linux-input@lfdr.de>; Wed, 25 Sep 2019 11:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbfIYJnj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Sep 2019 05:43:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33813 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727540AbfIYJni (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Sep 2019 05:43:38 -0400
Received: by mail-pf1-f196.google.com with SMTP id b128so3084157pfa.1;
        Wed, 25 Sep 2019 02:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXvDSaY3Y2wgbv4+QK7v6TUhR5B+Dfsy/va1gYkqKSw=;
        b=dFQgRclSfEdXmlN8qbBFjULjiZOGBgrEIZWiVW+xeVioJw56iJ217LsqrVCF92C6Hb
         NAk+gawhA2X5xpHbKzq+QLC2ufS6YPXVDj3EruFb6WEsoB4PPhf6W2QdIPZAy5gZQ6qR
         bdKuHR5WZCIwTVxM75dsGY4VA67biAjgoEBUGMHNFpL+DU+UnfIdfH89dTIyaiDqOOKq
         tD568uk5zlgssVNQek8NxlWCS8anrJKT0+Xeupf8HsSfs1p/urmie8J0bM5sR5+cXo6M
         fV6w33CVcLG9mqKIl1Z3Cdqt+jvkFntheXgVgDk0O5nqhcrAM4HgNVnKgF58VYhFTU8l
         KEzA==
X-Gm-Message-State: APjAAAU2t3efFNiPJDLjta31VhcWYrwJtudUEJqI5Kq55LmQ6qJE1lIV
        p6nkrvoP+SBS6gHJb5QHp6I=
X-Google-Smtp-Source: APXvYqweqhPXFv3kkh3H68bwtqju0Z6SSrDGbQbicbbJ0yUogK7Vu7Z6sHzVwgRIEdzOyW2WAClSRQ==
X-Received: by 2002:a65:504c:: with SMTP id k12mr8009638pgo.252.1569404617324;
        Wed, 25 Sep 2019 02:43:37 -0700 (PDT)
Received: from localhost.localdomain (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id s24sm3819715pgm.3.2019.09.25.02.43.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 25 Sep 2019 02:43:36 -0700 (PDT)
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
Subject: [PATCH 2/2] HID: i2c-hid: add 60ms SET_POWER delay for Goodix touchpad
Date:   Wed, 25 Sep 2019 17:43:26 +0800
Message-Id: <20190925094326.41693-3-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190925094326.41693-1-vicamo.yang@canonical.com>
References: <20190925094326.41693-1-vicamo.yang@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Goodix touchpad 27C6:01F0 fails to switch to PTP mode when resumed from
suspend. The traffic after resumed looks like:

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
  [ 289.262675] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 00 00 00 00 00 00 00
  [ 289.270314] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 fe 00 00 00 00 00 00
  [ 289.276806] i2c_hid i2c-DELL096E:00: input: 0b 00 01 00 fd 00 00 00 00 00 00
  ...

The time delay between i2c_hid_set_power and i2c_hid_set_or_send_report
is less than vendor recommended 60ms, so it failed to complete its power
state transition, ignored i2c_hid_set_or_send_report and is still
operating in legacy mouse mode, and therefore it gives unsupported input
reports.

This change updates the quirk for the device to specifies a 60ms
post-setpower-delay-ms.

References: https://bugzilla.kernel.org/show_bug.cgi?id=204991
Signed-off-by: You-Sheng Yang <vicamo.yang@canonical.com>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index a5bc2786dc440..8c01ce33f1c61 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -180,7 +180,7 @@ static const struct i2c_hid_quirks {
 	{ USB_VENDOR_ID_LG, I2C_DEVICE_ID_LG_8001,
 		I2C_HID_QUIRK_NO_RUNTIME_PM },
 	{ I2C_VENDOR_ID_GOODIX, I2C_DEVICE_ID_GOODIX_01F0,
-		I2C_HID_QUIRK_NO_RUNTIME_PM },
+		I2C_HID_QUIRK_NO_RUNTIME_PM, 60 },
 	{ USB_VENDOR_ID_ELAN, HID_ANY_ID,
 		 I2C_HID_QUIRK_BOGUS_IRQ },
 	{ 0, 0 }
-- 
2.23.0

