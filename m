Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BD61FC94
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 00:35:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfEOWfR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 18:35:17 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:44583 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbfEOWfR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 18:35:17 -0400
Received: by mail-ed1-f65.google.com with SMTP id b8so1993880edm.11
        for <linux-input@vger.kernel.org>; Wed, 15 May 2019 15:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brixit-nl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/GhtiO2xljpPjlyBlulu/gGvVVN1c2y+XZMUkNyBbH8=;
        b=EuqUqi+yf+nboFvDDFDY8BKBrqg8dIW5eyDYoIGS/IIFGoyGpE6EQ2yqFG59KQOsFh
         tR7QlLFktFGeVeYKfKWhMF6ZaHrNY3gSbfgxFvKXypd7/vTyCqjTv4hnlJdEdMbstHCq
         FfAz3rgemiLFYlExh2vv6LmObAiArgATS0WmCIExcfFiV1ZmDMKkuS3c1xGP5cQggVh8
         SJgKiDaKqt2MBw/xyhgz+3W6hD+d6TaRuZGITZMb0q3pXzWBZikQbwFRzVnyvXfbDS9F
         fqeKtChJdyXrjj9xIgHxgqdFooHdU1O78kI76fP5V0mJ/4W0N2JQ91SLhkifwBTJsp7Q
         WLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/GhtiO2xljpPjlyBlulu/gGvVVN1c2y+XZMUkNyBbH8=;
        b=ayuszAY7uttjovEQ1h2QR1tHLaJd4xzCaJmLHITE+kB+8ulCWKoQqFXSSpE3KFW7G2
         Bs3rUgBoIRk/4b7Ts7cH2NT9ifIQ1TXw2staw7Z07GaBCA25+88w8Iw3aIuoo3QBMuIE
         baUYc3U/vSlGKlcJA78BtGmKDr8MPuQbwfPM4VVV/chBZp+AG3dZZONpMxQF9JkJL5NK
         1VNVYJwIdyQFQV8mig0mHKAl6h1VhOiNV6WV9tCmdDf+yep4PSQ6PLZJxQ1ieaZxWOPX
         Z5sgmWQLAqLXLHtL4cdZHBbqQJc+XSZeJYs0XskrmUnMzwrbQ4VeHEDvTgP7q0RRUTjb
         xltQ==
X-Gm-Message-State: APjAAAXrhY/TKNiXNAxiw5XABiJwZwT9gA2265wTvQ6Anr40OGmkxz/K
        BDxtFv4/mDEpiaJGkj0FoCohBQ==
X-Google-Smtp-Source: APXvYqzHCvuv/UcoQ6STbp7RB9rv51C6JDaYAajIclucnlcxduq38yWz9OhrrySK8/FvRofKAd2K2A==
X-Received: by 2002:a17:906:5e4e:: with SMTP id b14mr25337922eju.100.1557959715812;
        Wed, 15 May 2019 15:35:15 -0700 (PDT)
Received: from msi.localhost ([185.54.207.135])
        by smtp.gmail.com with ESMTPSA id a17sm1178498edt.63.2019.05.15.15.35.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 15:35:15 -0700 (PDT)
From:   Martijn Braam <martijn@brixit.nl>
To:     dmitry.torokhov@gmail.com
Cc:     m.felsch@pengutronix.de, robh@kernel.org, martijn@brixit.nl,
        linux-input@vger.kernel.org
Subject: [PATCH v2 2/2] Input: edt-ft5x06 - add vdd supply
Date:   Thu, 16 May 2019 00:34:22 +0200
Message-Id: <20190515223420.13609-2-martijn@brixit.nl>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
References: <20190515044116.ss6usdlc2yb2aqwe@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This adds the bindings for the vdd-supply property

Signed-off-by: Martijn Braam <martijn@brixit.nl>
---
 .../devicetree/bindings/input/touchscreen/edt-ft5x06.txt       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index 870b8c5cce9b..4b3e54733bc8 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -35,6 +35,8 @@ Optional properties:
  - pinctrl-0:   a phandle pointing to the pin settings for the
                 control gpios
 
+ - vdd-supply:  The controller supply
+
  - threshold:   allows setting the "click"-threshold in the range
                 from 0 to 80.
 
@@ -65,6 +67,7 @@ Example:
 	polytouch: edt-ft5x06@38 {
 		compatible = "edt,edt-ft5406", "edt,edt-ft5x06";
 		reg = <0x38>;
+		vdd-supply = <&reg_ldo_io0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&edt_ft5x06_pins>;
 		interrupt-parent = <&gpio2>;
-- 
2.21.0

