Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D60935B38D
	for <lists+linux-input@lfdr.de>; Sun, 11 Apr 2021 13:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233822AbhDKLei (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 11 Apr 2021 07:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233696AbhDKLei (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 11 Apr 2021 07:34:38 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDCF0C061574;
        Sun, 11 Apr 2021 04:34:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id p6so3278706wrn.9;
        Sun, 11 Apr 2021 04:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxOidUwJFl59zNURg0gtXwYaJwB9tMFuA2e5v9bizjA=;
        b=qDqiye67OEdqlj9+bp401TeF952h8w4h9UVjd8mFDbQAeiCC800PHk/NDeLtuYXQIi
         fntNpbqUki/uYFFMlKvFn0Tu13ySpAfxFBECOcb7yqn4KT0U3OOqxmeiHQQANRuqCzpf
         Q64fTflkMgpK7BXHFtWMQA6b+ig2JzhjR0t5JXSmkmq9LDmQx3P7VfFhXORQdJo3cFT1
         So1WYtz6wS8Xmyk9SNjClx7BRUMCcuwPG+vzcfYdlP20uRhHHjhvlfOV9MS5FTF8z/1Z
         1bVvg6kV+EWEnQEdfniMbKyBCW7jgVJp8TZIfMIqfp7KAwRPn5g7M1a/GYdMa0JXA9ax
         DPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KxOidUwJFl59zNURg0gtXwYaJwB9tMFuA2e5v9bizjA=;
        b=oZJnGPMvCVFQnbYPA8/KIHEzLMBF4kwwtVKwPmOk4QV4w+/5q4cu3imOxqY1f9LYI4
         CcCXR/Gnc0N4ibGod54PYfHTxkR1Iq8k27b/lwx9MWt2Hle8sr8t9RzWgLSs4JFTQmlP
         JqkAVZSHIjacszPZ8DxZIj+w0pX8wW5ZwKeJ9yRnxyx6YooeBvp9TK45gQCa7cuEGbFf
         o8iBfRpvfYevBm2PEGTD8Y/YpJqZlwYgpznGNEIo8OZ3jPkRgSFSVNRxrrvTqZxuH21t
         E1BeZvUlZek8yUVu+txC7ncz4XxAVM1Vn2xb/XVI1A8Phnh1jB0USqaQu5l5tivGZIR+
         SCWw==
X-Gm-Message-State: AOAM530//aogSJGZcjHltqDLWdeEcf7SDY0NhWoEVJd2Ercq6+XAjh3C
        OH//Qymw+cegQEHDZMpymcWpDPnJ7T0=
X-Google-Smtp-Source: ABdhPJwGGfyfy4PmkxP7LYhI1ud5F6B6OE9MKtKBw1kagNekVukyYYQmRp2Vh7bYnHY+dUWvksh3sQ==
X-Received: by 2002:a05:6000:1091:: with SMTP id y17mr50396wrw.270.1618140860698;
        Sun, 11 Apr 2021 04:34:20 -0700 (PDT)
Received: from xws.localdomain (p5487b63a.dip0.t-ipconnect.de. [84.135.182.58])
        by smtp.gmail.com with ESMTPSA id 66sm4930727wmb.36.2021.04.11.04.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 04:34:20 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] HID: surface-hid: Fix integer endian conversion
Date:   Sun, 11 Apr 2021 13:34:02 +0200
Message-Id: <20210411113402.2594945-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

We want to convert from 16 bit (unsigned) little endian values contained
in a packed struct to CPU native endian values here, not the other way
around. So replace cpu_to_le16() with get_unaligned_le16(), using the
latter instead of le16_to_cpu() to acknowledge that we are reading from
a packed struct.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: b05ff1002a5c ("HID: Add support for Surface Aggregator Module HID transport")
Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---
 drivers/hid/surface-hid/surface_hid_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/surface-hid/surface_hid_core.c b/drivers/hid/surface-hid/surface_hid_core.c
index 7b27ec392232..5571e74abe91 100644
--- a/drivers/hid/surface-hid/surface_hid_core.c
+++ b/drivers/hid/surface-hid/surface_hid_core.c
@@ -168,9 +168,9 @@ int surface_hid_device_add(struct surface_hid_device *shid)
 
 	shid->hid->dev.parent = shid->dev;
 	shid->hid->bus = BUS_HOST;
-	shid->hid->vendor = cpu_to_le16(shid->attrs.vendor);
-	shid->hid->product = cpu_to_le16(shid->attrs.product);
-	shid->hid->version = cpu_to_le16(shid->hid_desc.hid_version);
+	shid->hid->vendor = get_unaligned_le16(&shid->attrs.vendor);
+	shid->hid->product = get_unaligned_le16(&shid->attrs.product);
+	shid->hid->version = get_unaligned_le16(&shid->hid_desc.hid_version);
 	shid->hid->country = shid->hid_desc.country_code;
 
 	snprintf(shid->hid->name, sizeof(shid->hid->name), "Microsoft Surface %04X:%04X",
-- 
2.31.1

