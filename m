Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E70328EAF6
	for <lists+linux-input@lfdr.de>; Thu, 15 Oct 2020 04:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgJOCJ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 22:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728875AbgJOCJh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 22:09:37 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6097AC025247
        for <linux-input@vger.kernel.org>; Wed, 14 Oct 2020 16:42:53 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id n9so639823pgf.9
        for <linux-input@vger.kernel.org>; Wed, 14 Oct 2020 16:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFheJw6XVQO5isnDiFQR+xrCu7msKsOYw9OYk1rLMK0=;
        b=N8IGdTigzihNqkAyPolGmtVpC/VuZ2GtitBdeBYF6g+CQD2Rlv3lnEY6Wl+kbYtcCC
         PvI3COWqViJ/dNjYhYzhaSvwGVmctTK8TlXDI3oJpspOJZvMMugyesKKKvqFOYL7b66a
         5zI356jrVZvFtSVXyMLanfGw9/+06KWWqN7vA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UFheJw6XVQO5isnDiFQR+xrCu7msKsOYw9OYk1rLMK0=;
        b=CtFBmy1xu5sc6TS6ESZqYGJM/OBEN5EHMMGU0xEgAUEbs/YCW4dEOta7vS8VQgqEZu
         //QQ8aYzVDMf+7IY0zaEsgJTIUaiV7bC4Vhd5cdjyxIOcarfwYxnWbBsB22b3iX4/ExW
         NKG3QZxiJoH+h0WBPFD6nC3cFU+Dfz3sXewMO97yqEOpdMR7h0TYs5D5iOySx4HIKieL
         XCPenQOWViSaplrMoGFUw6WcH53cR0PWCanjT9foB6wqfvC69Uv1Emjsd3kvv4wiGpWV
         hXVQ8nFcWAtnIovMCaZjQUpQsM/Nyy+u8/oxBQcibe+MOcnB/5JkqjR9Ro7hG6f/0dAl
         OpmQ==
X-Gm-Message-State: AOAM531eq2m8v7Kocsq2HYVnLjV+6DDATxTg74vrKYEmVg39spZ8QHzN
        L8fD0nB82hgZnkw7GMA59hTi275DrAHBEQ==
X-Google-Smtp-Source: ABdhPJyE77i9Lzw2HZDV09mx6eVpDdKG4unVyuuvO8MZz7RKVFf77G7hx4sJuUbtEGOOT4Hd5lZvLw==
X-Received: by 2002:a63:4459:: with SMTP id t25mr1115407pgk.104.1602718972789;
        Wed, 14 Oct 2020 16:42:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id d145sm808331pfd.136.2020.10.14.16.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 16:42:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     jkosina@suse.cz, benjamin.tissoires@redhat.com,
        gregkh@linuxfoundation.org
Cc:     kai.heng.feng@canonical.com, linux-input@vger.kernel.org,
        hdegoede@redhat.com, andrea@borgia.bo.it, swboyd@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: HID: i2c-hid: Add the ability to control a reset GPIO
Date:   Wed, 14 Oct 2020 16:42:20 -0700
Message-Id: <20201014164203.1.I1c2d6236990449717b861539a2234354153b1656@changeid>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Apparently some devices connected via i2c-hid have timing requirements
around when a reset GPIO should be asserted to them.  The diagram I
have seen, which I believe is from a Goodix device, looked like this:

         +----------------------------------
         |
AVDD ----+
               +------------------------------
         | (a) |
RESET ---------+
                     +-------------
               | (b) |
I2C comm OK ---------+

Where (a) is 10 ms and (b) is 120 ms.

Let's add the ability to specify these timings to the devicetree
bindings.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I notice this bindings file is still a ".txt" file.  Some searching on
The Internets(TM) shows that Rob has maybe started a conversion 5
years ago [1], but that looks ancient.  I can try to put something
together if need be, or we can just land this fix.  ;-)

Note that the .txt version of the bindings seems to indicate that
anyone using one of the optional properties is supposed to declare
their special compatible string.  I'm not sure if that's still
considered important or not?  Once you manage to get these devices
powered on and talking i2c they self-describe themselves...

[1] https://kernel.googlesource.com/pub/scm/linux/kernel/git/robh/linux/+/refs/heads/dt-yaml/Documentation/devicetree/bindings/hid/hid-over-i2c.yaml

 Documentation/devicetree/bindings/input/hid-over-i2c.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.txt b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
index c76bafaf98d2..6fca39aa8cc6 100644
--- a/Documentation/devicetree/bindings/input/hid-over-i2c.txt
+++ b/Documentation/devicetree/bindings/input/hid-over-i2c.txt
@@ -32,6 +32,11 @@ device-specific compatible properties, which should be used in addition to the
 - vdd-supply: phandle of the regulator that provides the supply voltage.
 - post-power-on-delay-ms: time required by the device after enabling its regulators
   or powering it on, before it is ready for communication.
+- reset-gpios: GPIOs to assert to reset the device. This GPIO is asserted when
+  the device is powered off and released post-power-on-delay-ms after
+  enabling the regulators.
+- post-gpio-reset-delay-ms: After deasserting reset we'll delay for this many
+  more milliseconds.
 
 Example:
 
-- 
2.28.0.1011.ga647a8990f-goog

