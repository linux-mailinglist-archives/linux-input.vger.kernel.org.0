Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8512838E5A3
	for <lists+linux-input@lfdr.de>; Mon, 24 May 2021 13:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbhEXLpR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 07:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbhEXLpQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 07:45:16 -0400
X-Greylist: delayed 367 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 24 May 2021 04:43:48 PDT
Received: from smtp.ungleich.ch (smtp.ungleich.ch [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D2FC061574
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 04:43:48 -0700 (PDT)
Received: from nb3.localdomain (localhost [IPv6:::1])
        by smtp.ungleich.ch (Postfix) with ESMTP id CE432202B5;
        Mon, 24 May 2021 13:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
        t=1621856259; bh=Qgu9ATNe/ZNN3kXY3DhEEP9QF8hYSxEa+6QfCZbETbk=;
        h=From:To:Cc:Subject:Date:From;
        b=aZ6rwoP1P4Cft8RdHnU7mUlS9AVuxUban7NOXU510OI9oYlOzuIvIuLhJRIJECslu
         y4zNhbd0enSNUMsEJ/ZnDC6tRfok7ZicxSEQJD4nq9XmP8RKt2+XEP5lJuS5aRLPsw
         W2hrcDql+YXT/KcgSY3WV1/QkpNg/bBhVxWMxH6UBHoqNDAZShdVtkuWuCxsdrqbDj
         sQjve9bFIgJGaQCY6KCBhgkUl6lnltGW2UjK5qOpErxpN+SMadoojDUlp9aiYIEzfB
         FdVRLWjHQn2qSbKmZcJ2czzwRswI4T1eltMKP5Y0pQZo/4G2sK0qeK5OI/xj3qPYHR
         iXOGR6LQJZPRg==
Received: by nb3.localdomain (Postfix, from userid 1000)
        id A2A4E14C0444; Mon, 24 May 2021 13:38:06 +0200 (CEST)
User-agent: mu4e 1.4.15; emacs 27.2
From:   Nico Schottelius <nico.schottelius@ungleich.ch>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Regression in Elan Touchpad driver / Linux 5.12
Message-ID: <87eedw5ptw.fsf@ungleich.ch>
Date:   Mon, 24 May 2021 13:38:06 +0200
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hello,

since migrating to Linux 5.12, the Elan touchpad stopped working for
me. I created a bug report on
https://bugzilla.kernel.org/show_bug.cgi?id=213093
2but I am not sure whether that reached anyone here.

The symptom is that when running 5.12, the touchpad does not show up.

I tested so far with 5.12.3, 5.12.4 and 5.12.6, all behave the same,
latest dmesg output on 5.12.6 does not show the touchpad driver loading,
only the one for the trackpoint:

[13:35] nb3:~% dmesg| grep -i elan
[   11.845386] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x62, buttons: 3/3
[   11.857853] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/serio1/input/input23
[13:35] nb3:~%

The hardware I am using is an Lenovo X1 nano, however other people also
reported this problem before.

If there is anything I can do to debug this, any pointer would be
appreciated.

Best regards,

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
