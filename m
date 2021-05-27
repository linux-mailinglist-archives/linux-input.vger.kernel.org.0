Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9441C392FEE
	for <lists+linux-input@lfdr.de>; Thu, 27 May 2021 15:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236505AbhE0Nmz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 May 2021 09:42:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbhE0Nmy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 May 2021 09:42:54 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9191FC061574;
        Thu, 27 May 2021 06:41:21 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id j14so4802012wrq.5;
        Thu, 27 May 2021 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mRVNjU7EVMPfm2tJ8ewxcllQhMQHsHcpye39BjUXEo=;
        b=HlX74lXKDHNrWlpJg3jfHSoEUiH/WLpOaUvXbb09fqH8oVS09AWphQSz+KPZYc/rvU
         aDW/DbqbD2ZRVFr6CWDZqmPYSCzqSV+tiFvIIIm6vQ12Kx0zin3fmcemolkGRc4J7eGe
         ut/7Qo+1nnSO3skv9ZoYWbj0yV0LK13zleYJsBxXDCBX1K0X+ReUZIg+YlE/fJ9VMv96
         YesbDMWWPIbaTPin4xfk0I4Gmz3vYRRoo4QssNlaxpwYfTuj5zt8M267QJsrU/w/Emgc
         rs/fk5Rc83TPk4sMjKlo69hVujhpI6K6qG88gtLy93/qOTTvdfhUZ0Cc0wDIuZ09LXv0
         z6nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mRVNjU7EVMPfm2tJ8ewxcllQhMQHsHcpye39BjUXEo=;
        b=WtznvMqrNAYzn1tYjFvmudHF70G3RUYdmaIj5D8TxUGvOZ0vRtcN9aVkOfohWJJVSD
         oi+Ad7Rbn8NRRRn73242wvsy6LVEO8aRSkedr+RGq7CUa4k5VNPWLPbE0A2QEGSzrWWG
         ihmdb78xgmge3tS1ve8syeB/vIWjRdPPAKYoESxr04Dr4EIoxanAVIACQFibKAEkoS1n
         x54eGqjXZXbl6Hw47FVqLrZhti1vzLlA6tkfrIl8YI2evKyjnlZTxIKu5KqYNwqU/H4t
         jBJoYBSa363tawUUOkNvZ4urz+7d5Wz0F0pMTSVTgzsdWiCr5pgQ/EFBavrgvGLdWQQW
         Qzjg==
X-Gm-Message-State: AOAM533XlnYWrKyczpCMDs+ZfLpSk+jXhifZjdXGOFHyTzK54q1DwrKX
        4aSYn1MSiEAvuPyyUY+BHICTLFIvCC6nC64h
X-Google-Smtp-Source: ABdhPJwg0zgFrQ0D6KPkFMbRadEZ+cNtnr4neJEo+SlKBR8QbFVXKXAAgojqevms/EzY7+lQrm1Eng==
X-Received: by 2002:adf:f309:: with SMTP id i9mr3567261wro.307.1622122879837;
        Thu, 27 May 2021 06:41:19 -0700 (PDT)
Received: from caroline.lan (233.119.189.80.dyn.plus.net. [80.189.119.233])
        by smtp.gmail.com with ESMTPSA id b10sm3741284wrr.27.2021.05.27.06.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 06:41:19 -0700 (PDT)
From:   Erica Taylor <rickytaylor26@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Erica Taylor <rickytaylor26@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Matt Reynolds <mattreynolds@chromium.org>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Sanjay Govind <sanjay.govind9@gmail.com>,
        linux-kernel@vger.kernel.org, Simon Wood <simon@mungewell.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/2] G923 Racing Wheel support
Date:   Thu, 27 May 2021 14:41:02 +0100
Message-Id: <20210527134104.217865-1-rickytaylor26@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These two patches add the G923 to the two drivers which support it:
xpad & hid-logitech-hidpp.

The device boots up in Xbox-mode (which has some support out
of the box if added to the xpad device list). However, Logitech
use the HID++ protocol for 'PC mode'.

I've added code to xpad to perform the switch-over
and device information to the hid-logitech-hidpp driver.

With the hid-logitech-hidpp driver the wheel seems to have pretty
good support. As far as I can tell, all inputs & force feedback
work.

Erica Taylor (2):
  HID: logitech-hidpp: add G923
  Input: xpad - add Logitech G923 Xbox variant

 drivers/hid/hid-ids.h            |  1 +
 drivers/hid/hid-logitech-hidpp.c |  3 +++
 drivers/input/joystick/xpad.c    | 30 ++++++++++++++++++++++++++++++
 3 files changed, 34 insertions(+)

-- 
2.31.1

