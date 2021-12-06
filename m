Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A5646921A
	for <lists+linux-input@lfdr.de>; Mon,  6 Dec 2021 10:11:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240113AbhLFJO5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Dec 2021 04:14:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31126 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240118AbhLFJOy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 Dec 2021 04:14:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638781886;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=mTQFH7H4cyk6KIDbOtrDDsIorqdVaRVzItBQ4Ghuphc=;
        b=MYHKkc9aHALLNJj+LOqkqVA2VO0mtQ6vWDCRhFx8iroSzLJI7K4OSDMPyMlQQVx892fTQB
        7ip9svt2QbAk4LaVOY6cBL8mDgyXcI2S9myADZjxRqOhjAYEttcMS23Vhk+NV0S3VZ63Q3
        IDtHvSUTgn82Y0yXac3XyagU8kVbN5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-200-mbS1YMkiP-q03yp9F0mtVg-1; Mon, 06 Dec 2021 04:11:23 -0500
X-MC-Unique: mbS1YMkiP-q03yp9F0mtVg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77B6964092;
        Mon,  6 Dec 2021 09:11:18 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.76])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 76ACD10023AA;
        Mon,  6 Dec 2021 09:11:17 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org
Subject: [PATCH regression fix 0/1] Input: goodix - Try not to touch the reset-pin on x86/ACPI devices
Date:   Mon,  6 Dec 2021 10:11:15 +0100
Message-Id: <20211206091116.44466-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

This patch fixes a regression in the goodix driver on some boards,
which was introduced in 5.7 (yes 5.7) unfortunately this did not
come to my attention until now, see:
https://bugzilla.kernel.org/show_bug.cgi?id=209061

If you can get this on its way to Linus for 5.16 that would be
great. Alternatively if you don't have time to prep a fixes pull-req
for this let me know and I can add it to my next pdx86 fixes pull-req.

Regards,

Hans


Hans de Goede (1):
  Input: goodix - Try not to touch the reset-pin on x86/ACPI devices

 drivers/input/touchscreen/goodix.c | 30 +++++++++++++++++++++++++-----
 drivers/input/touchscreen/goodix.h |  1 +
 2 files changed, 26 insertions(+), 5 deletions(-)

-- 
2.33.1

