Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39B2C3C150A
	for <lists+linux-input@lfdr.de>; Thu,  8 Jul 2021 16:19:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231964AbhGHOWY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 8 Jul 2021 10:22:24 -0400
Received: from mout02.posteo.de ([185.67.36.66]:46757 "EHLO mout02.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231966AbhGHOWY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 8 Jul 2021 10:22:24 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 0B23A2400FD
        for <linux-input@vger.kernel.org>; Thu,  8 Jul 2021 16:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1625753981; bh=zicqAZ7JeXd7r/KlOZ/IYGKV7jWtQKPpW8wVlrHAPAk=;
        h=Date:From:To:Cc:Subject:From;
        b=WJMOOxHlrtP5bwNqPbJ+fMigU2LiSx/QL0d0fiaxVnmbkrr96kw90qJzaVsBXMnaV
         0BhPQsyAXnmBsE7aUOVOlVpUhXTFYaXkog96arR4t4/tsByUo+74BvDKTlS7RUYQfE
         kvDGgK9oBtGj0rtBGGnQarChXrDwc4Z1i5+bIwY+nsyWAjHa/wEnEtmmGEd53/Fmg3
         28VqvaZbeiPkAGv5QlvP7J9VNdxrryajGBk/ZKzzoNvfUj8b/XFDsGmktF/5wGBBrh
         p0qwKBzfAj56ZbCMt2zes/gGOrHVAvV7uXAvcGp3uKYQGbwyB4uJ9RzHG3IM8DMGwx
         p1ayfjA1FitUQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4GLJMc3yycz6tmG;
        Thu,  8 Jul 2021 16:19:40 +0200 (CEST)
Date:   Thu,  8 Jul 2021 14:19:35 +0000
From:   Julian Weigt <juw@posteo.de>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: BUG: cannot enable iso_layout with apple keyboard
Message-ID: <20210708141935.bx33mv2jxtm752z3@julianexternal>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

I have an apple keyboard model A1644 EMC 2815 with Finnish/Swedish ISO layout. When I connect it via cable it works fine. But when I connect it via bluetooth, then the buttons >/< and §/° are swapped. It seems to make no difference if I set iso_layout to 0 or to 1. I checked and it turns out that hid->country below equals 0, and removing the check

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 6b8f0d004d34..8a764ce4e518 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -267,13 +267,11 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
        }

        if (iso_layout) {
-               if (hid->country == HID_COUNTRY_INTERNATIONAL_ISO) {
                        trans = apple_find_translation(apple_iso_keyboard, usage->code);
                        if (trans) {
                                input_event(input, usage->type, trans->to, value);
                                return 1;
                        }
-               }
        }

        if (swap_opt_cmd) {

makes the buttons act correctly. Please let me know how I can help fixing this.

Best regards,
Julian Weigt
