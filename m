Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A917F223AAA
	for <lists+linux-input@lfdr.de>; Fri, 17 Jul 2020 13:42:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgGQLmF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 07:42:05 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52744 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725950AbgGQLmF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 07:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594986124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=DRiVIwwbVSKtgxI8TX4xFnXUWovJnEvT90U/53wTUHc=;
        b=iAdQEs4GP93pZxd9SbAwhVp37VisGCH2ai9rp0yPY1GhbKWE/J9Od49taRJlRSxkkAFM8j
        pomXXTLiDfcZp3+wL7/SmDY7HnLzuVrBHwebXFYbtvIyvZFxpm5PtLzeSX4Tsdv4MgUZ44
        gWGqxtsgr7vmzFQ5Vp/JX965r1YcS+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-sTpDt9yjO8OE8l5xBV1NxQ-1; Fri, 17 Jul 2020 07:42:02 -0400
X-MC-Unique: sTpDt9yjO8OE8l5xBV1NxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DC5580183C;
        Fri, 17 Jul 2020 11:42:00 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-162.ams2.redhat.com [10.36.112.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EA6947950A;
        Fri, 17 Jul 2020 11:41:57 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on new Lenovo Thinkpads
Date:   Fri, 17 Jul 2020 13:41:52 +0200
Message-Id: <20200717114155.56222-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

This is a simple patch-series adding support for 3 new hotkeys found
on various new Lenovo Thinkpad models.

There is one small complication, these 3 new hotkeys also require
the addition of new key-codes to include/uapi/linux/input-event-codes.h.

And those changes have to land first. It is probably easiest to just
merge everything through the platform/x86 tree, or alternatively we
would need an immutable branch from the input-subsys with the first
patch on there which the platform/x86 maintainers can then merge.

Dmitry, can you please let us know how you want to proceed with these
changes; And if you are ok with merging the input-event-codes.h changes
through the platform/x86 tree, may we have your Acked-by for that ?

Regards,

Hans

