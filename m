Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A89C82015CD
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 18:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390312AbgFSO6J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 10:58:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390350AbgFSO6I (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 10:58:08 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4983C06174E
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 07:58:08 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g21so4954848wmg.0
        for <linux-input@vger.kernel.org>; Fri, 19 Jun 2020 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlHKVuiHe8mY0zQtBxb4XV8bYdEFMK4nb0VIctDBF+w=;
        b=r8Rvvxoot00RNraOrmIhovemuUioUrYhGQgvYCZamIsisSI5E7gATOWifMLFVOF5pk
         R+YrjxJMZGdwmmfHJt6feutYSWSH9kq6uY7UQ9YOuliOrSB0/4j6bey8HHPd53NPOXnK
         upLpI/y4yvooVRftwbwVTdSLpStxXTF8AgzcCrl5SkSvBVDzPQnekFqzx5iKlEy+XP4Y
         pu9m0G5WX8W6TaN06MoFKOOQqzMyaFEQXlYJsWxG2gzOH4k2kIGx0Yhw/xTYTI9Cz7Xi
         bFbE3DpWgShcq7PLOZS4TOw7IACGF5sCZ3vJy0mMjaEwATz3ZkicAljHvin8smMAvcYt
         gnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlHKVuiHe8mY0zQtBxb4XV8bYdEFMK4nb0VIctDBF+w=;
        b=sxx2ZqAP/rxlA303lzJ9BekXSyRQcw/kIbrz+JD+LTMLxg+ZkBOPBZSJq0fS4bs7jQ
         u3AfvA290oHo2h6PSdfnFOcyYRwfSkcCFAsnEH1eAA4OxInbIDK653ELrF8Tj0UsXyrQ
         65pIuTckSc62zVFnuQ7Wq0hvP4/Z15QYQ+MdSMW1KXlwOpWzk+6zqU8ATcxoch/rA4aA
         x4/mGy7jYRkKKaVDaAQhD+XE2HfLy9w4icesrtOGP/XXRDcbJSYZn7ID7/Do5sZiZhQ7
         VFnZkgDrOJgAWNZ88i6kz5+GvxCSxewAymYFdLB86edtXEkpczdy0TQVamkUDTY5ASx3
         SVjg==
X-Gm-Message-State: AOAM532oCEKrYC7yCOFFa/w6DNeJ/LgQi5wIiMLq44D49tgtzz1EcL1L
        dY0f05fW8v0ofYYZI3kPkmJPm/JU
X-Google-Smtp-Source: ABdhPJxklkKCozDRBqNspdrGnM8MWKdwU44CmT9yi9hPqASUY31WeYUGUnPdzYxuDE+9OmQj5Mp26g==
X-Received: by 2002:a1c:ac8a:: with SMTP id v132mr4071500wme.26.1592578687341;
        Fri, 19 Jun 2020 07:58:07 -0700 (PDT)
Received: from david-x1.fritz.box (p200300c2a7202e00cce94073abf366fb.dip0.t-ipconnect.de. [2003:c2:a720:2e00:cce9:4073:abf3:66fb])
        by smtp.gmail.com with ESMTPSA id c206sm7704026wmf.36.2020.06.19.07.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 07:58:06 -0700 (PDT)
From:   David Rheinsberg <david.rheinsberg@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        David Herrmann <dh.herrmann@gmail.com>,
        David Rheinsberg <david.rheinsberg@gmail.com>
Subject: [PATCH] MAINTAINERS: update uhid and hid-wiimote entry
Date:   Fri, 19 Jun 2020 16:57:59 +0200
Message-Id: <20200619145759.37941-1-david.rheinsberg@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

My last name changed to "Rheinsberg", so update the maintainer entries
and adjust the emails while at it.

Signed-off-by: David Rheinsberg <david.rheinsberg@gmail.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 465210f17948..e1d82d8de7dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17390,7 +17390,7 @@ F:	Documentation/admin-guide/ufs.rst
 F:	fs/ufs/
 
 UHID USERSPACE HID IO DRIVER
-M:	David Herrmann <dh.herrmann@googlemail.com>
+M:	David Rheinsberg <david.rheinsberg@gmail.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/uhid.c
@@ -18334,7 +18334,7 @@ S:	Maintained
 F:	drivers/rtc/rtc-sd3078.c
 
 WIIMOTE HID DRIVER
-M:	David Herrmann <dh.herrmann@googlemail.com>
+M:	David Rheinsberg <david.rheinsberg@gmail.com>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-wiimote*
-- 
2.27.0

