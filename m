Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA48D2483CC
	for <lists+linux-input@lfdr.de>; Tue, 18 Aug 2020 13:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHRLaf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Aug 2020 07:30:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgHRLab (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Aug 2020 07:30:31 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B19E8C061344
        for <linux-input@vger.kernel.org>; Tue, 18 Aug 2020 04:30:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 85A4A298D0A
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, dri-devel@lists.freedesktop.org,
        kernel@collabora.com
Subject: [PATCH v3 0/2] Add configurable handler to execute a compound action
Date:   Tue, 18 Aug 2020 13:28:23 +0200
Message-Id: <20200818112825.6445-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a follow-up of this thread:

https://www.spinics.net/lists/linux-input/msg68446.html

It only touches DRM (dri-devel) in such a way that it changes the help
message of sysrq_drm_fb_helper_restore_op, otherwise it is unrelated to DRM.

Patch 2/2 adds a configurable handler to execute a compound action.

Userland might want to execute e.g. 'w' (show blocked tasks), followed
by 's' (sync), followed by 1000 ms delay and then followed by 'c' (crash)
upon a single magic SysRq. Or one might want to execute the famous "Raising
Elephants Is So Utterly Boring" action. This patch adds a configurable
handler, triggered with 'C', for this exact purpose. The user specifies the
composition of the compound action using syntax similar to getopt, where
each letter corresponds to an individual action and a colon followed by a
number corresponds to a delay of that many milliseconds, e.g.:

ws:1000c

or

r:100eis:1000ub

An example of userspace that wants to perform a compound action is
Chrome OS, where SysRq-X (pressed for the second time within a certain
time period from the first time) causes showing the locked tasks, syncing,
waiting a 1000 ms delay and crashing the system.

Since all the slots in the sysrq_key_table[] are already taken or reserved,
patch 1/2 extends it to cover also capital letter versions.

v2..v3:
- eliminated compile error in !CONFIG_INPUT case (kernel test robot)

v1..v2:
- used toupper() instead of opencoding it (Jiri Slaby)
- updated help message of sysrq_drm_fb_helper_restore_op (Jiri Slaby)
- used unsigned int for specifying delays (Jiri Slaby)
- improved printed messages formatting (Jiri Slaby)

Andrzej Pietrasiewicz (2):
  tty/sysrq: Extend the sysrq_key_table to cover capital letters
  tty/sysrq: Add configurable handler to execute a compound action

 Documentation/admin-guide/sysrq.rst |  11 +++
 drivers/gpu/drm/drm_fb_helper.c     |   2 +-
 drivers/tty/sysrq.c                 | 129 +++++++++++++++++++++++++++-
 include/linux/sysrq.h               |   1 +
 4 files changed, 140 insertions(+), 3 deletions(-)


base-commit: 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5
-- 
2.17.1

