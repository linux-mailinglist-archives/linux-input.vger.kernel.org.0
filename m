Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C859313828
	for <lists+linux-input@lfdr.de>; Sat,  4 May 2019 09:48:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725826AbfEDHsZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 4 May 2019 03:48:25 -0400
Received: from vmd37850.contaboserver.net ([173.212.236.241]:33960 "EHLO
        mail.devpi.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725802AbfEDHsZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 4 May 2019 03:48:25 -0400
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Sat, 04 May 2019 03:48:23 EDT
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by mail.devpi.de (Postfix) with ESMTPA id 704FE6E270C;
        Sat,  4 May 2019 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=devpi.de; s=dkim;
        t=1556955544; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=+pwKvnAPnk5yo25ChmkE60wX6fH09pjU9RjJVuyLOR4=;
        b=jtQqcuir68qzNDEl82mjc4lJbEsOO7igDHcW1zJYgDWWStfXpTkZTPFfoyeDxNLqLFxoTV
        xPpnA88Ybv/R0Cl44yk/KN3khznEz2l/isF3CRsYkiURJyo0Dx77/qPdQK0yLKw6j3vo7j
        el+q0+1rDbEUjrUHrGzXJsBpSd3Y2qQ=
Message-ID: <9a22f65e3357e73594bfc46b2e14ac87e705aef5.camel@devpi.de>
Subject: [BUG] HID: ELAN active stylus has wrong button behavior
From:   Julius Lehmann <julius@devpi.de>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     linux-input@vger.kernel.org
Date:   Sat, 04 May 2019 09:39:36 +0200
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=devpi.de;
        s=dkim; t=1556955544; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:in-reply-to:
         references; bh=+pwKvnAPnk5yo25ChmkE60wX6fH09pjU9RjJVuyLOR4=;
        b=oj+MvT76Pqm0PjyU1U3aXea9cjjEKOxJruz78s7g7/C3PLZrrjnMOrlII3zTypqe9kosYu
        g3S/orVDjWD0CtadYWYHyGl5a200HNK23VLljXpylYaDBmAVYUhE6tlRvJCG9Q0vob0g7s
        6ktR5Qih1RtPxwEtqhJu6oDzBfl9lG0=
ARC-Seal: i=1; s=dkim; d=devpi.de; t=1556955544; a=rsa-sha256; cv=none;
        b=wOJQKeyloG7QM6KD5skzSOGeWnVVDe7cbOee4Rr+wWe6KT4SLDzRwySyQ2aUCMmyJ8BG/jaOLmK5qS3lY6jzL3XOxJiSkeNQpdjwO8M7mJAd37NJzv1E5G08onBjNng0R03DWPPr5V8ILKNAdpieSgrTtnviqAwMnBiMlmYHfO0=
ARC-Authentication-Results: i=1; mail.devpi.de;
        auth=pass smtp.auth=julius@devpi.de smtp.mailfrom=julius@devpi.de
Authentication-Results: mail.devpi.de;
        auth=pass smtp.auth=julius@devpi.de smtp.mailfrom=julius@devpi.de
X-Spamd-Bar: ---
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

The active pen of my ELAN touchscreen does not work as intended. Every
time I press the primary stylus button it generates events,
unfortunately not the correct ones. 
Device Name: ELAN2097:00 04F3:2766

So this is the output of evtest when pressing and releasing the primary
button:
	BTN_TOOL_PEN 0
	BTN_TOOL_PEN 1
	BTN_TOOL_RUBBER 1
	(releasing)
	BTN_TOOL_PEN 0
	BTN_TOOL_RUBBER 0
	BTN_TOOL_PEN 1
whereas it should be:
	BTN_TOOL_PEN0
	BTN_TOOL_RUBBER1
	BTN_TOOL_RUBBER0
	BTN_TOOL_PEN1

So I looked into it and found my device is using the i2c_hid driver for
transport and hid-multitouch for data handling. After realising those
two should work pretty much out of the box if the corresponding device
descriptors are correct. Examining /sys/kernel/debug/hid/.../events
showed me this behavior whereas every other fields behaved correctly:

Pen is not in range:
	Digitizers.InRange = 0
	Digitizers.TipSwitch = 0
	Digitizers.Invert = 0
	Digitizers.Eraser = 0

Pen is in range but NOT touching the display:
	Digitizers.InRange = 1
	Digitizers.TipSwitch = 0
	Digitizers.Invert = 0
	Digitizers.Eraser = 0

Pen is in range AND touching the display:
	Digitizers.InRange = 1
	Digitizers.TipSwitch = 1
	Digitizers.Invert = 0
	Digitizers.Eraser = 0

Pen is in range, NOT touching the display AND primary button (eraser)
is pressed:
	Digitizers.InRange = 1
	Digitizers.TipSwitch = 0
	Digitizers.Invert = 1
	Digitizers.Eraser = 0

Pen is in range, touching the display AND primary button (eraser) is
pressed:
	Digitizers.InRange = 1
	Digitizers.TipSwitch = 0 (yes this stays 0)
	Digitizers.Invert = 0
	Digitizers.Eraser = 1

This is the extracted hid report descriptor: 
https://pastebin.com/Tva802hT

Unfortunately, my knowledge of the linux kernel and especially the
drivers are not that proficient to fix this solely by myself. However,
I would be more than happy to write some code with a bit of help.

Thanks,
Julius

