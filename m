Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C91DB345EEF
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 14:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231458AbhCWNGz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 23 Mar 2021 09:06:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:43336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231378AbhCWNG2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 23 Mar 2021 09:06:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 92650619B8;
        Tue, 23 Mar 2021 13:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616504788;
        bh=nHsI2yRsnlVWb7LJ1HGMAd8oNGGFrOXBNqHTpw+yeh0=;
        h=From:To:Cc:Subject:Date:From;
        b=ttQ8/bBIyw9q7Rs2lZmLgh2/Dpu8T6fDft6s3fnYBHlYjFUUlM0M6jrDsOP+Ij4Zq
         kDe3LlzwHoWoREhIVUxCeI5SpMHkahOZ+EaMtpbzJDD3L2ESJGhAJzyD4AB/0CpZm1
         QwUYG8SN3+JPqg//hv+PU/mSTI9TwXDf1p80AsOFj6/aLZxBSVMwB+w2U7vIXUFhV7
         I2hzXl1FQ57pe/6fxBwCYqiu21+51u+BMhchxdU/l0XDBQfLZmQMai4r0tZw1RJVFp
         Iu9mivAWSZa9+1dNGwWyr2xqDi3da6ljPiJTFUZXsXNjeLKnvn0Q4k/CaG7v6EaNAa
         0SAQaKxQ8eDHw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Marcos Paulo de Souza <mpdesouza@suse.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Po-Hsu Lin <po-hsu.lin@canonical.com>,
        Kevin Locke <kevin@kevinlocke.name>,
        Hans de Goede <hdegoede@redhat.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        David Pedersen <limero1337@gmail.com>,
        Rajat Jain <rajatja@google.com>,
        Chris Chiu <chiu@endlessos.org>, Jiri Kosina <jkosina@suse.cz>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: i8042 - fix Pegatron C15B ID entry
Date:   Tue, 23 Mar 2021 14:06:13 +0100
Message-Id: <20210323130623.2302402-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The Zenbook Flip entry that was added overwrites a previous one
because of a typo:

In file included from drivers/input/serio/i8042.h:23,
                 from drivers/input/serio/i8042.c:131:
drivers/input/serio/i8042-x86ia64io.h:591:28: error: initialized field overwritten [-Werror=override-init]
  591 |                 .matches = {
      |                            ^
drivers/input/serio/i8042-x86ia64io.h:591:28: note: (near initialization for 'i8042_dmi_noselftest_table[0].matches')

Add the missing separator between the two.

Fixes: b5d6e7ab7fe7 ("Input: i8042 - add ASUS Zenbook Flip to noselftest list")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/input/serio/i8042-x86ia64io.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index 9119e12a5778..a5a003553646 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -588,6 +588,7 @@ static const struct dmi_system_id i8042_dmi_noselftest_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
 		},
+	}, {
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 			DMI_MATCH(DMI_CHASSIS_TYPE, "31"), /* Convertible Notebook */
-- 
2.29.2

