Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE9212253E7
	for <lists+linux-input@lfdr.de>; Sun, 19 Jul 2020 22:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726073AbgGSUNY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jul 2020 16:13:24 -0400
Received: from mail-40136.protonmail.ch ([185.70.40.136]:34491 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726009AbgGSUNY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jul 2020 16:13:24 -0400
Date:   Sun, 19 Jul 2020 20:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595189602;
        bh=ugK9z9eotP/7q6gWxnIt9aiB94pARJM9EOM4j26gi1E=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=azpSz9vELHUzSy3xRPDEuX0VA9XsAtY/y8AXVhayngGK4pWZXfX5B2wIs4Y1AFLtN
         O9LJq0Jv8vZWX5qBFjnCkH85ZBMuQxv/aTALz75BMeZCh69iAZ0y4b7O36aKk80LHe
         ifr45tX82VpCbUdjkBqpAonG250eoHIx2egUygNI=
To:     dmitry.torokhov@gmail.com
From:   Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     linux-input@vger.kernel.org,
        Colton Lewis <colton.w.lewis@protonmail.com>
Reply-To: Colton Lewis <colton.w.lewis@protonmail.com>
Subject: [PATCH] input: Correct kernel-doc inconsistency
Message-ID: <20200719201312.148814-1-colton.w.lewis@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Silence documentation build warnings by correcting kernel-doc comment
for key_entry struct.

./include/linux/input/sparse-keymap.h:43: warning: Function parameter or me=
mber 'sw' not described in 'key_entry'

Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
---
 include/linux/input/sparse-keymap.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/input/sparse-keymap.h b/include/linux/input/spar=
se-keymap.h
index d25d1452dc6e..119f4b275fc6 100644
--- a/include/linux/input/sparse-keymap.h
+++ b/include/linux/input/sparse-keymap.h
@@ -20,8 +20,9 @@
  *=09private definitions.
  * @code: Device-specific data identifying the button/switch
  * @keycode: KEY_* code assigned to a key/button
- * @sw.code: SW_* code assigned to a switch
- * @sw.value: Value that should be sent in an input even when KE_SW
+ * @sw: struct breaking keycode into code and value
+ *=09.code: SW_* code assigned to a switch
+ *=09.value: Value that should be sent in an input even when KE_SW
  *=09switch is toggled. KE_VSW switches ignore this field and
  *=09expect driver to supply value for the event.
  *
--=20
2.26.2


