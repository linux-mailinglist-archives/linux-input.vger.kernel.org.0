Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53E90818DF
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:08:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727259AbfHEMIy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:08:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:55124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727357AbfHEMIy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:08:54 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAA142086D;
        Mon,  5 Aug 2019 12:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565006933;
        bh=5z0mvpFC4X7GILulFZ0krJCcaptyE8ZHlAtfsXsvMQw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PrF5qqStaY5Dr12xFHRaTKrc8k6yUYRdnHijU2Q8D2PvAQUy2vl5yxIQcReL05RlC
         AyblmEZIwV5pQxi6l0Xhdk1jOH8soYHoZtVW2PclzWrb/Dk4ci3cLHkRtYXvuT3Ju+
         WHLi7o4BD2Ro+VgJ4OHU35VUZ8+7csZEktC0HANA=
Date:   Mon, 5 Aug 2019 14:08:49 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Fabian Henneke <fabian.henneke@gmail.com>
cc:     linux-input@vger.kernel.org, benjamin.tissoires@redhat.com
Subject: Re: [PATCH] hidraw: Return EPOLLOUT from hidraw_poll
In-Reply-To: <3141770d-bb58-e0e9-35ac-84cc23719892@gmail.com>
Message-ID: <nycvar.YFH.7.76.1908051408370.5899@cbobk.fhfr.pm>
References: <3141770d-bb58-e0e9-35ac-84cc23719892@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 9 Jul 2019, Fabian Henneke wrote:

> Always return EPOLLOUT from hidraw_poll when a device is connected.
> This is safe since writes are always possible (but will always block).
> 
> hidraw does not support non-blocking writes and instead always calls
> blocking backend functions on write requests. Hence, so far, a call to
> poll never returned EPOLLOUT, which confuses tools like socat.
> 
> Signed-off-by: Fabian Henneke <fabian.henneke@gmail.com>
> In-reply-to: <CA+hv5qkyis03CgYTWeWX9cr0my-d2Oe+aZo+mjmWRXgjrGqyrw@mail.gmail.com>

Applied (together with the hiddev one) to for-5.4/hidraw-hiddev-epoll 
branch. Thanks,

-- 
Jiri Kosina
SUSE Labs

