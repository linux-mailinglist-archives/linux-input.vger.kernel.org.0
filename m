Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1D811BC7E
	for <lists+linux-input@lfdr.de>; Wed, 11 Dec 2019 20:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbfLKTHD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 11 Dec 2019 14:07:03 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217]:14617 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727224AbfLKTHC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 11 Dec 2019 14:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1576091220;
        s=strato-dkim-0002; d=gerhold.net;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=vnCZ1JwFpfUlpBrhMmMi5eGuLHhdCSYvuvmmfW1o1H4=;
        b=Ll74oJ+e5mqpt8tlsAkwK9Nc39SITa8GkF6eZuhnp7xpCg4CLoG/yKdEhXrnhrl26x
        7VI8J886StdfId11kaHOJBSon2yunvajuFlMxikhfe3PE+qc/SwzNhjBqoe1ogyTT6rz
        KmX5EnVxeffkPWHqsyomqG0+oz51WhikNIuCtZvHHktq/ApxjUbT/Ar0z7KDNsDzgtxY
        +/PPCWdwFRoQb9nTLKW7A5iHSZOVntwTz2stQL7DB5NA6aGieOtDFQGLuXXanlk6zo4T
        0OpWdGokG/usDVGdNfqb9q1uThnTJxF7C807phmG7WZ6UtLR7gAw5/GjiLpPRQH73C1o
        ezSQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQrEOHTIXtc/vtBNY3Q=="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.0.2 AUTH)
        with ESMTPSA id R01a59vBBJ0roiQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 11 Dec 2019 20:00:53 +0100 (CET)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH] Input: pm8xxx-vib - fix handling of separate enable register
Date:   Wed, 11 Dec 2019 20:00:26 +0100
Message-Id: <20191211190026.52662-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.0
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
 drivers/input/misc/pm8xxx-vibrator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/pm8xxx-vibrator.c b/drivers/input/misc/pm8xxx-vibrator.c
index ecd762f93732..8dc345604a4d 100644
--- a/drivers/input/misc/pm8xxx-vibrator.c
+++ b/drivers/input/misc/pm8xxx-vibrator.c
@@ -90,7 +90,8 @@ static int pm8xxx_vib_set(struct pm8xxx_vib *vib, bool on)
 
 	if (regs->enable_mask)
 		rc = regmap_update_bits(vib->regmap, regs->enable_addr,
-					on ? regs->enable_mask : 0, val);
+					regs->enable_mask,
+					on ? regs->enable_mask : 0);
 
 	return rc;
 }
-- 
2.24.0

