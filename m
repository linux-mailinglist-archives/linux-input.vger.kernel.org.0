Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E9FD29799D
	for <lists+linux-input@lfdr.de>; Sat, 24 Oct 2020 01:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758521AbgJWXX1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 23 Oct 2020 19:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754377AbgJWXX1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Oct 2020 19:23:27 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DF1EC0613CE
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:23:26 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id r3so1786278plo.1
        for <linux-input@vger.kernel.org>; Fri, 23 Oct 2020 16:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OfVT8h9wTg39Kkdz/cTYNaLpjH3zKVjSrnAnLMVOwP0=;
        b=lSvoOZ0BrlQ2aaIRwKZoX+KgWKXDVGWOc2TQ+iLwXjyTbcvzz3q2hQ4sBPZQ3+2uPM
         Uyn4Wa+ret40vchMTDYMZw7LPMi8Jd3+Qvtf5yohR7zQCgwKssECfRopec1uvE9luaZx
         Cw+xk6X3RgJ9vqDLMPha6RpDTeasaxHj/FkA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OfVT8h9wTg39Kkdz/cTYNaLpjH3zKVjSrnAnLMVOwP0=;
        b=slx0CsME3fD2KA59asi+EuIZEkVlltaUpPY6T/pdRMYSxaI+zmwRYdUEAujrQpHO2U
         0HCFAFIKeezHOi0gI+UfbXYYWBi1MPmZZV1SP6S39v9hhdlb/O45ooFmYu5DMZx1IBaB
         rZ8x4i+z1peN5zVsT9Zkd2u8ppjIRb8JAdpJ/DMlYHzs6JDVfLS4cZlCNei6KNrFLzkh
         hXpTUWrCVb0yydZZPVqcw/WuPGWTpRAtU0SngNBPwxYOuPN9G1P3s0tN/wJuH5euW2MK
         UvOkF6oaSzuP7Gp1qGLJYaNwRD+I6HYjCzVVqM6B2GhFZiKM6NCnsdbhmnxAgVOHBROi
         gv8g==
X-Gm-Message-State: AOAM530srk3eOkic2hmakSKdEWMQh5iTFjmavK6ZAY+okmcnni5vbrzu
        3JoiyzcuD/opsJ+PcU7Lo1J/Rw==
X-Google-Smtp-Source: ABdhPJxUQtoeCUCQzbsz0jKCxEwV0OYgkw3J7AFEwHa0RFT0DIhHaQxFc+KB42j7kNQWqOCOQ90AYQ==
X-Received: by 2002:a17:90a:66cc:: with SMTP id z12mr5453371pjl.145.1603495405901;
        Fri, 23 Oct 2020 16:23:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id v17sm3789476pjy.40.2020.10.23.16.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 16:23:25 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org
Cc:     andrea@borgia.bo.it, kai.heng.feng@canonical.com,
        linux-input@vger.kernel.org, swboyd@chromium.org,
        hdegoede@redhat.com, Douglas Anderson <dianders@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: HID: i2c-hid: Label this binding as deprecated
Date:   Fri, 23 Oct 2020 16:22:52 -0700
Message-Id: <20201023162220.v2.1.I45b53fe84e2215946f900f5b28bab1aa9d029ac7@changeid>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As pointed out by Rob Herring [1], we should have a device-specific
compatible string.  This means people shouldn't be using the
"i2c-over-hid" compatible string anymore, or at least not without a
more specific compatible string before it.  Specifically:

1. For newly added devices we should just have the device-specific
   device string (no "hid-over-i2c" fallback) and infer the timings
   and hid-descr-addr from there.

2. If there's a need for a device tree to be backward compatible, we
   should list the device-specific compatible string and add the
   "hid-over-i2c" fallback and the various timings.

[1] https://lore.kernel.org/r/20201019211036.GA3595039@bogus

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("dt-bindings: HID: i2c-hid: Label this binding as deprecated") new in v2.

 Documentation/devicetree/bindings/input/hid-over-i2c.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
index c76bafaf98d2..733a5f053280 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
@@ -1,5 +1,8 @@
 * HID over I2C Device-Tree bindings
 
+WARNING: this binding is deprecated.  Instead of using this, create specific
+bindings for each hid-over-i2c device.
+
 HID over I2C provides support for various Human Interface Devices over the
 I2C bus. These devices can be for example touchpads, keyboards, touch screens
 or sensors.
-- 
2.29.0.rc1.297.gfa9743e501-goog

