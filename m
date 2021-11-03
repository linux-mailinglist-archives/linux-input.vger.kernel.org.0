Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9F344440BF
	for <lists+linux-input@lfdr.de>; Wed,  3 Nov 2021 12:48:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231623AbhKCLvO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Nov 2021 07:51:14 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:49623 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230250AbhKCLvO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Nov 2021 07:51:14 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8B3B558073B;
        Wed,  3 Nov 2021 07:48:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 03 Nov 2021 07:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=from:to:cc:subject:date:message-id:mime-version:content-type
        :content-transfer-encoding; s=fm2; bh=vvUrm34c7dv+UGdvIdwJr40CsJ
        T6cIMI3th4q8bRplw=; b=Xfa5wpxrG/xs5eGRA4vWurwqyAp77CPa+CICSSmwIt
        HMS3KYMY1sxVdFrKRA+xN73WuGu7u6/2BqHSOXjMjj6tDQ2+Z8n2qa5D38oIFw2E
        1Gg8jfpZw+i3ruu3yY4HwvoxH2ozpm07lYa3KpP4NSUOc/Dgh1lTzzZh9fRSvR7K
        IQJHsv2hy1KCMXPouRwgrX08BhEyekXjtRLE6vdG7raq5MGEaH1Ku10naD7vHJ/8
        FcKX3upoqIau4PG60uXuHQSFrSAvpPK35JXoYtTxLzOeqIxkaWnNH0hxhYY6W+yd
        isppuC8GK/HCf6s8lscTSmqKQ2UkA8G5LdnTKGu8A7bQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:message-id:mime-version:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=vvUrm3
        4c7dv+UGdvIdwJr40CsJT6cIMI3th4q8bRplw=; b=j03UfstXNUCEur7gSvZAX9
        Brg4j+Gk+ctxHbruLexKyrKraWE9z9mlRJMblI4uqLQMtlIy/7kkoxN7xkoRHT06
        S7MKr4xOMz98N516jWwNmN1il06HwFS0JitsFZFlvk1K0Df5SpN7IReVvwtOtIha
        Kxonp5vJZWf6RzUgPEKSTpOHSmBo+SQjVehI8jFwVzKJ5/cOSFJ1Nl+7Il9NHT77
        pUCtEGMYQwZAUlKkzzrkm02iMqhtBgDh0P8H3tZIGCQTzE+doq2EpL0tP/WLozmL
        ALQ7Y5sViWMHmknbLuZj/mM87PpPs9FtGaanqFOLSN3Br+R+xejHkaSBiJS4+JsQ
        ==
X-ME-Sender: <xms:FXeCYYlrU-uuzNniTeOSz6IfzeCr99HA0IBxBZ7_BomRfYJfH-tE7g>
    <xme:FXeCYX37Y11kgIHTpq9UvVl68rXQLZKH5KTK5rhH9virBjR39EDGzIrRv98LB0N54
    GCJecn8vlvTlg0kNZg>
X-ME-Received: <xmr:FXeCYWq6IMwP2puzXvWy_9Uvn2MQCMXijk0hotra0guEjGWR0xvJJ6NIQNzIU3J1GlmHx3-voo0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtddvgdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffogggtgfesthhqredtre
    dtjeenucfhrhhomheptehlihhsthgrihhrucfhrhgrnhgtihhsuceorghlihhsthgrihhr
    segrlhhishhtrghirhdvfedrmhgvqeenucggtffrrghtthgvrhhnpeffledvgeevfeevfe
    dvvdffieetfefgjeevgeeitefhkeeghfelueekhfejheffgfenucffohhmrghinheplhif
    nhdrnhgvthdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgv
X-ME-Proxy: <xmx:FXeCYUkHBlw55K_H1Nfn--ndtfQWGSxDs1madQ0cXIqJRfvDZmEKrg>
    <xmx:FXeCYW10rNqd9eNvW9OVAQwB4yGWYkDhFlL33bPn-_1J7JZruhcrvQ>
    <xmx:FXeCYbscamcHIOIRWG6LKPMMby4lGj--WIQAlsE1L1Q3xmTil8cpfQ>
    <xmx:FXeCYfv7fBB2Wuigwbiap8Y73oUHJa4FlsTTxqagc4n9p45KIHiLQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Nov 2021 07:48:32 -0400 (EDT)
From:   Alistair Francis <alistair@alistair23.me>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        andreas@kemnade.info, rydberg@bitmath.org,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com, Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v2 0/4] Add support for the Cypress cyttsp5
Date:   Wed,  3 Nov 2021 21:48:26 +1000
Message-Id: <20211103114830.62711-1-alistair@alistair23.me>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series builds on top of [1] and adds support for the cyttsp5=0D
touchscreen controller for the reMarkable 2.=0D
=0D
I first tried to add an I2C HID device. Although the cyttsp5 has some HID=0D
looking aspects it is not HID compatible. Just in trying to probe the devic=
e=0D
I found:=0D
 - The HID descriptor has extra padding=0D
 - The HID descriptor sets the high bytes of the descriptor length=0D
 - The HID descriptor has extra unrecognised tags=0D
 - The HID reset command doesn't appear to work=0D
=0D
I don't think there is a way to use the I2C HID framework with the cyttsp5.=
=0D
For anyone interested you can see the work here [2]. In that branch though =
I=0D
can only obtain a HID descriptor, nothing else works without more core=0D
changes.=0D
=0D
So instead I rebased the series from [1]. Converted to the new yaml DTS=0D
documentation, added regulator support and fixed a x/y miscalculation bug.=
=0D
=0D
1: https://lwn.net/ml/linux-kernel/20180703094309.18514-1-mylene.josserand@=
bootlin.com/=0D
2: https://github.com/alistair23/linux/commits/rM2-mainline-cyttsp5-hid=0D
=0D
Alistair Francis (2):=0D
  ARM: imx_v6_v7_defconfig: Enable the cyttsp5 touchscreen=0D
  ARM: dts: imx7d: remarkable2: Enable the cyttsp5=0D
=0D
Myl=C3=A8ne Josserand (2):=0D
  Input: Add driver for Cypress Generation 5 touchscreen=0D
  Documentation: DT: bindings: input: Add documentation for cyttsp5=0D
=0D
 .../input/touchscreen/cypress,tt21000.yaml    |   92 ++=0D
 arch/arm/boot/dts/imx7d-remarkable2.dts       |   89 ++=0D
 arch/arm/configs/imx_v6_v7_defconfig          |    1 +=0D
 drivers/input/touchscreen/Kconfig             |   14 +=0D
 drivers/input/touchscreen/Makefile            |    1 +=0D
 drivers/input/touchscreen/cyttsp5.c           | 1135 +++++++++++++++++=0D
 6 files changed, 1332 insertions(+)=0D
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyp=
ress,tt21000.yaml=0D
 create mode 100644 drivers/input/touchscreen/cyttsp5.c=0D
=0D
-- =0D
2.31.1=0D
=0D
