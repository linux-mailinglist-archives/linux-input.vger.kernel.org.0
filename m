Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EC5139FED1
	for <lists+linux-input@lfdr.de>; Tue,  8 Jun 2021 20:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233407AbhFHSUC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Jun 2021 14:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232521AbhFHSUC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 8 Jun 2021 14:20:02 -0400
Received: from latitanza.investici.org (latitanza.investici.org [IPv6:2001:888:2000:56::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B6D8C061574
        for <linux-input@vger.kernel.org>; Tue,  8 Jun 2021 11:18:08 -0700 (PDT)
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 4Fzz4X3WpFzGp3d
        for <linux-input@vger.kernel.org>; Tue,  8 Jun 2021 18:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1623176284;
        bh=FA+HkISVioz3k1YtyiOLy1lEIfDBT+gUFb8UhIt6uMk=;
        h=From:To:Subject:Date:From;
        b=Dl9uWdFPWkUjNaPgKUCmuZlVW7HHD4ZfKdLSjoS9oyf0CmShkFreXsbLqCCpw37L0
         wufwW92fBNZlPG24dQlOBA8j/GiRF2Ev/Aoa8txZWdCB0TkTlIgzOXKH51nt8ib21a
         DvhNc7WNGd1CJznW1CJS0w/5BAjDKPnLRyFvp9lY=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: andrea.monaco@autistici.org) by localhost (Postfix) with ESMTPSA id 4Fzz4X2jdczGp3R
        for <linux-input@vger.kernel.org>; Tue,  8 Jun 2021 18:18:04 +0000 (UTC)
From:   "Andrea G. Monaco" <andrea.monaco@autistici.org>
To:     linux-input@vger.kernel.org
Subject: [PATCH] i2c_hid: print the full HID report descriptor when debug is on
Date:   Tue, 08 Jun 2021 20:18:03 +0200
Message-ID: <87im2ofcf8.fsf@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hello,


right now i2c_hid uses printk to dump the HID report descriptor when
debug is on. This means that only the first 64 bytes get printed, but a
typical descriptor is bigger (mine is 665 bytes).

This patch prints the whole thing.



diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 46474612e73c..4512bf1bad41 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -746,7 +746,11 @@ static int i2c_hid_parse(struct hid_device *hid)
                }
        }
 
-       i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);
+       i2c_hid_dbg(ihid, "Report Descriptor:");
+
+       if (debug)
+               print_hex_dump(KERN_DEBUG, "", DUMP_PREFIX_NONE, 32, 1, rdesc, rsize, false);
+
 
        ret = hid_parse_report(hid, rdesc, rsize);
        if (!use_override)
