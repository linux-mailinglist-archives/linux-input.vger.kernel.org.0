Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D457389A6B
	for <lists+linux-input@lfdr.de>; Thu, 20 May 2021 02:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbhETAYZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 May 2021 20:24:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbhETAYZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 May 2021 20:24:25 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A82F8C061574
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:03 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id k186-20020a2524c30000b02905116c9c3759so10150128ybk.4
        for <linux-input@vger.kernel.org>; Wed, 19 May 2021 17:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=vU+B3VFZNY+aJijnGEnzkgH4AqT1BvQB1cT/4WuqvOc=;
        b=KfX0yBMcIcclePpKDa3rEPcY/XVn7hl8pnmyfrnsvAFq55hlQ1ex/Wz4bz+kYgnxyr
         Tri4yy43CsHXN0bhiywicGWTEXHSXIbVsWQvzN7G7qJnpD2uUWKZY60XS0ykQmpaBz2P
         CQH479VwSQPrWg7SyGAyWoX0zG4R9Pj9PzFOuB04WiM6RRXh1uUwprR+G/fW/aYeOlKB
         24dD70N8majGyWov4OYBTFv5z++/9qF/ihvI9j3Q29hWKTSRTm1ZZzIb6430pnKLaE/l
         PrsHyX71ebS3H55iuXEGEPEZkeysAOyPGjLAiEl8bK3OELwyLYhDlEnp0ZgY0+7Ieb5m
         KlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=vU+B3VFZNY+aJijnGEnzkgH4AqT1BvQB1cT/4WuqvOc=;
        b=VZ2q1nIiyItV05wKapDAl33WU41HMN5+DFzZuXD6EzJhB1FYIi9xawfEQcztl4wgLz
         NEUkmcbreN/ujgBZ1zODyqviPiyIDwZDU5H+O1B5WMHiDX4L0aB6cp/neS2gz7co9v/9
         b3D309C4VNALAGeLlc7m/h2gIyTcjSwikzNo33YOWHP0MRAt214LYAZLsD3+dmtX1mfe
         GN6JQzXWUn5DnzQrGnGp8lFNmGcDnSABUUgjBWKu/Ur7DoYqd9jOse+aM5VaO6qGp6DG
         IQoAbQFsF0LNlzZQdx0FjT2nDJkRqM8OAcuLLrtS6oM2tn5TTficO4g/dDasrbxcMQYp
         pldg==
X-Gm-Message-State: AOAM530scj4FdEvP6+oIz+wzchCdzurP4c2LSGxuRoJVIAfaCIfgOprG
        2catU7s4L/nir39RVaKeUFc/GByv6KkDiNG/r4KJn4gi+Gew0hJZLoVIXyXSpS48nfgUKDtL86v
        HgoE9PVyP5lMsTAjWqWZXgM6PghQHRdZ0iw0sHq+7sQZWHO8u/vESJ/zQhpcSxqbJ8SFGhoA=
X-Google-Smtp-Source: ABdhPJx1giZRAgIeXFpjAG5KSxpk989Qno1k7TkREma5PwT98TmjfclgOsSrAu4IMAE+Wa+EuJUsYGjDsk0V
X-Received: from kenalba1.mtv.corp.google.com ([2620:15c:203:200:4404:83b2:506f:fd71])
 (user=kenalba job=sendgmr) by 2002:a25:cbcc:: with SMTP id
 b195mr3104660ybg.236.1621470182778; Wed, 19 May 2021 17:23:02 -0700 (PDT)
Date:   Wed, 19 May 2021 17:22:46 -0700
Message-Id: <20210520002249.361821-1-kenalba@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 0/3] 64-bit Digitizer Serial Numbers
From:   Kenneth Albanowski <kenalba@google.com>
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Kenneth Albanowski <kenalba@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Still as RFC, here's a patch set to implement support for 64-bit
Digitizer Serial Numbers, following on to the prior discussion of how
we can support Usage(Digitizers.Transducer Serial Number) larger
than 32 bits.

My primary goal is making the serial number available via the
power_supply node interface, and the third patch implements that: if
CONFIG_HID_BATTERY_STRENGTH is enabled, and a hid report includes
both Usage(Digitizers.Battery Strength) and Usage(Digitizers.
Transducer Serial Number) then the generated power_supply node
includes a SERIAL_NUMBER of "DG-ABCDEF..." of the last seen digitizer.

For this patch set, I have not implemented any changes to MSC_SERIAL*,
however everything should be available for a future implementation. This
patch set does not change any events emitted by evdev.

After some conversation with Dmitry, I am leaning towards serial number
integration=C2=A0with the hid-multitouch protocol being the better long ter=
m
solution for evdev, as that fits better with combined touch and stylus
operation, as well as providing a clear means to=C2=A0providing multiple
serial numbers for simultaneous styluses.

This set includes general modifications to hid-core to decode and
represent HID fields larger than 32-bits as multiple consecutive 32-bit
words, allowing arbitrarily long fields (or at least as many as can fit
into HID_MAX_BUFFER_SIZE) to be passed upstream and (potentially)
processed by hid-input and other subsystems.

(After trying a 64-bit implementation, I decided staying with 32-bit
words kept the rest of the hid-core cleaner, and it was worth=20
supporting arbitrary length fields instead of only upgrading
from 32 -> 64.)

Kenneth Albanowski (3):
  [hid] Minor cleanup
  [hid] Enable processing of fields larger than 32 bits.
  [hid] Emit digitizer serial number through power_supply

 Documentation/hid/hiddev.rst |   6 +-
 drivers/hid/hid-core.c       |  99 +++++++++++++++++++++-----------
 drivers/hid/hid-debug.c      |  27 ++++++---
 drivers/hid/hid-input.c      | 108 +++++++++++++++++++++++++++++++++--
 include/linux/hid-debug.h    |   4 +-
 include/linux/hid.h          |  10 +++-
 6 files changed, 199 insertions(+), 55 deletions(-)

--=20
2.31.0

