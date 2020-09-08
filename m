Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6034126141B
	for <lists+linux-input@lfdr.de>; Tue,  8 Sep 2020 18:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730924AbgIHQFV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 12:05:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47624 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731192AbgIHQEv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 8 Sep 2020 12:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599581086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1rC655iJP/0msIRrgIzespKhWDIIyrJTtWvObqbgi+Q=;
        b=ILFU4OnP3fFiCvHbs3L2/LGcjY6kkGQ73TyHAGxD6B02QldDvLfHaHNL3QGJUT11Pe8A/f
        JkUo/dcNx+p06/jlcbOpoqk418taLmKLcf6a+/Sr5LAPHe13rixII/9vzITJnOmsDIxhSD
        LzpyNnC++Z74qMOielS94QCIczWh0Mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-xDM-QLQzO7e3X-q4nx8w9g-1; Tue, 08 Sep 2020 09:51:58 -0400
X-MC-Unique: xDM-QLQzO7e3X-q4nx8w9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CA601007474;
        Tue,  8 Sep 2020 13:51:57 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-188.ams2.redhat.com [10.36.114.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C665B27CC5;
        Tue,  8 Sep 2020 13:51:54 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 2/4] Input: allocate keycode for Fn + right shift
Date:   Tue,  8 Sep 2020 15:51:45 +0200
Message-Id: <20200908135147.4044-3-hdegoede@redhat.com>
In-Reply-To: <20200908135147.4044-1-hdegoede@redhat.com>
References: <20200908135147.4044-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The last 2 generations of Lenovo Thinkpads send an acpi_thinkpad event when
Fn + right shift is pressed.  This is intended for use with "Lenovo Quick
Clean" software, which disables the touchpad + kbd for 2 minutes on this
key-combo so that healthcare workes can disinfect it.

But there is no silkscreen print on the right-keyboard to indicate this,
so add a KEY_FN_RIGHT_SHIFT keycode define to use for this key-combo.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 include/uapi/linux/input-event-codes.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index b74821d09145..ee93428ced9a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -545,6 +545,7 @@
 #define KEY_FN_F		0x1e2
 #define KEY_FN_S		0x1e3
 #define KEY_FN_B		0x1e4
+#define KEY_FN_RIGHT_SHIFT	0x1e5
 
 #define KEY_BRL_DOT1		0x1f1
 #define KEY_BRL_DOT2		0x1f2
-- 
2.28.0

