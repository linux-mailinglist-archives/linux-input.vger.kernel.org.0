Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46FB43FE06E
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 18:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344737AbhIAQyH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 12:54:07 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:40284 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344631AbhIAQyC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 12:54:02 -0400
Date:   Wed, 01 Sep 2021 16:52:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630515179;
        bh=gt/cf6/XfcH/698kF86Uqsw0P7cStjMWQEnDsNGVdjI=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=O7naTcCmTTy1J+CUwMWFfRf+vufMPpWjRxudvOdVNN1yZrMbfFDektMJvI9jheArC
         pkZDZ48pwxgflKKibqsAIAusmcWbZsL3rOZT0JhwguvhRqimg59/F5+/0rPQix9MRj
         xFkaTwrckadigA1Inj48rmoExNVMntpNfCBsiQv0=
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH v3 0/2] Input: cypress-sf - Add support for Cypress Streetfighter touchkeys
Message-ID: <20210901165231.236728-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset adds support for Cypress StreetFighter touchkeys.

Due to lack of documentation, this driver is entirely based on information
gathered from a driver written for an old Android kernel fork[1][2].

[1] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage=
-18.1/drivers/input/touchscreen/cyttsp_button.c
[2] https://github.com/LineageOS/android_kernel_xiaomi_msm8996/blob/lineage=
-18.1/arch/arm/boot/dts/qcom/a4-msm8996-mtp.dtsi#L291-L314

Changes since v2:
 - Code style fixes.
 - Added copyright statement.
Changes since v1:
 - Changed version variables in probe to int to allow storing error codes.
 - Fixed some issues in dt binding.
=20
Yassine Oudjana (2):
  Input: cypress-sf - Add Cypress StreetFighter touchkey driver
  dt-bindings: input: Add binding for cypress-sf

 .../devicetree/bindings/input/cypress-sf.yaml |  61 +++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/cypress-sf.c           | 223 ++++++++++++++++++
 4 files changed, 295 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml
 create mode 100644 drivers/input/keyboard/cypress-sf.c

--=20
2.33.0


