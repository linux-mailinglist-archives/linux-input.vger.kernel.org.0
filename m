Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2715F3BAA67
	for <lists+linux-input@lfdr.de>; Sun,  4 Jul 2021 00:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhGCWFH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jul 2021 18:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbhGCWFE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jul 2021 18:05:04 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F50BC061764;
        Sat,  3 Jul 2021 15:02:30 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id he13so3940221ejc.11;
        Sat, 03 Jul 2021 15:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tALBXtQ1QYpjrahCLXThf1TVXTbpsMt6bd2sj22kqvg=;
        b=JgTU80ODSQkCEPo00JEy7wCeECKzOBS367MEfwsjjy0Np/KIMU5fo9COAcTLo7ucA9
         iDG2/8MItTQdbi+4jm5AuMMJzQAGmS70VNbg9FYbrPPoidhLaBbanyJs4iigk0qN+61w
         qGczzrFJrqc5yNndlIjk/amJ2UDkc+5QJY8LnMfUb1dljhUJmG8mynxKYNgleRMh6Sba
         lYsS+6jhgewE+x4Jr3FC0kvbzRAiDQwzopcCBNJxhp3ktE67rpXVmmcUm9YlenlpC6+u
         Ji/oadk9ub2Gs/WA16wPoX6yEYmqvkVrXULSBPkqvo2kRVaI5V57f73rZFWtnULBTlGY
         QzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tALBXtQ1QYpjrahCLXThf1TVXTbpsMt6bd2sj22kqvg=;
        b=ODcrtMC3TSbfGBrSF7Yd7UmVXH09ePIFOBxW4pNZ2Q2/lFJdrbvjh/PiJ7snSNKlyq
         hYLcGavJtsFr9UPe4y7te7o0QbCsNQqI5J5SpbyXbRbRdhffMobJFChtJriT9FzwgY4J
         wpjp5vkCgdmI6Fc7d0iF40ES3utqfcr0Pm4dxTw07voWbPN20Nz5Hd83UyvRaZwrz2Ec
         Y8rot9GmNRpSWexthsOPqlujEP2w6Lun6salZC+qRuTO5m4N7Z7DHWYuf0bYVYGnEp0q
         1FUZmCqZd/6KvXLKaqK8Axn7hztA/6pluFPQ02vEr5a4Xv+DEXMfa7+8B3EaCSDYDkh1
         GW1A==
X-Gm-Message-State: AOAM532lrSg94joqdS7axmM9AdRp/JiqAbGBz4h1tAwV9SOaqTXIYzDK
        YzkJovNxoJ4aCr+dvwqHyr0=
X-Google-Smtp-Source: ABdhPJyagU7o4tYpUSj4yV2KcQa0f5n3YrbsG7EcQobX8Kz8NzzQZyVXVku+J2yr1YUgKbMWcJCCdg==
X-Received: by 2002:a17:907:9812:: with SMTP id ji18mr6266672ejc.138.1625349748791;
        Sat, 03 Jul 2021 15:02:28 -0700 (PDT)
Received: from warrior.lan ([2a03:7380:2407:bc63:7e28:eb67:305b:8ba0])
        by smtp.gmail.com with ESMTPSA id b25sm3186110edv.9.2021.07.03.15.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jul 2021 15:02:28 -0700 (PDT)
From:   Maxim Mikityanskiy <maxtram95@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: [PATCH 4/6] HID: plantronics: Expose headset telephony buttons
Date:   Sun,  4 Jul 2021 01:02:00 +0300
Message-Id: <20210703220202.5637-5-maxtram95@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210703220202.5637-1-maxtram95@gmail.com>
References: <20210703220202.5637-1-maxtram95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

hid-plantronics uses a custom input mapping, where unhandled usages get
ignored. Although these headsets have telephony buttons (microphone mute
and answer/hangup), they are not handled in plantronics_input_mapping,
hence not exposed to the userspace. This commit fixes it by adding a
case for HID_UP_TELEPHONY to the "basic telephony compliant" devices.

Tested with Plantronics Blackwire 3220 Series (047f:c056).

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
---
 drivers/hid/hid-plantronics.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hid/hid-plantronics.c b/drivers/hid/hid-plantronics.c
index ea056235a591..19d6cddff86a 100644
--- a/drivers/hid/hid-plantronics.c
+++ b/drivers/hid/hid-plantronics.c
@@ -84,6 +84,8 @@ static int plantronics_input_mapping(struct hid_device *hdev,
 		 (plt_type & HID_USAGE) != PLT_BASIC_EXCEPTION) {
 		if (PLT_ALLOW_CONSUMER)
 			goto defaulted;
+		if ((usage->hid & HID_USAGE_PAGE) == HID_UP_TELEPHONY)
+			goto defaulted;
 	}
 	/* not 'basic telephony' - apply legacy mapping */
 	/* only map if the field is in the device's primary vendor page */
-- 
2.32.0

