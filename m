Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5792B587E
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 04:50:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgKQDuD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Nov 2020 22:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgKQDuD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Nov 2020 22:50:03 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F0C9C0613CF;
        Mon, 16 Nov 2020 19:50:03 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w14so16210690pfd.7;
        Mon, 16 Nov 2020 19:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04W0q41mu5V5Xz079AesIuQUygiTimp7vRBCy6AxuE0=;
        b=m2Ef7ZLf65LxoVznjcnwL6XS0WGOICYCGCcRrVAxW+e6LrfDQRo4X3ifOhOaP/31ph
         HS62W2CnDiIKFGL8dmG6pPoviH6yAuNRZu5UOT2+6tuCJ3+MzQ7Vb3dRNopFT0Jii4KK
         rq8qr9eSFoz88J/Zac0+yHMQRAgs5LLr7mvLpB/JaOjTeKzA0Si+GJUo6Bcbf1v8s2vT
         9qlJ8CGnBWaQWIKZtrBeNhUUlRO2s8WjLkii5Y/WuzpzZF5nMLfHU68Mn5tqPhmOajyD
         FOiKDSBfXQ4KAGUg5MAJ1yt9V8gmJKfGBMZi01O0jzjRIphGYBYIWaDjFPbXycTgF1by
         CU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04W0q41mu5V5Xz079AesIuQUygiTimp7vRBCy6AxuE0=;
        b=p71A/i8u7z7sSdVk9o7HhwcIE2OC2CHQ+RAoPdLBNxyKtEHM78AAggdDX8CkmEC3Jj
         /BS/X1vsGT9RlZLCKHc+iuxdctDZOuKXVMc9DtQZM+FMcS7R1zLzrcLLXEQ+8Qjyl+Kq
         j80Y8XptoFal51jeBLXOibQQggFtrcFBIB9hrz09e8tGblwZBPgHlEfz/aE1z0CBM7Eo
         QndUHD7rcygGagrPxVa5/hZfL/waJ+IoVic+9/9u9RLmqo5XzJ2zlEY6s/R+aq2uJ4LO
         wZLllYBBxZ7UFWtzd4kK41TUe4CG59776Xd16dV5JF3zdgn8FjmcGBJUq3WEgz3m0wiD
         piDw==
X-Gm-Message-State: AOAM533rYrtzRJfrZg0CGNek24ib4+O1WLJ5WCbOP67TmYu+35q4fs87
        NFkhbcuxwe1YcKJQFb4cbyaBz4bDN2ESnQ==
X-Google-Smtp-Source: ABdhPJxVnZs0zqTKzNmohHJcEU4BHD2rGdcTXWvF1t7Z+TNMmY52sYaGexkkVxr+lp1b5EfVN6oe+w==
X-Received: by 2002:a17:90b:1289:: with SMTP id fw9mr2462763pjb.85.1605585003105;
        Mon, 16 Nov 2020 19:50:03 -0800 (PST)
Received: from ubt.spreadtrum.com ([117.18.48.82])
        by smtp.gmail.com with ESMTPSA id u24sm19602329pfm.51.2020.11.16.19.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 19:50:02 -0800 (PST)
From:   Chunyan Zhang <zhang.lyra@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Nemo Han <nemo.han@unisoc.com>
Subject: [PATCH v2 0/3] Add support for sc2730 and sc2721
Date:   Tue, 17 Nov 2020 11:49:46 +0800
Message-Id: <20201117034949.47877-1-zhang.lyra@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset add new compatible strings and match data to support sc2730 and sc2721,
also convert the bindings to yaml schema.

Changes since v1:
* fixed the error when running dt_binding_check;

Chunyan Zhang (2):
  dt-bindings: input: Convert sc27xx-vibra.txt to json-schema
  dt-bindings: input: Add compatible string for SC2721 and SC2730

Nemo Han (1):
  input: sc27xx: Add support for sc2730 and sc2721

 .../bindings/input/sprd,sc27xx-vibra.txt      | 23 -------
 .../bindings/input/sprd,sc27xx-vibrator.yaml  | 48 ++++++++++++++
 drivers/input/misc/sc27xx-vibra.c             | 64 ++++++++++++++++---
 3 files changed, 102 insertions(+), 33 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
 create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml

-- 
2.25.1

