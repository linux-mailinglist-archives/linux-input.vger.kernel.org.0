Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F262A696A
	for <lists+linux-input@lfdr.de>; Wed,  4 Nov 2020 17:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728841AbgKDQYq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Nov 2020 11:24:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730073AbgKDQYp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 4 Nov 2020 11:24:45 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD32C0613D3
        for <linux-input@vger.kernel.org>; Wed,  4 Nov 2020 08:24:44 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id b8so22721709wrn.0
        for <linux-input@vger.kernel.org>; Wed, 04 Nov 2020 08:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1B8aLNHl/Qs+uB28RwcWAHlScyGLFiAyQDDIMzV5Nlg=;
        b=c1d35Ul8+71Bsc2DO6reZqBHMH4M8JxQ+N5pONSycUxjIPLN0lw7SAFiEiTqAlkEUu
         MOHik11fAqXjr5Qq9nn47fxGrY5l3S9V1VjMZwqE/L1mmMVdhDTNaZLO9v4hPsT1j3Ke
         hnYWQGrBevOry2pXwUXYwbdvvuJ0GV/bTVhtMhg20igunh+oDwZ0lSLfFdz1A67rrJAK
         6EczHiCMtpyERopQ6MMUcIfjHxL140BhIEOPxpaEuWwNW1Op0+bbYuOP5rc4pKGQkF3P
         qywrvVkh4W7VSjiJuHzezKOsMNMnPjezCFhZ0nO7dGrxLC1B1C9Yw5Xi+97Zmj8/y9wn
         NAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1B8aLNHl/Qs+uB28RwcWAHlScyGLFiAyQDDIMzV5Nlg=;
        b=Ctwn6u6GYdZ0Xkt0SxzSyUgTCbf1jaKfItNQUsx7rh+i83Dkui6W2RqLWTCGgv630W
         s3uxyQ3tl8q+84D1L2h/09RwrmpafWK5FCYQnjRQZHpSs2Z4tNrL+oGkvmA7PvKST6yk
         8yNECAf5GURAcTApgGw8JwuXyOLehns7Oj/Lwwdw96I/Z1lQ/rds79sCYcfCyUgBQki1
         BOwQxRFD+ZLPR3F5MLZiVuEuvvOPDfitlutUsYIAqE/2sK9Ud0ynZ/CbQZRjsbSZ/M9s
         Wx5gJOdGxJWZYeXl0iIbVBK2j9iSsSzsk5vd0kfEZry7tRGv7ukErwzI63n+c1JtXU54
         x5zw==
X-Gm-Message-State: AOAM53037fsCy/HqUoTv/uJTpJXVmZys8byiIiWcO3opADT9uulpPa2d
        9QEwsyaDjPImS80mSB+RByy0Mg==
X-Google-Smtp-Source: ABdhPJzxrf60+RtCEC8+1PLcKvMvlLrMVnZ5U32Trjo0ZaEEFl90KL/39QKNcN5BzPL/q5W9sTqCbA==
X-Received: by 2002:adf:df91:: with SMTP id z17mr31957489wrl.379.1604507083609;
        Wed, 04 Nov 2020 08:24:43 -0800 (PST)
Received: from dell.default ([91.110.221.242])
        by smtp.gmail.com with ESMTPSA id o129sm3008564wmb.25.2020.11.04.08.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 08:24:42 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Dudley Du <dudl@cypress.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org
Subject: [PATCH 02/20] input: mouse: cyapa: Fix misnaming of 'cyapa_i2c_write's 'reg' param
Date:   Wed,  4 Nov 2020 16:24:09 +0000
Message-Id: <20201104162427.2984742-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104162427.2984742-1-lee.jones@linaro.org>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/input/mouse/cyapa.c:130: warning: Function parameter or member 'reg' not described in 'cyapa_i2c_write'
 drivers/input/mouse/cyapa.c:130: warning: Excess function parameter 'ret' description in 'cyapa_i2c_write'

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: Dudley Du <dudl@cypress.com>
Cc: Daniel Kurtz <djkurtz@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/input/mouse/cyapa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/cyapa.c b/drivers/input/mouse/cyapa.c
index c675f156948b5..dacf7c0e43f98 100644
--- a/drivers/input/mouse/cyapa.c
+++ b/drivers/input/mouse/cyapa.c
@@ -119,7 +119,7 @@ static ssize_t cyapa_i2c_read(struct cyapa *cyapa, u8 reg, size_t len,
 /**
  * cyapa_i2c_write - Execute i2c block data write operation
  * @cyapa: Handle to this driver
- * @ret: Offset of the data to written in the register map
+ * @reg: Offset of the data to written in the register map
  * @len: number of bytes to write
  * @values: Data to be written
  *
-- 
2.25.1

