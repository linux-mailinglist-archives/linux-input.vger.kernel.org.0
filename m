Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10B137277E
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 10:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhEDIq6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 04:46:58 -0400
Received: from mail-41104.protonmail.ch ([185.70.41.104]:35241 "EHLO
        mail-41104.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbhEDIq6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 May 2021 04:46:58 -0400
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41104.protonmail.ch (Postfix) with ESMTPS id 4FZD2d5wtSz5XGL1;
        Tue,  4 May 2021 08:46:01 +0000 (UTC)
Authentication-Results: mail-41104.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="sEuC26GT"
Date:   Tue, 04 May 2021 08:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620117957;
        bh=v1aoVMgbmZpYW/FjKNTAtyYXJi0XFRhH34LJ661TRZY=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=sEuC26GTVJrNMsITKrDwhsrC+hm1anoaEcctGoHCNCKWqmU+MgYbMjzF47fUAhNi7
         3rqmIiRGbi4zgotNS6EOsMcP88O++ng2+4VvYIZjqG6W+HLUkCmf5Wp+Mf8pHutUTc
         G7526WrxFVS03ycxTehN69h6/4l6qf4E5rMs8k6A=
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht" 
        <~postmarketos/upstreaming@lists.sr.ht>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 0/2] Input: cypress-sf - add support for Cypress Streetfighter touchkeys
Message-ID: <QwYaG_N9WhbyEiWPMqCX9XkW4fMxKGFkdJklaQnl2Wg4r3xlN7qNn6hU7Wp0LYClh5pB2xqpqsLY2mi0vcJVBNqUmzjEdNTuG2iGHGaFbo0=@protonmail.com>
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

Hi,

This patchset adds support for the Cypress StreetFighter touchkey device.
This driver is based on the driver from the vendor kernel for the Xiaomi
Mi Note 2[1][2], which is also the device where this was tested.

Best Regards,
Yassine

[1] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/scorpio-m-oss/d=
rivers/input/touchscreen/cyttsp_button.c
[2] https://github.com/MiCode/Xiaomi_Kernel_OpenSource/blob/scorpio-m-oss/a=
rch/arm/boot/dts/qcom/scorpio-msm8996-mtp.dtsi#L300-L322

Yassine Oudjana (2):
  Input: cypress-sf - Add Cypress StreetFighter touchkey driver
  dt-bindings: input: Add binding for cypress-sf

 .../devicetree/bindings/input/cypress-sf.yaml |  55 +++++
 drivers/input/keyboard/Kconfig                |  10 +
 drivers/input/keyboard/Makefile               |   1 +
 drivers/input/keyboard/cypress-sf.c           | 220 ++++++++++++++++++
 4 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml
 create mode 100644 drivers/input/keyboard/cypress-sf.c

--
2.31.1
