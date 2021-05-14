Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8909A380962
	for <lists+linux-input@lfdr.de>; Fri, 14 May 2021 14:21:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbhENMWx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 May 2021 08:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232963AbhENMWw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 May 2021 08:22:52 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D110EC061574
        for <linux-input@vger.kernel.org>; Fri, 14 May 2021 05:21:41 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id t193so11443676pgb.4
        for <linux-input@vger.kernel.org>; Fri, 14 May 2021 05:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KAk0g8z1opxg9hfh3kwLSOD5nwvqQ9x4A08bZ0cKY9w=;
        b=Vv7GxJ+avWscMnlmLiMf6D2oS3wGO1ZcpThAMmHGb1DHdUM4W5Rz5+MqtZQQpZRUrS
         xrc1dl/g5MLarwNbqEr652jU1Pt96IEPpDYjqr0wJ916PYRX8DkDHb6EAbvUZ1vg2G5i
         yZi63vZzjFy+3tC6zNYdS35rQF71aPLopWObk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KAk0g8z1opxg9hfh3kwLSOD5nwvqQ9x4A08bZ0cKY9w=;
        b=Wr/SAGo4gB2Ewx+j/smcL9IE6hYJ6u3cbcXzKWf/QPV/nr1K0GzrfVdQ1PdEZa94O/
         KtnnL8vp9JSDjaSLObpWq8UKbaQ3akzeOaJOwbx2t2TXF+6/1C31bI6kgZZfkdjbdGGy
         ejrd0kQdrEtbwH9pt1GeQe+xzrfjgt3Q05ETiuodxD0GoCEs/PWjrkMLxniYDbvWW3ko
         Rqc0qdqKKza4iqFKgUKVfog0hA4a+N4D0ch3EsQJdhZPJMPJnnSUqXb4ukH4rxA0DX8R
         BQ2MR1uEfPj88WR7IuXk5nSi2/3enLCDq3bkKC6+o9Vm102vhQUx71okx7P0vik/ceKO
         aEUA==
X-Gm-Message-State: AOAM5338D4H5gcR+c1jpErQeLj+gbmeUuxYWKva678hIV/zQ9jXV9gkl
        dZ/6eTYUNVzQmeWDJ58kYxEV0w==
X-Google-Smtp-Source: ABdhPJwt4o8oA04eyCHn4vJGf09Zt3E8GowUbhMUPyQDnK9/ps6C0oIEWEaLnH+zB0o3wMGm5mLzZQ==
X-Received: by 2002:a65:68d5:: with SMTP id k21mr40662150pgt.383.1620994901377;
        Fri, 14 May 2021 05:21:41 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
        by smtp.gmail.com with ESMTPSA id u17sm4010117pfm.113.2021.05.14.05.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 05:21:41 -0700 (PDT)
From:   Ikjoon Jang <ikjn@chromium.org>
To:     devicetree@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <groeck@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Benson Leung <bleung@chromium.org>,
        linux-input@vger.kernel.org, Hsin-Yi Wang <hsinyi@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Ikjoon Jang <ikjn@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v7 0/2] Add support cbas tablet mode switch to mt8183
Date:   Fri, 14 May 2021 20:20:48 +0800
Message-Id: <20210514122051.266169-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Adding a cbas support for kukui platforms which has a tablet mode
switch through cros-ec interface.

---
Sorry for resending v7, I found some CCs were missing
and errata in email addresses.

Changes in v7:
- remove a label in cbas node in mt8183-kukui.dtsi
- fix an erratum in commit message (table --> tablet)
- dt-binding patche merged altogether with mt8183 dts

Changes in v6:
 - Remove a label for cbas node in a example of dt-binding doc

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
 - Define cros-cbase bindings inside google,cros-ec.yaml instead of
   a separated binding document.

Ikjoon Jang (2):
  mfd: google,cros-ec: add DT bindings for a baseboard's switch device
  arm64: dts: mt8183: add cbas node under cros_ec

 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 ++++
 2 files changed, 24 insertions(+)

-- 
2.31.1.751.gd2f1c929bd-goog

