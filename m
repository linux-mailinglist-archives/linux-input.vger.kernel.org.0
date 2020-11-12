Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE4C2B034F
	for <lists+linux-input@lfdr.de>; Thu, 12 Nov 2020 12:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbgKLLCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 06:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgKLLCZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 06:02:25 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A81A7C061A48
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:23 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b6so5535402wrt.4
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 03:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B4d/QfbKjqnYQ7wHVGb7VTqafE/Ge7L0vq+yNpxoIB0=;
        b=q4pAEypDvyqScJDo4EP3Ds6T8AOki+4u3TU68A2urR4ULcQnOQ9poaOly1fH3HclCa
         i9nwZApvPhjMqB5otxS0ZjymKU4Rh3r2wy4hPm8qz7sGmlNQ/O8iXxMibaD08cZeQJqp
         nIUtfE2c/pIKtXQnGVPyyhpE/W0Q25akkjBYstWIlvES21aKWw6ZY9to7dBIH96NM83z
         4+PgnlYi7aaTCw4be5RCCNuow6ATTdQf2klpNWlIXUtuIhgFlsq1Zz6/sH4mG9dE3Pic
         xDN+wW/hmzvgAhK8X00FADmwfwI4aO3oHEgby9kRXHOA42xsOrF2rhKGmwsVW7czABJX
         mmtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B4d/QfbKjqnYQ7wHVGb7VTqafE/Ge7L0vq+yNpxoIB0=;
        b=izdDMXGOlu6iiAijXMoWiOKlTN9y/QxC7zsYqcdIp8Gzqha10g+KzMNM0+TfLgreVg
         vVHixCjaioGsJ4rZsuMwJZDhOCiPzSzdXz4drlH9t0zklTS7doct5/cQ27ES1r3kh6cP
         bmndQSweQoP/gik6uamm5JPDV5b2/2XE85s5E/WzEGXVXd/sLQyAgAcH6nZKw3F3ReFz
         7i/yz3rtzKNWBw7C/RdTORSIbBe3m0xwt77aQ4Ri/iqd4L6bn7vxDmAPqZtMMWhW6vb5
         10ia4ZKOPjMAVh/Kn9UrHi9LAyruOLfgv8HpAvtyYsCdfFOd7ji66CGZgPZlQz3RqoL7
         X25Q==
X-Gm-Message-State: AOAM533aLl1O5bt6/jVf3WkOeKg5OUUhNJlBNIrcro6qqxiNCZDbeZu2
        0eDXON6kVepK1PPF1ldK3K9f/w==
X-Google-Smtp-Source: ABdhPJw755llj/vCgve1wFyJNTYAnMx9OD/zSXfnvYyxLSi6nN6Icd0ygnM2mKKeUJgJ8mnLb25LUg==
X-Received: by 2002:adf:e351:: with SMTP id n17mr35767174wrj.308.1605178942386;
        Thu, 12 Nov 2020 03:02:22 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id x81sm6515329wmg.5.2020.11.12.03.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 03:02:21 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lrg@slimlogic.co.uk>,
        Ian Molton <spyro@f2s.com>, Andrew Zabolotny <zap@homelink.ru>,
        Russell King <rmk@arm.linux.org.uk>,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org
Subject: [PATCH 11/15] input: touchscreen: wm97xx-core: Provide missing description for 'status'
Date:   Thu, 12 Nov 2020 11:02:00 +0000
Message-Id: <20201112110204.2083435-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112110204.2083435-1-lee.jones@linaro.org>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/touchscreen/wm97xx-core.c:204: warning: Function parameter or member 'status' not described in 'wm97xx_set_gpio'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: Ian Molton <spyro@f2s.com>
Cc: Andrew Zabolotny <zap@homelink.ru>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: patches@opensource.cirrus.com
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/touchscreen/wm97xx-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/wm97xx-core.c b/drivers/input/touchscreen/wm97xx-core.c
index 0a174bd829152..45ce89467c167 100644
--- a/drivers/input/touchscreen/wm97xx-core.c
+++ b/drivers/input/touchscreen/wm97xx-core.c
@@ -194,7 +194,7 @@ EXPORT_SYMBOL_GPL(wm97xx_get_gpio);
  * wm97xx_set_gpio - Set the status of a codec GPIO.
  * @wm: wm97xx device.
  * @gpio: gpio
- *
+ * @status: status
  *
  * Set the status of a codec GPIO pin
  */
-- 
2.25.1

