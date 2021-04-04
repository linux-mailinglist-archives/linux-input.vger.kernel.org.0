Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D889353740
	for <lists+linux-input@lfdr.de>; Sun,  4 Apr 2021 09:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhDDHxG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 4 Apr 2021 03:53:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22596 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229788AbhDDHxF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 4 Apr 2021 03:53:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617522781;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=QiBE4JCwxfJTX/2T2eyN9vFpWvIlenE2CBBehmUcF+g=;
        b=gbzvMfrlSSvx6X0bWBFHBcPHOb8XDSJBeEtD2hqmsuXuL8s93vX+UwS9MRLGK+4RpSo/G2
        83GZNLeUp50uBH7zQ0YfZ5dTf2JeGi35mLUCzn7MPBgIrBN8atCkau7g/1DylaB/cJgl+L
        GRxBUlBNF0uLnQACKsI0WldwmIW0lBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-Y-AsQbgeOT-YBbRElAJXxw-1; Sun, 04 Apr 2021 03:52:59 -0400
X-MC-Unique: Y-AsQbgeOT-YBbRElAJXxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40B8F8030A1;
        Sun,  4 Apr 2021 07:52:58 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-48.ams2.redhat.com [10.36.112.48])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8AC3F5C5DF;
        Sun,  4 Apr 2021 07:52:53 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        linux-leds@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Subject: [PATCH resend 0/3] HID: elan: Mute LED support fixes
Date:   Sun,  4 Apr 2021 09:52:49 +0200
Message-Id: <20210404075252.4032-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

This series seems to have fallen through the cracks, can you
please pick this up?

All 3 patches have these 2 tags

Reviewed-by: Marek Behún <kabel@kernel.org>
Acked-by: Pavel Machek <pavel@ucw.cz>

With Pavel being the LED subsys maintainer and his ack indicating
that the LED class API usage in these patches is correct.

Regards,

Hans


Hans de Goede (3):
  HID: elan: Silence mute LED errors being logged when the device is
    unplugged
  HID: elan: Set default_trigger for the mute LED
  HID: elan: Remove elan_mute_led_get_brigtness()

 drivers/hid/hid-elan.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

-- 
2.30.2

