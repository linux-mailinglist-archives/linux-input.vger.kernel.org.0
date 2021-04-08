Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF76B35843D
	for <lists+linux-input@lfdr.de>; Thu,  8 Apr 2021 15:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhDHNMS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Apr 2021 09:12:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhDHNMR (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 8 Apr 2021 09:12:17 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3AAC061760
        for <linux-input@vger.kernel.org>; Thu,  8 Apr 2021 06:12:06 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id h19so3904244lfu.9
        for <linux-input@vger.kernel.org>; Thu, 08 Apr 2021 06:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cdW6oua3jMTcssevqS0GwenvSnu1avzvtj2RlpYQU30=;
        b=nZH1RcAHkjQv9uKwULd+wM3ZI3/p92fgYhloAWuVyv2fw18QN20MVj2RLKBqYH/zpr
         PYFeojXPKvW3KMgg19Yn1b6lKdh4fKahu2UOBb11knutnfTETemZjne3BktRNUPRASmH
         j2102T5PIK4JdVNgCGPiPKuY8dOD6LVka0ZUw64hrkzRHhxVKYudznRyTX8SGjAq0zZU
         2gMS2tVw99bpli7q022EZ0eHAFvM1lvxRkT6bsdpDZsVhGwVbBV856Q6C1kjUeEFLB3O
         3R0P0hg15Bi+t18PjgHteU9kXYd4GLuunAOU1CRtg9ZfI6dw4STM1AVQ6OErvXj9NIem
         WbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cdW6oua3jMTcssevqS0GwenvSnu1avzvtj2RlpYQU30=;
        b=dutrHmRWTHiWxUNnnECxgrLLPwRuG3e909sCHq4KFJCWTvnQmmTyHTRD1gUTPq4y8s
         cB/dVnUrt3mnqiqHkm7vcTDicMPqLo0WzHA3hVjfqmbcxUQlRJLCWxsWfG61rUT6yhqo
         yY0UPlNyYlghBF8RAttCsie2WnihX7f+hT3EoE6EA98s2wnLNae/g7abBQBTNufE3yRL
         mDVQ0j+JGSymHJ3UEzpVUB2Y344AskkfKPVWUBKEHv6YX1ukc30CBBUpfsMbaC0aP0Qi
         xquqnOSceCGDSH6RBSUPIwvqgU4YrpmOqAQwLycn6+WWHN2sdW9MLv5Y3opP8lsMtPiv
         DAWQ==
X-Gm-Message-State: AOAM533HAB1EpZKEnhKlKDoqMflYeBCseiVyKFUt/cpEMIVMHWeVKzzo
        3Ohl//9ovYgD0HiNJmVgy2/lG3NNBLGJsDIa
X-Google-Smtp-Source: ABdhPJzOaNNUDSCKW+nlKfomVlROuT0NfM0I0km7ca70+Oh6sJ4RVETSzdD1ok5xkPbd2PzijXh3MA==
X-Received: by 2002:ac2:5977:: with SMTP id h23mr6454647lfp.156.1617887523822;
        Thu, 08 Apr 2021 06:12:03 -0700 (PDT)
Received: from localhost.localdomain (c-14cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.20])
        by smtp.gmail.com with ESMTPSA id z7sm126936ljm.102.2021.04.08.06.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:12:02 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Ferruh Yigit <fery@cypress.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Javier Martinez Canillas <javier@dowhile0.org>
Cc:     Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/8 v3] Update CYTTSP driver
Date:   Thu,  8 Apr 2021 15:11:45 +0200
Message-Id: <20210408131153.3446138-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The bump from v1 to v3 in this series just reflects that
I follow the numbering of the YAML conversion patch so
it is easy for the maintainer to see what is the latest
version of the whole CYTTSP patch set. (This contains all
applicable CYTTSP patches for now.)

Linus Walleij (8):
  Input: cyttsp - Convert bindings to YAML and extend
  Input: cyttsp - Probe from compatibles
  Input: cyttsp - Obtain regulators
  Input: cyttsp - Error message on boot mode exit error
  Input: cyttsp - Reduce reset pulse timings
  Input: cyttsp - Drop the phys path
  Input: cyttsp - Set abs params for ABS_MT_TOUCH_MAJOR
  Input: cyttsp - Flag the device properly

 .../input/touchscreen/cypress,cy8ctma340.yaml | 149 ++++++++++++++++++
 .../bindings/input/touchscreen/cyttsp.txt     |  93 -----------
 drivers/input/touchscreen/cyttsp_core.c       |  52 +++++-
 drivers/input/touchscreen/cyttsp_core.h       |   3 +-
 drivers/input/touchscreen/cyttsp_i2c.c        |   8 +
 drivers/input/touchscreen/cyttsp_spi.c        |   8 +
 6 files changed, 211 insertions(+), 102 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/cyttsp.txt

-- 
2.29.2

