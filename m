Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5926C766E
	for <lists+linux-input@lfdr.de>; Fri, 24 Mar 2023 05:05:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCXEFV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 24 Mar 2023 00:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjCXEFU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 24 Mar 2023 00:05:20 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B988E16327
        for <linux-input@vger.kernel.org>; Thu, 23 Mar 2023 21:05:18 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id D6D08A269;
        Thu, 23 Mar 2023 21:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1679630717; bh=1uTPOtpNj7+KVMKNpH9UvrbIj/S0NnXfTVk8niP1zkM=;
        h=From:To:Cc:Subject:Date:From;
        b=MD1VOJmXmMeIoZFQGLWqpUT512XljC4F8jayUNAgax4Y9uxyz+71lLumzBT7iHgrb
         F1fzjNwnQPNotRp7Ivf8EAmXiU7qHHMQLdk4CzCX09jv7lZCA9/g3VdZAAPWjljrmt
         FwmG85RBLNlKIT7wu5nhkO5E4K01O/aVT9VAhaY69vzc7WA8TFyDBKhr7QE1LL52hO
         N/GJZlqRtvulJ8N1nBB31Ux0qWu7doZ6/Q+yHYATqtpevGUglu34cppPZ+GR+8dnmz
         Ienjy7ro2YrL27houkxZDLmREZzw+PidftZZDoQvW41480C0R9FkBq7tB2PQvSpWN1
         GE64msET9XeeQ==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lyude Paul <lyude@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 0/2] Input: xpad - Additional third-party controller support
Date:   Thu, 23 Mar 2023 21:04:44 -0700
Message-Id: <20230324040446.3487725-1-vi@endrift.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This fixes some issues that came up in v1, including fixing the signed-off-by
in one patch, and properly initializing a variable that was added in another.

One of the other patches was dropped from this series as it appears to have
had a compatible version already applied, and the other patch has been
temporarily dropped pending further testing and fixes.

Pierre-Loup A. Griffais (1):
  Input: xpad - Treat Qanba controllers as Xbox360 controllers

Vicki Pfau (1):
  Input: xpad - fix support for some third-party controllers

 drivers/input/joystick/xpad.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

-- 
2.40.0

