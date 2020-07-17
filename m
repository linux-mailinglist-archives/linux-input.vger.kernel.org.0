Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57112223AB4
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 13:42:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgGQLmW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 07:42:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39268 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726013AbgGQLmH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 07:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594986126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6VHlyn1KenVDEYKIzV8zC+5Gv4fsMDeZkh4zk/VQPYw=;
        b=IJDyP4wR/rP/IO2/kedfLvvd/AkG5hzeYmP1pHeASzkjeSljWj5/L+nPkgBqTLsoZ0yrLu
        IFyI9IiY+j33wpDYF8JtWxZHpP4F+eDW21lFn1oD15wE/xqqaJaLe1LVWC6kD1rLA6II1E
        tJo1Qwi1eZjyj5rZdNjbOIk3SAKF7i0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-2U3geSUNNIWgCjq6qweQZg-1; Fri, 17 Jul 2020 07:42:04 -0400
X-MC-Unique: 2U3geSUNNIWgCjq6qweQZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35123106B243;
        Fri, 17 Jul 2020 11:42:03 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C284E5D9E7;
        Fri, 17 Jul 2020 11:42:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] Input: allocate keycodes for notification-center, pickup-phone and hangup-phone
Date:   Fri, 17 Jul 2020 13:41:53 +0200
Message-Id: <20200717114155.56222-2-hdegoede@redhat.com>
In-Reply-To: <20200717114155.56222-1-hdegoede@redhat.com>
References: <20200717114155.56222-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

New Lenovo Thinkpad models, e.g. the X1 Carbon 8th gen and the new T14 gen1
models have 3 new symbols / shortcuts on their F9-F11 keys (and the
thinkpad_acpi driver receives 3 new "scancodes" for these):

F9:  Has a symbol resembling a rectangular speech baloon, the manual says
     the hotkey functions shows or hides the notification center
F10: Has a symbol of a telephone horn which has been picked up from the
     receiver, the manual says: "Answer incoming calls"
F11: Has a symbol of a telephone horn which is resting on the receiver,
     the manual says: "Decline incoming calls"

We have no existing keycodes which are a good match for these, so
add 3 new keycodes for these.

I noticed that we have a hole in our keycodes between 0x1ba and 0x1c0
which does not seem to be reserved for any specific purpose, so these
new 3 codes use 0x1bc - 0x1be, instead of starting at 0x27b.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/uapi/linux/input-event-codes.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index b6a835d37826..8d605a6df502 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -515,6 +515,9 @@
 #define KEY_10CHANNELSUP	0x1b8	/* 10 channels up (10+) */
 #define KEY_10CHANNELSDOWN	0x1b9	/* 10 channels down (10-) */
 #define KEY_IMAGES		0x1ba	/* AL Image Browser */
+#define KEY_NOTIFICATION_CENTER	0x1bc	/* Show/hide the notification center */
+#define KEY_PICKUP_PHONE	0x1bd	/* Answer incoming call */
+#define KEY_HANGUP_PHONE	0x1be	/* Decline incoming call */
 
 #define KEY_DEL_EOL		0x1c0
 #define KEY_DEL_EOS		0x1c1
-- 
2.26.2

