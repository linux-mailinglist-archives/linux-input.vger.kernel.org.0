Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4F271CDC60
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730169AbgEKN71 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 09:59:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730166AbgEKN70 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 09:59:26 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76EB1C061A0C;
        Mon, 11 May 2020 06:59:26 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id E301F2A095C
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: [PATCH 2/6] dt-bindings: input: Remove linux,sysrq-reset-seq binding
Date:   Mon, 11 May 2020 15:59:14 +0200
Message-Id: <20200511135918.8203-3-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200511135918.8203-1-andrzej.p@collabora.com>
References: <20200511135918.8203-1-andrzej.p@collabora.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Nobody in the tree uses linux,sysrq-reset-seq in Device Tree source files
and there is no code depending on it. Remove the binding document.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../devicetree/bindings/input/input-reset.txt | 33 -------------------
 1 file changed, 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/input-reset.txt

diff --git a/Documentation/devicetree/bindings/input/input-reset.txt b/Documentation/devicetree/bindings/input/input-reset.txt
deleted file mode 100644
index 1ca6cc5ebf8e..000000000000
--- a/Documentation/devicetree/bindings/input/input-reset.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-Input: sysrq reset sequence
-
-A simple binding to represent a set of keys as described in
-include/uapi/linux/input.h. This is to communicate a sequence of keys to the
-sysrq driver. Upon holding the keys for a specified amount of time (if
-specified) the system is sync'ed and reset.
-
-Key sequences are global to the system but all the keys in a set must be coming
-from the same input device.
-
-The /chosen node should contain a 'linux,sysrq-reset-seq' child node to define
-a set of keys.
-
-Required property:
-keyset: array of Linux keycodes, one keycode per cell.
-
-Optional property:
-timeout-ms: duration keys must be pressed together in milliseconds before
-generating a sysrq. If omitted the system is rebooted immediately when a valid
-sequence has been recognized.
-
-Example:
-
- chosen {
-                linux,sysrq-reset-seq {
-                        keyset = <0x03
-                                  0x04
-                                  0x0a>;
-                        timeout-ms = <3000>;
-                };
-         };
-
-Would represent KEY_2, KEY_3 and KEY_9.
-- 
2.17.1

