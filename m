Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5806C43FB93
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 13:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232014AbhJ2LnR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 29 Oct 2021 07:43:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:51068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232002AbhJ2LnR (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 29 Oct 2021 07:43:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B44A60F0F;
        Fri, 29 Oct 2021 11:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635507648;
        bh=p4S5wYD0ma8JFulxWT4vD5+Ei5DR4SPJvvb7cb7XhYk=;
        h=From:To:Cc:Subject:Date:From;
        b=gaS55Rq7T8lbLKDpfGqH0NgdXfEn7pe9faGcQnvUGPAon1I7E1IyoDQyskop7qWCM
         s0IMLYZatwhEx7NcH+tE1vYpqhrFeHh0bu5G2O33Sxo8VZeGO+utjZdxbiXsLngVVs
         6CWrb3FS/byH/vcPu00F40T3xXJTT+IoLcyFzaGdOKMJsA6tB9vi2EszcteTLkD6cY
         Z87j5CPa/yUTapfpRsvgtvmTQ0+6RtUM8pK1UanDCKEYQiQMtplhTfggNJzJ97rKEZ
         FhGrdvyKb9UKrtrs1K1AYkXQtWO94O6iBkJtjXnX0ijlYnBKGuFYqhiDWnnZqGDqsG
         5SYXQENEgH0sA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Roderick Colenbrander <roderick@gaikai.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hid: playstation: add LEDS_CLASS dependency
Date:   Fri, 29 Oct 2021 13:40:24 +0200
Message-Id: <20211029114044.1058958-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The new LED support causes a link failure when the LEDS subsystem
is in a loadable module and the playstation HID driver is built-in:

ld.lld: error: undefined symbol: devm_led_classdev_multicolor_register_ext
>>> referenced by hid-playstation.c
>>>               hid/hid-playstation.o:(ps_lightbar_register) in archive drivers/built-in.a

Add a hard Kconfig dependency on LEDS_CLASS, but allow building with
the multicolor support disabled, as this is apparently meant as an
optional interface.

Fixes: 8c0ab553b072 ("HID: playstation: expose DualSense player LEDs through LED class.")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hid/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index a2c3d9b7bd01..cd10c398580e 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -899,6 +899,8 @@ config HID_PLANTRONICS
 config HID_PLAYSTATION
 	tristate "PlayStation HID Driver"
 	depends on HID
+	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
 	select CRC32
 	select POWER_SUPPLY
 	help
-- 
2.29.2

