Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BABAC2E7247
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 17:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726214AbgL2Q0r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 11:26:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgL2Q0q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 11:26:46 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E1FC061793
        for <linux-input@vger.kernel.org>; Tue, 29 Dec 2020 08:26:06 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id AGS4240094C55Sk01GS4Cp; Tue, 29 Dec 2020 17:26:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHox-0014bC-D4; Tue, 29 Dec 2020 17:26:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kuHow-0092Vs-Kd; Tue, 29 Dec 2020 17:26:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andrej Valek <andrej.valek@siemens.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-input@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] Input: st1232 - fixes for resolution reading
Date:   Tue, 29 Dec 2020 17:25:58 +0100
Message-Id: <20201229162601.2154566-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

	Hi Dmitry, Andrej,

The recent commit 3a54a215410b1650 ("Input: st1232 - add support
resolution reading") broke probing of the st1232 touchscreen on
r8a7740/armadillo:

    st1232-ts 1-0055: Failed to read resolution: -6

Upon investigation, this turned out to be a little bit more complicated
than expected, hence I wrote not one but three fixes.

Thanks for your comments!

Geert Uytterhoeven (3):
  Input: st1232 - fix off-by-one error in resolution handling
  Input: st1232 - do not read more bytes than needed
  Input: st1232 - wait until device is ready before reading resolution

 drivers/input/touchscreen/st1232.c | 48 ++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 6 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
