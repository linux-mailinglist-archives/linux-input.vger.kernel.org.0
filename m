Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E32444DAC6
	for <lists+linux-input@lfdr.de>; Thu, 11 Nov 2021 17:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234261AbhKKQxa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Nov 2021 11:53:30 -0500
Received: from mx1.riseup.net ([198.252.153.129]:39252 "EHLO mx1.riseup.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234328AbhKKQxL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Nov 2021 11:53:11 -0500
X-Greylist: delayed 347 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Nov 2021 11:53:11 EST
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
         client-signature RSA-PSS (2048 bits) client-digest SHA256)
        (Client CN "mail.riseup.net", Issuer "R3" (not verified))
        by mx1.riseup.net (Postfix) with ESMTPS id 4Hqncd698xzF4mw;
        Thu, 11 Nov 2021 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
        t=1636649073; bh=EA9bwQmMUEBSE6EdIxEKpSTsOir0ZXyLEyaU1bTf4u8=;
        h=From:To:Cc:Subject:Date:From;
        b=BNxJloO2Z22eazNMPEysoxD7eMbrefhHT9XdzD4dMmRq6k5CeJwpcrt6WkgM8Hdfc
         muLh6rzxvt5YU8v7RU0AJbBzRzUYtKSqXUqdMEL+iS0Sk7J1/1XVdy/jNcH3q8hQHv
         QFA2QJEROGJfDn+DBEHNlzKqTusePTZky2/Ws/dg=
X-Riseup-User-ID: 466E21B2873C2525A9DDBB588C4AD9967C570C0CADDE662C8E0D1828AB2E8072
Received: from [127.0.0.1] (localhost [127.0.0.1])
         by fews2.riseup.net (Postfix) with ESMTPSA id 4Hqncc0X8Xz1xqF;
        Thu, 11 Nov 2021 08:44:31 -0800 (PST)
From:   =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
To:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>
Subject: [PATCH] HID: logitech: add myself as a reviewer
Date:   Thu, 11 Nov 2021 16:44:11 +0000
Message-Id: <20211111164411.2978353-1-lains@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Currently, I have to use a separate email address and maintain several
filters to monitor changes to Logitech drivers, so that I can have an
opportunity to review them. Since I am very interested in keeping up
with the changes, as I have a lot of the hardware and maintain the main
userspace stacks that depend on these drivers, I would like to mark
myself as a reviewer. I would also be open to be marked as a maintainer
if Benjamin thinks it makes sense.

Signed-off-by: Filipe Laíns <lains@riseup.net>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b7a13f706fa..58c2c023d865 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8466,6 +8466,12 @@ F:	drivers/hid/
 F:	include/linux/hid*
 F:	include/uapi/linux/hid*
 
+HID LOGITECH DRIVERS
+R:	Filipe Laíns <lains@riseup.net>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	drivers/hid/hid-logitech-*
+
 HID PLAYSTATION DRIVER
 M:	Roderick Colenbrander <roderick.colenbrander@sony.com>
 L:	linux-input@vger.kernel.org
-- 
2.33.1

