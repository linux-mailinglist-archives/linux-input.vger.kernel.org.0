Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BE7044E8E
	for <lists+linux-input@lfdr.de>; Thu, 13 Jun 2019 23:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfFMVfn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 17:35:43 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51686 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfFMVfm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 17:35:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so253297wma.1
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 14:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:in-reply-to:references:subject
         :mime-version:content-transfer-encoding;
        bh=JgPinWU9uO27scI4uIGAO2xs7o2fJxcjXcarXJZN3dc=;
        b=KjjFr+TGCFayJ9MQnIBAgLwa/BvUSDkfY7Lvf2IdqvPjcAQ0soeRx75MbpxXuAK/+T
         P8RBocnUn9L6XnHPrUzkFmCZsS1z8M4OStVQl/xD/wGl41qXCEapo2F+bEX3gfQeBZwp
         3aCFglSiE6al0xgLB1J1UK4iks0QH5kyFlcodYbEkjO/fz4ll9a55USeG/UG9fGWM3SG
         KFpQlRofHSeiqMlnmfDwXROfzMHBaUAs3iYHlgii/mHXUx9zSh18b3I0yLPF4t2cRfvR
         AZt3NJEKvPipdQC9ejZ+5Gpao92o+UaQ+wrjuMt7BxctYqFQabLw9warZIscxMSOnWx3
         abFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
         :references:subject:mime-version:content-transfer-encoding;
        bh=JgPinWU9uO27scI4uIGAO2xs7o2fJxcjXcarXJZN3dc=;
        b=ka0YRQ6RDpv3KTntNYSlDOSaOV49OpfaClB7PxdjexBc6GKjHWKcy5mD9P2Mer2jQ9
         kduycEW5L486XP3eIj68AzM+bHptwnNQnzf6TsxieiHicU99iNb6NYLY1JKWDeERa87a
         x494T5DJ+IG66vuca8Q7Q9fsbkcWpcbzqyyhm/C40AIQdAUce13J7ErhqkHQbQAIHu8/
         hL5sikXm+7s20QtbZp8MrZCSW37kHPvBqdstfVEcgfaT+dnsT6WP7QaWZmHlgjjxGczi
         HIQA4JuJPlXzyYSgWdzizrG5jL0HOsJlCIb78ko+XhDeolCEqCc3KqMOCZbCH8e/h8pM
         FBhw==
X-Gm-Message-State: APjAAAX2XGW9V2Rp/tQ2SiKGw0kynk5yUcZyjg6kyb6Onz0roTakiBgj
        yHRBbYA9rp0cWfjBg2ANJk4=
X-Google-Smtp-Source: APXvYqxfMiTTwig8jzBFvePFV6wO7AHZeQpZ1wDvTEr1ML+cRDZDWVuebPxZjlY/CUnSdPMcd50JNA==
X-Received: by 2002:a1c:3dc1:: with SMTP id k184mr5377765wma.88.1560461740349;
        Thu, 13 Jun 2019 14:35:40 -0700 (PDT)
Received: from [127.0.0.1] (host86-139-49-132.range86-139.btcentralplus.com. [86.139.49.132])
        by smtp.gmail.com with ESMTPSA id j16sm1815445wre.94.2019.06.13.14.35.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Jun 2019 14:35:39 -0700 (PDT)
Date:   Thu, 13 Jun 2019 10:35:38 -1100 (GMT-11:00)
From:   billy <blaws05@gmail.com>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        Roderick.Colenbrander@sony.com, jbrandst@2ds.eu,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Message-ID: <1601292018.1560461326555.eu.faircode.email@localhost>
In-Reply-To: <20190603060644.10338-1-djogorchock@gmail.com>
References:  <20190603060644.10338-1-djogorchock@gmail.com>
Subject: Re: [PATCH v5 0/5] HID: joycon
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: FairEmail 1.530
X-FairEmail-ID: <1601292018.1560461326555.eu.faircode.email@localhost>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hey,
 I am working on android on the nintendo switch (typing this mail on it :) and am trying to use this driver to support joycons with their full functionality, however, when trying to connect while this driver is in the kernel, the request for calibration times out (err 110) and prevents them from working at all. At first i thought it was due to the latency issue android has with joycons, but even after applying the fix for that for that it still doesn't work. Do you have any ideas why this is happening?


Sun Jun 02 19:06:55 GMT-11:00 2019 Daniel J. Ogorchock :

> Version 5 changes:
 > - Removed sysfs interface to control motor frequencies.
 > - Improved rumble reliability by using subcommands to set it.
 > - Changed mapping of the SL/SR triggers on the joy-cons to map to
 > whichever triggers they lack (e.g. a left joycon's sl/sr map to
 > TR and TR2). This allows userspace to distinguish between the
 > normal and S triggers.
 > - Minor refactors
 > Version 4 changes:
 > - Added support for the Home button LED for the pro controller and
 > right joy-con
 > - Changed name from hid-switchcon to hid-joycon
 > - Added rumble support
 > - Removed ctlr->type and use hdev->product instead
 > - Use POWER_SUPPLY_CAPACITY_LEVEL enum instead of manually translating
 > to capacity percentages
 > - Misc. minor refactors based on v3 feedback
 >
 > Version 3 changes:
 > - Added led_classdev support for the 4 player LEDs
 > - Added power_supply support for the controller's battery
 > - Made the controller number mutex static
 > - Minor refactoring/style fixes based on Roderick's feedback from v2
 >
 > Version 2 changes:
 > - Switched to using a synchronous method for configuring the
 > controller.
 > - Removed any pairing/orientation logic in the driver. Every
 > controller now corresponds to its own input device.
 > - Store controller button data as a single u32.
 > - Style corrections
 >
 > Daniel J. Ogorchock (5):
 > HID: joycon: add nintendo switch controller driver
 > HID: joycon: add player led support
 > HID: joycon: add power supply support
 > HID: joycon: add home led support
 > HID: joycon: add rumble support
 >
 > MAINTAINERS | 6 +
 > drivers/hid/Kconfig | 24 +
 > drivers/hid/Makefile | 1 +
 > drivers/hid/hid-ids.h | 3 +
 > drivers/hid/hid-joycon.c | 1414 ++++++++++++++++++++++++++++++++++++++
 > 5 files changed, 1448 insertions(+)
 > create mode 100644 drivers/hid/hid-joycon.c
 >
 > --
 > 2.21.0
 >
 >


