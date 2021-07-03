Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D56233BAA63
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhGCWFB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhGCWFB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:01 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DB3C061762;
        Sat,  3 Jul 2021 15:02:27 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id ga42so5279665ejc.6;
        Sat, 03 Jul 2021 15:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iR/pKGbQTiFdEqW87HcB2nEiG87/y8ESwDoJF9KCOgc=;
        b=jQsmacHqnWonGCy47oQiiOKiafCvkNayN/lp3PPnkj6+COYUQRT6UFRX3aTiJhc3s7
         uZni6XQLq96SNuS4y1zew04I23Es58friK5AZOaz7sk8nwFNVyiiANrQNYHiMqNtOo++
         XStZ5LrLRn9mwrsGXURvhZvb60YwCpyJBlq3r5QuYhPj+5rD6+BAMZNnff3i/Z7B1MvZ
         MFDzsvaJUWBOwedSj9QEzM57JynW1ZWEmZIbkz6dtxt/au9ShEMTayJSWqafVZmxWoYc
         jp6MN1eZO9hSFhLEbJAQ/TMtLTZSDdQ19d/JxJdvH+iNocOOF4GjVV97kcSdBcuSzNQX
         9ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iR/pKGbQTiFdEqW87HcB2nEiG87/y8ESwDoJF9KCOgc=;
        b=XCR8aftbP9+Z/WlhAEHBEfKaEluebx8ptyCntqWSaS3/yyh0tNal7Jh4Ez/8L2gJvr
         ZflP3okH3zroa5cB7921h4ZCSnImIIuEZb5n5HnlkUN4kjAbTIjpKjCh0XaIEjk5JsOp
         yWXGN2uwr6FClSOVatjCuC+tWlwgdogsLoKRXRUNzUneIVxr2s35QLSJe+bGCW8ukYlv
         DnjsveEn9zD1dwCRdfCEkGe0StJhHkv1XE492jorfGRiVBSmamueVi9WN1zpbMaPdGyo
         IuJOrG1yy6RcQDaWic6ZaDAyQSuozXgBPF1b9V9FhK0NRe7lkx++Gh0qXSOV4aF/ecXb
         gHpQ==
X-Gm-Message-State: AOAM5323SVSj7X05aUbo23Ls5NEPy3h/FlAgsM+MpHL4IJPgHwishIGz
        /g4WY0KJRIBUQIQFN+yBcuQ=
X-Google-Smtp-Source: ABdhPJyMMR38rLOh5AWB3CeK5dOOctPGpV1tTTTwg9XZ5vvZRVMchwn8vLFz87apdFQPq1HrdJn+AA==
X-Received: by 2002:a17:907:97c5:: with SMTP id js5mr6009659ejc.321.1625349745533;
        Sat, 03 Jul 2021 15:02:25 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:25 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 0/6] Add support for common USB HID headset features
Date:   Sun,  4 Jul 2021 01:01:56 +0300
Message-Id: <20210703220202.5637-1-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch series extends hid-input to support features commonly present
in USB HID headsets:

1. Mic mute button and LED.

2. Answer/hangup button and ring/offhook LED(s).

These buttons and LEDs are exposed using standard event device
interfaces. It allows the VoIP applications in userspace to use the new
functionality in a generic device-independent fashion.

This series also contains patches for hid-plantronics and hid-jabra to
expose the new functionality and work around some hardware quirks, and a
fix to hid-input for an issue that prevents the new LED functionality to
work with certain headsets.

Although checkpatch compains about a few lines, they preserve the same
formatting that already exists in hid-input.c.

Maxim Mikityanskiy (6):
  HID: hid-input: Add offhook and ring LEDs for headsets
  HID: hid-input: Add phone hook and mic mute buttons for headsets
  HID: plantronics: Expose headset LEDs
  HID: plantronics: Expose headset telephony buttons
  HID: hid-input: Update LEDs in all HID reports
  HID: jabra: Change mute LED state to avoid missing key press events

 drivers/hid/hid-input.c                | 183 +++++++++++++++++++++++--
 drivers/hid/hid-jabra.c                |  35 +++++
 drivers/hid/hid-plantronics.c          |   6 +
 drivers/input/input-leds.c             |   2 +
 include/uapi/linux/input-event-codes.h |  10 ++
 5 files changed, 225 insertions(+), 11 deletions(-)

-- 
2.32.0

