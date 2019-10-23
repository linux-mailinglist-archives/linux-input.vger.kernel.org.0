Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF6F1E1021
	for <lists+linux-input@lfdr.de>; Wed, 23 Oct 2019 04:41:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389185AbfJWClQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Oct 2019 22:41:16 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42094 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730655AbfJWClQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Oct 2019 22:41:16 -0400
Received: by mail-pg1-f194.google.com with SMTP id f14so11170905pgi.9
        for <linux-input@vger.kernel.org>; Tue, 22 Oct 2019 19:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=67e1Q0MOW3JpeTjPpBwrGL7Br8C/8KI2Kwh1vAn3ymg=;
        b=iU2oyWeXXlCDX5qFs3nFJrMsiKp4OWnDWapu3NEeIHQCI3wOOyoQ1E4HhciKoLO3Gf
         RHahVLm3qvxgaVRWkXgLWFM9sNdlSF9SDtpi5mZXHGc6RRTsXMwkojC+XOjcNQiO71hd
         U4pRNr3XkLY3OqdDVmwFaYiKNXZT9bzVU3ZrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=67e1Q0MOW3JpeTjPpBwrGL7Br8C/8KI2Kwh1vAn3ymg=;
        b=E/a8kt91ju7mQDojHNV9QWVwhlOA+8pn8tOQZFryeDbWXobc4xC2mGYo2xSr/NioX+
         25IW4NZ3624w27OM0YXOiZdUUU/Ub1uJ2RNfXwCWb7xLy/RHMMqifPdNwZqKi3RKgtTH
         T+UAr1f4les8BFRVqYsx9gbmOvTz7UYupyRpiD9v9A/AxqTaPwUbqfICkd3TSkxJ8AFK
         BlBEbjqdus0aOzk2I10Ob9bQ4Iev+qfMEJsZFdl/ggbxS6/2LcslmsM1EgUdtoKJia6j
         PFjo3dJW0UG/+ngVicuNQlkxa64yAEPYfmsQHuOmPZORUpYM/rPiRz9dOLbl3dtyoJPq
         VRZA==
X-Gm-Message-State: APjAAAW239x+g08wawy0dUMaOM7jdKq9lQr7oA9KYkDOr7jHAQ8zsAuu
        mJXMuZoaNnXv0QkRg6QuhMHq7Ox84E0=
X-Google-Smtp-Source: APXvYqwXnfEK8HCYKm0YIv9h0z8cNUUeG188FZOP6II9/7y0akJFVN1LoQsVcDAkgDFgnzevGkW2Qw==
X-Received: by 2002:a17:90a:1b2a:: with SMTP id q39mr8559698pjq.119.1571798473820;
        Tue, 22 Oct 2019 19:41:13 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id 139sm4073338pfb.78.2019.10.22.19.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 19:41:13 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     linux-input@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        Nicolas Boitchat <drinkcat@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 0/2] HID: google: add device tree bindings for
Date:   Wed, 23 Oct 2019 10:41:03 +0800
Message-Id: <20191023024103.225771-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DT bindings for Whiskers swich device and its documentation.

v3: dt bindings description changed
v2: dropped a patch not relevant to DT bindings

Ikjoon Jang (2):
  dt-bindings: input: Add DT bindings for Whiskers switch
  HID: google: Add of_match table to Whiskers switch device.

 .../devicetree/bindings/input/cros-cbas.yaml  | 22 +++++++++++++++++++
 drivers/hid/hid-google-hammer.c               | 10 +++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml

-- 
2.23.0.866.gb869b98d4c-goog

