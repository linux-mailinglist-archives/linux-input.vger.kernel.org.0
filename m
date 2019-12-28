Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4EEA12BCC4
	for <lists+linux-input@lfdr.de>; Sat, 28 Dec 2019 06:29:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725857AbfL1F3b (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Dec 2019 00:29:31 -0500
Received: from mail-pf1-f175.google.com ([209.85.210.175]:35446 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbfL1F3b (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Dec 2019 00:29:31 -0500
Received: by mail-pf1-f175.google.com with SMTP id i23so10275857pfo.2
        for <linux-input@vger.kernel.org>; Fri, 27 Dec 2019 21:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eitanadler.com; s=0xdeadbeef;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bO70rjKCYXV8ehImOaIa7OW1iKSIh303Fcee/9tsdw4=;
        b=Q6Jw1cEvasP2TaBBxX2BuS4n27ggfXzeqIO2+1lk4Hg15UECtpSfZjLZ7OwZ78e8hq
         cAYmzxRNM60eDV8m4piIsmcbptHuMQ2avrckWNUMY4tX8qclj+E+HWPEbL3OncbLESm7
         K3c46eVgUo++PpHb0bcgw7TswtVZMqEGBRxuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bO70rjKCYXV8ehImOaIa7OW1iKSIh303Fcee/9tsdw4=;
        b=o0k14aosgYPSyplR1Xao/D6srBGunk3R07TDm3T3dgSkCbCWJ9/g1HLHtzEBqYJr5n
         Wd5d+YY4aZ4qJGNGhtG32acFQeVbfI1DcdUiwkkuzYRsprk4fDPiO03D1cKhDZZGXRDF
         RQc5SrmZoVJ6dilJwqkas41yRoYV7xSbQeA+X6D5bj79DeaVNJ9b7RvFSVLH00WEc7oH
         sLT2AJcW4t57Y13Ek6o+NrOLW/QiIAGfH0ZXpnma8Mx4jwYKfhv73taahb4TnzVt3AKY
         y9ZahVZeg6bpgKSm0jtiXLwptybTdVq0e15JEzpofGBdHw/5JOt3OShTkji5v6bhVfji
         lncQ==
X-Gm-Message-State: APjAAAW3aF8FD1DL5aGNHbNHDFJiMk8U6FV7zpKT6hj0BuIJHDUD8KxX
        BsaPvThNo4IUgw5r5kS7lglJQAVpovw=
X-Google-Smtp-Source: APXvYqxcdaWZeoo2Ke4rnrIaYi8fC7CipieKajGJ0zg98EZ2GdqhmUKim+YzllWYGJgVmjSmZEmzCA==
X-Received: by 2002:aa7:8687:: with SMTP id d7mr58413857pfo.164.1577510970282;
        Fri, 27 Dec 2019 21:29:30 -0800 (PST)
Received: from fasteagle.my.domain ([2607:f598:b1f2:f400:7285:c2ff:fe7d:ff69])
        by smtp.gmail.com with ESMTPSA id 203sm43682148pfy.185.2019.12.27.21.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2019 21:29:29 -0800 (PST)
From:   Eitan Adler <lists@eitanadler.com>
To:     linux-input@vger.kernel.org
Cc:     Eitan Adler <lists@eitanadler.com>
Subject: [PATCH] [serio] add support for Gigabyte M1405 netbook
Date:   Sat, 28 Dec 2019 05:30:51 +0000
Message-Id: <20191228053051.28724-1-lists@eitanadler.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Information verified by inspection

Signed-off-by: Eitan Adler <lists@eitanadler.com>
---
 drivers/input/serio/i8042-x86ia64io.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index dc974c288e88..14ad1d8e6201 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -186,6 +186,14 @@ static const struct dmi_system_id __initconst i8042_dmi_noloop_table[] = {
 			DMI_MATCH(DMI_BOARD_VERSION, "1.02"),
 		},
 	},
+	{
+		/* Gigabyte M1405 netbook */
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "GIGABYTE"),
+			DMI_MATCH(DMI_BOARD_NAME, "M1405"),
+			DMI_MATCH(DMI_BOARD_VERSION, "Base Board Version"),
+		},
+	},
 	{
 		/* Gigabyte Spring Peak - defines wrong chassis type */
 		.matches = {
-- 
2.24.1

