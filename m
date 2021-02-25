Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96C7E324F93
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 12:58:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhBYL6l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 06:58:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21233 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229561AbhBYL6k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 06:58:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614254234;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=cyCLzSNxDNJLSDbo5sIZg2cP4ZMP0KNGABNn3qZjH94=;
        b=Emf8LTonKQ+PPihQ2EM9sFcoqb/+pEaQCbNr/Y3gr90PJwg3pSDVXZY4c/A4m7H/HVI+wR
        EsVC3kVTM9lhriIvfOVOSucwi5B28ybxJQ0TRKOgWWU3kySsguJXkqfD4BmLtWBdwPAa56
        nSg7BmbrmLnUpu4eiQSX+WfKTb2isas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-E_YnxZkTNG2foa_aMZHFFg-1; Thu, 25 Feb 2021 06:57:11 -0500
X-MC-Unique: E_YnxZkTNG2foa_aMZHFFg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2FC6100CCC0;
        Thu, 25 Feb 2021 11:57:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-2.ams2.redhat.com [10.36.112.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B24D85C224;
        Thu, 25 Feb 2021 11:57:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [RFC 0/1] Input: elants_i2c - Do not bind to i2c-hid compatible ACPI instantiated devices
Date:   Thu, 25 Feb 2021 12:57:04 +0100
Message-Id: <20210225115705.83031-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is a patch which should fix the touchscreen issues some people have
been seeing on some recent Lenovo AMD CPU using models:
https://bugzilla.kernel.org/show_bug.cgi?id=207759

There are 2 reasons why this is a RFC:

1. It is compile-tested only ATM, I'm waiting for feedback from the
reporters of the issue.

2. The fix which I wrote is somewhat simple. It should work, but there
might be older touchscreens which actually need to use the Elan specific
protocol implemented by elants_i2c.ko; while the ACPI-fwnode describing
the touchscreen falsely contains one of the i2c-hid ACPI compatiblity-id
strings. This would of course be a bug in the ACPI tables, but I have
seen this before.

2. might lead to regressions (or it might be a non-issue) so I was hoping
for some input on this from Benjamin as he originally wroter the elants_i2c
code.

Regards,

Hans



Hans de Goede (1):
  Input: elants_i2c - Do not bind to i2c-hid compatible ACPI
    instantiated devices

 drivers/input/touchscreen/elants_i2c.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.30.1

