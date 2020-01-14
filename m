Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30A1113B23C
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 19:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgANSkJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 13:40:09 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:33898 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726053AbgANSkJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 13:40:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579027207;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=mYuDdY7+V7q0aGXGzV5KWOWo9ghzK4i+Cs2P566NUhM=;
        b=Kf/iaNGg1BEr3aU867wos6TlXmiQVuC3RWV75nv8M+KbOUzL74qffKvgjqqpnUl1ub
        eBqewr8ogGfgd4gZEwJjyUH6dmzWlV15reM+lgeLxwM8mS4R8QK1RKTWXZrkn4AHYyuy
        JnrSYbD6WYYdr8z7mabG0Wm3zttyzqM+AP8LiN9G/1CskYdURFZT/CRnwZFfnRLfMnyw
        LDB3J4I68gqh/k3IBxXwUDii/pQ5ZtKkLM/Dh7s2G7myYg/dn9Z08zAzEgMM23peOCcq
        OMpYjeZJuDBXqDVuvGfJ3HdSZHNNF57iNCe4ZOraPsNeeCjNctWwaEHxSq3vGSfHATnk
        S/0Q==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.1.4 AUTH)
        with ESMTPSA id h048a6w0EIb6Xrc
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 14 Jan 2020 19:37:06 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v2] Input: pm8xxx-vib - fix handling of separate enable register
Date:   Tue, 14 Jan 2020 19:34:42 +0100
Message-Id: <20200114183442.45720-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Setting the vibrator enable_mask is not implemented correctly:

For regmap_update_bits(map, reg, mask, val) we give in either
regs->enable_mask or 0 (= no-op) as mask and "val" as value.
But "val" actually refers to the vibrator voltage control register,
which has nothing to do with the enable_mask.

So we usually end up doing nothing when we really wanted
to enable the vibrator.

We want to set or clear the enable_mask (to enable/disable the vibrator).
Therefore, change the call to always modify the enable_mask
and set the bits only if we want to enable the vibrator.

Cc: Damien Riegel <damien.riegel@savoirfairelinux.com>
Fixes: d4c7c5c96c92 ("Input: pm8xxx-vib - handle separate enable register")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
v1: https://patchwork.kernel.org/patch/11286073/
Changes in v2:
 - Changed regmap_update_bits(..., regs->enable_mask, on ? regs->enable_mask : 0)
   to regmap_update_bits(..., regs->enable_mask, on ? ~0 : 0)
     (suggested by Dmitry Torokhov)
---
 drivers/input/misc/pm8xxx-vibrator.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index ecd762f93732..53ad25eaf1a2 100644
--- a/drivers/input/misc/pm8xxx-vibrator.c
+++ b/drivers/input/misc/pm8xxx-vibrator.c
@@ -90,7 +90,7 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 
 	if (regs->enable_mask)
 		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
-					on ? regs->enable_mask : 0, val);
+					regs->enable_mask, on ? ~0 : 0);
 
 	return rc;
 }
-- 
2.24.1

