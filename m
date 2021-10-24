Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0244389A4
	for <lists+linux-input@lfdr.de>; Sun, 24 Oct 2021 17:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbhJXPKb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 24 Oct 2021 11:10:31 -0400
Received: from smtp-32-i2.italiaonline.it ([213.209.12.32]:48134 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231678AbhJXPKa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 24 Oct 2021 11:10:30 -0400
X-Greylist: delayed 429 seconds by postgrey-1.27 at vger.kernel.org; Sun, 24 Oct 2021 11:10:27 EDT
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([213.45.67.127])
        by smtp-32.iol.local with ESMTPA
        id eeyWmj6mkdfuoeeybmWXwR; Sun, 24 Oct 2021 16:59:57 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1635087597; bh=5cQItZFlPLSWjbLUBhR1OrUoG0HfywhVMmQfcpeIMjE=;
        h=From;
        b=Qf6eBioBYWmj+fGuwHkwnHOsSfb3VHwWy7eH18sngON5XbVbnrpi8v6Q9WzKB2ypB
         FOWSO5aePHHUwQOUjAMjCzEl5nKbg58i6hvTnpozbvw/tCmdeU8pwWAOYzHQmPdQPI
         9XC90VCuV+8PxflJFZ6J3jOYm1sQZtPuoygrbep1qSPG1Wyd5xU47YA4FvPzrUGH2/
         QwD11cY6QE2519uuZdlTvvY3fWb1YOFmNNislZjmA+PnfqRKE4JmfCDncValYkw5OS
         mLYZQaABYBZYZcLwiFz4WnCj58X2F7r+KP0NTpAM0qdsUMNv9cbGJw1sGupBIjFLvr
         6ea1jVtZ/reWA==
X-CNFS-Analysis: v=2.4 cv=IrzbzJzg c=1 sm=1 tr=0 ts=617574ed cx=a_exe
 a=Vk63IOK+/LoQucGDvce7tA==:117 a=Vk63IOK+/LoQucGDvce7tA==:17
 a=Lf7JvCFZlXs7EqoJDM0A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rachna Patil <rachna@ti.com>, linux-input@vger.kernel.org
Subject: [PATCH 1/6] input: ti_am335x_tsc: set ADCREFM for X configuration
Date:   Sun, 24 Oct 2021 16:59:25 +0200
Message-Id: <20211024145931.1916-2-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211024145931.1916-1-dariobin@libero.it>
References: <20211024145931.1916-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfJVeqVN0AJ9sz/vFjjQaGJ37dfpFQCvJnhuDEu4E4nuGWWR6zPKD47ndH1qfSsrLKgzfV0wY9nDG7jJQuJmyaywDuhc9j+41/KyjXI0rVAYQWCNhrjAK
 rCh+8NWps6g2wM6od2LNZIB0uI0SVXbOlTZbsxshkIWKH7xKX9qA37PInpJhEmVElm5ZontQKPR2eKl1Ayq/uCBtbXhxbxRI49YpXpX2UKuw05ao0GLvj5Dt
 QEfhw28+xj7eM72QR9m67QfbcdeYitSwSc34AAXu9lGXJNi1ChJsc/tdHOHF0+i4S9bvSkubfDNBboWZpdJATMBG76jSPozpON4Lvm6cEGpignkHLi5vpPJR
 Em8gtQclhtgYNRejlke9+TPK8iQ4Ww==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

As reported by the STEPCONFIG[1-16] registered field descriptions of the
TI reference manual, for the ADC "in single ended, SEL_INM_SWC_3_0 must
be 1xxx".

Unlike the Y and Z coordinates, this bit has not been set for the step
configuration registers used to sample the X coordinate.

Fixes: 1b8be32e691 ("Input: add support for TI Touchscreen controller")
Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/input/touchscreen/ti_am335x_tsc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 83e685557a19..fd3ffdd23470 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -131,7 +131,8 @@ static void titsc_step_config(struct titsc *ts_dev)
 	u32 stepenable;
 
 	config = STEPCONFIG_MODE_HWSYNC |
-			STEPCONFIG_AVG_16 | ts_dev->bit_xp;
+			STEPCONFIG_AVG_16 | ts_dev->bit_xp |
+			STEPCONFIG_INM_ADCREFM;
 	switch (ts_dev->wires) {
 	case 4:
 		config |= STEPCONFIG_INP(ts_dev->inp_yp) | ts_dev->bit_xn;
-- 
2.17.1

