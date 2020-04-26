Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954EA1B9216
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 19:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgDZR37 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 13:29:59 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:44143 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725976AbgDZR37 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 13:29:59 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 499FKH6VGkzDY;
        Sun, 26 Apr 2020 19:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587922197; bh=VPkMbWlP/qIhkgThtdNrl172mDp6KFzQO6+Nt4E1ZKc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dgRGP6dm1WxB/ewGd/mZ7Jzxh5tjn2b7JfNrvbbBItnxgJdPsOiFWv/lIFQr1X3DE
         sLBMX73cmK6MPi5mCRAUqKuQTyx6jmbvYywGQ3JxbiM0q0TV7cpC3YDQKYLcbB+6l2
         YX5xB3t/BrmHH5zJTX5l2oClyWpjPhk4xP/wRuuhbPkAAKhZGyUyZcTBuYjWYrlLOp
         JZhMqwEwYv6oBct6KImH0v18HDJF8GZP0PCb0lUTn/BvCzZ7C0vEpJayqO57UDbUGR
         NX1arHlruR64WhzS987mX/wgy9JGLGdFN04poFXfpOrztEzrTpPeIo3h69mUXMDzf5
         zfqF96se59c+g==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 19:29:54 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 03/10] input: elants: remove unused axes
Message-ID: <20200426172954.GA15436@qmqm.qmqm.pl>
References: <cover.1587916846.git.mirq-linux@rere.qmqm.pl>
 <b6cb0f810eec2d5c6245d6128502eebd342ca02a.1587916846.git.mirq-linux@rere.qmqm.pl>
 <0f66e93c-9c71-73d0-90b8-15e0802a79c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f66e93c-9c71-73d0-90b8-15e0802a79c5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 26, 2020 at 07:35:47PM +0300, Dmitry Osipenko wrote:
> 26.04.2020 19:11, Michał Mirosław пишет:
> > Driver only ever reports MT events and input_mt_init_slots() sets up
> > emulated axes already.  Clear the capabilities not generated directly
> > and move MT axes setup, so they are visible by input_mt_init_slots().
> > 
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
> > Tested-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> > v4: reword commitmsg; reorder axis setup
> > ---
> 
> Legacy pointer emulation doesn't work using v4. I think it will be
> better to drop this patch for now and add this hunk to the patch #4:

Have you tried it together with the next patch? It adds
touchscreen_parse_properties() to initialize axes also from DT, and
should be equivalent to the hunk you proposed.

[...]
> Maybe input_mt_init_slots() could be changed to set up all the
> properties that are needed for the legacy pointer, but I'm not 100% sure
> because not very familiar with that code. Perhaps Dmitry Torokhov could
> clarify?

The code of input_mt_init_slots() looks like it does initialize the
properties needed. What does evtest return with and without the patches?

Best Regards
Michał Mirosław
