Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC965459D9F
	for <lists+linux-input@lfdr.de>; Tue, 23 Nov 2021 09:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbhKWIR7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Nov 2021 03:17:59 -0500
Received: from ip-16.mailobj.net ([213.182.54.16]:37338 "EHLO msg-6.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231434AbhKWIR7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Nov 2021 03:17:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1637655278; bh=L3gwOuixqV113BX4igcNfipaRgsiiVtU5xqE0+DeYns=;
        h=X-EA-Auth:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
         MIME-Version:Content-Transfer-Encoding;
        b=QC74dtyChdPBnQ6CBlgwIha6PVDGBkWQuGwqP0BGhuto2xpD8iMtcolRBYL2EgZlZ
         uEhgcZlMnzyO8cf0fBbktOhcFn+/owy1VgMVoqVp+WEPJw836fdr04FIXh70iFvU2M
         u/sbhJv3adG67ACkJfofjR70RLU5ZkPBUATPtbKc=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue, 23 Nov 2021 09:14:38 +0100 (CET)
X-EA-Auth: G34NyraGsEzmia/2wweUG7n7EYAl0O3BjnA22eCHRjnwlXSCPnir6kdKmZYnZ/AJQp4Ss1Xmi2vXQpZzVBwnWiAjIcePjD+/XecYBPYWBS8=
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org, stephan@gerhold.net,
        vincent.knecht@mailoo.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [RESEND PATCH 0/5] msg2638: Add support for msg2138 and key events
Date:   Tue, 23 Nov 2021 09:14:28 +0100
Message-Id: <20211123081433.2797395-1-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Resending because patch 5/5 didn't make it through smtp...

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



