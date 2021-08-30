Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 992E13FB8FF
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 17:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237548AbhH3P2a (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 11:28:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237602AbhH3P2T (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 11:28:19 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0AC4C061575;
        Mon, 30 Aug 2021 08:27:25 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l18so26525401lji.12;
        Mon, 30 Aug 2021 08:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7v0xGUniRMAaLr5lnK8CuaUQYawKvoIYmd2gIBcaU8w=;
        b=D4S90DnfDBzpndOpBbJ6kbLOp9NHMBwDLEcOAiMq+ad/somop0xi8tqVwsxNh9+GOc
         7xhleMcRUB0HjJHxW9FS98FJKaFNl7Ux2X04VsYYHxkUVs/eQ/mIO1v9SaRp1eVnOmKx
         On/XugGzX6fIaeGAZtkNqnjicya5EFGQaJh35whyLCjookiz9c9lE6wnOw0FOrLbLDSk
         yESz+qEuH0+Bq8+cXnxayLzRA3BxnE6xBNIRmrSKjd1uEFcPNA5N53495+RZwW875z96
         xNKaXnFZ/L2SBGxQp+g8FwZ6xf6rwFxwy8mszz547yrbd7WG6oWpYOWYv9RyY8ial6iD
         n8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7v0xGUniRMAaLr5lnK8CuaUQYawKvoIYmd2gIBcaU8w=;
        b=U8mM/Bq0qBDX63RxLJLUBvIJHEB5P58Mw5trvaLfEa7pRTSa0UMhkQ7uOawRcSHrA2
         0DpC6woKUaX/sArwJSK2IqyjAUJHBeznfZ0XbVBVzO9lAEo7R07X9xy6tyMTERhmy15T
         UTje18wEToss5saLP1+mEw1rX3malSK29LWdYqNF/KJVfkeuiaynIYF0Op2JjQx5efug
         y++Z9sf1H6TgGGnCcFWj7rRpNzQIXHsL/E7SNYiGjKIxey4wAXoCh/JFvri7pZ0fojCU
         GJjhujsKs0a+dq6SoWMJpoi/Os2S4WuzQr4fwVhH5iHcRkbxxDOtCzNFRWieDQs8H6hT
         17Fw==
X-Gm-Message-State: AOAM531su0HJ9/gF2jo2dq5pHoYTbf2QG29mFhew0UaPMgzw5wRfVQHi
        ihkRsDU15UZhBNybzpt5Vr4=
X-Google-Smtp-Source: ABdhPJxaeCXzoZxaPJ/mXRRzN82IPZckzxV3SXID+xSSoA4Eg1+2QLyNRlSRlpLJTYdFSB75lzgYQA==
X-Received: by 2002:a2e:b558:: with SMTP id a24mr20678346ljn.225.1630337244373;
        Mon, 30 Aug 2021 08:27:24 -0700 (PDT)
Received: from DESKTOP-5EKDQDN.localdomain (78-63-10-115.static.zebra.lt. [78.63.10.115])
        by smtp.gmail.com with ESMTPSA id z3sm409300lfd.38.2021.08.30.08.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 08:27:23 -0700 (PDT)
From:   =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>
Subject: [PATCH] HID: plantronics: Fix bare use of 'unsigned'
Date:   Mon, 30 Aug 2021 18:27:11 +0300
Message-Id: <20210830152711.991-1-aldas60@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix checkpatch warning: Prefer 'unsigned int' to bare use of 'unsigned'

Signed-off-by: Aldas Taraškevičius <aldas60@gmail.com>
---
 drivers/hid/hid-plantronics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index e81b7cec2d12..4aae7569e353 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -143,7 +143,7 @@ static int plantronics_event(struct hid_device *hdev, struct hid_field *field,
 
 static unsigned long plantronics_device_type(struct hid_device *hdev)
 {
-	unsigned i, col_page;
+	unsigned int i, col_page;
 	unsigned long plt_type = hdev->product;
 
 	/* multi-HID interfaces? - plt_type is PID */
-- 
2.33.0

