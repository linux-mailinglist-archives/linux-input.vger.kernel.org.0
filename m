Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C92BF471A20
	for <lists+linux-input@lfdr.de>; Sun, 12 Dec 2021 13:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230434AbhLLMmr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 12 Dec 2021 07:42:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35215 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230388AbhLLMmr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 12 Dec 2021 07:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1639312966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2x2kQpEbWm8UcPo8q/e5/l5qscacBVoskUf6jWsSdxk=;
        b=BPZjcpx/1gQ7uEM+whohKsm8PxQQzhJwUfQrITU+vakzJf0wMnhkNO8tQPmRsXLEb5VIta
        9rqnMhmK0mOPdyiibEQvIqnorKkCjZFxPrOukJ2RdaF9yqjQjI//zPBptKXuhkYQH9ONMy
        NL8FfOC551kdctNy2CPUFeZou4IijJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-144-J1miYsMOMO6Cnd94kbzKtg-1; Sun, 12 Dec 2021 07:42:45 -0500
X-MC-Unique: J1miYsMOMO6Cnd94kbzKtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C05118A0F1B;
        Sun, 12 Dec 2021 12:42:44 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.36])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6E6E05D6D7;
        Sun, 12 Dec 2021 12:42:43 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH 0/5] Input: goodix - Various fixes and improvements
Date:   Sun, 12 Dec 2021 13:42:37 +0100
Message-Id: <20211212124242.81019-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Here is a series with some fixes and improvements for the Goodix
touchscreen driver based on your review of my recent patch to
add pen support (which has already been merged).

This is based on goodix.c with all goodix patches from both
input/for-next and input/for-linux applied so that it is tested
against what goodix.c will look like in 5.17-rc1 when both branches
are merged. I don't expect this to cause any problems applying,
but let me know if you want me to rebase on just input/for-next.

Regards,

Hans


Hans de Goede (5):
  Input: Add input_copy_abs() function
  Input: goodix - Use input_copy_abs() helper
  Input: goodix - Improve gpiod_get() error logging
  Input: goodix - 2 small fixes for pen support
  Input: goodix - Fix race on driver unbind

 drivers/input/input.c              | 34 ++++++++++++++++
 drivers/input/touchscreen/goodix.c | 65 +++++++++++++++---------------
 drivers/input/touchscreen/goodix.h |  1 +
 include/linux/input.h              |  2 +
 4 files changed, 69 insertions(+), 33 deletions(-)

-- 
2.33.1

