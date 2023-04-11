Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36CCE6DD009
	for <lists+linux-input@lfdr.de>; Tue, 11 Apr 2023 05:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229919AbjDKDRO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Apr 2023 23:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjDKDRL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Apr 2023 23:17:11 -0400
Received: from endrift.com (endrift.com [173.255.198.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37C8C2D50
        for <linux-input@vger.kernel.org>; Mon, 10 Apr 2023 20:17:04 -0700 (PDT)
Received: from nebulosa.vulpes.eutheria.net (unknown [50.47.218.115])
        by endrift.com (Postfix) with ESMTPSA id 0083DA1DA;
        Mon, 10 Apr 2023 20:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=endrift.com; s=2020;
        t=1681183023; bh=Kg7r6nkoeCZZSEFH9y2V3+4DmDIfrCW9RSKwsG9TlEw=;
        h=From:To:Cc:Subject:Date:From;
        b=ZRs36LGanmPcjSCmUbN62U6CaIvUYM/us6BSUzQqfwPMbOiPkdo1pVvSsjGhF9nKL
         o4c2ptiJ41xTer+kz06of0m60aA2iUQWcol4wlAmHpuy0HI6eB4V1lopzOrkR4UO4W
         Ow6bc0wOfntXZCQyRFJ8Dwqak4Uw8Z3HLEpXLXr9oxthuSPsDFTgAEtwe8EJRiUlqV
         xJWDI52cH7ATpNhFiMoYLJuQEHOMmztR+6k9QHlJduYiBCgRiCuEw9kpBHt4BUPq93
         KIIBOl4FztWdcMg6azl+MJ3tUv+BdxzvPUX4hupTZIHRlRF6+wnnUHRTDaptGXiFYU
         +3GqWOwyCdn5Q==
From:   Vicki Pfau <vi@endrift.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Cc:     Vicki Pfau <vi@endrift.com>, Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 0/2] Improve GIP support
Date:   Mon, 10 Apr 2023 20:16:48 -0700
Message-Id: <20230411031650.960322-1-vi@endrift.com>
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
EnWired Controller guide button" patch to make the failure soft instead of hard
as well as making sure the interface exists before trying to disable it, as
well as a further patch to add (and use) constants for the interface names,
based on information gleaned from the xone project.

Vicki Pfau (2):
  Input: xpad - Add constants for GIP interface numbers
  Input: xpad - fix PowerA EnWired Controller guide button

 drivers/input/joystick/xpad.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

-- 
2.40.0

