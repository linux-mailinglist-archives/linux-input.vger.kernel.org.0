Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 859AA1330C0
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2020 21:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgAGUnG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jan 2020 15:43:06 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41613 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgAGUnF (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 7 Jan 2020 15:43:05 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Mk1BG-1jYwlJ2CMq-00kOo3; Tue, 07 Jan 2020 21:43:01 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Oleksandr Natalenko <oleksandr@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Fontana <rfontana@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] input: appletouch: shut up -Wmaybe-uninitialized warning
Date:   Tue,  7 Jan 2020 21:42:45 +0100
Message-Id: <20200107204300.1365789-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:qgZ7jx6brPqr3DJUiVtmNZgtLjzRT+2qQdnCUsfgjChRG18mMU1
 s0eCpoecStsNJ1VUyiitj+YDY9H4iZBLIiYJPrflwlGkVEZn5BCQjmakeydFC9BGzfJmTo5
 BCBrnDEJ1B80A85OJooIB0pBrK0mgyy9DxZIu6pthX0Ii6GzBQhrA4GeCbsj0ZlMuYytIt2
 Mu7PRP0TRwR4jYjKGPMnQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:n77QML3xySw=:4Jkl26AcpldHuzhon2Bcf6
 HRlIHGxnmxay39fgnDI5iXC+jj5XzYH9u+SKcLFsI4D+u4ZqVfxC4aFAL9eCt7bq3GO3GEw50
 cv2xh/61sQBriaVvJDXlZZZj+C7AaPWu3aQwL5M6dtvSxdt6+nz4Tj+3OV+KV3H6xunW0F6k2
 1Wl/fSS3UiYh4GXVdWERYs/Wk4IMIfSrv4SF5odqiZRDuC50vf9Sl8hGz+L1paMw0Cu6t9iRc
 XXm7JtqXzo8YyGh8WOZjTt8XJRJITBG7AsnDXoVU00S0yv+7MaVrh6AKPbWRol8JC0VnsyHGu
 k8LI2wAKO9zN1TLKMqVokZU+oo2jB4z1vH5fgu2HwmNKqtyjR1Dlo8wlHEEGzz60YMkmhGZcd
 3v1IAeGYRqXfmaiKqgU4fketxlU0TpEROsy6tM5r2KwltQsXz9Z/lD1asnq2CDJ6Wkn1gAXiz
 A9+b7H3eMQbq+0D75/5lvQfn3X9wo+rF76NiXxd+RZEvXmcw+beaZIskHTvoinhrKxmvvJkP2
 dotHE/kiK/+it8pkkWoMZb2nyEgIft2c/c5T2o9Ze6Z61sA5wvEbR5atW4C4KGIKf4pAcT7ka
 jeW5lBpmf5uGWy1bala+z0QKMpg93Epi2/LlhuWu3svWclEyzlUaYyC7TZVMdVqFdW4vcZn8i
 x2YTyjMi1JzfJHgxh4RTtKcTwoIRW043MBKB6QaFW9XoDYkBxeYkvmPgaqIpe9pskU5Lzpw8U
 GdJ2xgx0fyjCwE75mWXrT3DIViM2O+o8RkOI+oWYP1wpA19XsKRbGqCmwFd2pnv8rpCOjz0aM
 8d465tPCH2VJUqAwEGO0uPYzogrSe1h27ZVJkf38VqHxqmr0OwZkCFw7B/Os6XQr/XkI2zdjr
 yeGNxWs71pOAqXacSYUQ==
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Building with -O3 introduces a false-positive warning in this file:

In file included from include/linux/compiler_types.h:68,
                 from <command-line>:
drivers/input/mouse/appletouch.c: In function 'atp_complete_geyser_3_4':
include/linux/compiler-gcc.h:71:45: error: 'x_z' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                             ^~~~~~~~~~~~
drivers/input/mouse/appletouch.c:657:12: note: 'x_z' was declared here
  int x, y, x_z, y_z, x_f, y_f;
            ^~~
In file included from include/linux/compiler_types.h:68,
                 from <command-line>:
drivers/input/mouse/appletouch.c: In function 'atp_complete_geyser_1_2':
include/linux/compiler-gcc.h:71:45: error: 'x_z' may be used uninitialized in this function [-Werror=maybe-uninitialized]
 #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
                                             ^~~~~~~~~~~~
drivers/input/mouse/appletouch.c:517:12: note: 'x_z' was declared here
  int x, y, x_z, y_z, x_f, y_f;
            ^~~

The variables are not actually used here since the only usage
happens when both 'x' and 'y' are non-zero, but this is something
that gcc fails to track.

Fixes: mmtom ("init/Kconfig: enable -O3 for all arches")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/mouse/appletouch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/mouse/appletouch.c b/drivers/input/mouse/appletouch.c
index 3f06e8a495d8..ec2139c43fcd 100644
--- a/drivers/input/mouse/appletouch.c
+++ b/drivers/input/mouse/appletouch.c
@@ -330,7 +330,7 @@ static void atp_reinit(struct work_struct *work)
 			retval);
 }
 
-static int atp_calculate_abs(struct atp *dev, int offset, int nb_sensors,
+static noinline int atp_calculate_abs(struct atp *dev, int offset, int nb_sensors,
 			     int fact, int *z, int *fingers)
 {
 	int i, pass;
-- 
2.20.0

