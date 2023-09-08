Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B36C5798A08
	for <lists+linux-input@lfdr.de>; Fri,  8 Sep 2023 17:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235626AbjIHPc0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Sep 2023 11:32:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244662AbjIHPcZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Sep 2023 11:32:25 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97841FDF
        for <linux-input@vger.kernel.org>; Fri,  8 Sep 2023 08:32:13 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DE05E0004;
        Fri,  8 Sep 2023 15:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1694187132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=z+p61H5E0dhs+HL1N2JokNWNrTM/8jqBtkQMucGsD5o=;
        b=LFzDQJPQEsHK+H8DNaSaCjExcX/2u8WLVH+XrVM3/VE0YN+RIMcUnIIgWLpc+1dwZrrXwb
        IZq6ISP7D7/ecOUi1IluQYa6+liHozkrrE6wyXvNu4mi+tW2lx+IwfCypEY5KtEupjXVQY
        3B8IzFDcLiaTE9vk8jb5rKJx0Ly9kOzwMjmCH+em/gNzX1zrs1qi2yqzy8HMTRCJZ/I45+
        7Y/wE69GcgB68E8EFYEv93LQHoWecOPu0JfqJ048JF2HGz9p9DqDRBMiJ+ZxTO/g879pQr
        GxEqG/fwWaTTBebFBHldyRJaPtqxW7gy+7zOqJVQioOsnZqPvrAP01aFkUfpTA==
From:   Kamel Bouhara <kamel.bouhara@bootlin.com>
To:     linux-input@vger.kernel.org
Cc:     mark.satterthwaite@touchnetix.com, pedro.torruella@touchnetix.com,
        bartp@baasheep.co.uk, hannah.rossiter@touchnetix.com,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        bsp-development.geo@leica-geosystems.com,
        Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: [PATCH 0/1] Add support for aXiom TouchNetix touchscreen
Date:   Fri,  8 Sep 2023 17:32:02 +0200
Message-Id: <20230908153203.122062-1-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: kamel.bouhara@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

This patch add support for an I2C touchscreen controller
from TouchNetix's aXiom family devices. 
It is based on the vendor version:
https://github.com/TouchNetix/aXiom_Linux_Kernel_Module

I only have the I2C variant of the aXiom device but this
could also support SPI and USB interfaces in the future.

Regards,
Kamel

Kamel Bouhara (1):
  Input: add driver for TouchNetix aXiom touchscreen

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/input/touchscreen/Kconfig             |  11 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/axiom_core.c        | 382 ++++++++++++++++++
 drivers/input/touchscreen/axiom_core.h        | 142 +++++++
 drivers/input/touchscreen/axiom_i2c.c         | 353 ++++++++++++++++
 7 files changed, 898 insertions(+)
 create mode 100644 drivers/input/touchscreen/axiom_core.c
 create mode 100644 drivers/input/touchscreen/axiom_core.h
 create mode 100644 drivers/input/touchscreen/axiom_i2c.c

-- 
2.25.1

