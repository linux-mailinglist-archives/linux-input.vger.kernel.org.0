Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7FD628667D
	for <lists+linux-input@lfdr.de>; Wed,  7 Oct 2020 20:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgJGSFr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Oct 2020 14:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727783AbgJGSFr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Oct 2020 14:05:47 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDFB4C061755;
        Wed,  7 Oct 2020 11:05:45 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e2so3482308wme.1;
        Wed, 07 Oct 2020 11:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Vifoobepf+bHVWCNa4lwevqmd5rzxDuoQoHkPS7iFI=;
        b=QNKnUCGY5c6DZ6f2cv5SVAThjjYhTFI4u06caz8jXMDnBLI0eAI6WiFfstv6ha3pFK
         E+aJkDzCX21+uyXm0gebG3P/HuYaF3lLYc8PflGkZN/DQcjUpMHEMqI499euh/ulE5to
         pXr4vCQ8FiMbUA5njEcYNKqJCEyI0K/7C5bdQ8aJetPX2M6oeFOSLWjU5UzgIGy6zDtF
         xR7pVA529pYT8T33YKKw1dzp2OL5DYKXYuF2t0Aj43eSAI8J1bZGyDKWc+TGEVah9gFv
         vlmdkBeKZaAu7wq3JOxJOhT4FUdBeH1XXwcCJbCRgvij++gHHx2nB1aTx1C4XVTsZRlq
         kr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+Vifoobepf+bHVWCNa4lwevqmd5rzxDuoQoHkPS7iFI=;
        b=At3Il1STZrR0c+BCGn1SRzbZhWsqvIDHprZevz0uaItr5uO8h0fWZz9ys0YktxhCUq
         1ndBZ7lAP1btOImdj5vO4/thtcGduRplWsFAEyWDPxr7LMrz+ekIX7l92I39nF1PWfbL
         Fcs8kduFRhCsucV120YXW4Ps4tcphNEDCvqvBVDk1+ziXsiTrQotByDcpXDYMzw5ruQu
         p8zihIM1xdOnhCmhbnFWN2TG8cLDCwcOYtFYwM7x7qogQS6nOqrGullTcyRyJI4glIy2
         OWUqc/Wo8Bt4lpQvkgmqyZacpGehhFijd3gTbrimjox3+1LzmOCtBAvAL5wWDwPr/KDg
         k8fA==
X-Gm-Message-State: AOAM531+ygcubzs95f5jynFt1caEg9U+GitXn3at5uEI6S8fJvLJn0Y6
        N8jaEfxmVrh1xztv4TJVeH0=
X-Google-Smtp-Source: ABdhPJxqr6fGDmkRlELMrgiyODy3zS8r+KAkF76hM1OOsxetTMCpi3BwGvDPGvjMgbetkXBO0PbFuw==
X-Received: by 2002:a05:600c:d8:: with SMTP id u24mr4511964wmm.2.1602093944495;
        Wed, 07 Oct 2020 11:05:44 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a17sm3814496wra.29.2020.10.07.11.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 11:05:43 -0700 (PDT)
From:   kholk11@gmail.com
To:     dmitry.torokhov@gmail.com
Cc:     robh+dt@kernel.org, rydberg@bitmath.org, priv.luk@gmail.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        kholk11@gmail.com, marijns95@gmail.com, konradybcio@gmail.com,
        martin.botka1@gmail.com, phone-devel@vger.kernel.org
Subject: [PATCH v3 0/3] Add Novatek NT36xxx touchscreen driver
Date:   Wed,  7 Oct 2020 20:05:37 +0200
Message-Id: <20201007180540.322257-1-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

This patch series adds support for the Novatek NT36xxx Series' In-Cell
touchscreen (integrated into the DriverIC).

This patch series has been tested against the following devices:
 - Sony Xperia 10        (SDM630 Ganges Kirin)
 - Sony Xperia 10 Plus   (SDM636 Ganges Mermaid)

Changes in v2:
- Fixed sparse warnings from lkp kernel test robot

Changes in v3 (as requested by Dmitry Torokhov):
- Using shorthand u16/u32 (sorry for the overlook!)
- Now using more input and touchscreen APIs
- Fixed useless workqueue involvements
- Removed useless locking
- Switched reads and writes to use regmap
- Moved header contents to nt36xxx.c
- Fixed reset gpio handling
- Other cleanups
- P.S.: Thanks, Dmitry!

AngeloGioacchino Del Regno (3):
  dt-bindings: Add vendor prefix for Novatek Microelectronics Corp.
  Input: Add Novatek NT36xxx touchscreen driver
  dt-bindings: touchscreen: Add binding for Novatek NT36xxx series
    driver

 .../input/touchscreen/novatek,nt36xxx.yaml    |  56 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/input/touchscreen/Kconfig             |  12 +
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/nt36xxx.c           | 816 ++++++++++++++++++
 5 files changed, 887 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/novatek,nt36xxx.yaml
 create mode 100644 drivers/input/touchscreen/nt36xxx.c

-- 
2.28.0

