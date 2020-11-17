Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E035E2B6E92
	for <lists+linux-input@lfdr.de>; Tue, 17 Nov 2020 20:25:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgKQTX4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Nov 2020 14:23:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgKQTXz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Nov 2020 14:23:55 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DDA5C0613CF;
        Tue, 17 Nov 2020 11:23:55 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id gv24so1005742pjb.3;
        Tue, 17 Nov 2020 11:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=7wVntsemP9ehEOdhhr5hryJE+zcAnqwcXyn/Apa6u1U=;
        b=Gf94uDrcjVCw3DXaDvrYJe58+u7oMM9GM5zpDhEO9dZrPvQFztlYtaGKREFA/LFvAu
         9S/1Kx/ZbAmmAB1puly3yH6z5N2nxD8x05INw1v7UHB6ym2fNnIKO9tQKFqx9MgaCiq2
         nQaA55pT5SOp4VQFoVEcMAXoZM7OP+/5q+mr1KzKpn/ui/g4yuhrxpSbzKcK0nASIacL
         fg6wP5xUbvJWDAqfcyfr8zEnLMaZM91Ami/2Q5Rf0Sfhkj5rqg1PcPoVvkEetH8U4y4R
         KrlUx5sxT593XyTONH5Fve0Ft1IQkyML9QeC+2rbJf5t9qIxKSoWEuuKhsAFP4AehQmO
         mryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=7wVntsemP9ehEOdhhr5hryJE+zcAnqwcXyn/Apa6u1U=;
        b=XQr38XPOEA1xzY1bUHnD6fL017YF1Pp13p89eTHd4UCbOkLnTt/CGOxr9eP+gYWxRR
         auHqU9fvl6uUfZ+HQv9CSaWvg8W2Xrr0sUEtcg5GzJSI7xJh+lznkGKz1IEWcohnAxhY
         PPVUaMJgq+oHQRr9CN3GDZt5+RpltRoq6Lzvv3RnWnCf3G1RK0OVtnDp5qC2ubTsJ+ki
         6BRUIiK/NCxflf5q3340vHese1O5jMrVheUakSBExUIYrIBNZcaWis4zVqaFcuqjf7Mi
         397wvl+1mjoTJyzoFSY9luTHDNGZNoYEQXzCKJ08EpMSSQsYibTtLJfHG22/zKT5N50S
         3wmA==
X-Gm-Message-State: AOAM531evlcZWUBLOI3PLjWlPMsXlqq2qDQWr4QFSLdpCmdoCE9YjXbn
        QiEBjsG4NHu8rg98Ku+eilYuumF5cXg=
X-Google-Smtp-Source: ABdhPJyh8sCb9S7eltGpOELVvblOW2VIehziBfPaQcmQnX2zuW8Otp4c+xGslJplIrSzp8Ix1ZifkQ==
X-Received: by 2002:a17:90a:62c1:: with SMTP id k1mr548612pjs.135.1605641034799;
        Tue, 17 Nov 2020 11:23:54 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 5sm23934106pfx.63.2020.11.17.11.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 11:23:54 -0800 (PST)
Date:   Tue, 17 Nov 2020 11:23:51 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [git pull] Input updates for v5.10-rc4
Message-ID: <20201117192351.GA2362934@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git for-linus

to receive updates for the input subsystem. You will get a fix for
"use-after-free" in Sun keyboard driver, a fix to firmware updates on
newer ICs in Elan touchpad diver, and a couple more of drover fixes.

Changelog:
---------

Dan Carpenter (1):
      Input: adxl34x - clean up a data type in adxl34x_probe()

Dmitry Torokhov (1):
      Input: sunkbd - avoid use-after-free in teardown paths

Hans de Goede (1):
      Input: i8042 - allow insmod to succeed on devices without an i8042 controller

Necip Fazil Yildiran (1):
      Input: resistive-adc-touch - fix kconfig dependency on IIO_BUFFER

jingle.wu (1):
      Input: elan_i2c - fix firmware update on newer ICs

Diffstat:
--------

 drivers/input/keyboard/sunkbd.c      | 41 +++++++++++++++++++++++++++++-------
 drivers/input/misc/adxl34x.c         |  2 +-
 drivers/input/mouse/elan_i2c.h       |  2 +-
 drivers/input/mouse/elan_i2c_core.c  |  3 ++-
 drivers/input/mouse/elan_i2c_i2c.c   | 10 ++++-----
 drivers/input/mouse/elan_i2c_smbus.c |  2 +-
 drivers/input/serio/i8042.c          | 12 ++++++++++-
 drivers/input/touchscreen/Kconfig    |  1 +
 8 files changed, 55 insertions(+), 18 deletions(-)

Thanks.


-- 
Dmitry
