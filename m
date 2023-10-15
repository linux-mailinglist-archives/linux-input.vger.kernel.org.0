Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13CE37C9BB9
	for <lists+linux-input@lfdr.de>; Sun, 15 Oct 2023 23:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbjJOVME (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Oct 2023 17:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbjJOVMD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Oct 2023 17:12:03 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C4FFC1
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:00 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32db8f8441eso47108f8f.0
        for <linux-input@vger.kernel.org>; Sun, 15 Oct 2023 14:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697404319; x=1698009119; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=20S+Zi7elh7aLrsKoDUlCT3P27T+k2m0t7D2LPdB+z4=;
        b=x7okiY7YoHptuXu9jb9RX/AObiGXAc114+QJfmYVzmAXtM8U/ErZdnA1gnPGbOC3LH
         V9wxO4Jv4DoOVF0icoZSYoJB1DBcUQpf5rIOrSyH5CIzpBUXw3pW5A5eYidJ0hVcwNSO
         vVlz1s6NupOKBFe7hMOPPQtMveBqPjsfWcPtTlZMIS+7Z7zPgIaFMlERJWKem7/JJ44N
         ORy9g6C7PAwLBYR+IxGods1S3QHdsmr06VIqAHxhYg8TIpCcXvtyeUiDac517d0ESIk6
         7MVobY5pu47HR+AM/6BBQzerikqKb99DMQcVl3XAjxo2cpfwb8n3VcJQW0Pd6Y/cGjpV
         AXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697404319; x=1698009119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20S+Zi7elh7aLrsKoDUlCT3P27T+k2m0t7D2LPdB+z4=;
        b=wpWBrWViESaTCMKZZvnYI1H/96ANw0GpUlI/mpsbmur2UVl4GFjoazF1GYiKf6yInW
         yOpEBD/VrhIuG7k1gPvoC18Oto3JKZqHQx2d3Ye/7WEws+jgIvyb+AsABIFo/bX6emnX
         t9qAdR9BZ0A9+B3NCbKh1EKXBsIwAUcdd8xPAoR9MmLSofF2bzfIZakc02hUO74KFDOB
         cRG0i50oxOo5/DFX9h4iLQUyQSt19BKWn2DIhMPSTnFwQc0sP/eFO2+caX0ixfrtH6vH
         FhRw1xxFE3vSVZ/aaGanRpdcnpEN9C7jTR+fjOdtXhszcWxSmNXmsOEIADO8mg+hTY61
         /qWg==
X-Gm-Message-State: AOJu0YyTe5OHhJARa7yvgyC61xzHHg5pMTGSTfsdfDOBJyxn9r1eQWe0
        8GA3tuI6g8vYrnGchEHG/Yg/BA==
X-Google-Smtp-Source: AGHT+IECSumT2r0PCYyiqzWjZFn7oRjS8L9sFtx878rqssf+v70qpMBjCDxJrfqfDpB7/LyhAX29uA==
X-Received: by 2002:adf:a1d4:0:b0:32d:a310:cc2e with SMTP id v20-20020adfa1d4000000b0032da310cc2emr4244725wrv.34.1697404318959;
        Sun, 15 Oct 2023 14:11:58 -0700 (PDT)
Received: from lion.localdomain (host-2-99-112-229.as13285.net. [2.99.112.229])
        by smtp.gmail.com with ESMTPSA id z17-20020a5d4d11000000b0032d9548240fsm8456734wrt.82.2023.10.15.14.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 14:11:58 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
Subject: [PATCH v2 0/7] Input: synaptics-rmi4: add quirks for third party
 touchscreen controllers
Date:   Sun, 15 Oct 2023 22:11:48 +0100
Message-Id: <20230929-caleb-rmi4-quirks-v2-0-b227ac498d88@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRVLGUC/32NQQ6CMBAAv0J6ds1aVMST/zAc2rLAxtrqVoiG8
 HcrD/A4k0xmVomEKalzMSuhiRPHkEFvCuUGE3oCbjMrjbrEWtfgjCcLcuc9PEeWWwI8aoOHiuq
 TtSp31iQCKya4IZdh9D7Lh1DH73V0bTIPnF5RPut32v3sv8W0AwTnSldh2aHW7cVzMBK3UXrVL
 MvyBd72d0fIAAAA
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     methanal <baclofen@tuta.io>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Caleb Connolly <caleb.connolly@linaro.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.13-dev-46309
X-Developer-Signature: v=1; a=openpgp-sha256; l=3197;
 i=caleb.connolly@linaro.org; h=from:subject:message-id;
 bh=5rq1EpQX0MP46UWiKDEFWm1ONq98fPC9YIe92JAevoI=;
 b=owGbwMvMwCFYaeA6f6eBkTjjabUkhlSd0Llfinqybkh/rV11LJ6nbLLxh4KFgco+xi3PPb0+3
 i/Qj2bqKGVhEORgkBVTZBE/scyyae1le43tCy7AzGFlAhnCwMUpABN5L8vwP7q06tDTXvZTl1Ya
 iE8+9fzuy+406/uJRy5p/3JZlq4215zhN5uritUUkeknxNNTlpUUfWWZsMxYcG77kuS1z/yMm/L
 lzwIA
X-Developer-Key: i=caleb.connolly@linaro.org; a=openpgp;
 fpr=83B24DA7FE145076BC38BB250CD904EB673A7C47
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

With the growing popularity of running upstream Linux on mobile devices,
we're beginning to run into more and more edgecases. The OnePlus 6 is a
fairly well supported 2018 era smartphone, selling over a million units
in it's first 22 days. With this level of popularity, it's almost
inevitable that we get third party replacement displays, and as a
result, replacement touchscreen controllers.

The OnePlus 6 shipped with an extremely usecase specific touchscreen
driver, it implemented only the bare minimum parts of the highly generic
rmi4 protocol, instead hardcoding most of the register addresses.

As a result, the third party touchscreen controllers that are often
found in replacement screens, implement only the registers that the
downstream driver reads from. They additionally have other restrictions
such as heavy penalties on unaligned reads.

This series attempts to implement the necessary workaround to support
some of these chips with the rmi4 driver. Although it's worth noting
that at the time of writing there are other unofficial controllers in
the wild that don't work even with these patches.

We have been shipping these patches in postmarketOS for the last several
months, and they are known to not cause any regressions on the OnePlus
6/6T (with the official Synaptics controller), however I don't own any
other rmi4 hardware to further validate this.

These patches were contributed by a community developer who has given
permission for me to submit them on their behalf.

---
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Vincent Huang <vincent.huang@tw.synaptics.com>
Cc: methanal <baclofen@tuta.io>
Cc: linux-input@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: phone-devel@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht

---
Changes since v1:
- Improve dt-bindings patch (thanks Rob)
- Add missing cast in patch 5 to fix the pointer arithmetic
- Link to v1: https://lore.kernel.org/r/20230929-caleb-rmi4-quirks-v1-0-cc3c703f022d@linaro.org

---
Caleb Connolly (2):
      dt-bindings: input: syna,rmi4: document syna,pdt-fallback-desc
      Input: synaptics-rmi4 - handle duplicate/unknown PDT entries

methanal (5):
      Input: synaptics-rmi4 - f12: use hardcoded values for aftermarket touch ICs
      Input: synaptics-rmi4 - f55: handle zero electrode count
      Input: synaptics-rmi4 - don't do unaligned reads in IRQ context
      Input: synaptics-rmi4 - read product ID on aftermarket touch ICs
      Input: synaptics-rmi4 - support fallback values for PDT descriptor bytes

 .../devicetree/bindings/input/syna,rmi4.yaml       |  15 +++
 drivers/input/rmi4/rmi_driver.c                    | 134 ++++++++++++++++++---
 drivers/input/rmi4/rmi_driver.h                    |   8 ++
 drivers/input/rmi4/rmi_f01.c                       |  14 +++
 drivers/input/rmi4/rmi_f12.c                       | 117 ++++++++++++++----
 drivers/input/rmi4/rmi_f55.c                       |   5 +
 include/linux/rmi.h                                |   3 +
 7 files changed, 252 insertions(+), 44 deletions(-)
---
base-commit: b0d95ff7653ef6ace66a24d6c09147d0731825ce

// Caleb (they/them)

