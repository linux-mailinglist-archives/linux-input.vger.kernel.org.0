Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08E24DE26F
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2019 05:01:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbfJUDBl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Oct 2019 23:01:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45359 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfJUDBl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Oct 2019 23:01:41 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so6820543pgj.12
        for <linux-input@vger.kernel.org>; Sun, 20 Oct 2019 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53GjbEy/nsPj+4UEc+uvGOL1TBk0D0nk1iUE+20TlKo=;
        b=jcm/VieopYgxtYS44oxFj6QgkwNgRXoXDTSmNvVG7GYL7CqOJ9EESOt1eUJ9rfyiQz
         u+DmFP12HNUibIvRphyXYTuW15zFiJDmuj7+Y/huM9rW4T1MaGlvGoosHIRr+awSP2Tj
         /fbqImVbpaRMLpluTsKT2KWo168wQwK/sO8CE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53GjbEy/nsPj+4UEc+uvGOL1TBk0D0nk1iUE+20TlKo=;
        b=DP7LtagF5aWc2YpbqaoL1QN7FW0LOycp7QwSApjhLUxOBOYPnhnWvUCMIdk7BbJNjh
         l0xqMEzFvwnh87P6U0j9hvGHSLquxIRfcyl4GbnC+45jfeuENW5iUHFllIXxHMCxNlwo
         iRmuPJE3944keEsyIN7Mu4AvkYRJBAp97l4MCLm9xf8Aqyzw+ZHSVTt7ikt8kgKvUi3e
         y81s/2i0Pz3W3SAk+fFgwT0QvvI29E+0LeRFfUV1UhFMV1xCQRu81x6kLBh0Prx3jlnI
         HURxJF2JOcgu50/OQPM10VZ2GvJ5s221FAchu73yA40AfCozc2E2AKfgx3po47ZX42gV
         /GoA==
X-Gm-Message-State: APjAAAWNl/DMpPSgl9yJa63+R8xiJhboEZC2oai3WrXGcwJd0gkbK9eO
        KB5BMYBZiKGyRiZpfbtJWTaY/RMa1hQ=
X-Google-Smtp-Source: APXvYqxdAfBbfcbPnqcsZB+p1eFJqDEHK32FefwfhQ4gjfvT96ZE0PIyAnNC8G0GY4izGWXS5lR0Ag==
X-Received: by 2002:a17:90a:17e1:: with SMTP id q88mr26087406pja.134.1571626900517;
        Sun, 20 Oct 2019 20:01:40 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:10:254e:2b40:ef8:ee17])
        by smtp.gmail.com with ESMTPSA id c1sm17134623pfb.135.2019.10.20.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 20:01:39 -0700 (PDT)
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
Subject: [PATCH v2 0/2] HID: google: add device tree bindings for
Date:   Mon, 21 Oct 2019 11:00:52 +0800
Message-Id: <20191021030051.32199-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DT bindings for Whiskers swich device and its documentation.

v2 has no changes from v1, but
* dropped a patch not relevant to DT bindings
* Add more recipients (add devicetree@ and robh+dt@)

Ikjoon Jang (2):
  dt-bindings: input: Add DT bindings for Whiskers switch
  HID: google: Add of_match table to Whiskers switch device.

 .../devicetree/bindings/input/cros-cbas.yaml  | 25 +++++++++++++++++++
 drivers/hid/hid-google-hammer.c               | 10 ++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/cros-cbas.yaml

-- 
2.23.0.866.gb869b98d4c-goog

