Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9156244979
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 19:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbfFMRRg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 13:17:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42310 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727888AbfFLVTt (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 Jun 2019 17:19:49 -0400
Received: by mail-pl1-f195.google.com with SMTP id go2so7130980plb.9
        for <linux-input@vger.kernel.org>; Wed, 12 Jun 2019 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=I+oadKCGkdADPTetiG+5fmEj4h2AfFTIGD0pUXHAfAI=;
        b=ImvFSpLHjaQDlhOW7g1hVtYRjlA/Pu9n2k1PvK+VlN5nvl0F62T4RDeZMs5j/oDYb0
         sx8MJMDXRC+hQjSjO7Pqr7h6/jgATuevI3k+UmnXVjWKaoCUL2t08U0i0nP5UsLgAKe8
         Zom9vYJ1kMeS0n+wSmRPHl9qicHjw0AEXJK2uvJalUEc50Li0QZcwWZTTRqIPb1E3KDf
         CuDbDQm9jhCMCAvD4Djo+DDlRsjmTVrBaxuCBXQcguZQKXXskc0+FTJCMO1L8fjp6GNA
         kfFSiojDhPe02OVhm7CgwZ+tTnr3v4s6GnGGs0Prmu5Jl5ImzgM/08aYgwH48VFlIrkn
         bWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=I+oadKCGkdADPTetiG+5fmEj4h2AfFTIGD0pUXHAfAI=;
        b=uLbK/771r+tgx5UGiCNbLpugvZqu7Y43haAFhmn1GVYQK6BoBOAcx5jYmn4e1T5y3o
         zx44IP8xT3La6zZzUdcnkQ/TsJW0nWxxx5LR5wuZSI7zXsGEKQ4Hy1XpumVnNl8NskUk
         Vou0QsOe7wz0iB1YdhewcYQDYVYGdAOKbmnFZ7xr88gQ9V0Kbwxqv2370XAVRd31ydUP
         9wJaad3bCNpL9zMYlyTwmi2dTtKdG6PTR2v1x2IvfMDlM5Icu6TOiSZH/8eD9VbaTflf
         a65uGeSc+jPa0haoTAAqlOCdPaBkSjezdxfUTFEREZKmkf4uwZObqJHZoP+N1nE9oTRw
         RZfg==
X-Gm-Message-State: APjAAAWFZy709PRCJQ7t/BDTFIBrl1dlsgx/WJI+ysLsSwvWSk60OE/R
        WHmyo82RIjCo2ZJE5LniVZqgreguTTnmfg==
X-Google-Smtp-Source: APXvYqwlGIqWwO7law+5eqMf5kp66vFZgEu3uEdfCNoT6O7h2QJaiX5jR13ge5VQ0SwsiaUgtvwOSA==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr83157624plc.2.1560374388261;
        Wed, 12 Jun 2019 14:19:48 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id m6sm423283pgr.18.2019.06.12.14.19.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 12 Jun 2019 14:19:47 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH 0/4] 2nd Gen Intuos Pro Small - Second set
Date:   Wed, 12 Jun 2019 14:19:27 -0700
Message-Id: <1560374371-2688-1-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The first patch here is a v2 patch for the 2nd gen Intuos
Pro Small. It was part of my previous set, but this one patch
needed to be rebased to apply to for-5.3/wacom. No other
changes were made to the patch. The rest of that set is
currently in for-5.3/wacom.

The remainder of this serires was occasioned by that same
device. Though the Pro Small unfortunatley did not ship
with a generic HID descriptor, these patches will ready the
generic code path for the touch component of Bluetooth 
reports.

This set is based on the current for-5.3/wacom branch with
68c20cc2164c ("HID: wacom: correct touch resolution x/y typo") at
its HEAD.

Aaron Armstrong Skomra (4):
  HID: wacom: Add 2nd gen Intuos Pro Small support
  HID: wacom: generic: read HID_DG_CONTACTMAX from any feature report
  HID: wacom: generic: support the 'report valid' usage for touch
  HID: wacom: generic: read the number of expected touches on a per
    collection basis

 drivers/hid/wacom_sys.c |  10 ++--
 drivers/hid/wacom_wac.c | 125 +++++++++++++++++++++++++++++++++-------
 drivers/hid/wacom_wac.h |   2 +
 3 files changed, 111 insertions(+), 26 deletions(-)

-- 
2.17.1

