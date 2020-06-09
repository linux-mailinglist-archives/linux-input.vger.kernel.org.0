Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 245511F379A
	for <lists+linux-input@lfdr.de>; Tue,  9 Jun 2020 12:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgFIKHM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Jun 2020 06:07:12 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:49735 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726286AbgFIKHL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 9 Jun 2020 06:07:11 -0400
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1Mi2eP-1j4qU50v2n-00e7rY; Tue, 09 Jun 2020 12:06:48 +0200
From:   Arnd Bergmann <arnd@arndb.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Guenter Roeck <linux@roeck-us.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-input@vger.kernel.org, Markus Koch <markus@notsyncing.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] Input: joystick - work around "adi" module name confict
Date:   Tue,  9 Jun 2020 12:06:33 +0200
Message-Id: <20200609100643.1245061-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:E1BYE3XcXEHjtosxrdg/fikSVlwD8VOcBmuHGtndGssMyxHHQEj
 xZbBbi/ZbSwpR6LO4vC/QnYbtZvO9mYIgqObrIvDweZ2XCPv+NjSumw3nOFpLQONp0xfZVB
 xSXu4/UMp1E4OzosPamj/mgLe6K2xrJsQLIE/ROCt9KifQoOiQQv52U/3gAw0c99XSVeKWU
 7Vr86uG+WVYfZ+z7+O4CQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:/sIqOr2R5mM=:Pa7Z6GzzqsG48g+NvgDRBf
 le4/8g4Llr6TzN6BwEafmkUgjtPd7HGrApQj6SjRWOaaaqauP9U/Wcf1sHajlECcx2XUj2fDw
 MuKmxbDzcg04R7YyFlNzbWPwd4EriRcEVz9iP4ZwUA5JJXyuf3v+nSl9GMH8MTw0ESSeEa/e1
 hsFETgHpH+HMefPF2d0hm0tdKx1nVL5sA/+RFQav1sECrcHbIr0gG2ukE2ueCTcjg6SqJbyeY
 EprTyDktkLMYHPzQmrVoSN5pGgtBtA0PxgbjFje2bSHMFYMoSqJJOz0QRR/SLyW4Zqek5euQY
 pKNqddcR/W9DxNTMTFBn4AgZjppUz1vJjx3Js05uoM/VVTtvtuT6VX73ylGBAjJ7HOOEhrVxw
 Kaaz0iMRYXEFlS0aCGiCRVV5bwkK9UreLBO5T9Uiq+k9Wpi9bfXoI6iU5MvhTy4/7sqoDj9Cw
 7r3Y2bCOnBjOKuocJftKt4b7mi61WOLArHnsGdNVFTvY9FriHgpsIFFTAGUf8JIfRI6JXWHAc
 xNTDQwK/KAFZiSW/3YQnMDGxe4GXhGwXpzW2r7lj3CM+iexMBKVRXbToZmTVGc8ztpg7fiUJk
 bel+A/nxi0ojIMXolgAA7ibJuOB4hu3BTsBCBHeW7hKXYG3GGtyKHPtTxf9j6Eo9qYpSqQG0V
 ioivWTzGNH/twsLYp4F/GXjTlr1GyBI7kZ0RNZ7COUmwoNJCLSdd3u/298CxaYoQE1QaCZpAu
 YO4Bl59Iib4dM6sPrwYPif9RTVCNCytMtHZPEHcKVeFO+9PMlPlGpPhTOu+hKlnNbeNYsZeJT
 kqvxerrnN+RVY3lk/fd4Cn5RN1j7xeM0wkXaTT4IAELFqiFmkI=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Making module name conflicts a fatal error breaks sparc64
allmodconfig:

Error log:
error: the following would cause module name conflict:
  drivers/char/adi.ko
  drivers/input/joystick/adi.ko

Renaming one of the modules would solve the problem, but then cause other
problems because neither of them is automatically loaded and changing
the name is likely to break any setup that relies on manually loading
it by name.

As there is probably no sparc64 system with this kind of ancient joystick
attached, work around it by adding a Kconfig dependency that forbids
them from both being modules.  It is still possible to build the joystick
driver if the sparc64 adi driver is built-in.

Reported-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This should get merged through the kbuild tree together
with the patch that turns the warning into an error, if the
joystick maintainers are ok with the hack.
---
 drivers/input/joystick/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 940b744639c7..6f73f02059b5 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -45,6 +45,7 @@ config JOYSTICK_A3D
 config JOYSTICK_ADI
 	tristate "Logitech ADI digital joysticks and gamepads"
 	select GAMEPORT
+	depends on ADI!=m # avoid module name conflict
 	help
 	  Say Y here if you have a Logitech controller using the ADI
 	  protocol over the PC gameport.
-- 
2.26.2

