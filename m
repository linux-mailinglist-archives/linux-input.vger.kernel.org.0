Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 177C18176E
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 12:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbfHEKtz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 06:49:55 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60991 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727989AbfHEKtz (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 5 Aug 2019 06:49:55 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1huaYq-0007m9-6f; Mon, 05 Aug 2019 10:49:52 +0000
From:   Colin King <colin.king@canonical.com>
To:     Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-input@vger.kernel.org,
        linux-doc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: docs: fix spelling mistake "potocol" -> "protocol"
Date:   Mon,  5 Aug 2019 11:49:51 +0100
Message-Id: <20190805104951.26947-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a minor spelling mistake in the documentation, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 Documentation/input/multi-touch-protocol.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/input/multi-touch-protocol.rst b/Documentation/input/multi-touch-protocol.rst
index 6be70342e709..307fe22d9668 100644
--- a/Documentation/input/multi-touch-protocol.rst
+++ b/Documentation/input/multi-touch-protocol.rst
@@ -23,7 +23,7 @@ devices capable of tracking identifiable contacts (type B), the protocol
 describes how to send updates for individual contacts via event slots.
 
 .. note::
-   MT potocol type A is obsolete, all kernel drivers have been
+   MT protocol type A is obsolete, all kernel drivers have been
    converted to use type B.
 
 Protocol Usage
-- 
2.20.1

