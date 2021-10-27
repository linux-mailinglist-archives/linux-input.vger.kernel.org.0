Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C183A43C4DE
	for <lists+linux-input@lfdr.de>; Wed, 27 Oct 2021 10:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231738AbhJ0IRc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 27 Oct 2021 04:17:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231715AbhJ0IRb (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 27 Oct 2021 04:17:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72CC260C40;
        Wed, 27 Oct 2021 08:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635322506;
        bh=X4JuOwCZnQSrdHtwxGd5ZSp8ZTiooFZT+7jB1hU+VQo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=EN7jmDW0tomOx7Xog/AHcXkUIZ726ZD5ezc0KfilMWo4ZgwwDoIHgHzZ2PnZNlh7w
         01wZlWOBlJ5afZxigypsRCKOXPf9UcKglDRDJlU00IV2nnqnRH9s6m7G8cX+r7o1Uy
         qvz4vKSd2hAvc3c/JY9had1gUE70tNFwLdMJ2mzR1sCtJLd8DGm/pJYFOQJJAS+SaK
         mlwHoyRryUv6lvTroTIwR9k1RL/+v3QTd5kSE2zqcSYeK0U+rIyYuMQRV63qN34fEw
         KY4/otaDgdtgabgsBzkiZKLSdGrC9lhUyn4ofimub1m7g9OQrIXYR7kkwxD0oaBYQk
         3kZl9RuSoV1ew==
Date:   Wed, 27 Oct 2021 10:15:02 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Jason Gerecke <killertofu@gmail.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Linux Input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Aaron Skomra <skomra@gmail.com>,
        "Dickens, Joshua" <joshua.dickens@wacom.com>,
        Cai Huoqing <caihuoqing@baidu.com>
Subject: Re: [PATCH] HID: wacom: Make use of the helper function
 devm_add_action_or_reset()
In-Reply-To: <CANRwn3TGkin=4aEKibUicmH-UtRz_SFz7+S6dAsTwXVxRzzi9g@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2110271014090.12554@cbobk.fhfr.pm>
References: <20210922125939.427-1-caihuoqing@baidu.com> <nycvar.YFH.7.76.2110071338010.29107@cbobk.fhfr.pm> <CANRwn3SZagP7uCSHVDGMPMqQiKyUQJSjq143_DA1y0UPvsmkAA@mail.gmail.com> <DB6PR07MB4278FF50AB23B9B69411CA3B9BB19@DB6PR07MB4278.eurprd07.prod.outlook.com>
 <CANRwn3TTgZ9+T7h81tNShvEB8QWkrbKLPrQSnviFKMHa8Zga_Q@mail.gmail.com> <20211015025815.GA3874@LAPTOP-UKSR4ENP.internal.baidu.com> <CAF8JNhLF8_f1x1K52ay_cmkKqpNiY7P4kMwt=ia6ws9Yd9uoNQ@mail.gmail.com> <nycvar.YFH.7.76.2110181725050.12554@cbobk.fhfr.pm>
 <CANRwn3Q_LksYwX5x+dKw9OzPcYBQr_N5=5bLpZgNPtd88Zqpfg@mail.gmail.com> <CANRwn3TGkin=4aEKibUicmH-UtRz_SFz7+S6dAsTwXVxRzzi9g@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 26 Oct 2021, Jason Gerecke wrote:

> Following up on this. I took a second look at the shared struct, and 
> believe that things should work fine during initialization and 
> steady-state. There are, however, opportunities for e.g. one 
> device/thread to be removed and set e.g. `shared->touch = NULL` while a 
> second device/thread is attempting to send an event out of that device. 
> This is going to be very rare and only on disconnect, which is probably 
> why we've never received reports of real-world issues.
> 
> This shared issue is present with or without the changes by Cai and
> myself. I would ask that these two patches be merged 

Now applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

