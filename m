Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB53F6CF93E
	for <lists+linux-input@lfdr.de>; Thu, 30 Mar 2023 04:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229605AbjC3CsM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 29 Mar 2023 22:48:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjC3CsL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 29 Mar 2023 22:48:11 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F424C3D
        for <linux-input@vger.kernel.org>; Wed, 29 Mar 2023 19:48:08 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id AA82AA25D;
        Wed, 29 Mar 2023 19:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1680144488; bh=ql3eidAyFZJYp8d48deprcket5s+mRRupdvRq6sqsn0=;
        h=From:To:Cc:Subject:Date:From;
        b=sVGCet4C1z+Rbn8YtIrsA5X12MBG3yY2cYM4Rpspm5D99ASO8AOj4NhmBWqhAqiee
         Q902d4R6WYl1nAS1/JgBNUgcL5dEenYQJLo8+s8V2vm/CSpRCPxkcaILEhkps/kOkp
         2O3Fr56zEkwZKvmClaNU7q0q0NMeGjdhLV+g31aVxnHXN9Hx4Pk1tOmP3efPtYG8Ji
         pOGhvHDAK1Yt/oXcr+U4GD1gUy73AlSW/GHEn1iOC0ic3wg1UrITUEthdCk4l7gwX5
         9NUbR8elhVGW5+Rw0HuvEcAKRy8VgQkCcwgVGRWBnkrj2UoyZ30igtRHQu6w8QUbAO
         yOcq2oVU1nOTA==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 0/2] Improve GIP support
Date:   Wed, 29 Mar 2023 19:47:50 -0700
Message-Id: <20230330024752.2405603-1-vi@endrift.com>
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

This series contains a new version of the previously submitted "fix PowerA
EnWired Controller guide button" patch to make the failure soft instead of
hard, as well as a further patch to add (and use) constants for the interface
names, based on information gleaned from the xone project.

Vicki Pfau (2):
  Input: xpad - Add constants for GIP interface numbers
  Input: xpad - fix PowerA EnWired Controller guide button

 drivers/input/joystick/xpad.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.40.0

