Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC422C55CA
	for <lists+linux-input@lfdr.de>; Thu, 26 Nov 2020 14:36:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390213AbgKZNgN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Nov 2020 08:36:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390032AbgKZNgN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Nov 2020 08:36:13 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2189C0617A7
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 05:36:12 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id m6so2162766wrg.7
        for <linux-input@vger.kernel.org>; Thu, 26 Nov 2020 05:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8aaQW1BzOudv2jiqYY2iSxD/EvJrxPU139d8koK/jA=;
        b=rJ1vdvduPAFqRuaqHaZnlPfx3D78orMFlRLzjm2etqxsLwxMHCo/qaNlM3AwnnMLQq
         BMyWTYj6Wf3bFhqzVWJjhXEhdPcOdNGfJnZgbS80SYFsrX/5JLf6iezVbrY0uZGeRqO4
         2/wgYEDaxJJOS9Y5JRm7Hm1yzVM/qvRkBjmytPUHgq8/J1OPL8Bv6gwP9VCpgKiHUvwR
         YQkldL5cXvM44SnuUz5o40psnzfcuAv0DUO7Bp/WB0Hsuh0sIvfXPGUsxjW4eLvhmhdB
         9z0EFuZ8ALiNCxdavVu1NLbj1xtS3jFY6Kpsy3V9vEIsbH/3FZ+GunaF7w7iQxb4dCtg
         3OYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x8aaQW1BzOudv2jiqYY2iSxD/EvJrxPU139d8koK/jA=;
        b=blyLYrVndGHEOsYqauBpy4cTH7w1K3l8EFmuY+NmRZ8i3Fenr4QVj2R+zWedJFe84Z
         MOY4G9bvxJP4UfubbI8zo+DrJuWLUJZOYQXH+bX/z3qj7y+tbU2tBm0i6ibL6b6Pm+u6
         /s6tKx55EA2D7MDs/0i0W4xDakUWgHtYuhKmJEstdpFPmE09ctaB8C6sD1eqX9ljUilq
         W2bmjTkwNdDRwY7sUxUoLRNh7zJTBkxVBTZgjZDbKeYevQ5Tes1Rrw/hMpjuPazMEr6/
         SaCNA82q0zvTqPhDBZywFskSX1E1DWKjKxg1jBQPYBKVWtSI2EW+rb0GDTW0ql85FyzX
         rIGQ==
X-Gm-Message-State: AOAM5331mFGxue5guVAb0LgOcodTP9q2JeCMY+408EkZSJgvaaYjckzN
        7h5rCy6wkGewHSQNcd8Y/soIhQ==
X-Google-Smtp-Source: ABdhPJxzcIlrMsLwob30/DvvIy1Y7n0wARTiB7j9B5tSIEe4tOd0HCNVj5XVzAboev1f6B36h1B+zQ==
X-Received: by 2002:adf:efc4:: with SMTP id i4mr3792641wrp.323.1606397771496;
        Thu, 26 Nov 2020 05:36:11 -0800 (PST)
Received: from dell.default ([91.110.221.235])
        by smtp.gmail.com with ESMTPSA id l3sm9056280wrr.89.2020.11.26.05.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 05:36:10 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Bruce Kalk <kall@compass.com>,
        "C. Scott Ananian" <cananian@alumni.priceton.edu>,
        Daniel Ritz <daniel.ritz@gmx.ch>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Hilliard <james.hilliard1@gmail.com>,
        linux-input@vger.kernel.org, Peter Osterlund <petero2@telia.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Stefan Gmeiner <riddlebox@freesurf.ch>
Subject: [PATCH v2 0/4] [Set 2/2] Rid W=1 issues from Input
Date:   Thu, 26 Nov 2020 13:36:03 +0000
Message-Id: <20201126133607.3212484-1-lee.jones@linaro.org>
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

v2:
 - Replace empty if() with commentary
   - Suggested-by: Joe Perches

Lee Jones (4):
  input: mouse: synaptics: Replace NOOP with suitable commentary
  input: touchscreen: melfas_mip4: Remove a bunch of unused variables
  input: touchscreen: usbtouchscreen: Remove unused variable 'ret'
  input: touchscreen: surface3_spi: Remove set but unused variable
    'timestamp'

 drivers/input/mouse/synaptics.c            |  7 +++++--
 drivers/input/touchscreen/melfas_mip4.c    | 11 -----------
 drivers/input/touchscreen/surface3_spi.c   |  2 --
 drivers/input/touchscreen/usbtouchscreen.c |  4 ++--
 4 files changed, 7 insertions(+), 17 deletions(-)

Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc: Bruce Kalk <kall@compass.com>
Cc: "C. Scott Ananian" <cananian@alumni.priceton.edu>
Cc: Daniel Ritz <daniel.ritz@gmx.ch>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Peter Osterlund <petero2@telia.com>
Cc: Sangwon Jee <jeesw@melfas.com>
Cc: Stefan Gmeiner <riddlebox@freesurf.ch>
Cc: this to <linux-input@vger.kernel.org>
-- 
2.25.1

