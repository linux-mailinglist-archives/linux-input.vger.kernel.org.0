Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5BC390A8D
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 22:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbhEYUfw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 May 2021 16:35:52 -0400
Received: from mx.ungleich.ch ([185.203.112.16]:46704 "EHLO smtp.ungleich.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230157AbhEYUfv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 May 2021 16:35:51 -0400
X-Greylist: delayed 118601 seconds by postgrey-1.27 at vger.kernel.org; Tue, 25 May 2021 16:35:51 EDT
Received: from nb3.localdomain (localhost [IPv6:::1])
        by smtp.ungleich.ch (Postfix) with ESMTP id CB5631FE6A;
        Tue, 25 May 2021 22:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
        t=1621974860; bh=ggcjsTVoD0KfbxnC/Nu/OynQfTHjUSOKqKT4Fr2Vflg=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=T138zGJ4LBh8VlYiERFKjjXGjqu0LDxnQxkXTIwtN+bdv2JqvG1AqdnSH8HUfTCnr
         F2wE8eP3mY7aOrvn15LcZOVcy6O59XOl9bruXg+3iV/RaOLbACAuqYpjirIGCMRjv1
         VNS0qRFb/Gr0Uc6aRnDHOBYDbyrPvdUSGNtgRSVx9z3vlOB0Vfle2q+jK7tUsc0WBb
         d3fqZ3a/ndGZ6bbJKYik4isccu6twma7I/xIDf5hjOnOX1ffxJa9yErk+UXW20P99F
         G0euUAw8kG7X8Tp+dWYnEkPbABPjK2UC6DZf+ew9S+KgAXvv2WyBaMFA1a5Ueq+uuC
         KwVg/jQy3EDJQ==
Received: by nb3.localdomain (Postfix, from userid 1000)
        id 8821C14C01DB; Tue, 25 May 2021 22:34:48 +0200 (CEST)
References: <87eedw5ptw.fsf@ungleich.ch> <YKva+4+hIcrvMj17@google.com>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Nico Schottelius <nico.schottelius@ungleich.ch>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nico Schottelius <nico.schottelius@ungleich.ch>,
        linux-input@vger.kernel.org
Subject: Re: Regression in Elan Touchpad driver / Linux 5.12
In-reply-to: <YKva+4+hIcrvMj17@google.com>
Date:   Tue, 25 May 2021 22:34:48 +0200
Message-ID: <87fsyar1qv.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Dmitry Torokhov <dmitry.torokhov@gmail.com> writes:
>> If there is anything I can do to debug this, any pointer would be
>> appreciated.
>
> Do you have i2c-hid-acpi module enabled?

I just rebuild 5.12.6 with i2c-hid-acpi and it works again. Thanks a lot
for the pointer. I also notified the Alpine Linux team to include in
kernels >= 5.12.

Thanks again and have a good evening!

Nico

--
Sustainable and modern Infrastructures by ungleich.ch
