Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E0D49CF80
	for <lists+linux-input@lfdr.de>; Wed, 26 Jan 2022 17:20:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243268AbiAZQUB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jan 2022 11:20:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59190 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243114AbiAZQTb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jan 2022 11:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643213970;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j6pQcGPD89sG4ADrFMayB3tHZTvI3inzDB8duhbW++M=;
        b=b4bAj/2GF3JnNg0GQtUKtEAGERjy4aNq5Lq9KqzMXWl9bTVM4NUzaZ0FT0GIZB7lOMbjuC
        zC7hS3Hb8COQECGO88AgpotrqI/qOvnnTKrOQ7d26KlXmuLsJ8TVOtVy7TLxWRhABYuYZG
        Pf+ckhcRvs+hYLoEzr08XmjPYv+/6u4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-VGn9qPstMDiNDITo2fJKYw-1; Wed, 26 Jan 2022 11:19:25 -0500
X-MC-Unique: VGn9qPstMDiNDITo2fJKYw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD761091DA2;
        Wed, 26 Jan 2022 16:19:23 +0000 (UTC)
Received: from plouf.redhat.com (unknown [10.39.193.93])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3041C79A22;
        Wed, 26 Jan 2022 16:19:21 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?q?Ahelenia=20Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>,
        Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Cc:     linux-input@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 12/12] Input: docs: add more details on the use of BTN_TOOL
Date:   Wed, 26 Jan 2022 17:18:32 +0100
Message-Id: <20220126161832.3193805-13-benjamin.tissoires@redhat.com>
In-Reply-To: <20220126161832.3193805-1-benjamin.tissoires@redhat.com>
References: <20220126161832.3193805-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The HID core stack used to be very relaxed considering the BTN_TOOL_*
usage. With the recent commits, we should now enforce to have only one
tool at a time, meaning that we can now express that requirement in the
docs.

Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
---
 Documentation/input/event-codes.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b24ae7d292cc..41b1fa647dab 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -137,7 +137,10 @@ A few EV_KEY codes have special meanings:
     code should be set to a value of 1. When the tool is no longer interacting
     with the input device, the BTN_TOOL_<name> code should be reset to 0. All
     trackpads, tablets, and touchscreens should use at least one BTN_TOOL_<name>
-    code when events are generated.
+    code when events are generated. Likewise all trackpads, tablets, and
+    touchscreens should export only one BTN_TOOL_<name> at a time. It is
+    however accepted to switch tool in one EV_SYN frame by setting the old
+    BTN_TOOL_<name> at a value of 0 and the new one at 1.
 
 * BTN_TOUCH:
 
-- 
2.33.1

