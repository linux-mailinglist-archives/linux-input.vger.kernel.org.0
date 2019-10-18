Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBF79DBCC6
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 07:15:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394633AbfJRFPx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 01:15:53 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:42407 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393761AbfJRFPx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 01:15:53 -0400
Received: by mail-qt1-f194.google.com with SMTP id w14so7342012qto.9;
        Thu, 17 Oct 2019 22:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sV/yp4uqHU1crLu9pC0wLbsbQ7Aq/erC7q2I15YJ9GM=;
        b=t5Dq1zRK0HLlkQxAprLociv5KSGzvgFz+5sPaKre1VcMY33wWTuuneFzSnYSUoCu2G
         sXPNrKasrO90Ig5aBHRbAj5LQcWe6qrI+EVW2k+04kkKYwxWEbi+vD4n0XLmucqYRfut
         Rlv5UsbxiKkf6hDD2sgShaR1AJJzUM7YVS6vxLlKVXmjzXDLOCZRDGhoeO7fwLoSnSHo
         i58k0ACK1WM5uVXTQYuKBkaL2doDCWknHAbRJfdL+wNSlOQl3TDy6hSWOCNfoGi0NlV9
         PM8XaP6N2aWa20iczB0fWWD15XT5YFgxBHLdPN2LiXm6uBTJ/pf0YWWQ60ssjMI38erb
         Tdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sV/yp4uqHU1crLu9pC0wLbsbQ7Aq/erC7q2I15YJ9GM=;
        b=YjqRsgvlkfIDn70uYvRzKRyLzmMd8EsgKeQIh9yBVfQBoQpwdEYXog5kOlFkIDMSGI
         qExO6P/JST2JeIhlBfbh+il9a1VyQUusbo/PPjXOplArZlfMWpvmKaI7jAeaoC1yh+rv
         B93YIuWqirUD/WHPXBTk8zqpLF8DQL4rdZePxLgpSq61Q0AwRm3okfaDceXycxEWEtaP
         SiodGEXtnTIRCp+73WsR53g71zeCEutKPKkHkd4c4YGx2qqd7dK/emCOucOXZtBOidwi
         iPCtadsQSsj8Vv4T2VC3fN4JA5cKYzkycU6J19JJwYg2p5aOVcb0IQbwIy6fwrbMnGYi
         Zu6g==
X-Gm-Message-State: APjAAAXTwj/N2X14pbhHtNyiAup3Kk+p13MHxNbMveaAteZUtN9eL8jy
        /KxGxvUWb2KT0yKs88eyh+OBmFLboDE=
X-Google-Smtp-Source: APXvYqxwS4OmMdWzpIhS4OUmUBQs2MuOcVZMwEf0txmixcAcQSmOHd0XKjQ7cnDjYeLGBLad/wtInA==
X-Received: by 2002:a65:5603:: with SMTP id l3mr8009046pgs.56.1571373940009;
        Thu, 17 Oct 2019 21:45:40 -0700 (PDT)
Received: from localhost.lan (c-67-185-54-80.hsd1.wa.comcast.net. [67.185.54.80])
        by smtp.gmail.com with ESMTPSA id b3sm3696445pjp.13.2019.10.17.21.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 21:45:38 -0700 (PDT)
From:   Andrey Smirnov <andrew.smirnov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Andrey Smirnov <andrew.smirnov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Sam Bazely <sambazley@fastmail.com>,
        "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
        Austin Palmer <austinp@valvesoftware.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] Logitech G920 fixes
Date:   Thu, 17 Oct 2019 21:45:14 -0700
Message-Id: <20191018044517.6430-1-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Everyone:

This series contains patches to fix a couple of regressions in G920
wheel support by hid-logitech-hidpp driver. Without the patches the
wheel remains stuck in autocentering mode ("resisting" any attempt to
trun) as well as missing support for any FF action.

Thanks,
Andrey Smirnov

Changes since [v2]:

     - Fixes a buggy validity check "HID: logitech-hidpp: rework
       device validation" as pointed out by Benjamin Tissoires

     - Marked "HID: logitech-hidpp: do all FF cleanup in
       hidpp_ff_destroy()" as 5.2+ for stable

Changes since [v1]:

     - "HID: logitech-hidpp: split g920_get_config()" is changed to
       not rely on devres and be a self contained patch

     - Quirk driven behaviour of "HID: logitech-hidpp: add G920 device
       validation quirk" is replaced with generic validation algorithm
       of "HID: logitech-hidpp: rework device validation"

     - Fix for a poteintial race condition is added in
       "HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()"
       as per suggestion by Benjamin Tissoires

     - Collected Tested-by from Sam Bazely for "HID: logitech-hidpp:
       split g920_get_config()" since that patch didn't change
       significantly since [v1]

     - Specified stable kernel versions I think the patches should
       apply to (hopefully I got that right)

[v2] lore.kernel.org/lkml/20191016182935.5616-1-andrew.smirnov@gmail.com
[v1] lore.kernel.org/lkml/20191007051240.4410-1-andrew.smirnov@gmail.com

Andrey Smirnov (3):
  HID: logitech-hidpp: split g920_get_config()
  HID: logitech-hidpp: rework device validation
  HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()

 drivers/hid/hid-logitech-hidpp.c | 237 +++++++++++++++++--------------
 1 file changed, 131 insertions(+), 106 deletions(-)

-- 
2.21.0

