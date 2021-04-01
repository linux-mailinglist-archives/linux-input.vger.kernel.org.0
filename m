Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F34F9352331
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 01:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234477AbhDAXLI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 1 Apr 2021 19:11:08 -0400
Received: from smtpcmd0872.aruba.it ([62.149.156.72]:37553 "EHLO
        smtpcmd0872.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233974AbhDAXLI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 1 Apr 2021 19:11:08 -0400
Received: from ubuntu.localdomain ([146.241.168.220])
        by Aruba Outgoing Smtp  with ESMTPSA
        id S6M3lCwpyHTbyS6M7lYQzE; Fri, 02 Apr 2021 01:04:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1617318243; bh=ujCT2OrmhFFsQ+QRAxA1TXp0Zz2ZjE4Extd72MdRHE4=;
        h=From:To:Subject:Date:MIME-Version:Content-Type;
        b=LC9YrSIPyGkZLvN/hJUYmGNQnn2JuZ98PE9YVL3GYMUD1Tsb7Wv8GzuM26R542SPv
         2taQTMoCc4eJLhzKcdSTVpCddGNvYCoB7ka1r7eUso4TcUxB+SuKLJXVWBIlppFMGv
         TskgjnM0EGeUHHMk45CSfVdIPaVktul/UJpPy9K32fwe3kqbnqRPMzSyRBKtS8Eqd0
         rcWmi7MhV9wUzb3GFrko2oPIll/jRu8tCsBKfhxFyVBZmF55jVQMWvyBHfcRlguZ4+
         qatZN/bUBoKwLp4nnOQwOnh6XRo/rdX13kIUshGS1xQkuAB+sY5mZb2NIKR+y2vs9h
         REvSuOvkBO0DA==
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Subject: [PATCH v2 1/3] dt-bindings: Add Hycon Technology vendor prefix
Date:   Fri,  2 Apr 2021 01:03:56 +0200
Message-Id: <20210401230358.2468618-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
References: <20210306194120.GA1075725@robh.at.kernel.org>
 <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfPI8q7PPoHuBDgszldsBC5l9QWtjpHgziZZ1oWL1Y9aBJ20ZKCIUKdHeRe79gH5oD6k8FsKtkxgfdm4z78hGgGVmZbp1Pyi+pFK9n1uxnAZCXgMyiDGL
 y8XyeRFDZtcLpfKdph5QT97mJ5tL0bb8GXGSo7tp3K3EYvJ+KNNlBDJyCVd6CjYorM2skEFfTy/msuDZCNmFPyfT7ITKzU4gLD5F3XiFmEv8z602R0NsRYAe
 tmZ+CV49iR7SwFbePU/qxi9ppPC1N0GZS3c5+Bl3MkKjnnWfn/ha6hCp9vc3q3MiQ8eCLWWWGipH06ZxSu25vksYdei8VxyzgMdGi2Ivxs7PXaIY4RmdJ9Ug
 RwfybKcYQ+seh+fEuCTLq4Uhs7hQ1xYmENAZWuswrmZ7bCKG4X3FMWQFmm0tkw+lIKzfmh5tuTLVqpndVja1rEB/03gohibKpeE8hgMNksboh8OJFrPSCSw9
 Zy8b/R+T+aXkQfg8
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "hycon" as a vendor prefix for "Hycon Technology".
Company website: https://www.hycontek.com/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* updated http:// to https:// in commit log as suggested by Jonathan Neuschäfer
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

