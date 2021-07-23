Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E05D3D4248
	for <lists+linux-input@lfdr.de>; Fri, 23 Jul 2021 23:39:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231724AbhGWU7V convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 23 Jul 2021 16:59:21 -0400
Received: from h4.fbrelay.privateemail.com ([131.153.2.45]:56656 "EHLO
        h4.fbrelay.privateemail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231350AbhGWU7V (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Jul 2021 16:59:21 -0400
Received: from MTA-12-3.privateemail.com (mta-12-1.privateemail.com [198.54.122.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 27CD9803AA;
        Fri, 23 Jul 2021 17:39:53 -0400 (EDT)
Received: from mta-12.privateemail.com (localhost [127.0.0.1])
        by mta-12.privateemail.com (Postfix) with ESMTP id CF17A18000BC;
        Fri, 23 Jul 2021 17:39:51 -0400 (EDT)
Received: from [192.168.0.46] (unknown [10.20.151.247])
        by mta-12.privateemail.com (Postfix) with ESMTPA id 9C46818000B2;
        Fri, 23 Jul 2021 17:39:50 -0400 (EDT)
Date:   Fri, 23 Jul 2021 17:39:44 -0400
From:   Hamza Mahfooz <someguy@effective-light.com>
Subject: Re: [PATCH v3] HID: logitech-hidpp: battery: provide CAPACITY
 property for newer devices
To:     Filipe =?iso-8859-1?b?TGHtbnM=?= <lains@riseup.net>
Cc:     linux-kernel@vger.kernel.org, Bastien Nocera <hadess@hadess.net>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Message-Id: <86WPWQ.ODI6WUKUKD0N3@effective-light.com>
In-Reply-To: <e3bdfa16584d7ec832414dcb854ee4d2582543b3.camel@riseup.net>
References: <20210723185720.29314-1-someguy@effective-light.com>
        <e3bdfa16584d7ec832414dcb854ee4d2582543b3.camel@riseup.net>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Fri, Jul 23 2021 at 08:42:32 PM +0100, Filipe Laíns 
<lains@riseup.net> wrote:
> That said, I think we should definitely have a comment here nothing 
> that, and
> possible have some bounds checks for the reported voltage value 
> hinting that
> there may be bug.

Hey Filipe,

Do you have any thoughts on what the bounds ought to be?
3500 mV seems like a rather safe lower bound, however the upper bound
seems much more fuzzy.


