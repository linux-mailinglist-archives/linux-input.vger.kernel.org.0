Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD4F2F6470
	for <lists+linux-input@lfdr.de>; Thu, 14 Jan 2021 16:26:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbhANPYO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jan 2021 10:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729068AbhANPYO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jan 2021 10:24:14 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C14AC061757
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:33 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id r4so5015732wmh.5
        for <linux-input@vger.kernel.org>; Thu, 14 Jan 2021 07:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LUR3ZC5J+1hLkR7qz5X75neLOSs5yFqeDGs5AO9qOw4=;
        b=LWGlRpsZ+c5J5N8fxZQxQAtRsePbal/MHQsI00818w2JQRVWkSwZfq4KGRZpl5qQkS
         cmUin/BmDApKu0+yaK/yZKP+4GpIg+m1J3cUGHIGmhy7zBQf6lDT7cHaPzXUx3m5d7nh
         hsfV+fAjLuZlK4DVOrbY53QYJFJBfyzJ4eJ89TVmoD5Gex4jCGr5mEIT3l4Wx2xS+ub6
         crLMVAZao1Bt1oxaQ9kFAonzeBN+svgQ1kpFWLKQxM8WWiD2PWL8jXWhM0OhQZ3ypx37
         H4rO9JO7eNksW+7X3SvoCCDcdb3xvdwD3ZuNvEkxQLqeTWXAzIgdMJpUlE4jJc6y2b0a
         Flsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LUR3ZC5J+1hLkR7qz5X75neLOSs5yFqeDGs5AO9qOw4=;
        b=RuQrycoaW3tOSN10WDSpCR4nJhuI7SsKTwYEKSgw56i4tInYUElLK5+NTM2goALvDs
         VpnREAxYUn8qPez3wGapvBXEgd2Gap6q96yPZZRUHY0cC2psWuHomaIv5pXGkm5btRd7
         NgTEHhOJn9ZNz3Lx2aDRG9dhm/THFNGBnBYCSKXTRNZgZW/opFHxg5xkEy7+EpiMpvLQ
         6K2MWARA9Af47IS4/Ct9ZNpWEMwbrW+8jdrdJ2q/x/RgEzHfDltHH127PQYduExwxUsm
         d2WLMd2Tjp9FyIGOanBUWtlG2CHCzciI2bhOOpKZKKH7WKTPGOwyz4N1VER1phwj2law
         sqeA==
X-Gm-Message-State: AOAM530Jsuzw2MxyItjVWI2SbALlmhPqwke6y/Wc9afAR0UaoHg0T6RI
        omtXTxP9HHmvl28sIwHyeb3OQQ==
X-Google-Smtp-Source: ABdhPJyDPR5SpV4A1P0OFN9rFKTQ2+PGovbF0AbXTJxJljKfJFFIiV44I8Zw/NaDinFku3qBrxZwkQ==
X-Received: by 2002:a05:600c:313:: with SMTP id q19mr4402221wmd.126.1610637812260;
        Thu, 14 Jan 2021 07:23:32 -0800 (PST)
Received: from dell.default ([91.110.221.178])
        by smtp.gmail.com with ESMTPSA id e15sm10777713wrx.86.2021.01.14.07.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 07:23:31 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Bruce Kalk <kall@compass.com>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Daniel Ritz <daniel.ritz@gmx.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Luotao Fu <l.fu@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Peter Osterlund <petero2@telia.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v3 0/5] (Set 2/2) Rid W=1 issues from Input
Date:   Thu, 14 Jan 2021 15:23:18 +0000
Message-Id: <20210114152323.2382283-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

This is the second (and last) of 2 sets.

v3:
 - Make use of 'ret' instead of removing it
 - Use __always_unused instead of removing unused variables
 - Fix recent/new warning regarding undocumented 'prop' param
 
v2:
 - Replace empty if() with commentary
   - Suggested-by: Joe Perches


Lee Jones (5):
  input: mouse: synaptics: Replace NOOP with suitable commentary
  input: touchscreen: melfas_mip4: Mark a bunch of variables as
    __always_unused
  input: touchscreen: usbtouchscreen: Actually check return value of
    usb_submit_urb()
  input: touchscreen: surface3_spi: Remove set but unused variable
    'timestamp'
  input: touchscreen: stmpe-ts: Add description for 'prop' struct member

 drivers/input/mouse/synaptics.c            | 7 +++++--
 drivers/input/touchscreen/melfas_mip4.c    | 8 ++++----
 drivers/input/touchscreen/stmpe-ts.c       | 1 +
 drivers/input/touchscreen/surface3_spi.c   | 2 --
 drivers/input/touchscreen/usbtouchscreen.c | 3 +++
 5 files changed, 13 insertions(+), 8 deletions(-)

Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: Bruce Kalk <kall@compass.com>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Daniel Ritz <daniel.ritz@gmx.ch>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-input@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: Luotao Fu <l.fu@pengutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Peter Osterlund <petero2@telia.com>
Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
Cc: this to <linux-input@vger.kernel.org>
-- 
2.25.1

