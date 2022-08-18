Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A886959839B
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 15:04:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244663AbiHRNBY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 09:01:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244262AbiHRNBT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 09:01:19 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B0174BBB
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:01:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id s11so1768829edd.13
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 06:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=RXi3/JC+rvnicwGbrY6FD/w9bJzu+2jIKMLbXGVkLz8=;
        b=g7lME+uoq4O3E5OCdU3mC8ty/zVvV0RX+EVHd0sRyy0lLBUihiPXsrbhkqgyPOH0Ti
         7pl//Vv9yLIy3grEUrT2+TXo2tooGTXDZ/U+TRwwGhZK6Lrr3fy28q0RkM6MOkU3ZZBo
         iMdZCbfmG/7fTtNJvZYHZgenwgfZXCHa9aA7WALOmPo4PleNBS+LJ+wWVNTErVkGmFbX
         01HmdVI29GnVqY/7gG4oJTSTgaHhuBMDmGngyFT6dxs31QXsfhYl4J7Lmr8JNZq6xHbD
         OqHHGeHsIlvNsmCXlbVgOJcARxJdsXZrL/RWEvPwuqGVckCjkV4IzZAElF2TN+ly48iw
         LMhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=RXi3/JC+rvnicwGbrY6FD/w9bJzu+2jIKMLbXGVkLz8=;
        b=Dtq7CnPH1NjUTFJMxQ2SIMyvtEaF+jOANXgeLPdEeZ6JMNVDvHiEZVkHsQC2ZI26s4
         L9bHd2AB8Pw0wv8+IyrzkTG9ySiIcpY5KbYG57mX5Dl//XfVYNUK4T5tfH3xegl5TO5l
         OnILB6EyUMdEYbZU/VyLDPxnk2tC+VPiIV3NckA+rdCNokdHWxF2xl42kkA19xtNYAyp
         vpSKwe+LLx4HkN0tNQAwxHPEVNQCvunz2nSpO7lTIEIMxln3ui3nm5sWF9tUc8t0RKOA
         AN/gZYiIGICTZxo9GLz7mmT19glpuGRho6dzyNbBBPxt1fJ6PMmyKQcKCaaaz6dfHqGd
         uX7A==
X-Gm-Message-State: ACgBeo3ueaCgykMAV0NjizIAkZqOYucaBKNMAPNoQrBSQPFIbh4LY4fe
        h6cDJqTN26jDB/U21KePSWvwVe37AK7oEQ==
X-Google-Smtp-Source: AA6agR75z+qYGzeKpiAUEsP6l77ydkF5As0FPjRm0tnc29gkVIHkkebD562j6EaK4j1I/HP/B4glkw==
X-Received: by 2002:a05:6402:500d:b0:440:9bc5:d0c1 with SMTP id p13-20020a056402500d00b004409bc5d0c1mr2247795eda.202.1660827675871;
        Thu, 18 Aug 2022 06:01:15 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.gmail.com with ESMTPSA id f4-20020a50ee84000000b0043a2b8ab377sm1093250edr.88.2022.08.18.06.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 06:01:15 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH 0/4] Input: xpad - sync with github fork
Date:   Thu, 18 Aug 2022 15:00:17 +0200
Message-Id: <20220818130021.487410-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Pavel Rojtberg <rojtberg@gmail.com>

I maintain the fork of the xpad driver at https://github.com/paroj/xpad.
This upstreams some changes that have proven to be stable.

The first patch merely updates the list of supported devices.

The next two patches improve xbox360w gamepad support.
I have tested those myself, as I own that device.

The last patch carries most of the diff and adds support for
"paddle" buttons found on some Xbox One controllers.

Cameron Gutman (1):
  Input: xpad - fix wireless 360 controller breaking after suspend

Christopher Crockett (1):
  Input: xpad - add support for XBOX One Elite paddles

Pavel Rojtberg (1):
  Input: xpad - add supported devices as contributed on github

Santosh De Massari (1):
  Input: xpad - Poweroff XBOX360W on mode button long press

 drivers/input/joystick/xpad.c | 298 +++++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 236 insertions(+), 62 deletions(-)

-- 
2.34.1

