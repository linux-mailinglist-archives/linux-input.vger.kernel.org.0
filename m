Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 742A523BE11
	for <lists+linux-input@lfdr.de>; Tue,  4 Aug 2020 18:24:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgHDQYN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Aug 2020 12:24:13 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34168 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729877AbgHDQYK (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Aug 2020 12:24:10 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 971BB2950F5
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, kernel@collabora.com
Subject: [PATCH 0/2] Add configurable handler to execute a compound action
Date:   Tue,  4 Aug 2020 18:24:00 +0200
Message-Id: <20200804162402.2087-1-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

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

Andrzej Pietrasiewicz (2):
  tty/sysrq: Extend the sysrq_key_table to cover capital letters
  tty/sysrq: Add configurable handler to execute a compound action

 Documentation/admin-guide/sysrq.rst |  11 +++
 drivers/tty/sysrq.c                 | 128 +++++++++++++++++++++++++++-
 include/linux/sysrq.h               |   1 +
 3 files changed, 138 insertions(+), 2 deletions(-)


base-commit: bcf876870b95592b52519ed4aafcf9d95999bc9c
-- 
2.17.1

