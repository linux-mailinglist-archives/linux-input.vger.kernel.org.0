Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347D867C2FC
	for <lists+linux-input@lfdr.de>; Thu, 26 Jan 2023 04:01:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjAZDBq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Jan 2023 22:01:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjAZDBq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Jan 2023 22:01:46 -0500
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E0785C0F0
        for <linux-input@vger.kernel.org>; Wed, 25 Jan 2023 19:01:45 -0800 (PST)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 6217FA05B;
        Wed, 25 Jan 2023 19:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1674702104; bh=e8UXZ6pW0v7LgchJlYPttdg+mRB9ry/TT7TOsHpboGc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=vpbWetzrJ74GXuhly29GNY9WOUeYTYgg16BnrY9PQVi3dcUv2yJ2FVQlaoU2I/YHA
         yroYWPOpj6y5yrEk6ZlbP41JJisRhKGi12i2i17kdPnFDiL/nRmZ+HnDOqk2TNUQa4
         ckz3Y2fNr3tGpTYzGNoPQms9maPihkOYTZ8iml+09ueJjyvwd2RoKcOgslLEe16VM4
         6MDRyMSYIoVZ9hYP0NcsOxAGjepuYRwfYbclMGOf10KicClRYsbQM60udJWVpd+NUN
         6BUYviPPOnEQX8WsO7B2hAHiefO2K2qYagEzwypx75hqmWWhmuEmyc5A/Hk/mejrn9
         J8s0dijqpcKgQ==
From:   Vicki Pfau <vi@endrift.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Lyude Paul <lyude@redhat.com>, linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>
Subject: [PATCH v2 0/2] HID: hid-steam: Add Steam Deck support
Date:   Wed, 25 Jan 2023 19:01:24 -0800
Message-Id: <20230126030126.895670-1-vi@endrift.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230111012336.2915827-2-vi@endrift.com>
References: <20230111012336.2915827-2-vi@endrift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Revised version of this patchset based on received feedback, as well as an
additional bugfix for the edge case where the driver attempts to schedule the
alread-scheduled lizard mode heartbeat, leading to a deadlock.

Vicki Pfau (2):
  HID: hid-steam: Add Steam Deck support
  HID: hid-steam: Add rumble on Deck

 drivers/hid/Kconfig     |  12 +-
 drivers/hid/hid-ids.h   |   1 +
 drivers/hid/hid-steam.c | 383 +++++++++++++++++++++++++++++++++++++---
 3 files changed, 368 insertions(+), 28 deletions(-)

-- 
2.39.1

