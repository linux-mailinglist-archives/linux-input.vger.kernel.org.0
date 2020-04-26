Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35E21B8F67
	for <lists+linux-input@lfdr.de>; Sun, 26 Apr 2020 13:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726131AbgDZLVz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 26 Apr 2020 07:21:55 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:16137 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726122AbgDZLVz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 26 Apr 2020 07:21:55 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 49958c0Vx8z2F;
        Sun, 26 Apr 2020 13:21:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1587900114; bh=rHc+7GEhCh5Gaeh58d+UY8RHi5ge0/5hEbRQ7cgAMvs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CeHRTrxnxUMAx4Ee8DWFLMB9rD5U4mhjHqhYBO5tlj9p5636GJ6a7meNDU9X/5y7V
         lTAs7Fs7BYhlp+HIid/d1+f/C7s2DsNy02WfUEY7qgMLksfQ7KRYAmUNmxs7JRcZrp
         g9+EOYPuV0Q46fy7EIvfYXO6lQXkZ/2U/WipR/eCEXnmF380jyn4SLToiyQgSpITq9
         +VXgxRRPnDVbTc/82RMPACy/jSZy8ySFouV9ldsh3zYHwrIw+fqIXIfuSHZb/N54KH
         taFE7n88aQ/kk40wtgxqiXevDO+JtP3TjTWGgzjmHRaite4QeOq0C+rUk9WkgAJfHi
         o0bg0wiDx/Chg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Sun, 26 Apr 2020 13:21:50 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Rob Herring <robh+dt@kernel.org>,
        Scott Liu <scott.liu@emc.com.tw>,
        David Heidelberg <david@ixit.cz>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/9] input: elants: remove unused axes
Message-ID: <20200426112150.GA16230@qmqm.qmqm.pl>
References: <cover.1586784389.git.mirq-linux@rere.qmqm.pl>
 <62e897b0d6f6054dae26c853a9a1f1fb6d3c420b.1586784389.git.mirq-linux@rere.qmqm.pl>
 <20200426045200.GN125362@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200426045200.GN125362@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 25, 2020 at 09:52:00PM -0700, Dmitry Torokhov wrote:
> On Mon, Apr 13, 2020 at 03:32:23PM +0200, Micha³ Miros³aw wrote:
> > Driver only ever reports MT events. Clear capabilities of all others.
> This is not true. input_mt_sync_frame() calls
> input_mt_report_pointer_emulation() which does emut single-touch events
> for the benefit of older userspace (or userspace that is not interested
> in multitouch).

Oh, I didn't notice that. Looking at the code, I see that
input_mt_init_slots() sets up the emulated axes in this case.

Do you need me to update the commitmsg?

Best Regards,
Micha³ Miros³aw
