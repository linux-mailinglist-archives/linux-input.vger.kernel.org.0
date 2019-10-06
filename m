Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53D87CD1BA
	for <lists+linux-input@lfdr.de>; Sun,  6 Oct 2019 13:26:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfJFL05 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 6 Oct 2019 07:26:57 -0400
Received: from forward106o.mail.yandex.net ([37.140.190.187]:36042 "EHLO
        forward106o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726250AbfJFL05 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 6 Oct 2019 07:26:57 -0400
X-Greylist: delayed 479 seconds by postgrey-1.27 at vger.kernel.org; Sun, 06 Oct 2019 07:26:55 EDT
Received: from mxback7g.mail.yandex.net (mxback7g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:168])
        by forward106o.mail.yandex.net (Yandex) with ESMTP id 58C1C5060B5A
        for <linux-input@vger.kernel.org>; Sun,  6 Oct 2019 14:18:55 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback7g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id JKkQJXFCH6-IseOfNg4;
        Sun, 06 Oct 2019 14:18:54 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1570360734;
        bh=CwEfGMTFhFMaB+iX8kDyFCnB1xzszuOvV4u2enZ4fSY=;
        h=Date:Message-Id:Subject:In-Reply-To:To:From;
        b=V4YDwzPCKbMgQ50jQBHuFjujZpaoYEjonDnyAzem4g7NtRnnc7EIhlQn7WgBB54H3
         CHsqMfUGrH6l1iymP/7dAV1AstnbRQLJr3zWr0j0IEDBkJ+R38WFz8P8uIOkANQ6D8
         wGVwMwBDEFZ3vPl/bnRMwu3qVlnGVWQWKEpNeETE=
Authentication-Results: mxback7g.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by sas8-7ec005b03c91.qloud-c.yandex.net with HTTP;
        Sun, 06 Oct 2019 14:18:54 +0300
From:   ghz3@yandex.ru
Envelope-From: ghz3@yandex.ru
To:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
In-Reply-To: <5568171570360161@iva3-02ce486de7d2.qloud-c.yandex.net>
Subject: Regarding psmouse.synaptics_intertouch=1
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Sun, 06 Oct 2019 14:18:54 +0300
Message-Id: <49831021570360734@sas8-7ec005b03c91.qloud-c.yandex.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I had following in `dmesg`:

[    4.074260] psmouse serio1: synaptics: Your touchpad (PNP: LEN0099 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org

But enabling `psmouse.synaptics_intertouch=1` resulted in following `/var/log/Xorg.0.log`:

[    19.747] (II) config/udev: Adding input device Synaptics TM3418-002 (/dev/input/event12)
[    19.747] (II) No input driver specified, ignoring this device.
[    19.747] (II) This device may have been added with another device file.

And touchpad with trackpoint remain disabled completely.

My `/etc/X11/xorg.conf.d/synaptics.conf` is the following:

Section "InputClass"
        Identifier "Mouse0"
        Driver "synaptics"
        MatchIsTouchpad "on"
        Option "VertTwoFingerScroll" "on"
        Option "HorizTwoFingerScroll" "on"
        Option      "CircularScrolling"         "on"
        Option      "VertScrollDelta"          "-111"
        Option      "HorizScrollDelta"         "-111"
        Option      "TapButton1"                  "1"
        Option      "TapButton2"                  "3"
EndSection
