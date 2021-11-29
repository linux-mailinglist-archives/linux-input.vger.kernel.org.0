Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6314610BD
	for <lists+linux-input@lfdr.de>; Mon, 29 Nov 2021 10:02:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242790AbhK2JFQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 29 Nov 2021 04:05:16 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:38658 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236863AbhK2JDF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 29 Nov 2021 04:03:05 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A219DB80E2E
        for <linux-input@vger.kernel.org>; Mon, 29 Nov 2021 08:59:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D7EC004E1;
        Mon, 29 Nov 2021 08:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638176386;
        bh=sa1NGSQZm7wOs73FrCXf8XOl3FgZmbi5Oqp1+IX5jeA=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=OS2Nc7b44DOwtQeUPtoNWhEosfvWyvWh25HDQJGbPKd3Z2gGknSz3xpL6Vd48n3+A
         Y+3RjcONN3/fpmYuFke448+XXvYKt43lgA5j4HflEQr7Whu2j2k5sN8yvSE8dnyzvv
         z0xytkyHHuPFhzXCRj6fIETxBaWyu9gISNPDbFV22YMnZ8Zw3NxZUPHGTGoFozTsJn
         DW40zEwwGN44mZ3MeLSgNddc78wr+/bzF/kZpqN0Qn4e62gTN29pRsV6PEWoPeRJ1K
         guADGcIorbhGBPvBSrL4c2rOycRFsG7OzC8pF5FqAyxffOjjj82+/lciz7W/WnZXvk
         9KXMGgY8YKTuA==
Date:   Mon, 29 Nov 2021 09:59:42 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: quirks: Add quirk for the Microsoft Surface 3
 type-cover
In-Reply-To: <20211128210748.460254-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2111290959350.16505@cbobk.fhfr.pm>
References: <20211128210748.460254-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 28 Nov 2021, Hans de Goede wrote:

> Add a HID_QUIRK_NO_INIT_REPORTS quirk for the
> Microsoft Surface 3 (non pro) type-cover.
> 
> Trying to init the reports seems to confuse the type-cover and
> causes 2 issues:
> 
> 1. Despite hid-multitouch sending the command to switch the
> touchpad to multitouch mode, it keeps sending events on the
> mouse emulation interface.
> 
> 2. The touchpad completely stops sending events after a reboot.
> 
> Adding the HID_QUIRK_NO_INIT_REPORTS quirk fixes both issues.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied, thanks Hans.

-- 
Jiri Kosina
SUSE Labs

