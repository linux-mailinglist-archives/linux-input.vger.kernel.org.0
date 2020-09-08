Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D05B261C11
	for <lists+linux-input@lfdr.de>; Tue,  8 Sep 2020 21:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731862AbgIHTOM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 8 Sep 2020 15:14:12 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:45665 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731194AbgIHQEv (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 8 Sep 2020 12:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599581086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=stommPcGntVxv45E3mEbKDsC4N/Rcgt4n/IKo8h4j7E=;
        b=OFFILibabahcaEdDl1YVuxzxkyA7ux0sZE+DJah+b4oUSNgyU7CjaIp7I4/6OmpfWXvVZf
        rtPGJfXGxs+rXX4/+pXbljgHkMw0NLCIgw/UvY2MB9t/AE/5fiHjD00zQaFId5O8QETula
        pvkFk1+KxSHh0Mg2JUqzQxtSfWJuFEc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-hMeKEd9aNr6YJPhkobpLEQ-1; Tue, 08 Sep 2020 09:51:53 -0400
X-MC-Unique: hMeKEd9aNr6YJPhkobpLEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A37B418B9F0A;
        Tue,  8 Sep 2020 13:51:51 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-188.ams2.redhat.com [10.36.114.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C436B27CC7;
        Tue,  8 Sep 2020 13:51:48 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 0/4] Add 4 new keycodes and use them for 4 new hotkeys on new Lenovo Thinkpads
Date:   Tue,  8 Sep 2020 15:51:43 +0200
Message-Id: <20200908135147.4044-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

Here is a v2 of my series to get a couple of new hotkeys, and matching
thinkpad_acpi hkey event codes seen on the last 2 generations of
Thinkpads supported.

New in this version that Lenovo got back to me and explained that the 0x1316
hkey event belongs to Fn + right Shift, so that is mapped now too.

Since these make both include/uapi/linux/input-event-codes.h and
drivers/platform/x86 changes one open question with this series is how to
merge it.

Dmitry, for v1 of this series you suggested you could merge them all
through the input tree ? Andy, one of the drivers/platform/x86 maintainers
gave his Acked-by for this:

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Alternatively the entire series could be merged through the
linux-platform-drivers-x86 repo:

https://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git/shortlog/refs/heads/review-andy

Regards,

Hans

