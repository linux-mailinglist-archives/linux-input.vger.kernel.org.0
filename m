Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22C18357380
	for <lists+linux-input@lfdr.de>; Wed,  7 Apr 2021 19:49:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348438AbhDGRtY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Apr 2021 13:49:24 -0400
Received: from smtpcmd11117.aruba.it ([62.149.156.117]:48398 "EHLO
        smtpcmd11117.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355000AbhDGRtX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Apr 2021 13:49:23 -0400
Received: from ubuntu.localdomain ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPSA
        id UCIflJuxlkeOqUCIgl3jFv; Wed, 07 Apr 2021 19:49:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617817751; bh=xxeajgw0ir1PuW9+0dUhy7xSrZePZNoFQ9DaDtfNkgI=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=iN7oQXTFabtOR6k/yhY9224AceSQEM4fvRc++qbJ7TGVTyeIN9mOQNmZR4zjy0ixn
         bjAPONThFVwVy2lIMe6+iOzqHNr/ObWEZC9x1Rqd2xl2SRo5/90L0n0v+a0qXyfskW
         KvITmTCC8vUDe3OJAeTThEA8dbFv0l3vb2JYWyJmUrVvc+h6bWzhWGwffuvrFDsVLG
         UqD0UbNGGdmMG1f/lU64Thk5KqdLNxJ0Dn1UBtZhNjM4Sk3NYofEMmvNNpply8yfeH
         Gr2fRuptY52DWXDTau+enMUB/otqI38jzmwxrWgDPFAZylU/CZiOMaGXOGdafpZNIM
         644iqPqPkXwVQ==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: [PATCH v4 1/3] dt-bindings: Add Hycon Technology vendor prefix
Date:   Wed,  7 Apr 2021 19:49:07 +0200
Message-Id: <20210407174909.1475150-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
References: <YGxkB6icZSJfx/VB@latitude>
 <20210407174909.1475150-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfAV4WZ3IVi/2R8QQoP/HrPt9htOZGOtbFBA6uhq6im6YM0s6uUUDrluWT7AqcIwljssCeU6trZhD1SONBLqGqVaazkXc7g4At3kEkGg50SUO5ADppIi4
 mJIgyP76/ot78crzmTjFRzCxhYk0JpOlSZfAcWlc99UlRc76i9BddA7TgCYa+J5OKhEfeG4Pht7/M6T7Yb6eDNeoUQrsFUMMPaLvwbrwtf5T3JykJw+HRwWW
 G45ty56YEB7SMPBJ/8ND/0z6BWG99Wf14D0e+EMCavJY/pxquVYoV8fvNVnhuGkHj17fOe5h4nhPSMfu/Yb/ZURmbL4qdH5my0VbCnOh6ocDzjGtZ5xVizMW
 uLZ6wBxjjJq4hIXMTpfQ6Jpvi/h5XsswqId0kCAxrDf5HYVK1BvBOpFrEXg6cBAwOzYSjIU9o6nJnka4n1serStUq3/T3qxZuvE+MzuH6yxDd2GZA37q1CMh
 FWcV92KvUaSJJ2Yr
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

