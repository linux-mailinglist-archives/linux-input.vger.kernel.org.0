Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A32A5FA6E4
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 23:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbiJJVXU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 17:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiJJVXT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 17:23:19 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A39276AA3E
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 14:23:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so4328335pjb.2
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 14:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOqZmIwLqAvPi68nqhDs0zVtrO62Tq2cb6A9To1gkxo=;
        b=NBnevTFZoUDGmkYoH2NEu3nO7MBgIZa7bwnFQ7VRwLtfitrJ1y8KxJoxW11/gL1Mze
         BpnphlhACdOfn0p0y/u/L7AxVJzW3/8qywg91Mwb0S89/cwlAtgAtpRWwTnj/ldfd9Nc
         zcy79ClxQpGgMHqLqYkOHUWRLlBX5Pa0xG7jP0tBnEzOmtKD5hW2AKG3LOlcZ82E5zHI
         KlZk7ejCLG+JNnR2ZP2HisiQ+u/m1KrL2biHSdhTrE9pmSvmegIZsdKHFFqjB1tpc/TE
         xj/885j2GOb3sZ09AYWrNTA3H7RaJVIB7tXpsXCRUKjav6QEavK25vPdAfHvrFiyo9lN
         OZWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOqZmIwLqAvPi68nqhDs0zVtrO62Tq2cb6A9To1gkxo=;
        b=UqZD6ufX2H51DyfoCRPDF8SydDk+afC5+A0vd4Lcc7zFMZ9dGkMCByhkfH4ehLbskv
         y7YFabeQmW9KZ1SW/6R30nFI2xYLa0PjftNrK/bYUzLddyelkzPN0L2YEbDQf3+GaLFJ
         G62LX3IZNFOHJAAoHaLaf84x+7SrnmXXrFPeJeOIJBnWAwiS2sgXaeax/ndpfx2Q8UK7
         tijeakSaIz/dmzMj+285RlZK61ENXoW7hUnCrJa3nvVeOMNUG4WPyxLtOkAckDdsTVfe
         NI/DbsLnkYJCh+3BaNNlWRftgRecpNnouWCoRaPIAhw2JiFw9y74p7NCm9nrgFiHz+kI
         Bh7g==
X-Gm-Message-State: ACrzQf3v1yu80GjfB2cQuKSmxCPju0/Di7qc+DqztmHpZG2OJVuHiTp8
        eIklvP+EUitr4wfWQFXJsXfSdA==
X-Google-Smtp-Source: AMsMyM5V3r6S92T3T9Ic6U2WJQEQaveIUaJEU7+6gdgSmRQ1ElrIl71nBekHewtUkFv590kvGq3dzQ==
X-Received: by 2002:a17:902:dac4:b0:178:3037:680a with SMTP id q4-20020a170902dac400b001783037680amr21494667plx.37.1665436998195;
        Mon, 10 Oct 2022 14:23:18 -0700 (PDT)
Received: from localhost.localdomain (23-122-157-100.lightspeed.irvnca.sbcglobal.net. [23.122.157.100])
        by smtp.gmail.com with ESMTPSA id d17-20020a621d11000000b0054097cb2da6sm7383876pfd.38.2022.10.10.14.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 14:23:16 -0700 (PDT)
From:   Roderick Colenbrander <roderick@gaikai.com>
X-Google-Original-From: Roderick Colenbrander <roderick.colenbrander@sony.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Subject: [PATCH v2 0/3] improvements and new device support
Date:   Mon, 10 Oct 2022 14:23:10 -0700
Message-Id: <20221010212313.78275-1-roderick.colenbrander@sony.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

This is a resubmit of the previous series with a few small style improvements
and some extra comments to the rumble patch. No new features were added.

Thanks,
Roderick Colenbrander
Sony Interactive Entertainment, LLC

Roderick Colenbrander (3):
  HID: playstation: stop DualSense output work on remove.
  HID: playstation: add initial DualSense Edge controller support
  HID: playstation: support updated DualSense rumble mode.

 drivers/hid/hid-ids.h         |  1 +
 drivers/hid/hid-playstation.c | 81 ++++++++++++++++++++++++++++++++---
 2 files changed, 75 insertions(+), 7 deletions(-)

-- 
2.37.3

