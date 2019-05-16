Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 820DB20983
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2019 16:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfEPO0n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 May 2019 10:26:43 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]:39807 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfEPO0n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 May 2019 10:26:43 -0400
Received: by mail-wr1-f47.google.com with SMTP id w8so3646620wrl.6;
        Thu, 16 May 2019 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUmsapdPYG6bp652zPn+NzbRoqrSwbAyyYlD6+mB3JE=;
        b=Bhjzbr0kd/1H2iMGGWGKcFwaoanS/0rleHShFPO7OsTIgPL4hCdpLQjIl+wEc8IBEL
         LO3PTQ8QqWTjcYAaKRy54RZELK1c9O49xmbIk8X5TXoilQudWo1r/OqhXVWZO/yQ6TY3
         o0DTNWlJ0nmOD+gDxarap67H4ZU0lKJG3HSZgaUfJzdMU/3/BzF6VQb+meeqqMTBMKnd
         RHo4T2qRP1gv+sZ8jtlnFOvG0vcYzpExFAGVFCvQaXuMkgbCYTWZ//X5nxHhYiszJ1Sq
         M854ahb7m/D+6A+mxaEpWwTm4htV5YEYI2H9/iBw/eKtghqVuLTExS/9/jUJu9lzL9bv
         AwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lUmsapdPYG6bp652zPn+NzbRoqrSwbAyyYlD6+mB3JE=;
        b=VDA8MpFIp5zbRWOAkZDbY9NcDtWY5ix3VQyrlFetYZrRXikt8pCCGc6T/NKAz1SJSd
         Lo8si0Lo1/w8RsEPhapTB2jpteEtcM2E0/djCUQGfHj/3EFqnqQz+uy7D6WqkNs9h65L
         52TUxITBBYW1FmGGsYBG4LMg3pQRsrLEplq/BMnciH5hZ52yowtRruH+WYetjmdaqggd
         aZHoNjYgmCi9ATN12DeiS1DUDoSb/CXwTSLgTIPnlrpzkdrdLM/lE09pE4u2BlN11dYI
         I1wI232jY5TpRfjWRNysWk6CjQfZumk+ONnt40CLKI16s9B/Etkhq4MqPkMnBXezSUQY
         ZVDw==
X-Gm-Message-State: APjAAAW8vDH3c+6vLvp88R4v6TdpGjdq9ISlo+Pa4ynFIonGE3mAXS22
        c1c72i1Fur7XumvQ6B6x82I9OgujMAA=
X-Google-Smtp-Source: APXvYqz8KWbolH8G2m4rSMx+jji9yTY1gYw6IoJ46yLo9d+QCu8HVmHuqr9r1iEmLayLeRRCaBq6Vg==
X-Received: by 2002:a5d:658b:: with SMTP id q11mr11748075wru.130.1558016800923;
        Thu, 16 May 2019 07:26:40 -0700 (PDT)
Received: from xws.fritz.box (pD9EA30D0.dip0.t-ipconnect.de. [217.234.48.208])
        by smtp.gmail.com with ESMTPSA id q4sm4852427wrx.25.2019.05.16.07.26.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 07:26:40 -0700 (PDT)
From:   Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Chen Yu <yu.c.chen@intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Subject: [RFC 0/2] Support for buttons on newer MS Surface devices
Date:   Thu, 16 May 2019 16:25:21 +0200
Message-Id: <20190516142523.117978-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.21.0
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

Maximilian Luz (2):
  platform: Fix device check for surfacepro3_button
  input: soc_button_array for newer surface devices

 drivers/input/misc/soc_button_array.c     | 134 ++++++++++++++++++++--
 drivers/platform/x86/surfacepro3_button.c |  38 ++++++
 2 files changed, 160 insertions(+), 12 deletions(-)

-- 
2.21.0

