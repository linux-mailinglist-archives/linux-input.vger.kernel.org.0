Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD652E1029
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 04:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389242AbfJWCn4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 22:43:56 -0400
Received: from mail-pf1-f176.google.com ([209.85.210.176]:33873 "EHLO
        mail-pf1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731185AbfJWCn4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 22:43:56 -0400
Received: by mail-pf1-f176.google.com with SMTP id b128so11938478pfa.1
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 19:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mofPZU0gDfCeMdQs09aoNyZbpVsgKBRv49oSTcbrnzI=;
        b=mOy5hTZQlIbUw/dLIeqJ54nqXPthp1Z+w+N0xfknDKFXtqQwMk7Wnfn5/rNspav5uV
         MDdW15WOQGDrNUHwqTPtFPR2ayZOR8PMkZQPsCoIGFkMa15/YWeG535VD4rhqVXQc9QF
         hbxhmYfc7eY5CvzZRVxMHsmJhf0O38G/wX6CI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mofPZU0gDfCeMdQs09aoNyZbpVsgKBRv49oSTcbrnzI=;
        b=gnQkOJWZ5+WE0GsCDsw4wDi533PNkCXciOaMarsT8sm+1SvmSlFLuA8zk1CJARcnFU
         Jdf8c0uzvbKAULU69AmI2QOqlG+9ofFZMOukMEDz9940ahuocBqfqhRX6HGtJvJ5Q10n
         So8eOSEZBI6ogYugln4XpRWoDElr9VEMS6I8SYFiWlY/uybq8i4ZIkC2Bj7lqLkijH0W
         Caibxwzw0rWbhvmtKF33qkDGq+lzpLRy9pvHpP1ieG+mx4hkBiL7+SGE5XifVK0wikiV
         1wxB6B1wLrDN/Ef7fnwUEghJwhBn8Yq75qebNGGImKSpklc6cl/+r47HnEmj2dKqylWi
         4sFw==
X-Gm-Message-State: APjAAAVl/14d1C79ZRaN1U87bo4EvzMMHiY9n1LFu8mfM84OoYf0eIET
        f4PuZMk17J5DhMTFLZ0Nt6ERmHnAPJo=
X-Google-Smtp-Source: APXvYqxv+U6sKv24k78c6mmhFtzdjMFTEVjKujp5UDRJgvxJ5YW1F0J5Ur7LHviLgSGCAZnRoVmNKQ==
X-Received: by 2002:a63:fe56:: with SMTP id x22mr7379113pgj.282.1571798635041;
        Tue, 22 Oct 2019 19:43:55 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id o64sm45970901pjb.24.2019.10.22.19.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 19:43:54 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 1/2] dt-bindings: input: Add DT bindings for Whiskers switch
Date:   Wed, 23 Oct 2019 10:43:48 +0800
Message-Id: <20191023024348.225969-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
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
2.23.0.866.gb869b98d4c-goog

