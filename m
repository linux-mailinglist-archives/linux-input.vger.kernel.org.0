Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7A8946A1C0
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 17:47:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239164AbhLFQvX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 11:51:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42988 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238218AbhLFQvW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 11:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638809273;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=04XqlxXI5BTwcC+SKNKuOKJfP5lcG8oZBStvdC+YSgU=;
        b=S89NS7Bi9GvSPDJfaaGquycojGmbnxWsLIbTKP5Jd5dmSOj3/BIsHeDifTXZIGNywzYXM7
        7rER0S09gmgk61wNrouK6NoJfll+XZp/ZztCY20YogjQLYFx6OhcJyvneAZo/bdINITDOc
        yx7Qis3nhZHFgu4JWBsVQp0TxMTCKHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-AkR5dRl9Oh6OqgPs4JkPTw-1; Mon, 06 Dec 2021 11:47:50 -0500
X-MC-Unique: AkR5dRl9Oh6OqgPs4JkPTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 929DE80D680;
        Mon,  6 Dec 2021 16:47:49 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F2261E6;
        Mon,  6 Dec 2021 16:47:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 0/4] Input: goodix - pen support + misc patches
Date:   Mon,  6 Dec 2021 17:47:43 +0100
Message-Id: <20211206164747.197309-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Here is a patch-series for the Goodix touchscreen drivers, this is based
on top of the " Input: goodix - Try not to touch the reset-pin on
x86/ACPI devices" fix from earlier today (there are no conflicts
AFAIK, so the 2 can be merged independently).

This series consist of 3 small fixes/cleanups, followed by adding
pen (Goodix active stylus) support, which is supported on some
Goodix touchscreens.

Regards,

Hans


Hans de Goede (4):
  Input: goodix - Add id->model mapping for the "9111" model
  Input: goodix - Improve gpiod_get() error logging
  Input: goodix - Use the new soc_intel_is_byt() helper
  Input: goodix - Add pen support

 drivers/input/touchscreen/goodix.c | 162 +++++++++++++++++++++++------
 drivers/input/touchscreen/goodix.h |   1 +
 2 files changed, 131 insertions(+), 32 deletions(-)

-- 
2.33.1

