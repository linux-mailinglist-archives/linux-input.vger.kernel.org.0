Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60D9121F82
	for <lists+linux-input@lfdr.de>; Fri, 17 May 2019 23:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729254AbfEQVRz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 May 2019 17:17:55 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53126 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfEQVRz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 May 2019 17:17:55 -0400
Received: by mail-wm1-f65.google.com with SMTP id y3so8150616wmm.2;
        Fri, 17 May 2019 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iPJlAsCkU3+nT9TRwKzn++9cCcl7QgL+2RMolEaDy6E=;
        b=MQeFj3NgbvnV7txud9k53PXBmDp4/ULVxo07z1FL9TE5J9ssEMWUhi1lrdfneH4sXP
         prkU4uf+j5IabXoNu1P4EsqZIE7G5fZhbOO2Ka7bluRn3wMu1+9sBsEggDm/KbT0NFkB
         CD6ZV2wo/xBxOHq3CWMes3cLt9APMjNOjV2ALWSdzlOdGUCLKn38TrQhiben1kgbZo/y
         f3GmXC0pu2aEDqqTsb5Wompf5cOYEEZ/Pw/P3MC62O2pXXkeGbLg1XhQtlS3uff7Wg1i
         txGKj26osui4mVVfvKl+sMss6Og32n1F1hxtGcYOoDxeyiWgIoeqLYd/KrKpQBnYYYSt
         4p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iPJlAsCkU3+nT9TRwKzn++9cCcl7QgL+2RMolEaDy6E=;
        b=BXXLTsCfHql8ZcbCTHdW/KZraSOgBhaNrzbzVr1s/hYre00IJEl7hZnNYMKkQt1X6R
         jqaK7PydzxM0oKHP3TKUCaOzry7ayOBuRTqk+6u8Xpd0+uJM8OyybwrpWjuSH6WAK3i3
         +fMUSHOdixJeFEO4/JCc1T9GMAodm1yoRKRXdTYBWCGc2zRIxOF78qiyWTQh92OmxXbA
         uMjIlyoLYKqL2NaO/lgGlit4S9LJthXSK9gUwqPyAfzDHeQb24diA9vh2R7EPJdkRvNz
         YhB+HXrsjsSSR4Q6wEo3n+w/nlUlIq/SfGzxodIqwJ35Z9QaE3Yu7o9t1ZT2I9ANYqWA
         voAg==
X-Gm-Message-State: APjAAAVdI8C+Hsjt8hBI3VVGuDIIZXbYJCkuyJ05EHA54EuHNmKE/I/S
        8NpkzTMF/qH4TvkVqiNUIqE=
X-Google-Smtp-Source: APXvYqw476u0jB+82bMx55vwBhRLLxgTaMOSWlzPYLbM+XCFXcY9cc7L+y1NuZvo2mSZ2v734xhXig==
X-Received: by 2002:a1c:ef05:: with SMTP id n5mr3742267wmh.149.1558127872518;
        Fri, 17 May 2019 14:17:52 -0700 (PDT)
Received: from vaio.lan ([93.55.208.142])
        by smtp.gmail.com with ESMTPSA id 88sm20085400wrc.33.2019.05.17.14.17.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 May 2019 14:17:51 -0700 (PDT)
From:   Stefano Manni <stefano.manni@gmail.com>
To:     nick@shmanahar.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     Stefano Manni <stefano.manni@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: input: Add wakeup-source for atmel,maxtouch
Date:   Fri, 17 May 2019 23:17:41 +0200
Message-Id: <20190517211741.8906-2-stefano.manni@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190517211741.8906-1-stefano.manni@gmail.com>
References: <20190517211741.8906-1-stefano.manni@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add wakeup support to the maxtouch driver.

Signed-off-by: Stefano Manni <stefano.manni@gmail.com>
---
 Documentation/devicetree/bindings/input/atmel,maxtouch.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
index c88919480d37..7491a8843c85 100644
--- a/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
+++ b/Documentation/devicetree/bindings/input/atmel,maxtouch.txt
@@ -31,6 +31,10 @@ Optional properties for main touchpad device:
 
 - reset-gpios: GPIO specifier for the touchscreen's reset pin (active low)
 
+- wakeup-source: use any event on touchscreen as wakeup event.
+    (Legacy property support: "linux,wakeup")
+
+
 Example:
 
 	touch@4b {
@@ -38,4 +42,5 @@ Example:
 		reg = <0x4b>;
 		interrupt-parent = <&gpio>;
 		interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_LEVEL_LOW>;
+		wakeup-source;
 	};
-- 
2.20.1

