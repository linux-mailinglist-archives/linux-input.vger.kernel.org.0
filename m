Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8D34CD1E
	for <lists+linux-input@lfdr.de>; Thu, 20 Jun 2019 13:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbfFTLvm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 20 Jun 2019 07:51:42 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42280 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726391AbfFTLvm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 20 Jun 2019 07:51:42 -0400
Received: by mail-wr1-f65.google.com with SMTP id x17so2688339wrl.9;
        Thu, 20 Jun 2019 04:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96Go4rPJQEtcKvxvDEzsJJuj+W2bYPYU8UdDTcqGGh8=;
        b=rKmSOdqg3lCj3oK0q1utDN1n/JQsDtCFdrUI5DoeZlG6vW4zCD1GCxbNeQ86FGvHtE
         MPrzRiX8/eXHpHySNhhFNxyMGrLKe/UtI40af7qzdwpdxVSJbcJlTWx4ediGDfTLKsxg
         vyfmNn3sTvIwDMclJwPg8JWVRBOE9sND3cCO0wxkiAbv6kNgjefRfACIVH1fSEicQREZ
         1pBrxS7VdozZCEbruU6P6bn+VtLI/7JkIeby1IbHl1F6qSQrlnZ2JQNLyi8J/jG8ucbr
         OOru3CdpMEqmawNjMAlsgHaSgVCSAYwAfPdCnyybSff1BYLoS11X9CcS27rkb5rt8suU
         tBQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=96Go4rPJQEtcKvxvDEzsJJuj+W2bYPYU8UdDTcqGGh8=;
        b=VglLVY0e1RiWRXtvAjdJWE6/BA28aykq5f0MoqVE2PNaZ2fjruihkzqXILaVOU2dBZ
         BHDo4q7mcGRUE+6/K+ToAlJ8c5toCfOV6JkqcYn2BihKUH/s86mh/rEA53g4Iij5AAtV
         LDWHbre1NS9qz3SW70kIDJWLHnto8r8cLaHuQUAPgVDGpWzCVm33mLwb5iTGqmTmmws6
         uvqtwkTiM9pbgo5Sg59BtEK4RG0BuggxI8Un/0FQxoloBjwpMMOTGCTBkki9QZDnWYo3
         V58Mpd4Io8yfXyp4ZAFOElTPUi3PhpkOJVYShH9/pwdqjk6ve/9AD2krM3ef7kDg4bhG
         +GaQ==
X-Gm-Message-State: APjAAAWgIsQ6cvEne5ubNvkOttgWsfmPkgKGakDsswoCLrVk86Kg8QPM
        h6wBsIqRHPDUbJGHmRR05fjMm9ij
X-Google-Smtp-Source: APXvYqxhqJdyQkUJehlXfnY/gXjhYcoFvOtcwmE9WImKcxs+LMXAzcj8srgcHbBqbNI2Yqwps+WmsA==
X-Received: by 2002:adf:c614:: with SMTP id n20mr34300781wrg.17.1561031499425;
        Thu, 20 Jun 2019 04:51:39 -0700 (PDT)
Received: from xws.fritz.box (pD9E5A621.dip0.t-ipconnect.de. [217.229.166.33])
        by smtp.gmail.com with ESMTPSA id s7sm7918213wmc.2.2019.06.20.04.51.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 04:51:38 -0700 (PDT)
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
Date:   Thu, 20 Jun 2019 13:50:54 +0200
Message-Id: <20190620115056.4169-1-luzmaximilian@gmail.com>
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

Maximilian Luz (2):
  platform: Fix device check for surfacepro3_button
  input: soc_button_array for newer surface devices

 drivers/input/misc/soc_button_array.c     | 134 ++++++++++++++++++++--
 drivers/platform/x86/surfacepro3_button.c |  38 ++++++
 2 files changed, 160 insertions(+), 12 deletions(-)

-- 
2.22.0

