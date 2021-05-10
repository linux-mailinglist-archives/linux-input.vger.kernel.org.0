Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35AAB379808
	for <lists+linux-input@lfdr.de>; Mon, 10 May 2021 21:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhEJTyn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 May 2021 15:54:43 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:33021 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhEJTym (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 May 2021 15:54:42 -0400
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 May 2021 15:54:42 EDT
ARC-Seal: i=1; a=rsa-sha256; t=1620675691; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=E3s379Pcz6m5c2eiCFYn6tEydRwo1kChePN2SK7CLBYxpiqUQ+SPo/XubMdGIEEtG2
    fKo0facaVgOIq6DasmBGubbdvoQh+npKb5VVBuirbrvo4PqK49LCWLx2hYzn9m+YNayQ
    lMNK2GNB9dD9LIfKBEjqPRO3gQpkfb1hteCFdcF2fAvAoGPkTtEacPEYuPckrNylZ6sD
    zCdbnPKTsdWJzJ8FjExYvOH3Nv4YGpnbZ7fLti9s/U7Ya6XfQuvq53v5C1dt6IDkyEq3
    m0G29UJ2sRu7P4df0YYlIAtTAglU5AUAs6M1xVLX6iE5k1ylE820K04nxJ8GZU/4uis8
    zZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620675691;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TFB/5G3yt0EOH3u0v6krrpts7AKC5aDuRVy+pogaHus=;
    b=RdgNd6Jn3V2ZivOkVQudSfoH/IgtOAJ9uZZ4jvnE6r7GJAOglwV3OjgS8hY039cC61
    rkCHeohztSzweqlLQ0C1r94ZjYcSTI4/SZNkB7DVgPnL1tjv1Z7IZeWZQ9dqb4GwPosl
    PHCuL+rvllVjZN3q3L2QdrKBat0sVN0+jDvtL2/4Mc+jwXE+7q1oE1SPKkiTJaxGjCSl
    bn/yhFzXWMf3zRtez6vpAqlFFy18oDnU3zPiXWdAo9+TMkML9h2otcvUlbxyNEaL7KGM
    IzTkm7a/7/gloM62cjZ3qZox4Ho2N3Q9GWtBfn0O+Y3yRjVLk5VVUs1T7InqZTPEM/oB
    80uQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620675691;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=TFB/5G3yt0EOH3u0v6krrpts7AKC5aDuRVy+pogaHus=;
    b=RFsAC6sTPN1zdGGwH3v5IWIgBcQ44/UPgqgq+PTPGclYDWGVO7+LKW2zurhHLsxcVW
    sJoWaiSdCRY5eQ3EFvTpubCP06UP7L9w5q6NLFuQb0Md/r3TNKLas4HwUOtU6o0jA/Th
    oz2DywczDAiWZyk15lEuoDYqTak8X6dWcdkhIudNHWIRGKB7ZuN3+sLntCJSTQ4gqIgD
    4mZ6fBYv3qg0yRlX1CexxwNIm8U4nRnR/cgLoT3nO2r47ZsjC7NXSwnISGdErg5tacL1
    wAA4P0/xL5tfKH1ReyJsd6ObuF3PEfxDUwUe5cb64cOwgpf91JdRo+q3suO77lQh30X5
    Y0Ow==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB5m6NCQEo"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.25.6 DYNA|AUTH)
    with ESMTPSA id e01f26x4AJfTYUH
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 10 May 2021 21:41:29 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Simon Budig <simon.budig@kernelconcepts.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Ondrej Jirman <megous@megous.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: input: touchscreen: edt-ft5x06: add iovcc-supply
Date:   Mon, 10 May 2021 21:31:07 +0200
Message-Id: <20210510193108.50178-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

At the moment, the edt-ft5x06 driver can control a single regulator
("vcc"). However, some FocalTech touch controllers have an additional
IOVCC pin that should be supplied with the digital I/O voltage.

The I/O voltage might be provided by another regulator that should also
be kept on. Otherwise, the touchscreen can randomly stop functioning if
the regulator is turned off because no other components still require it.

Document (optional) support for controlling the regulator for IOVCC
using "iovcc-supply".

Cc: Ondrej Jirman <megous@megous.com>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Changes in v2: None, added Rob's Acked-by
v1: https://lore.kernel.org/linux-input/20210108192337.563679-1-stephan@gerhold.net/
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
index bfc3a8b5e118..2e8da7470513 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.yaml
@@ -56,6 +56,7 @@ properties:
   wakeup-source: true
 
   vcc-supply: true
+  iovcc-supply: true
 
   gain:
     description: Allows setting the sensitivity in the range from 0 to 31.
-- 
2.31.1

