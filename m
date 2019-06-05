Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 875C635D16
	for <lists+linux-input@lfdr.de>; Wed,  5 Jun 2019 14:44:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbfFEMoZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 08:44:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50162 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727792AbfFEMoZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 Jun 2019 08:44:25 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 09D72309C38E;
        Wed,  5 Jun 2019 12:44:25 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-116-164.ams2.redhat.com [10.36.116.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D635D60CD6;
        Wed,  5 Jun 2019 12:44:18 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 0/4] few reverts and fixes for 5.2
Date:   Wed,  5 Jun 2019 14:44:04 +0200
Message-Id: <20190605124408.8637-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 05 Jun 2019 12:44:25 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This has been already publicly discussed here, so I am just posting
for completeness.

patch 1:
request to revert it:
https://patchwork.kernel.org/patch/10844177/#22651385

patch 2&3:
related thread:
https://lkml.org/lkml/2019/5/28/778

patch 4:
bug link: https://bugzilla.kernel.org/show_bug.cgi?id=203619
and related thread: https://lkml.org/lkml/2019/5/28/778

Cheers,
Benjamin

Benjamin Tissoires (3):
  Revert "HID: Increase maximum report size allowed by
    hid_field_extract()"
  Revert "HID: core: Do not call request_module() in async context"
  Revert "HID: core: Call request_module before doing device_add"

Hans de Goede (1):
  HID: logitech-dj: Fix 064d:c52f receiver support

 drivers/hid/hid-core.c        | 16 +++----------
 drivers/hid/hid-logitech-dj.c | 42 ++++++++++++++++++++++-------------
 2 files changed, 30 insertions(+), 28 deletions(-)

-- 
2.19.2

