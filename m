Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1A7B28DCCD
	for <lists+linux-input@lfdr.de>; Wed, 14 Oct 2020 11:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730755AbgJNJUP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Oct 2020 05:20:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730749AbgJNJUJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Oct 2020 05:20:09 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A44C004586
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:10 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id h7so1751534wre.4
        for <linux-input@vger.kernel.org>; Tue, 13 Oct 2020 18:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ftbix09uwDhbmk/tHnvoMIDN5VJWY3gqHN6AK2D9zq8=;
        b=C+Dm1U3+yDrtEhOy2Mtk86b+BdbNo9PnE48VXsKvtl0pxJfSoC8HB1CIO4kKsRPed9
         tCaHRyIhIQz1uYTdGTrb9hGKoW9RhHI32vlH87J2vho4nBdhO5SkTebHXSTARvxJRDKV
         GgxIi+vARPrz+VD6Y0DvFFLY8Zt631JslACyq84jP63//hKstOcAXkS8+X9XZuKsgai3
         BKMkZGwKC/DTzII5gv3Bn0IwyR2ZLnGi1nYwmxvTOjYFK8AaSXnZGlnRpEyOOgjtrmL2
         9t/4fdfx0PHX+dgDMRFIIPb0pr/xp4uy8auyWHkHHTzyz0hs0cdBiedyiRjg4ti+GAl/
         0AVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ftbix09uwDhbmk/tHnvoMIDN5VJWY3gqHN6AK2D9zq8=;
        b=BSIQPXYzbmIyJBtb3mHycQ+oXlRUIhO+xlJ6qgPLy3qP9L84UHCIva76vXSWJ67xx6
         KutSDXEMm9sO2SeLh10kzd9VSg790xJZiu+eSS6sWyERW3bimTDJFDX768hoe47YhWsd
         gupkN4xt3hk+/rM9zdi9WYMvuqhmiGSIB0NBjSFOfoQ2gUbJ7gTRLzAb784gx/psLTt7
         srWC1NmwSconux64nwH1SxbMRlG6KOocMLQ7t7J+nIq7dqmjDnHZQQZtGF6WctxhZtTq
         dhlYZkDQSQnkHm3MA7TcE3DHRzT/CwLN4VNdiyrwyxbu0yJBTzcw+CWHG7CN9aQJnojL
         ID0A==
X-Gm-Message-State: AOAM531Md0VllxkFCpgVajipsYYRXgfZvqDT9unSvus6/flJ6VoVIKW4
        JZECHcq8q2vQIBkfCm9b7R5yKMmV3M88wg==
X-Google-Smtp-Source: ABdhPJy99OWQAFyvoSgHQRTWkqlGyUnoel/cJWvz+Hgzsx5FdNvKDtIww6bcw/EQYUgVejEPXhcsHg==
X-Received: by 2002:a5d:6a0a:: with SMTP id m10mr2546679wru.189.1602639069277;
        Tue, 13 Oct 2020 18:31:09 -0700 (PDT)
Received: from localhost (242.19.86.79.rev.sfr.net. [79.86.19.242])
        by smtp.gmail.com with ESMTPSA id t83sm1189532wmf.39.2020.10.13.18.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 18:31:08 -0700 (PDT)
From:   =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     =?UTF-8?q?Fran=C3=A7ois-Xavier=20Carton?= <fx.carton91@gmail.com>,
        Ethan Lee <flibitijibibo@gmail.com>,
        Bastien Nocera <hadess@hadess.net>
Subject: [PATCH v3 0/4] HID: gamecube-adapter
Date:   Wed, 14 Oct 2020 03:30:19 +0200
Message-Id: <20201014013023.23078-1-fx.carton91@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

This series adds a driver for Nintendo gamecube controller USB adapters.
I've only done minor coding style edits since v2, to better conform to
the kernel guidelines.

I'd greatly appreciate a review of the code (especially since this is my
first contribution to the kernel). I've been applying this patch series
to several 5.4 kernels, the latest being 5.9.66.

Many thanks,
François-Xavier

---

Changelog:

v3:
- minor coding style edits

v2:
- Replaced calibration parameters by auto calibration using saved
  min/max values.
- Only send rumble output reports if the value changed.
- Only set rumble capability for normal controllers; wavebird
  controllers do not support rumble.
- Send init command after suspend to get input reports again.

---

François-Xavier Carton (4):
  HID: gamecube-adapter: add nintendo gamecube adapter
  HID: gamecube-adapter: add rumble support
  HID: gamecube-adapter: add auto calibration
  HID: gamecube-adapter: restore input after suspend

 MAINTAINERS                        |   6 +
 drivers/hid/Kconfig                |  18 ++
 drivers/hid/Makefile               |   1 +
 drivers/hid/hid-gamecube-adapter.c | 492 +++++++++++++++++++++++++++++
 drivers/hid/hid-ids.h              |   1 +
 5 files changed, 518 insertions(+)
 create mode 100644 drivers/hid/hid-gamecube-adapter.c

-- 
2.26.2

