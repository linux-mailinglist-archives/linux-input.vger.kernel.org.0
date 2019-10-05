Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 072D0CC947
	for <lists+linux-input@lfdr.de>; Sat,  5 Oct 2019 12:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725985AbfJEKOC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 5 Oct 2019 06:14:02 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40940 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfJEKOB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 5 Oct 2019 06:14:01 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so5427623pfb.7
        for <linux-input@vger.kernel.org>; Sat, 05 Oct 2019 03:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxfFhC+Gco8oPLc2lC4Mh4+Ud03liyn0rjCnfNDhxQY=;
        b=FOTeY/vHx02g5ZfG+FGNAYkQdEj/8IPx4lnA8YLbaf08vhNFsGy1Xu8AVYG/Jc04L+
         pANSzFUwMBpMVrxAfnS6u1u/yMgcwe5w72Ir2cSLPVQa3QV7eBFyBHuJ0NYbIREtHPXc
         vOezN6c2Cwmgd9IdG3fxYR//zS/gRL/cyzxtE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uxfFhC+Gco8oPLc2lC4Mh4+Ud03liyn0rjCnfNDhxQY=;
        b=XkNcXKCV9sZnLuJKnVXt5U3wzfAZMZ+azmKloTMCTZp8mCnDthTbx2oaPZftQ620yy
         VE0Nodh2g9RTxDiZUWgkfwHADv3xqQvrDf2FRoLzAsTKawjlOoxiZawM2H2sqi9KJWPC
         CV1547aUmwSkgcZ5gnQRda/pPA6UY3P5bN2PLiYLkps+YUN/ZrRUeMYNzLobhyaDxU7A
         FQ5Jp+sxvSlcOJ9pKX8TA9XMfLoiD5bto1mz7t7kVws5NH3Ov+ChyzlCiv6bnimqnooU
         cTM7FtceDqYzFe23JX0O3fUOW9Li0O5siXx5I4Wk5p2Q04Cdrb+3JT9Xr6ppHSYpkaei
         LWFw==
X-Gm-Message-State: APjAAAXjrKzBEF86nOXki/jWRhb8h+fizROta05rMlW/9KYv6LmhUF9l
        iKe36eZ4hacylho+llh/5k0y4u/CY5s=
X-Google-Smtp-Source: APXvYqxEZB2oeygrzS2m96wqhJ3bnMYuQjFeV97DuMHCDvFOw1Hw3Trk8BPAx3J7OxP0YcZcuTtWsA==
X-Received: by 2002:a17:90a:28c5:: with SMTP id f63mr22095283pjd.67.1570270440988;
        Sat, 05 Oct 2019 03:14:00 -0700 (PDT)
Received: from ikjn-glaptop.roam.corp.google.com ([61.254.209.103])
        by smtp.gmail.com with ESMTPSA id c3sm7558890pgl.51.2019.10.05.03.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2019 03:14:00 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Brian Norris <briannorris@chromium.org>,
        Enrico Granata <egranata@google.com>,
        Ting Shen <phoenixshen@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH 1/3] dt-bindings: input: Add DT bindings for Whiskers switch
Date:   Sat,  5 Oct 2019 18:13:45 +0800
Message-Id: <20191005101345.146460-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the DT binding document for Hammer's TABLET_MODE switch.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---
 .../devicetree/bindings/input/cros-cbas.yaml  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml

diff --git a/Documentation/devicetree/bindings/input/cros-cbas.yaml b/Documentation/devicetree/bindings/input/cros-cbas.yaml
new file mode 100644
index 000000000000..3bc989c6a295
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/cros-cbas.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/cros-cbas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ChromeOS Hammer's Base Attached Switch
+
+maintainers:
+  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
+
+description:
+  This device is used to signal when a detachable base is attached to a
+  Chrome OS tablet. The node for this device must be under a cros-ec node
+  like google,cros-ec-spi or google,cros-ec-i2c.
+
+properties:
+  compatible:
+    const: google,cros-cbas
+
+required:
+  - compatible
-- 
2.23.0.581.g78d2f28ef7-goog

