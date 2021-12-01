Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C44EB4652EC
	for <lists+linux-input@lfdr.de>; Wed,  1 Dec 2021 17:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243506AbhLAQmT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Dec 2021 11:42:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27538 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351457AbhLAQmS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 1 Dec 2021 11:42:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638376737;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T8Q/qCp/PM97iebrAFIR6/YJXZtc7uWg0VSrtEgCY6M=;
        b=XaglttHbXWU59XoYltdtt2qddJervB94Jsm5+nbGs/CJJu7rPxbwHAnxxjAOpcY8fhofhd
        4nGsEVAV0dv7uONjzOxz0VCnyGlvZhlkv/1BRaSGjFSVJrvpRo1BINmdv0G34P/WXiqPib
        uQst3B6fFxWo1zLIxy4xjU2rZbUamfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-pAN2snxlMY6G3v4gB8MgSQ-1; Wed, 01 Dec 2021 11:38:53 -0500
X-MC-Unique: pAN2snxlMY6G3v4gB8MgSQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CB0B1932480;
        Wed,  1 Dec 2021 16:38:52 +0000 (UTC)
Received: from [10.39.192.102] (unknown [10.39.192.102])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DF16D60C05;
        Wed,  1 Dec 2021 16:38:50 +0000 (UTC)
Message-ID: <4c57c020-a708-aa61-8d68-23f691dffa4c@redhat.com>
Date:   Wed, 1 Dec 2021 17:38:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH 2/2] HID: check for valid USB device for many HID drivers
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Stefan Achatz <erazor_de@users.sourceforge.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20211201141513.2107815-1-gregkh@linuxfoundation.org>
 <20211201141513.2107815-2-gregkh@linuxfoundation.org>
 <CAO-hwJJHrpUkbqCr2psqF62v0rR6E6zSUryee=S6SSwGfHCNhQ@mail.gmail.com>
 <YaeKH4E/cPfDkerc@kroah.com>
 <CAO-hwJ+HQxdVWA_Q3O+i7-Ur3RfeZ6VDZPJepb2Bx87Yhj1Ymw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAO-hwJ+HQxdVWA_Q3O+i7-Ur3RfeZ6VDZPJepb2Bx87Yhj1Ymw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Wed, Dec 1, 2021 at 4:05 PM Benjamin Tissoires <benjamin.tissoires@redhat.com> wrote:
> > > FWIW, I am also working on a test that generates all registered USB
> > > vid/pids from the currently running kernel and will try to inject them
> > > in the testsuite. This should validate this patch and prevent future
> > > mishaps.
> >
> > That would be great to see.  Let me know if you want these broken up
> > smaller, and I will go fix the above issues.
>
> https://gitlab.freedesktop.org/bentiss/hid-tools/-/commit/2b04c6cf46c7405c8a916f324988660cb54dadea
>
> This seems sufficient to make an unpatched kernel scream :)

I have now opened https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/122
with a quicker solution.

This leads apparently to 2 extra crashes:
- one in hid-holtek-kbd -> hid_is_usb() is called *after* hid_parse(), so
   report_fixup is actually called for uhid devices.
- another in bigbenff which is fixed by the following patch:

---
diff --git a/drivers/hid/hid-bigbenff.c b/drivers/hid/hid-bigbenff.c
index db6da21ade06..74ad8bf98bfd 100644
--- a/drivers/hid/hid-bigbenff.c
+++ b/drivers/hid/hid-bigbenff.c
@@ -191,7 +191,7 @@ static void bigben_worker(struct work_struct *work)
  		struct bigben_device, worker);
  	struct hid_field *report_field = bigben->report->field[0];
  
-	if (bigben->removed)
+	if (bigben->removed || !report_field)
  		return;
  
  	if (bigben->work_led) {
---

Cheers,
Benjamin

