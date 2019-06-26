Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE5357489
	for <lists+linux-input@lfdr.de>; Thu, 27 Jun 2019 00:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFZWtO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 18:49:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42885 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbfFZWtO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 18:49:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id ay6so127427plb.9
        for <linux-input@vger.kernel.org>; Wed, 26 Jun 2019 15:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=dbHZFEovc/CcNX2mFp1dSrbc/I4QyeDQO2ko/NTsnIQ=;
        b=JpgJY+Pcy1zYNi8/eRbbYfHCzQWBNJXFDf05vcU06RNEfG8Xy3k/69e30PId31CtlZ
         wmBT2yYq+M6dGFiusCjAp4JgOA1Fiwjq+rWWPximfVZ3xSdY6SliRP3xGwctZyVp9+T1
         kd1glYY8+heHnLBihxzfmOGM5vjgShsvAUTXC9cMVa0wV1PxrKUvEIcvqwX8JocApkmP
         eGAEpUBRg87YPj/oANMTK0x2mikAEY1lkwlS9ZEtzUGquuSlqX+7YCAsOb72L3ereaG+
         6VlDaqVYPLoqMEHDxT7GEZGLULyqjrK8v2hrzqbQHcLOHoMnBH5CL6GNdNsZe0kvq/E3
         5e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=dbHZFEovc/CcNX2mFp1dSrbc/I4QyeDQO2ko/NTsnIQ=;
        b=H0V4st2Y4o8y14nGf3Xe3zKH9SrmI6DUIfg/cAUZoeivFrzwRCTZD6VaDXYcVFWZnv
         5IbjQ3VNQ96gcVs/+EM8ySRpTn1iET9cncnABtMdW2ZrScLOn+xh/MjWoeEwsxLkpwo9
         Hk2cGozb2ZemFrQYmjx0beH61l1MEnwzPCFtkkHBu5P3LQcXWnGmaFlFRxpFLNoYde7r
         /882W7rjPcF88bv1jwV1MdhPPYGHxpY+yIT3orL31sGi9OE9zzwv5Uk6tGKE0zESZjp+
         vdU4iyHBAErNFYiSkhhcN0BGHy96CnVg7pg/s646UwgkhV7//yBQ+Bwl80cE+2DeM4n7
         WEeg==
X-Gm-Message-State: APjAAAULlcaOncvzAiNZqoni40SHAL1nl6OnK6D1j2D09RyLNarkZnuy
        pvg5DwcDvNb9rYWWV7q1H/DtGyVonuQ=
X-Google-Smtp-Source: APXvYqywi3aSZXauCJVInX9QS5uVBfJkKuKuYQ/ZGkjD2OAK1yRrdV2138e9mwq5zpOPTLeHTd7fmQ==
X-Received: by 2002:a17:902:3103:: with SMTP id w3mr635215plb.84.1561589352866;
        Wed, 26 Jun 2019 15:49:12 -0700 (PDT)
Received: from west.Home ([97.115.133.135])
        by smtp.googlemail.com with ESMTPSA id d4sm2751051pju.19.2019.06.26.15.49.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 26 Jun 2019 15:49:11 -0700 (PDT)
From:   Aaron Armstrong Skomra <skomra@gmail.com>
X-Google-Original-From: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
To:     linux-input@vger.kernel.org, jikos@kernel.org,
        benjamin.tissoires@redhat.com, pinglinux@gmail.com,
        jason.gerecke@wacom.com
Cc:     Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Subject: [PATCH] HID: wacom: generic: add touchring adjustment for 2nd Gen Pro Small
Date:   Wed, 26 Jun 2019 15:48:48 -0700
Message-Id: <1561589328-32520-1-git-send-email-aaron.skomra@wacom.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add the product ID for the 2nd Generation Intuos Pro
Small to the touchring coordinate adjustment block.

Signed-off-by: Aaron Armstrong Skomra <aaron.skomra@wacom.com>
Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
---
 drivers/hid/wacom_wac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index e35d04451595..35942bba5390 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2029,10 +2029,12 @@ static void wacom_wac_pad_event(struct hid_device *hdev, struct hid_field *field
 		if (hdev->vendor == 0x56a &&
 		    (hdev->product == 0x34d || hdev->product == 0x34e ||  /* MobileStudio Pro */
 		     hdev->product == 0x357 || hdev->product == 0x358 ||  /* Intuos Pro 2 */
+		     hdev->product == 0x392 ||				  /* Intuos Pro 2 */
 		     hdev->product == 0x399)) {				  /* MobileStudio Pro */
 			value = (field->logical_maximum - value);
 
-			if (hdev->product == 0x357 || hdev->product == 0x358)
+			if (hdev->product == 0x357 || hdev->product == 0x358 ||
+			    hdev->product == 0x392)
 				value = wacom_offset_rotation(input, usage, value, 3, 16);
 			else if (hdev->product == 0x34d || hdev->product == 0x34e ||
 				 hdev->product == 0x399)
-- 
2.17.1

