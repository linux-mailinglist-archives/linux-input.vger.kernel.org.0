Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784D088737
	for <lists+linux-input@lfdr.de>; Sat, 10 Aug 2019 02:20:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfHJAUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 20:20:44 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:32850 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbfHJAUo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 20:20:44 -0400
Received: by mail-pf1-f195.google.com with SMTP id g2so46876201pfq.0;
        Fri, 09 Aug 2019 17:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4NuHpiKrcfvxS/mGiY/BxI3FRO/IKvPbBP1wbHbbV9M=;
        b=sNNT5BHdi1Q+lGPk4v4j14rp1DiKU+zKERT+HuNqBhQCK8ndNh5r4OMksck+rYsnFw
         9672qRaWp9d1ar2rbgyc9+QXuJR34YJUp/XwwX+BnCRnUeeXKhwse1qlhgKKfn2T5Brn
         JdTpAPzNtiCkBVZhieFIICculFf/4iTyqyELuHFNr8YoRDCsgx5Rr+K6BruAMJOGfCSX
         6Q+yvoR0mRnl6Rbas9QTZAu4i72PrJ5xx8I7WVXTAAoySdYp09a7UxGibIM5s7qhJtVS
         I1FtlKyeHyzjzyBZIpFZfro70g4Etc6dgNxnNQZzsBeFaMV4yGJ+y5gO5sKvV9NQFmQc
         EE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4NuHpiKrcfvxS/mGiY/BxI3FRO/IKvPbBP1wbHbbV9M=;
        b=incDnfxka+TjsYb47X1UfDhSP4CblVcAe05TvJ7HfWpvZUMHtTbgRihvhjGJ0+53AO
         Dl23wBtrl0LG+ODWDEtMbv3r6uSlfD1E5sT4A3MNM0ogF5bTfvygmferzjV8mzoF4XSq
         5RvZWeAIws1/RnAIclFtgoDFDbi7zACRYYBo9afYVAdc4JkA5iFTXyBbdFpocrs+FBmE
         bQoK8o+Z8u+CKz+ZrJg2+/S53jsHBu6ddIyOaSf6sF2UFRcrUEaLndFzHVhGX+iYRE+V
         iLbJNXtqj8SmVFtS8imPpj1VwkXC/DL/Ljb2VhV9UFJVSvhpaxjdCELP9P6Xb+b8LvZr
         MsWg==
X-Gm-Message-State: APjAAAXmkP0FpTWi4HBozNtMJyX2lTylIXPTAMNYU9tLgHlWJRy5T615
        AT2A8U3tUr23SGy18fKtDBI=
X-Google-Smtp-Source: APXvYqzlqJraQYMHJWBI0YDZEIHyFTieBXoKRfFKVTThdOlmHn4H2bejShVmhmsJn6Vctc5guIT2sQ==
X-Received: by 2002:aa7:8b11:: with SMTP id f17mr24382380pfd.19.1565396442927;
        Fri, 09 Aug 2019 17:20:42 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id v185sm110701150pfb.14.2019.08.09.17.20.42
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 17:20:42 -0700 (PDT)
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] Face lift for bu21013_ts driver
Date:   Fri,  9 Aug 2019 17:20:28 -0700
Message-Id: <20190810002039.95876-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

So your patch has prompted me to take a look at the driver and
try to clean it up. I am sure I screwed up somewhere, but you said
you have the device, so please take a look at the series and
see if you can salvage them

Thanks!

Dmitry Torokhov (10):
  ARM: ux500: improve BU21013 touchpad bindings
  Input: bu21013_ts - rename some variables
  Input: bu21013_ts - annotate supend/resume methods as __maybe_unused
  Input: bu21013_ts - remove useless comments
  Input: bu21013_ts - convert to using managed resources
  Input: bu21013_ts - remove support for platform data
  Input: bu21013_ts - use interrupt from I2C client
  Input: bu21013_ts - fix suspend when wake source
  Input: bu21013_ts - switch to using MT-B (slotted) protocol
  Input: bu21013_ts - switch to using standard touchscreen properties

Linus Walleij (1):
  Input: bu21013_ts - convert to use GPIO descriptors

 .../bindings/input/touchscreen/bu21013.txt    |  27 +-
 arch/arm/boot/dts/ste-hrefprev60-stuib.dts    |  14 +-
 arch/arm/boot/dts/ste-hrefv60plus-stuib.dts   |  14 +-
 drivers/input/touchscreen/bu21013_ts.c        | 740 ++++++++----------
 include/linux/input/bu21013.h                 |  34 -
 5 files changed, 362 insertions(+), 467 deletions(-)
 delete mode 100644 include/linux/input/bu21013.h

-- 
Dmitry
