Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38051382715
	for <lists+linux-input@lfdr.de>; Mon, 17 May 2021 10:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbhEQIdE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 May 2021 04:33:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:47642 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235406AbhEQIdE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 May 2021 04:33:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1621240307; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jVWP7XCc0EaYfhyWip05y4QeemLSDB9bfRWIpmDYeCI=;
        b=EEMd/Eh3zs7HxqhXewUtQMWYG0tLqDvgMtoH/hWSfFRL3GEIYOz6IhEYFbCydesZ39T6b1
        gFldNMJ/q2aCM0GCuseqCx/lRoW9L4g2RccvZLwt8ToJzrsnX1mDDdujFqZJo0R/wKrkZP
        c2jNJH0xvP2NIYdJ95hlCC+fGq3eUhs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1DE55AF0E;
        Mon, 17 May 2021 08:31:47 +0000 (UTC)
Message-ID: <1327a9251c74587670970baa0f662cd61006f576.camel@suse.com>
Subject: Re: [PATCH] HID: usbhid: enable remote wakeup for mouse
From:   Oliver Neukum <oneukum@suse.com>
To:     Qiang Ma <maqianga@uniontech.com>, jikos@kernel.org,
        benjamin.tissoires@redhat.com, linux-usb@vger.kernel.org
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Mon, 17 May 2021 10:31:45 +0200
In-Reply-To: <20210517060145.32359-1-maqianga@uniontech.com>
References: <20210517060145.32359-1-maqianga@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Am Montag, den 17.05.2021, 14:01 +0800 schrieb Qiang Ma:
> This patch enables remote wakeup by default for USB mouse
> devices.  Mouse in general are supposed to be wakeup devices, but
> the correct place to enable it depends on the device's bus; no single
> approach will work for all mouse devices.  In particular, this
> covers only USB mouse (and then only those supporting the boot
> protocol).
> 

Hi,

have you tested this? In my experience the issue with mice
is that they wake up only when you press a mouse button, not when you
move the mouse. Do we make a promise we cannot keep here?

	Regards
		Oliver


