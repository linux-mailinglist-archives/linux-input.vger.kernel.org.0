Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE1DF37946
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 18:14:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729483AbfFFQOj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Jun 2019 12:14:39 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44776 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729473AbfFFQOj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Jun 2019 12:14:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so1787643pfe.11;
        Thu, 06 Jun 2019 09:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8u4AvA1sIMgEzuM/x3lHcTV/bwwXCima3mBOZhUSdFI=;
        b=kT7Fsniciw2f40+K1s4IkMHC8bDhyvF8jbQdBVisMQCZ39Mu54PB5US7bxWAGD2Y2u
         duKU56MJYnjYjyR02gUKqI7M3y68J41NwGqUrt7v1vcY2VXTpLtSPOmvaGjHHSftclap
         pRH6zMh2GEnPmHRyzQ3qI0gy5+xidPCpfTgMTA5A1xB6CP2Zv++C2M+r7U6riPlRMDyv
         Ci5ZPtyKFXbREqx6WKj5jVJa9GJeXqOO1Wcbeb4iQ/5Wc5E2W23AeyraKsYBSXNJYTtS
         eXKGEr6P8V4DHeAUGkE9k/8TFXP1c97TCMjwrl4ML+aJ6JGpmwKlUfK3ivWV4W4/gTBZ
         m89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8u4AvA1sIMgEzuM/x3lHcTV/bwwXCima3mBOZhUSdFI=;
        b=A8gNaVFXcOFhpumlfJx4E38yJ6ueYT89DKFbu4vH0/g4OWapl66V2jJbXdCsybvOWe
         AZz2dFGT8HgI9mUU9mwn+2OMDVI6Hj9stBpU+sn/fZfrgg3kQPrnrLv0zcnjoei82qcE
         xHv8liF8iMHJzLjdmF/d3+4YzrFqk3TUdUE2Hn9iT0Fs1RHInOxKDvvYiau3F8svhoyo
         V/jDKQSDVvxEu27+N2zsG/KOqUMEOGNcsvDAWTfy/uKYwHdvVEts2oClABV+9YETYMxT
         uAv70EfiLYYGJtCsLKkvAmMWMaFz/swByI8SeIKO3DoW6sPriw/9PNuBJ9/VUlha9mwq
         Q09A==
X-Gm-Message-State: APjAAAXCqrOmI5sEz8/iCKCs4hieNA1E7TWd4iu7Q4ufa+l8v+g55OUy
        Eq8R7Nlrbzyeaxe9v++gVzA=
X-Google-Smtp-Source: APXvYqz9noRLhntF5A8eX7ROT4V/RuNR4a63J9v57sa1dTIDA2G4veHBp81W1O8A0oZi/dtmYiXm7Q==
X-Received: by 2002:a17:90b:d8a:: with SMTP id bg10mr668105pjb.92.1559837678767;
        Thu, 06 Jun 2019 09:14:38 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id v126sm4667062pfb.81.2019.06.06.09.14.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 09:14:38 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     benjamin.tissoires@redhat.com, dmitry.torokhov@gmail.com,
        jikos@kernel.org
Cc:     bjorn.andersson@linaro.org, lee.jones@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, agross@kernel.org,
        david.brown@linaro.org, hdegoede@redhat.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH v5 1/3] Input: elan_i2c: Add comment about link between elan_i2c and hid-quirks
Date:   Thu,  6 Jun 2019 09:13:12 -0700
Message-Id: <20190606161312.47143-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
References: <20190606161055.47089-1-jeffrey.l.hugo@gmail.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Elan_i2c and hid-quirks work in conjunction to decide which devices each
driver will handle.  Document this link in elan_i2c as a reminder that
updates to elan_i2c need to be mirrored to hid-quirks.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/input/mouse/elan_i2c_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/mouse/elan_i2c_core.c b/drivers/input/mouse/elan_i2c_core.c
index 65cd325eabc3..4cb49925a8b4 100644
--- a/drivers/input/mouse/elan_i2c_core.c
+++ b/drivers/input/mouse/elan_i2c_core.c
@@ -1374,6 +1374,10 @@ static const struct i2c_device_id elan_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, elan_id);
 
+/*
+ * when these whitelists get updated, the corresponding blacklist in hid-quirks
+ * needs to be updated to match.
+ */
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id elan_acpi_id[] = {
 	{ "ELAN0000", 0 },
-- 
2.17.1

