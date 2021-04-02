Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166CD352D94
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 18:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234717AbhDBQQh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 12:16:37 -0400
Received: from smtpcmd12131.aruba.it ([62.149.156.131]:40116 "EHLO
        smtpcmd12131.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234361AbhDBQQg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Apr 2021 12:16:36 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id SMTElkkEVik8wSMTKlXAQE; Fri, 02 Apr 2021 18:16:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617380194; bh=xxeajgw0ir1PuW9+0dUhy7xSrZePZNoFQ9DaDtfNkgI=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=YNin0CdznvD+jzeypp8yzU7Lud5lKcTKUnSeQrdnLw6Oqplogq1f1Gn6j2fizglaF
         pgNfpvIr36Cv2ZUI/+TLtPfPRjEG886REvTs0b6lVYp/7qSiCiBnd3IcoL18yE8DG0
         /87vW7RhmmZlFIhkRgNzIJ4JPDEQBRQ0C1wPQi3Nekag3HxgT77g2JJDpQx4ECsjZp
         eve5L7V2WUThe3XaegoAme7Wo57w1yHU9S4uoO1kooYBpHehNKk+/8Dj1w1aPWqSSx
         gnp1q/RVhD30CUw9ctiY7CNQSf9/1yH/Bu/cP0+h9vmogf75kQFuwWVOTksX6spuqp
         BVZQLpZE1j3cg==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Subject: [PATCH v3 1/3] dt-bindings: Add Hycon Technology vendor prefix
Date:   Fri,  2 Apr 2021 18:16:25 +0200
Message-Id: <20210402161627.2546145-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
References: <YGbc7Qbu6s659Mx4@latitude>
 <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAn22ZS6640d6wQU0xrLwtdcW2w0XJWRg6Hs7GkbH8TubKuFKt8xogcjquEDySuKr8IIvqh/w5/MZ4qUw9klDEvbxluHQUZp5P50C49C6EprEmIxGUlD
 TrBvIhc0px3O19edTVJSAM2ZYpapyOW8jefEbGi5soDQCeJbn6NS8vr0wHlNvqhyJdjo5Dz/Vj4p9sNnMyKWBrrVR+MyNnBw1VeEJZDjPDhQqefDouVuNJBc
 7CCbFVPrvUmsKm6Wf4hq/nvJMNmUh3AnNwdD4fg9nNm5tg1YB4CptmiQQZUeMTehr0xglo1K37ICnoN7XYxsDuyZjl/MKe7Z+twS+ylBj1hUcyd+ZPOGdr6B
 Swbu7AHzgNu1nlhBoBMQq57Thf1yeJ4w0asjuvYd5ciPOH1IhzznxLpJhhTa3itXppYOkI/EpCzqNld1h/xLWuUW5FoBzhUFh1pBb67oE7ks0QxiTSd10tdz
 goz8BkziJDDtIPCYe1FfnVMu7wK8uRpTuJcRLg==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "hycon" as a vendor prefix for "Hycon Technology".
Company website: https://www.hycontek.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1312637d6ff..67f429a757cd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -489,6 +489,8 @@ patternProperties:
     description: Shenzhen Hugsun Technology Co. Ltd.
   "^hwacom,.*":
     description: HwaCom Systems Inc.
+  "^hycon,.*":
+    description: Hycon Technology Corp.
   "^hydis,.*":
     description: Hydis Technologies
   "^hyundai,.*":
-- 
2.25.1

