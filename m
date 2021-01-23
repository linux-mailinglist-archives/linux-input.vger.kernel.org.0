Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE66301599
	for <lists+linux-input@lfdr.de>; Sat, 23 Jan 2021 15:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725986AbhAWN7H (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 23 Jan 2021 08:59:07 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:58387 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbhAWN7G (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 23 Jan 2021 08:59:06 -0500
X-Greylist: delayed 541 seconds by postgrey-1.27 at vger.kernel.org; Sat, 23 Jan 2021 08:59:05 EST
Received: from envy.fritz.box ([82.207.207.243]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3sye-1m34oN3Gym-00zkYA; Sat, 23 Jan 2021 14:47:24 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, corbet@lwn.net, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/8] Updated Kconfig
Date:   Sat, 23 Jan 2021 14:47:11 +0100
Message-Id: <20210123134716.13414-4-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210123134716.13414-1-mail@richard-neumann.de>
References: <20210123134716.13414-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:GdMeFbIzUse4dSlYy6m3FcbqQFJbM6N08tCsCRce8WLtGsbGdha
 +e8TANBZ4dihmqNWM0AaEwNPUczzAToS064LTVe48fTLDO7KdUppGmLfo5rqT2EAT6w2XCa
 +wnpXW5V9G/C/6XH/3LAGJZY4ONwkS2kEQuX0rbQuvY4pVSpoz38yCOSBNZyIi1wgKwjghJ
 qQn/4gNI31QGgMgcIla6w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fnEKrpxDjVg=:KyCdM9w3HKPg6EQ8ttJd5k
 O5ztI1HkCnETK5qip/wbUzXLI1ECG/Jqd1BDOeuJ80nzG8rz7CWVmZQYsnEb0BQDW3Z8pV/l+
 Ph5Yeb4QWKFJ83GKLnOUYAkFwygQ3nOk1hmsxk+g9dLeiXtXgcCWOoGcic3H/DN+ElK+P8qYN
 d7uIAfTVu9hdtoD7hTKi8KW0KM6SgdlZmb+UV9yTxF3KOjSZogRpIghhWZHm+D6VMSrwvqmWq
 G09LHWGEZBbs9t5wAyps8T+9uLJxRyYAetBaQTkTPn/kilHd/i2wWxygFKo/7apn70SHHX6Qn
 CA9ankA6Wj/tCXo6QVOiv9DBbsBYZ/5/8EplYngl6yUu9UM9CWplXqRF31ZqFj6VQJ3qeqwnQ
 g8nD+fjPyqDSpLz+cPiIajZ+yb0W+Ea2g/jkuGbiNsteg5c7rq8cl0jVFoymxThlTCTlHwYh7
 aUyU2tv2pA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Updated Kconfig file for the AMD SFH driver.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 drivers/hid/amd-sfh-hid/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/amd-sfh-hid/Kconfig b/drivers/hid/amd-sfh-hid/Kconfig
index db069a83e9a2..7ebb96827a05 100644
--- a/drivers/hid/amd-sfh-hid/Kconfig
+++ b/drivers/hid/amd-sfh-hid/Kconfig
@@ -12,7 +12,7 @@ config AMD_SFH_HID
 	  This driver will enable sensors functionality on AMD platforms
 	  starting from 17h family of RYZEN parts.
 
-	  This driver can also be built as a module. If so, the module will
-	  be called amd-sfh.
+	  This driver can also be built as a module. If so, the modules will
+	  be called amd-sfh-pci and amd-sf-hid.
 	  Say Y or M here if you want to support AMD SFH. If unsure, say N.
 endmenu
-- 
2.30.0

