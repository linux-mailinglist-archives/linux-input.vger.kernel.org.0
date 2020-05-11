Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED56B1CDC5C
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 16:00:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730110AbgEKN70 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 09:59:26 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:51654 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgEKN7Z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 09:59:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id D1D622A092D
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, andrzej.p@collabora.com,
        kernel@collabora.com
Subject: [PATCH 0/6] Magic SysRq extensions
Date:   Mon, 11 May 2020 15:59:12 +0200
Message-Id: <20200511135918.8203-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Some systems, e.g. chromebooks, don't have a physical SysRq key. Patch 3/6
allows configuring which key acts as SysRq. If unconfigured, the default
KEY_SYSRQ is used.

The sysrq_key_table has effectively run out of free slots. Patch 4/6
extends the said table to accommodate capital letters, so on top of
0-9 and 'a'-'z' 'A'-'Z' are added.

Userland might want to be able to signal a specifically named process
with a specific signal as a result of some SysRq action. Patch 5/6 adds
such a capability. The name of the signalled process, the name of the
signal to be delivered to it and, optionally, the expected name of the
target process parent are configured. Once configured, the action is
available under Alt-Shift-SysRq-s.

Userland might also want to be able to execute a compound action, e.g. the
famous "Raising Elephants Is So Utterly Boring", or, say, 'w' (show blocked
tasks), followed by 's' (sync), followed by 1000 ms delay and then followed
by 'c' (crash). Patch 6/6 adds such a capability. The (short) names of
component actions are specified with a string. Optional delays between
actions are specified with a colon and the amount of milliseconds, e.g.
"reis:1000ub" or "ws:1000c". Once configured, the action is available
under Alt-Shift-SysRq-c.

While at it, remove unused linux,sysrq-reset-seq handling code and the
associated binding (patches 1/6 and 2/6).

Andrzej Pietrasiewicz (6):
  tty/sysrq: Remove linux,sysrq-reset-seq
  dt-bindings: input: Remove linux,sysrq-reset-seq binding
  tty/sysrq: Allow configurable SysRq key
  tty/sysrq: Extend the sysrq_key_table to cover capital letters
  tty/sysrq: Add configurable handler to signal a process
  tty/sysrq: Add configurable handler to execute a compound action

 .../devicetree/bindings/input/input-reset.txt |  33 ---
 drivers/tty/sysrq.c                           | 268 ++++++++++++++++--
 2 files changed, 238 insertions(+), 63 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/input-reset.txt


base-commit: 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8
-- 
2.17.1

