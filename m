Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 210183209DB
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 12:24:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBULVw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 21 Feb 2021 06:21:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50170 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229884AbhBULVm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 21 Feb 2021 06:21:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613906416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=i92iP2g3FelTAVWQC8EOy+yC+VzBfmrFZlUJyGyPuuU=;
        b=iCGiJ1NM3ClTEVqeE5t/+2fJRtmnsAFlxktT3f1w255t36QN5p3FbYF0zXi6SK8tc89uVb
        0Ijw6vQ4TX3LxTp/gZFukl5V0s3awZvo7pVMLjxgXkcvS9fGVQd0nyPIVfBGe6EMRQihkG
        8jKcvkd0GcN8y9kDJrQ0j6Hh3WOvoLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-h-G2GOdvOs20N_xHR8XT8Q-1; Sun, 21 Feb 2021 06:20:14 -0500
X-MC-Unique: h-G2GOdvOs20N_xHR8XT8Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9171CC28A;
        Sun, 21 Feb 2021 11:20:12 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-87.ams2.redhat.com [10.36.112.87])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B814C6268F;
        Sun, 21 Feb 2021 11:20:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: [PATCH v3 0/7] HID: lenovo: Mute LED handling fixes and improvements
Date:   Sun, 21 Feb 2021 12:19:58 +0100
Message-Id: <20210221112005.102116-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is v3 of my series with mute LED handling fixes and improvements
for the hid-lenovo driver.

v3 addresses the review-remarks from Marek Behún, thank you for all the
reviews Marek.

See the individual patches for detailed per patch changelogs.

Regards,

Hans


Hans de Goede (7):
  HID: lenovo: Use brightness_set_blocking callback for setting LEDs
    brightness
  HID: lenovo: Fix lenovo_led_set_tp10ubkbd() error handling
  HID: lenovo: Check hid_get_drvdata() returns non NULL in
    lenovo_event()
  HID: lenovo: Remove lenovo_led_brightness_get()
  HID: lenovo: Set LEDs max_brightness value
  HID: lenovo: Map mic-mute button to KEY_F20 instead of KEY_MICMUTE
  HID: lenovo: Set default_triggers for the mute and micmute LEDs

 drivers/hid/hid-lenovo.c | 69 ++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 31 deletions(-)

-- 
2.30.1

