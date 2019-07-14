Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3099B67F69
	for <lists+linux-input@lfdr.de>; Sun, 14 Jul 2019 16:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbfGNOns (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 14 Jul 2019 10:43:48 -0400
Received: from mail15.wdc04.mandrillapp.com ([205.201.139.15]:64596 "EHLO
        mail15.wdc04.mandrillapp.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728146AbfGNOns (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 14 Jul 2019 10:43:48 -0400
X-Greylist: delayed 1801 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Jul 2019 10:43:47 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=mandrill; d=nexedi.com;
 h=From:Subject:To:Cc:Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding; i=kirr@nexedi.com;
 bh=OkdXMsKChIXf9sKU+iNJjSMcEzWlygaeee1sm+U5lN8=;
 b=OhE+ucWJMuTEEahgvz5s1kT1MIePtRlyoN4wmmUGU4NfO3YVURy/OmnvZDqZgtEJf6QGq3kb3zgz
   kIXBmnm/JOOIYeN5rVTVJekE9edPvnVqfH6azsv3yF9oNYVfJlrqaswFyHMKOzomtVTqpUQUjlP+
   e/h8o0YmCis7HTcQoBc=
Received: from pmta08.mandrill.prod.suw01.rsglab.com (127.0.0.1) by mail15.wdc04.mandrillapp.com id h5cvq61jvmgg for <linux-input@vger.kernel.org>; Sun, 14 Jul 2019 14:13:46 +0000 (envelope-from <bounce-md_31050260.5d2b3899.v1-99fe857d0018466eaf9a91cb51ca5677@mandrillapp.com>)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com; 
 i=@mandrillapp.com; q=dns/txt; s=mandrill; t=1563113625; h=From : 
 Subject : To : Cc : Message-Id : Date : MIME-Version : Content-Type : 
 Content-Transfer-Encoding : From : Subject : Date : X-Mandrill-User : 
 List-Unsubscribe; bh=OkdXMsKChIXf9sKU+iNJjSMcEzWlygaeee1sm+U5lN8=; 
 b=L4w05nho6BTrmzaJZTZrKV0F3cNXNHM+fWKDhdWu9sM0JzQ0EJ7MxsqSruMCC8+KUjI3Ip
 lATDftW32p52s51r61TgbvbNRMwvAvQUYHGpkW4YsFJtYpGERhXQnYzWJCQy4xAQIUQXFwMU
 jLs9U/d4nIjHM1JSTtF0qYbGYfJ1k=
From:   Kirill Smelkov <kirr@nexedi.com>
Subject: [PULL] stream_open bits for Linux 5.3
Received: from [87.98.221.171] by mandrillapp.com id 99fe857d0018466eaf9a91cb51ca5677; Sun, 14 Jul 2019 14:13:45 +0000
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Julia Lawall <Julia.Lawall@lip6.fr>, Jan Blunck <jblunck@suse.de>,
        Arnd Bergmann <arnd@arndb.de>, Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        <cocci@systeme.lip6.fr>, <linux-input@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Message-Id: <20190714141317.GA20277@deco.navytux.spb.ru>
X-Report-Abuse: Please forward a copy of this message, including all headers, to abuse@mandrill.com
X-Report-Abuse: You can also report abuse here: http://mandrillapp.com/contact/abuse?id=31050260.99fe857d0018466eaf9a91cb51ca5677
X-Mandrill-User: md_31050260
Date:   Sun, 14 Jul 2019 14:13:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Linus,

Please consider pulling the following stream_open related bits:

This time on stream_open front it is only two small changes:

- the first one converts stream_open.cocci to treat all functions that
  start with wait_.* as blocking. Previously it was only wait_event_.*
  functions that were considered as blocking, but this was falsely
  reporting deadlock cases as only warning. The patch was picked by
  linux-kbuild and already entered your tree as 0c4ab18fc33b.
  It is thus omitted from hereby pull-request.

- the second one teaches stream_open.cocci to consider files as being
  stream-like even if they use noop_llseek. I posted this patch for
  review 3 weeks ago[1], but got neither feedback nor complaints.

  [1] https://lore.kernel.org/lkml/20190623072838.31234-2-kirr@nexedi.com/


The changes are available for pulling from here:

	https://lab.nexedi.com/kirr/linux.git stream_open-5.3


Thanks beforehand,
Kirill


Kirill Smelkov (1):
      *: convert stream-like files -> stream_open, even if they use noop_llseek

 drivers/hid/hid-sensor-custom.c          | 2 +-
 drivers/input/mousedev.c                 | 2 +-
 scripts/coccinelle/api/stream_open.cocci | 9 ++++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)
