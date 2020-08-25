Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EF42517D9
	for <lists+linux-input@lfdr.de>; Tue, 25 Aug 2020 13:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729978AbgHYLja (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Aug 2020 07:39:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725893AbgHYLho (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Aug 2020 07:37:44 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6CA52068E;
        Tue, 25 Aug 2020 11:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598355449;
        bh=yNIMwl6uvri7N2ll7f4m+zITfNm3Kuck7YUP3TIn73o=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=tL1qdHEZIxJolhzMSGSsEaDgqvM3wzHaXqPcaNzv1p0P47UZuecgWvzw1ugvapXh+
         dqqLpMvN6M2q27R6Bhnef10RW3Kc3cEX99wJmrBo8L0PMpH78GMMMC9/ehUgPT/ejx
         OwP+/H/dy+M2wEHBZ/XzkPkS2qgkf+3TgaIJ6+Oo=
Date:   Tue, 25 Aug 2020 13:37:26 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-2022-JP?Q?=1B$BWE9=40=1B=28J?= <penghao@uniontech.com>
cc:     Greg KH <gregkh@linuxfoundation.org>,
        "benjamin.tissoires " <benjamin.tissoires@redhat.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re:Re: [PATCH] USB HID: Add disabled wakeup from s3 by touchpad on
 bydzhaoxin notebook
In-Reply-To: <285385314.979590.1597840631436.JavaMail.xmail@bj-wm-cp-2>
Message-ID: <nycvar.YFH.7.76.2008251334460.27422@cbobk.fhfr.pm>
References: <20200819115101.22532-1-penghao@uniontech.com>, <20200819120856.GA931936@kroah.com> <285385314.979590.1597840631436.JavaMail.xmail@bj-wm-cp-2>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 Aug 2020, 彭浩 wrote:

> Thank you for your guidance, can you tell me how to improve ?

Please take a look at drivers/hid/hid-quirks.c, that's where all the 
device-specific quirks are initialized (in the hid_quirks[] array) and 
then handled where needed according to the quirk flag in ->driver_data.

Thanks,

-- 
Jiri Kosina
SUSE Labs

