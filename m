Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 097E630610A
	for <lists+linux-input@lfdr.de>; Wed, 27 Jan 2021 17:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343686AbhA0Q3g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Jan 2021 11:29:36 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:52911 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343953AbhA0Q2z (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Jan 2021 11:28:55 -0500
Received: from envy.fritz.box ([82.207.222.125]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLzWL-1lMC4N2uMT-00HyRm; Wed, 27 Jan 2021 17:26:06 +0100
From:   mail@richard-neumann.de
To:     nehal-bakulchandra.shah@amd.com, sandeep.singh@amd.com,
        mail@richard-neumann.de, jikos@kernel.org,
        benjamin.tissoires@redhat.com, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH v2 3/3] Updated MAINTAINERS
Date:   Wed, 27 Jan 2021 17:26:00 +0100
Message-Id: <20210127162600.35927-4-mail@richard-neumann.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127162600.35927-1-mail@richard-neumann.de>
References: <20210127162600.35927-1-mail@richard-neumann.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xJ1Sf5XKgUYAdsgkLIj4+KmeVkDv6QJ7cYbj41W7dEMUjJh6VYx
 TkQ4oPHh4vWLAhgpWHwFnTVXw67mAP3yXPygIWr76NBF5bqVBOFR66an1QmiOITIC5bwU12
 9H4wbDHcNOMJ9ZmcJpqVAzM+Ui4phkN4BIxq58z5q4g2SDjVpfau0R1Oto866KQ0007GWQ1
 yz9KrsLUJqu37k/eraE4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:xIcAJy1itWc=:yq5/TTGMaYjr1ZLTOHaqES
 SZy2LdtLvkof84KecRMCzEzKSRJ4JM5MOIcRzGrS//uU7x8Z8xW9oK9OORVPnMl2G7fOzn/h2
 jqi27hln7v0BthDXj+flfDIjhHffamvrQa2YEZ3V8zCuEsKjS1KyPYeBuTKWZ51FP6LUJdzEQ
 w4jLblONB0BZfaeu2rfwVUTtlVG67KL5tQsZciaEFQfn7s6EzB+ld2Ey+IBdVKYdROpxwIdCo
 WnS42dTOPZXbvHIdgVZGWG4q24V6oj5bGArjZnPyllEcFZAidRMXskpkE1roK5F5pNCjYTSif
 ToVFja0TYS34csEs5ln72/fzfUeC2RpMhPJF1+9rM8IPM6h2Dvb4FtuNuscWmjhHmnt84h2n3
 cYQjLHYZrnYOxBxIb6MNb7iJ4XS9MdoRGAYeXqE8+7bLa20cWO5EYbX27QWhkuqapMHGiA+P3
 AzPDo9R72w==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Richard Neumann <mail@richard-neumann.de>

Added Richard Neumann (me) to the list of maintainers for the
AMD Sensor Fusion Hub driver.

Signed-off-by: Richard Neumann <mail@richard-neumann.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 992fe3b0900a..de28236a08fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -958,6 +958,7 @@ F:	drivers/net/ethernet/amd/xgbe/
 AMD SENSOR FUSION HUB DRIVER
 M:	Nehal Shah <nehal-bakulchandra.shah@amd.com>
 M:	Sandeep Singh <sandeep.singh@amd.com>
+M:	Richard Neumann <mail@richard-neumann.de>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	Documentation/hid/amd-sfh*
-- 
2.30.0

