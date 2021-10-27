Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7029C43D0B2
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 20:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243428AbhJ0S2D (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 14:28:03 -0400
Received: from box.trvn.ru ([194.87.146.52]:57885 "EHLO box.trvn.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243548AbhJ0S2D (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 14:28:03 -0400
X-Greylist: delayed 608 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Oct 2021 14:28:02 EDT
Received: from authenticated-user (box.trvn.ru [194.87.146.52])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by box.trvn.ru (Postfix) with ESMTPSA id ADEE640479;
        Wed, 27 Oct 2021 23:15:22 +0500 (+05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
        t=1635358523; bh=cgMxHApRNl6TXjF/C5V/IAMZObp9+7rkC+EiakS/tAo=;
        h=From:To:Cc:Subject:Date:From;
        b=djt9v8/mLwnSw0GlyKlJWKqkdLrabdzGvUb99M/QdNc6/pZEKMeL1cn3utAjBrYJ6
         Rpso8U0iYWpEzgqwoe64wskyaVtrVflOARciw0lXfIo2ire8lCFG0JOe/fjRlWzqZq
         QfgDYjqLj3a+6+aq7QvGzmyjuDyWENZ2hByStt+RAbqggzlN+WTUpMrOKANCwwAJAz
         RxD1JlOJO/chEpbBbYQtlSmQkd4dqkfOL1GDNml57y8HWJu+XqycdEt7WsC8n/0nLl
         tV20MBW1ytqZdOwjXkAzrC2HpRFn9POX2cDi4EvI6k3+jgnIgLXuCaiEez+MmfXHl8
         0pIRAOHXota7Q==
From:   Nikita Travkin <nikita@trvn.ru>
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, Michael.Srba@seznam.cz,
        linus.walleij@linaro.org, broonie@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikita@trvn.ru>
Subject: [PATCH 0/6] Add touch-keys support to the Zinitix touch driver
Date:   Wed, 27 Oct 2021 23:13:44 +0500
Message-Id: <20211027181350.91630-1-nikita@trvn.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds support for the touch-keys that can be present on some
touchscreen configurations, adds the compatible for bt532 and fixes a
small race condition bug in the driver probe function.

I also pick up the series that converts the dt bindings to yaml
initially submitted by Linus Walleij in [1].
I made some minor changes to those patches:
 - Fixed dt_schema_check error
 - Adressed the review comments from Dmitry on the original series

[1] https://lore.kernel.org/linux-input/20210625113435.2539282-1-linus.walleij@linaro.org/

Linus Walleij (2):
  dt-bindings: input/ts/zinitix: Convert to YAML, fix and extend
  Input: zinitix - Handle proper supply names

Nikita Travkin (4):
  input: touchscreen: zinitix: Make sure the IRQ is allocated before it
    gets enabled
  input: touchscreen: zinitix: Add compatible for bt532
  dt-bindings: input: zinitix: Document touch-keys support
  input: touchscreen: zinitix: Add touchkey support

 .../input/touchscreen/zinitix,bt400.yaml      | 123 ++++++++++++++++++
 .../bindings/input/touchscreen/zinitix.txt    |  40 ------
 drivers/input/touchscreen/zinitix.c           | 101 +++++++++++---
 3 files changed, 207 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix,bt400.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/zinitix.txt

-- 
2.30.2

