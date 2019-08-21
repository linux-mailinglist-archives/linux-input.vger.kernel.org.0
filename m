Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 928E298618
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2019 22:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730435AbfHUU7m (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Aug 2019 16:59:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44704 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730391AbfHUU7m (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Aug 2019 16:59:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 6B3FD307D921;
        Wed, 21 Aug 2019 20:59:42 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2E9DA17D29;
        Wed, 21 Aug 2019 20:59:39 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH v2 0/7] Input + HID: Add support for extra keys and LEDs on Logitech "G" series keyboards
Date:   Wed, 21 Aug 2019 22:59:30 +0200
Message-Id: <20190821205937.4929-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Wed, 21 Aug 2019 20:59:42 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is a patch series adding support for the extra keys and LEDs on
Logitech G15, G15 v2 and G510 keyboards, as well as adding support for
controlling the keyboard backlight on these models.

This v2 is mostly a resend, the only change is the addition of a missing
mutex_init() call in the 3th patch in the series.

Dmitry, the first patch adds a bunch of new key-codes for these and other
similar keyboards to input-event-codes.h, the other patches depend on this.
It is probably best if this patch is merged through the HID tree as part of
the rest of the series. If that is ok with you, can we please have your ack
for this?

Regards,

Hans

