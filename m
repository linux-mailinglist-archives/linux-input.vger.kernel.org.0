Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E259E459D07
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 08:47:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234392AbhKWHu0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 02:50:26 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:59250 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234316AbhKWHuZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 02:50:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1637652360; bh=rModu+wbMlQDAbZmFSIwfKTjsITpKH4SCxpIq/CXGuw=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=WkUPk79tH829t0ieXI5v5Q0CiKXl4Vj1B3n/5yN58Uq5gfxUTiVKueIDT2GICYLsW
         hweLdG/6IoUnB+t7W0cyCBhcGeuj0PS1sPZxMSxdNSm+vZqwbMVHniXUt2xD+49BdV
         uon14xK71OEo3+tariIh4zwo716CLc4iqSQ3C8bM=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue, 23 Nov 2021 08:25:59 +0100 (CET)
X-EA-Auth: yzdNSTojDeVBVM26MCmibOJGejoBqxXJsf1ErxVWxR0c4aYTep5DFS/8qXa7sOd6OspN+TBlFatpFqBgIMIGkiFqljEWoewhl90Ub61/ljs=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        vincent.knecht@mailoo.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/5] msg2638: Add support for msg2138 and key events
Date:   Tue, 23 Nov 2021 08:25:29 +0100
Message-Id: <20211123072534.2775264-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series:
- moves max fingers number and irqhandler settings in a struct
- adds support for msg2138 touchscreen
- adds support for buttons, which were only seen with msg2138 as of yet

Big thanks to Stephan Gerhold <stephan@gerhold.net> for the help with
deciphering the downstream driver [1] and writing clean and working code.

[1] https://github.com/LineageOS/android_kernel_huawei_msm8916/blob/2f24fa58086a969687434b40f237cb589a1f324f/drivers/input/touchscreen/mstar/msg2138_qc.c

Vincent Knecht (5):
  Input: msg2638 - Set max finger number and irqhandler from driver data
  dt-bindings: input: touchscreen: msg2638: Document msg2138 support
  Input: msg2638 - Add support for msg2138
  dt-bindings: input: touchscreen: msg2638: Document keys support
  Input: msg2638 - Add support for msg2138 key events

 .../input/touchscreen/mstar,msg2638.yaml      |   8 +-
 drivers/input/touchscreen/msg2638.c           | 182 ++++++++++++++++--
 2 files changed, 175 insertions(+), 15 deletions(-)

-- 
2.31.1



