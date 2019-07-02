Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 059975C658
	for <lists+linux-input@lfdr.de>; Tue,  2 Jul 2019 02:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727013AbfGBAiW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 20:38:22 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41524 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726977AbfGBAiW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 20:38:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id c2so15705097wrm.8;
        Mon, 01 Jul 2019 17:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rVse8/70KlRnkr5stKb0afx2GZVUTkz5Ky6nNvkWhJ0=;
        b=Mp6hT5stYzvQtGeKyvVabtSyO3oGCif0JCNJnawAzS+mi7cc+RHZI98200JnEL9zON
         PlFFHKKFyp6AM7nHKr2tlWCSNmodub8BKny91xO2p3P4NmF2OWwaeOepQXJyCB50SKDC
         Lcfbp4qBcgTxOFZUW2W0A0ObhDOMHdI1zHTrEqTETllUIKHij1j9cS6g+szV01BTtUdJ
         xwNgepa6eMBvZ38Qsrm8GJVT3IbFTgP6CcYdHVx0lmhxYuee2LaxGnfc0DaSkhGLy/i8
         j/wvQcm7ZT1mNNG601I0Jy/xBh+3RiM9C5NicAXQqcnAxGWSkNI2rvCI1nqruK0kGw3L
         /buA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rVse8/70KlRnkr5stKb0afx2GZVUTkz5Ky6nNvkWhJ0=;
        b=fdElCcsyo9RtXC5WIW1JflZmmUh80gzrR/nmJxGA1SwIBbv8TQ244ljbEHQek3qTCD
         Dbjp6ZGtY+iZ2iRw0aH0YNEuKrsyGVuvBhaprkleB/r14ouDlY9DQaxxkjCNJc/OXT4l
         OwckXnAk46wMVRGRO23FBy4kE84fuKL/8w7Fue+tlzAVhYbtn3jrbQbLy9Y3bcKlzer4
         6VrF7/ZJ9JRPKt8VANtJb1etVaATtTsSjiNt30LDOZ0Un9E2qm9qubbNl/MFcErml40z
         BYubG/BCof6NtJH9+8kyXx6yEcf9swkQc94ivM4cxZECuB0eVjtQJpyCLCbFHbKXelxS
         28Hg==
X-Gm-Message-State: APjAAAWO1ORoriea8I2af0L1+24Sqqx6cl+DT/PlBL17/PqUoZzsfWyZ
        XltIRu+6OEsOoOk0x/HZdysIbRrT
X-Google-Smtp-Source: APXvYqwnDuKCY+1R6+H0PCy5dnftOcQI0vFvHorJDmI1wACNuVm6Iy06UqHrDNE4S2fFVLJ5G3zoqg==
X-Received: by 2002:adf:ec49:: with SMTP id w9mr19308394wrn.303.1562027899417;
        Mon, 01 Jul 2019 17:38:19 -0700 (PDT)
Received: from xws.fritz.box (p5487BBD4.dip0.t-ipconnect.de. [84.135.187.212])
        by smtp.gmail.com with ESMTPSA id 60sm3066087wrc.68.2019.07.01.17.38.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 17:38:18 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [PATCH 0/2] Support for buttons on newer MS Surface devices
Date:   Tue,  2 Jul 2019 02:37:38 +0200
Message-Id: <20190702003740.75970-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series adds suport for power and volume buttons on 5th and 6th
generation Microsoft Surface devices. Specifically, it adds support for
the power-button on the Surface Laptop 1 and Laptop 2, as well as
support for power- and (on-device) volume-buttons on the Surface Pro 5
(2017), Pro 6, and Book 2.

These devices use the same MSHW0040 device as on the Surface Pro 4,
however, whereas the Pro 4 uses an ACPI notify handler, the newer
devices use GPIO interrupts to signal these events.

The first patch of this series ensures that the surfacepro3_button
driver, used for MSHW0040 on the Pro 4, does not probe for the newer
devices. The second patch adapts soc_button_array to implement the
actual button support.

I think the changes to soc_button_array in the second patch warrant a
thorough review. I've tried to make things a bit more generic to be able
to integrate arbitrary ACPI GPIO power-/volume-button devices more
easily, I'm not sure if there may be reasons against this.

These patches have also been tested on various Surface devices via the
github.com/jakeday/linux-surface patchset.

Changes since v1:
  - [PATCH 1/2] platform: Fix device check for surfacepro3_button
    No changes.

  - [PATCH 2/2] input: soc_button_array for newer surface devices
    Ensure the patch compiles without CONFIG_ACPI.

Maximilian Luz (2):
  platform: Fix device check for surfacepro3_button
  input: soc_button_array for newer surface devices

 drivers/input/misc/soc_button_array.c     | 145 ++++++++++++++++++++--
 drivers/platform/x86/surfacepro3_button.c |  38 ++++++
 2 files changed, 171 insertions(+), 12 deletions(-)

-- 
2.22.0

