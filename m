Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E04360078
	for <lists+linux-input@lfdr.de>; Thu, 15 Apr 2021 05:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhDODa3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 23:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbhDODa1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 23:30:27 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0963FC06175F
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 20:30:05 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id z22so6153291plo.3
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 20:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GvsX7qkA/jJYB/kaGhlB4f/SEwZSfr+xVJPIWqSWblQ=;
        b=XyR5JaiEjLdVLfe7kMSbUpCezlukHn1FRwXaQyTrO0KQGnVg+rpfAokH1d/3ttKGUz
         ZYPv90o5q/8NQl0Mu19Zodv61T3ggjfhnqvIa6vXUxaQa7dT/2JZI/qg8nDzwMBUOJ8K
         12AFdV62kVPPOhTfln7fqjdb0Ctcs6YSwrG7A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GvsX7qkA/jJYB/kaGhlB4f/SEwZSfr+xVJPIWqSWblQ=;
        b=ABZ2FtSMXzUfH3q4rPFAnZU3CX0LcR3IR1gzVDfKWM7ENn4vx2feDb2AccNx+WtLCq
         By2eQNXcXLVJzQi0K0/x7A0N4tdkj+h3yv4sON4gUBBjnEe/uYYgkAPerK6J58VL8MOR
         tcuUO9nM0rzNIlNQEcFCpBKEU76L0g7zgyDx5uS5R91ZfvC0N4ADFQwNkPaQyp7BiMUq
         biex1ewNJBNwMdAaoss+hzKt7ghAQmn5Fz5TxfLjJLmzX3J1qs1I4YLvil0pL1IWKUgJ
         SJoe29txl2rfr4YkTGJ1wU9NwRBlUTXzsyIeC3Md6cUohK6bMUrDxUIhBP0yixODiI9R
         q5Iw==
X-Gm-Message-State: AOAM533Z2PjtjKL2d2i1/X7BnST6E5pJ3hlfQG/zA3a07E80WVL5sJYz
        tCEgiQDxcGrY0+01S73Mb7KIwBIzYZPyhw==
X-Google-Smtp-Source: ABdhPJxUUfiFPUBBzwmICMHwGDD2yHq20aF5+8gQd99wX9xkVxlGC41VTmQVGYHoqjvv3QdY0zUn4A==
X-Received: by 2002:a17:90a:dc07:: with SMTP id i7mr1500541pjv.16.1618457404133;
        Wed, 14 Apr 2021 20:30:04 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:2d50:863d:8932:d6bc])
        by smtp.gmail.com with ESMTPSA id n3sm351622pga.92.2021.04.14.20.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 20:30:03 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dtor@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/2] HID: google: add device tree bindings for Whiskers switch device
Date:   Thu, 15 Apr 2021 11:29:56 +0800
Message-Id: <20210415032958.740233-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add device a tree binding for a "cros-cbas" switch device of
ChromeOS tablets with Whiskers base board.

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
Define cros-cbase bindings inside google,cros-ec.yaml instead of
a separated binding document.

Ikjoon Jang (2):
  mfd: google,cros-ec: add DT bindings for a baseboard's switch device
  HID: google: Add of_match table to Whiskers switch device.

 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 drivers/hid/hid-google-hammer.c               | 10 ++++++++++
 2 files changed, 30 insertions(+)

-- 
2.31.1.295.g9ea45b61b8-goog

