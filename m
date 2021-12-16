Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60D047801F
	for <lists+linux-input@lfdr.de>; Thu, 16 Dec 2021 23:46:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230462AbhLPWqi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Dec 2021 17:46:38 -0500
Received: from mail.valdk.tel ([185.177.150.13]:41562 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236351AbhLPWqi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Dec 2021 17:46:38 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7B81C2C17D4;
        Fri, 17 Dec 2021 01:46:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1639694792; h=from:subject:date:message-id:to:cc:mime-version:
         content-transfer-encoding; bh=vSHVvgqhSmlITFdSMhLO+nEvHQqtBecNMT6ZPuYVu6M=;
        b=d5zFRDlYODhCe+60uz7qYADJ+vxyeFxbOPomOxnUDX4o2nKHJGh/4K2fF8WOJQ6hmdKfmU
        rrNsgAb3exmMt1f5nVv5L0ct8mB/B5S1+QWBYORqTX5Uz6nJtXyTZC2Nb4lGY+fBFRGW89
        4rdectWY+QG9wFx+djRbDavOax1O9ozAE5D8jL+5FEYI7zJt/a8bYgp7oXSCCTE9VwA7+K
        70Dce+A6ad4wmU/Y23j7aCiimW5ZDQfdAzUpl5q3ZVm2xB+/hspvk1lNDaPtf9qLT/03jJ
        fK9E74aDFjPVmisJjLEroLG2Js4sS7E2ONObCmqeaAmZ1wRXnt06SqBzZMkgGQ==
From:   ValdikSS <iam@valdikss.org.ru>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org
Subject: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II support
Date:   Fri, 17 Dec 2021 01:46:08 +0300
Message-Id: <20211216224611.440397-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset adds support for Lenovo ThinkPad TrackPoint Keyboard II,
in both USB and Bluetooth modes.

It brings additional functional keys mapping, native vertical and horizontal
scrolling, trackpoint sensitivity configuration and Fn-Lock sync.

There is no code difference between the previous patchset, only minor
patch subject changes and code/comments split.

ValdikSS (3):
  HID: lenovo: Add support for ThinkPad TrackPoint Keyboard II
  HID: lenovo: Sync Fn-lock state on button press for Compact and
    TrackPoint II keyboards
  HID: lenovo: Add note about different report numbers

 drivers/hid/hid-ids.h    |   2 +
 drivers/hid/hid-lenovo.c | 174 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 170 insertions(+), 6 deletions(-)

-- 
2.31.1

