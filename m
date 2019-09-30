Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FBDC213C
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 15:03:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbfI3NDg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 09:03:36 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:38780 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730802AbfI3NDA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 09:03:00 -0400
Received: by mail-wm1-f49.google.com with SMTP id 3so12652999wmi.3
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vNX+Pqr7l6mVyA3yK7rKaQ3s0VflVZgQrJhL3g7/Ip4=;
        b=tIxdis1cAH+RvP4PA/a2sKVUiFk+Cb8ktSu0Khl9Hhsng9haOllbEdr+iuZx3lPSYU
         sDOw0/LmRP8ATtF8hVEim3PnfPDf7quuj2Rn4LNrfdNjQ/WNeOIEa1ZLSpdi01EojiUu
         v2U2CqItDoxwn99A0kVco8fUslg9NmMhNjof/Zm9Hj/7fzahvz+7MW24L6ymTx9cntQ4
         iG8x57C+wJnP1ViTabcJxmaDc9fur1vkKOQ2wJ/uwMiVtM4pZ7eeBQB7jQVZvcfHgs5b
         0igr1XNlgRQ6W1pmNpMM5C3eRZKZW6j9mpzEV/oMcDWMbEP8KJsJw5uVhQ2QYXy4w2Ft
         g9jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vNX+Pqr7l6mVyA3yK7rKaQ3s0VflVZgQrJhL3g7/Ip4=;
        b=dCi12uFZyyltJ/zEcrWcJuXW49U87HRcwcPSLU5xTNnIW/RUUnPUSYGqRZjrQz+wV6
         QPTlMuygobRpPahv1ZUwRKw5fMAoHsITE3zAhRNplLK6NYKPNx8jGDoQOl35PH70ZNMu
         PW+JTXffkBSx1SB5T8ZDr1+ndGl1BiW7WFf4cPq/tqhpSHE3JsdvoiJk2ERq0z5HYrt1
         ufoFOqh8MDOetKrZAcTWskaDyJCIBhQQ+FrsP3Ot1XXIu/+LyDUqblXOd1tYX3dkRa+S
         ecJ41mygVp0yNByLvVC0z4/ChOXThJeKnev0mDeTvfkMMs4c/hKC619S5wh2hXso6ISq
         Hl7w==
X-Gm-Message-State: APjAAAUusQxCDbeCJzV4qNilL98LzIh1KG8zEmAwZftX1frj1wGwukFb
        jmQuC09oMxC0ye7P+2J7vsRRJg==
X-Google-Smtp-Source: APXvYqxK7o4G9mpvoB48Pb3o2/pQXGinDSvX0SV4RdXXaPNltTKFMwrC3kfNsl75Q4BTOzphLXez4w==
X-Received: by 2002:a1c:3182:: with SMTP id x124mr18351314wmx.168.1569848577745;
        Mon, 30 Sep 2019 06:02:57 -0700 (PDT)
Received: from localhost.localdomain (amontpellier-652-1-281-69.w109-210.abo.wanadoo.fr. [109.210.96.69])
        by smtp.gmail.com with ESMTPSA id e6sm10654756wrp.91.2019.09.30.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2019 06:02:57 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 0/6] dt-bindings: max77650: convert the device-tree bindings to yaml
Date:   Mon, 30 Sep 2019 15:02:40 +0200
Message-Id: <20190930130246.4860-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This series converts all DT binding documents for max77650 PMIC to yaml.

Bartosz Golaszewski (6):
  dt-bindings: mfd: max77650: convert the binding document to yaml
  dt-bindings: input: max77650: convert the binding document to yaml
  dt-bindings: regulator: max77650: convert the binding document to yaml
  dt-bindings: power: max77650: convert the binding document to yaml
  dt-bindings: leds: max77650: convert the binding document to yaml
  MAINTAINERS: update the list of maintained files for max77650

 .../bindings/input/max77650-onkey.txt         | 27 +-----
 .../bindings/input/max77650-onkey.yaml        | 43 ++++++++++
 .../bindings/leds/leds-max77650.txt           | 58 +------------
 .../bindings/leds/leds-max77650.yaml          | 82 ++++++++++++++++++
 .../devicetree/bindings/mfd/max77650.txt      | 47 +----------
 .../devicetree/bindings/mfd/max77650.yaml     | 83 +++++++++++++++++++
 .../power/supply/max77650-charger.txt         | 29 +------
 .../power/supply/max77650-charger.yaml        | 42 ++++++++++
 .../bindings/regulator/max77650-regulator.txt | 42 +---------
 .../regulator/max77650-regulator.yaml         | 51 ++++++++++++
 MAINTAINERS                                   |  4 +-
 11 files changed, 308 insertions(+), 200 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/max77650-onkey.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/leds-max77650.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/max77650.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/max77650-charger.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/max77650-regulator.yaml

-- 
2.23.0

